; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10950 () Bool)

(assert start!10950)

(declare-fun b!88622 () Bool)

(declare-fun b_free!2257 () Bool)

(declare-fun b_next!2257 () Bool)

(assert (=> b!88622 (= b_free!2257 (not b_next!2257))))

(declare-fun tp!9011 () Bool)

(declare-fun b_and!5321 () Bool)

(assert (=> b!88622 (= tp!9011 b_and!5321)))

(declare-fun b!88625 () Bool)

(declare-fun b_free!2259 () Bool)

(declare-fun b_next!2259 () Bool)

(assert (=> b!88625 (= b_free!2259 (not b_next!2259))))

(declare-fun tp!9010 () Bool)

(declare-fun b_and!5323 () Bool)

(assert (=> b!88625 (= tp!9010 b_and!5323)))

(declare-fun b!88605 () Bool)

(declare-fun res!45373 () Bool)

(declare-fun e!57702 () Bool)

(assert (=> b!88605 (=> (not res!45373) (not e!57702))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3041 0))(
  ( (V!3042 (val!1317 Int)) )
))
(declare-datatypes ((array!4033 0))(
  ( (array!4034 (arr!1918 (Array (_ BitVec 32) (_ BitVec 64))) (size!2165 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!929 0))(
  ( (ValueCellFull!929 (v!2666 V!3041)) (EmptyCell!929) )
))
(declare-datatypes ((array!4035 0))(
  ( (array!4036 (arr!1919 (Array (_ BitVec 32) ValueCell!929)) (size!2166 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!766 0))(
  ( (LongMapFixedSize!767 (defaultEntry!2371 Int) (mask!6414 (_ BitVec 32)) (extraKeys!2204 (_ BitVec 32)) (zeroValue!2260 V!3041) (minValue!2260 V!3041) (_size!432 (_ BitVec 32)) (_keys!4048 array!4033) (_values!2354 array!4035) (_vacant!432 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!560 0))(
  ( (Cell!561 (v!2667 LongMapFixedSize!766)) )
))
(declare-datatypes ((LongMap!560 0))(
  ( (LongMap!561 (underlying!291 Cell!560)) )
))
(declare-fun thiss!992 () LongMap!560)

(assert (=> b!88605 (= res!45373 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun b!88606 () Bool)

(declare-fun e!57695 () Bool)

(declare-fun e!57697 () Bool)

(declare-fun mapRes!3443 () Bool)

(assert (=> b!88606 (= e!57695 (and e!57697 mapRes!3443))))

(declare-fun condMapEmpty!3443 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!766)

(declare-fun mapDefault!3443 () ValueCell!929)

(assert (=> b!88606 (= condMapEmpty!3443 (= (arr!1919 (_values!2354 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3443)))))

(declare-fun b!88607 () Bool)

(declare-fun res!45375 () Bool)

(declare-fun e!57708 () Bool)

(assert (=> b!88607 (=> res!45375 e!57708)))

(assert (=> b!88607 (= res!45375 (or (not (= (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6414 (v!2667 (underlying!291 thiss!992)))))) (not (= (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992)))))) (bvslt (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000) (bvsgt (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!3443 () Bool)

(assert (=> mapIsEmpty!3443 mapRes!3443))

(declare-fun b!88608 () Bool)

(declare-fun tp_is_empty!2545 () Bool)

(assert (=> b!88608 (= e!57697 tp_is_empty!2545)))

(declare-fun b!88609 () Bool)

(declare-datatypes ((Unit!2638 0))(
  ( (Unit!2639) )
))
(declare-fun e!57710 () Unit!2638)

(declare-fun Unit!2640 () Unit!2638)

(assert (=> b!88609 (= e!57710 Unit!2640)))

(declare-fun lt!42389 () Unit!2638)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!71 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2638)

(assert (=> b!88609 (= lt!42389 (lemmaListMapContainsThenArrayContainsFrom!71 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!88609 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!42387 () Unit!2638)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4033 (_ BitVec 32) (_ BitVec 32)) Unit!2638)

(assert (=> b!88609 (= lt!42387 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1535 0))(
  ( (Nil!1532) (Cons!1531 (h!2123 (_ BitVec 64)) (t!5284 List!1535)) )
))
(declare-fun arrayNoDuplicates!0 (array!4033 (_ BitVec 32) List!1535) Bool)

(assert (=> b!88609 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) from!355 Nil!1532)))

(declare-fun lt!42388 () Unit!2638)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4033 (_ BitVec 32) (_ BitVec 64) List!1535) Unit!2638)

(assert (=> b!88609 (= lt!42388 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532)))))

(assert (=> b!88609 false))

(declare-fun b!88610 () Bool)

(declare-fun e!57712 () Bool)

(declare-fun e!57705 () Bool)

(assert (=> b!88610 (= e!57712 e!57705)))

(declare-fun b!88611 () Bool)

(declare-fun res!45374 () Bool)

(assert (=> b!88611 (=> res!45374 e!57708)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4033 (_ BitVec 32)) Bool)

(assert (=> b!88611 (= res!45374 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!88612 () Bool)

(declare-fun e!57707 () Bool)

(assert (=> b!88612 (= e!57702 e!57707)))

(declare-fun res!45371 () Bool)

(assert (=> b!88612 (=> (not res!45371) (not e!57707))))

(declare-datatypes ((tuple2!2220 0))(
  ( (tuple2!2221 (_1!1121 (_ BitVec 64)) (_2!1121 V!3041)) )
))
(declare-datatypes ((List!1536 0))(
  ( (Nil!1533) (Cons!1532 (h!2124 tuple2!2220) (t!5285 List!1536)) )
))
(declare-datatypes ((ListLongMap!1459 0))(
  ( (ListLongMap!1460 (toList!745 List!1536)) )
))
(declare-fun lt!42382 () ListLongMap!1459)

(declare-fun lt!42393 () ListLongMap!1459)

(assert (=> b!88612 (= res!45371 (= lt!42382 lt!42393))))

(declare-fun map!1193 (LongMapFixedSize!766) ListLongMap!1459)

(assert (=> b!88612 (= lt!42393 (map!1193 newMap!16))))

(declare-fun getCurrentListMap!429 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) ListLongMap!1459)

(assert (=> b!88612 (= lt!42382 (getCurrentListMap!429 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!88613 () Bool)

(declare-fun e!57709 () Bool)

(assert (=> b!88613 (= e!57709 (not e!57708))))

(declare-fun res!45372 () Bool)

(assert (=> b!88613 (=> res!45372 e!57708)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!88613 (= res!45372 (not (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun lt!42377 () tuple2!2220)

(declare-fun lt!42379 () ListLongMap!1459)

(declare-fun lt!42385 () ListLongMap!1459)

(declare-fun lt!42391 () tuple2!2220)

(declare-fun +!111 (ListLongMap!1459 tuple2!2220) ListLongMap!1459)

(assert (=> b!88613 (= (+!111 lt!42385 lt!42391) (+!111 (+!111 lt!42379 lt!42391) lt!42377))))

(assert (=> b!88613 (= lt!42391 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42378 () Unit!2638)

(declare-fun lt!42380 () V!3041)

(declare-fun addCommutativeForDiffKeys!30 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64) V!3041) Unit!2638)

(assert (=> b!88613 (= lt!42378 (addCommutativeForDiffKeys!30 lt!42379 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42390 () ListLongMap!1459)

(assert (=> b!88613 (= lt!42390 lt!42385)))

(assert (=> b!88613 (= lt!42385 (+!111 lt!42379 lt!42377))))

(declare-fun lt!42384 () ListLongMap!1459)

(declare-fun lt!42383 () tuple2!2220)

(assert (=> b!88613 (= lt!42390 (+!111 lt!42384 lt!42383))))

(declare-fun lt!42376 () ListLongMap!1459)

(assert (=> b!88613 (= lt!42379 (+!111 lt!42376 lt!42383))))

(assert (=> b!88613 (= lt!42383 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(assert (=> b!88613 (= lt!42384 (+!111 lt!42376 lt!42377))))

(assert (=> b!88613 (= lt!42377 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))

(declare-fun lt!42381 () Unit!2638)

(assert (=> b!88613 (= lt!42381 (addCommutativeForDiffKeys!30 lt!42376 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!75 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) ListLongMap!1459)

(assert (=> b!88613 (= lt!42376 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun mapIsEmpty!3444 () Bool)

(declare-fun mapRes!3444 () Bool)

(assert (=> mapIsEmpty!3444 mapRes!3444))

(declare-fun res!45378 () Bool)

(assert (=> start!10950 (=> (not res!45378) (not e!57702))))

(declare-fun valid!343 (LongMap!560) Bool)

(assert (=> start!10950 (= res!45378 (valid!343 thiss!992))))

(assert (=> start!10950 e!57702))

(declare-fun e!57698 () Bool)

(assert (=> start!10950 e!57698))

(assert (=> start!10950 true))

(declare-fun e!57696 () Bool)

(assert (=> start!10950 e!57696))

(declare-fun mapNonEmpty!3443 () Bool)

(declare-fun tp!9012 () Bool)

(declare-fun e!57699 () Bool)

(assert (=> mapNonEmpty!3443 (= mapRes!3444 (and tp!9012 e!57699))))

(declare-fun mapRest!3443 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapKey!3443 () (_ BitVec 32))

(declare-fun mapValue!3444 () ValueCell!929)

(assert (=> mapNonEmpty!3443 (= (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (store mapRest!3443 mapKey!3443 mapValue!3444))))

(declare-fun b!88614 () Bool)

(declare-fun e!57711 () Bool)

(assert (=> b!88614 (= e!57711 tp_is_empty!2545)))

(declare-fun b!88615 () Bool)

(declare-fun res!45379 () Bool)

(assert (=> b!88615 (=> (not res!45379) (not e!57702))))

(declare-fun valid!344 (LongMapFixedSize!766) Bool)

(assert (=> b!88615 (= res!45379 (valid!344 newMap!16))))

(declare-fun b!88616 () Bool)

(assert (=> b!88616 (= e!57698 e!57712)))

(declare-fun b!88617 () Bool)

(declare-fun Unit!2641 () Unit!2638)

(assert (=> b!88617 (= e!57710 Unit!2641)))

(declare-fun b!88618 () Bool)

(assert (=> b!88618 (= e!57708 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 Nil!1532))))

(declare-fun b!88619 () Bool)

(declare-fun res!45376 () Bool)

(assert (=> b!88619 (=> (not res!45376) (not e!57702))))

(assert (=> b!88619 (= res!45376 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6414 newMap!16)) (_size!432 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!88620 () Bool)

(declare-fun e!57700 () Bool)

(assert (=> b!88620 (= e!57700 tp_is_empty!2545)))

(declare-fun b!88621 () Bool)

(declare-fun e!57706 () Bool)

(assert (=> b!88621 (= e!57706 (and e!57700 mapRes!3444))))

(declare-fun condMapEmpty!3444 () Bool)

(declare-fun mapDefault!3444 () ValueCell!929)

(assert (=> b!88621 (= condMapEmpty!3444 (= (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3444)))))

(declare-fun mapNonEmpty!3444 () Bool)

(declare-fun tp!9009 () Bool)

(assert (=> mapNonEmpty!3444 (= mapRes!3443 (and tp!9009 e!57711))))

(declare-fun mapRest!3444 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapValue!3443 () ValueCell!929)

(declare-fun mapKey!3444 () (_ BitVec 32))

(assert (=> mapNonEmpty!3444 (= (arr!1919 (_values!2354 newMap!16)) (store mapRest!3444 mapKey!3444 mapValue!3443))))

(declare-fun array_inv!1205 (array!4033) Bool)

(declare-fun array_inv!1206 (array!4035) Bool)

(assert (=> b!88622 (= e!57705 (and tp!9011 tp_is_empty!2545 (array_inv!1205 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (array_inv!1206 (_values!2354 (v!2667 (underlying!291 thiss!992)))) e!57706))))

(declare-fun b!88623 () Bool)

(declare-fun e!57703 () Bool)

(assert (=> b!88623 (= e!57703 e!57709)))

(declare-fun res!45380 () Bool)

(assert (=> b!88623 (=> (not res!45380) (not e!57709))))

(declare-datatypes ((tuple2!2222 0))(
  ( (tuple2!2223 (_1!1122 Bool) (_2!1122 LongMapFixedSize!766)) )
))
(declare-fun lt!42386 () tuple2!2222)

(assert (=> b!88623 (= res!45380 (and (_1!1122 lt!42386) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!42392 () Unit!2638)

(assert (=> b!88623 (= lt!42392 e!57710)))

(declare-fun c!14671 () Bool)

(declare-fun contains!759 (ListLongMap!1459 (_ BitVec 64)) Bool)

(assert (=> b!88623 (= c!14671 (contains!759 lt!42393 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun update!125 (LongMapFixedSize!766 (_ BitVec 64) V!3041) tuple2!2222)

(assert (=> b!88623 (= lt!42386 (update!125 newMap!16 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))

(declare-fun b!88624 () Bool)

(assert (=> b!88624 (= e!57699 tp_is_empty!2545)))

(assert (=> b!88625 (= e!57696 (and tp!9010 tp_is_empty!2545 (array_inv!1205 (_keys!4048 newMap!16)) (array_inv!1206 (_values!2354 newMap!16)) e!57695))))

(declare-fun b!88626 () Bool)

(assert (=> b!88626 (= e!57707 e!57703)))

(declare-fun res!45377 () Bool)

(assert (=> b!88626 (=> (not res!45377) (not e!57703))))

(assert (=> b!88626 (= res!45377 (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun get!1214 (ValueCell!929 V!3041) V!3041)

(declare-fun dynLambda!347 (Int (_ BitVec 64)) V!3041)

(assert (=> b!88626 (= lt!42380 (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!10950 res!45378) b!88605))

(assert (= (and b!88605 res!45373) b!88615))

(assert (= (and b!88615 res!45379) b!88619))

(assert (= (and b!88619 res!45376) b!88612))

(assert (= (and b!88612 res!45371) b!88626))

(assert (= (and b!88626 res!45377) b!88623))

(assert (= (and b!88623 c!14671) b!88609))

(assert (= (and b!88623 (not c!14671)) b!88617))

(assert (= (and b!88623 res!45380) b!88613))

(assert (= (and b!88613 (not res!45372)) b!88607))

(assert (= (and b!88607 (not res!45375)) b!88611))

(assert (= (and b!88611 (not res!45374)) b!88618))

(assert (= (and b!88621 condMapEmpty!3444) mapIsEmpty!3444))

(assert (= (and b!88621 (not condMapEmpty!3444)) mapNonEmpty!3443))

(get-info :version)

(assert (= (and mapNonEmpty!3443 ((_ is ValueCellFull!929) mapValue!3444)) b!88624))

(assert (= (and b!88621 ((_ is ValueCellFull!929) mapDefault!3444)) b!88620))

(assert (= b!88622 b!88621))

(assert (= b!88610 b!88622))

(assert (= b!88616 b!88610))

(assert (= start!10950 b!88616))

(assert (= (and b!88606 condMapEmpty!3443) mapIsEmpty!3443))

(assert (= (and b!88606 (not condMapEmpty!3443)) mapNonEmpty!3444))

(assert (= (and mapNonEmpty!3444 ((_ is ValueCellFull!929) mapValue!3443)) b!88614))

(assert (= (and b!88606 ((_ is ValueCellFull!929) mapDefault!3443)) b!88608))

(assert (= b!88625 b!88606))

(assert (= start!10950 b!88625))

(declare-fun b_lambda!3923 () Bool)

(assert (=> (not b_lambda!3923) (not b!88626)))

(declare-fun t!5281 () Bool)

(declare-fun tb!1717 () Bool)

(assert (=> (and b!88622 (= (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) t!5281) tb!1717))

(declare-fun result!2955 () Bool)

(assert (=> tb!1717 (= result!2955 tp_is_empty!2545)))

(assert (=> b!88626 t!5281))

(declare-fun b_and!5325 () Bool)

(assert (= b_and!5321 (and (=> t!5281 result!2955) b_and!5325)))

(declare-fun tb!1719 () Bool)

(declare-fun t!5283 () Bool)

(assert (=> (and b!88625 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) t!5283) tb!1719))

(declare-fun result!2959 () Bool)

(assert (= result!2959 result!2955))

(assert (=> b!88626 t!5283))

(declare-fun b_and!5327 () Bool)

(assert (= b_and!5323 (and (=> t!5283 result!2959) b_and!5327)))

(declare-fun m!94779 () Bool)

(assert (=> b!88626 m!94779))

(declare-fun m!94781 () Bool)

(assert (=> b!88626 m!94781))

(declare-fun m!94783 () Bool)

(assert (=> b!88626 m!94783))

(assert (=> b!88626 m!94781))

(assert (=> b!88626 m!94783))

(declare-fun m!94785 () Bool)

(assert (=> b!88626 m!94785))

(assert (=> b!88613 m!94779))

(declare-fun m!94787 () Bool)

(assert (=> b!88613 m!94787))

(declare-fun m!94789 () Bool)

(assert (=> b!88613 m!94789))

(declare-fun m!94791 () Bool)

(assert (=> b!88613 m!94791))

(declare-fun m!94793 () Bool)

(assert (=> b!88613 m!94793))

(declare-fun m!94795 () Bool)

(assert (=> b!88613 m!94795))

(declare-fun m!94797 () Bool)

(assert (=> b!88613 m!94797))

(assert (=> b!88613 m!94779))

(declare-fun m!94799 () Bool)

(assert (=> b!88613 m!94799))

(declare-fun m!94801 () Bool)

(assert (=> b!88613 m!94801))

(declare-fun m!94803 () Bool)

(assert (=> b!88613 m!94803))

(declare-fun m!94805 () Bool)

(assert (=> b!88613 m!94805))

(declare-fun m!94807 () Bool)

(assert (=> b!88613 m!94807))

(assert (=> b!88613 m!94779))

(assert (=> b!88613 m!94795))

(assert (=> b!88623 m!94779))

(assert (=> b!88623 m!94779))

(declare-fun m!94809 () Bool)

(assert (=> b!88623 m!94809))

(assert (=> b!88623 m!94779))

(declare-fun m!94811 () Bool)

(assert (=> b!88623 m!94811))

(declare-fun m!94813 () Bool)

(assert (=> b!88609 m!94813))

(declare-fun m!94815 () Bool)

(assert (=> b!88609 m!94815))

(assert (=> b!88609 m!94779))

(declare-fun m!94817 () Bool)

(assert (=> b!88609 m!94817))

(assert (=> b!88609 m!94779))

(assert (=> b!88609 m!94779))

(declare-fun m!94819 () Bool)

(assert (=> b!88609 m!94819))

(assert (=> b!88609 m!94779))

(declare-fun m!94821 () Bool)

(assert (=> b!88609 m!94821))

(declare-fun m!94823 () Bool)

(assert (=> b!88618 m!94823))

(declare-fun m!94825 () Bool)

(assert (=> mapNonEmpty!3443 m!94825))

(declare-fun m!94827 () Bool)

(assert (=> b!88615 m!94827))

(declare-fun m!94829 () Bool)

(assert (=> mapNonEmpty!3444 m!94829))

(declare-fun m!94831 () Bool)

(assert (=> b!88612 m!94831))

(declare-fun m!94833 () Bool)

(assert (=> b!88612 m!94833))

(declare-fun m!94835 () Bool)

(assert (=> b!88625 m!94835))

(declare-fun m!94837 () Bool)

(assert (=> b!88625 m!94837))

(declare-fun m!94839 () Bool)

(assert (=> start!10950 m!94839))

(declare-fun m!94841 () Bool)

(assert (=> b!88622 m!94841))

(declare-fun m!94843 () Bool)

(assert (=> b!88622 m!94843))

(declare-fun m!94845 () Bool)

(assert (=> b!88611 m!94845))

(check-sat (not b!88626) (not mapNonEmpty!3443) (not mapNonEmpty!3444) (not b!88623) (not b_next!2257) (not b_lambda!3923) (not b!88609) b_and!5327 (not b!88615) tp_is_empty!2545 (not b!88618) b_and!5325 (not b!88611) (not b!88612) (not b!88613) (not b!88625) (not b_next!2259) (not b!88622) (not start!10950))
(check-sat b_and!5325 b_and!5327 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun b_lambda!3929 () Bool)

(assert (= b_lambda!3923 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3929)))

(check-sat (not b!88626) (not mapNonEmpty!3443) (not b_lambda!3929) (not mapNonEmpty!3444) (not b!88623) (not b_next!2257) (not b!88609) b_and!5327 (not b!88615) tp_is_empty!2545 (not b!88618) b_and!5325 (not b!88611) (not b!88612) (not b!88613) (not b!88625) (not b_next!2259) (not b!88622) (not start!10950))
(check-sat b_and!5325 b_and!5327 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun d!23595 () Bool)

(assert (=> d!23595 (= (array_inv!1205 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvsge (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88622 d!23595))

(declare-fun d!23597 () Bool)

(assert (=> d!23597 (= (array_inv!1206 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvsge (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!88622 d!23597))

(declare-fun d!23599 () Bool)

(declare-fun e!57826 () Bool)

(assert (=> d!23599 e!57826))

(declare-fun res!45443 () Bool)

(assert (=> d!23599 (=> res!45443 e!57826)))

(declare-fun lt!42511 () Bool)

(assert (=> d!23599 (= res!45443 (not lt!42511))))

(declare-fun lt!42510 () Bool)

(assert (=> d!23599 (= lt!42511 lt!42510)))

(declare-fun lt!42513 () Unit!2638)

(declare-fun e!57825 () Unit!2638)

(assert (=> d!23599 (= lt!42513 e!57825)))

(declare-fun c!14680 () Bool)

(assert (=> d!23599 (= c!14680 lt!42510)))

(declare-fun containsKey!144 (List!1536 (_ BitVec 64)) Bool)

(assert (=> d!23599 (= lt!42510 (containsKey!144 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23599 (= (contains!759 lt!42393 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) lt!42511)))

(declare-fun b!88771 () Bool)

(declare-fun lt!42512 () Unit!2638)

(assert (=> b!88771 (= e!57825 lt!42512)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!93 (List!1536 (_ BitVec 64)) Unit!2638)

(assert (=> b!88771 (= lt!42512 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-datatypes ((Option!146 0))(
  ( (Some!145 (v!2672 V!3041)) (None!144) )
))
(declare-fun isDefined!94 (Option!146) Bool)

(declare-fun getValueByKey!140 (List!1536 (_ BitVec 64)) Option!146)

(assert (=> b!88771 (isDefined!94 (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!88772 () Bool)

(declare-fun Unit!2644 () Unit!2638)

(assert (=> b!88772 (= e!57825 Unit!2644)))

(declare-fun b!88773 () Bool)

(assert (=> b!88773 (= e!57826 (isDefined!94 (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (= (and d!23599 c!14680) b!88771))

(assert (= (and d!23599 (not c!14680)) b!88772))

(assert (= (and d!23599 (not res!45443)) b!88773))

(assert (=> d!23599 m!94779))

(declare-fun m!94983 () Bool)

(assert (=> d!23599 m!94983))

(assert (=> b!88771 m!94779))

(declare-fun m!94985 () Bool)

(assert (=> b!88771 m!94985))

(assert (=> b!88771 m!94779))

(declare-fun m!94987 () Bool)

(assert (=> b!88771 m!94987))

(assert (=> b!88771 m!94987))

(declare-fun m!94989 () Bool)

(assert (=> b!88771 m!94989))

(assert (=> b!88773 m!94779))

(assert (=> b!88773 m!94987))

(assert (=> b!88773 m!94987))

(assert (=> b!88773 m!94989))

(assert (=> b!88623 d!23599))

(declare-fun bm!8580 () Bool)

(declare-fun call!8601 () ListLongMap!1459)

(declare-fun call!8585 () ListLongMap!1459)

(assert (=> bm!8580 (= call!8601 call!8585)))

(declare-fun b!88858 () Bool)

(declare-fun lt!42579 () Unit!2638)

(declare-fun lt!42580 () Unit!2638)

(assert (=> b!88858 (= lt!42579 lt!42580)))

(declare-fun call!8586 () ListLongMap!1459)

(assert (=> b!88858 (= call!8586 call!8601)))

(declare-fun lt!42588 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!33 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2638)

(assert (=> b!88858 (= lt!42580 (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42588 (zeroValue!2260 newMap!16) lt!42380 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)))))

(assert (=> b!88858 (= lt!42588 (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!57888 () tuple2!2222)

(assert (=> b!88858 (= e!57888 (tuple2!2223 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6414 newMap!16) (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) lt!42380 (minValue!2260 newMap!16) (_size!432 newMap!16) (_keys!4048 newMap!16) (_values!2354 newMap!16) (_vacant!432 newMap!16))))))

(declare-fun b!88859 () Bool)

(declare-fun e!57884 () Unit!2638)

(declare-fun lt!42581 () Unit!2638)

(assert (=> b!88859 (= e!57884 lt!42581)))

(declare-fun call!8605 () Unit!2638)

(assert (=> b!88859 (= lt!42581 call!8605)))

(declare-datatypes ((SeekEntryResult!248 0))(
  ( (MissingZero!248 (index!3131 (_ BitVec 32))) (Found!248 (index!3132 (_ BitVec 32))) (Intermediate!248 (undefined!1060 Bool) (index!3133 (_ BitVec 32)) (x!12233 (_ BitVec 32))) (Undefined!248) (MissingVacant!248 (index!3134 (_ BitVec 32))) )
))
(declare-fun lt!42591 () SeekEntryResult!248)

(declare-fun call!8583 () SeekEntryResult!248)

(assert (=> b!88859 (= lt!42591 call!8583)))

(declare-fun c!14715 () Bool)

(assert (=> b!88859 (= c!14715 ((_ is MissingZero!248) lt!42591))))

(declare-fun e!57891 () Bool)

(assert (=> b!88859 e!57891))

(declare-fun b!88860 () Bool)

(declare-fun e!57892 () Unit!2638)

(declare-fun Unit!2645 () Unit!2638)

(assert (=> b!88860 (= e!57892 Unit!2645)))

(declare-fun lt!42574 () Unit!2638)

(assert (=> b!88860 (= lt!42574 call!8605)))

(declare-fun lt!42578 () SeekEntryResult!248)

(declare-fun call!8584 () SeekEntryResult!248)

(assert (=> b!88860 (= lt!42578 call!8584)))

(declare-fun c!14721 () Bool)

(assert (=> b!88860 (= c!14721 ((_ is MissingZero!248) lt!42578))))

(declare-fun e!57880 () Bool)

(assert (=> b!88860 e!57880))

(declare-fun lt!42585 () Unit!2638)

(assert (=> b!88860 (= lt!42585 lt!42574)))

(assert (=> b!88860 false))

(declare-fun b!88861 () Bool)

(declare-fun res!45474 () Bool)

(declare-fun call!8606 () Bool)

(assert (=> b!88861 (= res!45474 call!8606)))

(declare-fun e!57872 () Bool)

(assert (=> b!88861 (=> (not res!45474) (not e!57872))))

(declare-fun b!88862 () Bool)

(declare-fun lt!42573 () Unit!2638)

(declare-fun lt!42590 () Unit!2638)

(assert (=> b!88862 (= lt!42573 lt!42590)))

(assert (=> b!88862 (= call!8586 call!8601)))

(declare-fun lt!42593 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2638)

(assert (=> b!88862 (= lt!42590 (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42593 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42380 (defaultEntry!2371 newMap!16)))))

(assert (=> b!88862 (= lt!42593 (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!88862 (= e!57888 (tuple2!2223 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6414 newMap!16) (bvor (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) (zeroValue!2260 newMap!16) lt!42380 (_size!432 newMap!16) (_keys!4048 newMap!16) (_values!2354 newMap!16) (_vacant!432 newMap!16))))))

(declare-fun b!88863 () Bool)

(declare-fun c!14712 () Bool)

(assert (=> b!88863 (= c!14712 ((_ is MissingVacant!248) lt!42578))))

(declare-fun e!57879 () Bool)

(assert (=> b!88863 (= e!57880 e!57879)))

(declare-fun call!8591 () ListLongMap!1459)

(declare-fun call!8596 () ListLongMap!1459)

(declare-fun b!88864 () Bool)

(declare-fun e!57878 () Bool)

(assert (=> b!88864 (= e!57878 (= call!8591 (+!111 call!8596 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun b!88865 () Bool)

(declare-fun e!57881 () tuple2!2222)

(declare-fun e!57873 () tuple2!2222)

(assert (=> b!88865 (= e!57881 e!57873)))

(declare-fun c!14710 () Bool)

(declare-fun lt!42569 () SeekEntryResult!248)

(assert (=> b!88865 (= c!14710 ((_ is MissingZero!248) lt!42569))))

(declare-fun b!88866 () Bool)

(declare-fun e!57886 () Bool)

(declare-fun e!57889 () Bool)

(assert (=> b!88866 (= e!57886 e!57889)))

(declare-fun res!45481 () Bool)

(declare-fun call!8589 () Bool)

(assert (=> b!88866 (= res!45481 call!8589)))

(assert (=> b!88866 (=> (not res!45481) (not e!57889))))

(declare-fun d!23601 () Bool)

(declare-fun e!57876 () Bool)

(assert (=> d!23601 e!57876))

(declare-fun res!45485 () Bool)

(assert (=> d!23601 (=> (not res!45485) (not e!57876))))

(declare-fun lt!42584 () tuple2!2222)

(assert (=> d!23601 (= res!45485 (valid!344 (_2!1122 lt!42584)))))

(declare-fun e!57882 () tuple2!2222)

(assert (=> d!23601 (= lt!42584 e!57882)))

(declare-fun c!14716 () Bool)

(assert (=> d!23601 (= c!14716 (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvneg (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (=> d!23601 (valid!344 newMap!16)))

(assert (=> d!23601 (= (update!125 newMap!16 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380) lt!42584)))

(declare-fun bm!8581 () Bool)

(declare-fun lt!42587 () array!4035)

(declare-fun call!8599 () ListLongMap!1459)

(assert (=> bm!8581 (= call!8599 (getCurrentListMap!429 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!88867 () Bool)

(declare-fun res!45473 () Bool)

(declare-fun call!8598 () Bool)

(assert (=> b!88867 (= res!45473 call!8598)))

(declare-fun e!57883 () Bool)

(assert (=> b!88867 (=> (not res!45473) (not e!57883))))

(declare-fun bm!8582 () Bool)

(declare-fun call!8594 () ListLongMap!1459)

(assert (=> bm!8582 (= call!8594 call!8599)))

(declare-fun bm!8583 () Bool)

(declare-fun call!8592 () SeekEntryResult!248)

(assert (=> bm!8583 (= call!8584 call!8592)))

(declare-fun b!88868 () Bool)

(declare-fun c!14709 () Bool)

(assert (=> b!88868 (= c!14709 ((_ is MissingVacant!248) lt!42569))))

(declare-fun e!57885 () tuple2!2222)

(assert (=> b!88868 (= e!57885 e!57881)))

(declare-fun b!88869 () Bool)

(declare-fun e!57887 () Bool)

(declare-fun call!8603 () Bool)

(assert (=> b!88869 (= e!57887 (not call!8603))))

(declare-fun b!88870 () Bool)

(declare-fun e!57871 () ListLongMap!1459)

(assert (=> b!88870 (= e!57871 call!8599)))

(declare-fun b!88871 () Bool)

(declare-fun e!57875 () Bool)

(declare-fun call!8590 () Bool)

(assert (=> b!88871 (= e!57875 (not call!8590))))

(declare-fun bm!8584 () Bool)

(declare-fun call!8588 () Bool)

(assert (=> bm!8584 (= call!8606 call!8588)))

(declare-fun b!88872 () Bool)

(declare-fun e!57877 () Bool)

(assert (=> b!88872 (= e!57877 (= call!8591 call!8596))))

(declare-fun b!88873 () Bool)

(declare-fun call!8587 () ListLongMap!1459)

(assert (=> b!88873 (= e!57871 call!8587)))

(declare-fun bm!8585 () Bool)

(declare-fun call!8600 () Bool)

(assert (=> bm!8585 (= call!8600 call!8598)))

(declare-fun b!88874 () Bool)

(declare-fun e!57874 () ListLongMap!1459)

(assert (=> b!88874 (= e!57874 call!8594)))

(declare-fun b!88875 () Bool)

(assert (=> b!88875 (= e!57876 e!57877)))

(declare-fun c!14720 () Bool)

(assert (=> b!88875 (= c!14720 (_1!1122 lt!42584))))

(declare-fun b!88876 () Bool)

(declare-fun lt!42571 () SeekEntryResult!248)

(assert (=> b!88876 (= e!57883 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42571)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!88877 () Bool)

(declare-fun lt!42576 () tuple2!2222)

(declare-fun call!8595 () tuple2!2222)

(assert (=> b!88877 (= lt!42576 call!8595)))

(assert (=> b!88877 (= e!57873 (tuple2!2223 (_1!1122 lt!42576) (_2!1122 lt!42576)))))

(declare-fun b!88878 () Bool)

(declare-fun res!45478 () Bool)

(assert (=> b!88878 (=> (not res!45478) (not e!57875))))

(assert (=> b!88878 (= res!45478 call!8600)))

(assert (=> b!88878 (= e!57880 e!57875)))

(declare-fun c!14719 () Bool)

(declare-fun c!14722 () Bool)

(declare-fun bm!8586 () Bool)

(assert (=> bm!8586 (= call!8585 (getCurrentListMap!429 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun bm!8587 () Bool)

(declare-fun updateHelperNewKey!33 (LongMapFixedSize!766 (_ BitVec 64) V!3041 (_ BitVec 32)) tuple2!2222)

(assert (=> bm!8587 (= call!8595 (updateHelperNewKey!33 newMap!16 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569))))))

(declare-fun bm!8588 () Bool)

(assert (=> bm!8588 (= call!8589 call!8606)))

(declare-fun b!88879 () Bool)

(declare-fun e!57890 () Bool)

(assert (=> b!88879 (= e!57890 (not call!8590))))

(declare-fun b!88880 () Bool)

(assert (=> b!88880 (= e!57882 e!57885)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4033 (_ BitVec 32)) SeekEntryResult!248)

(assert (=> b!88880 (= lt!42569 (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(assert (=> b!88880 (= c!14722 ((_ is Undefined!248) lt!42569))))

(declare-fun bm!8589 () Bool)

(declare-fun call!8604 () ListLongMap!1459)

(assert (=> bm!8589 (= call!8586 call!8604)))

(declare-fun bm!8590 () Bool)

(declare-fun call!8597 () Unit!2638)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2638)

(assert (=> bm!8590 (= call!8597 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun bm!8591 () Bool)

(assert (=> bm!8591 (= call!8583 call!8592)))

(declare-fun b!88881 () Bool)

(declare-fun res!45480 () Bool)

(assert (=> b!88881 (=> (not res!45480) (not e!57887))))

(assert (=> b!88881 (= res!45480 call!8589)))

(assert (=> b!88881 (= e!57891 e!57887)))

(declare-fun b!88882 () Bool)

(declare-fun res!45475 () Bool)

(assert (=> b!88882 (= res!45475 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3134 lt!42591)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88882 (=> (not res!45475) (not e!57889))))

(declare-fun bm!8592 () Bool)

(assert (=> bm!8592 (= call!8598 call!8588)))

(declare-fun b!88883 () Bool)

(assert (=> b!88883 (= e!57882 e!57888)))

(assert (=> b!88883 (= c!14719 (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88884 () Bool)

(assert (=> b!88884 (= e!57889 (not call!8603))))

(declare-fun bm!8593 () Bool)

(declare-fun lt!42586 () SeekEntryResult!248)

(declare-fun c!14717 () Bool)

(declare-fun c!14713 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!8593 (= call!8588 (inRange!0 (ite c!14722 (ite c!14717 (index!3132 lt!42586) (ite c!14715 (index!3131 lt!42591) (index!3134 lt!42591))) (ite c!14713 (index!3132 lt!42571) (ite c!14721 (index!3131 lt!42578) (index!3134 lt!42578)))) (mask!6414 newMap!16)))))

(declare-fun bm!8594 () Bool)

(assert (=> bm!8594 (= call!8592 (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun bm!8595 () Bool)

(declare-fun call!8593 () Bool)

(assert (=> bm!8595 (= call!8590 call!8593)))

(declare-fun bm!8596 () Bool)

(assert (=> bm!8596 (= call!8593 (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!88885 () Bool)

(declare-fun lt!42594 () Unit!2638)

(assert (=> b!88885 (= lt!42594 e!57884)))

(declare-fun call!8602 () Bool)

(assert (=> b!88885 (= c!14717 call!8602)))

(assert (=> b!88885 (= e!57885 (tuple2!2223 false newMap!16))))

(declare-fun bm!8597 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2638)

(assert (=> bm!8597 (= call!8605 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun b!88886 () Bool)

(assert (=> b!88886 (= e!57874 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!88887 () Bool)

(assert (=> b!88887 (= e!57879 e!57890)))

(declare-fun res!45484 () Bool)

(assert (=> b!88887 (= res!45484 call!8600)))

(assert (=> b!88887 (=> (not res!45484) (not e!57890))))

(declare-fun bm!8598 () Bool)

(assert (=> bm!8598 (= call!8604 (+!111 e!57874 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun c!14718 () Bool)

(assert (=> bm!8598 (= c!14718 c!14716)))

(declare-fun b!88888 () Bool)

(declare-fun lt!42592 () Unit!2638)

(declare-fun lt!42575 () Unit!2638)

(assert (=> b!88888 (= lt!42592 lt!42575)))

(assert (=> b!88888 call!8602))

(declare-fun lemmaValidKeyInArrayIsInListMap!92 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) Unit!2638)

(assert (=> b!88888 (= lt!42575 (lemmaValidKeyInArrayIsInListMap!92 (_keys!4048 newMap!16) lt!42587 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (defaultEntry!2371 newMap!16)))))

(assert (=> b!88888 (= lt!42587 (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))))))

(declare-fun lt!42589 () Unit!2638)

(declare-fun lt!42583 () Unit!2638)

(assert (=> b!88888 (= lt!42589 lt!42583)))

(assert (=> b!88888 (= call!8604 call!8587)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2638)

(assert (=> b!88888 (= lt!42583 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42568 () Unit!2638)

(assert (=> b!88888 (= lt!42568 e!57892)))

(assert (=> b!88888 (= c!14713 (contains!759 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!88888 (= e!57873 (tuple2!2223 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (_size!432 newMap!16) (_keys!4048 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))) (_vacant!432 newMap!16))))))

(declare-fun b!88889 () Bool)

(assert (=> b!88889 (= e!57879 ((_ is Undefined!248) lt!42578))))

(declare-fun bm!8599 () Bool)

(declare-fun c!14714 () Bool)

(assert (=> bm!8599 (= c!14714 c!14722)))

(assert (=> bm!8599 (= call!8602 (contains!759 e!57871 (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569)))))))

(declare-fun b!88890 () Bool)

(declare-fun c!14711 () Bool)

(assert (=> b!88890 (= c!14711 ((_ is MissingVacant!248) lt!42591))))

(assert (=> b!88890 (= e!57891 e!57886)))

(declare-fun b!88891 () Bool)

(declare-fun lt!42582 () tuple2!2222)

(assert (=> b!88891 (= e!57881 (tuple2!2223 (_1!1122 lt!42582) (_2!1122 lt!42582)))))

(assert (=> b!88891 (= lt!42582 call!8595)))

(declare-fun b!88892 () Bool)

(declare-fun res!45476 () Bool)

(assert (=> b!88892 (=> (not res!45476) (not e!57887))))

(assert (=> b!88892 (= res!45476 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3131 lt!42591)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88893 () Bool)

(declare-fun res!45472 () Bool)

(assert (=> b!88893 (=> (not res!45472) (not e!57875))))

(assert (=> b!88893 (= res!45472 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3131 lt!42578)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88894 () Bool)

(assert (=> b!88894 (= e!57877 e!57878)))

(declare-fun res!45482 () Bool)

(assert (=> b!88894 (= res!45482 (contains!759 call!8591 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!88894 (=> (not res!45482) (not e!57878))))

(declare-fun bm!8600 () Bool)

(assert (=> bm!8600 (= call!8591 (map!1193 (_2!1122 lt!42584)))))

(declare-fun b!88895 () Bool)

(assert (=> b!88895 (= e!57872 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42586)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!88896 () Bool)

(declare-fun lt!42570 () Unit!2638)

(assert (=> b!88896 (= e!57892 lt!42570)))

(assert (=> b!88896 (= lt!42570 call!8597)))

(assert (=> b!88896 (= lt!42571 call!8584)))

(declare-fun res!45483 () Bool)

(assert (=> b!88896 (= res!45483 ((_ is Found!248) lt!42571))))

(assert (=> b!88896 (=> (not res!45483) (not e!57883))))

(assert (=> b!88896 e!57883))

(declare-fun b!88897 () Bool)

(declare-fun res!45477 () Bool)

(assert (=> b!88897 (= res!45477 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3134 lt!42578)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!88897 (=> (not res!45477) (not e!57890))))

(declare-fun bm!8601 () Bool)

(assert (=> bm!8601 (= call!8596 (map!1193 newMap!16))))

(declare-fun b!88898 () Bool)

(declare-fun Unit!2646 () Unit!2638)

(assert (=> b!88898 (= e!57884 Unit!2646)))

(declare-fun lt!42572 () Unit!2638)

(assert (=> b!88898 (= lt!42572 call!8597)))

(assert (=> b!88898 (= lt!42586 call!8583)))

(declare-fun res!45479 () Bool)

(assert (=> b!88898 (= res!45479 ((_ is Found!248) lt!42586))))

(assert (=> b!88898 (=> (not res!45479) (not e!57872))))

(assert (=> b!88898 e!57872))

(declare-fun lt!42577 () Unit!2638)

(assert (=> b!88898 (= lt!42577 lt!42572)))

(assert (=> b!88898 false))

(declare-fun bm!8602 () Bool)

(assert (=> bm!8602 (= call!8587 call!8585)))

(declare-fun b!88899 () Bool)

(assert (=> b!88899 (= e!57886 ((_ is Undefined!248) lt!42591))))

(declare-fun bm!8603 () Bool)

(assert (=> bm!8603 (= call!8603 call!8593)))

(assert (= (and d!23601 c!14716) b!88883))

(assert (= (and d!23601 (not c!14716)) b!88880))

(assert (= (and b!88883 c!14719) b!88858))

(assert (= (and b!88883 (not c!14719)) b!88862))

(assert (= (or b!88858 b!88862) bm!8580))

(assert (= (or b!88858 b!88862) bm!8582))

(assert (= (or b!88858 b!88862) bm!8589))

(assert (= (and b!88880 c!14722) b!88885))

(assert (= (and b!88880 (not c!14722)) b!88868))

(assert (= (and b!88885 c!14717) b!88898))

(assert (= (and b!88885 (not c!14717)) b!88859))

(assert (= (and b!88898 res!45479) b!88861))

(assert (= (and b!88861 res!45474) b!88895))

(assert (= (and b!88859 c!14715) b!88881))

(assert (= (and b!88859 (not c!14715)) b!88890))

(assert (= (and b!88881 res!45480) b!88892))

(assert (= (and b!88892 res!45476) b!88869))

(assert (= (and b!88890 c!14711) b!88866))

(assert (= (and b!88890 (not c!14711)) b!88899))

(assert (= (and b!88866 res!45481) b!88882))

(assert (= (and b!88882 res!45475) b!88884))

(assert (= (or b!88881 b!88866) bm!8588))

(assert (= (or b!88869 b!88884) bm!8603))

(assert (= (or b!88861 bm!8588) bm!8584))

(assert (= (or b!88898 b!88859) bm!8591))

(assert (= (and b!88868 c!14709) b!88891))

(assert (= (and b!88868 (not c!14709)) b!88865))

(assert (= (and b!88865 c!14710) b!88877))

(assert (= (and b!88865 (not c!14710)) b!88888))

(assert (= (and b!88888 c!14713) b!88896))

(assert (= (and b!88888 (not c!14713)) b!88860))

(assert (= (and b!88896 res!45483) b!88867))

(assert (= (and b!88867 res!45473) b!88876))

(assert (= (and b!88860 c!14721) b!88878))

(assert (= (and b!88860 (not c!14721)) b!88863))

(assert (= (and b!88878 res!45478) b!88893))

(assert (= (and b!88893 res!45472) b!88871))

(assert (= (and b!88863 c!14712) b!88887))

(assert (= (and b!88863 (not c!14712)) b!88889))

(assert (= (and b!88887 res!45484) b!88897))

(assert (= (and b!88897 res!45477) b!88879))

(assert (= (or b!88878 b!88887) bm!8585))

(assert (= (or b!88871 b!88879) bm!8595))

(assert (= (or b!88867 bm!8585) bm!8592))

(assert (= (or b!88896 b!88860) bm!8583))

(assert (= (or b!88891 b!88877) bm!8587))

(assert (= (or b!88859 b!88860) bm!8597))

(assert (= (or bm!8584 bm!8592) bm!8593))

(assert (= (or bm!8603 bm!8595) bm!8596))

(assert (= (or bm!8591 bm!8583) bm!8594))

(assert (= (or b!88885 b!88888) bm!8602))

(assert (= (or b!88898 b!88896) bm!8590))

(assert (= (or b!88885 b!88888) bm!8599))

(assert (= (and bm!8599 c!14714) b!88873))

(assert (= (and bm!8599 (not c!14714)) b!88870))

(assert (= (or bm!8580 bm!8602) bm!8586))

(assert (= (or bm!8582 b!88870) bm!8581))

(assert (= (or bm!8589 b!88888) bm!8598))

(assert (= (and bm!8598 c!14718) b!88874))

(assert (= (and bm!8598 (not c!14718)) b!88886))

(assert (= (and d!23601 res!45485) b!88875))

(assert (= (and b!88875 c!14720) b!88894))

(assert (= (and b!88875 (not c!14720)) b!88872))

(assert (= (and b!88894 res!45482) b!88864))

(assert (= (or b!88894 b!88864 b!88872) bm!8600))

(assert (= (or b!88864 b!88872) bm!8601))

(declare-fun m!94991 () Bool)

(assert (=> b!88893 m!94991))

(declare-fun m!94993 () Bool)

(assert (=> b!88886 m!94993))

(declare-fun m!94995 () Bool)

(assert (=> bm!8586 m!94995))

(declare-fun m!94997 () Bool)

(assert (=> bm!8586 m!94997))

(assert (=> b!88880 m!94779))

(declare-fun m!94999 () Bool)

(assert (=> b!88880 m!94999))

(declare-fun m!95001 () Bool)

(assert (=> b!88897 m!95001))

(declare-fun m!95003 () Bool)

(assert (=> b!88864 m!95003))

(declare-fun m!95005 () Bool)

(assert (=> bm!8600 m!95005))

(assert (=> bm!8601 m!94831))

(declare-fun m!95007 () Bool)

(assert (=> b!88892 m!95007))

(declare-fun m!95009 () Bool)

(assert (=> bm!8599 m!95009))

(declare-fun m!95011 () Bool)

(assert (=> bm!8599 m!95011))

(declare-fun m!95013 () Bool)

(assert (=> bm!8581 m!95013))

(assert (=> b!88888 m!94995))

(declare-fun m!95015 () Bool)

(assert (=> b!88888 m!95015))

(assert (=> b!88888 m!94993))

(assert (=> b!88888 m!94993))

(assert (=> b!88888 m!94779))

(declare-fun m!95017 () Bool)

(assert (=> b!88888 m!95017))

(assert (=> b!88888 m!94779))

(declare-fun m!95019 () Bool)

(assert (=> b!88888 m!95019))

(declare-fun m!95021 () Bool)

(assert (=> b!88882 m!95021))

(assert (=> bm!8594 m!94779))

(assert (=> bm!8594 m!94999))

(declare-fun m!95023 () Bool)

(assert (=> bm!8593 m!95023))

(assert (=> bm!8597 m!94779))

(declare-fun m!95025 () Bool)

(assert (=> bm!8597 m!95025))

(declare-fun m!95027 () Bool)

(assert (=> b!88895 m!95027))

(assert (=> bm!8596 m!94779))

(declare-fun m!95029 () Bool)

(assert (=> bm!8596 m!95029))

(declare-fun m!95031 () Bool)

(assert (=> d!23601 m!95031))

(assert (=> d!23601 m!94827))

(declare-fun m!95033 () Bool)

(assert (=> b!88876 m!95033))

(declare-fun m!95035 () Bool)

(assert (=> b!88858 m!95035))

(declare-fun m!95037 () Bool)

(assert (=> bm!8598 m!95037))

(declare-fun m!95039 () Bool)

(assert (=> b!88862 m!95039))

(assert (=> bm!8587 m!94779))

(declare-fun m!95041 () Bool)

(assert (=> bm!8587 m!95041))

(assert (=> b!88894 m!94779))

(declare-fun m!95043 () Bool)

(assert (=> b!88894 m!95043))

(assert (=> bm!8590 m!94779))

(declare-fun m!95045 () Bool)

(assert (=> bm!8590 m!95045))

(assert (=> b!88623 d!23601))

(declare-fun d!23603 () Bool)

(assert (=> d!23603 (= (+!111 (+!111 lt!42379 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (+!111 (+!111 lt!42379 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(declare-fun lt!42597 () Unit!2638)

(declare-fun choose!533 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64) V!3041) Unit!2638)

(assert (=> d!23603 (= lt!42597 (choose!533 lt!42379 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(assert (=> d!23603 (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23603 (= (addCommutativeForDiffKeys!30 lt!42379 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))) lt!42597)))

(declare-fun bs!3735 () Bool)

(assert (= bs!3735 d!23603))

(declare-fun m!95047 () Bool)

(assert (=> bs!3735 m!95047))

(declare-fun m!95049 () Bool)

(assert (=> bs!3735 m!95049))

(assert (=> bs!3735 m!95049))

(declare-fun m!95051 () Bool)

(assert (=> bs!3735 m!95051))

(assert (=> bs!3735 m!95047))

(declare-fun m!95053 () Bool)

(assert (=> bs!3735 m!95053))

(assert (=> bs!3735 m!94779))

(declare-fun m!95055 () Bool)

(assert (=> bs!3735 m!95055))

(assert (=> b!88613 d!23603))

(declare-fun b!88924 () Bool)

(declare-fun lt!42613 () Unit!2638)

(declare-fun lt!42618 () Unit!2638)

(assert (=> b!88924 (= lt!42613 lt!42618)))

(declare-fun lt!42615 () (_ BitVec 64))

(declare-fun lt!42617 () V!3041)

(declare-fun lt!42614 () ListLongMap!1459)

(declare-fun lt!42612 () (_ BitVec 64))

(assert (=> b!88924 (not (contains!759 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617)) lt!42612))))

(declare-fun addStillNotContains!34 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> b!88924 (= lt!42618 (addStillNotContains!34 lt!42614 lt!42615 lt!42617 lt!42612))))

(assert (=> b!88924 (= lt!42612 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!88924 (= lt!42617 (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!88924 (= lt!42615 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!8609 () ListLongMap!1459)

(assert (=> b!88924 (= lt!42614 call!8609)))

(declare-fun e!57908 () ListLongMap!1459)

(assert (=> b!88924 (= e!57908 (+!111 call!8609 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!88925 () Bool)

(declare-fun e!57911 () ListLongMap!1459)

(assert (=> b!88925 (= e!57911 (ListLongMap!1460 Nil!1533))))

(declare-fun b!88926 () Bool)

(declare-fun e!57909 () Bool)

(declare-fun lt!42616 () ListLongMap!1459)

(declare-fun isEmpty!345 (ListLongMap!1459) Bool)

(assert (=> b!88926 (= e!57909 (isEmpty!345 lt!42616))))

(declare-fun b!88927 () Bool)

(declare-fun e!57912 () Bool)

(declare-fun e!57907 () Bool)

(assert (=> b!88927 (= e!57912 e!57907)))

(declare-fun c!14734 () Bool)

(declare-fun e!57910 () Bool)

(assert (=> b!88927 (= c!14734 e!57910)))

(declare-fun res!45496 () Bool)

(assert (=> b!88927 (=> (not res!45496) (not e!57910))))

(assert (=> b!88927 (= res!45496 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun d!23605 () Bool)

(assert (=> d!23605 e!57912))

(declare-fun res!45494 () Bool)

(assert (=> d!23605 (=> (not res!45494) (not e!57912))))

(assert (=> d!23605 (= res!45494 (not (contains!759 lt!42616 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23605 (= lt!42616 e!57911)))

(declare-fun c!14731 () Bool)

(assert (=> d!23605 (= c!14731 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23605 (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23605 (= (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) lt!42616)))

(declare-fun b!88928 () Bool)

(declare-fun e!57913 () Bool)

(assert (=> b!88928 (= e!57907 e!57913)))

(assert (=> b!88928 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun res!45497 () Bool)

(assert (=> b!88928 (= res!45497 (contains!759 lt!42616 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88928 (=> (not res!45497) (not e!57913))))

(declare-fun b!88929 () Bool)

(assert (=> b!88929 (= e!57908 call!8609)))

(declare-fun b!88930 () Bool)

(assert (=> b!88930 (= e!57909 (= lt!42616 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!88931 () Bool)

(assert (=> b!88931 (= e!57907 e!57909)))

(declare-fun c!14733 () Bool)

(assert (=> b!88931 (= c!14733 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!88932 () Bool)

(assert (=> b!88932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> b!88932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun apply!84 (ListLongMap!1459 (_ BitVec 64)) V!3041)

(assert (=> b!88932 (= e!57913 (= (apply!84 lt!42616 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!88933 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!88933 (= e!57910 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!88933 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!88934 () Bool)

(assert (=> b!88934 (= e!57911 e!57908)))

(declare-fun c!14732 () Bool)

(assert (=> b!88934 (= c!14732 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8606 () Bool)

(assert (=> bm!8606 (= call!8609 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!88935 () Bool)

(declare-fun res!45495 () Bool)

(assert (=> b!88935 (=> (not res!45495) (not e!57912))))

(assert (=> b!88935 (= res!45495 (not (contains!759 lt!42616 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23605 c!14731) b!88925))

(assert (= (and d!23605 (not c!14731)) b!88934))

(assert (= (and b!88934 c!14732) b!88924))

(assert (= (and b!88934 (not c!14732)) b!88929))

(assert (= (or b!88924 b!88929) bm!8606))

(assert (= (and d!23605 res!45494) b!88935))

(assert (= (and b!88935 res!45495) b!88927))

(assert (= (and b!88927 res!45496) b!88933))

(assert (= (and b!88927 c!14734) b!88928))

(assert (= (and b!88927 (not c!14734)) b!88931))

(assert (= (and b!88928 res!45497) b!88932))

(assert (= (and b!88931 c!14733) b!88930))

(assert (= (and b!88931 (not c!14733)) b!88926))

(declare-fun b_lambda!3931 () Bool)

(assert (=> (not b_lambda!3931) (not b!88924)))

(assert (=> b!88924 t!5281))

(declare-fun b_and!5345 () Bool)

(assert (= b_and!5325 (and (=> t!5281 result!2955) b_and!5345)))

(assert (=> b!88924 t!5283))

(declare-fun b_and!5347 () Bool)

(assert (= b_and!5327 (and (=> t!5283 result!2959) b_and!5347)))

(declare-fun b_lambda!3933 () Bool)

(assert (=> (not b_lambda!3933) (not b!88932)))

(assert (=> b!88932 t!5281))

(declare-fun b_and!5349 () Bool)

(assert (= b_and!5345 (and (=> t!5281 result!2955) b_and!5349)))

(assert (=> b!88932 t!5283))

(declare-fun b_and!5351 () Bool)

(assert (= b_and!5347 (and (=> t!5283 result!2959) b_and!5351)))

(declare-fun m!95057 () Bool)

(assert (=> d!23605 m!95057))

(assert (=> d!23605 m!94789))

(declare-fun m!95059 () Bool)

(assert (=> b!88928 m!95059))

(assert (=> b!88928 m!95059))

(declare-fun m!95061 () Bool)

(assert (=> b!88928 m!95061))

(declare-fun m!95063 () Bool)

(assert (=> b!88935 m!95063))

(declare-fun m!95065 () Bool)

(assert (=> b!88924 m!95065))

(assert (=> b!88924 m!94783))

(declare-fun m!95067 () Bool)

(assert (=> b!88924 m!95067))

(declare-fun m!95069 () Bool)

(assert (=> b!88924 m!95069))

(declare-fun m!95071 () Bool)

(assert (=> b!88924 m!95071))

(assert (=> b!88924 m!95065))

(declare-fun m!95073 () Bool)

(assert (=> b!88924 m!95073))

(assert (=> b!88924 m!95069))

(assert (=> b!88924 m!95059))

(declare-fun m!95075 () Bool)

(assert (=> b!88924 m!95075))

(assert (=> b!88924 m!94783))

(assert (=> b!88932 m!94783))

(assert (=> b!88932 m!95065))

(assert (=> b!88932 m!94783))

(assert (=> b!88932 m!95067))

(assert (=> b!88932 m!95065))

(assert (=> b!88932 m!95059))

(declare-fun m!95077 () Bool)

(assert (=> b!88932 m!95077))

(assert (=> b!88932 m!95059))

(declare-fun m!95079 () Bool)

(assert (=> bm!8606 m!95079))

(assert (=> b!88930 m!95079))

(assert (=> b!88933 m!95059))

(assert (=> b!88933 m!95059))

(declare-fun m!95081 () Bool)

(assert (=> b!88933 m!95081))

(assert (=> b!88934 m!95059))

(assert (=> b!88934 m!95059))

(assert (=> b!88934 m!95081))

(declare-fun m!95083 () Bool)

(assert (=> b!88926 m!95083))

(assert (=> b!88613 d!23605))

(declare-fun d!23607 () Bool)

(declare-fun e!57916 () Bool)

(assert (=> d!23607 e!57916))

(declare-fun res!45502 () Bool)

(assert (=> d!23607 (=> (not res!45502) (not e!57916))))

(declare-fun lt!42628 () ListLongMap!1459)

(assert (=> d!23607 (= res!45502 (contains!759 lt!42628 (_1!1121 lt!42377)))))

(declare-fun lt!42630 () List!1536)

(assert (=> d!23607 (= lt!42628 (ListLongMap!1460 lt!42630))))

(declare-fun lt!42629 () Unit!2638)

(declare-fun lt!42627 () Unit!2638)

(assert (=> d!23607 (= lt!42629 lt!42627)))

(assert (=> d!23607 (= (getValueByKey!140 lt!42630 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(declare-fun lemmaContainsTupThenGetReturnValue!60 (List!1536 (_ BitVec 64) V!3041) Unit!2638)

(assert (=> d!23607 (= lt!42627 (lemmaContainsTupThenGetReturnValue!60 lt!42630 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(declare-fun insertStrictlySorted!63 (List!1536 (_ BitVec 64) V!3041) List!1536)

(assert (=> d!23607 (= lt!42630 (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (=> d!23607 (= (+!111 lt!42376 lt!42377) lt!42628)))

(declare-fun b!88940 () Bool)

(declare-fun res!45503 () Bool)

(assert (=> b!88940 (=> (not res!45503) (not e!57916))))

(assert (=> b!88940 (= res!45503 (= (getValueByKey!140 (toList!745 lt!42628) (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377))))))

(declare-fun b!88941 () Bool)

(declare-fun contains!760 (List!1536 tuple2!2220) Bool)

(assert (=> b!88941 (= e!57916 (contains!760 (toList!745 lt!42628) lt!42377))))

(assert (= (and d!23607 res!45502) b!88940))

(assert (= (and b!88940 res!45503) b!88941))

(declare-fun m!95085 () Bool)

(assert (=> d!23607 m!95085))

(declare-fun m!95087 () Bool)

(assert (=> d!23607 m!95087))

(declare-fun m!95089 () Bool)

(assert (=> d!23607 m!95089))

(declare-fun m!95091 () Bool)

(assert (=> d!23607 m!95091))

(declare-fun m!95093 () Bool)

(assert (=> b!88940 m!95093))

(declare-fun m!95095 () Bool)

(assert (=> b!88941 m!95095))

(assert (=> b!88613 d!23607))

(declare-fun d!23609 () Bool)

(declare-fun e!57917 () Bool)

(assert (=> d!23609 e!57917))

(declare-fun res!45504 () Bool)

(assert (=> d!23609 (=> (not res!45504) (not e!57917))))

(declare-fun lt!42632 () ListLongMap!1459)

(assert (=> d!23609 (= res!45504 (contains!759 lt!42632 (_1!1121 lt!42391)))))

(declare-fun lt!42634 () List!1536)

(assert (=> d!23609 (= lt!42632 (ListLongMap!1460 lt!42634))))

(declare-fun lt!42633 () Unit!2638)

(declare-fun lt!42631 () Unit!2638)

(assert (=> d!23609 (= lt!42633 lt!42631)))

(assert (=> d!23609 (= (getValueByKey!140 lt!42634 (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391)))))

(assert (=> d!23609 (= lt!42631 (lemmaContainsTupThenGetReturnValue!60 lt!42634 (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (=> d!23609 (= lt!42634 (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (=> d!23609 (= (+!111 lt!42379 lt!42391) lt!42632)))

(declare-fun b!88942 () Bool)

(declare-fun res!45505 () Bool)

(assert (=> b!88942 (=> (not res!45505) (not e!57917))))

(assert (=> b!88942 (= res!45505 (= (getValueByKey!140 (toList!745 lt!42632) (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391))))))

(declare-fun b!88943 () Bool)

(assert (=> b!88943 (= e!57917 (contains!760 (toList!745 lt!42632) lt!42391))))

(assert (= (and d!23609 res!45504) b!88942))

(assert (= (and b!88942 res!45505) b!88943))

(declare-fun m!95097 () Bool)

(assert (=> d!23609 m!95097))

(declare-fun m!95099 () Bool)

(assert (=> d!23609 m!95099))

(declare-fun m!95101 () Bool)

(assert (=> d!23609 m!95101))

(declare-fun m!95103 () Bool)

(assert (=> d!23609 m!95103))

(declare-fun m!95105 () Bool)

(assert (=> b!88942 m!95105))

(declare-fun m!95107 () Bool)

(assert (=> b!88943 m!95107))

(assert (=> b!88613 d!23609))

(declare-fun d!23611 () Bool)

(declare-fun e!57918 () Bool)

(assert (=> d!23611 e!57918))

(declare-fun res!45506 () Bool)

(assert (=> d!23611 (=> (not res!45506) (not e!57918))))

(declare-fun lt!42636 () ListLongMap!1459)

(assert (=> d!23611 (= res!45506 (contains!759 lt!42636 (_1!1121 lt!42391)))))

(declare-fun lt!42638 () List!1536)

(assert (=> d!23611 (= lt!42636 (ListLongMap!1460 lt!42638))))

(declare-fun lt!42637 () Unit!2638)

(declare-fun lt!42635 () Unit!2638)

(assert (=> d!23611 (= lt!42637 lt!42635)))

(assert (=> d!23611 (= (getValueByKey!140 lt!42638 (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391)))))

(assert (=> d!23611 (= lt!42635 (lemmaContainsTupThenGetReturnValue!60 lt!42638 (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (=> d!23611 (= lt!42638 (insertStrictlySorted!63 (toList!745 lt!42385) (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (=> d!23611 (= (+!111 lt!42385 lt!42391) lt!42636)))

(declare-fun b!88944 () Bool)

(declare-fun res!45507 () Bool)

(assert (=> b!88944 (=> (not res!45507) (not e!57918))))

(assert (=> b!88944 (= res!45507 (= (getValueByKey!140 (toList!745 lt!42636) (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391))))))

(declare-fun b!88945 () Bool)

(assert (=> b!88945 (= e!57918 (contains!760 (toList!745 lt!42636) lt!42391))))

(assert (= (and d!23611 res!45506) b!88944))

(assert (= (and b!88944 res!45507) b!88945))

(declare-fun m!95109 () Bool)

(assert (=> d!23611 m!95109))

(declare-fun m!95111 () Bool)

(assert (=> d!23611 m!95111))

(declare-fun m!95113 () Bool)

(assert (=> d!23611 m!95113))

(declare-fun m!95115 () Bool)

(assert (=> d!23611 m!95115))

(declare-fun m!95117 () Bool)

(assert (=> b!88944 m!95117))

(declare-fun m!95119 () Bool)

(assert (=> b!88945 m!95119))

(assert (=> b!88613 d!23611))

(declare-fun d!23613 () Bool)

(declare-fun e!57919 () Bool)

(assert (=> d!23613 e!57919))

(declare-fun res!45508 () Bool)

(assert (=> d!23613 (=> (not res!45508) (not e!57919))))

(declare-fun lt!42640 () ListLongMap!1459)

(assert (=> d!23613 (= res!45508 (contains!759 lt!42640 (_1!1121 lt!42377)))))

(declare-fun lt!42642 () List!1536)

(assert (=> d!23613 (= lt!42640 (ListLongMap!1460 lt!42642))))

(declare-fun lt!42641 () Unit!2638)

(declare-fun lt!42639 () Unit!2638)

(assert (=> d!23613 (= lt!42641 lt!42639)))

(assert (=> d!23613 (= (getValueByKey!140 lt!42642 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(assert (=> d!23613 (= lt!42639 (lemmaContainsTupThenGetReturnValue!60 lt!42642 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (=> d!23613 (= lt!42642 (insertStrictlySorted!63 (toList!745 (+!111 lt!42379 lt!42391)) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (=> d!23613 (= (+!111 (+!111 lt!42379 lt!42391) lt!42377) lt!42640)))

(declare-fun b!88946 () Bool)

(declare-fun res!45509 () Bool)

(assert (=> b!88946 (=> (not res!45509) (not e!57919))))

(assert (=> b!88946 (= res!45509 (= (getValueByKey!140 (toList!745 lt!42640) (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377))))))

(declare-fun b!88947 () Bool)

(assert (=> b!88947 (= e!57919 (contains!760 (toList!745 lt!42640) lt!42377))))

(assert (= (and d!23613 res!45508) b!88946))

(assert (= (and b!88946 res!45509) b!88947))

(declare-fun m!95121 () Bool)

(assert (=> d!23613 m!95121))

(declare-fun m!95123 () Bool)

(assert (=> d!23613 m!95123))

(declare-fun m!95125 () Bool)

(assert (=> d!23613 m!95125))

(declare-fun m!95127 () Bool)

(assert (=> d!23613 m!95127))

(declare-fun m!95129 () Bool)

(assert (=> b!88946 m!95129))

(declare-fun m!95131 () Bool)

(assert (=> b!88947 m!95131))

(assert (=> b!88613 d!23613))

(declare-fun d!23615 () Bool)

(declare-fun e!57920 () Bool)

(assert (=> d!23615 e!57920))

(declare-fun res!45510 () Bool)

(assert (=> d!23615 (=> (not res!45510) (not e!57920))))

(declare-fun lt!42644 () ListLongMap!1459)

(assert (=> d!23615 (= res!45510 (contains!759 lt!42644 (_1!1121 lt!42377)))))

(declare-fun lt!42646 () List!1536)

(assert (=> d!23615 (= lt!42644 (ListLongMap!1460 lt!42646))))

(declare-fun lt!42645 () Unit!2638)

(declare-fun lt!42643 () Unit!2638)

(assert (=> d!23615 (= lt!42645 lt!42643)))

(assert (=> d!23615 (= (getValueByKey!140 lt!42646 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(assert (=> d!23615 (= lt!42643 (lemmaContainsTupThenGetReturnValue!60 lt!42646 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (=> d!23615 (= lt!42646 (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (=> d!23615 (= (+!111 lt!42379 lt!42377) lt!42644)))

(declare-fun b!88948 () Bool)

(declare-fun res!45511 () Bool)

(assert (=> b!88948 (=> (not res!45511) (not e!57920))))

(assert (=> b!88948 (= res!45511 (= (getValueByKey!140 (toList!745 lt!42644) (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377))))))

(declare-fun b!88949 () Bool)

(assert (=> b!88949 (= e!57920 (contains!760 (toList!745 lt!42644) lt!42377))))

(assert (= (and d!23615 res!45510) b!88948))

(assert (= (and b!88948 res!45511) b!88949))

(declare-fun m!95133 () Bool)

(assert (=> d!23615 m!95133))

(declare-fun m!95135 () Bool)

(assert (=> d!23615 m!95135))

(declare-fun m!95137 () Bool)

(assert (=> d!23615 m!95137))

(declare-fun m!95139 () Bool)

(assert (=> d!23615 m!95139))

(declare-fun m!95141 () Bool)

(assert (=> b!88948 m!95141))

(declare-fun m!95143 () Bool)

(assert (=> b!88949 m!95143))

(assert (=> b!88613 d!23615))

(declare-fun d!23617 () Bool)

(declare-fun e!57921 () Bool)

(assert (=> d!23617 e!57921))

(declare-fun res!45512 () Bool)

(assert (=> d!23617 (=> (not res!45512) (not e!57921))))

(declare-fun lt!42648 () ListLongMap!1459)

(assert (=> d!23617 (= res!45512 (contains!759 lt!42648 (_1!1121 lt!42383)))))

(declare-fun lt!42650 () List!1536)

(assert (=> d!23617 (= lt!42648 (ListLongMap!1460 lt!42650))))

(declare-fun lt!42649 () Unit!2638)

(declare-fun lt!42647 () Unit!2638)

(assert (=> d!23617 (= lt!42649 lt!42647)))

(assert (=> d!23617 (= (getValueByKey!140 lt!42650 (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383)))))

(assert (=> d!23617 (= lt!42647 (lemmaContainsTupThenGetReturnValue!60 lt!42650 (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (=> d!23617 (= lt!42650 (insertStrictlySorted!63 (toList!745 lt!42384) (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (=> d!23617 (= (+!111 lt!42384 lt!42383) lt!42648)))

(declare-fun b!88950 () Bool)

(declare-fun res!45513 () Bool)

(assert (=> b!88950 (=> (not res!45513) (not e!57921))))

(assert (=> b!88950 (= res!45513 (= (getValueByKey!140 (toList!745 lt!42648) (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383))))))

(declare-fun b!88951 () Bool)

(assert (=> b!88951 (= e!57921 (contains!760 (toList!745 lt!42648) lt!42383))))

(assert (= (and d!23617 res!45512) b!88950))

(assert (= (and b!88950 res!45513) b!88951))

(declare-fun m!95145 () Bool)

(assert (=> d!23617 m!95145))

(declare-fun m!95147 () Bool)

(assert (=> d!23617 m!95147))

(declare-fun m!95149 () Bool)

(assert (=> d!23617 m!95149))

(declare-fun m!95151 () Bool)

(assert (=> d!23617 m!95151))

(declare-fun m!95153 () Bool)

(assert (=> b!88950 m!95153))

(declare-fun m!95155 () Bool)

(assert (=> b!88951 m!95155))

(assert (=> b!88613 d!23617))

(declare-fun d!23619 () Bool)

(assert (=> d!23619 (= (+!111 (+!111 lt!42376 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (+!111 (+!111 lt!42376 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(declare-fun lt!42651 () Unit!2638)

(assert (=> d!23619 (= lt!42651 (choose!533 lt!42376 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(assert (=> d!23619 (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23619 (= (addCommutativeForDiffKeys!30 lt!42376 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) lt!42651)))

(declare-fun bs!3736 () Bool)

(assert (= bs!3736 d!23619))

(declare-fun m!95157 () Bool)

(assert (=> bs!3736 m!95157))

(declare-fun m!95159 () Bool)

(assert (=> bs!3736 m!95159))

(assert (=> bs!3736 m!95159))

(declare-fun m!95161 () Bool)

(assert (=> bs!3736 m!95161))

(assert (=> bs!3736 m!95157))

(declare-fun m!95163 () Bool)

(assert (=> bs!3736 m!95163))

(assert (=> bs!3736 m!94779))

(declare-fun m!95165 () Bool)

(assert (=> bs!3736 m!95165))

(assert (=> b!88613 d!23619))

(declare-fun d!23621 () Bool)

(assert (=> d!23621 (= (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992)))) (and (or (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000001111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000011111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000001111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000011111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000001111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000011111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000001111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000011111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000000111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000001111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000011111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000000111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000001111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000011111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000000111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000001111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000011111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000000111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000001111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000011111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00000111111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00001111111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00011111111111111111111111111111) (= (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6414 (v!2667 (underlying!291 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!88613 d!23621))

(declare-fun d!23623 () Bool)

(declare-fun e!57922 () Bool)

(assert (=> d!23623 e!57922))

(declare-fun res!45514 () Bool)

(assert (=> d!23623 (=> (not res!45514) (not e!57922))))

(declare-fun lt!42653 () ListLongMap!1459)

(assert (=> d!23623 (= res!45514 (contains!759 lt!42653 (_1!1121 lt!42383)))))

(declare-fun lt!42655 () List!1536)

(assert (=> d!23623 (= lt!42653 (ListLongMap!1460 lt!42655))))

(declare-fun lt!42654 () Unit!2638)

(declare-fun lt!42652 () Unit!2638)

(assert (=> d!23623 (= lt!42654 lt!42652)))

(assert (=> d!23623 (= (getValueByKey!140 lt!42655 (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383)))))

(assert (=> d!23623 (= lt!42652 (lemmaContainsTupThenGetReturnValue!60 lt!42655 (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (=> d!23623 (= lt!42655 (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (=> d!23623 (= (+!111 lt!42376 lt!42383) lt!42653)))

(declare-fun b!88952 () Bool)

(declare-fun res!45515 () Bool)

(assert (=> b!88952 (=> (not res!45515) (not e!57922))))

(assert (=> b!88952 (= res!45515 (= (getValueByKey!140 (toList!745 lt!42653) (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383))))))

(declare-fun b!88953 () Bool)

(assert (=> b!88953 (= e!57922 (contains!760 (toList!745 lt!42653) lt!42383))))

(assert (= (and d!23623 res!45514) b!88952))

(assert (= (and b!88952 res!45515) b!88953))

(declare-fun m!95167 () Bool)

(assert (=> d!23623 m!95167))

(declare-fun m!95169 () Bool)

(assert (=> d!23623 m!95169))

(declare-fun m!95171 () Bool)

(assert (=> d!23623 m!95171))

(declare-fun m!95173 () Bool)

(assert (=> d!23623 m!95173))

(declare-fun m!95175 () Bool)

(assert (=> b!88952 m!95175))

(declare-fun m!95177 () Bool)

(assert (=> b!88953 m!95177))

(assert (=> b!88613 d!23623))

(declare-fun d!23625 () Bool)

(assert (=> d!23625 (= (array_inv!1205 (_keys!4048 newMap!16)) (bvsge (size!2165 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88625 d!23625))

(declare-fun d!23627 () Bool)

(assert (=> d!23627 (= (array_inv!1206 (_values!2354 newMap!16)) (bvsge (size!2166 (_values!2354 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!88625 d!23627))

(declare-fun d!23629 () Bool)

(declare-fun res!45522 () Bool)

(declare-fun e!57925 () Bool)

(assert (=> d!23629 (=> (not res!45522) (not e!57925))))

(declare-fun simpleValid!60 (LongMapFixedSize!766) Bool)

(assert (=> d!23629 (= res!45522 (simpleValid!60 newMap!16))))

(assert (=> d!23629 (= (valid!344 newMap!16) e!57925)))

(declare-fun b!88960 () Bool)

(declare-fun res!45523 () Bool)

(assert (=> b!88960 (=> (not res!45523) (not e!57925))))

(declare-fun arrayCountValidKeys!0 (array!4033 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!88960 (= res!45523 (= (arrayCountValidKeys!0 (_keys!4048 newMap!16) #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (_size!432 newMap!16)))))

(declare-fun b!88961 () Bool)

(declare-fun res!45524 () Bool)

(assert (=> b!88961 (=> (not res!45524) (not e!57925))))

(assert (=> b!88961 (= res!45524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun b!88962 () Bool)

(assert (=> b!88962 (= e!57925 (arrayNoDuplicates!0 (_keys!4048 newMap!16) #b00000000000000000000000000000000 Nil!1532))))

(assert (= (and d!23629 res!45522) b!88960))

(assert (= (and b!88960 res!45523) b!88961))

(assert (= (and b!88961 res!45524) b!88962))

(declare-fun m!95179 () Bool)

(assert (=> d!23629 m!95179))

(declare-fun m!95181 () Bool)

(assert (=> b!88960 m!95181))

(declare-fun m!95183 () Bool)

(assert (=> b!88961 m!95183))

(declare-fun m!95185 () Bool)

(assert (=> b!88962 m!95185))

(assert (=> b!88615 d!23629))

(declare-fun d!23631 () Bool)

(assert (=> d!23631 (= (valid!343 thiss!992) (valid!344 (v!2667 (underlying!291 thiss!992))))))

(declare-fun bs!3737 () Bool)

(assert (= bs!3737 d!23631))

(declare-fun m!95187 () Bool)

(assert (=> bs!3737 m!95187))

(assert (=> start!10950 d!23631))

(declare-fun b!88973 () Bool)

(declare-fun e!57936 () Bool)

(declare-fun call!8612 () Bool)

(assert (=> b!88973 (= e!57936 call!8612)))

(declare-fun bm!8609 () Bool)

(declare-fun c!14737 () Bool)

(assert (=> bm!8609 (= call!8612 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14737 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) Nil!1532) Nil!1532)))))

(declare-fun d!23633 () Bool)

(declare-fun res!45531 () Bool)

(declare-fun e!57935 () Bool)

(assert (=> d!23633 (=> res!45531 e!57935)))

(assert (=> d!23633 (= res!45531 (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23633 (= (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 Nil!1532) e!57935)))

(declare-fun b!88974 () Bool)

(assert (=> b!88974 (= e!57936 call!8612)))

(declare-fun b!88975 () Bool)

(declare-fun e!57934 () Bool)

(assert (=> b!88975 (= e!57935 e!57934)))

(declare-fun res!45533 () Bool)

(assert (=> b!88975 (=> (not res!45533) (not e!57934))))

(declare-fun e!57937 () Bool)

(assert (=> b!88975 (= res!45533 (not e!57937))))

(declare-fun res!45532 () Bool)

(assert (=> b!88975 (=> (not res!45532) (not e!57937))))

(assert (=> b!88975 (= res!45532 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!88976 () Bool)

(assert (=> b!88976 (= e!57934 e!57936)))

(assert (=> b!88976 (= c!14737 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!88977 () Bool)

(declare-fun contains!761 (List!1535 (_ BitVec 64)) Bool)

(assert (=> b!88977 (= e!57937 (contains!761 Nil!1532 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23633 (not res!45531)) b!88975))

(assert (= (and b!88975 res!45532) b!88977))

(assert (= (and b!88975 res!45533) b!88976))

(assert (= (and b!88976 c!14737) b!88974))

(assert (= (and b!88976 (not c!14737)) b!88973))

(assert (= (or b!88974 b!88973) bm!8609))

(declare-fun m!95189 () Bool)

(assert (=> bm!8609 m!95189))

(declare-fun m!95191 () Bool)

(assert (=> bm!8609 m!95191))

(assert (=> b!88975 m!95189))

(assert (=> b!88975 m!95189))

(declare-fun m!95193 () Bool)

(assert (=> b!88975 m!95193))

(assert (=> b!88976 m!95189))

(assert (=> b!88976 m!95189))

(assert (=> b!88976 m!95193))

(assert (=> b!88977 m!95189))

(assert (=> b!88977 m!95189))

(declare-fun m!95195 () Bool)

(assert (=> b!88977 m!95195))

(assert (=> b!88618 d!23633))

(declare-fun d!23635 () Bool)

(assert (=> d!23635 (not (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42658 () Unit!2638)

(declare-fun choose!68 (array!4033 (_ BitVec 32) (_ BitVec 64) List!1535) Unit!2638)

(assert (=> d!23635 (= lt!42658 (choose!68 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532)))))

(assert (=> d!23635 (bvslt (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23635 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532)) lt!42658)))

(declare-fun bs!3738 () Bool)

(assert (= bs!3738 d!23635))

(assert (=> bs!3738 m!94779))

(assert (=> bs!3738 m!94819))

(assert (=> bs!3738 m!94779))

(declare-fun m!95197 () Bool)

(assert (=> bs!3738 m!95197))

(assert (=> b!88609 d!23635))

(declare-fun d!23637 () Bool)

(assert (=> d!23637 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) from!355 Nil!1532)))

(declare-fun lt!42661 () Unit!2638)

(declare-fun choose!39 (array!4033 (_ BitVec 32) (_ BitVec 32)) Unit!2638)

(assert (=> d!23637 (= lt!42661 (choose!39 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!23637 (bvslt (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!23637 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 from!355) lt!42661)))

(declare-fun bs!3739 () Bool)

(assert (= bs!3739 d!23637))

(assert (=> bs!3739 m!94815))

(declare-fun m!95199 () Bool)

(assert (=> bs!3739 m!95199))

(assert (=> b!88609 d!23637))

(declare-fun d!23639 () Bool)

(declare-fun res!45538 () Bool)

(declare-fun e!57942 () Bool)

(assert (=> d!23639 (=> res!45538 e!57942)))

(assert (=> d!23639 (= res!45538 (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23639 (= (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!57942)))

(declare-fun b!88982 () Bool)

(declare-fun e!57943 () Bool)

(assert (=> b!88982 (= e!57942 e!57943)))

(declare-fun res!45539 () Bool)

(assert (=> b!88982 (=> (not res!45539) (not e!57943))))

(assert (=> b!88982 (= res!45539 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!88983 () Bool)

(assert (=> b!88983 (= e!57943 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!23639 (not res!45538)) b!88982))

(assert (= (and b!88982 res!45539) b!88983))

(assert (=> d!23639 m!95059))

(assert (=> b!88983 m!94779))

(declare-fun m!95201 () Bool)

(assert (=> b!88983 m!95201))

(assert (=> b!88609 d!23639))

(declare-fun d!23641 () Bool)

(declare-fun e!57946 () Bool)

(assert (=> d!23641 e!57946))

(declare-fun c!14740 () Bool)

(assert (=> d!23641 (= c!14740 (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!42664 () Unit!2638)

(declare-fun choose!534 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2638)

(assert (=> d!23641 (= lt!42664 (choose!534 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(assert (=> d!23641 (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23641 (= (lemmaListMapContainsThenArrayContainsFrom!71 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) lt!42664)))

(declare-fun b!88988 () Bool)

(assert (=> b!88988 (= e!57946 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!88989 () Bool)

(assert (=> b!88989 (= e!57946 (ite (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23641 c!14740) b!88988))

(assert (= (and d!23641 (not c!14740)) b!88989))

(assert (=> d!23641 m!94779))

(declare-fun m!95203 () Bool)

(assert (=> d!23641 m!95203))

(assert (=> d!23641 m!94789))

(assert (=> b!88988 m!94779))

(assert (=> b!88988 m!94819))

(assert (=> b!88609 d!23641))

(declare-fun b!88990 () Bool)

(declare-fun e!57949 () Bool)

(declare-fun call!8613 () Bool)

(assert (=> b!88990 (= e!57949 call!8613)))

(declare-fun c!14741 () Bool)

(declare-fun bm!8610 () Bool)

(assert (=> bm!8610 (= call!8613 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14741 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532) Nil!1532)))))

(declare-fun d!23643 () Bool)

(declare-fun res!45540 () Bool)

(declare-fun e!57948 () Bool)

(assert (=> d!23643 (=> res!45540 e!57948)))

(assert (=> d!23643 (= res!45540 (bvsge from!355 (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23643 (= (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) from!355 Nil!1532) e!57948)))

(declare-fun b!88991 () Bool)

(assert (=> b!88991 (= e!57949 call!8613)))

(declare-fun b!88992 () Bool)

(declare-fun e!57947 () Bool)

(assert (=> b!88992 (= e!57948 e!57947)))

(declare-fun res!45542 () Bool)

(assert (=> b!88992 (=> (not res!45542) (not e!57947))))

(declare-fun e!57950 () Bool)

(assert (=> b!88992 (= res!45542 (not e!57950))))

(declare-fun res!45541 () Bool)

(assert (=> b!88992 (=> (not res!45541) (not e!57950))))

(assert (=> b!88992 (= res!45541 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!88993 () Bool)

(assert (=> b!88993 (= e!57947 e!57949)))

(assert (=> b!88993 (= c!14741 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!88994 () Bool)

(assert (=> b!88994 (= e!57950 (contains!761 Nil!1532 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (= (and d!23643 (not res!45540)) b!88992))

(assert (= (and b!88992 res!45541) b!88994))

(assert (= (and b!88992 res!45542) b!88993))

(assert (= (and b!88993 c!14741) b!88991))

(assert (= (and b!88993 (not c!14741)) b!88990))

(assert (= (or b!88991 b!88990) bm!8610))

(assert (=> bm!8610 m!94779))

(declare-fun m!95205 () Bool)

(assert (=> bm!8610 m!95205))

(assert (=> b!88992 m!94779))

(assert (=> b!88992 m!94779))

(declare-fun m!95207 () Bool)

(assert (=> b!88992 m!95207))

(assert (=> b!88993 m!94779))

(assert (=> b!88993 m!94779))

(assert (=> b!88993 m!95207))

(assert (=> b!88994 m!94779))

(assert (=> b!88994 m!94779))

(declare-fun m!95209 () Bool)

(assert (=> b!88994 m!95209))

(assert (=> b!88609 d!23643))

(declare-fun d!23645 () Bool)

(declare-fun c!14744 () Bool)

(assert (=> d!23645 (= c!14744 ((_ is ValueCellFull!929) (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun e!57953 () V!3041)

(assert (=> d!23645 (= (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!57953)))

(declare-fun b!88999 () Bool)

(declare-fun get!1215 (ValueCell!929 V!3041) V!3041)

(assert (=> b!88999 (= e!57953 (get!1215 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89000 () Bool)

(declare-fun get!1216 (ValueCell!929 V!3041) V!3041)

(assert (=> b!89000 (= e!57953 (get!1216 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23645 c!14744) b!88999))

(assert (= (and d!23645 (not c!14744)) b!89000))

(assert (=> b!88999 m!94781))

(assert (=> b!88999 m!94783))

(declare-fun m!95211 () Bool)

(assert (=> b!88999 m!95211))

(assert (=> b!89000 m!94781))

(assert (=> b!89000 m!94783))

(declare-fun m!95213 () Bool)

(assert (=> b!89000 m!95213))

(assert (=> b!88626 d!23645))

(declare-fun d!23647 () Bool)

(assert (=> d!23647 (= (map!1193 newMap!16) (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun bs!3740 () Bool)

(assert (= bs!3740 d!23647))

(assert (=> bs!3740 m!94993))

(assert (=> b!88612 d!23647))

(declare-fun bm!8625 () Bool)

(declare-fun call!8630 () ListLongMap!1459)

(declare-fun call!8629 () ListLongMap!1459)

(assert (=> bm!8625 (= call!8630 call!8629)))

(declare-fun bm!8626 () Bool)

(declare-fun call!8632 () Bool)

(declare-fun lt!42718 () ListLongMap!1459)

(assert (=> bm!8626 (= call!8632 (contains!759 lt!42718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89043 () Bool)

(declare-fun e!57988 () Bool)

(declare-fun e!57984 () Bool)

(assert (=> b!89043 (= e!57988 e!57984)))

(declare-fun res!45567 () Bool)

(declare-fun call!8633 () Bool)

(assert (=> b!89043 (= res!45567 call!8633)))

(assert (=> b!89043 (=> (not res!45567) (not e!57984))))

(declare-fun b!89044 () Bool)

(declare-fun e!57991 () Bool)

(assert (=> b!89044 (= e!57991 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89045 () Bool)

(declare-fun e!57982 () Bool)

(assert (=> b!89045 (= e!57982 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!8627 () Bool)

(assert (=> bm!8627 (= call!8629 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89046 () Bool)

(declare-fun e!57983 () Bool)

(assert (=> b!89046 (= e!57983 e!57988)))

(declare-fun c!14758 () Bool)

(assert (=> b!89046 (= c!14758 (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89047 () Bool)

(declare-fun e!57985 () ListLongMap!1459)

(declare-fun call!8631 () ListLongMap!1459)

(assert (=> b!89047 (= e!57985 call!8631)))

(declare-fun bm!8628 () Bool)

(declare-fun call!8628 () ListLongMap!1459)

(assert (=> bm!8628 (= call!8631 call!8628)))

(declare-fun bm!8629 () Bool)

(declare-fun call!8634 () ListLongMap!1459)

(assert (=> bm!8629 (= call!8634 call!8630)))

(declare-fun b!89048 () Bool)

(declare-fun res!45568 () Bool)

(assert (=> b!89048 (=> (not res!45568) (not e!57983))))

(declare-fun e!57992 () Bool)

(assert (=> b!89048 (= res!45568 e!57992)))

(declare-fun res!45564 () Bool)

(assert (=> b!89048 (=> res!45564 e!57992)))

(assert (=> b!89048 (= res!45564 (not e!57982))))

(declare-fun res!45562 () Bool)

(assert (=> b!89048 (=> (not res!45562) (not e!57982))))

(assert (=> b!89048 (= res!45562 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun bm!8630 () Bool)

(assert (=> bm!8630 (= call!8633 (contains!759 lt!42718 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23649 () Bool)

(assert (=> d!23649 e!57983))

(declare-fun res!45561 () Bool)

(assert (=> d!23649 (=> (not res!45561) (not e!57983))))

(assert (=> d!23649 (= res!45561 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun lt!42719 () ListLongMap!1459)

(assert (=> d!23649 (= lt!42718 lt!42719)))

(declare-fun lt!42720 () Unit!2638)

(declare-fun e!57980 () Unit!2638)

(assert (=> d!23649 (= lt!42720 e!57980)))

(declare-fun c!14762 () Bool)

(assert (=> d!23649 (= c!14762 e!57991)))

(declare-fun res!45563 () Bool)

(assert (=> d!23649 (=> (not res!45563) (not e!57991))))

(assert (=> d!23649 (= res!45563 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun e!57987 () ListLongMap!1459)

(assert (=> d!23649 (= lt!42719 e!57987)))

(declare-fun c!14759 () Bool)

(assert (=> d!23649 (= c!14759 (and (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23649 (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23649 (= (getCurrentListMap!429 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) lt!42718)))

(declare-fun b!89049 () Bool)

(declare-fun e!57989 () Bool)

(assert (=> b!89049 (= e!57989 (= (apply!84 lt!42718 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89050 () Bool)

(declare-fun Unit!2647 () Unit!2638)

(assert (=> b!89050 (= e!57980 Unit!2647)))

(declare-fun b!89051 () Bool)

(declare-fun e!57990 () Bool)

(assert (=> b!89051 (= e!57990 e!57989)))

(declare-fun res!45569 () Bool)

(assert (=> b!89051 (= res!45569 call!8632)))

(assert (=> b!89051 (=> (not res!45569) (not e!57989))))

(declare-fun b!89052 () Bool)

(assert (=> b!89052 (= e!57987 (+!111 call!8628 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun e!57986 () Bool)

(declare-fun b!89053 () Bool)

(assert (=> b!89053 (= e!57986 (= (apply!84 lt!42718 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> b!89053 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89054 () Bool)

(assert (=> b!89054 (= e!57990 (not call!8632))))

(declare-fun b!89055 () Bool)

(declare-fun res!45566 () Bool)

(assert (=> b!89055 (=> (not res!45566) (not e!57983))))

(assert (=> b!89055 (= res!45566 e!57990)))

(declare-fun c!14761 () Bool)

(assert (=> b!89055 (= c!14761 (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89056 () Bool)

(declare-fun c!14760 () Bool)

(assert (=> b!89056 (= c!14760 (and (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!57981 () ListLongMap!1459)

(assert (=> b!89056 (= e!57985 e!57981)))

(declare-fun b!89057 () Bool)

(assert (=> b!89057 (= e!57988 (not call!8633))))

(declare-fun b!89058 () Bool)

(assert (=> b!89058 (= e!57987 e!57985)))

(declare-fun c!14757 () Bool)

(assert (=> b!89058 (= c!14757 (and (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89059 () Bool)

(assert (=> b!89059 (= e!57984 (= (apply!84 lt!42718 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89060 () Bool)

(assert (=> b!89060 (= e!57992 e!57986)))

(declare-fun res!45565 () Bool)

(assert (=> b!89060 (=> (not res!45565) (not e!57986))))

(assert (=> b!89060 (= res!45565 (contains!759 lt!42718 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89060 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89061 () Bool)

(declare-fun lt!42730 () Unit!2638)

(assert (=> b!89061 (= e!57980 lt!42730)))

(declare-fun lt!42722 () ListLongMap!1459)

(assert (=> b!89061 (= lt!42722 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42712 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42712 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42725 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42725 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42721 () Unit!2638)

(declare-fun addStillContains!60 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> b!89061 (= lt!42721 (addStillContains!60 lt!42722 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42725))))

(assert (=> b!89061 (contains!759 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42725)))

(declare-fun lt!42715 () Unit!2638)

(assert (=> b!89061 (= lt!42715 lt!42721)))

(declare-fun lt!42710 () ListLongMap!1459)

(assert (=> b!89061 (= lt!42710 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42723 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42728 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42728 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42727 () Unit!2638)

(declare-fun addApplyDifferent!60 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> b!89061 (= lt!42727 (addApplyDifferent!60 lt!42710 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42728))))

(assert (=> b!89061 (= (apply!84 (+!111 lt!42710 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42728) (apply!84 lt!42710 lt!42728))))

(declare-fun lt!42711 () Unit!2638)

(assert (=> b!89061 (= lt!42711 lt!42727)))

(declare-fun lt!42714 () ListLongMap!1459)

(assert (=> b!89061 (= lt!42714 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42729 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42713 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42713 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!42717 () Unit!2638)

(assert (=> b!89061 (= lt!42717 (addApplyDifferent!60 lt!42714 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42713))))

(assert (=> b!89061 (= (apply!84 (+!111 lt!42714 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42713) (apply!84 lt!42714 lt!42713))))

(declare-fun lt!42709 () Unit!2638)

(assert (=> b!89061 (= lt!42709 lt!42717)))

(declare-fun lt!42724 () ListLongMap!1459)

(assert (=> b!89061 (= lt!42724 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun lt!42716 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42716 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42726 () (_ BitVec 64))

(assert (=> b!89061 (= lt!42726 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!89061 (= lt!42730 (addApplyDifferent!60 lt!42724 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42726))))

(assert (=> b!89061 (= (apply!84 (+!111 lt!42724 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42726) (apply!84 lt!42724 lt!42726))))

(declare-fun b!89062 () Bool)

(assert (=> b!89062 (= e!57981 call!8634)))

(declare-fun bm!8631 () Bool)

(assert (=> bm!8631 (= call!8628 (+!111 (ite c!14759 call!8629 (ite c!14757 call!8630 call!8634)) (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun b!89063 () Bool)

(assert (=> b!89063 (= e!57981 call!8631)))

(assert (= (and d!23649 c!14759) b!89052))

(assert (= (and d!23649 (not c!14759)) b!89058))

(assert (= (and b!89058 c!14757) b!89047))

(assert (= (and b!89058 (not c!14757)) b!89056))

(assert (= (and b!89056 c!14760) b!89063))

(assert (= (and b!89056 (not c!14760)) b!89062))

(assert (= (or b!89063 b!89062) bm!8629))

(assert (= (or b!89047 bm!8629) bm!8625))

(assert (= (or b!89047 b!89063) bm!8628))

(assert (= (or b!89052 bm!8625) bm!8627))

(assert (= (or b!89052 bm!8628) bm!8631))

(assert (= (and d!23649 res!45563) b!89044))

(assert (= (and d!23649 c!14762) b!89061))

(assert (= (and d!23649 (not c!14762)) b!89050))

(assert (= (and d!23649 res!45561) b!89048))

(assert (= (and b!89048 res!45562) b!89045))

(assert (= (and b!89048 (not res!45564)) b!89060))

(assert (= (and b!89060 res!45565) b!89053))

(assert (= (and b!89048 res!45568) b!89055))

(assert (= (and b!89055 c!14761) b!89051))

(assert (= (and b!89055 (not c!14761)) b!89054))

(assert (= (and b!89051 res!45569) b!89049))

(assert (= (or b!89051 b!89054) bm!8626))

(assert (= (and b!89055 res!45566) b!89046))

(assert (= (and b!89046 c!14758) b!89043))

(assert (= (and b!89046 (not c!14758)) b!89057))

(assert (= (and b!89043 res!45567) b!89059))

(assert (= (or b!89043 b!89057) bm!8630))

(declare-fun b_lambda!3935 () Bool)

(assert (=> (not b_lambda!3935) (not b!89053)))

(assert (=> b!89053 t!5281))

(declare-fun b_and!5353 () Bool)

(assert (= b_and!5349 (and (=> t!5281 result!2955) b_and!5353)))

(assert (=> b!89053 t!5283))

(declare-fun b_and!5355 () Bool)

(assert (= b_and!5351 (and (=> t!5283 result!2959) b_and!5355)))

(declare-fun m!95215 () Bool)

(assert (=> bm!8630 m!95215))

(assert (=> d!23649 m!94789))

(assert (=> b!89044 m!95059))

(assert (=> b!89044 m!95059))

(assert (=> b!89044 m!95081))

(assert (=> b!89060 m!95059))

(assert (=> b!89060 m!95059))

(declare-fun m!95217 () Bool)

(assert (=> b!89060 m!95217))

(declare-fun m!95219 () Bool)

(assert (=> bm!8631 m!95219))

(declare-fun m!95221 () Bool)

(assert (=> b!89059 m!95221))

(assert (=> b!89045 m!95059))

(assert (=> b!89045 m!95059))

(assert (=> b!89045 m!95081))

(declare-fun m!95223 () Bool)

(assert (=> bm!8626 m!95223))

(declare-fun m!95225 () Bool)

(assert (=> b!89061 m!95225))

(declare-fun m!95227 () Bool)

(assert (=> b!89061 m!95227))

(assert (=> b!89061 m!95227))

(declare-fun m!95229 () Bool)

(assert (=> b!89061 m!95229))

(declare-fun m!95231 () Bool)

(assert (=> b!89061 m!95231))

(declare-fun m!95233 () Bool)

(assert (=> b!89061 m!95233))

(assert (=> b!89061 m!95231))

(declare-fun m!95235 () Bool)

(assert (=> b!89061 m!95235))

(declare-fun m!95237 () Bool)

(assert (=> b!89061 m!95237))

(declare-fun m!95239 () Bool)

(assert (=> b!89061 m!95239))

(declare-fun m!95241 () Bool)

(assert (=> b!89061 m!95241))

(declare-fun m!95243 () Bool)

(assert (=> b!89061 m!95243))

(assert (=> b!89061 m!95059))

(assert (=> b!89061 m!95241))

(declare-fun m!95245 () Bool)

(assert (=> b!89061 m!95245))

(declare-fun m!95247 () Bool)

(assert (=> b!89061 m!95247))

(declare-fun m!95249 () Bool)

(assert (=> b!89061 m!95249))

(assert (=> b!89061 m!95247))

(declare-fun m!95251 () Bool)

(assert (=> b!89061 m!95251))

(assert (=> b!89061 m!94805))

(declare-fun m!95253 () Bool)

(assert (=> b!89061 m!95253))

(assert (=> bm!8627 m!94805))

(declare-fun m!95255 () Bool)

(assert (=> b!89049 m!95255))

(declare-fun m!95257 () Bool)

(assert (=> b!89052 m!95257))

(assert (=> b!89053 m!95065))

(assert (=> b!89053 m!95059))

(declare-fun m!95259 () Bool)

(assert (=> b!89053 m!95259))

(assert (=> b!89053 m!95059))

(assert (=> b!89053 m!95065))

(assert (=> b!89053 m!94783))

(assert (=> b!89053 m!95067))

(assert (=> b!89053 m!94783))

(assert (=> b!88612 d!23649))

(declare-fun b!89072 () Bool)

(declare-fun e!57999 () Bool)

(declare-fun call!8637 () Bool)

(assert (=> b!89072 (= e!57999 call!8637)))

(declare-fun b!89073 () Bool)

(declare-fun e!58001 () Bool)

(assert (=> b!89073 (= e!58001 call!8637)))

(declare-fun b!89074 () Bool)

(assert (=> b!89074 (= e!58001 e!57999)))

(declare-fun lt!42737 () (_ BitVec 64))

(assert (=> b!89074 (= lt!42737 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!42738 () Unit!2638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4033 (_ BitVec 64) (_ BitVec 32)) Unit!2638)

(assert (=> b!89074 (= lt!42738 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000))))

(assert (=> b!89074 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000)))

(declare-fun lt!42739 () Unit!2638)

(assert (=> b!89074 (= lt!42739 lt!42738)))

(declare-fun res!45574 () Bool)

(assert (=> b!89074 (= res!45574 (= (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))) (Found!248 #b00000000000000000000000000000000)))))

(assert (=> b!89074 (=> (not res!45574) (not e!57999))))

(declare-fun d!23651 () Bool)

(declare-fun res!45575 () Bool)

(declare-fun e!58000 () Bool)

(assert (=> d!23651 (=> res!45575 e!58000)))

(assert (=> d!23651 (= res!45575 (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23651 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))) e!58000)))

(declare-fun bm!8634 () Bool)

(assert (=> bm!8634 (= call!8637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89075 () Bool)

(assert (=> b!89075 (= e!58000 e!58001)))

(declare-fun c!14765 () Bool)

(assert (=> b!89075 (= c!14765 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23651 (not res!45575)) b!89075))

(assert (= (and b!89075 c!14765) b!89074))

(assert (= (and b!89075 (not c!14765)) b!89073))

(assert (= (and b!89074 res!45574) b!89072))

(assert (= (or b!89072 b!89073) bm!8634))

(assert (=> b!89074 m!95189))

(declare-fun m!95261 () Bool)

(assert (=> b!89074 m!95261))

(declare-fun m!95263 () Bool)

(assert (=> b!89074 m!95263))

(assert (=> b!89074 m!95189))

(declare-fun m!95265 () Bool)

(assert (=> b!89074 m!95265))

(declare-fun m!95267 () Bool)

(assert (=> bm!8634 m!95267))

(assert (=> b!89075 m!95189))

(assert (=> b!89075 m!95189))

(assert (=> b!89075 m!95193))

(assert (=> b!88611 d!23651))

(declare-fun mapIsEmpty!3459 () Bool)

(declare-fun mapRes!3459 () Bool)

(assert (=> mapIsEmpty!3459 mapRes!3459))

(declare-fun b!89083 () Bool)

(declare-fun e!58007 () Bool)

(assert (=> b!89083 (= e!58007 tp_is_empty!2545)))

(declare-fun condMapEmpty!3459 () Bool)

(declare-fun mapDefault!3459 () ValueCell!929)

(assert (=> mapNonEmpty!3443 (= condMapEmpty!3459 (= mapRest!3443 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3459)))))

(assert (=> mapNonEmpty!3443 (= tp!9012 (and e!58007 mapRes!3459))))

(declare-fun b!89082 () Bool)

(declare-fun e!58006 () Bool)

(assert (=> b!89082 (= e!58006 tp_is_empty!2545)))

(declare-fun mapNonEmpty!3459 () Bool)

(declare-fun tp!9039 () Bool)

(assert (=> mapNonEmpty!3459 (= mapRes!3459 (and tp!9039 e!58006))))

(declare-fun mapKey!3459 () (_ BitVec 32))

(declare-fun mapRest!3459 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapValue!3459 () ValueCell!929)

(assert (=> mapNonEmpty!3459 (= mapRest!3443 (store mapRest!3459 mapKey!3459 mapValue!3459))))

(assert (= (and mapNonEmpty!3443 condMapEmpty!3459) mapIsEmpty!3459))

(assert (= (and mapNonEmpty!3443 (not condMapEmpty!3459)) mapNonEmpty!3459))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!929) mapValue!3459)) b!89082))

(assert (= (and mapNonEmpty!3443 ((_ is ValueCellFull!929) mapDefault!3459)) b!89083))

(declare-fun m!95269 () Bool)

(assert (=> mapNonEmpty!3459 m!95269))

(declare-fun mapIsEmpty!3460 () Bool)

(declare-fun mapRes!3460 () Bool)

(assert (=> mapIsEmpty!3460 mapRes!3460))

(declare-fun b!89085 () Bool)

(declare-fun e!58009 () Bool)

(assert (=> b!89085 (= e!58009 tp_is_empty!2545)))

(declare-fun condMapEmpty!3460 () Bool)

(declare-fun mapDefault!3460 () ValueCell!929)

(assert (=> mapNonEmpty!3444 (= condMapEmpty!3460 (= mapRest!3444 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3460)))))

(assert (=> mapNonEmpty!3444 (= tp!9009 (and e!58009 mapRes!3460))))

(declare-fun b!89084 () Bool)

(declare-fun e!58008 () Bool)

(assert (=> b!89084 (= e!58008 tp_is_empty!2545)))

(declare-fun mapNonEmpty!3460 () Bool)

(declare-fun tp!9040 () Bool)

(assert (=> mapNonEmpty!3460 (= mapRes!3460 (and tp!9040 e!58008))))

(declare-fun mapValue!3460 () ValueCell!929)

(declare-fun mapKey!3460 () (_ BitVec 32))

(declare-fun mapRest!3460 () (Array (_ BitVec 32) ValueCell!929))

(assert (=> mapNonEmpty!3460 (= mapRest!3444 (store mapRest!3460 mapKey!3460 mapValue!3460))))

(assert (= (and mapNonEmpty!3444 condMapEmpty!3460) mapIsEmpty!3460))

(assert (= (and mapNonEmpty!3444 (not condMapEmpty!3460)) mapNonEmpty!3460))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!929) mapValue!3460)) b!89084))

(assert (= (and mapNonEmpty!3444 ((_ is ValueCellFull!929) mapDefault!3460)) b!89085))

(declare-fun m!95271 () Bool)

(assert (=> mapNonEmpty!3460 m!95271))

(declare-fun b_lambda!3937 () Bool)

(assert (= b_lambda!3933 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3937)))

(declare-fun b_lambda!3939 () Bool)

(assert (= b_lambda!3935 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3939)))

(declare-fun b_lambda!3941 () Bool)

(assert (= b_lambda!3931 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3941)))

(check-sat (not b!88948) (not bm!8626) (not d!23637) (not d!23615) (not b!88975) (not b!89075) (not b!88940) (not b!88935) (not mapNonEmpty!3459) (not b!88945) (not bm!8590) (not d!23617) (not bm!8598) (not bm!8601) (not b!88888) (not b!89044) (not d!23605) (not b!88944) (not bm!8596) (not b!89074) (not bm!8581) (not d!23599) (not b_lambda!3929) (not bm!8627) (not b!88950) (not bm!8631) (not b!88951) (not b!88771) (not b!89000) (not bm!8606) (not b!88880) (not bm!8594) (not b!89061) (not bm!8609) (not d!23609) (not b!88962) (not b!88886) (not b!88999) (not b!89059) (not b!88933) (not b!88977) (not bm!8610) (not d!23613) (not b!88943) (not b_next!2257) (not b!88983) (not b!88952) (not b!88928) (not b!89049) (not d!23601) (not bm!8600) (not b_lambda!3939) (not d!23631) (not b!89052) (not bm!8599) (not d!23641) (not b!88946) (not b!89060) (not b!88992) (not d!23647) (not b!88932) (not b!88864) (not b!88862) (not b!88924) (not bm!8634) (not bm!8630) (not b!88930) (not b!88993) (not b!88947) (not b!88953) (not b!88994) (not d!23603) (not d!23649) (not bm!8586) (not b!88942) (not b!88934) (not b_lambda!3937) b_and!5353 (not b!88960) (not b!88949) (not b!88926) (not b!89045) (not b!88961) (not d!23629) (not bm!8587) (not d!23611) (not b_lambda!3941) (not b!88858) (not b!89053) (not mapNonEmpty!3460) (not b_next!2259) (not d!23635) (not bm!8597) tp_is_empty!2545 (not d!23623) b_and!5355 (not b!88773) (not b!88941) (not d!23619) (not b!88988) (not d!23607) (not b!88976) (not b!88894) (not bm!8593))
(check-sat b_and!5353 b_and!5355 (not b_next!2257) (not b_next!2259))
(get-model)

(declare-fun d!23653 () Bool)

(assert (=> d!23653 (isDefined!94 (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun lt!42742 () Unit!2638)

(declare-fun choose!535 (List!1536 (_ BitVec 64)) Unit!2638)

(assert (=> d!23653 (= lt!42742 (choose!535 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun e!58012 () Bool)

(assert (=> d!23653 e!58012))

(declare-fun res!45578 () Bool)

(assert (=> d!23653 (=> (not res!45578) (not e!58012))))

(declare-fun isStrictlySorted!295 (List!1536) Bool)

(assert (=> d!23653 (= res!45578 (isStrictlySorted!295 (toList!745 lt!42393)))))

(assert (=> d!23653 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) lt!42742)))

(declare-fun b!89088 () Bool)

(assert (=> b!89088 (= e!58012 (containsKey!144 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (= (and d!23653 res!45578) b!89088))

(assert (=> d!23653 m!94779))

(assert (=> d!23653 m!94987))

(assert (=> d!23653 m!94987))

(assert (=> d!23653 m!94989))

(assert (=> d!23653 m!94779))

(declare-fun m!95273 () Bool)

(assert (=> d!23653 m!95273))

(declare-fun m!95275 () Bool)

(assert (=> d!23653 m!95275))

(assert (=> b!89088 m!94779))

(assert (=> b!89088 m!94983))

(assert (=> b!88771 d!23653))

(declare-fun d!23655 () Bool)

(declare-fun isEmpty!346 (Option!146) Bool)

(assert (=> d!23655 (= (isDefined!94 (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))) (not (isEmpty!346 (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))))

(declare-fun bs!3741 () Bool)

(assert (= bs!3741 d!23655))

(assert (=> bs!3741 m!94987))

(declare-fun m!95277 () Bool)

(assert (=> bs!3741 m!95277))

(assert (=> b!88771 d!23655))

(declare-fun e!58018 () Option!146)

(declare-fun b!89099 () Bool)

(assert (=> b!89099 (= e!58018 (getValueByKey!140 (t!5285 (toList!745 lt!42393)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!89097 () Bool)

(declare-fun e!58017 () Option!146)

(assert (=> b!89097 (= e!58017 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42393)))))))

(declare-fun d!23657 () Bool)

(declare-fun c!14770 () Bool)

(assert (=> d!23657 (= c!14770 (and ((_ is Cons!1532) (toList!745 lt!42393)) (= (_1!1121 (h!2124 (toList!745 lt!42393))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (=> d!23657 (= (getValueByKey!140 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) e!58017)))

(declare-fun b!89098 () Bool)

(assert (=> b!89098 (= e!58017 e!58018)))

(declare-fun c!14771 () Bool)

(assert (=> b!89098 (= c!14771 (and ((_ is Cons!1532) (toList!745 lt!42393)) (not (= (_1!1121 (h!2124 (toList!745 lt!42393))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))))

(declare-fun b!89100 () Bool)

(assert (=> b!89100 (= e!58018 None!144)))

(assert (= (and d!23657 c!14770) b!89097))

(assert (= (and d!23657 (not c!14770)) b!89098))

(assert (= (and b!89098 c!14771) b!89099))

(assert (= (and b!89098 (not c!14771)) b!89100))

(assert (=> b!89099 m!94779))

(declare-fun m!95279 () Bool)

(assert (=> b!89099 m!95279))

(assert (=> b!88771 d!23657))

(declare-fun d!23659 () Bool)

(assert (=> d!23659 (= (inRange!0 (ite c!14722 (ite c!14717 (index!3132 lt!42586) (ite c!14715 (index!3131 lt!42591) (index!3134 lt!42591))) (ite c!14713 (index!3132 lt!42571) (ite c!14721 (index!3131 lt!42578) (index!3134 lt!42578)))) (mask!6414 newMap!16)) (and (bvsge (ite c!14722 (ite c!14717 (index!3132 lt!42586) (ite c!14715 (index!3131 lt!42591) (index!3134 lt!42591))) (ite c!14713 (index!3132 lt!42571) (ite c!14721 (index!3131 lt!42578) (index!3134 lt!42578)))) #b00000000000000000000000000000000) (bvslt (ite c!14722 (ite c!14717 (index!3132 lt!42586) (ite c!14715 (index!3131 lt!42591) (index!3134 lt!42591))) (ite c!14713 (index!3132 lt!42571) (ite c!14721 (index!3131 lt!42578) (index!3134 lt!42578)))) (bvadd (mask!6414 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!8593 d!23659))

(assert (=> bm!8601 d!23647))

(assert (=> b!88773 d!23655))

(assert (=> b!88773 d!23657))

(declare-fun d!23661 () Bool)

(declare-fun lt!42745 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!93 (List!1536) (InoxSet tuple2!2220))

(assert (=> d!23661 (= lt!42745 (select (content!93 (toList!745 lt!42628)) lt!42377))))

(declare-fun e!58023 () Bool)

(assert (=> d!23661 (= lt!42745 e!58023)))

(declare-fun res!45583 () Bool)

(assert (=> d!23661 (=> (not res!45583) (not e!58023))))

(assert (=> d!23661 (= res!45583 ((_ is Cons!1532) (toList!745 lt!42628)))))

(assert (=> d!23661 (= (contains!760 (toList!745 lt!42628) lt!42377) lt!42745)))

(declare-fun b!89105 () Bool)

(declare-fun e!58024 () Bool)

(assert (=> b!89105 (= e!58023 e!58024)))

(declare-fun res!45584 () Bool)

(assert (=> b!89105 (=> res!45584 e!58024)))

(assert (=> b!89105 (= res!45584 (= (h!2124 (toList!745 lt!42628)) lt!42377))))

(declare-fun b!89106 () Bool)

(assert (=> b!89106 (= e!58024 (contains!760 (t!5285 (toList!745 lt!42628)) lt!42377))))

(assert (= (and d!23661 res!45583) b!89105))

(assert (= (and b!89105 (not res!45584)) b!89106))

(declare-fun m!95281 () Bool)

(assert (=> d!23661 m!95281))

(declare-fun m!95283 () Bool)

(assert (=> d!23661 m!95283))

(declare-fun m!95285 () Bool)

(assert (=> b!89106 m!95285))

(assert (=> b!88941 d!23661))

(declare-fun d!23663 () Bool)

(declare-fun e!58026 () Bool)

(assert (=> d!23663 e!58026))

(declare-fun res!45585 () Bool)

(assert (=> d!23663 (=> res!45585 e!58026)))

(declare-fun lt!42747 () Bool)

(assert (=> d!23663 (= res!45585 (not lt!42747))))

(declare-fun lt!42746 () Bool)

(assert (=> d!23663 (= lt!42747 lt!42746)))

(declare-fun lt!42749 () Unit!2638)

(declare-fun e!58025 () Unit!2638)

(assert (=> d!23663 (= lt!42749 e!58025)))

(declare-fun c!14772 () Bool)

(assert (=> d!23663 (= c!14772 lt!42746)))

(assert (=> d!23663 (= lt!42746 (containsKey!144 (toList!745 lt!42718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23663 (= (contains!759 lt!42718 #b1000000000000000000000000000000000000000000000000000000000000000) lt!42747)))

(declare-fun b!89107 () Bool)

(declare-fun lt!42748 () Unit!2638)

(assert (=> b!89107 (= e!58025 lt!42748)))

(assert (=> b!89107 (= lt!42748 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89107 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89108 () Bool)

(declare-fun Unit!2648 () Unit!2638)

(assert (=> b!89108 (= e!58025 Unit!2648)))

(declare-fun b!89109 () Bool)

(assert (=> b!89109 (= e!58026 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23663 c!14772) b!89107))

(assert (= (and d!23663 (not c!14772)) b!89108))

(assert (= (and d!23663 (not res!45585)) b!89109))

(declare-fun m!95287 () Bool)

(assert (=> d!23663 m!95287))

(declare-fun m!95289 () Bool)

(assert (=> b!89107 m!95289))

(declare-fun m!95291 () Bool)

(assert (=> b!89107 m!95291))

(assert (=> b!89107 m!95291))

(declare-fun m!95293 () Bool)

(assert (=> b!89107 m!95293))

(assert (=> b!89109 m!95291))

(assert (=> b!89109 m!95291))

(assert (=> b!89109 m!95293))

(assert (=> bm!8630 d!23663))

(assert (=> d!23635 d!23639))

(declare-fun d!23665 () Bool)

(assert (=> d!23665 (not (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!23665 true))

(declare-fun _$68!79 () Unit!2638)

(assert (=> d!23665 (= (choose!68 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532)) _$68!79)))

(declare-fun bs!3742 () Bool)

(assert (= bs!3742 d!23665))

(assert (=> bs!3742 m!94779))

(assert (=> bs!3742 m!94819))

(assert (=> d!23635 d!23665))

(declare-fun d!23667 () Bool)

(declare-fun lt!42750 () Bool)

(assert (=> d!23667 (= lt!42750 (select (content!93 (toList!745 lt!42632)) lt!42391))))

(declare-fun e!58027 () Bool)

(assert (=> d!23667 (= lt!42750 e!58027)))

(declare-fun res!45586 () Bool)

(assert (=> d!23667 (=> (not res!45586) (not e!58027))))

(assert (=> d!23667 (= res!45586 ((_ is Cons!1532) (toList!745 lt!42632)))))

(assert (=> d!23667 (= (contains!760 (toList!745 lt!42632) lt!42391) lt!42750)))

(declare-fun b!89110 () Bool)

(declare-fun e!58028 () Bool)

(assert (=> b!89110 (= e!58027 e!58028)))

(declare-fun res!45587 () Bool)

(assert (=> b!89110 (=> res!45587 e!58028)))

(assert (=> b!89110 (= res!45587 (= (h!2124 (toList!745 lt!42632)) lt!42391))))

(declare-fun b!89111 () Bool)

(assert (=> b!89111 (= e!58028 (contains!760 (t!5285 (toList!745 lt!42632)) lt!42391))))

(assert (= (and d!23667 res!45586) b!89110))

(assert (= (and b!89110 (not res!45587)) b!89111))

(declare-fun m!95295 () Bool)

(assert (=> d!23667 m!95295))

(declare-fun m!95297 () Bool)

(assert (=> d!23667 m!95297))

(declare-fun m!95299 () Bool)

(assert (=> b!89111 m!95299))

(assert (=> b!88943 d!23667))

(declare-fun d!23669 () Bool)

(declare-fun lt!42751 () Bool)

(assert (=> d!23669 (= lt!42751 (select (content!93 (toList!745 lt!42636)) lt!42391))))

(declare-fun e!58029 () Bool)

(assert (=> d!23669 (= lt!42751 e!58029)))

(declare-fun res!45588 () Bool)

(assert (=> d!23669 (=> (not res!45588) (not e!58029))))

(assert (=> d!23669 (= res!45588 ((_ is Cons!1532) (toList!745 lt!42636)))))

(assert (=> d!23669 (= (contains!760 (toList!745 lt!42636) lt!42391) lt!42751)))

(declare-fun b!89112 () Bool)

(declare-fun e!58030 () Bool)

(assert (=> b!89112 (= e!58029 e!58030)))

(declare-fun res!45589 () Bool)

(assert (=> b!89112 (=> res!45589 e!58030)))

(assert (=> b!89112 (= res!45589 (= (h!2124 (toList!745 lt!42636)) lt!42391))))

(declare-fun b!89113 () Bool)

(assert (=> b!89113 (= e!58030 (contains!760 (t!5285 (toList!745 lt!42636)) lt!42391))))

(assert (= (and d!23669 res!45588) b!89112))

(assert (= (and b!89112 (not res!45589)) b!89113))

(declare-fun m!95301 () Bool)

(assert (=> d!23669 m!95301))

(declare-fun m!95303 () Bool)

(assert (=> d!23669 m!95303))

(declare-fun m!95305 () Bool)

(assert (=> b!89113 m!95305))

(assert (=> b!88945 d!23669))

(assert (=> bm!8627 d!23605))

(declare-fun d!23671 () Bool)

(assert (=> d!23671 (= (get!1215 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2666 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!88999 d!23671))

(declare-fun d!23673 () Bool)

(declare-fun e!58031 () Bool)

(assert (=> d!23673 e!58031))

(declare-fun res!45590 () Bool)

(assert (=> d!23673 (=> (not res!45590) (not e!58031))))

(declare-fun lt!42753 () ListLongMap!1459)

(assert (=> d!23673 (= res!45590 (contains!759 lt!42753 (_1!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun lt!42755 () List!1536)

(assert (=> d!23673 (= lt!42753 (ListLongMap!1460 lt!42755))))

(declare-fun lt!42754 () Unit!2638)

(declare-fun lt!42752 () Unit!2638)

(assert (=> d!23673 (= lt!42754 lt!42752)))

(assert (=> d!23673 (= (getValueByKey!140 lt!42755 (_1!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))) (Some!145 (_2!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(assert (=> d!23673 (= lt!42752 (lemmaContainsTupThenGetReturnValue!60 lt!42755 (_1!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (_2!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(assert (=> d!23673 (= lt!42755 (insertStrictlySorted!63 (toList!745 (ite c!14759 call!8629 (ite c!14757 call!8630 call!8634))) (_1!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (_2!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(assert (=> d!23673 (= (+!111 (ite c!14759 call!8629 (ite c!14757 call!8630 call!8634)) (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42753)))

(declare-fun b!89114 () Bool)

(declare-fun res!45591 () Bool)

(assert (=> b!89114 (=> (not res!45591) (not e!58031))))

(assert (=> b!89114 (= res!45591 (= (getValueByKey!140 (toList!745 lt!42753) (_1!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))) (Some!145 (_2!1121 (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))))

(declare-fun b!89115 () Bool)

(assert (=> b!89115 (= e!58031 (contains!760 (toList!745 lt!42753) (ite (or c!14759 c!14757) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (= (and d!23673 res!45590) b!89114))

(assert (= (and b!89114 res!45591) b!89115))

(declare-fun m!95307 () Bool)

(assert (=> d!23673 m!95307))

(declare-fun m!95309 () Bool)

(assert (=> d!23673 m!95309))

(declare-fun m!95311 () Bool)

(assert (=> d!23673 m!95311))

(declare-fun m!95313 () Bool)

(assert (=> d!23673 m!95313))

(declare-fun m!95315 () Bool)

(assert (=> b!89114 m!95315))

(declare-fun m!95317 () Bool)

(assert (=> b!89115 m!95317))

(assert (=> bm!8631 d!23673))

(declare-fun d!23675 () Bool)

(assert (=> d!23675 (= (map!1193 (_2!1122 lt!42584)) (getCurrentListMap!429 (_keys!4048 (_2!1122 lt!42584)) (_values!2354 (_2!1122 lt!42584)) (mask!6414 (_2!1122 lt!42584)) (extraKeys!2204 (_2!1122 lt!42584)) (zeroValue!2260 (_2!1122 lt!42584)) (minValue!2260 (_2!1122 lt!42584)) #b00000000000000000000000000000000 (defaultEntry!2371 (_2!1122 lt!42584))))))

(declare-fun bs!3743 () Bool)

(assert (= bs!3743 d!23675))

(declare-fun m!95319 () Bool)

(assert (=> bs!3743 m!95319))

(assert (=> bm!8600 d!23675))

(declare-fun d!23677 () Bool)

(assert (=> d!23677 (= (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88976 d!23677))

(declare-fun d!23679 () Bool)

(assert (=> d!23679 (= (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88933 d!23679))

(declare-fun bm!8635 () Bool)

(declare-fun call!8640 () ListLongMap!1459)

(declare-fun call!8639 () ListLongMap!1459)

(assert (=> bm!8635 (= call!8640 call!8639)))

(declare-fun bm!8636 () Bool)

(declare-fun call!8642 () Bool)

(declare-fun lt!42765 () ListLongMap!1459)

(assert (=> bm!8636 (= call!8642 (contains!759 lt!42765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89116 () Bool)

(declare-fun e!58040 () Bool)

(declare-fun e!58036 () Bool)

(assert (=> b!89116 (= e!58040 e!58036)))

(declare-fun res!45598 () Bool)

(declare-fun call!8643 () Bool)

(assert (=> b!89116 (= res!45598 call!8643)))

(assert (=> b!89116 (=> (not res!45598) (not e!58036))))

(declare-fun b!89117 () Bool)

(declare-fun e!58043 () Bool)

(assert (=> b!89117 (= e!58043 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89118 () Bool)

(declare-fun e!58034 () Bool)

(assert (=> b!89118 (= e!58034 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8637 () Bool)

(assert (=> bm!8637 (= call!8639 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89119 () Bool)

(declare-fun e!58035 () Bool)

(assert (=> b!89119 (= e!58035 e!58040)))

(declare-fun c!14774 () Bool)

(assert (=> b!89119 (= c!14774 (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89120 () Bool)

(declare-fun e!58037 () ListLongMap!1459)

(declare-fun call!8641 () ListLongMap!1459)

(assert (=> b!89120 (= e!58037 call!8641)))

(declare-fun bm!8638 () Bool)

(declare-fun call!8638 () ListLongMap!1459)

(assert (=> bm!8638 (= call!8641 call!8638)))

(declare-fun bm!8639 () Bool)

(declare-fun call!8644 () ListLongMap!1459)

(assert (=> bm!8639 (= call!8644 call!8640)))

(declare-fun b!89121 () Bool)

(declare-fun res!45599 () Bool)

(assert (=> b!89121 (=> (not res!45599) (not e!58035))))

(declare-fun e!58044 () Bool)

(assert (=> b!89121 (= res!45599 e!58044)))

(declare-fun res!45595 () Bool)

(assert (=> b!89121 (=> res!45595 e!58044)))

(assert (=> b!89121 (= res!45595 (not e!58034))))

(declare-fun res!45593 () Bool)

(assert (=> b!89121 (=> (not res!45593) (not e!58034))))

(assert (=> b!89121 (= res!45593 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun bm!8640 () Bool)

(assert (=> bm!8640 (= call!8643 (contains!759 lt!42765 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23681 () Bool)

(assert (=> d!23681 e!58035))

(declare-fun res!45592 () Bool)

(assert (=> d!23681 (=> (not res!45592) (not e!58035))))

(assert (=> d!23681 (= res!45592 (or (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))))

(declare-fun lt!42766 () ListLongMap!1459)

(assert (=> d!23681 (= lt!42765 lt!42766)))

(declare-fun lt!42767 () Unit!2638)

(declare-fun e!58032 () Unit!2638)

(assert (=> d!23681 (= lt!42767 e!58032)))

(declare-fun c!14778 () Bool)

(assert (=> d!23681 (= c!14778 e!58043)))

(declare-fun res!45594 () Bool)

(assert (=> d!23681 (=> (not res!45594) (not e!58043))))

(assert (=> d!23681 (= res!45594 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun e!58039 () ListLongMap!1459)

(assert (=> d!23681 (= lt!42766 e!58039)))

(declare-fun c!14775 () Bool)

(assert (=> d!23681 (= c!14775 (and (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23681 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23681 (= (getCurrentListMap!429 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!42765)))

(declare-fun e!58041 () Bool)

(declare-fun b!89122 () Bool)

(assert (=> b!89122 (= e!58041 (= (apply!84 lt!42765 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16))))))

(declare-fun b!89123 () Bool)

(declare-fun Unit!2649 () Unit!2638)

(assert (=> b!89123 (= e!58032 Unit!2649)))

(declare-fun b!89124 () Bool)

(declare-fun e!58042 () Bool)

(assert (=> b!89124 (= e!58042 e!58041)))

(declare-fun res!45600 () Bool)

(assert (=> b!89124 (= res!45600 call!8642)))

(assert (=> b!89124 (=> (not res!45600) (not e!58041))))

(declare-fun b!89125 () Bool)

(assert (=> b!89125 (= e!58039 (+!111 call!8638 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)))))))

(declare-fun b!89126 () Bool)

(declare-fun e!58038 () Bool)

(assert (=> b!89126 (= e!58038 (= (apply!84 lt!42765 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)) (get!1214 (select (arr!1919 (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2166 (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))))))))

(assert (=> b!89126 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89127 () Bool)

(assert (=> b!89127 (= e!58042 (not call!8642))))

(declare-fun b!89128 () Bool)

(declare-fun res!45597 () Bool)

(assert (=> b!89128 (=> (not res!45597) (not e!58035))))

(assert (=> b!89128 (= res!45597 e!58042)))

(declare-fun c!14777 () Bool)

(assert (=> b!89128 (= c!14777 (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun c!14776 () Bool)

(declare-fun b!89129 () Bool)

(assert (=> b!89129 (= c!14776 (and (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!58033 () ListLongMap!1459)

(assert (=> b!89129 (= e!58037 e!58033)))

(declare-fun b!89130 () Bool)

(assert (=> b!89130 (= e!58040 (not call!8643))))

(declare-fun b!89131 () Bool)

(assert (=> b!89131 (= e!58039 e!58037)))

(declare-fun c!14773 () Bool)

(assert (=> b!89131 (= c!14773 (and (not (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89132 () Bool)

(assert (=> b!89132 (= e!58036 (= (apply!84 lt!42765 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16))))))

(declare-fun b!89133 () Bool)

(assert (=> b!89133 (= e!58044 e!58038)))

(declare-fun res!45596 () Bool)

(assert (=> b!89133 (=> (not res!45596) (not e!58038))))

(assert (=> b!89133 (= res!45596 (contains!759 lt!42765 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89134 () Bool)

(declare-fun lt!42777 () Unit!2638)

(assert (=> b!89134 (= e!58032 lt!42777)))

(declare-fun lt!42769 () ListLongMap!1459)

(assert (=> b!89134 (= lt!42769 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42759 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42772 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42772 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42768 () Unit!2638)

(assert (=> b!89134 (= lt!42768 (addStillContains!60 lt!42769 lt!42759 (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) lt!42772))))

(assert (=> b!89134 (contains!759 (+!111 lt!42769 (tuple2!2221 lt!42759 (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)))) lt!42772)))

(declare-fun lt!42762 () Unit!2638)

(assert (=> b!89134 (= lt!42762 lt!42768)))

(declare-fun lt!42757 () ListLongMap!1459)

(assert (=> b!89134 (= lt!42757 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42770 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42775 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42775 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42774 () Unit!2638)

(assert (=> b!89134 (= lt!42774 (addApplyDifferent!60 lt!42757 lt!42770 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) lt!42775))))

(assert (=> b!89134 (= (apply!84 (+!111 lt!42757 (tuple2!2221 lt!42770 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)))) lt!42775) (apply!84 lt!42757 lt!42775))))

(declare-fun lt!42758 () Unit!2638)

(assert (=> b!89134 (= lt!42758 lt!42774)))

(declare-fun lt!42761 () ListLongMap!1459)

(assert (=> b!89134 (= lt!42761 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42776 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42776 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42760 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42760 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42764 () Unit!2638)

(assert (=> b!89134 (= lt!42764 (addApplyDifferent!60 lt!42761 lt!42776 (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) lt!42760))))

(assert (=> b!89134 (= (apply!84 (+!111 lt!42761 (tuple2!2221 lt!42776 (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)))) lt!42760) (apply!84 lt!42761 lt!42760))))

(declare-fun lt!42756 () Unit!2638)

(assert (=> b!89134 (= lt!42756 lt!42764)))

(declare-fun lt!42771 () ListLongMap!1459)

(assert (=> b!89134 (= lt!42771 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite (or c!14716 c!14722) (_values!2354 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16)))) (mask!6414 newMap!16) (ite c!14716 (ite c!14719 lt!42588 lt!42593) (extraKeys!2204 newMap!16)) (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16)) (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42763 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42763 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42773 () (_ BitVec 64))

(assert (=> b!89134 (= lt!42773 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89134 (= lt!42777 (addApplyDifferent!60 lt!42771 lt!42763 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)) lt!42773))))

(assert (=> b!89134 (= (apply!84 (+!111 lt!42771 (tuple2!2221 lt!42763 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16)))) lt!42773) (apply!84 lt!42771 lt!42773))))

(declare-fun b!89135 () Bool)

(assert (=> b!89135 (= e!58033 call!8644)))

(declare-fun bm!8641 () Bool)

(assert (=> bm!8641 (= call!8638 (+!111 (ite c!14775 call!8639 (ite c!14773 call!8640 call!8644)) (ite (or c!14775 c!14773) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!14716 c!14719) lt!42380 (zeroValue!2260 newMap!16))) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!14716 (ite c!14719 (minValue!2260 newMap!16) lt!42380) (minValue!2260 newMap!16))))))))

(declare-fun b!89136 () Bool)

(assert (=> b!89136 (= e!58033 call!8641)))

(assert (= (and d!23681 c!14775) b!89125))

(assert (= (and d!23681 (not c!14775)) b!89131))

(assert (= (and b!89131 c!14773) b!89120))

(assert (= (and b!89131 (not c!14773)) b!89129))

(assert (= (and b!89129 c!14776) b!89136))

(assert (= (and b!89129 (not c!14776)) b!89135))

(assert (= (or b!89136 b!89135) bm!8639))

(assert (= (or b!89120 bm!8639) bm!8635))

(assert (= (or b!89120 b!89136) bm!8638))

(assert (= (or b!89125 bm!8635) bm!8637))

(assert (= (or b!89125 bm!8638) bm!8641))

(assert (= (and d!23681 res!45594) b!89117))

(assert (= (and d!23681 c!14778) b!89134))

(assert (= (and d!23681 (not c!14778)) b!89123))

(assert (= (and d!23681 res!45592) b!89121))

(assert (= (and b!89121 res!45593) b!89118))

(assert (= (and b!89121 (not res!45595)) b!89133))

(assert (= (and b!89133 res!45596) b!89126))

(assert (= (and b!89121 res!45599) b!89128))

(assert (= (and b!89128 c!14777) b!89124))

(assert (= (and b!89128 (not c!14777)) b!89127))

(assert (= (and b!89124 res!45600) b!89122))

(assert (= (or b!89124 b!89127) bm!8636))

(assert (= (and b!89128 res!45597) b!89119))

(assert (= (and b!89119 c!14774) b!89116))

(assert (= (and b!89119 (not c!14774)) b!89130))

(assert (= (and b!89116 res!45598) b!89132))

(assert (= (or b!89116 b!89130) bm!8640))

(declare-fun b_lambda!3943 () Bool)

(assert (=> (not b_lambda!3943) (not b!89126)))

(declare-fun tb!1729 () Bool)

(declare-fun t!5296 () Bool)

(assert (=> (and b!88622 (= (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) (defaultEntry!2371 newMap!16)) t!5296) tb!1729))

(declare-fun result!2975 () Bool)

(assert (=> tb!1729 (= result!2975 tp_is_empty!2545)))

(assert (=> b!89126 t!5296))

(declare-fun b_and!5357 () Bool)

(assert (= b_and!5353 (and (=> t!5296 result!2975) b_and!5357)))

(declare-fun t!5298 () Bool)

(declare-fun tb!1731 () Bool)

(assert (=> (and b!88625 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 newMap!16)) t!5298) tb!1731))

(declare-fun result!2977 () Bool)

(assert (= result!2977 result!2975))

(assert (=> b!89126 t!5298))

(declare-fun b_and!5359 () Bool)

(assert (= b_and!5355 (and (=> t!5298 result!2977) b_and!5359)))

(declare-fun m!95321 () Bool)

(assert (=> bm!8640 m!95321))

(declare-fun m!95323 () Bool)

(assert (=> d!23681 m!95323))

(declare-fun m!95325 () Bool)

(assert (=> b!89117 m!95325))

(assert (=> b!89117 m!95325))

(declare-fun m!95327 () Bool)

(assert (=> b!89117 m!95327))

(assert (=> b!89133 m!95325))

(assert (=> b!89133 m!95325))

(declare-fun m!95329 () Bool)

(assert (=> b!89133 m!95329))

(declare-fun m!95331 () Bool)

(assert (=> bm!8641 m!95331))

(declare-fun m!95333 () Bool)

(assert (=> b!89132 m!95333))

(assert (=> b!89118 m!95325))

(assert (=> b!89118 m!95325))

(assert (=> b!89118 m!95327))

(declare-fun m!95335 () Bool)

(assert (=> bm!8636 m!95335))

(declare-fun m!95337 () Bool)

(assert (=> b!89134 m!95337))

(declare-fun m!95339 () Bool)

(assert (=> b!89134 m!95339))

(assert (=> b!89134 m!95339))

(declare-fun m!95341 () Bool)

(assert (=> b!89134 m!95341))

(declare-fun m!95343 () Bool)

(assert (=> b!89134 m!95343))

(declare-fun m!95345 () Bool)

(assert (=> b!89134 m!95345))

(assert (=> b!89134 m!95343))

(declare-fun m!95347 () Bool)

(assert (=> b!89134 m!95347))

(declare-fun m!95349 () Bool)

(assert (=> b!89134 m!95349))

(declare-fun m!95351 () Bool)

(assert (=> b!89134 m!95351))

(declare-fun m!95353 () Bool)

(assert (=> b!89134 m!95353))

(declare-fun m!95355 () Bool)

(assert (=> b!89134 m!95355))

(assert (=> b!89134 m!95325))

(assert (=> b!89134 m!95353))

(declare-fun m!95357 () Bool)

(assert (=> b!89134 m!95357))

(declare-fun m!95359 () Bool)

(assert (=> b!89134 m!95359))

(declare-fun m!95361 () Bool)

(assert (=> b!89134 m!95361))

(assert (=> b!89134 m!95359))

(declare-fun m!95363 () Bool)

(assert (=> b!89134 m!95363))

(declare-fun m!95365 () Bool)

(assert (=> b!89134 m!95365))

(declare-fun m!95367 () Bool)

(assert (=> b!89134 m!95367))

(assert (=> bm!8637 m!95365))

(declare-fun m!95369 () Bool)

(assert (=> b!89122 m!95369))

(declare-fun m!95371 () Bool)

(assert (=> b!89125 m!95371))

(declare-fun m!95373 () Bool)

(assert (=> b!89126 m!95373))

(assert (=> b!89126 m!95325))

(declare-fun m!95375 () Bool)

(assert (=> b!89126 m!95375))

(assert (=> b!89126 m!95325))

(assert (=> b!89126 m!95373))

(declare-fun m!95377 () Bool)

(assert (=> b!89126 m!95377))

(declare-fun m!95379 () Bool)

(assert (=> b!89126 m!95379))

(assert (=> b!89126 m!95377))

(assert (=> bm!8586 d!23681))

(declare-fun b!89137 () Bool)

(declare-fun lt!42779 () Unit!2638)

(declare-fun lt!42784 () Unit!2638)

(assert (=> b!89137 (= lt!42779 lt!42784)))

(declare-fun lt!42781 () (_ BitVec 64))

(declare-fun lt!42778 () (_ BitVec 64))

(declare-fun lt!42780 () ListLongMap!1459)

(declare-fun lt!42783 () V!3041)

(assert (=> b!89137 (not (contains!759 (+!111 lt!42780 (tuple2!2221 lt!42781 lt!42783)) lt!42778))))

(assert (=> b!89137 (= lt!42784 (addStillNotContains!34 lt!42780 lt!42781 lt!42783 lt!42778))))

(assert (=> b!89137 (= lt!42778 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!89137 (= lt!42783 (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!89137 (= lt!42781 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!8645 () ListLongMap!1459)

(assert (=> b!89137 (= lt!42780 call!8645)))

(declare-fun e!58046 () ListLongMap!1459)

(assert (=> b!89137 (= e!58046 (+!111 call!8645 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!89138 () Bool)

(declare-fun e!58049 () ListLongMap!1459)

(assert (=> b!89138 (= e!58049 (ListLongMap!1460 Nil!1533))))

(declare-fun b!89139 () Bool)

(declare-fun e!58047 () Bool)

(declare-fun lt!42782 () ListLongMap!1459)

(assert (=> b!89139 (= e!58047 (isEmpty!345 lt!42782))))

(declare-fun b!89140 () Bool)

(declare-fun e!58050 () Bool)

(declare-fun e!58045 () Bool)

(assert (=> b!89140 (= e!58050 e!58045)))

(declare-fun c!14782 () Bool)

(declare-fun e!58048 () Bool)

(assert (=> b!89140 (= c!14782 e!58048)))

(declare-fun res!45603 () Bool)

(assert (=> b!89140 (=> (not res!45603) (not e!58048))))

(assert (=> b!89140 (= res!45603 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun d!23683 () Bool)

(assert (=> d!23683 e!58050))

(declare-fun res!45601 () Bool)

(assert (=> d!23683 (=> (not res!45601) (not e!58050))))

(assert (=> d!23683 (= res!45601 (not (contains!759 lt!42782 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!23683 (= lt!42782 e!58049)))

(declare-fun c!14779 () Bool)

(assert (=> d!23683 (= c!14779 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23683 (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23683 (= (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) lt!42782)))

(declare-fun b!89141 () Bool)

(declare-fun e!58051 () Bool)

(assert (=> b!89141 (= e!58045 e!58051)))

(assert (=> b!89141 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun res!45604 () Bool)

(assert (=> b!89141 (= res!45604 (contains!759 lt!42782 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89141 (=> (not res!45604) (not e!58051))))

(declare-fun b!89142 () Bool)

(assert (=> b!89142 (= e!58046 call!8645)))

(declare-fun b!89143 () Bool)

(assert (=> b!89143 (= e!58047 (= lt!42782 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89144 () Bool)

(assert (=> b!89144 (= e!58045 e!58047)))

(declare-fun c!14781 () Bool)

(assert (=> b!89144 (= c!14781 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89145 () Bool)

(assert (=> b!89145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> b!89145 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2166 (_values!2354 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> b!89145 (= e!58051 (= (apply!84 lt!42782 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!89146 () Bool)

(assert (=> b!89146 (= e!58048 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!89146 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!89147 () Bool)

(assert (=> b!89147 (= e!58049 e!58046)))

(declare-fun c!14780 () Bool)

(assert (=> b!89147 (= c!14780 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun bm!8642 () Bool)

(assert (=> bm!8642 (= call!8645 (getCurrentListMapNoExtraKeys!75 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89148 () Bool)

(declare-fun res!45602 () Bool)

(assert (=> b!89148 (=> (not res!45602) (not e!58050))))

(assert (=> b!89148 (= res!45602 (not (contains!759 lt!42782 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23683 c!14779) b!89138))

(assert (= (and d!23683 (not c!14779)) b!89147))

(assert (= (and b!89147 c!14780) b!89137))

(assert (= (and b!89147 (not c!14780)) b!89142))

(assert (= (or b!89137 b!89142) bm!8642))

(assert (= (and d!23683 res!45601) b!89148))

(assert (= (and b!89148 res!45602) b!89140))

(assert (= (and b!89140 res!45603) b!89146))

(assert (= (and b!89140 c!14782) b!89141))

(assert (= (and b!89140 (not c!14782)) b!89144))

(assert (= (and b!89141 res!45604) b!89145))

(assert (= (and b!89144 c!14781) b!89143))

(assert (= (and b!89144 (not c!14781)) b!89139))

(declare-fun b_lambda!3945 () Bool)

(assert (=> (not b_lambda!3945) (not b!89137)))

(assert (=> b!89137 t!5281))

(declare-fun b_and!5361 () Bool)

(assert (= b_and!5357 (and (=> t!5281 result!2955) b_and!5361)))

(assert (=> b!89137 t!5283))

(declare-fun b_and!5363 () Bool)

(assert (= b_and!5359 (and (=> t!5283 result!2959) b_and!5363)))

(declare-fun b_lambda!3947 () Bool)

(assert (=> (not b_lambda!3947) (not b!89145)))

(assert (=> b!89145 t!5281))

(declare-fun b_and!5365 () Bool)

(assert (= b_and!5361 (and (=> t!5281 result!2955) b_and!5365)))

(assert (=> b!89145 t!5283))

(declare-fun b_and!5367 () Bool)

(assert (= b_and!5363 (and (=> t!5283 result!2959) b_and!5367)))

(declare-fun m!95381 () Bool)

(assert (=> d!23683 m!95381))

(assert (=> d!23683 m!94789))

(declare-fun m!95383 () Bool)

(assert (=> b!89141 m!95383))

(assert (=> b!89141 m!95383))

(declare-fun m!95385 () Bool)

(assert (=> b!89141 m!95385))

(declare-fun m!95387 () Bool)

(assert (=> b!89148 m!95387))

(declare-fun m!95389 () Bool)

(assert (=> b!89137 m!95389))

(assert (=> b!89137 m!94783))

(declare-fun m!95391 () Bool)

(assert (=> b!89137 m!95391))

(declare-fun m!95393 () Bool)

(assert (=> b!89137 m!95393))

(declare-fun m!95395 () Bool)

(assert (=> b!89137 m!95395))

(assert (=> b!89137 m!95389))

(declare-fun m!95397 () Bool)

(assert (=> b!89137 m!95397))

(assert (=> b!89137 m!95393))

(assert (=> b!89137 m!95383))

(declare-fun m!95399 () Bool)

(assert (=> b!89137 m!95399))

(assert (=> b!89137 m!94783))

(assert (=> b!89145 m!94783))

(assert (=> b!89145 m!95389))

(assert (=> b!89145 m!94783))

(assert (=> b!89145 m!95391))

(assert (=> b!89145 m!95389))

(assert (=> b!89145 m!95383))

(declare-fun m!95401 () Bool)

(assert (=> b!89145 m!95401))

(assert (=> b!89145 m!95383))

(declare-fun m!95403 () Bool)

(assert (=> bm!8642 m!95403))

(assert (=> b!89143 m!95403))

(assert (=> b!89146 m!95383))

(assert (=> b!89146 m!95383))

(declare-fun m!95405 () Bool)

(assert (=> b!89146 m!95405))

(assert (=> b!89147 m!95383))

(assert (=> b!89147 m!95383))

(assert (=> b!89147 m!95405))

(declare-fun m!95407 () Bool)

(assert (=> b!89139 m!95407))

(assert (=> bm!8606 d!23683))

(declare-fun d!23685 () Bool)

(declare-fun e!58054 () Bool)

(assert (=> d!23685 e!58054))

(declare-fun c!14785 () Bool)

(assert (=> d!23685 (= c!14785 (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!23685 true))

(declare-fun _$29!114 () Unit!2638)

(assert (=> d!23685 (= (choose!534 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (_values!2354 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992))) (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) (minValue!2260 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992)))) _$29!114)))

(declare-fun b!89153 () Bool)

(assert (=> b!89153 (= e!58054 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!89154 () Bool)

(assert (=> b!89154 (= e!58054 (ite (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!23685 c!14785) b!89153))

(assert (= (and d!23685 (not c!14785)) b!89154))

(assert (=> b!89153 m!94779))

(assert (=> b!89153 m!94819))

(assert (=> d!23641 d!23685))

(assert (=> d!23641 d!23621))

(declare-fun d!23687 () Bool)

(declare-fun res!45605 () Bool)

(declare-fun e!58055 () Bool)

(assert (=> d!23687 (=> (not res!45605) (not e!58055))))

(assert (=> d!23687 (= res!45605 (simpleValid!60 (_2!1122 lt!42584)))))

(assert (=> d!23687 (= (valid!344 (_2!1122 lt!42584)) e!58055)))

(declare-fun b!89155 () Bool)

(declare-fun res!45606 () Bool)

(assert (=> b!89155 (=> (not res!45606) (not e!58055))))

(assert (=> b!89155 (= res!45606 (= (arrayCountValidKeys!0 (_keys!4048 (_2!1122 lt!42584)) #b00000000000000000000000000000000 (size!2165 (_keys!4048 (_2!1122 lt!42584)))) (_size!432 (_2!1122 lt!42584))))))

(declare-fun b!89156 () Bool)

(declare-fun res!45607 () Bool)

(assert (=> b!89156 (=> (not res!45607) (not e!58055))))

(assert (=> b!89156 (= res!45607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 (_2!1122 lt!42584)) (mask!6414 (_2!1122 lt!42584))))))

(declare-fun b!89157 () Bool)

(assert (=> b!89157 (= e!58055 (arrayNoDuplicates!0 (_keys!4048 (_2!1122 lt!42584)) #b00000000000000000000000000000000 Nil!1532))))

(assert (= (and d!23687 res!45605) b!89155))

(assert (= (and b!89155 res!45606) b!89156))

(assert (= (and b!89156 res!45607) b!89157))

(declare-fun m!95409 () Bool)

(assert (=> d!23687 m!95409))

(declare-fun m!95411 () Bool)

(assert (=> b!89155 m!95411))

(declare-fun m!95413 () Bool)

(assert (=> b!89156 m!95413))

(declare-fun m!95415 () Bool)

(assert (=> b!89157 m!95415))

(assert (=> d!23601 d!23687))

(assert (=> d!23601 d!23629))

(declare-fun d!23689 () Bool)

(assert (=> d!23689 (= (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (and (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!88993 d!23689))

(declare-fun d!23691 () Bool)

(declare-fun e!58057 () Bool)

(assert (=> d!23691 e!58057))

(declare-fun res!45608 () Bool)

(assert (=> d!23691 (=> res!45608 e!58057)))

(declare-fun lt!42786 () Bool)

(assert (=> d!23691 (= res!45608 (not lt!42786))))

(declare-fun lt!42785 () Bool)

(assert (=> d!23691 (= lt!42786 lt!42785)))

(declare-fun lt!42788 () Unit!2638)

(declare-fun e!58056 () Unit!2638)

(assert (=> d!23691 (= lt!42788 e!58056)))

(declare-fun c!14786 () Bool)

(assert (=> d!23691 (= c!14786 lt!42785)))

(assert (=> d!23691 (= lt!42785 (containsKey!144 (toList!745 lt!42718) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23691 (= (contains!759 lt!42718 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!42786)))

(declare-fun b!89158 () Bool)

(declare-fun lt!42787 () Unit!2638)

(assert (=> b!89158 (= e!58056 lt!42787)))

(assert (=> b!89158 (= lt!42787 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42718) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89158 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89159 () Bool)

(declare-fun Unit!2650 () Unit!2638)

(assert (=> b!89159 (= e!58056 Unit!2650)))

(declare-fun b!89160 () Bool)

(assert (=> b!89160 (= e!58057 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23691 c!14786) b!89158))

(assert (= (and d!23691 (not c!14786)) b!89159))

(assert (= (and d!23691 (not res!45608)) b!89160))

(assert (=> d!23691 m!95059))

(declare-fun m!95417 () Bool)

(assert (=> d!23691 m!95417))

(assert (=> b!89158 m!95059))

(declare-fun m!95419 () Bool)

(assert (=> b!89158 m!95419))

(assert (=> b!89158 m!95059))

(declare-fun m!95421 () Bool)

(assert (=> b!89158 m!95421))

(assert (=> b!89158 m!95421))

(declare-fun m!95423 () Bool)

(assert (=> b!89158 m!95423))

(assert (=> b!89160 m!95059))

(assert (=> b!89160 m!95421))

(assert (=> b!89160 m!95421))

(assert (=> b!89160 m!95423))

(assert (=> b!89060 d!23691))

(declare-fun b!89161 () Bool)

(declare-fun e!58058 () Bool)

(declare-fun call!8646 () Bool)

(assert (=> b!89161 (= e!58058 call!8646)))

(declare-fun b!89162 () Bool)

(declare-fun e!58060 () Bool)

(assert (=> b!89162 (= e!58060 call!8646)))

(declare-fun b!89163 () Bool)

(assert (=> b!89163 (= e!58060 e!58058)))

(declare-fun lt!42789 () (_ BitVec 64))

(assert (=> b!89163 (= lt!42789 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!42790 () Unit!2638)

(assert (=> b!89163 (= lt!42790 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42789 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!89163 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42789 #b00000000000000000000000000000000)))

(declare-fun lt!42791 () Unit!2638)

(assert (=> b!89163 (= lt!42791 lt!42790)))

(declare-fun res!45609 () Bool)

(assert (=> b!89163 (= res!45609 (= (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))) (Found!248 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!89163 (=> (not res!45609) (not e!58058))))

(declare-fun d!23693 () Bool)

(declare-fun res!45610 () Bool)

(declare-fun e!58059 () Bool)

(assert (=> d!23693 (=> res!45610 e!58059)))

(assert (=> d!23693 (= res!45610 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23693 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))) e!58059)))

(declare-fun bm!8643 () Bool)

(assert (=> bm!8643 (= call!8646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89164 () Bool)

(assert (=> b!89164 (= e!58059 e!58060)))

(declare-fun c!14787 () Bool)

(assert (=> b!89164 (= c!14787 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!23693 (not res!45610)) b!89164))

(assert (= (and b!89164 c!14787) b!89163))

(assert (= (and b!89164 (not c!14787)) b!89162))

(assert (= (and b!89163 res!45609) b!89161))

(assert (= (or b!89161 b!89162) bm!8643))

(declare-fun m!95425 () Bool)

(assert (=> b!89163 m!95425))

(declare-fun m!95427 () Bool)

(assert (=> b!89163 m!95427))

(declare-fun m!95429 () Bool)

(assert (=> b!89163 m!95429))

(assert (=> b!89163 m!95425))

(declare-fun m!95431 () Bool)

(assert (=> b!89163 m!95431))

(declare-fun m!95433 () Bool)

(assert (=> bm!8643 m!95433))

(assert (=> b!89164 m!95425))

(assert (=> b!89164 m!95425))

(declare-fun m!95435 () Bool)

(assert (=> b!89164 m!95435))

(assert (=> bm!8634 d!23693))

(declare-fun d!23695 () Bool)

(declare-fun e!58062 () Bool)

(assert (=> d!23695 e!58062))

(declare-fun res!45611 () Bool)

(assert (=> d!23695 (=> res!45611 e!58062)))

(declare-fun lt!42793 () Bool)

(assert (=> d!23695 (= res!45611 (not lt!42793))))

(declare-fun lt!42792 () Bool)

(assert (=> d!23695 (= lt!42793 lt!42792)))

(declare-fun lt!42795 () Unit!2638)

(declare-fun e!58061 () Unit!2638)

(assert (=> d!23695 (= lt!42795 e!58061)))

(declare-fun c!14788 () Bool)

(assert (=> d!23695 (= c!14788 lt!42792)))

(assert (=> d!23695 (= lt!42792 (containsKey!144 (toList!745 lt!42632) (_1!1121 lt!42391)))))

(assert (=> d!23695 (= (contains!759 lt!42632 (_1!1121 lt!42391)) lt!42793)))

(declare-fun b!89165 () Bool)

(declare-fun lt!42794 () Unit!2638)

(assert (=> b!89165 (= e!58061 lt!42794)))

(assert (=> b!89165 (= lt!42794 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42632) (_1!1121 lt!42391)))))

(assert (=> b!89165 (isDefined!94 (getValueByKey!140 (toList!745 lt!42632) (_1!1121 lt!42391)))))

(declare-fun b!89166 () Bool)

(declare-fun Unit!2651 () Unit!2638)

(assert (=> b!89166 (= e!58061 Unit!2651)))

(declare-fun b!89167 () Bool)

(assert (=> b!89167 (= e!58062 (isDefined!94 (getValueByKey!140 (toList!745 lt!42632) (_1!1121 lt!42391))))))

(assert (= (and d!23695 c!14788) b!89165))

(assert (= (and d!23695 (not c!14788)) b!89166))

(assert (= (and d!23695 (not res!45611)) b!89167))

(declare-fun m!95437 () Bool)

(assert (=> d!23695 m!95437))

(declare-fun m!95439 () Bool)

(assert (=> b!89165 m!95439))

(assert (=> b!89165 m!95105))

(assert (=> b!89165 m!95105))

(declare-fun m!95441 () Bool)

(assert (=> b!89165 m!95441))

(assert (=> b!89167 m!95105))

(assert (=> b!89167 m!95105))

(assert (=> b!89167 m!95441))

(assert (=> d!23609 d!23695))

(declare-fun b!89170 () Bool)

(declare-fun e!58064 () Option!146)

(assert (=> b!89170 (= e!58064 (getValueByKey!140 (t!5285 lt!42634) (_1!1121 lt!42391)))))

(declare-fun b!89168 () Bool)

(declare-fun e!58063 () Option!146)

(assert (=> b!89168 (= e!58063 (Some!145 (_2!1121 (h!2124 lt!42634))))))

(declare-fun d!23697 () Bool)

(declare-fun c!14789 () Bool)

(assert (=> d!23697 (= c!14789 (and ((_ is Cons!1532) lt!42634) (= (_1!1121 (h!2124 lt!42634)) (_1!1121 lt!42391))))))

(assert (=> d!23697 (= (getValueByKey!140 lt!42634 (_1!1121 lt!42391)) e!58063)))

(declare-fun b!89169 () Bool)

(assert (=> b!89169 (= e!58063 e!58064)))

(declare-fun c!14790 () Bool)

(assert (=> b!89169 (= c!14790 (and ((_ is Cons!1532) lt!42634) (not (= (_1!1121 (h!2124 lt!42634)) (_1!1121 lt!42391)))))))

(declare-fun b!89171 () Bool)

(assert (=> b!89171 (= e!58064 None!144)))

(assert (= (and d!23697 c!14789) b!89168))

(assert (= (and d!23697 (not c!14789)) b!89169))

(assert (= (and b!89169 c!14790) b!89170))

(assert (= (and b!89169 (not c!14790)) b!89171))

(declare-fun m!95443 () Bool)

(assert (=> b!89170 m!95443))

(assert (=> d!23609 d!23697))

(declare-fun d!23699 () Bool)

(assert (=> d!23699 (= (getValueByKey!140 lt!42634 (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391)))))

(declare-fun lt!42798 () Unit!2638)

(declare-fun choose!536 (List!1536 (_ BitVec 64) V!3041) Unit!2638)

(assert (=> d!23699 (= lt!42798 (choose!536 lt!42634 (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(declare-fun e!58067 () Bool)

(assert (=> d!23699 e!58067))

(declare-fun res!45616 () Bool)

(assert (=> d!23699 (=> (not res!45616) (not e!58067))))

(assert (=> d!23699 (= res!45616 (isStrictlySorted!295 lt!42634))))

(assert (=> d!23699 (= (lemmaContainsTupThenGetReturnValue!60 lt!42634 (_1!1121 lt!42391) (_2!1121 lt!42391)) lt!42798)))

(declare-fun b!89176 () Bool)

(declare-fun res!45617 () Bool)

(assert (=> b!89176 (=> (not res!45617) (not e!58067))))

(assert (=> b!89176 (= res!45617 (containsKey!144 lt!42634 (_1!1121 lt!42391)))))

(declare-fun b!89177 () Bool)

(assert (=> b!89177 (= e!58067 (contains!760 lt!42634 (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391))))))

(assert (= (and d!23699 res!45616) b!89176))

(assert (= (and b!89176 res!45617) b!89177))

(assert (=> d!23699 m!95099))

(declare-fun m!95445 () Bool)

(assert (=> d!23699 m!95445))

(declare-fun m!95447 () Bool)

(assert (=> d!23699 m!95447))

(declare-fun m!95449 () Bool)

(assert (=> b!89176 m!95449))

(declare-fun m!95451 () Bool)

(assert (=> b!89177 m!95451))

(assert (=> d!23609 d!23699))

(declare-fun b!89198 () Bool)

(declare-fun e!58080 () List!1536)

(declare-fun call!8653 () List!1536)

(assert (=> b!89198 (= e!58080 call!8653)))

(declare-fun b!89199 () Bool)

(declare-fun c!14801 () Bool)

(assert (=> b!89199 (= c!14801 (and ((_ is Cons!1532) (toList!745 lt!42379)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42391))))))

(declare-fun e!58079 () List!1536)

(assert (=> b!89199 (= e!58080 e!58079)))

(declare-fun b!89200 () Bool)

(declare-fun call!8655 () List!1536)

(assert (=> b!89200 (= e!58079 call!8655)))

(declare-fun b!89201 () Bool)

(declare-fun e!58082 () Bool)

(declare-fun lt!42801 () List!1536)

(assert (=> b!89201 (= e!58082 (contains!760 lt!42801 (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391))))))

(declare-fun bm!8650 () Bool)

(declare-fun call!8654 () List!1536)

(assert (=> bm!8650 (= call!8653 call!8654)))

(declare-fun bm!8651 () Bool)

(assert (=> bm!8651 (= call!8655 call!8653)))

(declare-fun c!14800 () Bool)

(declare-fun b!89202 () Bool)

(declare-fun e!58081 () List!1536)

(assert (=> b!89202 (= e!58081 (ite c!14800 (t!5285 (toList!745 lt!42379)) (ite c!14801 (Cons!1532 (h!2124 (toList!745 lt!42379)) (t!5285 (toList!745 lt!42379))) Nil!1533)))))

(declare-fun b!89203 () Bool)

(declare-fun e!58078 () List!1536)

(assert (=> b!89203 (= e!58078 call!8654)))

(declare-fun b!89204 () Bool)

(assert (=> b!89204 (= e!58078 e!58080)))

(assert (=> b!89204 (= c!14800 (and ((_ is Cons!1532) (toList!745 lt!42379)) (= (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42391))))))

(declare-fun c!14802 () Bool)

(declare-fun bm!8652 () Bool)

(declare-fun $colon$colon!73 (List!1536 tuple2!2220) List!1536)

(assert (=> bm!8652 (= call!8654 ($colon$colon!73 e!58081 (ite c!14802 (h!2124 (toList!745 lt!42379)) (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391)))))))

(declare-fun c!14799 () Bool)

(assert (=> bm!8652 (= c!14799 c!14802)))

(declare-fun b!89205 () Bool)

(declare-fun res!45622 () Bool)

(assert (=> b!89205 (=> (not res!45622) (not e!58082))))

(assert (=> b!89205 (= res!45622 (containsKey!144 lt!42801 (_1!1121 lt!42391)))))

(declare-fun d!23701 () Bool)

(assert (=> d!23701 e!58082))

(declare-fun res!45623 () Bool)

(assert (=> d!23701 (=> (not res!45623) (not e!58082))))

(assert (=> d!23701 (= res!45623 (isStrictlySorted!295 lt!42801))))

(assert (=> d!23701 (= lt!42801 e!58078)))

(assert (=> d!23701 (= c!14802 (and ((_ is Cons!1532) (toList!745 lt!42379)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42391))))))

(assert (=> d!23701 (isStrictlySorted!295 (toList!745 lt!42379))))

(assert (=> d!23701 (= (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 lt!42391) (_2!1121 lt!42391)) lt!42801)))

(declare-fun b!89206 () Bool)

(assert (=> b!89206 (= e!58079 call!8655)))

(declare-fun b!89207 () Bool)

(assert (=> b!89207 (= e!58081 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42379)) (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (= (and d!23701 c!14802) b!89203))

(assert (= (and d!23701 (not c!14802)) b!89204))

(assert (= (and b!89204 c!14800) b!89198))

(assert (= (and b!89204 (not c!14800)) b!89199))

(assert (= (and b!89199 c!14801) b!89206))

(assert (= (and b!89199 (not c!14801)) b!89200))

(assert (= (or b!89206 b!89200) bm!8651))

(assert (= (or b!89198 bm!8651) bm!8650))

(assert (= (or b!89203 bm!8650) bm!8652))

(assert (= (and bm!8652 c!14799) b!89207))

(assert (= (and bm!8652 (not c!14799)) b!89202))

(assert (= (and d!23701 res!45623) b!89205))

(assert (= (and b!89205 res!45622) b!89201))

(declare-fun m!95453 () Bool)

(assert (=> d!23701 m!95453))

(declare-fun m!95455 () Bool)

(assert (=> d!23701 m!95455))

(declare-fun m!95457 () Bool)

(assert (=> b!89207 m!95457))

(declare-fun m!95459 () Bool)

(assert (=> bm!8652 m!95459))

(declare-fun m!95461 () Bool)

(assert (=> b!89205 m!95461))

(declare-fun m!95463 () Bool)

(assert (=> b!89201 m!95463))

(assert (=> d!23609 d!23701))

(assert (=> d!23637 d!23643))

(declare-fun d!23703 () Bool)

(assert (=> d!23703 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) from!355 Nil!1532)))

(assert (=> d!23703 true))

(declare-fun _$71!120 () Unit!2638)

(assert (=> d!23703 (= (choose!39 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!120)))

(declare-fun bs!3744 () Bool)

(assert (= bs!3744 d!23703))

(assert (=> bs!3744 m!94815))

(assert (=> d!23637 d!23703))

(assert (=> b!89045 d!23679))

(declare-fun bm!8653 () Bool)

(declare-fun call!8658 () ListLongMap!1459)

(declare-fun call!8657 () ListLongMap!1459)

(assert (=> bm!8653 (= call!8658 call!8657)))

(declare-fun bm!8654 () Bool)

(declare-fun call!8660 () Bool)

(declare-fun lt!42811 () ListLongMap!1459)

(assert (=> bm!8654 (= call!8660 (contains!759 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89208 () Bool)

(declare-fun e!58091 () Bool)

(declare-fun e!58087 () Bool)

(assert (=> b!89208 (= e!58091 e!58087)))

(declare-fun res!45630 () Bool)

(declare-fun call!8661 () Bool)

(assert (=> b!89208 (= res!45630 call!8661)))

(assert (=> b!89208 (=> (not res!45630) (not e!58087))))

(declare-fun b!89209 () Bool)

(declare-fun e!58094 () Bool)

(assert (=> b!89209 (= e!58094 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89210 () Bool)

(declare-fun e!58085 () Bool)

(assert (=> b!89210 (= e!58085 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8655 () Bool)

(assert (=> bm!8655 (= call!8657 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89211 () Bool)

(declare-fun e!58086 () Bool)

(assert (=> b!89211 (= e!58086 e!58091)))

(declare-fun c!14804 () Bool)

(assert (=> b!89211 (= c!14804 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89212 () Bool)

(declare-fun e!58088 () ListLongMap!1459)

(declare-fun call!8659 () ListLongMap!1459)

(assert (=> b!89212 (= e!58088 call!8659)))

(declare-fun bm!8656 () Bool)

(declare-fun call!8656 () ListLongMap!1459)

(assert (=> bm!8656 (= call!8659 call!8656)))

(declare-fun bm!8657 () Bool)

(declare-fun call!8662 () ListLongMap!1459)

(assert (=> bm!8657 (= call!8662 call!8658)))

(declare-fun b!89213 () Bool)

(declare-fun res!45631 () Bool)

(assert (=> b!89213 (=> (not res!45631) (not e!58086))))

(declare-fun e!58095 () Bool)

(assert (=> b!89213 (= res!45631 e!58095)))

(declare-fun res!45627 () Bool)

(assert (=> b!89213 (=> res!45627 e!58095)))

(assert (=> b!89213 (= res!45627 (not e!58085))))

(declare-fun res!45625 () Bool)

(assert (=> b!89213 (=> (not res!45625) (not e!58085))))

(assert (=> b!89213 (= res!45625 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun bm!8658 () Bool)

(assert (=> bm!8658 (= call!8661 (contains!759 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23705 () Bool)

(assert (=> d!23705 e!58086))

(declare-fun res!45624 () Bool)

(assert (=> d!23705 (=> (not res!45624) (not e!58086))))

(assert (=> d!23705 (= res!45624 (or (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))))

(declare-fun lt!42812 () ListLongMap!1459)

(assert (=> d!23705 (= lt!42811 lt!42812)))

(declare-fun lt!42813 () Unit!2638)

(declare-fun e!58083 () Unit!2638)

(assert (=> d!23705 (= lt!42813 e!58083)))

(declare-fun c!14808 () Bool)

(assert (=> d!23705 (= c!14808 e!58094)))

(declare-fun res!45626 () Bool)

(assert (=> d!23705 (=> (not res!45626) (not e!58094))))

(assert (=> d!23705 (= res!45626 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun e!58090 () ListLongMap!1459)

(assert (=> d!23705 (= lt!42812 e!58090)))

(declare-fun c!14805 () Bool)

(assert (=> d!23705 (= c!14805 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23705 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23705 (= (getCurrentListMap!429 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!42811)))

(declare-fun b!89214 () Bool)

(declare-fun e!58092 () Bool)

(assert (=> b!89214 (= e!58092 (= (apply!84 lt!42811 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 newMap!16)))))

(declare-fun b!89215 () Bool)

(declare-fun Unit!2652 () Unit!2638)

(assert (=> b!89215 (= e!58083 Unit!2652)))

(declare-fun b!89216 () Bool)

(declare-fun e!58093 () Bool)

(assert (=> b!89216 (= e!58093 e!58092)))

(declare-fun res!45632 () Bool)

(assert (=> b!89216 (= res!45632 call!8660)))

(assert (=> b!89216 (=> (not res!45632) (not e!58092))))

(declare-fun b!89217 () Bool)

(assert (=> b!89217 (= e!58090 (+!111 call!8656 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16))))))

(declare-fun e!58089 () Bool)

(declare-fun b!89218 () Bool)

(assert (=> b!89218 (= e!58089 (= (apply!84 lt!42811 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)) (get!1214 (select (arr!1919 (ite c!14716 (_values!2354 newMap!16) lt!42587)) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2166 (ite c!14716 (_values!2354 newMap!16) lt!42587))))))

(assert (=> b!89218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89219 () Bool)

(assert (=> b!89219 (= e!58093 (not call!8660))))

(declare-fun b!89220 () Bool)

(declare-fun res!45629 () Bool)

(assert (=> b!89220 (=> (not res!45629) (not e!58086))))

(assert (=> b!89220 (= res!45629 e!58093)))

(declare-fun c!14807 () Bool)

(assert (=> b!89220 (= c!14807 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89221 () Bool)

(declare-fun c!14806 () Bool)

(assert (=> b!89221 (= c!14806 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!58084 () ListLongMap!1459)

(assert (=> b!89221 (= e!58088 e!58084)))

(declare-fun b!89222 () Bool)

(assert (=> b!89222 (= e!58091 (not call!8661))))

(declare-fun b!89223 () Bool)

(assert (=> b!89223 (= e!58090 e!58088)))

(declare-fun c!14803 () Bool)

(assert (=> b!89223 (= c!14803 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89224 () Bool)

(assert (=> b!89224 (= e!58087 (= (apply!84 lt!42811 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 newMap!16)))))

(declare-fun b!89225 () Bool)

(assert (=> b!89225 (= e!58095 e!58089)))

(declare-fun res!45628 () Bool)

(assert (=> b!89225 (=> (not res!45628) (not e!58089))))

(assert (=> b!89225 (= res!45628 (contains!759 lt!42811 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89225 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89226 () Bool)

(declare-fun lt!42823 () Unit!2638)

(assert (=> b!89226 (= e!58083 lt!42823)))

(declare-fun lt!42815 () ListLongMap!1459)

(assert (=> b!89226 (= lt!42815 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42805 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42818 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42818 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42814 () Unit!2638)

(assert (=> b!89226 (= lt!42814 (addStillContains!60 lt!42815 lt!42805 (zeroValue!2260 newMap!16) lt!42818))))

(assert (=> b!89226 (contains!759 (+!111 lt!42815 (tuple2!2221 lt!42805 (zeroValue!2260 newMap!16))) lt!42818)))

(declare-fun lt!42808 () Unit!2638)

(assert (=> b!89226 (= lt!42808 lt!42814)))

(declare-fun lt!42803 () ListLongMap!1459)

(assert (=> b!89226 (= lt!42803 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42816 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42816 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42821 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42821 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42820 () Unit!2638)

(assert (=> b!89226 (= lt!42820 (addApplyDifferent!60 lt!42803 lt!42816 (minValue!2260 newMap!16) lt!42821))))

(assert (=> b!89226 (= (apply!84 (+!111 lt!42803 (tuple2!2221 lt!42816 (minValue!2260 newMap!16))) lt!42821) (apply!84 lt!42803 lt!42821))))

(declare-fun lt!42804 () Unit!2638)

(assert (=> b!89226 (= lt!42804 lt!42820)))

(declare-fun lt!42807 () ListLongMap!1459)

(assert (=> b!89226 (= lt!42807 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42822 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42806 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42806 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42810 () Unit!2638)

(assert (=> b!89226 (= lt!42810 (addApplyDifferent!60 lt!42807 lt!42822 (zeroValue!2260 newMap!16) lt!42806))))

(assert (=> b!89226 (= (apply!84 (+!111 lt!42807 (tuple2!2221 lt!42822 (zeroValue!2260 newMap!16))) lt!42806) (apply!84 lt!42807 lt!42806))))

(declare-fun lt!42802 () Unit!2638)

(assert (=> b!89226 (= lt!42802 lt!42810)))

(declare-fun lt!42817 () ListLongMap!1459)

(assert (=> b!89226 (= lt!42817 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (ite c!14716 (_values!2354 newMap!16) lt!42587) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42809 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42819 () (_ BitVec 64))

(assert (=> b!89226 (= lt!42819 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89226 (= lt!42823 (addApplyDifferent!60 lt!42817 lt!42809 (minValue!2260 newMap!16) lt!42819))))

(assert (=> b!89226 (= (apply!84 (+!111 lt!42817 (tuple2!2221 lt!42809 (minValue!2260 newMap!16))) lt!42819) (apply!84 lt!42817 lt!42819))))

(declare-fun b!89227 () Bool)

(assert (=> b!89227 (= e!58084 call!8662)))

(declare-fun bm!8659 () Bool)

(assert (=> bm!8659 (= call!8656 (+!111 (ite c!14805 call!8657 (ite c!14803 call!8658 call!8662)) (ite (or c!14805 c!14803) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 newMap!16)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16)))))))

(declare-fun b!89228 () Bool)

(assert (=> b!89228 (= e!58084 call!8659)))

(assert (= (and d!23705 c!14805) b!89217))

(assert (= (and d!23705 (not c!14805)) b!89223))

(assert (= (and b!89223 c!14803) b!89212))

(assert (= (and b!89223 (not c!14803)) b!89221))

(assert (= (and b!89221 c!14806) b!89228))

(assert (= (and b!89221 (not c!14806)) b!89227))

(assert (= (or b!89228 b!89227) bm!8657))

(assert (= (or b!89212 bm!8657) bm!8653))

(assert (= (or b!89212 b!89228) bm!8656))

(assert (= (or b!89217 bm!8653) bm!8655))

(assert (= (or b!89217 bm!8656) bm!8659))

(assert (= (and d!23705 res!45626) b!89209))

(assert (= (and d!23705 c!14808) b!89226))

(assert (= (and d!23705 (not c!14808)) b!89215))

(assert (= (and d!23705 res!45624) b!89213))

(assert (= (and b!89213 res!45625) b!89210))

(assert (= (and b!89213 (not res!45627)) b!89225))

(assert (= (and b!89225 res!45628) b!89218))

(assert (= (and b!89213 res!45631) b!89220))

(assert (= (and b!89220 c!14807) b!89216))

(assert (= (and b!89220 (not c!14807)) b!89219))

(assert (= (and b!89216 res!45632) b!89214))

(assert (= (or b!89216 b!89219) bm!8654))

(assert (= (and b!89220 res!45629) b!89211))

(assert (= (and b!89211 c!14804) b!89208))

(assert (= (and b!89211 (not c!14804)) b!89222))

(assert (= (and b!89208 res!45630) b!89224))

(assert (= (or b!89208 b!89222) bm!8658))

(declare-fun b_lambda!3949 () Bool)

(assert (=> (not b_lambda!3949) (not b!89218)))

(assert (=> b!89218 t!5296))

(declare-fun b_and!5369 () Bool)

(assert (= b_and!5365 (and (=> t!5296 result!2975) b_and!5369)))

(assert (=> b!89218 t!5298))

(declare-fun b_and!5371 () Bool)

(assert (= b_and!5367 (and (=> t!5298 result!2977) b_and!5371)))

(declare-fun m!95465 () Bool)

(assert (=> bm!8658 m!95465))

(assert (=> d!23705 m!95323))

(assert (=> b!89209 m!95325))

(assert (=> b!89209 m!95325))

(assert (=> b!89209 m!95327))

(assert (=> b!89225 m!95325))

(assert (=> b!89225 m!95325))

(declare-fun m!95467 () Bool)

(assert (=> b!89225 m!95467))

(declare-fun m!95469 () Bool)

(assert (=> bm!8659 m!95469))

(declare-fun m!95471 () Bool)

(assert (=> b!89224 m!95471))

(assert (=> b!89210 m!95325))

(assert (=> b!89210 m!95325))

(assert (=> b!89210 m!95327))

(declare-fun m!95473 () Bool)

(assert (=> bm!8654 m!95473))

(declare-fun m!95475 () Bool)

(assert (=> b!89226 m!95475))

(declare-fun m!95477 () Bool)

(assert (=> b!89226 m!95477))

(assert (=> b!89226 m!95477))

(declare-fun m!95479 () Bool)

(assert (=> b!89226 m!95479))

(declare-fun m!95481 () Bool)

(assert (=> b!89226 m!95481))

(declare-fun m!95483 () Bool)

(assert (=> b!89226 m!95483))

(assert (=> b!89226 m!95481))

(declare-fun m!95485 () Bool)

(assert (=> b!89226 m!95485))

(declare-fun m!95487 () Bool)

(assert (=> b!89226 m!95487))

(declare-fun m!95489 () Bool)

(assert (=> b!89226 m!95489))

(declare-fun m!95491 () Bool)

(assert (=> b!89226 m!95491))

(declare-fun m!95493 () Bool)

(assert (=> b!89226 m!95493))

(assert (=> b!89226 m!95325))

(assert (=> b!89226 m!95491))

(declare-fun m!95495 () Bool)

(assert (=> b!89226 m!95495))

(declare-fun m!95497 () Bool)

(assert (=> b!89226 m!95497))

(declare-fun m!95499 () Bool)

(assert (=> b!89226 m!95499))

(assert (=> b!89226 m!95497))

(declare-fun m!95501 () Bool)

(assert (=> b!89226 m!95501))

(declare-fun m!95503 () Bool)

(assert (=> b!89226 m!95503))

(declare-fun m!95505 () Bool)

(assert (=> b!89226 m!95505))

(assert (=> bm!8655 m!95503))

(declare-fun m!95507 () Bool)

(assert (=> b!89214 m!95507))

(declare-fun m!95509 () Bool)

(assert (=> b!89217 m!95509))

(declare-fun m!95511 () Bool)

(assert (=> b!89218 m!95511))

(assert (=> b!89218 m!95325))

(declare-fun m!95513 () Bool)

(assert (=> b!89218 m!95513))

(assert (=> b!89218 m!95325))

(assert (=> b!89218 m!95511))

(assert (=> b!89218 m!95377))

(declare-fun m!95515 () Bool)

(assert (=> b!89218 m!95515))

(assert (=> b!89218 m!95377))

(assert (=> bm!8581 d!23705))

(declare-fun b!89241 () Bool)

(declare-fun lt!42831 () SeekEntryResult!248)

(declare-fun e!58104 () SeekEntryResult!248)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4033 (_ BitVec 32)) SeekEntryResult!248)

(assert (=> b!89241 (= e!58104 (seekKeyOrZeroReturnVacant!0 (x!12233 lt!42831) (index!3133 lt!42831) (index!3133 lt!42831) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun b!89243 () Bool)

(declare-fun e!58102 () SeekEntryResult!248)

(assert (=> b!89243 (= e!58102 Undefined!248)))

(declare-fun b!89244 () Bool)

(declare-fun c!14815 () Bool)

(declare-fun lt!42832 () (_ BitVec 64))

(assert (=> b!89244 (= c!14815 (= lt!42832 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58103 () SeekEntryResult!248)

(assert (=> b!89244 (= e!58103 e!58104)))

(declare-fun d!23707 () Bool)

(declare-fun lt!42830 () SeekEntryResult!248)

(assert (=> d!23707 (and (or ((_ is Undefined!248) lt!42830) (not ((_ is Found!248) lt!42830)) (and (bvsge (index!3132 lt!42830) #b00000000000000000000000000000000) (bvslt (index!3132 lt!42830) (size!2165 (_keys!4048 newMap!16))))) (or ((_ is Undefined!248) lt!42830) ((_ is Found!248) lt!42830) (not ((_ is MissingZero!248) lt!42830)) (and (bvsge (index!3131 lt!42830) #b00000000000000000000000000000000) (bvslt (index!3131 lt!42830) (size!2165 (_keys!4048 newMap!16))))) (or ((_ is Undefined!248) lt!42830) ((_ is Found!248) lt!42830) ((_ is MissingZero!248) lt!42830) (not ((_ is MissingVacant!248) lt!42830)) (and (bvsge (index!3134 lt!42830) #b00000000000000000000000000000000) (bvslt (index!3134 lt!42830) (size!2165 (_keys!4048 newMap!16))))) (or ((_ is Undefined!248) lt!42830) (ite ((_ is Found!248) lt!42830) (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42830)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (ite ((_ is MissingZero!248) lt!42830) (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3131 lt!42830)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!248) lt!42830) (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3134 lt!42830)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23707 (= lt!42830 e!58102)))

(declare-fun c!14817 () Bool)

(assert (=> d!23707 (= c!14817 (and ((_ is Intermediate!248) lt!42831) (undefined!1060 lt!42831)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4033 (_ BitVec 32)) SeekEntryResult!248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!23707 (= lt!42831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (mask!6414 newMap!16)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(assert (=> d!23707 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23707 (= (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)) lt!42830)))

(declare-fun b!89242 () Bool)

(assert (=> b!89242 (= e!58103 (Found!248 (index!3133 lt!42831)))))

(declare-fun b!89245 () Bool)

(assert (=> b!89245 (= e!58104 (MissingZero!248 (index!3133 lt!42831)))))

(declare-fun b!89246 () Bool)

(assert (=> b!89246 (= e!58102 e!58103)))

(assert (=> b!89246 (= lt!42832 (select (arr!1918 (_keys!4048 newMap!16)) (index!3133 lt!42831)))))

(declare-fun c!14816 () Bool)

(assert (=> b!89246 (= c!14816 (= lt!42832 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (= (and d!23707 c!14817) b!89243))

(assert (= (and d!23707 (not c!14817)) b!89246))

(assert (= (and b!89246 c!14816) b!89242))

(assert (= (and b!89246 (not c!14816)) b!89244))

(assert (= (and b!89244 c!14815) b!89245))

(assert (= (and b!89244 (not c!14815)) b!89241))

(assert (=> b!89241 m!94779))

(declare-fun m!95517 () Bool)

(assert (=> b!89241 m!95517))

(assert (=> d!23707 m!95323))

(assert (=> d!23707 m!94779))

(declare-fun m!95519 () Bool)

(assert (=> d!23707 m!95519))

(declare-fun m!95521 () Bool)

(assert (=> d!23707 m!95521))

(assert (=> d!23707 m!95519))

(assert (=> d!23707 m!94779))

(declare-fun m!95523 () Bool)

(assert (=> d!23707 m!95523))

(declare-fun m!95525 () Bool)

(assert (=> d!23707 m!95525))

(declare-fun m!95527 () Bool)

(assert (=> d!23707 m!95527))

(declare-fun m!95529 () Bool)

(assert (=> b!89246 m!95529))

(assert (=> b!88880 d!23707))

(declare-fun d!23709 () Bool)

(declare-fun e!58105 () Bool)

(assert (=> d!23709 e!58105))

(declare-fun res!45633 () Bool)

(assert (=> d!23709 (=> (not res!45633) (not e!58105))))

(declare-fun lt!42834 () ListLongMap!1459)

(assert (=> d!23709 (= res!45633 (contains!759 lt!42834 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!42836 () List!1536)

(assert (=> d!23709 (= lt!42834 (ListLongMap!1460 lt!42836))))

(declare-fun lt!42835 () Unit!2638)

(declare-fun lt!42833 () Unit!2638)

(assert (=> d!23709 (= lt!42835 lt!42833)))

(assert (=> d!23709 (= (getValueByKey!140 lt!42836 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23709 (= lt!42833 (lemmaContainsTupThenGetReturnValue!60 lt!42836 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23709 (= lt!42836 (insertStrictlySorted!63 (toList!745 call!8628) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23709 (= (+!111 call!8628 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42834)))

(declare-fun b!89247 () Bool)

(declare-fun res!45634 () Bool)

(assert (=> b!89247 (=> (not res!45634) (not e!58105))))

(assert (=> b!89247 (= res!45634 (= (getValueByKey!140 (toList!745 lt!42834) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89248 () Bool)

(assert (=> b!89248 (= e!58105 (contains!760 (toList!745 lt!42834) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23709 res!45633) b!89247))

(assert (= (and b!89247 res!45634) b!89248))

(declare-fun m!95531 () Bool)

(assert (=> d!23709 m!95531))

(declare-fun m!95533 () Bool)

(assert (=> d!23709 m!95533))

(declare-fun m!95535 () Bool)

(assert (=> d!23709 m!95535))

(declare-fun m!95537 () Bool)

(assert (=> d!23709 m!95537))

(declare-fun m!95539 () Bool)

(assert (=> b!89247 m!95539))

(declare-fun m!95541 () Bool)

(assert (=> b!89248 m!95541))

(assert (=> b!89052 d!23709))

(declare-fun d!23711 () Bool)

(declare-fun lt!42839 () (_ BitVec 32))

(assert (=> d!23711 (and (bvsge lt!42839 #b00000000000000000000000000000000) (bvsle lt!42839 (bvsub (size!2165 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!58111 () (_ BitVec 32))

(assert (=> d!23711 (= lt!42839 e!58111)))

(declare-fun c!14822 () Bool)

(assert (=> d!23711 (= c!14822 (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(assert (=> d!23711 (and (bvsle #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2165 (_keys!4048 newMap!16)) (size!2165 (_keys!4048 newMap!16))))))

(assert (=> d!23711 (= (arrayCountValidKeys!0 (_keys!4048 newMap!16) #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) lt!42839)))

(declare-fun bm!8662 () Bool)

(declare-fun call!8665 () (_ BitVec 32))

(assert (=> bm!8662 (= call!8665 (arrayCountValidKeys!0 (_keys!4048 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89257 () Bool)

(assert (=> b!89257 (= e!58111 #b00000000000000000000000000000000)))

(declare-fun b!89258 () Bool)

(declare-fun e!58110 () (_ BitVec 32))

(assert (=> b!89258 (= e!58110 call!8665)))

(declare-fun b!89259 () Bool)

(assert (=> b!89259 (= e!58111 e!58110)))

(declare-fun c!14823 () Bool)

(assert (=> b!89259 (= c!14823 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89260 () Bool)

(assert (=> b!89260 (= e!58110 (bvadd #b00000000000000000000000000000001 call!8665))))

(assert (= (and d!23711 c!14822) b!89257))

(assert (= (and d!23711 (not c!14822)) b!89259))

(assert (= (and b!89259 c!14823) b!89260))

(assert (= (and b!89259 (not c!14823)) b!89258))

(assert (= (or b!89260 b!89258) bm!8662))

(declare-fun m!95543 () Bool)

(assert (=> bm!8662 m!95543))

(assert (=> b!89259 m!95325))

(assert (=> b!89259 m!95325))

(assert (=> b!89259 m!95327))

(assert (=> b!88960 d!23711))

(declare-fun d!23713 () Bool)

(declare-fun lt!42840 () Bool)

(assert (=> d!23713 (= lt!42840 (select (content!93 (toList!745 lt!42640)) lt!42377))))

(declare-fun e!58112 () Bool)

(assert (=> d!23713 (= lt!42840 e!58112)))

(declare-fun res!45635 () Bool)

(assert (=> d!23713 (=> (not res!45635) (not e!58112))))

(assert (=> d!23713 (= res!45635 ((_ is Cons!1532) (toList!745 lt!42640)))))

(assert (=> d!23713 (= (contains!760 (toList!745 lt!42640) lt!42377) lt!42840)))

(declare-fun b!89261 () Bool)

(declare-fun e!58113 () Bool)

(assert (=> b!89261 (= e!58112 e!58113)))

(declare-fun res!45636 () Bool)

(assert (=> b!89261 (=> res!45636 e!58113)))

(assert (=> b!89261 (= res!45636 (= (h!2124 (toList!745 lt!42640)) lt!42377))))

(declare-fun b!89262 () Bool)

(assert (=> b!89262 (= e!58113 (contains!760 (t!5285 (toList!745 lt!42640)) lt!42377))))

(assert (= (and d!23713 res!45635) b!89261))

(assert (= (and b!89261 (not res!45636)) b!89262))

(declare-fun m!95545 () Bool)

(assert (=> d!23713 m!95545))

(declare-fun m!95547 () Bool)

(assert (=> d!23713 m!95547))

(declare-fun m!95549 () Bool)

(assert (=> b!89262 m!95549))

(assert (=> b!88947 d!23713))

(declare-fun d!23715 () Bool)

(declare-fun res!45637 () Bool)

(declare-fun e!58114 () Bool)

(assert (=> d!23715 (=> res!45637 e!58114)))

(assert (=> d!23715 (= res!45637 (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23715 (= (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!58114)))

(declare-fun b!89263 () Bool)

(declare-fun e!58115 () Bool)

(assert (=> b!89263 (= e!58114 e!58115)))

(declare-fun res!45638 () Bool)

(assert (=> b!89263 (=> (not res!45638) (not e!58115))))

(assert (=> b!89263 (= res!45638 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89264 () Bool)

(assert (=> b!89264 (= e!58115 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!23715 (not res!45637)) b!89263))

(assert (= (and b!89263 res!45638) b!89264))

(assert (=> d!23715 m!95383))

(assert (=> b!89264 m!94779))

(declare-fun m!95551 () Bool)

(assert (=> b!89264 m!95551))

(assert (=> b!88983 d!23715))

(declare-fun b!89265 () Bool)

(declare-fun e!58118 () Bool)

(declare-fun call!8666 () Bool)

(assert (=> b!89265 (= e!58118 call!8666)))

(declare-fun bm!8663 () Bool)

(declare-fun c!14824 () Bool)

(assert (=> bm!8663 (= call!8666 (arrayNoDuplicates!0 (_keys!4048 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14824 (Cons!1531 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000) Nil!1532) Nil!1532)))))

(declare-fun d!23717 () Bool)

(declare-fun res!45639 () Bool)

(declare-fun e!58117 () Bool)

(assert (=> d!23717 (=> res!45639 e!58117)))

(assert (=> d!23717 (= res!45639 (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(assert (=> d!23717 (= (arrayNoDuplicates!0 (_keys!4048 newMap!16) #b00000000000000000000000000000000 Nil!1532) e!58117)))

(declare-fun b!89266 () Bool)

(assert (=> b!89266 (= e!58118 call!8666)))

(declare-fun b!89267 () Bool)

(declare-fun e!58116 () Bool)

(assert (=> b!89267 (= e!58117 e!58116)))

(declare-fun res!45641 () Bool)

(assert (=> b!89267 (=> (not res!45641) (not e!58116))))

(declare-fun e!58119 () Bool)

(assert (=> b!89267 (= res!45641 (not e!58119))))

(declare-fun res!45640 () Bool)

(assert (=> b!89267 (=> (not res!45640) (not e!58119))))

(assert (=> b!89267 (= res!45640 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89268 () Bool)

(assert (=> b!89268 (= e!58116 e!58118)))

(assert (=> b!89268 (= c!14824 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89269 () Bool)

(assert (=> b!89269 (= e!58119 (contains!761 Nil!1532 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23717 (not res!45639)) b!89267))

(assert (= (and b!89267 res!45640) b!89269))

(assert (= (and b!89267 res!45641) b!89268))

(assert (= (and b!89268 c!14824) b!89266))

(assert (= (and b!89268 (not c!14824)) b!89265))

(assert (= (or b!89266 b!89265) bm!8663))

(assert (=> bm!8663 m!95325))

(declare-fun m!95553 () Bool)

(assert (=> bm!8663 m!95553))

(assert (=> b!89267 m!95325))

(assert (=> b!89267 m!95325))

(assert (=> b!89267 m!95327))

(assert (=> b!89268 m!95325))

(assert (=> b!89268 m!95325))

(assert (=> b!89268 m!95327))

(assert (=> b!89269 m!95325))

(assert (=> b!89269 m!95325))

(declare-fun m!95555 () Bool)

(assert (=> b!89269 m!95555))

(assert (=> b!88962 d!23717))

(declare-fun d!23719 () Bool)

(declare-fun lt!42841 () Bool)

(assert (=> d!23719 (= lt!42841 (select (content!93 (toList!745 lt!42644)) lt!42377))))

(declare-fun e!58120 () Bool)

(assert (=> d!23719 (= lt!42841 e!58120)))

(declare-fun res!45642 () Bool)

(assert (=> d!23719 (=> (not res!45642) (not e!58120))))

(assert (=> d!23719 (= res!45642 ((_ is Cons!1532) (toList!745 lt!42644)))))

(assert (=> d!23719 (= (contains!760 (toList!745 lt!42644) lt!42377) lt!42841)))

(declare-fun b!89270 () Bool)

(declare-fun e!58121 () Bool)

(assert (=> b!89270 (= e!58120 e!58121)))

(declare-fun res!45643 () Bool)

(assert (=> b!89270 (=> res!45643 e!58121)))

(assert (=> b!89270 (= res!45643 (= (h!2124 (toList!745 lt!42644)) lt!42377))))

(declare-fun b!89271 () Bool)

(assert (=> b!89271 (= e!58121 (contains!760 (t!5285 (toList!745 lt!42644)) lt!42377))))

(assert (= (and d!23719 res!45642) b!89270))

(assert (= (and b!89270 (not res!45643)) b!89271))

(declare-fun m!95557 () Bool)

(assert (=> d!23719 m!95557))

(declare-fun m!95559 () Bool)

(assert (=> d!23719 m!95559))

(declare-fun m!95561 () Bool)

(assert (=> b!89271 m!95561))

(assert (=> b!88949 d!23719))

(declare-fun bm!8664 () Bool)

(declare-fun call!8669 () ListLongMap!1459)

(declare-fun call!8668 () ListLongMap!1459)

(assert (=> bm!8664 (= call!8669 call!8668)))

(declare-fun bm!8665 () Bool)

(declare-fun call!8671 () Bool)

(declare-fun lt!42851 () ListLongMap!1459)

(assert (=> bm!8665 (= call!8671 (contains!759 lt!42851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89272 () Bool)

(declare-fun e!58130 () Bool)

(declare-fun e!58126 () Bool)

(assert (=> b!89272 (= e!58130 e!58126)))

(declare-fun res!45650 () Bool)

(declare-fun call!8672 () Bool)

(assert (=> b!89272 (= res!45650 call!8672)))

(assert (=> b!89272 (=> (not res!45650) (not e!58126))))

(declare-fun b!89273 () Bool)

(declare-fun e!58133 () Bool)

(assert (=> b!89273 (= e!58133 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!89274 () Bool)

(declare-fun e!58124 () Bool)

(assert (=> b!89274 (= e!58124 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!8666 () Bool)

(assert (=> bm!8666 (= call!8668 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun b!89275 () Bool)

(declare-fun e!58125 () Bool)

(assert (=> b!89275 (= e!58125 e!58130)))

(declare-fun c!14826 () Bool)

(assert (=> b!89275 (= c!14826 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89276 () Bool)

(declare-fun e!58127 () ListLongMap!1459)

(declare-fun call!8670 () ListLongMap!1459)

(assert (=> b!89276 (= e!58127 call!8670)))

(declare-fun bm!8667 () Bool)

(declare-fun call!8667 () ListLongMap!1459)

(assert (=> bm!8667 (= call!8670 call!8667)))

(declare-fun bm!8668 () Bool)

(declare-fun call!8673 () ListLongMap!1459)

(assert (=> bm!8668 (= call!8673 call!8669)))

(declare-fun b!89277 () Bool)

(declare-fun res!45651 () Bool)

(assert (=> b!89277 (=> (not res!45651) (not e!58125))))

(declare-fun e!58134 () Bool)

(assert (=> b!89277 (= res!45651 e!58134)))

(declare-fun res!45647 () Bool)

(assert (=> b!89277 (=> res!45647 e!58134)))

(assert (=> b!89277 (= res!45647 (not e!58124))))

(declare-fun res!45645 () Bool)

(assert (=> b!89277 (=> (not res!45645) (not e!58124))))

(assert (=> b!89277 (= res!45645 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun bm!8669 () Bool)

(assert (=> bm!8669 (= call!8672 (contains!759 lt!42851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!23721 () Bool)

(assert (=> d!23721 e!58125))

(declare-fun res!45644 () Bool)

(assert (=> d!23721 (=> (not res!45644) (not e!58125))))

(assert (=> d!23721 (= res!45644 (or (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))))

(declare-fun lt!42852 () ListLongMap!1459)

(assert (=> d!23721 (= lt!42851 lt!42852)))

(declare-fun lt!42853 () Unit!2638)

(declare-fun e!58122 () Unit!2638)

(assert (=> d!23721 (= lt!42853 e!58122)))

(declare-fun c!14830 () Bool)

(assert (=> d!23721 (= c!14830 e!58133)))

(declare-fun res!45646 () Bool)

(assert (=> d!23721 (=> (not res!45646) (not e!58133))))

(assert (=> d!23721 (= res!45646 (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun e!58129 () ListLongMap!1459)

(assert (=> d!23721 (= lt!42852 e!58129)))

(declare-fun c!14827 () Bool)

(assert (=> d!23721 (= c!14827 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!23721 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23721 (= (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) lt!42851)))

(declare-fun b!89278 () Bool)

(declare-fun e!58131 () Bool)

(assert (=> b!89278 (= e!58131 (= (apply!84 lt!42851 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2260 newMap!16)))))

(declare-fun b!89279 () Bool)

(declare-fun Unit!2653 () Unit!2638)

(assert (=> b!89279 (= e!58122 Unit!2653)))

(declare-fun b!89280 () Bool)

(declare-fun e!58132 () Bool)

(assert (=> b!89280 (= e!58132 e!58131)))

(declare-fun res!45652 () Bool)

(assert (=> b!89280 (= res!45652 call!8671)))

(assert (=> b!89280 (=> (not res!45652) (not e!58131))))

(declare-fun b!89281 () Bool)

(assert (=> b!89281 (= e!58129 (+!111 call!8667 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16))))))

(declare-fun b!89282 () Bool)

(declare-fun e!58128 () Bool)

(assert (=> b!89282 (= e!58128 (= (apply!84 lt!42851 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)) (get!1214 (select (arr!1919 (_values!2354 newMap!16)) #b00000000000000000000000000000000) (dynLambda!347 (defaultEntry!2371 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!89282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2166 (_values!2354 newMap!16))))))

(assert (=> b!89282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89283 () Bool)

(assert (=> b!89283 (= e!58132 (not call!8671))))

(declare-fun b!89284 () Bool)

(declare-fun res!45649 () Bool)

(assert (=> b!89284 (=> (not res!45649) (not e!58125))))

(assert (=> b!89284 (= res!45649 e!58132)))

(declare-fun c!14829 () Bool)

(assert (=> b!89284 (= c!14829 (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!89285 () Bool)

(declare-fun c!14828 () Bool)

(assert (=> b!89285 (= c!14828 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!58123 () ListLongMap!1459)

(assert (=> b!89285 (= e!58127 e!58123)))

(declare-fun b!89286 () Bool)

(assert (=> b!89286 (= e!58130 (not call!8672))))

(declare-fun b!89287 () Bool)

(assert (=> b!89287 (= e!58129 e!58127)))

(declare-fun c!14825 () Bool)

(assert (=> b!89287 (= c!14825 (and (not (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2204 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!89288 () Bool)

(assert (=> b!89288 (= e!58126 (= (apply!84 lt!42851 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2260 newMap!16)))))

(declare-fun b!89289 () Bool)

(assert (=> b!89289 (= e!58134 e!58128)))

(declare-fun res!45648 () Bool)

(assert (=> b!89289 (=> (not res!45648) (not e!58128))))

(assert (=> b!89289 (= res!45648 (contains!759 lt!42851 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!89289 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89290 () Bool)

(declare-fun lt!42863 () Unit!2638)

(assert (=> b!89290 (= e!58122 lt!42863)))

(declare-fun lt!42855 () ListLongMap!1459)

(assert (=> b!89290 (= lt!42855 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42845 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42845 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42858 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42858 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42854 () Unit!2638)

(assert (=> b!89290 (= lt!42854 (addStillContains!60 lt!42855 lt!42845 (zeroValue!2260 newMap!16) lt!42858))))

(assert (=> b!89290 (contains!759 (+!111 lt!42855 (tuple2!2221 lt!42845 (zeroValue!2260 newMap!16))) lt!42858)))

(declare-fun lt!42848 () Unit!2638)

(assert (=> b!89290 (= lt!42848 lt!42854)))

(declare-fun lt!42843 () ListLongMap!1459)

(assert (=> b!89290 (= lt!42843 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42856 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42861 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42861 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42860 () Unit!2638)

(assert (=> b!89290 (= lt!42860 (addApplyDifferent!60 lt!42843 lt!42856 (minValue!2260 newMap!16) lt!42861))))

(assert (=> b!89290 (= (apply!84 (+!111 lt!42843 (tuple2!2221 lt!42856 (minValue!2260 newMap!16))) lt!42861) (apply!84 lt!42843 lt!42861))))

(declare-fun lt!42844 () Unit!2638)

(assert (=> b!89290 (= lt!42844 lt!42860)))

(declare-fun lt!42847 () ListLongMap!1459)

(assert (=> b!89290 (= lt!42847 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42862 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42846 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42846 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!42850 () Unit!2638)

(assert (=> b!89290 (= lt!42850 (addApplyDifferent!60 lt!42847 lt!42862 (zeroValue!2260 newMap!16) lt!42846))))

(assert (=> b!89290 (= (apply!84 (+!111 lt!42847 (tuple2!2221 lt!42862 (zeroValue!2260 newMap!16))) lt!42846) (apply!84 lt!42847 lt!42846))))

(declare-fun lt!42842 () Unit!2638)

(assert (=> b!89290 (= lt!42842 lt!42850)))

(declare-fun lt!42857 () ListLongMap!1459)

(assert (=> b!89290 (= lt!42857 (getCurrentListMapNoExtraKeys!75 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!42849 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!42859 () (_ BitVec 64))

(assert (=> b!89290 (= lt!42859 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!89290 (= lt!42863 (addApplyDifferent!60 lt!42857 lt!42849 (minValue!2260 newMap!16) lt!42859))))

(assert (=> b!89290 (= (apply!84 (+!111 lt!42857 (tuple2!2221 lt!42849 (minValue!2260 newMap!16))) lt!42859) (apply!84 lt!42857 lt!42859))))

(declare-fun b!89291 () Bool)

(assert (=> b!89291 (= e!58123 call!8673)))

(declare-fun bm!8670 () Bool)

(assert (=> bm!8670 (= call!8667 (+!111 (ite c!14827 call!8668 (ite c!14825 call!8669 call!8673)) (ite (or c!14827 c!14825) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 newMap!16)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 newMap!16)))))))

(declare-fun b!89292 () Bool)

(assert (=> b!89292 (= e!58123 call!8670)))

(assert (= (and d!23721 c!14827) b!89281))

(assert (= (and d!23721 (not c!14827)) b!89287))

(assert (= (and b!89287 c!14825) b!89276))

(assert (= (and b!89287 (not c!14825)) b!89285))

(assert (= (and b!89285 c!14828) b!89292))

(assert (= (and b!89285 (not c!14828)) b!89291))

(assert (= (or b!89292 b!89291) bm!8668))

(assert (= (or b!89276 bm!8668) bm!8664))

(assert (= (or b!89276 b!89292) bm!8667))

(assert (= (or b!89281 bm!8664) bm!8666))

(assert (= (or b!89281 bm!8667) bm!8670))

(assert (= (and d!23721 res!45646) b!89273))

(assert (= (and d!23721 c!14830) b!89290))

(assert (= (and d!23721 (not c!14830)) b!89279))

(assert (= (and d!23721 res!45644) b!89277))

(assert (= (and b!89277 res!45645) b!89274))

(assert (= (and b!89277 (not res!45647)) b!89289))

(assert (= (and b!89289 res!45648) b!89282))

(assert (= (and b!89277 res!45651) b!89284))

(assert (= (and b!89284 c!14829) b!89280))

(assert (= (and b!89284 (not c!14829)) b!89283))

(assert (= (and b!89280 res!45652) b!89278))

(assert (= (or b!89280 b!89283) bm!8665))

(assert (= (and b!89284 res!45649) b!89275))

(assert (= (and b!89275 c!14826) b!89272))

(assert (= (and b!89275 (not c!14826)) b!89286))

(assert (= (and b!89272 res!45650) b!89288))

(assert (= (or b!89272 b!89286) bm!8669))

(declare-fun b_lambda!3951 () Bool)

(assert (=> (not b_lambda!3951) (not b!89282)))

(assert (=> b!89282 t!5296))

(declare-fun b_and!5373 () Bool)

(assert (= b_and!5369 (and (=> t!5296 result!2975) b_and!5373)))

(assert (=> b!89282 t!5298))

(declare-fun b_and!5375 () Bool)

(assert (= b_and!5371 (and (=> t!5298 result!2977) b_and!5375)))

(declare-fun m!95563 () Bool)

(assert (=> bm!8669 m!95563))

(assert (=> d!23721 m!95323))

(assert (=> b!89273 m!95325))

(assert (=> b!89273 m!95325))

(assert (=> b!89273 m!95327))

(assert (=> b!89289 m!95325))

(assert (=> b!89289 m!95325))

(declare-fun m!95565 () Bool)

(assert (=> b!89289 m!95565))

(declare-fun m!95567 () Bool)

(assert (=> bm!8670 m!95567))

(declare-fun m!95569 () Bool)

(assert (=> b!89288 m!95569))

(assert (=> b!89274 m!95325))

(assert (=> b!89274 m!95325))

(assert (=> b!89274 m!95327))

(declare-fun m!95571 () Bool)

(assert (=> bm!8665 m!95571))

(declare-fun m!95573 () Bool)

(assert (=> b!89290 m!95573))

(declare-fun m!95575 () Bool)

(assert (=> b!89290 m!95575))

(assert (=> b!89290 m!95575))

(declare-fun m!95577 () Bool)

(assert (=> b!89290 m!95577))

(declare-fun m!95579 () Bool)

(assert (=> b!89290 m!95579))

(declare-fun m!95581 () Bool)

(assert (=> b!89290 m!95581))

(assert (=> b!89290 m!95579))

(declare-fun m!95583 () Bool)

(assert (=> b!89290 m!95583))

(declare-fun m!95585 () Bool)

(assert (=> b!89290 m!95585))

(declare-fun m!95587 () Bool)

(assert (=> b!89290 m!95587))

(declare-fun m!95589 () Bool)

(assert (=> b!89290 m!95589))

(declare-fun m!95591 () Bool)

(assert (=> b!89290 m!95591))

(assert (=> b!89290 m!95325))

(assert (=> b!89290 m!95589))

(declare-fun m!95593 () Bool)

(assert (=> b!89290 m!95593))

(declare-fun m!95595 () Bool)

(assert (=> b!89290 m!95595))

(declare-fun m!95597 () Bool)

(assert (=> b!89290 m!95597))

(assert (=> b!89290 m!95595))

(declare-fun m!95599 () Bool)

(assert (=> b!89290 m!95599))

(declare-fun m!95601 () Bool)

(assert (=> b!89290 m!95601))

(declare-fun m!95603 () Bool)

(assert (=> b!89290 m!95603))

(assert (=> bm!8666 m!95601))

(declare-fun m!95605 () Bool)

(assert (=> b!89278 m!95605))

(declare-fun m!95607 () Bool)

(assert (=> b!89281 m!95607))

(declare-fun m!95609 () Bool)

(assert (=> b!89282 m!95609))

(assert (=> b!89282 m!95325))

(declare-fun m!95611 () Bool)

(assert (=> b!89282 m!95611))

(assert (=> b!89282 m!95325))

(assert (=> b!89282 m!95609))

(assert (=> b!89282 m!95377))

(declare-fun m!95613 () Bool)

(assert (=> b!89282 m!95613))

(assert (=> b!89282 m!95377))

(assert (=> b!88886 d!23721))

(declare-fun d!23723 () Bool)

(declare-fun e!58135 () Bool)

(assert (=> d!23723 e!58135))

(declare-fun res!45653 () Bool)

(assert (=> d!23723 (=> (not res!45653) (not e!58135))))

(declare-fun lt!42865 () ListLongMap!1459)

(assert (=> d!23723 (= res!45653 (contains!759 lt!42865 (_1!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun lt!42867 () List!1536)

(assert (=> d!23723 (= lt!42865 (ListLongMap!1460 lt!42867))))

(declare-fun lt!42866 () Unit!2638)

(declare-fun lt!42864 () Unit!2638)

(assert (=> d!23723 (= lt!42866 lt!42864)))

(assert (=> d!23723 (= (getValueByKey!140 lt!42867 (_1!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))) (Some!145 (_2!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(assert (=> d!23723 (= lt!42864 (lemmaContainsTupThenGetReturnValue!60 lt!42867 (_1!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (_2!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(assert (=> d!23723 (= lt!42867 (insertStrictlySorted!63 (toList!745 e!57874) (_1!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (_2!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(assert (=> d!23723 (= (+!111 e!57874 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) lt!42865)))

(declare-fun b!89293 () Bool)

(declare-fun res!45654 () Bool)

(assert (=> b!89293 (=> (not res!45654) (not e!58135))))

(assert (=> b!89293 (= res!45654 (= (getValueByKey!140 (toList!745 lt!42865) (_1!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))) (Some!145 (_2!1121 (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))))

(declare-fun b!89294 () Bool)

(assert (=> b!89294 (= e!58135 (contains!760 (toList!745 lt!42865) (ite c!14716 (ite c!14719 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (= (and d!23723 res!45653) b!89293))

(assert (= (and b!89293 res!45654) b!89294))

(declare-fun m!95615 () Bool)

(assert (=> d!23723 m!95615))

(declare-fun m!95617 () Bool)

(assert (=> d!23723 m!95617))

(declare-fun m!95619 () Bool)

(assert (=> d!23723 m!95619))

(declare-fun m!95621 () Bool)

(assert (=> d!23723 m!95621))

(declare-fun m!95623 () Bool)

(assert (=> b!89293 m!95623))

(declare-fun m!95625 () Bool)

(assert (=> b!89294 m!95625))

(assert (=> bm!8598 d!23723))

(declare-fun d!23725 () Bool)

(declare-fun lt!42868 () Bool)

(assert (=> d!23725 (= lt!42868 (select (content!93 (toList!745 lt!42648)) lt!42383))))

(declare-fun e!58136 () Bool)

(assert (=> d!23725 (= lt!42868 e!58136)))

(declare-fun res!45655 () Bool)

(assert (=> d!23725 (=> (not res!45655) (not e!58136))))

(assert (=> d!23725 (= res!45655 ((_ is Cons!1532) (toList!745 lt!42648)))))

(assert (=> d!23725 (= (contains!760 (toList!745 lt!42648) lt!42383) lt!42868)))

(declare-fun b!89295 () Bool)

(declare-fun e!58137 () Bool)

(assert (=> b!89295 (= e!58136 e!58137)))

(declare-fun res!45656 () Bool)

(assert (=> b!89295 (=> res!45656 e!58137)))

(assert (=> b!89295 (= res!45656 (= (h!2124 (toList!745 lt!42648)) lt!42383))))

(declare-fun b!89296 () Bool)

(assert (=> b!89296 (= e!58137 (contains!760 (t!5285 (toList!745 lt!42648)) lt!42383))))

(assert (= (and d!23725 res!45655) b!89295))

(assert (= (and b!89295 (not res!45656)) b!89296))

(declare-fun m!95627 () Bool)

(assert (=> d!23725 m!95627))

(declare-fun m!95629 () Bool)

(assert (=> d!23725 m!95629))

(declare-fun m!95631 () Bool)

(assert (=> b!89296 m!95631))

(assert (=> b!88951 d!23725))

(declare-fun d!23727 () Bool)

(declare-fun lt!42869 () Bool)

(assert (=> d!23727 (= lt!42869 (select (content!93 (toList!745 lt!42653)) lt!42383))))

(declare-fun e!58138 () Bool)

(assert (=> d!23727 (= lt!42869 e!58138)))

(declare-fun res!45657 () Bool)

(assert (=> d!23727 (=> (not res!45657) (not e!58138))))

(assert (=> d!23727 (= res!45657 ((_ is Cons!1532) (toList!745 lt!42653)))))

(assert (=> d!23727 (= (contains!760 (toList!745 lt!42653) lt!42383) lt!42869)))

(declare-fun b!89297 () Bool)

(declare-fun e!58139 () Bool)

(assert (=> b!89297 (= e!58138 e!58139)))

(declare-fun res!45658 () Bool)

(assert (=> b!89297 (=> res!45658 e!58139)))

(assert (=> b!89297 (= res!45658 (= (h!2124 (toList!745 lt!42653)) lt!42383))))

(declare-fun b!89298 () Bool)

(assert (=> b!89298 (= e!58139 (contains!760 (t!5285 (toList!745 lt!42653)) lt!42383))))

(assert (= (and d!23727 res!45657) b!89297))

(assert (= (and b!89297 (not res!45658)) b!89298))

(declare-fun m!95633 () Bool)

(assert (=> d!23727 m!95633))

(declare-fun m!95635 () Bool)

(assert (=> d!23727 m!95635))

(declare-fun m!95637 () Bool)

(assert (=> b!89298 m!95637))

(assert (=> b!88953 d!23727))

(declare-fun d!23729 () Bool)

(declare-fun e!58141 () Bool)

(assert (=> d!23729 e!58141))

(declare-fun res!45659 () Bool)

(assert (=> d!23729 (=> res!45659 e!58141)))

(declare-fun lt!42871 () Bool)

(assert (=> d!23729 (= res!45659 (not lt!42871))))

(declare-fun lt!42870 () Bool)

(assert (=> d!23729 (= lt!42871 lt!42870)))

(declare-fun lt!42873 () Unit!2638)

(declare-fun e!58140 () Unit!2638)

(assert (=> d!23729 (= lt!42873 e!58140)))

(declare-fun c!14831 () Bool)

(assert (=> d!23729 (= c!14831 lt!42870)))

(assert (=> d!23729 (= lt!42870 (containsKey!144 (toList!745 lt!42648) (_1!1121 lt!42383)))))

(assert (=> d!23729 (= (contains!759 lt!42648 (_1!1121 lt!42383)) lt!42871)))

(declare-fun b!89299 () Bool)

(declare-fun lt!42872 () Unit!2638)

(assert (=> b!89299 (= e!58140 lt!42872)))

(assert (=> b!89299 (= lt!42872 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42648) (_1!1121 lt!42383)))))

(assert (=> b!89299 (isDefined!94 (getValueByKey!140 (toList!745 lt!42648) (_1!1121 lt!42383)))))

(declare-fun b!89300 () Bool)

(declare-fun Unit!2654 () Unit!2638)

(assert (=> b!89300 (= e!58140 Unit!2654)))

(declare-fun b!89301 () Bool)

(assert (=> b!89301 (= e!58141 (isDefined!94 (getValueByKey!140 (toList!745 lt!42648) (_1!1121 lt!42383))))))

(assert (= (and d!23729 c!14831) b!89299))

(assert (= (and d!23729 (not c!14831)) b!89300))

(assert (= (and d!23729 (not res!45659)) b!89301))

(declare-fun m!95639 () Bool)

(assert (=> d!23729 m!95639))

(declare-fun m!95641 () Bool)

(assert (=> b!89299 m!95641))

(assert (=> b!89299 m!95153))

(assert (=> b!89299 m!95153))

(declare-fun m!95643 () Bool)

(assert (=> b!89299 m!95643))

(assert (=> b!89301 m!95153))

(assert (=> b!89301 m!95153))

(assert (=> b!89301 m!95643))

(assert (=> d!23617 d!23729))

(declare-fun b!89304 () Bool)

(declare-fun e!58143 () Option!146)

(assert (=> b!89304 (= e!58143 (getValueByKey!140 (t!5285 lt!42650) (_1!1121 lt!42383)))))

(declare-fun b!89302 () Bool)

(declare-fun e!58142 () Option!146)

(assert (=> b!89302 (= e!58142 (Some!145 (_2!1121 (h!2124 lt!42650))))))

(declare-fun d!23731 () Bool)

(declare-fun c!14832 () Bool)

(assert (=> d!23731 (= c!14832 (and ((_ is Cons!1532) lt!42650) (= (_1!1121 (h!2124 lt!42650)) (_1!1121 lt!42383))))))

(assert (=> d!23731 (= (getValueByKey!140 lt!42650 (_1!1121 lt!42383)) e!58142)))

(declare-fun b!89303 () Bool)

(assert (=> b!89303 (= e!58142 e!58143)))

(declare-fun c!14833 () Bool)

(assert (=> b!89303 (= c!14833 (and ((_ is Cons!1532) lt!42650) (not (= (_1!1121 (h!2124 lt!42650)) (_1!1121 lt!42383)))))))

(declare-fun b!89305 () Bool)

(assert (=> b!89305 (= e!58143 None!144)))

(assert (= (and d!23731 c!14832) b!89302))

(assert (= (and d!23731 (not c!14832)) b!89303))

(assert (= (and b!89303 c!14833) b!89304))

(assert (= (and b!89303 (not c!14833)) b!89305))

(declare-fun m!95645 () Bool)

(assert (=> b!89304 m!95645))

(assert (=> d!23617 d!23731))

(declare-fun d!23733 () Bool)

(assert (=> d!23733 (= (getValueByKey!140 lt!42650 (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383)))))

(declare-fun lt!42874 () Unit!2638)

(assert (=> d!23733 (= lt!42874 (choose!536 lt!42650 (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(declare-fun e!58144 () Bool)

(assert (=> d!23733 e!58144))

(declare-fun res!45660 () Bool)

(assert (=> d!23733 (=> (not res!45660) (not e!58144))))

(assert (=> d!23733 (= res!45660 (isStrictlySorted!295 lt!42650))))

(assert (=> d!23733 (= (lemmaContainsTupThenGetReturnValue!60 lt!42650 (_1!1121 lt!42383) (_2!1121 lt!42383)) lt!42874)))

(declare-fun b!89306 () Bool)

(declare-fun res!45661 () Bool)

(assert (=> b!89306 (=> (not res!45661) (not e!58144))))

(assert (=> b!89306 (= res!45661 (containsKey!144 lt!42650 (_1!1121 lt!42383)))))

(declare-fun b!89307 () Bool)

(assert (=> b!89307 (= e!58144 (contains!760 lt!42650 (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383))))))

(assert (= (and d!23733 res!45660) b!89306))

(assert (= (and b!89306 res!45661) b!89307))

(assert (=> d!23733 m!95147))

(declare-fun m!95647 () Bool)

(assert (=> d!23733 m!95647))

(declare-fun m!95649 () Bool)

(assert (=> d!23733 m!95649))

(declare-fun m!95651 () Bool)

(assert (=> b!89306 m!95651))

(declare-fun m!95653 () Bool)

(assert (=> b!89307 m!95653))

(assert (=> d!23617 d!23733))

(declare-fun b!89308 () Bool)

(declare-fun e!58147 () List!1536)

(declare-fun call!8674 () List!1536)

(assert (=> b!89308 (= e!58147 call!8674)))

(declare-fun b!89309 () Bool)

(declare-fun c!14836 () Bool)

(assert (=> b!89309 (= c!14836 (and ((_ is Cons!1532) (toList!745 lt!42384)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42384))) (_1!1121 lt!42383))))))

(declare-fun e!58146 () List!1536)

(assert (=> b!89309 (= e!58147 e!58146)))

(declare-fun b!89310 () Bool)

(declare-fun call!8676 () List!1536)

(assert (=> b!89310 (= e!58146 call!8676)))

(declare-fun b!89311 () Bool)

(declare-fun e!58149 () Bool)

(declare-fun lt!42875 () List!1536)

(assert (=> b!89311 (= e!58149 (contains!760 lt!42875 (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383))))))

(declare-fun bm!8671 () Bool)

(declare-fun call!8675 () List!1536)

(assert (=> bm!8671 (= call!8674 call!8675)))

(declare-fun bm!8672 () Bool)

(assert (=> bm!8672 (= call!8676 call!8674)))

(declare-fun e!58148 () List!1536)

(declare-fun c!14835 () Bool)

(declare-fun b!89312 () Bool)

(assert (=> b!89312 (= e!58148 (ite c!14835 (t!5285 (toList!745 lt!42384)) (ite c!14836 (Cons!1532 (h!2124 (toList!745 lt!42384)) (t!5285 (toList!745 lt!42384))) Nil!1533)))))

(declare-fun b!89313 () Bool)

(declare-fun e!58145 () List!1536)

(assert (=> b!89313 (= e!58145 call!8675)))

(declare-fun b!89314 () Bool)

(assert (=> b!89314 (= e!58145 e!58147)))

(assert (=> b!89314 (= c!14835 (and ((_ is Cons!1532) (toList!745 lt!42384)) (= (_1!1121 (h!2124 (toList!745 lt!42384))) (_1!1121 lt!42383))))))

(declare-fun bm!8673 () Bool)

(declare-fun c!14837 () Bool)

(assert (=> bm!8673 (= call!8675 ($colon$colon!73 e!58148 (ite c!14837 (h!2124 (toList!745 lt!42384)) (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383)))))))

(declare-fun c!14834 () Bool)

(assert (=> bm!8673 (= c!14834 c!14837)))

(declare-fun b!89315 () Bool)

(declare-fun res!45662 () Bool)

(assert (=> b!89315 (=> (not res!45662) (not e!58149))))

(assert (=> b!89315 (= res!45662 (containsKey!144 lt!42875 (_1!1121 lt!42383)))))

(declare-fun d!23735 () Bool)

(assert (=> d!23735 e!58149))

(declare-fun res!45663 () Bool)

(assert (=> d!23735 (=> (not res!45663) (not e!58149))))

(assert (=> d!23735 (= res!45663 (isStrictlySorted!295 lt!42875))))

(assert (=> d!23735 (= lt!42875 e!58145)))

(assert (=> d!23735 (= c!14837 (and ((_ is Cons!1532) (toList!745 lt!42384)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42384))) (_1!1121 lt!42383))))))

(assert (=> d!23735 (isStrictlySorted!295 (toList!745 lt!42384))))

(assert (=> d!23735 (= (insertStrictlySorted!63 (toList!745 lt!42384) (_1!1121 lt!42383) (_2!1121 lt!42383)) lt!42875)))

(declare-fun b!89316 () Bool)

(assert (=> b!89316 (= e!58146 call!8676)))

(declare-fun b!89317 () Bool)

(assert (=> b!89317 (= e!58148 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42384)) (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (= (and d!23735 c!14837) b!89313))

(assert (= (and d!23735 (not c!14837)) b!89314))

(assert (= (and b!89314 c!14835) b!89308))

(assert (= (and b!89314 (not c!14835)) b!89309))

(assert (= (and b!89309 c!14836) b!89316))

(assert (= (and b!89309 (not c!14836)) b!89310))

(assert (= (or b!89316 b!89310) bm!8672))

(assert (= (or b!89308 bm!8672) bm!8671))

(assert (= (or b!89313 bm!8671) bm!8673))

(assert (= (and bm!8673 c!14834) b!89317))

(assert (= (and bm!8673 (not c!14834)) b!89312))

(assert (= (and d!23735 res!45663) b!89315))

(assert (= (and b!89315 res!45662) b!89311))

(declare-fun m!95655 () Bool)

(assert (=> d!23735 m!95655))

(declare-fun m!95657 () Bool)

(assert (=> d!23735 m!95657))

(declare-fun m!95659 () Bool)

(assert (=> b!89317 m!95659))

(declare-fun m!95661 () Bool)

(assert (=> bm!8673 m!95661))

(declare-fun m!95663 () Bool)

(assert (=> b!89315 m!95663))

(declare-fun m!95665 () Bool)

(assert (=> b!89311 m!95665))

(assert (=> d!23617 d!23735))

(declare-fun b!89320 () Bool)

(declare-fun e!58151 () Option!146)

(assert (=> b!89320 (= e!58151 (getValueByKey!140 (t!5285 (toList!745 lt!42628)) (_1!1121 lt!42377)))))

(declare-fun b!89318 () Bool)

(declare-fun e!58150 () Option!146)

(assert (=> b!89318 (= e!58150 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42628)))))))

(declare-fun d!23737 () Bool)

(declare-fun c!14838 () Bool)

(assert (=> d!23737 (= c!14838 (and ((_ is Cons!1532) (toList!745 lt!42628)) (= (_1!1121 (h!2124 (toList!745 lt!42628))) (_1!1121 lt!42377))))))

(assert (=> d!23737 (= (getValueByKey!140 (toList!745 lt!42628) (_1!1121 lt!42377)) e!58150)))

(declare-fun b!89319 () Bool)

(assert (=> b!89319 (= e!58150 e!58151)))

(declare-fun c!14839 () Bool)

(assert (=> b!89319 (= c!14839 (and ((_ is Cons!1532) (toList!745 lt!42628)) (not (= (_1!1121 (h!2124 (toList!745 lt!42628))) (_1!1121 lt!42377)))))))

(declare-fun b!89321 () Bool)

(assert (=> b!89321 (= e!58151 None!144)))

(assert (= (and d!23737 c!14838) b!89318))

(assert (= (and d!23737 (not c!14838)) b!89319))

(assert (= (and b!89319 c!14839) b!89320))

(assert (= (and b!89319 (not c!14839)) b!89321))

(declare-fun m!95667 () Bool)

(assert (=> b!89320 m!95667))

(assert (=> b!88940 d!23737))

(declare-fun d!23739 () Bool)

(declare-fun e!58153 () Bool)

(assert (=> d!23739 e!58153))

(declare-fun res!45664 () Bool)

(assert (=> d!23739 (=> res!45664 e!58153)))

(declare-fun lt!42877 () Bool)

(assert (=> d!23739 (= res!45664 (not lt!42877))))

(declare-fun lt!42876 () Bool)

(assert (=> d!23739 (= lt!42877 lt!42876)))

(declare-fun lt!42879 () Unit!2638)

(declare-fun e!58152 () Unit!2638)

(assert (=> d!23739 (= lt!42879 e!58152)))

(declare-fun c!14840 () Bool)

(assert (=> d!23739 (= c!14840 lt!42876)))

(assert (=> d!23739 (= lt!42876 (containsKey!144 (toList!745 lt!42653) (_1!1121 lt!42383)))))

(assert (=> d!23739 (= (contains!759 lt!42653 (_1!1121 lt!42383)) lt!42877)))

(declare-fun b!89322 () Bool)

(declare-fun lt!42878 () Unit!2638)

(assert (=> b!89322 (= e!58152 lt!42878)))

(assert (=> b!89322 (= lt!42878 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42653) (_1!1121 lt!42383)))))

(assert (=> b!89322 (isDefined!94 (getValueByKey!140 (toList!745 lt!42653) (_1!1121 lt!42383)))))

(declare-fun b!89323 () Bool)

(declare-fun Unit!2655 () Unit!2638)

(assert (=> b!89323 (= e!58152 Unit!2655)))

(declare-fun b!89324 () Bool)

(assert (=> b!89324 (= e!58153 (isDefined!94 (getValueByKey!140 (toList!745 lt!42653) (_1!1121 lt!42383))))))

(assert (= (and d!23739 c!14840) b!89322))

(assert (= (and d!23739 (not c!14840)) b!89323))

(assert (= (and d!23739 (not res!45664)) b!89324))

(declare-fun m!95669 () Bool)

(assert (=> d!23739 m!95669))

(declare-fun m!95671 () Bool)

(assert (=> b!89322 m!95671))

(assert (=> b!89322 m!95175))

(assert (=> b!89322 m!95175))

(declare-fun m!95673 () Bool)

(assert (=> b!89322 m!95673))

(assert (=> b!89324 m!95175))

(assert (=> b!89324 m!95175))

(assert (=> b!89324 m!95673))

(assert (=> d!23623 d!23739))

(declare-fun b!89327 () Bool)

(declare-fun e!58155 () Option!146)

(assert (=> b!89327 (= e!58155 (getValueByKey!140 (t!5285 lt!42655) (_1!1121 lt!42383)))))

(declare-fun b!89325 () Bool)

(declare-fun e!58154 () Option!146)

(assert (=> b!89325 (= e!58154 (Some!145 (_2!1121 (h!2124 lt!42655))))))

(declare-fun d!23741 () Bool)

(declare-fun c!14841 () Bool)

(assert (=> d!23741 (= c!14841 (and ((_ is Cons!1532) lt!42655) (= (_1!1121 (h!2124 lt!42655)) (_1!1121 lt!42383))))))

(assert (=> d!23741 (= (getValueByKey!140 lt!42655 (_1!1121 lt!42383)) e!58154)))

(declare-fun b!89326 () Bool)

(assert (=> b!89326 (= e!58154 e!58155)))

(declare-fun c!14842 () Bool)

(assert (=> b!89326 (= c!14842 (and ((_ is Cons!1532) lt!42655) (not (= (_1!1121 (h!2124 lt!42655)) (_1!1121 lt!42383)))))))

(declare-fun b!89328 () Bool)

(assert (=> b!89328 (= e!58155 None!144)))

(assert (= (and d!23741 c!14841) b!89325))

(assert (= (and d!23741 (not c!14841)) b!89326))

(assert (= (and b!89326 c!14842) b!89327))

(assert (= (and b!89326 (not c!14842)) b!89328))

(declare-fun m!95675 () Bool)

(assert (=> b!89327 m!95675))

(assert (=> d!23623 d!23741))

(declare-fun d!23743 () Bool)

(assert (=> d!23743 (= (getValueByKey!140 lt!42655 (_1!1121 lt!42383)) (Some!145 (_2!1121 lt!42383)))))

(declare-fun lt!42880 () Unit!2638)

(assert (=> d!23743 (= lt!42880 (choose!536 lt!42655 (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(declare-fun e!58156 () Bool)

(assert (=> d!23743 e!58156))

(declare-fun res!45665 () Bool)

(assert (=> d!23743 (=> (not res!45665) (not e!58156))))

(assert (=> d!23743 (= res!45665 (isStrictlySorted!295 lt!42655))))

(assert (=> d!23743 (= (lemmaContainsTupThenGetReturnValue!60 lt!42655 (_1!1121 lt!42383) (_2!1121 lt!42383)) lt!42880)))

(declare-fun b!89329 () Bool)

(declare-fun res!45666 () Bool)

(assert (=> b!89329 (=> (not res!45666) (not e!58156))))

(assert (=> b!89329 (= res!45666 (containsKey!144 lt!42655 (_1!1121 lt!42383)))))

(declare-fun b!89330 () Bool)

(assert (=> b!89330 (= e!58156 (contains!760 lt!42655 (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383))))))

(assert (= (and d!23743 res!45665) b!89329))

(assert (= (and b!89329 res!45666) b!89330))

(assert (=> d!23743 m!95169))

(declare-fun m!95677 () Bool)

(assert (=> d!23743 m!95677))

(declare-fun m!95679 () Bool)

(assert (=> d!23743 m!95679))

(declare-fun m!95681 () Bool)

(assert (=> b!89329 m!95681))

(declare-fun m!95683 () Bool)

(assert (=> b!89330 m!95683))

(assert (=> d!23623 d!23743))

(declare-fun b!89331 () Bool)

(declare-fun e!58159 () List!1536)

(declare-fun call!8677 () List!1536)

(assert (=> b!89331 (= e!58159 call!8677)))

(declare-fun b!89332 () Bool)

(declare-fun c!14845 () Bool)

(assert (=> b!89332 (= c!14845 (and ((_ is Cons!1532) (toList!745 lt!42376)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42383))))))

(declare-fun e!58158 () List!1536)

(assert (=> b!89332 (= e!58159 e!58158)))

(declare-fun b!89333 () Bool)

(declare-fun call!8679 () List!1536)

(assert (=> b!89333 (= e!58158 call!8679)))

(declare-fun b!89334 () Bool)

(declare-fun e!58161 () Bool)

(declare-fun lt!42881 () List!1536)

(assert (=> b!89334 (= e!58161 (contains!760 lt!42881 (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383))))))

(declare-fun bm!8674 () Bool)

(declare-fun call!8678 () List!1536)

(assert (=> bm!8674 (= call!8677 call!8678)))

(declare-fun bm!8675 () Bool)

(assert (=> bm!8675 (= call!8679 call!8677)))

(declare-fun c!14844 () Bool)

(declare-fun b!89335 () Bool)

(declare-fun e!58160 () List!1536)

(assert (=> b!89335 (= e!58160 (ite c!14844 (t!5285 (toList!745 lt!42376)) (ite c!14845 (Cons!1532 (h!2124 (toList!745 lt!42376)) (t!5285 (toList!745 lt!42376))) Nil!1533)))))

(declare-fun b!89336 () Bool)

(declare-fun e!58157 () List!1536)

(assert (=> b!89336 (= e!58157 call!8678)))

(declare-fun b!89337 () Bool)

(assert (=> b!89337 (= e!58157 e!58159)))

(assert (=> b!89337 (= c!14844 (and ((_ is Cons!1532) (toList!745 lt!42376)) (= (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42383))))))

(declare-fun bm!8676 () Bool)

(declare-fun c!14846 () Bool)

(assert (=> bm!8676 (= call!8678 ($colon$colon!73 e!58160 (ite c!14846 (h!2124 (toList!745 lt!42376)) (tuple2!2221 (_1!1121 lt!42383) (_2!1121 lt!42383)))))))

(declare-fun c!14843 () Bool)

(assert (=> bm!8676 (= c!14843 c!14846)))

(declare-fun b!89338 () Bool)

(declare-fun res!45667 () Bool)

(assert (=> b!89338 (=> (not res!45667) (not e!58161))))

(assert (=> b!89338 (= res!45667 (containsKey!144 lt!42881 (_1!1121 lt!42383)))))

(declare-fun d!23745 () Bool)

(assert (=> d!23745 e!58161))

(declare-fun res!45668 () Bool)

(assert (=> d!23745 (=> (not res!45668) (not e!58161))))

(assert (=> d!23745 (= res!45668 (isStrictlySorted!295 lt!42881))))

(assert (=> d!23745 (= lt!42881 e!58157)))

(assert (=> d!23745 (= c!14846 (and ((_ is Cons!1532) (toList!745 lt!42376)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42383))))))

(assert (=> d!23745 (isStrictlySorted!295 (toList!745 lt!42376))))

(assert (=> d!23745 (= (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 lt!42383) (_2!1121 lt!42383)) lt!42881)))

(declare-fun b!89339 () Bool)

(assert (=> b!89339 (= e!58158 call!8679)))

(declare-fun b!89340 () Bool)

(assert (=> b!89340 (= e!58160 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42376)) (_1!1121 lt!42383) (_2!1121 lt!42383)))))

(assert (= (and d!23745 c!14846) b!89336))

(assert (= (and d!23745 (not c!14846)) b!89337))

(assert (= (and b!89337 c!14844) b!89331))

(assert (= (and b!89337 (not c!14844)) b!89332))

(assert (= (and b!89332 c!14845) b!89339))

(assert (= (and b!89332 (not c!14845)) b!89333))

(assert (= (or b!89339 b!89333) bm!8675))

(assert (= (or b!89331 bm!8675) bm!8674))

(assert (= (or b!89336 bm!8674) bm!8676))

(assert (= (and bm!8676 c!14843) b!89340))

(assert (= (and bm!8676 (not c!14843)) b!89335))

(assert (= (and d!23745 res!45668) b!89338))

(assert (= (and b!89338 res!45667) b!89334))

(declare-fun m!95685 () Bool)

(assert (=> d!23745 m!95685))

(declare-fun m!95687 () Bool)

(assert (=> d!23745 m!95687))

(declare-fun m!95689 () Bool)

(assert (=> b!89340 m!95689))

(declare-fun m!95691 () Bool)

(assert (=> bm!8676 m!95691))

(declare-fun m!95693 () Bool)

(assert (=> b!89338 m!95693))

(declare-fun m!95695 () Bool)

(assert (=> b!89334 m!95695))

(assert (=> d!23623 d!23745))

(declare-fun d!23747 () Bool)

(declare-fun e!58162 () Bool)

(assert (=> d!23747 e!58162))

(declare-fun res!45669 () Bool)

(assert (=> d!23747 (=> (not res!45669) (not e!58162))))

(declare-fun lt!42883 () ListLongMap!1459)

(assert (=> d!23747 (= res!45669 (contains!759 lt!42883 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun lt!42885 () List!1536)

(assert (=> d!23747 (= lt!42883 (ListLongMap!1460 lt!42885))))

(declare-fun lt!42884 () Unit!2638)

(declare-fun lt!42882 () Unit!2638)

(assert (=> d!23747 (= lt!42884 lt!42882)))

(assert (=> d!23747 (= (getValueByKey!140 lt!42885 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23747 (= lt!42882 (lemmaContainsTupThenGetReturnValue!60 lt!42885 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23747 (= lt!42885 (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23747 (= (+!111 lt!42379 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) lt!42883)))

(declare-fun b!89341 () Bool)

(declare-fun res!45670 () Bool)

(assert (=> b!89341 (=> (not res!45670) (not e!58162))))

(assert (=> b!89341 (= res!45670 (= (getValueByKey!140 (toList!745 lt!42883) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun b!89342 () Bool)

(assert (=> b!89342 (= e!58162 (contains!760 (toList!745 lt!42883) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (= (and d!23747 res!45669) b!89341))

(assert (= (and b!89341 res!45670) b!89342))

(declare-fun m!95697 () Bool)

(assert (=> d!23747 m!95697))

(declare-fun m!95699 () Bool)

(assert (=> d!23747 m!95699))

(declare-fun m!95701 () Bool)

(assert (=> d!23747 m!95701))

(declare-fun m!95703 () Bool)

(assert (=> d!23747 m!95703))

(declare-fun m!95705 () Bool)

(assert (=> b!89341 m!95705))

(declare-fun m!95707 () Bool)

(assert (=> b!89342 m!95707))

(assert (=> d!23603 d!23747))

(declare-fun d!23749 () Bool)

(declare-fun e!58163 () Bool)

(assert (=> d!23749 e!58163))

(declare-fun res!45671 () Bool)

(assert (=> d!23749 (=> (not res!45671) (not e!58163))))

(declare-fun lt!42887 () ListLongMap!1459)

(assert (=> d!23749 (= res!45671 (contains!759 lt!42887 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun lt!42889 () List!1536)

(assert (=> d!23749 (= lt!42887 (ListLongMap!1460 lt!42889))))

(declare-fun lt!42888 () Unit!2638)

(declare-fun lt!42886 () Unit!2638)

(assert (=> d!23749 (= lt!42888 lt!42886)))

(assert (=> d!23749 (= (getValueByKey!140 lt!42889 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23749 (= lt!42886 (lemmaContainsTupThenGetReturnValue!60 lt!42889 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23749 (= lt!42889 (insertStrictlySorted!63 (toList!745 (+!111 lt!42379 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23749 (= (+!111 (+!111 lt!42379 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) lt!42887)))

(declare-fun b!89343 () Bool)

(declare-fun res!45672 () Bool)

(assert (=> b!89343 (=> (not res!45672) (not e!58163))))

(assert (=> b!89343 (= res!45672 (= (getValueByKey!140 (toList!745 lt!42887) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun b!89344 () Bool)

(assert (=> b!89344 (= e!58163 (contains!760 (toList!745 lt!42887) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (= (and d!23749 res!45671) b!89343))

(assert (= (and b!89343 res!45672) b!89344))

(declare-fun m!95709 () Bool)

(assert (=> d!23749 m!95709))

(declare-fun m!95711 () Bool)

(assert (=> d!23749 m!95711))

(declare-fun m!95713 () Bool)

(assert (=> d!23749 m!95713))

(declare-fun m!95715 () Bool)

(assert (=> d!23749 m!95715))

(declare-fun m!95717 () Bool)

(assert (=> b!89343 m!95717))

(declare-fun m!95719 () Bool)

(assert (=> b!89344 m!95719))

(assert (=> d!23603 d!23749))

(declare-fun d!23751 () Bool)

(declare-fun e!58164 () Bool)

(assert (=> d!23751 e!58164))

(declare-fun res!45673 () Bool)

(assert (=> d!23751 (=> (not res!45673) (not e!58164))))

(declare-fun lt!42891 () ListLongMap!1459)

(assert (=> d!23751 (= res!45673 (contains!759 lt!42891 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!42893 () List!1536)

(assert (=> d!23751 (= lt!42891 (ListLongMap!1460 lt!42893))))

(declare-fun lt!42892 () Unit!2638)

(declare-fun lt!42890 () Unit!2638)

(assert (=> d!23751 (= lt!42892 lt!42890)))

(assert (=> d!23751 (= (getValueByKey!140 lt!42893 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23751 (= lt!42890 (lemmaContainsTupThenGetReturnValue!60 lt!42893 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23751 (= lt!42893 (insertStrictlySorted!63 (toList!745 (+!111 lt!42379 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23751 (= (+!111 (+!111 lt!42379 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42891)))

(declare-fun b!89345 () Bool)

(declare-fun res!45674 () Bool)

(assert (=> b!89345 (=> (not res!45674) (not e!58164))))

(assert (=> b!89345 (= res!45674 (= (getValueByKey!140 (toList!745 lt!42891) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89346 () Bool)

(assert (=> b!89346 (= e!58164 (contains!760 (toList!745 lt!42891) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23751 res!45673) b!89345))

(assert (= (and b!89345 res!45674) b!89346))

(declare-fun m!95721 () Bool)

(assert (=> d!23751 m!95721))

(declare-fun m!95723 () Bool)

(assert (=> d!23751 m!95723))

(declare-fun m!95725 () Bool)

(assert (=> d!23751 m!95725))

(declare-fun m!95727 () Bool)

(assert (=> d!23751 m!95727))

(declare-fun m!95729 () Bool)

(assert (=> b!89345 m!95729))

(declare-fun m!95731 () Bool)

(assert (=> b!89346 m!95731))

(assert (=> d!23603 d!23751))

(declare-fun d!23753 () Bool)

(assert (=> d!23753 (= (+!111 (+!111 lt!42379 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (+!111 (+!111 lt!42379 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (=> d!23753 true))

(declare-fun _$28!150 () Unit!2638)

(assert (=> d!23753 (= (choose!533 lt!42379 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))) _$28!150)))

(declare-fun bs!3745 () Bool)

(assert (= bs!3745 d!23753))

(assert (=> bs!3745 m!95049))

(assert (=> bs!3745 m!95049))

(assert (=> bs!3745 m!95051))

(assert (=> bs!3745 m!95047))

(assert (=> bs!3745 m!95047))

(assert (=> bs!3745 m!95053))

(assert (=> d!23603 d!23753))

(declare-fun d!23755 () Bool)

(declare-fun e!58165 () Bool)

(assert (=> d!23755 e!58165))

(declare-fun res!45675 () Bool)

(assert (=> d!23755 (=> (not res!45675) (not e!58165))))

(declare-fun lt!42895 () ListLongMap!1459)

(assert (=> d!23755 (= res!45675 (contains!759 lt!42895 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!42897 () List!1536)

(assert (=> d!23755 (= lt!42895 (ListLongMap!1460 lt!42897))))

(declare-fun lt!42896 () Unit!2638)

(declare-fun lt!42894 () Unit!2638)

(assert (=> d!23755 (= lt!42896 lt!42894)))

(assert (=> d!23755 (= (getValueByKey!140 lt!42897 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23755 (= lt!42894 (lemmaContainsTupThenGetReturnValue!60 lt!42897 (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23755 (= lt!42897 (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23755 (= (+!111 lt!42379 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42895)))

(declare-fun b!89347 () Bool)

(declare-fun res!45676 () Bool)

(assert (=> b!89347 (=> (not res!45676) (not e!58165))))

(assert (=> b!89347 (= res!45676 (= (getValueByKey!140 (toList!745 lt!42895) (_1!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89348 () Bool)

(assert (=> b!89348 (= e!58165 (contains!760 (toList!745 lt!42895) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23755 res!45675) b!89347))

(assert (= (and b!89347 res!45676) b!89348))

(declare-fun m!95733 () Bool)

(assert (=> d!23755 m!95733))

(declare-fun m!95735 () Bool)

(assert (=> d!23755 m!95735))

(declare-fun m!95737 () Bool)

(assert (=> d!23755 m!95737))

(declare-fun m!95739 () Bool)

(assert (=> d!23755 m!95739))

(declare-fun m!95741 () Bool)

(assert (=> b!89347 m!95741))

(declare-fun m!95743 () Bool)

(assert (=> b!89348 m!95743))

(assert (=> d!23603 d!23755))

(declare-fun b!89351 () Bool)

(declare-fun e!58167 () Option!146)

(assert (=> b!89351 (= e!58167 (getValueByKey!140 (t!5285 (toList!745 lt!42632)) (_1!1121 lt!42391)))))

(declare-fun b!89349 () Bool)

(declare-fun e!58166 () Option!146)

(assert (=> b!89349 (= e!58166 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42632)))))))

(declare-fun d!23757 () Bool)

(declare-fun c!14847 () Bool)

(assert (=> d!23757 (= c!14847 (and ((_ is Cons!1532) (toList!745 lt!42632)) (= (_1!1121 (h!2124 (toList!745 lt!42632))) (_1!1121 lt!42391))))))

(assert (=> d!23757 (= (getValueByKey!140 (toList!745 lt!42632) (_1!1121 lt!42391)) e!58166)))

(declare-fun b!89350 () Bool)

(assert (=> b!89350 (= e!58166 e!58167)))

(declare-fun c!14848 () Bool)

(assert (=> b!89350 (= c!14848 (and ((_ is Cons!1532) (toList!745 lt!42632)) (not (= (_1!1121 (h!2124 (toList!745 lt!42632))) (_1!1121 lt!42391)))))))

(declare-fun b!89352 () Bool)

(assert (=> b!89352 (= e!58167 None!144)))

(assert (= (and d!23757 c!14847) b!89349))

(assert (= (and d!23757 (not c!14847)) b!89350))

(assert (= (and b!89350 c!14848) b!89351))

(assert (= (and b!89350 (not c!14848)) b!89352))

(declare-fun m!95745 () Bool)

(assert (=> b!89351 m!95745))

(assert (=> b!88942 d!23757))

(declare-fun d!23759 () Bool)

(assert (=> d!23759 (not (contains!759 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617)) lt!42612))))

(declare-fun lt!42900 () Unit!2638)

(declare-fun choose!537 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> d!23759 (= lt!42900 (choose!537 lt!42614 lt!42615 lt!42617 lt!42612))))

(declare-fun e!58170 () Bool)

(assert (=> d!23759 e!58170))

(declare-fun res!45679 () Bool)

(assert (=> d!23759 (=> (not res!45679) (not e!58170))))

(assert (=> d!23759 (= res!45679 (not (contains!759 lt!42614 lt!42612)))))

(assert (=> d!23759 (= (addStillNotContains!34 lt!42614 lt!42615 lt!42617 lt!42612) lt!42900)))

(declare-fun b!89356 () Bool)

(assert (=> b!89356 (= e!58170 (not (= lt!42615 lt!42612)))))

(assert (= (and d!23759 res!45679) b!89356))

(assert (=> d!23759 m!95069))

(assert (=> d!23759 m!95069))

(assert (=> d!23759 m!95071))

(declare-fun m!95747 () Bool)

(assert (=> d!23759 m!95747))

(declare-fun m!95749 () Bool)

(assert (=> d!23759 m!95749))

(assert (=> b!88924 d!23759))

(declare-fun d!23761 () Bool)

(declare-fun c!14849 () Bool)

(assert (=> d!23761 (= c!14849 ((_ is ValueCellFull!929) (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!58171 () V!3041)

(assert (=> d!23761 (= (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!58171)))

(declare-fun b!89357 () Bool)

(assert (=> b!89357 (= e!58171 (get!1215 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89358 () Bool)

(assert (=> b!89358 (= e!58171 (get!1216 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23761 c!14849) b!89357))

(assert (= (and d!23761 (not c!14849)) b!89358))

(assert (=> b!89357 m!95065))

(assert (=> b!89357 m!94783))

(declare-fun m!95751 () Bool)

(assert (=> b!89357 m!95751))

(assert (=> b!89358 m!95065))

(assert (=> b!89358 m!94783))

(declare-fun m!95753 () Bool)

(assert (=> b!89358 m!95753))

(assert (=> b!88924 d!23761))

(declare-fun d!23763 () Bool)

(declare-fun e!58172 () Bool)

(assert (=> d!23763 e!58172))

(declare-fun res!45680 () Bool)

(assert (=> d!23763 (=> (not res!45680) (not e!58172))))

(declare-fun lt!42902 () ListLongMap!1459)

(assert (=> d!23763 (= res!45680 (contains!759 lt!42902 (_1!1121 (tuple2!2221 lt!42615 lt!42617))))))

(declare-fun lt!42904 () List!1536)

(assert (=> d!23763 (= lt!42902 (ListLongMap!1460 lt!42904))))

(declare-fun lt!42903 () Unit!2638)

(declare-fun lt!42901 () Unit!2638)

(assert (=> d!23763 (= lt!42903 lt!42901)))

(assert (=> d!23763 (= (getValueByKey!140 lt!42904 (_1!1121 (tuple2!2221 lt!42615 lt!42617))) (Some!145 (_2!1121 (tuple2!2221 lt!42615 lt!42617))))))

(assert (=> d!23763 (= lt!42901 (lemmaContainsTupThenGetReturnValue!60 lt!42904 (_1!1121 (tuple2!2221 lt!42615 lt!42617)) (_2!1121 (tuple2!2221 lt!42615 lt!42617))))))

(assert (=> d!23763 (= lt!42904 (insertStrictlySorted!63 (toList!745 lt!42614) (_1!1121 (tuple2!2221 lt!42615 lt!42617)) (_2!1121 (tuple2!2221 lt!42615 lt!42617))))))

(assert (=> d!23763 (= (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617)) lt!42902)))

(declare-fun b!89359 () Bool)

(declare-fun res!45681 () Bool)

(assert (=> b!89359 (=> (not res!45681) (not e!58172))))

(assert (=> b!89359 (= res!45681 (= (getValueByKey!140 (toList!745 lt!42902) (_1!1121 (tuple2!2221 lt!42615 lt!42617))) (Some!145 (_2!1121 (tuple2!2221 lt!42615 lt!42617)))))))

(declare-fun b!89360 () Bool)

(assert (=> b!89360 (= e!58172 (contains!760 (toList!745 lt!42902) (tuple2!2221 lt!42615 lt!42617)))))

(assert (= (and d!23763 res!45680) b!89359))

(assert (= (and b!89359 res!45681) b!89360))

(declare-fun m!95755 () Bool)

(assert (=> d!23763 m!95755))

(declare-fun m!95757 () Bool)

(assert (=> d!23763 m!95757))

(declare-fun m!95759 () Bool)

(assert (=> d!23763 m!95759))

(declare-fun m!95761 () Bool)

(assert (=> d!23763 m!95761))

(declare-fun m!95763 () Bool)

(assert (=> b!89359 m!95763))

(declare-fun m!95765 () Bool)

(assert (=> b!89360 m!95765))

(assert (=> b!88924 d!23763))

(declare-fun d!23765 () Bool)

(declare-fun e!58173 () Bool)

(assert (=> d!23765 e!58173))

(declare-fun res!45682 () Bool)

(assert (=> d!23765 (=> (not res!45682) (not e!58173))))

(declare-fun lt!42906 () ListLongMap!1459)

(assert (=> d!23765 (= res!45682 (contains!759 lt!42906 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!42908 () List!1536)

(assert (=> d!23765 (= lt!42906 (ListLongMap!1460 lt!42908))))

(declare-fun lt!42907 () Unit!2638)

(declare-fun lt!42905 () Unit!2638)

(assert (=> d!23765 (= lt!42907 lt!42905)))

(assert (=> d!23765 (= (getValueByKey!140 lt!42908 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23765 (= lt!42905 (lemmaContainsTupThenGetReturnValue!60 lt!42908 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23765 (= lt!42908 (insertStrictlySorted!63 (toList!745 call!8609) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23765 (= (+!111 call!8609 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!42906)))

(declare-fun b!89361 () Bool)

(declare-fun res!45683 () Bool)

(assert (=> b!89361 (=> (not res!45683) (not e!58173))))

(assert (=> b!89361 (= res!45683 (= (getValueByKey!140 (toList!745 lt!42906) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!89362 () Bool)

(assert (=> b!89362 (= e!58173 (contains!760 (toList!745 lt!42906) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1214 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!23765 res!45682) b!89361))

(assert (= (and b!89361 res!45683) b!89362))

(declare-fun m!95767 () Bool)

(assert (=> d!23765 m!95767))

(declare-fun m!95769 () Bool)

(assert (=> d!23765 m!95769))

(declare-fun m!95771 () Bool)

(assert (=> d!23765 m!95771))

(declare-fun m!95773 () Bool)

(assert (=> d!23765 m!95773))

(declare-fun m!95775 () Bool)

(assert (=> b!89361 m!95775))

(declare-fun m!95777 () Bool)

(assert (=> b!89362 m!95777))

(assert (=> b!88924 d!23765))

(declare-fun d!23767 () Bool)

(declare-fun e!58175 () Bool)

(assert (=> d!23767 e!58175))

(declare-fun res!45684 () Bool)

(assert (=> d!23767 (=> res!45684 e!58175)))

(declare-fun lt!42910 () Bool)

(assert (=> d!23767 (= res!45684 (not lt!42910))))

(declare-fun lt!42909 () Bool)

(assert (=> d!23767 (= lt!42910 lt!42909)))

(declare-fun lt!42912 () Unit!2638)

(declare-fun e!58174 () Unit!2638)

(assert (=> d!23767 (= lt!42912 e!58174)))

(declare-fun c!14850 () Bool)

(assert (=> d!23767 (= c!14850 lt!42909)))

(assert (=> d!23767 (= lt!42909 (containsKey!144 (toList!745 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617))) lt!42612))))

(assert (=> d!23767 (= (contains!759 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617)) lt!42612) lt!42910)))

(declare-fun b!89363 () Bool)

(declare-fun lt!42911 () Unit!2638)

(assert (=> b!89363 (= e!58174 lt!42911)))

(assert (=> b!89363 (= lt!42911 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617))) lt!42612))))

(assert (=> b!89363 (isDefined!94 (getValueByKey!140 (toList!745 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617))) lt!42612))))

(declare-fun b!89364 () Bool)

(declare-fun Unit!2656 () Unit!2638)

(assert (=> b!89364 (= e!58174 Unit!2656)))

(declare-fun b!89365 () Bool)

(assert (=> b!89365 (= e!58175 (isDefined!94 (getValueByKey!140 (toList!745 (+!111 lt!42614 (tuple2!2221 lt!42615 lt!42617))) lt!42612)))))

(assert (= (and d!23767 c!14850) b!89363))

(assert (= (and d!23767 (not c!14850)) b!89364))

(assert (= (and d!23767 (not res!45684)) b!89365))

(declare-fun m!95779 () Bool)

(assert (=> d!23767 m!95779))

(declare-fun m!95781 () Bool)

(assert (=> b!89363 m!95781))

(declare-fun m!95783 () Bool)

(assert (=> b!89363 m!95783))

(assert (=> b!89363 m!95783))

(declare-fun m!95785 () Bool)

(assert (=> b!89363 m!95785))

(assert (=> b!89365 m!95783))

(assert (=> b!89365 m!95783))

(assert (=> b!89365 m!95785))

(assert (=> b!88924 d!23767))

(declare-fun d!23769 () Bool)

(declare-fun get!1217 (Option!146) V!3041)

(assert (=> d!23769 (= (apply!84 lt!42718 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1217 (getValueByKey!140 (toList!745 lt!42718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3746 () Bool)

(assert (= bs!3746 d!23769))

(declare-fun m!95787 () Bool)

(assert (=> bs!3746 m!95787))

(assert (=> bs!3746 m!95787))

(declare-fun m!95789 () Bool)

(assert (=> bs!3746 m!95789))

(assert (=> b!89049 d!23769))

(assert (=> d!23647 d!23721))

(declare-fun d!23771 () Bool)

(declare-fun e!58177 () Bool)

(assert (=> d!23771 e!58177))

(declare-fun res!45685 () Bool)

(assert (=> d!23771 (=> res!45685 e!58177)))

(declare-fun lt!42914 () Bool)

(assert (=> d!23771 (= res!45685 (not lt!42914))))

(declare-fun lt!42913 () Bool)

(assert (=> d!23771 (= lt!42914 lt!42913)))

(declare-fun lt!42916 () Unit!2638)

(declare-fun e!58176 () Unit!2638)

(assert (=> d!23771 (= lt!42916 e!58176)))

(declare-fun c!14851 () Bool)

(assert (=> d!23771 (= c!14851 lt!42913)))

(assert (=> d!23771 (= lt!42913 (containsKey!144 (toList!745 lt!42616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23771 (= (contains!759 lt!42616 #b0000000000000000000000000000000000000000000000000000000000000000) lt!42914)))

(declare-fun b!89366 () Bool)

(declare-fun lt!42915 () Unit!2638)

(assert (=> b!89366 (= e!58176 lt!42915)))

(assert (=> b!89366 (= lt!42915 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89366 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89367 () Bool)

(declare-fun Unit!2657 () Unit!2638)

(assert (=> b!89367 (= e!58176 Unit!2657)))

(declare-fun b!89368 () Bool)

(assert (=> b!89368 (= e!58177 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23771 c!14851) b!89366))

(assert (= (and d!23771 (not c!14851)) b!89367))

(assert (= (and d!23771 (not res!45685)) b!89368))

(declare-fun m!95791 () Bool)

(assert (=> d!23771 m!95791))

(declare-fun m!95793 () Bool)

(assert (=> b!89366 m!95793))

(declare-fun m!95795 () Bool)

(assert (=> b!89366 m!95795))

(assert (=> b!89366 m!95795))

(declare-fun m!95797 () Bool)

(assert (=> b!89366 m!95797))

(assert (=> b!89368 m!95795))

(assert (=> b!89368 m!95795))

(assert (=> b!89368 m!95797))

(assert (=> d!23605 d!23771))

(assert (=> d!23605 d!23621))

(assert (=> bm!8594 d!23707))

(declare-fun d!23773 () Bool)

(declare-fun e!58178 () Bool)

(assert (=> d!23773 e!58178))

(declare-fun res!45686 () Bool)

(assert (=> d!23773 (=> (not res!45686) (not e!58178))))

(declare-fun lt!42918 () ListLongMap!1459)

(assert (=> d!23773 (= res!45686 (contains!759 lt!42918 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!42920 () List!1536)

(assert (=> d!23773 (= lt!42918 (ListLongMap!1460 lt!42920))))

(declare-fun lt!42919 () Unit!2638)

(declare-fun lt!42917 () Unit!2638)

(assert (=> d!23773 (= lt!42919 lt!42917)))

(assert (=> d!23773 (= (getValueByKey!140 lt!42920 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23773 (= lt!42917 (lemmaContainsTupThenGetReturnValue!60 lt!42920 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23773 (= lt!42920 (insertStrictlySorted!63 (toList!745 (+!111 lt!42376 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23773 (= (+!111 (+!111 lt!42376 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42918)))

(declare-fun b!89369 () Bool)

(declare-fun res!45687 () Bool)

(assert (=> b!89369 (=> (not res!45687) (not e!58178))))

(assert (=> b!89369 (= res!45687 (= (getValueByKey!140 (toList!745 lt!42918) (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89370 () Bool)

(assert (=> b!89370 (= e!58178 (contains!760 (toList!745 lt!42918) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23773 res!45686) b!89369))

(assert (= (and b!89369 res!45687) b!89370))

(declare-fun m!95799 () Bool)

(assert (=> d!23773 m!95799))

(declare-fun m!95801 () Bool)

(assert (=> d!23773 m!95801))

(declare-fun m!95803 () Bool)

(assert (=> d!23773 m!95803))

(declare-fun m!95805 () Bool)

(assert (=> d!23773 m!95805))

(declare-fun m!95807 () Bool)

(assert (=> b!89369 m!95807))

(declare-fun m!95809 () Bool)

(assert (=> b!89370 m!95809))

(assert (=> d!23619 d!23773))

(declare-fun d!23775 () Bool)

(declare-fun e!58179 () Bool)

(assert (=> d!23775 e!58179))

(declare-fun res!45688 () Bool)

(assert (=> d!23775 (=> (not res!45688) (not e!58179))))

(declare-fun lt!42922 () ListLongMap!1459)

(assert (=> d!23775 (= res!45688 (contains!759 lt!42922 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun lt!42924 () List!1536)

(assert (=> d!23775 (= lt!42922 (ListLongMap!1460 lt!42924))))

(declare-fun lt!42923 () Unit!2638)

(declare-fun lt!42921 () Unit!2638)

(assert (=> d!23775 (= lt!42923 lt!42921)))

(assert (=> d!23775 (= (getValueByKey!140 lt!42924 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23775 (= lt!42921 (lemmaContainsTupThenGetReturnValue!60 lt!42924 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23775 (= lt!42924 (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23775 (= (+!111 lt!42376 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) lt!42922)))

(declare-fun b!89371 () Bool)

(declare-fun res!45689 () Bool)

(assert (=> b!89371 (=> (not res!45689) (not e!58179))))

(assert (=> b!89371 (= res!45689 (= (getValueByKey!140 (toList!745 lt!42922) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun b!89372 () Bool)

(assert (=> b!89372 (= e!58179 (contains!760 (toList!745 lt!42922) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (= (and d!23775 res!45688) b!89371))

(assert (= (and b!89371 res!45689) b!89372))

(declare-fun m!95811 () Bool)

(assert (=> d!23775 m!95811))

(declare-fun m!95813 () Bool)

(assert (=> d!23775 m!95813))

(declare-fun m!95815 () Bool)

(assert (=> d!23775 m!95815))

(declare-fun m!95817 () Bool)

(assert (=> d!23775 m!95817))

(declare-fun m!95819 () Bool)

(assert (=> b!89371 m!95819))

(declare-fun m!95821 () Bool)

(assert (=> b!89372 m!95821))

(assert (=> d!23619 d!23775))

(declare-fun d!23777 () Bool)

(assert (=> d!23777 (= (+!111 (+!111 lt!42376 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (+!111 (+!111 lt!42376 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (=> d!23777 true))

(declare-fun _$28!151 () Unit!2638)

(assert (=> d!23777 (= (choose!533 lt!42376 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))) _$28!151)))

(declare-fun bs!3747 () Bool)

(assert (= bs!3747 d!23777))

(assert (=> bs!3747 m!95159))

(assert (=> bs!3747 m!95159))

(assert (=> bs!3747 m!95161))

(assert (=> bs!3747 m!95157))

(assert (=> bs!3747 m!95157))

(assert (=> bs!3747 m!95163))

(assert (=> d!23619 d!23777))

(declare-fun d!23779 () Bool)

(declare-fun e!58180 () Bool)

(assert (=> d!23779 e!58180))

(declare-fun res!45690 () Bool)

(assert (=> d!23779 (=> (not res!45690) (not e!58180))))

(declare-fun lt!42926 () ListLongMap!1459)

(assert (=> d!23779 (= res!45690 (contains!759 lt!42926 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun lt!42928 () List!1536)

(assert (=> d!23779 (= lt!42926 (ListLongMap!1460 lt!42928))))

(declare-fun lt!42927 () Unit!2638)

(declare-fun lt!42925 () Unit!2638)

(assert (=> d!23779 (= lt!42927 lt!42925)))

(assert (=> d!23779 (= (getValueByKey!140 lt!42928 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23779 (= lt!42925 (lemmaContainsTupThenGetReturnValue!60 lt!42928 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23779 (= lt!42928 (insertStrictlySorted!63 (toList!745 (+!111 lt!42376 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23779 (= (+!111 (+!111 lt!42376 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) lt!42926)))

(declare-fun b!89373 () Bool)

(declare-fun res!45691 () Bool)

(assert (=> b!89373 (=> (not res!45691) (not e!58180))))

(assert (=> b!89373 (= res!45691 (= (getValueByKey!140 (toList!745 lt!42926) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun b!89374 () Bool)

(assert (=> b!89374 (= e!58180 (contains!760 (toList!745 lt!42926) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (= (and d!23779 res!45690) b!89373))

(assert (= (and b!89373 res!45691) b!89374))

(declare-fun m!95823 () Bool)

(assert (=> d!23779 m!95823))

(declare-fun m!95825 () Bool)

(assert (=> d!23779 m!95825))

(declare-fun m!95827 () Bool)

(assert (=> d!23779 m!95827))

(declare-fun m!95829 () Bool)

(assert (=> d!23779 m!95829))

(declare-fun m!95831 () Bool)

(assert (=> b!89373 m!95831))

(declare-fun m!95833 () Bool)

(assert (=> b!89374 m!95833))

(assert (=> d!23619 d!23779))

(declare-fun d!23781 () Bool)

(declare-fun e!58181 () Bool)

(assert (=> d!23781 e!58181))

(declare-fun res!45692 () Bool)

(assert (=> d!23781 (=> (not res!45692) (not e!58181))))

(declare-fun lt!42930 () ListLongMap!1459)

(assert (=> d!23781 (= res!45692 (contains!759 lt!42930 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!42932 () List!1536)

(assert (=> d!23781 (= lt!42930 (ListLongMap!1460 lt!42932))))

(declare-fun lt!42931 () Unit!2638)

(declare-fun lt!42929 () Unit!2638)

(assert (=> d!23781 (= lt!42931 lt!42929)))

(assert (=> d!23781 (= (getValueByKey!140 lt!42932 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23781 (= lt!42929 (lemmaContainsTupThenGetReturnValue!60 lt!42932 (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23781 (= lt!42932 (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23781 (= (+!111 lt!42376 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42930)))

(declare-fun b!89375 () Bool)

(declare-fun res!45693 () Bool)

(assert (=> b!89375 (=> (not res!45693) (not e!58181))))

(assert (=> b!89375 (= res!45693 (= (getValueByKey!140 (toList!745 lt!42930) (_1!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89376 () Bool)

(assert (=> b!89376 (= e!58181 (contains!760 (toList!745 lt!42930) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23781 res!45692) b!89375))

(assert (= (and b!89375 res!45693) b!89376))

(declare-fun m!95835 () Bool)

(assert (=> d!23781 m!95835))

(declare-fun m!95837 () Bool)

(assert (=> d!23781 m!95837))

(declare-fun m!95839 () Bool)

(assert (=> d!23781 m!95839))

(declare-fun m!95841 () Bool)

(assert (=> d!23781 m!95841))

(declare-fun m!95843 () Bool)

(assert (=> b!89375 m!95843))

(declare-fun m!95845 () Bool)

(assert (=> b!89376 m!95845))

(assert (=> d!23619 d!23781))

(declare-fun b!89379 () Bool)

(declare-fun e!58183 () Option!146)

(assert (=> b!89379 (= e!58183 (getValueByKey!140 (t!5285 (toList!745 lt!42636)) (_1!1121 lt!42391)))))

(declare-fun b!89377 () Bool)

(declare-fun e!58182 () Option!146)

(assert (=> b!89377 (= e!58182 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42636)))))))

(declare-fun d!23783 () Bool)

(declare-fun c!14852 () Bool)

(assert (=> d!23783 (= c!14852 (and ((_ is Cons!1532) (toList!745 lt!42636)) (= (_1!1121 (h!2124 (toList!745 lt!42636))) (_1!1121 lt!42391))))))

(assert (=> d!23783 (= (getValueByKey!140 (toList!745 lt!42636) (_1!1121 lt!42391)) e!58182)))

(declare-fun b!89378 () Bool)

(assert (=> b!89378 (= e!58182 e!58183)))

(declare-fun c!14853 () Bool)

(assert (=> b!89378 (= c!14853 (and ((_ is Cons!1532) (toList!745 lt!42636)) (not (= (_1!1121 (h!2124 (toList!745 lt!42636))) (_1!1121 lt!42391)))))))

(declare-fun b!89380 () Bool)

(assert (=> b!89380 (= e!58183 None!144)))

(assert (= (and d!23783 c!14852) b!89377))

(assert (= (and d!23783 (not c!14852)) b!89378))

(assert (= (and b!89378 c!14853) b!89379))

(assert (= (and b!89378 (not c!14853)) b!89380))

(declare-fun m!95847 () Bool)

(assert (=> b!89379 m!95847))

(assert (=> b!88944 d!23783))

(declare-fun d!23785 () Bool)

(declare-fun isEmpty!347 (List!1536) Bool)

(assert (=> d!23785 (= (isEmpty!345 lt!42616) (isEmpty!347 (toList!745 lt!42616)))))

(declare-fun bs!3748 () Bool)

(assert (= bs!3748 d!23785))

(declare-fun m!95849 () Bool)

(assert (=> bs!3748 m!95849))

(assert (=> b!88926 d!23785))

(declare-fun d!23787 () Bool)

(declare-fun e!58186 () Bool)

(assert (=> d!23787 e!58186))

(declare-fun res!45699 () Bool)

(assert (=> d!23787 (=> (not res!45699) (not e!58186))))

(declare-fun lt!42937 () SeekEntryResult!248)

(assert (=> d!23787 (= res!45699 ((_ is Found!248) lt!42937))))

(assert (=> d!23787 (= lt!42937 (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun lt!42938 () Unit!2638)

(declare-fun choose!538 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2638)

(assert (=> d!23787 (= lt!42938 (choose!538 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23787 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23787 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)) lt!42938)))

(declare-fun b!89385 () Bool)

(declare-fun res!45698 () Bool)

(assert (=> b!89385 (=> (not res!45698) (not e!58186))))

(assert (=> b!89385 (= res!45698 (inRange!0 (index!3132 lt!42937) (mask!6414 newMap!16)))))

(declare-fun b!89386 () Bool)

(assert (=> b!89386 (= e!58186 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42937)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!89386 (and (bvsge (index!3132 lt!42937) #b00000000000000000000000000000000) (bvslt (index!3132 lt!42937) (size!2165 (_keys!4048 newMap!16))))))

(assert (= (and d!23787 res!45699) b!89385))

(assert (= (and b!89385 res!45698) b!89386))

(assert (=> d!23787 m!94779))

(assert (=> d!23787 m!94999))

(assert (=> d!23787 m!94779))

(declare-fun m!95851 () Bool)

(assert (=> d!23787 m!95851))

(assert (=> d!23787 m!95323))

(declare-fun m!95853 () Bool)

(assert (=> b!89385 m!95853))

(declare-fun m!95855 () Bool)

(assert (=> b!89386 m!95855))

(assert (=> bm!8590 d!23787))

(assert (=> b!88988 d!23639))

(declare-fun d!23789 () Bool)

(declare-fun e!58188 () Bool)

(assert (=> d!23789 e!58188))

(declare-fun res!45700 () Bool)

(assert (=> d!23789 (=> res!45700 e!58188)))

(declare-fun lt!42940 () Bool)

(assert (=> d!23789 (= res!45700 (not lt!42940))))

(declare-fun lt!42939 () Bool)

(assert (=> d!23789 (= lt!42940 lt!42939)))

(declare-fun lt!42942 () Unit!2638)

(declare-fun e!58187 () Unit!2638)

(assert (=> d!23789 (= lt!42942 e!58187)))

(declare-fun c!14854 () Bool)

(assert (=> d!23789 (= c!14854 lt!42939)))

(assert (=> d!23789 (= lt!42939 (containsKey!144 (toList!745 call!8591) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23789 (= (contains!759 call!8591 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) lt!42940)))

(declare-fun b!89387 () Bool)

(declare-fun lt!42941 () Unit!2638)

(assert (=> b!89387 (= e!58187 lt!42941)))

(assert (=> b!89387 (= lt!42941 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 call!8591) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!89387 (isDefined!94 (getValueByKey!140 (toList!745 call!8591) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!89388 () Bool)

(declare-fun Unit!2658 () Unit!2638)

(assert (=> b!89388 (= e!58187 Unit!2658)))

(declare-fun b!89389 () Bool)

(assert (=> b!89389 (= e!58188 (isDefined!94 (getValueByKey!140 (toList!745 call!8591) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (= (and d!23789 c!14854) b!89387))

(assert (= (and d!23789 (not c!14854)) b!89388))

(assert (= (and d!23789 (not res!45700)) b!89389))

(assert (=> d!23789 m!94779))

(declare-fun m!95857 () Bool)

(assert (=> d!23789 m!95857))

(assert (=> b!89387 m!94779))

(declare-fun m!95859 () Bool)

(assert (=> b!89387 m!95859))

(assert (=> b!89387 m!94779))

(declare-fun m!95861 () Bool)

(assert (=> b!89387 m!95861))

(assert (=> b!89387 m!95861))

(declare-fun m!95863 () Bool)

(assert (=> b!89387 m!95863))

(assert (=> b!89389 m!94779))

(assert (=> b!89389 m!95861))

(assert (=> b!89389 m!95861))

(assert (=> b!89389 m!95863))

(assert (=> b!88894 d!23789))

(declare-fun d!23791 () Bool)

(declare-fun e!58190 () Bool)

(assert (=> d!23791 e!58190))

(declare-fun res!45701 () Bool)

(assert (=> d!23791 (=> res!45701 e!58190)))

(declare-fun lt!42944 () Bool)

(assert (=> d!23791 (= res!45701 (not lt!42944))))

(declare-fun lt!42943 () Bool)

(assert (=> d!23791 (= lt!42944 lt!42943)))

(declare-fun lt!42946 () Unit!2638)

(declare-fun e!58189 () Unit!2638)

(assert (=> d!23791 (= lt!42946 e!58189)))

(declare-fun c!14855 () Bool)

(assert (=> d!23791 (= c!14855 lt!42943)))

(assert (=> d!23791 (= lt!42943 (containsKey!144 (toList!745 lt!42636) (_1!1121 lt!42391)))))

(assert (=> d!23791 (= (contains!759 lt!42636 (_1!1121 lt!42391)) lt!42944)))

(declare-fun b!89390 () Bool)

(declare-fun lt!42945 () Unit!2638)

(assert (=> b!89390 (= e!58189 lt!42945)))

(assert (=> b!89390 (= lt!42945 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42636) (_1!1121 lt!42391)))))

(assert (=> b!89390 (isDefined!94 (getValueByKey!140 (toList!745 lt!42636) (_1!1121 lt!42391)))))

(declare-fun b!89391 () Bool)

(declare-fun Unit!2659 () Unit!2638)

(assert (=> b!89391 (= e!58189 Unit!2659)))

(declare-fun b!89392 () Bool)

(assert (=> b!89392 (= e!58190 (isDefined!94 (getValueByKey!140 (toList!745 lt!42636) (_1!1121 lt!42391))))))

(assert (= (and d!23791 c!14855) b!89390))

(assert (= (and d!23791 (not c!14855)) b!89391))

(assert (= (and d!23791 (not res!45701)) b!89392))

(declare-fun m!95865 () Bool)

(assert (=> d!23791 m!95865))

(declare-fun m!95867 () Bool)

(assert (=> b!89390 m!95867))

(assert (=> b!89390 m!95117))

(assert (=> b!89390 m!95117))

(declare-fun m!95869 () Bool)

(assert (=> b!89390 m!95869))

(assert (=> b!89392 m!95117))

(assert (=> b!89392 m!95117))

(assert (=> b!89392 m!95869))

(assert (=> d!23611 d!23791))

(declare-fun b!89395 () Bool)

(declare-fun e!58192 () Option!146)

(assert (=> b!89395 (= e!58192 (getValueByKey!140 (t!5285 lt!42638) (_1!1121 lt!42391)))))

(declare-fun b!89393 () Bool)

(declare-fun e!58191 () Option!146)

(assert (=> b!89393 (= e!58191 (Some!145 (_2!1121 (h!2124 lt!42638))))))

(declare-fun d!23793 () Bool)

(declare-fun c!14856 () Bool)

(assert (=> d!23793 (= c!14856 (and ((_ is Cons!1532) lt!42638) (= (_1!1121 (h!2124 lt!42638)) (_1!1121 lt!42391))))))

(assert (=> d!23793 (= (getValueByKey!140 lt!42638 (_1!1121 lt!42391)) e!58191)))

(declare-fun b!89394 () Bool)

(assert (=> b!89394 (= e!58191 e!58192)))

(declare-fun c!14857 () Bool)

(assert (=> b!89394 (= c!14857 (and ((_ is Cons!1532) lt!42638) (not (= (_1!1121 (h!2124 lt!42638)) (_1!1121 lt!42391)))))))

(declare-fun b!89396 () Bool)

(assert (=> b!89396 (= e!58192 None!144)))

(assert (= (and d!23793 c!14856) b!89393))

(assert (= (and d!23793 (not c!14856)) b!89394))

(assert (= (and b!89394 c!14857) b!89395))

(assert (= (and b!89394 (not c!14857)) b!89396))

(declare-fun m!95871 () Bool)

(assert (=> b!89395 m!95871))

(assert (=> d!23611 d!23793))

(declare-fun d!23795 () Bool)

(assert (=> d!23795 (= (getValueByKey!140 lt!42638 (_1!1121 lt!42391)) (Some!145 (_2!1121 lt!42391)))))

(declare-fun lt!42947 () Unit!2638)

(assert (=> d!23795 (= lt!42947 (choose!536 lt!42638 (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(declare-fun e!58193 () Bool)

(assert (=> d!23795 e!58193))

(declare-fun res!45702 () Bool)

(assert (=> d!23795 (=> (not res!45702) (not e!58193))))

(assert (=> d!23795 (= res!45702 (isStrictlySorted!295 lt!42638))))

(assert (=> d!23795 (= (lemmaContainsTupThenGetReturnValue!60 lt!42638 (_1!1121 lt!42391) (_2!1121 lt!42391)) lt!42947)))

(declare-fun b!89397 () Bool)

(declare-fun res!45703 () Bool)

(assert (=> b!89397 (=> (not res!45703) (not e!58193))))

(assert (=> b!89397 (= res!45703 (containsKey!144 lt!42638 (_1!1121 lt!42391)))))

(declare-fun b!89398 () Bool)

(assert (=> b!89398 (= e!58193 (contains!760 lt!42638 (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391))))))

(assert (= (and d!23795 res!45702) b!89397))

(assert (= (and b!89397 res!45703) b!89398))

(assert (=> d!23795 m!95111))

(declare-fun m!95873 () Bool)

(assert (=> d!23795 m!95873))

(declare-fun m!95875 () Bool)

(assert (=> d!23795 m!95875))

(declare-fun m!95877 () Bool)

(assert (=> b!89397 m!95877))

(declare-fun m!95879 () Bool)

(assert (=> b!89398 m!95879))

(assert (=> d!23611 d!23795))

(declare-fun b!89399 () Bool)

(declare-fun e!58196 () List!1536)

(declare-fun call!8680 () List!1536)

(assert (=> b!89399 (= e!58196 call!8680)))

(declare-fun b!89400 () Bool)

(declare-fun c!14860 () Bool)

(assert (=> b!89400 (= c!14860 (and ((_ is Cons!1532) (toList!745 lt!42385)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42385))) (_1!1121 lt!42391))))))

(declare-fun e!58195 () List!1536)

(assert (=> b!89400 (= e!58196 e!58195)))

(declare-fun b!89401 () Bool)

(declare-fun call!8682 () List!1536)

(assert (=> b!89401 (= e!58195 call!8682)))

(declare-fun b!89402 () Bool)

(declare-fun e!58198 () Bool)

(declare-fun lt!42948 () List!1536)

(assert (=> b!89402 (= e!58198 (contains!760 lt!42948 (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391))))))

(declare-fun bm!8677 () Bool)

(declare-fun call!8681 () List!1536)

(assert (=> bm!8677 (= call!8680 call!8681)))

(declare-fun bm!8678 () Bool)

(assert (=> bm!8678 (= call!8682 call!8680)))

(declare-fun b!89403 () Bool)

(declare-fun c!14859 () Bool)

(declare-fun e!58197 () List!1536)

(assert (=> b!89403 (= e!58197 (ite c!14859 (t!5285 (toList!745 lt!42385)) (ite c!14860 (Cons!1532 (h!2124 (toList!745 lt!42385)) (t!5285 (toList!745 lt!42385))) Nil!1533)))))

(declare-fun b!89404 () Bool)

(declare-fun e!58194 () List!1536)

(assert (=> b!89404 (= e!58194 call!8681)))

(declare-fun b!89405 () Bool)

(assert (=> b!89405 (= e!58194 e!58196)))

(assert (=> b!89405 (= c!14859 (and ((_ is Cons!1532) (toList!745 lt!42385)) (= (_1!1121 (h!2124 (toList!745 lt!42385))) (_1!1121 lt!42391))))))

(declare-fun c!14861 () Bool)

(declare-fun bm!8679 () Bool)

(assert (=> bm!8679 (= call!8681 ($colon$colon!73 e!58197 (ite c!14861 (h!2124 (toList!745 lt!42385)) (tuple2!2221 (_1!1121 lt!42391) (_2!1121 lt!42391)))))))

(declare-fun c!14858 () Bool)

(assert (=> bm!8679 (= c!14858 c!14861)))

(declare-fun b!89406 () Bool)

(declare-fun res!45704 () Bool)

(assert (=> b!89406 (=> (not res!45704) (not e!58198))))

(assert (=> b!89406 (= res!45704 (containsKey!144 lt!42948 (_1!1121 lt!42391)))))

(declare-fun d!23797 () Bool)

(assert (=> d!23797 e!58198))

(declare-fun res!45705 () Bool)

(assert (=> d!23797 (=> (not res!45705) (not e!58198))))

(assert (=> d!23797 (= res!45705 (isStrictlySorted!295 lt!42948))))

(assert (=> d!23797 (= lt!42948 e!58194)))

(assert (=> d!23797 (= c!14861 (and ((_ is Cons!1532) (toList!745 lt!42385)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42385))) (_1!1121 lt!42391))))))

(assert (=> d!23797 (isStrictlySorted!295 (toList!745 lt!42385))))

(assert (=> d!23797 (= (insertStrictlySorted!63 (toList!745 lt!42385) (_1!1121 lt!42391) (_2!1121 lt!42391)) lt!42948)))

(declare-fun b!89407 () Bool)

(assert (=> b!89407 (= e!58195 call!8682)))

(declare-fun b!89408 () Bool)

(assert (=> b!89408 (= e!58197 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42385)) (_1!1121 lt!42391) (_2!1121 lt!42391)))))

(assert (= (and d!23797 c!14861) b!89404))

(assert (= (and d!23797 (not c!14861)) b!89405))

(assert (= (and b!89405 c!14859) b!89399))

(assert (= (and b!89405 (not c!14859)) b!89400))

(assert (= (and b!89400 c!14860) b!89407))

(assert (= (and b!89400 (not c!14860)) b!89401))

(assert (= (or b!89407 b!89401) bm!8678))

(assert (= (or b!89399 bm!8678) bm!8677))

(assert (= (or b!89404 bm!8677) bm!8679))

(assert (= (and bm!8679 c!14858) b!89408))

(assert (= (and bm!8679 (not c!14858)) b!89403))

(assert (= (and d!23797 res!45705) b!89406))

(assert (= (and b!89406 res!45704) b!89402))

(declare-fun m!95881 () Bool)

(assert (=> d!23797 m!95881))

(declare-fun m!95883 () Bool)

(assert (=> d!23797 m!95883))

(declare-fun m!95885 () Bool)

(assert (=> b!89408 m!95885))

(declare-fun m!95887 () Bool)

(assert (=> bm!8679 m!95887))

(declare-fun m!95889 () Bool)

(assert (=> b!89406 m!95889))

(declare-fun m!95891 () Bool)

(assert (=> b!89402 m!95891))

(assert (=> d!23611 d!23797))

(declare-fun d!23799 () Bool)

(assert (=> d!23799 (= (get!1216 (select (arr!1919 (_values!2354 (v!2667 (underlying!291 thiss!992)))) from!355) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!347 (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89000 d!23799))

(declare-fun d!23801 () Bool)

(declare-fun e!58200 () Bool)

(assert (=> d!23801 e!58200))

(declare-fun res!45706 () Bool)

(assert (=> d!23801 (=> res!45706 e!58200)))

(declare-fun lt!42950 () Bool)

(assert (=> d!23801 (= res!45706 (not lt!42950))))

(declare-fun lt!42949 () Bool)

(assert (=> d!23801 (= lt!42950 lt!42949)))

(declare-fun lt!42952 () Unit!2638)

(declare-fun e!58199 () Unit!2638)

(assert (=> d!23801 (= lt!42952 e!58199)))

(declare-fun c!14862 () Bool)

(assert (=> d!23801 (= c!14862 lt!42949)))

(assert (=> d!23801 (= lt!42949 (containsKey!144 (toList!745 lt!42640) (_1!1121 lt!42377)))))

(assert (=> d!23801 (= (contains!759 lt!42640 (_1!1121 lt!42377)) lt!42950)))

(declare-fun b!89409 () Bool)

(declare-fun lt!42951 () Unit!2638)

(assert (=> b!89409 (= e!58199 lt!42951)))

(assert (=> b!89409 (= lt!42951 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42640) (_1!1121 lt!42377)))))

(assert (=> b!89409 (isDefined!94 (getValueByKey!140 (toList!745 lt!42640) (_1!1121 lt!42377)))))

(declare-fun b!89410 () Bool)

(declare-fun Unit!2660 () Unit!2638)

(assert (=> b!89410 (= e!58199 Unit!2660)))

(declare-fun b!89411 () Bool)

(assert (=> b!89411 (= e!58200 (isDefined!94 (getValueByKey!140 (toList!745 lt!42640) (_1!1121 lt!42377))))))

(assert (= (and d!23801 c!14862) b!89409))

(assert (= (and d!23801 (not c!14862)) b!89410))

(assert (= (and d!23801 (not res!45706)) b!89411))

(declare-fun m!95893 () Bool)

(assert (=> d!23801 m!95893))

(declare-fun m!95895 () Bool)

(assert (=> b!89409 m!95895))

(assert (=> b!89409 m!95129))

(assert (=> b!89409 m!95129))

(declare-fun m!95897 () Bool)

(assert (=> b!89409 m!95897))

(assert (=> b!89411 m!95129))

(assert (=> b!89411 m!95129))

(assert (=> b!89411 m!95897))

(assert (=> d!23613 d!23801))

(declare-fun b!89414 () Bool)

(declare-fun e!58202 () Option!146)

(assert (=> b!89414 (= e!58202 (getValueByKey!140 (t!5285 lt!42642) (_1!1121 lt!42377)))))

(declare-fun b!89412 () Bool)

(declare-fun e!58201 () Option!146)

(assert (=> b!89412 (= e!58201 (Some!145 (_2!1121 (h!2124 lt!42642))))))

(declare-fun d!23803 () Bool)

(declare-fun c!14863 () Bool)

(assert (=> d!23803 (= c!14863 (and ((_ is Cons!1532) lt!42642) (= (_1!1121 (h!2124 lt!42642)) (_1!1121 lt!42377))))))

(assert (=> d!23803 (= (getValueByKey!140 lt!42642 (_1!1121 lt!42377)) e!58201)))

(declare-fun b!89413 () Bool)

(assert (=> b!89413 (= e!58201 e!58202)))

(declare-fun c!14864 () Bool)

(assert (=> b!89413 (= c!14864 (and ((_ is Cons!1532) lt!42642) (not (= (_1!1121 (h!2124 lt!42642)) (_1!1121 lt!42377)))))))

(declare-fun b!89415 () Bool)

(assert (=> b!89415 (= e!58202 None!144)))

(assert (= (and d!23803 c!14863) b!89412))

(assert (= (and d!23803 (not c!14863)) b!89413))

(assert (= (and b!89413 c!14864) b!89414))

(assert (= (and b!89413 (not c!14864)) b!89415))

(declare-fun m!95899 () Bool)

(assert (=> b!89414 m!95899))

(assert (=> d!23613 d!23803))

(declare-fun d!23805 () Bool)

(assert (=> d!23805 (= (getValueByKey!140 lt!42642 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(declare-fun lt!42953 () Unit!2638)

(assert (=> d!23805 (= lt!42953 (choose!536 lt!42642 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(declare-fun e!58203 () Bool)

(assert (=> d!23805 e!58203))

(declare-fun res!45707 () Bool)

(assert (=> d!23805 (=> (not res!45707) (not e!58203))))

(assert (=> d!23805 (= res!45707 (isStrictlySorted!295 lt!42642))))

(assert (=> d!23805 (= (lemmaContainsTupThenGetReturnValue!60 lt!42642 (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!42953)))

(declare-fun b!89416 () Bool)

(declare-fun res!45708 () Bool)

(assert (=> b!89416 (=> (not res!45708) (not e!58203))))

(assert (=> b!89416 (= res!45708 (containsKey!144 lt!42642 (_1!1121 lt!42377)))))

(declare-fun b!89417 () Bool)

(assert (=> b!89417 (= e!58203 (contains!760 lt!42642 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(assert (= (and d!23805 res!45707) b!89416))

(assert (= (and b!89416 res!45708) b!89417))

(assert (=> d!23805 m!95123))

(declare-fun m!95901 () Bool)

(assert (=> d!23805 m!95901))

(declare-fun m!95903 () Bool)

(assert (=> d!23805 m!95903))

(declare-fun m!95905 () Bool)

(assert (=> b!89416 m!95905))

(declare-fun m!95907 () Bool)

(assert (=> b!89417 m!95907))

(assert (=> d!23613 d!23805))

(declare-fun b!89418 () Bool)

(declare-fun e!58206 () List!1536)

(declare-fun call!8683 () List!1536)

(assert (=> b!89418 (= e!58206 call!8683)))

(declare-fun c!14867 () Bool)

(declare-fun b!89419 () Bool)

(assert (=> b!89419 (= c!14867 (and ((_ is Cons!1532) (toList!745 (+!111 lt!42379 lt!42391))) (bvsgt (_1!1121 (h!2124 (toList!745 (+!111 lt!42379 lt!42391)))) (_1!1121 lt!42377))))))

(declare-fun e!58205 () List!1536)

(assert (=> b!89419 (= e!58206 e!58205)))

(declare-fun b!89420 () Bool)

(declare-fun call!8685 () List!1536)

(assert (=> b!89420 (= e!58205 call!8685)))

(declare-fun b!89421 () Bool)

(declare-fun e!58208 () Bool)

(declare-fun lt!42954 () List!1536)

(assert (=> b!89421 (= e!58208 (contains!760 lt!42954 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(declare-fun bm!8680 () Bool)

(declare-fun call!8684 () List!1536)

(assert (=> bm!8680 (= call!8683 call!8684)))

(declare-fun bm!8681 () Bool)

(assert (=> bm!8681 (= call!8685 call!8683)))

(declare-fun c!14866 () Bool)

(declare-fun b!89422 () Bool)

(declare-fun e!58207 () List!1536)

(assert (=> b!89422 (= e!58207 (ite c!14866 (t!5285 (toList!745 (+!111 lt!42379 lt!42391))) (ite c!14867 (Cons!1532 (h!2124 (toList!745 (+!111 lt!42379 lt!42391))) (t!5285 (toList!745 (+!111 lt!42379 lt!42391)))) Nil!1533)))))

(declare-fun b!89423 () Bool)

(declare-fun e!58204 () List!1536)

(assert (=> b!89423 (= e!58204 call!8684)))

(declare-fun b!89424 () Bool)

(assert (=> b!89424 (= e!58204 e!58206)))

(assert (=> b!89424 (= c!14866 (and ((_ is Cons!1532) (toList!745 (+!111 lt!42379 lt!42391))) (= (_1!1121 (h!2124 (toList!745 (+!111 lt!42379 lt!42391)))) (_1!1121 lt!42377))))))

(declare-fun bm!8682 () Bool)

(declare-fun c!14868 () Bool)

(assert (=> bm!8682 (= call!8684 ($colon$colon!73 e!58207 (ite c!14868 (h!2124 (toList!745 (+!111 lt!42379 lt!42391))) (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377)))))))

(declare-fun c!14865 () Bool)

(assert (=> bm!8682 (= c!14865 c!14868)))

(declare-fun b!89425 () Bool)

(declare-fun res!45709 () Bool)

(assert (=> b!89425 (=> (not res!45709) (not e!58208))))

(assert (=> b!89425 (= res!45709 (containsKey!144 lt!42954 (_1!1121 lt!42377)))))

(declare-fun d!23807 () Bool)

(assert (=> d!23807 e!58208))

(declare-fun res!45710 () Bool)

(assert (=> d!23807 (=> (not res!45710) (not e!58208))))

(assert (=> d!23807 (= res!45710 (isStrictlySorted!295 lt!42954))))

(assert (=> d!23807 (= lt!42954 e!58204)))

(assert (=> d!23807 (= c!14868 (and ((_ is Cons!1532) (toList!745 (+!111 lt!42379 lt!42391))) (bvslt (_1!1121 (h!2124 (toList!745 (+!111 lt!42379 lt!42391)))) (_1!1121 lt!42377))))))

(assert (=> d!23807 (isStrictlySorted!295 (toList!745 (+!111 lt!42379 lt!42391)))))

(assert (=> d!23807 (= (insertStrictlySorted!63 (toList!745 (+!111 lt!42379 lt!42391)) (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!42954)))

(declare-fun b!89426 () Bool)

(assert (=> b!89426 (= e!58205 call!8685)))

(declare-fun b!89427 () Bool)

(assert (=> b!89427 (= e!58207 (insertStrictlySorted!63 (t!5285 (toList!745 (+!111 lt!42379 lt!42391))) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (= (and d!23807 c!14868) b!89423))

(assert (= (and d!23807 (not c!14868)) b!89424))

(assert (= (and b!89424 c!14866) b!89418))

(assert (= (and b!89424 (not c!14866)) b!89419))

(assert (= (and b!89419 c!14867) b!89426))

(assert (= (and b!89419 (not c!14867)) b!89420))

(assert (= (or b!89426 b!89420) bm!8681))

(assert (= (or b!89418 bm!8681) bm!8680))

(assert (= (or b!89423 bm!8680) bm!8682))

(assert (= (and bm!8682 c!14865) b!89427))

(assert (= (and bm!8682 (not c!14865)) b!89422))

(assert (= (and d!23807 res!45710) b!89425))

(assert (= (and b!89425 res!45709) b!89421))

(declare-fun m!95909 () Bool)

(assert (=> d!23807 m!95909))

(declare-fun m!95911 () Bool)

(assert (=> d!23807 m!95911))

(declare-fun m!95913 () Bool)

(assert (=> b!89427 m!95913))

(declare-fun m!95915 () Bool)

(assert (=> bm!8682 m!95915))

(declare-fun m!95917 () Bool)

(assert (=> b!89425 m!95917))

(declare-fun m!95919 () Bool)

(assert (=> b!89421 m!95919))

(assert (=> d!23613 d!23807))

(declare-fun d!23809 () Bool)

(declare-fun res!45711 () Bool)

(declare-fun e!58209 () Bool)

(assert (=> d!23809 (=> (not res!45711) (not e!58209))))

(assert (=> d!23809 (= res!45711 (simpleValid!60 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23809 (= (valid!344 (v!2667 (underlying!291 thiss!992))) e!58209)))

(declare-fun b!89428 () Bool)

(declare-fun res!45712 () Bool)

(assert (=> b!89428 (=> (not res!45712) (not e!58209))))

(assert (=> b!89428 (= res!45712 (= (arrayCountValidKeys!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))) (_size!432 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89429 () Bool)

(declare-fun res!45713 () Bool)

(assert (=> b!89429 (=> (not res!45713) (not e!58209))))

(assert (=> b!89429 (= res!45713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89430 () Bool)

(assert (=> b!89430 (= e!58209 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) #b00000000000000000000000000000000 Nil!1532))))

(assert (= (and d!23809 res!45711) b!89428))

(assert (= (and b!89428 res!45712) b!89429))

(assert (= (and b!89429 res!45713) b!89430))

(declare-fun m!95921 () Bool)

(assert (=> d!23809 m!95921))

(declare-fun m!95923 () Bool)

(assert (=> b!89428 m!95923))

(assert (=> b!89429 m!94845))

(assert (=> b!89430 m!94823))

(assert (=> d!23631 d!23809))

(declare-fun d!23811 () Bool)

(declare-fun e!58211 () Bool)

(assert (=> d!23811 e!58211))

(declare-fun res!45714 () Bool)

(assert (=> d!23811 (=> res!45714 e!58211)))

(declare-fun lt!42956 () Bool)

(assert (=> d!23811 (= res!45714 (not lt!42956))))

(declare-fun lt!42955 () Bool)

(assert (=> d!23811 (= lt!42956 lt!42955)))

(declare-fun lt!42958 () Unit!2638)

(declare-fun e!58210 () Unit!2638)

(assert (=> d!23811 (= lt!42958 e!58210)))

(declare-fun c!14869 () Bool)

(assert (=> d!23811 (= c!14869 lt!42955)))

(assert (=> d!23811 (= lt!42955 (containsKey!144 (toList!745 lt!42644) (_1!1121 lt!42377)))))

(assert (=> d!23811 (= (contains!759 lt!42644 (_1!1121 lt!42377)) lt!42956)))

(declare-fun b!89431 () Bool)

(declare-fun lt!42957 () Unit!2638)

(assert (=> b!89431 (= e!58210 lt!42957)))

(assert (=> b!89431 (= lt!42957 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42644) (_1!1121 lt!42377)))))

(assert (=> b!89431 (isDefined!94 (getValueByKey!140 (toList!745 lt!42644) (_1!1121 lt!42377)))))

(declare-fun b!89432 () Bool)

(declare-fun Unit!2661 () Unit!2638)

(assert (=> b!89432 (= e!58210 Unit!2661)))

(declare-fun b!89433 () Bool)

(assert (=> b!89433 (= e!58211 (isDefined!94 (getValueByKey!140 (toList!745 lt!42644) (_1!1121 lt!42377))))))

(assert (= (and d!23811 c!14869) b!89431))

(assert (= (and d!23811 (not c!14869)) b!89432))

(assert (= (and d!23811 (not res!45714)) b!89433))

(declare-fun m!95925 () Bool)

(assert (=> d!23811 m!95925))

(declare-fun m!95927 () Bool)

(assert (=> b!89431 m!95927))

(assert (=> b!89431 m!95141))

(assert (=> b!89431 m!95141))

(declare-fun m!95929 () Bool)

(assert (=> b!89431 m!95929))

(assert (=> b!89433 m!95141))

(assert (=> b!89433 m!95141))

(assert (=> b!89433 m!95929))

(assert (=> d!23615 d!23811))

(declare-fun b!89436 () Bool)

(declare-fun e!58213 () Option!146)

(assert (=> b!89436 (= e!58213 (getValueByKey!140 (t!5285 lt!42646) (_1!1121 lt!42377)))))

(declare-fun b!89434 () Bool)

(declare-fun e!58212 () Option!146)

(assert (=> b!89434 (= e!58212 (Some!145 (_2!1121 (h!2124 lt!42646))))))

(declare-fun d!23813 () Bool)

(declare-fun c!14870 () Bool)

(assert (=> d!23813 (= c!14870 (and ((_ is Cons!1532) lt!42646) (= (_1!1121 (h!2124 lt!42646)) (_1!1121 lt!42377))))))

(assert (=> d!23813 (= (getValueByKey!140 lt!42646 (_1!1121 lt!42377)) e!58212)))

(declare-fun b!89435 () Bool)

(assert (=> b!89435 (= e!58212 e!58213)))

(declare-fun c!14871 () Bool)

(assert (=> b!89435 (= c!14871 (and ((_ is Cons!1532) lt!42646) (not (= (_1!1121 (h!2124 lt!42646)) (_1!1121 lt!42377)))))))

(declare-fun b!89437 () Bool)

(assert (=> b!89437 (= e!58213 None!144)))

(assert (= (and d!23813 c!14870) b!89434))

(assert (= (and d!23813 (not c!14870)) b!89435))

(assert (= (and b!89435 c!14871) b!89436))

(assert (= (and b!89435 (not c!14871)) b!89437))

(declare-fun m!95931 () Bool)

(assert (=> b!89436 m!95931))

(assert (=> d!23615 d!23813))

(declare-fun d!23815 () Bool)

(assert (=> d!23815 (= (getValueByKey!140 lt!42646 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(declare-fun lt!42959 () Unit!2638)

(assert (=> d!23815 (= lt!42959 (choose!536 lt!42646 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(declare-fun e!58214 () Bool)

(assert (=> d!23815 e!58214))

(declare-fun res!45715 () Bool)

(assert (=> d!23815 (=> (not res!45715) (not e!58214))))

(assert (=> d!23815 (= res!45715 (isStrictlySorted!295 lt!42646))))

(assert (=> d!23815 (= (lemmaContainsTupThenGetReturnValue!60 lt!42646 (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!42959)))

(declare-fun b!89438 () Bool)

(declare-fun res!45716 () Bool)

(assert (=> b!89438 (=> (not res!45716) (not e!58214))))

(assert (=> b!89438 (= res!45716 (containsKey!144 lt!42646 (_1!1121 lt!42377)))))

(declare-fun b!89439 () Bool)

(assert (=> b!89439 (= e!58214 (contains!760 lt!42646 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(assert (= (and d!23815 res!45715) b!89438))

(assert (= (and b!89438 res!45716) b!89439))

(assert (=> d!23815 m!95135))

(declare-fun m!95933 () Bool)

(assert (=> d!23815 m!95933))

(declare-fun m!95935 () Bool)

(assert (=> d!23815 m!95935))

(declare-fun m!95937 () Bool)

(assert (=> b!89438 m!95937))

(declare-fun m!95939 () Bool)

(assert (=> b!89439 m!95939))

(assert (=> d!23615 d!23815))

(declare-fun b!89440 () Bool)

(declare-fun e!58217 () List!1536)

(declare-fun call!8686 () List!1536)

(assert (=> b!89440 (= e!58217 call!8686)))

(declare-fun b!89441 () Bool)

(declare-fun c!14874 () Bool)

(assert (=> b!89441 (= c!14874 (and ((_ is Cons!1532) (toList!745 lt!42379)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42377))))))

(declare-fun e!58216 () List!1536)

(assert (=> b!89441 (= e!58217 e!58216)))

(declare-fun b!89442 () Bool)

(declare-fun call!8688 () List!1536)

(assert (=> b!89442 (= e!58216 call!8688)))

(declare-fun b!89443 () Bool)

(declare-fun e!58219 () Bool)

(declare-fun lt!42960 () List!1536)

(assert (=> b!89443 (= e!58219 (contains!760 lt!42960 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(declare-fun bm!8683 () Bool)

(declare-fun call!8687 () List!1536)

(assert (=> bm!8683 (= call!8686 call!8687)))

(declare-fun bm!8684 () Bool)

(assert (=> bm!8684 (= call!8688 call!8686)))

(declare-fun e!58218 () List!1536)

(declare-fun c!14873 () Bool)

(declare-fun b!89444 () Bool)

(assert (=> b!89444 (= e!58218 (ite c!14873 (t!5285 (toList!745 lt!42379)) (ite c!14874 (Cons!1532 (h!2124 (toList!745 lt!42379)) (t!5285 (toList!745 lt!42379))) Nil!1533)))))

(declare-fun b!89445 () Bool)

(declare-fun e!58215 () List!1536)

(assert (=> b!89445 (= e!58215 call!8687)))

(declare-fun b!89446 () Bool)

(assert (=> b!89446 (= e!58215 e!58217)))

(assert (=> b!89446 (= c!14873 (and ((_ is Cons!1532) (toList!745 lt!42379)) (= (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42377))))))

(declare-fun bm!8685 () Bool)

(declare-fun c!14875 () Bool)

(assert (=> bm!8685 (= call!8687 ($colon$colon!73 e!58218 (ite c!14875 (h!2124 (toList!745 lt!42379)) (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377)))))))

(declare-fun c!14872 () Bool)

(assert (=> bm!8685 (= c!14872 c!14875)))

(declare-fun b!89447 () Bool)

(declare-fun res!45717 () Bool)

(assert (=> b!89447 (=> (not res!45717) (not e!58219))))

(assert (=> b!89447 (= res!45717 (containsKey!144 lt!42960 (_1!1121 lt!42377)))))

(declare-fun d!23817 () Bool)

(assert (=> d!23817 e!58219))

(declare-fun res!45718 () Bool)

(assert (=> d!23817 (=> (not res!45718) (not e!58219))))

(assert (=> d!23817 (= res!45718 (isStrictlySorted!295 lt!42960))))

(assert (=> d!23817 (= lt!42960 e!58215)))

(assert (=> d!23817 (= c!14875 (and ((_ is Cons!1532) (toList!745 lt!42379)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42379))) (_1!1121 lt!42377))))))

(assert (=> d!23817 (isStrictlySorted!295 (toList!745 lt!42379))))

(assert (=> d!23817 (= (insertStrictlySorted!63 (toList!745 lt!42379) (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!42960)))

(declare-fun b!89448 () Bool)

(assert (=> b!89448 (= e!58216 call!8688)))

(declare-fun b!89449 () Bool)

(assert (=> b!89449 (= e!58218 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42379)) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (= (and d!23817 c!14875) b!89445))

(assert (= (and d!23817 (not c!14875)) b!89446))

(assert (= (and b!89446 c!14873) b!89440))

(assert (= (and b!89446 (not c!14873)) b!89441))

(assert (= (and b!89441 c!14874) b!89448))

(assert (= (and b!89441 (not c!14874)) b!89442))

(assert (= (or b!89448 b!89442) bm!8684))

(assert (= (or b!89440 bm!8684) bm!8683))

(assert (= (or b!89445 bm!8683) bm!8685))

(assert (= (and bm!8685 c!14872) b!89449))

(assert (= (and bm!8685 (not c!14872)) b!89444))

(assert (= (and d!23817 res!45718) b!89447))

(assert (= (and b!89447 res!45717) b!89443))

(declare-fun m!95941 () Bool)

(assert (=> d!23817 m!95941))

(assert (=> d!23817 m!95455))

(declare-fun m!95943 () Bool)

(assert (=> b!89449 m!95943))

(declare-fun m!95945 () Bool)

(assert (=> bm!8685 m!95945))

(declare-fun m!95947 () Bool)

(assert (=> b!89447 m!95947))

(declare-fun m!95949 () Bool)

(assert (=> b!89443 m!95949))

(assert (=> d!23615 d!23817))

(declare-fun b!89484 () Bool)

(declare-fun e!58240 () Bool)

(declare-fun call!8700 () Bool)

(assert (=> b!89484 (= e!58240 (not call!8700))))

(declare-fun b!89485 () Bool)

(declare-fun e!58243 () Unit!2638)

(declare-fun Unit!2662 () Unit!2638)

(assert (=> b!89485 (= e!58243 Unit!2662)))

(declare-fun bm!8694 () Bool)

(declare-fun c!14884 () Bool)

(declare-fun c!14887 () Bool)

(declare-fun lt!43037 () SeekEntryResult!248)

(declare-fun lt!43030 () SeekEntryResult!248)

(declare-fun call!8698 () Bool)

(assert (=> bm!8694 (= call!8698 (inRange!0 (ite c!14887 (index!3132 lt!43037) (ite c!14884 (index!3131 lt!43030) (index!3134 lt!43030))) (mask!6414 newMap!16)))))

(declare-fun b!89487 () Bool)

(declare-fun res!45745 () Bool)

(assert (=> b!89487 (= res!45745 call!8698)))

(declare-fun e!58239 () Bool)

(assert (=> b!89487 (=> (not res!45745) (not e!58239))))

(declare-fun b!89488 () Bool)

(declare-fun res!45741 () Bool)

(declare-fun e!58241 () Bool)

(assert (=> b!89488 (=> (not res!45741) (not e!58241))))

(assert (=> b!89488 (= res!45741 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3131 lt!43030)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89489 () Bool)

(declare-fun c!14885 () Bool)

(assert (=> b!89489 (= c!14885 ((_ is MissingVacant!248) lt!43030))))

(declare-fun e!58237 () Bool)

(declare-fun e!58236 () Bool)

(assert (=> b!89489 (= e!58237 e!58236)))

(declare-fun b!89490 () Bool)

(declare-fun e!58238 () Unit!2638)

(declare-fun Unit!2663 () Unit!2638)

(assert (=> b!89490 (= e!58238 Unit!2663)))

(declare-fun lt!43040 () Unit!2638)

(assert (=> b!89490 (= lt!43040 (lemmaInListMapThenSeekEntryOrOpenFindsIt!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(declare-fun call!8697 () SeekEntryResult!248)

(assert (=> b!89490 (= lt!43037 call!8697)))

(declare-fun res!45742 () Bool)

(assert (=> b!89490 (= res!45742 ((_ is Found!248) lt!43037))))

(assert (=> b!89490 (=> (not res!45742) (not e!58239))))

(assert (=> b!89490 e!58239))

(declare-fun lt!43038 () Unit!2638)

(assert (=> b!89490 (= lt!43038 lt!43040)))

(assert (=> b!89490 false))

(declare-fun b!89491 () Bool)

(declare-fun res!45743 () Bool)

(declare-fun e!58242 () Bool)

(assert (=> b!89491 (=> (not res!45743) (not e!58242))))

(declare-fun lt!43043 () tuple2!2222)

(assert (=> b!89491 (= res!45743 (contains!759 (map!1193 (_2!1122 lt!43043)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!89492 () Bool)

(declare-fun res!45737 () Bool)

(assert (=> b!89492 (=> (not res!45737) (not e!58242))))

(assert (=> b!89492 (= res!45737 (valid!344 (_2!1122 lt!43043)))))

(declare-fun b!89493 () Bool)

(declare-fun Unit!2664 () Unit!2638)

(assert (=> b!89493 (= e!58243 Unit!2664)))

(declare-fun lt!43031 () Unit!2638)

(declare-fun lemmaArrayContainsKeyThenInListMap!21 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) (_ BitVec 32) Int) Unit!2638)

(assert (=> b!89493 (= lt!43031 (lemmaArrayContainsKeyThenInListMap!21 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(assert (=> b!89493 (contains!759 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))

(declare-fun lt!43042 () Unit!2638)

(assert (=> b!89493 (= lt!43042 lt!43031)))

(assert (=> b!89493 false))

(declare-fun b!89494 () Bool)

(assert (=> b!89494 (= e!58242 (= (map!1193 (_2!1122 lt!43043)) (+!111 (map!1193 newMap!16) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun b!89495 () Bool)

(declare-fun res!45744 () Bool)

(assert (=> b!89495 (= res!45744 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3134 lt!43030)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89495 (=> (not res!45744) (not e!58240))))

(declare-fun d!23819 () Bool)

(assert (=> d!23819 e!58242))

(declare-fun res!45739 () Bool)

(assert (=> d!23819 (=> (not res!45739) (not e!58242))))

(assert (=> d!23819 (= res!45739 (_1!1122 lt!43043))))

(assert (=> d!23819 (= lt!43043 (tuple2!2223 true (LongMapFixedSize!767 (defaultEntry!2371 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (bvadd (_size!432 newMap!16) #b00000000000000000000000000000001) (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))) (_vacant!432 newMap!16))))))

(declare-fun lt!43021 () Unit!2638)

(declare-fun lt!43034 () Unit!2638)

(assert (=> d!23819 (= lt!43021 lt!43034)))

(declare-fun lt!43026 () array!4035)

(declare-fun lt!43044 () array!4033)

(assert (=> d!23819 (contains!759 (getCurrentListMap!429 lt!43044 lt!43026 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569))))))

(assert (=> d!23819 (= lt!43034 (lemmaValidKeyInArrayIsInListMap!92 lt!43044 lt!43026 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23819 (= lt!43026 (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))))))

(assert (=> d!23819 (= lt!43044 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun lt!43028 () Unit!2638)

(declare-fun lt!43033 () Unit!2638)

(assert (=> d!23819 (= lt!43028 lt!43033)))

(declare-fun lt!43048 () array!4033)

(assert (=> d!23819 (= (arrayCountValidKeys!0 lt!43048 (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (bvadd (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4033 (_ BitVec 32)) Unit!2638)

(assert (=> d!23819 (= lt!43033 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!43048 (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569))))))

(assert (=> d!23819 (= lt!43048 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun lt!43027 () Unit!2638)

(declare-fun lt!43022 () Unit!2638)

(assert (=> d!23819 (= lt!43027 lt!43022)))

(declare-fun lt!43023 () array!4033)

(assert (=> d!23819 (arrayContainsKey!0 lt!43023 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!23819 (= lt!43022 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!43023 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569))))))

(assert (=> d!23819 (= lt!43023 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun lt!43024 () Unit!2638)

(declare-fun lt!43032 () Unit!2638)

(assert (=> d!23819 (= lt!43024 lt!43032)))

(assert (=> d!23819 (= (+!111 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (getCurrentListMap!429 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!21 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2638)

(assert (=> d!23819 (= lt!43032 (lemmaAddValidKeyToArrayThenAddPairToListMap!21 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43041 () Unit!2638)

(declare-fun lt!43025 () Unit!2638)

(assert (=> d!23819 (= lt!43041 lt!43025)))

(assert (=> d!23819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))) (mask!6414 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4033 (_ BitVec 32) (_ BitVec 32)) Unit!2638)

(assert (=> d!23819 (= lt!43025 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (mask!6414 newMap!16)))))

(declare-fun lt!43047 () Unit!2638)

(declare-fun lt!43046 () Unit!2638)

(assert (=> d!23819 (= lt!43047 lt!43046)))

(assert (=> d!23819 (= (arrayCountValidKeys!0 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))) #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4048 newMap!16) #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4033 (_ BitVec 32) (_ BitVec 64)) Unit!2638)

(assert (=> d!23819 (= lt!43046 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4048 newMap!16) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun lt!43045 () Unit!2638)

(declare-fun lt!43035 () Unit!2638)

(assert (=> d!23819 (= lt!43045 lt!43035)))

(declare-fun lt!43049 () (_ BitVec 32))

(declare-fun lt!43036 () List!1535)

(assert (=> d!23819 (arrayNoDuplicates!0 (array!4034 (store (arr!1918 (_keys!4048 newMap!16)) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) (size!2165 (_keys!4048 newMap!16))) lt!43049 lt!43036)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4033 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1535) Unit!2638)

(assert (=> d!23819 (= lt!43035 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569)) lt!43049 lt!43036))))

(assert (=> d!23819 (= lt!43036 Nil!1532)))

(assert (=> d!23819 (= lt!43049 #b00000000000000000000000000000000)))

(declare-fun lt!43050 () Unit!2638)

(assert (=> d!23819 (= lt!43050 e!58243)))

(declare-fun c!14886 () Bool)

(assert (=> d!23819 (= c!14886 (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!43029 () Unit!2638)

(assert (=> d!23819 (= lt!43029 e!58238)))

(assert (=> d!23819 (= c!14887 (contains!759 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23819 (valid!344 newMap!16)))

(assert (=> d!23819 (= (updateHelperNewKey!33 newMap!16 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (ite c!14709 (index!3134 lt!42569) (index!3131 lt!42569))) lt!43043)))

(declare-fun b!89486 () Bool)

(declare-fun res!45738 () Bool)

(assert (=> b!89486 (=> (not res!45738) (not e!58241))))

(declare-fun call!8699 () Bool)

(assert (=> b!89486 (= res!45738 call!8699)))

(assert (=> b!89486 (= e!58237 e!58241)))

(declare-fun b!89496 () Bool)

(assert (=> b!89496 (= e!58236 ((_ is Undefined!248) lt!43030))))

(declare-fun bm!8695 () Bool)

(assert (=> bm!8695 (= call!8700 (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!89497 () Bool)

(assert (=> b!89497 (= e!58236 e!58240)))

(declare-fun res!45740 () Bool)

(assert (=> b!89497 (= res!45740 call!8699)))

(assert (=> b!89497 (=> (not res!45740) (not e!58240))))

(declare-fun b!89498 () Bool)

(assert (=> b!89498 (= e!58239 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!43037)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun bm!8696 () Bool)

(assert (=> bm!8696 (= call!8697 (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun bm!8697 () Bool)

(assert (=> bm!8697 (= call!8699 call!8698)))

(declare-fun b!89499 () Bool)

(assert (=> b!89499 (= e!58241 (not call!8700))))

(declare-fun b!89500 () Bool)

(declare-fun lt!43039 () Unit!2638)

(assert (=> b!89500 (= e!58238 lt!43039)))

(assert (=> b!89500 (= lt!43039 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> b!89500 (= lt!43030 call!8697)))

(assert (=> b!89500 (= c!14884 ((_ is MissingZero!248) lt!43030))))

(assert (=> b!89500 e!58237))

(assert (= (and d!23819 c!14887) b!89490))

(assert (= (and d!23819 (not c!14887)) b!89500))

(assert (= (and b!89490 res!45742) b!89487))

(assert (= (and b!89487 res!45745) b!89498))

(assert (= (and b!89500 c!14884) b!89486))

(assert (= (and b!89500 (not c!14884)) b!89489))

(assert (= (and b!89486 res!45738) b!89488))

(assert (= (and b!89488 res!45741) b!89499))

(assert (= (and b!89489 c!14885) b!89497))

(assert (= (and b!89489 (not c!14885)) b!89496))

(assert (= (and b!89497 res!45740) b!89495))

(assert (= (and b!89495 res!45744) b!89484))

(assert (= (or b!89486 b!89497) bm!8697))

(assert (= (or b!89499 b!89484) bm!8695))

(assert (= (or b!89487 bm!8697) bm!8694))

(assert (= (or b!89490 b!89500) bm!8696))

(assert (= (and d!23819 c!14886) b!89493))

(assert (= (and d!23819 (not c!14886)) b!89485))

(assert (= (and d!23819 res!45739) b!89492))

(assert (= (and b!89492 res!45737) b!89491))

(assert (= (and b!89491 res!45743) b!89494))

(declare-fun m!95951 () Bool)

(assert (=> d!23819 m!95951))

(assert (=> d!23819 m!94993))

(declare-fun m!95953 () Bool)

(assert (=> d!23819 m!95953))

(declare-fun m!95955 () Bool)

(assert (=> d!23819 m!95955))

(assert (=> d!23819 m!94779))

(declare-fun m!95957 () Bool)

(assert (=> d!23819 m!95957))

(declare-fun m!95959 () Bool)

(assert (=> d!23819 m!95959))

(assert (=> d!23819 m!94779))

(assert (=> d!23819 m!95029))

(declare-fun m!95961 () Bool)

(assert (=> d!23819 m!95961))

(assert (=> d!23819 m!94993))

(assert (=> d!23819 m!94779))

(assert (=> d!23819 m!95017))

(declare-fun m!95963 () Bool)

(assert (=> d!23819 m!95963))

(declare-fun m!95965 () Bool)

(assert (=> d!23819 m!95965))

(assert (=> d!23819 m!94779))

(declare-fun m!95967 () Bool)

(assert (=> d!23819 m!95967))

(assert (=> d!23819 m!94779))

(declare-fun m!95969 () Bool)

(assert (=> d!23819 m!95969))

(declare-fun m!95971 () Bool)

(assert (=> d!23819 m!95971))

(assert (=> d!23819 m!95955))

(declare-fun m!95973 () Bool)

(assert (=> d!23819 m!95973))

(assert (=> d!23819 m!94779))

(declare-fun m!95975 () Bool)

(assert (=> d!23819 m!95975))

(assert (=> d!23819 m!94993))

(assert (=> d!23819 m!94779))

(declare-fun m!95977 () Bool)

(assert (=> d!23819 m!95977))

(assert (=> d!23819 m!94779))

(declare-fun m!95979 () Bool)

(assert (=> d!23819 m!95979))

(declare-fun m!95981 () Bool)

(assert (=> d!23819 m!95981))

(declare-fun m!95983 () Bool)

(assert (=> d!23819 m!95983))

(assert (=> d!23819 m!94827))

(assert (=> d!23819 m!95181))

(declare-fun m!95985 () Bool)

(assert (=> d!23819 m!95985))

(declare-fun m!95987 () Bool)

(assert (=> d!23819 m!95987))

(assert (=> d!23819 m!95971))

(declare-fun m!95989 () Bool)

(assert (=> b!89494 m!95989))

(assert (=> b!89494 m!94831))

(assert (=> b!89494 m!94831))

(declare-fun m!95991 () Bool)

(assert (=> b!89494 m!95991))

(assert (=> b!89491 m!95989))

(assert (=> b!89491 m!95989))

(assert (=> b!89491 m!94779))

(declare-fun m!95993 () Bool)

(assert (=> b!89491 m!95993))

(declare-fun m!95995 () Bool)

(assert (=> b!89488 m!95995))

(assert (=> bm!8696 m!94779))

(assert (=> bm!8696 m!94999))

(assert (=> b!89493 m!94779))

(declare-fun m!95997 () Bool)

(assert (=> b!89493 m!95997))

(assert (=> b!89493 m!94993))

(assert (=> b!89493 m!94993))

(assert (=> b!89493 m!94779))

(assert (=> b!89493 m!95017))

(declare-fun m!95999 () Bool)

(assert (=> bm!8694 m!95999))

(assert (=> b!89500 m!94779))

(assert (=> b!89500 m!95025))

(assert (=> b!89490 m!94779))

(assert (=> b!89490 m!95045))

(declare-fun m!96001 () Bool)

(assert (=> b!89498 m!96001))

(declare-fun m!96003 () Bool)

(assert (=> b!89495 m!96003))

(assert (=> bm!8695 m!94779))

(assert (=> bm!8695 m!95029))

(declare-fun m!96005 () Bool)

(assert (=> b!89492 m!96005))

(assert (=> bm!8587 d!23819))

(declare-fun d!23821 () Bool)

(declare-fun e!58246 () Bool)

(assert (=> d!23821 e!58246))

(declare-fun res!45748 () Bool)

(assert (=> d!23821 (=> (not res!45748) (not e!58246))))

(assert (=> d!23821 (= res!45748 (and (bvsge (index!3132 lt!42569) #b00000000000000000000000000000000) (bvslt (index!3132 lt!42569) (size!2165 (_keys!4048 newMap!16)))))))

(declare-fun lt!43053 () Unit!2638)

(declare-fun choose!539 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) Int) Unit!2638)

(assert (=> d!23821 (= lt!43053 (choose!539 (_keys!4048 newMap!16) lt!42587 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23821 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23821 (= (lemmaValidKeyInArrayIsInListMap!92 (_keys!4048 newMap!16) lt!42587 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (defaultEntry!2371 newMap!16)) lt!43053)))

(declare-fun b!89503 () Bool)

(assert (=> b!89503 (= e!58246 (contains!759 (getCurrentListMap!429 (_keys!4048 newMap!16) lt!42587 (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569))))))

(assert (= (and d!23821 res!45748) b!89503))

(declare-fun m!96007 () Bool)

(assert (=> d!23821 m!96007))

(assert (=> d!23821 m!95323))

(declare-fun m!96009 () Bool)

(assert (=> b!89503 m!96009))

(assert (=> b!89503 m!95009))

(assert (=> b!89503 m!96009))

(assert (=> b!89503 m!95009))

(declare-fun m!96011 () Bool)

(assert (=> b!89503 m!96011))

(assert (=> b!88888 d!23821))

(declare-fun d!23823 () Bool)

(declare-fun e!58249 () Bool)

(assert (=> d!23823 e!58249))

(declare-fun res!45751 () Bool)

(assert (=> d!23823 (=> (not res!45751) (not e!58249))))

(assert (=> d!23823 (= res!45751 (and (bvsge (index!3132 lt!42569) #b00000000000000000000000000000000) (bvslt (index!3132 lt!42569) (size!2166 (_values!2354 newMap!16)))))))

(declare-fun lt!43056 () Unit!2638)

(declare-fun choose!540 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 32) (_ BitVec 64) V!3041 Int) Unit!2638)

(assert (=> d!23823 (= lt!43056 (choose!540 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (defaultEntry!2371 newMap!16)))))

(assert (=> d!23823 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23823 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (index!3132 lt!42569) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380 (defaultEntry!2371 newMap!16)) lt!43056)))

(declare-fun b!89506 () Bool)

(assert (=> b!89506 (= e!58249 (= (+!111 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (getCurrentListMap!429 (_keys!4048 newMap!16) (array!4036 (store (arr!1919 (_values!2354 newMap!16)) (index!3132 lt!42569) (ValueCellFull!929 lt!42380)) (size!2166 (_values!2354 newMap!16))) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))))))

(assert (= (and d!23823 res!45751) b!89506))

(assert (=> d!23823 m!94779))

(declare-fun m!96013 () Bool)

(assert (=> d!23823 m!96013))

(assert (=> d!23823 m!95323))

(assert (=> b!89506 m!94993))

(assert (=> b!89506 m!94993))

(assert (=> b!89506 m!95953))

(assert (=> b!89506 m!94995))

(declare-fun m!96015 () Bool)

(assert (=> b!89506 m!96015))

(assert (=> b!88888 d!23823))

(declare-fun d!23825 () Bool)

(declare-fun e!58251 () Bool)

(assert (=> d!23825 e!58251))

(declare-fun res!45752 () Bool)

(assert (=> d!23825 (=> res!45752 e!58251)))

(declare-fun lt!43058 () Bool)

(assert (=> d!23825 (= res!45752 (not lt!43058))))

(declare-fun lt!43057 () Bool)

(assert (=> d!23825 (= lt!43058 lt!43057)))

(declare-fun lt!43060 () Unit!2638)

(declare-fun e!58250 () Unit!2638)

(assert (=> d!23825 (= lt!43060 e!58250)))

(declare-fun c!14888 () Bool)

(assert (=> d!23825 (= c!14888 lt!43057)))

(assert (=> d!23825 (= lt!43057 (containsKey!144 (toList!745 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23825 (= (contains!759 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) lt!43058)))

(declare-fun b!89507 () Bool)

(declare-fun lt!43059 () Unit!2638)

(assert (=> b!89507 (= e!58250 lt!43059)))

(assert (=> b!89507 (= lt!43059 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> b!89507 (isDefined!94 (getValueByKey!140 (toList!745 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!89508 () Bool)

(declare-fun Unit!2665 () Unit!2638)

(assert (=> b!89508 (= e!58250 Unit!2665)))

(declare-fun b!89509 () Bool)

(assert (=> b!89509 (= e!58251 (isDefined!94 (getValueByKey!140 (toList!745 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (= (and d!23825 c!14888) b!89507))

(assert (= (and d!23825 (not c!14888)) b!89508))

(assert (= (and d!23825 (not res!45752)) b!89509))

(assert (=> d!23825 m!94779))

(declare-fun m!96017 () Bool)

(assert (=> d!23825 m!96017))

(assert (=> b!89507 m!94779))

(declare-fun m!96019 () Bool)

(assert (=> b!89507 m!96019))

(assert (=> b!89507 m!94779))

(declare-fun m!96021 () Bool)

(assert (=> b!89507 m!96021))

(assert (=> b!89507 m!96021))

(declare-fun m!96023 () Bool)

(assert (=> b!89507 m!96023))

(assert (=> b!89509 m!94779))

(assert (=> b!89509 m!96021))

(assert (=> b!89509 m!96021))

(assert (=> b!89509 m!96023))

(assert (=> b!88888 d!23825))

(assert (=> b!88888 d!23721))

(assert (=> b!88975 d!23677))

(declare-fun b!89510 () Bool)

(declare-fun e!58254 () Bool)

(declare-fun call!8701 () Bool)

(assert (=> b!89510 (= e!58254 call!8701)))

(declare-fun bm!8698 () Bool)

(declare-fun c!14889 () Bool)

(assert (=> bm!8698 (= call!8701 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14889 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!14741 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532) Nil!1532)) (ite c!14741 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532) Nil!1532))))))

(declare-fun d!23827 () Bool)

(declare-fun res!45753 () Bool)

(declare-fun e!58253 () Bool)

(assert (=> d!23827 (=> res!45753 e!58253)))

(assert (=> d!23827 (= res!45753 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23827 (= (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!14741 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532) Nil!1532)) e!58253)))

(declare-fun b!89511 () Bool)

(assert (=> b!89511 (= e!58254 call!8701)))

(declare-fun b!89512 () Bool)

(declare-fun e!58252 () Bool)

(assert (=> b!89512 (= e!58253 e!58252)))

(declare-fun res!45755 () Bool)

(assert (=> b!89512 (=> (not res!45755) (not e!58252))))

(declare-fun e!58255 () Bool)

(assert (=> b!89512 (= res!45755 (not e!58255))))

(declare-fun res!45754 () Bool)

(assert (=> b!89512 (=> (not res!45754) (not e!58255))))

(assert (=> b!89512 (= res!45754 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!89513 () Bool)

(assert (=> b!89513 (= e!58252 e!58254)))

(assert (=> b!89513 (= c!14889 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!89514 () Bool)

(assert (=> b!89514 (= e!58255 (contains!761 (ite c!14741 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) Nil!1532) Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(assert (= (and d!23827 (not res!45753)) b!89512))

(assert (= (and b!89512 res!45754) b!89514))

(assert (= (and b!89512 res!45755) b!89513))

(assert (= (and b!89513 c!14889) b!89511))

(assert (= (and b!89513 (not c!14889)) b!89510))

(assert (= (or b!89511 b!89510) bm!8698))

(declare-fun m!96025 () Bool)

(assert (=> bm!8698 m!96025))

(declare-fun m!96027 () Bool)

(assert (=> bm!8698 m!96027))

(assert (=> b!89512 m!96025))

(assert (=> b!89512 m!96025))

(declare-fun m!96029 () Bool)

(assert (=> b!89512 m!96029))

(assert (=> b!89513 m!96025))

(assert (=> b!89513 m!96025))

(assert (=> b!89513 m!96029))

(assert (=> b!89514 m!96025))

(assert (=> b!89514 m!96025))

(declare-fun m!96031 () Bool)

(assert (=> b!89514 m!96031))

(assert (=> bm!8610 d!23827))

(declare-fun d!23829 () Bool)

(assert (=> d!23829 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000)))

(declare-fun lt!43063 () Unit!2638)

(declare-fun choose!13 (array!4033 (_ BitVec 64) (_ BitVec 32)) Unit!2638)

(assert (=> d!23829 (= lt!43063 (choose!13 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000))))

(assert (=> d!23829 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!23829 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000) lt!43063)))

(declare-fun bs!3749 () Bool)

(assert (= bs!3749 d!23829))

(assert (=> bs!3749 m!95263))

(declare-fun m!96033 () Bool)

(assert (=> bs!3749 m!96033))

(assert (=> b!89074 d!23829))

(declare-fun d!23831 () Bool)

(declare-fun res!45756 () Bool)

(declare-fun e!58256 () Bool)

(assert (=> d!23831 (=> res!45756 e!58256)))

(assert (=> d!23831 (= res!45756 (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) lt!42737))))

(assert (=> d!23831 (= (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 #b00000000000000000000000000000000) e!58256)))

(declare-fun b!89515 () Bool)

(declare-fun e!58257 () Bool)

(assert (=> b!89515 (= e!58256 e!58257)))

(declare-fun res!45757 () Bool)

(assert (=> b!89515 (=> (not res!45757) (not e!58257))))

(assert (=> b!89515 (= res!45757 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(declare-fun b!89516 () Bool)

(assert (=> b!89516 (= e!58257 (arrayContainsKey!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) lt!42737 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23831 (not res!45756)) b!89515))

(assert (= (and b!89515 res!45757) b!89516))

(assert (=> d!23831 m!95189))

(declare-fun m!96035 () Bool)

(assert (=> b!89516 m!96035))

(assert (=> b!89074 d!23831))

(declare-fun b!89517 () Bool)

(declare-fun e!58260 () SeekEntryResult!248)

(declare-fun lt!43065 () SeekEntryResult!248)

(assert (=> b!89517 (= e!58260 (seekKeyOrZeroReturnVacant!0 (x!12233 lt!43065) (index!3133 lt!43065) (index!3133 lt!43065) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))))))

(declare-fun b!89519 () Bool)

(declare-fun e!58258 () SeekEntryResult!248)

(assert (=> b!89519 (= e!58258 Undefined!248)))

(declare-fun b!89520 () Bool)

(declare-fun c!14890 () Bool)

(declare-fun lt!43066 () (_ BitVec 64))

(assert (=> b!89520 (= c!14890 (= lt!43066 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58259 () SeekEntryResult!248)

(assert (=> b!89520 (= e!58259 e!58260)))

(declare-fun d!23833 () Bool)

(declare-fun lt!43064 () SeekEntryResult!248)

(assert (=> d!23833 (and (or ((_ is Undefined!248) lt!43064) (not ((_ is Found!248) lt!43064)) (and (bvsge (index!3132 lt!43064) #b00000000000000000000000000000000) (bvslt (index!3132 lt!43064) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))) (or ((_ is Undefined!248) lt!43064) ((_ is Found!248) lt!43064) (not ((_ is MissingZero!248) lt!43064)) (and (bvsge (index!3131 lt!43064) #b00000000000000000000000000000000) (bvslt (index!3131 lt!43064) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))) (or ((_ is Undefined!248) lt!43064) ((_ is Found!248) lt!43064) ((_ is MissingZero!248) lt!43064) (not ((_ is MissingVacant!248) lt!43064)) (and (bvsge (index!3134 lt!43064) #b00000000000000000000000000000000) (bvslt (index!3134 lt!43064) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))) (or ((_ is Undefined!248) lt!43064) (ite ((_ is Found!248) lt!43064) (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (index!3132 lt!43064)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!248) lt!43064) (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (index!3131 lt!43064)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!248) lt!43064) (= (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (index!3134 lt!43064)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!23833 (= lt!43064 e!58258)))

(declare-fun c!14892 () Bool)

(assert (=> d!23833 (= c!14892 (and ((_ is Intermediate!248) lt!43065) (undefined!1060 lt!43065)))))

(assert (=> d!23833 (= lt!43065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) (mask!6414 (v!2667 (underlying!291 thiss!992)))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))))))

(assert (=> d!23833 (validMask!0 (mask!6414 (v!2667 (underlying!291 thiss!992))))))

(assert (=> d!23833 (= (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) (_keys!4048 (v!2667 (underlying!291 thiss!992))) (mask!6414 (v!2667 (underlying!291 thiss!992)))) lt!43064)))

(declare-fun b!89518 () Bool)

(assert (=> b!89518 (= e!58259 (Found!248 (index!3133 lt!43065)))))

(declare-fun b!89521 () Bool)

(assert (=> b!89521 (= e!58260 (MissingZero!248 (index!3133 lt!43065)))))

(declare-fun b!89522 () Bool)

(assert (=> b!89522 (= e!58258 e!58259)))

(assert (=> b!89522 (= lt!43066 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (index!3133 lt!43065)))))

(declare-fun c!14891 () Bool)

(assert (=> b!89522 (= c!14891 (= lt!43066 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23833 c!14892) b!89519))

(assert (= (and d!23833 (not c!14892)) b!89522))

(assert (= (and b!89522 c!14891) b!89518))

(assert (= (and b!89522 (not c!14891)) b!89520))

(assert (= (and b!89520 c!14890) b!89521))

(assert (= (and b!89520 (not c!14890)) b!89517))

(assert (=> b!89517 m!95189))

(declare-fun m!96037 () Bool)

(assert (=> b!89517 m!96037))

(assert (=> d!23833 m!94789))

(assert (=> d!23833 m!95189))

(declare-fun m!96039 () Bool)

(assert (=> d!23833 m!96039))

(declare-fun m!96041 () Bool)

(assert (=> d!23833 m!96041))

(assert (=> d!23833 m!96039))

(assert (=> d!23833 m!95189))

(declare-fun m!96043 () Bool)

(assert (=> d!23833 m!96043))

(declare-fun m!96045 () Bool)

(assert (=> d!23833 m!96045))

(declare-fun m!96047 () Bool)

(assert (=> d!23833 m!96047))

(declare-fun m!96049 () Bool)

(assert (=> b!89522 m!96049))

(assert (=> b!89074 d!23833))

(declare-fun d!23835 () Bool)

(declare-fun e!58262 () Bool)

(assert (=> d!23835 e!58262))

(declare-fun res!45758 () Bool)

(assert (=> d!23835 (=> res!45758 e!58262)))

(declare-fun lt!43068 () Bool)

(assert (=> d!23835 (= res!45758 (not lt!43068))))

(declare-fun lt!43067 () Bool)

(assert (=> d!23835 (= lt!43068 lt!43067)))

(declare-fun lt!43070 () Unit!2638)

(declare-fun e!58261 () Unit!2638)

(assert (=> d!23835 (= lt!43070 e!58261)))

(declare-fun c!14893 () Bool)

(assert (=> d!23835 (= c!14893 lt!43067)))

(assert (=> d!23835 (= lt!43067 (containsKey!144 (toList!745 lt!42718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23835 (= (contains!759 lt!42718 #b0000000000000000000000000000000000000000000000000000000000000000) lt!43068)))

(declare-fun b!89523 () Bool)

(declare-fun lt!43069 () Unit!2638)

(assert (=> b!89523 (= e!58261 lt!43069)))

(assert (=> b!89523 (= lt!43069 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89523 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89524 () Bool)

(declare-fun Unit!2666 () Unit!2638)

(assert (=> b!89524 (= e!58261 Unit!2666)))

(declare-fun b!89525 () Bool)

(assert (=> b!89525 (= e!58262 (isDefined!94 (getValueByKey!140 (toList!745 lt!42718) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23835 c!14893) b!89523))

(assert (= (and d!23835 (not c!14893)) b!89524))

(assert (= (and d!23835 (not res!45758)) b!89525))

(declare-fun m!96051 () Bool)

(assert (=> d!23835 m!96051))

(declare-fun m!96053 () Bool)

(assert (=> b!89523 m!96053))

(assert (=> b!89523 m!95787))

(assert (=> b!89523 m!95787))

(declare-fun m!96055 () Bool)

(assert (=> b!89523 m!96055))

(assert (=> b!89525 m!95787))

(assert (=> b!89525 m!95787))

(assert (=> b!89525 m!96055))

(assert (=> bm!8626 d!23835))

(declare-fun d!23837 () Bool)

(declare-fun lt!43073 () Bool)

(declare-fun content!94 (List!1535) (InoxSet (_ BitVec 64)))

(assert (=> d!23837 (= lt!43073 (select (content!94 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun e!58267 () Bool)

(assert (=> d!23837 (= lt!43073 e!58267)))

(declare-fun res!45764 () Bool)

(assert (=> d!23837 (=> (not res!45764) (not e!58267))))

(assert (=> d!23837 (= res!45764 ((_ is Cons!1531) Nil!1532))))

(assert (=> d!23837 (= (contains!761 Nil!1532 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)) lt!43073)))

(declare-fun b!89530 () Bool)

(declare-fun e!58268 () Bool)

(assert (=> b!89530 (= e!58267 e!58268)))

(declare-fun res!45763 () Bool)

(assert (=> b!89530 (=> res!45763 e!58268)))

(assert (=> b!89530 (= res!45763 (= (h!2123 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!89531 () Bool)

(assert (=> b!89531 (= e!58268 (contains!761 (t!5284 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!23837 res!45764) b!89530))

(assert (= (and b!89530 (not res!45763)) b!89531))

(declare-fun m!96057 () Bool)

(assert (=> d!23837 m!96057))

(assert (=> d!23837 m!95189))

(declare-fun m!96059 () Bool)

(assert (=> d!23837 m!96059))

(assert (=> b!89531 m!95189))

(declare-fun m!96061 () Bool)

(assert (=> b!89531 m!96061))

(assert (=> b!88977 d!23837))

(assert (=> b!88992 d!23689))

(assert (=> b!88934 d!23679))

(declare-fun d!23839 () Bool)

(declare-fun e!58269 () Bool)

(assert (=> d!23839 e!58269))

(declare-fun res!45765 () Bool)

(assert (=> d!23839 (=> (not res!45765) (not e!58269))))

(declare-fun lt!43075 () ListLongMap!1459)

(assert (=> d!23839 (= res!45765 (contains!759 lt!43075 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(declare-fun lt!43077 () List!1536)

(assert (=> d!23839 (= lt!43075 (ListLongMap!1460 lt!43077))))

(declare-fun lt!43076 () Unit!2638)

(declare-fun lt!43074 () Unit!2638)

(assert (=> d!23839 (= lt!43076 lt!43074)))

(assert (=> d!23839 (= (getValueByKey!140 lt!43077 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23839 (= lt!43074 (lemmaContainsTupThenGetReturnValue!60 lt!43077 (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23839 (= lt!43077 (insertStrictlySorted!63 (toList!745 call!8596) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))))))

(assert (=> d!23839 (= (+!111 call!8596 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)) lt!43075)))

(declare-fun b!89532 () Bool)

(declare-fun res!45766 () Bool)

(assert (=> b!89532 (=> (not res!45766) (not e!58269))))

(assert (=> b!89532 (= res!45766 (= (getValueByKey!140 (toList!745 lt!43075) (_1!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380))) (Some!145 (_2!1121 (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))))

(declare-fun b!89533 () Bool)

(assert (=> b!89533 (= e!58269 (contains!760 (toList!745 lt!43075) (tuple2!2221 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) lt!42380)))))

(assert (= (and d!23839 res!45765) b!89532))

(assert (= (and b!89532 res!45766) b!89533))

(declare-fun m!96063 () Bool)

(assert (=> d!23839 m!96063))

(declare-fun m!96065 () Bool)

(assert (=> d!23839 m!96065))

(declare-fun m!96067 () Bool)

(assert (=> d!23839 m!96067))

(declare-fun m!96069 () Bool)

(assert (=> d!23839 m!96069))

(declare-fun m!96071 () Bool)

(assert (=> b!89532 m!96071))

(declare-fun m!96073 () Bool)

(assert (=> b!89533 m!96073))

(assert (=> b!88864 d!23839))

(declare-fun d!23841 () Bool)

(assert (=> d!23841 (= (apply!84 lt!42718 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1217 (getValueByKey!140 (toList!745 lt!42718) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!3750 () Bool)

(assert (= bs!3750 d!23841))

(assert (=> bs!3750 m!95291))

(assert (=> bs!3750 m!95291))

(declare-fun m!96075 () Bool)

(assert (=> bs!3750 m!96075))

(assert (=> b!89059 d!23841))

(declare-fun d!23843 () Bool)

(declare-fun e!58271 () Bool)

(assert (=> d!23843 e!58271))

(declare-fun res!45767 () Bool)

(assert (=> d!23843 (=> res!45767 e!58271)))

(declare-fun lt!43079 () Bool)

(assert (=> d!23843 (= res!45767 (not lt!43079))))

(declare-fun lt!43078 () Bool)

(assert (=> d!23843 (= lt!43079 lt!43078)))

(declare-fun lt!43081 () Unit!2638)

(declare-fun e!58270 () Unit!2638)

(assert (=> d!23843 (= lt!43081 e!58270)))

(declare-fun c!14894 () Bool)

(assert (=> d!23843 (= c!14894 lt!43078)))

(assert (=> d!23843 (= lt!43078 (containsKey!144 (toList!745 lt!42616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!23843 (= (contains!759 lt!42616 #b1000000000000000000000000000000000000000000000000000000000000000) lt!43079)))

(declare-fun b!89534 () Bool)

(declare-fun lt!43080 () Unit!2638)

(assert (=> b!89534 (= e!58270 lt!43080)))

(assert (=> b!89534 (= lt!43080 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89534 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!89535 () Bool)

(declare-fun Unit!2667 () Unit!2638)

(assert (=> b!89535 (= e!58270 Unit!2667)))

(declare-fun b!89536 () Bool)

(assert (=> b!89536 (= e!58271 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!23843 c!14894) b!89534))

(assert (= (and d!23843 (not c!14894)) b!89535))

(assert (= (and d!23843 (not res!45767)) b!89536))

(declare-fun m!96077 () Bool)

(assert (=> d!23843 m!96077))

(declare-fun m!96079 () Bool)

(assert (=> b!89534 m!96079))

(declare-fun m!96081 () Bool)

(assert (=> b!89534 m!96081))

(assert (=> b!89534 m!96081))

(declare-fun m!96083 () Bool)

(assert (=> b!89534 m!96083))

(assert (=> b!89536 m!96081))

(assert (=> b!89536 m!96081))

(assert (=> b!89536 m!96083))

(assert (=> b!88935 d!23843))

(declare-fun d!23845 () Bool)

(declare-fun e!58272 () Bool)

(assert (=> d!23845 e!58272))

(declare-fun res!45768 () Bool)

(assert (=> d!23845 (=> (not res!45768) (not e!58272))))

(declare-fun lt!43083 () ListLongMap!1459)

(assert (=> d!23845 (= res!45768 (contains!759 lt!43083 (_1!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!43085 () List!1536)

(assert (=> d!23845 (= lt!43083 (ListLongMap!1460 lt!43085))))

(declare-fun lt!43084 () Unit!2638)

(declare-fun lt!43082 () Unit!2638)

(assert (=> d!23845 (= lt!43084 lt!43082)))

(assert (=> d!23845 (= (getValueByKey!140 lt!43085 (_1!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23845 (= lt!43082 (lemmaContainsTupThenGetReturnValue!60 lt!43085 (_1!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23845 (= lt!43085 (insertStrictlySorted!63 (toList!745 lt!42722) (_1!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23845 (= (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!43083)))

(declare-fun b!89537 () Bool)

(declare-fun res!45769 () Bool)

(assert (=> b!89537 (=> (not res!45769) (not e!58272))))

(assert (=> b!89537 (= res!45769 (= (getValueByKey!140 (toList!745 lt!43083) (_1!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89538 () Bool)

(assert (=> b!89538 (= e!58272 (contains!760 (toList!745 lt!43083) (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23845 res!45768) b!89537))

(assert (= (and b!89537 res!45769) b!89538))

(declare-fun m!96085 () Bool)

(assert (=> d!23845 m!96085))

(declare-fun m!96087 () Bool)

(assert (=> d!23845 m!96087))

(declare-fun m!96089 () Bool)

(assert (=> d!23845 m!96089))

(declare-fun m!96091 () Bool)

(assert (=> d!23845 m!96091))

(declare-fun m!96093 () Bool)

(assert (=> b!89537 m!96093))

(declare-fun m!96095 () Bool)

(assert (=> b!89538 m!96095))

(assert (=> b!89061 d!23845))

(declare-fun d!23847 () Bool)

(assert (=> d!23847 (= (apply!84 (+!111 lt!42714 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42713) (apply!84 lt!42714 lt!42713))))

(declare-fun lt!43088 () Unit!2638)

(declare-fun choose!541 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> d!23847 (= lt!43088 (choose!541 lt!42714 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42713))))

(declare-fun e!58275 () Bool)

(assert (=> d!23847 e!58275))

(declare-fun res!45772 () Bool)

(assert (=> d!23847 (=> (not res!45772) (not e!58275))))

(assert (=> d!23847 (= res!45772 (contains!759 lt!42714 lt!42713))))

(assert (=> d!23847 (= (addApplyDifferent!60 lt!42714 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42713) lt!43088)))

(declare-fun b!89542 () Bool)

(assert (=> b!89542 (= e!58275 (not (= lt!42713 lt!42729)))))

(assert (= (and d!23847 res!45772) b!89542))

(assert (=> d!23847 m!95241))

(declare-fun m!96097 () Bool)

(assert (=> d!23847 m!96097))

(declare-fun m!96099 () Bool)

(assert (=> d!23847 m!96099))

(assert (=> d!23847 m!95243))

(assert (=> d!23847 m!95241))

(assert (=> d!23847 m!95245))

(assert (=> b!89061 d!23847))

(assert (=> b!89061 d!23605))

(declare-fun d!23849 () Bool)

(declare-fun e!58276 () Bool)

(assert (=> d!23849 e!58276))

(declare-fun res!45773 () Bool)

(assert (=> d!23849 (=> (not res!45773) (not e!58276))))

(declare-fun lt!43090 () ListLongMap!1459)

(assert (=> d!23849 (= res!45773 (contains!759 lt!43090 (_1!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!43092 () List!1536)

(assert (=> d!23849 (= lt!43090 (ListLongMap!1460 lt!43092))))

(declare-fun lt!43091 () Unit!2638)

(declare-fun lt!43089 () Unit!2638)

(assert (=> d!23849 (= lt!43091 lt!43089)))

(assert (=> d!23849 (= (getValueByKey!140 lt!43092 (_1!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23849 (= lt!43089 (lemmaContainsTupThenGetReturnValue!60 lt!43092 (_1!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23849 (= lt!43092 (insertStrictlySorted!63 (toList!745 lt!42714) (_1!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23849 (= (+!111 lt!42714 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!43090)))

(declare-fun b!89543 () Bool)

(declare-fun res!45774 () Bool)

(assert (=> b!89543 (=> (not res!45774) (not e!58276))))

(assert (=> b!89543 (= res!45774 (= (getValueByKey!140 (toList!745 lt!43090) (_1!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89544 () Bool)

(assert (=> b!89544 (= e!58276 (contains!760 (toList!745 lt!43090) (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23849 res!45773) b!89543))

(assert (= (and b!89543 res!45774) b!89544))

(declare-fun m!96101 () Bool)

(assert (=> d!23849 m!96101))

(declare-fun m!96103 () Bool)

(assert (=> d!23849 m!96103))

(declare-fun m!96105 () Bool)

(assert (=> d!23849 m!96105))

(declare-fun m!96107 () Bool)

(assert (=> d!23849 m!96107))

(declare-fun m!96109 () Bool)

(assert (=> b!89543 m!96109))

(declare-fun m!96111 () Bool)

(assert (=> b!89544 m!96111))

(assert (=> b!89061 d!23849))

(declare-fun d!23851 () Bool)

(assert (=> d!23851 (contains!759 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42725)))

(declare-fun lt!43095 () Unit!2638)

(declare-fun choose!542 (ListLongMap!1459 (_ BitVec 64) V!3041 (_ BitVec 64)) Unit!2638)

(assert (=> d!23851 (= lt!43095 (choose!542 lt!42722 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42725))))

(assert (=> d!23851 (contains!759 lt!42722 lt!42725)))

(assert (=> d!23851 (= (addStillContains!60 lt!42722 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42725) lt!43095)))

(declare-fun bs!3751 () Bool)

(assert (= bs!3751 d!23851))

(assert (=> bs!3751 m!95227))

(assert (=> bs!3751 m!95227))

(assert (=> bs!3751 m!95229))

(declare-fun m!96113 () Bool)

(assert (=> bs!3751 m!96113))

(declare-fun m!96115 () Bool)

(assert (=> bs!3751 m!96115))

(assert (=> b!89061 d!23851))

(declare-fun d!23853 () Bool)

(assert (=> d!23853 (= (apply!84 lt!42714 lt!42713) (get!1217 (getValueByKey!140 (toList!745 lt!42714) lt!42713)))))

(declare-fun bs!3752 () Bool)

(assert (= bs!3752 d!23853))

(declare-fun m!96117 () Bool)

(assert (=> bs!3752 m!96117))

(assert (=> bs!3752 m!96117))

(declare-fun m!96119 () Bool)

(assert (=> bs!3752 m!96119))

(assert (=> b!89061 d!23853))

(declare-fun d!23855 () Bool)

(declare-fun e!58277 () Bool)

(assert (=> d!23855 e!58277))

(declare-fun res!45775 () Bool)

(assert (=> d!23855 (=> (not res!45775) (not e!58277))))

(declare-fun lt!43097 () ListLongMap!1459)

(assert (=> d!23855 (= res!45775 (contains!759 lt!43097 (_1!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!43099 () List!1536)

(assert (=> d!23855 (= lt!43097 (ListLongMap!1460 lt!43099))))

(declare-fun lt!43098 () Unit!2638)

(declare-fun lt!43096 () Unit!2638)

(assert (=> d!23855 (= lt!43098 lt!43096)))

(assert (=> d!23855 (= (getValueByKey!140 lt!43099 (_1!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23855 (= lt!43096 (lemmaContainsTupThenGetReturnValue!60 lt!43099 (_1!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23855 (= lt!43099 (insertStrictlySorted!63 (toList!745 lt!42710) (_1!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23855 (= (+!111 lt!42710 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!43097)))

(declare-fun b!89546 () Bool)

(declare-fun res!45776 () Bool)

(assert (=> b!89546 (=> (not res!45776) (not e!58277))))

(assert (=> b!89546 (= res!45776 (= (getValueByKey!140 (toList!745 lt!43097) (_1!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89547 () Bool)

(assert (=> b!89547 (= e!58277 (contains!760 (toList!745 lt!43097) (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23855 res!45775) b!89546))

(assert (= (and b!89546 res!45776) b!89547))

(declare-fun m!96121 () Bool)

(assert (=> d!23855 m!96121))

(declare-fun m!96123 () Bool)

(assert (=> d!23855 m!96123))

(declare-fun m!96125 () Bool)

(assert (=> d!23855 m!96125))

(declare-fun m!96127 () Bool)

(assert (=> d!23855 m!96127))

(declare-fun m!96129 () Bool)

(assert (=> b!89546 m!96129))

(declare-fun m!96131 () Bool)

(assert (=> b!89547 m!96131))

(assert (=> b!89061 d!23855))

(declare-fun d!23857 () Bool)

(assert (=> d!23857 (= (apply!84 (+!111 lt!42724 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42726) (apply!84 lt!42724 lt!42726))))

(declare-fun lt!43100 () Unit!2638)

(assert (=> d!23857 (= lt!43100 (choose!541 lt!42724 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42726))))

(declare-fun e!58278 () Bool)

(assert (=> d!23857 e!58278))

(declare-fun res!45777 () Bool)

(assert (=> d!23857 (=> (not res!45777) (not e!58278))))

(assert (=> d!23857 (= res!45777 (contains!759 lt!42724 lt!42726))))

(assert (=> d!23857 (= (addApplyDifferent!60 lt!42724 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42726) lt!43100)))

(declare-fun b!89548 () Bool)

(assert (=> b!89548 (= e!58278 (not (= lt!42726 lt!42716)))))

(assert (= (and d!23857 res!45777) b!89548))

(assert (=> d!23857 m!95231))

(declare-fun m!96133 () Bool)

(assert (=> d!23857 m!96133))

(declare-fun m!96135 () Bool)

(assert (=> d!23857 m!96135))

(assert (=> d!23857 m!95233))

(assert (=> d!23857 m!95231))

(assert (=> d!23857 m!95235))

(assert (=> b!89061 d!23857))

(declare-fun d!23859 () Bool)

(assert (=> d!23859 (= (apply!84 (+!111 lt!42714 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42713) (get!1217 (getValueByKey!140 (toList!745 (+!111 lt!42714 (tuple2!2221 lt!42729 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42713)))))

(declare-fun bs!3753 () Bool)

(assert (= bs!3753 d!23859))

(declare-fun m!96137 () Bool)

(assert (=> bs!3753 m!96137))

(assert (=> bs!3753 m!96137))

(declare-fun m!96139 () Bool)

(assert (=> bs!3753 m!96139))

(assert (=> b!89061 d!23859))

(declare-fun d!23861 () Bool)

(assert (=> d!23861 (= (apply!84 (+!111 lt!42724 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42726) (get!1217 (getValueByKey!140 (toList!745 (+!111 lt!42724 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42726)))))

(declare-fun bs!3754 () Bool)

(assert (= bs!3754 d!23861))

(declare-fun m!96141 () Bool)

(assert (=> bs!3754 m!96141))

(assert (=> bs!3754 m!96141))

(declare-fun m!96143 () Bool)

(assert (=> bs!3754 m!96143))

(assert (=> b!89061 d!23861))

(declare-fun d!23863 () Bool)

(declare-fun e!58279 () Bool)

(assert (=> d!23863 e!58279))

(declare-fun res!45778 () Bool)

(assert (=> d!23863 (=> (not res!45778) (not e!58279))))

(declare-fun lt!43102 () ListLongMap!1459)

(assert (=> d!23863 (= res!45778 (contains!759 lt!43102 (_1!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(declare-fun lt!43104 () List!1536)

(assert (=> d!23863 (= lt!43102 (ListLongMap!1460 lt!43104))))

(declare-fun lt!43103 () Unit!2638)

(declare-fun lt!43101 () Unit!2638)

(assert (=> d!23863 (= lt!43103 lt!43101)))

(assert (=> d!23863 (= (getValueByKey!140 lt!43104 (_1!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23863 (= lt!43101 (lemmaContainsTupThenGetReturnValue!60 lt!43104 (_1!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23863 (= lt!43104 (insertStrictlySorted!63 (toList!745 lt!42724) (_1!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) (_2!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))))))

(assert (=> d!23863 (= (+!111 lt!42724 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!43102)))

(declare-fun b!89549 () Bool)

(declare-fun res!45779 () Bool)

(assert (=> b!89549 (=> (not res!45779) (not e!58279))))

(assert (=> b!89549 (= res!45779 (= (getValueByKey!140 (toList!745 lt!43102) (_1!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) (Some!145 (_2!1121 (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))))

(declare-fun b!89550 () Bool)

(assert (=> b!89550 (= e!58279 (contains!760 (toList!745 lt!43102) (tuple2!2221 lt!42716 (minValue!2260 (v!2667 (underlying!291 thiss!992))))))))

(assert (= (and d!23863 res!45778) b!89549))

(assert (= (and b!89549 res!45779) b!89550))

(declare-fun m!96145 () Bool)

(assert (=> d!23863 m!96145))

(declare-fun m!96147 () Bool)

(assert (=> d!23863 m!96147))

(declare-fun m!96149 () Bool)

(assert (=> d!23863 m!96149))

(declare-fun m!96151 () Bool)

(assert (=> d!23863 m!96151))

(declare-fun m!96153 () Bool)

(assert (=> b!89549 m!96153))

(declare-fun m!96155 () Bool)

(assert (=> b!89550 m!96155))

(assert (=> b!89061 d!23863))

(declare-fun d!23865 () Bool)

(assert (=> d!23865 (= (apply!84 (+!111 lt!42710 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42728) (get!1217 (getValueByKey!140 (toList!745 (+!111 lt!42710 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42728)))))

(declare-fun bs!3755 () Bool)

(assert (= bs!3755 d!23865))

(declare-fun m!96157 () Bool)

(assert (=> bs!3755 m!96157))

(assert (=> bs!3755 m!96157))

(declare-fun m!96159 () Bool)

(assert (=> bs!3755 m!96159))

(assert (=> b!89061 d!23865))

(declare-fun d!23867 () Bool)

(assert (=> d!23867 (= (apply!84 lt!42710 lt!42728) (get!1217 (getValueByKey!140 (toList!745 lt!42710) lt!42728)))))

(declare-fun bs!3756 () Bool)

(assert (= bs!3756 d!23867))

(declare-fun m!96161 () Bool)

(assert (=> bs!3756 m!96161))

(assert (=> bs!3756 m!96161))

(declare-fun m!96163 () Bool)

(assert (=> bs!3756 m!96163))

(assert (=> b!89061 d!23867))

(declare-fun d!23869 () Bool)

(assert (=> d!23869 (= (apply!84 lt!42724 lt!42726) (get!1217 (getValueByKey!140 (toList!745 lt!42724) lt!42726)))))

(declare-fun bs!3757 () Bool)

(assert (= bs!3757 d!23869))

(declare-fun m!96165 () Bool)

(assert (=> bs!3757 m!96165))

(assert (=> bs!3757 m!96165))

(declare-fun m!96167 () Bool)

(assert (=> bs!3757 m!96167))

(assert (=> b!89061 d!23869))

(declare-fun d!23871 () Bool)

(assert (=> d!23871 (= (apply!84 (+!111 lt!42710 (tuple2!2221 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42728) (apply!84 lt!42710 lt!42728))))

(declare-fun lt!43105 () Unit!2638)

(assert (=> d!23871 (= lt!43105 (choose!541 lt!42710 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42728))))

(declare-fun e!58280 () Bool)

(assert (=> d!23871 e!58280))

(declare-fun res!45780 () Bool)

(assert (=> d!23871 (=> (not res!45780) (not e!58280))))

(assert (=> d!23871 (= res!45780 (contains!759 lt!42710 lt!42728))))

(assert (=> d!23871 (= (addApplyDifferent!60 lt!42710 lt!42723 (minValue!2260 (v!2667 (underlying!291 thiss!992))) lt!42728) lt!43105)))

(declare-fun b!89551 () Bool)

(assert (=> b!89551 (= e!58280 (not (= lt!42728 lt!42723)))))

(assert (= (and d!23871 res!45780) b!89551))

(assert (=> d!23871 m!95247))

(declare-fun m!96169 () Bool)

(assert (=> d!23871 m!96169))

(declare-fun m!96171 () Bool)

(assert (=> d!23871 m!96171))

(assert (=> d!23871 m!95253))

(assert (=> d!23871 m!95247))

(assert (=> d!23871 m!95249))

(assert (=> b!89061 d!23871))

(declare-fun d!23873 () Bool)

(declare-fun e!58282 () Bool)

(assert (=> d!23873 e!58282))

(declare-fun res!45781 () Bool)

(assert (=> d!23873 (=> res!45781 e!58282)))

(declare-fun lt!43107 () Bool)

(assert (=> d!23873 (= res!45781 (not lt!43107))))

(declare-fun lt!43106 () Bool)

(assert (=> d!23873 (= lt!43107 lt!43106)))

(declare-fun lt!43109 () Unit!2638)

(declare-fun e!58281 () Unit!2638)

(assert (=> d!23873 (= lt!43109 e!58281)))

(declare-fun c!14895 () Bool)

(assert (=> d!23873 (= c!14895 lt!43106)))

(assert (=> d!23873 (= lt!43106 (containsKey!144 (toList!745 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42725))))

(assert (=> d!23873 (= (contains!759 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992))))) lt!42725) lt!43107)))

(declare-fun b!89552 () Bool)

(declare-fun lt!43108 () Unit!2638)

(assert (=> b!89552 (= e!58281 lt!43108)))

(assert (=> b!89552 (= lt!43108 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42725))))

(assert (=> b!89552 (isDefined!94 (getValueByKey!140 (toList!745 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42725))))

(declare-fun b!89553 () Bool)

(declare-fun Unit!2668 () Unit!2638)

(assert (=> b!89553 (= e!58281 Unit!2668)))

(declare-fun b!89554 () Bool)

(assert (=> b!89554 (= e!58282 (isDefined!94 (getValueByKey!140 (toList!745 (+!111 lt!42722 (tuple2!2221 lt!42712 (zeroValue!2260 (v!2667 (underlying!291 thiss!992)))))) lt!42725)))))

(assert (= (and d!23873 c!14895) b!89552))

(assert (= (and d!23873 (not c!14895)) b!89553))

(assert (= (and d!23873 (not res!45781)) b!89554))

(declare-fun m!96173 () Bool)

(assert (=> d!23873 m!96173))

(declare-fun m!96175 () Bool)

(assert (=> b!89552 m!96175))

(declare-fun m!96177 () Bool)

(assert (=> b!89552 m!96177))

(assert (=> b!89552 m!96177))

(declare-fun m!96179 () Bool)

(assert (=> b!89552 m!96179))

(assert (=> b!89554 m!96177))

(assert (=> b!89554 m!96177))

(assert (=> b!89554 m!96179))

(assert (=> b!89061 d!23873))

(declare-fun d!23875 () Bool)

(declare-fun e!58284 () Bool)

(assert (=> d!23875 e!58284))

(declare-fun res!45782 () Bool)

(assert (=> d!23875 (=> res!45782 e!58284)))

(declare-fun lt!43111 () Bool)

(assert (=> d!23875 (= res!45782 (not lt!43111))))

(declare-fun lt!43110 () Bool)

(assert (=> d!23875 (= lt!43111 lt!43110)))

(declare-fun lt!43113 () Unit!2638)

(declare-fun e!58283 () Unit!2638)

(assert (=> d!23875 (= lt!43113 e!58283)))

(declare-fun c!14896 () Bool)

(assert (=> d!23875 (= c!14896 lt!43110)))

(assert (=> d!23875 (= lt!43110 (containsKey!144 (toList!745 lt!42628) (_1!1121 lt!42377)))))

(assert (=> d!23875 (= (contains!759 lt!42628 (_1!1121 lt!42377)) lt!43111)))

(declare-fun b!89555 () Bool)

(declare-fun lt!43112 () Unit!2638)

(assert (=> b!89555 (= e!58283 lt!43112)))

(assert (=> b!89555 (= lt!43112 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42628) (_1!1121 lt!42377)))))

(assert (=> b!89555 (isDefined!94 (getValueByKey!140 (toList!745 lt!42628) (_1!1121 lt!42377)))))

(declare-fun b!89556 () Bool)

(declare-fun Unit!2669 () Unit!2638)

(assert (=> b!89556 (= e!58283 Unit!2669)))

(declare-fun b!89557 () Bool)

(assert (=> b!89557 (= e!58284 (isDefined!94 (getValueByKey!140 (toList!745 lt!42628) (_1!1121 lt!42377))))))

(assert (= (and d!23875 c!14896) b!89555))

(assert (= (and d!23875 (not c!14896)) b!89556))

(assert (= (and d!23875 (not res!45782)) b!89557))

(declare-fun m!96181 () Bool)

(assert (=> d!23875 m!96181))

(declare-fun m!96183 () Bool)

(assert (=> b!89555 m!96183))

(assert (=> b!89555 m!95093))

(assert (=> b!89555 m!95093))

(declare-fun m!96185 () Bool)

(assert (=> b!89555 m!96185))

(assert (=> b!89557 m!95093))

(assert (=> b!89557 m!95093))

(assert (=> b!89557 m!96185))

(assert (=> d!23607 d!23875))

(declare-fun b!89560 () Bool)

(declare-fun e!58286 () Option!146)

(assert (=> b!89560 (= e!58286 (getValueByKey!140 (t!5285 lt!42630) (_1!1121 lt!42377)))))

(declare-fun b!89558 () Bool)

(declare-fun e!58285 () Option!146)

(assert (=> b!89558 (= e!58285 (Some!145 (_2!1121 (h!2124 lt!42630))))))

(declare-fun d!23877 () Bool)

(declare-fun c!14897 () Bool)

(assert (=> d!23877 (= c!14897 (and ((_ is Cons!1532) lt!42630) (= (_1!1121 (h!2124 lt!42630)) (_1!1121 lt!42377))))))

(assert (=> d!23877 (= (getValueByKey!140 lt!42630 (_1!1121 lt!42377)) e!58285)))

(declare-fun b!89559 () Bool)

(assert (=> b!89559 (= e!58285 e!58286)))

(declare-fun c!14898 () Bool)

(assert (=> b!89559 (= c!14898 (and ((_ is Cons!1532) lt!42630) (not (= (_1!1121 (h!2124 lt!42630)) (_1!1121 lt!42377)))))))

(declare-fun b!89561 () Bool)

(assert (=> b!89561 (= e!58286 None!144)))

(assert (= (and d!23877 c!14897) b!89558))

(assert (= (and d!23877 (not c!14897)) b!89559))

(assert (= (and b!89559 c!14898) b!89560))

(assert (= (and b!89559 (not c!14898)) b!89561))

(declare-fun m!96187 () Bool)

(assert (=> b!89560 m!96187))

(assert (=> d!23607 d!23877))

(declare-fun d!23879 () Bool)

(assert (=> d!23879 (= (getValueByKey!140 lt!42630 (_1!1121 lt!42377)) (Some!145 (_2!1121 lt!42377)))))

(declare-fun lt!43114 () Unit!2638)

(assert (=> d!23879 (= lt!43114 (choose!536 lt!42630 (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(declare-fun e!58287 () Bool)

(assert (=> d!23879 e!58287))

(declare-fun res!45783 () Bool)

(assert (=> d!23879 (=> (not res!45783) (not e!58287))))

(assert (=> d!23879 (= res!45783 (isStrictlySorted!295 lt!42630))))

(assert (=> d!23879 (= (lemmaContainsTupThenGetReturnValue!60 lt!42630 (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!43114)))

(declare-fun b!89562 () Bool)

(declare-fun res!45784 () Bool)

(assert (=> b!89562 (=> (not res!45784) (not e!58287))))

(assert (=> b!89562 (= res!45784 (containsKey!144 lt!42630 (_1!1121 lt!42377)))))

(declare-fun b!89563 () Bool)

(assert (=> b!89563 (= e!58287 (contains!760 lt!42630 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(assert (= (and d!23879 res!45783) b!89562))

(assert (= (and b!89562 res!45784) b!89563))

(assert (=> d!23879 m!95087))

(declare-fun m!96189 () Bool)

(assert (=> d!23879 m!96189))

(declare-fun m!96191 () Bool)

(assert (=> d!23879 m!96191))

(declare-fun m!96193 () Bool)

(assert (=> b!89562 m!96193))

(declare-fun m!96195 () Bool)

(assert (=> b!89563 m!96195))

(assert (=> d!23607 d!23879))

(declare-fun b!89564 () Bool)

(declare-fun e!58290 () List!1536)

(declare-fun call!8702 () List!1536)

(assert (=> b!89564 (= e!58290 call!8702)))

(declare-fun b!89565 () Bool)

(declare-fun c!14901 () Bool)

(assert (=> b!89565 (= c!14901 (and ((_ is Cons!1532) (toList!745 lt!42376)) (bvsgt (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42377))))))

(declare-fun e!58289 () List!1536)

(assert (=> b!89565 (= e!58290 e!58289)))

(declare-fun b!89566 () Bool)

(declare-fun call!8704 () List!1536)

(assert (=> b!89566 (= e!58289 call!8704)))

(declare-fun b!89567 () Bool)

(declare-fun e!58292 () Bool)

(declare-fun lt!43115 () List!1536)

(assert (=> b!89567 (= e!58292 (contains!760 lt!43115 (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377))))))

(declare-fun bm!8699 () Bool)

(declare-fun call!8703 () List!1536)

(assert (=> bm!8699 (= call!8702 call!8703)))

(declare-fun bm!8700 () Bool)

(assert (=> bm!8700 (= call!8704 call!8702)))

(declare-fun b!89568 () Bool)

(declare-fun e!58291 () List!1536)

(declare-fun c!14900 () Bool)

(assert (=> b!89568 (= e!58291 (ite c!14900 (t!5285 (toList!745 lt!42376)) (ite c!14901 (Cons!1532 (h!2124 (toList!745 lt!42376)) (t!5285 (toList!745 lt!42376))) Nil!1533)))))

(declare-fun b!89569 () Bool)

(declare-fun e!58288 () List!1536)

(assert (=> b!89569 (= e!58288 call!8703)))

(declare-fun b!89570 () Bool)

(assert (=> b!89570 (= e!58288 e!58290)))

(assert (=> b!89570 (= c!14900 (and ((_ is Cons!1532) (toList!745 lt!42376)) (= (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42377))))))

(declare-fun bm!8701 () Bool)

(declare-fun c!14902 () Bool)

(assert (=> bm!8701 (= call!8703 ($colon$colon!73 e!58291 (ite c!14902 (h!2124 (toList!745 lt!42376)) (tuple2!2221 (_1!1121 lt!42377) (_2!1121 lt!42377)))))))

(declare-fun c!14899 () Bool)

(assert (=> bm!8701 (= c!14899 c!14902)))

(declare-fun b!89571 () Bool)

(declare-fun res!45785 () Bool)

(assert (=> b!89571 (=> (not res!45785) (not e!58292))))

(assert (=> b!89571 (= res!45785 (containsKey!144 lt!43115 (_1!1121 lt!42377)))))

(declare-fun d!23881 () Bool)

(assert (=> d!23881 e!58292))

(declare-fun res!45786 () Bool)

(assert (=> d!23881 (=> (not res!45786) (not e!58292))))

(assert (=> d!23881 (= res!45786 (isStrictlySorted!295 lt!43115))))

(assert (=> d!23881 (= lt!43115 e!58288)))

(assert (=> d!23881 (= c!14902 (and ((_ is Cons!1532) (toList!745 lt!42376)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42376))) (_1!1121 lt!42377))))))

(assert (=> d!23881 (isStrictlySorted!295 (toList!745 lt!42376))))

(assert (=> d!23881 (= (insertStrictlySorted!63 (toList!745 lt!42376) (_1!1121 lt!42377) (_2!1121 lt!42377)) lt!43115)))

(declare-fun b!89572 () Bool)

(assert (=> b!89572 (= e!58289 call!8704)))

(declare-fun b!89573 () Bool)

(assert (=> b!89573 (= e!58291 (insertStrictlySorted!63 (t!5285 (toList!745 lt!42376)) (_1!1121 lt!42377) (_2!1121 lt!42377)))))

(assert (= (and d!23881 c!14902) b!89569))

(assert (= (and d!23881 (not c!14902)) b!89570))

(assert (= (and b!89570 c!14900) b!89564))

(assert (= (and b!89570 (not c!14900)) b!89565))

(assert (= (and b!89565 c!14901) b!89572))

(assert (= (and b!89565 (not c!14901)) b!89566))

(assert (= (or b!89572 b!89566) bm!8700))

(assert (= (or b!89564 bm!8700) bm!8699))

(assert (= (or b!89569 bm!8699) bm!8701))

(assert (= (and bm!8701 c!14899) b!89573))

(assert (= (and bm!8701 (not c!14899)) b!89568))

(assert (= (and d!23881 res!45786) b!89571))

(assert (= (and b!89571 res!45785) b!89567))

(declare-fun m!96197 () Bool)

(assert (=> d!23881 m!96197))

(assert (=> d!23881 m!95687))

(declare-fun m!96199 () Bool)

(assert (=> b!89573 m!96199))

(declare-fun m!96201 () Bool)

(assert (=> bm!8701 m!96201))

(declare-fun m!96203 () Bool)

(assert (=> b!89571 m!96203))

(declare-fun m!96205 () Bool)

(assert (=> b!89567 m!96205))

(assert (=> d!23607 d!23881))

(declare-fun d!23883 () Bool)

(declare-fun e!58294 () Bool)

(assert (=> d!23883 e!58294))

(declare-fun res!45787 () Bool)

(assert (=> d!23883 (=> res!45787 e!58294)))

(declare-fun lt!43117 () Bool)

(assert (=> d!23883 (= res!45787 (not lt!43117))))

(declare-fun lt!43116 () Bool)

(assert (=> d!23883 (= lt!43117 lt!43116)))

(declare-fun lt!43119 () Unit!2638)

(declare-fun e!58293 () Unit!2638)

(assert (=> d!23883 (= lt!43119 e!58293)))

(declare-fun c!14903 () Bool)

(assert (=> d!23883 (= c!14903 lt!43116)))

(assert (=> d!23883 (= lt!43116 (containsKey!144 (toList!745 e!57871) (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569)))))))

(assert (=> d!23883 (= (contains!759 e!57871 (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569)))) lt!43117)))

(declare-fun b!89574 () Bool)

(declare-fun lt!43118 () Unit!2638)

(assert (=> b!89574 (= e!58293 lt!43118)))

(assert (=> b!89574 (= lt!43118 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 e!57871) (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569)))))))

(assert (=> b!89574 (isDefined!94 (getValueByKey!140 (toList!745 e!57871) (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569)))))))

(declare-fun b!89575 () Bool)

(declare-fun Unit!2670 () Unit!2638)

(assert (=> b!89575 (= e!58293 Unit!2670)))

(declare-fun b!89576 () Bool)

(assert (=> b!89576 (= e!58294 (isDefined!94 (getValueByKey!140 (toList!745 e!57871) (ite c!14722 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (select (arr!1918 (_keys!4048 newMap!16)) (index!3132 lt!42569))))))))

(assert (= (and d!23883 c!14903) b!89574))

(assert (= (and d!23883 (not c!14903)) b!89575))

(assert (= (and d!23883 (not res!45787)) b!89576))

(declare-fun m!96207 () Bool)

(assert (=> d!23883 m!96207))

(declare-fun m!96209 () Bool)

(assert (=> b!89574 m!96209))

(declare-fun m!96211 () Bool)

(assert (=> b!89574 m!96211))

(assert (=> b!89574 m!96211))

(declare-fun m!96213 () Bool)

(assert (=> b!89574 m!96213))

(assert (=> b!89576 m!96211))

(assert (=> b!89576 m!96211))

(assert (=> b!89576 m!96213))

(assert (=> bm!8599 d!23883))

(assert (=> b!89075 d!23677))

(assert (=> b!89044 d!23679))

(declare-fun d!23885 () Bool)

(declare-fun lt!43120 () Bool)

(assert (=> d!23885 (= lt!43120 (select (content!94 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun e!58295 () Bool)

(assert (=> d!23885 (= lt!43120 e!58295)))

(declare-fun res!45789 () Bool)

(assert (=> d!23885 (=> (not res!45789) (not e!58295))))

(assert (=> d!23885 (= res!45789 ((_ is Cons!1531) Nil!1532))))

(assert (=> d!23885 (= (contains!761 Nil!1532 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) lt!43120)))

(declare-fun b!89577 () Bool)

(declare-fun e!58296 () Bool)

(assert (=> b!89577 (= e!58295 e!58296)))

(declare-fun res!45788 () Bool)

(assert (=> b!89577 (=> res!45788 e!58296)))

(assert (=> b!89577 (= res!45788 (= (h!2123 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(declare-fun b!89578 () Bool)

(assert (=> b!89578 (= e!58296 (contains!761 (t!5284 Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (= (and d!23885 res!45789) b!89577))

(assert (= (and b!89577 (not res!45788)) b!89578))

(assert (=> d!23885 m!96057))

(assert (=> d!23885 m!94779))

(declare-fun m!96215 () Bool)

(assert (=> d!23885 m!96215))

(assert (=> b!89578 m!94779))

(declare-fun m!96217 () Bool)

(assert (=> b!89578 m!96217))

(assert (=> b!88994 d!23885))

(declare-fun d!23887 () Bool)

(declare-fun res!45798 () Bool)

(declare-fun e!58299 () Bool)

(assert (=> d!23887 (=> (not res!45798) (not e!58299))))

(assert (=> d!23887 (= res!45798 (validMask!0 (mask!6414 newMap!16)))))

(assert (=> d!23887 (= (simpleValid!60 newMap!16) e!58299)))

(declare-fun b!89587 () Bool)

(declare-fun res!45801 () Bool)

(assert (=> b!89587 (=> (not res!45801) (not e!58299))))

(assert (=> b!89587 (= res!45801 (and (= (size!2166 (_values!2354 newMap!16)) (bvadd (mask!6414 newMap!16) #b00000000000000000000000000000001)) (= (size!2165 (_keys!4048 newMap!16)) (size!2166 (_values!2354 newMap!16))) (bvsge (_size!432 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!432 newMap!16) (bvadd (mask!6414 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!89590 () Bool)

(assert (=> b!89590 (= e!58299 (and (bvsge (extraKeys!2204 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2204 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!432 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!89588 () Bool)

(declare-fun res!45799 () Bool)

(assert (=> b!89588 (=> (not res!45799) (not e!58299))))

(declare-fun size!2171 (LongMapFixedSize!766) (_ BitVec 32))

(assert (=> b!89588 (= res!45799 (bvsge (size!2171 newMap!16) (_size!432 newMap!16)))))

(declare-fun b!89589 () Bool)

(declare-fun res!45800 () Bool)

(assert (=> b!89589 (=> (not res!45800) (not e!58299))))

(assert (=> b!89589 (= res!45800 (= (size!2171 newMap!16) (bvadd (_size!432 newMap!16) (bvsdiv (bvadd (extraKeys!2204 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!23887 res!45798) b!89587))

(assert (= (and b!89587 res!45801) b!89588))

(assert (= (and b!89588 res!45799) b!89589))

(assert (= (and b!89589 res!45800) b!89590))

(assert (=> d!23887 m!95323))

(declare-fun m!96219 () Bool)

(assert (=> b!89588 m!96219))

(assert (=> b!89589 m!96219))

(assert (=> d!23629 d!23887))

(declare-fun d!23889 () Bool)

(declare-fun e!58301 () Bool)

(assert (=> d!23889 e!58301))

(declare-fun res!45802 () Bool)

(assert (=> d!23889 (=> res!45802 e!58301)))

(declare-fun lt!43122 () Bool)

(assert (=> d!23889 (= res!45802 (not lt!43122))))

(declare-fun lt!43121 () Bool)

(assert (=> d!23889 (= lt!43122 lt!43121)))

(declare-fun lt!43124 () Unit!2638)

(declare-fun e!58300 () Unit!2638)

(assert (=> d!23889 (= lt!43124 e!58300)))

(declare-fun c!14904 () Bool)

(assert (=> d!23889 (= c!14904 lt!43121)))

(assert (=> d!23889 (= lt!43121 (containsKey!144 (toList!745 lt!42616) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!23889 (= (contains!759 lt!42616 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!43122)))

(declare-fun b!89591 () Bool)

(declare-fun lt!43123 () Unit!2638)

(assert (=> b!89591 (= e!58300 lt!43123)))

(assert (=> b!89591 (= lt!43123 (lemmaContainsKeyImpliesGetValueByKeyDefined!93 (toList!745 lt!42616) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!89591 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!89592 () Bool)

(declare-fun Unit!2671 () Unit!2638)

(assert (=> b!89592 (= e!58300 Unit!2671)))

(declare-fun b!89593 () Bool)

(assert (=> b!89593 (= e!58301 (isDefined!94 (getValueByKey!140 (toList!745 lt!42616) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!23889 c!14904) b!89591))

(assert (= (and d!23889 (not c!14904)) b!89592))

(assert (= (and d!23889 (not res!45802)) b!89593))

(assert (=> d!23889 m!95059))

(declare-fun m!96221 () Bool)

(assert (=> d!23889 m!96221))

(assert (=> b!89591 m!95059))

(declare-fun m!96223 () Bool)

(assert (=> b!89591 m!96223))

(assert (=> b!89591 m!95059))

(declare-fun m!96225 () Bool)

(assert (=> b!89591 m!96225))

(assert (=> b!89591 m!96225))

(declare-fun m!96227 () Bool)

(assert (=> b!89591 m!96227))

(assert (=> b!89593 m!95059))

(assert (=> b!89593 m!96225))

(assert (=> b!89593 m!96225))

(assert (=> b!89593 m!96227))

(assert (=> b!88928 d!23889))

(declare-fun d!23891 () Bool)

(assert (=> d!23891 (= (+!111 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2221 #b0000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) lt!42588 lt!42380 (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43127 () Unit!2638)

(declare-fun choose!543 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2638)

(assert (=> d!23891 (= lt!43127 (choose!543 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42588 (zeroValue!2260 newMap!16) lt!42380 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23891 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23891 (= (lemmaChangeZeroKeyThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42588 (zeroValue!2260 newMap!16) lt!42380 (minValue!2260 newMap!16) (defaultEntry!2371 newMap!16)) lt!43127)))

(declare-fun bs!3758 () Bool)

(assert (= bs!3758 d!23891))

(declare-fun m!96229 () Bool)

(assert (=> bs!3758 m!96229))

(assert (=> bs!3758 m!94993))

(declare-fun m!96231 () Bool)

(assert (=> bs!3758 m!96231))

(declare-fun m!96233 () Bool)

(assert (=> bs!3758 m!96233))

(assert (=> bs!3758 m!94993))

(assert (=> bs!3758 m!95323))

(assert (=> b!88858 d!23891))

(declare-fun d!23893 () Bool)

(assert (=> d!23893 (= (apply!84 lt!42718 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1217 (getValueByKey!140 (toList!745 lt!42718) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3759 () Bool)

(assert (= bs!3759 d!23893))

(assert (=> bs!3759 m!95059))

(assert (=> bs!3759 m!95421))

(assert (=> bs!3759 m!95421))

(declare-fun m!96235 () Bool)

(assert (=> bs!3759 m!96235))

(assert (=> b!89053 d!23893))

(assert (=> b!89053 d!23761))

(declare-fun b!89596 () Bool)

(declare-fun e!58303 () Option!146)

(assert (=> b!89596 (= e!58303 (getValueByKey!140 (t!5285 (toList!745 lt!42640)) (_1!1121 lt!42377)))))

(declare-fun b!89594 () Bool)

(declare-fun e!58302 () Option!146)

(assert (=> b!89594 (= e!58302 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42640)))))))

(declare-fun d!23895 () Bool)

(declare-fun c!14905 () Bool)

(assert (=> d!23895 (= c!14905 (and ((_ is Cons!1532) (toList!745 lt!42640)) (= (_1!1121 (h!2124 (toList!745 lt!42640))) (_1!1121 lt!42377))))))

(assert (=> d!23895 (= (getValueByKey!140 (toList!745 lt!42640) (_1!1121 lt!42377)) e!58302)))

(declare-fun b!89595 () Bool)

(assert (=> b!89595 (= e!58302 e!58303)))

(declare-fun c!14906 () Bool)

(assert (=> b!89595 (= c!14906 (and ((_ is Cons!1532) (toList!745 lt!42640)) (not (= (_1!1121 (h!2124 (toList!745 lt!42640))) (_1!1121 lt!42377)))))))

(declare-fun b!89597 () Bool)

(assert (=> b!89597 (= e!58303 None!144)))

(assert (= (and d!23895 c!14905) b!89594))

(assert (= (and d!23895 (not c!14905)) b!89595))

(assert (= (and b!89595 c!14906) b!89596))

(assert (= (and b!89595 (not c!14906)) b!89597))

(declare-fun m!96237 () Bool)

(assert (=> b!89596 m!96237))

(assert (=> b!88946 d!23895))

(declare-fun d!23897 () Bool)

(declare-fun res!45807 () Bool)

(declare-fun e!58308 () Bool)

(assert (=> d!23897 (=> res!45807 e!58308)))

(assert (=> d!23897 (= res!45807 (and ((_ is Cons!1532) (toList!745 lt!42393)) (= (_1!1121 (h!2124 (toList!745 lt!42393))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(assert (=> d!23897 (= (containsKey!144 (toList!745 lt!42393) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)) e!58308)))

(declare-fun b!89602 () Bool)

(declare-fun e!58309 () Bool)

(assert (=> b!89602 (= e!58308 e!58309)))

(declare-fun res!45808 () Bool)

(assert (=> b!89602 (=> (not res!45808) (not e!58309))))

(assert (=> b!89602 (= res!45808 (and (or (not ((_ is Cons!1532) (toList!745 lt!42393))) (bvsle (_1!1121 (h!2124 (toList!745 lt!42393))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))) ((_ is Cons!1532) (toList!745 lt!42393)) (bvslt (_1!1121 (h!2124 (toList!745 lt!42393))) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355))))))

(declare-fun b!89603 () Bool)

(assert (=> b!89603 (= e!58309 (containsKey!144 (t!5285 (toList!745 lt!42393)) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (= (and d!23897 (not res!45807)) b!89602))

(assert (= (and b!89602 res!45808) b!89603))

(assert (=> b!89603 m!94779))

(declare-fun m!96239 () Bool)

(assert (=> b!89603 m!96239))

(assert (=> d!23599 d!23897))

(declare-fun d!23899 () Bool)

(declare-fun res!45809 () Bool)

(declare-fun e!58310 () Bool)

(assert (=> d!23899 (=> res!45809 e!58310)))

(assert (=> d!23899 (= res!45809 (= (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355)))))

(assert (=> d!23899 (= (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000) e!58310)))

(declare-fun b!89604 () Bool)

(declare-fun e!58311 () Bool)

(assert (=> b!89604 (= e!58310 e!58311)))

(declare-fun res!45810 () Bool)

(assert (=> b!89604 (=> (not res!45810) (not e!58311))))

(assert (=> b!89604 (= res!45810 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun b!89605 () Bool)

(assert (=> b!89605 (= e!58311 (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23899 (not res!45809)) b!89604))

(assert (= (and b!89604 res!45810) b!89605))

(assert (=> d!23899 m!95325))

(assert (=> b!89605 m!94779))

(declare-fun m!96241 () Bool)

(assert (=> b!89605 m!96241))

(assert (=> bm!8596 d!23899))

(declare-fun b!89606 () Bool)

(declare-fun e!58312 () Bool)

(declare-fun call!8705 () Bool)

(assert (=> b!89606 (= e!58312 call!8705)))

(declare-fun b!89607 () Bool)

(declare-fun e!58314 () Bool)

(assert (=> b!89607 (= e!58314 call!8705)))

(declare-fun b!89608 () Bool)

(assert (=> b!89608 (= e!58314 e!58312)))

(declare-fun lt!43128 () (_ BitVec 64))

(assert (=> b!89608 (= lt!43128 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!43129 () Unit!2638)

(assert (=> b!89608 (= lt!43129 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4048 newMap!16) lt!43128 #b00000000000000000000000000000000))))

(assert (=> b!89608 (arrayContainsKey!0 (_keys!4048 newMap!16) lt!43128 #b00000000000000000000000000000000)))

(declare-fun lt!43130 () Unit!2638)

(assert (=> b!89608 (= lt!43130 lt!43129)))

(declare-fun res!45811 () Bool)

(assert (=> b!89608 (= res!45811 (= (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000) (_keys!4048 newMap!16) (mask!6414 newMap!16)) (Found!248 #b00000000000000000000000000000000)))))

(assert (=> b!89608 (=> (not res!45811) (not e!58312))))

(declare-fun d!23901 () Bool)

(declare-fun res!45812 () Bool)

(declare-fun e!58313 () Bool)

(assert (=> d!23901 (=> res!45812 e!58313)))

(assert (=> d!23901 (= res!45812 (bvsge #b00000000000000000000000000000000 (size!2165 (_keys!4048 newMap!16))))))

(assert (=> d!23901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4048 newMap!16) (mask!6414 newMap!16)) e!58313)))

(declare-fun bm!8702 () Bool)

(assert (=> bm!8702 (= call!8705 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun b!89609 () Bool)

(assert (=> b!89609 (= e!58313 e!58314)))

(declare-fun c!14907 () Bool)

(assert (=> b!89609 (= c!14907 (validKeyInArray!0 (select (arr!1918 (_keys!4048 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!23901 (not res!45812)) b!89609))

(assert (= (and b!89609 c!14907) b!89608))

(assert (= (and b!89609 (not c!14907)) b!89607))

(assert (= (and b!89608 res!45811) b!89606))

(assert (= (or b!89606 b!89607) bm!8702))

(assert (=> b!89608 m!95325))

(declare-fun m!96243 () Bool)

(assert (=> b!89608 m!96243))

(declare-fun m!96245 () Bool)

(assert (=> b!89608 m!96245))

(assert (=> b!89608 m!95325))

(declare-fun m!96247 () Bool)

(assert (=> b!89608 m!96247))

(declare-fun m!96249 () Bool)

(assert (=> bm!8702 m!96249))

(assert (=> b!89609 m!95325))

(assert (=> b!89609 m!95325))

(assert (=> b!89609 m!95327))

(assert (=> b!88961 d!23901))

(declare-fun b!89612 () Bool)

(declare-fun e!58316 () Option!146)

(assert (=> b!89612 (= e!58316 (getValueByKey!140 (t!5285 (toList!745 lt!42644)) (_1!1121 lt!42377)))))

(declare-fun b!89610 () Bool)

(declare-fun e!58315 () Option!146)

(assert (=> b!89610 (= e!58315 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42644)))))))

(declare-fun d!23903 () Bool)

(declare-fun c!14908 () Bool)

(assert (=> d!23903 (= c!14908 (and ((_ is Cons!1532) (toList!745 lt!42644)) (= (_1!1121 (h!2124 (toList!745 lt!42644))) (_1!1121 lt!42377))))))

(assert (=> d!23903 (= (getValueByKey!140 (toList!745 lt!42644) (_1!1121 lt!42377)) e!58315)))

(declare-fun b!89611 () Bool)

(assert (=> b!89611 (= e!58315 e!58316)))

(declare-fun c!14909 () Bool)

(assert (=> b!89611 (= c!14909 (and ((_ is Cons!1532) (toList!745 lt!42644)) (not (= (_1!1121 (h!2124 (toList!745 lt!42644))) (_1!1121 lt!42377)))))))

(declare-fun b!89613 () Bool)

(assert (=> b!89613 (= e!58316 None!144)))

(assert (= (and d!23903 c!14908) b!89610))

(assert (= (and d!23903 (not c!14908)) b!89611))

(assert (= (and b!89611 c!14909) b!89612))

(assert (= (and b!89611 (not c!14909)) b!89613))

(declare-fun m!96251 () Bool)

(assert (=> b!89612 m!96251))

(assert (=> b!88948 d!23903))

(declare-fun b!89630 () Bool)

(declare-fun lt!43135 () SeekEntryResult!248)

(assert (=> b!89630 (and (bvsge (index!3131 lt!43135) #b00000000000000000000000000000000) (bvslt (index!3131 lt!43135) (size!2165 (_keys!4048 newMap!16))))))

(declare-fun res!45824 () Bool)

(assert (=> b!89630 (= res!45824 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3131 lt!43135)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!58327 () Bool)

(assert (=> b!89630 (=> (not res!45824) (not e!58327))))

(declare-fun c!14915 () Bool)

(declare-fun call!8710 () Bool)

(declare-fun bm!8707 () Bool)

(assert (=> bm!8707 (= call!8710 (inRange!0 (ite c!14915 (index!3131 lt!43135) (index!3134 lt!43135)) (mask!6414 newMap!16)))))

(declare-fun b!89631 () Bool)

(declare-fun e!58326 () Bool)

(assert (=> b!89631 (= e!58326 ((_ is Undefined!248) lt!43135))))

(declare-fun b!89632 () Bool)

(declare-fun e!58325 () Bool)

(assert (=> b!89632 (= e!58325 e!58327)))

(declare-fun res!45823 () Bool)

(assert (=> b!89632 (= res!45823 call!8710)))

(assert (=> b!89632 (=> (not res!45823) (not e!58327))))

(declare-fun d!23905 () Bool)

(assert (=> d!23905 e!58325))

(assert (=> d!23905 (= c!14915 ((_ is MissingZero!248) lt!43135))))

(assert (=> d!23905 (= lt!43135 (seekEntryOrOpen!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (_keys!4048 newMap!16) (mask!6414 newMap!16)))))

(declare-fun lt!43136 () Unit!2638)

(declare-fun choose!544 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 (_ BitVec 64) Int) Unit!2638)

(assert (=> d!23905 (= lt!43136 (choose!544 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)))))

(assert (=> d!23905 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23905 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) (defaultEntry!2371 newMap!16)) lt!43136)))

(declare-fun b!89633 () Bool)

(declare-fun e!58328 () Bool)

(declare-fun call!8711 () Bool)

(assert (=> b!89633 (= e!58328 (not call!8711))))

(declare-fun b!89634 () Bool)

(declare-fun res!45821 () Bool)

(assert (=> b!89634 (=> (not res!45821) (not e!58328))))

(assert (=> b!89634 (= res!45821 call!8710)))

(assert (=> b!89634 (= e!58326 e!58328)))

(declare-fun b!89635 () Bool)

(assert (=> b!89635 (= e!58327 (not call!8711))))

(declare-fun bm!8708 () Bool)

(assert (=> bm!8708 (= call!8711 (arrayContainsKey!0 (_keys!4048 newMap!16) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!89636 () Bool)

(assert (=> b!89636 (= e!58325 e!58326)))

(declare-fun c!14914 () Bool)

(assert (=> b!89636 (= c!14914 ((_ is MissingVacant!248) lt!43135))))

(declare-fun b!89637 () Bool)

(declare-fun res!45822 () Bool)

(assert (=> b!89637 (=> (not res!45822) (not e!58328))))

(assert (=> b!89637 (= res!45822 (= (select (arr!1918 (_keys!4048 newMap!16)) (index!3134 lt!43135)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!89637 (and (bvsge (index!3134 lt!43135) #b00000000000000000000000000000000) (bvslt (index!3134 lt!43135) (size!2165 (_keys!4048 newMap!16))))))

(assert (= (and d!23905 c!14915) b!89632))

(assert (= (and d!23905 (not c!14915)) b!89636))

(assert (= (and b!89632 res!45823) b!89630))

(assert (= (and b!89630 res!45824) b!89635))

(assert (= (and b!89636 c!14914) b!89634))

(assert (= (and b!89636 (not c!14914)) b!89631))

(assert (= (and b!89634 res!45821) b!89637))

(assert (= (and b!89637 res!45822) b!89633))

(assert (= (or b!89632 b!89634) bm!8707))

(assert (= (or b!89635 b!89633) bm!8708))

(declare-fun m!96253 () Bool)

(assert (=> b!89630 m!96253))

(assert (=> bm!8708 m!94779))

(assert (=> bm!8708 m!95029))

(declare-fun m!96255 () Bool)

(assert (=> bm!8707 m!96255))

(declare-fun m!96257 () Bool)

(assert (=> b!89637 m!96257))

(assert (=> d!23905 m!94779))

(assert (=> d!23905 m!94999))

(assert (=> d!23905 m!94779))

(declare-fun m!96259 () Bool)

(assert (=> d!23905 m!96259))

(assert (=> d!23905 m!95323))

(assert (=> bm!8597 d!23905))

(declare-fun b!89640 () Bool)

(declare-fun e!58330 () Option!146)

(assert (=> b!89640 (= e!58330 (getValueByKey!140 (t!5285 (toList!745 lt!42648)) (_1!1121 lt!42383)))))

(declare-fun b!89638 () Bool)

(declare-fun e!58329 () Option!146)

(assert (=> b!89638 (= e!58329 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42648)))))))

(declare-fun d!23907 () Bool)

(declare-fun c!14916 () Bool)

(assert (=> d!23907 (= c!14916 (and ((_ is Cons!1532) (toList!745 lt!42648)) (= (_1!1121 (h!2124 (toList!745 lt!42648))) (_1!1121 lt!42383))))))

(assert (=> d!23907 (= (getValueByKey!140 (toList!745 lt!42648) (_1!1121 lt!42383)) e!58329)))

(declare-fun b!89639 () Bool)

(assert (=> b!89639 (= e!58329 e!58330)))

(declare-fun c!14917 () Bool)

(assert (=> b!89639 (= c!14917 (and ((_ is Cons!1532) (toList!745 lt!42648)) (not (= (_1!1121 (h!2124 (toList!745 lt!42648))) (_1!1121 lt!42383)))))))

(declare-fun b!89641 () Bool)

(assert (=> b!89641 (= e!58330 None!144)))

(assert (= (and d!23907 c!14916) b!89638))

(assert (= (and d!23907 (not c!14916)) b!89639))

(assert (= (and b!89639 c!14917) b!89640))

(assert (= (and b!89639 (not c!14917)) b!89641))

(declare-fun m!96261 () Bool)

(assert (=> b!89640 m!96261))

(assert (=> b!88950 d!23907))

(declare-fun b!89642 () Bool)

(declare-fun e!58333 () Bool)

(declare-fun call!8712 () Bool)

(assert (=> b!89642 (= e!58333 call!8712)))

(declare-fun bm!8709 () Bool)

(declare-fun c!14918 () Bool)

(assert (=> bm!8709 (= call!8712 (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!14918 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!14737 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) Nil!1532) Nil!1532)) (ite c!14737 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) Nil!1532) Nil!1532))))))

(declare-fun d!23909 () Bool)

(declare-fun res!45825 () Bool)

(declare-fun e!58332 () Bool)

(assert (=> d!23909 (=> res!45825 e!58332)))

(assert (=> d!23909 (= res!45825 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2165 (_keys!4048 (v!2667 (underlying!291 thiss!992))))))))

(assert (=> d!23909 (= (arrayNoDuplicates!0 (_keys!4048 (v!2667 (underlying!291 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!14737 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) Nil!1532) Nil!1532)) e!58332)))

(declare-fun b!89643 () Bool)

(assert (=> b!89643 (= e!58333 call!8712)))

(declare-fun b!89644 () Bool)

(declare-fun e!58331 () Bool)

(assert (=> b!89644 (= e!58332 e!58331)))

(declare-fun res!45827 () Bool)

(assert (=> b!89644 (=> (not res!45827) (not e!58331))))

(declare-fun e!58334 () Bool)

(assert (=> b!89644 (= res!45827 (not e!58334))))

(declare-fun res!45826 () Bool)

(assert (=> b!89644 (=> (not res!45826) (not e!58334))))

(assert (=> b!89644 (= res!45826 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!89645 () Bool)

(assert (=> b!89645 (= e!58331 e!58333)))

(assert (=> b!89645 (= c!14918 (validKeyInArray!0 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!89646 () Bool)

(assert (=> b!89646 (= e!58334 (contains!761 (ite c!14737 (Cons!1531 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) #b00000000000000000000000000000000) Nil!1532) Nil!1532) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!23909 (not res!45825)) b!89644))

(assert (= (and b!89644 res!45826) b!89646))

(assert (= (and b!89644 res!45827) b!89645))

(assert (= (and b!89645 c!14918) b!89643))

(assert (= (and b!89645 (not c!14918)) b!89642))

(assert (= (or b!89643 b!89642) bm!8709))

(assert (=> bm!8709 m!95425))

(declare-fun m!96263 () Bool)

(assert (=> bm!8709 m!96263))

(assert (=> b!89644 m!95425))

(assert (=> b!89644 m!95425))

(assert (=> b!89644 m!95435))

(assert (=> b!89645 m!95425))

(assert (=> b!89645 m!95425))

(assert (=> b!89645 m!95435))

(assert (=> b!89646 m!95425))

(assert (=> b!89646 m!95425))

(declare-fun m!96265 () Bool)

(assert (=> b!89646 m!96265))

(assert (=> bm!8609 d!23909))

(declare-fun b!89649 () Bool)

(declare-fun e!58336 () Option!146)

(assert (=> b!89649 (= e!58336 (getValueByKey!140 (t!5285 (toList!745 lt!42653)) (_1!1121 lt!42383)))))

(declare-fun b!89647 () Bool)

(declare-fun e!58335 () Option!146)

(assert (=> b!89647 (= e!58335 (Some!145 (_2!1121 (h!2124 (toList!745 lt!42653)))))))

(declare-fun d!23911 () Bool)

(declare-fun c!14919 () Bool)

(assert (=> d!23911 (= c!14919 (and ((_ is Cons!1532) (toList!745 lt!42653)) (= (_1!1121 (h!2124 (toList!745 lt!42653))) (_1!1121 lt!42383))))))

(assert (=> d!23911 (= (getValueByKey!140 (toList!745 lt!42653) (_1!1121 lt!42383)) e!58335)))

(declare-fun b!89648 () Bool)

(assert (=> b!89648 (= e!58335 e!58336)))

(declare-fun c!14920 () Bool)

(assert (=> b!89648 (= c!14920 (and ((_ is Cons!1532) (toList!745 lt!42653)) (not (= (_1!1121 (h!2124 (toList!745 lt!42653))) (_1!1121 lt!42383)))))))

(declare-fun b!89650 () Bool)

(assert (=> b!89650 (= e!58336 None!144)))

(assert (= (and d!23911 c!14919) b!89647))

(assert (= (and d!23911 (not c!14919)) b!89648))

(assert (= (and b!89648 c!14920) b!89649))

(assert (= (and b!89648 (not c!14920)) b!89650))

(declare-fun m!96267 () Bool)

(assert (=> b!89649 m!96267))

(assert (=> b!88952 d!23911))

(assert (=> b!88930 d!23683))

(assert (=> d!23649 d!23621))

(declare-fun d!23913 () Bool)

(assert (=> d!23913 (= (apply!84 lt!42616 (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1217 (getValueByKey!140 (toList!745 lt!42616) (select (arr!1918 (_keys!4048 (v!2667 (underlying!291 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!3760 () Bool)

(assert (= bs!3760 d!23913))

(assert (=> bs!3760 m!95059))

(assert (=> bs!3760 m!96225))

(assert (=> bs!3760 m!96225))

(declare-fun m!96269 () Bool)

(assert (=> bs!3760 m!96269))

(assert (=> b!88932 d!23913))

(assert (=> b!88932 d!23761))

(declare-fun d!23915 () Bool)

(assert (=> d!23915 (= (+!111 (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)) (tuple2!2221 #b1000000000000000000000000000000000000000000000000000000000000000 lt!42380)) (getCurrentListMap!429 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) lt!42593 (zeroValue!2260 newMap!16) lt!42380 #b00000000000000000000000000000000 (defaultEntry!2371 newMap!16)))))

(declare-fun lt!43139 () Unit!2638)

(declare-fun choose!545 (array!4033 array!4035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3041 V!3041 V!3041 Int) Unit!2638)

(assert (=> d!23915 (= lt!43139 (choose!545 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42593 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42380 (defaultEntry!2371 newMap!16)))))

(assert (=> d!23915 (validMask!0 (mask!6414 newMap!16))))

(assert (=> d!23915 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!33 (_keys!4048 newMap!16) (_values!2354 newMap!16) (mask!6414 newMap!16) (extraKeys!2204 newMap!16) lt!42593 (zeroValue!2260 newMap!16) (minValue!2260 newMap!16) lt!42380 (defaultEntry!2371 newMap!16)) lt!43139)))

(declare-fun bs!3761 () Bool)

(assert (= bs!3761 d!23915))

(assert (=> bs!3761 m!95323))

(declare-fun m!96271 () Bool)

(assert (=> bs!3761 m!96271))

(assert (=> bs!3761 m!94993))

(declare-fun m!96273 () Bool)

(assert (=> bs!3761 m!96273))

(declare-fun m!96275 () Bool)

(assert (=> bs!3761 m!96275))

(assert (=> bs!3761 m!94993))

(assert (=> b!88862 d!23915))

(declare-fun mapIsEmpty!3461 () Bool)

(declare-fun mapRes!3461 () Bool)

(assert (=> mapIsEmpty!3461 mapRes!3461))

(declare-fun b!89652 () Bool)

(declare-fun e!58338 () Bool)

(assert (=> b!89652 (= e!58338 tp_is_empty!2545)))

(declare-fun condMapEmpty!3461 () Bool)

(declare-fun mapDefault!3461 () ValueCell!929)

(assert (=> mapNonEmpty!3460 (= condMapEmpty!3461 (= mapRest!3460 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3461)))))

(assert (=> mapNonEmpty!3460 (= tp!9040 (and e!58338 mapRes!3461))))

(declare-fun b!89651 () Bool)

(declare-fun e!58337 () Bool)

(assert (=> b!89651 (= e!58337 tp_is_empty!2545)))

(declare-fun mapNonEmpty!3461 () Bool)

(declare-fun tp!9041 () Bool)

(assert (=> mapNonEmpty!3461 (= mapRes!3461 (and tp!9041 e!58337))))

(declare-fun mapKey!3461 () (_ BitVec 32))

(declare-fun mapValue!3461 () ValueCell!929)

(declare-fun mapRest!3461 () (Array (_ BitVec 32) ValueCell!929))

(assert (=> mapNonEmpty!3461 (= mapRest!3460 (store mapRest!3461 mapKey!3461 mapValue!3461))))

(assert (= (and mapNonEmpty!3460 condMapEmpty!3461) mapIsEmpty!3461))

(assert (= (and mapNonEmpty!3460 (not condMapEmpty!3461)) mapNonEmpty!3461))

(assert (= (and mapNonEmpty!3461 ((_ is ValueCellFull!929) mapValue!3461)) b!89651))

(assert (= (and mapNonEmpty!3460 ((_ is ValueCellFull!929) mapDefault!3461)) b!89652))

(declare-fun m!96277 () Bool)

(assert (=> mapNonEmpty!3461 m!96277))

(declare-fun mapIsEmpty!3462 () Bool)

(declare-fun mapRes!3462 () Bool)

(assert (=> mapIsEmpty!3462 mapRes!3462))

(declare-fun b!89654 () Bool)

(declare-fun e!58340 () Bool)

(assert (=> b!89654 (= e!58340 tp_is_empty!2545)))

(declare-fun condMapEmpty!3462 () Bool)

(declare-fun mapDefault!3462 () ValueCell!929)

(assert (=> mapNonEmpty!3459 (= condMapEmpty!3462 (= mapRest!3459 ((as const (Array (_ BitVec 32) ValueCell!929)) mapDefault!3462)))))

(assert (=> mapNonEmpty!3459 (= tp!9039 (and e!58340 mapRes!3462))))

(declare-fun b!89653 () Bool)

(declare-fun e!58339 () Bool)

(assert (=> b!89653 (= e!58339 tp_is_empty!2545)))

(declare-fun mapNonEmpty!3462 () Bool)

(declare-fun tp!9042 () Bool)

(assert (=> mapNonEmpty!3462 (= mapRes!3462 (and tp!9042 e!58339))))

(declare-fun mapKey!3462 () (_ BitVec 32))

(declare-fun mapRest!3462 () (Array (_ BitVec 32) ValueCell!929))

(declare-fun mapValue!3462 () ValueCell!929)

(assert (=> mapNonEmpty!3462 (= mapRest!3459 (store mapRest!3462 mapKey!3462 mapValue!3462))))

(assert (= (and mapNonEmpty!3459 condMapEmpty!3462) mapIsEmpty!3462))

(assert (= (and mapNonEmpty!3459 (not condMapEmpty!3462)) mapNonEmpty!3462))

(assert (= (and mapNonEmpty!3462 ((_ is ValueCellFull!929) mapValue!3462)) b!89653))

(assert (= (and mapNonEmpty!3459 ((_ is ValueCellFull!929) mapDefault!3462)) b!89654))

(declare-fun m!96279 () Bool)

(assert (=> mapNonEmpty!3462 m!96279))

(declare-fun b_lambda!3953 () Bool)

(assert (= b_lambda!3945 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3953)))

(declare-fun b_lambda!3955 () Bool)

(assert (= b_lambda!3949 (or (and b!88622 b_free!2257 (= (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88625 b_free!2259) b_lambda!3955)))

(declare-fun b_lambda!3957 () Bool)

(assert (= b_lambda!3943 (or (and b!88622 b_free!2257 (= (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88625 b_free!2259) b_lambda!3957)))

(declare-fun b_lambda!3959 () Bool)

(assert (= b_lambda!3951 (or (and b!88622 b_free!2257 (= (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))) (defaultEntry!2371 newMap!16))) (and b!88625 b_free!2259) b_lambda!3959)))

(declare-fun b_lambda!3961 () Bool)

(assert (= b_lambda!3947 (or (and b!88622 b_free!2257) (and b!88625 b_free!2259 (= (defaultEntry!2371 newMap!16) (defaultEntry!2371 (v!2667 (underlying!291 thiss!992))))) b_lambda!3961)))

(check-sat (not b!89516) (not b!89122) (not mapNonEmpty!3461) (not d!23707) (not bm!8663) (not d!23729) (not d!23805) (not b!89608) (not b!89369) (not bm!8702) (not d!23855) (not d!23705) (not d!23721) (not b!89299) (not b!89241) (not b!89492) (not d!23875) (not d!23779) (not b!89224) (not b!89591) (not b!89217) (not b!89593) (not b!89408) (not b!89533) (not b!89298) (not b!89271) (not b!89137) (not b!89368) (not d!23849) (not bm!8652) (not b!89609) (not b!89430) (not d!23853) (not b!89370) (not b!89164) (not b!89443) (not d!23789) (not d!23695) (not b!89534) (not b!89141) (not d!23797) (not b!89281) (not b!89344) (not bm!8655) (not b!89113) (not d!23825) (not b!89605) (not bm!8658) (not b!89578) (not d!23687) (not d!23829) (not d!23683) (not b!89340) (not d!23667) (not b!89158) (not d!23735) (not bm!8676) (not b!89376) b_and!5373 (not b!89165) (not b!89362) (not b!89555) (not bm!8662) (not b!89218) (not b!89126) (not b!89550) (not b!89294) (not b!89490) (not b_lambda!3929) (not d!23727) (not d!23751) (not d!23723) (not d!23867) (not d!23873) (not b!89320) (not b!89427) (not d!23791) (not bm!8707) (not b!89264) (not b!89406) (not d!23905) (not b!89351) (not b!89554) (not d!23817) (not b!89163) (not b!89537) (not d!23653) (not b!89177) (not bm!8665) (not b!89507) (not d!23681) (not d!23863) (not b!89571) (not d!23701) (not b!89304) (not b!89307) (not b!89525) (not b!89395) (not d!23887) (not b!89429) (not b!89414) (not d!23743) (not d!23655) (not b!89543) (not b!89114) (not d!23881) (not b!89311) (not b!89268) (not d!23915) (not b!89491) (not d!23699) (not b!89644) (not b!89301) (not b!89157) (not d!23733) (not b!89274) (not mapNonEmpty!3462) (not d!23801) (not b!89209) (not d!23777) (not b!89282) (not bm!8666) (not b!89107) (not d!23661) (not b!89099) (not d!23703) (not d!23893) (not bm!8679) (not d!23763) (not b!89512) (not bm!8659) (not b!89397) (not b!89225) (not d!23759) (not d!23771) (not b!89359) (not d!23861) (not d!23889) (not b_next!2257) (not b!89573) (not b!89343) (not bm!8636) (not b!89145) (not b!89562) (not b!89134) (not d!23775) (not bm!8682) (not d!23691) (not b!89552) (not b!89111) (not b!89327) (not d!23843) (not b_lambda!3957) (not b!89523) (not b_lambda!3939) (not b!89544) (not d!23859) (not d!23747) (not d!23809) (not d!23713) (not b!89160) (not bm!8696) (not b!89547) (not bm!8654) (not b!89148) (not d!23785) (not b!89155) (not b!89360) (not b!89385) (not d!23823) (not b!89494) (not b!89146) (not b!89576) (not b!89560) (not d!23841) (not b!89133) (not b!89132) (not d!23673) (not b!89170) (not b!89293) (not bm!8701) (not b!89640) (not b!89612) (not b!89513) (not d!23879) (not b!89531) (not bm!8695) (not b!89538) (not bm!8643) (not b!89210) (not b!89147) (not b!89506) (not d!23865) (not b!89433) (not b!89117) (not b!89365) (not b!89296) (not b!89322) (not b!89118) (not b!89371) (not b!89269) (not b!89338) (not b!89346) (not b!89106) (not b!89247) (not b!89409) (not b!89315) (not d!23835) (not b!89372) (not b_lambda!3961) (not b!89375) (not b!89439) (not b!89379) (not d!23857) (not b!89389) (not b!89176) (not b!89390) (not b!89588) (not b!89088) (not b!89329) (not b!89421) (not b!89500) (not b!89226) (not d!23755) (not b!89341) (not b!89425) (not b_lambda!3937) (not b!89574) (not b!89493) (not d!23885) (not b!89289) (not d!23781) (not b!89205) (not b!89143) (not d!23821) (not d!23765) (not b!89392) (not d!23753) (not bm!8685) (not b!89532) (not b!89646) (not b!89449) (not b!89358) (not b!89563) (not b!89374) (not b!89262) (not b!89428) (not b!89387) (not bm!8642) (not bm!8640) (not b!89278) (not b!89402) (not b!89447) (not b!89342) (not b!89361) (not d!23767) (not bm!8641) (not d!23869) (not d!23709) (not d!23769) (not b!89156) (not b!89347) (not d!23811) (not b!89330) b_and!5375 (not b_lambda!3955) (not b!89645) (not b_lambda!3941) (not b!89324) (not b!89363) (not d!23739) (not d!23845) (not d!23669) (not b_lambda!3953) (not b!89603) (not b!89167) (not b!89201) (not b!89290) (not b!89345) (not bm!8669) (not d!23815) (not b!89317) (not b_next!2259) (not b!89514) (not b!89411) (not bm!8670) (not d!23891) (not d!23725) (not b!89153) tp_is_empty!2545 (not d!23665) (not b!89517) (not b!89536) (not b!89109) (not d!23675) (not b!89207) (not bm!8637) (not d!23883) (not b!89649) (not b!89366) (not b!89373) (not b_lambda!3959) (not b!89259) (not b!89509) (not b!89214) (not b!89248) (not d!23847) (not b!89334) (not b!89431) (not b!89348) (not b!89438) (not d!23913) (not d!23663) (not d!23833) (not d!23837) (not d!23787) (not d!23871) (not d!23795) (not b!89567) (not b!89596) (not d!23719) (not bm!8694) (not d!23773) (not b!89357) (not b!89557) (not b!89549) (not bm!8709) (not bm!8673) (not b!89288) (not b!89115) (not d!23749) (not b!89125) (not b!89436) (not b!89267) (not b!89273) (not b!89306) (not b!89417) (not bm!8708) (not b!89589) (not b!89503) (not b!89416) (not d!23819) (not b!89546) (not d!23745) (not d!23851) (not bm!8698) (not d!23839) (not d!23807) (not b!89139) (not b!89398))
(check-sat b_and!5373 b_and!5375 (not b_next!2257) (not b_next!2259))
