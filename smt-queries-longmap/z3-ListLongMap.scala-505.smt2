; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11948 () Bool)

(assert start!11948)

(declare-fun b!100707 () Bool)

(declare-fun b_free!2453 () Bool)

(declare-fun b_next!2453 () Bool)

(assert (=> b!100707 (= b_free!2453 (not b_next!2453))))

(declare-fun tp!9657 () Bool)

(declare-fun b_and!6203 () Bool)

(assert (=> b!100707 (= tp!9657 b_and!6203)))

(declare-fun b!100696 () Bool)

(declare-fun b_free!2455 () Bool)

(declare-fun b_next!2455 () Bool)

(assert (=> b!100696 (= b_free!2455 (not b_next!2455))))

(declare-fun tp!9658 () Bool)

(declare-fun b_and!6205 () Bool)

(assert (=> b!100696 (= tp!9658 b_and!6205)))

(declare-fun b!100693 () Bool)

(declare-fun e!65579 () Bool)

(declare-fun e!65578 () Bool)

(assert (=> b!100693 (= e!65579 e!65578)))

(declare-fun res!50504 () Bool)

(assert (=> b!100693 (=> (not res!50504) (not e!65578))))

(declare-datatypes ((V!3171 0))(
  ( (V!3172 (val!1366 Int)) )
))
(declare-datatypes ((array!4269 0))(
  ( (array!4270 (arr!2027 (Array (_ BitVec 32) (_ BitVec 64))) (size!2279 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!978 0))(
  ( (ValueCellFull!978 (v!2831 V!3171)) (EmptyCell!978) )
))
(declare-datatypes ((array!4271 0))(
  ( (array!4272 (arr!2028 (Array (_ BitVec 32) ValueCell!978)) (size!2280 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!864 0))(
  ( (LongMapFixedSize!865 (defaultEntry!2523 Int) (mask!6640 (_ BitVec 32)) (extraKeys!2336 (_ BitVec 32)) (zeroValue!2402 V!3171) (minValue!2402 V!3171) (_size!481 (_ BitVec 32)) (_keys!4221 array!4269) (_values!2506 array!4271) (_vacant!481 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2354 0))(
  ( (tuple2!2355 (_1!1188 Bool) (_2!1188 LongMapFixedSize!864)) )
))
(declare-fun lt!50932 () tuple2!2354)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!100693 (= res!50504 (and (_1!1188 lt!50932) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!3060 0))(
  ( (Unit!3061) )
))
(declare-fun lt!50937 () Unit!3060)

(declare-fun e!65574 () Unit!3060)

(assert (=> b!100693 (= lt!50937 e!65574)))

(declare-fun c!17287 () Bool)

(declare-datatypes ((Cell!664 0))(
  ( (Cell!665 (v!2832 LongMapFixedSize!864)) )
))
(declare-datatypes ((LongMap!664 0))(
  ( (LongMap!665 (underlying!343 Cell!664)) )
))
(declare-fun thiss!992 () LongMap!664)

(declare-datatypes ((tuple2!2356 0))(
  ( (tuple2!2357 (_1!1189 (_ BitVec 64)) (_2!1189 V!3171)) )
))
(declare-datatypes ((List!1586 0))(
  ( (Nil!1583) (Cons!1582 (h!2178 tuple2!2356) (t!5580 List!1586)) )
))
(declare-datatypes ((ListLongMap!1543 0))(
  ( (ListLongMap!1544 (toList!787 List!1586)) )
))
(declare-fun lt!50935 () ListLongMap!1543)

(declare-fun contains!808 (ListLongMap!1543 (_ BitVec 64)) Bool)

(assert (=> b!100693 (= c!17287 (contains!808 lt!50935 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun newMap!16 () LongMapFixedSize!864)

(declare-fun update!144 (LongMapFixedSize!864 (_ BitVec 64) V!3171) tuple2!2354)

(declare-fun get!1294 (ValueCell!978 V!3171) V!3171)

(declare-fun dynLambda!372 (Int (_ BitVec 64)) V!3171)

(assert (=> b!100693 (= lt!50932 (update!144 newMap!16 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!100694 () Bool)

(declare-fun e!65581 () Bool)

(declare-fun tp_is_empty!2643 () Bool)

(assert (=> b!100694 (= e!65581 tp_is_empty!2643)))

(declare-fun b!100695 () Bool)

(declare-fun res!50498 () Bool)

(declare-fun e!65583 () Bool)

(assert (=> b!100695 (=> (not res!50498) (not e!65583))))

(declare-fun valid!391 (LongMapFixedSize!864) Bool)

(assert (=> b!100695 (= res!50498 (valid!391 newMap!16))))

(declare-fun e!65572 () Bool)

(declare-fun e!65587 () Bool)

(declare-fun array_inv!1265 (array!4269) Bool)

(declare-fun array_inv!1266 (array!4271) Bool)

(assert (=> b!100696 (= e!65572 (and tp!9658 tp_is_empty!2643 (array_inv!1265 (_keys!4221 newMap!16)) (array_inv!1266 (_values!2506 newMap!16)) e!65587))))

(declare-fun b!100697 () Bool)

(declare-fun res!50500 () Bool)

(assert (=> b!100697 (=> (not res!50500) (not e!65578))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!100697 (= res!50500 (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!100698 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4269 (_ BitVec 32)) Bool)

(assert (=> b!100698 (= e!65578 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!100699 () Bool)

(declare-fun Unit!3062 () Unit!3060)

(assert (=> b!100699 (= e!65574 Unit!3062)))

(declare-fun lt!50934 () Unit!3060)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!91 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) (_ BitVec 32) Int) Unit!3060)

(assert (=> b!100699 (= lt!50934 (lemmaListMapContainsThenArrayContainsFrom!91 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!100699 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!50931 () Unit!3060)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4269 (_ BitVec 32) (_ BitVec 32)) Unit!3060)

(assert (=> b!100699 (= lt!50931 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1587 0))(
  ( (Nil!1584) (Cons!1583 (h!2179 (_ BitVec 64)) (t!5581 List!1587)) )
))
(declare-fun arrayNoDuplicates!0 (array!4269 (_ BitVec 32) List!1587) Bool)

(assert (=> b!100699 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) from!355 Nil!1584)))

(declare-fun lt!50936 () Unit!3060)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4269 (_ BitVec 32) (_ BitVec 64) List!1587) Unit!3060)

(assert (=> b!100699 (= lt!50936 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584)))))

(assert (=> b!100699 false))

(declare-fun b!100700 () Bool)

(declare-fun e!65586 () Bool)

(assert (=> b!100700 (= e!65586 tp_is_empty!2643)))

(declare-fun b!100701 () Bool)

(declare-fun e!65575 () Bool)

(declare-fun e!65582 () Bool)

(assert (=> b!100701 (= e!65575 e!65582)))

(declare-fun b!100703 () Bool)

(declare-fun res!50497 () Bool)

(assert (=> b!100703 (=> (not res!50497) (not e!65583))))

(assert (=> b!100703 (= res!50497 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun b!100704 () Bool)

(assert (=> b!100704 (= e!65583 e!65579)))

(declare-fun res!50499 () Bool)

(assert (=> b!100704 (=> (not res!50499) (not e!65579))))

(declare-fun lt!50933 () ListLongMap!1543)

(assert (=> b!100704 (= res!50499 (and (= lt!50933 lt!50935) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1263 (LongMapFixedSize!864) ListLongMap!1543)

(assert (=> b!100704 (= lt!50935 (map!1263 newMap!16))))

(declare-fun getCurrentListMap!478 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) Int) ListLongMap!1543)

(assert (=> b!100704 (= lt!50933 (getCurrentListMap!478 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!100705 () Bool)

(declare-fun e!65585 () Bool)

(declare-fun mapRes!3798 () Bool)

(assert (=> b!100705 (= e!65587 (and e!65585 mapRes!3798))))

(declare-fun condMapEmpty!3798 () Bool)

(declare-fun mapDefault!3797 () ValueCell!978)

(assert (=> b!100705 (= condMapEmpty!3798 (= (arr!2028 (_values!2506 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3797)))))

(declare-fun mapIsEmpty!3797 () Bool)

(declare-fun mapRes!3797 () Bool)

(assert (=> mapIsEmpty!3797 mapRes!3797))

(declare-fun b!100706 () Bool)

(declare-fun res!50502 () Bool)

(assert (=> b!100706 (=> (not res!50502) (not e!65578))))

(assert (=> b!100706 (= res!50502 (and (= (size!2280 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6640 (v!2832 (underlying!343 thiss!992))))) (= (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (size!2280 (_values!2506 (v!2832 (underlying!343 thiss!992))))) (bvsge (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun e!65580 () Bool)

(declare-fun e!65577 () Bool)

(assert (=> b!100707 (= e!65580 (and tp!9657 tp_is_empty!2643 (array_inv!1265 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (array_inv!1266 (_values!2506 (v!2832 (underlying!343 thiss!992)))) e!65577))))

(declare-fun mapIsEmpty!3798 () Bool)

(assert (=> mapIsEmpty!3798 mapRes!3798))

(declare-fun b!100708 () Bool)

(assert (=> b!100708 (= e!65577 (and e!65586 mapRes!3797))))

(declare-fun condMapEmpty!3797 () Bool)

(declare-fun mapDefault!3798 () ValueCell!978)

(assert (=> b!100708 (= condMapEmpty!3797 (= (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3798)))))

(declare-fun b!100709 () Bool)

(declare-fun Unit!3063 () Unit!3060)

(assert (=> b!100709 (= e!65574 Unit!3063)))

(declare-fun b!100710 () Bool)

(declare-fun e!65584 () Bool)

(assert (=> b!100710 (= e!65584 tp_is_empty!2643)))

(declare-fun b!100711 () Bool)

(declare-fun res!50501 () Bool)

(assert (=> b!100711 (=> (not res!50501) (not e!65583))))

(assert (=> b!100711 (= res!50501 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6640 newMap!16)) (_size!481 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun mapNonEmpty!3797 () Bool)

(declare-fun tp!9660 () Bool)

(assert (=> mapNonEmpty!3797 (= mapRes!3797 (and tp!9660 e!65581))))

(declare-fun mapRest!3798 () (Array (_ BitVec 32) ValueCell!978))

(declare-fun mapValue!3797 () ValueCell!978)

(declare-fun mapKey!3798 () (_ BitVec 32))

(assert (=> mapNonEmpty!3797 (= (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (store mapRest!3798 mapKey!3798 mapValue!3797))))

(declare-fun b!100712 () Bool)

(assert (=> b!100712 (= e!65582 e!65580)))

(declare-fun mapNonEmpty!3798 () Bool)

(declare-fun tp!9659 () Bool)

(assert (=> mapNonEmpty!3798 (= mapRes!3798 (and tp!9659 e!65584))))

(declare-fun mapRest!3797 () (Array (_ BitVec 32) ValueCell!978))

(declare-fun mapValue!3798 () ValueCell!978)

(declare-fun mapKey!3797 () (_ BitVec 32))

(assert (=> mapNonEmpty!3798 (= (arr!2028 (_values!2506 newMap!16)) (store mapRest!3797 mapKey!3797 mapValue!3798))))

(declare-fun res!50503 () Bool)

(assert (=> start!11948 (=> (not res!50503) (not e!65583))))

(declare-fun valid!392 (LongMap!664) Bool)

(assert (=> start!11948 (= res!50503 (valid!392 thiss!992))))

(assert (=> start!11948 e!65583))

(assert (=> start!11948 e!65575))

(assert (=> start!11948 true))

(assert (=> start!11948 e!65572))

(declare-fun b!100702 () Bool)

(assert (=> b!100702 (= e!65585 tp_is_empty!2643)))

(assert (= (and start!11948 res!50503) b!100703))

(assert (= (and b!100703 res!50497) b!100695))

(assert (= (and b!100695 res!50498) b!100711))

(assert (= (and b!100711 res!50501) b!100704))

(assert (= (and b!100704 res!50499) b!100693))

(assert (= (and b!100693 c!17287) b!100699))

(assert (= (and b!100693 (not c!17287)) b!100709))

(assert (= (and b!100693 res!50504) b!100697))

(assert (= (and b!100697 res!50500) b!100706))

(assert (= (and b!100706 res!50502) b!100698))

(assert (= (and b!100708 condMapEmpty!3797) mapIsEmpty!3797))

(assert (= (and b!100708 (not condMapEmpty!3797)) mapNonEmpty!3797))

(get-info :version)

(assert (= (and mapNonEmpty!3797 ((_ is ValueCellFull!978) mapValue!3797)) b!100694))

(assert (= (and b!100708 ((_ is ValueCellFull!978) mapDefault!3798)) b!100700))

(assert (= b!100707 b!100708))

(assert (= b!100712 b!100707))

(assert (= b!100701 b!100712))

(assert (= start!11948 b!100701))

(assert (= (and b!100705 condMapEmpty!3798) mapIsEmpty!3798))

(assert (= (and b!100705 (not condMapEmpty!3798)) mapNonEmpty!3798))

(assert (= (and mapNonEmpty!3798 ((_ is ValueCellFull!978) mapValue!3798)) b!100710))

(assert (= (and b!100705 ((_ is ValueCellFull!978) mapDefault!3797)) b!100702))

(assert (= b!100696 b!100705))

(assert (= start!11948 b!100696))

(declare-fun b_lambda!4517 () Bool)

(assert (=> (not b_lambda!4517) (not b!100693)))

(declare-fun t!5577 () Bool)

(declare-fun tb!1961 () Bool)

(assert (=> (and b!100707 (= (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) t!5577) tb!1961))

(declare-fun result!3317 () Bool)

(assert (=> tb!1961 (= result!3317 tp_is_empty!2643)))

(assert (=> b!100693 t!5577))

(declare-fun b_and!6207 () Bool)

(assert (= b_and!6203 (and (=> t!5577 result!3317) b_and!6207)))

(declare-fun t!5579 () Bool)

(declare-fun tb!1963 () Bool)

(assert (=> (and b!100696 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) t!5579) tb!1963))

(declare-fun result!3321 () Bool)

(assert (= result!3321 result!3317))

(assert (=> b!100693 t!5579))

(declare-fun b_and!6209 () Bool)

(assert (= b_and!6205 (and (=> t!5579 result!3321) b_and!6209)))

(declare-fun m!111621 () Bool)

(assert (=> mapNonEmpty!3798 m!111621))

(declare-fun m!111623 () Bool)

(assert (=> b!100699 m!111623))

(declare-fun m!111625 () Bool)

(assert (=> b!100699 m!111625))

(declare-fun m!111627 () Bool)

(assert (=> b!100699 m!111627))

(declare-fun m!111629 () Bool)

(assert (=> b!100699 m!111629))

(assert (=> b!100699 m!111627))

(assert (=> b!100699 m!111627))

(declare-fun m!111631 () Bool)

(assert (=> b!100699 m!111631))

(assert (=> b!100699 m!111627))

(declare-fun m!111633 () Bool)

(assert (=> b!100699 m!111633))

(declare-fun m!111635 () Bool)

(assert (=> start!11948 m!111635))

(declare-fun m!111637 () Bool)

(assert (=> b!100707 m!111637))

(declare-fun m!111639 () Bool)

(assert (=> b!100707 m!111639))

(declare-fun m!111641 () Bool)

(assert (=> b!100698 m!111641))

(declare-fun m!111643 () Bool)

(assert (=> b!100695 m!111643))

(declare-fun m!111645 () Bool)

(assert (=> mapNonEmpty!3797 m!111645))

(declare-fun m!111647 () Bool)

(assert (=> b!100696 m!111647))

(declare-fun m!111649 () Bool)

(assert (=> b!100696 m!111649))

(assert (=> b!100704 m!111627))

(declare-fun m!111651 () Bool)

(assert (=> b!100704 m!111651))

(declare-fun m!111653 () Bool)

(assert (=> b!100704 m!111653))

(declare-fun m!111655 () Bool)

(assert (=> b!100697 m!111655))

(declare-fun m!111657 () Bool)

(assert (=> b!100693 m!111657))

(declare-fun m!111659 () Bool)

(assert (=> b!100693 m!111659))

(declare-fun m!111661 () Bool)

(assert (=> b!100693 m!111661))

(assert (=> b!100693 m!111627))

(declare-fun m!111663 () Bool)

(assert (=> b!100693 m!111663))

(assert (=> b!100693 m!111627))

(assert (=> b!100693 m!111659))

(assert (=> b!100693 m!111627))

(assert (=> b!100693 m!111661))

(declare-fun m!111665 () Bool)

(assert (=> b!100693 m!111665))

(assert (=> b!100693 m!111657))

(check-sat (not b_next!2453) (not b_next!2455) (not mapNonEmpty!3797) (not b!100698) b_and!6209 tp_is_empty!2643 (not b!100707) (not start!11948) (not b!100693) (not b!100697) (not mapNonEmpty!3798) b_and!6207 (not b!100704) (not b_lambda!4517) (not b!100695) (not b!100696) (not b!100699))
(check-sat b_and!6207 b_and!6209 (not b_next!2453) (not b_next!2455))
(get-model)

(declare-fun b_lambda!4521 () Bool)

(assert (= b_lambda!4517 (or (and b!100707 b_free!2453) (and b!100696 b_free!2455 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))))) b_lambda!4521)))

(check-sat (not b_next!2453) (not b_next!2455) (not mapNonEmpty!3797) (not b!100698) b_and!6209 tp_is_empty!2643 (not b!100707) (not b!100695) (not start!11948) (not b!100693) (not b!100697) (not mapNonEmpty!3798) (not b_lambda!4521) b_and!6207 (not b!100704) (not b!100696) (not b!100699))
(check-sat b_and!6207 b_and!6209 (not b_next!2453) (not b_next!2455))
(get-model)

(declare-fun d!27353 () Bool)

(declare-fun res!50535 () Bool)

(declare-fun e!65638 () Bool)

(assert (=> d!27353 (=> (not res!50535) (not e!65638))))

(declare-fun simpleValid!70 (LongMapFixedSize!864) Bool)

(assert (=> d!27353 (= res!50535 (simpleValid!70 newMap!16))))

(assert (=> d!27353 (= (valid!391 newMap!16) e!65638)))

(declare-fun b!100783 () Bool)

(declare-fun res!50536 () Bool)

(assert (=> b!100783 (=> (not res!50536) (not e!65638))))

(declare-fun arrayCountValidKeys!0 (array!4269 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!100783 (= res!50536 (= (arrayCountValidKeys!0 (_keys!4221 newMap!16) #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (_size!481 newMap!16)))))

(declare-fun b!100784 () Bool)

(declare-fun res!50537 () Bool)

(assert (=> b!100784 (=> (not res!50537) (not e!65638))))

(assert (=> b!100784 (= res!50537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun b!100785 () Bool)

(assert (=> b!100785 (= e!65638 (arrayNoDuplicates!0 (_keys!4221 newMap!16) #b00000000000000000000000000000000 Nil!1584))))

(assert (= (and d!27353 res!50535) b!100783))

(assert (= (and b!100783 res!50536) b!100784))

(assert (= (and b!100784 res!50537) b!100785))

(declare-fun m!111713 () Bool)

(assert (=> d!27353 m!111713))

(declare-fun m!111715 () Bool)

(assert (=> b!100783 m!111715))

(declare-fun m!111717 () Bool)

(assert (=> b!100784 m!111717))

(declare-fun m!111719 () Bool)

(assert (=> b!100785 m!111719))

(assert (=> b!100695 d!27353))

(declare-fun b!100794 () Bool)

(declare-fun e!65647 () Bool)

(declare-fun e!65646 () Bool)

(assert (=> b!100794 (= e!65647 e!65646)))

(declare-fun lt!50965 () (_ BitVec 64))

(assert (=> b!100794 (= lt!50965 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!50966 () Unit!3060)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4269 (_ BitVec 64) (_ BitVec 32)) Unit!3060)

(assert (=> b!100794 (= lt!50966 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000))))

(assert (=> b!100794 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000)))

(declare-fun lt!50967 () Unit!3060)

(assert (=> b!100794 (= lt!50967 lt!50966)))

(declare-fun res!50542 () Bool)

(declare-datatypes ((SeekEntryResult!255 0))(
  ( (MissingZero!255 (index!3165 (_ BitVec 32))) (Found!255 (index!3166 (_ BitVec 32))) (Intermediate!255 (undefined!1067 Bool) (index!3167 (_ BitVec 32)) (x!13249 (_ BitVec 32))) (Undefined!255) (MissingVacant!255 (index!3168 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4269 (_ BitVec 32)) SeekEntryResult!255)

(assert (=> b!100794 (= res!50542 (= (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))) (Found!255 #b00000000000000000000000000000000)))))

(assert (=> b!100794 (=> (not res!50542) (not e!65646))))

(declare-fun d!27355 () Bool)

(declare-fun res!50543 () Bool)

(declare-fun e!65645 () Bool)

(assert (=> d!27355 (=> res!50543 e!65645)))

(assert (=> d!27355 (= res!50543 (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> d!27355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))) e!65645)))

(declare-fun bm!10363 () Bool)

(declare-fun call!10366 () Bool)

(assert (=> bm!10363 (= call!10366 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!100795 () Bool)

(assert (=> b!100795 (= e!65645 e!65647)))

(declare-fun c!17293 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!100795 (= c!17293 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!100796 () Bool)

(assert (=> b!100796 (= e!65647 call!10366)))

(declare-fun b!100797 () Bool)

(assert (=> b!100797 (= e!65646 call!10366)))

(assert (= (and d!27355 (not res!50543)) b!100795))

(assert (= (and b!100795 c!17293) b!100794))

(assert (= (and b!100795 (not c!17293)) b!100796))

(assert (= (and b!100794 res!50542) b!100797))

(assert (= (or b!100797 b!100796) bm!10363))

(declare-fun m!111721 () Bool)

(assert (=> b!100794 m!111721))

(declare-fun m!111723 () Bool)

(assert (=> b!100794 m!111723))

(declare-fun m!111725 () Bool)

(assert (=> b!100794 m!111725))

(assert (=> b!100794 m!111721))

(declare-fun m!111727 () Bool)

(assert (=> b!100794 m!111727))

(declare-fun m!111729 () Bool)

(assert (=> bm!10363 m!111729))

(assert (=> b!100795 m!111721))

(assert (=> b!100795 m!111721))

(declare-fun m!111731 () Bool)

(assert (=> b!100795 m!111731))

(assert (=> b!100698 d!27355))

(declare-fun d!27357 () Bool)

(declare-fun e!65653 () Bool)

(assert (=> d!27357 e!65653))

(declare-fun res!50546 () Bool)

(assert (=> d!27357 (=> res!50546 e!65653)))

(declare-fun lt!50978 () Bool)

(assert (=> d!27357 (= res!50546 (not lt!50978))))

(declare-fun lt!50977 () Bool)

(assert (=> d!27357 (= lt!50978 lt!50977)))

(declare-fun lt!50976 () Unit!3060)

(declare-fun e!65652 () Unit!3060)

(assert (=> d!27357 (= lt!50976 e!65652)))

(declare-fun c!17296 () Bool)

(assert (=> d!27357 (= c!17296 lt!50977)))

(declare-fun containsKey!156 (List!1586 (_ BitVec 64)) Bool)

(assert (=> d!27357 (= lt!50977 (containsKey!156 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27357 (= (contains!808 lt!50935 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) lt!50978)))

(declare-fun b!100804 () Bool)

(declare-fun lt!50979 () Unit!3060)

(assert (=> b!100804 (= e!65652 lt!50979)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!104 (List!1586 (_ BitVec 64)) Unit!3060)

(assert (=> b!100804 (= lt!50979 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-datatypes ((Option!158 0))(
  ( (Some!157 (v!2836 V!3171)) (None!156) )
))
(declare-fun isDefined!105 (Option!158) Bool)

(declare-fun getValueByKey!152 (List!1586 (_ BitVec 64)) Option!158)

(assert (=> b!100804 (isDefined!105 (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!100805 () Bool)

(declare-fun Unit!3067 () Unit!3060)

(assert (=> b!100805 (= e!65652 Unit!3067)))

(declare-fun b!100806 () Bool)

(assert (=> b!100806 (= e!65653 (isDefined!105 (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(assert (= (and d!27357 c!17296) b!100804))

(assert (= (and d!27357 (not c!17296)) b!100805))

(assert (= (and d!27357 (not res!50546)) b!100806))

(assert (=> d!27357 m!111627))

(declare-fun m!111733 () Bool)

(assert (=> d!27357 m!111733))

(assert (=> b!100804 m!111627))

(declare-fun m!111735 () Bool)

(assert (=> b!100804 m!111735))

(assert (=> b!100804 m!111627))

(declare-fun m!111737 () Bool)

(assert (=> b!100804 m!111737))

(assert (=> b!100804 m!111737))

(declare-fun m!111739 () Bool)

(assert (=> b!100804 m!111739))

(assert (=> b!100806 m!111627))

(assert (=> b!100806 m!111737))

(assert (=> b!100806 m!111737))

(assert (=> b!100806 m!111739))

(assert (=> b!100693 d!27357))

(declare-fun call!10431 () ListLongMap!1543)

(declare-fun bm!10412 () Bool)

(declare-fun c!17328 () Bool)

(declare-fun lt!51059 () (_ BitVec 32))

(declare-fun lt!51047 () array!4271)

(declare-fun c!17327 () Bool)

(assert (=> bm!10412 (= call!10431 (getCurrentListMap!478 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun b!100891 () Bool)

(declare-fun e!65704 () Bool)

(declare-fun lt!51049 () SeekEntryResult!255)

(assert (=> b!100891 (= e!65704 ((_ is Undefined!255) lt!51049))))

(declare-fun b!100892 () Bool)

(declare-fun e!65705 () ListLongMap!1543)

(declare-fun call!10433 () ListLongMap!1543)

(assert (=> b!100892 (= e!65705 call!10433)))

(declare-fun b!100893 () Bool)

(declare-fun lt!51045 () Unit!3060)

(declare-fun lt!51054 () Unit!3060)

(assert (=> b!100893 (= lt!51045 lt!51054)))

(declare-fun call!10424 () ListLongMap!1543)

(declare-fun call!10432 () ListLongMap!1543)

(assert (=> b!100893 (= call!10424 call!10432)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 V!3171 Int) Unit!3060)

(assert (=> b!100893 (= lt!51054 (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51059 (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)))))

(assert (=> b!100893 (= lt!51059 (bvor (extraKeys!2336 newMap!16) #b00000000000000000000000000000010))))

(declare-fun e!65715 () tuple2!2354)

(assert (=> b!100893 (= e!65715 (tuple2!2355 true (LongMapFixedSize!865 (defaultEntry!2523 newMap!16) (mask!6640 newMap!16) (bvor (extraKeys!2336 newMap!16) #b00000000000000000000000000000010) (zeroValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!481 newMap!16) (_keys!4221 newMap!16) (_values!2506 newMap!16) (_vacant!481 newMap!16))))))

(declare-fun b!100894 () Bool)

(declare-fun res!50580 () Bool)

(assert (=> b!100894 (= res!50580 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3168 lt!51049)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!65712 () Bool)

(assert (=> b!100894 (=> (not res!50580) (not e!65712))))

(declare-fun b!100895 () Bool)

(declare-fun e!65709 () tuple2!2354)

(declare-fun e!65713 () tuple2!2354)

(assert (=> b!100895 (= e!65709 e!65713)))

(declare-fun c!17337 () Bool)

(declare-fun lt!51042 () SeekEntryResult!255)

(assert (=> b!100895 (= c!17337 ((_ is MissingZero!255) lt!51042))))

(declare-fun bm!10413 () Bool)

(assert (=> bm!10413 (= call!10432 call!10431)))

(declare-fun b!100896 () Bool)

(declare-fun res!50583 () Bool)

(declare-fun e!65702 () Bool)

(assert (=> b!100896 (=> (not res!50583) (not e!65702))))

(declare-fun call!10415 () Bool)

(assert (=> b!100896 (= res!50583 call!10415)))

(declare-fun e!65710 () Bool)

(assert (=> b!100896 (= e!65710 e!65702)))

(declare-fun b!100897 () Bool)

(assert (=> b!100897 (= e!65704 e!65712)))

(declare-fun res!50575 () Bool)

(assert (=> b!100897 (= res!50575 call!10415)))

(assert (=> b!100897 (=> (not res!50575) (not e!65712))))

(declare-fun b!100898 () Bool)

(declare-fun res!50585 () Bool)

(declare-fun e!65719 () Bool)

(assert (=> b!100898 (=> (not res!50585) (not e!65719))))

(declare-fun lt!51043 () SeekEntryResult!255)

(assert (=> b!100898 (= res!50585 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3165 lt!51043)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10414 () Bool)

(declare-fun call!10430 () Unit!3060)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) Int) Unit!3060)

(assert (=> bm!10414 (= call!10430 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(declare-fun b!100899 () Bool)

(declare-fun lt!51041 () Unit!3060)

(declare-fun lt!51035 () Unit!3060)

(assert (=> b!100899 (= lt!51041 lt!51035)))

(declare-fun call!10423 () Bool)

(assert (=> b!100899 call!10423))

(declare-fun lemmaValidKeyInArrayIsInListMap!104 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) Int) Unit!3060)

(assert (=> b!100899 (= lt!51035 (lemmaValidKeyInArrayIsInListMap!104 (_keys!4221 newMap!16) lt!51047 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (defaultEntry!2523 newMap!16)))))

(assert (=> b!100899 (= lt!51047 (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))))))

(declare-fun lt!51060 () Unit!3060)

(declare-fun lt!51037 () Unit!3060)

(assert (=> b!100899 (= lt!51060 lt!51037)))

(declare-fun call!10417 () ListLongMap!1543)

(assert (=> b!100899 (= call!10417 call!10433)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) (_ BitVec 64) V!3171 Int) Unit!3060)

(assert (=> b!100899 (= lt!51037 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51058 () Unit!3060)

(declare-fun e!65716 () Unit!3060)

(assert (=> b!100899 (= lt!51058 e!65716)))

(declare-fun c!17330 () Bool)

(assert (=> b!100899 (= c!17330 (contains!808 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!100899 (= e!65713 (tuple2!2355 true (LongMapFixedSize!865 (defaultEntry!2523 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (_size!481 newMap!16) (_keys!4221 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))) (_vacant!481 newMap!16))))))

(declare-fun bm!10415 () Bool)

(declare-fun call!10416 () SeekEntryResult!255)

(declare-fun call!10436 () SeekEntryResult!255)

(assert (=> bm!10415 (= call!10416 call!10436)))

(declare-fun bm!10416 () Bool)

(declare-fun call!10429 () ListLongMap!1543)

(declare-fun call!10428 () ListLongMap!1543)

(assert (=> bm!10416 (= call!10429 call!10428)))

(declare-fun b!100900 () Bool)

(declare-fun e!65698 () Bool)

(assert (=> b!100900 (= e!65698 ((_ is Undefined!255) lt!51043))))

(declare-fun e!65703 () ListLongMap!1543)

(declare-fun b!100901 () Bool)

(assert (=> b!100901 (= e!65703 (ite c!17327 call!10432 call!10429))))

(declare-fun b!100902 () Bool)

(declare-fun e!65711 () tuple2!2354)

(declare-fun e!65707 () tuple2!2354)

(assert (=> b!100902 (= e!65711 e!65707)))

(assert (=> b!100902 (= lt!51042 (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun c!17334 () Bool)

(assert (=> b!100902 (= c!17334 ((_ is Undefined!255) lt!51042))))

(declare-fun b!100903 () Bool)

(declare-fun c!17329 () Bool)

(assert (=> b!100903 (= c!17329 ((_ is MissingVacant!255) lt!51043))))

(declare-fun e!65706 () Bool)

(assert (=> b!100903 (= e!65706 e!65698)))

(declare-fun b!100904 () Bool)

(declare-fun e!65714 () Bool)

(declare-fun e!65717 () Bool)

(assert (=> b!100904 (= e!65714 e!65717)))

(declare-fun c!17336 () Bool)

(declare-fun lt!51038 () tuple2!2354)

(assert (=> b!100904 (= c!17336 (_1!1188 lt!51038))))

(declare-fun bm!10417 () Bool)

(declare-fun c!17326 () Bool)

(assert (=> bm!10417 (= c!17326 c!17334)))

(assert (=> bm!10417 (= call!10423 (contains!808 e!65705 (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042)))))))

(declare-fun b!100905 () Bool)

(declare-fun lt!51036 () tuple2!2354)

(assert (=> b!100905 (= e!65709 (tuple2!2355 (_1!1188 lt!51036) (_2!1188 lt!51036)))))

(declare-fun call!10426 () tuple2!2354)

(assert (=> b!100905 (= lt!51036 call!10426)))

(declare-fun lt!51052 () (_ BitVec 32))

(declare-fun bm!10418 () Bool)

(assert (=> bm!10418 (= call!10428 (getCurrentListMap!478 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun b!100906 () Bool)

(declare-fun e!65701 () Bool)

(declare-fun lt!51053 () SeekEntryResult!255)

(assert (=> b!100906 (= e!65701 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51053)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun bm!10419 () Bool)

(declare-fun call!10437 () Bool)

(declare-fun call!10425 () Bool)

(assert (=> bm!10419 (= call!10437 call!10425)))

(declare-fun b!100907 () Bool)

(declare-fun lt!51044 () Unit!3060)

(declare-fun e!65718 () Unit!3060)

(assert (=> b!100907 (= lt!51044 e!65718)))

(declare-fun c!17338 () Bool)

(assert (=> b!100907 (= c!17338 call!10423)))

(assert (=> b!100907 (= e!65707 (tuple2!2355 false newMap!16))))

(declare-fun b!100908 () Bool)

(declare-fun e!65708 () Bool)

(assert (=> b!100908 (= e!65698 e!65708)))

(declare-fun res!50578 () Bool)

(declare-fun call!10421 () Bool)

(assert (=> b!100908 (= res!50578 call!10421)))

(assert (=> b!100908 (=> (not res!50578) (not e!65708))))

(declare-fun b!100909 () Bool)

(declare-fun lt!51050 () Unit!3060)

(declare-fun lt!51055 () Unit!3060)

(assert (=> b!100909 (= lt!51050 lt!51055)))

(assert (=> b!100909 (= call!10424 call!10429)))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!43 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 V!3171 Int) Unit!3060)

(assert (=> b!100909 (= lt!51055 (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51052 (zeroValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2402 newMap!16) (defaultEntry!2523 newMap!16)))))

(assert (=> b!100909 (= lt!51052 (bvor (extraKeys!2336 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!100909 (= e!65715 (tuple2!2355 true (LongMapFixedSize!865 (defaultEntry!2523 newMap!16) (mask!6640 newMap!16) (bvor (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2402 newMap!16) (_size!481 newMap!16) (_keys!4221 newMap!16) (_values!2506 newMap!16) (_vacant!481 newMap!16))))))

(declare-fun c!17331 () Bool)

(declare-fun bm!10420 () Bool)

(declare-fun updateHelperNewKey!43 (LongMapFixedSize!864 (_ BitVec 64) V!3171 (_ BitVec 32)) tuple2!2354)

(assert (=> bm!10420 (= call!10426 (updateHelperNewKey!43 newMap!16 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042))))))

(declare-fun bm!10421 () Bool)

(assert (=> bm!10421 (= call!10424 call!10417)))

(declare-fun b!100910 () Bool)

(declare-fun res!50581 () Bool)

(declare-fun call!10438 () Bool)

(assert (=> b!100910 (= res!50581 call!10438)))

(declare-fun e!65700 () Bool)

(assert (=> b!100910 (=> (not res!50581) (not e!65700))))

(declare-fun b!100911 () Bool)

(assert (=> b!100911 (= e!65703 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun b!100912 () Bool)

(declare-fun res!50579 () Bool)

(declare-fun call!10434 () Bool)

(assert (=> b!100912 (= res!50579 call!10434)))

(assert (=> b!100912 (=> (not res!50579) (not e!65701))))

(declare-fun bm!10422 () Bool)

(declare-fun call!10419 () SeekEntryResult!255)

(assert (=> bm!10422 (= call!10419 call!10436)))

(declare-fun b!100913 () Bool)

(declare-fun call!10435 () ListLongMap!1543)

(declare-fun call!10420 () ListLongMap!1543)

(assert (=> b!100913 (= e!65717 (= call!10435 call!10420))))

(declare-fun bm!10423 () Bool)

(assert (=> bm!10423 (= call!10433 call!10428)))

(declare-fun b!100914 () Bool)

(declare-fun res!50584 () Bool)

(assert (=> b!100914 (=> (not res!50584) (not e!65702))))

(assert (=> b!100914 (= res!50584 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3165 lt!51049)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!10424 () Bool)

(assert (=> bm!10424 (= call!10435 (map!1263 (_2!1188 lt!51038)))))

(declare-fun bm!10425 () Bool)

(declare-fun call!10418 () Bool)

(assert (=> bm!10425 (= call!10438 call!10418)))

(declare-fun b!100915 () Bool)

(declare-fun call!10422 () Bool)

(assert (=> b!100915 (= e!65712 (not call!10422))))

(declare-fun b!100916 () Bool)

(assert (=> b!100916 (= e!65708 (not call!10437))))

(declare-fun b!100917 () Bool)

(declare-fun res!50588 () Bool)

(assert (=> b!100917 (= res!50588 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3168 lt!51043)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100917 (=> (not res!50588) (not e!65708))))

(declare-fun b!100918 () Bool)

(declare-fun e!65699 () Bool)

(assert (=> b!100918 (= e!65717 e!65699)))

(declare-fun res!50587 () Bool)

(assert (=> b!100918 (= res!50587 (contains!808 call!10435 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!100918 (=> (not res!50587) (not e!65699))))

(declare-fun d!27359 () Bool)

(assert (=> d!27359 e!65714))

(declare-fun res!50576 () Bool)

(assert (=> d!27359 (=> (not res!50576) (not e!65714))))

(assert (=> d!27359 (= res!50576 (valid!391 (_2!1188 lt!51038)))))

(assert (=> d!27359 (= lt!51038 e!65711)))

(assert (=> d!27359 (= c!17328 (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvneg (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(assert (=> d!27359 (valid!391 newMap!16)))

(assert (=> d!27359 (= (update!144 newMap!16 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!51038)))

(declare-fun bm!10426 () Bool)

(assert (=> bm!10426 (= call!10420 (map!1263 newMap!16))))

(declare-fun bm!10427 () Bool)

(assert (=> bm!10427 (= call!10434 call!10418)))

(declare-fun b!100919 () Bool)

(declare-fun Unit!3068 () Unit!3060)

(assert (=> b!100919 (= e!65716 Unit!3068)))

(declare-fun lt!51034 () Unit!3060)

(declare-fun call!10427 () Unit!3060)

(assert (=> b!100919 (= lt!51034 call!10427)))

(assert (=> b!100919 (= lt!51043 call!10419)))

(declare-fun c!17325 () Bool)

(assert (=> b!100919 (= c!17325 ((_ is MissingZero!255) lt!51043))))

(assert (=> b!100919 e!65706))

(declare-fun lt!51046 () Unit!3060)

(assert (=> b!100919 (= lt!51046 lt!51034)))

(assert (=> b!100919 false))

(declare-fun b!100920 () Bool)

(declare-fun lt!51051 () tuple2!2354)

(assert (=> b!100920 (= lt!51051 call!10426)))

(assert (=> b!100920 (= e!65713 (tuple2!2355 (_1!1188 lt!51051) (_2!1188 lt!51051)))))

(declare-fun b!100921 () Bool)

(declare-fun lt!51039 () Unit!3060)

(assert (=> b!100921 (= e!65716 lt!51039)))

(assert (=> b!100921 (= lt!51039 call!10430)))

(declare-fun lt!51056 () SeekEntryResult!255)

(assert (=> b!100921 (= lt!51056 call!10419)))

(declare-fun res!50577 () Bool)

(assert (=> b!100921 (= res!50577 ((_ is Found!255) lt!51056))))

(assert (=> b!100921 (=> (not res!50577) (not e!65700))))

(assert (=> b!100921 e!65700))

(declare-fun b!100922 () Bool)

(assert (=> b!100922 (= e!65702 (not call!10422))))

(declare-fun bm!10428 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) Int) Unit!3060)

(assert (=> bm!10428 (= call!10427 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(declare-fun bm!10429 () Bool)

(assert (=> bm!10429 (= call!10422 call!10425)))

(declare-fun b!100923 () Bool)

(declare-fun +!137 (ListLongMap!1543 tuple2!2356) ListLongMap!1543)

(assert (=> b!100923 (= e!65699 (= call!10435 (+!137 call!10420 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!100924 () Bool)

(declare-fun Unit!3069 () Unit!3060)

(assert (=> b!100924 (= e!65718 Unit!3069)))

(declare-fun lt!51048 () Unit!3060)

(assert (=> b!100924 (= lt!51048 call!10430)))

(assert (=> b!100924 (= lt!51053 call!10416)))

(declare-fun res!50582 () Bool)

(assert (=> b!100924 (= res!50582 ((_ is Found!255) lt!51053))))

(assert (=> b!100924 (=> (not res!50582) (not e!65701))))

(assert (=> b!100924 e!65701))

(declare-fun lt!51057 () Unit!3060)

(assert (=> b!100924 (= lt!51057 lt!51048)))

(assert (=> b!100924 false))

(declare-fun bm!10430 () Bool)

(assert (=> bm!10430 (= call!10415 call!10434)))

(declare-fun bm!10431 () Bool)

(assert (=> bm!10431 (= call!10417 (+!137 e!65703 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!17335 () Bool)

(assert (=> bm!10431 (= c!17335 c!17328)))

(declare-fun b!100925 () Bool)

(assert (=> b!100925 (= e!65700 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51056)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!100926 () Bool)

(assert (=> b!100926 (= e!65719 (not call!10437))))

(declare-fun b!100927 () Bool)

(assert (=> b!100927 (= e!65711 e!65715)))

(assert (=> b!100927 (= c!17327 (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100928 () Bool)

(declare-fun c!17333 () Bool)

(assert (=> b!100928 (= c!17333 ((_ is MissingVacant!255) lt!51049))))

(assert (=> b!100928 (= e!65710 e!65704)))

(declare-fun b!100929 () Bool)

(declare-fun res!50586 () Bool)

(assert (=> b!100929 (=> (not res!50586) (not e!65719))))

(assert (=> b!100929 (= res!50586 call!10421)))

(assert (=> b!100929 (= e!65706 e!65719)))

(declare-fun b!100930 () Bool)

(declare-fun lt!51040 () Unit!3060)

(assert (=> b!100930 (= e!65718 lt!51040)))

(assert (=> b!100930 (= lt!51040 call!10427)))

(assert (=> b!100930 (= lt!51049 call!10416)))

(declare-fun c!17332 () Bool)

(assert (=> b!100930 (= c!17332 ((_ is MissingZero!255) lt!51049))))

(assert (=> b!100930 e!65710))

(declare-fun b!100931 () Bool)

(assert (=> b!100931 (= c!17331 ((_ is MissingVacant!255) lt!51042))))

(assert (=> b!100931 (= e!65707 e!65709)))

(declare-fun bm!10432 () Bool)

(assert (=> bm!10432 (= call!10436 (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun bm!10433 () Bool)

(assert (=> bm!10433 (= call!10421 call!10438)))

(declare-fun bm!10434 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!10434 (= call!10418 (inRange!0 (ite c!17334 (ite c!17338 (index!3166 lt!51053) (ite c!17332 (index!3165 lt!51049) (index!3168 lt!51049))) (ite c!17330 (index!3166 lt!51056) (ite c!17325 (index!3165 lt!51043) (index!3168 lt!51043)))) (mask!6640 newMap!16)))))

(declare-fun bm!10435 () Bool)

(assert (=> bm!10435 (= call!10425 (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!100932 () Bool)

(assert (=> b!100932 (= e!65705 call!10431)))

(assert (= (and d!27359 c!17328) b!100927))

(assert (= (and d!27359 (not c!17328)) b!100902))

(assert (= (and b!100927 c!17327) b!100909))

(assert (= (and b!100927 (not c!17327)) b!100893))

(assert (= (or b!100909 b!100893) bm!10416))

(assert (= (or b!100909 b!100893) bm!10413))

(assert (= (or b!100909 b!100893) bm!10421))

(assert (= (and b!100902 c!17334) b!100907))

(assert (= (and b!100902 (not c!17334)) b!100931))

(assert (= (and b!100907 c!17338) b!100924))

(assert (= (and b!100907 (not c!17338)) b!100930))

(assert (= (and b!100924 res!50582) b!100912))

(assert (= (and b!100912 res!50579) b!100906))

(assert (= (and b!100930 c!17332) b!100896))

(assert (= (and b!100930 (not c!17332)) b!100928))

(assert (= (and b!100896 res!50583) b!100914))

(assert (= (and b!100914 res!50584) b!100922))

(assert (= (and b!100928 c!17333) b!100897))

(assert (= (and b!100928 (not c!17333)) b!100891))

(assert (= (and b!100897 res!50575) b!100894))

(assert (= (and b!100894 res!50580) b!100915))

(assert (= (or b!100896 b!100897) bm!10430))

(assert (= (or b!100922 b!100915) bm!10429))

(assert (= (or b!100912 bm!10430) bm!10427))

(assert (= (or b!100924 b!100930) bm!10415))

(assert (= (and b!100931 c!17331) b!100905))

(assert (= (and b!100931 (not c!17331)) b!100895))

(assert (= (and b!100895 c!17337) b!100920))

(assert (= (and b!100895 (not c!17337)) b!100899))

(assert (= (and b!100899 c!17330) b!100921))

(assert (= (and b!100899 (not c!17330)) b!100919))

(assert (= (and b!100921 res!50577) b!100910))

(assert (= (and b!100910 res!50581) b!100925))

(assert (= (and b!100919 c!17325) b!100929))

(assert (= (and b!100919 (not c!17325)) b!100903))

(assert (= (and b!100929 res!50586) b!100898))

(assert (= (and b!100898 res!50585) b!100926))

(assert (= (and b!100903 c!17329) b!100908))

(assert (= (and b!100903 (not c!17329)) b!100900))

(assert (= (and b!100908 res!50578) b!100917))

(assert (= (and b!100917 res!50588) b!100916))

(assert (= (or b!100929 b!100908) bm!10433))

(assert (= (or b!100926 b!100916) bm!10419))

(assert (= (or b!100910 bm!10433) bm!10425))

(assert (= (or b!100921 b!100919) bm!10422))

(assert (= (or b!100905 b!100920) bm!10420))

(assert (= (or b!100924 b!100921) bm!10414))

(assert (= (or b!100907 b!100899) bm!10423))

(assert (= (or bm!10427 bm!10425) bm!10434))

(assert (= (or b!100930 b!100919) bm!10428))

(assert (= (or bm!10415 bm!10422) bm!10432))

(assert (= (or bm!10429 bm!10419) bm!10435))

(assert (= (or b!100907 b!100899) bm!10417))

(assert (= (and bm!10417 c!17326) b!100892))

(assert (= (and bm!10417 (not c!17326)) b!100932))

(assert (= (or bm!10413 b!100932) bm!10412))

(assert (= (or bm!10416 bm!10423) bm!10418))

(assert (= (or bm!10421 b!100899) bm!10431))

(assert (= (and bm!10431 c!17335) b!100901))

(assert (= (and bm!10431 (not c!17335)) b!100911))

(assert (= (and d!27359 res!50576) b!100904))

(assert (= (and b!100904 c!17336) b!100918))

(assert (= (and b!100904 (not c!17336)) b!100913))

(assert (= (and b!100918 res!50587) b!100923))

(assert (= (or b!100923 b!100913) bm!10426))

(assert (= (or b!100918 b!100923 b!100913) bm!10424))

(assert (=> bm!10428 m!111627))

(declare-fun m!111741 () Bool)

(assert (=> bm!10428 m!111741))

(assert (=> bm!10420 m!111627))

(assert (=> bm!10420 m!111661))

(declare-fun m!111743 () Bool)

(assert (=> bm!10420 m!111743))

(assert (=> bm!10432 m!111627))

(declare-fun m!111745 () Bool)

(assert (=> bm!10432 m!111745))

(declare-fun m!111747 () Bool)

(assert (=> bm!10417 m!111747))

(declare-fun m!111749 () Bool)

(assert (=> bm!10417 m!111749))

(declare-fun m!111751 () Bool)

(assert (=> bm!10431 m!111751))

(assert (=> b!100893 m!111661))

(declare-fun m!111753 () Bool)

(assert (=> b!100893 m!111753))

(assert (=> bm!10435 m!111627))

(declare-fun m!111755 () Bool)

(assert (=> bm!10435 m!111755))

(assert (=> bm!10426 m!111651))

(declare-fun m!111757 () Bool)

(assert (=> b!100925 m!111757))

(assert (=> b!100899 m!111627))

(assert (=> b!100899 m!111661))

(declare-fun m!111759 () Bool)

(assert (=> b!100899 m!111759))

(declare-fun m!111761 () Bool)

(assert (=> b!100899 m!111761))

(declare-fun m!111763 () Bool)

(assert (=> b!100899 m!111763))

(declare-fun m!111765 () Bool)

(assert (=> b!100899 m!111765))

(assert (=> b!100899 m!111765))

(assert (=> b!100899 m!111627))

(declare-fun m!111767 () Bool)

(assert (=> b!100899 m!111767))

(declare-fun m!111769 () Bool)

(assert (=> b!100894 m!111769))

(assert (=> bm!10414 m!111627))

(declare-fun m!111771 () Bool)

(assert (=> bm!10414 m!111771))

(declare-fun m!111773 () Bool)

(assert (=> b!100906 m!111773))

(assert (=> b!100918 m!111627))

(declare-fun m!111775 () Bool)

(assert (=> b!100918 m!111775))

(declare-fun m!111777 () Bool)

(assert (=> b!100914 m!111777))

(declare-fun m!111779 () Bool)

(assert (=> bm!10412 m!111779))

(assert (=> b!100902 m!111627))

(assert (=> b!100902 m!111745))

(declare-fun m!111781 () Bool)

(assert (=> bm!10424 m!111781))

(assert (=> b!100909 m!111661))

(declare-fun m!111783 () Bool)

(assert (=> b!100909 m!111783))

(declare-fun m!111785 () Bool)

(assert (=> d!27359 m!111785))

(assert (=> d!27359 m!111643))

(declare-fun m!111787 () Bool)

(assert (=> b!100923 m!111787))

(declare-fun m!111789 () Bool)

(assert (=> b!100898 m!111789))

(assert (=> b!100911 m!111765))

(assert (=> bm!10418 m!111761))

(declare-fun m!111791 () Bool)

(assert (=> bm!10418 m!111791))

(declare-fun m!111793 () Bool)

(assert (=> b!100917 m!111793))

(declare-fun m!111795 () Bool)

(assert (=> bm!10434 m!111795))

(assert (=> b!100693 d!27359))

(declare-fun d!27361 () Bool)

(declare-fun c!17341 () Bool)

(assert (=> d!27361 (= c!17341 ((_ is ValueCellFull!978) (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun e!65722 () V!3171)

(assert (=> d!27361 (= (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65722)))

(declare-fun b!100937 () Bool)

(declare-fun get!1296 (ValueCell!978 V!3171) V!3171)

(assert (=> b!100937 (= e!65722 (get!1296 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100938 () Bool)

(declare-fun get!1297 (ValueCell!978 V!3171) V!3171)

(assert (=> b!100938 (= e!65722 (get!1297 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27361 c!17341) b!100937))

(assert (= (and d!27361 (not c!17341)) b!100938))

(assert (=> b!100937 m!111657))

(assert (=> b!100937 m!111659))

(declare-fun m!111797 () Bool)

(assert (=> b!100937 m!111797))

(assert (=> b!100938 m!111657))

(assert (=> b!100938 m!111659))

(declare-fun m!111799 () Bool)

(assert (=> b!100938 m!111799))

(assert (=> b!100693 d!27361))

(declare-fun d!27363 () Bool)

(assert (=> d!27363 (= (map!1263 newMap!16) (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun bs!4181 () Bool)

(assert (= bs!4181 d!27363))

(assert (=> bs!4181 m!111765))

(assert (=> b!100704 d!27363))

(declare-fun bm!10450 () Bool)

(declare-fun call!10455 () ListLongMap!1543)

(declare-fun getCurrentListMapNoExtraKeys!102 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) Int) ListLongMap!1543)

(assert (=> bm!10450 (= call!10455 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun bm!10451 () Bool)

(declare-fun call!10459 () ListLongMap!1543)

(declare-fun call!10457 () ListLongMap!1543)

(assert (=> bm!10451 (= call!10459 call!10457)))

(declare-fun bm!10452 () Bool)

(declare-fun call!10456 () ListLongMap!1543)

(assert (=> bm!10452 (= call!10456 call!10455)))

(declare-fun c!17354 () Bool)

(declare-fun bm!10453 () Bool)

(declare-fun call!10458 () ListLongMap!1543)

(declare-fun c!17357 () Bool)

(assert (=> bm!10453 (= call!10457 (+!137 (ite c!17357 call!10455 (ite c!17354 call!10456 call!10458)) (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun b!100982 () Bool)

(declare-fun res!50608 () Bool)

(declare-fun e!65756 () Bool)

(assert (=> b!100982 (=> (not res!50608) (not e!65756))))

(declare-fun e!65751 () Bool)

(assert (=> b!100982 (= res!50608 e!65751)))

(declare-fun c!17359 () Bool)

(assert (=> b!100982 (= c!17359 (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!100983 () Bool)

(declare-fun e!65761 () Bool)

(assert (=> b!100983 (= e!65761 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!51119 () ListLongMap!1543)

(declare-fun b!100984 () Bool)

(declare-fun e!65752 () Bool)

(declare-fun apply!94 (ListLongMap!1543 (_ BitVec 64)) V!3171)

(assert (=> b!100984 (= e!65752 (= (apply!94 lt!51119 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100984 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2280 (_values!2506 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> b!100984 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!100985 () Bool)

(declare-fun e!65753 () Bool)

(assert (=> b!100985 (= e!65753 e!65752)))

(declare-fun res!50609 () Bool)

(assert (=> b!100985 (=> (not res!50609) (not e!65752))))

(assert (=> b!100985 (= res!50609 (contains!808 lt!51119 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!100985 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!100986 () Bool)

(declare-fun e!65750 () Unit!3060)

(declare-fun lt!51117 () Unit!3060)

(assert (=> b!100986 (= e!65750 lt!51117)))

(declare-fun lt!51114 () ListLongMap!1543)

(assert (=> b!100986 (= lt!51114 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun lt!51105 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51108 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51108 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51126 () Unit!3060)

(declare-fun addStillContains!70 (ListLongMap!1543 (_ BitVec 64) V!3171 (_ BitVec 64)) Unit!3060)

(assert (=> b!100986 (= lt!51126 (addStillContains!70 lt!51114 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51108))))

(assert (=> b!100986 (contains!808 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51108)))

(declare-fun lt!51118 () Unit!3060)

(assert (=> b!100986 (= lt!51118 lt!51126)))

(declare-fun lt!51116 () ListLongMap!1543)

(assert (=> b!100986 (= lt!51116 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun lt!51111 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51111 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51124 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51124 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51121 () Unit!3060)

(declare-fun addApplyDifferent!70 (ListLongMap!1543 (_ BitVec 64) V!3171 (_ BitVec 64)) Unit!3060)

(assert (=> b!100986 (= lt!51121 (addApplyDifferent!70 lt!51116 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51124))))

(assert (=> b!100986 (= (apply!94 (+!137 lt!51116 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51124) (apply!94 lt!51116 lt!51124))))

(declare-fun lt!51115 () Unit!3060)

(assert (=> b!100986 (= lt!51115 lt!51121)))

(declare-fun lt!51106 () ListLongMap!1543)

(assert (=> b!100986 (= lt!51106 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun lt!51122 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51109 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51109 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51107 () Unit!3060)

(assert (=> b!100986 (= lt!51107 (addApplyDifferent!70 lt!51106 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51109))))

(assert (=> b!100986 (= (apply!94 (+!137 lt!51106 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51109) (apply!94 lt!51106 lt!51109))))

(declare-fun lt!51113 () Unit!3060)

(assert (=> b!100986 (= lt!51113 lt!51107)))

(declare-fun lt!51125 () ListLongMap!1543)

(assert (=> b!100986 (= lt!51125 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun lt!51120 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51112 () (_ BitVec 64))

(assert (=> b!100986 (= lt!51112 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!100986 (= lt!51117 (addApplyDifferent!70 lt!51125 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51112))))

(assert (=> b!100986 (= (apply!94 (+!137 lt!51125 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51112) (apply!94 lt!51125 lt!51112))))

(declare-fun b!100987 () Bool)

(declare-fun e!65757 () Bool)

(assert (=> b!100987 (= e!65757 (= (apply!94 lt!51119 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!100981 () Bool)

(declare-fun e!65760 () Bool)

(assert (=> b!100981 (= e!65756 e!65760)))

(declare-fun c!17356 () Bool)

(assert (=> b!100981 (= c!17356 (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!27365 () Bool)

(assert (=> d!27365 e!65756))

(declare-fun res!50612 () Bool)

(assert (=> d!27365 (=> (not res!50612) (not e!65756))))

(assert (=> d!27365 (= res!50612 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun lt!51110 () ListLongMap!1543)

(assert (=> d!27365 (= lt!51119 lt!51110)))

(declare-fun lt!51123 () Unit!3060)

(assert (=> d!27365 (= lt!51123 e!65750)))

(declare-fun c!17358 () Bool)

(assert (=> d!27365 (= c!17358 e!65761)))

(declare-fun res!50607 () Bool)

(assert (=> d!27365 (=> (not res!50607) (not e!65761))))

(assert (=> d!27365 (= res!50607 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun e!65754 () ListLongMap!1543)

(assert (=> d!27365 (= lt!51110 e!65754)))

(assert (=> d!27365 (= c!17357 (and (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27365 (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992))))))

(assert (=> d!27365 (= (getCurrentListMap!478 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) lt!51119)))

(declare-fun b!100988 () Bool)

(declare-fun e!65749 () ListLongMap!1543)

(assert (=> b!100988 (= e!65754 e!65749)))

(assert (=> b!100988 (= c!17354 (and (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!100989 () Bool)

(declare-fun res!50611 () Bool)

(assert (=> b!100989 (=> (not res!50611) (not e!65756))))

(assert (=> b!100989 (= res!50611 e!65753)))

(declare-fun res!50610 () Bool)

(assert (=> b!100989 (=> res!50610 e!65753)))

(declare-fun e!65759 () Bool)

(assert (=> b!100989 (= res!50610 (not e!65759))))

(declare-fun res!50614 () Bool)

(assert (=> b!100989 (=> (not res!50614) (not e!65759))))

(assert (=> b!100989 (= res!50614 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun bm!10454 () Bool)

(declare-fun call!10453 () Bool)

(assert (=> bm!10454 (= call!10453 (contains!808 lt!51119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100990 () Bool)

(assert (=> b!100990 (= e!65751 e!65757)))

(declare-fun res!50613 () Bool)

(assert (=> b!100990 (= res!50613 call!10453)))

(assert (=> b!100990 (=> (not res!50613) (not e!65757))))

(declare-fun bm!10455 () Bool)

(assert (=> bm!10455 (= call!10458 call!10456)))

(declare-fun b!100991 () Bool)

(declare-fun e!65755 () Bool)

(assert (=> b!100991 (= e!65755 (= (apply!94 lt!51119 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!100992 () Bool)

(declare-fun Unit!3070 () Unit!3060)

(assert (=> b!100992 (= e!65750 Unit!3070)))

(declare-fun b!100993 () Bool)

(assert (=> b!100993 (= e!65759 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!100994 () Bool)

(assert (=> b!100994 (= e!65749 call!10459)))

(declare-fun b!100995 () Bool)

(declare-fun c!17355 () Bool)

(assert (=> b!100995 (= c!17355 (and (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65758 () ListLongMap!1543)

(assert (=> b!100995 (= e!65749 e!65758)))

(declare-fun b!100996 () Bool)

(assert (=> b!100996 (= e!65758 call!10458)))

(declare-fun b!100997 () Bool)

(declare-fun call!10454 () Bool)

(assert (=> b!100997 (= e!65760 (not call!10454))))

(declare-fun b!100998 () Bool)

(assert (=> b!100998 (= e!65758 call!10459)))

(declare-fun bm!10456 () Bool)

(assert (=> bm!10456 (= call!10454 (contains!808 lt!51119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!100999 () Bool)

(assert (=> b!100999 (= e!65754 (+!137 call!10457 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!101000 () Bool)

(assert (=> b!101000 (= e!65751 (not call!10453))))

(declare-fun b!101001 () Bool)

(assert (=> b!101001 (= e!65760 e!65755)))

(declare-fun res!50615 () Bool)

(assert (=> b!101001 (= res!50615 call!10454)))

(assert (=> b!101001 (=> (not res!50615) (not e!65755))))

(assert (= (and d!27365 c!17357) b!100999))

(assert (= (and d!27365 (not c!17357)) b!100988))

(assert (= (and b!100988 c!17354) b!100994))

(assert (= (and b!100988 (not c!17354)) b!100995))

(assert (= (and b!100995 c!17355) b!100998))

(assert (= (and b!100995 (not c!17355)) b!100996))

(assert (= (or b!100998 b!100996) bm!10455))

(assert (= (or b!100994 bm!10455) bm!10452))

(assert (= (or b!100994 b!100998) bm!10451))

(assert (= (or b!100999 bm!10452) bm!10450))

(assert (= (or b!100999 bm!10451) bm!10453))

(assert (= (and d!27365 res!50607) b!100983))

(assert (= (and d!27365 c!17358) b!100986))

(assert (= (and d!27365 (not c!17358)) b!100992))

(assert (= (and d!27365 res!50612) b!100989))

(assert (= (and b!100989 res!50614) b!100993))

(assert (= (and b!100989 (not res!50610)) b!100985))

(assert (= (and b!100985 res!50609) b!100984))

(assert (= (and b!100989 res!50611) b!100982))

(assert (= (and b!100982 c!17359) b!100990))

(assert (= (and b!100982 (not c!17359)) b!101000))

(assert (= (and b!100990 res!50613) b!100987))

(assert (= (or b!100990 b!101000) bm!10454))

(assert (= (and b!100982 res!50608) b!100981))

(assert (= (and b!100981 c!17356) b!101001))

(assert (= (and b!100981 (not c!17356)) b!100997))

(assert (= (and b!101001 res!50615) b!100991))

(assert (= (or b!101001 b!100997) bm!10456))

(declare-fun b_lambda!4523 () Bool)

(assert (=> (not b_lambda!4523) (not b!100984)))

(assert (=> b!100984 t!5577))

(declare-fun b_and!6219 () Bool)

(assert (= b_and!6207 (and (=> t!5577 result!3317) b_and!6219)))

(assert (=> b!100984 t!5579))

(declare-fun b_and!6221 () Bool)

(assert (= b_and!6209 (and (=> t!5579 result!3321) b_and!6221)))

(declare-fun m!111801 () Bool)

(assert (=> bm!10453 m!111801))

(declare-fun m!111803 () Bool)

(assert (=> b!100986 m!111803))

(declare-fun m!111805 () Bool)

(assert (=> b!100986 m!111805))

(declare-fun m!111807 () Bool)

(assert (=> b!100986 m!111807))

(declare-fun m!111809 () Bool)

(assert (=> b!100986 m!111809))

(declare-fun m!111811 () Bool)

(assert (=> b!100986 m!111811))

(declare-fun m!111813 () Bool)

(assert (=> b!100986 m!111813))

(declare-fun m!111815 () Bool)

(assert (=> b!100986 m!111815))

(assert (=> b!100986 m!111813))

(declare-fun m!111817 () Bool)

(assert (=> b!100986 m!111817))

(declare-fun m!111819 () Bool)

(assert (=> b!100986 m!111819))

(declare-fun m!111821 () Bool)

(assert (=> b!100986 m!111821))

(declare-fun m!111823 () Bool)

(assert (=> b!100986 m!111823))

(declare-fun m!111825 () Bool)

(assert (=> b!100986 m!111825))

(declare-fun m!111827 () Bool)

(assert (=> b!100986 m!111827))

(assert (=> b!100986 m!111821))

(declare-fun m!111829 () Bool)

(assert (=> b!100986 m!111829))

(assert (=> b!100986 m!111823))

(declare-fun m!111831 () Bool)

(assert (=> b!100986 m!111831))

(declare-fun m!111833 () Bool)

(assert (=> b!100986 m!111833))

(declare-fun m!111835 () Bool)

(assert (=> b!100986 m!111835))

(assert (=> b!100986 m!111831))

(assert (=> b!100984 m!111819))

(declare-fun m!111837 () Bool)

(assert (=> b!100984 m!111837))

(declare-fun m!111839 () Bool)

(assert (=> b!100984 m!111839))

(assert (=> b!100984 m!111659))

(declare-fun m!111841 () Bool)

(assert (=> b!100984 m!111841))

(assert (=> b!100984 m!111659))

(assert (=> b!100984 m!111839))

(assert (=> b!100984 m!111819))

(assert (=> b!100993 m!111819))

(assert (=> b!100993 m!111819))

(declare-fun m!111843 () Bool)

(assert (=> b!100993 m!111843))

(assert (=> b!100985 m!111819))

(assert (=> b!100985 m!111819))

(declare-fun m!111845 () Bool)

(assert (=> b!100985 m!111845))

(declare-fun m!111847 () Bool)

(assert (=> bm!10456 m!111847))

(assert (=> bm!10450 m!111807))

(assert (=> d!27365 m!111655))

(declare-fun m!111849 () Bool)

(assert (=> b!100991 m!111849))

(declare-fun m!111851 () Bool)

(assert (=> bm!10454 m!111851))

(declare-fun m!111853 () Bool)

(assert (=> b!100987 m!111853))

(assert (=> b!100983 m!111819))

(assert (=> b!100983 m!111819))

(assert (=> b!100983 m!111843))

(declare-fun m!111855 () Bool)

(assert (=> b!100999 m!111855))

(assert (=> b!100704 d!27365))

(declare-fun d!27367 () Bool)

(assert (=> d!27367 (not (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!51129 () Unit!3060)

(declare-fun choose!68 (array!4269 (_ BitVec 32) (_ BitVec 64) List!1587) Unit!3060)

(assert (=> d!27367 (= lt!51129 (choose!68 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584)))))

(assert (=> d!27367 (bvslt (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27367 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584)) lt!51129)))

(declare-fun bs!4182 () Bool)

(assert (= bs!4182 d!27367))

(assert (=> bs!4182 m!111627))

(assert (=> bs!4182 m!111631))

(assert (=> bs!4182 m!111627))

(declare-fun m!111857 () Bool)

(assert (=> bs!4182 m!111857))

(assert (=> b!100699 d!27367))

(declare-fun d!27369 () Bool)

(assert (=> d!27369 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) from!355 Nil!1584)))

(declare-fun lt!51132 () Unit!3060)

(declare-fun choose!39 (array!4269 (_ BitVec 32) (_ BitVec 32)) Unit!3060)

(assert (=> d!27369 (= lt!51132 (choose!39 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!27369 (bvslt (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!27369 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 from!355) lt!51132)))

(declare-fun bs!4183 () Bool)

(assert (= bs!4183 d!27369))

(assert (=> bs!4183 m!111625))

(declare-fun m!111859 () Bool)

(assert (=> bs!4183 m!111859))

(assert (=> b!100699 d!27369))

(declare-fun d!27371 () Bool)

(declare-fun res!50620 () Bool)

(declare-fun e!65766 () Bool)

(assert (=> d!27371 (=> res!50620 e!65766)))

(assert (=> d!27371 (= res!50620 (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27371 (= (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!65766)))

(declare-fun b!101006 () Bool)

(declare-fun e!65767 () Bool)

(assert (=> b!101006 (= e!65766 e!65767)))

(declare-fun res!50621 () Bool)

(assert (=> b!101006 (=> (not res!50621) (not e!65767))))

(assert (=> b!101006 (= res!50621 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!101007 () Bool)

(assert (=> b!101007 (= e!65767 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!27371 (not res!50620)) b!101006))

(assert (= (and b!101006 res!50621) b!101007))

(assert (=> d!27371 m!111819))

(assert (=> b!101007 m!111627))

(declare-fun m!111861 () Bool)

(assert (=> b!101007 m!111861))

(assert (=> b!100699 d!27371))

(declare-fun d!27373 () Bool)

(declare-fun e!65770 () Bool)

(assert (=> d!27373 e!65770))

(declare-fun c!17362 () Bool)

(assert (=> d!27373 (= c!17362 (and (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!51135 () Unit!3060)

(declare-fun choose!615 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) (_ BitVec 32) Int) Unit!3060)

(assert (=> d!27373 (= lt!51135 (choose!615 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(assert (=> d!27373 (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992))))))

(assert (=> d!27373 (= (lemmaListMapContainsThenArrayContainsFrom!91 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) lt!51135)))

(declare-fun b!101012 () Bool)

(assert (=> b!101012 (= e!65770 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101013 () Bool)

(assert (=> b!101013 (= e!65770 (ite (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27373 c!17362) b!101012))

(assert (= (and d!27373 (not c!17362)) b!101013))

(assert (=> d!27373 m!111627))

(declare-fun m!111863 () Bool)

(assert (=> d!27373 m!111863))

(assert (=> d!27373 m!111655))

(assert (=> b!101012 m!111627))

(assert (=> b!101012 m!111631))

(assert (=> b!100699 d!27373))

(declare-fun bm!10459 () Bool)

(declare-fun c!17365 () Bool)

(declare-fun call!10462 () Bool)

(assert (=> bm!10459 (= call!10462 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17365 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584) Nil!1584)))))

(declare-fun b!101024 () Bool)

(declare-fun e!65780 () Bool)

(declare-fun e!65782 () Bool)

(assert (=> b!101024 (= e!65780 e!65782)))

(declare-fun res!50629 () Bool)

(assert (=> b!101024 (=> (not res!50629) (not e!65782))))

(declare-fun e!65781 () Bool)

(assert (=> b!101024 (= res!50629 (not e!65781))))

(declare-fun res!50628 () Bool)

(assert (=> b!101024 (=> (not res!50628) (not e!65781))))

(assert (=> b!101024 (= res!50628 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101025 () Bool)

(declare-fun e!65779 () Bool)

(assert (=> b!101025 (= e!65782 e!65779)))

(assert (=> b!101025 (= c!17365 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101026 () Bool)

(assert (=> b!101026 (= e!65779 call!10462)))

(declare-fun b!101027 () Bool)

(declare-fun contains!810 (List!1587 (_ BitVec 64)) Bool)

(assert (=> b!101027 (= e!65781 (contains!810 Nil!1584 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun d!27375 () Bool)

(declare-fun res!50630 () Bool)

(assert (=> d!27375 (=> res!50630 e!65780)))

(assert (=> d!27375 (= res!50630 (bvsge from!355 (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> d!27375 (= (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) from!355 Nil!1584) e!65780)))

(declare-fun b!101028 () Bool)

(assert (=> b!101028 (= e!65779 call!10462)))

(assert (= (and d!27375 (not res!50630)) b!101024))

(assert (= (and b!101024 res!50628) b!101027))

(assert (= (and b!101024 res!50629) b!101025))

(assert (= (and b!101025 c!17365) b!101026))

(assert (= (and b!101025 (not c!17365)) b!101028))

(assert (= (or b!101026 b!101028) bm!10459))

(assert (=> bm!10459 m!111627))

(declare-fun m!111865 () Bool)

(assert (=> bm!10459 m!111865))

(assert (=> b!101024 m!111627))

(assert (=> b!101024 m!111627))

(declare-fun m!111867 () Bool)

(assert (=> b!101024 m!111867))

(assert (=> b!101025 m!111627))

(assert (=> b!101025 m!111627))

(assert (=> b!101025 m!111867))

(assert (=> b!101027 m!111627))

(assert (=> b!101027 m!111627))

(declare-fun m!111869 () Bool)

(assert (=> b!101027 m!111869))

(assert (=> b!100699 d!27375))

(declare-fun d!27377 () Bool)

(assert (=> d!27377 (= (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992)))) (and (or (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000001111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000011111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000001111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000011111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000001111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000011111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000001111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000011111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000000111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000001111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000011111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000000111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000001111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000011111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000000111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000001111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000011111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000000111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000001111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000011111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00000111111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00001111111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00011111111111111111111111111111) (= (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6640 (v!2832 (underlying!343 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!100697 d!27377))

(declare-fun d!27379 () Bool)

(assert (=> d!27379 (= (array_inv!1265 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvsge (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100707 d!27379))

(declare-fun d!27381 () Bool)

(assert (=> d!27381 (= (array_inv!1266 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvsge (size!2280 (_values!2506 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!100707 d!27381))

(declare-fun d!27383 () Bool)

(assert (=> d!27383 (= (valid!392 thiss!992) (valid!391 (v!2832 (underlying!343 thiss!992))))))

(declare-fun bs!4184 () Bool)

(assert (= bs!4184 d!27383))

(declare-fun m!111871 () Bool)

(assert (=> bs!4184 m!111871))

(assert (=> start!11948 d!27383))

(declare-fun d!27385 () Bool)

(assert (=> d!27385 (= (array_inv!1265 (_keys!4221 newMap!16)) (bvsge (size!2279 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100696 d!27385))

(declare-fun d!27387 () Bool)

(assert (=> d!27387 (= (array_inv!1266 (_values!2506 newMap!16)) (bvsge (size!2280 (_values!2506 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!100696 d!27387))

(declare-fun mapIsEmpty!3807 () Bool)

(declare-fun mapRes!3807 () Bool)

(assert (=> mapIsEmpty!3807 mapRes!3807))

(declare-fun mapNonEmpty!3807 () Bool)

(declare-fun tp!9675 () Bool)

(declare-fun e!65787 () Bool)

(assert (=> mapNonEmpty!3807 (= mapRes!3807 (and tp!9675 e!65787))))

(declare-fun mapKey!3807 () (_ BitVec 32))

(declare-fun mapRest!3807 () (Array (_ BitVec 32) ValueCell!978))

(declare-fun mapValue!3807 () ValueCell!978)

(assert (=> mapNonEmpty!3807 (= mapRest!3797 (store mapRest!3807 mapKey!3807 mapValue!3807))))

(declare-fun b!101035 () Bool)

(assert (=> b!101035 (= e!65787 tp_is_empty!2643)))

(declare-fun b!101036 () Bool)

(declare-fun e!65788 () Bool)

(assert (=> b!101036 (= e!65788 tp_is_empty!2643)))

(declare-fun condMapEmpty!3807 () Bool)

(declare-fun mapDefault!3807 () ValueCell!978)

(assert (=> mapNonEmpty!3798 (= condMapEmpty!3807 (= mapRest!3797 ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3807)))))

(assert (=> mapNonEmpty!3798 (= tp!9659 (and e!65788 mapRes!3807))))

(assert (= (and mapNonEmpty!3798 condMapEmpty!3807) mapIsEmpty!3807))

(assert (= (and mapNonEmpty!3798 (not condMapEmpty!3807)) mapNonEmpty!3807))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!978) mapValue!3807)) b!101035))

(assert (= (and mapNonEmpty!3798 ((_ is ValueCellFull!978) mapDefault!3807)) b!101036))

(declare-fun m!111873 () Bool)

(assert (=> mapNonEmpty!3807 m!111873))

(declare-fun mapIsEmpty!3808 () Bool)

(declare-fun mapRes!3808 () Bool)

(assert (=> mapIsEmpty!3808 mapRes!3808))

(declare-fun mapNonEmpty!3808 () Bool)

(declare-fun tp!9676 () Bool)

(declare-fun e!65789 () Bool)

(assert (=> mapNonEmpty!3808 (= mapRes!3808 (and tp!9676 e!65789))))

(declare-fun mapValue!3808 () ValueCell!978)

(declare-fun mapRest!3808 () (Array (_ BitVec 32) ValueCell!978))

(declare-fun mapKey!3808 () (_ BitVec 32))

(assert (=> mapNonEmpty!3808 (= mapRest!3798 (store mapRest!3808 mapKey!3808 mapValue!3808))))

(declare-fun b!101037 () Bool)

(assert (=> b!101037 (= e!65789 tp_is_empty!2643)))

(declare-fun b!101038 () Bool)

(declare-fun e!65790 () Bool)

(assert (=> b!101038 (= e!65790 tp_is_empty!2643)))

(declare-fun condMapEmpty!3808 () Bool)

(declare-fun mapDefault!3808 () ValueCell!978)

(assert (=> mapNonEmpty!3797 (= condMapEmpty!3808 (= mapRest!3798 ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3808)))))

(assert (=> mapNonEmpty!3797 (= tp!9660 (and e!65790 mapRes!3808))))

(assert (= (and mapNonEmpty!3797 condMapEmpty!3808) mapIsEmpty!3808))

(assert (= (and mapNonEmpty!3797 (not condMapEmpty!3808)) mapNonEmpty!3808))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!978) mapValue!3808)) b!101037))

(assert (= (and mapNonEmpty!3797 ((_ is ValueCellFull!978) mapDefault!3808)) b!101038))

(declare-fun m!111875 () Bool)

(assert (=> mapNonEmpty!3808 m!111875))

(declare-fun b_lambda!4525 () Bool)

(assert (= b_lambda!4523 (or (and b!100707 b_free!2453) (and b!100696 b_free!2455 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))))) b_lambda!4525)))

(check-sat (not b!100937) (not b!100804) (not bm!10418) (not b!100783) (not b!100784) (not b!100795) (not b!100923) (not bm!10412) (not b_next!2453) (not d!27367) (not d!27353) (not b!100902) (not b_next!2455) (not b!101027) (not b_lambda!4525) (not bm!10420) (not d!27365) (not b!100899) (not d!27363) (not bm!10424) (not b!100785) (not d!27369) (not bm!10434) b_and!6219 (not bm!10453) (not b!100985) (not b!100984) (not mapNonEmpty!3808) (not b!100911) (not b!100993) b_and!6221 (not b!100893) (not b!100909) (not b!101025) (not b!100806) (not mapNonEmpty!3807) (not b!100918) (not bm!10417) (not b!100987) (not bm!10431) (not bm!10450) (not b_lambda!4521) (not b!100983) (not bm!10454) (not b!100999) (not bm!10432) (not d!27357) (not bm!10363) (not bm!10428) (not b!100986) (not bm!10456) (not bm!10459) (not d!27359) (not b!100794) tp_is_empty!2643 (not bm!10426) (not b!101012) (not b!100938) (not b!100991) (not b!101024) (not bm!10435) (not d!27373) (not d!27383) (not b!101007) (not bm!10414))
(check-sat b_and!6219 b_and!6221 (not b_next!2453) (not b_next!2455))
(get-model)

(declare-fun d!27389 () Bool)

(declare-fun e!65793 () Bool)

(assert (=> d!27389 e!65793))

(declare-fun c!17368 () Bool)

(assert (=> d!27389 (= c!17368 (and (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!27389 true))

(declare-fun _$29!132 () Unit!3060)

(assert (=> d!27389 (= (choose!615 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) _$29!132)))

(declare-fun b!101043 () Bool)

(assert (=> b!101043 (= e!65793 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!101044 () Bool)

(assert (=> b!101044 (= e!65793 (ite (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!27389 c!17368) b!101043))

(assert (= (and d!27389 (not c!17368)) b!101044))

(assert (=> b!101043 m!111627))

(assert (=> b!101043 m!111631))

(assert (=> d!27373 d!27389))

(assert (=> d!27373 d!27377))

(declare-fun d!27391 () Bool)

(declare-fun res!50631 () Bool)

(declare-fun e!65794 () Bool)

(assert (=> d!27391 (=> res!50631 e!65794)))

(assert (=> d!27391 (= res!50631 (= (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27391 (= (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000) e!65794)))

(declare-fun b!101045 () Bool)

(declare-fun e!65795 () Bool)

(assert (=> b!101045 (= e!65794 e!65795)))

(declare-fun res!50632 () Bool)

(assert (=> b!101045 (=> (not res!50632) (not e!65795))))

(assert (=> b!101045 (= res!50632 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101046 () Bool)

(assert (=> b!101046 (= e!65795 (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27391 (not res!50631)) b!101045))

(assert (= (and b!101045 res!50632) b!101046))

(declare-fun m!111877 () Bool)

(assert (=> d!27391 m!111877))

(assert (=> b!101046 m!111627))

(declare-fun m!111879 () Bool)

(assert (=> b!101046 m!111879))

(assert (=> bm!10435 d!27391))

(declare-fun d!27393 () Bool)

(declare-fun res!50633 () Bool)

(declare-fun e!65796 () Bool)

(assert (=> d!27393 (=> (not res!50633) (not e!65796))))

(assert (=> d!27393 (= res!50633 (simpleValid!70 (v!2832 (underlying!343 thiss!992))))))

(assert (=> d!27393 (= (valid!391 (v!2832 (underlying!343 thiss!992))) e!65796)))

(declare-fun b!101047 () Bool)

(declare-fun res!50634 () Bool)

(assert (=> b!101047 (=> (not res!50634) (not e!65796))))

(assert (=> b!101047 (= res!50634 (= (arrayCountValidKeys!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))) (_size!481 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!101048 () Bool)

(declare-fun res!50635 () Bool)

(assert (=> b!101048 (=> (not res!50635) (not e!65796))))

(assert (=> b!101048 (= res!50635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!101049 () Bool)

(assert (=> b!101049 (= e!65796 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 Nil!1584))))

(assert (= (and d!27393 res!50633) b!101047))

(assert (= (and b!101047 res!50634) b!101048))

(assert (= (and b!101048 res!50635) b!101049))

(declare-fun m!111881 () Bool)

(assert (=> d!27393 m!111881))

(declare-fun m!111883 () Bool)

(assert (=> b!101047 m!111883))

(assert (=> b!101048 m!111641))

(declare-fun m!111885 () Bool)

(assert (=> b!101049 m!111885))

(assert (=> d!27383 d!27393))

(declare-fun d!27395 () Bool)

(declare-fun e!65798 () Bool)

(assert (=> d!27395 e!65798))

(declare-fun res!50636 () Bool)

(assert (=> d!27395 (=> res!50636 e!65798)))

(declare-fun lt!51138 () Bool)

(assert (=> d!27395 (= res!50636 (not lt!51138))))

(declare-fun lt!51137 () Bool)

(assert (=> d!27395 (= lt!51138 lt!51137)))

(declare-fun lt!51136 () Unit!3060)

(declare-fun e!65797 () Unit!3060)

(assert (=> d!27395 (= lt!51136 e!65797)))

(declare-fun c!17369 () Bool)

(assert (=> d!27395 (= c!17369 lt!51137)))

(assert (=> d!27395 (= lt!51137 (containsKey!156 (toList!787 call!10435) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27395 (= (contains!808 call!10435 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) lt!51138)))

(declare-fun b!101050 () Bool)

(declare-fun lt!51139 () Unit!3060)

(assert (=> b!101050 (= e!65797 lt!51139)))

(assert (=> b!101050 (= lt!51139 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 call!10435) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!101050 (isDefined!105 (getValueByKey!152 (toList!787 call!10435) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101051 () Bool)

(declare-fun Unit!3071 () Unit!3060)

(assert (=> b!101051 (= e!65797 Unit!3071)))

(declare-fun b!101052 () Bool)

(assert (=> b!101052 (= e!65798 (isDefined!105 (getValueByKey!152 (toList!787 call!10435) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(assert (= (and d!27395 c!17369) b!101050))

(assert (= (and d!27395 (not c!17369)) b!101051))

(assert (= (and d!27395 (not res!50636)) b!101052))

(assert (=> d!27395 m!111627))

(declare-fun m!111887 () Bool)

(assert (=> d!27395 m!111887))

(assert (=> b!101050 m!111627))

(declare-fun m!111889 () Bool)

(assert (=> b!101050 m!111889))

(assert (=> b!101050 m!111627))

(declare-fun m!111891 () Bool)

(assert (=> b!101050 m!111891))

(assert (=> b!101050 m!111891))

(declare-fun m!111893 () Bool)

(assert (=> b!101050 m!111893))

(assert (=> b!101052 m!111627))

(assert (=> b!101052 m!111891))

(assert (=> b!101052 m!111891))

(assert (=> b!101052 m!111893))

(assert (=> b!100918 d!27395))

(declare-fun b!101053 () Bool)

(declare-fun e!65801 () Bool)

(declare-fun e!65800 () Bool)

(assert (=> b!101053 (= e!65801 e!65800)))

(declare-fun lt!51140 () (_ BitVec 64))

(assert (=> b!101053 (= lt!51140 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!51141 () Unit!3060)

(assert (=> b!101053 (= lt!51141 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!51140 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!101053 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!51140 #b00000000000000000000000000000000)))

(declare-fun lt!51142 () Unit!3060)

(assert (=> b!101053 (= lt!51142 lt!51141)))

(declare-fun res!50637 () Bool)

(assert (=> b!101053 (= res!50637 (= (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))) (Found!255 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!101053 (=> (not res!50637) (not e!65800))))

(declare-fun d!27397 () Bool)

(declare-fun res!50638 () Bool)

(declare-fun e!65799 () Bool)

(assert (=> d!27397 (=> res!50638 e!65799)))

(assert (=> d!27397 (= res!50638 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> d!27397 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))) e!65799)))

(declare-fun bm!10460 () Bool)

(declare-fun call!10463 () Bool)

(assert (=> bm!10460 (= call!10463 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!101054 () Bool)

(assert (=> b!101054 (= e!65799 e!65801)))

(declare-fun c!17370 () Bool)

(assert (=> b!101054 (= c!17370 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!101055 () Bool)

(assert (=> b!101055 (= e!65801 call!10463)))

(declare-fun b!101056 () Bool)

(assert (=> b!101056 (= e!65800 call!10463)))

(assert (= (and d!27397 (not res!50638)) b!101054))

(assert (= (and b!101054 c!17370) b!101053))

(assert (= (and b!101054 (not c!17370)) b!101055))

(assert (= (and b!101053 res!50637) b!101056))

(assert (= (or b!101056 b!101055) bm!10460))

(declare-fun m!111895 () Bool)

(assert (=> b!101053 m!111895))

(declare-fun m!111897 () Bool)

(assert (=> b!101053 m!111897))

(declare-fun m!111899 () Bool)

(assert (=> b!101053 m!111899))

(assert (=> b!101053 m!111895))

(declare-fun m!111901 () Bool)

(assert (=> b!101053 m!111901))

(declare-fun m!111903 () Bool)

(assert (=> bm!10460 m!111903))

(assert (=> b!101054 m!111895))

(assert (=> b!101054 m!111895))

(declare-fun m!111905 () Bool)

(assert (=> b!101054 m!111905))

(assert (=> bm!10363 d!27397))

(assert (=> d!27369 d!27375))

(declare-fun d!27399 () Bool)

(assert (=> d!27399 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) from!355 Nil!1584)))

(assert (=> d!27399 true))

(declare-fun _$71!138 () Unit!3060)

(assert (=> d!27399 (= (choose!39 (_keys!4221 (v!2832 (underlying!343 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!138)))

(declare-fun bs!4185 () Bool)

(assert (= bs!4185 d!27399))

(assert (=> bs!4185 m!111625))

(assert (=> d!27369 d!27399))

(declare-fun d!27401 () Bool)

(assert (=> d!27401 (= (+!137 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) lt!51059 (zeroValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51145 () Unit!3060)

(declare-fun choose!616 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 V!3171 Int) Unit!3060)

(assert (=> d!27401 (= lt!51145 (choose!616 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51059 (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27401 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27401 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51059 (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)) lt!51145)))

(declare-fun bs!4186 () Bool)

(assert (= bs!4186 d!27401))

(assert (=> bs!4186 m!111765))

(declare-fun m!111907 () Bool)

(assert (=> bs!4186 m!111907))

(assert (=> bs!4186 m!111765))

(declare-fun m!111909 () Bool)

(assert (=> bs!4186 m!111909))

(assert (=> bs!4186 m!111661))

(declare-fun m!111911 () Bool)

(assert (=> bs!4186 m!111911))

(assert (=> bs!4186 m!111661))

(declare-fun m!111913 () Bool)

(assert (=> bs!4186 m!111913))

(assert (=> b!100893 d!27401))

(declare-fun d!27403 () Bool)

(assert (=> d!27403 (= (+!137 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) lt!51052 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51148 () Unit!3060)

(declare-fun choose!617 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 V!3171 Int) Unit!3060)

(assert (=> d!27403 (= lt!51148 (choose!617 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51052 (zeroValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2402 newMap!16) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27403 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27403 (= (lemmaChangeZeroKeyThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) lt!51052 (zeroValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2402 newMap!16) (defaultEntry!2523 newMap!16)) lt!51148)))

(declare-fun bs!4187 () Bool)

(assert (= bs!4187 d!27403))

(assert (=> bs!4187 m!111765))

(assert (=> bs!4187 m!111661))

(declare-fun m!111915 () Bool)

(assert (=> bs!4187 m!111915))

(assert (=> bs!4187 m!111765))

(declare-fun m!111917 () Bool)

(assert (=> bs!4187 m!111917))

(assert (=> bs!4187 m!111909))

(assert (=> bs!4187 m!111661))

(declare-fun m!111919 () Bool)

(assert (=> bs!4187 m!111919))

(assert (=> b!100909 d!27403))

(declare-fun d!27405 () Bool)

(declare-fun res!50643 () Bool)

(declare-fun e!65806 () Bool)

(assert (=> d!27405 (=> res!50643 e!65806)))

(assert (=> d!27405 (= res!50643 (and ((_ is Cons!1582) (toList!787 lt!50935)) (= (_1!1189 (h!2178 (toList!787 lt!50935))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(assert (=> d!27405 (= (containsKey!156 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) e!65806)))

(declare-fun b!101061 () Bool)

(declare-fun e!65807 () Bool)

(assert (=> b!101061 (= e!65806 e!65807)))

(declare-fun res!50644 () Bool)

(assert (=> b!101061 (=> (not res!50644) (not e!65807))))

(assert (=> b!101061 (= res!50644 (and (or (not ((_ is Cons!1582) (toList!787 lt!50935))) (bvsle (_1!1189 (h!2178 (toList!787 lt!50935))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))) ((_ is Cons!1582) (toList!787 lt!50935)) (bvslt (_1!1189 (h!2178 (toList!787 lt!50935))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(declare-fun b!101062 () Bool)

(assert (=> b!101062 (= e!65807 (containsKey!156 (t!5580 (toList!787 lt!50935)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (= (and d!27405 (not res!50643)) b!101061))

(assert (= (and b!101061 res!50644) b!101062))

(assert (=> b!101062 m!111627))

(declare-fun m!111921 () Bool)

(assert (=> b!101062 m!111921))

(assert (=> d!27357 d!27405))

(assert (=> b!101012 d!27371))

(declare-fun bm!10463 () Bool)

(declare-fun call!10466 () (_ BitVec 32))

(assert (=> bm!10463 (= call!10466 (arrayCountValidKeys!0 (_keys!4221 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101071 () Bool)

(declare-fun e!65812 () (_ BitVec 32))

(assert (=> b!101071 (= e!65812 call!10466)))

(declare-fun d!27407 () Bool)

(declare-fun lt!51151 () (_ BitVec 32))

(assert (=> d!27407 (and (bvsge lt!51151 #b00000000000000000000000000000000) (bvsle lt!51151 (bvsub (size!2279 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!65813 () (_ BitVec 32))

(assert (=> d!27407 (= lt!51151 e!65813)))

(declare-fun c!17375 () Bool)

(assert (=> d!27407 (= c!17375 (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(assert (=> d!27407 (and (bvsle #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2279 (_keys!4221 newMap!16)) (size!2279 (_keys!4221 newMap!16))))))

(assert (=> d!27407 (= (arrayCountValidKeys!0 (_keys!4221 newMap!16) #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) lt!51151)))

(declare-fun b!101072 () Bool)

(assert (=> b!101072 (= e!65813 #b00000000000000000000000000000000)))

(declare-fun b!101073 () Bool)

(assert (=> b!101073 (= e!65813 e!65812)))

(declare-fun c!17376 () Bool)

(assert (=> b!101073 (= c!17376 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101074 () Bool)

(assert (=> b!101074 (= e!65812 (bvadd #b00000000000000000000000000000001 call!10466))))

(assert (= (and d!27407 c!17375) b!101072))

(assert (= (and d!27407 (not c!17375)) b!101073))

(assert (= (and b!101073 c!17376) b!101074))

(assert (= (and b!101073 (not c!17376)) b!101071))

(assert (= (or b!101074 b!101071) bm!10463))

(declare-fun m!111923 () Bool)

(assert (=> bm!10463 m!111923))

(assert (=> b!101073 m!111877))

(assert (=> b!101073 m!111877))

(declare-fun m!111925 () Bool)

(assert (=> b!101073 m!111925))

(assert (=> b!100783 d!27407))

(declare-fun d!27409 () Bool)

(assert (=> d!27409 (= (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100983 d!27409))

(declare-fun d!27411 () Bool)

(declare-fun e!65816 () Bool)

(assert (=> d!27411 e!65816))

(declare-fun res!50647 () Bool)

(assert (=> d!27411 (=> (not res!50647) (not e!65816))))

(assert (=> d!27411 (= res!50647 (and (bvsge (index!3166 lt!51042) #b00000000000000000000000000000000) (bvslt (index!3166 lt!51042) (size!2279 (_keys!4221 newMap!16)))))))

(declare-fun lt!51154 () Unit!3060)

(declare-fun choose!618 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) Int) Unit!3060)

(assert (=> d!27411 (= lt!51154 (choose!618 (_keys!4221 newMap!16) lt!51047 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27411 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27411 (= (lemmaValidKeyInArrayIsInListMap!104 (_keys!4221 newMap!16) lt!51047 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (defaultEntry!2523 newMap!16)) lt!51154)))

(declare-fun b!101077 () Bool)

(assert (=> b!101077 (= e!65816 (contains!808 (getCurrentListMap!478 (_keys!4221 newMap!16) lt!51047 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042))))))

(assert (= (and d!27411 res!50647) b!101077))

(declare-fun m!111927 () Bool)

(assert (=> d!27411 m!111927))

(assert (=> d!27411 m!111909))

(declare-fun m!111929 () Bool)

(assert (=> b!101077 m!111929))

(assert (=> b!101077 m!111747))

(assert (=> b!101077 m!111929))

(assert (=> b!101077 m!111747))

(declare-fun m!111931 () Bool)

(assert (=> b!101077 m!111931))

(assert (=> b!100899 d!27411))

(declare-fun d!27413 () Bool)

(declare-fun e!65819 () Bool)

(assert (=> d!27413 e!65819))

(declare-fun res!50650 () Bool)

(assert (=> d!27413 (=> (not res!50650) (not e!65819))))

(assert (=> d!27413 (= res!50650 (and (bvsge (index!3166 lt!51042) #b00000000000000000000000000000000) (bvslt (index!3166 lt!51042) (size!2280 (_values!2506 newMap!16)))))))

(declare-fun lt!51157 () Unit!3060)

(declare-fun choose!619 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) (_ BitVec 64) V!3171 Int) Unit!3060)

(assert (=> d!27413 (= lt!51157 (choose!619 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27413 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27413 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (index!3166 lt!51042) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)) lt!51157)))

(declare-fun b!101080 () Bool)

(assert (=> b!101080 (= e!65819 (= (+!137 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!478 (_keys!4221 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16))))))

(assert (= (and d!27413 res!50650) b!101080))

(assert (=> d!27413 m!111627))

(assert (=> d!27413 m!111661))

(declare-fun m!111933 () Bool)

(assert (=> d!27413 m!111933))

(assert (=> d!27413 m!111909))

(assert (=> b!101080 m!111765))

(assert (=> b!101080 m!111765))

(declare-fun m!111935 () Bool)

(assert (=> b!101080 m!111935))

(assert (=> b!101080 m!111761))

(declare-fun m!111937 () Bool)

(assert (=> b!101080 m!111937))

(assert (=> b!100899 d!27413))

(declare-fun d!27415 () Bool)

(declare-fun e!65821 () Bool)

(assert (=> d!27415 e!65821))

(declare-fun res!50651 () Bool)

(assert (=> d!27415 (=> res!50651 e!65821)))

(declare-fun lt!51160 () Bool)

(assert (=> d!27415 (= res!50651 (not lt!51160))))

(declare-fun lt!51159 () Bool)

(assert (=> d!27415 (= lt!51160 lt!51159)))

(declare-fun lt!51158 () Unit!3060)

(declare-fun e!65820 () Unit!3060)

(assert (=> d!27415 (= lt!51158 e!65820)))

(declare-fun c!17377 () Bool)

(assert (=> d!27415 (= c!17377 lt!51159)))

(assert (=> d!27415 (= lt!51159 (containsKey!156 (toList!787 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27415 (= (contains!808 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) lt!51160)))

(declare-fun b!101081 () Bool)

(declare-fun lt!51161 () Unit!3060)

(assert (=> b!101081 (= e!65820 lt!51161)))

(assert (=> b!101081 (= lt!51161 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!101081 (isDefined!105 (getValueByKey!152 (toList!787 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101082 () Bool)

(declare-fun Unit!3072 () Unit!3060)

(assert (=> b!101082 (= e!65820 Unit!3072)))

(declare-fun b!101083 () Bool)

(assert (=> b!101083 (= e!65821 (isDefined!105 (getValueByKey!152 (toList!787 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(assert (= (and d!27415 c!17377) b!101081))

(assert (= (and d!27415 (not c!17377)) b!101082))

(assert (= (and d!27415 (not res!50651)) b!101083))

(assert (=> d!27415 m!111627))

(declare-fun m!111939 () Bool)

(assert (=> d!27415 m!111939))

(assert (=> b!101081 m!111627))

(declare-fun m!111941 () Bool)

(assert (=> b!101081 m!111941))

(assert (=> b!101081 m!111627))

(declare-fun m!111943 () Bool)

(assert (=> b!101081 m!111943))

(assert (=> b!101081 m!111943))

(declare-fun m!111945 () Bool)

(assert (=> b!101081 m!111945))

(assert (=> b!101083 m!111627))

(assert (=> b!101083 m!111943))

(assert (=> b!101083 m!111943))

(assert (=> b!101083 m!111945))

(assert (=> b!100899 d!27415))

(declare-fun bm!10464 () Bool)

(declare-fun call!10469 () ListLongMap!1543)

(assert (=> bm!10464 (= call!10469 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun bm!10465 () Bool)

(declare-fun call!10473 () ListLongMap!1543)

(declare-fun call!10471 () ListLongMap!1543)

(assert (=> bm!10465 (= call!10473 call!10471)))

(declare-fun bm!10466 () Bool)

(declare-fun call!10470 () ListLongMap!1543)

(assert (=> bm!10466 (= call!10470 call!10469)))

(declare-fun bm!10467 () Bool)

(declare-fun c!17378 () Bool)

(declare-fun call!10472 () ListLongMap!1543)

(declare-fun c!17381 () Bool)

(assert (=> bm!10467 (= call!10471 (+!137 (ite c!17381 call!10469 (ite c!17378 call!10470 call!10472)) (ite (or c!17381 c!17378) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 newMap!16)) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 newMap!16)))))))

(declare-fun b!101085 () Bool)

(declare-fun res!50653 () Bool)

(declare-fun e!65829 () Bool)

(assert (=> b!101085 (=> (not res!50653) (not e!65829))))

(declare-fun e!65824 () Bool)

(assert (=> b!101085 (= res!50653 e!65824)))

(declare-fun c!17383 () Bool)

(assert (=> b!101085 (= c!17383 (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101086 () Bool)

(declare-fun e!65834 () Bool)

(assert (=> b!101086 (= e!65834 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101087 () Bool)

(declare-fun e!65825 () Bool)

(declare-fun lt!51176 () ListLongMap!1543)

(assert (=> b!101087 (= e!65825 (= (apply!94 lt!51176 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)) (get!1294 (select (arr!2028 (_values!2506 newMap!16)) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2523 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2280 (_values!2506 newMap!16))))))

(assert (=> b!101087 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101088 () Bool)

(declare-fun e!65826 () Bool)

(assert (=> b!101088 (= e!65826 e!65825)))

(declare-fun res!50654 () Bool)

(assert (=> b!101088 (=> (not res!50654) (not e!65825))))

(assert (=> b!101088 (= res!50654 (contains!808 lt!51176 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101088 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101089 () Bool)

(declare-fun e!65823 () Unit!3060)

(declare-fun lt!51174 () Unit!3060)

(assert (=> b!101089 (= e!65823 lt!51174)))

(declare-fun lt!51171 () ListLongMap!1543)

(assert (=> b!101089 (= lt!51171 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51162 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51162 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51165 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51165 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51183 () Unit!3060)

(assert (=> b!101089 (= lt!51183 (addStillContains!70 lt!51171 lt!51162 (zeroValue!2402 newMap!16) lt!51165))))

(assert (=> b!101089 (contains!808 (+!137 lt!51171 (tuple2!2357 lt!51162 (zeroValue!2402 newMap!16))) lt!51165)))

(declare-fun lt!51175 () Unit!3060)

(assert (=> b!101089 (= lt!51175 lt!51183)))

(declare-fun lt!51173 () ListLongMap!1543)

(assert (=> b!101089 (= lt!51173 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51168 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51181 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51181 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51178 () Unit!3060)

(assert (=> b!101089 (= lt!51178 (addApplyDifferent!70 lt!51173 lt!51168 (minValue!2402 newMap!16) lt!51181))))

(assert (=> b!101089 (= (apply!94 (+!137 lt!51173 (tuple2!2357 lt!51168 (minValue!2402 newMap!16))) lt!51181) (apply!94 lt!51173 lt!51181))))

(declare-fun lt!51172 () Unit!3060)

(assert (=> b!101089 (= lt!51172 lt!51178)))

(declare-fun lt!51163 () ListLongMap!1543)

(assert (=> b!101089 (= lt!51163 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51179 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51166 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51166 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51164 () Unit!3060)

(assert (=> b!101089 (= lt!51164 (addApplyDifferent!70 lt!51163 lt!51179 (zeroValue!2402 newMap!16) lt!51166))))

(assert (=> b!101089 (= (apply!94 (+!137 lt!51163 (tuple2!2357 lt!51179 (zeroValue!2402 newMap!16))) lt!51166) (apply!94 lt!51163 lt!51166))))

(declare-fun lt!51170 () Unit!3060)

(assert (=> b!101089 (= lt!51170 lt!51164)))

(declare-fun lt!51182 () ListLongMap!1543)

(assert (=> b!101089 (= lt!51182 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51177 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51177 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51169 () (_ BitVec 64))

(assert (=> b!101089 (= lt!51169 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101089 (= lt!51174 (addApplyDifferent!70 lt!51182 lt!51177 (minValue!2402 newMap!16) lt!51169))))

(assert (=> b!101089 (= (apply!94 (+!137 lt!51182 (tuple2!2357 lt!51177 (minValue!2402 newMap!16))) lt!51169) (apply!94 lt!51182 lt!51169))))

(declare-fun b!101090 () Bool)

(declare-fun e!65830 () Bool)

(assert (=> b!101090 (= e!65830 (= (apply!94 lt!51176 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2402 newMap!16)))))

(declare-fun b!101084 () Bool)

(declare-fun e!65833 () Bool)

(assert (=> b!101084 (= e!65829 e!65833)))

(declare-fun c!17380 () Bool)

(assert (=> b!101084 (= c!17380 (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!27417 () Bool)

(assert (=> d!27417 e!65829))

(declare-fun res!50657 () Bool)

(assert (=> d!27417 (=> (not res!50657) (not e!65829))))

(assert (=> d!27417 (= res!50657 (or (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))))

(declare-fun lt!51167 () ListLongMap!1543)

(assert (=> d!27417 (= lt!51176 lt!51167)))

(declare-fun lt!51180 () Unit!3060)

(assert (=> d!27417 (= lt!51180 e!65823)))

(declare-fun c!17382 () Bool)

(assert (=> d!27417 (= c!17382 e!65834)))

(declare-fun res!50652 () Bool)

(assert (=> d!27417 (=> (not res!50652) (not e!65834))))

(assert (=> d!27417 (= res!50652 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun e!65827 () ListLongMap!1543)

(assert (=> d!27417 (= lt!51167 e!65827)))

(assert (=> d!27417 (= c!17381 (and (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27417 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27417 (= (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) lt!51176)))

(declare-fun b!101091 () Bool)

(declare-fun e!65822 () ListLongMap!1543)

(assert (=> b!101091 (= e!65827 e!65822)))

(assert (=> b!101091 (= c!17378 (and (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101092 () Bool)

(declare-fun res!50656 () Bool)

(assert (=> b!101092 (=> (not res!50656) (not e!65829))))

(assert (=> b!101092 (= res!50656 e!65826)))

(declare-fun res!50655 () Bool)

(assert (=> b!101092 (=> res!50655 e!65826)))

(declare-fun e!65832 () Bool)

(assert (=> b!101092 (= res!50655 (not e!65832))))

(declare-fun res!50659 () Bool)

(assert (=> b!101092 (=> (not res!50659) (not e!65832))))

(assert (=> b!101092 (= res!50659 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun bm!10468 () Bool)

(declare-fun call!10467 () Bool)

(assert (=> bm!10468 (= call!10467 (contains!808 lt!51176 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101093 () Bool)

(assert (=> b!101093 (= e!65824 e!65830)))

(declare-fun res!50658 () Bool)

(assert (=> b!101093 (= res!50658 call!10467)))

(assert (=> b!101093 (=> (not res!50658) (not e!65830))))

(declare-fun bm!10469 () Bool)

(assert (=> bm!10469 (= call!10472 call!10470)))

(declare-fun b!101094 () Bool)

(declare-fun e!65828 () Bool)

(assert (=> b!101094 (= e!65828 (= (apply!94 lt!51176 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2402 newMap!16)))))

(declare-fun b!101095 () Bool)

(declare-fun Unit!3073 () Unit!3060)

(assert (=> b!101095 (= e!65823 Unit!3073)))

(declare-fun b!101096 () Bool)

(assert (=> b!101096 (= e!65832 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101097 () Bool)

(assert (=> b!101097 (= e!65822 call!10473)))

(declare-fun b!101098 () Bool)

(declare-fun c!17379 () Bool)

(assert (=> b!101098 (= c!17379 (and (not (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65831 () ListLongMap!1543)

(assert (=> b!101098 (= e!65822 e!65831)))

(declare-fun b!101099 () Bool)

(assert (=> b!101099 (= e!65831 call!10472)))

(declare-fun b!101100 () Bool)

(declare-fun call!10468 () Bool)

(assert (=> b!101100 (= e!65833 (not call!10468))))

(declare-fun b!101101 () Bool)

(assert (=> b!101101 (= e!65831 call!10473)))

(declare-fun bm!10470 () Bool)

(assert (=> bm!10470 (= call!10468 (contains!808 lt!51176 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101102 () Bool)

(assert (=> b!101102 (= e!65827 (+!137 call!10471 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 newMap!16))))))

(declare-fun b!101103 () Bool)

(assert (=> b!101103 (= e!65824 (not call!10467))))

(declare-fun b!101104 () Bool)

(assert (=> b!101104 (= e!65833 e!65828)))

(declare-fun res!50660 () Bool)

(assert (=> b!101104 (= res!50660 call!10468)))

(assert (=> b!101104 (=> (not res!50660) (not e!65828))))

(assert (= (and d!27417 c!17381) b!101102))

(assert (= (and d!27417 (not c!17381)) b!101091))

(assert (= (and b!101091 c!17378) b!101097))

(assert (= (and b!101091 (not c!17378)) b!101098))

(assert (= (and b!101098 c!17379) b!101101))

(assert (= (and b!101098 (not c!17379)) b!101099))

(assert (= (or b!101101 b!101099) bm!10469))

(assert (= (or b!101097 bm!10469) bm!10466))

(assert (= (or b!101097 b!101101) bm!10465))

(assert (= (or b!101102 bm!10466) bm!10464))

(assert (= (or b!101102 bm!10465) bm!10467))

(assert (= (and d!27417 res!50652) b!101086))

(assert (= (and d!27417 c!17382) b!101089))

(assert (= (and d!27417 (not c!17382)) b!101095))

(assert (= (and d!27417 res!50657) b!101092))

(assert (= (and b!101092 res!50659) b!101096))

(assert (= (and b!101092 (not res!50655)) b!101088))

(assert (= (and b!101088 res!50654) b!101087))

(assert (= (and b!101092 res!50656) b!101085))

(assert (= (and b!101085 c!17383) b!101093))

(assert (= (and b!101085 (not c!17383)) b!101103))

(assert (= (and b!101093 res!50658) b!101090))

(assert (= (or b!101093 b!101103) bm!10468))

(assert (= (and b!101085 res!50653) b!101084))

(assert (= (and b!101084 c!17380) b!101104))

(assert (= (and b!101084 (not c!17380)) b!101100))

(assert (= (and b!101104 res!50660) b!101094))

(assert (= (or b!101104 b!101100) bm!10470))

(declare-fun b_lambda!4527 () Bool)

(assert (=> (not b_lambda!4527) (not b!101087)))

(declare-fun tb!1969 () Bool)

(declare-fun t!5589 () Bool)

(assert (=> (and b!100707 (= (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) (defaultEntry!2523 newMap!16)) t!5589) tb!1969))

(declare-fun result!3331 () Bool)

(assert (=> tb!1969 (= result!3331 tp_is_empty!2643)))

(assert (=> b!101087 t!5589))

(declare-fun b_and!6223 () Bool)

(assert (= b_and!6219 (and (=> t!5589 result!3331) b_and!6223)))

(declare-fun t!5591 () Bool)

(declare-fun tb!1971 () Bool)

(assert (=> (and b!100696 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 newMap!16)) t!5591) tb!1971))

(declare-fun result!3333 () Bool)

(assert (= result!3333 result!3331))

(assert (=> b!101087 t!5591))

(declare-fun b_and!6225 () Bool)

(assert (= b_and!6221 (and (=> t!5591 result!3333) b_and!6225)))

(declare-fun m!111947 () Bool)

(assert (=> bm!10467 m!111947))

(declare-fun m!111949 () Bool)

(assert (=> b!101089 m!111949))

(declare-fun m!111951 () Bool)

(assert (=> b!101089 m!111951))

(declare-fun m!111953 () Bool)

(assert (=> b!101089 m!111953))

(declare-fun m!111955 () Bool)

(assert (=> b!101089 m!111955))

(declare-fun m!111957 () Bool)

(assert (=> b!101089 m!111957))

(declare-fun m!111959 () Bool)

(assert (=> b!101089 m!111959))

(declare-fun m!111961 () Bool)

(assert (=> b!101089 m!111961))

(assert (=> b!101089 m!111959))

(declare-fun m!111963 () Bool)

(assert (=> b!101089 m!111963))

(assert (=> b!101089 m!111877))

(declare-fun m!111965 () Bool)

(assert (=> b!101089 m!111965))

(declare-fun m!111967 () Bool)

(assert (=> b!101089 m!111967))

(declare-fun m!111969 () Bool)

(assert (=> b!101089 m!111969))

(declare-fun m!111971 () Bool)

(assert (=> b!101089 m!111971))

(assert (=> b!101089 m!111965))

(declare-fun m!111973 () Bool)

(assert (=> b!101089 m!111973))

(assert (=> b!101089 m!111967))

(declare-fun m!111975 () Bool)

(assert (=> b!101089 m!111975))

(declare-fun m!111977 () Bool)

(assert (=> b!101089 m!111977))

(declare-fun m!111979 () Bool)

(assert (=> b!101089 m!111979))

(assert (=> b!101089 m!111975))

(assert (=> b!101087 m!111877))

(declare-fun m!111981 () Bool)

(assert (=> b!101087 m!111981))

(declare-fun m!111983 () Bool)

(assert (=> b!101087 m!111983))

(declare-fun m!111985 () Bool)

(assert (=> b!101087 m!111985))

(declare-fun m!111987 () Bool)

(assert (=> b!101087 m!111987))

(assert (=> b!101087 m!111985))

(assert (=> b!101087 m!111983))

(assert (=> b!101087 m!111877))

(assert (=> b!101096 m!111877))

(assert (=> b!101096 m!111877))

(assert (=> b!101096 m!111925))

(assert (=> b!101088 m!111877))

(assert (=> b!101088 m!111877))

(declare-fun m!111989 () Bool)

(assert (=> b!101088 m!111989))

(declare-fun m!111991 () Bool)

(assert (=> bm!10470 m!111991))

(assert (=> bm!10464 m!111953))

(assert (=> d!27417 m!111909))

(declare-fun m!111993 () Bool)

(assert (=> b!101094 m!111993))

(declare-fun m!111995 () Bool)

(assert (=> bm!10468 m!111995))

(declare-fun m!111997 () Bool)

(assert (=> b!101090 m!111997))

(assert (=> b!101086 m!111877))

(assert (=> b!101086 m!111877))

(assert (=> b!101086 m!111925))

(declare-fun m!111999 () Bool)

(assert (=> b!101102 m!111999))

(assert (=> b!100899 d!27417))

(declare-fun d!27419 () Bool)

(assert (=> d!27419 (= (get!1297 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!100938 d!27419))

(declare-fun d!27421 () Bool)

(declare-fun e!65837 () Bool)

(assert (=> d!27421 e!65837))

(declare-fun res!50665 () Bool)

(assert (=> d!27421 (=> (not res!50665) (not e!65837))))

(declare-fun lt!51195 () ListLongMap!1543)

(assert (=> d!27421 (= res!50665 (contains!808 lt!51195 (_1!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!51193 () List!1586)

(assert (=> d!27421 (= lt!51195 (ListLongMap!1544 lt!51193))))

(declare-fun lt!51194 () Unit!3060)

(declare-fun lt!51192 () Unit!3060)

(assert (=> d!27421 (= lt!51194 lt!51192)))

(assert (=> d!27421 (= (getValueByKey!152 lt!51193 (_1!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!157 (_2!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!68 (List!1586 (_ BitVec 64) V!3171) Unit!3060)

(assert (=> d!27421 (= lt!51192 (lemmaContainsTupThenGetReturnValue!68 lt!51193 (_1!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!71 (List!1586 (_ BitVec 64) V!3171) List!1586)

(assert (=> d!27421 (= lt!51193 (insertStrictlySorted!71 (toList!787 e!65703) (_1!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!27421 (= (+!137 e!65703 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!51195)))

(declare-fun b!101109 () Bool)

(declare-fun res!50666 () Bool)

(assert (=> b!101109 (=> (not res!50666) (not e!65837))))

(assert (=> b!101109 (= res!50666 (= (getValueByKey!152 (toList!787 lt!51195) (_1!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!157 (_2!1189 (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!101110 () Bool)

(declare-fun contains!811 (List!1586 tuple2!2356) Bool)

(assert (=> b!101110 (= e!65837 (contains!811 (toList!787 lt!51195) (ite c!17328 (ite c!17327 (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!27421 res!50665) b!101109))

(assert (= (and b!101109 res!50666) b!101110))

(declare-fun m!112001 () Bool)

(assert (=> d!27421 m!112001))

(declare-fun m!112003 () Bool)

(assert (=> d!27421 m!112003))

(declare-fun m!112005 () Bool)

(assert (=> d!27421 m!112005))

(declare-fun m!112007 () Bool)

(assert (=> d!27421 m!112007))

(declare-fun m!112009 () Bool)

(assert (=> b!101109 m!112009))

(declare-fun m!112011 () Bool)

(assert (=> b!101110 m!112011))

(assert (=> bm!10431 d!27421))

(declare-fun bm!10471 () Bool)

(declare-fun call!10474 () Bool)

(declare-fun c!17384 () Bool)

(assert (=> bm!10471 (= call!10474 (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!17384 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!17365 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584) Nil!1584)) (ite c!17365 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584) Nil!1584))))))

(declare-fun b!101111 () Bool)

(declare-fun e!65839 () Bool)

(declare-fun e!65841 () Bool)

(assert (=> b!101111 (= e!65839 e!65841)))

(declare-fun res!50668 () Bool)

(assert (=> b!101111 (=> (not res!50668) (not e!65841))))

(declare-fun e!65840 () Bool)

(assert (=> b!101111 (= res!50668 (not e!65840))))

(declare-fun res!50667 () Bool)

(assert (=> b!101111 (=> (not res!50667) (not e!65840))))

(assert (=> b!101111 (= res!50667 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101112 () Bool)

(declare-fun e!65838 () Bool)

(assert (=> b!101112 (= e!65841 e!65838)))

(assert (=> b!101112 (= c!17384 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!101113 () Bool)

(assert (=> b!101113 (= e!65838 call!10474)))

(declare-fun b!101114 () Bool)

(assert (=> b!101114 (= e!65840 (contains!810 (ite c!17365 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584) Nil!1584) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun d!27423 () Bool)

(declare-fun res!50669 () Bool)

(assert (=> d!27423 (=> res!50669 e!65839)))

(assert (=> d!27423 (= res!50669 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> d!27423 (= (arrayNoDuplicates!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!17365 (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584) Nil!1584)) e!65839)))

(declare-fun b!101115 () Bool)

(assert (=> b!101115 (= e!65838 call!10474)))

(assert (= (and d!27423 (not res!50669)) b!101111))

(assert (= (and b!101111 res!50667) b!101114))

(assert (= (and b!101111 res!50668) b!101112))

(assert (= (and b!101112 c!17384) b!101113))

(assert (= (and b!101112 (not c!17384)) b!101115))

(assert (= (or b!101113 b!101115) bm!10471))

(declare-fun m!112013 () Bool)

(assert (=> bm!10471 m!112013))

(declare-fun m!112015 () Bool)

(assert (=> bm!10471 m!112015))

(assert (=> b!101111 m!112013))

(assert (=> b!101111 m!112013))

(declare-fun m!112017 () Bool)

(assert (=> b!101111 m!112017))

(assert (=> b!101112 m!112013))

(assert (=> b!101112 m!112013))

(assert (=> b!101112 m!112017))

(assert (=> b!101114 m!112013))

(assert (=> b!101114 m!112013))

(declare-fun m!112019 () Bool)

(assert (=> b!101114 m!112019))

(assert (=> bm!10459 d!27423))

(declare-fun d!27425 () Bool)

(declare-fun e!65842 () Bool)

(assert (=> d!27425 e!65842))

(declare-fun res!50670 () Bool)

(assert (=> d!27425 (=> (not res!50670) (not e!65842))))

(declare-fun lt!51199 () ListLongMap!1543)

(assert (=> d!27425 (= res!50670 (contains!808 lt!51199 (_1!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun lt!51197 () List!1586)

(assert (=> d!27425 (= lt!51199 (ListLongMap!1544 lt!51197))))

(declare-fun lt!51198 () Unit!3060)

(declare-fun lt!51196 () Unit!3060)

(assert (=> d!27425 (= lt!51198 lt!51196)))

(assert (=> d!27425 (= (getValueByKey!152 lt!51197 (_1!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27425 (= lt!51196 (lemmaContainsTupThenGetReturnValue!68 lt!51197 (_1!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27425 (= lt!51197 (insertStrictlySorted!71 (toList!787 call!10457) (_1!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27425 (= (+!137 call!10457 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51199)))

(declare-fun b!101116 () Bool)

(declare-fun res!50671 () Bool)

(assert (=> b!101116 (=> (not res!50671) (not e!65842))))

(assert (=> b!101116 (= res!50671 (= (getValueByKey!152 (toList!787 lt!51199) (_1!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun b!101117 () Bool)

(assert (=> b!101117 (= e!65842 (contains!811 (toList!787 lt!51199) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27425 res!50670) b!101116))

(assert (= (and b!101116 res!50671) b!101117))

(declare-fun m!112021 () Bool)

(assert (=> d!27425 m!112021))

(declare-fun m!112023 () Bool)

(assert (=> d!27425 m!112023))

(declare-fun m!112025 () Bool)

(assert (=> d!27425 m!112025))

(declare-fun m!112027 () Bool)

(assert (=> d!27425 m!112027))

(declare-fun m!112029 () Bool)

(assert (=> b!101116 m!112029))

(declare-fun m!112031 () Bool)

(assert (=> b!101117 m!112031))

(assert (=> b!100999 d!27425))

(assert (=> b!100911 d!27417))

(declare-fun d!27427 () Bool)

(declare-fun e!65843 () Bool)

(assert (=> d!27427 e!65843))

(declare-fun res!50672 () Bool)

(assert (=> d!27427 (=> (not res!50672) (not e!65843))))

(declare-fun lt!51203 () ListLongMap!1543)

(assert (=> d!27427 (= res!50672 (contains!808 lt!51203 (_1!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun lt!51201 () List!1586)

(assert (=> d!27427 (= lt!51203 (ListLongMap!1544 lt!51201))))

(declare-fun lt!51202 () Unit!3060)

(declare-fun lt!51200 () Unit!3060)

(assert (=> d!27427 (= lt!51202 lt!51200)))

(assert (=> d!27427 (= (getValueByKey!152 lt!51201 (_1!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))) (Some!157 (_2!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(assert (=> d!27427 (= lt!51200 (lemmaContainsTupThenGetReturnValue!68 lt!51201 (_1!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (_2!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(assert (=> d!27427 (= lt!51201 (insertStrictlySorted!71 (toList!787 (ite c!17357 call!10455 (ite c!17354 call!10456 call!10458))) (_1!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (_2!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(assert (=> d!27427 (= (+!137 (ite c!17357 call!10455 (ite c!17354 call!10456 call!10458)) (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51203)))

(declare-fun b!101118 () Bool)

(declare-fun res!50673 () Bool)

(assert (=> b!101118 (=> (not res!50673) (not e!65843))))

(assert (=> b!101118 (= res!50673 (= (getValueByKey!152 (toList!787 lt!51203) (_1!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))) (Some!157 (_2!1189 (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))))

(declare-fun b!101119 () Bool)

(assert (=> b!101119 (= e!65843 (contains!811 (toList!787 lt!51203) (ite (or c!17357 c!17354) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (= (and d!27427 res!50672) b!101118))

(assert (= (and b!101118 res!50673) b!101119))

(declare-fun m!112033 () Bool)

(assert (=> d!27427 m!112033))

(declare-fun m!112035 () Bool)

(assert (=> d!27427 m!112035))

(declare-fun m!112037 () Bool)

(assert (=> d!27427 m!112037))

(declare-fun m!112039 () Bool)

(assert (=> d!27427 m!112039))

(declare-fun m!112041 () Bool)

(assert (=> b!101118 m!112041))

(declare-fun m!112043 () Bool)

(assert (=> b!101119 m!112043))

(assert (=> bm!10453 d!27427))

(declare-fun d!27429 () Bool)

(declare-fun lt!51206 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!105 (List!1587) (InoxSet (_ BitVec 64)))

(assert (=> d!27429 (= lt!51206 (select (content!105 Nil!1584) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun e!65848 () Bool)

(assert (=> d!27429 (= lt!51206 e!65848)))

(declare-fun res!50679 () Bool)

(assert (=> d!27429 (=> (not res!50679) (not e!65848))))

(assert (=> d!27429 (= res!50679 ((_ is Cons!1583) Nil!1584))))

(assert (=> d!27429 (= (contains!810 Nil!1584 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) lt!51206)))

(declare-fun b!101124 () Bool)

(declare-fun e!65849 () Bool)

(assert (=> b!101124 (= e!65848 e!65849)))

(declare-fun res!50678 () Bool)

(assert (=> b!101124 (=> res!50678 e!65849)))

(assert (=> b!101124 (= res!50678 (= (h!2179 Nil!1584) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101125 () Bool)

(assert (=> b!101125 (= e!65849 (contains!810 (t!5581 Nil!1584) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (= (and d!27429 res!50679) b!101124))

(assert (= (and b!101124 (not res!50678)) b!101125))

(declare-fun m!112045 () Bool)

(assert (=> d!27429 m!112045))

(assert (=> d!27429 m!111627))

(declare-fun m!112047 () Bool)

(assert (=> d!27429 m!112047))

(assert (=> b!101125 m!111627))

(declare-fun m!112049 () Bool)

(assert (=> b!101125 m!112049))

(assert (=> b!101027 d!27429))

(declare-fun d!27431 () Bool)

(assert (=> d!27431 (isDefined!105 (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun lt!51209 () Unit!3060)

(declare-fun choose!620 (List!1586 (_ BitVec 64)) Unit!3060)

(assert (=> d!27431 (= lt!51209 (choose!620 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun e!65852 () Bool)

(assert (=> d!27431 e!65852))

(declare-fun res!50682 () Bool)

(assert (=> d!27431 (=> (not res!50682) (not e!65852))))

(declare-fun isStrictlySorted!306 (List!1586) Bool)

(assert (=> d!27431 (= res!50682 (isStrictlySorted!306 (toList!787 lt!50935)))))

(assert (=> d!27431 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) lt!51209)))

(declare-fun b!101128 () Bool)

(assert (=> b!101128 (= e!65852 (containsKey!156 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (= (and d!27431 res!50682) b!101128))

(assert (=> d!27431 m!111627))

(assert (=> d!27431 m!111737))

(assert (=> d!27431 m!111737))

(assert (=> d!27431 m!111739))

(assert (=> d!27431 m!111627))

(declare-fun m!112051 () Bool)

(assert (=> d!27431 m!112051))

(declare-fun m!112053 () Bool)

(assert (=> d!27431 m!112053))

(assert (=> b!101128 m!111627))

(assert (=> b!101128 m!111733))

(assert (=> b!100804 d!27431))

(declare-fun d!27433 () Bool)

(declare-fun isEmpty!362 (Option!158) Bool)

(assert (=> d!27433 (= (isDefined!105 (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))) (not (isEmpty!362 (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))))

(declare-fun bs!4188 () Bool)

(assert (= bs!4188 d!27433))

(assert (=> bs!4188 m!111737))

(declare-fun m!112055 () Bool)

(assert (=> bs!4188 m!112055))

(assert (=> b!100804 d!27433))

(declare-fun c!17389 () Bool)

(declare-fun d!27435 () Bool)

(assert (=> d!27435 (= c!17389 (and ((_ is Cons!1582) (toList!787 lt!50935)) (= (_1!1189 (h!2178 (toList!787 lt!50935))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))))

(declare-fun e!65857 () Option!158)

(assert (=> d!27435 (= (getValueByKey!152 (toList!787 lt!50935) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) e!65857)))

(declare-fun b!101138 () Bool)

(declare-fun e!65858 () Option!158)

(assert (=> b!101138 (= e!65857 e!65858)))

(declare-fun c!17390 () Bool)

(assert (=> b!101138 (= c!17390 (and ((_ is Cons!1582) (toList!787 lt!50935)) (not (= (_1!1189 (h!2178 (toList!787 lt!50935))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))))

(declare-fun b!101139 () Bool)

(assert (=> b!101139 (= e!65858 (getValueByKey!152 (t!5580 (toList!787 lt!50935)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101137 () Bool)

(assert (=> b!101137 (= e!65857 (Some!157 (_2!1189 (h!2178 (toList!787 lt!50935)))))))

(declare-fun b!101140 () Bool)

(assert (=> b!101140 (= e!65858 None!156)))

(assert (= (and d!27435 c!17389) b!101137))

(assert (= (and d!27435 (not c!17389)) b!101138))

(assert (= (and b!101138 c!17390) b!101139))

(assert (= (and b!101138 (not c!17390)) b!101140))

(assert (=> b!101139 m!111627))

(declare-fun m!112057 () Bool)

(assert (=> b!101139 m!112057))

(assert (=> b!100804 d!27435))

(assert (=> d!27363 d!27417))

(declare-fun d!27437 () Bool)

(assert (=> d!27437 (= (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (and (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101025 d!27437))

(declare-fun d!27439 () Bool)

(declare-fun e!65860 () Bool)

(assert (=> d!27439 e!65860))

(declare-fun res!50683 () Bool)

(assert (=> d!27439 (=> res!50683 e!65860)))

(declare-fun lt!51212 () Bool)

(assert (=> d!27439 (= res!50683 (not lt!51212))))

(declare-fun lt!51211 () Bool)

(assert (=> d!27439 (= lt!51212 lt!51211)))

(declare-fun lt!51210 () Unit!3060)

(declare-fun e!65859 () Unit!3060)

(assert (=> d!27439 (= lt!51210 e!65859)))

(declare-fun c!17391 () Bool)

(assert (=> d!27439 (= c!17391 lt!51211)))

(assert (=> d!27439 (= lt!51211 (containsKey!156 (toList!787 lt!51119) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!27439 (= (contains!808 lt!51119 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!51212)))

(declare-fun b!101141 () Bool)

(declare-fun lt!51213 () Unit!3060)

(assert (=> b!101141 (= e!65859 lt!51213)))

(assert (=> b!101141 (= lt!51213 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 lt!51119) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101141 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101142 () Bool)

(declare-fun Unit!3074 () Unit!3060)

(assert (=> b!101142 (= e!65859 Unit!3074)))

(declare-fun b!101143 () Bool)

(assert (=> b!101143 (= e!65860 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!27439 c!17391) b!101141))

(assert (= (and d!27439 (not c!17391)) b!101142))

(assert (= (and d!27439 (not res!50683)) b!101143))

(assert (=> d!27439 m!111819))

(declare-fun m!112059 () Bool)

(assert (=> d!27439 m!112059))

(assert (=> b!101141 m!111819))

(declare-fun m!112061 () Bool)

(assert (=> b!101141 m!112061))

(assert (=> b!101141 m!111819))

(declare-fun m!112063 () Bool)

(assert (=> b!101141 m!112063))

(assert (=> b!101141 m!112063))

(declare-fun m!112065 () Bool)

(assert (=> b!101141 m!112065))

(assert (=> b!101143 m!111819))

(assert (=> b!101143 m!112063))

(assert (=> b!101143 m!112063))

(assert (=> b!101143 m!112065))

(assert (=> b!100985 d!27439))

(declare-fun d!27441 () Bool)

(declare-fun get!1298 (Option!158) V!3171)

(assert (=> d!27441 (= (apply!94 lt!51119 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1298 (getValueByKey!152 (toList!787 lt!51119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4189 () Bool)

(assert (= bs!4189 d!27441))

(declare-fun m!112067 () Bool)

(assert (=> bs!4189 m!112067))

(assert (=> bs!4189 m!112067))

(declare-fun m!112069 () Bool)

(assert (=> bs!4189 m!112069))

(assert (=> b!100987 d!27441))

(declare-fun d!27443 () Bool)

(assert (=> d!27443 (= (map!1263 (_2!1188 lt!51038)) (getCurrentListMap!478 (_keys!4221 (_2!1188 lt!51038)) (_values!2506 (_2!1188 lt!51038)) (mask!6640 (_2!1188 lt!51038)) (extraKeys!2336 (_2!1188 lt!51038)) (zeroValue!2402 (_2!1188 lt!51038)) (minValue!2402 (_2!1188 lt!51038)) #b00000000000000000000000000000000 (defaultEntry!2523 (_2!1188 lt!51038))))))

(declare-fun bs!4190 () Bool)

(assert (= bs!4190 d!27443))

(declare-fun m!112071 () Bool)

(assert (=> bs!4190 m!112071))

(assert (=> bm!10424 d!27443))

(declare-fun bm!10472 () Bool)

(declare-fun call!10475 () Bool)

(declare-fun c!17392 () Bool)

(assert (=> bm!10472 (= call!10475 (arrayNoDuplicates!0 (_keys!4221 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!17392 (Cons!1583 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000) Nil!1584) Nil!1584)))))

(declare-fun b!101144 () Bool)

(declare-fun e!65862 () Bool)

(declare-fun e!65864 () Bool)

(assert (=> b!101144 (= e!65862 e!65864)))

(declare-fun res!50685 () Bool)

(assert (=> b!101144 (=> (not res!50685) (not e!65864))))

(declare-fun e!65863 () Bool)

(assert (=> b!101144 (= res!50685 (not e!65863))))

(declare-fun res!50684 () Bool)

(assert (=> b!101144 (=> (not res!50684) (not e!65863))))

(assert (=> b!101144 (= res!50684 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101145 () Bool)

(declare-fun e!65861 () Bool)

(assert (=> b!101145 (= e!65864 e!65861)))

(assert (=> b!101145 (= c!17392 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101146 () Bool)

(assert (=> b!101146 (= e!65861 call!10475)))

(declare-fun b!101147 () Bool)

(assert (=> b!101147 (= e!65863 (contains!810 Nil!1584 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!27445 () Bool)

(declare-fun res!50686 () Bool)

(assert (=> d!27445 (=> res!50686 e!65862)))

(assert (=> d!27445 (= res!50686 (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(assert (=> d!27445 (= (arrayNoDuplicates!0 (_keys!4221 newMap!16) #b00000000000000000000000000000000 Nil!1584) e!65862)))

(declare-fun b!101148 () Bool)

(assert (=> b!101148 (= e!65861 call!10475)))

(assert (= (and d!27445 (not res!50686)) b!101144))

(assert (= (and b!101144 res!50684) b!101147))

(assert (= (and b!101144 res!50685) b!101145))

(assert (= (and b!101145 c!17392) b!101146))

(assert (= (and b!101145 (not c!17392)) b!101148))

(assert (= (or b!101146 b!101148) bm!10472))

(assert (=> bm!10472 m!111877))

(declare-fun m!112073 () Bool)

(assert (=> bm!10472 m!112073))

(assert (=> b!101144 m!111877))

(assert (=> b!101144 m!111877))

(assert (=> b!101144 m!111925))

(assert (=> b!101145 m!111877))

(assert (=> b!101145 m!111877))

(assert (=> b!101145 m!111925))

(assert (=> b!101147 m!111877))

(assert (=> b!101147 m!111877))

(declare-fun m!112075 () Bool)

(assert (=> b!101147 m!112075))

(assert (=> b!100785 d!27445))

(declare-fun bm!10473 () Bool)

(declare-fun call!10478 () ListLongMap!1543)

(assert (=> bm!10473 (= call!10478 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun bm!10474 () Bool)

(declare-fun call!10482 () ListLongMap!1543)

(declare-fun call!10480 () ListLongMap!1543)

(assert (=> bm!10474 (= call!10482 call!10480)))

(declare-fun bm!10475 () Bool)

(declare-fun call!10479 () ListLongMap!1543)

(assert (=> bm!10475 (= call!10479 call!10478)))

(declare-fun c!17393 () Bool)

(declare-fun call!10481 () ListLongMap!1543)

(declare-fun bm!10476 () Bool)

(declare-fun c!17396 () Bool)

(assert (=> bm!10476 (= call!10480 (+!137 (ite c!17396 call!10478 (ite c!17393 call!10479 call!10481)) (ite (or c!17396 c!17393) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2402 newMap!16)) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16))))))))

(declare-fun b!101150 () Bool)

(declare-fun res!50688 () Bool)

(declare-fun e!65872 () Bool)

(assert (=> b!101150 (=> (not res!50688) (not e!65872))))

(declare-fun e!65867 () Bool)

(assert (=> b!101150 (= res!50688 e!65867)))

(declare-fun c!17398 () Bool)

(assert (=> b!101150 (= c!17398 (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101151 () Bool)

(declare-fun e!65877 () Bool)

(assert (=> b!101151 (= e!65877 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101152 () Bool)

(declare-fun e!65868 () Bool)

(declare-fun lt!51228 () ListLongMap!1543)

(assert (=> b!101152 (= e!65868 (= (apply!94 lt!51228 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)) (get!1294 (select (arr!2028 (ite c!17328 (_values!2506 newMap!16) lt!51047)) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2523 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2280 (ite c!17328 (_values!2506 newMap!16) lt!51047))))))

(assert (=> b!101152 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101153 () Bool)

(declare-fun e!65869 () Bool)

(assert (=> b!101153 (= e!65869 e!65868)))

(declare-fun res!50689 () Bool)

(assert (=> b!101153 (=> (not res!50689) (not e!65868))))

(assert (=> b!101153 (= res!50689 (contains!808 lt!51228 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101153 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101154 () Bool)

(declare-fun e!65866 () Unit!3060)

(declare-fun lt!51226 () Unit!3060)

(assert (=> b!101154 (= e!65866 lt!51226)))

(declare-fun lt!51223 () ListLongMap!1543)

(assert (=> b!101154 (= lt!51223 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51214 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51217 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51217 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51235 () Unit!3060)

(assert (=> b!101154 (= lt!51235 (addStillContains!70 lt!51223 lt!51214 (zeroValue!2402 newMap!16) lt!51217))))

(assert (=> b!101154 (contains!808 (+!137 lt!51223 (tuple2!2357 lt!51214 (zeroValue!2402 newMap!16))) lt!51217)))

(declare-fun lt!51227 () Unit!3060)

(assert (=> b!101154 (= lt!51227 lt!51235)))

(declare-fun lt!51225 () ListLongMap!1543)

(assert (=> b!101154 (= lt!51225 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51220 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51220 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51233 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51233 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51230 () Unit!3060)

(assert (=> b!101154 (= lt!51230 (addApplyDifferent!70 lt!51225 lt!51220 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) lt!51233))))

(assert (=> b!101154 (= (apply!94 (+!137 lt!51225 (tuple2!2357 lt!51220 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)))) lt!51233) (apply!94 lt!51225 lt!51233))))

(declare-fun lt!51224 () Unit!3060)

(assert (=> b!101154 (= lt!51224 lt!51230)))

(declare-fun lt!51215 () ListLongMap!1543)

(assert (=> b!101154 (= lt!51215 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51231 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51231 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51218 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51218 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51216 () Unit!3060)

(assert (=> b!101154 (= lt!51216 (addApplyDifferent!70 lt!51215 lt!51231 (zeroValue!2402 newMap!16) lt!51218))))

(assert (=> b!101154 (= (apply!94 (+!137 lt!51215 (tuple2!2357 lt!51231 (zeroValue!2402 newMap!16))) lt!51218) (apply!94 lt!51215 lt!51218))))

(declare-fun lt!51222 () Unit!3060)

(assert (=> b!101154 (= lt!51222 lt!51216)))

(declare-fun lt!51234 () ListLongMap!1543)

(assert (=> b!101154 (= lt!51234 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51229 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51221 () (_ BitVec 64))

(assert (=> b!101154 (= lt!51221 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101154 (= lt!51226 (addApplyDifferent!70 lt!51234 lt!51229 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) lt!51221))))

(assert (=> b!101154 (= (apply!94 (+!137 lt!51234 (tuple2!2357 lt!51229 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)))) lt!51221) (apply!94 lt!51234 lt!51221))))

(declare-fun b!101155 () Bool)

(declare-fun e!65873 () Bool)

(assert (=> b!101155 (= e!65873 (= (apply!94 lt!51228 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2402 newMap!16)))))

(declare-fun b!101149 () Bool)

(declare-fun e!65876 () Bool)

(assert (=> b!101149 (= e!65872 e!65876)))

(declare-fun c!17395 () Bool)

(assert (=> b!101149 (= c!17395 (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!27447 () Bool)

(assert (=> d!27447 e!65872))

(declare-fun res!50692 () Bool)

(assert (=> d!27447 (=> (not res!50692) (not e!65872))))

(assert (=> d!27447 (= res!50692 (or (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))))

(declare-fun lt!51219 () ListLongMap!1543)

(assert (=> d!27447 (= lt!51228 lt!51219)))

(declare-fun lt!51232 () Unit!3060)

(assert (=> d!27447 (= lt!51232 e!65866)))

(declare-fun c!17397 () Bool)

(assert (=> d!27447 (= c!17397 e!65877)))

(declare-fun res!50687 () Bool)

(assert (=> d!27447 (=> (not res!50687) (not e!65877))))

(assert (=> d!27447 (= res!50687 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun e!65870 () ListLongMap!1543)

(assert (=> d!27447 (= lt!51219 e!65870)))

(assert (=> d!27447 (= c!17396 (and (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27447 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27447 (= (getCurrentListMap!478 (_keys!4221 newMap!16) (ite c!17328 (_values!2506 newMap!16) lt!51047) (mask!6640 newMap!16) (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) (zeroValue!2402 newMap!16) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) lt!51228)))

(declare-fun b!101156 () Bool)

(declare-fun e!65865 () ListLongMap!1543)

(assert (=> b!101156 (= e!65870 e!65865)))

(assert (=> b!101156 (= c!17393 (and (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101157 () Bool)

(declare-fun res!50691 () Bool)

(assert (=> b!101157 (=> (not res!50691) (not e!65872))))

(assert (=> b!101157 (= res!50691 e!65869)))

(declare-fun res!50690 () Bool)

(assert (=> b!101157 (=> res!50690 e!65869)))

(declare-fun e!65875 () Bool)

(assert (=> b!101157 (= res!50690 (not e!65875))))

(declare-fun res!50694 () Bool)

(assert (=> b!101157 (=> (not res!50694) (not e!65875))))

(assert (=> b!101157 (= res!50694 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun bm!10477 () Bool)

(declare-fun call!10476 () Bool)

(assert (=> bm!10477 (= call!10476 (contains!808 lt!51228 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101158 () Bool)

(assert (=> b!101158 (= e!65867 e!65873)))

(declare-fun res!50693 () Bool)

(assert (=> b!101158 (= res!50693 call!10476)))

(assert (=> b!101158 (=> (not res!50693) (not e!65873))))

(declare-fun bm!10478 () Bool)

(assert (=> bm!10478 (= call!10481 call!10479)))

(declare-fun e!65871 () Bool)

(declare-fun b!101159 () Bool)

(assert (=> b!101159 (= e!65871 (= (apply!94 lt!51228 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16))))))

(declare-fun b!101160 () Bool)

(declare-fun Unit!3075 () Unit!3060)

(assert (=> b!101160 (= e!65866 Unit!3075)))

(declare-fun b!101161 () Bool)

(assert (=> b!101161 (= e!65875 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101162 () Bool)

(assert (=> b!101162 (= e!65865 call!10482)))

(declare-fun c!17394 () Bool)

(declare-fun b!101163 () Bool)

(assert (=> b!101163 (= c!17394 (and (not (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!17328 (ite c!17327 (extraKeys!2336 newMap!16) lt!51059) (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65874 () ListLongMap!1543)

(assert (=> b!101163 (= e!65865 e!65874)))

(declare-fun b!101164 () Bool)

(assert (=> b!101164 (= e!65874 call!10481)))

(declare-fun b!101165 () Bool)

(declare-fun call!10477 () Bool)

(assert (=> b!101165 (= e!65876 (not call!10477))))

(declare-fun b!101166 () Bool)

(assert (=> b!101166 (= e!65874 call!10482)))

(declare-fun bm!10479 () Bool)

(assert (=> bm!10479 (= call!10477 (contains!808 lt!51228 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101167 () Bool)

(assert (=> b!101167 (= e!65870 (+!137 call!10480 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!17328 (ite c!17327 (minValue!2402 newMap!16) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2402 newMap!16)))))))

(declare-fun b!101168 () Bool)

(assert (=> b!101168 (= e!65867 (not call!10476))))

(declare-fun b!101169 () Bool)

(assert (=> b!101169 (= e!65876 e!65871)))

(declare-fun res!50695 () Bool)

(assert (=> b!101169 (= res!50695 call!10477)))

(assert (=> b!101169 (=> (not res!50695) (not e!65871))))

(assert (= (and d!27447 c!17396) b!101167))

(assert (= (and d!27447 (not c!17396)) b!101156))

(assert (= (and b!101156 c!17393) b!101162))

(assert (= (and b!101156 (not c!17393)) b!101163))

(assert (= (and b!101163 c!17394) b!101166))

(assert (= (and b!101163 (not c!17394)) b!101164))

(assert (= (or b!101166 b!101164) bm!10478))

(assert (= (or b!101162 bm!10478) bm!10475))

(assert (= (or b!101162 b!101166) bm!10474))

(assert (= (or b!101167 bm!10475) bm!10473))

(assert (= (or b!101167 bm!10474) bm!10476))

(assert (= (and d!27447 res!50687) b!101151))

(assert (= (and d!27447 c!17397) b!101154))

(assert (= (and d!27447 (not c!17397)) b!101160))

(assert (= (and d!27447 res!50692) b!101157))

(assert (= (and b!101157 res!50694) b!101161))

(assert (= (and b!101157 (not res!50690)) b!101153))

(assert (= (and b!101153 res!50689) b!101152))

(assert (= (and b!101157 res!50691) b!101150))

(assert (= (and b!101150 c!17398) b!101158))

(assert (= (and b!101150 (not c!17398)) b!101168))

(assert (= (and b!101158 res!50693) b!101155))

(assert (= (or b!101158 b!101168) bm!10477))

(assert (= (and b!101150 res!50688) b!101149))

(assert (= (and b!101149 c!17395) b!101169))

(assert (= (and b!101149 (not c!17395)) b!101165))

(assert (= (and b!101169 res!50695) b!101159))

(assert (= (or b!101169 b!101165) bm!10479))

(declare-fun b_lambda!4529 () Bool)

(assert (=> (not b_lambda!4529) (not b!101152)))

(assert (=> b!101152 t!5589))

(declare-fun b_and!6227 () Bool)

(assert (= b_and!6223 (and (=> t!5589 result!3331) b_and!6227)))

(assert (=> b!101152 t!5591))

(declare-fun b_and!6229 () Bool)

(assert (= b_and!6225 (and (=> t!5591 result!3333) b_and!6229)))

(declare-fun m!112077 () Bool)

(assert (=> bm!10476 m!112077))

(declare-fun m!112079 () Bool)

(assert (=> b!101154 m!112079))

(declare-fun m!112081 () Bool)

(assert (=> b!101154 m!112081))

(declare-fun m!112083 () Bool)

(assert (=> b!101154 m!112083))

(declare-fun m!112085 () Bool)

(assert (=> b!101154 m!112085))

(declare-fun m!112087 () Bool)

(assert (=> b!101154 m!112087))

(declare-fun m!112089 () Bool)

(assert (=> b!101154 m!112089))

(declare-fun m!112091 () Bool)

(assert (=> b!101154 m!112091))

(assert (=> b!101154 m!112089))

(declare-fun m!112093 () Bool)

(assert (=> b!101154 m!112093))

(assert (=> b!101154 m!111877))

(declare-fun m!112095 () Bool)

(assert (=> b!101154 m!112095))

(declare-fun m!112097 () Bool)

(assert (=> b!101154 m!112097))

(declare-fun m!112099 () Bool)

(assert (=> b!101154 m!112099))

(declare-fun m!112101 () Bool)

(assert (=> b!101154 m!112101))

(assert (=> b!101154 m!112095))

(declare-fun m!112103 () Bool)

(assert (=> b!101154 m!112103))

(assert (=> b!101154 m!112097))

(declare-fun m!112105 () Bool)

(assert (=> b!101154 m!112105))

(declare-fun m!112107 () Bool)

(assert (=> b!101154 m!112107))

(declare-fun m!112109 () Bool)

(assert (=> b!101154 m!112109))

(assert (=> b!101154 m!112105))

(assert (=> b!101152 m!111877))

(declare-fun m!112111 () Bool)

(assert (=> b!101152 m!112111))

(declare-fun m!112113 () Bool)

(assert (=> b!101152 m!112113))

(assert (=> b!101152 m!111985))

(declare-fun m!112115 () Bool)

(assert (=> b!101152 m!112115))

(assert (=> b!101152 m!111985))

(assert (=> b!101152 m!112113))

(assert (=> b!101152 m!111877))

(assert (=> b!101161 m!111877))

(assert (=> b!101161 m!111877))

(assert (=> b!101161 m!111925))

(assert (=> b!101153 m!111877))

(assert (=> b!101153 m!111877))

(declare-fun m!112117 () Bool)

(assert (=> b!101153 m!112117))

(declare-fun m!112119 () Bool)

(assert (=> bm!10479 m!112119))

(assert (=> bm!10473 m!112083))

(assert (=> d!27447 m!111909))

(declare-fun m!112121 () Bool)

(assert (=> b!101159 m!112121))

(declare-fun m!112123 () Bool)

(assert (=> bm!10477 m!112123))

(declare-fun m!112125 () Bool)

(assert (=> b!101155 m!112125))

(assert (=> b!101151 m!111877))

(assert (=> b!101151 m!111877))

(assert (=> b!101151 m!111925))

(declare-fun m!112127 () Bool)

(assert (=> b!101167 m!112127))

(assert (=> bm!10412 d!27447))

(declare-fun d!27449 () Bool)

(assert (=> d!27449 (= (apply!94 lt!51119 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1298 (getValueByKey!152 (toList!787 lt!51119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!4191 () Bool)

(assert (= bs!4191 d!27449))

(declare-fun m!112129 () Bool)

(assert (=> bs!4191 m!112129))

(assert (=> bs!4191 m!112129))

(declare-fun m!112131 () Bool)

(assert (=> bs!4191 m!112131))

(assert (=> b!100991 d!27449))

(declare-fun call!10485 () ListLongMap!1543)

(declare-fun bm!10480 () Bool)

(assert (=> bm!10480 (= call!10485 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun bm!10481 () Bool)

(declare-fun call!10489 () ListLongMap!1543)

(declare-fun call!10487 () ListLongMap!1543)

(assert (=> bm!10481 (= call!10489 call!10487)))

(declare-fun bm!10482 () Bool)

(declare-fun call!10486 () ListLongMap!1543)

(assert (=> bm!10482 (= call!10486 call!10485)))

(declare-fun c!17402 () Bool)

(declare-fun c!17399 () Bool)

(declare-fun call!10488 () ListLongMap!1543)

(declare-fun bm!10483 () Bool)

(assert (=> bm!10483 (= call!10487 (+!137 (ite c!17402 call!10485 (ite c!17399 call!10486 call!10488)) (ite (or c!17402 c!17399) (tuple2!2357 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16))) (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 newMap!16)))))))

(declare-fun b!101171 () Bool)

(declare-fun res!50697 () Bool)

(declare-fun e!65885 () Bool)

(assert (=> b!101171 (=> (not res!50697) (not e!65885))))

(declare-fun e!65880 () Bool)

(assert (=> b!101171 (= res!50697 e!65880)))

(declare-fun c!17404 () Bool)

(assert (=> b!101171 (= c!17404 (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!101172 () Bool)

(declare-fun e!65890 () Bool)

(assert (=> b!101172 (= e!65890 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101173 () Bool)

(declare-fun e!65881 () Bool)

(declare-fun lt!51250 () ListLongMap!1543)

(assert (=> b!101173 (= e!65881 (= (apply!94 lt!51250 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)) (get!1294 (select (arr!2028 (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!372 (defaultEntry!2523 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!101173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2280 (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))))))))

(assert (=> b!101173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101174 () Bool)

(declare-fun e!65882 () Bool)

(assert (=> b!101174 (= e!65882 e!65881)))

(declare-fun res!50698 () Bool)

(assert (=> b!101174 (=> (not res!50698) (not e!65881))))

(assert (=> b!101174 (= res!50698 (contains!808 lt!51250 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!101174 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101175 () Bool)

(declare-fun e!65879 () Unit!3060)

(declare-fun lt!51248 () Unit!3060)

(assert (=> b!101175 (= e!65879 lt!51248)))

(declare-fun lt!51245 () ListLongMap!1543)

(assert (=> b!101175 (= lt!51245 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51236 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51239 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51239 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51257 () Unit!3060)

(assert (=> b!101175 (= lt!51257 (addStillContains!70 lt!51245 lt!51236 (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) lt!51239))))

(assert (=> b!101175 (contains!808 (+!137 lt!51245 (tuple2!2357 lt!51236 (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)))) lt!51239)))

(declare-fun lt!51249 () Unit!3060)

(assert (=> b!101175 (= lt!51249 lt!51257)))

(declare-fun lt!51247 () ListLongMap!1543)

(assert (=> b!101175 (= lt!51247 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51242 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51242 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51255 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51255 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51252 () Unit!3060)

(assert (=> b!101175 (= lt!51252 (addApplyDifferent!70 lt!51247 lt!51242 (minValue!2402 newMap!16) lt!51255))))

(assert (=> b!101175 (= (apply!94 (+!137 lt!51247 (tuple2!2357 lt!51242 (minValue!2402 newMap!16))) lt!51255) (apply!94 lt!51247 lt!51255))))

(declare-fun lt!51246 () Unit!3060)

(assert (=> b!101175 (= lt!51246 lt!51252)))

(declare-fun lt!51237 () ListLongMap!1543)

(assert (=> b!101175 (= lt!51237 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51253 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51253 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51240 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51240 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51238 () Unit!3060)

(assert (=> b!101175 (= lt!51238 (addApplyDifferent!70 lt!51237 lt!51253 (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) lt!51240))))

(assert (=> b!101175 (= (apply!94 (+!137 lt!51237 (tuple2!2357 lt!51253 (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)))) lt!51240) (apply!94 lt!51237 lt!51240))))

(declare-fun lt!51244 () Unit!3060)

(assert (=> b!101175 (= lt!51244 lt!51238)))

(declare-fun lt!51256 () ListLongMap!1543)

(assert (=> b!101175 (= lt!51256 (getCurrentListMapNoExtraKeys!102 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51251 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!51243 () (_ BitVec 64))

(assert (=> b!101175 (= lt!51243 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!101175 (= lt!51248 (addApplyDifferent!70 lt!51256 lt!51251 (minValue!2402 newMap!16) lt!51243))))

(assert (=> b!101175 (= (apply!94 (+!137 lt!51256 (tuple2!2357 lt!51251 (minValue!2402 newMap!16))) lt!51243) (apply!94 lt!51256 lt!51243))))

(declare-fun b!101176 () Bool)

(declare-fun e!65886 () Bool)

(assert (=> b!101176 (= e!65886 (= (apply!94 lt!51250 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16))))))

(declare-fun b!101170 () Bool)

(declare-fun e!65889 () Bool)

(assert (=> b!101170 (= e!65885 e!65889)))

(declare-fun c!17401 () Bool)

(assert (=> b!101170 (= c!17401 (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!27451 () Bool)

(assert (=> d!27451 e!65885))

(declare-fun res!50701 () Bool)

(assert (=> d!27451 (=> (not res!50701) (not e!65885))))

(assert (=> d!27451 (= res!50701 (or (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))))

(declare-fun lt!51241 () ListLongMap!1543)

(assert (=> d!27451 (= lt!51250 lt!51241)))

(declare-fun lt!51254 () Unit!3060)

(assert (=> d!27451 (= lt!51254 e!65879)))

(declare-fun c!17403 () Bool)

(assert (=> d!27451 (= c!17403 e!65890)))

(declare-fun res!50696 () Bool)

(assert (=> d!27451 (=> (not res!50696) (not e!65890))))

(assert (=> d!27451 (= res!50696 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun e!65883 () ListLongMap!1543)

(assert (=> d!27451 (= lt!51241 e!65883)))

(assert (=> d!27451 (= c!17402 (and (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!27451 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27451 (= (getCurrentListMap!478 (_keys!4221 newMap!16) (ite (or c!17328 c!17334) (_values!2506 newMap!16) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (index!3166 lt!51042) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16)))) (mask!6640 newMap!16) (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) (ite (and c!17328 c!17327) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2402 newMap!16)) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) lt!51250)))

(declare-fun b!101177 () Bool)

(declare-fun e!65878 () ListLongMap!1543)

(assert (=> b!101177 (= e!65883 e!65878)))

(assert (=> b!101177 (= c!17399 (and (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!101178 () Bool)

(declare-fun res!50700 () Bool)

(assert (=> b!101178 (=> (not res!50700) (not e!65885))))

(assert (=> b!101178 (= res!50700 e!65882)))

(declare-fun res!50699 () Bool)

(assert (=> b!101178 (=> res!50699 e!65882)))

(declare-fun e!65888 () Bool)

(assert (=> b!101178 (= res!50699 (not e!65888))))

(declare-fun res!50703 () Bool)

(assert (=> b!101178 (=> (not res!50703) (not e!65888))))

(assert (=> b!101178 (= res!50703 (bvslt #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(declare-fun bm!10484 () Bool)

(declare-fun call!10483 () Bool)

(assert (=> bm!10484 (= call!10483 (contains!808 lt!51250 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101179 () Bool)

(assert (=> b!101179 (= e!65880 e!65886)))

(declare-fun res!50702 () Bool)

(assert (=> b!101179 (= res!50702 call!10483)))

(assert (=> b!101179 (=> (not res!50702) (not e!65886))))

(declare-fun bm!10485 () Bool)

(assert (=> bm!10485 (= call!10488 call!10486)))

(declare-fun b!101180 () Bool)

(declare-fun e!65884 () Bool)

(assert (=> b!101180 (= e!65884 (= (apply!94 lt!51250 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2402 newMap!16)))))

(declare-fun b!101181 () Bool)

(declare-fun Unit!3076 () Unit!3060)

(assert (=> b!101181 (= e!65879 Unit!3076)))

(declare-fun b!101182 () Bool)

(assert (=> b!101182 (= e!65888 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101183 () Bool)

(assert (=> b!101183 (= e!65878 call!10489)))

(declare-fun c!17400 () Bool)

(declare-fun b!101184 () Bool)

(assert (=> b!101184 (= c!17400 (and (not (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!17328 c!17327) lt!51052 (extraKeys!2336 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!65887 () ListLongMap!1543)

(assert (=> b!101184 (= e!65878 e!65887)))

(declare-fun b!101185 () Bool)

(assert (=> b!101185 (= e!65887 call!10488)))

(declare-fun b!101186 () Bool)

(declare-fun call!10484 () Bool)

(assert (=> b!101186 (= e!65889 (not call!10484))))

(declare-fun b!101187 () Bool)

(assert (=> b!101187 (= e!65887 call!10489)))

(declare-fun bm!10486 () Bool)

(assert (=> bm!10486 (= call!10484 (contains!808 lt!51250 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101188 () Bool)

(assert (=> b!101188 (= e!65883 (+!137 call!10487 (tuple2!2357 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2402 newMap!16))))))

(declare-fun b!101189 () Bool)

(assert (=> b!101189 (= e!65880 (not call!10483))))

(declare-fun b!101190 () Bool)

(assert (=> b!101190 (= e!65889 e!65884)))

(declare-fun res!50704 () Bool)

(assert (=> b!101190 (= res!50704 call!10484)))

(assert (=> b!101190 (=> (not res!50704) (not e!65884))))

(assert (= (and d!27451 c!17402) b!101188))

(assert (= (and d!27451 (not c!17402)) b!101177))

(assert (= (and b!101177 c!17399) b!101183))

(assert (= (and b!101177 (not c!17399)) b!101184))

(assert (= (and b!101184 c!17400) b!101187))

(assert (= (and b!101184 (not c!17400)) b!101185))

(assert (= (or b!101187 b!101185) bm!10485))

(assert (= (or b!101183 bm!10485) bm!10482))

(assert (= (or b!101183 b!101187) bm!10481))

(assert (= (or b!101188 bm!10482) bm!10480))

(assert (= (or b!101188 bm!10481) bm!10483))

(assert (= (and d!27451 res!50696) b!101172))

(assert (= (and d!27451 c!17403) b!101175))

(assert (= (and d!27451 (not c!17403)) b!101181))

(assert (= (and d!27451 res!50701) b!101178))

(assert (= (and b!101178 res!50703) b!101182))

(assert (= (and b!101178 (not res!50699)) b!101174))

(assert (= (and b!101174 res!50698) b!101173))

(assert (= (and b!101178 res!50700) b!101171))

(assert (= (and b!101171 c!17404) b!101179))

(assert (= (and b!101171 (not c!17404)) b!101189))

(assert (= (and b!101179 res!50702) b!101176))

(assert (= (or b!101179 b!101189) bm!10484))

(assert (= (and b!101171 res!50697) b!101170))

(assert (= (and b!101170 c!17401) b!101190))

(assert (= (and b!101170 (not c!17401)) b!101186))

(assert (= (and b!101190 res!50704) b!101180))

(assert (= (or b!101190 b!101186) bm!10486))

(declare-fun b_lambda!4531 () Bool)

(assert (=> (not b_lambda!4531) (not b!101173)))

(assert (=> b!101173 t!5589))

(declare-fun b_and!6231 () Bool)

(assert (= b_and!6227 (and (=> t!5589 result!3331) b_and!6231)))

(assert (=> b!101173 t!5591))

(declare-fun b_and!6233 () Bool)

(assert (= b_and!6229 (and (=> t!5591 result!3333) b_and!6233)))

(declare-fun m!112133 () Bool)

(assert (=> bm!10483 m!112133))

(declare-fun m!112135 () Bool)

(assert (=> b!101175 m!112135))

(declare-fun m!112137 () Bool)

(assert (=> b!101175 m!112137))

(declare-fun m!112139 () Bool)

(assert (=> b!101175 m!112139))

(declare-fun m!112141 () Bool)

(assert (=> b!101175 m!112141))

(declare-fun m!112143 () Bool)

(assert (=> b!101175 m!112143))

(declare-fun m!112145 () Bool)

(assert (=> b!101175 m!112145))

(declare-fun m!112147 () Bool)

(assert (=> b!101175 m!112147))

(assert (=> b!101175 m!112145))

(declare-fun m!112149 () Bool)

(assert (=> b!101175 m!112149))

(assert (=> b!101175 m!111877))

(declare-fun m!112151 () Bool)

(assert (=> b!101175 m!112151))

(declare-fun m!112153 () Bool)

(assert (=> b!101175 m!112153))

(declare-fun m!112155 () Bool)

(assert (=> b!101175 m!112155))

(declare-fun m!112157 () Bool)

(assert (=> b!101175 m!112157))

(assert (=> b!101175 m!112151))

(declare-fun m!112159 () Bool)

(assert (=> b!101175 m!112159))

(assert (=> b!101175 m!112153))

(declare-fun m!112161 () Bool)

(assert (=> b!101175 m!112161))

(declare-fun m!112163 () Bool)

(assert (=> b!101175 m!112163))

(declare-fun m!112165 () Bool)

(assert (=> b!101175 m!112165))

(assert (=> b!101175 m!112161))

(assert (=> b!101173 m!111877))

(declare-fun m!112167 () Bool)

(assert (=> b!101173 m!112167))

(declare-fun m!112169 () Bool)

(assert (=> b!101173 m!112169))

(assert (=> b!101173 m!111985))

(declare-fun m!112171 () Bool)

(assert (=> b!101173 m!112171))

(assert (=> b!101173 m!111985))

(assert (=> b!101173 m!112169))

(assert (=> b!101173 m!111877))

(assert (=> b!101182 m!111877))

(assert (=> b!101182 m!111877))

(assert (=> b!101182 m!111925))

(assert (=> b!101174 m!111877))

(assert (=> b!101174 m!111877))

(declare-fun m!112173 () Bool)

(assert (=> b!101174 m!112173))

(declare-fun m!112175 () Bool)

(assert (=> bm!10486 m!112175))

(assert (=> bm!10480 m!112139))

(assert (=> d!27451 m!111909))

(declare-fun m!112177 () Bool)

(assert (=> b!101180 m!112177))

(declare-fun m!112179 () Bool)

(assert (=> bm!10484 m!112179))

(declare-fun m!112181 () Bool)

(assert (=> b!101176 m!112181))

(assert (=> b!101172 m!111877))

(assert (=> b!101172 m!111877))

(assert (=> b!101172 m!111925))

(declare-fun m!112183 () Bool)

(assert (=> b!101188 m!112183))

(assert (=> bm!10418 d!27451))

(assert (=> b!100993 d!27409))

(assert (=> d!27365 d!27377))

(declare-fun d!27453 () Bool)

(declare-fun e!65892 () Bool)

(assert (=> d!27453 e!65892))

(declare-fun res!50705 () Bool)

(assert (=> d!27453 (=> res!50705 e!65892)))

(declare-fun lt!51260 () Bool)

(assert (=> d!27453 (= res!50705 (not lt!51260))))

(declare-fun lt!51259 () Bool)

(assert (=> d!27453 (= lt!51260 lt!51259)))

(declare-fun lt!51258 () Unit!3060)

(declare-fun e!65891 () Unit!3060)

(assert (=> d!27453 (= lt!51258 e!65891)))

(declare-fun c!17405 () Bool)

(assert (=> d!27453 (= c!17405 lt!51259)))

(assert (=> d!27453 (= lt!51259 (containsKey!156 (toList!787 e!65705) (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042)))))))

(assert (=> d!27453 (= (contains!808 e!65705 (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042)))) lt!51260)))

(declare-fun b!101191 () Bool)

(declare-fun lt!51261 () Unit!3060)

(assert (=> b!101191 (= e!65891 lt!51261)))

(assert (=> b!101191 (= lt!51261 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 e!65705) (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042)))))))

(assert (=> b!101191 (isDefined!105 (getValueByKey!152 (toList!787 e!65705) (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042)))))))

(declare-fun b!101192 () Bool)

(declare-fun Unit!3077 () Unit!3060)

(assert (=> b!101192 (= e!65891 Unit!3077)))

(declare-fun b!101193 () Bool)

(assert (=> b!101193 (= e!65892 (isDefined!105 (getValueByKey!152 (toList!787 e!65705) (ite c!17334 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51042))))))))

(assert (= (and d!27453 c!17405) b!101191))

(assert (= (and d!27453 (not c!17405)) b!101192))

(assert (= (and d!27453 (not res!50705)) b!101193))

(declare-fun m!112185 () Bool)

(assert (=> d!27453 m!112185))

(declare-fun m!112187 () Bool)

(assert (=> b!101191 m!112187))

(declare-fun m!112189 () Bool)

(assert (=> b!101191 m!112189))

(assert (=> b!101191 m!112189))

(declare-fun m!112191 () Bool)

(assert (=> b!101191 m!112191))

(assert (=> b!101193 m!112189))

(assert (=> b!101193 m!112189))

(assert (=> b!101193 m!112191))

(assert (=> bm!10417 d!27453))

(declare-fun b!101206 () Bool)

(declare-fun e!65899 () SeekEntryResult!255)

(declare-fun e!65901 () SeekEntryResult!255)

(assert (=> b!101206 (= e!65899 e!65901)))

(declare-fun lt!51269 () (_ BitVec 64))

(declare-fun lt!51268 () SeekEntryResult!255)

(assert (=> b!101206 (= lt!51269 (select (arr!2027 (_keys!4221 newMap!16)) (index!3167 lt!51268)))))

(declare-fun c!17414 () Bool)

(assert (=> b!101206 (= c!17414 (= lt!51269 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101207 () Bool)

(declare-fun e!65900 () SeekEntryResult!255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4269 (_ BitVec 32)) SeekEntryResult!255)

(assert (=> b!101207 (= e!65900 (seekKeyOrZeroReturnVacant!0 (x!13249 lt!51268) (index!3167 lt!51268) (index!3167 lt!51268) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun b!101208 () Bool)

(assert (=> b!101208 (= e!65899 Undefined!255)))

(declare-fun lt!51270 () SeekEntryResult!255)

(declare-fun d!27455 () Bool)

(assert (=> d!27455 (and (or ((_ is Undefined!255) lt!51270) (not ((_ is Found!255) lt!51270)) (and (bvsge (index!3166 lt!51270) #b00000000000000000000000000000000) (bvslt (index!3166 lt!51270) (size!2279 (_keys!4221 newMap!16))))) (or ((_ is Undefined!255) lt!51270) ((_ is Found!255) lt!51270) (not ((_ is MissingZero!255) lt!51270)) (and (bvsge (index!3165 lt!51270) #b00000000000000000000000000000000) (bvslt (index!3165 lt!51270) (size!2279 (_keys!4221 newMap!16))))) (or ((_ is Undefined!255) lt!51270) ((_ is Found!255) lt!51270) ((_ is MissingZero!255) lt!51270) (not ((_ is MissingVacant!255) lt!51270)) (and (bvsge (index!3168 lt!51270) #b00000000000000000000000000000000) (bvslt (index!3168 lt!51270) (size!2279 (_keys!4221 newMap!16))))) (or ((_ is Undefined!255) lt!51270) (ite ((_ is Found!255) lt!51270) (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51270)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (ite ((_ is MissingZero!255) lt!51270) (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3165 lt!51270)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!255) lt!51270) (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3168 lt!51270)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27455 (= lt!51270 e!65899)))

(declare-fun c!17412 () Bool)

(assert (=> d!27455 (= c!17412 (and ((_ is Intermediate!255) lt!51268) (undefined!1067 lt!51268)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4269 (_ BitVec 32)) SeekEntryResult!255)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!27455 (= lt!51268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (mask!6640 newMap!16)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(assert (=> d!27455 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27455 (= (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)) lt!51270)))

(declare-fun b!101209 () Bool)

(assert (=> b!101209 (= e!65900 (MissingZero!255 (index!3167 lt!51268)))))

(declare-fun b!101210 () Bool)

(assert (=> b!101210 (= e!65901 (Found!255 (index!3167 lt!51268)))))

(declare-fun b!101211 () Bool)

(declare-fun c!17413 () Bool)

(assert (=> b!101211 (= c!17413 (= lt!51269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101211 (= e!65901 e!65900)))

(assert (= (and d!27455 c!17412) b!101208))

(assert (= (and d!27455 (not c!17412)) b!101206))

(assert (= (and b!101206 c!17414) b!101210))

(assert (= (and b!101206 (not c!17414)) b!101211))

(assert (= (and b!101211 c!17413) b!101209))

(assert (= (and b!101211 (not c!17413)) b!101207))

(declare-fun m!112193 () Bool)

(assert (=> b!101206 m!112193))

(assert (=> b!101207 m!111627))

(declare-fun m!112195 () Bool)

(assert (=> b!101207 m!112195))

(assert (=> d!27455 m!111627))

(declare-fun m!112197 () Bool)

(assert (=> d!27455 m!112197))

(assert (=> d!27455 m!112197))

(assert (=> d!27455 m!111627))

(declare-fun m!112199 () Bool)

(assert (=> d!27455 m!112199))

(declare-fun m!112201 () Bool)

(assert (=> d!27455 m!112201))

(declare-fun m!112203 () Bool)

(assert (=> d!27455 m!112203))

(declare-fun m!112205 () Bool)

(assert (=> d!27455 m!112205))

(assert (=> d!27455 m!111909))

(assert (=> bm!10432 d!27455))

(assert (=> b!100806 d!27433))

(assert (=> b!100806 d!27435))

(assert (=> bm!10426 d!27363))

(declare-fun d!27457 () Bool)

(assert (=> d!27457 (= (inRange!0 (ite c!17334 (ite c!17338 (index!3166 lt!51053) (ite c!17332 (index!3165 lt!51049) (index!3168 lt!51049))) (ite c!17330 (index!3166 lt!51056) (ite c!17325 (index!3165 lt!51043) (index!3168 lt!51043)))) (mask!6640 newMap!16)) (and (bvsge (ite c!17334 (ite c!17338 (index!3166 lt!51053) (ite c!17332 (index!3165 lt!51049) (index!3168 lt!51049))) (ite c!17330 (index!3166 lt!51056) (ite c!17325 (index!3165 lt!51043) (index!3168 lt!51043)))) #b00000000000000000000000000000000) (bvslt (ite c!17334 (ite c!17338 (index!3166 lt!51053) (ite c!17332 (index!3165 lt!51049) (index!3168 lt!51049))) (ite c!17330 (index!3166 lt!51056) (ite c!17325 (index!3165 lt!51043) (index!3168 lt!51043)))) (bvadd (mask!6640 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!10434 d!27457))

(declare-fun b!101236 () Bool)

(declare-fun res!50714 () Bool)

(declare-fun e!65918 () Bool)

(assert (=> b!101236 (=> (not res!50714) (not e!65918))))

(declare-fun lt!51285 () ListLongMap!1543)

(assert (=> b!101236 (= res!50714 (not (contains!808 lt!51285 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!65917 () Bool)

(declare-fun b!101237 () Bool)

(assert (=> b!101237 (= e!65917 (= lt!51285 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun bm!10489 () Bool)

(declare-fun call!10492 () ListLongMap!1543)

(assert (=> bm!10489 (= call!10492 (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!101238 () Bool)

(assert (=> b!101238 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> b!101238 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2280 (_values!2506 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun e!65920 () Bool)

(assert (=> b!101238 (= e!65920 (= (apply!94 lt!51285 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!101239 () Bool)

(declare-fun e!65922 () ListLongMap!1543)

(assert (=> b!101239 (= e!65922 (ListLongMap!1544 Nil!1583))))

(declare-fun b!101240 () Bool)

(declare-fun e!65919 () Bool)

(assert (=> b!101240 (= e!65918 e!65919)))

(declare-fun c!17426 () Bool)

(declare-fun e!65916 () Bool)

(assert (=> b!101240 (= c!17426 e!65916)))

(declare-fun res!50715 () Bool)

(assert (=> b!101240 (=> (not res!50715) (not e!65916))))

(assert (=> b!101240 (= res!50715 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!101241 () Bool)

(declare-fun e!65921 () ListLongMap!1543)

(assert (=> b!101241 (= e!65922 e!65921)))

(declare-fun c!17425 () Bool)

(assert (=> b!101241 (= c!17425 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!101242 () Bool)

(assert (=> b!101242 (= e!65921 call!10492)))

(declare-fun b!101243 () Bool)

(declare-fun lt!51290 () Unit!3060)

(declare-fun lt!51287 () Unit!3060)

(assert (=> b!101243 (= lt!51290 lt!51287)))

(declare-fun lt!51289 () V!3171)

(declare-fun lt!51288 () ListLongMap!1543)

(declare-fun lt!51291 () (_ BitVec 64))

(declare-fun lt!51286 () (_ BitVec 64))

(assert (=> b!101243 (not (contains!808 (+!137 lt!51288 (tuple2!2357 lt!51291 lt!51289)) lt!51286))))

(declare-fun addStillNotContains!42 (ListLongMap!1543 (_ BitVec 64) V!3171 (_ BitVec 64)) Unit!3060)

(assert (=> b!101243 (= lt!51287 (addStillNotContains!42 lt!51288 lt!51291 lt!51289 lt!51286))))

(assert (=> b!101243 (= lt!51286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!101243 (= lt!51289 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!101243 (= lt!51291 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!101243 (= lt!51288 call!10492)))

(assert (=> b!101243 (= e!65921 (+!137 call!10492 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!101244 () Bool)

(declare-fun isEmpty!363 (ListLongMap!1543) Bool)

(assert (=> b!101244 (= e!65917 (isEmpty!363 lt!51285))))

(declare-fun b!101245 () Bool)

(assert (=> b!101245 (= e!65919 e!65920)))

(assert (=> b!101245 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun res!50716 () Bool)

(assert (=> b!101245 (= res!50716 (contains!808 lt!51285 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101245 (=> (not res!50716) (not e!65920))))

(declare-fun b!101246 () Bool)

(assert (=> b!101246 (= e!65916 (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!101246 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun d!27459 () Bool)

(assert (=> d!27459 e!65918))

(declare-fun res!50717 () Bool)

(assert (=> d!27459 (=> (not res!50717) (not e!65918))))

(assert (=> d!27459 (= res!50717 (not (contains!808 lt!51285 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!27459 (= lt!51285 e!65922)))

(declare-fun c!17424 () Bool)

(assert (=> d!27459 (= c!17424 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (=> d!27459 (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992))))))

(assert (=> d!27459 (= (getCurrentListMapNoExtraKeys!102 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (_values!2506 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992))) (extraKeys!2336 (v!2832 (underlying!343 thiss!992))) (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) (minValue!2402 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992)))) lt!51285)))

(declare-fun b!101247 () Bool)

(assert (=> b!101247 (= e!65919 e!65917)))

(declare-fun c!17423 () Bool)

(assert (=> b!101247 (= c!17423 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27459 c!17424) b!101239))

(assert (= (and d!27459 (not c!17424)) b!101241))

(assert (= (and b!101241 c!17425) b!101243))

(assert (= (and b!101241 (not c!17425)) b!101242))

(assert (= (or b!101243 b!101242) bm!10489))

(assert (= (and d!27459 res!50717) b!101236))

(assert (= (and b!101236 res!50714) b!101240))

(assert (= (and b!101240 res!50715) b!101246))

(assert (= (and b!101240 c!17426) b!101245))

(assert (= (and b!101240 (not c!17426)) b!101247))

(assert (= (and b!101245 res!50716) b!101238))

(assert (= (and b!101247 c!17423) b!101237))

(assert (= (and b!101247 (not c!17423)) b!101244))

(declare-fun b_lambda!4533 () Bool)

(assert (=> (not b_lambda!4533) (not b!101238)))

(assert (=> b!101238 t!5577))

(declare-fun b_and!6235 () Bool)

(assert (= b_and!6231 (and (=> t!5577 result!3317) b_and!6235)))

(assert (=> b!101238 t!5579))

(declare-fun b_and!6237 () Bool)

(assert (= b_and!6233 (and (=> t!5579 result!3321) b_and!6237)))

(declare-fun b_lambda!4535 () Bool)

(assert (=> (not b_lambda!4535) (not b!101243)))

(assert (=> b!101243 t!5577))

(declare-fun b_and!6239 () Bool)

(assert (= b_and!6235 (and (=> t!5577 result!3317) b_and!6239)))

(assert (=> b!101243 t!5579))

(declare-fun b_and!6241 () Bool)

(assert (= b_and!6237 (and (=> t!5579 result!3321) b_and!6241)))

(declare-fun m!112207 () Bool)

(assert (=> d!27459 m!112207))

(assert (=> d!27459 m!111655))

(assert (=> b!101238 m!111659))

(assert (=> b!101238 m!111819))

(declare-fun m!112209 () Bool)

(assert (=> b!101238 m!112209))

(assert (=> b!101238 m!111839))

(assert (=> b!101238 m!111659))

(assert (=> b!101238 m!111841))

(assert (=> b!101238 m!111839))

(assert (=> b!101238 m!111819))

(declare-fun m!112211 () Bool)

(assert (=> b!101236 m!112211))

(declare-fun m!112213 () Bool)

(assert (=> b!101243 m!112213))

(declare-fun m!112215 () Bool)

(assert (=> b!101243 m!112215))

(assert (=> b!101243 m!111659))

(declare-fun m!112217 () Bool)

(assert (=> b!101243 m!112217))

(declare-fun m!112219 () Bool)

(assert (=> b!101243 m!112219))

(assert (=> b!101243 m!112217))

(assert (=> b!101243 m!111839))

(assert (=> b!101243 m!111659))

(assert (=> b!101243 m!111841))

(assert (=> b!101243 m!111839))

(assert (=> b!101243 m!111819))

(assert (=> b!101241 m!111819))

(assert (=> b!101241 m!111819))

(assert (=> b!101241 m!111843))

(assert (=> b!101245 m!111819))

(assert (=> b!101245 m!111819))

(declare-fun m!112221 () Bool)

(assert (=> b!101245 m!112221))

(declare-fun m!112223 () Bool)

(assert (=> bm!10489 m!112223))

(assert (=> b!101237 m!112223))

(assert (=> b!101246 m!111819))

(assert (=> b!101246 m!111819))

(assert (=> b!101246 m!111843))

(declare-fun m!112225 () Bool)

(assert (=> b!101244 m!112225))

(assert (=> bm!10450 d!27459))

(declare-fun call!10501 () Bool)

(declare-fun c!17437 () Bool)

(declare-fun bm!10498 () Bool)

(declare-fun lt!51360 () SeekEntryResult!255)

(declare-fun c!17438 () Bool)

(declare-fun lt!51373 () SeekEntryResult!255)

(assert (=> bm!10498 (= call!10501 (inRange!0 (ite c!17438 (index!3166 lt!51360) (ite c!17437 (index!3165 lt!51373) (index!3168 lt!51373))) (mask!6640 newMap!16)))))

(declare-fun b!101283 () Bool)

(declare-fun e!65944 () Unit!3060)

(declare-fun Unit!3078 () Unit!3060)

(assert (=> b!101283 (= e!65944 Unit!3078)))

(declare-fun lt!51380 () Unit!3060)

(assert (=> b!101283 (= lt!51380 (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(declare-fun call!10503 () SeekEntryResult!255)

(assert (=> b!101283 (= lt!51360 call!10503)))

(declare-fun res!50741 () Bool)

(assert (=> b!101283 (= res!50741 ((_ is Found!255) lt!51360))))

(declare-fun e!65943 () Bool)

(assert (=> b!101283 (=> (not res!50741) (not e!65943))))

(assert (=> b!101283 e!65943))

(declare-fun lt!51352 () Unit!3060)

(assert (=> b!101283 (= lt!51352 lt!51380)))

(assert (=> b!101283 false))

(declare-fun b!101284 () Bool)

(declare-fun e!65939 () Bool)

(declare-fun call!10504 () Bool)

(assert (=> b!101284 (= e!65939 (not call!10504))))

(declare-fun b!101285 () Bool)

(declare-fun res!50739 () Bool)

(declare-fun e!65941 () Bool)

(assert (=> b!101285 (=> (not res!50739) (not e!65941))))

(declare-fun lt!51371 () tuple2!2354)

(assert (=> b!101285 (= res!50739 (valid!391 (_2!1188 lt!51371)))))

(declare-fun b!101286 () Bool)

(declare-fun c!17435 () Bool)

(assert (=> b!101286 (= c!17435 ((_ is MissingVacant!255) lt!51373))))

(declare-fun e!65940 () Bool)

(declare-fun e!65945 () Bool)

(assert (=> b!101286 (= e!65940 e!65945)))

(declare-fun b!101287 () Bool)

(declare-fun lt!51375 () Unit!3060)

(assert (=> b!101287 (= e!65944 lt!51375)))

(assert (=> b!101287 (= lt!51375 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(assert (=> b!101287 (= lt!51373 call!10503)))

(assert (=> b!101287 (= c!17437 ((_ is MissingZero!255) lt!51373))))

(assert (=> b!101287 e!65940))

(declare-fun b!101288 () Bool)

(declare-fun res!50743 () Bool)

(assert (=> b!101288 (=> (not res!50743) (not e!65939))))

(assert (=> b!101288 (= res!50743 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3165 lt!51373)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101289 () Bool)

(assert (=> b!101289 (= e!65941 (= (map!1263 (_2!1188 lt!51371)) (+!137 (map!1263 newMap!16) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!101290 () Bool)

(declare-fun res!50738 () Bool)

(assert (=> b!101290 (= res!50738 call!10501)))

(assert (=> b!101290 (=> (not res!50738) (not e!65943))))

(declare-fun bm!10499 () Bool)

(declare-fun call!10502 () Bool)

(assert (=> bm!10499 (= call!10502 call!10501)))

(declare-fun b!101291 () Bool)

(declare-fun res!50744 () Bool)

(assert (=> b!101291 (=> (not res!50744) (not e!65941))))

(assert (=> b!101291 (= res!50744 (contains!808 (map!1263 (_2!1188 lt!51371)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101292 () Bool)

(declare-fun e!65942 () Bool)

(assert (=> b!101292 (= e!65942 (not call!10504))))

(declare-fun b!101293 () Bool)

(assert (=> b!101293 (= e!65945 ((_ is Undefined!255) lt!51373))))

(declare-fun bm!10500 () Bool)

(assert (=> bm!10500 (= call!10504 (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!101294 () Bool)

(assert (=> b!101294 (= e!65943 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51360)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun b!101295 () Bool)

(declare-fun e!65946 () Unit!3060)

(declare-fun Unit!3079 () Unit!3060)

(assert (=> b!101295 (= e!65946 Unit!3079)))

(declare-fun lt!51367 () Unit!3060)

(declare-fun lemmaArrayContainsKeyThenInListMap!27 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) (_ BitVec 32) Int) Unit!3060)

(assert (=> b!101295 (= lt!51367 (lemmaArrayContainsKeyThenInListMap!27 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(assert (=> b!101295 (contains!808 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355))))

(declare-fun lt!51365 () Unit!3060)

(assert (=> b!101295 (= lt!51365 lt!51367)))

(assert (=> b!101295 false))

(declare-fun d!27461 () Bool)

(assert (=> d!27461 e!65941))

(declare-fun res!50737 () Bool)

(assert (=> d!27461 (=> (not res!50737) (not e!65941))))

(assert (=> d!27461 (= res!50737 (_1!1188 lt!51371))))

(assert (=> d!27461 (= lt!51371 (tuple2!2355 true (LongMapFixedSize!865 (defaultEntry!2523 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (bvadd (_size!481 newMap!16) #b00000000000000000000000000000001) (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))) (_vacant!481 newMap!16))))))

(declare-fun lt!51379 () Unit!3060)

(declare-fun lt!51369 () Unit!3060)

(assert (=> d!27461 (= lt!51379 lt!51369)))

(declare-fun lt!51356 () array!4269)

(declare-fun lt!51358 () array!4271)

(assert (=> d!27461 (contains!808 (getCurrentListMap!478 lt!51356 lt!51358 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042))))))

(assert (=> d!27461 (= lt!51369 (lemmaValidKeyInArrayIsInListMap!104 lt!51356 lt!51358 (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27461 (= lt!51358 (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))))))

(assert (=> d!27461 (= lt!51356 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun lt!51368 () Unit!3060)

(declare-fun lt!51359 () Unit!3060)

(assert (=> d!27461 (= lt!51368 lt!51359)))

(declare-fun lt!51372 () array!4269)

(assert (=> d!27461 (= (arrayCountValidKeys!0 lt!51372 (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (bvadd (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4269 (_ BitVec 32)) Unit!3060)

(assert (=> d!27461 (= lt!51359 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!51372 (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042))))))

(assert (=> d!27461 (= lt!51372 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun lt!51362 () Unit!3060)

(declare-fun lt!51366 () Unit!3060)

(assert (=> d!27461 (= lt!51362 lt!51366)))

(declare-fun lt!51370 () array!4269)

(assert (=> d!27461 (arrayContainsKey!0 lt!51370 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!27461 (= lt!51366 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!51370 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042))))))

(assert (=> d!27461 (= lt!51370 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun lt!51374 () Unit!3060)

(declare-fun lt!51377 () Unit!3060)

(assert (=> d!27461 (= lt!51374 lt!51377)))

(assert (=> d!27461 (= (+!137 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!478 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))) (array!4272 (store (arr!2028 (_values!2506 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (ValueCellFull!978 (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2280 (_values!2506 newMap!16))) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!27 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 32) (_ BitVec 64) V!3171 Int) Unit!3060)

(assert (=> d!27461 (= lt!51377 (lemmaAddValidKeyToArrayThenAddPairToListMap!27 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2523 newMap!16)))))

(declare-fun lt!51378 () Unit!3060)

(declare-fun lt!51363 () Unit!3060)

(assert (=> d!27461 (= lt!51378 lt!51363)))

(assert (=> d!27461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))) (mask!6640 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4269 (_ BitVec 32) (_ BitVec 32)) Unit!3060)

(assert (=> d!27461 (= lt!51363 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (mask!6640 newMap!16)))))

(declare-fun lt!51355 () Unit!3060)

(declare-fun lt!51364 () Unit!3060)

(assert (=> d!27461 (= lt!51355 lt!51364)))

(assert (=> d!27461 (= (arrayCountValidKeys!0 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))) #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4221 newMap!16) #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4269 (_ BitVec 32) (_ BitVec 64)) Unit!3060)

(assert (=> d!27461 (= lt!51364 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4221 newMap!16) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(declare-fun lt!51354 () Unit!3060)

(declare-fun lt!51381 () Unit!3060)

(assert (=> d!27461 (= lt!51354 lt!51381)))

(declare-fun lt!51353 () (_ BitVec 32))

(declare-fun lt!51361 () List!1587)

(assert (=> d!27461 (arrayNoDuplicates!0 (array!4270 (store (arr!2027 (_keys!4221 newMap!16)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)) (size!2279 (_keys!4221 newMap!16))) lt!51353 lt!51361)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4269 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1587) Unit!3060)

(assert (=> d!27461 (= lt!51381 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042)) lt!51353 lt!51361))))

(assert (=> d!27461 (= lt!51361 Nil!1584)))

(assert (=> d!27461 (= lt!51353 #b00000000000000000000000000000000)))

(declare-fun lt!51376 () Unit!3060)

(assert (=> d!27461 (= lt!51376 e!65946)))

(declare-fun c!17436 () Bool)

(assert (=> d!27461 (= c!17436 (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!51357 () Unit!3060)

(assert (=> d!27461 (= lt!51357 e!65944)))

(assert (=> d!27461 (= c!17438 (contains!808 (getCurrentListMap!478 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2523 newMap!16)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27461 (valid!391 newMap!16)))

(assert (=> d!27461 (= (updateHelperNewKey!43 newMap!16 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!17331 (index!3168 lt!51042) (index!3165 lt!51042))) lt!51371)))

(declare-fun b!101282 () Bool)

(declare-fun Unit!3080 () Unit!3060)

(assert (=> b!101282 (= e!65946 Unit!3080)))

(declare-fun b!101296 () Bool)

(declare-fun res!50740 () Bool)

(assert (=> b!101296 (=> (not res!50740) (not e!65939))))

(assert (=> b!101296 (= res!50740 call!10502)))

(assert (=> b!101296 (= e!65940 e!65939)))

(declare-fun b!101297 () Bool)

(assert (=> b!101297 (= e!65945 e!65942)))

(declare-fun res!50736 () Bool)

(assert (=> b!101297 (= res!50736 call!10502)))

(assert (=> b!101297 (=> (not res!50736) (not e!65942))))

(declare-fun bm!10501 () Bool)

(assert (=> bm!10501 (= call!10503 (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun b!101298 () Bool)

(declare-fun res!50742 () Bool)

(assert (=> b!101298 (= res!50742 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3168 lt!51373)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101298 (=> (not res!50742) (not e!65942))))

(assert (= (and d!27461 c!17438) b!101283))

(assert (= (and d!27461 (not c!17438)) b!101287))

(assert (= (and b!101283 res!50741) b!101290))

(assert (= (and b!101290 res!50738) b!101294))

(assert (= (and b!101287 c!17437) b!101296))

(assert (= (and b!101287 (not c!17437)) b!101286))

(assert (= (and b!101296 res!50740) b!101288))

(assert (= (and b!101288 res!50743) b!101284))

(assert (= (and b!101286 c!17435) b!101297))

(assert (= (and b!101286 (not c!17435)) b!101293))

(assert (= (and b!101297 res!50736) b!101298))

(assert (= (and b!101298 res!50742) b!101292))

(assert (= (or b!101296 b!101297) bm!10499))

(assert (= (or b!101284 b!101292) bm!10500))

(assert (= (or b!101290 bm!10499) bm!10498))

(assert (= (or b!101283 b!101287) bm!10501))

(assert (= (and d!27461 c!17436) b!101295))

(assert (= (and d!27461 (not c!17436)) b!101282))

(assert (= (and d!27461 res!50737) b!101285))

(assert (= (and b!101285 res!50739) b!101291))

(assert (= (and b!101291 res!50744) b!101289))

(declare-fun m!112227 () Bool)

(assert (=> b!101285 m!112227))

(assert (=> bm!10501 m!111627))

(assert (=> bm!10501 m!111745))

(assert (=> b!101295 m!111627))

(declare-fun m!112229 () Bool)

(assert (=> b!101295 m!112229))

(assert (=> b!101295 m!111765))

(assert (=> b!101295 m!111765))

(assert (=> b!101295 m!111627))

(assert (=> b!101295 m!111767))

(declare-fun m!112231 () Bool)

(assert (=> b!101298 m!112231))

(declare-fun m!112233 () Bool)

(assert (=> b!101288 m!112233))

(assert (=> b!101287 m!111627))

(assert (=> b!101287 m!111741))

(declare-fun m!112235 () Bool)

(assert (=> b!101294 m!112235))

(declare-fun m!112237 () Bool)

(assert (=> bm!10498 m!112237))

(declare-fun m!112239 () Bool)

(assert (=> b!101289 m!112239))

(assert (=> b!101289 m!111651))

(assert (=> b!101289 m!111651))

(declare-fun m!112241 () Bool)

(assert (=> b!101289 m!112241))

(assert (=> b!101291 m!112239))

(assert (=> b!101291 m!112239))

(assert (=> b!101291 m!111627))

(declare-fun m!112243 () Bool)

(assert (=> b!101291 m!112243))

(assert (=> b!101283 m!111627))

(assert (=> b!101283 m!111771))

(assert (=> bm!10500 m!111627))

(assert (=> bm!10500 m!111755))

(declare-fun m!112245 () Bool)

(assert (=> d!27461 m!112245))

(declare-fun m!112247 () Bool)

(assert (=> d!27461 m!112247))

(declare-fun m!112249 () Bool)

(assert (=> d!27461 m!112249))

(assert (=> d!27461 m!111627))

(declare-fun m!112251 () Bool)

(assert (=> d!27461 m!112251))

(assert (=> d!27461 m!111627))

(assert (=> d!27461 m!111661))

(declare-fun m!112253 () Bool)

(assert (=> d!27461 m!112253))

(declare-fun m!112255 () Bool)

(assert (=> d!27461 m!112255))

(assert (=> d!27461 m!111627))

(declare-fun m!112257 () Bool)

(assert (=> d!27461 m!112257))

(assert (=> d!27461 m!111643))

(assert (=> d!27461 m!111765))

(declare-fun m!112259 () Bool)

(assert (=> d!27461 m!112259))

(declare-fun m!112261 () Bool)

(assert (=> d!27461 m!112261))

(declare-fun m!112263 () Bool)

(assert (=> d!27461 m!112263))

(declare-fun m!112265 () Bool)

(assert (=> d!27461 m!112265))

(assert (=> d!27461 m!112261))

(assert (=> d!27461 m!112259))

(declare-fun m!112267 () Bool)

(assert (=> d!27461 m!112267))

(assert (=> d!27461 m!111715))

(assert (=> d!27461 m!111627))

(declare-fun m!112269 () Bool)

(assert (=> d!27461 m!112269))

(assert (=> d!27461 m!111627))

(declare-fun m!112271 () Bool)

(assert (=> d!27461 m!112271))

(declare-fun m!112273 () Bool)

(assert (=> d!27461 m!112273))

(assert (=> d!27461 m!111765))

(assert (=> d!27461 m!111935))

(assert (=> d!27461 m!111765))

(assert (=> d!27461 m!111627))

(assert (=> d!27461 m!111767))

(declare-fun m!112275 () Bool)

(assert (=> d!27461 m!112275))

(assert (=> d!27461 m!111627))

(assert (=> d!27461 m!111755))

(declare-fun m!112277 () Bool)

(assert (=> d!27461 m!112277))

(assert (=> d!27461 m!111627))

(declare-fun m!112279 () Bool)

(assert (=> d!27461 m!112279))

(assert (=> bm!10420 d!27461))

(declare-fun d!27463 () Bool)

(declare-fun res!50745 () Bool)

(declare-fun e!65947 () Bool)

(assert (=> d!27463 (=> (not res!50745) (not e!65947))))

(assert (=> d!27463 (= res!50745 (simpleValid!70 (_2!1188 lt!51038)))))

(assert (=> d!27463 (= (valid!391 (_2!1188 lt!51038)) e!65947)))

(declare-fun b!101299 () Bool)

(declare-fun res!50746 () Bool)

(assert (=> b!101299 (=> (not res!50746) (not e!65947))))

(assert (=> b!101299 (= res!50746 (= (arrayCountValidKeys!0 (_keys!4221 (_2!1188 lt!51038)) #b00000000000000000000000000000000 (size!2279 (_keys!4221 (_2!1188 lt!51038)))) (_size!481 (_2!1188 lt!51038))))))

(declare-fun b!101300 () Bool)

(declare-fun res!50747 () Bool)

(assert (=> b!101300 (=> (not res!50747) (not e!65947))))

(assert (=> b!101300 (= res!50747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 (_2!1188 lt!51038)) (mask!6640 (_2!1188 lt!51038))))))

(declare-fun b!101301 () Bool)

(assert (=> b!101301 (= e!65947 (arrayNoDuplicates!0 (_keys!4221 (_2!1188 lt!51038)) #b00000000000000000000000000000000 Nil!1584))))

(assert (= (and d!27463 res!50745) b!101299))

(assert (= (and b!101299 res!50746) b!101300))

(assert (= (and b!101300 res!50747) b!101301))

(declare-fun m!112281 () Bool)

(assert (=> d!27463 m!112281))

(declare-fun m!112283 () Bool)

(assert (=> b!101299 m!112283))

(declare-fun m!112285 () Bool)

(assert (=> b!101300 m!112285))

(declare-fun m!112287 () Bool)

(assert (=> b!101301 m!112287))

(assert (=> d!27359 d!27463))

(assert (=> d!27359 d!27353))

(declare-fun b!101318 () Bool)

(declare-fun e!65957 () Bool)

(declare-fun e!65956 () Bool)

(assert (=> b!101318 (= e!65957 e!65956)))

(declare-fun res!50757 () Bool)

(declare-fun call!10509 () Bool)

(assert (=> b!101318 (= res!50757 call!10509)))

(assert (=> b!101318 (=> (not res!50757) (not e!65956))))

(declare-fun b!101319 () Bool)

(declare-fun e!65958 () Bool)

(declare-fun call!10510 () Bool)

(assert (=> b!101319 (= e!65958 (not call!10510))))

(declare-fun b!101320 () Bool)

(declare-fun e!65959 () Bool)

(assert (=> b!101320 (= e!65957 e!65959)))

(declare-fun c!17443 () Bool)

(declare-fun lt!51386 () SeekEntryResult!255)

(assert (=> b!101320 (= c!17443 ((_ is MissingVacant!255) lt!51386))))

(declare-fun b!101321 () Bool)

(assert (=> b!101321 (= e!65959 ((_ is Undefined!255) lt!51386))))

(declare-fun c!17444 () Bool)

(declare-fun bm!10506 () Bool)

(assert (=> bm!10506 (= call!10509 (inRange!0 (ite c!17444 (index!3165 lt!51386) (index!3168 lt!51386)) (mask!6640 newMap!16)))))

(declare-fun b!101322 () Bool)

(declare-fun res!50756 () Bool)

(assert (=> b!101322 (=> (not res!50756) (not e!65958))))

(assert (=> b!101322 (= res!50756 call!10509)))

(assert (=> b!101322 (= e!65959 e!65958)))

(declare-fun b!101323 () Bool)

(assert (=> b!101323 (and (bvsge (index!3165 lt!51386) #b00000000000000000000000000000000) (bvslt (index!3165 lt!51386) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun res!50759 () Bool)

(assert (=> b!101323 (= res!50759 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3165 lt!51386)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101323 (=> (not res!50759) (not e!65956))))

(declare-fun b!101324 () Bool)

(declare-fun res!50758 () Bool)

(assert (=> b!101324 (=> (not res!50758) (not e!65958))))

(assert (=> b!101324 (= res!50758 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3168 lt!51386)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101324 (and (bvsge (index!3168 lt!51386) #b00000000000000000000000000000000) (bvslt (index!3168 lt!51386) (size!2279 (_keys!4221 newMap!16))))))

(declare-fun b!101325 () Bool)

(assert (=> b!101325 (= e!65956 (not call!10510))))

(declare-fun bm!10507 () Bool)

(assert (=> bm!10507 (= call!10510 (arrayContainsKey!0 (_keys!4221 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun d!27465 () Bool)

(assert (=> d!27465 e!65957))

(assert (=> d!27465 (= c!17444 ((_ is MissingZero!255) lt!51386))))

(assert (=> d!27465 (= lt!51386 (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun lt!51387 () Unit!3060)

(declare-fun choose!621 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) Int) Unit!3060)

(assert (=> d!27465 (= lt!51387 (choose!621 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27465 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27465 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)) lt!51387)))

(assert (= (and d!27465 c!17444) b!101318))

(assert (= (and d!27465 (not c!17444)) b!101320))

(assert (= (and b!101318 res!50757) b!101323))

(assert (= (and b!101323 res!50759) b!101325))

(assert (= (and b!101320 c!17443) b!101322))

(assert (= (and b!101320 (not c!17443)) b!101321))

(assert (= (and b!101322 res!50756) b!101324))

(assert (= (and b!101324 res!50758) b!101319))

(assert (= (or b!101318 b!101322) bm!10506))

(assert (= (or b!101325 b!101319) bm!10507))

(declare-fun m!112289 () Bool)

(assert (=> b!101323 m!112289))

(declare-fun m!112291 () Bool)

(assert (=> bm!10506 m!112291))

(assert (=> d!27465 m!111627))

(assert (=> d!27465 m!111745))

(assert (=> d!27465 m!111627))

(declare-fun m!112293 () Bool)

(assert (=> d!27465 m!112293))

(assert (=> d!27465 m!111909))

(declare-fun m!112295 () Bool)

(assert (=> b!101324 m!112295))

(assert (=> bm!10507 m!111627))

(assert (=> bm!10507 m!111755))

(assert (=> bm!10428 d!27465))

(declare-fun d!27467 () Bool)

(declare-fun e!65960 () Bool)

(assert (=> d!27467 e!65960))

(declare-fun res!50760 () Bool)

(assert (=> d!27467 (=> (not res!50760) (not e!65960))))

(declare-fun lt!51391 () ListLongMap!1543)

(assert (=> d!27467 (= res!50760 (contains!808 lt!51391 (_1!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!51389 () List!1586)

(assert (=> d!27467 (= lt!51391 (ListLongMap!1544 lt!51389))))

(declare-fun lt!51390 () Unit!3060)

(declare-fun lt!51388 () Unit!3060)

(assert (=> d!27467 (= lt!51390 lt!51388)))

(assert (=> d!27467 (= (getValueByKey!152 lt!51389 (_1!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!157 (_2!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27467 (= lt!51388 (lemmaContainsTupThenGetReturnValue!68 lt!51389 (_1!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27467 (= lt!51389 (insertStrictlySorted!71 (toList!787 call!10420) (_1!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27467 (= (+!137 call!10420 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!51391)))

(declare-fun b!101326 () Bool)

(declare-fun res!50761 () Bool)

(assert (=> b!101326 (=> (not res!50761) (not e!65960))))

(assert (=> b!101326 (= res!50761 (= (getValueByKey!152 (toList!787 lt!51391) (_1!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!157 (_2!1189 (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!101327 () Bool)

(assert (=> b!101327 (= e!65960 (contains!811 (toList!787 lt!51391) (tuple2!2357 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!27467 res!50760) b!101326))

(assert (= (and b!101326 res!50761) b!101327))

(declare-fun m!112297 () Bool)

(assert (=> d!27467 m!112297))

(declare-fun m!112299 () Bool)

(assert (=> d!27467 m!112299))

(declare-fun m!112301 () Bool)

(assert (=> d!27467 m!112301))

(declare-fun m!112303 () Bool)

(assert (=> d!27467 m!112303))

(declare-fun m!112305 () Bool)

(assert (=> b!101326 m!112305))

(declare-fun m!112307 () Bool)

(assert (=> b!101327 m!112307))

(assert (=> b!100923 d!27467))

(declare-fun d!27469 () Bool)

(assert (=> d!27469 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000)))

(declare-fun lt!51394 () Unit!3060)

(declare-fun choose!13 (array!4269 (_ BitVec 64) (_ BitVec 32)) Unit!3060)

(assert (=> d!27469 (= lt!51394 (choose!13 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000))))

(assert (=> d!27469 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!27469 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000) lt!51394)))

(declare-fun bs!4192 () Bool)

(assert (= bs!4192 d!27469))

(assert (=> bs!4192 m!111725))

(declare-fun m!112309 () Bool)

(assert (=> bs!4192 m!112309))

(assert (=> b!100794 d!27469))

(declare-fun d!27471 () Bool)

(declare-fun res!50762 () Bool)

(declare-fun e!65961 () Bool)

(assert (=> d!27471 (=> res!50762 e!65961)))

(assert (=> d!27471 (= res!50762 (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) lt!50965))))

(assert (=> d!27471 (= (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 #b00000000000000000000000000000000) e!65961)))

(declare-fun b!101328 () Bool)

(declare-fun e!65962 () Bool)

(assert (=> b!101328 (= e!65961 e!65962)))

(declare-fun res!50763 () Bool)

(assert (=> b!101328 (=> (not res!50763) (not e!65962))))

(assert (=> b!101328 (= res!50763 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!101329 () Bool)

(assert (=> b!101329 (= e!65962 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) lt!50965 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!27471 (not res!50762)) b!101328))

(assert (= (and b!101328 res!50763) b!101329))

(assert (=> d!27471 m!111721))

(declare-fun m!112311 () Bool)

(assert (=> b!101329 m!112311))

(assert (=> b!100794 d!27471))

(declare-fun b!101330 () Bool)

(declare-fun e!65963 () SeekEntryResult!255)

(declare-fun e!65965 () SeekEntryResult!255)

(assert (=> b!101330 (= e!65963 e!65965)))

(declare-fun lt!51396 () (_ BitVec 64))

(declare-fun lt!51395 () SeekEntryResult!255)

(assert (=> b!101330 (= lt!51396 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (index!3167 lt!51395)))))

(declare-fun c!17447 () Bool)

(assert (=> b!101330 (= c!17447 (= lt!51396 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!101331 () Bool)

(declare-fun e!65964 () SeekEntryResult!255)

(assert (=> b!101331 (= e!65964 (seekKeyOrZeroReturnVacant!0 (x!13249 lt!51395) (index!3167 lt!51395) (index!3167 lt!51395) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(declare-fun b!101332 () Bool)

(assert (=> b!101332 (= e!65963 Undefined!255)))

(declare-fun d!27473 () Bool)

(declare-fun lt!51397 () SeekEntryResult!255)

(assert (=> d!27473 (and (or ((_ is Undefined!255) lt!51397) (not ((_ is Found!255) lt!51397)) (and (bvsge (index!3166 lt!51397) #b00000000000000000000000000000000) (bvslt (index!3166 lt!51397) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))) (or ((_ is Undefined!255) lt!51397) ((_ is Found!255) lt!51397) (not ((_ is MissingZero!255) lt!51397)) (and (bvsge (index!3165 lt!51397) #b00000000000000000000000000000000) (bvslt (index!3165 lt!51397) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))) (or ((_ is Undefined!255) lt!51397) ((_ is Found!255) lt!51397) ((_ is MissingZero!255) lt!51397) (not ((_ is MissingVacant!255) lt!51397)) (and (bvsge (index!3168 lt!51397) #b00000000000000000000000000000000) (bvslt (index!3168 lt!51397) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))) (or ((_ is Undefined!255) lt!51397) (ite ((_ is Found!255) lt!51397) (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (index!3166 lt!51397)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!255) lt!51397) (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (index!3165 lt!51397)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!255) lt!51397) (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (index!3168 lt!51397)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!27473 (= lt!51397 e!65963)))

(declare-fun c!17445 () Bool)

(assert (=> d!27473 (= c!17445 (and ((_ is Intermediate!255) lt!51395) (undefined!1067 lt!51395)))))

(assert (=> d!27473 (= lt!51395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) (mask!6640 (v!2832 (underlying!343 thiss!992)))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))))))

(assert (=> d!27473 (validMask!0 (mask!6640 (v!2832 (underlying!343 thiss!992))))))

(assert (=> d!27473 (= (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) (_keys!4221 (v!2832 (underlying!343 thiss!992))) (mask!6640 (v!2832 (underlying!343 thiss!992)))) lt!51397)))

(declare-fun b!101333 () Bool)

(assert (=> b!101333 (= e!65964 (MissingZero!255 (index!3167 lt!51395)))))

(declare-fun b!101334 () Bool)

(assert (=> b!101334 (= e!65965 (Found!255 (index!3167 lt!51395)))))

(declare-fun b!101335 () Bool)

(declare-fun c!17446 () Bool)

(assert (=> b!101335 (= c!17446 (= lt!51396 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101335 (= e!65965 e!65964)))

(assert (= (and d!27473 c!17445) b!101332))

(assert (= (and d!27473 (not c!17445)) b!101330))

(assert (= (and b!101330 c!17447) b!101334))

(assert (= (and b!101330 (not c!17447)) b!101335))

(assert (= (and b!101335 c!17446) b!101333))

(assert (= (and b!101335 (not c!17446)) b!101331))

(declare-fun m!112313 () Bool)

(assert (=> b!101330 m!112313))

(assert (=> b!101331 m!111721))

(declare-fun m!112315 () Bool)

(assert (=> b!101331 m!112315))

(assert (=> d!27473 m!111721))

(declare-fun m!112317 () Bool)

(assert (=> d!27473 m!112317))

(assert (=> d!27473 m!112317))

(assert (=> d!27473 m!111721))

(declare-fun m!112319 () Bool)

(assert (=> d!27473 m!112319))

(declare-fun m!112321 () Bool)

(assert (=> d!27473 m!112321))

(declare-fun m!112323 () Bool)

(assert (=> d!27473 m!112323))

(declare-fun m!112325 () Bool)

(assert (=> d!27473 m!112325))

(assert (=> d!27473 m!111655))

(assert (=> b!100794 d!27473))

(assert (=> d!27367 d!27371))

(declare-fun d!27475 () Bool)

(assert (=> d!27475 (not (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!27475 true))

(declare-fun _$68!97 () Unit!3060)

(assert (=> d!27475 (= (choose!68 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (Cons!1583 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) Nil!1584)) _$68!97)))

(declare-fun bs!4193 () Bool)

(assert (= bs!4193 d!27475))

(assert (=> bs!4193 m!111627))

(assert (=> bs!4193 m!111631))

(assert (=> d!27367 d!27475))

(assert (=> b!101024 d!27437))

(declare-fun d!27477 () Bool)

(assert (=> d!27477 (= (apply!94 lt!51119 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1298 (getValueByKey!152 (toList!787 lt!51119) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!4194 () Bool)

(assert (= bs!4194 d!27477))

(assert (=> bs!4194 m!111819))

(assert (=> bs!4194 m!112063))

(assert (=> bs!4194 m!112063))

(declare-fun m!112327 () Bool)

(assert (=> bs!4194 m!112327))

(assert (=> b!100984 d!27477))

(declare-fun d!27479 () Bool)

(declare-fun c!17448 () Bool)

(assert (=> d!27479 (= c!17448 ((_ is ValueCellFull!978) (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!65966 () V!3171)

(assert (=> d!27479 (= (get!1294 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!65966)))

(declare-fun b!101336 () Bool)

(assert (=> b!101336 (= e!65966 (get!1296 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!101337 () Bool)

(assert (=> b!101337 (= e!65966 (get!1297 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27479 c!17448) b!101336))

(assert (= (and d!27479 (not c!17448)) b!101337))

(assert (=> b!101336 m!111839))

(assert (=> b!101336 m!111659))

(declare-fun m!112329 () Bool)

(assert (=> b!101336 m!112329))

(assert (=> b!101337 m!111839))

(assert (=> b!101337 m!111659))

(declare-fun m!112331 () Bool)

(assert (=> b!101337 m!112331))

(assert (=> b!100984 d!27479))

(declare-fun b!101349 () Bool)

(declare-fun e!65969 () Bool)

(assert (=> b!101349 (= e!65969 (and (bvsge (extraKeys!2336 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2336 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!481 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun d!27481 () Bool)

(declare-fun res!50773 () Bool)

(assert (=> d!27481 (=> (not res!50773) (not e!65969))))

(assert (=> d!27481 (= res!50773 (validMask!0 (mask!6640 newMap!16)))))

(assert (=> d!27481 (= (simpleValid!70 newMap!16) e!65969)))

(declare-fun b!101346 () Bool)

(declare-fun res!50774 () Bool)

(assert (=> b!101346 (=> (not res!50774) (not e!65969))))

(assert (=> b!101346 (= res!50774 (and (= (size!2280 (_values!2506 newMap!16)) (bvadd (mask!6640 newMap!16) #b00000000000000000000000000000001)) (= (size!2279 (_keys!4221 newMap!16)) (size!2280 (_values!2506 newMap!16))) (bvsge (_size!481 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!481 newMap!16) (bvadd (mask!6640 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!101347 () Bool)

(declare-fun res!50772 () Bool)

(assert (=> b!101347 (=> (not res!50772) (not e!65969))))

(declare-fun size!2283 (LongMapFixedSize!864) (_ BitVec 32))

(assert (=> b!101347 (= res!50772 (bvsge (size!2283 newMap!16) (_size!481 newMap!16)))))

(declare-fun b!101348 () Bool)

(declare-fun res!50775 () Bool)

(assert (=> b!101348 (=> (not res!50775) (not e!65969))))

(assert (=> b!101348 (= res!50775 (= (size!2283 newMap!16) (bvadd (_size!481 newMap!16) (bvsdiv (bvadd (extraKeys!2336 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!27481 res!50773) b!101346))

(assert (= (and b!101346 res!50774) b!101347))

(assert (= (and b!101347 res!50772) b!101348))

(assert (= (and b!101348 res!50775) b!101349))

(assert (=> d!27481 m!111909))

(declare-fun m!112333 () Bool)

(assert (=> b!101347 m!112333))

(assert (=> b!101348 m!112333))

(assert (=> d!27353 d!27481))

(declare-fun d!27483 () Bool)

(declare-fun e!65971 () Bool)

(assert (=> d!27483 e!65971))

(declare-fun res!50776 () Bool)

(assert (=> d!27483 (=> res!50776 e!65971)))

(declare-fun lt!51400 () Bool)

(assert (=> d!27483 (= res!50776 (not lt!51400))))

(declare-fun lt!51399 () Bool)

(assert (=> d!27483 (= lt!51400 lt!51399)))

(declare-fun lt!51398 () Unit!3060)

(declare-fun e!65970 () Unit!3060)

(assert (=> d!27483 (= lt!51398 e!65970)))

(declare-fun c!17449 () Bool)

(assert (=> d!27483 (= c!17449 lt!51399)))

(assert (=> d!27483 (= lt!51399 (containsKey!156 (toList!787 lt!51119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27483 (= (contains!808 lt!51119 #b1000000000000000000000000000000000000000000000000000000000000000) lt!51400)))

(declare-fun b!101350 () Bool)

(declare-fun lt!51401 () Unit!3060)

(assert (=> b!101350 (= e!65970 lt!51401)))

(assert (=> b!101350 (= lt!51401 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 lt!51119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101350 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101351 () Bool)

(declare-fun Unit!3081 () Unit!3060)

(assert (=> b!101351 (= e!65970 Unit!3081)))

(declare-fun b!101352 () Bool)

(assert (=> b!101352 (= e!65971 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27483 c!17449) b!101350))

(assert (= (and d!27483 (not c!17449)) b!101351))

(assert (= (and d!27483 (not res!50776)) b!101352))

(declare-fun m!112335 () Bool)

(assert (=> d!27483 m!112335))

(declare-fun m!112337 () Bool)

(assert (=> b!101350 m!112337))

(assert (=> b!101350 m!112129))

(assert (=> b!101350 m!112129))

(declare-fun m!112339 () Bool)

(assert (=> b!101350 m!112339))

(assert (=> b!101352 m!112129))

(assert (=> b!101352 m!112129))

(assert (=> b!101352 m!112339))

(assert (=> bm!10456 d!27483))

(declare-fun d!27485 () Bool)

(declare-fun e!65974 () Bool)

(assert (=> d!27485 e!65974))

(declare-fun res!50782 () Bool)

(assert (=> d!27485 (=> (not res!50782) (not e!65974))))

(declare-fun lt!51406 () SeekEntryResult!255)

(assert (=> d!27485 (= res!50782 ((_ is Found!255) lt!51406))))

(assert (=> d!27485 (= lt!51406 (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun lt!51407 () Unit!3060)

(declare-fun choose!622 (array!4269 array!4271 (_ BitVec 32) (_ BitVec 32) V!3171 V!3171 (_ BitVec 64) Int) Unit!3060)

(assert (=> d!27485 (= lt!51407 (choose!622 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)))))

(assert (=> d!27485 (validMask!0 (mask!6640 newMap!16))))

(assert (=> d!27485 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!43 (_keys!4221 newMap!16) (_values!2506 newMap!16) (mask!6640 newMap!16) (extraKeys!2336 newMap!16) (zeroValue!2402 newMap!16) (minValue!2402 newMap!16) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (defaultEntry!2523 newMap!16)) lt!51407)))

(declare-fun b!101357 () Bool)

(declare-fun res!50781 () Bool)

(assert (=> b!101357 (=> (not res!50781) (not e!65974))))

(assert (=> b!101357 (= res!50781 (inRange!0 (index!3166 lt!51406) (mask!6640 newMap!16)))))

(declare-fun b!101358 () Bool)

(assert (=> b!101358 (= e!65974 (= (select (arr!2027 (_keys!4221 newMap!16)) (index!3166 lt!51406)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!101358 (and (bvsge (index!3166 lt!51406) #b00000000000000000000000000000000) (bvslt (index!3166 lt!51406) (size!2279 (_keys!4221 newMap!16))))))

(assert (= (and d!27485 res!50782) b!101357))

(assert (= (and b!101357 res!50781) b!101358))

(assert (=> d!27485 m!111627))

(assert (=> d!27485 m!111745))

(assert (=> d!27485 m!111627))

(declare-fun m!112341 () Bool)

(assert (=> d!27485 m!112341))

(assert (=> d!27485 m!111909))

(declare-fun m!112343 () Bool)

(assert (=> b!101357 m!112343))

(declare-fun m!112345 () Bool)

(assert (=> b!101358 m!112345))

(assert (=> bm!10414 d!27485))

(declare-fun d!27487 () Bool)

(assert (=> d!27487 (= (get!1296 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355) (dynLambda!372 (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2831 (select (arr!2028 (_values!2506 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> b!100937 d!27487))

(declare-fun d!27489 () Bool)

(assert (=> d!27489 (= (validKeyInArray!0 (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!100795 d!27489))

(assert (=> b!100902 d!27455))

(declare-fun d!27491 () Bool)

(declare-fun res!50783 () Bool)

(declare-fun e!65975 () Bool)

(assert (=> d!27491 (=> res!50783 e!65975)))

(assert (=> d!27491 (= res!50783 (= (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355)))))

(assert (=> d!27491 (= (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!65975)))

(declare-fun b!101359 () Bool)

(declare-fun e!65976 () Bool)

(assert (=> b!101359 (= e!65975 e!65976)))

(declare-fun res!50784 () Bool)

(assert (=> b!101359 (=> (not res!50784) (not e!65976))))

(assert (=> b!101359 (= res!50784 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2279 (_keys!4221 (v!2832 (underlying!343 thiss!992))))))))

(declare-fun b!101360 () Bool)

(assert (=> b!101360 (= e!65976 (arrayContainsKey!0 (_keys!4221 (v!2832 (underlying!343 thiss!992))) (select (arr!2027 (_keys!4221 (v!2832 (underlying!343 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!27491 (not res!50783)) b!101359))

(assert (= (and b!101359 res!50784) b!101360))

(declare-fun m!112347 () Bool)

(assert (=> d!27491 m!112347))

(assert (=> b!101360 m!111627))

(declare-fun m!112349 () Bool)

(assert (=> b!101360 m!112349))

(assert (=> b!101007 d!27491))

(declare-fun d!27493 () Bool)

(declare-fun e!65978 () Bool)

(assert (=> d!27493 e!65978))

(declare-fun res!50785 () Bool)

(assert (=> d!27493 (=> res!50785 e!65978)))

(declare-fun lt!51410 () Bool)

(assert (=> d!27493 (= res!50785 (not lt!51410))))

(declare-fun lt!51409 () Bool)

(assert (=> d!27493 (= lt!51410 lt!51409)))

(declare-fun lt!51408 () Unit!3060)

(declare-fun e!65977 () Unit!3060)

(assert (=> d!27493 (= lt!51408 e!65977)))

(declare-fun c!17450 () Bool)

(assert (=> d!27493 (= c!17450 lt!51409)))

(assert (=> d!27493 (= lt!51409 (containsKey!156 (toList!787 lt!51119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!27493 (= (contains!808 lt!51119 #b0000000000000000000000000000000000000000000000000000000000000000) lt!51410)))

(declare-fun b!101361 () Bool)

(declare-fun lt!51411 () Unit!3060)

(assert (=> b!101361 (= e!65977 lt!51411)))

(assert (=> b!101361 (= lt!51411 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 lt!51119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!101361 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!101362 () Bool)

(declare-fun Unit!3082 () Unit!3060)

(assert (=> b!101362 (= e!65977 Unit!3082)))

(declare-fun b!101363 () Bool)

(assert (=> b!101363 (= e!65978 (isDefined!105 (getValueByKey!152 (toList!787 lt!51119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!27493 c!17450) b!101361))

(assert (= (and d!27493 (not c!17450)) b!101362))

(assert (= (and d!27493 (not res!50785)) b!101363))

(declare-fun m!112351 () Bool)

(assert (=> d!27493 m!112351))

(declare-fun m!112353 () Bool)

(assert (=> b!101361 m!112353))

(assert (=> b!101361 m!112067))

(assert (=> b!101361 m!112067))

(declare-fun m!112355 () Bool)

(assert (=> b!101361 m!112355))

(assert (=> b!101363 m!112067))

(assert (=> b!101363 m!112067))

(assert (=> b!101363 m!112355))

(assert (=> bm!10454 d!27493))

(declare-fun d!27495 () Bool)

(assert (=> d!27495 (contains!808 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51108)))

(declare-fun lt!51414 () Unit!3060)

(declare-fun choose!623 (ListLongMap!1543 (_ BitVec 64) V!3171 (_ BitVec 64)) Unit!3060)

(assert (=> d!27495 (= lt!51414 (choose!623 lt!51114 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51108))))

(assert (=> d!27495 (contains!808 lt!51114 lt!51108)))

(assert (=> d!27495 (= (addStillContains!70 lt!51114 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51108) lt!51414)))

(declare-fun bs!4195 () Bool)

(assert (= bs!4195 d!27495))

(assert (=> bs!4195 m!111823))

(assert (=> bs!4195 m!111823))

(assert (=> bs!4195 m!111825))

(declare-fun m!112357 () Bool)

(assert (=> bs!4195 m!112357))

(declare-fun m!112359 () Bool)

(assert (=> bs!4195 m!112359))

(assert (=> b!100986 d!27495))

(declare-fun d!27497 () Bool)

(declare-fun e!65979 () Bool)

(assert (=> d!27497 e!65979))

(declare-fun res!50786 () Bool)

(assert (=> d!27497 (=> (not res!50786) (not e!65979))))

(declare-fun lt!51418 () ListLongMap!1543)

(assert (=> d!27497 (= res!50786 (contains!808 lt!51418 (_1!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun lt!51416 () List!1586)

(assert (=> d!27497 (= lt!51418 (ListLongMap!1544 lt!51416))))

(declare-fun lt!51417 () Unit!3060)

(declare-fun lt!51415 () Unit!3060)

(assert (=> d!27497 (= lt!51417 lt!51415)))

(assert (=> d!27497 (= (getValueByKey!152 lt!51416 (_1!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27497 (= lt!51415 (lemmaContainsTupThenGetReturnValue!68 lt!51416 (_1!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27497 (= lt!51416 (insertStrictlySorted!71 (toList!787 lt!51116) (_1!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27497 (= (+!137 lt!51116 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51418)))

(declare-fun b!101365 () Bool)

(declare-fun res!50787 () Bool)

(assert (=> b!101365 (=> (not res!50787) (not e!65979))))

(assert (=> b!101365 (= res!50787 (= (getValueByKey!152 (toList!787 lt!51418) (_1!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun b!101366 () Bool)

(assert (=> b!101366 (= e!65979 (contains!811 (toList!787 lt!51418) (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27497 res!50786) b!101365))

(assert (= (and b!101365 res!50787) b!101366))

(declare-fun m!112361 () Bool)

(assert (=> d!27497 m!112361))

(declare-fun m!112363 () Bool)

(assert (=> d!27497 m!112363))

(declare-fun m!112365 () Bool)

(assert (=> d!27497 m!112365))

(declare-fun m!112367 () Bool)

(assert (=> d!27497 m!112367))

(declare-fun m!112369 () Bool)

(assert (=> b!101365 m!112369))

(declare-fun m!112371 () Bool)

(assert (=> b!101366 m!112371))

(assert (=> b!100986 d!27497))

(assert (=> b!100986 d!27459))

(declare-fun d!27499 () Bool)

(declare-fun e!65981 () Bool)

(assert (=> d!27499 e!65981))

(declare-fun res!50788 () Bool)

(assert (=> d!27499 (=> res!50788 e!65981)))

(declare-fun lt!51421 () Bool)

(assert (=> d!27499 (= res!50788 (not lt!51421))))

(declare-fun lt!51420 () Bool)

(assert (=> d!27499 (= lt!51421 lt!51420)))

(declare-fun lt!51419 () Unit!3060)

(declare-fun e!65980 () Unit!3060)

(assert (=> d!27499 (= lt!51419 e!65980)))

(declare-fun c!17451 () Bool)

(assert (=> d!27499 (= c!17451 lt!51420)))

(assert (=> d!27499 (= lt!51420 (containsKey!156 (toList!787 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51108))))

(assert (=> d!27499 (= (contains!808 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51108) lt!51421)))

(declare-fun b!101367 () Bool)

(declare-fun lt!51422 () Unit!3060)

(assert (=> b!101367 (= e!65980 lt!51422)))

(assert (=> b!101367 (= lt!51422 (lemmaContainsKeyImpliesGetValueByKeyDefined!104 (toList!787 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51108))))

(assert (=> b!101367 (isDefined!105 (getValueByKey!152 (toList!787 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51108))))

(declare-fun b!101368 () Bool)

(declare-fun Unit!3083 () Unit!3060)

(assert (=> b!101368 (= e!65980 Unit!3083)))

(declare-fun b!101369 () Bool)

(assert (=> b!101369 (= e!65981 (isDefined!105 (getValueByKey!152 (toList!787 (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51108)))))

(assert (= (and d!27499 c!17451) b!101367))

(assert (= (and d!27499 (not c!17451)) b!101368))

(assert (= (and d!27499 (not res!50788)) b!101369))

(declare-fun m!112373 () Bool)

(assert (=> d!27499 m!112373))

(declare-fun m!112375 () Bool)

(assert (=> b!101367 m!112375))

(declare-fun m!112377 () Bool)

(assert (=> b!101367 m!112377))

(assert (=> b!101367 m!112377))

(declare-fun m!112379 () Bool)

(assert (=> b!101367 m!112379))

(assert (=> b!101369 m!112377))

(assert (=> b!101369 m!112377))

(assert (=> b!101369 m!112379))

(assert (=> b!100986 d!27499))

(declare-fun d!27501 () Bool)

(assert (=> d!27501 (= (apply!94 (+!137 lt!51116 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51124) (apply!94 lt!51116 lt!51124))))

(declare-fun lt!51425 () Unit!3060)

(declare-fun choose!624 (ListLongMap!1543 (_ BitVec 64) V!3171 (_ BitVec 64)) Unit!3060)

(assert (=> d!27501 (= lt!51425 (choose!624 lt!51116 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51124))))

(declare-fun e!65984 () Bool)

(assert (=> d!27501 e!65984))

(declare-fun res!50791 () Bool)

(assert (=> d!27501 (=> (not res!50791) (not e!65984))))

(assert (=> d!27501 (= res!50791 (contains!808 lt!51116 lt!51124))))

(assert (=> d!27501 (= (addApplyDifferent!70 lt!51116 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51124) lt!51425)))

(declare-fun b!101373 () Bool)

(assert (=> b!101373 (= e!65984 (not (= lt!51124 lt!51111)))))

(assert (= (and d!27501 res!50791) b!101373))

(assert (=> d!27501 m!111813))

(assert (=> d!27501 m!111813))

(assert (=> d!27501 m!111817))

(declare-fun m!112381 () Bool)

(assert (=> d!27501 m!112381))

(assert (=> d!27501 m!111827))

(declare-fun m!112383 () Bool)

(assert (=> d!27501 m!112383))

(assert (=> b!100986 d!27501))

(declare-fun d!27503 () Bool)

(assert (=> d!27503 (= (apply!94 (+!137 lt!51106 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51109) (apply!94 lt!51106 lt!51109))))

(declare-fun lt!51426 () Unit!3060)

(assert (=> d!27503 (= lt!51426 (choose!624 lt!51106 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51109))))

(declare-fun e!65985 () Bool)

(assert (=> d!27503 e!65985))

(declare-fun res!50792 () Bool)

(assert (=> d!27503 (=> (not res!50792) (not e!65985))))

(assert (=> d!27503 (= res!50792 (contains!808 lt!51106 lt!51109))))

(assert (=> d!27503 (= (addApplyDifferent!70 lt!51106 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51109) lt!51426)))

(declare-fun b!101374 () Bool)

(assert (=> b!101374 (= e!65985 (not (= lt!51109 lt!51122)))))

(assert (= (and d!27503 res!50792) b!101374))

(assert (=> d!27503 m!111831))

(assert (=> d!27503 m!111831))

(assert (=> d!27503 m!111833))

(declare-fun m!112385 () Bool)

(assert (=> d!27503 m!112385))

(assert (=> d!27503 m!111803))

(declare-fun m!112387 () Bool)

(assert (=> d!27503 m!112387))

(assert (=> b!100986 d!27503))

(declare-fun d!27505 () Bool)

(declare-fun e!65986 () Bool)

(assert (=> d!27505 e!65986))

(declare-fun res!50793 () Bool)

(assert (=> d!27505 (=> (not res!50793) (not e!65986))))

(declare-fun lt!51430 () ListLongMap!1543)

(assert (=> d!27505 (= res!50793 (contains!808 lt!51430 (_1!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun lt!51428 () List!1586)

(assert (=> d!27505 (= lt!51430 (ListLongMap!1544 lt!51428))))

(declare-fun lt!51429 () Unit!3060)

(declare-fun lt!51427 () Unit!3060)

(assert (=> d!27505 (= lt!51429 lt!51427)))

(assert (=> d!27505 (= (getValueByKey!152 lt!51428 (_1!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27505 (= lt!51427 (lemmaContainsTupThenGetReturnValue!68 lt!51428 (_1!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27505 (= lt!51428 (insertStrictlySorted!71 (toList!787 lt!51106) (_1!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27505 (= (+!137 lt!51106 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51430)))

(declare-fun b!101375 () Bool)

(declare-fun res!50794 () Bool)

(assert (=> b!101375 (=> (not res!50794) (not e!65986))))

(assert (=> b!101375 (= res!50794 (= (getValueByKey!152 (toList!787 lt!51430) (_1!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun b!101376 () Bool)

(assert (=> b!101376 (= e!65986 (contains!811 (toList!787 lt!51430) (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27505 res!50793) b!101375))

(assert (= (and b!101375 res!50794) b!101376))

(declare-fun m!112389 () Bool)

(assert (=> d!27505 m!112389))

(declare-fun m!112391 () Bool)

(assert (=> d!27505 m!112391))

(declare-fun m!112393 () Bool)

(assert (=> d!27505 m!112393))

(declare-fun m!112395 () Bool)

(assert (=> d!27505 m!112395))

(declare-fun m!112397 () Bool)

(assert (=> b!101375 m!112397))

(declare-fun m!112399 () Bool)

(assert (=> b!101376 m!112399))

(assert (=> b!100986 d!27505))

(declare-fun d!27507 () Bool)

(declare-fun e!65987 () Bool)

(assert (=> d!27507 e!65987))

(declare-fun res!50795 () Bool)

(assert (=> d!27507 (=> (not res!50795) (not e!65987))))

(declare-fun lt!51434 () ListLongMap!1543)

(assert (=> d!27507 (= res!50795 (contains!808 lt!51434 (_1!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun lt!51432 () List!1586)

(assert (=> d!27507 (= lt!51434 (ListLongMap!1544 lt!51432))))

(declare-fun lt!51433 () Unit!3060)

(declare-fun lt!51431 () Unit!3060)

(assert (=> d!27507 (= lt!51433 lt!51431)))

(assert (=> d!27507 (= (getValueByKey!152 lt!51432 (_1!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27507 (= lt!51431 (lemmaContainsTupThenGetReturnValue!68 lt!51432 (_1!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27507 (= lt!51432 (insertStrictlySorted!71 (toList!787 lt!51125) (_1!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27507 (= (+!137 lt!51125 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51434)))

(declare-fun b!101377 () Bool)

(declare-fun res!50796 () Bool)

(assert (=> b!101377 (=> (not res!50796) (not e!65987))))

(assert (=> b!101377 (= res!50796 (= (getValueByKey!152 (toList!787 lt!51434) (_1!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun b!101378 () Bool)

(assert (=> b!101378 (= e!65987 (contains!811 (toList!787 lt!51434) (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27507 res!50795) b!101377))

(assert (= (and b!101377 res!50796) b!101378))

(declare-fun m!112401 () Bool)

(assert (=> d!27507 m!112401))

(declare-fun m!112403 () Bool)

(assert (=> d!27507 m!112403))

(declare-fun m!112405 () Bool)

(assert (=> d!27507 m!112405))

(declare-fun m!112407 () Bool)

(assert (=> d!27507 m!112407))

(declare-fun m!112409 () Bool)

(assert (=> b!101377 m!112409))

(declare-fun m!112411 () Bool)

(assert (=> b!101378 m!112411))

(assert (=> b!100986 d!27507))

(declare-fun d!27509 () Bool)

(assert (=> d!27509 (= (apply!94 lt!51106 lt!51109) (get!1298 (getValueByKey!152 (toList!787 lt!51106) lt!51109)))))

(declare-fun bs!4196 () Bool)

(assert (= bs!4196 d!27509))

(declare-fun m!112413 () Bool)

(assert (=> bs!4196 m!112413))

(assert (=> bs!4196 m!112413))

(declare-fun m!112415 () Bool)

(assert (=> bs!4196 m!112415))

(assert (=> b!100986 d!27509))

(declare-fun d!27511 () Bool)

(assert (=> d!27511 (= (apply!94 lt!51125 lt!51112) (get!1298 (getValueByKey!152 (toList!787 lt!51125) lt!51112)))))

(declare-fun bs!4197 () Bool)

(assert (= bs!4197 d!27511))

(declare-fun m!112417 () Bool)

(assert (=> bs!4197 m!112417))

(assert (=> bs!4197 m!112417))

(declare-fun m!112419 () Bool)

(assert (=> bs!4197 m!112419))

(assert (=> b!100986 d!27511))

(declare-fun d!27513 () Bool)

(assert (=> d!27513 (= (apply!94 (+!137 lt!51106 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51109) (get!1298 (getValueByKey!152 (toList!787 (+!137 lt!51106 (tuple2!2357 lt!51122 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51109)))))

(declare-fun bs!4198 () Bool)

(assert (= bs!4198 d!27513))

(declare-fun m!112421 () Bool)

(assert (=> bs!4198 m!112421))

(assert (=> bs!4198 m!112421))

(declare-fun m!112423 () Bool)

(assert (=> bs!4198 m!112423))

(assert (=> b!100986 d!27513))

(declare-fun d!27515 () Bool)

(assert (=> d!27515 (= (apply!94 lt!51116 lt!51124) (get!1298 (getValueByKey!152 (toList!787 lt!51116) lt!51124)))))

(declare-fun bs!4199 () Bool)

(assert (= bs!4199 d!27515))

(declare-fun m!112425 () Bool)

(assert (=> bs!4199 m!112425))

(assert (=> bs!4199 m!112425))

(declare-fun m!112427 () Bool)

(assert (=> bs!4199 m!112427))

(assert (=> b!100986 d!27515))

(declare-fun d!27517 () Bool)

(assert (=> d!27517 (= (apply!94 (+!137 lt!51125 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51112) (get!1298 (getValueByKey!152 (toList!787 (+!137 lt!51125 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51112)))))

(declare-fun bs!4200 () Bool)

(assert (= bs!4200 d!27517))

(declare-fun m!112429 () Bool)

(assert (=> bs!4200 m!112429))

(assert (=> bs!4200 m!112429))

(declare-fun m!112431 () Bool)

(assert (=> bs!4200 m!112431))

(assert (=> b!100986 d!27517))

(declare-fun d!27519 () Bool)

(declare-fun e!65988 () Bool)

(assert (=> d!27519 e!65988))

(declare-fun res!50797 () Bool)

(assert (=> d!27519 (=> (not res!50797) (not e!65988))))

(declare-fun lt!51438 () ListLongMap!1543)

(assert (=> d!27519 (= res!50797 (contains!808 lt!51438 (_1!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(declare-fun lt!51436 () List!1586)

(assert (=> d!27519 (= lt!51438 (ListLongMap!1544 lt!51436))))

(declare-fun lt!51437 () Unit!3060)

(declare-fun lt!51435 () Unit!3060)

(assert (=> d!27519 (= lt!51437 lt!51435)))

(assert (=> d!27519 (= (getValueByKey!152 lt!51436 (_1!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27519 (= lt!51435 (lemmaContainsTupThenGetReturnValue!68 lt!51436 (_1!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27519 (= lt!51436 (insertStrictlySorted!71 (toList!787 lt!51114) (_1!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) (_2!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))))))

(assert (=> d!27519 (= (+!137 lt!51114 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51438)))

(declare-fun b!101379 () Bool)

(declare-fun res!50798 () Bool)

(assert (=> b!101379 (=> (not res!50798) (not e!65988))))

(assert (=> b!101379 (= res!50798 (= (getValueByKey!152 (toList!787 lt!51438) (_1!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992)))))) (Some!157 (_2!1189 (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))))))))

(declare-fun b!101380 () Bool)

(assert (=> b!101380 (= e!65988 (contains!811 (toList!787 lt!51438) (tuple2!2357 lt!51105 (zeroValue!2402 (v!2832 (underlying!343 thiss!992))))))))

(assert (= (and d!27519 res!50797) b!101379))

(assert (= (and b!101379 res!50798) b!101380))

(declare-fun m!112433 () Bool)

(assert (=> d!27519 m!112433))

(declare-fun m!112435 () Bool)

(assert (=> d!27519 m!112435))

(declare-fun m!112437 () Bool)

(assert (=> d!27519 m!112437))

(declare-fun m!112439 () Bool)

(assert (=> d!27519 m!112439))

(declare-fun m!112441 () Bool)

(assert (=> b!101379 m!112441))

(declare-fun m!112443 () Bool)

(assert (=> b!101380 m!112443))

(assert (=> b!100986 d!27519))

(declare-fun d!27521 () Bool)

(assert (=> d!27521 (= (apply!94 (+!137 lt!51125 (tuple2!2357 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51112) (apply!94 lt!51125 lt!51112))))

(declare-fun lt!51439 () Unit!3060)

(assert (=> d!27521 (= lt!51439 (choose!624 lt!51125 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51112))))

(declare-fun e!65989 () Bool)

(assert (=> d!27521 e!65989))

(declare-fun res!50799 () Bool)

(assert (=> d!27521 (=> (not res!50799) (not e!65989))))

(assert (=> d!27521 (= res!50799 (contains!808 lt!51125 lt!51112))))

(assert (=> d!27521 (= (addApplyDifferent!70 lt!51125 lt!51120 (minValue!2402 (v!2832 (underlying!343 thiss!992))) lt!51112) lt!51439)))

(declare-fun b!101381 () Bool)

(assert (=> b!101381 (= e!65989 (not (= lt!51112 lt!51120)))))

(assert (= (and d!27521 res!50799) b!101381))

(assert (=> d!27521 m!111821))

(assert (=> d!27521 m!111821))

(assert (=> d!27521 m!111829))

(declare-fun m!112445 () Bool)

(assert (=> d!27521 m!112445))

(assert (=> d!27521 m!111805))

(declare-fun m!112447 () Bool)

(assert (=> d!27521 m!112447))

(assert (=> b!100986 d!27521))

(declare-fun d!27523 () Bool)

(assert (=> d!27523 (= (apply!94 (+!137 lt!51116 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992))))) lt!51124) (get!1298 (getValueByKey!152 (toList!787 (+!137 lt!51116 (tuple2!2357 lt!51111 (minValue!2402 (v!2832 (underlying!343 thiss!992)))))) lt!51124)))))

(declare-fun bs!4201 () Bool)

(assert (= bs!4201 d!27523))

(declare-fun m!112449 () Bool)

(assert (=> bs!4201 m!112449))

(assert (=> bs!4201 m!112449))

(declare-fun m!112451 () Bool)

(assert (=> bs!4201 m!112451))

(assert (=> b!100986 d!27523))

(declare-fun b!101382 () Bool)

(declare-fun e!65992 () Bool)

(declare-fun e!65991 () Bool)

(assert (=> b!101382 (= e!65992 e!65991)))

(declare-fun lt!51440 () (_ BitVec 64))

(assert (=> b!101382 (= lt!51440 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!51441 () Unit!3060)

(assert (=> b!101382 (= lt!51441 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4221 newMap!16) lt!51440 #b00000000000000000000000000000000))))

(assert (=> b!101382 (arrayContainsKey!0 (_keys!4221 newMap!16) lt!51440 #b00000000000000000000000000000000)))

(declare-fun lt!51442 () Unit!3060)

(assert (=> b!101382 (= lt!51442 lt!51441)))

(declare-fun res!50800 () Bool)

(assert (=> b!101382 (= res!50800 (= (seekEntryOrOpen!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000) (_keys!4221 newMap!16) (mask!6640 newMap!16)) (Found!255 #b00000000000000000000000000000000)))))

(assert (=> b!101382 (=> (not res!50800) (not e!65991))))

(declare-fun d!27525 () Bool)

(declare-fun res!50801 () Bool)

(declare-fun e!65990 () Bool)

(assert (=> d!27525 (=> res!50801 e!65990)))

(assert (=> d!27525 (= res!50801 (bvsge #b00000000000000000000000000000000 (size!2279 (_keys!4221 newMap!16))))))

(assert (=> d!27525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4221 newMap!16) (mask!6640 newMap!16)) e!65990)))

(declare-fun bm!10508 () Bool)

(declare-fun call!10511 () Bool)

(assert (=> bm!10508 (= call!10511 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4221 newMap!16) (mask!6640 newMap!16)))))

(declare-fun b!101383 () Bool)

(assert (=> b!101383 (= e!65990 e!65992)))

(declare-fun c!17452 () Bool)

(assert (=> b!101383 (= c!17452 (validKeyInArray!0 (select (arr!2027 (_keys!4221 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!101384 () Bool)

(assert (=> b!101384 (= e!65992 call!10511)))

(declare-fun b!101385 () Bool)

(assert (=> b!101385 (= e!65991 call!10511)))

(assert (= (and d!27525 (not res!50801)) b!101383))

(assert (= (and b!101383 c!17452) b!101382))

(assert (= (and b!101383 (not c!17452)) b!101384))

(assert (= (and b!101382 res!50800) b!101385))

(assert (= (or b!101385 b!101384) bm!10508))

(assert (=> b!101382 m!111877))

(declare-fun m!112453 () Bool)

(assert (=> b!101382 m!112453))

(declare-fun m!112455 () Bool)

(assert (=> b!101382 m!112455))

(assert (=> b!101382 m!111877))

(declare-fun m!112457 () Bool)

(assert (=> b!101382 m!112457))

(declare-fun m!112459 () Bool)

(assert (=> bm!10508 m!112459))

(assert (=> b!101383 m!111877))

(assert (=> b!101383 m!111877))

(assert (=> b!101383 m!111925))

(assert (=> b!100784 d!27525))

(declare-fun mapIsEmpty!3809 () Bool)

(declare-fun mapRes!3809 () Bool)

(assert (=> mapIsEmpty!3809 mapRes!3809))

(declare-fun mapNonEmpty!3809 () Bool)

(declare-fun tp!9677 () Bool)

(declare-fun e!65993 () Bool)

(assert (=> mapNonEmpty!3809 (= mapRes!3809 (and tp!9677 e!65993))))

(declare-fun mapKey!3809 () (_ BitVec 32))

(declare-fun mapValue!3809 () ValueCell!978)

(declare-fun mapRest!3809 () (Array (_ BitVec 32) ValueCell!978))

(assert (=> mapNonEmpty!3809 (= mapRest!3807 (store mapRest!3809 mapKey!3809 mapValue!3809))))

(declare-fun b!101386 () Bool)

(assert (=> b!101386 (= e!65993 tp_is_empty!2643)))

(declare-fun b!101387 () Bool)

(declare-fun e!65994 () Bool)

(assert (=> b!101387 (= e!65994 tp_is_empty!2643)))

(declare-fun condMapEmpty!3809 () Bool)

(declare-fun mapDefault!3809 () ValueCell!978)

(assert (=> mapNonEmpty!3807 (= condMapEmpty!3809 (= mapRest!3807 ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3809)))))

(assert (=> mapNonEmpty!3807 (= tp!9675 (and e!65994 mapRes!3809))))

(assert (= (and mapNonEmpty!3807 condMapEmpty!3809) mapIsEmpty!3809))

(assert (= (and mapNonEmpty!3807 (not condMapEmpty!3809)) mapNonEmpty!3809))

(assert (= (and mapNonEmpty!3809 ((_ is ValueCellFull!978) mapValue!3809)) b!101386))

(assert (= (and mapNonEmpty!3807 ((_ is ValueCellFull!978) mapDefault!3809)) b!101387))

(declare-fun m!112461 () Bool)

(assert (=> mapNonEmpty!3809 m!112461))

(declare-fun mapIsEmpty!3810 () Bool)

(declare-fun mapRes!3810 () Bool)

(assert (=> mapIsEmpty!3810 mapRes!3810))

(declare-fun mapNonEmpty!3810 () Bool)

(declare-fun tp!9678 () Bool)

(declare-fun e!65995 () Bool)

(assert (=> mapNonEmpty!3810 (= mapRes!3810 (and tp!9678 e!65995))))

(declare-fun mapKey!3810 () (_ BitVec 32))

(declare-fun mapValue!3810 () ValueCell!978)

(declare-fun mapRest!3810 () (Array (_ BitVec 32) ValueCell!978))

(assert (=> mapNonEmpty!3810 (= mapRest!3808 (store mapRest!3810 mapKey!3810 mapValue!3810))))

(declare-fun b!101388 () Bool)

(assert (=> b!101388 (= e!65995 tp_is_empty!2643)))

(declare-fun b!101389 () Bool)

(declare-fun e!65996 () Bool)

(assert (=> b!101389 (= e!65996 tp_is_empty!2643)))

(declare-fun condMapEmpty!3810 () Bool)

(declare-fun mapDefault!3810 () ValueCell!978)

(assert (=> mapNonEmpty!3808 (= condMapEmpty!3810 (= mapRest!3808 ((as const (Array (_ BitVec 32) ValueCell!978)) mapDefault!3810)))))

(assert (=> mapNonEmpty!3808 (= tp!9676 (and e!65996 mapRes!3810))))

(assert (= (and mapNonEmpty!3808 condMapEmpty!3810) mapIsEmpty!3810))

(assert (= (and mapNonEmpty!3808 (not condMapEmpty!3810)) mapNonEmpty!3810))

(assert (= (and mapNonEmpty!3810 ((_ is ValueCellFull!978) mapValue!3810)) b!101388))

(assert (= (and mapNonEmpty!3808 ((_ is ValueCellFull!978) mapDefault!3810)) b!101389))

(declare-fun m!112463 () Bool)

(assert (=> mapNonEmpty!3810 m!112463))

(declare-fun b_lambda!4537 () Bool)

(assert (= b_lambda!4527 (or (and b!100707 b_free!2453 (= (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) (defaultEntry!2523 newMap!16))) (and b!100696 b_free!2455) b_lambda!4537)))

(declare-fun b_lambda!4539 () Bool)

(assert (= b_lambda!4533 (or (and b!100707 b_free!2453) (and b!100696 b_free!2455 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))))) b_lambda!4539)))

(declare-fun b_lambda!4541 () Bool)

(assert (= b_lambda!4529 (or (and b!100707 b_free!2453 (= (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) (defaultEntry!2523 newMap!16))) (and b!100696 b_free!2455) b_lambda!4541)))

(declare-fun b_lambda!4543 () Bool)

(assert (= b_lambda!4535 (or (and b!100707 b_free!2453) (and b!100696 b_free!2455 (= (defaultEntry!2523 newMap!16) (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))))) b_lambda!4543)))

(declare-fun b_lambda!4545 () Bool)

(assert (= b_lambda!4531 (or (and b!100707 b_free!2453 (= (defaultEntry!2523 (v!2832 (underlying!343 thiss!992))) (defaultEntry!2523 newMap!16))) (and b!100696 b_free!2455) b_lambda!4545)))

(check-sat (not d!27477) (not b!101377) (not d!27503) (not b!101094) (not b_next!2453) (not d!27413) (not b!101153) (not d!27395) (not b!101102) (not b!101141) (not b!101283) (not d!27415) (not b!101357) (not b_next!2455) (not d!27411) (not b_lambda!4543) (not bm!10470) (not bm!10486) (not b!101147) (not d!27463) (not b!101173) (not bm!10471) (not d!27393) (not d!27499) (not b!101365) (not d!27439) (not b!101054) (not b_lambda!4525) (not d!27461) b_and!6241 (not b_lambda!4537) (not b!101118) (not d!27481) (not d!27493) (not b!101352) (not bm!10473) (not b!101360) (not b!101046) (not b!101378) (not b!101236) (not d!27501) (not bm!10464) (not b_lambda!4541) (not b!101361) (not d!27509) (not bm!10508) (not b!101375) (not b!101161) (not bm!10479) (not mapNonEmpty!3810) (not b!101111) (not b!101363) (not b!101112) (not d!27515) (not b!101167) (not d!27433) (not bm!10489) (not b!101301) (not bm!10477) (not b!101245) (not b!101369) (not b!101116) (not b!101086) (not b!101062) (not d!27465) (not d!27521) (not b!101090) (not b!101087) (not b!101327) (not d!27453) (not b!101114) (not d!27473) (not d!27459) (not b!101050) (not bm!10463) (not b!101125) (not b!101043) (not d!27443) (not d!27485) (not b!101287) (not d!27455) (not b!101048) (not b!101047) (not b!101182) (not d!27403) (not b!101329) (not d!27399) (not d!27497) (not b!101109) (not b!101299) (not b!101049) (not bm!10476) (not d!27495) (not b!101176) (not b!101077) (not b!101052) (not d!27505) (not bm!10483) (not b!101289) (not b!101367) (not d!27421) (not bm!10467) (not b!101143) (not b!101237) (not d!27507) (not b!101154) (not d!27449) (not b_lambda!4521) (not b!101083) (not d!27401) (not b!101382) (not d!27451) (not bm!10500) (not d!27523) (not b!101145) (not bm!10484) (not d!27427) (not bm!10498) (not b!101193) (not b!101144) (not b!101331) (not b!101159) (not bm!10506) (not b!101117) (not b!101151) (not d!27441) (not d!27417) (not d!27431) (not b!101379) (not b!101119) (not b!101172) (not b!101053) (not b!101291) (not d!27447) (not d!27429) (not d!27517) (not b!101347) (not b_lambda!4545) (not b!101081) (not d!27513) (not b!101295) (not b!101337) (not b!101155) (not b_lambda!4539) (not bm!10468) (not bm!10501) (not bm!10460) (not bm!10507) tp_is_empty!2643 (not b!101246) b_and!6239 (not b!101348) (not b!101089) (not b!101243) (not b!101366) (not b!101238) (not b!101207) (not b!101188) (not b!101128) (not d!27483) (not b!101139) (not b!101152) (not d!27425) (not d!27519) (not b!101285) (not b!101244) (not b!101180) (not b!101241) (not d!27469) (not b!101350) (not mapNonEmpty!3809) (not b!101191) (not bm!10472) (not b!101380) (not b!101080) (not b!101110) (not d!27467) (not d!27475) (not b!101300) (not b!101073) (not b!101088) (not b!101336) (not b!101096) (not b!101383) (not b!101376) (not d!27511) (not b!101175) (not bm!10480) (not b!101326) (not b!101174))
(check-sat b_and!6239 b_and!6241 (not b_next!2453) (not b_next!2455))
