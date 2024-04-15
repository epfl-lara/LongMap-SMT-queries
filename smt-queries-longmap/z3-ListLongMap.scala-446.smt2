; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8292 () Bool)

(assert start!8292)

(declare-fun b!53670 () Bool)

(declare-fun b_free!1741 () Bool)

(declare-fun b_next!1741 () Bool)

(assert (=> b!53670 (= b_free!1741 (not b_next!1741))))

(declare-fun tp!7324 () Bool)

(declare-fun b_and!3025 () Bool)

(assert (=> b!53670 (= tp!7324 b_and!3025)))

(declare-fun b!53667 () Bool)

(declare-fun b_free!1743 () Bool)

(declare-fun b_next!1743 () Bool)

(assert (=> b!53667 (= b_free!1743 (not b_next!1743))))

(declare-fun tp!7325 () Bool)

(declare-fun b_and!3027 () Bool)

(assert (=> b!53667 (= tp!7325 b_and!3027)))

(declare-fun b!53664 () Bool)

(declare-fun res!30433 () Bool)

(declare-fun e!35020 () Bool)

(assert (=> b!53664 (=> (not res!30433) (not e!35020))))

(declare-datatypes ((V!2697 0))(
  ( (V!2698 (val!1188 Int)) )
))
(declare-datatypes ((array!3477 0))(
  ( (array!3478 (arr!1660 (Array (_ BitVec 32) (_ BitVec 64))) (size!1890 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!800 0))(
  ( (ValueCellFull!800 (v!2261 V!2697)) (EmptyCell!800) )
))
(declare-datatypes ((array!3479 0))(
  ( (array!3480 (arr!1661 (Array (_ BitVec 32) ValueCell!800)) (size!1891 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!508 0))(
  ( (LongMapFixedSize!509 (defaultEntry!1968 Int) (mask!5806 (_ BitVec 32)) (extraKeys!1859 (_ BitVec 32)) (zeroValue!1886 V!2697) (minValue!1886 V!2697) (_size!303 (_ BitVec 32)) (_keys!3587 array!3477) (_values!1951 array!3479) (_vacant!303 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!326 0))(
  ( (Cell!327 (v!2262 LongMapFixedSize!508)) )
))
(declare-datatypes ((LongMap!326 0))(
  ( (LongMap!327 (underlying!174 Cell!326)) )
))
(declare-fun thiss!992 () LongMap!326)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53664 (= res!30433 (validMask!0 (mask!5806 (v!2262 (underlying!174 thiss!992)))))))

(declare-fun mapNonEmpty!2531 () Bool)

(declare-fun mapRes!2532 () Bool)

(declare-fun tp!7323 () Bool)

(declare-fun e!35026 () Bool)

(assert (=> mapNonEmpty!2531 (= mapRes!2532 (and tp!7323 e!35026))))

(declare-fun mapValue!2531 () ValueCell!800)

(declare-fun mapRest!2532 () (Array (_ BitVec 32) ValueCell!800))

(declare-fun newMap!16 () LongMapFixedSize!508)

(declare-fun mapKey!2532 () (_ BitVec 32))

(assert (=> mapNonEmpty!2531 (= (arr!1661 (_values!1951 newMap!16)) (store mapRest!2532 mapKey!2532 mapValue!2531))))

(declare-fun b!53665 () Bool)

(declare-fun res!30427 () Bool)

(assert (=> b!53665 (=> (not res!30427) (not e!35020))))

(assert (=> b!53665 (= res!30427 (and (= (size!1891 (_values!1951 (v!2262 (underlying!174 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5806 (v!2262 (underlying!174 thiss!992))))) (= (size!1890 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) (size!1891 (_values!1951 (v!2262 (underlying!174 thiss!992))))) (bvsge (mask!5806 (v!2262 (underlying!174 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1859 (v!2262 (underlying!174 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1859 (v!2262 (underlying!174 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53666 () Bool)

(declare-fun e!35025 () Bool)

(declare-fun e!35022 () Bool)

(assert (=> b!53666 (= e!35025 e!35022)))

(declare-fun res!30431 () Bool)

(assert (=> b!53666 (=> (not res!30431) (not e!35022))))

(declare-datatypes ((tuple2!1906 0))(
  ( (tuple2!1907 (_1!964 (_ BitVec 64)) (_2!964 V!2697)) )
))
(declare-datatypes ((List!1364 0))(
  ( (Nil!1361) (Cons!1360 (h!1940 tuple2!1906) (t!4473 List!1364)) )
))
(declare-datatypes ((ListLongMap!1287 0))(
  ( (ListLongMap!1288 (toList!659 List!1364)) )
))
(declare-fun lt!21503 () ListLongMap!1287)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21505 () ListLongMap!1287)

(assert (=> b!53666 (= res!30431 (and (= lt!21505 lt!21503) (not (= (select (arr!1660 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1660 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1040 (LongMapFixedSize!508) ListLongMap!1287)

(assert (=> b!53666 (= lt!21503 (map!1040 newMap!16))))

(declare-fun getCurrentListMap!362 (array!3477 array!3479 (_ BitVec 32) (_ BitVec 32) V!2697 V!2697 (_ BitVec 32) Int) ListLongMap!1287)

(assert (=> b!53666 (= lt!21505 (getCurrentListMap!362 (_keys!3587 (v!2262 (underlying!174 thiss!992))) (_values!1951 (v!2262 (underlying!174 thiss!992))) (mask!5806 (v!2262 (underlying!174 thiss!992))) (extraKeys!1859 (v!2262 (underlying!174 thiss!992))) (zeroValue!1886 (v!2262 (underlying!174 thiss!992))) (minValue!1886 (v!2262 (underlying!174 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1968 (v!2262 (underlying!174 thiss!992)))))))

(declare-fun res!30428 () Bool)

(assert (=> start!8292 (=> (not res!30428) (not e!35025))))

(declare-fun valid!195 (LongMap!326) Bool)

(assert (=> start!8292 (= res!30428 (valid!195 thiss!992))))

(assert (=> start!8292 e!35025))

(declare-fun e!35027 () Bool)

(assert (=> start!8292 e!35027))

(assert (=> start!8292 true))

(declare-fun e!35017 () Bool)

(assert (=> start!8292 e!35017))

(declare-fun tp_is_empty!2287 () Bool)

(declare-fun e!35018 () Bool)

(declare-fun array_inv!1019 (array!3477) Bool)

(declare-fun array_inv!1020 (array!3479) Bool)

(assert (=> b!53667 (= e!35017 (and tp!7325 tp_is_empty!2287 (array_inv!1019 (_keys!3587 newMap!16)) (array_inv!1020 (_values!1951 newMap!16)) e!35018))))

(declare-fun b!53668 () Bool)

(declare-fun res!30429 () Bool)

(assert (=> b!53668 (=> (not res!30429) (not e!35025))))

(assert (=> b!53668 (= res!30429 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1890 (_keys!3587 (v!2262 (underlying!174 thiss!992)))))))))

(declare-fun mapIsEmpty!2531 () Bool)

(assert (=> mapIsEmpty!2531 mapRes!2532))

(declare-fun b!53669 () Bool)

(declare-fun res!30435 () Bool)

(assert (=> b!53669 (=> (not res!30435) (not e!35020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3477 (_ BitVec 32)) Bool)

(assert (=> b!53669 (= res!30435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3587 (v!2262 (underlying!174 thiss!992))) (mask!5806 (v!2262 (underlying!174 thiss!992)))))))

(declare-fun e!35029 () Bool)

(declare-fun e!35023 () Bool)

(assert (=> b!53670 (= e!35029 (and tp!7324 tp_is_empty!2287 (array_inv!1019 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) (array_inv!1020 (_values!1951 (v!2262 (underlying!174 thiss!992)))) e!35023))))

(declare-fun b!53671 () Bool)

(declare-fun e!35015 () Bool)

(assert (=> b!53671 (= e!35015 e!35029)))

(declare-fun b!53672 () Bool)

(declare-fun res!30426 () Bool)

(assert (=> b!53672 (=> (not res!30426) (not e!35020))))

(assert (=> b!53672 (= res!30426 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1890 (_keys!3587 (v!2262 (underlying!174 thiss!992)))))))))

(declare-fun b!53673 () Bool)

(declare-fun e!35024 () Bool)

(assert (=> b!53673 (= e!35024 tp_is_empty!2287)))

(declare-fun b!53674 () Bool)

(assert (=> b!53674 (= e!35020 false)))

(declare-fun lt!21506 () Bool)

(declare-fun contains!635 (ListLongMap!1287 (_ BitVec 64)) Bool)

(assert (=> b!53674 (= lt!21506 (contains!635 lt!21505 (select (arr!1660 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) from!355)))))

(declare-fun b!53675 () Bool)

(declare-fun e!35019 () Bool)

(assert (=> b!53675 (= e!35019 tp_is_empty!2287)))

(declare-fun b!53676 () Bool)

(assert (=> b!53676 (= e!35022 e!35020)))

(declare-fun res!30425 () Bool)

(assert (=> b!53676 (=> (not res!30425) (not e!35020))))

(assert (=> b!53676 (= res!30425 (contains!635 lt!21503 (select (arr!1660 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1908 0))(
  ( (tuple2!1909 (_1!965 Bool) (_2!965 LongMapFixedSize!508)) )
))
(declare-fun lt!21504 () tuple2!1908)

(declare-fun update!54 (LongMapFixedSize!508 (_ BitVec 64) V!2697) tuple2!1908)

(declare-fun get!1002 (ValueCell!800 V!2697) V!2697)

(declare-fun dynLambda!278 (Int (_ BitVec 64)) V!2697)

(assert (=> b!53676 (= lt!21504 (update!54 newMap!16 (select (arr!1660 (_keys!3587 (v!2262 (underlying!174 thiss!992)))) from!355) (get!1002 (select (arr!1661 (_values!1951 (v!2262 (underlying!174 thiss!992)))) from!355) (dynLambda!278 (defaultEntry!1968 (v!2262 (underlying!174 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53677 () Bool)

(assert (=> b!53677 (= e!35027 e!35015)))

(declare-fun b!53678 () Bool)

(declare-fun res!30434 () Bool)

(assert (=> b!53678 (=> (not res!30434) (not e!35025))))

(assert (=> b!53678 (= res!30434 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5806 newMap!16)) (_size!303 (v!2262 (underlying!174 thiss!992)))))))

(declare-fun b!53679 () Bool)

(assert (=> b!53679 (= e!35018 (and e!35019 mapRes!2532))))

(declare-fun condMapEmpty!2531 () Bool)

(declare-fun mapDefault!2531 () ValueCell!800)

(assert (=> b!53679 (= condMapEmpty!2531 (= (arr!1661 (_values!1951 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!800)) mapDefault!2531)))))

(declare-fun b!53680 () Bool)

(assert (=> b!53680 (= e!35026 tp_is_empty!2287)))

(declare-fun mapNonEmpty!2532 () Bool)

(declare-fun mapRes!2531 () Bool)

(declare-fun tp!7326 () Bool)

(assert (=> mapNonEmpty!2532 (= mapRes!2531 (and tp!7326 e!35024))))

(declare-fun mapValue!2532 () ValueCell!800)

(declare-fun mapKey!2531 () (_ BitVec 32))

(declare-fun mapRest!2531 () (Array (_ BitVec 32) ValueCell!800))

(assert (=> mapNonEmpty!2532 (= (arr!1661 (_values!1951 (v!2262 (underlying!174 thiss!992)))) (store mapRest!2531 mapKey!2531 mapValue!2532))))

(declare-fun b!53681 () Bool)

(declare-fun e!35021 () Bool)

(assert (=> b!53681 (= e!35021 tp_is_empty!2287)))

(declare-fun b!53682 () Bool)

(declare-fun res!30432 () Bool)

(assert (=> b!53682 (=> (not res!30432) (not e!35020))))

(declare-datatypes ((List!1365 0))(
  ( (Nil!1362) (Cons!1361 (h!1941 (_ BitVec 64)) (t!4474 List!1365)) )
))
(declare-fun arrayNoDuplicates!0 (array!3477 (_ BitVec 32) List!1365) Bool)

(assert (=> b!53682 (= res!30432 (arrayNoDuplicates!0 (_keys!3587 (v!2262 (underlying!174 thiss!992))) #b00000000000000000000000000000000 Nil!1362))))

(declare-fun b!53683 () Bool)

(declare-fun res!30430 () Bool)

(assert (=> b!53683 (=> (not res!30430) (not e!35025))))

(declare-fun valid!196 (LongMapFixedSize!508) Bool)

(assert (=> b!53683 (= res!30430 (valid!196 newMap!16))))

(declare-fun mapIsEmpty!2532 () Bool)

(assert (=> mapIsEmpty!2532 mapRes!2531))

(declare-fun b!53684 () Bool)

(assert (=> b!53684 (= e!35023 (and e!35021 mapRes!2531))))

(declare-fun condMapEmpty!2532 () Bool)

(declare-fun mapDefault!2532 () ValueCell!800)

(assert (=> b!53684 (= condMapEmpty!2532 (= (arr!1661 (_values!1951 (v!2262 (underlying!174 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!800)) mapDefault!2532)))))

(assert (= (and start!8292 res!30428) b!53668))

(assert (= (and b!53668 res!30429) b!53683))

(assert (= (and b!53683 res!30430) b!53678))

(assert (= (and b!53678 res!30434) b!53666))

(assert (= (and b!53666 res!30431) b!53676))

(assert (= (and b!53676 res!30425) b!53664))

(assert (= (and b!53664 res!30433) b!53665))

(assert (= (and b!53665 res!30427) b!53669))

(assert (= (and b!53669 res!30435) b!53682))

(assert (= (and b!53682 res!30432) b!53672))

(assert (= (and b!53672 res!30426) b!53674))

(assert (= (and b!53684 condMapEmpty!2532) mapIsEmpty!2532))

(assert (= (and b!53684 (not condMapEmpty!2532)) mapNonEmpty!2532))

(get-info :version)

(assert (= (and mapNonEmpty!2532 ((_ is ValueCellFull!800) mapValue!2532)) b!53673))

(assert (= (and b!53684 ((_ is ValueCellFull!800) mapDefault!2532)) b!53681))

(assert (= b!53670 b!53684))

(assert (= b!53671 b!53670))

(assert (= b!53677 b!53671))

(assert (= start!8292 b!53677))

(assert (= (and b!53679 condMapEmpty!2531) mapIsEmpty!2531))

(assert (= (and b!53679 (not condMapEmpty!2531)) mapNonEmpty!2531))

(assert (= (and mapNonEmpty!2531 ((_ is ValueCellFull!800) mapValue!2531)) b!53680))

(assert (= (and b!53679 ((_ is ValueCellFull!800) mapDefault!2531)) b!53675))

(assert (= b!53667 b!53679))

(assert (= start!8292 b!53667))

(declare-fun b_lambda!2385 () Bool)

(assert (=> (not b_lambda!2385) (not b!53676)))

(declare-fun t!4470 () Bool)

(declare-fun tb!1085 () Bool)

(assert (=> (and b!53670 (= (defaultEntry!1968 (v!2262 (underlying!174 thiss!992))) (defaultEntry!1968 (v!2262 (underlying!174 thiss!992)))) t!4470) tb!1085))

(declare-fun result!2025 () Bool)

(assert (=> tb!1085 (= result!2025 tp_is_empty!2287)))

(assert (=> b!53676 t!4470))

(declare-fun b_and!3029 () Bool)

(assert (= b_and!3025 (and (=> t!4470 result!2025) b_and!3029)))

(declare-fun tb!1087 () Bool)

(declare-fun t!4472 () Bool)

(assert (=> (and b!53667 (= (defaultEntry!1968 newMap!16) (defaultEntry!1968 (v!2262 (underlying!174 thiss!992)))) t!4472) tb!1087))

(declare-fun result!2029 () Bool)

(assert (= result!2029 result!2025))

(assert (=> b!53676 t!4472))

(declare-fun b_and!3031 () Bool)

(assert (= b_and!3027 (and (=> t!4472 result!2029) b_and!3031)))

(declare-fun m!45523 () Bool)

(assert (=> b!53669 m!45523))

(declare-fun m!45525 () Bool)

(assert (=> b!53682 m!45525))

(declare-fun m!45527 () Bool)

(assert (=> b!53683 m!45527))

(declare-fun m!45529 () Bool)

(assert (=> b!53666 m!45529))

(declare-fun m!45531 () Bool)

(assert (=> b!53666 m!45531))

(declare-fun m!45533 () Bool)

(assert (=> b!53666 m!45533))

(declare-fun m!45535 () Bool)

(assert (=> b!53676 m!45535))

(declare-fun m!45537 () Bool)

(assert (=> b!53676 m!45537))

(declare-fun m!45539 () Bool)

(assert (=> b!53676 m!45539))

(assert (=> b!53676 m!45529))

(assert (=> b!53676 m!45537))

(assert (=> b!53676 m!45529))

(assert (=> b!53676 m!45539))

(declare-fun m!45541 () Bool)

(assert (=> b!53676 m!45541))

(assert (=> b!53676 m!45535))

(assert (=> b!53676 m!45529))

(declare-fun m!45543 () Bool)

(assert (=> b!53676 m!45543))

(declare-fun m!45545 () Bool)

(assert (=> b!53670 m!45545))

(declare-fun m!45547 () Bool)

(assert (=> b!53670 m!45547))

(declare-fun m!45549 () Bool)

(assert (=> mapNonEmpty!2532 m!45549))

(declare-fun m!45551 () Bool)

(assert (=> start!8292 m!45551))

(assert (=> b!53674 m!45529))

(assert (=> b!53674 m!45529))

(declare-fun m!45553 () Bool)

(assert (=> b!53674 m!45553))

(declare-fun m!45555 () Bool)

(assert (=> b!53667 m!45555))

(declare-fun m!45557 () Bool)

(assert (=> b!53667 m!45557))

(declare-fun m!45559 () Bool)

(assert (=> b!53664 m!45559))

(declare-fun m!45561 () Bool)

(assert (=> mapNonEmpty!2531 m!45561))

(check-sat tp_is_empty!2287 (not b!53670) (not b_lambda!2385) (not b!53666) (not start!8292) b_and!3031 (not b!53669) (not b!53683) (not b!53682) (not b_next!1741) (not b_next!1743) (not mapNonEmpty!2532) (not b!53674) (not mapNonEmpty!2531) (not b!53667) (not b!53664) (not b!53676) b_and!3029)
(check-sat b_and!3029 b_and!3031 (not b_next!1741) (not b_next!1743))
