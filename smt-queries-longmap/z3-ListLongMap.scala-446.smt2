; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8292 () Bool)

(assert start!8292)

(declare-fun b!53673 () Bool)

(declare-fun b_free!1741 () Bool)

(declare-fun b_next!1741 () Bool)

(assert (=> b!53673 (= b_free!1741 (not b_next!1741))))

(declare-fun tp!7326 () Bool)

(declare-fun b_and!3021 () Bool)

(assert (=> b!53673 (= tp!7326 b_and!3021)))

(declare-fun b!53687 () Bool)

(declare-fun b_free!1743 () Bool)

(declare-fun b_next!1743 () Bool)

(assert (=> b!53687 (= b_free!1743 (not b_next!1743))))

(declare-fun tp!7323 () Bool)

(declare-fun b_and!3023 () Bool)

(assert (=> b!53687 (= tp!7323 b_and!3023)))

(declare-fun e!35030 () Bool)

(declare-datatypes ((V!2697 0))(
  ( (V!2698 (val!1188 Int)) )
))
(declare-datatypes ((array!3483 0))(
  ( (array!3484 (arr!1664 (Array (_ BitVec 32) (_ BitVec 64))) (size!1893 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!800 0))(
  ( (ValueCellFull!800 (v!2265 V!2697)) (EmptyCell!800) )
))
(declare-datatypes ((array!3485 0))(
  ( (array!3486 (arr!1665 (Array (_ BitVec 32) ValueCell!800)) (size!1894 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!508 0))(
  ( (LongMapFixedSize!509 (defaultEntry!1968 Int) (mask!5807 (_ BitVec 32)) (extraKeys!1859 (_ BitVec 32)) (zeroValue!1886 V!2697) (minValue!1886 V!2697) (_size!303 (_ BitVec 32)) (_keys!3588 array!3483) (_values!1951 array!3485) (_vacant!303 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!328 0))(
  ( (Cell!329 (v!2266 LongMapFixedSize!508)) )
))
(declare-datatypes ((LongMap!328 0))(
  ( (LongMap!329 (underlying!175 Cell!328)) )
))
(declare-fun thiss!992 () LongMap!328)

(declare-fun tp_is_empty!2287 () Bool)

(declare-fun e!35035 () Bool)

(declare-fun array_inv!1017 (array!3483) Bool)

(declare-fun array_inv!1018 (array!3485) Bool)

(assert (=> b!53673 (= e!35030 (and tp!7326 tp_is_empty!2287 (array_inv!1017 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) (array_inv!1018 (_values!1951 (v!2266 (underlying!175 thiss!992)))) e!35035))))

(declare-fun b!53674 () Bool)

(declare-fun res!30430 () Bool)

(declare-fun e!35027 () Bool)

(assert (=> b!53674 (=> (not res!30430) (not e!35027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53674 (= res!30430 (validMask!0 (mask!5807 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun b!53675 () Bool)

(declare-fun res!30429 () Bool)

(declare-fun e!35026 () Bool)

(assert (=> b!53675 (=> (not res!30429) (not e!35026))))

(declare-fun newMap!16 () LongMapFixedSize!508)

(declare-fun valid!200 (LongMapFixedSize!508) Bool)

(assert (=> b!53675 (= res!30429 (valid!200 newMap!16))))

(declare-fun b!53676 () Bool)

(declare-fun res!30428 () Bool)

(assert (=> b!53676 (=> (not res!30428) (not e!35027))))

(declare-datatypes ((List!1348 0))(
  ( (Nil!1345) (Cons!1344 (h!1924 (_ BitVec 64)) (t!4458 List!1348)) )
))
(declare-fun arrayNoDuplicates!0 (array!3483 (_ BitVec 32) List!1348) Bool)

(assert (=> b!53676 (= res!30428 (arrayNoDuplicates!0 (_keys!3588 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000 Nil!1345))))

(declare-fun b!53677 () Bool)

(declare-fun res!30420 () Bool)

(assert (=> b!53677 (=> (not res!30420) (not e!35027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3483 (_ BitVec 32)) Bool)

(assert (=> b!53677 (= res!30420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3588 (v!2266 (underlying!175 thiss!992))) (mask!5807 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun b!53678 () Bool)

(declare-fun e!35034 () Bool)

(assert (=> b!53678 (= e!35034 tp_is_empty!2287)))

(declare-fun b!53679 () Bool)

(assert (=> b!53679 (= e!35027 false)))

(declare-datatypes ((tuple2!1884 0))(
  ( (tuple2!1885 (_1!953 (_ BitVec 64)) (_2!953 V!2697)) )
))
(declare-datatypes ((List!1349 0))(
  ( (Nil!1346) (Cons!1345 (h!1925 tuple2!1884) (t!4459 List!1349)) )
))
(declare-datatypes ((ListLongMap!1269 0))(
  ( (ListLongMap!1270 (toList!650 List!1349)) )
))
(declare-fun lt!21477 () ListLongMap!1269)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21478 () Bool)

(declare-fun contains!629 (ListLongMap!1269 (_ BitVec 64)) Bool)

(assert (=> b!53679 (= lt!21478 (contains!629 lt!21477 (select (arr!1664 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) from!355)))))

(declare-fun b!53680 () Bool)

(declare-fun e!35023 () Bool)

(assert (=> b!53680 (= e!35023 tp_is_empty!2287)))

(declare-fun b!53681 () Bool)

(declare-fun e!35028 () Bool)

(assert (=> b!53681 (= e!35028 tp_is_empty!2287)))

(declare-fun b!53682 () Bool)

(declare-fun e!35021 () Bool)

(assert (=> b!53682 (= e!35021 tp_is_empty!2287)))

(declare-fun b!53683 () Bool)

(declare-fun e!35029 () Bool)

(declare-fun mapRes!2531 () Bool)

(assert (=> b!53683 (= e!35029 (and e!35021 mapRes!2531))))

(declare-fun condMapEmpty!2531 () Bool)

(declare-fun mapDefault!2532 () ValueCell!800)

(assert (=> b!53683 (= condMapEmpty!2531 (= (arr!1665 (_values!1951 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!800)) mapDefault!2532)))))

(declare-fun b!53684 () Bool)

(declare-fun res!30427 () Bool)

(assert (=> b!53684 (=> (not res!30427) (not e!35027))))

(assert (=> b!53684 (= res!30427 (and (= (size!1894 (_values!1951 (v!2266 (underlying!175 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5807 (v!2266 (underlying!175 thiss!992))))) (= (size!1893 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) (size!1894 (_values!1951 (v!2266 (underlying!175 thiss!992))))) (bvsge (mask!5807 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1859 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1859 (v!2266 (underlying!175 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53685 () Bool)

(declare-fun e!35022 () Bool)

(declare-fun e!35031 () Bool)

(assert (=> b!53685 (= e!35022 e!35031)))

(declare-fun b!53686 () Bool)

(declare-fun e!35024 () Bool)

(assert (=> b!53686 (= e!35026 e!35024)))

(declare-fun res!30423 () Bool)

(assert (=> b!53686 (=> (not res!30423) (not e!35024))))

(declare-fun lt!21476 () ListLongMap!1269)

(assert (=> b!53686 (= res!30423 (and (= lt!21477 lt!21476) (not (= (select (arr!1664 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1664 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1038 (LongMapFixedSize!508) ListLongMap!1269)

(assert (=> b!53686 (= lt!21476 (map!1038 newMap!16))))

(declare-fun getCurrentListMap!354 (array!3483 array!3485 (_ BitVec 32) (_ BitVec 32) V!2697 V!2697 (_ BitVec 32) Int) ListLongMap!1269)

(assert (=> b!53686 (= lt!21477 (getCurrentListMap!354 (_keys!3588 (v!2266 (underlying!175 thiss!992))) (_values!1951 (v!2266 (underlying!175 thiss!992))) (mask!5807 (v!2266 (underlying!175 thiss!992))) (extraKeys!1859 (v!2266 (underlying!175 thiss!992))) (zeroValue!1886 (v!2266 (underlying!175 thiss!992))) (minValue!1886 (v!2266 (underlying!175 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1968 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun mapNonEmpty!2531 () Bool)

(declare-fun tp!7324 () Bool)

(assert (=> mapNonEmpty!2531 (= mapRes!2531 (and tp!7324 e!35023))))

(declare-fun mapKey!2531 () (_ BitVec 32))

(declare-fun mapRest!2531 () (Array (_ BitVec 32) ValueCell!800))

(declare-fun mapValue!2531 () ValueCell!800)

(assert (=> mapNonEmpty!2531 (= (arr!1665 (_values!1951 newMap!16)) (store mapRest!2531 mapKey!2531 mapValue!2531))))

(declare-fun mapNonEmpty!2532 () Bool)

(declare-fun mapRes!2532 () Bool)

(declare-fun tp!7325 () Bool)

(assert (=> mapNonEmpty!2532 (= mapRes!2532 (and tp!7325 e!35028))))

(declare-fun mapKey!2532 () (_ BitVec 32))

(declare-fun mapValue!2532 () ValueCell!800)

(declare-fun mapRest!2532 () (Array (_ BitVec 32) ValueCell!800))

(assert (=> mapNonEmpty!2532 (= (arr!1665 (_values!1951 (v!2266 (underlying!175 thiss!992)))) (store mapRest!2532 mapKey!2532 mapValue!2532))))

(declare-fun mapIsEmpty!2531 () Bool)

(assert (=> mapIsEmpty!2531 mapRes!2532))

(declare-fun e!35032 () Bool)

(assert (=> b!53687 (= e!35032 (and tp!7323 tp_is_empty!2287 (array_inv!1017 (_keys!3588 newMap!16)) (array_inv!1018 (_values!1951 newMap!16)) e!35029))))

(declare-fun b!53688 () Bool)

(assert (=> b!53688 (= e!35031 e!35030)))

(declare-fun b!53689 () Bool)

(assert (=> b!53689 (= e!35035 (and e!35034 mapRes!2532))))

(declare-fun condMapEmpty!2532 () Bool)

(declare-fun mapDefault!2531 () ValueCell!800)

(assert (=> b!53689 (= condMapEmpty!2532 (= (arr!1665 (_values!1951 (v!2266 (underlying!175 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!800)) mapDefault!2531)))))

(declare-fun mapIsEmpty!2532 () Bool)

(assert (=> mapIsEmpty!2532 mapRes!2531))

(declare-fun b!53690 () Bool)

(declare-fun res!30426 () Bool)

(assert (=> b!53690 (=> (not res!30426) (not e!35026))))

(assert (=> b!53690 (= res!30426 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1893 (_keys!3588 (v!2266 (underlying!175 thiss!992)))))))))

(declare-fun b!53691 () Bool)

(declare-fun res!30425 () Bool)

(assert (=> b!53691 (=> (not res!30425) (not e!35026))))

(assert (=> b!53691 (= res!30425 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5807 newMap!16)) (_size!303 (v!2266 (underlying!175 thiss!992)))))))

(declare-fun res!30424 () Bool)

(assert (=> start!8292 (=> (not res!30424) (not e!35026))))

(declare-fun valid!201 (LongMap!328) Bool)

(assert (=> start!8292 (= res!30424 (valid!201 thiss!992))))

(assert (=> start!8292 e!35026))

(assert (=> start!8292 e!35022))

(assert (=> start!8292 true))

(assert (=> start!8292 e!35032))

(declare-fun b!53692 () Bool)

(declare-fun res!30421 () Bool)

(assert (=> b!53692 (=> (not res!30421) (not e!35027))))

(assert (=> b!53692 (= res!30421 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1893 (_keys!3588 (v!2266 (underlying!175 thiss!992)))))))))

(declare-fun b!53693 () Bool)

(assert (=> b!53693 (= e!35024 e!35027)))

(declare-fun res!30422 () Bool)

(assert (=> b!53693 (=> (not res!30422) (not e!35027))))

(assert (=> b!53693 (= res!30422 (contains!629 lt!21476 (select (arr!1664 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1886 0))(
  ( (tuple2!1887 (_1!954 Bool) (_2!954 LongMapFixedSize!508)) )
))
(declare-fun lt!21479 () tuple2!1886)

(declare-fun update!58 (LongMapFixedSize!508 (_ BitVec 64) V!2697) tuple2!1886)

(declare-fun get!1003 (ValueCell!800 V!2697) V!2697)

(declare-fun dynLambda!276 (Int (_ BitVec 64)) V!2697)

(assert (=> b!53693 (= lt!21479 (update!58 newMap!16 (select (arr!1664 (_keys!3588 (v!2266 (underlying!175 thiss!992)))) from!355) (get!1003 (select (arr!1665 (_values!1951 (v!2266 (underlying!175 thiss!992)))) from!355) (dynLambda!276 (defaultEntry!1968 (v!2266 (underlying!175 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8292 res!30424) b!53690))

(assert (= (and b!53690 res!30426) b!53675))

(assert (= (and b!53675 res!30429) b!53691))

(assert (= (and b!53691 res!30425) b!53686))

(assert (= (and b!53686 res!30423) b!53693))

(assert (= (and b!53693 res!30422) b!53674))

(assert (= (and b!53674 res!30430) b!53684))

(assert (= (and b!53684 res!30427) b!53677))

(assert (= (and b!53677 res!30420) b!53676))

(assert (= (and b!53676 res!30428) b!53692))

(assert (= (and b!53692 res!30421) b!53679))

(assert (= (and b!53689 condMapEmpty!2532) mapIsEmpty!2531))

(assert (= (and b!53689 (not condMapEmpty!2532)) mapNonEmpty!2532))

(get-info :version)

(assert (= (and mapNonEmpty!2532 ((_ is ValueCellFull!800) mapValue!2532)) b!53681))

(assert (= (and b!53689 ((_ is ValueCellFull!800) mapDefault!2531)) b!53678))

(assert (= b!53673 b!53689))

(assert (= b!53688 b!53673))

(assert (= b!53685 b!53688))

(assert (= start!8292 b!53685))

(assert (= (and b!53683 condMapEmpty!2531) mapIsEmpty!2532))

(assert (= (and b!53683 (not condMapEmpty!2531)) mapNonEmpty!2531))

(assert (= (and mapNonEmpty!2531 ((_ is ValueCellFull!800) mapValue!2531)) b!53680))

(assert (= (and b!53683 ((_ is ValueCellFull!800) mapDefault!2532)) b!53682))

(assert (= b!53687 b!53683))

(assert (= start!8292 b!53687))

(declare-fun b_lambda!2381 () Bool)

(assert (=> (not b_lambda!2381) (not b!53693)))

(declare-fun t!4455 () Bool)

(declare-fun tb!1085 () Bool)

(assert (=> (and b!53673 (= (defaultEntry!1968 (v!2266 (underlying!175 thiss!992))) (defaultEntry!1968 (v!2266 (underlying!175 thiss!992)))) t!4455) tb!1085))

(declare-fun result!2025 () Bool)

(assert (=> tb!1085 (= result!2025 tp_is_empty!2287)))

(assert (=> b!53693 t!4455))

(declare-fun b_and!3025 () Bool)

(assert (= b_and!3021 (and (=> t!4455 result!2025) b_and!3025)))

(declare-fun t!4457 () Bool)

(declare-fun tb!1087 () Bool)

(assert (=> (and b!53687 (= (defaultEntry!1968 newMap!16) (defaultEntry!1968 (v!2266 (underlying!175 thiss!992)))) t!4457) tb!1087))

(declare-fun result!2029 () Bool)

(assert (= result!2029 result!2025))

(assert (=> b!53693 t!4457))

(declare-fun b_and!3027 () Bool)

(assert (= b_and!3023 (and (=> t!4457 result!2029) b_and!3027)))

(declare-fun m!45481 () Bool)

(assert (=> mapNonEmpty!2531 m!45481))

(declare-fun m!45483 () Bool)

(assert (=> b!53693 m!45483))

(declare-fun m!45485 () Bool)

(assert (=> b!53693 m!45485))

(declare-fun m!45487 () Bool)

(assert (=> b!53693 m!45487))

(declare-fun m!45489 () Bool)

(assert (=> b!53693 m!45489))

(assert (=> b!53693 m!45485))

(assert (=> b!53693 m!45489))

(declare-fun m!45491 () Bool)

(assert (=> b!53693 m!45491))

(assert (=> b!53693 m!45489))

(assert (=> b!53693 m!45487))

(declare-fun m!45493 () Bool)

(assert (=> b!53693 m!45493))

(assert (=> b!53693 m!45483))

(declare-fun m!45495 () Bool)

(assert (=> b!53674 m!45495))

(declare-fun m!45497 () Bool)

(assert (=> b!53677 m!45497))

(declare-fun m!45499 () Bool)

(assert (=> mapNonEmpty!2532 m!45499))

(declare-fun m!45501 () Bool)

(assert (=> b!53675 m!45501))

(declare-fun m!45503 () Bool)

(assert (=> b!53676 m!45503))

(declare-fun m!45505 () Bool)

(assert (=> b!53673 m!45505))

(declare-fun m!45507 () Bool)

(assert (=> b!53673 m!45507))

(assert (=> b!53679 m!45489))

(assert (=> b!53679 m!45489))

(declare-fun m!45509 () Bool)

(assert (=> b!53679 m!45509))

(declare-fun m!45511 () Bool)

(assert (=> start!8292 m!45511))

(declare-fun m!45513 () Bool)

(assert (=> b!53687 m!45513))

(declare-fun m!45515 () Bool)

(assert (=> b!53687 m!45515))

(assert (=> b!53686 m!45489))

(declare-fun m!45517 () Bool)

(assert (=> b!53686 m!45517))

(declare-fun m!45519 () Bool)

(assert (=> b!53686 m!45519))

(check-sat (not b!53693) (not start!8292) (not b!53677) tp_is_empty!2287 (not b!53674) (not b!53675) b_and!3025 (not mapNonEmpty!2531) (not b!53679) (not b_next!1741) (not b!53673) (not b!53676) (not b_lambda!2381) (not mapNonEmpty!2532) (not b!53686) (not b!53687) (not b_next!1743) b_and!3027)
(check-sat b_and!3025 b_and!3027 (not b_next!1741) (not b_next!1743))
