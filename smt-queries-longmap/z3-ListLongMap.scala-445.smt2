; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8286 () Bool)

(assert start!8286)

(declare-fun b!53481 () Bool)

(declare-fun b_free!1729 () Bool)

(declare-fun b_next!1729 () Bool)

(assert (=> b!53481 (= b_free!1729 (not b_next!1729))))

(declare-fun tp!7290 () Bool)

(declare-fun b_and!3001 () Bool)

(assert (=> b!53481 (= tp!7290 b_and!3001)))

(declare-fun b!53474 () Bool)

(declare-fun b_free!1731 () Bool)

(declare-fun b_next!1731 () Bool)

(assert (=> b!53474 (= b_free!1731 (not b_next!1731))))

(declare-fun tp!7287 () Bool)

(declare-fun b_and!3003 () Bool)

(assert (=> b!53474 (= tp!7287 b_and!3003)))

(declare-fun b!53469 () Bool)

(declare-fun res!30336 () Bool)

(declare-fun e!34891 () Bool)

(assert (=> b!53469 (=> (not res!30336) (not e!34891))))

(declare-datatypes ((V!2689 0))(
  ( (V!2690 (val!1185 Int)) )
))
(declare-datatypes ((array!3465 0))(
  ( (array!3466 (arr!1654 (Array (_ BitVec 32) (_ BitVec 64))) (size!1884 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!797 0))(
  ( (ValueCellFull!797 (v!2255 V!2689)) (EmptyCell!797) )
))
(declare-datatypes ((array!3467 0))(
  ( (array!3468 (arr!1655 (Array (_ BitVec 32) ValueCell!797)) (size!1885 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!502 0))(
  ( (LongMapFixedSize!503 (defaultEntry!1965 Int) (mask!5801 (_ BitVec 32)) (extraKeys!1856 (_ BitVec 32)) (zeroValue!1883 V!2689) (minValue!1883 V!2689) (_size!300 (_ BitVec 32)) (_keys!3584 array!3465) (_values!1948 array!3467) (_vacant!300 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!320 0))(
  ( (Cell!321 (v!2256 LongMapFixedSize!502)) )
))
(declare-datatypes ((LongMap!320 0))(
  ( (LongMap!321 (underlying!171 Cell!320)) )
))
(declare-fun thiss!992 () LongMap!320)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53469 (= res!30336 (validMask!0 (mask!5801 (v!2256 (underlying!171 thiss!992)))))))

(declare-fun mapNonEmpty!2513 () Bool)

(declare-fun mapRes!2513 () Bool)

(declare-fun tp!7288 () Bool)

(declare-fun e!34881 () Bool)

(assert (=> mapNonEmpty!2513 (= mapRes!2513 (and tp!7288 e!34881))))

(declare-fun mapRest!2514 () (Array (_ BitVec 32) ValueCell!797))

(declare-fun mapValue!2513 () ValueCell!797)

(declare-fun newMap!16 () LongMapFixedSize!502)

(declare-fun mapKey!2514 () (_ BitVec 32))

(assert (=> mapNonEmpty!2513 (= (arr!1655 (_values!1948 newMap!16)) (store mapRest!2514 mapKey!2514 mapValue!2513))))

(declare-fun mapIsEmpty!2513 () Bool)

(assert (=> mapIsEmpty!2513 mapRes!2513))

(declare-fun b!53470 () Bool)

(declare-fun res!30330 () Bool)

(assert (=> b!53470 (=> (not res!30330) (not e!34891))))

(declare-datatypes ((List!1360 0))(
  ( (Nil!1357) (Cons!1356 (h!1936 (_ BitVec 64)) (t!4457 List!1360)) )
))
(declare-fun arrayNoDuplicates!0 (array!3465 (_ BitVec 32) List!1360) Bool)

(assert (=> b!53470 (= res!30330 (arrayNoDuplicates!0 (_keys!3584 (v!2256 (underlying!171 thiss!992))) #b00000000000000000000000000000000 Nil!1357))))

(declare-fun b!53471 () Bool)

(declare-fun res!30333 () Bool)

(assert (=> b!53471 (=> (not res!30333) (not e!34891))))

(assert (=> b!53471 (= res!30333 (and (= (size!1885 (_values!1948 (v!2256 (underlying!171 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5801 (v!2256 (underlying!171 thiss!992))))) (= (size!1884 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) (size!1885 (_values!1948 (v!2256 (underlying!171 thiss!992))))) (bvsge (mask!5801 (v!2256 (underlying!171 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1856 (v!2256 (underlying!171 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1856 (v!2256 (underlying!171 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53472 () Bool)

(declare-fun e!34880 () Bool)

(declare-fun e!34892 () Bool)

(assert (=> b!53472 (= e!34880 e!34892)))

(declare-fun res!30332 () Bool)

(assert (=> b!53472 (=> (not res!30332) (not e!34892))))

(declare-datatypes ((tuple2!1896 0))(
  ( (tuple2!1897 (_1!959 (_ BitVec 64)) (_2!959 V!2689)) )
))
(declare-datatypes ((List!1361 0))(
  ( (Nil!1358) (Cons!1357 (h!1937 tuple2!1896) (t!4458 List!1361)) )
))
(declare-datatypes ((ListLongMap!1281 0))(
  ( (ListLongMap!1282 (toList!656 List!1361)) )
))
(declare-fun lt!21467 () ListLongMap!1281)

(declare-fun lt!21468 () ListLongMap!1281)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!53472 (= res!30332 (and (= lt!21468 lt!21467) (not (= (select (arr!1654 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1654 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1036 (LongMapFixedSize!502) ListLongMap!1281)

(assert (=> b!53472 (= lt!21467 (map!1036 newMap!16))))

(declare-fun getCurrentListMap!360 (array!3465 array!3467 (_ BitVec 32) (_ BitVec 32) V!2689 V!2689 (_ BitVec 32) Int) ListLongMap!1281)

(assert (=> b!53472 (= lt!21468 (getCurrentListMap!360 (_keys!3584 (v!2256 (underlying!171 thiss!992))) (_values!1948 (v!2256 (underlying!171 thiss!992))) (mask!5801 (v!2256 (underlying!171 thiss!992))) (extraKeys!1856 (v!2256 (underlying!171 thiss!992))) (zeroValue!1883 (v!2256 (underlying!171 thiss!992))) (minValue!1883 (v!2256 (underlying!171 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1965 (v!2256 (underlying!171 thiss!992)))))))

(declare-fun mapIsEmpty!2514 () Bool)

(declare-fun mapRes!2514 () Bool)

(assert (=> mapIsEmpty!2514 mapRes!2514))

(declare-fun b!53473 () Bool)

(declare-fun e!34889 () Bool)

(declare-fun tp_is_empty!2281 () Bool)

(assert (=> b!53473 (= e!34889 tp_is_empty!2281)))

(declare-fun b!53475 () Bool)

(declare-fun e!34890 () Bool)

(declare-fun e!34884 () Bool)

(assert (=> b!53475 (= e!34890 e!34884)))

(declare-fun b!53476 () Bool)

(assert (=> b!53476 (= e!34891 false)))

(declare-fun lt!21469 () Bool)

(declare-fun contains!632 (ListLongMap!1281 (_ BitVec 64)) Bool)

(assert (=> b!53476 (= lt!21469 (contains!632 lt!21468 (select (arr!1654 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) from!355)))))

(declare-fun b!53477 () Bool)

(declare-fun e!34886 () Bool)

(declare-fun e!34888 () Bool)

(assert (=> b!53477 (= e!34886 (and e!34888 mapRes!2513))))

(declare-fun condMapEmpty!2514 () Bool)

(declare-fun mapDefault!2514 () ValueCell!797)

(assert (=> b!53477 (= condMapEmpty!2514 (= (arr!1655 (_values!1948 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!797)) mapDefault!2514)))))

(declare-fun b!53478 () Bool)

(assert (=> b!53478 (= e!34888 tp_is_empty!2281)))

(declare-fun b!53479 () Bool)

(declare-fun e!34882 () Bool)

(declare-fun e!34893 () Bool)

(assert (=> b!53479 (= e!34882 (and e!34893 mapRes!2514))))

(declare-fun condMapEmpty!2513 () Bool)

(declare-fun mapDefault!2513 () ValueCell!797)

(assert (=> b!53479 (= condMapEmpty!2513 (= (arr!1655 (_values!1948 (v!2256 (underlying!171 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!797)) mapDefault!2513)))))

(declare-fun mapNonEmpty!2514 () Bool)

(declare-fun tp!7289 () Bool)

(assert (=> mapNonEmpty!2514 (= mapRes!2514 (and tp!7289 e!34889))))

(declare-fun mapValue!2514 () ValueCell!797)

(declare-fun mapKey!2513 () (_ BitVec 32))

(declare-fun mapRest!2513 () (Array (_ BitVec 32) ValueCell!797))

(assert (=> mapNonEmpty!2514 (= (arr!1655 (_values!1948 (v!2256 (underlying!171 thiss!992)))) (store mapRest!2513 mapKey!2513 mapValue!2514))))

(declare-fun b!53480 () Bool)

(assert (=> b!53480 (= e!34893 tp_is_empty!2281)))

(declare-fun array_inv!1013 (array!3465) Bool)

(declare-fun array_inv!1014 (array!3467) Bool)

(assert (=> b!53481 (= e!34884 (and tp!7290 tp_is_empty!2281 (array_inv!1013 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) (array_inv!1014 (_values!1948 (v!2256 (underlying!171 thiss!992)))) e!34882))))

(declare-fun b!53482 () Bool)

(declare-fun e!34887 () Bool)

(assert (=> b!53482 (= e!34887 e!34890)))

(declare-fun b!53483 () Bool)

(declare-fun res!30335 () Bool)

(assert (=> b!53483 (=> (not res!30335) (not e!34891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3465 (_ BitVec 32)) Bool)

(assert (=> b!53483 (= res!30335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3584 (v!2256 (underlying!171 thiss!992))) (mask!5801 (v!2256 (underlying!171 thiss!992)))))))

(declare-fun b!53484 () Bool)

(declare-fun res!30327 () Bool)

(assert (=> b!53484 (=> (not res!30327) (not e!34891))))

(assert (=> b!53484 (= res!30327 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1884 (_keys!3584 (v!2256 (underlying!171 thiss!992)))))))))

(declare-fun b!53485 () Bool)

(declare-fun res!30326 () Bool)

(assert (=> b!53485 (=> (not res!30326) (not e!34880))))

(declare-fun valid!193 (LongMapFixedSize!502) Bool)

(assert (=> b!53485 (= res!30326 (valid!193 newMap!16))))

(declare-fun b!53486 () Bool)

(declare-fun res!30328 () Bool)

(assert (=> b!53486 (=> (not res!30328) (not e!34880))))

(assert (=> b!53486 (= res!30328 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1884 (_keys!3584 (v!2256 (underlying!171 thiss!992)))))))))

(declare-fun b!53487 () Bool)

(declare-fun res!30334 () Bool)

(assert (=> b!53487 (=> (not res!30334) (not e!34880))))

(assert (=> b!53487 (= res!30334 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5801 newMap!16)) (_size!300 (v!2256 (underlying!171 thiss!992)))))))

(declare-fun e!34894 () Bool)

(assert (=> b!53474 (= e!34894 (and tp!7287 tp_is_empty!2281 (array_inv!1013 (_keys!3584 newMap!16)) (array_inv!1014 (_values!1948 newMap!16)) e!34886))))

(declare-fun res!30329 () Bool)

(assert (=> start!8286 (=> (not res!30329) (not e!34880))))

(declare-fun valid!194 (LongMap!320) Bool)

(assert (=> start!8286 (= res!30329 (valid!194 thiss!992))))

(assert (=> start!8286 e!34880))

(assert (=> start!8286 e!34887))

(assert (=> start!8286 true))

(assert (=> start!8286 e!34894))

(declare-fun b!53488 () Bool)

(assert (=> b!53488 (= e!34881 tp_is_empty!2281)))

(declare-fun b!53489 () Bool)

(assert (=> b!53489 (= e!34892 e!34891)))

(declare-fun res!30331 () Bool)

(assert (=> b!53489 (=> (not res!30331) (not e!34891))))

(assert (=> b!53489 (= res!30331 (contains!632 lt!21467 (select (arr!1654 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1898 0))(
  ( (tuple2!1899 (_1!960 Bool) (_2!960 LongMapFixedSize!502)) )
))
(declare-fun lt!21470 () tuple2!1898)

(declare-fun update!52 (LongMapFixedSize!502 (_ BitVec 64) V!2689) tuple2!1898)

(declare-fun get!998 (ValueCell!797 V!2689) V!2689)

(declare-fun dynLambda!276 (Int (_ BitVec 64)) V!2689)

(assert (=> b!53489 (= lt!21470 (update!52 newMap!16 (select (arr!1654 (_keys!3584 (v!2256 (underlying!171 thiss!992)))) from!355) (get!998 (select (arr!1655 (_values!1948 (v!2256 (underlying!171 thiss!992)))) from!355) (dynLambda!276 (defaultEntry!1965 (v!2256 (underlying!171 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8286 res!30329) b!53486))

(assert (= (and b!53486 res!30328) b!53485))

(assert (= (and b!53485 res!30326) b!53487))

(assert (= (and b!53487 res!30334) b!53472))

(assert (= (and b!53472 res!30332) b!53489))

(assert (= (and b!53489 res!30331) b!53469))

(assert (= (and b!53469 res!30336) b!53471))

(assert (= (and b!53471 res!30333) b!53483))

(assert (= (and b!53483 res!30335) b!53470))

(assert (= (and b!53470 res!30330) b!53484))

(assert (= (and b!53484 res!30327) b!53476))

(assert (= (and b!53479 condMapEmpty!2513) mapIsEmpty!2514))

(assert (= (and b!53479 (not condMapEmpty!2513)) mapNonEmpty!2514))

(get-info :version)

(assert (= (and mapNonEmpty!2514 ((_ is ValueCellFull!797) mapValue!2514)) b!53473))

(assert (= (and b!53479 ((_ is ValueCellFull!797) mapDefault!2513)) b!53480))

(assert (= b!53481 b!53479))

(assert (= b!53475 b!53481))

(assert (= b!53482 b!53475))

(assert (= start!8286 b!53482))

(assert (= (and b!53477 condMapEmpty!2514) mapIsEmpty!2513))

(assert (= (and b!53477 (not condMapEmpty!2514)) mapNonEmpty!2513))

(assert (= (and mapNonEmpty!2513 ((_ is ValueCellFull!797) mapValue!2513)) b!53488))

(assert (= (and b!53477 ((_ is ValueCellFull!797) mapDefault!2514)) b!53478))

(assert (= b!53474 b!53477))

(assert (= start!8286 b!53474))

(declare-fun b_lambda!2379 () Bool)

(assert (=> (not b_lambda!2379) (not b!53489)))

(declare-fun t!4454 () Bool)

(declare-fun tb!1073 () Bool)

(assert (=> (and b!53481 (= (defaultEntry!1965 (v!2256 (underlying!171 thiss!992))) (defaultEntry!1965 (v!2256 (underlying!171 thiss!992)))) t!4454) tb!1073))

(declare-fun result!2007 () Bool)

(assert (=> tb!1073 (= result!2007 tp_is_empty!2281)))

(assert (=> b!53489 t!4454))

(declare-fun b_and!3005 () Bool)

(assert (= b_and!3001 (and (=> t!4454 result!2007) b_and!3005)))

(declare-fun t!4456 () Bool)

(declare-fun tb!1075 () Bool)

(assert (=> (and b!53474 (= (defaultEntry!1965 newMap!16) (defaultEntry!1965 (v!2256 (underlying!171 thiss!992)))) t!4456) tb!1075))

(declare-fun result!2011 () Bool)

(assert (= result!2011 result!2007))

(assert (=> b!53489 t!4456))

(declare-fun b_and!3007 () Bool)

(assert (= b_and!3003 (and (=> t!4456 result!2011) b_and!3007)))

(declare-fun m!45403 () Bool)

(assert (=> mapNonEmpty!2513 m!45403))

(declare-fun m!45405 () Bool)

(assert (=> b!53476 m!45405))

(assert (=> b!53476 m!45405))

(declare-fun m!45407 () Bool)

(assert (=> b!53476 m!45407))

(declare-fun m!45409 () Bool)

(assert (=> b!53483 m!45409))

(declare-fun m!45411 () Bool)

(assert (=> b!53470 m!45411))

(declare-fun m!45413 () Bool)

(assert (=> b!53469 m!45413))

(declare-fun m!45415 () Bool)

(assert (=> b!53489 m!45415))

(declare-fun m!45417 () Bool)

(assert (=> b!53489 m!45417))

(declare-fun m!45419 () Bool)

(assert (=> b!53489 m!45419))

(assert (=> b!53489 m!45405))

(assert (=> b!53489 m!45417))

(assert (=> b!53489 m!45405))

(declare-fun m!45421 () Bool)

(assert (=> b!53489 m!45421))

(assert (=> b!53489 m!45405))

(assert (=> b!53489 m!45419))

(declare-fun m!45423 () Bool)

(assert (=> b!53489 m!45423))

(assert (=> b!53489 m!45415))

(declare-fun m!45425 () Bool)

(assert (=> start!8286 m!45425))

(declare-fun m!45427 () Bool)

(assert (=> mapNonEmpty!2514 m!45427))

(declare-fun m!45429 () Bool)

(assert (=> b!53481 m!45429))

(declare-fun m!45431 () Bool)

(assert (=> b!53481 m!45431))

(assert (=> b!53472 m!45405))

(declare-fun m!45433 () Bool)

(assert (=> b!53472 m!45433))

(declare-fun m!45435 () Bool)

(assert (=> b!53472 m!45435))

(declare-fun m!45437 () Bool)

(assert (=> b!53474 m!45437))

(declare-fun m!45439 () Bool)

(assert (=> b!53474 m!45439))

(declare-fun m!45441 () Bool)

(assert (=> b!53485 m!45441))

(check-sat (not b_next!1731) tp_is_empty!2281 (not b!53483) (not b!53485) (not b!53472) b_and!3005 (not b_next!1729) (not mapNonEmpty!2514) (not b!53481) (not b!53489) (not mapNonEmpty!2513) (not b!53476) b_and!3007 (not b!53474) (not b!53469) (not start!8286) (not b_lambda!2379) (not b!53470))
(check-sat b_and!3005 b_and!3007 (not b_next!1729) (not b_next!1731))
