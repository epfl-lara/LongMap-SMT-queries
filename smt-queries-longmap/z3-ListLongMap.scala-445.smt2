; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8286 () Bool)

(assert start!8286)

(declare-fun b!53485 () Bool)

(declare-fun b_free!1729 () Bool)

(declare-fun b_next!1729 () Bool)

(assert (=> b!53485 (= b_free!1729 (not b_next!1729))))

(declare-fun tp!7287 () Bool)

(declare-fun b_and!2997 () Bool)

(assert (=> b!53485 (= tp!7287 b_and!2997)))

(declare-fun b!53494 () Bool)

(declare-fun b_free!1731 () Bool)

(declare-fun b_next!1731 () Bool)

(assert (=> b!53494 (= b_free!1731 (not b_next!1731))))

(declare-fun tp!7289 () Bool)

(declare-fun b_and!2999 () Bool)

(assert (=> b!53494 (= tp!7289 b_and!2999)))

(declare-fun mapIsEmpty!2513 () Bool)

(declare-fun mapRes!2513 () Bool)

(assert (=> mapIsEmpty!2513 mapRes!2513))

(declare-fun res!30326 () Bool)

(declare-fun e!34896 () Bool)

(assert (=> start!8286 (=> (not res!30326) (not e!34896))))

(declare-datatypes ((V!2689 0))(
  ( (V!2690 (val!1185 Int)) )
))
(declare-datatypes ((array!3471 0))(
  ( (array!3472 (arr!1658 (Array (_ BitVec 32) (_ BitVec 64))) (size!1887 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!797 0))(
  ( (ValueCellFull!797 (v!2259 V!2689)) (EmptyCell!797) )
))
(declare-datatypes ((array!3473 0))(
  ( (array!3474 (arr!1659 (Array (_ BitVec 32) ValueCell!797)) (size!1888 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!502 0))(
  ( (LongMapFixedSize!503 (defaultEntry!1965 Int) (mask!5802 (_ BitVec 32)) (extraKeys!1856 (_ BitVec 32)) (zeroValue!1883 V!2689) (minValue!1883 V!2689) (_size!300 (_ BitVec 32)) (_keys!3585 array!3471) (_values!1948 array!3473) (_vacant!300 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!322 0))(
  ( (Cell!323 (v!2260 LongMapFixedSize!502)) )
))
(declare-datatypes ((LongMap!322 0))(
  ( (LongMap!323 (underlying!172 Cell!322)) )
))
(declare-fun thiss!992 () LongMap!322)

(declare-fun valid!197 (LongMap!322) Bool)

(assert (=> start!8286 (= res!30326 (valid!197 thiss!992))))

(assert (=> start!8286 e!34896))

(declare-fun e!34891 () Bool)

(assert (=> start!8286 e!34891))

(assert (=> start!8286 true))

(declare-fun e!34886 () Bool)

(assert (=> start!8286 e!34886))

(declare-fun b!53478 () Bool)

(declare-fun e!34898 () Bool)

(declare-fun e!34900 () Bool)

(assert (=> b!53478 (= e!34898 e!34900)))

(declare-fun res!30328 () Bool)

(assert (=> b!53478 (=> (not res!30328) (not e!34900))))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((tuple2!1876 0))(
  ( (tuple2!1877 (_1!949 (_ BitVec 64)) (_2!949 V!2689)) )
))
(declare-datatypes ((List!1345 0))(
  ( (Nil!1342) (Cons!1341 (h!1921 tuple2!1876) (t!4443 List!1345)) )
))
(declare-datatypes ((ListLongMap!1265 0))(
  ( (ListLongMap!1266 (toList!648 List!1345)) )
))
(declare-fun lt!21441 () ListLongMap!1265)

(declare-fun contains!627 (ListLongMap!1265 (_ BitVec 64)) Bool)

(assert (=> b!53478 (= res!30328 (contains!627 lt!21441 (select (arr!1658 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!502)

(declare-datatypes ((tuple2!1878 0))(
  ( (tuple2!1879 (_1!950 Bool) (_2!950 LongMapFixedSize!502)) )
))
(declare-fun lt!21443 () tuple2!1878)

(declare-fun update!56 (LongMapFixedSize!502 (_ BitVec 64) V!2689) tuple2!1878)

(declare-fun get!999 (ValueCell!797 V!2689) V!2689)

(declare-fun dynLambda!274 (Int (_ BitVec 64)) V!2689)

(assert (=> b!53478 (= lt!21443 (update!56 newMap!16 (select (arr!1658 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) from!355) (get!999 (select (arr!1659 (_values!1948 (v!2260 (underlying!172 thiss!992)))) from!355) (dynLambda!274 (defaultEntry!1965 (v!2260 (underlying!172 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!53479 () Bool)

(declare-fun res!30321 () Bool)

(assert (=> b!53479 (=> (not res!30321) (not e!34900))))

(assert (=> b!53479 (= res!30321 (and (= (size!1888 (_values!1948 (v!2260 (underlying!172 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5802 (v!2260 (underlying!172 thiss!992))))) (= (size!1887 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) (size!1888 (_values!1948 (v!2260 (underlying!172 thiss!992))))) (bvsge (mask!5802 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1856 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1856 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!53480 () Bool)

(declare-fun e!34889 () Bool)

(declare-fun e!34895 () Bool)

(declare-fun mapRes!2514 () Bool)

(assert (=> b!53480 (= e!34889 (and e!34895 mapRes!2514))))

(declare-fun condMapEmpty!2513 () Bool)

(declare-fun mapDefault!2514 () ValueCell!797)

(assert (=> b!53480 (= condMapEmpty!2513 (= (arr!1659 (_values!1948 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!797)) mapDefault!2514)))))

(declare-fun b!53481 () Bool)

(declare-fun e!34897 () Bool)

(declare-fun e!34890 () Bool)

(assert (=> b!53481 (= e!34897 e!34890)))

(declare-fun b!53482 () Bool)

(declare-fun res!30322 () Bool)

(assert (=> b!53482 (=> (not res!30322) (not e!34896))))

(declare-fun valid!198 (LongMapFixedSize!502) Bool)

(assert (=> b!53482 (= res!30322 (valid!198 newMap!16))))

(declare-fun b!53483 () Bool)

(declare-fun res!30330 () Bool)

(assert (=> b!53483 (=> (not res!30330) (not e!34896))))

(assert (=> b!53483 (= res!30330 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1887 (_keys!3585 (v!2260 (underlying!172 thiss!992)))))))))

(declare-fun b!53484 () Bool)

(declare-fun res!30329 () Bool)

(assert (=> b!53484 (=> (not res!30329) (not e!34896))))

(assert (=> b!53484 (= res!30329 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5802 newMap!16)) (_size!300 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun e!34887 () Bool)

(declare-fun tp_is_empty!2281 () Bool)

(declare-fun array_inv!1011 (array!3471) Bool)

(declare-fun array_inv!1012 (array!3473) Bool)

(assert (=> b!53485 (= e!34890 (and tp!7287 tp_is_empty!2281 (array_inv!1011 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) (array_inv!1012 (_values!1948 (v!2260 (underlying!172 thiss!992)))) e!34887))))

(declare-fun b!53486 () Bool)

(declare-fun e!34894 () Bool)

(assert (=> b!53486 (= e!34894 tp_is_empty!2281)))

(declare-fun b!53487 () Bool)

(declare-fun res!30327 () Bool)

(assert (=> b!53487 (=> (not res!30327) (not e!34900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!53487 (= res!30327 (validMask!0 (mask!5802 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun mapNonEmpty!2513 () Bool)

(declare-fun tp!7290 () Bool)

(declare-fun e!34888 () Bool)

(assert (=> mapNonEmpty!2513 (= mapRes!2514 (and tp!7290 e!34888))))

(declare-fun mapKey!2513 () (_ BitVec 32))

(declare-fun mapRest!2513 () (Array (_ BitVec 32) ValueCell!797))

(declare-fun mapValue!2513 () ValueCell!797)

(assert (=> mapNonEmpty!2513 (= (arr!1659 (_values!1948 newMap!16)) (store mapRest!2513 mapKey!2513 mapValue!2513))))

(declare-fun b!53488 () Bool)

(assert (=> b!53488 (= e!34888 tp_is_empty!2281)))

(declare-fun b!53489 () Bool)

(declare-fun res!30324 () Bool)

(assert (=> b!53489 (=> (not res!30324) (not e!34900))))

(assert (=> b!53489 (= res!30324 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1887 (_keys!3585 (v!2260 (underlying!172 thiss!992)))))))))

(declare-fun b!53490 () Bool)

(declare-fun res!30331 () Bool)

(assert (=> b!53490 (=> (not res!30331) (not e!34900))))

(declare-datatypes ((List!1346 0))(
  ( (Nil!1343) (Cons!1342 (h!1922 (_ BitVec 64)) (t!4444 List!1346)) )
))
(declare-fun arrayNoDuplicates!0 (array!3471 (_ BitVec 32) List!1346) Bool)

(assert (=> b!53490 (= res!30331 (arrayNoDuplicates!0 (_keys!3585 (v!2260 (underlying!172 thiss!992))) #b00000000000000000000000000000000 Nil!1343))))

(declare-fun b!53491 () Bool)

(declare-fun e!34899 () Bool)

(assert (=> b!53491 (= e!34887 (and e!34899 mapRes!2513))))

(declare-fun condMapEmpty!2514 () Bool)

(declare-fun mapDefault!2513 () ValueCell!797)

(assert (=> b!53491 (= condMapEmpty!2514 (= (arr!1659 (_values!1948 (v!2260 (underlying!172 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!797)) mapDefault!2513)))))

(declare-fun b!53492 () Bool)

(declare-fun res!30325 () Bool)

(assert (=> b!53492 (=> (not res!30325) (not e!34900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3471 (_ BitVec 32)) Bool)

(assert (=> b!53492 (= res!30325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3585 (v!2260 (underlying!172 thiss!992))) (mask!5802 (v!2260 (underlying!172 thiss!992)))))))

(declare-fun b!53493 () Bool)

(assert (=> b!53493 (= e!34899 tp_is_empty!2281)))

(assert (=> b!53494 (= e!34886 (and tp!7289 tp_is_empty!2281 (array_inv!1011 (_keys!3585 newMap!16)) (array_inv!1012 (_values!1948 newMap!16)) e!34889))))

(declare-fun mapIsEmpty!2514 () Bool)

(assert (=> mapIsEmpty!2514 mapRes!2514))

(declare-fun mapNonEmpty!2514 () Bool)

(declare-fun tp!7288 () Bool)

(assert (=> mapNonEmpty!2514 (= mapRes!2513 (and tp!7288 e!34894))))

(declare-fun mapKey!2514 () (_ BitVec 32))

(declare-fun mapValue!2514 () ValueCell!797)

(declare-fun mapRest!2514 () (Array (_ BitVec 32) ValueCell!797))

(assert (=> mapNonEmpty!2514 (= (arr!1659 (_values!1948 (v!2260 (underlying!172 thiss!992)))) (store mapRest!2514 mapKey!2514 mapValue!2514))))

(declare-fun b!53495 () Bool)

(assert (=> b!53495 (= e!34895 tp_is_empty!2281)))

(declare-fun b!53496 () Bool)

(assert (=> b!53496 (= e!34900 false)))

(declare-fun lt!21440 () ListLongMap!1265)

(declare-fun lt!21442 () Bool)

(assert (=> b!53496 (= lt!21442 (contains!627 lt!21440 (select (arr!1658 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) from!355)))))

(declare-fun b!53497 () Bool)

(assert (=> b!53497 (= e!34891 e!34897)))

(declare-fun b!53498 () Bool)

(assert (=> b!53498 (= e!34896 e!34898)))

(declare-fun res!30323 () Bool)

(assert (=> b!53498 (=> (not res!30323) (not e!34898))))

(assert (=> b!53498 (= res!30323 (and (= lt!21440 lt!21441) (not (= (select (arr!1658 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1658 (_keys!3585 (v!2260 (underlying!172 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1035 (LongMapFixedSize!502) ListLongMap!1265)

(assert (=> b!53498 (= lt!21441 (map!1035 newMap!16))))

(declare-fun getCurrentListMap!353 (array!3471 array!3473 (_ BitVec 32) (_ BitVec 32) V!2689 V!2689 (_ BitVec 32) Int) ListLongMap!1265)

(assert (=> b!53498 (= lt!21440 (getCurrentListMap!353 (_keys!3585 (v!2260 (underlying!172 thiss!992))) (_values!1948 (v!2260 (underlying!172 thiss!992))) (mask!5802 (v!2260 (underlying!172 thiss!992))) (extraKeys!1856 (v!2260 (underlying!172 thiss!992))) (zeroValue!1883 (v!2260 (underlying!172 thiss!992))) (minValue!1883 (v!2260 (underlying!172 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1965 (v!2260 (underlying!172 thiss!992)))))))

(assert (= (and start!8286 res!30326) b!53483))

(assert (= (and b!53483 res!30330) b!53482))

(assert (= (and b!53482 res!30322) b!53484))

(assert (= (and b!53484 res!30329) b!53498))

(assert (= (and b!53498 res!30323) b!53478))

(assert (= (and b!53478 res!30328) b!53487))

(assert (= (and b!53487 res!30327) b!53479))

(assert (= (and b!53479 res!30321) b!53492))

(assert (= (and b!53492 res!30325) b!53490))

(assert (= (and b!53490 res!30331) b!53489))

(assert (= (and b!53489 res!30324) b!53496))

(assert (= (and b!53491 condMapEmpty!2514) mapIsEmpty!2513))

(assert (= (and b!53491 (not condMapEmpty!2514)) mapNonEmpty!2514))

(get-info :version)

(assert (= (and mapNonEmpty!2514 ((_ is ValueCellFull!797) mapValue!2514)) b!53486))

(assert (= (and b!53491 ((_ is ValueCellFull!797) mapDefault!2513)) b!53493))

(assert (= b!53485 b!53491))

(assert (= b!53481 b!53485))

(assert (= b!53497 b!53481))

(assert (= start!8286 b!53497))

(assert (= (and b!53480 condMapEmpty!2513) mapIsEmpty!2514))

(assert (= (and b!53480 (not condMapEmpty!2513)) mapNonEmpty!2513))

(assert (= (and mapNonEmpty!2513 ((_ is ValueCellFull!797) mapValue!2513)) b!53488))

(assert (= (and b!53480 ((_ is ValueCellFull!797) mapDefault!2514)) b!53495))

(assert (= b!53494 b!53480))

(assert (= start!8286 b!53494))

(declare-fun b_lambda!2375 () Bool)

(assert (=> (not b_lambda!2375) (not b!53478)))

(declare-fun t!4440 () Bool)

(declare-fun tb!1073 () Bool)

(assert (=> (and b!53485 (= (defaultEntry!1965 (v!2260 (underlying!172 thiss!992))) (defaultEntry!1965 (v!2260 (underlying!172 thiss!992)))) t!4440) tb!1073))

(declare-fun result!2007 () Bool)

(assert (=> tb!1073 (= result!2007 tp_is_empty!2281)))

(assert (=> b!53478 t!4440))

(declare-fun b_and!3001 () Bool)

(assert (= b_and!2997 (and (=> t!4440 result!2007) b_and!3001)))

(declare-fun tb!1075 () Bool)

(declare-fun t!4442 () Bool)

(assert (=> (and b!53494 (= (defaultEntry!1965 newMap!16) (defaultEntry!1965 (v!2260 (underlying!172 thiss!992)))) t!4442) tb!1075))

(declare-fun result!2011 () Bool)

(assert (= result!2011 result!2007))

(assert (=> b!53478 t!4442))

(declare-fun b_and!3003 () Bool)

(assert (= b_and!2999 (and (=> t!4442 result!2011) b_and!3003)))

(declare-fun m!45361 () Bool)

(assert (=> start!8286 m!45361))

(declare-fun m!45363 () Bool)

(assert (=> b!53487 m!45363))

(declare-fun m!45365 () Bool)

(assert (=> b!53496 m!45365))

(assert (=> b!53496 m!45365))

(declare-fun m!45367 () Bool)

(assert (=> b!53496 m!45367))

(declare-fun m!45369 () Bool)

(assert (=> b!53485 m!45369))

(declare-fun m!45371 () Bool)

(assert (=> b!53485 m!45371))

(declare-fun m!45373 () Bool)

(assert (=> mapNonEmpty!2513 m!45373))

(declare-fun m!45375 () Bool)

(assert (=> b!53478 m!45375))

(declare-fun m!45377 () Bool)

(assert (=> b!53478 m!45377))

(declare-fun m!45379 () Bool)

(assert (=> b!53478 m!45379))

(assert (=> b!53478 m!45365))

(assert (=> b!53478 m!45365))

(declare-fun m!45381 () Bool)

(assert (=> b!53478 m!45381))

(assert (=> b!53478 m!45377))

(assert (=> b!53478 m!45365))

(assert (=> b!53478 m!45379))

(declare-fun m!45383 () Bool)

(assert (=> b!53478 m!45383))

(assert (=> b!53478 m!45375))

(assert (=> b!53498 m!45365))

(declare-fun m!45385 () Bool)

(assert (=> b!53498 m!45385))

(declare-fun m!45387 () Bool)

(assert (=> b!53498 m!45387))

(declare-fun m!45389 () Bool)

(assert (=> b!53482 m!45389))

(declare-fun m!45391 () Bool)

(assert (=> b!53490 m!45391))

(declare-fun m!45393 () Bool)

(assert (=> b!53494 m!45393))

(declare-fun m!45395 () Bool)

(assert (=> b!53494 m!45395))

(declare-fun m!45397 () Bool)

(assert (=> mapNonEmpty!2514 m!45397))

(declare-fun m!45399 () Bool)

(assert (=> b!53492 m!45399))

(check-sat (not b_lambda!2375) (not mapNonEmpty!2513) (not b!53498) (not mapNonEmpty!2514) (not start!8286) (not b!53478) (not b!53496) (not b!53492) (not b_next!1729) b_and!3001 (not b!53490) (not b!53485) b_and!3003 (not b_next!1731) (not b!53487) (not b!53482) (not b!53494) tp_is_empty!2281)
(check-sat b_and!3001 b_and!3003 (not b_next!1729) (not b_next!1731))
