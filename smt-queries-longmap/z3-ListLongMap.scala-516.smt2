; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12954 () Bool)

(assert start!12954)

(declare-fun b!112672 () Bool)

(declare-fun b_free!2581 () Bool)

(declare-fun b_next!2581 () Bool)

(assert (=> b!112672 (= b_free!2581 (not b_next!2581))))

(declare-fun tp!10097 () Bool)

(declare-fun b_and!6917 () Bool)

(assert (=> b!112672 (= tp!10097 b_and!6917)))

(declare-fun b!112659 () Bool)

(declare-fun b_free!2583 () Bool)

(declare-fun b_next!2583 () Bool)

(assert (=> b!112659 (= b_free!2583 (not b_next!2583))))

(declare-fun tp!10098 () Bool)

(declare-fun b_and!6919 () Bool)

(assert (=> b!112659 (= tp!10098 b_and!6919)))

(declare-fun mapNonEmpty!4043 () Bool)

(declare-fun mapRes!4043 () Bool)

(declare-fun tp!10095 () Bool)

(declare-fun e!73224 () Bool)

(assert (=> mapNonEmpty!4043 (= mapRes!4043 (and tp!10095 e!73224))))

(declare-datatypes ((V!3257 0))(
  ( (V!3258 (val!1398 Int)) )
))
(declare-datatypes ((array!4399 0))(
  ( (array!4400 (arr!2084 (Array (_ BitVec 32) (_ BitVec 64))) (size!2343 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1010 0))(
  ( (ValueCellFull!1010 (v!2958 V!3257)) (EmptyCell!1010) )
))
(declare-datatypes ((array!4401 0))(
  ( (array!4402 (arr!2085 (Array (_ BitVec 32) ValueCell!1010)) (size!2344 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!928 0))(
  ( (LongMapFixedSize!929 (defaultEntry!2660 Int) (mask!6844 (_ BitVec 32)) (extraKeys!2451 (_ BitVec 32)) (zeroValue!2528 V!3257) (minValue!2528 V!3257) (_size!513 (_ BitVec 32)) (_keys!4380 array!4399) (_values!2643 array!4401) (_vacant!513 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!928)

(declare-fun mapKey!4043 () (_ BitVec 32))

(declare-fun mapValue!4044 () ValueCell!1010)

(declare-fun mapRest!4044 () (Array (_ BitVec 32) ValueCell!1010))

(assert (=> mapNonEmpty!4043 (= (arr!2085 (_values!2643 newMap!16)) (store mapRest!4044 mapKey!4043 mapValue!4044))))

(declare-fun b!112657 () Bool)

(declare-datatypes ((Unit!3498 0))(
  ( (Unit!3499) )
))
(declare-fun e!73222 () Unit!3498)

(declare-fun Unit!3500 () Unit!3498)

(assert (=> b!112657 (= e!73222 Unit!3500)))

(declare-fun mapNonEmpty!4044 () Bool)

(declare-fun mapRes!4044 () Bool)

(declare-fun tp!10096 () Bool)

(declare-fun e!73234 () Bool)

(assert (=> mapNonEmpty!4044 (= mapRes!4044 (and tp!10096 e!73234))))

(declare-datatypes ((Cell!730 0))(
  ( (Cell!731 (v!2959 LongMapFixedSize!928)) )
))
(declare-datatypes ((LongMap!730 0))(
  ( (LongMap!731 (underlying!376 Cell!730)) )
))
(declare-fun thiss!992 () LongMap!730)

(declare-fun mapValue!4043 () ValueCell!1010)

(declare-fun mapRest!4043 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapKey!4044 () (_ BitVec 32))

(assert (=> mapNonEmpty!4044 (= (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (store mapRest!4043 mapKey!4044 mapValue!4043))))

(declare-fun b!112658 () Bool)

(declare-fun tp_is_empty!2707 () Bool)

(assert (=> b!112658 (= e!73224 tp_is_empty!2707)))

(declare-fun res!55568 () Bool)

(declare-fun e!73223 () Bool)

(assert (=> start!12954 (=> (not res!55568) (not e!73223))))

(declare-fun valid!441 (LongMap!730) Bool)

(assert (=> start!12954 (= res!55568 (valid!441 thiss!992))))

(assert (=> start!12954 e!73223))

(declare-fun e!73226 () Bool)

(assert (=> start!12954 e!73226))

(assert (=> start!12954 true))

(declare-fun e!73228 () Bool)

(assert (=> start!12954 e!73228))

(declare-fun e!73231 () Bool)

(declare-fun array_inv!1293 (array!4399) Bool)

(declare-fun array_inv!1294 (array!4401) Bool)

(assert (=> b!112659 (= e!73228 (and tp!10098 tp_is_empty!2707 (array_inv!1293 (_keys!4380 newMap!16)) (array_inv!1294 (_values!2643 newMap!16)) e!73231))))

(declare-fun b!112660 () Bool)

(declare-fun e!73236 () Bool)

(assert (=> b!112660 (= e!73226 e!73236)))

(declare-fun b!112661 () Bool)

(declare-fun Unit!3501 () Unit!3498)

(assert (=> b!112661 (= e!73222 Unit!3501)))

(declare-fun lt!58332 () Unit!3498)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!109 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3498)

(assert (=> b!112661 (= lt!58332 (lemmaListMapContainsThenArrayContainsFrom!109 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!112661 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!58331 () Unit!3498)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4399 (_ BitVec 32) (_ BitVec 32)) Unit!3498)

(assert (=> b!112661 (= lt!58331 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1619 0))(
  ( (Nil!1616) (Cons!1615 (h!2215 (_ BitVec 64)) (t!5785 List!1619)) )
))
(declare-fun arrayNoDuplicates!0 (array!4399 (_ BitVec 32) List!1619) Bool)

(assert (=> b!112661 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1616)))

(declare-fun lt!58333 () Unit!3498)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4399 (_ BitVec 32) (_ BitVec 64) List!1619) Unit!3498)

(assert (=> b!112661 (= lt!58333 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616)))))

(assert (=> b!112661 false))

(declare-fun b!112662 () Bool)

(declare-fun e!73230 () Bool)

(declare-fun e!73227 () Bool)

(assert (=> b!112662 (= e!73230 (not e!73227))))

(declare-fun res!55571 () Bool)

(assert (=> b!112662 (=> res!55571 e!73227)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!112662 (= res!55571 (not (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))))

(declare-datatypes ((tuple2!2410 0))(
  ( (tuple2!2411 (_1!1216 (_ BitVec 64)) (_2!1216 V!3257)) )
))
(declare-datatypes ((List!1620 0))(
  ( (Nil!1617) (Cons!1616 (h!2216 tuple2!2410) (t!5786 List!1620)) )
))
(declare-datatypes ((ListLongMap!1559 0))(
  ( (ListLongMap!1560 (toList!795 List!1620)) )
))
(declare-fun lt!58328 () ListLongMap!1559)

(declare-fun lt!58336 () tuple2!2410)

(declare-fun lt!58330 () tuple2!2410)

(declare-fun +!150 (ListLongMap!1559 tuple2!2410) ListLongMap!1559)

(assert (=> b!112662 (= (+!150 (+!150 lt!58328 lt!58336) lt!58330) (+!150 (+!150 lt!58328 lt!58330) lt!58336))))

(assert (=> b!112662 (= lt!58330 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58327 () V!3257)

(assert (=> b!112662 (= lt!58336 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))

(declare-fun lt!58326 () Unit!3498)

(declare-fun addCommutativeForDiffKeys!63 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64) V!3257) Unit!3498)

(assert (=> b!112662 (= lt!58326 (addCommutativeForDiffKeys!63 lt!58328 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!117 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) ListLongMap!1559)

(assert (=> b!112662 (= lt!58328 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112663 () Bool)

(declare-fun e!73232 () Bool)

(declare-fun e!73225 () Bool)

(assert (=> b!112663 (= e!73232 (and e!73225 mapRes!4044))))

(declare-fun condMapEmpty!4043 () Bool)

(declare-fun mapDefault!4043 () ValueCell!1010)

(assert (=> b!112663 (= condMapEmpty!4043 (= (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4043)))))

(declare-fun b!112664 () Bool)

(declare-fun res!55566 () Bool)

(assert (=> b!112664 (=> res!55566 e!73227)))

(assert (=> b!112664 (= res!55566 (or (not (= (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6844 (v!2959 (underlying!376 thiss!992)))))) (not (= (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992)))))) (bvslt (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!112665 () Bool)

(declare-fun e!73221 () Bool)

(assert (=> b!112665 (= e!73236 e!73221)))

(declare-fun b!112666 () Bool)

(declare-fun e!73229 () Bool)

(assert (=> b!112666 (= e!73223 e!73229)))

(declare-fun res!55565 () Bool)

(assert (=> b!112666 (=> (not res!55565) (not e!73229))))

(declare-fun lt!58334 () ListLongMap!1559)

(declare-fun lt!58337 () ListLongMap!1559)

(assert (=> b!112666 (= res!55565 (= lt!58334 lt!58337))))

(declare-fun map!1303 (LongMapFixedSize!928) ListLongMap!1559)

(assert (=> b!112666 (= lt!58337 (map!1303 newMap!16))))

(declare-fun getCurrentListMap!479 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) ListLongMap!1559)

(assert (=> b!112666 (= lt!58334 (getCurrentListMap!479 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112667 () Bool)

(declare-fun e!73220 () Bool)

(assert (=> b!112667 (= e!73220 e!73230)))

(declare-fun res!55564 () Bool)

(assert (=> b!112667 (=> (not res!55564) (not e!73230))))

(declare-datatypes ((tuple2!2412 0))(
  ( (tuple2!2413 (_1!1217 Bool) (_2!1217 LongMapFixedSize!928)) )
))
(declare-fun lt!58335 () tuple2!2412)

(assert (=> b!112667 (= res!55564 (and (_1!1217 lt!58335) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!58329 () Unit!3498)

(assert (=> b!112667 (= lt!58329 e!73222)))

(declare-fun c!20148 () Bool)

(declare-fun contains!834 (ListLongMap!1559 (_ BitVec 64)) Bool)

(assert (=> b!112667 (= c!20148 (contains!834 lt!58337 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun update!171 (LongMapFixedSize!928 (_ BitVec 64) V!3257) tuple2!2412)

(assert (=> b!112667 (= lt!58335 (update!171 newMap!16 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))

(declare-fun b!112668 () Bool)

(assert (=> b!112668 (= e!73229 e!73220)))

(declare-fun res!55570 () Bool)

(assert (=> b!112668 (=> (not res!55570) (not e!73220))))

(assert (=> b!112668 (= res!55570 (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1367 (ValueCell!1010 V!3257) V!3257)

(declare-fun dynLambda!394 (Int (_ BitVec 64)) V!3257)

(assert (=> b!112668 (= lt!58327 (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!4043 () Bool)

(assert (=> mapIsEmpty!4043 mapRes!4044))

(declare-fun b!112669 () Bool)

(declare-fun res!55573 () Bool)

(assert (=> b!112669 (=> (not res!55573) (not e!73223))))

(declare-fun valid!442 (LongMapFixedSize!928) Bool)

(assert (=> b!112669 (= res!55573 (valid!442 newMap!16))))

(declare-fun b!112670 () Bool)

(declare-fun res!55567 () Bool)

(assert (=> b!112670 (=> res!55567 e!73227)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4399 (_ BitVec 32)) Bool)

(assert (=> b!112670 (= res!55567 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112671 () Bool)

(declare-fun e!73233 () Bool)

(assert (=> b!112671 (= e!73233 tp_is_empty!2707)))

(assert (=> b!112672 (= e!73221 (and tp!10097 tp_is_empty!2707 (array_inv!1293 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (array_inv!1294 (_values!2643 (v!2959 (underlying!376 thiss!992)))) e!73232))))

(declare-fun mapIsEmpty!4044 () Bool)

(assert (=> mapIsEmpty!4044 mapRes!4043))

(declare-fun b!112673 () Bool)

(declare-fun res!55572 () Bool)

(assert (=> b!112673 (=> (not res!55572) (not e!73223))))

(assert (=> b!112673 (= res!55572 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6844 newMap!16)) (_size!513 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112674 () Bool)

(assert (=> b!112674 (= e!73227 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1616))))

(declare-fun b!112675 () Bool)

(assert (=> b!112675 (= e!73234 tp_is_empty!2707)))

(declare-fun b!112676 () Bool)

(assert (=> b!112676 (= e!73225 tp_is_empty!2707)))

(declare-fun b!112677 () Bool)

(declare-fun res!55569 () Bool)

(assert (=> b!112677 (=> (not res!55569) (not e!73223))))

(assert (=> b!112677 (= res!55569 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun b!112678 () Bool)

(assert (=> b!112678 (= e!73231 (and e!73233 mapRes!4043))))

(declare-fun condMapEmpty!4044 () Bool)

(declare-fun mapDefault!4044 () ValueCell!1010)

(assert (=> b!112678 (= condMapEmpty!4044 (= (arr!2085 (_values!2643 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4044)))))

(assert (= (and start!12954 res!55568) b!112677))

(assert (= (and b!112677 res!55569) b!112669))

(assert (= (and b!112669 res!55573) b!112673))

(assert (= (and b!112673 res!55572) b!112666))

(assert (= (and b!112666 res!55565) b!112668))

(assert (= (and b!112668 res!55570) b!112667))

(assert (= (and b!112667 c!20148) b!112661))

(assert (= (and b!112667 (not c!20148)) b!112657))

(assert (= (and b!112667 res!55564) b!112662))

(assert (= (and b!112662 (not res!55571)) b!112664))

(assert (= (and b!112664 (not res!55566)) b!112670))

(assert (= (and b!112670 (not res!55567)) b!112674))

(assert (= (and b!112663 condMapEmpty!4043) mapIsEmpty!4043))

(assert (= (and b!112663 (not condMapEmpty!4043)) mapNonEmpty!4044))

(get-info :version)

(assert (= (and mapNonEmpty!4044 ((_ is ValueCellFull!1010) mapValue!4043)) b!112675))

(assert (= (and b!112663 ((_ is ValueCellFull!1010) mapDefault!4043)) b!112676))

(assert (= b!112672 b!112663))

(assert (= b!112665 b!112672))

(assert (= b!112660 b!112665))

(assert (= start!12954 b!112660))

(assert (= (and b!112678 condMapEmpty!4044) mapIsEmpty!4044))

(assert (= (and b!112678 (not condMapEmpty!4044)) mapNonEmpty!4043))

(assert (= (and mapNonEmpty!4043 ((_ is ValueCellFull!1010) mapValue!4044)) b!112658))

(assert (= (and b!112678 ((_ is ValueCellFull!1010) mapDefault!4044)) b!112671))

(assert (= b!112659 b!112678))

(assert (= start!12954 b!112659))

(declare-fun b_lambda!5051 () Bool)

(assert (=> (not b_lambda!5051) (not b!112668)))

(declare-fun t!5782 () Bool)

(declare-fun tb!2129 () Bool)

(assert (=> (and b!112672 (= (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) t!5782) tb!2129))

(declare-fun result!3565 () Bool)

(assert (=> tb!2129 (= result!3565 tp_is_empty!2707)))

(assert (=> b!112668 t!5782))

(declare-fun b_and!6921 () Bool)

(assert (= b_and!6917 (and (=> t!5782 result!3565) b_and!6921)))

(declare-fun tb!2131 () Bool)

(declare-fun t!5784 () Bool)

(assert (=> (and b!112659 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) t!5784) tb!2131))

(declare-fun result!3569 () Bool)

(assert (= result!3569 result!3565))

(assert (=> b!112668 t!5784))

(declare-fun b_and!6923 () Bool)

(assert (= b_and!6919 (and (=> t!5784 result!3569) b_and!6923)))

(declare-fun m!128671 () Bool)

(assert (=> b!112666 m!128671))

(declare-fun m!128673 () Bool)

(assert (=> b!112666 m!128673))

(declare-fun m!128675 () Bool)

(assert (=> b!112668 m!128675))

(declare-fun m!128677 () Bool)

(assert (=> b!112668 m!128677))

(declare-fun m!128679 () Bool)

(assert (=> b!112668 m!128679))

(assert (=> b!112668 m!128677))

(assert (=> b!112668 m!128679))

(declare-fun m!128681 () Bool)

(assert (=> b!112668 m!128681))

(declare-fun m!128683 () Bool)

(assert (=> b!112661 m!128683))

(declare-fun m!128685 () Bool)

(assert (=> b!112661 m!128685))

(assert (=> b!112661 m!128675))

(declare-fun m!128687 () Bool)

(assert (=> b!112661 m!128687))

(assert (=> b!112661 m!128675))

(assert (=> b!112661 m!128675))

(declare-fun m!128689 () Bool)

(assert (=> b!112661 m!128689))

(assert (=> b!112661 m!128675))

(declare-fun m!128691 () Bool)

(assert (=> b!112661 m!128691))

(declare-fun m!128693 () Bool)

(assert (=> start!12954 m!128693))

(declare-fun m!128695 () Bool)

(assert (=> mapNonEmpty!4044 m!128695))

(declare-fun m!128697 () Bool)

(assert (=> b!112669 m!128697))

(declare-fun m!128699 () Bool)

(assert (=> b!112672 m!128699))

(declare-fun m!128701 () Bool)

(assert (=> b!112672 m!128701))

(declare-fun m!128703 () Bool)

(assert (=> b!112662 m!128703))

(declare-fun m!128705 () Bool)

(assert (=> b!112662 m!128705))

(assert (=> b!112662 m!128675))

(declare-fun m!128707 () Bool)

(assert (=> b!112662 m!128707))

(declare-fun m!128709 () Bool)

(assert (=> b!112662 m!128709))

(assert (=> b!112662 m!128703))

(declare-fun m!128711 () Bool)

(assert (=> b!112662 m!128711))

(assert (=> b!112662 m!128705))

(declare-fun m!128713 () Bool)

(assert (=> b!112662 m!128713))

(assert (=> b!112662 m!128675))

(declare-fun m!128715 () Bool)

(assert (=> b!112662 m!128715))

(declare-fun m!128717 () Bool)

(assert (=> b!112670 m!128717))

(declare-fun m!128719 () Bool)

(assert (=> b!112674 m!128719))

(assert (=> b!112667 m!128675))

(assert (=> b!112667 m!128675))

(declare-fun m!128721 () Bool)

(assert (=> b!112667 m!128721))

(assert (=> b!112667 m!128675))

(declare-fun m!128723 () Bool)

(assert (=> b!112667 m!128723))

(declare-fun m!128725 () Bool)

(assert (=> b!112659 m!128725))

(declare-fun m!128727 () Bool)

(assert (=> b!112659 m!128727))

(declare-fun m!128729 () Bool)

(assert (=> mapNonEmpty!4043 m!128729))

(check-sat (not b!112669) b_and!6921 b_and!6923 (not b!112672) (not mapNonEmpty!4043) (not b!112674) (not start!12954) (not b_next!2583) (not b!112661) tp_is_empty!2707 (not b!112670) (not b_lambda!5051) (not b_next!2581) (not b!112667) (not b!112659) (not b!112662) (not b!112668) (not mapNonEmpty!4044) (not b!112666))
(check-sat b_and!6921 b_and!6923 (not b_next!2581) (not b_next!2583))
(get-model)

(declare-fun b_lambda!5057 () Bool)

(assert (= b_lambda!5051 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5057)))

(check-sat (not b!112669) b_and!6921 b_and!6923 (not b!112672) (not mapNonEmpty!4043) (not b!112674) (not b!112670) (not start!12954) (not b_next!2583) (not b!112661) tp_is_empty!2707 (not b_next!2581) (not b!112667) (not b!112659) (not b!112662) (not b!112668) (not b_lambda!5057) (not mapNonEmpty!4044) (not b!112666))
(check-sat b_and!6921 b_and!6923 (not b_next!2581) (not b_next!2583))
(get-model)

(declare-fun d!32089 () Bool)

(assert (=> d!32089 (= (valid!441 thiss!992) (valid!442 (v!2959 (underlying!376 thiss!992))))))

(declare-fun bs!4642 () Bool)

(assert (= bs!4642 d!32089))

(declare-fun m!128851 () Bool)

(assert (=> bs!4642 m!128851))

(assert (=> start!12954 d!32089))

(declare-fun d!32091 () Bool)

(assert (=> d!32091 (= (array_inv!1293 (_keys!4380 newMap!16)) (bvsge (size!2343 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112659 d!32091))

(declare-fun d!32093 () Bool)

(assert (=> d!32093 (= (array_inv!1294 (_values!2643 newMap!16)) (bvsge (size!2344 (_values!2643 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!112659 d!32093))

(declare-fun d!32095 () Bool)

(declare-fun res!55640 () Bool)

(declare-fun e!73348 () Bool)

(assert (=> d!32095 (=> (not res!55640) (not e!73348))))

(declare-fun simpleValid!78 (LongMapFixedSize!928) Bool)

(assert (=> d!32095 (= res!55640 (simpleValid!78 newMap!16))))

(assert (=> d!32095 (= (valid!442 newMap!16) e!73348)))

(declare-fun b!112823 () Bool)

(declare-fun res!55641 () Bool)

(assert (=> b!112823 (=> (not res!55641) (not e!73348))))

(declare-fun arrayCountValidKeys!0 (array!4399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!112823 (= res!55641 (= (arrayCountValidKeys!0 (_keys!4380 newMap!16) #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (_size!513 newMap!16)))))

(declare-fun b!112824 () Bool)

(declare-fun res!55642 () Bool)

(assert (=> b!112824 (=> (not res!55642) (not e!73348))))

(assert (=> b!112824 (= res!55642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun b!112825 () Bool)

(assert (=> b!112825 (= e!73348 (arrayNoDuplicates!0 (_keys!4380 newMap!16) #b00000000000000000000000000000000 Nil!1616))))

(assert (= (and d!32095 res!55640) b!112823))

(assert (= (and b!112823 res!55641) b!112824))

(assert (= (and b!112824 res!55642) b!112825))

(declare-fun m!128853 () Bool)

(assert (=> d!32095 m!128853))

(declare-fun m!128855 () Bool)

(assert (=> b!112823 m!128855))

(declare-fun m!128857 () Bool)

(assert (=> b!112824 m!128857))

(declare-fun m!128859 () Bool)

(assert (=> b!112825 m!128859))

(assert (=> b!112669 d!32095))

(declare-fun b!112836 () Bool)

(declare-fun e!73358 () Bool)

(declare-fun e!73357 () Bool)

(assert (=> b!112836 (= e!73358 e!73357)))

(declare-fun c!20157 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!112836 (= c!20157 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112837 () Bool)

(declare-fun e!73360 () Bool)

(assert (=> b!112837 (= e!73360 e!73358)))

(declare-fun res!55649 () Bool)

(assert (=> b!112837 (=> (not res!55649) (not e!73358))))

(declare-fun e!73359 () Bool)

(assert (=> b!112837 (= res!55649 (not e!73359))))

(declare-fun res!55651 () Bool)

(assert (=> b!112837 (=> (not res!55651) (not e!73359))))

(assert (=> b!112837 (= res!55651 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!12081 () Bool)

(declare-fun call!12084 () Bool)

(assert (=> bm!12081 (= call!12084 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20157 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1616) Nil!1616)))))

(declare-fun b!112838 () Bool)

(assert (=> b!112838 (= e!73357 call!12084)))

(declare-fun b!112839 () Bool)

(assert (=> b!112839 (= e!73357 call!12084)))

(declare-fun b!112840 () Bool)

(declare-fun contains!835 (List!1619 (_ BitVec 64)) Bool)

(assert (=> b!112840 (= e!73359 (contains!835 Nil!1616 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!32097 () Bool)

(declare-fun res!55650 () Bool)

(assert (=> d!32097 (=> res!55650 e!73360)))

(assert (=> d!32097 (= res!55650 (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32097 (= (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1616) e!73360)))

(assert (= (and d!32097 (not res!55650)) b!112837))

(assert (= (and b!112837 res!55651) b!112840))

(assert (= (and b!112837 res!55649) b!112836))

(assert (= (and b!112836 c!20157) b!112839))

(assert (= (and b!112836 (not c!20157)) b!112838))

(assert (= (or b!112839 b!112838) bm!12081))

(declare-fun m!128861 () Bool)

(assert (=> b!112836 m!128861))

(assert (=> b!112836 m!128861))

(declare-fun m!128863 () Bool)

(assert (=> b!112836 m!128863))

(assert (=> b!112837 m!128861))

(assert (=> b!112837 m!128861))

(assert (=> b!112837 m!128863))

(assert (=> bm!12081 m!128861))

(declare-fun m!128865 () Bool)

(assert (=> bm!12081 m!128865))

(assert (=> b!112840 m!128861))

(assert (=> b!112840 m!128861))

(declare-fun m!128867 () Bool)

(assert (=> b!112840 m!128867))

(assert (=> b!112674 d!32097))

(declare-fun b!112849 () Bool)

(declare-fun e!73368 () Bool)

(declare-fun call!12087 () Bool)

(assert (=> b!112849 (= e!73368 call!12087)))

(declare-fun d!32099 () Bool)

(declare-fun res!55657 () Bool)

(declare-fun e!73369 () Bool)

(assert (=> d!32099 (=> res!55657 e!73369)))

(assert (=> d!32099 (= res!55657 (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))) e!73369)))

(declare-fun b!112850 () Bool)

(assert (=> b!112850 (= e!73369 e!73368)))

(declare-fun c!20160 () Bool)

(assert (=> b!112850 (= c!20160 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!112851 () Bool)

(declare-fun e!73367 () Bool)

(assert (=> b!112851 (= e!73367 call!12087)))

(declare-fun b!112852 () Bool)

(assert (=> b!112852 (= e!73368 e!73367)))

(declare-fun lt!58418 () (_ BitVec 64))

(assert (=> b!112852 (= lt!58418 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!58417 () Unit!3498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4399 (_ BitVec 64) (_ BitVec 32)) Unit!3498)

(assert (=> b!112852 (= lt!58417 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000))))

(assert (=> b!112852 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000)))

(declare-fun lt!58416 () Unit!3498)

(assert (=> b!112852 (= lt!58416 lt!58417)))

(declare-fun res!55656 () Bool)

(declare-datatypes ((SeekEntryResult!257 0))(
  ( (MissingZero!257 (index!3180 (_ BitVec 32))) (Found!257 (index!3181 (_ BitVec 32))) (Intermediate!257 (undefined!1069 Bool) (index!3182 (_ BitVec 32)) (x!14178 (_ BitVec 32))) (Undefined!257) (MissingVacant!257 (index!3183 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4399 (_ BitVec 32)) SeekEntryResult!257)

(assert (=> b!112852 (= res!55656 (= (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))) (Found!257 #b00000000000000000000000000000000)))))

(assert (=> b!112852 (=> (not res!55656) (not e!73367))))

(declare-fun bm!12084 () Bool)

(assert (=> bm!12084 (= call!12087 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32099 (not res!55657)) b!112850))

(assert (= (and b!112850 c!20160) b!112852))

(assert (= (and b!112850 (not c!20160)) b!112849))

(assert (= (and b!112852 res!55656) b!112851))

(assert (= (or b!112851 b!112849) bm!12084))

(assert (=> b!112850 m!128861))

(assert (=> b!112850 m!128861))

(assert (=> b!112850 m!128863))

(assert (=> b!112852 m!128861))

(declare-fun m!128869 () Bool)

(assert (=> b!112852 m!128869))

(declare-fun m!128871 () Bool)

(assert (=> b!112852 m!128871))

(assert (=> b!112852 m!128861))

(declare-fun m!128873 () Bool)

(assert (=> b!112852 m!128873))

(declare-fun m!128875 () Bool)

(assert (=> bm!12084 m!128875))

(assert (=> b!112670 d!32099))

(declare-fun d!32101 () Bool)

(assert (=> d!32101 (= (map!1303 newMap!16) (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bs!4643 () Bool)

(assert (= bs!4643 d!32101))

(declare-fun m!128877 () Bool)

(assert (=> bs!4643 m!128877))

(assert (=> b!112666 d!32101))

(declare-fun bm!12099 () Bool)

(declare-fun call!12105 () Bool)

(declare-fun lt!58471 () ListLongMap!1559)

(assert (=> bm!12099 (= call!12105 (contains!834 lt!58471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!112895 () Bool)

(declare-fun e!73398 () Bool)

(assert (=> b!112895 (= e!73398 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun d!32103 () Bool)

(declare-fun e!73401 () Bool)

(assert (=> d!32103 e!73401))

(declare-fun res!55682 () Bool)

(assert (=> d!32103 (=> (not res!55682) (not e!73401))))

(assert (=> d!32103 (= res!55682 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun lt!58479 () ListLongMap!1559)

(assert (=> d!32103 (= lt!58471 lt!58479)))

(declare-fun lt!58470 () Unit!3498)

(declare-fun e!73408 () Unit!3498)

(assert (=> d!32103 (= lt!58470 e!73408)))

(declare-fun c!20174 () Bool)

(declare-fun e!73402 () Bool)

(assert (=> d!32103 (= c!20174 e!73402)))

(declare-fun res!55681 () Bool)

(assert (=> d!32103 (=> (not res!55681) (not e!73402))))

(assert (=> d!32103 (= res!55681 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun e!73403 () ListLongMap!1559)

(assert (=> d!32103 (= lt!58479 e!73403)))

(declare-fun c!20178 () Bool)

(assert (=> d!32103 (= c!20178 (and (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32103 (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32103 (= (getCurrentListMap!479 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) lt!58471)))

(declare-fun b!112896 () Bool)

(declare-fun call!12104 () ListLongMap!1559)

(assert (=> b!112896 (= e!73403 (+!150 call!12104 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112897 () Bool)

(declare-fun e!73396 () ListLongMap!1559)

(declare-fun call!12102 () ListLongMap!1559)

(assert (=> b!112897 (= e!73396 call!12102)))

(declare-fun b!112898 () Bool)

(declare-fun res!55683 () Bool)

(assert (=> b!112898 (=> (not res!55683) (not e!73401))))

(declare-fun e!73400 () Bool)

(assert (=> b!112898 (= res!55683 e!73400)))

(declare-fun c!20176 () Bool)

(assert (=> b!112898 (= c!20176 (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12100 () Bool)

(declare-fun call!12103 () Bool)

(assert (=> bm!12100 (= call!12103 (contains!834 lt!58471 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73404 () Bool)

(declare-fun b!112899 () Bool)

(declare-fun apply!102 (ListLongMap!1559 (_ BitVec 64)) V!3257)

(assert (=> b!112899 (= e!73404 (= (apply!102 lt!58471 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112899 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!112899 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun bm!12101 () Bool)

(declare-fun call!12108 () ListLongMap!1559)

(assert (=> bm!12101 (= call!12102 call!12108)))

(declare-fun b!112900 () Bool)

(declare-fun e!73407 () Bool)

(declare-fun e!73399 () Bool)

(assert (=> b!112900 (= e!73407 e!73399)))

(declare-fun res!55679 () Bool)

(assert (=> b!112900 (= res!55679 call!12103)))

(assert (=> b!112900 (=> (not res!55679) (not e!73399))))

(declare-fun bm!12102 () Bool)

(declare-fun call!12107 () ListLongMap!1559)

(assert (=> bm!12102 (= call!12107 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112901 () Bool)

(declare-fun call!12106 () ListLongMap!1559)

(assert (=> b!112901 (= e!73396 call!12106)))

(declare-fun b!112902 () Bool)

(assert (=> b!112902 (= e!73401 e!73407)))

(declare-fun c!20175 () Bool)

(assert (=> b!112902 (= c!20175 (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112903 () Bool)

(assert (=> b!112903 (= e!73400 (not call!12105))))

(declare-fun bm!12103 () Bool)

(assert (=> bm!12103 (= call!12106 call!12104)))

(declare-fun b!112904 () Bool)

(declare-fun c!20177 () Bool)

(assert (=> b!112904 (= c!20177 (and (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73405 () ListLongMap!1559)

(assert (=> b!112904 (= e!73405 e!73396)))

(declare-fun b!112905 () Bool)

(declare-fun Unit!3507 () Unit!3498)

(assert (=> b!112905 (= e!73408 Unit!3507)))

(declare-fun b!112906 () Bool)

(assert (=> b!112906 (= e!73407 (not call!12103))))

(declare-fun b!112907 () Bool)

(declare-fun res!55678 () Bool)

(assert (=> b!112907 (=> (not res!55678) (not e!73401))))

(declare-fun e!73406 () Bool)

(assert (=> b!112907 (= res!55678 e!73406)))

(declare-fun res!55680 () Bool)

(assert (=> b!112907 (=> res!55680 e!73406)))

(assert (=> b!112907 (= res!55680 (not e!73398))))

(declare-fun res!55684 () Bool)

(assert (=> b!112907 (=> (not res!55684) (not e!73398))))

(assert (=> b!112907 (= res!55684 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun bm!12104 () Bool)

(declare-fun c!20173 () Bool)

(assert (=> bm!12104 (= call!12104 (+!150 (ite c!20178 call!12107 (ite c!20173 call!12108 call!12102)) (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun b!112908 () Bool)

(assert (=> b!112908 (= e!73405 call!12106)))

(declare-fun b!112909 () Bool)

(declare-fun e!73397 () Bool)

(assert (=> b!112909 (= e!73400 e!73397)))

(declare-fun res!55676 () Bool)

(assert (=> b!112909 (= res!55676 call!12105)))

(assert (=> b!112909 (=> (not res!55676) (not e!73397))))

(declare-fun bm!12105 () Bool)

(assert (=> bm!12105 (= call!12108 call!12107)))

(declare-fun b!112910 () Bool)

(assert (=> b!112910 (= e!73399 (= (apply!102 lt!58471 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112911 () Bool)

(assert (=> b!112911 (= e!73403 e!73405)))

(assert (=> b!112911 (= c!20173 (and (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!112912 () Bool)

(assert (=> b!112912 (= e!73397 (= (apply!102 lt!58471 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!112913 () Bool)

(declare-fun lt!58481 () Unit!3498)

(assert (=> b!112913 (= e!73408 lt!58481)))

(declare-fun lt!58474 () ListLongMap!1559)

(assert (=> b!112913 (= lt!58474 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58478 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58478 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58483 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58483 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58468 () Unit!3498)

(declare-fun addStillContains!78 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> b!112913 (= lt!58468 (addStillContains!78 lt!58474 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58483))))

(assert (=> b!112913 (contains!834 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58483)))

(declare-fun lt!58476 () Unit!3498)

(assert (=> b!112913 (= lt!58476 lt!58468)))

(declare-fun lt!58482 () ListLongMap!1559)

(assert (=> b!112913 (= lt!58482 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58480 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58480 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58473 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58473 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58469 () Unit!3498)

(declare-fun addApplyDifferent!78 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> b!112913 (= lt!58469 (addApplyDifferent!78 lt!58482 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58473))))

(assert (=> b!112913 (= (apply!102 (+!150 lt!58482 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58473) (apply!102 lt!58482 lt!58473))))

(declare-fun lt!58467 () Unit!3498)

(assert (=> b!112913 (= lt!58467 lt!58469)))

(declare-fun lt!58472 () ListLongMap!1559)

(assert (=> b!112913 (= lt!58472 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58464 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58464 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58466 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58466 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58477 () Unit!3498)

(assert (=> b!112913 (= lt!58477 (addApplyDifferent!78 lt!58472 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58466))))

(assert (=> b!112913 (= (apply!102 (+!150 lt!58472 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58466) (apply!102 lt!58472 lt!58466))))

(declare-fun lt!58475 () Unit!3498)

(assert (=> b!112913 (= lt!58475 lt!58477)))

(declare-fun lt!58484 () ListLongMap!1559)

(assert (=> b!112913 (= lt!58484 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun lt!58463 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58463 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58465 () (_ BitVec 64))

(assert (=> b!112913 (= lt!58465 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!112913 (= lt!58481 (addApplyDifferent!78 lt!58484 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58465))))

(assert (=> b!112913 (= (apply!102 (+!150 lt!58484 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58465) (apply!102 lt!58484 lt!58465))))

(declare-fun b!112914 () Bool)

(assert (=> b!112914 (= e!73406 e!73404)))

(declare-fun res!55677 () Bool)

(assert (=> b!112914 (=> (not res!55677) (not e!73404))))

(assert (=> b!112914 (= res!55677 (contains!834 lt!58471 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!112914 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112915 () Bool)

(assert (=> b!112915 (= e!73402 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!32103 c!20178) b!112896))

(assert (= (and d!32103 (not c!20178)) b!112911))

(assert (= (and b!112911 c!20173) b!112908))

(assert (= (and b!112911 (not c!20173)) b!112904))

(assert (= (and b!112904 c!20177) b!112901))

(assert (= (and b!112904 (not c!20177)) b!112897))

(assert (= (or b!112901 b!112897) bm!12101))

(assert (= (or b!112908 bm!12101) bm!12105))

(assert (= (or b!112908 b!112901) bm!12103))

(assert (= (or b!112896 bm!12105) bm!12102))

(assert (= (or b!112896 bm!12103) bm!12104))

(assert (= (and d!32103 res!55681) b!112915))

(assert (= (and d!32103 c!20174) b!112913))

(assert (= (and d!32103 (not c!20174)) b!112905))

(assert (= (and d!32103 res!55682) b!112907))

(assert (= (and b!112907 res!55684) b!112895))

(assert (= (and b!112907 (not res!55680)) b!112914))

(assert (= (and b!112914 res!55677) b!112899))

(assert (= (and b!112907 res!55678) b!112898))

(assert (= (and b!112898 c!20176) b!112909))

(assert (= (and b!112898 (not c!20176)) b!112903))

(assert (= (and b!112909 res!55676) b!112912))

(assert (= (or b!112909 b!112903) bm!12099))

(assert (= (and b!112898 res!55683) b!112902))

(assert (= (and b!112902 c!20175) b!112900))

(assert (= (and b!112902 (not c!20175)) b!112906))

(assert (= (and b!112900 res!55679) b!112910))

(assert (= (or b!112900 b!112906) bm!12100))

(declare-fun b_lambda!5059 () Bool)

(assert (=> (not b_lambda!5059) (not b!112899)))

(assert (=> b!112899 t!5782))

(declare-fun b_and!6941 () Bool)

(assert (= b_and!6921 (and (=> t!5782 result!3565) b_and!6941)))

(assert (=> b!112899 t!5784))

(declare-fun b_and!6943 () Bool)

(assert (= b_and!6923 (and (=> t!5784 result!3569) b_and!6943)))

(assert (=> d!32103 m!128709))

(declare-fun m!128879 () Bool)

(assert (=> b!112914 m!128879))

(assert (=> b!112914 m!128879))

(declare-fun m!128881 () Bool)

(assert (=> b!112914 m!128881))

(declare-fun m!128883 () Bool)

(assert (=> b!112912 m!128883))

(assert (=> b!112895 m!128879))

(assert (=> b!112895 m!128879))

(declare-fun m!128885 () Bool)

(assert (=> b!112895 m!128885))

(declare-fun m!128887 () Bool)

(assert (=> bm!12100 m!128887))

(assert (=> bm!12102 m!128715))

(declare-fun m!128889 () Bool)

(assert (=> b!112913 m!128889))

(declare-fun m!128891 () Bool)

(assert (=> b!112913 m!128891))

(declare-fun m!128893 () Bool)

(assert (=> b!112913 m!128893))

(assert (=> b!112913 m!128715))

(declare-fun m!128895 () Bool)

(assert (=> b!112913 m!128895))

(declare-fun m!128897 () Bool)

(assert (=> b!112913 m!128897))

(declare-fun m!128899 () Bool)

(assert (=> b!112913 m!128899))

(declare-fun m!128901 () Bool)

(assert (=> b!112913 m!128901))

(assert (=> b!112913 m!128889))

(assert (=> b!112913 m!128879))

(declare-fun m!128903 () Bool)

(assert (=> b!112913 m!128903))

(declare-fun m!128905 () Bool)

(assert (=> b!112913 m!128905))

(assert (=> b!112913 m!128903))

(declare-fun m!128907 () Bool)

(assert (=> b!112913 m!128907))

(declare-fun m!128909 () Bool)

(assert (=> b!112913 m!128909))

(declare-fun m!128911 () Bool)

(assert (=> b!112913 m!128911))

(assert (=> b!112913 m!128909))

(declare-fun m!128913 () Bool)

(assert (=> b!112913 m!128913))

(declare-fun m!128915 () Bool)

(assert (=> b!112913 m!128915))

(declare-fun m!128917 () Bool)

(assert (=> b!112913 m!128917))

(assert (=> b!112913 m!128915))

(declare-fun m!128919 () Bool)

(assert (=> b!112896 m!128919))

(declare-fun m!128921 () Bool)

(assert (=> bm!12104 m!128921))

(declare-fun m!128923 () Bool)

(assert (=> bm!12099 m!128923))

(assert (=> b!112899 m!128879))

(declare-fun m!128925 () Bool)

(assert (=> b!112899 m!128925))

(assert (=> b!112899 m!128679))

(declare-fun m!128927 () Bool)

(assert (=> b!112899 m!128927))

(assert (=> b!112899 m!128679))

(declare-fun m!128929 () Bool)

(assert (=> b!112899 m!128929))

(assert (=> b!112899 m!128879))

(assert (=> b!112899 m!128927))

(declare-fun m!128931 () Bool)

(assert (=> b!112910 m!128931))

(assert (=> b!112915 m!128879))

(assert (=> b!112915 m!128879))

(assert (=> b!112915 m!128885))

(assert (=> b!112666 d!32103))

(declare-fun d!32105 () Bool)

(assert (=> d!32105 (not (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!58487 () Unit!3498)

(declare-fun choose!68 (array!4399 (_ BitVec 32) (_ BitVec 64) List!1619) Unit!3498)

(assert (=> d!32105 (= lt!58487 (choose!68 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616)))))

(assert (=> d!32105 (bvslt (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32105 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616)) lt!58487)))

(declare-fun bs!4644 () Bool)

(assert (= bs!4644 d!32105))

(assert (=> bs!4644 m!128675))

(assert (=> bs!4644 m!128689))

(assert (=> bs!4644 m!128675))

(declare-fun m!128933 () Bool)

(assert (=> bs!4644 m!128933))

(assert (=> b!112661 d!32105))

(declare-fun d!32107 () Bool)

(assert (=> d!32107 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1616)))

(declare-fun lt!58490 () Unit!3498)

(declare-fun choose!39 (array!4399 (_ BitVec 32) (_ BitVec 32)) Unit!3498)

(assert (=> d!32107 (= lt!58490 (choose!39 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!32107 (bvslt (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!32107 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355) lt!58490)))

(declare-fun bs!4645 () Bool)

(assert (= bs!4645 d!32107))

(assert (=> bs!4645 m!128685))

(declare-fun m!128935 () Bool)

(assert (=> bs!4645 m!128935))

(assert (=> b!112661 d!32107))

(declare-fun d!32109 () Bool)

(declare-fun res!55689 () Bool)

(declare-fun e!73413 () Bool)

(assert (=> d!32109 (=> res!55689 e!73413)))

(assert (=> d!32109 (= res!55689 (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32109 (= (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!73413)))

(declare-fun b!112920 () Bool)

(declare-fun e!73414 () Bool)

(assert (=> b!112920 (= e!73413 e!73414)))

(declare-fun res!55690 () Bool)

(assert (=> b!112920 (=> (not res!55690) (not e!73414))))

(assert (=> b!112920 (= res!55690 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!112921 () Bool)

(assert (=> b!112921 (= e!73414 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!32109 (not res!55689)) b!112920))

(assert (= (and b!112920 res!55690) b!112921))

(assert (=> d!32109 m!128879))

(assert (=> b!112921 m!128675))

(declare-fun m!128937 () Bool)

(assert (=> b!112921 m!128937))

(assert (=> b!112661 d!32109))

(declare-fun d!32111 () Bool)

(declare-fun e!73417 () Bool)

(assert (=> d!32111 e!73417))

(declare-fun c!20181 () Bool)

(assert (=> d!32111 (= c!20181 (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!58493 () Unit!3498)

(declare-fun choose!717 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3498)

(assert (=> d!32111 (= lt!58493 (choose!717 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32111 (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32111 (= (lemmaListMapContainsThenArrayContainsFrom!109 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) lt!58493)))

(declare-fun b!112926 () Bool)

(assert (=> b!112926 (= e!73417 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!112927 () Bool)

(assert (=> b!112927 (= e!73417 (ite (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32111 c!20181) b!112926))

(assert (= (and d!32111 (not c!20181)) b!112927))

(assert (=> d!32111 m!128675))

(declare-fun m!128939 () Bool)

(assert (=> d!32111 m!128939))

(assert (=> d!32111 m!128709))

(assert (=> b!112926 m!128675))

(assert (=> b!112926 m!128689))

(assert (=> b!112661 d!32111))

(declare-fun b!112928 () Bool)

(declare-fun e!73419 () Bool)

(declare-fun e!73418 () Bool)

(assert (=> b!112928 (= e!73419 e!73418)))

(declare-fun c!20182 () Bool)

(assert (=> b!112928 (= c!20182 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!112929 () Bool)

(declare-fun e!73421 () Bool)

(assert (=> b!112929 (= e!73421 e!73419)))

(declare-fun res!55691 () Bool)

(assert (=> b!112929 (=> (not res!55691) (not e!73419))))

(declare-fun e!73420 () Bool)

(assert (=> b!112929 (= res!55691 (not e!73420))))

(declare-fun res!55693 () Bool)

(assert (=> b!112929 (=> (not res!55693) (not e!73420))))

(assert (=> b!112929 (= res!55693 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun call!12109 () Bool)

(declare-fun bm!12106 () Bool)

(assert (=> bm!12106 (= call!12109 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20182 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616) Nil!1616)))))

(declare-fun b!112930 () Bool)

(assert (=> b!112930 (= e!73418 call!12109)))

(declare-fun b!112931 () Bool)

(assert (=> b!112931 (= e!73418 call!12109)))

(declare-fun b!112932 () Bool)

(assert (=> b!112932 (= e!73420 (contains!835 Nil!1616 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun d!32113 () Bool)

(declare-fun res!55692 () Bool)

(assert (=> d!32113 (=> res!55692 e!73421)))

(assert (=> d!32113 (= res!55692 (bvsge from!355 (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32113 (= (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1616) e!73421)))

(assert (= (and d!32113 (not res!55692)) b!112929))

(assert (= (and b!112929 res!55693) b!112932))

(assert (= (and b!112929 res!55691) b!112928))

(assert (= (and b!112928 c!20182) b!112931))

(assert (= (and b!112928 (not c!20182)) b!112930))

(assert (= (or b!112931 b!112930) bm!12106))

(assert (=> b!112928 m!128675))

(assert (=> b!112928 m!128675))

(declare-fun m!128941 () Bool)

(assert (=> b!112928 m!128941))

(assert (=> b!112929 m!128675))

(assert (=> b!112929 m!128675))

(assert (=> b!112929 m!128941))

(assert (=> bm!12106 m!128675))

(declare-fun m!128943 () Bool)

(assert (=> bm!12106 m!128943))

(assert (=> b!112932 m!128675))

(assert (=> b!112932 m!128675))

(declare-fun m!128945 () Bool)

(assert (=> b!112932 m!128945))

(assert (=> b!112661 d!32113))

(declare-fun d!32115 () Bool)

(declare-fun e!73427 () Bool)

(assert (=> d!32115 e!73427))

(declare-fun res!55696 () Bool)

(assert (=> d!32115 (=> res!55696 e!73427)))

(declare-fun lt!58502 () Bool)

(assert (=> d!32115 (= res!55696 (not lt!58502))))

(declare-fun lt!58505 () Bool)

(assert (=> d!32115 (= lt!58502 lt!58505)))

(declare-fun lt!58504 () Unit!3498)

(declare-fun e!73426 () Unit!3498)

(assert (=> d!32115 (= lt!58504 e!73426)))

(declare-fun c!20185 () Bool)

(assert (=> d!32115 (= c!20185 lt!58505)))

(declare-fun containsKey!164 (List!1620 (_ BitVec 64)) Bool)

(assert (=> d!32115 (= lt!58505 (containsKey!164 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32115 (= (contains!834 lt!58337 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58502)))

(declare-fun b!112939 () Bool)

(declare-fun lt!58503 () Unit!3498)

(assert (=> b!112939 (= e!73426 lt!58503)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!112 (List!1620 (_ BitVec 64)) Unit!3498)

(assert (=> b!112939 (= lt!58503 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-datatypes ((Option!167 0))(
  ( (Some!166 (v!2965 V!3257)) (None!165) )
))
(declare-fun isDefined!113 (Option!167) Bool)

(declare-fun getValueByKey!161 (List!1620 (_ BitVec 64)) Option!167)

(assert (=> b!112939 (isDefined!113 (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!112940 () Bool)

(declare-fun Unit!3508 () Unit!3498)

(assert (=> b!112940 (= e!73426 Unit!3508)))

(declare-fun b!112941 () Bool)

(assert (=> b!112941 (= e!73427 (isDefined!113 (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32115 c!20185) b!112939))

(assert (= (and d!32115 (not c!20185)) b!112940))

(assert (= (and d!32115 (not res!55696)) b!112941))

(assert (=> d!32115 m!128675))

(declare-fun m!128947 () Bool)

(assert (=> d!32115 m!128947))

(assert (=> b!112939 m!128675))

(declare-fun m!128949 () Bool)

(assert (=> b!112939 m!128949))

(assert (=> b!112939 m!128675))

(declare-fun m!128951 () Bool)

(assert (=> b!112939 m!128951))

(assert (=> b!112939 m!128951))

(declare-fun m!128953 () Bool)

(assert (=> b!112939 m!128953))

(assert (=> b!112941 m!128675))

(assert (=> b!112941 m!128951))

(assert (=> b!112941 m!128951))

(assert (=> b!112941 m!128953))

(assert (=> b!112667 d!32115))

(declare-fun bm!12155 () Bool)

(declare-fun call!12158 () SeekEntryResult!257)

(declare-fun call!12180 () SeekEntryResult!257)

(assert (=> bm!12155 (= call!12158 call!12180)))

(declare-fun bm!12156 () Bool)

(declare-fun call!12175 () ListLongMap!1559)

(declare-fun call!12166 () ListLongMap!1559)

(assert (=> bm!12156 (= call!12175 call!12166)))

(declare-fun b!113023 () Bool)

(declare-fun e!73482 () tuple2!2412)

(declare-fun e!73478 () tuple2!2412)

(assert (=> b!113023 (= e!73482 e!73478)))

(declare-fun c!20214 () Bool)

(assert (=> b!113023 (= c!20214 (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113024 () Bool)

(declare-fun e!73476 () Unit!3498)

(declare-fun Unit!3509 () Unit!3498)

(assert (=> b!113024 (= e!73476 Unit!3509)))

(declare-fun lt!58574 () Unit!3498)

(declare-fun call!12162 () Unit!3498)

(assert (=> b!113024 (= lt!58574 call!12162)))

(declare-fun lt!58580 () SeekEntryResult!257)

(declare-fun call!12174 () SeekEntryResult!257)

(assert (=> b!113024 (= lt!58580 call!12174)))

(declare-fun res!55731 () Bool)

(assert (=> b!113024 (= res!55731 ((_ is Found!257) lt!58580))))

(declare-fun e!73483 () Bool)

(assert (=> b!113024 (=> (not res!55731) (not e!73483))))

(assert (=> b!113024 e!73483))

(declare-fun lt!58582 () Unit!3498)

(assert (=> b!113024 (= lt!58582 lt!58574)))

(assert (=> b!113024 false))

(declare-fun b!113025 () Bool)

(declare-fun call!12164 () ListLongMap!1559)

(declare-fun e!73488 () Bool)

(declare-fun call!12165 () ListLongMap!1559)

(assert (=> b!113025 (= e!73488 (= call!12164 (+!150 call!12165 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun c!20219 () Bool)

(declare-fun lt!58565 () SeekEntryResult!257)

(declare-fun bm!12157 () Bool)

(declare-fun call!12168 () tuple2!2412)

(declare-fun updateHelperNewKey!51 (LongMapFixedSize!928 (_ BitVec 64) V!3257 (_ BitVec 32)) tuple2!2412)

(assert (=> bm!12157 (= call!12168 (updateHelperNewKey!51 newMap!16 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565))))))

(declare-fun bm!12158 () Bool)

(declare-fun call!12176 () ListLongMap!1559)

(assert (=> bm!12158 (= call!12176 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12159 () Bool)

(assert (=> bm!12159 (= call!12174 call!12180)))

(declare-fun b!113026 () Bool)

(declare-fun lt!58568 () Unit!3498)

(declare-fun lt!58561 () Unit!3498)

(assert (=> b!113026 (= lt!58568 lt!58561)))

(declare-fun call!12160 () ListLongMap!1559)

(assert (=> b!113026 (= call!12175 call!12160)))

(declare-fun lt!58578 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!51 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3498)

(assert (=> b!113026 (= lt!58561 (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58578 (zeroValue!2528 newMap!16) lt!58327 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)))))

(assert (=> b!113026 (= lt!58578 (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!113026 (= e!73478 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6844 newMap!16) (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) lt!58327 (minValue!2528 newMap!16) (_size!513 newMap!16) (_keys!4380 newMap!16) (_values!2643 newMap!16) (_vacant!513 newMap!16))))))

(declare-fun bm!12160 () Bool)

(declare-fun call!12172 () Bool)

(declare-fun call!12171 () Bool)

(assert (=> bm!12160 (= call!12172 call!12171)))

(declare-fun bm!12161 () Bool)

(declare-fun call!12159 () Bool)

(assert (=> bm!12161 (= call!12171 call!12159)))

(declare-fun b!113027 () Bool)

(declare-fun c!20223 () Bool)

(declare-fun lt!58577 () SeekEntryResult!257)

(assert (=> b!113027 (= c!20223 ((_ is MissingVacant!257) lt!58577))))

(declare-fun e!73490 () Bool)

(declare-fun e!73470 () Bool)

(assert (=> b!113027 (= e!73490 e!73470)))

(declare-fun bm!12162 () Bool)

(assert (=> bm!12162 (= call!12165 (map!1303 newMap!16))))

(declare-fun b!113028 () Bool)

(declare-fun e!73477 () tuple2!2412)

(declare-fun lt!58571 () tuple2!2412)

(assert (=> b!113028 (= e!73477 (tuple2!2413 (_1!1217 lt!58571) (_2!1217 lt!58571)))))

(assert (=> b!113028 (= lt!58571 call!12168)))

(declare-fun call!12173 () Unit!3498)

(declare-fun bm!12163 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3498)

(assert (=> bm!12163 (= call!12173 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun b!113029 () Bool)

(declare-fun res!55737 () Bool)

(assert (=> b!113029 (= res!55737 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3183 lt!58577)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73486 () Bool)

(assert (=> b!113029 (=> (not res!55737) (not e!73486))))

(declare-fun b!113030 () Bool)

(declare-fun e!73472 () Bool)

(assert (=> b!113030 (= e!73472 e!73488)))

(declare-fun res!55728 () Bool)

(assert (=> b!113030 (= res!55728 (contains!834 call!12164 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113030 (=> (not res!55728) (not e!73488))))

(declare-fun b!113031 () Bool)

(declare-fun res!55727 () Bool)

(declare-fun e!73484 () Bool)

(assert (=> b!113031 (=> (not res!55727) (not e!73484))))

(assert (=> b!113031 (= res!55727 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3180 lt!58577)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113032 () Bool)

(declare-fun e!73479 () Bool)

(assert (=> b!113032 (= e!73479 e!73472)))

(declare-fun c!20213 () Bool)

(declare-fun lt!58564 () tuple2!2412)

(assert (=> b!113032 (= c!20213 (_1!1217 lt!58564))))

(declare-fun b!113033 () Bool)

(declare-fun res!55726 () Bool)

(assert (=> b!113033 (= res!55726 call!12171)))

(declare-fun e!73475 () Bool)

(assert (=> b!113033 (=> (not res!55726) (not e!73475))))

(declare-fun b!113034 () Bool)

(assert (=> b!113034 (= c!20219 ((_ is MissingVacant!257) lt!58565))))

(declare-fun e!73487 () tuple2!2412)

(assert (=> b!113034 (= e!73487 e!73477)))

(declare-fun b!113035 () Bool)

(assert (=> b!113035 (= e!73470 ((_ is Undefined!257) lt!58577))))

(declare-fun b!113036 () Bool)

(declare-fun res!55729 () Bool)

(declare-fun lt!58570 () SeekEntryResult!257)

(assert (=> b!113036 (= res!55729 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3183 lt!58570)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73473 () Bool)

(assert (=> b!113036 (=> (not res!55729) (not e!73473))))

(declare-fun b!113037 () Bool)

(assert (=> b!113037 (= e!73483 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58580)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113038 () Bool)

(declare-fun res!55725 () Bool)

(assert (=> b!113038 (=> (not res!55725) (not e!73484))))

(declare-fun call!12179 () Bool)

(assert (=> b!113038 (= res!55725 call!12179)))

(assert (=> b!113038 (= e!73490 e!73484)))

(declare-fun b!113039 () Bool)

(declare-fun res!55733 () Bool)

(declare-fun call!12177 () Bool)

(assert (=> b!113039 (= res!55733 call!12177)))

(assert (=> b!113039 (=> (not res!55733) (not e!73483))))

(declare-fun bm!12164 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3498)

(assert (=> bm!12164 (= call!12162 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun b!113040 () Bool)

(declare-fun e!73485 () Bool)

(assert (=> b!113040 (= e!73485 e!73473)))

(declare-fun res!55730 () Bool)

(assert (=> b!113040 (= res!55730 call!12172)))

(assert (=> b!113040 (=> (not res!55730) (not e!73473))))

(declare-fun bm!12165 () Bool)

(declare-fun call!12178 () Bool)

(declare-fun call!12167 () Bool)

(assert (=> bm!12165 (= call!12178 call!12167)))

(declare-fun b!113022 () Bool)

(assert (=> b!113022 (= e!73472 (= call!12164 call!12165))))

(declare-fun d!32117 () Bool)

(assert (=> d!32117 e!73479))

(declare-fun res!55735 () Bool)

(assert (=> d!32117 (=> (not res!55735) (not e!73479))))

(assert (=> d!32117 (= res!55735 (valid!442 (_2!1217 lt!58564)))))

(assert (=> d!32117 (= lt!58564 e!73482)))

(declare-fun c!20216 () Bool)

(assert (=> d!32117 (= c!20216 (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvneg (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32117 (valid!442 newMap!16)))

(assert (=> d!32117 (= (update!171 newMap!16 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327) lt!58564)))

(declare-fun b!113041 () Bool)

(declare-fun lt!58572 () SeekEntryResult!257)

(assert (=> b!113041 (= e!73475 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58572)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun c!20218 () Bool)

(declare-fun c!20217 () Bool)

(declare-fun c!20221 () Bool)

(declare-fun c!20215 () Bool)

(declare-fun bm!12166 () Bool)

(declare-fun c!20224 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!12166 (= call!12159 (inRange!0 (ite c!20224 (ite c!20221 (index!3181 lt!58580) (ite c!20218 (index!3180 lt!58577) (index!3183 lt!58577))) (ite c!20215 (index!3181 lt!58572) (ite c!20217 (index!3180 lt!58570) (index!3183 lt!58570)))) (mask!6844 newMap!16)))))

(declare-fun b!113042 () Bool)

(declare-fun res!55732 () Bool)

(declare-fun e!73489 () Bool)

(assert (=> b!113042 (=> (not res!55732) (not e!73489))))

(assert (=> b!113042 (= res!55732 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3180 lt!58570)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113043 () Bool)

(declare-fun lt!58584 () Unit!3498)

(assert (=> b!113043 (= lt!58584 e!73476)))

(declare-fun call!12161 () Bool)

(assert (=> b!113043 (= c!20221 call!12161)))

(assert (=> b!113043 (= e!73487 (tuple2!2413 false newMap!16))))

(declare-fun bm!12167 () Bool)

(assert (=> bm!12167 (= call!12167 (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113044 () Bool)

(assert (=> b!113044 (= e!73489 (not call!12178))))

(declare-fun bm!12168 () Bool)

(declare-fun c!20222 () Bool)

(assert (=> bm!12168 (= c!20222 c!20224)))

(declare-fun e!73474 () ListLongMap!1559)

(assert (=> bm!12168 (= call!12161 (contains!834 e!73474 (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565)))))))

(declare-fun b!113045 () Bool)

(assert (=> b!113045 (= e!73470 e!73486)))

(declare-fun res!55738 () Bool)

(assert (=> b!113045 (= res!55738 call!12179)))

(assert (=> b!113045 (=> (not res!55738) (not e!73486))))

(declare-fun b!113046 () Bool)

(declare-fun lt!58569 () tuple2!2412)

(assert (=> b!113046 (= lt!58569 call!12168)))

(declare-fun e!73471 () tuple2!2412)

(assert (=> b!113046 (= e!73471 (tuple2!2413 (_1!1217 lt!58569) (_2!1217 lt!58569)))))

(declare-fun bm!12169 () Bool)

(assert (=> bm!12169 (= call!12180 (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun bm!12170 () Bool)

(declare-fun call!12169 () ListLongMap!1559)

(assert (=> bm!12170 (= call!12166 (+!150 (ite c!20216 call!12169 call!12176) (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun b!113047 () Bool)

(declare-fun call!12181 () Bool)

(assert (=> b!113047 (= e!73484 (not call!12181))))

(declare-fun b!113048 () Bool)

(declare-fun lt!58579 () Unit!3498)

(declare-fun lt!58573 () Unit!3498)

(assert (=> b!113048 (= lt!58579 lt!58573)))

(assert (=> b!113048 (= call!12175 call!12160)))

(declare-fun lt!58586 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3498)

(assert (=> b!113048 (= lt!58573 (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58586 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58327 (defaultEntry!2660 newMap!16)))))

(assert (=> b!113048 (= lt!58586 (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!113048 (= e!73478 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6844 newMap!16) (bvor (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) (zeroValue!2528 newMap!16) lt!58327 (_size!513 newMap!16) (_keys!4380 newMap!16) (_values!2643 newMap!16) (_vacant!513 newMap!16))))))

(declare-fun b!113049 () Bool)

(declare-fun e!73481 () Unit!3498)

(declare-fun Unit!3510 () Unit!3498)

(assert (=> b!113049 (= e!73481 Unit!3510)))

(declare-fun lt!58560 () Unit!3498)

(assert (=> b!113049 (= lt!58560 call!12173)))

(assert (=> b!113049 (= lt!58570 call!12158)))

(assert (=> b!113049 (= c!20217 ((_ is MissingZero!257) lt!58570))))

(declare-fun e!73480 () Bool)

(assert (=> b!113049 e!73480))

(declare-fun lt!58563 () Unit!3498)

(assert (=> b!113049 (= lt!58563 lt!58560)))

(assert (=> b!113049 false))

(declare-fun b!113050 () Bool)

(assert (=> b!113050 (= e!73482 e!73487)))

(assert (=> b!113050 (= lt!58565 (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(assert (=> b!113050 (= c!20224 ((_ is Undefined!257) lt!58565))))

(declare-fun b!113051 () Bool)

(declare-fun call!12163 () ListLongMap!1559)

(assert (=> b!113051 (= e!73474 call!12163)))

(declare-fun bm!12171 () Bool)

(assert (=> bm!12171 (= call!12179 call!12177)))

(declare-fun b!113052 () Bool)

(declare-fun c!20212 () Bool)

(assert (=> b!113052 (= c!20212 ((_ is MissingVacant!257) lt!58570))))

(assert (=> b!113052 (= e!73480 e!73485)))

(declare-fun b!113053 () Bool)

(declare-fun lt!58566 () Unit!3498)

(assert (=> b!113053 (= e!73481 lt!58566)))

(assert (=> b!113053 (= lt!58566 call!12162)))

(assert (=> b!113053 (= lt!58572 call!12158)))

(declare-fun res!55734 () Bool)

(assert (=> b!113053 (= res!55734 ((_ is Found!257) lt!58572))))

(assert (=> b!113053 (=> (not res!55734) (not e!73475))))

(assert (=> b!113053 e!73475))

(declare-fun b!113054 () Bool)

(assert (=> b!113054 (= e!73473 (not call!12178))))

(declare-fun b!113055 () Bool)

(assert (=> b!113055 (= e!73486 (not call!12181))))

(declare-fun b!113056 () Bool)

(assert (=> b!113056 (= e!73485 ((_ is Undefined!257) lt!58570))))

(declare-fun bm!12172 () Bool)

(assert (=> bm!12172 (= call!12181 call!12167)))

(declare-fun bm!12173 () Bool)

(assert (=> bm!12173 (= call!12177 call!12159)))

(declare-fun bm!12174 () Bool)

(assert (=> bm!12174 (= call!12164 (map!1303 (_2!1217 lt!58564)))))

(declare-fun b!113057 () Bool)

(declare-fun res!55736 () Bool)

(assert (=> b!113057 (=> (not res!55736) (not e!73489))))

(assert (=> b!113057 (= res!55736 call!12172)))

(assert (=> b!113057 (= e!73480 e!73489)))

(declare-fun b!113058 () Bool)

(declare-fun lt!58576 () array!4401)

(assert (=> b!113058 (= e!73474 (getCurrentListMap!479 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun bm!12175 () Bool)

(declare-fun call!12170 () ListLongMap!1559)

(assert (=> bm!12175 (= call!12163 call!12170)))

(declare-fun bm!12176 () Bool)

(assert (=> bm!12176 (= call!12170 (getCurrentListMap!479 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113059 () Bool)

(assert (=> b!113059 (= e!73477 e!73471)))

(declare-fun c!20220 () Bool)

(assert (=> b!113059 (= c!20220 ((_ is MissingZero!257) lt!58565))))

(declare-fun bm!12177 () Bool)

(assert (=> bm!12177 (= call!12169 call!12176)))

(declare-fun b!113060 () Bool)

(declare-fun lt!58585 () Unit!3498)

(assert (=> b!113060 (= e!73476 lt!58585)))

(assert (=> b!113060 (= lt!58585 call!12173)))

(assert (=> b!113060 (= lt!58577 call!12174)))

(assert (=> b!113060 (= c!20218 ((_ is MissingZero!257) lt!58577))))

(assert (=> b!113060 e!73490))

(declare-fun b!113061 () Bool)

(declare-fun lt!58583 () Unit!3498)

(declare-fun lt!58567 () Unit!3498)

(assert (=> b!113061 (= lt!58583 lt!58567)))

(assert (=> b!113061 call!12161))

(declare-fun lemmaValidKeyInArrayIsInListMap!111 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) Unit!3498)

(assert (=> b!113061 (= lt!58567 (lemmaValidKeyInArrayIsInListMap!111 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (defaultEntry!2660 newMap!16)))))

(assert (=> b!113061 (= lt!58576 (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))))))

(declare-fun lt!58575 () Unit!3498)

(declare-fun lt!58562 () Unit!3498)

(assert (=> b!113061 (= lt!58575 lt!58562)))

(assert (=> b!113061 (= call!12166 call!12163)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3498)

(assert (=> b!113061 (= lt!58562 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58581 () Unit!3498)

(assert (=> b!113061 (= lt!58581 e!73481)))

(assert (=> b!113061 (= c!20215 (contains!834 call!12176 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113061 (= e!73471 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (_size!513 newMap!16) (_keys!4380 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))) (_vacant!513 newMap!16))))))

(declare-fun bm!12178 () Bool)

(assert (=> bm!12178 (= call!12160 call!12170)))

(assert (= (and d!32117 c!20216) b!113023))

(assert (= (and d!32117 (not c!20216)) b!113050))

(assert (= (and b!113023 c!20214) b!113026))

(assert (= (and b!113023 (not c!20214)) b!113048))

(assert (= (or b!113026 b!113048) bm!12178))

(assert (= (or b!113026 b!113048) bm!12177))

(assert (= (or b!113026 b!113048) bm!12156))

(assert (= (and b!113050 c!20224) b!113043))

(assert (= (and b!113050 (not c!20224)) b!113034))

(assert (= (and b!113043 c!20221) b!113024))

(assert (= (and b!113043 (not c!20221)) b!113060))

(assert (= (and b!113024 res!55731) b!113039))

(assert (= (and b!113039 res!55733) b!113037))

(assert (= (and b!113060 c!20218) b!113038))

(assert (= (and b!113060 (not c!20218)) b!113027))

(assert (= (and b!113038 res!55725) b!113031))

(assert (= (and b!113031 res!55727) b!113047))

(assert (= (and b!113027 c!20223) b!113045))

(assert (= (and b!113027 (not c!20223)) b!113035))

(assert (= (and b!113045 res!55738) b!113029))

(assert (= (and b!113029 res!55737) b!113055))

(assert (= (or b!113038 b!113045) bm!12171))

(assert (= (or b!113047 b!113055) bm!12172))

(assert (= (or b!113039 bm!12171) bm!12173))

(assert (= (or b!113024 b!113060) bm!12159))

(assert (= (and b!113034 c!20219) b!113028))

(assert (= (and b!113034 (not c!20219)) b!113059))

(assert (= (and b!113059 c!20220) b!113046))

(assert (= (and b!113059 (not c!20220)) b!113061))

(assert (= (and b!113061 c!20215) b!113053))

(assert (= (and b!113061 (not c!20215)) b!113049))

(assert (= (and b!113053 res!55734) b!113033))

(assert (= (and b!113033 res!55726) b!113041))

(assert (= (and b!113049 c!20217) b!113057))

(assert (= (and b!113049 (not c!20217)) b!113052))

(assert (= (and b!113057 res!55736) b!113042))

(assert (= (and b!113042 res!55732) b!113044))

(assert (= (and b!113052 c!20212) b!113040))

(assert (= (and b!113052 (not c!20212)) b!113056))

(assert (= (and b!113040 res!55730) b!113036))

(assert (= (and b!113036 res!55729) b!113054))

(assert (= (or b!113057 b!113040) bm!12160))

(assert (= (or b!113044 b!113054) bm!12165))

(assert (= (or b!113033 bm!12160) bm!12161))

(assert (= (or b!113053 b!113049) bm!12155))

(assert (= (or b!113028 b!113046) bm!12157))

(assert (= (or b!113024 b!113053) bm!12164))

(assert (= (or bm!12159 bm!12155) bm!12169))

(assert (= (or bm!12172 bm!12165) bm!12167))

(assert (= (or bm!12173 bm!12161) bm!12166))

(assert (= (or b!113060 b!113049) bm!12163))

(assert (= (or b!113043 b!113061) bm!12175))

(assert (= (or b!113043 b!113061) bm!12168))

(assert (= (and bm!12168 c!20222) b!113051))

(assert (= (and bm!12168 (not c!20222)) b!113058))

(assert (= (or bm!12178 bm!12175) bm!12176))

(assert (= (or bm!12177 b!113061) bm!12158))

(assert (= (or bm!12156 b!113061) bm!12170))

(assert (= (and d!32117 res!55735) b!113032))

(assert (= (and b!113032 c!20213) b!113030))

(assert (= (and b!113032 (not c!20213)) b!113022))

(assert (= (and b!113030 res!55728) b!113025))

(assert (= (or b!113030 b!113025 b!113022) bm!12174))

(assert (= (or b!113025 b!113022) bm!12162))

(assert (=> bm!12167 m!128675))

(declare-fun m!128955 () Bool)

(assert (=> bm!12167 m!128955))

(declare-fun m!128957 () Bool)

(assert (=> bm!12170 m!128957))

(assert (=> bm!12163 m!128675))

(declare-fun m!128959 () Bool)

(assert (=> bm!12163 m!128959))

(assert (=> b!113050 m!128675))

(declare-fun m!128961 () Bool)

(assert (=> b!113050 m!128961))

(declare-fun m!128963 () Bool)

(assert (=> bm!12174 m!128963))

(declare-fun m!128965 () Bool)

(assert (=> b!113042 m!128965))

(declare-fun m!128967 () Bool)

(assert (=> bm!12168 m!128967))

(declare-fun m!128969 () Bool)

(assert (=> bm!12168 m!128969))

(declare-fun m!128971 () Bool)

(assert (=> b!113031 m!128971))

(assert (=> bm!12169 m!128675))

(assert (=> bm!12169 m!128961))

(declare-fun m!128973 () Bool)

(assert (=> b!113058 m!128973))

(declare-fun m!128975 () Bool)

(assert (=> b!113025 m!128975))

(declare-fun m!128977 () Bool)

(assert (=> b!113061 m!128977))

(declare-fun m!128979 () Bool)

(assert (=> b!113061 m!128979))

(assert (=> b!113061 m!128675))

(declare-fun m!128981 () Bool)

(assert (=> b!113061 m!128981))

(assert (=> b!113061 m!128675))

(declare-fun m!128983 () Bool)

(assert (=> b!113061 m!128983))

(assert (=> bm!12157 m!128675))

(declare-fun m!128985 () Bool)

(assert (=> bm!12157 m!128985))

(declare-fun m!128987 () Bool)

(assert (=> b!113037 m!128987))

(declare-fun m!128989 () Bool)

(assert (=> d!32117 m!128989))

(assert (=> d!32117 m!128697))

(declare-fun m!128991 () Bool)

(assert (=> bm!12166 m!128991))

(declare-fun m!128993 () Bool)

(assert (=> b!113048 m!128993))

(assert (=> bm!12176 m!128979))

(declare-fun m!128995 () Bool)

(assert (=> bm!12176 m!128995))

(assert (=> bm!12164 m!128675))

(declare-fun m!128997 () Bool)

(assert (=> bm!12164 m!128997))

(declare-fun m!128999 () Bool)

(assert (=> b!113036 m!128999))

(declare-fun m!129001 () Bool)

(assert (=> b!113026 m!129001))

(assert (=> bm!12162 m!128671))

(declare-fun m!129003 () Bool)

(assert (=> b!113041 m!129003))

(assert (=> b!113030 m!128675))

(declare-fun m!129005 () Bool)

(assert (=> b!113030 m!129005))

(declare-fun m!129007 () Bool)

(assert (=> b!113029 m!129007))

(assert (=> bm!12158 m!128877))

(assert (=> b!112667 d!32117))

(declare-fun d!32119 () Bool)

(assert (=> d!32119 (= (+!150 (+!150 lt!58328 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (+!150 (+!150 lt!58328 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))

(declare-fun lt!58589 () Unit!3498)

(declare-fun choose!718 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64) V!3257) Unit!3498)

(assert (=> d!32119 (= lt!58589 (choose!718 lt!58328 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32119 (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32119 (= (addCommutativeForDiffKeys!63 lt!58328 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) lt!58589)))

(declare-fun bs!4646 () Bool)

(assert (= bs!4646 d!32119))

(assert (=> bs!4646 m!128675))

(declare-fun m!129009 () Bool)

(assert (=> bs!4646 m!129009))

(declare-fun m!129011 () Bool)

(assert (=> bs!4646 m!129011))

(declare-fun m!129013 () Bool)

(assert (=> bs!4646 m!129013))

(assert (=> bs!4646 m!129011))

(declare-fun m!129015 () Bool)

(assert (=> bs!4646 m!129015))

(assert (=> bs!4646 m!129015))

(declare-fun m!129017 () Bool)

(assert (=> bs!4646 m!129017))

(assert (=> b!112662 d!32119))

(declare-fun d!32121 () Bool)

(declare-fun e!73493 () Bool)

(assert (=> d!32121 e!73493))

(declare-fun res!55744 () Bool)

(assert (=> d!32121 (=> (not res!55744) (not e!73493))))

(declare-fun lt!58601 () ListLongMap!1559)

(assert (=> d!32121 (= res!55744 (contains!834 lt!58601 (_1!1216 lt!58336)))))

(declare-fun lt!58599 () List!1620)

(assert (=> d!32121 (= lt!58601 (ListLongMap!1560 lt!58599))))

(declare-fun lt!58598 () Unit!3498)

(declare-fun lt!58600 () Unit!3498)

(assert (=> d!32121 (= lt!58598 lt!58600)))

(assert (=> d!32121 (= (getValueByKey!161 lt!58599 (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336)))))

(declare-fun lemmaContainsTupThenGetReturnValue!77 (List!1620 (_ BitVec 64) V!3257) Unit!3498)

(assert (=> d!32121 (= lt!58600 (lemmaContainsTupThenGetReturnValue!77 lt!58599 (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(declare-fun insertStrictlySorted!80 (List!1620 (_ BitVec 64) V!3257) List!1620)

(assert (=> d!32121 (= lt!58599 (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(assert (=> d!32121 (= (+!150 lt!58328 lt!58336) lt!58601)))

(declare-fun b!113066 () Bool)

(declare-fun res!55743 () Bool)

(assert (=> b!113066 (=> (not res!55743) (not e!73493))))

(assert (=> b!113066 (= res!55743 (= (getValueByKey!161 (toList!795 lt!58601) (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336))))))

(declare-fun b!113067 () Bool)

(declare-fun contains!836 (List!1620 tuple2!2410) Bool)

(assert (=> b!113067 (= e!73493 (contains!836 (toList!795 lt!58601) lt!58336))))

(assert (= (and d!32121 res!55744) b!113066))

(assert (= (and b!113066 res!55743) b!113067))

(declare-fun m!129019 () Bool)

(assert (=> d!32121 m!129019))

(declare-fun m!129021 () Bool)

(assert (=> d!32121 m!129021))

(declare-fun m!129023 () Bool)

(assert (=> d!32121 m!129023))

(declare-fun m!129025 () Bool)

(assert (=> d!32121 m!129025))

(declare-fun m!129027 () Bool)

(assert (=> b!113066 m!129027))

(declare-fun m!129029 () Bool)

(assert (=> b!113067 m!129029))

(assert (=> b!112662 d!32121))

(declare-fun b!113092 () Bool)

(declare-fun e!73511 () ListLongMap!1559)

(declare-fun e!73513 () ListLongMap!1559)

(assert (=> b!113092 (= e!73511 e!73513)))

(declare-fun c!20233 () Bool)

(assert (=> b!113092 (= c!20233 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113093 () Bool)

(assert (=> b!113093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!113093 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun lt!58621 () ListLongMap!1559)

(declare-fun e!73509 () Bool)

(assert (=> b!113093 (= e!73509 (= (apply!102 lt!58621 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!12181 () Bool)

(declare-fun call!12184 () ListLongMap!1559)

(assert (=> bm!12181 (= call!12184 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113094 () Bool)

(declare-fun e!73510 () Bool)

(declare-fun e!73514 () Bool)

(assert (=> b!113094 (= e!73510 e!73514)))

(declare-fun c!20236 () Bool)

(assert (=> b!113094 (= c!20236 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113095 () Bool)

(assert (=> b!113095 (= e!73514 (= lt!58621 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113096 () Bool)

(declare-fun e!73512 () Bool)

(assert (=> b!113096 (= e!73512 e!73510)))

(declare-fun c!20235 () Bool)

(declare-fun e!73508 () Bool)

(assert (=> b!113096 (= c!20235 e!73508)))

(declare-fun res!55754 () Bool)

(assert (=> b!113096 (=> (not res!55754) (not e!73508))))

(assert (=> b!113096 (= res!55754 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113097 () Bool)

(assert (=> b!113097 (= e!73511 (ListLongMap!1560 Nil!1617))))

(declare-fun d!32123 () Bool)

(assert (=> d!32123 e!73512))

(declare-fun res!55753 () Bool)

(assert (=> d!32123 (=> (not res!55753) (not e!73512))))

(assert (=> d!32123 (= res!55753 (not (contains!834 lt!58621 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32123 (= lt!58621 e!73511)))

(declare-fun c!20234 () Bool)

(assert (=> d!32123 (= c!20234 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32123 (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32123 (= (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) lt!58621)))

(declare-fun b!113098 () Bool)

(assert (=> b!113098 (= e!73508 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113098 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!113099 () Bool)

(declare-fun lt!58622 () Unit!3498)

(declare-fun lt!58618 () Unit!3498)

(assert (=> b!113099 (= lt!58622 lt!58618)))

(declare-fun lt!58617 () V!3257)

(declare-fun lt!58619 () ListLongMap!1559)

(declare-fun lt!58620 () (_ BitVec 64))

(declare-fun lt!58616 () (_ BitVec 64))

(assert (=> b!113099 (not (contains!834 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617)) lt!58616))))

(declare-fun addStillNotContains!52 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> b!113099 (= lt!58618 (addStillNotContains!52 lt!58619 lt!58620 lt!58617 lt!58616))))

(assert (=> b!113099 (= lt!58616 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!113099 (= lt!58617 (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113099 (= lt!58620 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!113099 (= lt!58619 call!12184)))

(assert (=> b!113099 (= e!73513 (+!150 call!12184 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!113100 () Bool)

(assert (=> b!113100 (= e!73513 call!12184)))

(declare-fun b!113101 () Bool)

(declare-fun isEmpty!388 (ListLongMap!1559) Bool)

(assert (=> b!113101 (= e!73514 (isEmpty!388 lt!58621))))

(declare-fun b!113102 () Bool)

(assert (=> b!113102 (= e!73510 e!73509)))

(assert (=> b!113102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun res!55755 () Bool)

(assert (=> b!113102 (= res!55755 (contains!834 lt!58621 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113102 (=> (not res!55755) (not e!73509))))

(declare-fun b!113103 () Bool)

(declare-fun res!55756 () Bool)

(assert (=> b!113103 (=> (not res!55756) (not e!73512))))

(assert (=> b!113103 (= res!55756 (not (contains!834 lt!58621 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32123 c!20234) b!113097))

(assert (= (and d!32123 (not c!20234)) b!113092))

(assert (= (and b!113092 c!20233) b!113099))

(assert (= (and b!113092 (not c!20233)) b!113100))

(assert (= (or b!113099 b!113100) bm!12181))

(assert (= (and d!32123 res!55753) b!113103))

(assert (= (and b!113103 res!55756) b!113096))

(assert (= (and b!113096 res!55754) b!113098))

(assert (= (and b!113096 c!20235) b!113102))

(assert (= (and b!113096 (not c!20235)) b!113094))

(assert (= (and b!113102 res!55755) b!113093))

(assert (= (and b!113094 c!20236) b!113095))

(assert (= (and b!113094 (not c!20236)) b!113101))

(declare-fun b_lambda!5061 () Bool)

(assert (=> (not b_lambda!5061) (not b!113093)))

(assert (=> b!113093 t!5782))

(declare-fun b_and!6945 () Bool)

(assert (= b_and!6941 (and (=> t!5782 result!3565) b_and!6945)))

(assert (=> b!113093 t!5784))

(declare-fun b_and!6947 () Bool)

(assert (= b_and!6943 (and (=> t!5784 result!3569) b_and!6947)))

(declare-fun b_lambda!5063 () Bool)

(assert (=> (not b_lambda!5063) (not b!113099)))

(assert (=> b!113099 t!5782))

(declare-fun b_and!6949 () Bool)

(assert (= b_and!6945 (and (=> t!5782 result!3565) b_and!6949)))

(assert (=> b!113099 t!5784))

(declare-fun b_and!6951 () Bool)

(assert (= b_and!6947 (and (=> t!5784 result!3569) b_and!6951)))

(assert (=> b!113098 m!128879))

(assert (=> b!113098 m!128879))

(assert (=> b!113098 m!128885))

(declare-fun m!129031 () Bool)

(assert (=> b!113101 m!129031))

(declare-fun m!129033 () Bool)

(assert (=> bm!12181 m!129033))

(assert (=> b!113099 m!128679))

(declare-fun m!129035 () Bool)

(assert (=> b!113099 m!129035))

(declare-fun m!129037 () Bool)

(assert (=> b!113099 m!129037))

(assert (=> b!113099 m!128879))

(assert (=> b!113099 m!129035))

(declare-fun m!129039 () Bool)

(assert (=> b!113099 m!129039))

(assert (=> b!113099 m!128927))

(assert (=> b!113099 m!128927))

(assert (=> b!113099 m!128679))

(assert (=> b!113099 m!128929))

(declare-fun m!129041 () Bool)

(assert (=> b!113099 m!129041))

(declare-fun m!129043 () Bool)

(assert (=> d!32123 m!129043))

(assert (=> d!32123 m!128709))

(assert (=> b!113102 m!128879))

(assert (=> b!113102 m!128879))

(declare-fun m!129045 () Bool)

(assert (=> b!113102 m!129045))

(declare-fun m!129047 () Bool)

(assert (=> b!113103 m!129047))

(assert (=> b!113092 m!128879))

(assert (=> b!113092 m!128879))

(assert (=> b!113092 m!128885))

(assert (=> b!113095 m!129033))

(assert (=> b!113093 m!128679))

(assert (=> b!113093 m!128879))

(assert (=> b!113093 m!128879))

(declare-fun m!129049 () Bool)

(assert (=> b!113093 m!129049))

(assert (=> b!113093 m!128927))

(assert (=> b!113093 m!128927))

(assert (=> b!113093 m!128679))

(assert (=> b!113093 m!128929))

(assert (=> b!112662 d!32123))

(declare-fun d!32125 () Bool)

(declare-fun e!73515 () Bool)

(assert (=> d!32125 e!73515))

(declare-fun res!55758 () Bool)

(assert (=> d!32125 (=> (not res!55758) (not e!73515))))

(declare-fun lt!58626 () ListLongMap!1559)

(assert (=> d!32125 (= res!55758 (contains!834 lt!58626 (_1!1216 lt!58330)))))

(declare-fun lt!58624 () List!1620)

(assert (=> d!32125 (= lt!58626 (ListLongMap!1560 lt!58624))))

(declare-fun lt!58623 () Unit!3498)

(declare-fun lt!58625 () Unit!3498)

(assert (=> d!32125 (= lt!58623 lt!58625)))

(assert (=> d!32125 (= (getValueByKey!161 lt!58624 (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330)))))

(assert (=> d!32125 (= lt!58625 (lemmaContainsTupThenGetReturnValue!77 lt!58624 (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(assert (=> d!32125 (= lt!58624 (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(assert (=> d!32125 (= (+!150 lt!58328 lt!58330) lt!58626)))

(declare-fun b!113104 () Bool)

(declare-fun res!55757 () Bool)

(assert (=> b!113104 (=> (not res!55757) (not e!73515))))

(assert (=> b!113104 (= res!55757 (= (getValueByKey!161 (toList!795 lt!58626) (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330))))))

(declare-fun b!113105 () Bool)

(assert (=> b!113105 (= e!73515 (contains!836 (toList!795 lt!58626) lt!58330))))

(assert (= (and d!32125 res!55758) b!113104))

(assert (= (and b!113104 res!55757) b!113105))

(declare-fun m!129051 () Bool)

(assert (=> d!32125 m!129051))

(declare-fun m!129053 () Bool)

(assert (=> d!32125 m!129053))

(declare-fun m!129055 () Bool)

(assert (=> d!32125 m!129055))

(declare-fun m!129057 () Bool)

(assert (=> d!32125 m!129057))

(declare-fun m!129059 () Bool)

(assert (=> b!113104 m!129059))

(declare-fun m!129061 () Bool)

(assert (=> b!113105 m!129061))

(assert (=> b!112662 d!32125))

(declare-fun d!32127 () Bool)

(declare-fun e!73516 () Bool)

(assert (=> d!32127 e!73516))

(declare-fun res!55760 () Bool)

(assert (=> d!32127 (=> (not res!55760) (not e!73516))))

(declare-fun lt!58630 () ListLongMap!1559)

(assert (=> d!32127 (= res!55760 (contains!834 lt!58630 (_1!1216 lt!58336)))))

(declare-fun lt!58628 () List!1620)

(assert (=> d!32127 (= lt!58630 (ListLongMap!1560 lt!58628))))

(declare-fun lt!58627 () Unit!3498)

(declare-fun lt!58629 () Unit!3498)

(assert (=> d!32127 (= lt!58627 lt!58629)))

(assert (=> d!32127 (= (getValueByKey!161 lt!58628 (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336)))))

(assert (=> d!32127 (= lt!58629 (lemmaContainsTupThenGetReturnValue!77 lt!58628 (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(assert (=> d!32127 (= lt!58628 (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 lt!58330)) (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(assert (=> d!32127 (= (+!150 (+!150 lt!58328 lt!58330) lt!58336) lt!58630)))

(declare-fun b!113106 () Bool)

(declare-fun res!55759 () Bool)

(assert (=> b!113106 (=> (not res!55759) (not e!73516))))

(assert (=> b!113106 (= res!55759 (= (getValueByKey!161 (toList!795 lt!58630) (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336))))))

(declare-fun b!113107 () Bool)

(assert (=> b!113107 (= e!73516 (contains!836 (toList!795 lt!58630) lt!58336))))

(assert (= (and d!32127 res!55760) b!113106))

(assert (= (and b!113106 res!55759) b!113107))

(declare-fun m!129063 () Bool)

(assert (=> d!32127 m!129063))

(declare-fun m!129065 () Bool)

(assert (=> d!32127 m!129065))

(declare-fun m!129067 () Bool)

(assert (=> d!32127 m!129067))

(declare-fun m!129069 () Bool)

(assert (=> d!32127 m!129069))

(declare-fun m!129071 () Bool)

(assert (=> b!113106 m!129071))

(declare-fun m!129073 () Bool)

(assert (=> b!113107 m!129073))

(assert (=> b!112662 d!32127))

(declare-fun d!32129 () Bool)

(assert (=> d!32129 (= (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992)))) (and (or (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000001111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000011111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000001111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000011111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000001111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000011111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000001111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000011111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000000111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000001111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000011111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000000111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000001111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000011111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000000111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000001111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000011111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000000111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000001111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000011111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00000111111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00001111111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00011111111111111111111111111111) (= (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6844 (v!2959 (underlying!376 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!112662 d!32129))

(declare-fun d!32131 () Bool)

(declare-fun e!73517 () Bool)

(assert (=> d!32131 e!73517))

(declare-fun res!55762 () Bool)

(assert (=> d!32131 (=> (not res!55762) (not e!73517))))

(declare-fun lt!58634 () ListLongMap!1559)

(assert (=> d!32131 (= res!55762 (contains!834 lt!58634 (_1!1216 lt!58330)))))

(declare-fun lt!58632 () List!1620)

(assert (=> d!32131 (= lt!58634 (ListLongMap!1560 lt!58632))))

(declare-fun lt!58631 () Unit!3498)

(declare-fun lt!58633 () Unit!3498)

(assert (=> d!32131 (= lt!58631 lt!58633)))

(assert (=> d!32131 (= (getValueByKey!161 lt!58632 (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330)))))

(assert (=> d!32131 (= lt!58633 (lemmaContainsTupThenGetReturnValue!77 lt!58632 (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(assert (=> d!32131 (= lt!58632 (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 lt!58336)) (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(assert (=> d!32131 (= (+!150 (+!150 lt!58328 lt!58336) lt!58330) lt!58634)))

(declare-fun b!113108 () Bool)

(declare-fun res!55761 () Bool)

(assert (=> b!113108 (=> (not res!55761) (not e!73517))))

(assert (=> b!113108 (= res!55761 (= (getValueByKey!161 (toList!795 lt!58634) (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330))))))

(declare-fun b!113109 () Bool)

(assert (=> b!113109 (= e!73517 (contains!836 (toList!795 lt!58634) lt!58330))))

(assert (= (and d!32131 res!55762) b!113108))

(assert (= (and b!113108 res!55761) b!113109))

(declare-fun m!129075 () Bool)

(assert (=> d!32131 m!129075))

(declare-fun m!129077 () Bool)

(assert (=> d!32131 m!129077))

(declare-fun m!129079 () Bool)

(assert (=> d!32131 m!129079))

(declare-fun m!129081 () Bool)

(assert (=> d!32131 m!129081))

(declare-fun m!129083 () Bool)

(assert (=> b!113108 m!129083))

(declare-fun m!129085 () Bool)

(assert (=> b!113109 m!129085))

(assert (=> b!112662 d!32131))

(declare-fun d!32133 () Bool)

(assert (=> d!32133 (= (array_inv!1293 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvsge (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112672 d!32133))

(declare-fun d!32135 () Bool)

(assert (=> d!32135 (= (array_inv!1294 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvsge (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!112672 d!32135))

(declare-fun d!32137 () Bool)

(declare-fun c!20239 () Bool)

(assert (=> d!32137 (= c!20239 ((_ is ValueCellFull!1010) (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73520 () V!3257)

(assert (=> d!32137 (= (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73520)))

(declare-fun b!113114 () Bool)

(declare-fun get!1368 (ValueCell!1010 V!3257) V!3257)

(assert (=> b!113114 (= e!73520 (get!1368 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113115 () Bool)

(declare-fun get!1369 (ValueCell!1010 V!3257) V!3257)

(assert (=> b!113115 (= e!73520 (get!1369 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32137 c!20239) b!113114))

(assert (= (and d!32137 (not c!20239)) b!113115))

(assert (=> b!113114 m!128677))

(assert (=> b!113114 m!128679))

(declare-fun m!129087 () Bool)

(assert (=> b!113114 m!129087))

(assert (=> b!113115 m!128677))

(assert (=> b!113115 m!128679))

(declare-fun m!129089 () Bool)

(assert (=> b!113115 m!129089))

(assert (=> b!112668 d!32137))

(declare-fun mapNonEmpty!4059 () Bool)

(declare-fun mapRes!4059 () Bool)

(declare-fun tp!10125 () Bool)

(declare-fun e!73525 () Bool)

(assert (=> mapNonEmpty!4059 (= mapRes!4059 (and tp!10125 e!73525))))

(declare-fun mapValue!4059 () ValueCell!1010)

(declare-fun mapKey!4059 () (_ BitVec 32))

(declare-fun mapRest!4059 () (Array (_ BitVec 32) ValueCell!1010))

(assert (=> mapNonEmpty!4059 (= mapRest!4044 (store mapRest!4059 mapKey!4059 mapValue!4059))))

(declare-fun mapIsEmpty!4059 () Bool)

(assert (=> mapIsEmpty!4059 mapRes!4059))

(declare-fun condMapEmpty!4059 () Bool)

(declare-fun mapDefault!4059 () ValueCell!1010)

(assert (=> mapNonEmpty!4043 (= condMapEmpty!4059 (= mapRest!4044 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4059)))))

(declare-fun e!73526 () Bool)

(assert (=> mapNonEmpty!4043 (= tp!10095 (and e!73526 mapRes!4059))))

(declare-fun b!113122 () Bool)

(assert (=> b!113122 (= e!73525 tp_is_empty!2707)))

(declare-fun b!113123 () Bool)

(assert (=> b!113123 (= e!73526 tp_is_empty!2707)))

(assert (= (and mapNonEmpty!4043 condMapEmpty!4059) mapIsEmpty!4059))

(assert (= (and mapNonEmpty!4043 (not condMapEmpty!4059)) mapNonEmpty!4059))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1010) mapValue!4059)) b!113122))

(assert (= (and mapNonEmpty!4043 ((_ is ValueCellFull!1010) mapDefault!4059)) b!113123))

(declare-fun m!129091 () Bool)

(assert (=> mapNonEmpty!4059 m!129091))

(declare-fun mapNonEmpty!4060 () Bool)

(declare-fun mapRes!4060 () Bool)

(declare-fun tp!10126 () Bool)

(declare-fun e!73527 () Bool)

(assert (=> mapNonEmpty!4060 (= mapRes!4060 (and tp!10126 e!73527))))

(declare-fun mapValue!4060 () ValueCell!1010)

(declare-fun mapKey!4060 () (_ BitVec 32))

(declare-fun mapRest!4060 () (Array (_ BitVec 32) ValueCell!1010))

(assert (=> mapNonEmpty!4060 (= mapRest!4043 (store mapRest!4060 mapKey!4060 mapValue!4060))))

(declare-fun mapIsEmpty!4060 () Bool)

(assert (=> mapIsEmpty!4060 mapRes!4060))

(declare-fun condMapEmpty!4060 () Bool)

(declare-fun mapDefault!4060 () ValueCell!1010)

(assert (=> mapNonEmpty!4044 (= condMapEmpty!4060 (= mapRest!4043 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4060)))))

(declare-fun e!73528 () Bool)

(assert (=> mapNonEmpty!4044 (= tp!10096 (and e!73528 mapRes!4060))))

(declare-fun b!113124 () Bool)

(assert (=> b!113124 (= e!73527 tp_is_empty!2707)))

(declare-fun b!113125 () Bool)

(assert (=> b!113125 (= e!73528 tp_is_empty!2707)))

(assert (= (and mapNonEmpty!4044 condMapEmpty!4060) mapIsEmpty!4060))

(assert (= (and mapNonEmpty!4044 (not condMapEmpty!4060)) mapNonEmpty!4060))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1010) mapValue!4060)) b!113124))

(assert (= (and mapNonEmpty!4044 ((_ is ValueCellFull!1010) mapDefault!4060)) b!113125))

(declare-fun m!129093 () Bool)

(assert (=> mapNonEmpty!4060 m!129093))

(declare-fun b_lambda!5065 () Bool)

(assert (= b_lambda!5059 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5065)))

(declare-fun b_lambda!5067 () Bool)

(assert (= b_lambda!5061 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5067)))

(declare-fun b_lambda!5069 () Bool)

(assert (= b_lambda!5063 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5069)))

(check-sat (not b!113104) (not b!113105) (not b!113098) (not bm!12158) (not bm!12162) (not b!112939) (not b!113115) (not mapNonEmpty!4060) (not bm!12167) (not d!32095) (not b!113061) (not b!113114) (not b!113101) (not d!32121) (not d!32111) (not bm!12164) (not mapNonEmpty!4059) (not b_lambda!5065) (not b!112895) (not b!112914) tp_is_empty!2707 (not b!112926) (not b!112850) (not d!32115) (not b!113092) b_and!6949 (not bm!12168) (not bm!12106) (not bm!12102) (not b!112921) (not bm!12166) (not bm!12084) (not b!113066) (not b!113106) (not b!113093) (not bm!12170) (not b!112915) (not bm!12157) (not b!112910) (not bm!12169) (not b!113050) (not b!112928) (not b!112837) (not b!113103) (not b!112932) (not d!32105) (not bm!12100) (not b!112824) (not d!32107) (not b!112825) (not b!113102) (not bm!12181) (not b!113058) (not bm!12104) (not b!113048) (not b_next!2581) (not b!113109) (not d!32125) (not b!112929) (not bm!12081) (not bm!12174) (not b!112941) (not b!112912) (not b!113095) (not b_lambda!5069) (not b!112913) (not b!113026) (not b!113099) (not b!113025) b_and!6951 (not b!112896) (not d!32089) (not b!112823) (not b!112852) (not bm!12176) (not b!113107) (not b!113067) (not d!32119) (not b_lambda!5057) (not b!113030) (not b!113108) (not bm!12163) (not b!112840) (not b!112836) (not b_lambda!5067) (not bm!12099) (not d!32127) (not b!112899) (not d!32101) (not d!32117) (not d!32131) (not b_next!2583) (not d!32123) (not d!32103))
(check-sat b_and!6949 b_and!6951 (not b_next!2581) (not b_next!2583))
(get-model)

(declare-fun d!32139 () Bool)

(declare-fun res!55763 () Bool)

(declare-fun e!73529 () Bool)

(assert (=> d!32139 (=> (not res!55763) (not e!73529))))

(assert (=> d!32139 (= res!55763 (simpleValid!78 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32139 (= (valid!442 (v!2959 (underlying!376 thiss!992))) e!73529)))

(declare-fun b!113126 () Bool)

(declare-fun res!55764 () Bool)

(assert (=> b!113126 (=> (not res!55764) (not e!73529))))

(assert (=> b!113126 (= res!55764 (= (arrayCountValidKeys!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))) (_size!513 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113127 () Bool)

(declare-fun res!55765 () Bool)

(assert (=> b!113127 (=> (not res!55765) (not e!73529))))

(assert (=> b!113127 (= res!55765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113128 () Bool)

(assert (=> b!113128 (= e!73529 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 Nil!1616))))

(assert (= (and d!32139 res!55763) b!113126))

(assert (= (and b!113126 res!55764) b!113127))

(assert (= (and b!113127 res!55765) b!113128))

(declare-fun m!129095 () Bool)

(assert (=> d!32139 m!129095))

(declare-fun m!129097 () Bool)

(assert (=> b!113126 m!129097))

(assert (=> b!113127 m!128717))

(assert (=> b!113128 m!128719))

(assert (=> d!32089 d!32139))

(declare-fun d!32141 () Bool)

(declare-fun res!55766 () Bool)

(declare-fun e!73530 () Bool)

(assert (=> d!32141 (=> (not res!55766) (not e!73530))))

(assert (=> d!32141 (= res!55766 (simpleValid!78 (_2!1217 lt!58564)))))

(assert (=> d!32141 (= (valid!442 (_2!1217 lt!58564)) e!73530)))

(declare-fun b!113129 () Bool)

(declare-fun res!55767 () Bool)

(assert (=> b!113129 (=> (not res!55767) (not e!73530))))

(assert (=> b!113129 (= res!55767 (= (arrayCountValidKeys!0 (_keys!4380 (_2!1217 lt!58564)) #b00000000000000000000000000000000 (size!2343 (_keys!4380 (_2!1217 lt!58564)))) (_size!513 (_2!1217 lt!58564))))))

(declare-fun b!113130 () Bool)

(declare-fun res!55768 () Bool)

(assert (=> b!113130 (=> (not res!55768) (not e!73530))))

(assert (=> b!113130 (= res!55768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 (_2!1217 lt!58564)) (mask!6844 (_2!1217 lt!58564))))))

(declare-fun b!113131 () Bool)

(assert (=> b!113131 (= e!73530 (arrayNoDuplicates!0 (_keys!4380 (_2!1217 lt!58564)) #b00000000000000000000000000000000 Nil!1616))))

(assert (= (and d!32141 res!55766) b!113129))

(assert (= (and b!113129 res!55767) b!113130))

(assert (= (and b!113130 res!55768) b!113131))

(declare-fun m!129099 () Bool)

(assert (=> d!32141 m!129099))

(declare-fun m!129101 () Bool)

(assert (=> b!113129 m!129101))

(declare-fun m!129103 () Bool)

(assert (=> b!113130 m!129103))

(declare-fun m!129105 () Bool)

(assert (=> b!113131 m!129105))

(assert (=> d!32117 d!32141))

(assert (=> d!32117 d!32095))

(declare-fun b!113132 () Bool)

(declare-fun e!73532 () Bool)

(declare-fun e!73531 () Bool)

(assert (=> b!113132 (= e!73532 e!73531)))

(declare-fun c!20240 () Bool)

(assert (=> b!113132 (= c!20240 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113133 () Bool)

(declare-fun e!73534 () Bool)

(assert (=> b!113133 (= e!73534 e!73532)))

(declare-fun res!55769 () Bool)

(assert (=> b!113133 (=> (not res!55769) (not e!73532))))

(declare-fun e!73533 () Bool)

(assert (=> b!113133 (= res!55769 (not e!73533))))

(declare-fun res!55771 () Bool)

(assert (=> b!113133 (=> (not res!55771) (not e!73533))))

(assert (=> b!113133 (= res!55771 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!12182 () Bool)

(declare-fun call!12185 () Bool)

(assert (=> bm!12182 (= call!12185 (arrayNoDuplicates!0 (_keys!4380 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20240 (Cons!1615 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000) Nil!1616) Nil!1616)))))

(declare-fun b!113134 () Bool)

(assert (=> b!113134 (= e!73531 call!12185)))

(declare-fun b!113135 () Bool)

(assert (=> b!113135 (= e!73531 call!12185)))

(declare-fun b!113136 () Bool)

(assert (=> b!113136 (= e!73533 (contains!835 Nil!1616 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32143 () Bool)

(declare-fun res!55770 () Bool)

(assert (=> d!32143 (=> res!55770 e!73534)))

(assert (=> d!32143 (= res!55770 (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(assert (=> d!32143 (= (arrayNoDuplicates!0 (_keys!4380 newMap!16) #b00000000000000000000000000000000 Nil!1616) e!73534)))

(assert (= (and d!32143 (not res!55770)) b!113133))

(assert (= (and b!113133 res!55771) b!113136))

(assert (= (and b!113133 res!55769) b!113132))

(assert (= (and b!113132 c!20240) b!113135))

(assert (= (and b!113132 (not c!20240)) b!113134))

(assert (= (or b!113135 b!113134) bm!12182))

(declare-fun m!129107 () Bool)

(assert (=> b!113132 m!129107))

(assert (=> b!113132 m!129107))

(declare-fun m!129109 () Bool)

(assert (=> b!113132 m!129109))

(assert (=> b!113133 m!129107))

(assert (=> b!113133 m!129107))

(assert (=> b!113133 m!129109))

(assert (=> bm!12182 m!129107))

(declare-fun m!129111 () Bool)

(assert (=> bm!12182 m!129111))

(assert (=> b!113136 m!129107))

(assert (=> b!113136 m!129107))

(declare-fun m!129113 () Bool)

(assert (=> b!113136 m!129113))

(assert (=> b!112825 d!32143))

(declare-fun d!32145 () Bool)

(declare-fun lt!58637 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!118 (List!1620) (InoxSet tuple2!2410))

(assert (=> d!32145 (= lt!58637 (select (content!118 (toList!795 lt!58634)) lt!58330))))

(declare-fun e!73539 () Bool)

(assert (=> d!32145 (= lt!58637 e!73539)))

(declare-fun res!55777 () Bool)

(assert (=> d!32145 (=> (not res!55777) (not e!73539))))

(assert (=> d!32145 (= res!55777 ((_ is Cons!1616) (toList!795 lt!58634)))))

(assert (=> d!32145 (= (contains!836 (toList!795 lt!58634) lt!58330) lt!58637)))

(declare-fun b!113141 () Bool)

(declare-fun e!73540 () Bool)

(assert (=> b!113141 (= e!73539 e!73540)))

(declare-fun res!55776 () Bool)

(assert (=> b!113141 (=> res!55776 e!73540)))

(assert (=> b!113141 (= res!55776 (= (h!2216 (toList!795 lt!58634)) lt!58330))))

(declare-fun b!113142 () Bool)

(assert (=> b!113142 (= e!73540 (contains!836 (t!5786 (toList!795 lt!58634)) lt!58330))))

(assert (= (and d!32145 res!55777) b!113141))

(assert (= (and b!113141 (not res!55776)) b!113142))

(declare-fun m!129115 () Bool)

(assert (=> d!32145 m!129115))

(declare-fun m!129117 () Bool)

(assert (=> d!32145 m!129117))

(declare-fun m!129119 () Bool)

(assert (=> b!113142 m!129119))

(assert (=> b!113109 d!32145))

(declare-fun bm!12183 () Bool)

(declare-fun call!12189 () Bool)

(declare-fun lt!58646 () ListLongMap!1559)

(assert (=> bm!12183 (= call!12189 (contains!834 lt!58646 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113143 () Bool)

(declare-fun e!73543 () Bool)

(assert (=> b!113143 (= e!73543 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32147 () Bool)

(declare-fun e!73546 () Bool)

(assert (=> d!32147 e!73546))

(declare-fun res!55784 () Bool)

(assert (=> d!32147 (=> (not res!55784) (not e!73546))))

(assert (=> d!32147 (= res!55784 (or (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))))

(declare-fun lt!58654 () ListLongMap!1559)

(assert (=> d!32147 (= lt!58646 lt!58654)))

(declare-fun lt!58645 () Unit!3498)

(declare-fun e!73553 () Unit!3498)

(assert (=> d!32147 (= lt!58645 e!73553)))

(declare-fun c!20242 () Bool)

(declare-fun e!73547 () Bool)

(assert (=> d!32147 (= c!20242 e!73547)))

(declare-fun res!55783 () Bool)

(assert (=> d!32147 (=> (not res!55783) (not e!73547))))

(assert (=> d!32147 (= res!55783 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun e!73548 () ListLongMap!1559)

(assert (=> d!32147 (= lt!58654 e!73548)))

(declare-fun c!20246 () Bool)

(assert (=> d!32147 (= c!20246 (and (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32147 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32147 (= (getCurrentListMap!479 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58646)))

(declare-fun b!113144 () Bool)

(declare-fun call!12188 () ListLongMap!1559)

(assert (=> b!113144 (= e!73548 (+!150 call!12188 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)))))))

(declare-fun b!113145 () Bool)

(declare-fun e!73541 () ListLongMap!1559)

(declare-fun call!12186 () ListLongMap!1559)

(assert (=> b!113145 (= e!73541 call!12186)))

(declare-fun b!113146 () Bool)

(declare-fun res!55785 () Bool)

(assert (=> b!113146 (=> (not res!55785) (not e!73546))))

(declare-fun e!73545 () Bool)

(assert (=> b!113146 (= res!55785 e!73545)))

(declare-fun c!20244 () Bool)

(assert (=> b!113146 (= c!20244 (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12184 () Bool)

(declare-fun call!12187 () Bool)

(assert (=> bm!12184 (= call!12187 (contains!834 lt!58646 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113147 () Bool)

(declare-fun e!73549 () Bool)

(assert (=> b!113147 (= e!73549 (= (apply!102 lt!58646 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)) (get!1367 (select (arr!2085 (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2344 (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))))))))

(assert (=> b!113147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun bm!12185 () Bool)

(declare-fun call!12192 () ListLongMap!1559)

(assert (=> bm!12185 (= call!12186 call!12192)))

(declare-fun b!113148 () Bool)

(declare-fun e!73552 () Bool)

(declare-fun e!73544 () Bool)

(assert (=> b!113148 (= e!73552 e!73544)))

(declare-fun res!55781 () Bool)

(assert (=> b!113148 (= res!55781 call!12187)))

(assert (=> b!113148 (=> (not res!55781) (not e!73544))))

(declare-fun bm!12186 () Bool)

(declare-fun call!12191 () ListLongMap!1559)

(assert (=> bm!12186 (= call!12191 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113149 () Bool)

(declare-fun call!12190 () ListLongMap!1559)

(assert (=> b!113149 (= e!73541 call!12190)))

(declare-fun b!113150 () Bool)

(assert (=> b!113150 (= e!73546 e!73552)))

(declare-fun c!20243 () Bool)

(assert (=> b!113150 (= c!20243 (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113151 () Bool)

(assert (=> b!113151 (= e!73545 (not call!12189))))

(declare-fun bm!12187 () Bool)

(assert (=> bm!12187 (= call!12190 call!12188)))

(declare-fun c!20245 () Bool)

(declare-fun b!113152 () Bool)

(assert (=> b!113152 (= c!20245 (and (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73550 () ListLongMap!1559)

(assert (=> b!113152 (= e!73550 e!73541)))

(declare-fun b!113153 () Bool)

(declare-fun Unit!3511 () Unit!3498)

(assert (=> b!113153 (= e!73553 Unit!3511)))

(declare-fun b!113154 () Bool)

(assert (=> b!113154 (= e!73552 (not call!12187))))

(declare-fun b!113155 () Bool)

(declare-fun res!55780 () Bool)

(assert (=> b!113155 (=> (not res!55780) (not e!73546))))

(declare-fun e!73551 () Bool)

(assert (=> b!113155 (= res!55780 e!73551)))

(declare-fun res!55782 () Bool)

(assert (=> b!113155 (=> res!55782 e!73551)))

(assert (=> b!113155 (= res!55782 (not e!73543))))

(declare-fun res!55786 () Bool)

(assert (=> b!113155 (=> (not res!55786) (not e!73543))))

(assert (=> b!113155 (= res!55786 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun c!20241 () Bool)

(declare-fun bm!12188 () Bool)

(assert (=> bm!12188 (= call!12188 (+!150 (ite c!20246 call!12191 (ite c!20241 call!12192 call!12186)) (ite (or c!20246 c!20241) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16))))))))

(declare-fun b!113156 () Bool)

(assert (=> b!113156 (= e!73550 call!12190)))

(declare-fun b!113157 () Bool)

(declare-fun e!73542 () Bool)

(assert (=> b!113157 (= e!73545 e!73542)))

(declare-fun res!55778 () Bool)

(assert (=> b!113157 (= res!55778 call!12189)))

(assert (=> b!113157 (=> (not res!55778) (not e!73542))))

(declare-fun bm!12189 () Bool)

(assert (=> bm!12189 (= call!12192 call!12191)))

(declare-fun b!113158 () Bool)

(assert (=> b!113158 (= e!73544 (= (apply!102 lt!58646 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16))))))

(declare-fun b!113159 () Bool)

(assert (=> b!113159 (= e!73548 e!73550)))

(assert (=> b!113159 (= c!20241 (and (not (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113160 () Bool)

(assert (=> b!113160 (= e!73542 (= (apply!102 lt!58646 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16))))))

(declare-fun b!113161 () Bool)

(declare-fun lt!58656 () Unit!3498)

(assert (=> b!113161 (= e!73553 lt!58656)))

(declare-fun lt!58649 () ListLongMap!1559)

(assert (=> b!113161 (= lt!58649 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58653 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58658 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58658 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58643 () Unit!3498)

(assert (=> b!113161 (= lt!58643 (addStillContains!78 lt!58649 lt!58653 (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) lt!58658))))

(assert (=> b!113161 (contains!834 (+!150 lt!58649 (tuple2!2411 lt!58653 (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)))) lt!58658)))

(declare-fun lt!58651 () Unit!3498)

(assert (=> b!113161 (= lt!58651 lt!58643)))

(declare-fun lt!58657 () ListLongMap!1559)

(assert (=> b!113161 (= lt!58657 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58655 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58655 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58648 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58648 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58644 () Unit!3498)

(assert (=> b!113161 (= lt!58644 (addApplyDifferent!78 lt!58657 lt!58655 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) lt!58648))))

(assert (=> b!113161 (= (apply!102 (+!150 lt!58657 (tuple2!2411 lt!58655 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)))) lt!58648) (apply!102 lt!58657 lt!58648))))

(declare-fun lt!58642 () Unit!3498)

(assert (=> b!113161 (= lt!58642 lt!58644)))

(declare-fun lt!58647 () ListLongMap!1559)

(assert (=> b!113161 (= lt!58647 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58639 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58639 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58641 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58641 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58652 () Unit!3498)

(assert (=> b!113161 (= lt!58652 (addApplyDifferent!78 lt!58647 lt!58639 (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) lt!58641))))

(assert (=> b!113161 (= (apply!102 (+!150 lt!58647 (tuple2!2411 lt!58639 (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)))) lt!58641) (apply!102 lt!58647 lt!58641))))

(declare-fun lt!58650 () Unit!3498)

(assert (=> b!113161 (= lt!58650 lt!58652)))

(declare-fun lt!58659 () ListLongMap!1559)

(assert (=> b!113161 (= lt!58659 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (ite (or c!20216 c!20224) (_values!2643 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16)))) (mask!6844 newMap!16) (ite c!20216 (ite c!20214 lt!58578 lt!58586) (extraKeys!2451 newMap!16)) (ite (and c!20216 c!20214) lt!58327 (zeroValue!2528 newMap!16)) (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58638 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58638 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58640 () (_ BitVec 64))

(assert (=> b!113161 (= lt!58640 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113161 (= lt!58656 (addApplyDifferent!78 lt!58659 lt!58638 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)) lt!58640))))

(assert (=> b!113161 (= (apply!102 (+!150 lt!58659 (tuple2!2411 lt!58638 (ite c!20216 (ite c!20214 (minValue!2528 newMap!16) lt!58327) (minValue!2528 newMap!16)))) lt!58640) (apply!102 lt!58659 lt!58640))))

(declare-fun b!113162 () Bool)

(assert (=> b!113162 (= e!73551 e!73549)))

(declare-fun res!55779 () Bool)

(assert (=> b!113162 (=> (not res!55779) (not e!73549))))

(assert (=> b!113162 (= res!55779 (contains!834 lt!58646 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun b!113163 () Bool)

(assert (=> b!113163 (= e!73547 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32147 c!20246) b!113144))

(assert (= (and d!32147 (not c!20246)) b!113159))

(assert (= (and b!113159 c!20241) b!113156))

(assert (= (and b!113159 (not c!20241)) b!113152))

(assert (= (and b!113152 c!20245) b!113149))

(assert (= (and b!113152 (not c!20245)) b!113145))

(assert (= (or b!113149 b!113145) bm!12185))

(assert (= (or b!113156 bm!12185) bm!12189))

(assert (= (or b!113156 b!113149) bm!12187))

(assert (= (or b!113144 bm!12189) bm!12186))

(assert (= (or b!113144 bm!12187) bm!12188))

(assert (= (and d!32147 res!55783) b!113163))

(assert (= (and d!32147 c!20242) b!113161))

(assert (= (and d!32147 (not c!20242)) b!113153))

(assert (= (and d!32147 res!55784) b!113155))

(assert (= (and b!113155 res!55786) b!113143))

(assert (= (and b!113155 (not res!55782)) b!113162))

(assert (= (and b!113162 res!55779) b!113147))

(assert (= (and b!113155 res!55780) b!113146))

(assert (= (and b!113146 c!20244) b!113157))

(assert (= (and b!113146 (not c!20244)) b!113151))

(assert (= (and b!113157 res!55778) b!113160))

(assert (= (or b!113157 b!113151) bm!12183))

(assert (= (and b!113146 res!55785) b!113150))

(assert (= (and b!113150 c!20243) b!113148))

(assert (= (and b!113150 (not c!20243)) b!113154))

(assert (= (and b!113148 res!55781) b!113158))

(assert (= (or b!113148 b!113154) bm!12184))

(declare-fun b_lambda!5071 () Bool)

(assert (=> (not b_lambda!5071) (not b!113147)))

(declare-fun t!5798 () Bool)

(declare-fun tb!2141 () Bool)

(assert (=> (and b!112672 (= (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2660 newMap!16)) t!5798) tb!2141))

(declare-fun result!3585 () Bool)

(assert (=> tb!2141 (= result!3585 tp_is_empty!2707)))

(assert (=> b!113147 t!5798))

(declare-fun b_and!6953 () Bool)

(assert (= b_and!6949 (and (=> t!5798 result!3585) b_and!6953)))

(declare-fun t!5800 () Bool)

(declare-fun tb!2143 () Bool)

(assert (=> (and b!112659 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 newMap!16)) t!5800) tb!2143))

(declare-fun result!3587 () Bool)

(assert (= result!3587 result!3585))

(assert (=> b!113147 t!5800))

(declare-fun b_and!6955 () Bool)

(assert (= b_and!6951 (and (=> t!5800 result!3587) b_and!6955)))

(declare-fun m!129121 () Bool)

(assert (=> d!32147 m!129121))

(assert (=> b!113162 m!129107))

(assert (=> b!113162 m!129107))

(declare-fun m!129123 () Bool)

(assert (=> b!113162 m!129123))

(declare-fun m!129125 () Bool)

(assert (=> b!113160 m!129125))

(assert (=> b!113143 m!129107))

(assert (=> b!113143 m!129107))

(assert (=> b!113143 m!129109))

(declare-fun m!129127 () Bool)

(assert (=> bm!12184 m!129127))

(declare-fun m!129129 () Bool)

(assert (=> bm!12186 m!129129))

(declare-fun m!129131 () Bool)

(assert (=> b!113161 m!129131))

(declare-fun m!129133 () Bool)

(assert (=> b!113161 m!129133))

(declare-fun m!129135 () Bool)

(assert (=> b!113161 m!129135))

(assert (=> b!113161 m!129129))

(declare-fun m!129137 () Bool)

(assert (=> b!113161 m!129137))

(declare-fun m!129139 () Bool)

(assert (=> b!113161 m!129139))

(declare-fun m!129141 () Bool)

(assert (=> b!113161 m!129141))

(declare-fun m!129143 () Bool)

(assert (=> b!113161 m!129143))

(assert (=> b!113161 m!129131))

(assert (=> b!113161 m!129107))

(declare-fun m!129145 () Bool)

(assert (=> b!113161 m!129145))

(declare-fun m!129147 () Bool)

(assert (=> b!113161 m!129147))

(assert (=> b!113161 m!129145))

(declare-fun m!129149 () Bool)

(assert (=> b!113161 m!129149))

(declare-fun m!129151 () Bool)

(assert (=> b!113161 m!129151))

(declare-fun m!129153 () Bool)

(assert (=> b!113161 m!129153))

(assert (=> b!113161 m!129151))

(declare-fun m!129155 () Bool)

(assert (=> b!113161 m!129155))

(declare-fun m!129157 () Bool)

(assert (=> b!113161 m!129157))

(declare-fun m!129159 () Bool)

(assert (=> b!113161 m!129159))

(assert (=> b!113161 m!129157))

(declare-fun m!129161 () Bool)

(assert (=> b!113144 m!129161))

(declare-fun m!129163 () Bool)

(assert (=> bm!12188 m!129163))

(declare-fun m!129165 () Bool)

(assert (=> bm!12183 m!129165))

(assert (=> b!113147 m!129107))

(declare-fun m!129167 () Bool)

(assert (=> b!113147 m!129167))

(declare-fun m!129169 () Bool)

(assert (=> b!113147 m!129169))

(declare-fun m!129171 () Bool)

(assert (=> b!113147 m!129171))

(assert (=> b!113147 m!129169))

(declare-fun m!129173 () Bool)

(assert (=> b!113147 m!129173))

(assert (=> b!113147 m!129107))

(assert (=> b!113147 m!129171))

(declare-fun m!129175 () Bool)

(assert (=> b!113158 m!129175))

(assert (=> b!113163 m!129107))

(assert (=> b!113163 m!129107))

(assert (=> b!113163 m!129109))

(assert (=> bm!12176 d!32147))

(declare-fun d!32149 () Bool)

(declare-fun e!73556 () Bool)

(assert (=> d!32149 e!73556))

(declare-fun res!55789 () Bool)

(assert (=> d!32149 (=> (not res!55789) (not e!73556))))

(assert (=> d!32149 (= res!55789 (and (bvsge (index!3181 lt!58565) #b00000000000000000000000000000000) (bvslt (index!3181 lt!58565) (size!2343 (_keys!4380 newMap!16)))))))

(declare-fun lt!58662 () Unit!3498)

(declare-fun choose!719 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) Int) Unit!3498)

(assert (=> d!32149 (= lt!58662 (choose!719 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32149 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32149 (= (lemmaValidKeyInArrayIsInListMap!111 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (defaultEntry!2660 newMap!16)) lt!58662)))

(declare-fun b!113166 () Bool)

(assert (=> b!113166 (= e!73556 (contains!834 (getCurrentListMap!479 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565))))))

(assert (= (and d!32149 res!55789) b!113166))

(declare-fun m!129177 () Bool)

(assert (=> d!32149 m!129177))

(assert (=> d!32149 m!129121))

(assert (=> b!113166 m!128973))

(assert (=> b!113166 m!128967))

(assert (=> b!113166 m!128973))

(assert (=> b!113166 m!128967))

(declare-fun m!129179 () Bool)

(assert (=> b!113166 m!129179))

(assert (=> b!113061 d!32149))

(declare-fun d!32151 () Bool)

(declare-fun e!73559 () Bool)

(assert (=> d!32151 e!73559))

(declare-fun res!55792 () Bool)

(assert (=> d!32151 (=> (not res!55792) (not e!73559))))

(assert (=> d!32151 (= res!55792 (and (bvsge (index!3181 lt!58565) #b00000000000000000000000000000000) (bvslt (index!3181 lt!58565) (size!2344 (_values!2643 newMap!16)))))))

(declare-fun lt!58665 () Unit!3498)

(declare-fun choose!720 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3498)

(assert (=> d!32151 (= lt!58665 (choose!720 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (defaultEntry!2660 newMap!16)))))

(assert (=> d!32151 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32151 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (index!3181 lt!58565) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (defaultEntry!2660 newMap!16)) lt!58665)))

(declare-fun b!113169 () Bool)

(assert (=> b!113169 (= e!73559 (= (+!150 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (getCurrentListMap!479 (_keys!4380 newMap!16) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (index!3181 lt!58565) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16))))))

(assert (= (and d!32151 res!55792) b!113169))

(assert (=> d!32151 m!128675))

(declare-fun m!129181 () Bool)

(assert (=> d!32151 m!129181))

(assert (=> d!32151 m!129121))

(assert (=> b!113169 m!128877))

(assert (=> b!113169 m!128877))

(declare-fun m!129183 () Bool)

(assert (=> b!113169 m!129183))

(assert (=> b!113169 m!128979))

(declare-fun m!129185 () Bool)

(assert (=> b!113169 m!129185))

(assert (=> b!113061 d!32151))

(declare-fun d!32153 () Bool)

(declare-fun e!73561 () Bool)

(assert (=> d!32153 e!73561))

(declare-fun res!55793 () Bool)

(assert (=> d!32153 (=> res!55793 e!73561)))

(declare-fun lt!58666 () Bool)

(assert (=> d!32153 (= res!55793 (not lt!58666))))

(declare-fun lt!58669 () Bool)

(assert (=> d!32153 (= lt!58666 lt!58669)))

(declare-fun lt!58668 () Unit!3498)

(declare-fun e!73560 () Unit!3498)

(assert (=> d!32153 (= lt!58668 e!73560)))

(declare-fun c!20247 () Bool)

(assert (=> d!32153 (= c!20247 lt!58669)))

(assert (=> d!32153 (= lt!58669 (containsKey!164 (toList!795 call!12176) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32153 (= (contains!834 call!12176 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58666)))

(declare-fun b!113170 () Bool)

(declare-fun lt!58667 () Unit!3498)

(assert (=> b!113170 (= e!73560 lt!58667)))

(assert (=> b!113170 (= lt!58667 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 call!12176) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113170 (isDefined!113 (getValueByKey!161 (toList!795 call!12176) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113171 () Bool)

(declare-fun Unit!3512 () Unit!3498)

(assert (=> b!113171 (= e!73560 Unit!3512)))

(declare-fun b!113172 () Bool)

(assert (=> b!113172 (= e!73561 (isDefined!113 (getValueByKey!161 (toList!795 call!12176) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32153 c!20247) b!113170))

(assert (= (and d!32153 (not c!20247)) b!113171))

(assert (= (and d!32153 (not res!55793)) b!113172))

(assert (=> d!32153 m!128675))

(declare-fun m!129187 () Bool)

(assert (=> d!32153 m!129187))

(assert (=> b!113170 m!128675))

(declare-fun m!129189 () Bool)

(assert (=> b!113170 m!129189))

(assert (=> b!113170 m!128675))

(declare-fun m!129191 () Bool)

(assert (=> b!113170 m!129191))

(assert (=> b!113170 m!129191))

(declare-fun m!129193 () Bool)

(assert (=> b!113170 m!129193))

(assert (=> b!113172 m!128675))

(assert (=> b!113172 m!129191))

(assert (=> b!113172 m!129191))

(assert (=> b!113172 m!129193))

(assert (=> b!113061 d!32153))

(declare-fun bm!12190 () Bool)

(declare-fun call!12196 () Bool)

(declare-fun lt!58678 () ListLongMap!1559)

(assert (=> bm!12190 (= call!12196 (contains!834 lt!58678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113173 () Bool)

(declare-fun e!73564 () Bool)

(assert (=> b!113173 (= e!73564 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32155 () Bool)

(declare-fun e!73567 () Bool)

(assert (=> d!32155 e!73567))

(declare-fun res!55800 () Bool)

(assert (=> d!32155 (=> (not res!55800) (not e!73567))))

(assert (=> d!32155 (= res!55800 (or (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))))

(declare-fun lt!58686 () ListLongMap!1559)

(assert (=> d!32155 (= lt!58678 lt!58686)))

(declare-fun lt!58677 () Unit!3498)

(declare-fun e!73574 () Unit!3498)

(assert (=> d!32155 (= lt!58677 e!73574)))

(declare-fun c!20249 () Bool)

(declare-fun e!73568 () Bool)

(assert (=> d!32155 (= c!20249 e!73568)))

(declare-fun res!55799 () Bool)

(assert (=> d!32155 (=> (not res!55799) (not e!73568))))

(assert (=> d!32155 (= res!55799 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun e!73569 () ListLongMap!1559)

(assert (=> d!32155 (= lt!58686 e!73569)))

(declare-fun c!20253 () Bool)

(assert (=> d!32155 (= c!20253 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32155 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32155 (= (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58678)))

(declare-fun b!113174 () Bool)

(declare-fun call!12195 () ListLongMap!1559)

(assert (=> b!113174 (= e!73569 (+!150 call!12195 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16))))))

(declare-fun b!113175 () Bool)

(declare-fun e!73562 () ListLongMap!1559)

(declare-fun call!12193 () ListLongMap!1559)

(assert (=> b!113175 (= e!73562 call!12193)))

(declare-fun b!113176 () Bool)

(declare-fun res!55801 () Bool)

(assert (=> b!113176 (=> (not res!55801) (not e!73567))))

(declare-fun e!73566 () Bool)

(assert (=> b!113176 (= res!55801 e!73566)))

(declare-fun c!20251 () Bool)

(assert (=> b!113176 (= c!20251 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12191 () Bool)

(declare-fun call!12194 () Bool)

(assert (=> bm!12191 (= call!12194 (contains!834 lt!58678 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113177 () Bool)

(declare-fun e!73570 () Bool)

(assert (=> b!113177 (= e!73570 (= (apply!102 lt!58678 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)) (get!1367 (select (arr!2085 (_values!2643 newMap!16)) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2344 (_values!2643 newMap!16))))))

(assert (=> b!113177 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun bm!12192 () Bool)

(declare-fun call!12199 () ListLongMap!1559)

(assert (=> bm!12192 (= call!12193 call!12199)))

(declare-fun b!113178 () Bool)

(declare-fun e!73573 () Bool)

(declare-fun e!73565 () Bool)

(assert (=> b!113178 (= e!73573 e!73565)))

(declare-fun res!55797 () Bool)

(assert (=> b!113178 (= res!55797 call!12194)))

(assert (=> b!113178 (=> (not res!55797) (not e!73565))))

(declare-fun bm!12193 () Bool)

(declare-fun call!12198 () ListLongMap!1559)

(assert (=> bm!12193 (= call!12198 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113179 () Bool)

(declare-fun call!12197 () ListLongMap!1559)

(assert (=> b!113179 (= e!73562 call!12197)))

(declare-fun b!113180 () Bool)

(assert (=> b!113180 (= e!73567 e!73573)))

(declare-fun c!20250 () Bool)

(assert (=> b!113180 (= c!20250 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113181 () Bool)

(assert (=> b!113181 (= e!73566 (not call!12196))))

(declare-fun bm!12194 () Bool)

(assert (=> bm!12194 (= call!12197 call!12195)))

(declare-fun b!113182 () Bool)

(declare-fun c!20252 () Bool)

(assert (=> b!113182 (= c!20252 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73571 () ListLongMap!1559)

(assert (=> b!113182 (= e!73571 e!73562)))

(declare-fun b!113183 () Bool)

(declare-fun Unit!3513 () Unit!3498)

(assert (=> b!113183 (= e!73574 Unit!3513)))

(declare-fun b!113184 () Bool)

(assert (=> b!113184 (= e!73573 (not call!12194))))

(declare-fun b!113185 () Bool)

(declare-fun res!55796 () Bool)

(assert (=> b!113185 (=> (not res!55796) (not e!73567))))

(declare-fun e!73572 () Bool)

(assert (=> b!113185 (= res!55796 e!73572)))

(declare-fun res!55798 () Bool)

(assert (=> b!113185 (=> res!55798 e!73572)))

(assert (=> b!113185 (= res!55798 (not e!73564))))

(declare-fun res!55802 () Bool)

(assert (=> b!113185 (=> (not res!55802) (not e!73564))))

(assert (=> b!113185 (= res!55802 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun c!20248 () Bool)

(declare-fun bm!12195 () Bool)

(assert (=> bm!12195 (= call!12195 (+!150 (ite c!20253 call!12198 (ite c!20248 call!12199 call!12193)) (ite (or c!20253 c!20248) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16)))))))

(declare-fun b!113186 () Bool)

(assert (=> b!113186 (= e!73571 call!12197)))

(declare-fun b!113187 () Bool)

(declare-fun e!73563 () Bool)

(assert (=> b!113187 (= e!73566 e!73563)))

(declare-fun res!55794 () Bool)

(assert (=> b!113187 (= res!55794 call!12196)))

(assert (=> b!113187 (=> (not res!55794) (not e!73563))))

(declare-fun bm!12196 () Bool)

(assert (=> bm!12196 (= call!12199 call!12198)))

(declare-fun b!113188 () Bool)

(assert (=> b!113188 (= e!73565 (= (apply!102 lt!58678 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 newMap!16)))))

(declare-fun b!113189 () Bool)

(assert (=> b!113189 (= e!73569 e!73571)))

(assert (=> b!113189 (= c!20248 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113190 () Bool)

(assert (=> b!113190 (= e!73563 (= (apply!102 lt!58678 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 newMap!16)))))

(declare-fun b!113191 () Bool)

(declare-fun lt!58688 () Unit!3498)

(assert (=> b!113191 (= e!73574 lt!58688)))

(declare-fun lt!58681 () ListLongMap!1559)

(assert (=> b!113191 (= lt!58681 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58685 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58690 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58690 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58675 () Unit!3498)

(assert (=> b!113191 (= lt!58675 (addStillContains!78 lt!58681 lt!58685 (zeroValue!2528 newMap!16) lt!58690))))

(assert (=> b!113191 (contains!834 (+!150 lt!58681 (tuple2!2411 lt!58685 (zeroValue!2528 newMap!16))) lt!58690)))

(declare-fun lt!58683 () Unit!3498)

(assert (=> b!113191 (= lt!58683 lt!58675)))

(declare-fun lt!58689 () ListLongMap!1559)

(assert (=> b!113191 (= lt!58689 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58687 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58680 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58680 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58676 () Unit!3498)

(assert (=> b!113191 (= lt!58676 (addApplyDifferent!78 lt!58689 lt!58687 (minValue!2528 newMap!16) lt!58680))))

(assert (=> b!113191 (= (apply!102 (+!150 lt!58689 (tuple2!2411 lt!58687 (minValue!2528 newMap!16))) lt!58680) (apply!102 lt!58689 lt!58680))))

(declare-fun lt!58674 () Unit!3498)

(assert (=> b!113191 (= lt!58674 lt!58676)))

(declare-fun lt!58679 () ListLongMap!1559)

(assert (=> b!113191 (= lt!58679 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58671 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58671 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58673 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58673 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58684 () Unit!3498)

(assert (=> b!113191 (= lt!58684 (addApplyDifferent!78 lt!58679 lt!58671 (zeroValue!2528 newMap!16) lt!58673))))

(assert (=> b!113191 (= (apply!102 (+!150 lt!58679 (tuple2!2411 lt!58671 (zeroValue!2528 newMap!16))) lt!58673) (apply!102 lt!58679 lt!58673))))

(declare-fun lt!58682 () Unit!3498)

(assert (=> b!113191 (= lt!58682 lt!58684)))

(declare-fun lt!58691 () ListLongMap!1559)

(assert (=> b!113191 (= lt!58691 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58670 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58670 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58672 () (_ BitVec 64))

(assert (=> b!113191 (= lt!58672 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113191 (= lt!58688 (addApplyDifferent!78 lt!58691 lt!58670 (minValue!2528 newMap!16) lt!58672))))

(assert (=> b!113191 (= (apply!102 (+!150 lt!58691 (tuple2!2411 lt!58670 (minValue!2528 newMap!16))) lt!58672) (apply!102 lt!58691 lt!58672))))

(declare-fun b!113192 () Bool)

(assert (=> b!113192 (= e!73572 e!73570)))

(declare-fun res!55795 () Bool)

(assert (=> b!113192 (=> (not res!55795) (not e!73570))))

(assert (=> b!113192 (= res!55795 (contains!834 lt!58678 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113192 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun b!113193 () Bool)

(assert (=> b!113193 (= e!73568 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32155 c!20253) b!113174))

(assert (= (and d!32155 (not c!20253)) b!113189))

(assert (= (and b!113189 c!20248) b!113186))

(assert (= (and b!113189 (not c!20248)) b!113182))

(assert (= (and b!113182 c!20252) b!113179))

(assert (= (and b!113182 (not c!20252)) b!113175))

(assert (= (or b!113179 b!113175) bm!12192))

(assert (= (or b!113186 bm!12192) bm!12196))

(assert (= (or b!113186 b!113179) bm!12194))

(assert (= (or b!113174 bm!12196) bm!12193))

(assert (= (or b!113174 bm!12194) bm!12195))

(assert (= (and d!32155 res!55799) b!113193))

(assert (= (and d!32155 c!20249) b!113191))

(assert (= (and d!32155 (not c!20249)) b!113183))

(assert (= (and d!32155 res!55800) b!113185))

(assert (= (and b!113185 res!55802) b!113173))

(assert (= (and b!113185 (not res!55798)) b!113192))

(assert (= (and b!113192 res!55795) b!113177))

(assert (= (and b!113185 res!55796) b!113176))

(assert (= (and b!113176 c!20251) b!113187))

(assert (= (and b!113176 (not c!20251)) b!113181))

(assert (= (and b!113187 res!55794) b!113190))

(assert (= (or b!113187 b!113181) bm!12190))

(assert (= (and b!113176 res!55801) b!113180))

(assert (= (and b!113180 c!20250) b!113178))

(assert (= (and b!113180 (not c!20250)) b!113184))

(assert (= (and b!113178 res!55797) b!113188))

(assert (= (or b!113178 b!113184) bm!12191))

(declare-fun b_lambda!5073 () Bool)

(assert (=> (not b_lambda!5073) (not b!113177)))

(assert (=> b!113177 t!5798))

(declare-fun b_and!6957 () Bool)

(assert (= b_and!6953 (and (=> t!5798 result!3585) b_and!6957)))

(assert (=> b!113177 t!5800))

(declare-fun b_and!6959 () Bool)

(assert (= b_and!6955 (and (=> t!5800 result!3587) b_and!6959)))

(assert (=> d!32155 m!129121))

(assert (=> b!113192 m!129107))

(assert (=> b!113192 m!129107))

(declare-fun m!129195 () Bool)

(assert (=> b!113192 m!129195))

(declare-fun m!129197 () Bool)

(assert (=> b!113190 m!129197))

(assert (=> b!113173 m!129107))

(assert (=> b!113173 m!129107))

(assert (=> b!113173 m!129109))

(declare-fun m!129199 () Bool)

(assert (=> bm!12191 m!129199))

(declare-fun m!129201 () Bool)

(assert (=> bm!12193 m!129201))

(declare-fun m!129203 () Bool)

(assert (=> b!113191 m!129203))

(declare-fun m!129205 () Bool)

(assert (=> b!113191 m!129205))

(declare-fun m!129207 () Bool)

(assert (=> b!113191 m!129207))

(assert (=> b!113191 m!129201))

(declare-fun m!129209 () Bool)

(assert (=> b!113191 m!129209))

(declare-fun m!129211 () Bool)

(assert (=> b!113191 m!129211))

(declare-fun m!129213 () Bool)

(assert (=> b!113191 m!129213))

(declare-fun m!129215 () Bool)

(assert (=> b!113191 m!129215))

(assert (=> b!113191 m!129203))

(assert (=> b!113191 m!129107))

(declare-fun m!129217 () Bool)

(assert (=> b!113191 m!129217))

(declare-fun m!129219 () Bool)

(assert (=> b!113191 m!129219))

(assert (=> b!113191 m!129217))

(declare-fun m!129221 () Bool)

(assert (=> b!113191 m!129221))

(declare-fun m!129223 () Bool)

(assert (=> b!113191 m!129223))

(declare-fun m!129225 () Bool)

(assert (=> b!113191 m!129225))

(assert (=> b!113191 m!129223))

(declare-fun m!129227 () Bool)

(assert (=> b!113191 m!129227))

(declare-fun m!129229 () Bool)

(assert (=> b!113191 m!129229))

(declare-fun m!129231 () Bool)

(assert (=> b!113191 m!129231))

(assert (=> b!113191 m!129229))

(declare-fun m!129233 () Bool)

(assert (=> b!113174 m!129233))

(declare-fun m!129235 () Bool)

(assert (=> bm!12195 m!129235))

(declare-fun m!129237 () Bool)

(assert (=> bm!12190 m!129237))

(assert (=> b!113177 m!129107))

(declare-fun m!129239 () Bool)

(assert (=> b!113177 m!129239))

(assert (=> b!113177 m!129169))

(declare-fun m!129241 () Bool)

(assert (=> b!113177 m!129241))

(assert (=> b!113177 m!129169))

(declare-fun m!129243 () Bool)

(assert (=> b!113177 m!129243))

(assert (=> b!113177 m!129107))

(assert (=> b!113177 m!129241))

(declare-fun m!129245 () Bool)

(assert (=> b!113188 m!129245))

(assert (=> b!113193 m!129107))

(assert (=> b!113193 m!129107))

(assert (=> b!113193 m!129109))

(assert (=> d!32101 d!32155))

(declare-fun d!32157 () Bool)

(declare-fun get!1370 (Option!167) V!3257)

(assert (=> d!32157 (= (apply!102 lt!58621 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1370 (getValueByKey!161 (toList!795 lt!58621) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4647 () Bool)

(assert (= bs!4647 d!32157))

(assert (=> bs!4647 m!128879))

(declare-fun m!129247 () Bool)

(assert (=> bs!4647 m!129247))

(assert (=> bs!4647 m!129247))

(declare-fun m!129249 () Bool)

(assert (=> bs!4647 m!129249))

(assert (=> b!113093 d!32157))

(declare-fun d!32159 () Bool)

(declare-fun c!20254 () Bool)

(assert (=> d!32159 (= c!20254 ((_ is ValueCellFull!1010) (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!73575 () V!3257)

(assert (=> d!32159 (= (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!73575)))

(declare-fun b!113194 () Bool)

(assert (=> b!113194 (= e!73575 (get!1368 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113195 () Bool)

(assert (=> b!113195 (= e!73575 (get!1369 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32159 c!20254) b!113194))

(assert (= (and d!32159 (not c!20254)) b!113195))

(assert (=> b!113194 m!128927))

(assert (=> b!113194 m!128679))

(declare-fun m!129251 () Bool)

(assert (=> b!113194 m!129251))

(assert (=> b!113195 m!128927))

(assert (=> b!113195 m!128679))

(declare-fun m!129253 () Bool)

(assert (=> b!113195 m!129253))

(assert (=> b!113093 d!32159))

(declare-fun b!113208 () Bool)

(declare-fun e!73582 () SeekEntryResult!257)

(assert (=> b!113208 (= e!73582 Undefined!257)))

(declare-fun b!113209 () Bool)

(declare-fun c!20261 () Bool)

(declare-fun lt!58698 () (_ BitVec 64))

(assert (=> b!113209 (= c!20261 (= lt!58698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73584 () SeekEntryResult!257)

(declare-fun e!73583 () SeekEntryResult!257)

(assert (=> b!113209 (= e!73584 e!73583)))

(declare-fun lt!58699 () SeekEntryResult!257)

(declare-fun d!32161 () Bool)

(assert (=> d!32161 (and (or ((_ is Undefined!257) lt!58699) (not ((_ is Found!257) lt!58699)) (and (bvsge (index!3181 lt!58699) #b00000000000000000000000000000000) (bvslt (index!3181 lt!58699) (size!2343 (_keys!4380 newMap!16))))) (or ((_ is Undefined!257) lt!58699) ((_ is Found!257) lt!58699) (not ((_ is MissingZero!257) lt!58699)) (and (bvsge (index!3180 lt!58699) #b00000000000000000000000000000000) (bvslt (index!3180 lt!58699) (size!2343 (_keys!4380 newMap!16))))) (or ((_ is Undefined!257) lt!58699) ((_ is Found!257) lt!58699) ((_ is MissingZero!257) lt!58699) (not ((_ is MissingVacant!257) lt!58699)) (and (bvsge (index!3183 lt!58699) #b00000000000000000000000000000000) (bvslt (index!3183 lt!58699) (size!2343 (_keys!4380 newMap!16))))) (or ((_ is Undefined!257) lt!58699) (ite ((_ is Found!257) lt!58699) (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58699)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (ite ((_ is MissingZero!257) lt!58699) (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3180 lt!58699)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!257) lt!58699) (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3183 lt!58699)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32161 (= lt!58699 e!73582)))

(declare-fun c!20263 () Bool)

(declare-fun lt!58700 () SeekEntryResult!257)

(assert (=> d!32161 (= c!20263 (and ((_ is Intermediate!257) lt!58700) (undefined!1069 lt!58700)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4399 (_ BitVec 32)) SeekEntryResult!257)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!32161 (= lt!58700 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (mask!6844 newMap!16)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(assert (=> d!32161 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32161 (= (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)) lt!58699)))

(declare-fun b!113210 () Bool)

(assert (=> b!113210 (= e!73584 (Found!257 (index!3182 lt!58700)))))

(declare-fun b!113211 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4399 (_ BitVec 32)) SeekEntryResult!257)

(assert (=> b!113211 (= e!73583 (seekKeyOrZeroReturnVacant!0 (x!14178 lt!58700) (index!3182 lt!58700) (index!3182 lt!58700) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun b!113212 () Bool)

(assert (=> b!113212 (= e!73582 e!73584)))

(assert (=> b!113212 (= lt!58698 (select (arr!2084 (_keys!4380 newMap!16)) (index!3182 lt!58700)))))

(declare-fun c!20262 () Bool)

(assert (=> b!113212 (= c!20262 (= lt!58698 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113213 () Bool)

(assert (=> b!113213 (= e!73583 (MissingZero!257 (index!3182 lt!58700)))))

(assert (= (and d!32161 c!20263) b!113208))

(assert (= (and d!32161 (not c!20263)) b!113212))

(assert (= (and b!113212 c!20262) b!113210))

(assert (= (and b!113212 (not c!20262)) b!113209))

(assert (= (and b!113209 c!20261) b!113213))

(assert (= (and b!113209 (not c!20261)) b!113211))

(declare-fun m!129255 () Bool)

(assert (=> d!32161 m!129255))

(assert (=> d!32161 m!128675))

(declare-fun m!129257 () Bool)

(assert (=> d!32161 m!129257))

(assert (=> d!32161 m!129257))

(assert (=> d!32161 m!128675))

(declare-fun m!129259 () Bool)

(assert (=> d!32161 m!129259))

(declare-fun m!129261 () Bool)

(assert (=> d!32161 m!129261))

(assert (=> d!32161 m!129121))

(declare-fun m!129263 () Bool)

(assert (=> d!32161 m!129263))

(assert (=> b!113211 m!128675))

(declare-fun m!129265 () Bool)

(assert (=> b!113211 m!129265))

(declare-fun m!129267 () Bool)

(assert (=> b!113212 m!129267))

(assert (=> bm!12169 d!32161))

(declare-fun d!32163 () Bool)

(assert (=> d!32163 (= (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112929 d!32163))

(declare-fun d!32165 () Bool)

(assert (=> d!32165 (= (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113098 d!32165))

(declare-fun d!32167 () Bool)

(declare-fun lt!58701 () Bool)

(assert (=> d!32167 (= lt!58701 (select (content!118 (toList!795 lt!58601)) lt!58336))))

(declare-fun e!73585 () Bool)

(assert (=> d!32167 (= lt!58701 e!73585)))

(declare-fun res!55804 () Bool)

(assert (=> d!32167 (=> (not res!55804) (not e!73585))))

(assert (=> d!32167 (= res!55804 ((_ is Cons!1616) (toList!795 lt!58601)))))

(assert (=> d!32167 (= (contains!836 (toList!795 lt!58601) lt!58336) lt!58701)))

(declare-fun b!113214 () Bool)

(declare-fun e!73586 () Bool)

(assert (=> b!113214 (= e!73585 e!73586)))

(declare-fun res!55803 () Bool)

(assert (=> b!113214 (=> res!55803 e!73586)))

(assert (=> b!113214 (= res!55803 (= (h!2216 (toList!795 lt!58601)) lt!58336))))

(declare-fun b!113215 () Bool)

(assert (=> b!113215 (= e!73586 (contains!836 (t!5786 (toList!795 lt!58601)) lt!58336))))

(assert (= (and d!32167 res!55804) b!113214))

(assert (= (and b!113214 (not res!55803)) b!113215))

(declare-fun m!129269 () Bool)

(assert (=> d!32167 m!129269))

(declare-fun m!129271 () Bool)

(assert (=> d!32167 m!129271))

(declare-fun m!129273 () Bool)

(assert (=> b!113215 m!129273))

(assert (=> b!113067 d!32167))

(declare-fun d!32169 () Bool)

(assert (=> d!32169 (= (get!1368 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2958 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113114 d!32169))

(declare-fun d!32171 () Bool)

(declare-fun e!73588 () Bool)

(assert (=> d!32171 e!73588))

(declare-fun res!55805 () Bool)

(assert (=> d!32171 (=> res!55805 e!73588)))

(declare-fun lt!58702 () Bool)

(assert (=> d!32171 (= res!55805 (not lt!58702))))

(declare-fun lt!58705 () Bool)

(assert (=> d!32171 (= lt!58702 lt!58705)))

(declare-fun lt!58704 () Unit!3498)

(declare-fun e!73587 () Unit!3498)

(assert (=> d!32171 (= lt!58704 e!73587)))

(declare-fun c!20264 () Bool)

(assert (=> d!32171 (= c!20264 lt!58705)))

(assert (=> d!32171 (= lt!58705 (containsKey!164 (toList!795 lt!58621) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32171 (= (contains!834 lt!58621 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58702)))

(declare-fun b!113216 () Bool)

(declare-fun lt!58703 () Unit!3498)

(assert (=> b!113216 (= e!73587 lt!58703)))

(assert (=> b!113216 (= lt!58703 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58621) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113216 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113217 () Bool)

(declare-fun Unit!3514 () Unit!3498)

(assert (=> b!113217 (= e!73587 Unit!3514)))

(declare-fun b!113218 () Bool)

(assert (=> b!113218 (= e!73588 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32171 c!20264) b!113216))

(assert (= (and d!32171 (not c!20264)) b!113217))

(assert (= (and d!32171 (not res!55805)) b!113218))

(assert (=> d!32171 m!128879))

(declare-fun m!129275 () Bool)

(assert (=> d!32171 m!129275))

(assert (=> b!113216 m!128879))

(declare-fun m!129277 () Bool)

(assert (=> b!113216 m!129277))

(assert (=> b!113216 m!128879))

(assert (=> b!113216 m!129247))

(assert (=> b!113216 m!129247))

(declare-fun m!129279 () Bool)

(assert (=> b!113216 m!129279))

(assert (=> b!113218 m!128879))

(assert (=> b!113218 m!129247))

(assert (=> b!113218 m!129247))

(assert (=> b!113218 m!129279))

(assert (=> b!113102 d!32171))

(declare-fun d!32173 () Bool)

(assert (=> d!32173 (= (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!112850 d!32173))

(declare-fun d!32175 () Bool)

(declare-fun e!73589 () Bool)

(assert (=> d!32175 e!73589))

(declare-fun res!55807 () Bool)

(assert (=> d!32175 (=> (not res!55807) (not e!73589))))

(declare-fun lt!58709 () ListLongMap!1559)

(assert (=> d!32175 (= res!55807 (contains!834 lt!58709 (_1!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun lt!58707 () List!1620)

(assert (=> d!32175 (= lt!58709 (ListLongMap!1560 lt!58707))))

(declare-fun lt!58706 () Unit!3498)

(declare-fun lt!58708 () Unit!3498)

(assert (=> d!32175 (= lt!58706 lt!58708)))

(assert (=> d!32175 (= (getValueByKey!161 lt!58707 (_1!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))) (Some!166 (_2!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32175 (= lt!58708 (lemmaContainsTupThenGetReturnValue!77 lt!58707 (_1!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (_2!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32175 (= lt!58707 (insertStrictlySorted!80 (toList!795 (ite c!20178 call!12107 (ite c!20173 call!12108 call!12102))) (_1!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (_2!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(assert (=> d!32175 (= (+!150 (ite c!20178 call!12107 (ite c!20173 call!12108 call!12102)) (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58709)))

(declare-fun b!113219 () Bool)

(declare-fun res!55806 () Bool)

(assert (=> b!113219 (=> (not res!55806) (not e!73589))))

(assert (=> b!113219 (= res!55806 (= (getValueByKey!161 (toList!795 lt!58709) (_1!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))) (Some!166 (_2!1216 (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))))

(declare-fun b!113220 () Bool)

(assert (=> b!113220 (= e!73589 (contains!836 (toList!795 lt!58709) (ite (or c!20178 c!20173) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (= (and d!32175 res!55807) b!113219))

(assert (= (and b!113219 res!55806) b!113220))

(declare-fun m!129281 () Bool)

(assert (=> d!32175 m!129281))

(declare-fun m!129283 () Bool)

(assert (=> d!32175 m!129283))

(declare-fun m!129285 () Bool)

(assert (=> d!32175 m!129285))

(declare-fun m!129287 () Bool)

(assert (=> d!32175 m!129287))

(declare-fun m!129289 () Bool)

(assert (=> b!113219 m!129289))

(declare-fun m!129291 () Bool)

(assert (=> b!113220 m!129291))

(assert (=> bm!12104 d!32175))

(assert (=> d!32103 d!32129))

(declare-fun d!32177 () Bool)

(declare-fun e!73590 () Bool)

(assert (=> d!32177 e!73590))

(declare-fun res!55809 () Bool)

(assert (=> d!32177 (=> (not res!55809) (not e!73590))))

(declare-fun lt!58713 () ListLongMap!1559)

(assert (=> d!32177 (= res!55809 (contains!834 lt!58713 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun lt!58711 () List!1620)

(assert (=> d!32177 (= lt!58713 (ListLongMap!1560 lt!58711))))

(declare-fun lt!58710 () Unit!3498)

(declare-fun lt!58712 () Unit!3498)

(assert (=> d!32177 (= lt!58710 lt!58712)))

(assert (=> d!32177 (= (getValueByKey!161 lt!58711 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32177 (= lt!58712 (lemmaContainsTupThenGetReturnValue!77 lt!58711 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32177 (= lt!58711 (insertStrictlySorted!80 (toList!795 call!12165) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32177 (= (+!150 call!12165 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) lt!58713)))

(declare-fun b!113221 () Bool)

(declare-fun res!55808 () Bool)

(assert (=> b!113221 (=> (not res!55808) (not e!73590))))

(assert (=> b!113221 (= res!55808 (= (getValueByKey!161 (toList!795 lt!58713) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(declare-fun b!113222 () Bool)

(assert (=> b!113222 (= e!73590 (contains!836 (toList!795 lt!58713) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))

(assert (= (and d!32177 res!55809) b!113221))

(assert (= (and b!113221 res!55808) b!113222))

(declare-fun m!129293 () Bool)

(assert (=> d!32177 m!129293))

(declare-fun m!129295 () Bool)

(assert (=> d!32177 m!129295))

(declare-fun m!129297 () Bool)

(assert (=> d!32177 m!129297))

(declare-fun m!129299 () Bool)

(assert (=> d!32177 m!129299))

(declare-fun m!129301 () Bool)

(assert (=> b!113221 m!129301))

(declare-fun m!129303 () Bool)

(assert (=> b!113222 m!129303))

(assert (=> b!113025 d!32177))

(declare-fun d!32179 () Bool)

(declare-fun lt!58716 () Bool)

(declare-fun content!119 (List!1619) (InoxSet (_ BitVec 64)))

(assert (=> d!32179 (= lt!58716 (select (content!119 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73596 () Bool)

(assert (=> d!32179 (= lt!58716 e!73596)))

(declare-fun res!55815 () Bool)

(assert (=> d!32179 (=> (not res!55815) (not e!73596))))

(assert (=> d!32179 (= res!55815 ((_ is Cons!1615) Nil!1616))))

(assert (=> d!32179 (= (contains!835 Nil!1616 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58716)))

(declare-fun b!113227 () Bool)

(declare-fun e!73595 () Bool)

(assert (=> b!113227 (= e!73596 e!73595)))

(declare-fun res!55814 () Bool)

(assert (=> b!113227 (=> res!55814 e!73595)))

(assert (=> b!113227 (= res!55814 (= (h!2215 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113228 () Bool)

(assert (=> b!113228 (= e!73595 (contains!835 (t!5785 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32179 res!55815) b!113227))

(assert (= (and b!113227 (not res!55814)) b!113228))

(declare-fun m!129305 () Bool)

(assert (=> d!32179 m!129305))

(assert (=> d!32179 m!128675))

(declare-fun m!129307 () Bool)

(assert (=> d!32179 m!129307))

(assert (=> b!113228 m!128675))

(declare-fun m!129309 () Bool)

(assert (=> b!113228 m!129309))

(assert (=> b!112932 d!32179))

(declare-fun d!32181 () Bool)

(assert (=> d!32181 (= (apply!102 lt!58471 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1370 (getValueByKey!161 (toList!795 lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4648 () Bool)

(assert (= bs!4648 d!32181))

(declare-fun m!129311 () Bool)

(assert (=> bs!4648 m!129311))

(assert (=> bs!4648 m!129311))

(declare-fun m!129313 () Bool)

(assert (=> bs!4648 m!129313))

(assert (=> b!112910 d!32181))

(declare-fun d!32183 () Bool)

(assert (=> d!32183 (= (+!150 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) lt!58578 lt!58327 (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58719 () Unit!3498)

(declare-fun choose!721 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3498)

(assert (=> d!32183 (= lt!58719 (choose!721 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58578 (zeroValue!2528 newMap!16) lt!58327 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32183 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32183 (= (lemmaChangeZeroKeyThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58578 (zeroValue!2528 newMap!16) lt!58327 (minValue!2528 newMap!16) (defaultEntry!2660 newMap!16)) lt!58719)))

(declare-fun bs!4649 () Bool)

(assert (= bs!4649 d!32183))

(assert (=> bs!4649 m!128877))

(declare-fun m!129315 () Bool)

(assert (=> bs!4649 m!129315))

(assert (=> bs!4649 m!128877))

(declare-fun m!129317 () Bool)

(assert (=> bs!4649 m!129317))

(assert (=> bs!4649 m!129121))

(declare-fun m!129319 () Bool)

(assert (=> bs!4649 m!129319))

(assert (=> b!113026 d!32183))

(declare-fun d!32185 () Bool)

(declare-fun lt!58720 () Bool)

(assert (=> d!32185 (= lt!58720 (select (content!118 (toList!795 lt!58630)) lt!58336))))

(declare-fun e!73597 () Bool)

(assert (=> d!32185 (= lt!58720 e!73597)))

(declare-fun res!55817 () Bool)

(assert (=> d!32185 (=> (not res!55817) (not e!73597))))

(assert (=> d!32185 (= res!55817 ((_ is Cons!1616) (toList!795 lt!58630)))))

(assert (=> d!32185 (= (contains!836 (toList!795 lt!58630) lt!58336) lt!58720)))

(declare-fun b!113229 () Bool)

(declare-fun e!73598 () Bool)

(assert (=> b!113229 (= e!73597 e!73598)))

(declare-fun res!55816 () Bool)

(assert (=> b!113229 (=> res!55816 e!73598)))

(assert (=> b!113229 (= res!55816 (= (h!2216 (toList!795 lt!58630)) lt!58336))))

(declare-fun b!113230 () Bool)

(assert (=> b!113230 (= e!73598 (contains!836 (t!5786 (toList!795 lt!58630)) lt!58336))))

(assert (= (and d!32185 res!55817) b!113229))

(assert (= (and b!113229 (not res!55816)) b!113230))

(declare-fun m!129321 () Bool)

(assert (=> d!32185 m!129321))

(declare-fun m!129323 () Bool)

(assert (=> d!32185 m!129323))

(declare-fun m!129325 () Bool)

(assert (=> b!113230 m!129325))

(assert (=> b!113107 d!32185))

(assert (=> b!112837 d!32173))

(declare-fun d!32187 () Bool)

(declare-fun lt!58721 () Bool)

(assert (=> d!32187 (= lt!58721 (select (content!118 (toList!795 lt!58626)) lt!58330))))

(declare-fun e!73599 () Bool)

(assert (=> d!32187 (= lt!58721 e!73599)))

(declare-fun res!55819 () Bool)

(assert (=> d!32187 (=> (not res!55819) (not e!73599))))

(assert (=> d!32187 (= res!55819 ((_ is Cons!1616) (toList!795 lt!58626)))))

(assert (=> d!32187 (= (contains!836 (toList!795 lt!58626) lt!58330) lt!58721)))

(declare-fun b!113231 () Bool)

(declare-fun e!73600 () Bool)

(assert (=> b!113231 (= e!73599 e!73600)))

(declare-fun res!55818 () Bool)

(assert (=> b!113231 (=> res!55818 e!73600)))

(assert (=> b!113231 (= res!55818 (= (h!2216 (toList!795 lt!58626)) lt!58330))))

(declare-fun b!113232 () Bool)

(assert (=> b!113232 (= e!73600 (contains!836 (t!5786 (toList!795 lt!58626)) lt!58330))))

(assert (= (and d!32187 res!55819) b!113231))

(assert (= (and b!113231 (not res!55818)) b!113232))

(declare-fun m!129327 () Bool)

(assert (=> d!32187 m!129327))

(declare-fun m!129329 () Bool)

(assert (=> d!32187 m!129329))

(declare-fun m!129331 () Bool)

(assert (=> b!113232 m!129331))

(assert (=> b!113105 d!32187))

(declare-fun d!32189 () Bool)

(assert (=> d!32189 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000)))

(declare-fun lt!58724 () Unit!3498)

(declare-fun choose!13 (array!4399 (_ BitVec 64) (_ BitVec 32)) Unit!3498)

(assert (=> d!32189 (= lt!58724 (choose!13 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000))))

(assert (=> d!32189 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!32189 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000) lt!58724)))

(declare-fun bs!4650 () Bool)

(assert (= bs!4650 d!32189))

(assert (=> bs!4650 m!128871))

(declare-fun m!129333 () Bool)

(assert (=> bs!4650 m!129333))

(assert (=> b!112852 d!32189))

(declare-fun d!32191 () Bool)

(declare-fun res!55820 () Bool)

(declare-fun e!73601 () Bool)

(assert (=> d!32191 (=> res!55820 e!73601)))

(assert (=> d!32191 (= res!55820 (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) lt!58418))))

(assert (=> d!32191 (= (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 #b00000000000000000000000000000000) e!73601)))

(declare-fun b!113233 () Bool)

(declare-fun e!73602 () Bool)

(assert (=> b!113233 (= e!73601 e!73602)))

(declare-fun res!55821 () Bool)

(assert (=> b!113233 (=> (not res!55821) (not e!73602))))

(assert (=> b!113233 (= res!55821 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113234 () Bool)

(assert (=> b!113234 (= e!73602 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58418 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32191 (not res!55820)) b!113233))

(assert (= (and b!113233 res!55821) b!113234))

(assert (=> d!32191 m!128861))

(declare-fun m!129335 () Bool)

(assert (=> b!113234 m!129335))

(assert (=> b!112852 d!32191))

(declare-fun b!113235 () Bool)

(declare-fun e!73603 () SeekEntryResult!257)

(assert (=> b!113235 (= e!73603 Undefined!257)))

(declare-fun b!113236 () Bool)

(declare-fun c!20265 () Bool)

(declare-fun lt!58725 () (_ BitVec 64))

(assert (=> b!113236 (= c!20265 (= lt!58725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!73605 () SeekEntryResult!257)

(declare-fun e!73604 () SeekEntryResult!257)

(assert (=> b!113236 (= e!73605 e!73604)))

(declare-fun d!32193 () Bool)

(declare-fun lt!58726 () SeekEntryResult!257)

(assert (=> d!32193 (and (or ((_ is Undefined!257) lt!58726) (not ((_ is Found!257) lt!58726)) (and (bvsge (index!3181 lt!58726) #b00000000000000000000000000000000) (bvslt (index!3181 lt!58726) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!257) lt!58726) ((_ is Found!257) lt!58726) (not ((_ is MissingZero!257) lt!58726)) (and (bvsge (index!3180 lt!58726) #b00000000000000000000000000000000) (bvslt (index!3180 lt!58726) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!257) lt!58726) ((_ is Found!257) lt!58726) ((_ is MissingZero!257) lt!58726) (not ((_ is MissingVacant!257) lt!58726)) (and (bvsge (index!3183 lt!58726) #b00000000000000000000000000000000) (bvslt (index!3183 lt!58726) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))) (or ((_ is Undefined!257) lt!58726) (ite ((_ is Found!257) lt!58726) (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (index!3181 lt!58726)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!257) lt!58726) (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (index!3180 lt!58726)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!257) lt!58726) (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (index!3183 lt!58726)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32193 (= lt!58726 e!73603)))

(declare-fun c!20267 () Bool)

(declare-fun lt!58727 () SeekEntryResult!257)

(assert (=> d!32193 (= c!20267 (and ((_ is Intermediate!257) lt!58727) (undefined!1069 lt!58727)))))

(assert (=> d!32193 (= lt!58727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (mask!6844 (v!2959 (underlying!376 thiss!992)))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))))))

(assert (=> d!32193 (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32193 (= (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))) lt!58726)))

(declare-fun b!113237 () Bool)

(assert (=> b!113237 (= e!73605 (Found!257 (index!3182 lt!58727)))))

(declare-fun b!113238 () Bool)

(assert (=> b!113238 (= e!73604 (seekKeyOrZeroReturnVacant!0 (x!14178 lt!58727) (index!3182 lt!58727) (index!3182 lt!58727) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113239 () Bool)

(assert (=> b!113239 (= e!73603 e!73605)))

(assert (=> b!113239 (= lt!58725 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (index!3182 lt!58727)))))

(declare-fun c!20266 () Bool)

(assert (=> b!113239 (= c!20266 (= lt!58725 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113240 () Bool)

(assert (=> b!113240 (= e!73604 (MissingZero!257 (index!3182 lt!58727)))))

(assert (= (and d!32193 c!20267) b!113235))

(assert (= (and d!32193 (not c!20267)) b!113239))

(assert (= (and b!113239 c!20266) b!113237))

(assert (= (and b!113239 (not c!20266)) b!113236))

(assert (= (and b!113236 c!20265) b!113240))

(assert (= (and b!113236 (not c!20265)) b!113238))

(declare-fun m!129337 () Bool)

(assert (=> d!32193 m!129337))

(assert (=> d!32193 m!128861))

(declare-fun m!129339 () Bool)

(assert (=> d!32193 m!129339))

(assert (=> d!32193 m!129339))

(assert (=> d!32193 m!128861))

(declare-fun m!129341 () Bool)

(assert (=> d!32193 m!129341))

(declare-fun m!129343 () Bool)

(assert (=> d!32193 m!129343))

(assert (=> d!32193 m!128709))

(declare-fun m!129345 () Bool)

(assert (=> d!32193 m!129345))

(assert (=> b!113238 m!128861))

(declare-fun m!129347 () Bool)

(assert (=> b!113238 m!129347))

(declare-fun m!129349 () Bool)

(assert (=> b!113239 m!129349))

(assert (=> b!112852 d!32193))

(declare-fun d!32195 () Bool)

(declare-fun e!73607 () Bool)

(assert (=> d!32195 e!73607))

(declare-fun res!55822 () Bool)

(assert (=> d!32195 (=> res!55822 e!73607)))

(declare-fun lt!58728 () Bool)

(assert (=> d!32195 (= res!55822 (not lt!58728))))

(declare-fun lt!58731 () Bool)

(assert (=> d!32195 (= lt!58728 lt!58731)))

(declare-fun lt!58730 () Unit!3498)

(declare-fun e!73606 () Unit!3498)

(assert (=> d!32195 (= lt!58730 e!73606)))

(declare-fun c!20268 () Bool)

(assert (=> d!32195 (= c!20268 lt!58731)))

(assert (=> d!32195 (= lt!58731 (containsKey!164 (toList!795 lt!58634) (_1!1216 lt!58330)))))

(assert (=> d!32195 (= (contains!834 lt!58634 (_1!1216 lt!58330)) lt!58728)))

(declare-fun b!113241 () Bool)

(declare-fun lt!58729 () Unit!3498)

(assert (=> b!113241 (= e!73606 lt!58729)))

(assert (=> b!113241 (= lt!58729 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58634) (_1!1216 lt!58330)))))

(assert (=> b!113241 (isDefined!113 (getValueByKey!161 (toList!795 lt!58634) (_1!1216 lt!58330)))))

(declare-fun b!113242 () Bool)

(declare-fun Unit!3515 () Unit!3498)

(assert (=> b!113242 (= e!73606 Unit!3515)))

(declare-fun b!113243 () Bool)

(assert (=> b!113243 (= e!73607 (isDefined!113 (getValueByKey!161 (toList!795 lt!58634) (_1!1216 lt!58330))))))

(assert (= (and d!32195 c!20268) b!113241))

(assert (= (and d!32195 (not c!20268)) b!113242))

(assert (= (and d!32195 (not res!55822)) b!113243))

(declare-fun m!129351 () Bool)

(assert (=> d!32195 m!129351))

(declare-fun m!129353 () Bool)

(assert (=> b!113241 m!129353))

(assert (=> b!113241 m!129083))

(assert (=> b!113241 m!129083))

(declare-fun m!129355 () Bool)

(assert (=> b!113241 m!129355))

(assert (=> b!113243 m!129083))

(assert (=> b!113243 m!129083))

(assert (=> b!113243 m!129355))

(assert (=> d!32131 d!32195))

(declare-fun b!113255 () Bool)

(declare-fun e!73613 () Option!167)

(assert (=> b!113255 (= e!73613 None!165)))

(declare-fun b!113252 () Bool)

(declare-fun e!73612 () Option!167)

(assert (=> b!113252 (= e!73612 (Some!166 (_2!1216 (h!2216 lt!58632))))))

(declare-fun b!113253 () Bool)

(assert (=> b!113253 (= e!73612 e!73613)))

(declare-fun c!20274 () Bool)

(assert (=> b!113253 (= c!20274 (and ((_ is Cons!1616) lt!58632) (not (= (_1!1216 (h!2216 lt!58632)) (_1!1216 lt!58330)))))))

(declare-fun b!113254 () Bool)

(assert (=> b!113254 (= e!73613 (getValueByKey!161 (t!5786 lt!58632) (_1!1216 lt!58330)))))

(declare-fun d!32197 () Bool)

(declare-fun c!20273 () Bool)

(assert (=> d!32197 (= c!20273 (and ((_ is Cons!1616) lt!58632) (= (_1!1216 (h!2216 lt!58632)) (_1!1216 lt!58330))))))

(assert (=> d!32197 (= (getValueByKey!161 lt!58632 (_1!1216 lt!58330)) e!73612)))

(assert (= (and d!32197 c!20273) b!113252))

(assert (= (and d!32197 (not c!20273)) b!113253))

(assert (= (and b!113253 c!20274) b!113254))

(assert (= (and b!113253 (not c!20274)) b!113255))

(declare-fun m!129357 () Bool)

(assert (=> b!113254 m!129357))

(assert (=> d!32131 d!32197))

(declare-fun d!32199 () Bool)

(assert (=> d!32199 (= (getValueByKey!161 lt!58632 (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330)))))

(declare-fun lt!58734 () Unit!3498)

(declare-fun choose!722 (List!1620 (_ BitVec 64) V!3257) Unit!3498)

(assert (=> d!32199 (= lt!58734 (choose!722 lt!58632 (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(declare-fun e!73616 () Bool)

(assert (=> d!32199 e!73616))

(declare-fun res!55827 () Bool)

(assert (=> d!32199 (=> (not res!55827) (not e!73616))))

(declare-fun isStrictlySorted!300 (List!1620) Bool)

(assert (=> d!32199 (= res!55827 (isStrictlySorted!300 lt!58632))))

(assert (=> d!32199 (= (lemmaContainsTupThenGetReturnValue!77 lt!58632 (_1!1216 lt!58330) (_2!1216 lt!58330)) lt!58734)))

(declare-fun b!113260 () Bool)

(declare-fun res!55828 () Bool)

(assert (=> b!113260 (=> (not res!55828) (not e!73616))))

(assert (=> b!113260 (= res!55828 (containsKey!164 lt!58632 (_1!1216 lt!58330)))))

(declare-fun b!113261 () Bool)

(assert (=> b!113261 (= e!73616 (contains!836 lt!58632 (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330))))))

(assert (= (and d!32199 res!55827) b!113260))

(assert (= (and b!113260 res!55828) b!113261))

(assert (=> d!32199 m!129077))

(declare-fun m!129359 () Bool)

(assert (=> d!32199 m!129359))

(declare-fun m!129361 () Bool)

(assert (=> d!32199 m!129361))

(declare-fun m!129363 () Bool)

(assert (=> b!113260 m!129363))

(declare-fun m!129365 () Bool)

(assert (=> b!113261 m!129365))

(assert (=> d!32131 d!32199))

(declare-fun b!113282 () Bool)

(declare-fun e!73630 () List!1620)

(declare-fun call!12207 () List!1620)

(assert (=> b!113282 (= e!73630 call!12207)))

(declare-fun c!20283 () Bool)

(declare-fun e!73628 () List!1620)

(declare-fun c!20285 () Bool)

(declare-fun b!113283 () Bool)

(assert (=> b!113283 (= e!73628 (ite c!20283 (t!5786 (toList!795 (+!150 lt!58328 lt!58336))) (ite c!20285 (Cons!1616 (h!2216 (toList!795 (+!150 lt!58328 lt!58336))) (t!5786 (toList!795 (+!150 lt!58328 lt!58336)))) Nil!1617)))))

(declare-fun bm!12203 () Bool)

(declare-fun call!12206 () List!1620)

(assert (=> bm!12203 (= call!12206 call!12207)))

(declare-fun b!113284 () Bool)

(assert (=> b!113284 (= e!73628 (insertStrictlySorted!80 (t!5786 (toList!795 (+!150 lt!58328 lt!58336))) (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(declare-fun b!113285 () Bool)

(declare-fun e!73631 () List!1620)

(declare-fun call!12208 () List!1620)

(assert (=> b!113285 (= e!73631 call!12208)))

(declare-fun d!32201 () Bool)

(declare-fun e!73629 () Bool)

(assert (=> d!32201 e!73629))

(declare-fun res!55833 () Bool)

(assert (=> d!32201 (=> (not res!55833) (not e!73629))))

(declare-fun lt!58737 () List!1620)

(assert (=> d!32201 (= res!55833 (isStrictlySorted!300 lt!58737))))

(assert (=> d!32201 (= lt!58737 e!73631)))

(declare-fun c!20284 () Bool)

(assert (=> d!32201 (= c!20284 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58336))) (bvslt (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58336)))) (_1!1216 lt!58330))))))

(assert (=> d!32201 (isStrictlySorted!300 (toList!795 (+!150 lt!58328 lt!58336)))))

(assert (=> d!32201 (= (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 lt!58336)) (_1!1216 lt!58330) (_2!1216 lt!58330)) lt!58737)))

(declare-fun b!113286 () Bool)

(declare-fun e!73627 () List!1620)

(assert (=> b!113286 (= e!73627 call!12206)))

(declare-fun b!113287 () Bool)

(assert (=> b!113287 (= e!73627 call!12206)))

(declare-fun b!113288 () Bool)

(assert (=> b!113288 (= e!73629 (contains!836 lt!58737 (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330))))))

(declare-fun bm!12204 () Bool)

(assert (=> bm!12204 (= call!12207 call!12208)))

(declare-fun bm!12205 () Bool)

(declare-fun $colon$colon!84 (List!1620 tuple2!2410) List!1620)

(assert (=> bm!12205 (= call!12208 ($colon$colon!84 e!73628 (ite c!20284 (h!2216 (toList!795 (+!150 lt!58328 lt!58336))) (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330)))))))

(declare-fun c!20286 () Bool)

(assert (=> bm!12205 (= c!20286 c!20284)))

(declare-fun b!113289 () Bool)

(assert (=> b!113289 (= e!73631 e!73630)))

(assert (=> b!113289 (= c!20283 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58336))) (= (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58336)))) (_1!1216 lt!58330))))))

(declare-fun b!113290 () Bool)

(assert (=> b!113290 (= c!20285 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58336))) (bvsgt (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58336)))) (_1!1216 lt!58330))))))

(assert (=> b!113290 (= e!73630 e!73627)))

(declare-fun b!113291 () Bool)

(declare-fun res!55834 () Bool)

(assert (=> b!113291 (=> (not res!55834) (not e!73629))))

(assert (=> b!113291 (= res!55834 (containsKey!164 lt!58737 (_1!1216 lt!58330)))))

(assert (= (and d!32201 c!20284) b!113285))

(assert (= (and d!32201 (not c!20284)) b!113289))

(assert (= (and b!113289 c!20283) b!113282))

(assert (= (and b!113289 (not c!20283)) b!113290))

(assert (= (and b!113290 c!20285) b!113286))

(assert (= (and b!113290 (not c!20285)) b!113287))

(assert (= (or b!113286 b!113287) bm!12203))

(assert (= (or b!113282 bm!12203) bm!12204))

(assert (= (or b!113285 bm!12204) bm!12205))

(assert (= (and bm!12205 c!20286) b!113284))

(assert (= (and bm!12205 (not c!20286)) b!113283))

(assert (= (and d!32201 res!55833) b!113291))

(assert (= (and b!113291 res!55834) b!113288))

(declare-fun m!129367 () Bool)

(assert (=> b!113291 m!129367))

(declare-fun m!129369 () Bool)

(assert (=> bm!12205 m!129369))

(declare-fun m!129371 () Bool)

(assert (=> b!113284 m!129371))

(declare-fun m!129373 () Bool)

(assert (=> b!113288 m!129373))

(declare-fun m!129375 () Bool)

(assert (=> d!32201 m!129375))

(declare-fun m!129377 () Bool)

(assert (=> d!32201 m!129377))

(assert (=> d!32131 d!32201))

(assert (=> bm!12158 d!32155))

(declare-fun d!32203 () Bool)

(assert (=> d!32203 (= (apply!102 lt!58471 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1370 (getValueByKey!161 (toList!795 lt!58471) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4651 () Bool)

(assert (= bs!4651 d!32203))

(declare-fun m!129379 () Bool)

(assert (=> bs!4651 m!129379))

(assert (=> bs!4651 m!129379))

(declare-fun m!129381 () Bool)

(assert (=> bs!4651 m!129381))

(assert (=> b!112912 d!32203))

(assert (=> b!112895 d!32165))

(declare-fun d!32205 () Bool)

(declare-fun e!73633 () Bool)

(assert (=> d!32205 e!73633))

(declare-fun res!55835 () Bool)

(assert (=> d!32205 (=> res!55835 e!73633)))

(declare-fun lt!58738 () Bool)

(assert (=> d!32205 (= res!55835 (not lt!58738))))

(declare-fun lt!58741 () Bool)

(assert (=> d!32205 (= lt!58738 lt!58741)))

(declare-fun lt!58740 () Unit!3498)

(declare-fun e!73632 () Unit!3498)

(assert (=> d!32205 (= lt!58740 e!73632)))

(declare-fun c!20287 () Bool)

(assert (=> d!32205 (= c!20287 lt!58741)))

(assert (=> d!32205 (= lt!58741 (containsKey!164 (toList!795 e!73474) (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565)))))))

(assert (=> d!32205 (= (contains!834 e!73474 (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565)))) lt!58738)))

(declare-fun b!113292 () Bool)

(declare-fun lt!58739 () Unit!3498)

(assert (=> b!113292 (= e!73632 lt!58739)))

(assert (=> b!113292 (= lt!58739 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 e!73474) (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565)))))))

(assert (=> b!113292 (isDefined!113 (getValueByKey!161 (toList!795 e!73474) (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565)))))))

(declare-fun b!113293 () Bool)

(declare-fun Unit!3516 () Unit!3498)

(assert (=> b!113293 (= e!73632 Unit!3516)))

(declare-fun b!113294 () Bool)

(assert (=> b!113294 (= e!73633 (isDefined!113 (getValueByKey!161 (toList!795 e!73474) (ite c!20224 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58565))))))))

(assert (= (and d!32205 c!20287) b!113292))

(assert (= (and d!32205 (not c!20287)) b!113293))

(assert (= (and d!32205 (not res!55835)) b!113294))

(declare-fun m!129383 () Bool)

(assert (=> d!32205 m!129383))

(declare-fun m!129385 () Bool)

(assert (=> b!113292 m!129385))

(declare-fun m!129387 () Bool)

(assert (=> b!113292 m!129387))

(assert (=> b!113292 m!129387))

(declare-fun m!129389 () Bool)

(assert (=> b!113292 m!129389))

(assert (=> b!113294 m!129387))

(assert (=> b!113294 m!129387))

(assert (=> b!113294 m!129389))

(assert (=> bm!12168 d!32205))

(declare-fun d!32207 () Bool)

(declare-fun res!55847 () Bool)

(declare-fun e!73636 () Bool)

(assert (=> d!32207 (=> (not res!55847) (not e!73636))))

(assert (=> d!32207 (= res!55847 (validMask!0 (mask!6844 newMap!16)))))

(assert (=> d!32207 (= (simpleValid!78 newMap!16) e!73636)))

(declare-fun b!113305 () Bool)

(declare-fun res!55846 () Bool)

(assert (=> b!113305 (=> (not res!55846) (not e!73636))))

(declare-fun size!2349 (LongMapFixedSize!928) (_ BitVec 32))

(assert (=> b!113305 (= res!55846 (= (size!2349 newMap!16) (bvadd (_size!513 newMap!16) (bvsdiv (bvadd (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!113304 () Bool)

(declare-fun res!55845 () Bool)

(assert (=> b!113304 (=> (not res!55845) (not e!73636))))

(assert (=> b!113304 (= res!55845 (bvsge (size!2349 newMap!16) (_size!513 newMap!16)))))

(declare-fun b!113303 () Bool)

(declare-fun res!55844 () Bool)

(assert (=> b!113303 (=> (not res!55844) (not e!73636))))

(assert (=> b!113303 (= res!55844 (and (= (size!2344 (_values!2643 newMap!16)) (bvadd (mask!6844 newMap!16) #b00000000000000000000000000000001)) (= (size!2343 (_keys!4380 newMap!16)) (size!2344 (_values!2643 newMap!16))) (bvsge (_size!513 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!513 newMap!16) (bvadd (mask!6844 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!113306 () Bool)

(assert (=> b!113306 (= e!73636 (and (bvsge (extraKeys!2451 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2451 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!513 newMap!16) #b00000000000000000000000000000000)))))

(assert (= (and d!32207 res!55847) b!113303))

(assert (= (and b!113303 res!55844) b!113304))

(assert (= (and b!113304 res!55845) b!113305))

(assert (= (and b!113305 res!55846) b!113306))

(assert (=> d!32207 m!129121))

(declare-fun m!129391 () Bool)

(assert (=> b!113305 m!129391))

(assert (=> b!113304 m!129391))

(assert (=> d!32095 d!32207))

(declare-fun d!32209 () Bool)

(declare-fun e!73638 () Bool)

(assert (=> d!32209 e!73638))

(declare-fun res!55848 () Bool)

(assert (=> d!32209 (=> res!55848 e!73638)))

(declare-fun lt!58742 () Bool)

(assert (=> d!32209 (= res!55848 (not lt!58742))))

(declare-fun lt!58745 () Bool)

(assert (=> d!32209 (= lt!58742 lt!58745)))

(declare-fun lt!58744 () Unit!3498)

(declare-fun e!73637 () Unit!3498)

(assert (=> d!32209 (= lt!58744 e!73637)))

(declare-fun c!20288 () Bool)

(assert (=> d!32209 (= c!20288 lt!58745)))

(assert (=> d!32209 (= lt!58745 (containsKey!164 (toList!795 lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32209 (= (contains!834 lt!58471 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58742)))

(declare-fun b!113307 () Bool)

(declare-fun lt!58743 () Unit!3498)

(assert (=> b!113307 (= e!73637 lt!58743)))

(assert (=> b!113307 (= lt!58743 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113307 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113308 () Bool)

(declare-fun Unit!3517 () Unit!3498)

(assert (=> b!113308 (= e!73637 Unit!3517)))

(declare-fun b!113309 () Bool)

(assert (=> b!113309 (= e!73638 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32209 c!20288) b!113307))

(assert (= (and d!32209 (not c!20288)) b!113308))

(assert (= (and d!32209 (not res!55848)) b!113309))

(declare-fun m!129393 () Bool)

(assert (=> d!32209 m!129393))

(declare-fun m!129395 () Bool)

(assert (=> b!113307 m!129395))

(assert (=> b!113307 m!129311))

(assert (=> b!113307 m!129311))

(declare-fun m!129397 () Bool)

(assert (=> b!113307 m!129397))

(assert (=> b!113309 m!129311))

(assert (=> b!113309 m!129311))

(assert (=> b!113309 m!129397))

(assert (=> bm!12100 d!32209))

(declare-fun d!32211 () Bool)

(declare-fun e!73640 () Bool)

(assert (=> d!32211 e!73640))

(declare-fun res!55849 () Bool)

(assert (=> d!32211 (=> res!55849 e!73640)))

(declare-fun lt!58746 () Bool)

(assert (=> d!32211 (= res!55849 (not lt!58746))))

(declare-fun lt!58749 () Bool)

(assert (=> d!32211 (= lt!58746 lt!58749)))

(declare-fun lt!58748 () Unit!3498)

(declare-fun e!73639 () Unit!3498)

(assert (=> d!32211 (= lt!58748 e!73639)))

(declare-fun c!20289 () Bool)

(assert (=> d!32211 (= c!20289 lt!58749)))

(assert (=> d!32211 (= lt!58749 (containsKey!164 (toList!795 lt!58471) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!32211 (= (contains!834 lt!58471 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!58746)))

(declare-fun b!113310 () Bool)

(declare-fun lt!58747 () Unit!3498)

(assert (=> b!113310 (= e!73639 lt!58747)))

(assert (=> b!113310 (= lt!58747 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58471) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!113310 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!113311 () Bool)

(declare-fun Unit!3518 () Unit!3498)

(assert (=> b!113311 (= e!73639 Unit!3518)))

(declare-fun b!113312 () Bool)

(assert (=> b!113312 (= e!73640 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!32211 c!20289) b!113310))

(assert (= (and d!32211 (not c!20289)) b!113311))

(assert (= (and d!32211 (not res!55849)) b!113312))

(assert (=> d!32211 m!128879))

(declare-fun m!129399 () Bool)

(assert (=> d!32211 m!129399))

(assert (=> b!113310 m!128879))

(declare-fun m!129401 () Bool)

(assert (=> b!113310 m!129401))

(assert (=> b!113310 m!128879))

(declare-fun m!129403 () Bool)

(assert (=> b!113310 m!129403))

(assert (=> b!113310 m!129403))

(declare-fun m!129405 () Bool)

(assert (=> b!113310 m!129405))

(assert (=> b!113312 m!128879))

(assert (=> b!113312 m!129403))

(assert (=> b!113312 m!129403))

(assert (=> b!113312 m!129405))

(assert (=> b!112914 d!32211))

(assert (=> bm!12162 d!32101))

(declare-fun d!32213 () Bool)

(declare-fun lt!58750 () Bool)

(assert (=> d!32213 (= lt!58750 (select (content!119 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!73642 () Bool)

(assert (=> d!32213 (= lt!58750 e!73642)))

(declare-fun res!55851 () Bool)

(assert (=> d!32213 (=> (not res!55851) (not e!73642))))

(assert (=> d!32213 (= res!55851 ((_ is Cons!1615) Nil!1616))))

(assert (=> d!32213 (= (contains!835 Nil!1616 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)) lt!58750)))

(declare-fun b!113313 () Bool)

(declare-fun e!73641 () Bool)

(assert (=> b!113313 (= e!73642 e!73641)))

(declare-fun res!55850 () Bool)

(assert (=> b!113313 (=> res!55850 e!73641)))

(assert (=> b!113313 (= res!55850 (= (h!2215 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!113314 () Bool)

(assert (=> b!113314 (= e!73641 (contains!835 (t!5785 Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!32213 res!55851) b!113313))

(assert (= (and b!113313 (not res!55850)) b!113314))

(assert (=> d!32213 m!129305))

(assert (=> d!32213 m!128861))

(declare-fun m!129407 () Bool)

(assert (=> d!32213 m!129407))

(assert (=> b!113314 m!128861))

(declare-fun m!129409 () Bool)

(assert (=> b!113314 m!129409))

(assert (=> b!112840 d!32213))

(assert (=> d!32105 d!32109))

(declare-fun d!32215 () Bool)

(assert (=> d!32215 (not (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!32215 true))

(declare-fun _$68!118 () Unit!3498)

(assert (=> d!32215 (= (choose!68 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616)) _$68!118)))

(declare-fun bs!4652 () Bool)

(assert (= bs!4652 d!32215))

(assert (=> bs!4652 m!128675))

(assert (=> bs!4652 m!128689))

(assert (=> d!32105 d!32215))

(declare-fun d!32217 () Bool)

(declare-fun res!55852 () Bool)

(declare-fun e!73643 () Bool)

(assert (=> d!32217 (=> res!55852 e!73643)))

(assert (=> d!32217 (= res!55852 (= (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32217 (= (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000) e!73643)))

(declare-fun b!113315 () Bool)

(declare-fun e!73644 () Bool)

(assert (=> b!113315 (= e!73643 e!73644)))

(declare-fun res!55853 () Bool)

(assert (=> b!113315 (=> (not res!55853) (not e!73644))))

(assert (=> b!113315 (= res!55853 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun b!113316 () Bool)

(assert (=> b!113316 (= e!73644 (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!32217 (not res!55852)) b!113315))

(assert (= (and b!113315 res!55853) b!113316))

(assert (=> d!32217 m!129107))

(assert (=> b!113316 m!128675))

(declare-fun m!129411 () Bool)

(assert (=> b!113316 m!129411))

(assert (=> bm!12167 d!32217))

(declare-fun d!32219 () Bool)

(declare-fun res!55858 () Bool)

(declare-fun e!73649 () Bool)

(assert (=> d!32219 (=> res!55858 e!73649)))

(assert (=> d!32219 (= res!55858 (and ((_ is Cons!1616) (toList!795 lt!58337)) (= (_1!1216 (h!2216 (toList!795 lt!58337))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32219 (= (containsKey!164 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) e!73649)))

(declare-fun b!113321 () Bool)

(declare-fun e!73650 () Bool)

(assert (=> b!113321 (= e!73649 e!73650)))

(declare-fun res!55859 () Bool)

(assert (=> b!113321 (=> (not res!55859) (not e!73650))))

(assert (=> b!113321 (= res!55859 (and (or (not ((_ is Cons!1616) (toList!795 lt!58337))) (bvsle (_1!1216 (h!2216 (toList!795 lt!58337))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))) ((_ is Cons!1616) (toList!795 lt!58337)) (bvslt (_1!1216 (h!2216 (toList!795 lt!58337))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(declare-fun b!113322 () Bool)

(assert (=> b!113322 (= e!73650 (containsKey!164 (t!5786 (toList!795 lt!58337)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32219 (not res!55858)) b!113321))

(assert (= (and b!113321 res!55859) b!113322))

(assert (=> b!113322 m!128675))

(declare-fun m!129413 () Bool)

(assert (=> b!113322 m!129413))

(assert (=> d!32115 d!32219))

(declare-fun d!32221 () Bool)

(declare-fun e!73652 () Bool)

(assert (=> d!32221 e!73652))

(declare-fun res!55860 () Bool)

(assert (=> d!32221 (=> res!55860 e!73652)))

(declare-fun lt!58751 () Bool)

(assert (=> d!32221 (= res!55860 (not lt!58751))))

(declare-fun lt!58754 () Bool)

(assert (=> d!32221 (= lt!58751 lt!58754)))

(declare-fun lt!58753 () Unit!3498)

(declare-fun e!73651 () Unit!3498)

(assert (=> d!32221 (= lt!58753 e!73651)))

(declare-fun c!20290 () Bool)

(assert (=> d!32221 (= c!20290 lt!58754)))

(assert (=> d!32221 (= lt!58754 (containsKey!164 (toList!795 call!12164) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32221 (= (contains!834 call!12164 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58751)))

(declare-fun b!113323 () Bool)

(declare-fun lt!58752 () Unit!3498)

(assert (=> b!113323 (= e!73651 lt!58752)))

(assert (=> b!113323 (= lt!58752 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 call!12164) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113323 (isDefined!113 (getValueByKey!161 (toList!795 call!12164) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113324 () Bool)

(declare-fun Unit!3519 () Unit!3498)

(assert (=> b!113324 (= e!73651 Unit!3519)))

(declare-fun b!113325 () Bool)

(assert (=> b!113325 (= e!73652 (isDefined!113 (getValueByKey!161 (toList!795 call!12164) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (= (and d!32221 c!20290) b!113323))

(assert (= (and d!32221 (not c!20290)) b!113324))

(assert (= (and d!32221 (not res!55860)) b!113325))

(assert (=> d!32221 m!128675))

(declare-fun m!129415 () Bool)

(assert (=> d!32221 m!129415))

(assert (=> b!113323 m!128675))

(declare-fun m!129417 () Bool)

(assert (=> b!113323 m!129417))

(assert (=> b!113323 m!128675))

(declare-fun m!129419 () Bool)

(assert (=> b!113323 m!129419))

(assert (=> b!113323 m!129419))

(declare-fun m!129421 () Bool)

(assert (=> b!113323 m!129421))

(assert (=> b!113325 m!128675))

(assert (=> b!113325 m!129419))

(assert (=> b!113325 m!129419))

(assert (=> b!113325 m!129421))

(assert (=> b!113030 d!32221))

(declare-fun d!32223 () Bool)

(declare-fun e!73654 () Bool)

(assert (=> d!32223 e!73654))

(declare-fun res!55861 () Bool)

(assert (=> d!32223 (=> res!55861 e!73654)))

(declare-fun lt!58755 () Bool)

(assert (=> d!32223 (= res!55861 (not lt!58755))))

(declare-fun lt!58758 () Bool)

(assert (=> d!32223 (= lt!58755 lt!58758)))

(declare-fun lt!58757 () Unit!3498)

(declare-fun e!73653 () Unit!3498)

(assert (=> d!32223 (= lt!58757 e!73653)))

(declare-fun c!20291 () Bool)

(assert (=> d!32223 (= c!20291 lt!58758)))

(assert (=> d!32223 (= lt!58758 (containsKey!164 (toList!795 lt!58621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32223 (= (contains!834 lt!58621 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58755)))

(declare-fun b!113326 () Bool)

(declare-fun lt!58756 () Unit!3498)

(assert (=> b!113326 (= e!73653 lt!58756)))

(assert (=> b!113326 (= lt!58756 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113326 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113327 () Bool)

(declare-fun Unit!3520 () Unit!3498)

(assert (=> b!113327 (= e!73653 Unit!3520)))

(declare-fun b!113328 () Bool)

(assert (=> b!113328 (= e!73654 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32223 c!20291) b!113326))

(assert (= (and d!32223 (not c!20291)) b!113327))

(assert (= (and d!32223 (not res!55861)) b!113328))

(declare-fun m!129423 () Bool)

(assert (=> d!32223 m!129423))

(declare-fun m!129425 () Bool)

(assert (=> b!113326 m!129425))

(declare-fun m!129427 () Bool)

(assert (=> b!113326 m!129427))

(assert (=> b!113326 m!129427))

(declare-fun m!129429 () Bool)

(assert (=> b!113326 m!129429))

(assert (=> b!113328 m!129427))

(assert (=> b!113328 m!129427))

(assert (=> b!113328 m!129429))

(assert (=> d!32123 d!32223))

(assert (=> d!32123 d!32129))

(assert (=> b!113092 d!32165))

(declare-fun b!113329 () Bool)

(declare-fun e!73656 () Bool)

(declare-fun call!12209 () Bool)

(assert (=> b!113329 (= e!73656 call!12209)))

(declare-fun d!32225 () Bool)

(declare-fun res!55863 () Bool)

(declare-fun e!73657 () Bool)

(assert (=> d!32225 (=> res!55863 e!73657)))

(assert (=> d!32225 (= res!55863 (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(assert (=> d!32225 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4380 newMap!16) (mask!6844 newMap!16)) e!73657)))

(declare-fun b!113330 () Bool)

(assert (=> b!113330 (= e!73657 e!73656)))

(declare-fun c!20292 () Bool)

(assert (=> b!113330 (= c!20292 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!113331 () Bool)

(declare-fun e!73655 () Bool)

(assert (=> b!113331 (= e!73655 call!12209)))

(declare-fun b!113332 () Bool)

(assert (=> b!113332 (= e!73656 e!73655)))

(declare-fun lt!58761 () (_ BitVec 64))

(assert (=> b!113332 (= lt!58761 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58760 () Unit!3498)

(assert (=> b!113332 (= lt!58760 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4380 newMap!16) lt!58761 #b00000000000000000000000000000000))))

(assert (=> b!113332 (arrayContainsKey!0 (_keys!4380 newMap!16) lt!58761 #b00000000000000000000000000000000)))

(declare-fun lt!58759 () Unit!3498)

(assert (=> b!113332 (= lt!58759 lt!58760)))

(declare-fun res!55862 () Bool)

(assert (=> b!113332 (= res!55862 (= (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000) (_keys!4380 newMap!16) (mask!6844 newMap!16)) (Found!257 #b00000000000000000000000000000000)))))

(assert (=> b!113332 (=> (not res!55862) (not e!73655))))

(declare-fun bm!12206 () Bool)

(assert (=> bm!12206 (= call!12209 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(assert (= (and d!32225 (not res!55863)) b!113330))

(assert (= (and b!113330 c!20292) b!113332))

(assert (= (and b!113330 (not c!20292)) b!113329))

(assert (= (and b!113332 res!55862) b!113331))

(assert (= (or b!113331 b!113329) bm!12206))

(assert (=> b!113330 m!129107))

(assert (=> b!113330 m!129107))

(assert (=> b!113330 m!129109))

(assert (=> b!113332 m!129107))

(declare-fun m!129431 () Bool)

(assert (=> b!113332 m!129431))

(declare-fun m!129433 () Bool)

(assert (=> b!113332 m!129433))

(assert (=> b!113332 m!129107))

(declare-fun m!129435 () Bool)

(assert (=> b!113332 m!129435))

(declare-fun m!129437 () Bool)

(assert (=> bm!12206 m!129437))

(assert (=> b!112824 d!32225))

(declare-fun b!113336 () Bool)

(declare-fun e!73659 () Option!167)

(assert (=> b!113336 (= e!73659 None!165)))

(declare-fun b!113333 () Bool)

(declare-fun e!73658 () Option!167)

(assert (=> b!113333 (= e!73658 (Some!166 (_2!1216 (h!2216 (toList!795 lt!58634)))))))

(declare-fun b!113334 () Bool)

(assert (=> b!113334 (= e!73658 e!73659)))

(declare-fun c!20294 () Bool)

(assert (=> b!113334 (= c!20294 (and ((_ is Cons!1616) (toList!795 lt!58634)) (not (= (_1!1216 (h!2216 (toList!795 lt!58634))) (_1!1216 lt!58330)))))))

(declare-fun b!113335 () Bool)

(assert (=> b!113335 (= e!73659 (getValueByKey!161 (t!5786 (toList!795 lt!58634)) (_1!1216 lt!58330)))))

(declare-fun d!32227 () Bool)

(declare-fun c!20293 () Bool)

(assert (=> d!32227 (= c!20293 (and ((_ is Cons!1616) (toList!795 lt!58634)) (= (_1!1216 (h!2216 (toList!795 lt!58634))) (_1!1216 lt!58330))))))

(assert (=> d!32227 (= (getValueByKey!161 (toList!795 lt!58634) (_1!1216 lt!58330)) e!73658)))

(assert (= (and d!32227 c!20293) b!113333))

(assert (= (and d!32227 (not c!20293)) b!113334))

(assert (= (and b!113334 c!20294) b!113335))

(assert (= (and b!113334 (not c!20294)) b!113336))

(declare-fun m!129439 () Bool)

(assert (=> b!113335 m!129439))

(assert (=> b!113108 d!32227))

(declare-fun bm!12211 () Bool)

(declare-fun call!12214 () Bool)

(assert (=> bm!12211 (= call!12214 (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113353 () Bool)

(declare-fun e!73670 () Bool)

(assert (=> b!113353 (= e!73670 (not call!12214))))

(declare-fun b!113354 () Bool)

(declare-fun e!73669 () Bool)

(declare-fun e!73671 () Bool)

(assert (=> b!113354 (= e!73669 e!73671)))

(declare-fun c!20299 () Bool)

(declare-fun lt!58766 () SeekEntryResult!257)

(assert (=> b!113354 (= c!20299 ((_ is MissingVacant!257) lt!58766))))

(declare-fun b!113355 () Bool)

(declare-fun res!55873 () Bool)

(declare-fun e!73668 () Bool)

(assert (=> b!113355 (=> (not res!55873) (not e!73668))))

(assert (=> b!113355 (= res!55873 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3183 lt!58766)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113355 (and (bvsge (index!3183 lt!58766) #b00000000000000000000000000000000) (bvslt (index!3183 lt!58766) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun b!113356 () Bool)

(declare-fun res!55874 () Bool)

(assert (=> b!113356 (=> (not res!55874) (not e!73668))))

(declare-fun call!12215 () Bool)

(assert (=> b!113356 (= res!55874 call!12215)))

(assert (=> b!113356 (= e!73671 e!73668)))

(declare-fun b!113358 () Bool)

(assert (=> b!113358 (and (bvsge (index!3180 lt!58766) #b00000000000000000000000000000000) (bvslt (index!3180 lt!58766) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun res!55875 () Bool)

(assert (=> b!113358 (= res!55875 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3180 lt!58766)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113358 (=> (not res!55875) (not e!73670))))

(declare-fun bm!12212 () Bool)

(declare-fun c!20300 () Bool)

(assert (=> bm!12212 (= call!12215 (inRange!0 (ite c!20300 (index!3180 lt!58766) (index!3183 lt!58766)) (mask!6844 newMap!16)))))

(declare-fun b!113359 () Bool)

(assert (=> b!113359 (= e!73669 e!73670)))

(declare-fun res!55872 () Bool)

(assert (=> b!113359 (= res!55872 call!12215)))

(assert (=> b!113359 (=> (not res!55872) (not e!73670))))

(declare-fun b!113360 () Bool)

(assert (=> b!113360 (= e!73668 (not call!12214))))

(declare-fun b!113357 () Bool)

(assert (=> b!113357 (= e!73671 ((_ is Undefined!257) lt!58766))))

(declare-fun d!32229 () Bool)

(assert (=> d!32229 e!73669))

(assert (=> d!32229 (= c!20300 ((_ is MissingZero!257) lt!58766))))

(assert (=> d!32229 (= lt!58766 (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun lt!58767 () Unit!3498)

(declare-fun choose!723 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3498)

(assert (=> d!32229 (= lt!58767 (choose!723 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32229 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32229 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)) lt!58767)))

(assert (= (and d!32229 c!20300) b!113359))

(assert (= (and d!32229 (not c!20300)) b!113354))

(assert (= (and b!113359 res!55872) b!113358))

(assert (= (and b!113358 res!55875) b!113353))

(assert (= (and b!113354 c!20299) b!113356))

(assert (= (and b!113354 (not c!20299)) b!113357))

(assert (= (and b!113356 res!55874) b!113355))

(assert (= (and b!113355 res!55873) b!113360))

(assert (= (or b!113359 b!113356) bm!12212))

(assert (= (or b!113353 b!113360) bm!12211))

(declare-fun m!129441 () Bool)

(assert (=> b!113358 m!129441))

(assert (=> d!32229 m!128675))

(assert (=> d!32229 m!128961))

(assert (=> d!32229 m!128675))

(declare-fun m!129443 () Bool)

(assert (=> d!32229 m!129443))

(assert (=> d!32229 m!129121))

(declare-fun m!129445 () Bool)

(assert (=> bm!12212 m!129445))

(declare-fun m!129447 () Bool)

(assert (=> b!113355 m!129447))

(assert (=> bm!12211 m!128675))

(assert (=> bm!12211 m!128955))

(assert (=> bm!12163 d!32229))

(declare-fun d!32231 () Bool)

(declare-fun res!55876 () Bool)

(declare-fun e!73672 () Bool)

(assert (=> d!32231 (=> res!55876 e!73672)))

(assert (=> d!32231 (= res!55876 (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32231 (= (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!73672)))

(declare-fun b!113361 () Bool)

(declare-fun e!73673 () Bool)

(assert (=> b!113361 (= e!73672 e!73673)))

(declare-fun res!55877 () Bool)

(assert (=> b!113361 (=> (not res!55877) (not e!73673))))

(assert (=> b!113361 (= res!55877 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113362 () Bool)

(assert (=> b!113362 (= e!73673 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!32231 (not res!55876)) b!113361))

(assert (= (and b!113361 res!55877) b!113362))

(declare-fun m!129449 () Bool)

(assert (=> d!32231 m!129449))

(assert (=> b!113362 m!128675))

(declare-fun m!129451 () Bool)

(assert (=> b!113362 m!129451))

(assert (=> b!112921 d!32231))

(declare-fun d!32233 () Bool)

(declare-fun e!73675 () Bool)

(assert (=> d!32233 e!73675))

(declare-fun res!55878 () Bool)

(assert (=> d!32233 (=> res!55878 e!73675)))

(declare-fun lt!58768 () Bool)

(assert (=> d!32233 (= res!55878 (not lt!58768))))

(declare-fun lt!58771 () Bool)

(assert (=> d!32233 (= lt!58768 lt!58771)))

(declare-fun lt!58770 () Unit!3498)

(declare-fun e!73674 () Unit!3498)

(assert (=> d!32233 (= lt!58770 e!73674)))

(declare-fun c!20301 () Bool)

(assert (=> d!32233 (= c!20301 lt!58771)))

(assert (=> d!32233 (= lt!58771 (containsKey!164 (toList!795 lt!58626) (_1!1216 lt!58330)))))

(assert (=> d!32233 (= (contains!834 lt!58626 (_1!1216 lt!58330)) lt!58768)))

(declare-fun b!113363 () Bool)

(declare-fun lt!58769 () Unit!3498)

(assert (=> b!113363 (= e!73674 lt!58769)))

(assert (=> b!113363 (= lt!58769 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58626) (_1!1216 lt!58330)))))

(assert (=> b!113363 (isDefined!113 (getValueByKey!161 (toList!795 lt!58626) (_1!1216 lt!58330)))))

(declare-fun b!113364 () Bool)

(declare-fun Unit!3521 () Unit!3498)

(assert (=> b!113364 (= e!73674 Unit!3521)))

(declare-fun b!113365 () Bool)

(assert (=> b!113365 (= e!73675 (isDefined!113 (getValueByKey!161 (toList!795 lt!58626) (_1!1216 lt!58330))))))

(assert (= (and d!32233 c!20301) b!113363))

(assert (= (and d!32233 (not c!20301)) b!113364))

(assert (= (and d!32233 (not res!55878)) b!113365))

(declare-fun m!129453 () Bool)

(assert (=> d!32233 m!129453))

(declare-fun m!129455 () Bool)

(assert (=> b!113363 m!129455))

(assert (=> b!113363 m!129059))

(assert (=> b!113363 m!129059))

(declare-fun m!129457 () Bool)

(assert (=> b!113363 m!129457))

(assert (=> b!113365 m!129059))

(assert (=> b!113365 m!129059))

(assert (=> b!113365 m!129457))

(assert (=> d!32125 d!32233))

(declare-fun b!113369 () Bool)

(declare-fun e!73677 () Option!167)

(assert (=> b!113369 (= e!73677 None!165)))

(declare-fun b!113366 () Bool)

(declare-fun e!73676 () Option!167)

(assert (=> b!113366 (= e!73676 (Some!166 (_2!1216 (h!2216 lt!58624))))))

(declare-fun b!113367 () Bool)

(assert (=> b!113367 (= e!73676 e!73677)))

(declare-fun c!20303 () Bool)

(assert (=> b!113367 (= c!20303 (and ((_ is Cons!1616) lt!58624) (not (= (_1!1216 (h!2216 lt!58624)) (_1!1216 lt!58330)))))))

(declare-fun b!113368 () Bool)

(assert (=> b!113368 (= e!73677 (getValueByKey!161 (t!5786 lt!58624) (_1!1216 lt!58330)))))

(declare-fun d!32235 () Bool)

(declare-fun c!20302 () Bool)

(assert (=> d!32235 (= c!20302 (and ((_ is Cons!1616) lt!58624) (= (_1!1216 (h!2216 lt!58624)) (_1!1216 lt!58330))))))

(assert (=> d!32235 (= (getValueByKey!161 lt!58624 (_1!1216 lt!58330)) e!73676)))

(assert (= (and d!32235 c!20302) b!113366))

(assert (= (and d!32235 (not c!20302)) b!113367))

(assert (= (and b!113367 c!20303) b!113368))

(assert (= (and b!113367 (not c!20303)) b!113369))

(declare-fun m!129459 () Bool)

(assert (=> b!113368 m!129459))

(assert (=> d!32125 d!32235))

(declare-fun d!32237 () Bool)

(assert (=> d!32237 (= (getValueByKey!161 lt!58624 (_1!1216 lt!58330)) (Some!166 (_2!1216 lt!58330)))))

(declare-fun lt!58772 () Unit!3498)

(assert (=> d!32237 (= lt!58772 (choose!722 lt!58624 (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(declare-fun e!73678 () Bool)

(assert (=> d!32237 e!73678))

(declare-fun res!55879 () Bool)

(assert (=> d!32237 (=> (not res!55879) (not e!73678))))

(assert (=> d!32237 (= res!55879 (isStrictlySorted!300 lt!58624))))

(assert (=> d!32237 (= (lemmaContainsTupThenGetReturnValue!77 lt!58624 (_1!1216 lt!58330) (_2!1216 lt!58330)) lt!58772)))

(declare-fun b!113370 () Bool)

(declare-fun res!55880 () Bool)

(assert (=> b!113370 (=> (not res!55880) (not e!73678))))

(assert (=> b!113370 (= res!55880 (containsKey!164 lt!58624 (_1!1216 lt!58330)))))

(declare-fun b!113371 () Bool)

(assert (=> b!113371 (= e!73678 (contains!836 lt!58624 (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330))))))

(assert (= (and d!32237 res!55879) b!113370))

(assert (= (and b!113370 res!55880) b!113371))

(assert (=> d!32237 m!129053))

(declare-fun m!129461 () Bool)

(assert (=> d!32237 m!129461))

(declare-fun m!129463 () Bool)

(assert (=> d!32237 m!129463))

(declare-fun m!129465 () Bool)

(assert (=> b!113370 m!129465))

(declare-fun m!129467 () Bool)

(assert (=> b!113371 m!129467))

(assert (=> d!32125 d!32237))

(declare-fun b!113372 () Bool)

(declare-fun e!73682 () List!1620)

(declare-fun call!12217 () List!1620)

(assert (=> b!113372 (= e!73682 call!12217)))

(declare-fun b!113373 () Bool)

(declare-fun e!73680 () List!1620)

(declare-fun c!20304 () Bool)

(declare-fun c!20306 () Bool)

(assert (=> b!113373 (= e!73680 (ite c!20304 (t!5786 (toList!795 lt!58328)) (ite c!20306 (Cons!1616 (h!2216 (toList!795 lt!58328)) (t!5786 (toList!795 lt!58328))) Nil!1617)))))

(declare-fun bm!12213 () Bool)

(declare-fun call!12216 () List!1620)

(assert (=> bm!12213 (= call!12216 call!12217)))

(declare-fun b!113374 () Bool)

(assert (=> b!113374 (= e!73680 (insertStrictlySorted!80 (t!5786 (toList!795 lt!58328)) (_1!1216 lt!58330) (_2!1216 lt!58330)))))

(declare-fun b!113375 () Bool)

(declare-fun e!73683 () List!1620)

(declare-fun call!12218 () List!1620)

(assert (=> b!113375 (= e!73683 call!12218)))

(declare-fun d!32239 () Bool)

(declare-fun e!73681 () Bool)

(assert (=> d!32239 e!73681))

(declare-fun res!55881 () Bool)

(assert (=> d!32239 (=> (not res!55881) (not e!73681))))

(declare-fun lt!58773 () List!1620)

(assert (=> d!32239 (= res!55881 (isStrictlySorted!300 lt!58773))))

(assert (=> d!32239 (= lt!58773 e!73683)))

(declare-fun c!20305 () Bool)

(assert (=> d!32239 (= c!20305 (and ((_ is Cons!1616) (toList!795 lt!58328)) (bvslt (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58330))))))

(assert (=> d!32239 (isStrictlySorted!300 (toList!795 lt!58328))))

(assert (=> d!32239 (= (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 lt!58330) (_2!1216 lt!58330)) lt!58773)))

(declare-fun b!113376 () Bool)

(declare-fun e!73679 () List!1620)

(assert (=> b!113376 (= e!73679 call!12216)))

(declare-fun b!113377 () Bool)

(assert (=> b!113377 (= e!73679 call!12216)))

(declare-fun b!113378 () Bool)

(assert (=> b!113378 (= e!73681 (contains!836 lt!58773 (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330))))))

(declare-fun bm!12214 () Bool)

(assert (=> bm!12214 (= call!12217 call!12218)))

(declare-fun bm!12215 () Bool)

(assert (=> bm!12215 (= call!12218 ($colon$colon!84 e!73680 (ite c!20305 (h!2216 (toList!795 lt!58328)) (tuple2!2411 (_1!1216 lt!58330) (_2!1216 lt!58330)))))))

(declare-fun c!20307 () Bool)

(assert (=> bm!12215 (= c!20307 c!20305)))

(declare-fun b!113379 () Bool)

(assert (=> b!113379 (= e!73683 e!73682)))

(assert (=> b!113379 (= c!20304 (and ((_ is Cons!1616) (toList!795 lt!58328)) (= (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58330))))))

(declare-fun b!113380 () Bool)

(assert (=> b!113380 (= c!20306 (and ((_ is Cons!1616) (toList!795 lt!58328)) (bvsgt (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58330))))))

(assert (=> b!113380 (= e!73682 e!73679)))

(declare-fun b!113381 () Bool)

(declare-fun res!55882 () Bool)

(assert (=> b!113381 (=> (not res!55882) (not e!73681))))

(assert (=> b!113381 (= res!55882 (containsKey!164 lt!58773 (_1!1216 lt!58330)))))

(assert (= (and d!32239 c!20305) b!113375))

(assert (= (and d!32239 (not c!20305)) b!113379))

(assert (= (and b!113379 c!20304) b!113372))

(assert (= (and b!113379 (not c!20304)) b!113380))

(assert (= (and b!113380 c!20306) b!113376))

(assert (= (and b!113380 (not c!20306)) b!113377))

(assert (= (or b!113376 b!113377) bm!12213))

(assert (= (or b!113372 bm!12213) bm!12214))

(assert (= (or b!113375 bm!12214) bm!12215))

(assert (= (and bm!12215 c!20307) b!113374))

(assert (= (and bm!12215 (not c!20307)) b!113373))

(assert (= (and d!32239 res!55881) b!113381))

(assert (= (and b!113381 res!55882) b!113378))

(declare-fun m!129469 () Bool)

(assert (=> b!113381 m!129469))

(declare-fun m!129471 () Bool)

(assert (=> bm!12215 m!129471))

(declare-fun m!129473 () Bool)

(assert (=> b!113374 m!129473))

(declare-fun m!129475 () Bool)

(assert (=> b!113378 m!129475))

(declare-fun m!129477 () Bool)

(assert (=> d!32239 m!129477))

(declare-fun m!129479 () Bool)

(assert (=> d!32239 m!129479))

(assert (=> d!32125 d!32239))

(declare-fun b!113382 () Bool)

(declare-fun e!73687 () ListLongMap!1559)

(declare-fun e!73689 () ListLongMap!1559)

(assert (=> b!113382 (= e!73687 e!73689)))

(declare-fun c!20308 () Bool)

(assert (=> b!113382 (= c!20308 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113383 () Bool)

(assert (=> b!113383 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> b!113383 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2344 (_values!2643 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun lt!58779 () ListLongMap!1559)

(declare-fun e!73685 () Bool)

(assert (=> b!113383 (= e!73685 (= (apply!102 lt!58779 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!12216 () Bool)

(declare-fun call!12219 () ListLongMap!1559)

(assert (=> bm!12216 (= call!12219 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))))))

(declare-fun b!113384 () Bool)

(declare-fun e!73686 () Bool)

(declare-fun e!73690 () Bool)

(assert (=> b!113384 (= e!73686 e!73690)))

(declare-fun c!20311 () Bool)

(assert (=> b!113384 (= c!20311 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113385 () Bool)

(assert (=> b!113385 (= e!73690 (= lt!58779 (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113386 () Bool)

(declare-fun e!73688 () Bool)

(assert (=> b!113386 (= e!73688 e!73686)))

(declare-fun c!20310 () Bool)

(declare-fun e!73684 () Bool)

(assert (=> b!113386 (= c!20310 e!73684)))

(declare-fun res!55884 () Bool)

(assert (=> b!113386 (=> (not res!55884) (not e!73684))))

(assert (=> b!113386 (= res!55884 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun b!113387 () Bool)

(assert (=> b!113387 (= e!73687 (ListLongMap!1560 Nil!1617))))

(declare-fun d!32241 () Bool)

(assert (=> d!32241 e!73688))

(declare-fun res!55883 () Bool)

(assert (=> d!32241 (=> (not res!55883) (not e!73688))))

(assert (=> d!32241 (= res!55883 (not (contains!834 lt!58779 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!32241 (= lt!58779 e!73687)))

(declare-fun c!20309 () Bool)

(assert (=> d!32241 (= c!20309 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32241 (validMask!0 (mask!6844 (v!2959 (underlying!376 thiss!992))))))

(assert (=> d!32241 (= (getCurrentListMapNoExtraKeys!117 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) lt!58779)))

(declare-fun b!113388 () Bool)

(assert (=> b!113388 (= e!73684 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113388 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!113389 () Bool)

(declare-fun lt!58780 () Unit!3498)

(declare-fun lt!58776 () Unit!3498)

(assert (=> b!113389 (= lt!58780 lt!58776)))

(declare-fun lt!58778 () (_ BitVec 64))

(declare-fun lt!58774 () (_ BitVec 64))

(declare-fun lt!58777 () ListLongMap!1559)

(declare-fun lt!58775 () V!3257)

(assert (=> b!113389 (not (contains!834 (+!150 lt!58777 (tuple2!2411 lt!58778 lt!58775)) lt!58774))))

(assert (=> b!113389 (= lt!58776 (addStillNotContains!52 lt!58777 lt!58778 lt!58775 lt!58774))))

(assert (=> b!113389 (= lt!58774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!113389 (= lt!58775 (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113389 (= lt!58778 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (=> b!113389 (= lt!58777 call!12219)))

(assert (=> b!113389 (= e!73689 (+!150 call!12219 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!113390 () Bool)

(assert (=> b!113390 (= e!73689 call!12219)))

(declare-fun b!113391 () Bool)

(assert (=> b!113391 (= e!73690 (isEmpty!388 lt!58779))))

(declare-fun b!113392 () Bool)

(assert (=> b!113392 (= e!73686 e!73685)))

(assert (=> b!113392 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(declare-fun res!55885 () Bool)

(assert (=> b!113392 (= res!55885 (contains!834 lt!58779 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!113392 (=> (not res!55885) (not e!73685))))

(declare-fun b!113393 () Bool)

(declare-fun res!55886 () Bool)

(assert (=> b!113393 (=> (not res!55886) (not e!73688))))

(assert (=> b!113393 (= res!55886 (not (contains!834 lt!58779 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32241 c!20309) b!113387))

(assert (= (and d!32241 (not c!20309)) b!113382))

(assert (= (and b!113382 c!20308) b!113389))

(assert (= (and b!113382 (not c!20308)) b!113390))

(assert (= (or b!113389 b!113390) bm!12216))

(assert (= (and d!32241 res!55883) b!113393))

(assert (= (and b!113393 res!55886) b!113386))

(assert (= (and b!113386 res!55884) b!113388))

(assert (= (and b!113386 c!20310) b!113392))

(assert (= (and b!113386 (not c!20310)) b!113384))

(assert (= (and b!113392 res!55885) b!113383))

(assert (= (and b!113384 c!20311) b!113385))

(assert (= (and b!113384 (not c!20311)) b!113391))

(declare-fun b_lambda!5075 () Bool)

(assert (=> (not b_lambda!5075) (not b!113383)))

(assert (=> b!113383 t!5782))

(declare-fun b_and!6961 () Bool)

(assert (= b_and!6957 (and (=> t!5782 result!3565) b_and!6961)))

(assert (=> b!113383 t!5784))

(declare-fun b_and!6963 () Bool)

(assert (= b_and!6959 (and (=> t!5784 result!3569) b_and!6963)))

(declare-fun b_lambda!5077 () Bool)

(assert (=> (not b_lambda!5077) (not b!113389)))

(assert (=> b!113389 t!5782))

(declare-fun b_and!6965 () Bool)

(assert (= b_and!6961 (and (=> t!5782 result!3565) b_and!6965)))

(assert (=> b!113389 t!5784))

(declare-fun b_and!6967 () Bool)

(assert (= b_and!6963 (and (=> t!5784 result!3569) b_and!6967)))

(assert (=> b!113388 m!129449))

(assert (=> b!113388 m!129449))

(declare-fun m!129481 () Bool)

(assert (=> b!113388 m!129481))

(declare-fun m!129483 () Bool)

(assert (=> b!113391 m!129483))

(declare-fun m!129485 () Bool)

(assert (=> bm!12216 m!129485))

(assert (=> b!113389 m!128679))

(declare-fun m!129487 () Bool)

(assert (=> b!113389 m!129487))

(declare-fun m!129489 () Bool)

(assert (=> b!113389 m!129489))

(assert (=> b!113389 m!129449))

(assert (=> b!113389 m!129487))

(declare-fun m!129491 () Bool)

(assert (=> b!113389 m!129491))

(declare-fun m!129493 () Bool)

(assert (=> b!113389 m!129493))

(assert (=> b!113389 m!129493))

(assert (=> b!113389 m!128679))

(declare-fun m!129495 () Bool)

(assert (=> b!113389 m!129495))

(declare-fun m!129497 () Bool)

(assert (=> b!113389 m!129497))

(declare-fun m!129499 () Bool)

(assert (=> d!32241 m!129499))

(assert (=> d!32241 m!128709))

(assert (=> b!113392 m!129449))

(assert (=> b!113392 m!129449))

(declare-fun m!129501 () Bool)

(assert (=> b!113392 m!129501))

(declare-fun m!129503 () Bool)

(assert (=> b!113393 m!129503))

(assert (=> b!113382 m!129449))

(assert (=> b!113382 m!129449))

(assert (=> b!113382 m!129481))

(assert (=> b!113385 m!129485))

(assert (=> b!113383 m!128679))

(assert (=> b!113383 m!129449))

(assert (=> b!113383 m!129449))

(declare-fun m!129505 () Bool)

(assert (=> b!113383 m!129505))

(assert (=> b!113383 m!129493))

(assert (=> b!113383 m!129493))

(assert (=> b!113383 m!128679))

(assert (=> b!113383 m!129495))

(assert (=> bm!12181 d!32241))

(declare-fun d!32243 () Bool)

(declare-fun e!73691 () Bool)

(assert (=> d!32243 e!73691))

(declare-fun res!55888 () Bool)

(assert (=> d!32243 (=> (not res!55888) (not e!73691))))

(declare-fun lt!58784 () ListLongMap!1559)

(assert (=> d!32243 (= res!55888 (contains!834 lt!58784 (_1!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(declare-fun lt!58782 () List!1620)

(assert (=> d!32243 (= lt!58784 (ListLongMap!1560 lt!58782))))

(declare-fun lt!58781 () Unit!3498)

(declare-fun lt!58783 () Unit!3498)

(assert (=> d!32243 (= lt!58781 lt!58783)))

(assert (=> d!32243 (= (getValueByKey!161 lt!58782 (_1!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))) (Some!166 (_2!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(assert (=> d!32243 (= lt!58783 (lemmaContainsTupThenGetReturnValue!77 lt!58782 (_1!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (_2!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(assert (=> d!32243 (= lt!58782 (insertStrictlySorted!80 (toList!795 (ite c!20216 call!12169 call!12176)) (_1!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (_2!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(assert (=> d!32243 (= (+!150 (ite c!20216 call!12169 call!12176) (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) lt!58784)))

(declare-fun b!113394 () Bool)

(declare-fun res!55887 () Bool)

(assert (=> b!113394 (=> (not res!55887) (not e!73691))))

(assert (=> b!113394 (= res!55887 (= (getValueByKey!161 (toList!795 lt!58784) (_1!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))) (Some!166 (_2!1216 (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))))

(declare-fun b!113395 () Bool)

(assert (=> b!113395 (= e!73691 (contains!836 (toList!795 lt!58784) (ite c!20216 (ite c!20214 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 lt!58327) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (= (and d!32243 res!55888) b!113394))

(assert (= (and b!113394 res!55887) b!113395))

(declare-fun m!129507 () Bool)

(assert (=> d!32243 m!129507))

(declare-fun m!129509 () Bool)

(assert (=> d!32243 m!129509))

(declare-fun m!129511 () Bool)

(assert (=> d!32243 m!129511))

(declare-fun m!129513 () Bool)

(assert (=> d!32243 m!129513))

(declare-fun m!129515 () Bool)

(assert (=> b!113394 m!129515))

(declare-fun m!129517 () Bool)

(assert (=> b!113395 m!129517))

(assert (=> bm!12170 d!32243))

(assert (=> bm!12102 d!32123))

(declare-fun b!113399 () Bool)

(declare-fun e!73693 () Option!167)

(assert (=> b!113399 (= e!73693 None!165)))

(declare-fun b!113396 () Bool)

(declare-fun e!73692 () Option!167)

(assert (=> b!113396 (= e!73692 (Some!166 (_2!1216 (h!2216 (toList!795 lt!58601)))))))

(declare-fun b!113397 () Bool)

(assert (=> b!113397 (= e!73692 e!73693)))

(declare-fun c!20313 () Bool)

(assert (=> b!113397 (= c!20313 (and ((_ is Cons!1616) (toList!795 lt!58601)) (not (= (_1!1216 (h!2216 (toList!795 lt!58601))) (_1!1216 lt!58336)))))))

(declare-fun b!113398 () Bool)

(assert (=> b!113398 (= e!73693 (getValueByKey!161 (t!5786 (toList!795 lt!58601)) (_1!1216 lt!58336)))))

(declare-fun d!32245 () Bool)

(declare-fun c!20312 () Bool)

(assert (=> d!32245 (= c!20312 (and ((_ is Cons!1616) (toList!795 lt!58601)) (= (_1!1216 (h!2216 (toList!795 lt!58601))) (_1!1216 lt!58336))))))

(assert (=> d!32245 (= (getValueByKey!161 (toList!795 lt!58601) (_1!1216 lt!58336)) e!73692)))

(assert (= (and d!32245 c!20312) b!113396))

(assert (= (and d!32245 (not c!20312)) b!113397))

(assert (= (and b!113397 c!20313) b!113398))

(assert (= (and b!113397 (not c!20313)) b!113399))

(declare-fun m!129519 () Bool)

(assert (=> b!113398 m!129519))

(assert (=> b!113066 d!32245))

(assert (=> b!113050 d!32161))

(declare-fun d!32247 () Bool)

(declare-fun e!73695 () Bool)

(assert (=> d!32247 e!73695))

(declare-fun res!55889 () Bool)

(assert (=> d!32247 (=> res!55889 e!73695)))

(declare-fun lt!58785 () Bool)

(assert (=> d!32247 (= res!55889 (not lt!58785))))

(declare-fun lt!58788 () Bool)

(assert (=> d!32247 (= lt!58785 lt!58788)))

(declare-fun lt!58787 () Unit!3498)

(declare-fun e!73694 () Unit!3498)

(assert (=> d!32247 (= lt!58787 e!73694)))

(declare-fun c!20314 () Bool)

(assert (=> d!32247 (= c!20314 lt!58788)))

(assert (=> d!32247 (= lt!58788 (containsKey!164 (toList!795 lt!58630) (_1!1216 lt!58336)))))

(assert (=> d!32247 (= (contains!834 lt!58630 (_1!1216 lt!58336)) lt!58785)))

(declare-fun b!113400 () Bool)

(declare-fun lt!58786 () Unit!3498)

(assert (=> b!113400 (= e!73694 lt!58786)))

(assert (=> b!113400 (= lt!58786 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58630) (_1!1216 lt!58336)))))

(assert (=> b!113400 (isDefined!113 (getValueByKey!161 (toList!795 lt!58630) (_1!1216 lt!58336)))))

(declare-fun b!113401 () Bool)

(declare-fun Unit!3522 () Unit!3498)

(assert (=> b!113401 (= e!73694 Unit!3522)))

(declare-fun b!113402 () Bool)

(assert (=> b!113402 (= e!73695 (isDefined!113 (getValueByKey!161 (toList!795 lt!58630) (_1!1216 lt!58336))))))

(assert (= (and d!32247 c!20314) b!113400))

(assert (= (and d!32247 (not c!20314)) b!113401))

(assert (= (and d!32247 (not res!55889)) b!113402))

(declare-fun m!129521 () Bool)

(assert (=> d!32247 m!129521))

(declare-fun m!129523 () Bool)

(assert (=> b!113400 m!129523))

(assert (=> b!113400 m!129071))

(assert (=> b!113400 m!129071))

(declare-fun m!129525 () Bool)

(assert (=> b!113400 m!129525))

(assert (=> b!113402 m!129071))

(assert (=> b!113402 m!129071))

(assert (=> b!113402 m!129525))

(assert (=> d!32127 d!32247))

(declare-fun b!113406 () Bool)

(declare-fun e!73697 () Option!167)

(assert (=> b!113406 (= e!73697 None!165)))

(declare-fun b!113403 () Bool)

(declare-fun e!73696 () Option!167)

(assert (=> b!113403 (= e!73696 (Some!166 (_2!1216 (h!2216 lt!58628))))))

(declare-fun b!113404 () Bool)

(assert (=> b!113404 (= e!73696 e!73697)))

(declare-fun c!20316 () Bool)

(assert (=> b!113404 (= c!20316 (and ((_ is Cons!1616) lt!58628) (not (= (_1!1216 (h!2216 lt!58628)) (_1!1216 lt!58336)))))))

(declare-fun b!113405 () Bool)

(assert (=> b!113405 (= e!73697 (getValueByKey!161 (t!5786 lt!58628) (_1!1216 lt!58336)))))

(declare-fun d!32249 () Bool)

(declare-fun c!20315 () Bool)

(assert (=> d!32249 (= c!20315 (and ((_ is Cons!1616) lt!58628) (= (_1!1216 (h!2216 lt!58628)) (_1!1216 lt!58336))))))

(assert (=> d!32249 (= (getValueByKey!161 lt!58628 (_1!1216 lt!58336)) e!73696)))

(assert (= (and d!32249 c!20315) b!113403))

(assert (= (and d!32249 (not c!20315)) b!113404))

(assert (= (and b!113404 c!20316) b!113405))

(assert (= (and b!113404 (not c!20316)) b!113406))

(declare-fun m!129527 () Bool)

(assert (=> b!113405 m!129527))

(assert (=> d!32127 d!32249))

(declare-fun d!32251 () Bool)

(assert (=> d!32251 (= (getValueByKey!161 lt!58628 (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336)))))

(declare-fun lt!58789 () Unit!3498)

(assert (=> d!32251 (= lt!58789 (choose!722 lt!58628 (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(declare-fun e!73698 () Bool)

(assert (=> d!32251 e!73698))

(declare-fun res!55890 () Bool)

(assert (=> d!32251 (=> (not res!55890) (not e!73698))))

(assert (=> d!32251 (= res!55890 (isStrictlySorted!300 lt!58628))))

(assert (=> d!32251 (= (lemmaContainsTupThenGetReturnValue!77 lt!58628 (_1!1216 lt!58336) (_2!1216 lt!58336)) lt!58789)))

(declare-fun b!113407 () Bool)

(declare-fun res!55891 () Bool)

(assert (=> b!113407 (=> (not res!55891) (not e!73698))))

(assert (=> b!113407 (= res!55891 (containsKey!164 lt!58628 (_1!1216 lt!58336)))))

(declare-fun b!113408 () Bool)

(assert (=> b!113408 (= e!73698 (contains!836 lt!58628 (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336))))))

(assert (= (and d!32251 res!55890) b!113407))

(assert (= (and b!113407 res!55891) b!113408))

(assert (=> d!32251 m!129065))

(declare-fun m!129529 () Bool)

(assert (=> d!32251 m!129529))

(declare-fun m!129531 () Bool)

(assert (=> d!32251 m!129531))

(declare-fun m!129533 () Bool)

(assert (=> b!113407 m!129533))

(declare-fun m!129535 () Bool)

(assert (=> b!113408 m!129535))

(assert (=> d!32127 d!32251))

(declare-fun b!113409 () Bool)

(declare-fun e!73702 () List!1620)

(declare-fun call!12221 () List!1620)

(assert (=> b!113409 (= e!73702 call!12221)))

(declare-fun e!73700 () List!1620)

(declare-fun c!20319 () Bool)

(declare-fun c!20317 () Bool)

(declare-fun b!113410 () Bool)

(assert (=> b!113410 (= e!73700 (ite c!20317 (t!5786 (toList!795 (+!150 lt!58328 lt!58330))) (ite c!20319 (Cons!1616 (h!2216 (toList!795 (+!150 lt!58328 lt!58330))) (t!5786 (toList!795 (+!150 lt!58328 lt!58330)))) Nil!1617)))))

(declare-fun bm!12217 () Bool)

(declare-fun call!12220 () List!1620)

(assert (=> bm!12217 (= call!12220 call!12221)))

(declare-fun b!113411 () Bool)

(assert (=> b!113411 (= e!73700 (insertStrictlySorted!80 (t!5786 (toList!795 (+!150 lt!58328 lt!58330))) (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(declare-fun b!113412 () Bool)

(declare-fun e!73703 () List!1620)

(declare-fun call!12222 () List!1620)

(assert (=> b!113412 (= e!73703 call!12222)))

(declare-fun d!32253 () Bool)

(declare-fun e!73701 () Bool)

(assert (=> d!32253 e!73701))

(declare-fun res!55892 () Bool)

(assert (=> d!32253 (=> (not res!55892) (not e!73701))))

(declare-fun lt!58790 () List!1620)

(assert (=> d!32253 (= res!55892 (isStrictlySorted!300 lt!58790))))

(assert (=> d!32253 (= lt!58790 e!73703)))

(declare-fun c!20318 () Bool)

(assert (=> d!32253 (= c!20318 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58330))) (bvslt (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58330)))) (_1!1216 lt!58336))))))

(assert (=> d!32253 (isStrictlySorted!300 (toList!795 (+!150 lt!58328 lt!58330)))))

(assert (=> d!32253 (= (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 lt!58330)) (_1!1216 lt!58336) (_2!1216 lt!58336)) lt!58790)))

(declare-fun b!113413 () Bool)

(declare-fun e!73699 () List!1620)

(assert (=> b!113413 (= e!73699 call!12220)))

(declare-fun b!113414 () Bool)

(assert (=> b!113414 (= e!73699 call!12220)))

(declare-fun b!113415 () Bool)

(assert (=> b!113415 (= e!73701 (contains!836 lt!58790 (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336))))))

(declare-fun bm!12218 () Bool)

(assert (=> bm!12218 (= call!12221 call!12222)))

(declare-fun bm!12219 () Bool)

(assert (=> bm!12219 (= call!12222 ($colon$colon!84 e!73700 (ite c!20318 (h!2216 (toList!795 (+!150 lt!58328 lt!58330))) (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336)))))))

(declare-fun c!20320 () Bool)

(assert (=> bm!12219 (= c!20320 c!20318)))

(declare-fun b!113416 () Bool)

(assert (=> b!113416 (= e!73703 e!73702)))

(assert (=> b!113416 (= c!20317 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58330))) (= (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58330)))) (_1!1216 lt!58336))))))

(declare-fun b!113417 () Bool)

(assert (=> b!113417 (= c!20319 (and ((_ is Cons!1616) (toList!795 (+!150 lt!58328 lt!58330))) (bvsgt (_1!1216 (h!2216 (toList!795 (+!150 lt!58328 lt!58330)))) (_1!1216 lt!58336))))))

(assert (=> b!113417 (= e!73702 e!73699)))

(declare-fun b!113418 () Bool)

(declare-fun res!55893 () Bool)

(assert (=> b!113418 (=> (not res!55893) (not e!73701))))

(assert (=> b!113418 (= res!55893 (containsKey!164 lt!58790 (_1!1216 lt!58336)))))

(assert (= (and d!32253 c!20318) b!113412))

(assert (= (and d!32253 (not c!20318)) b!113416))

(assert (= (and b!113416 c!20317) b!113409))

(assert (= (and b!113416 (not c!20317)) b!113417))

(assert (= (and b!113417 c!20319) b!113413))

(assert (= (and b!113417 (not c!20319)) b!113414))

(assert (= (or b!113413 b!113414) bm!12217))

(assert (= (or b!113409 bm!12217) bm!12218))

(assert (= (or b!113412 bm!12218) bm!12219))

(assert (= (and bm!12219 c!20320) b!113411))

(assert (= (and bm!12219 (not c!20320)) b!113410))

(assert (= (and d!32253 res!55892) b!113418))

(assert (= (and b!113418 res!55893) b!113415))

(declare-fun m!129537 () Bool)

(assert (=> b!113418 m!129537))

(declare-fun m!129539 () Bool)

(assert (=> bm!12219 m!129539))

(declare-fun m!129541 () Bool)

(assert (=> b!113411 m!129541))

(declare-fun m!129543 () Bool)

(assert (=> b!113415 m!129543))

(declare-fun m!129545 () Bool)

(assert (=> d!32253 m!129545))

(declare-fun m!129547 () Bool)

(assert (=> d!32253 m!129547))

(assert (=> d!32127 d!32253))

(assert (=> b!112928 d!32163))

(assert (=> b!113095 d!32241))

(declare-fun d!32255 () Bool)

(assert (=> d!32255 (= (+!150 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 lt!58327)) (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) lt!58586 (zeroValue!2528 newMap!16) lt!58327 #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58793 () Unit!3498)

(declare-fun choose!724 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 V!3257 Int) Unit!3498)

(assert (=> d!32255 (= lt!58793 (choose!724 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58586 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58327 (defaultEntry!2660 newMap!16)))))

(assert (=> d!32255 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32255 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) lt!58586 (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) lt!58327 (defaultEntry!2660 newMap!16)) lt!58793)))

(declare-fun bs!4653 () Bool)

(assert (= bs!4653 d!32255))

(declare-fun m!129549 () Bool)

(assert (=> bs!4653 m!129549))

(assert (=> bs!4653 m!128877))

(declare-fun m!129551 () Bool)

(assert (=> bs!4653 m!129551))

(assert (=> bs!4653 m!128877))

(declare-fun m!129553 () Bool)

(assert (=> bs!4653 m!129553))

(assert (=> bs!4653 m!129121))

(assert (=> b!113048 d!32255))

(declare-fun d!32257 () Bool)

(assert (=> d!32257 (not (contains!834 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617)) lt!58616))))

(declare-fun lt!58796 () Unit!3498)

(declare-fun choose!725 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> d!32257 (= lt!58796 (choose!725 lt!58619 lt!58620 lt!58617 lt!58616))))

(declare-fun e!73706 () Bool)

(assert (=> d!32257 e!73706))

(declare-fun res!55896 () Bool)

(assert (=> d!32257 (=> (not res!55896) (not e!73706))))

(assert (=> d!32257 (= res!55896 (not (contains!834 lt!58619 lt!58616)))))

(assert (=> d!32257 (= (addStillNotContains!52 lt!58619 lt!58620 lt!58617 lt!58616) lt!58796)))

(declare-fun b!113422 () Bool)

(assert (=> b!113422 (= e!73706 (not (= lt!58620 lt!58616)))))

(assert (= (and d!32257 res!55896) b!113422))

(assert (=> d!32257 m!129035))

(assert (=> d!32257 m!129035))

(assert (=> d!32257 m!129039))

(declare-fun m!129555 () Bool)

(assert (=> d!32257 m!129555))

(declare-fun m!129557 () Bool)

(assert (=> d!32257 m!129557))

(assert (=> b!113099 d!32257))

(assert (=> b!113099 d!32159))

(declare-fun d!32259 () Bool)

(declare-fun e!73707 () Bool)

(assert (=> d!32259 e!73707))

(declare-fun res!55898 () Bool)

(assert (=> d!32259 (=> (not res!55898) (not e!73707))))

(declare-fun lt!58800 () ListLongMap!1559)

(assert (=> d!32259 (= res!55898 (contains!834 lt!58800 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!58798 () List!1620)

(assert (=> d!32259 (= lt!58800 (ListLongMap!1560 lt!58798))))

(declare-fun lt!58797 () Unit!3498)

(declare-fun lt!58799 () Unit!3498)

(assert (=> d!32259 (= lt!58797 lt!58799)))

(assert (=> d!32259 (= (getValueByKey!161 lt!58798 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32259 (= lt!58799 (lemmaContainsTupThenGetReturnValue!77 lt!58798 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32259 (= lt!58798 (insertStrictlySorted!80 (toList!795 call!12184) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!32259 (= (+!150 call!12184 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!58800)))

(declare-fun b!113423 () Bool)

(declare-fun res!55897 () Bool)

(assert (=> b!113423 (=> (not res!55897) (not e!73707))))

(assert (=> b!113423 (= res!55897 (= (getValueByKey!161 (toList!795 lt!58800) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!113424 () Bool)

(assert (=> b!113424 (= e!73707 (contains!836 (toList!795 lt!58800) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1367 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!32259 res!55898) b!113423))

(assert (= (and b!113423 res!55897) b!113424))

(declare-fun m!129559 () Bool)

(assert (=> d!32259 m!129559))

(declare-fun m!129561 () Bool)

(assert (=> d!32259 m!129561))

(declare-fun m!129563 () Bool)

(assert (=> d!32259 m!129563))

(declare-fun m!129565 () Bool)

(assert (=> d!32259 m!129565))

(declare-fun m!129567 () Bool)

(assert (=> b!113423 m!129567))

(declare-fun m!129569 () Bool)

(assert (=> b!113424 m!129569))

(assert (=> b!113099 d!32259))

(declare-fun d!32261 () Bool)

(declare-fun e!73708 () Bool)

(assert (=> d!32261 e!73708))

(declare-fun res!55900 () Bool)

(assert (=> d!32261 (=> (not res!55900) (not e!73708))))

(declare-fun lt!58804 () ListLongMap!1559)

(assert (=> d!32261 (= res!55900 (contains!834 lt!58804 (_1!1216 (tuple2!2411 lt!58620 lt!58617))))))

(declare-fun lt!58802 () List!1620)

(assert (=> d!32261 (= lt!58804 (ListLongMap!1560 lt!58802))))

(declare-fun lt!58801 () Unit!3498)

(declare-fun lt!58803 () Unit!3498)

(assert (=> d!32261 (= lt!58801 lt!58803)))

(assert (=> d!32261 (= (getValueByKey!161 lt!58802 (_1!1216 (tuple2!2411 lt!58620 lt!58617))) (Some!166 (_2!1216 (tuple2!2411 lt!58620 lt!58617))))))

(assert (=> d!32261 (= lt!58803 (lemmaContainsTupThenGetReturnValue!77 lt!58802 (_1!1216 (tuple2!2411 lt!58620 lt!58617)) (_2!1216 (tuple2!2411 lt!58620 lt!58617))))))

(assert (=> d!32261 (= lt!58802 (insertStrictlySorted!80 (toList!795 lt!58619) (_1!1216 (tuple2!2411 lt!58620 lt!58617)) (_2!1216 (tuple2!2411 lt!58620 lt!58617))))))

(assert (=> d!32261 (= (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617)) lt!58804)))

(declare-fun b!113425 () Bool)

(declare-fun res!55899 () Bool)

(assert (=> b!113425 (=> (not res!55899) (not e!73708))))

(assert (=> b!113425 (= res!55899 (= (getValueByKey!161 (toList!795 lt!58804) (_1!1216 (tuple2!2411 lt!58620 lt!58617))) (Some!166 (_2!1216 (tuple2!2411 lt!58620 lt!58617)))))))

(declare-fun b!113426 () Bool)

(assert (=> b!113426 (= e!73708 (contains!836 (toList!795 lt!58804) (tuple2!2411 lt!58620 lt!58617)))))

(assert (= (and d!32261 res!55900) b!113425))

(assert (= (and b!113425 res!55899) b!113426))

(declare-fun m!129571 () Bool)

(assert (=> d!32261 m!129571))

(declare-fun m!129573 () Bool)

(assert (=> d!32261 m!129573))

(declare-fun m!129575 () Bool)

(assert (=> d!32261 m!129575))

(declare-fun m!129577 () Bool)

(assert (=> d!32261 m!129577))

(declare-fun m!129579 () Bool)

(assert (=> b!113425 m!129579))

(declare-fun m!129581 () Bool)

(assert (=> b!113426 m!129581))

(assert (=> b!113099 d!32261))

(declare-fun d!32263 () Bool)

(declare-fun e!73710 () Bool)

(assert (=> d!32263 e!73710))

(declare-fun res!55901 () Bool)

(assert (=> d!32263 (=> res!55901 e!73710)))

(declare-fun lt!58805 () Bool)

(assert (=> d!32263 (= res!55901 (not lt!58805))))

(declare-fun lt!58808 () Bool)

(assert (=> d!32263 (= lt!58805 lt!58808)))

(declare-fun lt!58807 () Unit!3498)

(declare-fun e!73709 () Unit!3498)

(assert (=> d!32263 (= lt!58807 e!73709)))

(declare-fun c!20321 () Bool)

(assert (=> d!32263 (= c!20321 lt!58808)))

(assert (=> d!32263 (= lt!58808 (containsKey!164 (toList!795 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617))) lt!58616))))

(assert (=> d!32263 (= (contains!834 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617)) lt!58616) lt!58805)))

(declare-fun b!113427 () Bool)

(declare-fun lt!58806 () Unit!3498)

(assert (=> b!113427 (= e!73709 lt!58806)))

(assert (=> b!113427 (= lt!58806 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617))) lt!58616))))

(assert (=> b!113427 (isDefined!113 (getValueByKey!161 (toList!795 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617))) lt!58616))))

(declare-fun b!113428 () Bool)

(declare-fun Unit!3523 () Unit!3498)

(assert (=> b!113428 (= e!73709 Unit!3523)))

(declare-fun b!113429 () Bool)

(assert (=> b!113429 (= e!73710 (isDefined!113 (getValueByKey!161 (toList!795 (+!150 lt!58619 (tuple2!2411 lt!58620 lt!58617))) lt!58616)))))

(assert (= (and d!32263 c!20321) b!113427))

(assert (= (and d!32263 (not c!20321)) b!113428))

(assert (= (and d!32263 (not res!55901)) b!113429))

(declare-fun m!129583 () Bool)

(assert (=> d!32263 m!129583))

(declare-fun m!129585 () Bool)

(assert (=> b!113427 m!129585))

(declare-fun m!129587 () Bool)

(assert (=> b!113427 m!129587))

(assert (=> b!113427 m!129587))

(declare-fun m!129589 () Bool)

(assert (=> b!113427 m!129589))

(assert (=> b!113429 m!129587))

(assert (=> b!113429 m!129587))

(assert (=> b!113429 m!129589))

(assert (=> b!113099 d!32263))

(declare-fun d!32265 () Bool)

(declare-fun e!73713 () Bool)

(assert (=> d!32265 e!73713))

(declare-fun c!20324 () Bool)

(assert (=> d!32265 (= c!20324 (and (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!32265 true))

(declare-fun _$29!153 () Unit!3498)

(assert (=> d!32265 (= (choose!717 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (_values!2643 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992))) (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) (minValue!2528 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992)))) _$29!153)))

(declare-fun b!113434 () Bool)

(assert (=> b!113434 (= e!73713 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!113435 () Bool)

(assert (=> b!113435 (= e!73713 (ite (= (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!32265 c!20324) b!113434))

(assert (= (and d!32265 (not c!20324)) b!113435))

(assert (=> b!113434 m!128675))

(assert (=> b!113434 m!128689))

(assert (=> d!32111 d!32265))

(assert (=> d!32111 d!32129))

(declare-fun b!113436 () Bool)

(declare-fun e!73715 () Bool)

(declare-fun e!73714 () Bool)

(assert (=> b!113436 (= e!73715 e!73714)))

(declare-fun c!20325 () Bool)

(assert (=> b!113436 (= c!20325 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!113437 () Bool)

(declare-fun e!73717 () Bool)

(assert (=> b!113437 (= e!73717 e!73715)))

(declare-fun res!55902 () Bool)

(assert (=> b!113437 (=> (not res!55902) (not e!73715))))

(declare-fun e!73716 () Bool)

(assert (=> b!113437 (= res!55902 (not e!73716))))

(declare-fun res!55904 () Bool)

(assert (=> b!113437 (=> (not res!55904) (not e!73716))))

(assert (=> b!113437 (= res!55904 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!12220 () Bool)

(declare-fun call!12223 () Bool)

(assert (=> bm!12220 (= call!12223 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20325 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!20182 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616) Nil!1616)) (ite c!20182 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616) Nil!1616))))))

(declare-fun b!113438 () Bool)

(assert (=> b!113438 (= e!73714 call!12223)))

(declare-fun b!113439 () Bool)

(assert (=> b!113439 (= e!73714 call!12223)))

(declare-fun b!113440 () Bool)

(assert (=> b!113440 (= e!73716 (contains!835 (ite c!20182 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616) Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!32267 () Bool)

(declare-fun res!55903 () Bool)

(assert (=> d!32267 (=> res!55903 e!73717)))

(assert (=> d!32267 (= res!55903 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32267 (= (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!20182 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) Nil!1616) Nil!1616)) e!73717)))

(assert (= (and d!32267 (not res!55903)) b!113437))

(assert (= (and b!113437 res!55904) b!113440))

(assert (= (and b!113437 res!55902) b!113436))

(assert (= (and b!113436 c!20325) b!113439))

(assert (= (and b!113436 (not c!20325)) b!113438))

(assert (= (or b!113439 b!113438) bm!12220))

(declare-fun m!129591 () Bool)

(assert (=> b!113436 m!129591))

(assert (=> b!113436 m!129591))

(declare-fun m!129593 () Bool)

(assert (=> b!113436 m!129593))

(assert (=> b!113437 m!129591))

(assert (=> b!113437 m!129591))

(assert (=> b!113437 m!129593))

(assert (=> bm!12220 m!129591))

(declare-fun m!129595 () Bool)

(assert (=> bm!12220 m!129595))

(assert (=> b!113440 m!129591))

(assert (=> b!113440 m!129591))

(declare-fun m!129597 () Bool)

(assert (=> b!113440 m!129597))

(assert (=> bm!12106 d!32267))

(declare-fun b!113444 () Bool)

(declare-fun e!73719 () Option!167)

(assert (=> b!113444 (= e!73719 None!165)))

(declare-fun b!113441 () Bool)

(declare-fun e!73718 () Option!167)

(assert (=> b!113441 (= e!73718 (Some!166 (_2!1216 (h!2216 (toList!795 lt!58626)))))))

(declare-fun b!113442 () Bool)

(assert (=> b!113442 (= e!73718 e!73719)))

(declare-fun c!20327 () Bool)

(assert (=> b!113442 (= c!20327 (and ((_ is Cons!1616) (toList!795 lt!58626)) (not (= (_1!1216 (h!2216 (toList!795 lt!58626))) (_1!1216 lt!58330)))))))

(declare-fun b!113443 () Bool)

(assert (=> b!113443 (= e!73719 (getValueByKey!161 (t!5786 (toList!795 lt!58626)) (_1!1216 lt!58330)))))

(declare-fun d!32269 () Bool)

(declare-fun c!20326 () Bool)

(assert (=> d!32269 (= c!20326 (and ((_ is Cons!1616) (toList!795 lt!58626)) (= (_1!1216 (h!2216 (toList!795 lt!58626))) (_1!1216 lt!58330))))))

(assert (=> d!32269 (= (getValueByKey!161 (toList!795 lt!58626) (_1!1216 lt!58330)) e!73718)))

(assert (= (and d!32269 c!20326) b!113441))

(assert (= (and d!32269 (not c!20326)) b!113442))

(assert (= (and b!113442 c!20327) b!113443))

(assert (= (and b!113442 (not c!20327)) b!113444))

(declare-fun m!129599 () Bool)

(assert (=> b!113443 m!129599))

(assert (=> b!113104 d!32269))

(declare-fun d!32271 () Bool)

(declare-fun e!73722 () Bool)

(assert (=> d!32271 e!73722))

(declare-fun res!55909 () Bool)

(assert (=> d!32271 (=> (not res!55909) (not e!73722))))

(declare-fun lt!58813 () SeekEntryResult!257)

(assert (=> d!32271 (= res!55909 ((_ is Found!257) lt!58813))))

(assert (=> d!32271 (= lt!58813 (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun lt!58814 () Unit!3498)

(declare-fun choose!726 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) Int) Unit!3498)

(assert (=> d!32271 (= lt!58814 (choose!726 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32271 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32271 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)) lt!58814)))

(declare-fun b!113449 () Bool)

(declare-fun res!55910 () Bool)

(assert (=> b!113449 (=> (not res!55910) (not e!73722))))

(assert (=> b!113449 (= res!55910 (inRange!0 (index!3181 lt!58813) (mask!6844 newMap!16)))))

(declare-fun b!113450 () Bool)

(assert (=> b!113450 (= e!73722 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58813)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> b!113450 (and (bvsge (index!3181 lt!58813) #b00000000000000000000000000000000) (bvslt (index!3181 lt!58813) (size!2343 (_keys!4380 newMap!16))))))

(assert (= (and d!32271 res!55909) b!113449))

(assert (= (and b!113449 res!55910) b!113450))

(assert (=> d!32271 m!128675))

(assert (=> d!32271 m!128961))

(assert (=> d!32271 m!128675))

(declare-fun m!129601 () Bool)

(assert (=> d!32271 m!129601))

(assert (=> d!32271 m!129121))

(declare-fun m!129603 () Bool)

(assert (=> b!113449 m!129603))

(declare-fun m!129605 () Bool)

(assert (=> b!113450 m!129605))

(assert (=> bm!12164 d!32271))

(declare-fun b!113485 () Bool)

(declare-fun e!73740 () Unit!3498)

(declare-fun Unit!3524 () Unit!3498)

(assert (=> b!113485 (= e!73740 Unit!3524)))

(declare-fun lt!58891 () Unit!3498)

(declare-fun lemmaArrayContainsKeyThenInListMap!34 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 64) (_ BitVec 32) Int) Unit!3498)

(assert (=> b!113485 (= lt!58891 (lemmaArrayContainsKeyThenInListMap!34 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(assert (=> b!113485 (contains!834 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))

(declare-fun lt!58876 () Unit!3498)

(assert (=> b!113485 (= lt!58876 lt!58891)))

(assert (=> b!113485 false))

(declare-fun b!113486 () Bool)

(declare-fun e!73744 () Unit!3498)

(declare-fun Unit!3525 () Unit!3498)

(assert (=> b!113486 (= e!73744 Unit!3525)))

(declare-fun lt!58880 () Unit!3498)

(assert (=> b!113486 (= lt!58880 (lemmaInListMapThenSeekEntryOrOpenFindsIt!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58902 () SeekEntryResult!257)

(declare-fun call!12235 () SeekEntryResult!257)

(assert (=> b!113486 (= lt!58902 call!12235)))

(declare-fun res!55931 () Bool)

(assert (=> b!113486 (= res!55931 ((_ is Found!257) lt!58902))))

(declare-fun e!73746 () Bool)

(assert (=> b!113486 (=> (not res!55931) (not e!73746))))

(assert (=> b!113486 e!73746))

(declare-fun lt!58882 () Unit!3498)

(assert (=> b!113486 (= lt!58882 lt!58880)))

(assert (=> b!113486 false))

(declare-fun b!113487 () Bool)

(declare-fun res!55933 () Bool)

(declare-fun e!73741 () Bool)

(assert (=> b!113487 (=> (not res!55933) (not e!73741))))

(declare-fun lt!58875 () SeekEntryResult!257)

(assert (=> b!113487 (= res!55933 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3180 lt!58875)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113488 () Bool)

(declare-fun e!73739 () Bool)

(declare-fun e!73745 () Bool)

(assert (=> b!113488 (= e!73739 e!73745)))

(declare-fun res!55930 () Bool)

(declare-fun call!12232 () Bool)

(assert (=> b!113488 (= res!55930 call!12232)))

(assert (=> b!113488 (=> (not res!55930) (not e!73745))))

(declare-fun b!113489 () Bool)

(declare-fun res!55936 () Bool)

(declare-fun e!73742 () Bool)

(assert (=> b!113489 (=> (not res!55936) (not e!73742))))

(declare-fun lt!58886 () tuple2!2412)

(assert (=> b!113489 (= res!55936 (valid!442 (_2!1217 lt!58886)))))

(declare-fun b!113490 () Bool)

(declare-fun lt!58896 () Unit!3498)

(assert (=> b!113490 (= e!73744 lt!58896)))

(assert (=> b!113490 (= lt!58896 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!51 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (defaultEntry!2660 newMap!16)))))

(assert (=> b!113490 (= lt!58875 call!12235)))

(declare-fun c!20339 () Bool)

(assert (=> b!113490 (= c!20339 ((_ is MissingZero!257) lt!58875))))

(declare-fun e!73743 () Bool)

(assert (=> b!113490 e!73743))

(declare-fun bm!12229 () Bool)

(declare-fun call!12233 () Bool)

(declare-fun c!20336 () Bool)

(assert (=> bm!12229 (= call!12233 (inRange!0 (ite c!20336 (index!3181 lt!58902) (ite c!20339 (index!3180 lt!58875) (index!3183 lt!58875))) (mask!6844 newMap!16)))))

(declare-fun b!113491 () Bool)

(declare-fun Unit!3526 () Unit!3498)

(assert (=> b!113491 (= e!73740 Unit!3526)))

(declare-fun b!113493 () Bool)

(declare-fun res!55932 () Bool)

(assert (=> b!113493 (=> (not res!55932) (not e!73741))))

(assert (=> b!113493 (= res!55932 call!12232)))

(assert (=> b!113493 (= e!73743 e!73741)))

(declare-fun b!113494 () Bool)

(assert (=> b!113494 (= e!73742 (= (map!1303 (_2!1217 lt!58886)) (+!150 (map!1303 newMap!16) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun bm!12230 () Bool)

(declare-fun call!12234 () Bool)

(assert (=> bm!12230 (= call!12234 (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!113495 () Bool)

(declare-fun res!55934 () Bool)

(assert (=> b!113495 (= res!55934 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3183 lt!58875)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113495 (=> (not res!55934) (not e!73745))))

(declare-fun b!113496 () Bool)

(declare-fun res!55935 () Bool)

(assert (=> b!113496 (=> (not res!55935) (not e!73742))))

(assert (=> b!113496 (= res!55935 (contains!834 (map!1303 (_2!1217 lt!58886)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun bm!12231 () Bool)

(assert (=> bm!12231 (= call!12235 (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (mask!6844 newMap!16)))))

(declare-fun b!113492 () Bool)

(assert (=> b!113492 (= e!73741 (not call!12234))))

(declare-fun d!32273 () Bool)

(assert (=> d!32273 e!73742))

(declare-fun res!55937 () Bool)

(assert (=> d!32273 (=> (not res!55937) (not e!73742))))

(assert (=> d!32273 (= res!55937 (_1!1217 lt!58886))))

(assert (=> d!32273 (= lt!58886 (tuple2!2413 true (LongMapFixedSize!929 (defaultEntry!2660 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (bvadd (_size!513 newMap!16) #b00000000000000000000000000000001) (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))) (_vacant!513 newMap!16))))))

(declare-fun lt!58879 () Unit!3498)

(declare-fun lt!58899 () Unit!3498)

(assert (=> d!32273 (= lt!58879 lt!58899)))

(declare-fun lt!58892 () array!4401)

(declare-fun lt!58881 () array!4399)

(assert (=> d!32273 (contains!834 (getCurrentListMap!479 lt!58881 lt!58892 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565))))))

(assert (=> d!32273 (= lt!58899 (lemmaValidKeyInArrayIsInListMap!111 lt!58881 lt!58892 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (defaultEntry!2660 newMap!16)))))

(assert (=> d!32273 (= lt!58892 (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))))))

(assert (=> d!32273 (= lt!58881 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun lt!58901 () Unit!3498)

(declare-fun lt!58888 () Unit!3498)

(assert (=> d!32273 (= lt!58901 lt!58888)))

(declare-fun lt!58904 () array!4399)

(assert (=> d!32273 (= (arrayCountValidKeys!0 lt!58904 (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (bvadd (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4399 (_ BitVec 32)) Unit!3498)

(assert (=> d!32273 (= lt!58888 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!58904 (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565))))))

(assert (=> d!32273 (= lt!58904 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun lt!58893 () Unit!3498)

(declare-fun lt!58900 () Unit!3498)

(assert (=> d!32273 (= lt!58893 lt!58900)))

(declare-fun lt!58895 () array!4399)

(assert (=> d!32273 (arrayContainsKey!0 lt!58895 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!32273 (= lt!58900 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!58895 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565))))))

(assert (=> d!32273 (= lt!58895 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun lt!58890 () Unit!3498)

(declare-fun lt!58889 () Unit!3498)

(assert (=> d!32273 (= lt!58890 lt!58889)))

(assert (=> d!32273 (= (+!150 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (getCurrentListMap!479 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))) (array!4402 (store (arr!2085 (_values!2643 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (ValueCellFull!1010 lt!58327)) (size!2344 (_values!2643 newMap!16))) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!34 (array!4399 array!4401 (_ BitVec 32) (_ BitVec 32) V!3257 V!3257 (_ BitVec 32) (_ BitVec 64) V!3257 Int) Unit!3498)

(assert (=> d!32273 (= lt!58889 (lemmaAddValidKeyToArrayThenAddPairToListMap!34 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58884 () Unit!3498)

(declare-fun lt!58898 () Unit!3498)

(assert (=> d!32273 (= lt!58884 lt!58898)))

(assert (=> d!32273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))) (mask!6844 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4399 (_ BitVec 32) (_ BitVec 32)) Unit!3498)

(assert (=> d!32273 (= lt!58898 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (_keys!4380 newMap!16) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (mask!6844 newMap!16)))))

(declare-fun lt!58894 () Unit!3498)

(declare-fun lt!58903 () Unit!3498)

(assert (=> d!32273 (= lt!58894 lt!58903)))

(assert (=> d!32273 (= (arrayCountValidKeys!0 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))) #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4380 newMap!16) #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4399 (_ BitVec 32) (_ BitVec 64)) Unit!3498)

(assert (=> d!32273 (= lt!58903 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4380 newMap!16) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun lt!58883 () Unit!3498)

(declare-fun lt!58885 () Unit!3498)

(assert (=> d!32273 (= lt!58883 lt!58885)))

(declare-fun lt!58897 () List!1619)

(declare-fun lt!58877 () (_ BitVec 32))

(assert (=> d!32273 (arrayNoDuplicates!0 (array!4400 (store (arr!2084 (_keys!4380 newMap!16)) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) (size!2343 (_keys!4380 newMap!16))) lt!58877 lt!58897)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4399 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1619) Unit!3498)

(assert (=> d!32273 (= lt!58885 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565)) lt!58877 lt!58897))))

(assert (=> d!32273 (= lt!58897 Nil!1616)))

(assert (=> d!32273 (= lt!58877 #b00000000000000000000000000000000)))

(declare-fun lt!58887 () Unit!3498)

(assert (=> d!32273 (= lt!58887 e!73740)))

(declare-fun c!20338 () Bool)

(assert (=> d!32273 (= c!20338 (arrayContainsKey!0 (_keys!4380 newMap!16) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!58878 () Unit!3498)

(assert (=> d!32273 (= lt!58878 e!73744)))

(assert (=> d!32273 (= c!20336 (contains!834 (getCurrentListMap!479 (_keys!4380 newMap!16) (_values!2643 newMap!16) (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (=> d!32273 (valid!442 newMap!16)))

(assert (=> d!32273 (= (updateHelperNewKey!51 newMap!16 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 (ite c!20219 (index!3183 lt!58565) (index!3180 lt!58565))) lt!58886)))

(declare-fun b!113497 () Bool)

(assert (=> b!113497 (= e!73745 (not call!12234))))

(declare-fun b!113498 () Bool)

(assert (=> b!113498 (= e!73746 (= (select (arr!2084 (_keys!4380 newMap!16)) (index!3181 lt!58902)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun b!113499 () Bool)

(declare-fun c!20337 () Bool)

(assert (=> b!113499 (= c!20337 ((_ is MissingVacant!257) lt!58875))))

(assert (=> b!113499 (= e!73743 e!73739)))

(declare-fun b!113500 () Bool)

(assert (=> b!113500 (= e!73739 ((_ is Undefined!257) lt!58875))))

(declare-fun bm!12232 () Bool)

(assert (=> bm!12232 (= call!12232 call!12233)))

(declare-fun b!113501 () Bool)

(declare-fun res!55929 () Bool)

(assert (=> b!113501 (= res!55929 call!12233)))

(assert (=> b!113501 (=> (not res!55929) (not e!73746))))

(assert (= (and d!32273 c!20336) b!113486))

(assert (= (and d!32273 (not c!20336)) b!113490))

(assert (= (and b!113486 res!55931) b!113501))

(assert (= (and b!113501 res!55929) b!113498))

(assert (= (and b!113490 c!20339) b!113493))

(assert (= (and b!113490 (not c!20339)) b!113499))

(assert (= (and b!113493 res!55932) b!113487))

(assert (= (and b!113487 res!55933) b!113492))

(assert (= (and b!113499 c!20337) b!113488))

(assert (= (and b!113499 (not c!20337)) b!113500))

(assert (= (and b!113488 res!55930) b!113495))

(assert (= (and b!113495 res!55934) b!113497))

(assert (= (or b!113493 b!113488) bm!12232))

(assert (= (or b!113492 b!113497) bm!12230))

(assert (= (or b!113501 bm!12232) bm!12229))

(assert (= (or b!113486 b!113490) bm!12231))

(assert (= (and d!32273 c!20338) b!113485))

(assert (= (and d!32273 (not c!20338)) b!113491))

(assert (= (and d!32273 res!55937) b!113489))

(assert (= (and b!113489 res!55936) b!113496))

(assert (= (and b!113496 res!55935) b!113494))

(assert (=> d!32273 m!128675))

(declare-fun m!129607 () Bool)

(assert (=> d!32273 m!129607))

(assert (=> d!32273 m!128855))

(assert (=> d!32273 m!128877))

(assert (=> d!32273 m!129183))

(declare-fun m!129609 () Bool)

(assert (=> d!32273 m!129609))

(declare-fun m!129611 () Bool)

(assert (=> d!32273 m!129611))

(assert (=> d!32273 m!129609))

(declare-fun m!129613 () Bool)

(assert (=> d!32273 m!129613))

(declare-fun m!129615 () Bool)

(assert (=> d!32273 m!129615))

(assert (=> d!32273 m!128675))

(declare-fun m!129617 () Bool)

(assert (=> d!32273 m!129617))

(assert (=> d!32273 m!128675))

(declare-fun m!129619 () Bool)

(assert (=> d!32273 m!129619))

(declare-fun m!129621 () Bool)

(assert (=> d!32273 m!129621))

(assert (=> d!32273 m!128877))

(assert (=> d!32273 m!128697))

(assert (=> d!32273 m!128877))

(assert (=> d!32273 m!128675))

(declare-fun m!129623 () Bool)

(assert (=> d!32273 m!129623))

(declare-fun m!129625 () Bool)

(assert (=> d!32273 m!129625))

(declare-fun m!129627 () Bool)

(assert (=> d!32273 m!129627))

(declare-fun m!129629 () Bool)

(assert (=> d!32273 m!129629))

(assert (=> d!32273 m!128675))

(declare-fun m!129631 () Bool)

(assert (=> d!32273 m!129631))

(assert (=> d!32273 m!128675))

(assert (=> d!32273 m!128955))

(declare-fun m!129633 () Bool)

(assert (=> d!32273 m!129633))

(assert (=> d!32273 m!128675))

(declare-fun m!129635 () Bool)

(assert (=> d!32273 m!129635))

(declare-fun m!129637 () Bool)

(assert (=> d!32273 m!129637))

(declare-fun m!129639 () Bool)

(assert (=> d!32273 m!129639))

(assert (=> d!32273 m!129611))

(declare-fun m!129641 () Bool)

(assert (=> d!32273 m!129641))

(assert (=> d!32273 m!128675))

(declare-fun m!129643 () Bool)

(assert (=> d!32273 m!129643))

(assert (=> b!113485 m!128675))

(declare-fun m!129645 () Bool)

(assert (=> b!113485 m!129645))

(assert (=> b!113485 m!128877))

(assert (=> b!113485 m!128877))

(assert (=> b!113485 m!128675))

(assert (=> b!113485 m!129623))

(declare-fun m!129647 () Bool)

(assert (=> b!113495 m!129647))

(assert (=> bm!12230 m!128675))

(assert (=> bm!12230 m!128955))

(declare-fun m!129649 () Bool)

(assert (=> b!113494 m!129649))

(assert (=> b!113494 m!128671))

(assert (=> b!113494 m!128671))

(declare-fun m!129651 () Bool)

(assert (=> b!113494 m!129651))

(declare-fun m!129653 () Bool)

(assert (=> b!113487 m!129653))

(assert (=> b!113486 m!128675))

(assert (=> b!113486 m!128997))

(assert (=> b!113490 m!128675))

(assert (=> b!113490 m!128959))

(assert (=> bm!12231 m!128675))

(assert (=> bm!12231 m!128961))

(declare-fun m!129655 () Bool)

(assert (=> bm!12229 m!129655))

(assert (=> b!113496 m!129649))

(assert (=> b!113496 m!129649))

(assert (=> b!113496 m!128675))

(declare-fun m!129657 () Bool)

(assert (=> b!113496 m!129657))

(declare-fun m!129659 () Bool)

(assert (=> b!113498 m!129659))

(declare-fun m!129661 () Bool)

(assert (=> b!113489 m!129661))

(assert (=> bm!12157 d!32273))

(assert (=> b!112926 d!32109))

(declare-fun d!32275 () Bool)

(assert (=> d!32275 (isDefined!113 (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun lt!58907 () Unit!3498)

(declare-fun choose!727 (List!1620 (_ BitVec 64)) Unit!3498)

(assert (=> d!32275 (= lt!58907 (choose!727 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun e!73749 () Bool)

(assert (=> d!32275 e!73749))

(declare-fun res!55940 () Bool)

(assert (=> d!32275 (=> (not res!55940) (not e!73749))))

(assert (=> d!32275 (= res!55940 (isStrictlySorted!300 (toList!795 lt!58337)))))

(assert (=> d!32275 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) lt!58907)))

(declare-fun b!113504 () Bool)

(assert (=> b!113504 (= e!73749 (containsKey!164 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(assert (= (and d!32275 res!55940) b!113504))

(assert (=> d!32275 m!128675))

(assert (=> d!32275 m!128951))

(assert (=> d!32275 m!128951))

(assert (=> d!32275 m!128953))

(assert (=> d!32275 m!128675))

(declare-fun m!129663 () Bool)

(assert (=> d!32275 m!129663))

(declare-fun m!129665 () Bool)

(assert (=> d!32275 m!129665))

(assert (=> b!113504 m!128675))

(assert (=> b!113504 m!128947))

(assert (=> b!112939 d!32275))

(declare-fun d!32277 () Bool)

(declare-fun isEmpty!389 (Option!167) Bool)

(assert (=> d!32277 (= (isDefined!113 (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))) (not (isEmpty!389 (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))))

(declare-fun bs!4654 () Bool)

(assert (= bs!4654 d!32277))

(assert (=> bs!4654 m!128951))

(declare-fun m!129667 () Bool)

(assert (=> bs!4654 m!129667))

(assert (=> b!112939 d!32277))

(declare-fun b!113508 () Bool)

(declare-fun e!73751 () Option!167)

(assert (=> b!113508 (= e!73751 None!165)))

(declare-fun b!113505 () Bool)

(declare-fun e!73750 () Option!167)

(assert (=> b!113505 (= e!73750 (Some!166 (_2!1216 (h!2216 (toList!795 lt!58337)))))))

(declare-fun b!113506 () Bool)

(assert (=> b!113506 (= e!73750 e!73751)))

(declare-fun c!20341 () Bool)

(assert (=> b!113506 (= c!20341 (and ((_ is Cons!1616) (toList!795 lt!58337)) (not (= (_1!1216 (h!2216 (toList!795 lt!58337))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))))

(declare-fun b!113507 () Bool)

(assert (=> b!113507 (= e!73751 (getValueByKey!161 (t!5786 (toList!795 lt!58337)) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)))))

(declare-fun c!20340 () Bool)

(declare-fun d!32279 () Bool)

(assert (=> d!32279 (= c!20340 (and ((_ is Cons!1616) (toList!795 lt!58337)) (= (_1!1216 (h!2216 (toList!795 lt!58337))) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355))))))

(assert (=> d!32279 (= (getValueByKey!161 (toList!795 lt!58337) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355)) e!73750)))

(assert (= (and d!32279 c!20340) b!113505))

(assert (= (and d!32279 (not c!20340)) b!113506))

(assert (= (and b!113506 c!20341) b!113507))

(assert (= (and b!113506 (not c!20341)) b!113508))

(assert (=> b!113507 m!128675))

(declare-fun m!129669 () Bool)

(assert (=> b!113507 m!129669))

(assert (=> b!112939 d!32279))

(assert (=> d!32107 d!32113))

(declare-fun d!32281 () Bool)

(assert (=> d!32281 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) from!355 Nil!1616)))

(assert (=> d!32281 true))

(declare-fun _$71!159 () Unit!3498)

(assert (=> d!32281 (= (choose!39 (_keys!4380 (v!2959 (underlying!376 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!159)))

(declare-fun bs!4655 () Bool)

(assert (= bs!4655 d!32281))

(assert (=> bs!4655 m!128685))

(assert (=> d!32107 d!32281))

(declare-fun d!32283 () Bool)

(declare-fun isEmpty!390 (List!1620) Bool)

(assert (=> d!32283 (= (isEmpty!388 lt!58621) (isEmpty!390 (toList!795 lt!58621)))))

(declare-fun bs!4656 () Bool)

(assert (= bs!4656 d!32283))

(declare-fun m!129671 () Bool)

(assert (=> bs!4656 m!129671))

(assert (=> b!113101 d!32283))

(declare-fun d!32285 () Bool)

(declare-fun e!73753 () Bool)

(assert (=> d!32285 e!73753))

(declare-fun res!55941 () Bool)

(assert (=> d!32285 (=> res!55941 e!73753)))

(declare-fun lt!58908 () Bool)

(assert (=> d!32285 (= res!55941 (not lt!58908))))

(declare-fun lt!58911 () Bool)

(assert (=> d!32285 (= lt!58908 lt!58911)))

(declare-fun lt!58910 () Unit!3498)

(declare-fun e!73752 () Unit!3498)

(assert (=> d!32285 (= lt!58910 e!73752)))

(declare-fun c!20342 () Bool)

(assert (=> d!32285 (= c!20342 lt!58911)))

(assert (=> d!32285 (= lt!58911 (containsKey!164 (toList!795 lt!58471) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32285 (= (contains!834 lt!58471 #b0000000000000000000000000000000000000000000000000000000000000000) lt!58908)))

(declare-fun b!113509 () Bool)

(declare-fun lt!58909 () Unit!3498)

(assert (=> b!113509 (= e!73752 lt!58909)))

(assert (=> b!113509 (= lt!58909 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58471) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113509 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113510 () Bool)

(declare-fun Unit!3527 () Unit!3498)

(assert (=> b!113510 (= e!73752 Unit!3527)))

(declare-fun b!113511 () Bool)

(assert (=> b!113511 (= e!73753 (isDefined!113 (getValueByKey!161 (toList!795 lt!58471) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32285 c!20342) b!113509))

(assert (= (and d!32285 (not c!20342)) b!113510))

(assert (= (and d!32285 (not res!55941)) b!113511))

(declare-fun m!129673 () Bool)

(assert (=> d!32285 m!129673))

(declare-fun m!129675 () Bool)

(assert (=> b!113509 m!129675))

(assert (=> b!113509 m!129379))

(assert (=> b!113509 m!129379))

(declare-fun m!129677 () Bool)

(assert (=> b!113509 m!129677))

(assert (=> b!113511 m!129379))

(assert (=> b!113511 m!129379))

(assert (=> b!113511 m!129677))

(assert (=> bm!12099 d!32285))

(declare-fun b!113512 () Bool)

(declare-fun e!73755 () Bool)

(declare-fun call!12236 () Bool)

(assert (=> b!113512 (= e!73755 call!12236)))

(declare-fun d!32287 () Bool)

(declare-fun res!55943 () Bool)

(declare-fun e!73756 () Bool)

(assert (=> d!32287 (=> res!55943 e!73756)))

(assert (=> d!32287 (= res!55943 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32287 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))) e!73756)))

(declare-fun b!113513 () Bool)

(assert (=> b!113513 (= e!73756 e!73755)))

(declare-fun c!20343 () Bool)

(assert (=> b!113513 (= c!20343 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113514 () Bool)

(declare-fun e!73754 () Bool)

(assert (=> b!113514 (= e!73754 call!12236)))

(declare-fun b!113515 () Bool)

(assert (=> b!113515 (= e!73755 e!73754)))

(declare-fun lt!58914 () (_ BitVec 64))

(assert (=> b!113515 (= lt!58914 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!58913 () Unit!3498)

(assert (=> b!113515 (= lt!58913 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!113515 (arrayContainsKey!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) lt!58914 #b00000000000000000000000000000000)))

(declare-fun lt!58912 () Unit!3498)

(assert (=> b!113515 (= lt!58912 lt!58913)))

(declare-fun res!55942 () Bool)

(assert (=> b!113515 (= res!55942 (= (seekEntryOrOpen!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))) (Found!257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!113515 (=> (not res!55942) (not e!73754))))

(declare-fun bm!12233 () Bool)

(assert (=> bm!12233 (= call!12236 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4380 (v!2959 (underlying!376 thiss!992))) (mask!6844 (v!2959 (underlying!376 thiss!992)))))))

(assert (= (and d!32287 (not res!55943)) b!113513))

(assert (= (and b!113513 c!20343) b!113515))

(assert (= (and b!113513 (not c!20343)) b!113512))

(assert (= (and b!113515 res!55942) b!113514))

(assert (= (or b!113514 b!113512) bm!12233))

(declare-fun m!129679 () Bool)

(assert (=> b!113513 m!129679))

(assert (=> b!113513 m!129679))

(declare-fun m!129681 () Bool)

(assert (=> b!113513 m!129681))

(assert (=> b!113515 m!129679))

(declare-fun m!129683 () Bool)

(assert (=> b!113515 m!129683))

(declare-fun m!129685 () Bool)

(assert (=> b!113515 m!129685))

(assert (=> b!113515 m!129679))

(declare-fun m!129687 () Bool)

(assert (=> b!113515 m!129687))

(declare-fun m!129689 () Bool)

(assert (=> bm!12233 m!129689))

(assert (=> bm!12084 d!32287))

(declare-fun b!113519 () Bool)

(declare-fun e!73758 () Option!167)

(assert (=> b!113519 (= e!73758 None!165)))

(declare-fun b!113516 () Bool)

(declare-fun e!73757 () Option!167)

(assert (=> b!113516 (= e!73757 (Some!166 (_2!1216 (h!2216 (toList!795 lt!58630)))))))

(declare-fun b!113517 () Bool)

(assert (=> b!113517 (= e!73757 e!73758)))

(declare-fun c!20345 () Bool)

(assert (=> b!113517 (= c!20345 (and ((_ is Cons!1616) (toList!795 lt!58630)) (not (= (_1!1216 (h!2216 (toList!795 lt!58630))) (_1!1216 lt!58336)))))))

(declare-fun b!113518 () Bool)

(assert (=> b!113518 (= e!73758 (getValueByKey!161 (t!5786 (toList!795 lt!58630)) (_1!1216 lt!58336)))))

(declare-fun d!32289 () Bool)

(declare-fun c!20344 () Bool)

(assert (=> d!32289 (= c!20344 (and ((_ is Cons!1616) (toList!795 lt!58630)) (= (_1!1216 (h!2216 (toList!795 lt!58630))) (_1!1216 lt!58336))))))

(assert (=> d!32289 (= (getValueByKey!161 (toList!795 lt!58630) (_1!1216 lt!58336)) e!73757)))

(assert (= (and d!32289 c!20344) b!113516))

(assert (= (and d!32289 (not c!20344)) b!113517))

(assert (= (and b!113517 c!20345) b!113518))

(assert (= (and b!113517 (not c!20345)) b!113519))

(declare-fun m!129691 () Bool)

(assert (=> b!113518 m!129691))

(assert (=> b!113106 d!32289))

(assert (=> b!112836 d!32173))

(assert (=> b!112941 d!32277))

(assert (=> b!112941 d!32279))

(declare-fun d!32291 () Bool)

(assert (=> d!32291 (= (get!1369 (select (arr!2085 (_values!2643 (v!2959 (underlying!376 thiss!992)))) from!355) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!394 (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113115 d!32291))

(declare-fun d!32293 () Bool)

(declare-fun e!73760 () Bool)

(assert (=> d!32293 e!73760))

(declare-fun res!55944 () Bool)

(assert (=> d!32293 (=> res!55944 e!73760)))

(declare-fun lt!58915 () Bool)

(assert (=> d!32293 (= res!55944 (not lt!58915))))

(declare-fun lt!58918 () Bool)

(assert (=> d!32293 (= lt!58915 lt!58918)))

(declare-fun lt!58917 () Unit!3498)

(declare-fun e!73759 () Unit!3498)

(assert (=> d!32293 (= lt!58917 e!73759)))

(declare-fun c!20346 () Bool)

(assert (=> d!32293 (= c!20346 lt!58918)))

(assert (=> d!32293 (= lt!58918 (containsKey!164 (toList!795 lt!58621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!32293 (= (contains!834 lt!58621 #b1000000000000000000000000000000000000000000000000000000000000000) lt!58915)))

(declare-fun b!113520 () Bool)

(declare-fun lt!58916 () Unit!3498)

(assert (=> b!113520 (= e!73759 lt!58916)))

(assert (=> b!113520 (= lt!58916 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!113520 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113521 () Bool)

(declare-fun Unit!3528 () Unit!3498)

(assert (=> b!113521 (= e!73759 Unit!3528)))

(declare-fun b!113522 () Bool)

(assert (=> b!113522 (= e!73760 (isDefined!113 (getValueByKey!161 (toList!795 lt!58621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!32293 c!20346) b!113520))

(assert (= (and d!32293 (not c!20346)) b!113521))

(assert (= (and d!32293 (not res!55944)) b!113522))

(declare-fun m!129693 () Bool)

(assert (=> d!32293 m!129693))

(declare-fun m!129695 () Bool)

(assert (=> b!113520 m!129695))

(declare-fun m!129697 () Bool)

(assert (=> b!113520 m!129697))

(assert (=> b!113520 m!129697))

(declare-fun m!129699 () Bool)

(assert (=> b!113520 m!129699))

(assert (=> b!113522 m!129697))

(assert (=> b!113522 m!129697))

(assert (=> b!113522 m!129699))

(assert (=> b!113103 d!32293))

(declare-fun d!32295 () Bool)

(assert (=> d!32295 (= (map!1303 (_2!1217 lt!58564)) (getCurrentListMap!479 (_keys!4380 (_2!1217 lt!58564)) (_values!2643 (_2!1217 lt!58564)) (mask!6844 (_2!1217 lt!58564)) (extraKeys!2451 (_2!1217 lt!58564)) (zeroValue!2528 (_2!1217 lt!58564)) (minValue!2528 (_2!1217 lt!58564)) #b00000000000000000000000000000000 (defaultEntry!2660 (_2!1217 lt!58564))))))

(declare-fun bs!4657 () Bool)

(assert (= bs!4657 d!32295))

(declare-fun m!129701 () Bool)

(assert (=> bs!4657 m!129701))

(assert (=> bm!12174 d!32295))

(declare-fun d!32297 () Bool)

(declare-fun e!73761 () Bool)

(assert (=> d!32297 e!73761))

(declare-fun res!55946 () Bool)

(assert (=> d!32297 (=> (not res!55946) (not e!73761))))

(declare-fun lt!58922 () ListLongMap!1559)

(assert (=> d!32297 (= res!55946 (contains!834 lt!58922 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58920 () List!1620)

(assert (=> d!32297 (= lt!58922 (ListLongMap!1560 lt!58920))))

(declare-fun lt!58919 () Unit!3498)

(declare-fun lt!58921 () Unit!3498)

(assert (=> d!32297 (= lt!58919 lt!58921)))

(assert (=> d!32297 (= (getValueByKey!161 lt!58920 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32297 (= lt!58921 (lemmaContainsTupThenGetReturnValue!77 lt!58920 (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32297 (= lt!58920 (insertStrictlySorted!80 (toList!795 call!12104) (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32297 (= (+!150 call!12104 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58922)))

(declare-fun b!113523 () Bool)

(declare-fun res!55945 () Bool)

(assert (=> b!113523 (=> (not res!55945) (not e!73761))))

(assert (=> b!113523 (= res!55945 (= (getValueByKey!161 (toList!795 lt!58922) (_1!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113524 () Bool)

(assert (=> b!113524 (= e!73761 (contains!836 (toList!795 lt!58922) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32297 res!55946) b!113523))

(assert (= (and b!113523 res!55945) b!113524))

(declare-fun m!129703 () Bool)

(assert (=> d!32297 m!129703))

(declare-fun m!129705 () Bool)

(assert (=> d!32297 m!129705))

(declare-fun m!129707 () Bool)

(assert (=> d!32297 m!129707))

(declare-fun m!129709 () Bool)

(assert (=> d!32297 m!129709))

(declare-fun m!129711 () Bool)

(assert (=> b!113523 m!129711))

(declare-fun m!129713 () Bool)

(assert (=> b!113524 m!129713))

(assert (=> b!112896 d!32297))

(declare-fun d!32299 () Bool)

(assert (=> d!32299 (= (inRange!0 (ite c!20224 (ite c!20221 (index!3181 lt!58580) (ite c!20218 (index!3180 lt!58577) (index!3183 lt!58577))) (ite c!20215 (index!3181 lt!58572) (ite c!20217 (index!3180 lt!58570) (index!3183 lt!58570)))) (mask!6844 newMap!16)) (and (bvsge (ite c!20224 (ite c!20221 (index!3181 lt!58580) (ite c!20218 (index!3180 lt!58577) (index!3183 lt!58577))) (ite c!20215 (index!3181 lt!58572) (ite c!20217 (index!3180 lt!58570) (index!3183 lt!58570)))) #b00000000000000000000000000000000) (bvslt (ite c!20224 (ite c!20221 (index!3181 lt!58580) (ite c!20218 (index!3180 lt!58577) (index!3183 lt!58577))) (ite c!20215 (index!3181 lt!58572) (ite c!20217 (index!3180 lt!58570) (index!3183 lt!58570)))) (bvadd (mask!6844 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!12166 d!32299))

(declare-fun b!113525 () Bool)

(declare-fun e!73763 () Bool)

(declare-fun e!73762 () Bool)

(assert (=> b!113525 (= e!73763 e!73762)))

(declare-fun c!20347 () Bool)

(assert (=> b!113525 (= c!20347 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!113526 () Bool)

(declare-fun e!73765 () Bool)

(assert (=> b!113526 (= e!73765 e!73763)))

(declare-fun res!55947 () Bool)

(assert (=> b!113526 (=> (not res!55947) (not e!73763))))

(declare-fun e!73764 () Bool)

(assert (=> b!113526 (= res!55947 (not e!73764))))

(declare-fun res!55949 () Bool)

(assert (=> b!113526 (=> (not res!55949) (not e!73764))))

(assert (=> b!113526 (= res!55949 (validKeyInArray!0 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!12237 () Bool)

(declare-fun bm!12234 () Bool)

(assert (=> bm!12234 (= call!12237 (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!20347 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!20157 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1616) Nil!1616)) (ite c!20157 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1616) Nil!1616))))))

(declare-fun b!113527 () Bool)

(assert (=> b!113527 (= e!73762 call!12237)))

(declare-fun b!113528 () Bool)

(assert (=> b!113528 (= e!73762 call!12237)))

(declare-fun b!113529 () Bool)

(assert (=> b!113529 (= e!73764 (contains!835 (ite c!20157 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1616) Nil!1616) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!32301 () Bool)

(declare-fun res!55948 () Bool)

(assert (=> d!32301 (=> res!55948 e!73765)))

(assert (=> d!32301 (= res!55948 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2343 (_keys!4380 (v!2959 (underlying!376 thiss!992))))))))

(assert (=> d!32301 (= (arrayNoDuplicates!0 (_keys!4380 (v!2959 (underlying!376 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!20157 (Cons!1615 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) #b00000000000000000000000000000000) Nil!1616) Nil!1616)) e!73765)))

(assert (= (and d!32301 (not res!55948)) b!113526))

(assert (= (and b!113526 res!55949) b!113529))

(assert (= (and b!113526 res!55947) b!113525))

(assert (= (and b!113525 c!20347) b!113528))

(assert (= (and b!113525 (not c!20347)) b!113527))

(assert (= (or b!113528 b!113527) bm!12234))

(assert (=> b!113525 m!129679))

(assert (=> b!113525 m!129679))

(assert (=> b!113525 m!129681))

(assert (=> b!113526 m!129679))

(assert (=> b!113526 m!129679))

(assert (=> b!113526 m!129681))

(assert (=> bm!12234 m!129679))

(declare-fun m!129715 () Bool)

(assert (=> bm!12234 m!129715))

(assert (=> b!113529 m!129679))

(assert (=> b!113529 m!129679))

(declare-fun m!129717 () Bool)

(assert (=> b!113529 m!129717))

(assert (=> bm!12081 d!32301))

(declare-fun d!32303 () Bool)

(assert (=> d!32303 (= (apply!102 lt!58471 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1370 (getValueByKey!161 (toList!795 lt!58471) (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4658 () Bool)

(assert (= bs!4658 d!32303))

(assert (=> bs!4658 m!128879))

(assert (=> bs!4658 m!129403))

(assert (=> bs!4658 m!129403))

(declare-fun m!129719 () Bool)

(assert (=> bs!4658 m!129719))

(assert (=> b!112899 d!32303))

(assert (=> b!112899 d!32159))

(declare-fun bm!12237 () Bool)

(declare-fun call!12240 () (_ BitVec 32))

(assert (=> bm!12237 (= call!12240 (arrayCountValidKeys!0 (_keys!4380 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2343 (_keys!4380 newMap!16))))))

(declare-fun d!32305 () Bool)

(declare-fun lt!58925 () (_ BitVec 32))

(assert (=> d!32305 (and (bvsge lt!58925 #b00000000000000000000000000000000) (bvsle lt!58925 (bvsub (size!2343 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!73770 () (_ BitVec 32))

(assert (=> d!32305 (= lt!58925 e!73770)))

(declare-fun c!20352 () Bool)

(assert (=> d!32305 (= c!20352 (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(assert (=> d!32305 (and (bvsle #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2343 (_keys!4380 newMap!16)) (size!2343 (_keys!4380 newMap!16))))))

(assert (=> d!32305 (= (arrayCountValidKeys!0 (_keys!4380 newMap!16) #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) lt!58925)))

(declare-fun b!113538 () Bool)

(assert (=> b!113538 (= e!73770 #b00000000000000000000000000000000)))

(declare-fun b!113539 () Bool)

(declare-fun e!73771 () (_ BitVec 32))

(assert (=> b!113539 (= e!73771 call!12240)))

(declare-fun b!113540 () Bool)

(assert (=> b!113540 (= e!73771 (bvadd #b00000000000000000000000000000001 call!12240))))

(declare-fun b!113541 () Bool)

(assert (=> b!113541 (= e!73770 e!73771)))

(declare-fun c!20353 () Bool)

(assert (=> b!113541 (= c!20353 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32305 c!20352) b!113538))

(assert (= (and d!32305 (not c!20352)) b!113541))

(assert (= (and b!113541 c!20353) b!113540))

(assert (= (and b!113541 (not c!20353)) b!113539))

(assert (= (or b!113540 b!113539) bm!12237))

(declare-fun m!129721 () Bool)

(assert (=> bm!12237 m!129721))

(assert (=> b!113541 m!129107))

(assert (=> b!113541 m!129107))

(assert (=> b!113541 m!129109))

(assert (=> b!112823 d!32305))

(assert (=> b!112915 d!32165))

(declare-fun d!32307 () Bool)

(declare-fun e!73773 () Bool)

(assert (=> d!32307 e!73773))

(declare-fun res!55950 () Bool)

(assert (=> d!32307 (=> res!55950 e!73773)))

(declare-fun lt!58926 () Bool)

(assert (=> d!32307 (= res!55950 (not lt!58926))))

(declare-fun lt!58929 () Bool)

(assert (=> d!32307 (= lt!58926 lt!58929)))

(declare-fun lt!58928 () Unit!3498)

(declare-fun e!73772 () Unit!3498)

(assert (=> d!32307 (= lt!58928 e!73772)))

(declare-fun c!20354 () Bool)

(assert (=> d!32307 (= c!20354 lt!58929)))

(assert (=> d!32307 (= lt!58929 (containsKey!164 (toList!795 lt!58601) (_1!1216 lt!58336)))))

(assert (=> d!32307 (= (contains!834 lt!58601 (_1!1216 lt!58336)) lt!58926)))

(declare-fun b!113542 () Bool)

(declare-fun lt!58927 () Unit!3498)

(assert (=> b!113542 (= e!73772 lt!58927)))

(assert (=> b!113542 (= lt!58927 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 lt!58601) (_1!1216 lt!58336)))))

(assert (=> b!113542 (isDefined!113 (getValueByKey!161 (toList!795 lt!58601) (_1!1216 lt!58336)))))

(declare-fun b!113543 () Bool)

(declare-fun Unit!3529 () Unit!3498)

(assert (=> b!113543 (= e!73772 Unit!3529)))

(declare-fun b!113544 () Bool)

(assert (=> b!113544 (= e!73773 (isDefined!113 (getValueByKey!161 (toList!795 lt!58601) (_1!1216 lt!58336))))))

(assert (= (and d!32307 c!20354) b!113542))

(assert (= (and d!32307 (not c!20354)) b!113543))

(assert (= (and d!32307 (not res!55950)) b!113544))

(declare-fun m!129723 () Bool)

(assert (=> d!32307 m!129723))

(declare-fun m!129725 () Bool)

(assert (=> b!113542 m!129725))

(assert (=> b!113542 m!129027))

(assert (=> b!113542 m!129027))

(declare-fun m!129727 () Bool)

(assert (=> b!113542 m!129727))

(assert (=> b!113544 m!129027))

(assert (=> b!113544 m!129027))

(assert (=> b!113544 m!129727))

(assert (=> d!32121 d!32307))

(declare-fun b!113548 () Bool)

(declare-fun e!73775 () Option!167)

(assert (=> b!113548 (= e!73775 None!165)))

(declare-fun b!113545 () Bool)

(declare-fun e!73774 () Option!167)

(assert (=> b!113545 (= e!73774 (Some!166 (_2!1216 (h!2216 lt!58599))))))

(declare-fun b!113546 () Bool)

(assert (=> b!113546 (= e!73774 e!73775)))

(declare-fun c!20356 () Bool)

(assert (=> b!113546 (= c!20356 (and ((_ is Cons!1616) lt!58599) (not (= (_1!1216 (h!2216 lt!58599)) (_1!1216 lt!58336)))))))

(declare-fun b!113547 () Bool)

(assert (=> b!113547 (= e!73775 (getValueByKey!161 (t!5786 lt!58599) (_1!1216 lt!58336)))))

(declare-fun d!32309 () Bool)

(declare-fun c!20355 () Bool)

(assert (=> d!32309 (= c!20355 (and ((_ is Cons!1616) lt!58599) (= (_1!1216 (h!2216 lt!58599)) (_1!1216 lt!58336))))))

(assert (=> d!32309 (= (getValueByKey!161 lt!58599 (_1!1216 lt!58336)) e!73774)))

(assert (= (and d!32309 c!20355) b!113545))

(assert (= (and d!32309 (not c!20355)) b!113546))

(assert (= (and b!113546 c!20356) b!113547))

(assert (= (and b!113546 (not c!20356)) b!113548))

(declare-fun m!129729 () Bool)

(assert (=> b!113547 m!129729))

(assert (=> d!32121 d!32309))

(declare-fun d!32311 () Bool)

(assert (=> d!32311 (= (getValueByKey!161 lt!58599 (_1!1216 lt!58336)) (Some!166 (_2!1216 lt!58336)))))

(declare-fun lt!58930 () Unit!3498)

(assert (=> d!32311 (= lt!58930 (choose!722 lt!58599 (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(declare-fun e!73776 () Bool)

(assert (=> d!32311 e!73776))

(declare-fun res!55951 () Bool)

(assert (=> d!32311 (=> (not res!55951) (not e!73776))))

(assert (=> d!32311 (= res!55951 (isStrictlySorted!300 lt!58599))))

(assert (=> d!32311 (= (lemmaContainsTupThenGetReturnValue!77 lt!58599 (_1!1216 lt!58336) (_2!1216 lt!58336)) lt!58930)))

(declare-fun b!113549 () Bool)

(declare-fun res!55952 () Bool)

(assert (=> b!113549 (=> (not res!55952) (not e!73776))))

(assert (=> b!113549 (= res!55952 (containsKey!164 lt!58599 (_1!1216 lt!58336)))))

(declare-fun b!113550 () Bool)

(assert (=> b!113550 (= e!73776 (contains!836 lt!58599 (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336))))))

(assert (= (and d!32311 res!55951) b!113549))

(assert (= (and b!113549 res!55952) b!113550))

(assert (=> d!32311 m!129021))

(declare-fun m!129731 () Bool)

(assert (=> d!32311 m!129731))

(declare-fun m!129733 () Bool)

(assert (=> d!32311 m!129733))

(declare-fun m!129735 () Bool)

(assert (=> b!113549 m!129735))

(declare-fun m!129737 () Bool)

(assert (=> b!113550 m!129737))

(assert (=> d!32121 d!32311))

(declare-fun b!113551 () Bool)

(declare-fun e!73780 () List!1620)

(declare-fun call!12242 () List!1620)

(assert (=> b!113551 (= e!73780 call!12242)))

(declare-fun b!113552 () Bool)

(declare-fun c!20357 () Bool)

(declare-fun e!73778 () List!1620)

(declare-fun c!20359 () Bool)

(assert (=> b!113552 (= e!73778 (ite c!20357 (t!5786 (toList!795 lt!58328)) (ite c!20359 (Cons!1616 (h!2216 (toList!795 lt!58328)) (t!5786 (toList!795 lt!58328))) Nil!1617)))))

(declare-fun bm!12238 () Bool)

(declare-fun call!12241 () List!1620)

(assert (=> bm!12238 (= call!12241 call!12242)))

(declare-fun b!113553 () Bool)

(assert (=> b!113553 (= e!73778 (insertStrictlySorted!80 (t!5786 (toList!795 lt!58328)) (_1!1216 lt!58336) (_2!1216 lt!58336)))))

(declare-fun b!113554 () Bool)

(declare-fun e!73781 () List!1620)

(declare-fun call!12243 () List!1620)

(assert (=> b!113554 (= e!73781 call!12243)))

(declare-fun d!32313 () Bool)

(declare-fun e!73779 () Bool)

(assert (=> d!32313 e!73779))

(declare-fun res!55953 () Bool)

(assert (=> d!32313 (=> (not res!55953) (not e!73779))))

(declare-fun lt!58931 () List!1620)

(assert (=> d!32313 (= res!55953 (isStrictlySorted!300 lt!58931))))

(assert (=> d!32313 (= lt!58931 e!73781)))

(declare-fun c!20358 () Bool)

(assert (=> d!32313 (= c!20358 (and ((_ is Cons!1616) (toList!795 lt!58328)) (bvslt (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58336))))))

(assert (=> d!32313 (isStrictlySorted!300 (toList!795 lt!58328))))

(assert (=> d!32313 (= (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 lt!58336) (_2!1216 lt!58336)) lt!58931)))

(declare-fun b!113555 () Bool)

(declare-fun e!73777 () List!1620)

(assert (=> b!113555 (= e!73777 call!12241)))

(declare-fun b!113556 () Bool)

(assert (=> b!113556 (= e!73777 call!12241)))

(declare-fun b!113557 () Bool)

(assert (=> b!113557 (= e!73779 (contains!836 lt!58931 (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336))))))

(declare-fun bm!12239 () Bool)

(assert (=> bm!12239 (= call!12242 call!12243)))

(declare-fun bm!12240 () Bool)

(assert (=> bm!12240 (= call!12243 ($colon$colon!84 e!73778 (ite c!20358 (h!2216 (toList!795 lt!58328)) (tuple2!2411 (_1!1216 lt!58336) (_2!1216 lt!58336)))))))

(declare-fun c!20360 () Bool)

(assert (=> bm!12240 (= c!20360 c!20358)))

(declare-fun b!113558 () Bool)

(assert (=> b!113558 (= e!73781 e!73780)))

(assert (=> b!113558 (= c!20357 (and ((_ is Cons!1616) (toList!795 lt!58328)) (= (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58336))))))

(declare-fun b!113559 () Bool)

(assert (=> b!113559 (= c!20359 (and ((_ is Cons!1616) (toList!795 lt!58328)) (bvsgt (_1!1216 (h!2216 (toList!795 lt!58328))) (_1!1216 lt!58336))))))

(assert (=> b!113559 (= e!73780 e!73777)))

(declare-fun b!113560 () Bool)

(declare-fun res!55954 () Bool)

(assert (=> b!113560 (=> (not res!55954) (not e!73779))))

(assert (=> b!113560 (= res!55954 (containsKey!164 lt!58931 (_1!1216 lt!58336)))))

(assert (= (and d!32313 c!20358) b!113554))

(assert (= (and d!32313 (not c!20358)) b!113558))

(assert (= (and b!113558 c!20357) b!113551))

(assert (= (and b!113558 (not c!20357)) b!113559))

(assert (= (and b!113559 c!20359) b!113555))

(assert (= (and b!113559 (not c!20359)) b!113556))

(assert (= (or b!113555 b!113556) bm!12238))

(assert (= (or b!113551 bm!12238) bm!12239))

(assert (= (or b!113554 bm!12239) bm!12240))

(assert (= (and bm!12240 c!20360) b!113553))

(assert (= (and bm!12240 (not c!20360)) b!113552))

(assert (= (and d!32313 res!55953) b!113560))

(assert (= (and b!113560 res!55954) b!113557))

(declare-fun m!129739 () Bool)

(assert (=> b!113560 m!129739))

(declare-fun m!129741 () Bool)

(assert (=> bm!12240 m!129741))

(declare-fun m!129743 () Bool)

(assert (=> b!113553 m!129743))

(declare-fun m!129745 () Bool)

(assert (=> b!113557 m!129745))

(declare-fun m!129747 () Bool)

(assert (=> d!32313 m!129747))

(assert (=> d!32313 m!129479))

(assert (=> d!32121 d!32313))

(declare-fun bm!12241 () Bool)

(declare-fun call!12247 () Bool)

(declare-fun lt!58940 () ListLongMap!1559)

(assert (=> bm!12241 (= call!12247 (contains!834 lt!58940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113561 () Bool)

(declare-fun e!73784 () Bool)

(assert (=> b!113561 (= e!73784 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!32315 () Bool)

(declare-fun e!73787 () Bool)

(assert (=> d!32315 e!73787))

(declare-fun res!55961 () Bool)

(assert (=> d!32315 (=> (not res!55961) (not e!73787))))

(assert (=> d!32315 (= res!55961 (or (bvsge #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))))

(declare-fun lt!58948 () ListLongMap!1559)

(assert (=> d!32315 (= lt!58940 lt!58948)))

(declare-fun lt!58939 () Unit!3498)

(declare-fun e!73794 () Unit!3498)

(assert (=> d!32315 (= lt!58939 e!73794)))

(declare-fun c!20362 () Bool)

(declare-fun e!73788 () Bool)

(assert (=> d!32315 (= c!20362 e!73788)))

(declare-fun res!55960 () Bool)

(assert (=> d!32315 (=> (not res!55960) (not e!73788))))

(assert (=> d!32315 (= res!55960 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun e!73789 () ListLongMap!1559)

(assert (=> d!32315 (= lt!58948 e!73789)))

(declare-fun c!20366 () Bool)

(assert (=> d!32315 (= c!20366 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!32315 (validMask!0 (mask!6844 newMap!16))))

(assert (=> d!32315 (= (getCurrentListMap!479 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)) lt!58940)))

(declare-fun b!113562 () Bool)

(declare-fun call!12246 () ListLongMap!1559)

(assert (=> b!113562 (= e!73789 (+!150 call!12246 (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16))))))

(declare-fun b!113563 () Bool)

(declare-fun e!73782 () ListLongMap!1559)

(declare-fun call!12244 () ListLongMap!1559)

(assert (=> b!113563 (= e!73782 call!12244)))

(declare-fun b!113564 () Bool)

(declare-fun res!55962 () Bool)

(assert (=> b!113564 (=> (not res!55962) (not e!73787))))

(declare-fun e!73786 () Bool)

(assert (=> b!113564 (= res!55962 e!73786)))

(declare-fun c!20364 () Bool)

(assert (=> b!113564 (= c!20364 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!12242 () Bool)

(declare-fun call!12245 () Bool)

(assert (=> bm!12242 (= call!12245 (contains!834 lt!58940 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!113565 () Bool)

(declare-fun e!73790 () Bool)

(assert (=> b!113565 (= e!73790 (= (apply!102 lt!58940 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)) (get!1367 (select (arr!2085 lt!58576) #b00000000000000000000000000000000) (dynLambda!394 (defaultEntry!2660 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!113565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2344 lt!58576)))))

(assert (=> b!113565 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun bm!12243 () Bool)

(declare-fun call!12250 () ListLongMap!1559)

(assert (=> bm!12243 (= call!12244 call!12250)))

(declare-fun b!113566 () Bool)

(declare-fun e!73793 () Bool)

(declare-fun e!73785 () Bool)

(assert (=> b!113566 (= e!73793 e!73785)))

(declare-fun res!55958 () Bool)

(assert (=> b!113566 (= res!55958 call!12245)))

(assert (=> b!113566 (=> (not res!55958) (not e!73785))))

(declare-fun bm!12244 () Bool)

(declare-fun call!12249 () ListLongMap!1559)

(assert (=> bm!12244 (= call!12249 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun b!113567 () Bool)

(declare-fun call!12248 () ListLongMap!1559)

(assert (=> b!113567 (= e!73782 call!12248)))

(declare-fun b!113568 () Bool)

(assert (=> b!113568 (= e!73787 e!73793)))

(declare-fun c!20363 () Bool)

(assert (=> b!113568 (= c!20363 (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113569 () Bool)

(assert (=> b!113569 (= e!73786 (not call!12247))))

(declare-fun bm!12245 () Bool)

(assert (=> bm!12245 (= call!12248 call!12246)))

(declare-fun b!113570 () Bool)

(declare-fun c!20365 () Bool)

(assert (=> b!113570 (= c!20365 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!73791 () ListLongMap!1559)

(assert (=> b!113570 (= e!73791 e!73782)))

(declare-fun b!113571 () Bool)

(declare-fun Unit!3530 () Unit!3498)

(assert (=> b!113571 (= e!73794 Unit!3530)))

(declare-fun b!113572 () Bool)

(assert (=> b!113572 (= e!73793 (not call!12245))))

(declare-fun b!113573 () Bool)

(declare-fun res!55957 () Bool)

(assert (=> b!113573 (=> (not res!55957) (not e!73787))))

(declare-fun e!73792 () Bool)

(assert (=> b!113573 (= res!55957 e!73792)))

(declare-fun res!55959 () Bool)

(assert (=> b!113573 (=> res!55959 e!73792)))

(assert (=> b!113573 (= res!55959 (not e!73784))))

(declare-fun res!55963 () Bool)

(assert (=> b!113573 (=> (not res!55963) (not e!73784))))

(assert (=> b!113573 (= res!55963 (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun bm!12246 () Bool)

(declare-fun c!20361 () Bool)

(assert (=> bm!12246 (= call!12246 (+!150 (ite c!20366 call!12249 (ite c!20361 call!12250 call!12244)) (ite (or c!20366 c!20361) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 newMap!16)) (tuple2!2411 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2528 newMap!16)))))))

(declare-fun b!113574 () Bool)

(assert (=> b!113574 (= e!73791 call!12248)))

(declare-fun b!113575 () Bool)

(declare-fun e!73783 () Bool)

(assert (=> b!113575 (= e!73786 e!73783)))

(declare-fun res!55955 () Bool)

(assert (=> b!113575 (= res!55955 call!12247)))

(assert (=> b!113575 (=> (not res!55955) (not e!73783))))

(declare-fun bm!12247 () Bool)

(assert (=> bm!12247 (= call!12250 call!12249)))

(declare-fun b!113576 () Bool)

(assert (=> b!113576 (= e!73785 (= (apply!102 lt!58940 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2528 newMap!16)))))

(declare-fun b!113577 () Bool)

(assert (=> b!113577 (= e!73789 e!73791)))

(assert (=> b!113577 (= c!20361 (and (not (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2451 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!113578 () Bool)

(assert (=> b!113578 (= e!73783 (= (apply!102 lt!58940 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2528 newMap!16)))))

(declare-fun b!113579 () Bool)

(declare-fun lt!58950 () Unit!3498)

(assert (=> b!113579 (= e!73794 lt!58950)))

(declare-fun lt!58943 () ListLongMap!1559)

(assert (=> b!113579 (= lt!58943 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58947 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58947 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58952 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58952 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58937 () Unit!3498)

(assert (=> b!113579 (= lt!58937 (addStillContains!78 lt!58943 lt!58947 (zeroValue!2528 newMap!16) lt!58952))))

(assert (=> b!113579 (contains!834 (+!150 lt!58943 (tuple2!2411 lt!58947 (zeroValue!2528 newMap!16))) lt!58952)))

(declare-fun lt!58945 () Unit!3498)

(assert (=> b!113579 (= lt!58945 lt!58937)))

(declare-fun lt!58951 () ListLongMap!1559)

(assert (=> b!113579 (= lt!58951 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58949 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58949 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58942 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58942 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58938 () Unit!3498)

(assert (=> b!113579 (= lt!58938 (addApplyDifferent!78 lt!58951 lt!58949 (minValue!2528 newMap!16) lt!58942))))

(assert (=> b!113579 (= (apply!102 (+!150 lt!58951 (tuple2!2411 lt!58949 (minValue!2528 newMap!16))) lt!58942) (apply!102 lt!58951 lt!58942))))

(declare-fun lt!58936 () Unit!3498)

(assert (=> b!113579 (= lt!58936 lt!58938)))

(declare-fun lt!58941 () ListLongMap!1559)

(assert (=> b!113579 (= lt!58941 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58933 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58933 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58935 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58935 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!58946 () Unit!3498)

(assert (=> b!113579 (= lt!58946 (addApplyDifferent!78 lt!58941 lt!58933 (zeroValue!2528 newMap!16) lt!58935))))

(assert (=> b!113579 (= (apply!102 (+!150 lt!58941 (tuple2!2411 lt!58933 (zeroValue!2528 newMap!16))) lt!58935) (apply!102 lt!58941 lt!58935))))

(declare-fun lt!58944 () Unit!3498)

(assert (=> b!113579 (= lt!58944 lt!58946)))

(declare-fun lt!58953 () ListLongMap!1559)

(assert (=> b!113579 (= lt!58953 (getCurrentListMapNoExtraKeys!117 (_keys!4380 newMap!16) lt!58576 (mask!6844 newMap!16) (extraKeys!2451 newMap!16) (zeroValue!2528 newMap!16) (minValue!2528 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2660 newMap!16)))))

(declare-fun lt!58932 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58932 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!58934 () (_ BitVec 64))

(assert (=> b!113579 (= lt!58934 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!113579 (= lt!58950 (addApplyDifferent!78 lt!58953 lt!58932 (minValue!2528 newMap!16) lt!58934))))

(assert (=> b!113579 (= (apply!102 (+!150 lt!58953 (tuple2!2411 lt!58932 (minValue!2528 newMap!16))) lt!58934) (apply!102 lt!58953 lt!58934))))

(declare-fun b!113580 () Bool)

(assert (=> b!113580 (= e!73792 e!73790)))

(declare-fun res!55956 () Bool)

(assert (=> b!113580 (=> (not res!55956) (not e!73790))))

(assert (=> b!113580 (= res!55956 (contains!834 lt!58940 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!113580 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2343 (_keys!4380 newMap!16))))))

(declare-fun b!113581 () Bool)

(assert (=> b!113581 (= e!73788 (validKeyInArray!0 (select (arr!2084 (_keys!4380 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!32315 c!20366) b!113562))

(assert (= (and d!32315 (not c!20366)) b!113577))

(assert (= (and b!113577 c!20361) b!113574))

(assert (= (and b!113577 (not c!20361)) b!113570))

(assert (= (and b!113570 c!20365) b!113567))

(assert (= (and b!113570 (not c!20365)) b!113563))

(assert (= (or b!113567 b!113563) bm!12243))

(assert (= (or b!113574 bm!12243) bm!12247))

(assert (= (or b!113574 b!113567) bm!12245))

(assert (= (or b!113562 bm!12247) bm!12244))

(assert (= (or b!113562 bm!12245) bm!12246))

(assert (= (and d!32315 res!55960) b!113581))

(assert (= (and d!32315 c!20362) b!113579))

(assert (= (and d!32315 (not c!20362)) b!113571))

(assert (= (and d!32315 res!55961) b!113573))

(assert (= (and b!113573 res!55963) b!113561))

(assert (= (and b!113573 (not res!55959)) b!113580))

(assert (= (and b!113580 res!55956) b!113565))

(assert (= (and b!113573 res!55957) b!113564))

(assert (= (and b!113564 c!20364) b!113575))

(assert (= (and b!113564 (not c!20364)) b!113569))

(assert (= (and b!113575 res!55955) b!113578))

(assert (= (or b!113575 b!113569) bm!12241))

(assert (= (and b!113564 res!55962) b!113568))

(assert (= (and b!113568 c!20363) b!113566))

(assert (= (and b!113568 (not c!20363)) b!113572))

(assert (= (and b!113566 res!55958) b!113576))

(assert (= (or b!113566 b!113572) bm!12242))

(declare-fun b_lambda!5079 () Bool)

(assert (=> (not b_lambda!5079) (not b!113565)))

(assert (=> b!113565 t!5798))

(declare-fun b_and!6969 () Bool)

(assert (= b_and!6965 (and (=> t!5798 result!3585) b_and!6969)))

(assert (=> b!113565 t!5800))

(declare-fun b_and!6971 () Bool)

(assert (= b_and!6967 (and (=> t!5800 result!3587) b_and!6971)))

(assert (=> d!32315 m!129121))

(assert (=> b!113580 m!129107))

(assert (=> b!113580 m!129107))

(declare-fun m!129749 () Bool)

(assert (=> b!113580 m!129749))

(declare-fun m!129751 () Bool)

(assert (=> b!113578 m!129751))

(assert (=> b!113561 m!129107))

(assert (=> b!113561 m!129107))

(assert (=> b!113561 m!129109))

(declare-fun m!129753 () Bool)

(assert (=> bm!12242 m!129753))

(declare-fun m!129755 () Bool)

(assert (=> bm!12244 m!129755))

(declare-fun m!129757 () Bool)

(assert (=> b!113579 m!129757))

(declare-fun m!129759 () Bool)

(assert (=> b!113579 m!129759))

(declare-fun m!129761 () Bool)

(assert (=> b!113579 m!129761))

(assert (=> b!113579 m!129755))

(declare-fun m!129763 () Bool)

(assert (=> b!113579 m!129763))

(declare-fun m!129765 () Bool)

(assert (=> b!113579 m!129765))

(declare-fun m!129767 () Bool)

(assert (=> b!113579 m!129767))

(declare-fun m!129769 () Bool)

(assert (=> b!113579 m!129769))

(assert (=> b!113579 m!129757))

(assert (=> b!113579 m!129107))

(declare-fun m!129771 () Bool)

(assert (=> b!113579 m!129771))

(declare-fun m!129773 () Bool)

(assert (=> b!113579 m!129773))

(assert (=> b!113579 m!129771))

(declare-fun m!129775 () Bool)

(assert (=> b!113579 m!129775))

(declare-fun m!129777 () Bool)

(assert (=> b!113579 m!129777))

(declare-fun m!129779 () Bool)

(assert (=> b!113579 m!129779))

(assert (=> b!113579 m!129777))

(declare-fun m!129781 () Bool)

(assert (=> b!113579 m!129781))

(declare-fun m!129783 () Bool)

(assert (=> b!113579 m!129783))

(declare-fun m!129785 () Bool)

(assert (=> b!113579 m!129785))

(assert (=> b!113579 m!129783))

(declare-fun m!129787 () Bool)

(assert (=> b!113562 m!129787))

(declare-fun m!129789 () Bool)

(assert (=> bm!12246 m!129789))

(declare-fun m!129791 () Bool)

(assert (=> bm!12241 m!129791))

(assert (=> b!113565 m!129107))

(declare-fun m!129793 () Bool)

(assert (=> b!113565 m!129793))

(assert (=> b!113565 m!129169))

(declare-fun m!129795 () Bool)

(assert (=> b!113565 m!129795))

(assert (=> b!113565 m!129169))

(declare-fun m!129797 () Bool)

(assert (=> b!113565 m!129797))

(assert (=> b!113565 m!129107))

(assert (=> b!113565 m!129795))

(declare-fun m!129799 () Bool)

(assert (=> b!113576 m!129799))

(assert (=> b!113581 m!129107))

(assert (=> b!113581 m!129107))

(assert (=> b!113581 m!129109))

(assert (=> b!113058 d!32315))

(declare-fun d!32317 () Bool)

(declare-fun e!73795 () Bool)

(assert (=> d!32317 e!73795))

(declare-fun res!55965 () Bool)

(assert (=> d!32317 (=> (not res!55965) (not e!73795))))

(declare-fun lt!58957 () ListLongMap!1559)

(assert (=> d!32317 (= res!55965 (contains!834 lt!58957 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun lt!58955 () List!1620)

(assert (=> d!32317 (= lt!58957 (ListLongMap!1560 lt!58955))))

(declare-fun lt!58954 () Unit!3498)

(declare-fun lt!58956 () Unit!3498)

(assert (=> d!32317 (= lt!58954 lt!58956)))

(assert (=> d!32317 (= (getValueByKey!161 lt!58955 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32317 (= lt!58956 (lemmaContainsTupThenGetReturnValue!77 lt!58955 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32317 (= lt!58955 (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32317 (= (+!150 (+!150 lt!58328 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) lt!58957)))

(declare-fun b!113582 () Bool)

(declare-fun res!55964 () Bool)

(assert (=> b!113582 (=> (not res!55964) (not e!73795))))

(assert (=> b!113582 (= res!55964 (= (getValueByKey!161 (toList!795 lt!58957) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(declare-fun b!113583 () Bool)

(assert (=> b!113583 (= e!73795 (contains!836 (toList!795 lt!58957) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))

(assert (= (and d!32317 res!55965) b!113582))

(assert (= (and b!113582 res!55964) b!113583))

(declare-fun m!129801 () Bool)

(assert (=> d!32317 m!129801))

(declare-fun m!129803 () Bool)

(assert (=> d!32317 m!129803))

(declare-fun m!129805 () Bool)

(assert (=> d!32317 m!129805))

(declare-fun m!129807 () Bool)

(assert (=> d!32317 m!129807))

(declare-fun m!129809 () Bool)

(assert (=> b!113582 m!129809))

(declare-fun m!129811 () Bool)

(assert (=> b!113583 m!129811))

(assert (=> d!32119 d!32317))

(declare-fun d!32319 () Bool)

(declare-fun e!73796 () Bool)

(assert (=> d!32319 e!73796))

(declare-fun res!55967 () Bool)

(assert (=> d!32319 (=> (not res!55967) (not e!73796))))

(declare-fun lt!58961 () ListLongMap!1559)

(assert (=> d!32319 (= res!55967 (contains!834 lt!58961 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58959 () List!1620)

(assert (=> d!32319 (= lt!58961 (ListLongMap!1560 lt!58959))))

(declare-fun lt!58958 () Unit!3498)

(declare-fun lt!58960 () Unit!3498)

(assert (=> d!32319 (= lt!58958 lt!58960)))

(assert (=> d!32319 (= (getValueByKey!161 lt!58959 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32319 (= lt!58960 (lemmaContainsTupThenGetReturnValue!77 lt!58959 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32319 (= lt!58959 (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32319 (= (+!150 lt!58328 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58961)))

(declare-fun b!113584 () Bool)

(declare-fun res!55966 () Bool)

(assert (=> b!113584 (=> (not res!55966) (not e!73796))))

(assert (=> b!113584 (= res!55966 (= (getValueByKey!161 (toList!795 lt!58961) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113585 () Bool)

(assert (=> b!113585 (= e!73796 (contains!836 (toList!795 lt!58961) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32319 res!55967) b!113584))

(assert (= (and b!113584 res!55966) b!113585))

(declare-fun m!129813 () Bool)

(assert (=> d!32319 m!129813))

(declare-fun m!129815 () Bool)

(assert (=> d!32319 m!129815))

(declare-fun m!129817 () Bool)

(assert (=> d!32319 m!129817))

(declare-fun m!129819 () Bool)

(assert (=> d!32319 m!129819))

(declare-fun m!129821 () Bool)

(assert (=> b!113584 m!129821))

(declare-fun m!129823 () Bool)

(assert (=> b!113585 m!129823))

(assert (=> d!32119 d!32319))

(declare-fun d!32321 () Bool)

(declare-fun e!73797 () Bool)

(assert (=> d!32321 e!73797))

(declare-fun res!55969 () Bool)

(assert (=> d!32321 (=> (not res!55969) (not e!73797))))

(declare-fun lt!58965 () ListLongMap!1559)

(assert (=> d!32321 (= res!55969 (contains!834 lt!58965 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(declare-fun lt!58963 () List!1620)

(assert (=> d!32321 (= lt!58965 (ListLongMap!1560 lt!58963))))

(declare-fun lt!58962 () Unit!3498)

(declare-fun lt!58964 () Unit!3498)

(assert (=> d!32321 (= lt!58962 lt!58964)))

(assert (=> d!32321 (= (getValueByKey!161 lt!58963 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32321 (= lt!58964 (lemmaContainsTupThenGetReturnValue!77 lt!58963 (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32321 (= lt!58963 (insertStrictlySorted!80 (toList!795 lt!58328) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))))))

(assert (=> d!32321 (= (+!150 lt!58328 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) lt!58965)))

(declare-fun b!113586 () Bool)

(declare-fun res!55968 () Bool)

(assert (=> b!113586 (=> (not res!55968) (not e!73797))))

(assert (=> b!113586 (= res!55968 (= (getValueByKey!161 (toList!795 lt!58965) (_1!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (Some!166 (_2!1216 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))))

(declare-fun b!113587 () Bool)

(assert (=> b!113587 (= e!73797 (contains!836 (toList!795 lt!58965) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))

(assert (= (and d!32321 res!55969) b!113586))

(assert (= (and b!113586 res!55968) b!113587))

(declare-fun m!129825 () Bool)

(assert (=> d!32321 m!129825))

(declare-fun m!129827 () Bool)

(assert (=> d!32321 m!129827))

(declare-fun m!129829 () Bool)

(assert (=> d!32321 m!129829))

(declare-fun m!129831 () Bool)

(assert (=> d!32321 m!129831))

(declare-fun m!129833 () Bool)

(assert (=> b!113586 m!129833))

(declare-fun m!129835 () Bool)

(assert (=> b!113587 m!129835))

(assert (=> d!32119 d!32321))

(declare-fun d!32323 () Bool)

(declare-fun e!73798 () Bool)

(assert (=> d!32323 e!73798))

(declare-fun res!55971 () Bool)

(assert (=> d!32323 (=> (not res!55971) (not e!73798))))

(declare-fun lt!58969 () ListLongMap!1559)

(assert (=> d!32323 (= res!55971 (contains!834 lt!58969 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58967 () List!1620)

(assert (=> d!32323 (= lt!58969 (ListLongMap!1560 lt!58967))))

(declare-fun lt!58966 () Unit!3498)

(declare-fun lt!58968 () Unit!3498)

(assert (=> d!32323 (= lt!58966 lt!58968)))

(assert (=> d!32323 (= (getValueByKey!161 lt!58967 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32323 (= lt!58968 (lemmaContainsTupThenGetReturnValue!77 lt!58967 (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32323 (= lt!58967 (insertStrictlySorted!80 (toList!795 (+!150 lt!58328 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327))) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32323 (= (+!150 (+!150 lt!58328 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58969)))

(declare-fun b!113588 () Bool)

(declare-fun res!55970 () Bool)

(assert (=> b!113588 (=> (not res!55970) (not e!73798))))

(assert (=> b!113588 (= res!55970 (= (getValueByKey!161 (toList!795 lt!58969) (_1!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113589 () Bool)

(assert (=> b!113589 (= e!73798 (contains!836 (toList!795 lt!58969) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32323 res!55971) b!113588))

(assert (= (and b!113588 res!55970) b!113589))

(declare-fun m!129837 () Bool)

(assert (=> d!32323 m!129837))

(declare-fun m!129839 () Bool)

(assert (=> d!32323 m!129839))

(declare-fun m!129841 () Bool)

(assert (=> d!32323 m!129841))

(declare-fun m!129843 () Bool)

(assert (=> d!32323 m!129843))

(declare-fun m!129845 () Bool)

(assert (=> b!113588 m!129845))

(declare-fun m!129847 () Bool)

(assert (=> b!113589 m!129847))

(assert (=> d!32119 d!32323))

(declare-fun d!32325 () Bool)

(assert (=> d!32325 (= (+!150 (+!150 lt!58328 (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)) (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (+!150 (+!150 lt!58328 (tuple2!2411 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (tuple2!2411 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327)))))

(assert (=> d!32325 true))

(declare-fun _$28!173 () Unit!3498)

(assert (=> d!32325 (= (choose!718 lt!58328 (select (arr!2084 (_keys!4380 (v!2959 (underlying!376 thiss!992)))) from!355) lt!58327 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))) _$28!173)))

(declare-fun bs!4659 () Bool)

(assert (= bs!4659 d!32325))

(assert (=> bs!4659 m!129011))

(assert (=> bs!4659 m!129011))

(assert (=> bs!4659 m!129013))

(assert (=> bs!4659 m!129015))

(assert (=> bs!4659 m!129015))

(assert (=> bs!4659 m!129017))

(assert (=> d!32119 d!32325))

(declare-fun d!32327 () Bool)

(assert (=> d!32327 (= (apply!102 lt!58472 lt!58466) (get!1370 (getValueByKey!161 (toList!795 lt!58472) lt!58466)))))

(declare-fun bs!4660 () Bool)

(assert (= bs!4660 d!32327))

(declare-fun m!129849 () Bool)

(assert (=> bs!4660 m!129849))

(assert (=> bs!4660 m!129849))

(declare-fun m!129851 () Bool)

(assert (=> bs!4660 m!129851))

(assert (=> b!112913 d!32327))

(declare-fun d!32329 () Bool)

(declare-fun e!73799 () Bool)

(assert (=> d!32329 e!73799))

(declare-fun res!55973 () Bool)

(assert (=> d!32329 (=> (not res!55973) (not e!73799))))

(declare-fun lt!58973 () ListLongMap!1559)

(assert (=> d!32329 (= res!55973 (contains!834 lt!58973 (_1!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58971 () List!1620)

(assert (=> d!32329 (= lt!58973 (ListLongMap!1560 lt!58971))))

(declare-fun lt!58970 () Unit!3498)

(declare-fun lt!58972 () Unit!3498)

(assert (=> d!32329 (= lt!58970 lt!58972)))

(assert (=> d!32329 (= (getValueByKey!161 lt!58971 (_1!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= lt!58972 (lemmaContainsTupThenGetReturnValue!77 lt!58971 (_1!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= lt!58971 (insertStrictlySorted!80 (toList!795 lt!58484) (_1!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32329 (= (+!150 lt!58484 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58973)))

(declare-fun b!113590 () Bool)

(declare-fun res!55972 () Bool)

(assert (=> b!113590 (=> (not res!55972) (not e!73799))))

(assert (=> b!113590 (= res!55972 (= (getValueByKey!161 (toList!795 lt!58973) (_1!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113591 () Bool)

(assert (=> b!113591 (= e!73799 (contains!836 (toList!795 lt!58973) (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32329 res!55973) b!113590))

(assert (= (and b!113590 res!55972) b!113591))

(declare-fun m!129853 () Bool)

(assert (=> d!32329 m!129853))

(declare-fun m!129855 () Bool)

(assert (=> d!32329 m!129855))

(declare-fun m!129857 () Bool)

(assert (=> d!32329 m!129857))

(declare-fun m!129859 () Bool)

(assert (=> d!32329 m!129859))

(declare-fun m!129861 () Bool)

(assert (=> b!113590 m!129861))

(declare-fun m!129863 () Bool)

(assert (=> b!113591 m!129863))

(assert (=> b!112913 d!32329))

(assert (=> b!112913 d!32123))

(declare-fun d!32331 () Bool)

(assert (=> d!32331 (contains!834 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58483)))

(declare-fun lt!58976 () Unit!3498)

(declare-fun choose!728 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> d!32331 (= lt!58976 (choose!728 lt!58474 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58483))))

(assert (=> d!32331 (contains!834 lt!58474 lt!58483)))

(assert (=> d!32331 (= (addStillContains!78 lt!58474 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58483) lt!58976)))

(declare-fun bs!4661 () Bool)

(assert (= bs!4661 d!32331))

(assert (=> bs!4661 m!128889))

(assert (=> bs!4661 m!128889))

(assert (=> bs!4661 m!128891))

(declare-fun m!129865 () Bool)

(assert (=> bs!4661 m!129865))

(declare-fun m!129867 () Bool)

(assert (=> bs!4661 m!129867))

(assert (=> b!112913 d!32331))

(declare-fun d!32333 () Bool)

(assert (=> d!32333 (= (apply!102 lt!58482 lt!58473) (get!1370 (getValueByKey!161 (toList!795 lt!58482) lt!58473)))))

(declare-fun bs!4662 () Bool)

(assert (= bs!4662 d!32333))

(declare-fun m!129869 () Bool)

(assert (=> bs!4662 m!129869))

(assert (=> bs!4662 m!129869))

(declare-fun m!129871 () Bool)

(assert (=> bs!4662 m!129871))

(assert (=> b!112913 d!32333))

(declare-fun d!32335 () Bool)

(assert (=> d!32335 (= (apply!102 (+!150 lt!58472 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58466) (get!1370 (getValueByKey!161 (toList!795 (+!150 lt!58472 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58466)))))

(declare-fun bs!4663 () Bool)

(assert (= bs!4663 d!32335))

(declare-fun m!129873 () Bool)

(assert (=> bs!4663 m!129873))

(assert (=> bs!4663 m!129873))

(declare-fun m!129875 () Bool)

(assert (=> bs!4663 m!129875))

(assert (=> b!112913 d!32335))

(declare-fun d!32337 () Bool)

(assert (=> d!32337 (= (apply!102 (+!150 lt!58482 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58473) (apply!102 lt!58482 lt!58473))))

(declare-fun lt!58979 () Unit!3498)

(declare-fun choose!729 (ListLongMap!1559 (_ BitVec 64) V!3257 (_ BitVec 64)) Unit!3498)

(assert (=> d!32337 (= lt!58979 (choose!729 lt!58482 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58473))))

(declare-fun e!73802 () Bool)

(assert (=> d!32337 e!73802))

(declare-fun res!55976 () Bool)

(assert (=> d!32337 (=> (not res!55976) (not e!73802))))

(assert (=> d!32337 (= res!55976 (contains!834 lt!58482 lt!58473))))

(assert (=> d!32337 (= (addApplyDifferent!78 lt!58482 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58473) lt!58979)))

(declare-fun b!113596 () Bool)

(assert (=> b!113596 (= e!73802 (not (= lt!58473 lt!58480)))))

(assert (= (and d!32337 res!55976) b!113596))

(assert (=> d!32337 m!128909))

(declare-fun m!129877 () Bool)

(assert (=> d!32337 m!129877))

(assert (=> d!32337 m!128909))

(assert (=> d!32337 m!128911))

(declare-fun m!129879 () Bool)

(assert (=> d!32337 m!129879))

(assert (=> d!32337 m!128899))

(assert (=> b!112913 d!32337))

(declare-fun d!32339 () Bool)

(declare-fun e!73804 () Bool)

(assert (=> d!32339 e!73804))

(declare-fun res!55977 () Bool)

(assert (=> d!32339 (=> res!55977 e!73804)))

(declare-fun lt!58980 () Bool)

(assert (=> d!32339 (= res!55977 (not lt!58980))))

(declare-fun lt!58983 () Bool)

(assert (=> d!32339 (= lt!58980 lt!58983)))

(declare-fun lt!58982 () Unit!3498)

(declare-fun e!73803 () Unit!3498)

(assert (=> d!32339 (= lt!58982 e!73803)))

(declare-fun c!20367 () Bool)

(assert (=> d!32339 (= c!20367 lt!58983)))

(assert (=> d!32339 (= lt!58983 (containsKey!164 (toList!795 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58483))))

(assert (=> d!32339 (= (contains!834 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58483) lt!58980)))

(declare-fun b!113597 () Bool)

(declare-fun lt!58981 () Unit!3498)

(assert (=> b!113597 (= e!73803 lt!58981)))

(assert (=> b!113597 (= lt!58981 (lemmaContainsKeyImpliesGetValueByKeyDefined!112 (toList!795 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58483))))

(assert (=> b!113597 (isDefined!113 (getValueByKey!161 (toList!795 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58483))))

(declare-fun b!113598 () Bool)

(declare-fun Unit!3531 () Unit!3498)

(assert (=> b!113598 (= e!73803 Unit!3531)))

(declare-fun b!113599 () Bool)

(assert (=> b!113599 (= e!73804 (isDefined!113 (getValueByKey!161 (toList!795 (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58483)))))

(assert (= (and d!32339 c!20367) b!113597))

(assert (= (and d!32339 (not c!20367)) b!113598))

(assert (= (and d!32339 (not res!55977)) b!113599))

(declare-fun m!129881 () Bool)

(assert (=> d!32339 m!129881))

(declare-fun m!129883 () Bool)

(assert (=> b!113597 m!129883))

(declare-fun m!129885 () Bool)

(assert (=> b!113597 m!129885))

(assert (=> b!113597 m!129885))

(declare-fun m!129887 () Bool)

(assert (=> b!113597 m!129887))

(assert (=> b!113599 m!129885))

(assert (=> b!113599 m!129885))

(assert (=> b!113599 m!129887))

(assert (=> b!112913 d!32339))

(declare-fun d!32341 () Bool)

(declare-fun e!73805 () Bool)

(assert (=> d!32341 e!73805))

(declare-fun res!55979 () Bool)

(assert (=> d!32341 (=> (not res!55979) (not e!73805))))

(declare-fun lt!58987 () ListLongMap!1559)

(assert (=> d!32341 (= res!55979 (contains!834 lt!58987 (_1!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58985 () List!1620)

(assert (=> d!32341 (= lt!58987 (ListLongMap!1560 lt!58985))))

(declare-fun lt!58984 () Unit!3498)

(declare-fun lt!58986 () Unit!3498)

(assert (=> d!32341 (= lt!58984 lt!58986)))

(assert (=> d!32341 (= (getValueByKey!161 lt!58985 (_1!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32341 (= lt!58986 (lemmaContainsTupThenGetReturnValue!77 lt!58985 (_1!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32341 (= lt!58985 (insertStrictlySorted!80 (toList!795 lt!58474) (_1!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32341 (= (+!150 lt!58474 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58987)))

(declare-fun b!113600 () Bool)

(declare-fun res!55978 () Bool)

(assert (=> b!113600 (=> (not res!55978) (not e!73805))))

(assert (=> b!113600 (= res!55978 (= (getValueByKey!161 (toList!795 lt!58987) (_1!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113601 () Bool)

(assert (=> b!113601 (= e!73805 (contains!836 (toList!795 lt!58987) (tuple2!2411 lt!58478 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32341 res!55979) b!113600))

(assert (= (and b!113600 res!55978) b!113601))

(declare-fun m!129889 () Bool)

(assert (=> d!32341 m!129889))

(declare-fun m!129891 () Bool)

(assert (=> d!32341 m!129891))

(declare-fun m!129893 () Bool)

(assert (=> d!32341 m!129893))

(declare-fun m!129895 () Bool)

(assert (=> d!32341 m!129895))

(declare-fun m!129897 () Bool)

(assert (=> b!113600 m!129897))

(declare-fun m!129899 () Bool)

(assert (=> b!113601 m!129899))

(assert (=> b!112913 d!32341))

(declare-fun d!32343 () Bool)

(declare-fun e!73806 () Bool)

(assert (=> d!32343 e!73806))

(declare-fun res!55981 () Bool)

(assert (=> d!32343 (=> (not res!55981) (not e!73806))))

(declare-fun lt!58991 () ListLongMap!1559)

(assert (=> d!32343 (= res!55981 (contains!834 lt!58991 (_1!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58989 () List!1620)

(assert (=> d!32343 (= lt!58991 (ListLongMap!1560 lt!58989))))

(declare-fun lt!58988 () Unit!3498)

(declare-fun lt!58990 () Unit!3498)

(assert (=> d!32343 (= lt!58988 lt!58990)))

(assert (=> d!32343 (= (getValueByKey!161 lt!58989 (_1!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= lt!58990 (lemmaContainsTupThenGetReturnValue!77 lt!58989 (_1!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= lt!58989 (insertStrictlySorted!80 (toList!795 lt!58472) (_1!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32343 (= (+!150 lt!58472 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58991)))

(declare-fun b!113602 () Bool)

(declare-fun res!55980 () Bool)

(assert (=> b!113602 (=> (not res!55980) (not e!73806))))

(assert (=> b!113602 (= res!55980 (= (getValueByKey!161 (toList!795 lt!58991) (_1!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113603 () Bool)

(assert (=> b!113603 (= e!73806 (contains!836 (toList!795 lt!58991) (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32343 res!55981) b!113602))

(assert (= (and b!113602 res!55980) b!113603))

(declare-fun m!129901 () Bool)

(assert (=> d!32343 m!129901))

(declare-fun m!129903 () Bool)

(assert (=> d!32343 m!129903))

(declare-fun m!129905 () Bool)

(assert (=> d!32343 m!129905))

(declare-fun m!129907 () Bool)

(assert (=> d!32343 m!129907))

(declare-fun m!129909 () Bool)

(assert (=> b!113602 m!129909))

(declare-fun m!129911 () Bool)

(assert (=> b!113603 m!129911))

(assert (=> b!112913 d!32343))

(declare-fun d!32345 () Bool)

(assert (=> d!32345 (= (apply!102 (+!150 lt!58484 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58465) (apply!102 lt!58484 lt!58465))))

(declare-fun lt!58992 () Unit!3498)

(assert (=> d!32345 (= lt!58992 (choose!729 lt!58484 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58465))))

(declare-fun e!73807 () Bool)

(assert (=> d!32345 e!73807))

(declare-fun res!55982 () Bool)

(assert (=> d!32345 (=> (not res!55982) (not e!73807))))

(assert (=> d!32345 (= res!55982 (contains!834 lt!58484 lt!58465))))

(assert (=> d!32345 (= (addApplyDifferent!78 lt!58484 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58465) lt!58992)))

(declare-fun b!113604 () Bool)

(assert (=> b!113604 (= e!73807 (not (= lt!58465 lt!58463)))))

(assert (= (and d!32345 res!55982) b!113604))

(assert (=> d!32345 m!128915))

(declare-fun m!129913 () Bool)

(assert (=> d!32345 m!129913))

(assert (=> d!32345 m!128915))

(assert (=> d!32345 m!128917))

(declare-fun m!129915 () Bool)

(assert (=> d!32345 m!129915))

(assert (=> d!32345 m!128913))

(assert (=> b!112913 d!32345))

(declare-fun d!32347 () Bool)

(assert (=> d!32347 (= (apply!102 (+!150 lt!58472 (tuple2!2411 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58466) (apply!102 lt!58472 lt!58466))))

(declare-fun lt!58993 () Unit!3498)

(assert (=> d!32347 (= lt!58993 (choose!729 lt!58472 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58466))))

(declare-fun e!73808 () Bool)

(assert (=> d!32347 e!73808))

(declare-fun res!55983 () Bool)

(assert (=> d!32347 (=> (not res!55983) (not e!73808))))

(assert (=> d!32347 (= res!55983 (contains!834 lt!58472 lt!58466))))

(assert (=> d!32347 (= (addApplyDifferent!78 lt!58472 lt!58464 (zeroValue!2528 (v!2959 (underlying!376 thiss!992))) lt!58466) lt!58993)))

(declare-fun b!113605 () Bool)

(assert (=> b!113605 (= e!73808 (not (= lt!58466 lt!58464)))))

(assert (= (and d!32347 res!55983) b!113605))

(assert (=> d!32347 m!128903))

(declare-fun m!129917 () Bool)

(assert (=> d!32347 m!129917))

(assert (=> d!32347 m!128903))

(assert (=> d!32347 m!128905))

(declare-fun m!129919 () Bool)

(assert (=> d!32347 m!129919))

(assert (=> d!32347 m!128901))

(assert (=> b!112913 d!32347))

(declare-fun d!32349 () Bool)

(assert (=> d!32349 (= (apply!102 (+!150 lt!58482 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58473) (get!1370 (getValueByKey!161 (toList!795 (+!150 lt!58482 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58473)))))

(declare-fun bs!4664 () Bool)

(assert (= bs!4664 d!32349))

(declare-fun m!129921 () Bool)

(assert (=> bs!4664 m!129921))

(assert (=> bs!4664 m!129921))

(declare-fun m!129923 () Bool)

(assert (=> bs!4664 m!129923))

(assert (=> b!112913 d!32349))

(declare-fun d!32351 () Bool)

(assert (=> d!32351 (= (apply!102 lt!58484 lt!58465) (get!1370 (getValueByKey!161 (toList!795 lt!58484) lt!58465)))))

(declare-fun bs!4665 () Bool)

(assert (= bs!4665 d!32351))

(declare-fun m!129925 () Bool)

(assert (=> bs!4665 m!129925))

(assert (=> bs!4665 m!129925))

(declare-fun m!129927 () Bool)

(assert (=> bs!4665 m!129927))

(assert (=> b!112913 d!32351))

(declare-fun d!32353 () Bool)

(declare-fun e!73809 () Bool)

(assert (=> d!32353 e!73809))

(declare-fun res!55985 () Bool)

(assert (=> d!32353 (=> (not res!55985) (not e!73809))))

(declare-fun lt!58997 () ListLongMap!1559)

(assert (=> d!32353 (= res!55985 (contains!834 lt!58997 (_1!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(declare-fun lt!58995 () List!1620)

(assert (=> d!32353 (= lt!58997 (ListLongMap!1560 lt!58995))))

(declare-fun lt!58994 () Unit!3498)

(declare-fun lt!58996 () Unit!3498)

(assert (=> d!32353 (= lt!58994 lt!58996)))

(assert (=> d!32353 (= (getValueByKey!161 lt!58995 (_1!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32353 (= lt!58996 (lemmaContainsTupThenGetReturnValue!77 lt!58995 (_1!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32353 (= lt!58995 (insertStrictlySorted!80 (toList!795 lt!58482) (_1!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) (_2!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))))))

(assert (=> d!32353 (= (+!150 lt!58482 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58997)))

(declare-fun b!113606 () Bool)

(declare-fun res!55984 () Bool)

(assert (=> b!113606 (=> (not res!55984) (not e!73809))))

(assert (=> b!113606 (= res!55984 (= (getValueByKey!161 (toList!795 lt!58997) (_1!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) (Some!166 (_2!1216 (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))))

(declare-fun b!113607 () Bool)

(assert (=> b!113607 (= e!73809 (contains!836 (toList!795 lt!58997) (tuple2!2411 lt!58480 (minValue!2528 (v!2959 (underlying!376 thiss!992))))))))

(assert (= (and d!32353 res!55985) b!113606))

(assert (= (and b!113606 res!55984) b!113607))

(declare-fun m!129929 () Bool)

(assert (=> d!32353 m!129929))

(declare-fun m!129931 () Bool)

(assert (=> d!32353 m!129931))

(declare-fun m!129933 () Bool)

(assert (=> d!32353 m!129933))

(declare-fun m!129935 () Bool)

(assert (=> d!32353 m!129935))

(declare-fun m!129937 () Bool)

(assert (=> b!113606 m!129937))

(declare-fun m!129939 () Bool)

(assert (=> b!113607 m!129939))

(assert (=> b!112913 d!32353))

(declare-fun d!32355 () Bool)

(assert (=> d!32355 (= (apply!102 (+!150 lt!58484 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992))))) lt!58465) (get!1370 (getValueByKey!161 (toList!795 (+!150 lt!58484 (tuple2!2411 lt!58463 (minValue!2528 (v!2959 (underlying!376 thiss!992)))))) lt!58465)))))

(declare-fun bs!4666 () Bool)

(assert (= bs!4666 d!32355))

(declare-fun m!129941 () Bool)

(assert (=> bs!4666 m!129941))

(assert (=> bs!4666 m!129941))

(declare-fun m!129943 () Bool)

(assert (=> bs!4666 m!129943))

(assert (=> b!112913 d!32355))

(declare-fun mapNonEmpty!4061 () Bool)

(declare-fun mapRes!4061 () Bool)

(declare-fun tp!10127 () Bool)

(declare-fun e!73810 () Bool)

(assert (=> mapNonEmpty!4061 (= mapRes!4061 (and tp!10127 e!73810))))

(declare-fun mapRest!4061 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapValue!4061 () ValueCell!1010)

(declare-fun mapKey!4061 () (_ BitVec 32))

(assert (=> mapNonEmpty!4061 (= mapRest!4059 (store mapRest!4061 mapKey!4061 mapValue!4061))))

(declare-fun mapIsEmpty!4061 () Bool)

(assert (=> mapIsEmpty!4061 mapRes!4061))

(declare-fun condMapEmpty!4061 () Bool)

(declare-fun mapDefault!4061 () ValueCell!1010)

(assert (=> mapNonEmpty!4059 (= condMapEmpty!4061 (= mapRest!4059 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4061)))))

(declare-fun e!73811 () Bool)

(assert (=> mapNonEmpty!4059 (= tp!10125 (and e!73811 mapRes!4061))))

(declare-fun b!113608 () Bool)

(assert (=> b!113608 (= e!73810 tp_is_empty!2707)))

(declare-fun b!113609 () Bool)

(assert (=> b!113609 (= e!73811 tp_is_empty!2707)))

(assert (= (and mapNonEmpty!4059 condMapEmpty!4061) mapIsEmpty!4061))

(assert (= (and mapNonEmpty!4059 (not condMapEmpty!4061)) mapNonEmpty!4061))

(assert (= (and mapNonEmpty!4061 ((_ is ValueCellFull!1010) mapValue!4061)) b!113608))

(assert (= (and mapNonEmpty!4059 ((_ is ValueCellFull!1010) mapDefault!4061)) b!113609))

(declare-fun m!129945 () Bool)

(assert (=> mapNonEmpty!4061 m!129945))

(declare-fun mapNonEmpty!4062 () Bool)

(declare-fun mapRes!4062 () Bool)

(declare-fun tp!10128 () Bool)

(declare-fun e!73812 () Bool)

(assert (=> mapNonEmpty!4062 (= mapRes!4062 (and tp!10128 e!73812))))

(declare-fun mapValue!4062 () ValueCell!1010)

(declare-fun mapRest!4062 () (Array (_ BitVec 32) ValueCell!1010))

(declare-fun mapKey!4062 () (_ BitVec 32))

(assert (=> mapNonEmpty!4062 (= mapRest!4060 (store mapRest!4062 mapKey!4062 mapValue!4062))))

(declare-fun mapIsEmpty!4062 () Bool)

(assert (=> mapIsEmpty!4062 mapRes!4062))

(declare-fun condMapEmpty!4062 () Bool)

(declare-fun mapDefault!4062 () ValueCell!1010)

(assert (=> mapNonEmpty!4060 (= condMapEmpty!4062 (= mapRest!4060 ((as const (Array (_ BitVec 32) ValueCell!1010)) mapDefault!4062)))))

(declare-fun e!73813 () Bool)

(assert (=> mapNonEmpty!4060 (= tp!10126 (and e!73813 mapRes!4062))))

(declare-fun b!113610 () Bool)

(assert (=> b!113610 (= e!73812 tp_is_empty!2707)))

(declare-fun b!113611 () Bool)

(assert (=> b!113611 (= e!73813 tp_is_empty!2707)))

(assert (= (and mapNonEmpty!4060 condMapEmpty!4062) mapIsEmpty!4062))

(assert (= (and mapNonEmpty!4060 (not condMapEmpty!4062)) mapNonEmpty!4062))

(assert (= (and mapNonEmpty!4062 ((_ is ValueCellFull!1010) mapValue!4062)) b!113610))

(assert (= (and mapNonEmpty!4060 ((_ is ValueCellFull!1010) mapDefault!4062)) b!113611))

(declare-fun m!129947 () Bool)

(assert (=> mapNonEmpty!4062 m!129947))

(declare-fun b_lambda!5081 () Bool)

(assert (= b_lambda!5073 (or (and b!112672 b_free!2581 (= (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112659 b_free!2583) b_lambda!5081)))

(declare-fun b_lambda!5083 () Bool)

(assert (= b_lambda!5079 (or (and b!112672 b_free!2581 (= (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112659 b_free!2583) b_lambda!5083)))

(declare-fun b_lambda!5085 () Bool)

(assert (= b_lambda!5075 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5085)))

(declare-fun b_lambda!5087 () Bool)

(assert (= b_lambda!5077 (or (and b!112672 b_free!2581) (and b!112659 b_free!2583 (= (defaultEntry!2660 newMap!16) (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))))) b_lambda!5087)))

(declare-fun b_lambda!5089 () Bool)

(assert (= b_lambda!5071 (or (and b!112672 b_free!2581 (= (defaultEntry!2660 (v!2959 (underlying!376 thiss!992))) (defaultEntry!2660 newMap!16))) (and b!112659 b_free!2583) b_lambda!5089)))

(check-sat (not b!113162) (not b!113177) (not d!32259) (not d!32199) (not b!113169) (not b!113589) (not d!32333) (not b!113160) (not b!113542) (not b_lambda!5083) (not bm!12231) (not b!113388) (not b!113131) (not b!113193) (not b!113547) (not d!32161) (not b!113402) (not b!113581) (not bm!12240) (not b!113325) (not b!113215) (not b!113194) (not b!113600) (not b!113436) (not b!113385) (not b!113544) (not b!113578) (not bm!12205) (not d!32207) (not b!113583) (not bm!12191) (not b!113398) (not b!113335) (not b!113230) (not b!113582) (not bm!12186) (not b!113365) (not d!32141) (not b_lambda!5089) (not d!32275) (not b!113391) (not b!113316) (not b_lambda!5065) tp_is_empty!2707 (not b!113191) (not b!113515) (not bm!12242) (not b!113557) (not d!32203) (not d!32243) (not d!32323) (not b!113314) (not b!113518) (not d!32167) (not b!113260) (not b!113511) (not bm!12220) (not b!113591) (not d!32351) (not b!113449) (not bm!12219) (not bm!12212) (not b!113305) (not d!32315) (not d!32283) (not d!32193) (not b!113415) (not b!113370) (not b!113590) (not b!113307) (not b!113332) (not b!113400) (not b!113526) (not d!32247) (not bm!12233) (not d!32183) (not d!32325) (not d!32139) (not b!113607) (not d!32257) (not d!32297) (not d!32215) (not b!113238) (not bm!12211) (not b!113126) (not d!32355) (not d!32179) (not bm!12193) (not b!113291) (not d!32181) (not b!113133) (not d!32221) (not bm!12246) (not b!113407) (not b_lambda!5081) (not b!113363) (not b!113128) (not b!113496) (not d!32273) (not d!32319) (not b!113507) (not d!32339) (not b!113437) (not b!113374) (not b!113243) (not b!113494) (not b!113322) (not d!32271) (not b!113504) (not b!113147) (not d!32145) (not b!113304) (not b!113174) (not b!113254) (not d!32153) (not d!32341) (not bm!12206) (not b!113371) (not d!32349) (not b!113216) (not bm!12229) (not b!113368) (not d!32329) (not d!32151) (not b!113232) (not b!113576) (not b!113541) (not b!113211) (not b_lambda!5087) (not bm!12188) (not d!32255) (not d!32205) (not b!113562) (not bm!12215) (not b!113219) (not b!113585) (not b!113485) (not b!113161) (not d!32175) (not b!113408) (not b!113427) (not b!113553) (not d!32285) (not b!113549) (not b!113222) (not b!113561) (not mapNonEmpty!4062) (not d!32213) (not bm!12184) (not b!113418) (not b!113580) (not b!113378) (not b!113389) (not d!32251) (not b!113158) (not d!32303) (not b!113522) (not d!32177) (not bm!12183) (not d!32307) (not b!113383) (not d!32189) (not b!113323) (not d!32321) (not b_next!2581) (not b!113423) (not d!32195) (not b_lambda!5085) (not b!113550) (not b!113584) (not bm!12190) (not b!113172) (not d!32147) (not d!32209) (not d!32327) (not b!113513) (not mapNonEmpty!4061) (not bm!12241) (not bm!12237) (not b!113425) (not d!32201) (not b!113394) (not d!32237) (not d!32313) (not d!32281) (not b!113382) (not d!32345) (not b!113587) b_and!6971 (not d!32331) (not b!113509) (not b!113579) (not d!32347) (not b_lambda!5069) (not b!113142) (not b!113490) (not b!113599) (not d!32263) (not b!113602) (not b!113362) (not b!113312) (not b!113188) (not b!113606) (not d!32241) (not b!113489) (not b!113136) (not b!113426) (not b!113405) (not b!113411) (not d!32335) (not b!113524) (not b!113144) (not d!32233) (not b!113393) (not b!113130) (not d!32155) (not d!32149) (not b!113586) (not b!113486) (not b!113523) (not b!113284) (not b!113218) (not d!32317) (not b!113166) (not b!113597) (not b!113195) (not b!113525) (not b!113309) (not b!113173) (not b!113129) (not d!32293) (not bm!12182) (not b!113429) (not d!32239) (not b!113565) (not b!113221) (not b!113132) (not d!32185) (not d!32171) (not d!32343) (not b!113440) (not d!32157) (not b!113434) (not d!32353) (not d!32211) (not b!113170) (not b!113381) (not b!113192) (not b!113326) (not b!113588) (not bm!12244) (not b!113395) (not d!32229) (not bm!12216) (not b!113529) (not b!113143) (not d!32277) (not b!113190) (not b!113220) (not d!32253) (not d!32187) b_and!6969 (not b!113163) (not bm!12195) (not bm!12230) (not b!113241) (not b!113443) (not b!113294) (not b!113228) (not b!113310) (not b!113520) (not b!113288) (not b!113603) (not b!113234) (not d!32223) (not b!113560) (not bm!12234) (not b_lambda!5057) (not b!113292) (not b_lambda!5067) (not b!113127) (not d!32337) (not b!113424) (not b!113330) (not b!113601) (not b_next!2583) (not b!113261) (not b!113392) (not d!32295) (not d!32261) (not d!32311) (not b!113328))
(check-sat b_and!6969 b_and!6971 (not b_next!2581) (not b_next!2583))
