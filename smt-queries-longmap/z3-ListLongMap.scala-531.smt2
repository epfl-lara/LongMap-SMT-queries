; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13232 () Bool)

(assert start!13232)

(declare-fun b!116557 () Bool)

(declare-fun b_free!2761 () Bool)

(declare-fun b_next!2761 () Bool)

(assert (=> b!116557 (= b_free!2761 (not b_next!2761))))

(declare-fun tp!10655 () Bool)

(declare-fun b_and!7261 () Bool)

(assert (=> b!116557 (= tp!10655 b_and!7261)))

(declare-fun b!116558 () Bool)

(declare-fun b_free!2763 () Bool)

(declare-fun b_next!2763 () Bool)

(assert (=> b!116558 (= b_free!2763 (not b_next!2763))))

(declare-fun tp!10656 () Bool)

(declare-fun b_and!7263 () Bool)

(assert (=> b!116558 (= tp!10656 b_and!7263)))

(declare-fun b!116554 () Bool)

(declare-fun res!57083 () Bool)

(declare-fun e!76151 () Bool)

(assert (=> b!116554 (=> (not res!57083) (not e!76151))))

(declare-datatypes ((V!3377 0))(
  ( (V!3378 (val!1443 Int)) )
))
(declare-datatypes ((array!4587 0))(
  ( (array!4588 (arr!2174 (Array (_ BitVec 32) (_ BitVec 64))) (size!2435 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1055 0))(
  ( (ValueCellFull!1055 (v!3057 V!3377)) (EmptyCell!1055) )
))
(declare-datatypes ((array!4589 0))(
  ( (array!4590 (arr!2175 (Array (_ BitVec 32) ValueCell!1055)) (size!2436 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1018 0))(
  ( (LongMapFixedSize!1019 (defaultEntry!2721 Int) (mask!6941 (_ BitVec 32)) (extraKeys!2510 (_ BitVec 32)) (zeroValue!2588 V!3377) (minValue!2588 V!3377) (_size!558 (_ BitVec 32)) (_keys!4444 array!4587) (_values!2704 array!4589) (_vacant!558 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1018)

(declare-datatypes ((Cell!818 0))(
  ( (Cell!819 (v!3058 LongMapFixedSize!1018)) )
))
(declare-datatypes ((LongMap!818 0))(
  ( (LongMap!819 (underlying!420 Cell!818)) )
))
(declare-fun thiss!992 () LongMap!818)

(assert (=> b!116554 (= res!57083 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6941 newMap!16)) (_size!558 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116555 () Bool)

(declare-fun res!57080 () Bool)

(assert (=> b!116555 (=> (not res!57080) (not e!76151))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!116555 (= res!57080 (and (or (= (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsle from!355 #b00000000000000000000000000000000)))))

(declare-fun b!116556 () Bool)

(declare-fun e!76147 () Bool)

(declare-fun e!76142 () Bool)

(declare-fun mapRes!4334 () Bool)

(assert (=> b!116556 (= e!76147 (and e!76142 mapRes!4334))))

(declare-fun condMapEmpty!4333 () Bool)

(declare-fun mapDefault!4333 () ValueCell!1055)

(assert (=> b!116556 (= condMapEmpty!4333 (= (arr!2175 (_values!2704 (v!3058 (underlying!420 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4333)))))

(declare-fun mapNonEmpty!4333 () Bool)

(declare-fun mapRes!4333 () Bool)

(declare-fun tp!10658 () Bool)

(declare-fun e!76144 () Bool)

(assert (=> mapNonEmpty!4333 (= mapRes!4333 (and tp!10658 e!76144))))

(declare-fun mapKey!4334 () (_ BitVec 32))

(declare-fun mapValue!4334 () ValueCell!1055)

(declare-fun mapRest!4334 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4333 (= (arr!2175 (_values!2704 newMap!16)) (store mapRest!4334 mapKey!4334 mapValue!4334))))

(declare-fun e!76150 () Bool)

(declare-fun tp_is_empty!2797 () Bool)

(declare-fun array_inv!1361 (array!4587) Bool)

(declare-fun array_inv!1362 (array!4589) Bool)

(assert (=> b!116557 (= e!76150 (and tp!10655 tp_is_empty!2797 (array_inv!1361 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (array_inv!1362 (_values!2704 (v!3058 (underlying!420 thiss!992)))) e!76147))))

(declare-fun mapIsEmpty!4333 () Bool)

(assert (=> mapIsEmpty!4333 mapRes!4334))

(declare-fun mapIsEmpty!4334 () Bool)

(assert (=> mapIsEmpty!4334 mapRes!4333))

(declare-fun e!76148 () Bool)

(declare-fun e!76149 () Bool)

(assert (=> b!116558 (= e!76148 (and tp!10656 tp_is_empty!2797 (array_inv!1361 (_keys!4444 newMap!16)) (array_inv!1362 (_values!2704 newMap!16)) e!76149))))

(declare-fun b!116559 () Bool)

(declare-fun res!57081 () Bool)

(assert (=> b!116559 (=> (not res!57081) (not e!76151))))

(declare-fun valid!495 (LongMapFixedSize!1018) Bool)

(assert (=> b!116559 (= res!57081 (valid!495 newMap!16))))

(declare-fun b!116560 () Bool)

(declare-fun e!76153 () Bool)

(assert (=> b!116560 (= e!76153 tp_is_empty!2797)))

(declare-fun b!116561 () Bool)

(assert (=> b!116561 (= e!76151 (not (valid!495 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116562 () Bool)

(declare-fun e!76146 () Bool)

(declare-fun e!76152 () Bool)

(assert (=> b!116562 (= e!76146 e!76152)))

(declare-fun b!116564 () Bool)

(declare-fun e!76145 () Bool)

(assert (=> b!116564 (= e!76145 tp_is_empty!2797)))

(declare-fun b!116565 () Bool)

(declare-fun res!57082 () Bool)

(assert (=> b!116565 (=> (not res!57082) (not e!76151))))

(assert (=> b!116565 (= res!57082 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992)))))))))

(declare-fun b!116566 () Bool)

(assert (=> b!116566 (= e!76152 e!76150)))

(declare-fun mapNonEmpty!4334 () Bool)

(declare-fun tp!10657 () Bool)

(assert (=> mapNonEmpty!4334 (= mapRes!4334 (and tp!10657 e!76145))))

(declare-fun mapValue!4333 () ValueCell!1055)

(declare-fun mapKey!4333 () (_ BitVec 32))

(declare-fun mapRest!4333 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4334 (= (arr!2175 (_values!2704 (v!3058 (underlying!420 thiss!992)))) (store mapRest!4333 mapKey!4333 mapValue!4333))))

(declare-fun b!116567 () Bool)

(assert (=> b!116567 (= e!76144 tp_is_empty!2797)))

(declare-fun res!57084 () Bool)

(assert (=> start!13232 (=> (not res!57084) (not e!76151))))

(declare-fun valid!496 (LongMap!818) Bool)

(assert (=> start!13232 (= res!57084 (valid!496 thiss!992))))

(assert (=> start!13232 e!76151))

(assert (=> start!13232 e!76146))

(assert (=> start!13232 true))

(assert (=> start!13232 e!76148))

(declare-fun b!116563 () Bool)

(assert (=> b!116563 (= e!76149 (and e!76153 mapRes!4333))))

(declare-fun condMapEmpty!4334 () Bool)

(declare-fun mapDefault!4334 () ValueCell!1055)

(assert (=> b!116563 (= condMapEmpty!4334 (= (arr!2175 (_values!2704 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4334)))))

(declare-fun b!116568 () Bool)

(declare-fun res!57085 () Bool)

(assert (=> b!116568 (=> (not res!57085) (not e!76151))))

(declare-datatypes ((tuple2!2494 0))(
  ( (tuple2!2495 (_1!1258 (_ BitVec 64)) (_2!1258 V!3377)) )
))
(declare-datatypes ((List!1660 0))(
  ( (Nil!1657) (Cons!1656 (h!2256 tuple2!2494) (t!5922 List!1660)) )
))
(declare-datatypes ((ListLongMap!1611 0))(
  ( (ListLongMap!1612 (toList!821 List!1660)) )
))
(declare-fun getCurrentListMap!502 (array!4587 array!4589 (_ BitVec 32) (_ BitVec 32) V!3377 V!3377 (_ BitVec 32) Int) ListLongMap!1611)

(declare-fun map!1356 (LongMapFixedSize!1018) ListLongMap!1611)

(assert (=> b!116568 (= res!57085 (= (getCurrentListMap!502 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))) (map!1356 newMap!16)))))

(declare-fun b!116569 () Bool)

(assert (=> b!116569 (= e!76142 tp_is_empty!2797)))

(assert (= (and start!13232 res!57084) b!116565))

(assert (= (and b!116565 res!57082) b!116559))

(assert (= (and b!116559 res!57081) b!116554))

(assert (= (and b!116554 res!57083) b!116568))

(assert (= (and b!116568 res!57085) b!116555))

(assert (= (and b!116555 res!57080) b!116561))

(assert (= (and b!116556 condMapEmpty!4333) mapIsEmpty!4333))

(assert (= (and b!116556 (not condMapEmpty!4333)) mapNonEmpty!4334))

(get-info :version)

(assert (= (and mapNonEmpty!4334 ((_ is ValueCellFull!1055) mapValue!4333)) b!116564))

(assert (= (and b!116556 ((_ is ValueCellFull!1055) mapDefault!4333)) b!116569))

(assert (= b!116557 b!116556))

(assert (= b!116566 b!116557))

(assert (= b!116562 b!116566))

(assert (= start!13232 b!116562))

(assert (= (and b!116563 condMapEmpty!4334) mapIsEmpty!4334))

(assert (= (and b!116563 (not condMapEmpty!4334)) mapNonEmpty!4333))

(assert (= (and mapNonEmpty!4333 ((_ is ValueCellFull!1055) mapValue!4334)) b!116567))

(assert (= (and b!116563 ((_ is ValueCellFull!1055) mapDefault!4334)) b!116560))

(assert (= b!116558 b!116563))

(assert (= start!13232 b!116558))

(declare-fun m!132475 () Bool)

(assert (=> b!116557 m!132475))

(declare-fun m!132477 () Bool)

(assert (=> b!116557 m!132477))

(declare-fun m!132479 () Bool)

(assert (=> b!116558 m!132479))

(declare-fun m!132481 () Bool)

(assert (=> b!116558 m!132481))

(declare-fun m!132483 () Bool)

(assert (=> b!116568 m!132483))

(declare-fun m!132485 () Bool)

(assert (=> b!116568 m!132485))

(declare-fun m!132487 () Bool)

(assert (=> b!116561 m!132487))

(declare-fun m!132489 () Bool)

(assert (=> mapNonEmpty!4334 m!132489))

(declare-fun m!132491 () Bool)

(assert (=> b!116555 m!132491))

(declare-fun m!132493 () Bool)

(assert (=> mapNonEmpty!4333 m!132493))

(declare-fun m!132495 () Bool)

(assert (=> b!116559 m!132495))

(declare-fun m!132497 () Bool)

(assert (=> start!13232 m!132497))

(check-sat (not b!116559) (not b!116561) (not b_next!2761) (not start!13232) b_and!7263 (not mapNonEmpty!4333) tp_is_empty!2797 (not b_next!2763) (not mapNonEmpty!4334) (not b!116558) (not b!116557) (not b!116568) b_and!7261)
(check-sat b_and!7261 b_and!7263 (not b_next!2761) (not b_next!2763))
(get-model)

(declare-fun d!32601 () Bool)

(declare-fun res!57128 () Bool)

(declare-fun e!76235 () Bool)

(assert (=> d!32601 (=> (not res!57128) (not e!76235))))

(declare-fun simpleValid!82 (LongMapFixedSize!1018) Bool)

(assert (=> d!32601 (= res!57128 (simpleValid!82 newMap!16))))

(assert (=> d!32601 (= (valid!495 newMap!16) e!76235)))

(declare-fun b!116672 () Bool)

(declare-fun res!57129 () Bool)

(assert (=> b!116672 (=> (not res!57129) (not e!76235))))

(declare-fun arrayCountValidKeys!0 (array!4587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!116672 (= res!57129 (= (arrayCountValidKeys!0 (_keys!4444 newMap!16) #b00000000000000000000000000000000 (size!2435 (_keys!4444 newMap!16))) (_size!558 newMap!16)))))

(declare-fun b!116673 () Bool)

(declare-fun res!57130 () Bool)

(assert (=> b!116673 (=> (not res!57130) (not e!76235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4587 (_ BitVec 32)) Bool)

(assert (=> b!116673 (= res!57130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4444 newMap!16) (mask!6941 newMap!16)))))

(declare-fun b!116674 () Bool)

(declare-datatypes ((List!1662 0))(
  ( (Nil!1659) (Cons!1658 (h!2258 (_ BitVec 64)) (t!5928 List!1662)) )
))
(declare-fun arrayNoDuplicates!0 (array!4587 (_ BitVec 32) List!1662) Bool)

(assert (=> b!116674 (= e!76235 (arrayNoDuplicates!0 (_keys!4444 newMap!16) #b00000000000000000000000000000000 Nil!1659))))

(assert (= (and d!32601 res!57128) b!116672))

(assert (= (and b!116672 res!57129) b!116673))

(assert (= (and b!116673 res!57130) b!116674))

(declare-fun m!132547 () Bool)

(assert (=> d!32601 m!132547))

(declare-fun m!132549 () Bool)

(assert (=> b!116672 m!132549))

(declare-fun m!132551 () Bool)

(assert (=> b!116673 m!132551))

(declare-fun m!132553 () Bool)

(assert (=> b!116674 m!132553))

(assert (=> b!116559 d!32601))

(declare-fun d!32603 () Bool)

(assert (=> d!32603 (= (array_inv!1361 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvsge (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116557 d!32603))

(declare-fun d!32605 () Bool)

(assert (=> d!32605 (= (array_inv!1362 (_values!2704 (v!3058 (underlying!420 thiss!992)))) (bvsge (size!2436 (_values!2704 (v!3058 (underlying!420 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!116557 d!32605))

(declare-fun d!32607 () Bool)

(declare-fun res!57131 () Bool)

(declare-fun e!76236 () Bool)

(assert (=> d!32607 (=> (not res!57131) (not e!76236))))

(assert (=> d!32607 (= res!57131 (simpleValid!82 (v!3058 (underlying!420 thiss!992))))))

(assert (=> d!32607 (= (valid!495 (v!3058 (underlying!420 thiss!992))) e!76236)))

(declare-fun b!116675 () Bool)

(declare-fun res!57132 () Bool)

(assert (=> b!116675 (=> (not res!57132) (not e!76236))))

(assert (=> b!116675 (= res!57132 (= (arrayCountValidKeys!0 (_keys!4444 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000000 (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))) (_size!558 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116676 () Bool)

(declare-fun res!57133 () Bool)

(assert (=> b!116676 (=> (not res!57133) (not e!76236))))

(assert (=> b!116676 (= res!57133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116677 () Bool)

(assert (=> b!116677 (= e!76236 (arrayNoDuplicates!0 (_keys!4444 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000000 Nil!1659))))

(assert (= (and d!32607 res!57131) b!116675))

(assert (= (and b!116675 res!57132) b!116676))

(assert (= (and b!116676 res!57133) b!116677))

(declare-fun m!132555 () Bool)

(assert (=> d!32607 m!132555))

(declare-fun m!132557 () Bool)

(assert (=> b!116675 m!132557))

(declare-fun m!132559 () Bool)

(assert (=> b!116676 m!132559))

(declare-fun m!132561 () Bool)

(assert (=> b!116677 m!132561))

(assert (=> b!116561 d!32607))

(declare-fun d!32609 () Bool)

(assert (=> d!32609 (= (valid!496 thiss!992) (valid!495 (v!3058 (underlying!420 thiss!992))))))

(declare-fun bs!4742 () Bool)

(assert (= bs!4742 d!32609))

(assert (=> bs!4742 m!132487))

(assert (=> start!13232 d!32609))

(declare-fun d!32611 () Bool)

(assert (=> d!32611 (= (array_inv!1361 (_keys!4444 newMap!16)) (bvsge (size!2435 (_keys!4444 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116558 d!32611))

(declare-fun d!32613 () Bool)

(assert (=> d!32613 (= (array_inv!1362 (_values!2704 newMap!16)) (bvsge (size!2436 (_values!2704 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!116558 d!32613))

(declare-fun b!116720 () Bool)

(declare-datatypes ((Unit!3601 0))(
  ( (Unit!3602) )
))
(declare-fun e!76265 () Unit!3601)

(declare-fun lt!60501 () Unit!3601)

(assert (=> b!116720 (= e!76265 lt!60501)))

(declare-fun lt!60498 () ListLongMap!1611)

(declare-fun getCurrentListMapNoExtraKeys!126 (array!4587 array!4589 (_ BitVec 32) (_ BitVec 32) V!3377 V!3377 (_ BitVec 32) Int) ListLongMap!1611)

(assert (=> b!116720 (= lt!60498 (getCurrentListMapNoExtraKeys!126 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60495 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60500 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60500 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60496 () Unit!3601)

(declare-fun addStillContains!82 (ListLongMap!1611 (_ BitVec 64) V!3377 (_ BitVec 64)) Unit!3601)

(assert (=> b!116720 (= lt!60496 (addStillContains!82 lt!60498 lt!60495 (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) lt!60500))))

(declare-fun contains!852 (ListLongMap!1611 (_ BitVec 64)) Bool)

(declare-fun +!159 (ListLongMap!1611 tuple2!2494) ListLongMap!1611)

(assert (=> b!116720 (contains!852 (+!159 lt!60498 (tuple2!2495 lt!60495 (zeroValue!2588 (v!3058 (underlying!420 thiss!992))))) lt!60500)))

(declare-fun lt!60493 () Unit!3601)

(assert (=> b!116720 (= lt!60493 lt!60496)))

(declare-fun lt!60492 () ListLongMap!1611)

(assert (=> b!116720 (= lt!60492 (getCurrentListMapNoExtraKeys!126 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60502 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60502 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60486 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60486 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60487 () Unit!3601)

(declare-fun addApplyDifferent!82 (ListLongMap!1611 (_ BitVec 64) V!3377 (_ BitVec 64)) Unit!3601)

(assert (=> b!116720 (= lt!60487 (addApplyDifferent!82 lt!60492 lt!60502 (minValue!2588 (v!3058 (underlying!420 thiss!992))) lt!60486))))

(declare-fun apply!106 (ListLongMap!1611 (_ BitVec 64)) V!3377)

(assert (=> b!116720 (= (apply!106 (+!159 lt!60492 (tuple2!2495 lt!60502 (minValue!2588 (v!3058 (underlying!420 thiss!992))))) lt!60486) (apply!106 lt!60492 lt!60486))))

(declare-fun lt!60484 () Unit!3601)

(assert (=> b!116720 (= lt!60484 lt!60487)))

(declare-fun lt!60485 () ListLongMap!1611)

(assert (=> b!116720 (= lt!60485 (getCurrentListMapNoExtraKeys!126 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60499 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60499 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60503 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60503 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!60490 () Unit!3601)

(assert (=> b!116720 (= lt!60490 (addApplyDifferent!82 lt!60485 lt!60499 (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) lt!60503))))

(assert (=> b!116720 (= (apply!106 (+!159 lt!60485 (tuple2!2495 lt!60499 (zeroValue!2588 (v!3058 (underlying!420 thiss!992))))) lt!60503) (apply!106 lt!60485 lt!60503))))

(declare-fun lt!60504 () Unit!3601)

(assert (=> b!116720 (= lt!60504 lt!60490)))

(declare-fun lt!60483 () ListLongMap!1611)

(assert (=> b!116720 (= lt!60483 (getCurrentListMapNoExtraKeys!126 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun lt!60489 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60489 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!60488 () (_ BitVec 64))

(assert (=> b!116720 (= lt!60488 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!116720 (= lt!60501 (addApplyDifferent!82 lt!60483 lt!60489 (minValue!2588 (v!3058 (underlying!420 thiss!992))) lt!60488))))

(assert (=> b!116720 (= (apply!106 (+!159 lt!60483 (tuple2!2495 lt!60489 (minValue!2588 (v!3058 (underlying!420 thiss!992))))) lt!60488) (apply!106 lt!60483 lt!60488))))

(declare-fun call!12477 () ListLongMap!1611)

(declare-fun bm!12469 () Bool)

(declare-fun call!12473 () ListLongMap!1611)

(declare-fun call!12472 () ListLongMap!1611)

(declare-fun c!20630 () Bool)

(declare-fun c!20629 () Bool)

(declare-fun call!12475 () ListLongMap!1611)

(assert (=> bm!12469 (= call!12473 (+!159 (ite c!20630 call!12475 (ite c!20629 call!12477 call!12472)) (ite (or c!20630 c!20629) (tuple2!2495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2588 (v!3058 (underlying!420 thiss!992)))) (tuple2!2495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2588 (v!3058 (underlying!420 thiss!992)))))))))

(declare-fun b!116721 () Bool)

(declare-fun Unit!3603 () Unit!3601)

(assert (=> b!116721 (= e!76265 Unit!3603)))

(declare-fun bm!12470 () Bool)

(assert (=> bm!12470 (= call!12472 call!12477)))

(declare-fun d!32615 () Bool)

(declare-fun e!76274 () Bool)

(assert (=> d!32615 e!76274))

(declare-fun res!57154 () Bool)

(assert (=> d!32615 (=> (not res!57154) (not e!76274))))

(assert (=> d!32615 (= res!57154 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))))))))

(declare-fun lt!60497 () ListLongMap!1611)

(declare-fun lt!60494 () ListLongMap!1611)

(assert (=> d!32615 (= lt!60497 lt!60494)))

(declare-fun lt!60491 () Unit!3601)

(assert (=> d!32615 (= lt!60491 e!76265)))

(declare-fun c!20631 () Bool)

(declare-fun e!76269 () Bool)

(assert (=> d!32615 (= c!20631 e!76269)))

(declare-fun res!57158 () Bool)

(assert (=> d!32615 (=> (not res!57158) (not e!76269))))

(assert (=> d!32615 (= res!57158 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun e!76266 () ListLongMap!1611)

(assert (=> d!32615 (= lt!60494 e!76266)))

(assert (=> d!32615 (= c!20630 (and (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!32615 (validMask!0 (mask!6941 (v!3058 (underlying!420 thiss!992))))))

(assert (=> d!32615 (= (getCurrentListMap!502 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))) lt!60497)))

(declare-fun b!116722 () Bool)

(declare-fun res!57155 () Bool)

(assert (=> b!116722 (=> (not res!57155) (not e!76274))))

(declare-fun e!76275 () Bool)

(assert (=> b!116722 (= res!57155 e!76275)))

(declare-fun c!20627 () Bool)

(assert (=> b!116722 (= c!20627 (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!116723 () Bool)

(declare-fun e!76272 () ListLongMap!1611)

(declare-fun call!12478 () ListLongMap!1611)

(assert (=> b!116723 (= e!76272 call!12478)))

(declare-fun b!116724 () Bool)

(declare-fun e!76268 () Bool)

(assert (=> b!116724 (= e!76268 (= (apply!106 lt!60497 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2588 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116725 () Bool)

(declare-fun e!76273 () Bool)

(declare-fun get!1421 (ValueCell!1055 V!3377) V!3377)

(declare-fun dynLambda!410 (Int (_ BitVec 64)) V!3377)

(assert (=> b!116725 (= e!76273 (= (apply!106 lt!60497 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1421 (select (arr!2175 (_values!2704 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!410 (defaultEntry!2721 (v!3058 (underlying!420 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!116725 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2436 (_values!2704 (v!3058 (underlying!420 thiss!992))))))))

(assert (=> b!116725 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun bm!12471 () Bool)

(assert (=> bm!12471 (= call!12478 call!12473)))

(declare-fun b!116726 () Bool)

(declare-fun c!20628 () Bool)

(assert (=> b!116726 (= c!20628 (and (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!76263 () ListLongMap!1611)

(assert (=> b!116726 (= e!76272 e!76263)))

(declare-fun b!116727 () Bool)

(declare-fun e!76264 () Bool)

(declare-fun call!12474 () Bool)

(assert (=> b!116727 (= e!76264 (not call!12474))))

(declare-fun bm!12472 () Bool)

(assert (=> bm!12472 (= call!12477 call!12475)))

(declare-fun bm!12473 () Bool)

(declare-fun call!12476 () Bool)

(assert (=> bm!12473 (= call!12476 (contains!852 lt!60497 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!116728 () Bool)

(assert (=> b!116728 (= e!76263 call!12472)))

(declare-fun b!116729 () Bool)

(assert (=> b!116729 (= e!76266 e!76272)))

(assert (=> b!116729 (= c!20629 (and (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!12474 () Bool)

(assert (=> bm!12474 (= call!12475 (getCurrentListMapNoExtraKeys!126 (_keys!4444 (v!3058 (underlying!420 thiss!992))) (_values!2704 (v!3058 (underlying!420 thiss!992))) (mask!6941 (v!3058 (underlying!420 thiss!992))) (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) (zeroValue!2588 (v!3058 (underlying!420 thiss!992))) (minValue!2588 (v!3058 (underlying!420 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116730 () Bool)

(assert (=> b!116730 (= e!76266 (+!159 call!12473 (tuple2!2495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2588 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116731 () Bool)

(assert (=> b!116731 (= e!76263 call!12478)))

(declare-fun b!116732 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!116732 (= e!76269 (validKeyInArray!0 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116733 () Bool)

(declare-fun e!76267 () Bool)

(assert (=> b!116733 (= e!76267 (= (apply!106 lt!60497 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2588 (v!3058 (underlying!420 thiss!992)))))))

(declare-fun b!116734 () Bool)

(assert (=> b!116734 (= e!76275 e!76268)))

(declare-fun res!57152 () Bool)

(assert (=> b!116734 (= res!57152 call!12476)))

(assert (=> b!116734 (=> (not res!57152) (not e!76268))))

(declare-fun b!116735 () Bool)

(declare-fun res!57156 () Bool)

(assert (=> b!116735 (=> (not res!57156) (not e!76274))))

(declare-fun e!76271 () Bool)

(assert (=> b!116735 (= res!57156 e!76271)))

(declare-fun res!57157 () Bool)

(assert (=> b!116735 (=> res!57157 e!76271)))

(declare-fun e!76270 () Bool)

(assert (=> b!116735 (= res!57157 (not e!76270))))

(declare-fun res!57159 () Bool)

(assert (=> b!116735 (=> (not res!57159) (not e!76270))))

(assert (=> b!116735 (= res!57159 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116736 () Bool)

(assert (=> b!116736 (= e!76264 e!76267)))

(declare-fun res!57160 () Bool)

(assert (=> b!116736 (= res!57160 call!12474)))

(assert (=> b!116736 (=> (not res!57160) (not e!76267))))

(declare-fun b!116737 () Bool)

(assert (=> b!116737 (= e!76270 (validKeyInArray!0 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!116738 () Bool)

(assert (=> b!116738 (= e!76271 e!76273)))

(declare-fun res!57153 () Bool)

(assert (=> b!116738 (=> (not res!57153) (not e!76273))))

(assert (=> b!116738 (= res!57153 (contains!852 lt!60497 (select (arr!2174 (_keys!4444 (v!3058 (underlying!420 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!116738 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2435 (_keys!4444 (v!3058 (underlying!420 thiss!992))))))))

(declare-fun b!116739 () Bool)

(assert (=> b!116739 (= e!76274 e!76264)))

(declare-fun c!20626 () Bool)

(assert (=> b!116739 (= c!20626 (not (= (bvand (extraKeys!2510 (v!3058 (underlying!420 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!116740 () Bool)

(assert (=> b!116740 (= e!76275 (not call!12476))))

(declare-fun bm!12475 () Bool)

(assert (=> bm!12475 (= call!12474 (contains!852 lt!60497 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!32615 c!20630) b!116730))

(assert (= (and d!32615 (not c!20630)) b!116729))

(assert (= (and b!116729 c!20629) b!116723))

(assert (= (and b!116729 (not c!20629)) b!116726))

(assert (= (and b!116726 c!20628) b!116731))

(assert (= (and b!116726 (not c!20628)) b!116728))

(assert (= (or b!116731 b!116728) bm!12470))

(assert (= (or b!116723 bm!12470) bm!12472))

(assert (= (or b!116723 b!116731) bm!12471))

(assert (= (or b!116730 bm!12472) bm!12474))

(assert (= (or b!116730 bm!12471) bm!12469))

(assert (= (and d!32615 res!57158) b!116732))

(assert (= (and d!32615 c!20631) b!116720))

(assert (= (and d!32615 (not c!20631)) b!116721))

(assert (= (and d!32615 res!57154) b!116735))

(assert (= (and b!116735 res!57159) b!116737))

(assert (= (and b!116735 (not res!57157)) b!116738))

(assert (= (and b!116738 res!57153) b!116725))

(assert (= (and b!116735 res!57156) b!116722))

(assert (= (and b!116722 c!20627) b!116734))

(assert (= (and b!116722 (not c!20627)) b!116740))

(assert (= (and b!116734 res!57152) b!116724))

(assert (= (or b!116734 b!116740) bm!12473))

(assert (= (and b!116722 res!57155) b!116739))

(assert (= (and b!116739 c!20626) b!116736))

(assert (= (and b!116739 (not c!20626)) b!116727))

(assert (= (and b!116736 res!57160) b!116733))

(assert (= (or b!116736 b!116727) bm!12475))

(declare-fun b_lambda!5177 () Bool)

(assert (=> (not b_lambda!5177) (not b!116725)))

(declare-fun t!5925 () Bool)

(declare-fun tb!2229 () Bool)

(assert (=> (and b!116557 (= (defaultEntry!2721 (v!3058 (underlying!420 thiss!992))) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))) t!5925) tb!2229))

(declare-fun result!3719 () Bool)

(assert (=> tb!2229 (= result!3719 tp_is_empty!2797)))

(assert (=> b!116725 t!5925))

(declare-fun b_and!7273 () Bool)

(assert (= b_and!7261 (and (=> t!5925 result!3719) b_and!7273)))

(declare-fun tb!2231 () Bool)

(declare-fun t!5927 () Bool)

(assert (=> (and b!116558 (= (defaultEntry!2721 newMap!16) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992)))) t!5927) tb!2231))

(declare-fun result!3723 () Bool)

(assert (= result!3723 result!3719))

(assert (=> b!116725 t!5927))

(declare-fun b_and!7275 () Bool)

(assert (= b_and!7263 (and (=> t!5927 result!3723) b_and!7275)))

(declare-fun m!132563 () Bool)

(assert (=> bm!12475 m!132563))

(declare-fun m!132565 () Bool)

(assert (=> bm!12469 m!132565))

(declare-fun m!132567 () Bool)

(assert (=> b!116720 m!132567))

(declare-fun m!132569 () Bool)

(assert (=> b!116720 m!132569))

(declare-fun m!132571 () Bool)

(assert (=> b!116720 m!132571))

(declare-fun m!132573 () Bool)

(assert (=> b!116720 m!132573))

(declare-fun m!132575 () Bool)

(assert (=> b!116720 m!132575))

(declare-fun m!132577 () Bool)

(assert (=> b!116720 m!132577))

(declare-fun m!132579 () Bool)

(assert (=> b!116720 m!132579))

(declare-fun m!132581 () Bool)

(assert (=> b!116720 m!132581))

(declare-fun m!132583 () Bool)

(assert (=> b!116720 m!132583))

(declare-fun m!132585 () Bool)

(assert (=> b!116720 m!132585))

(assert (=> b!116720 m!132579))

(declare-fun m!132587 () Bool)

(assert (=> b!116720 m!132587))

(declare-fun m!132589 () Bool)

(assert (=> b!116720 m!132589))

(assert (=> b!116720 m!132583))

(declare-fun m!132591 () Bool)

(assert (=> b!116720 m!132591))

(declare-fun m!132593 () Bool)

(assert (=> b!116720 m!132593))

(declare-fun m!132595 () Bool)

(assert (=> b!116720 m!132595))

(assert (=> b!116720 m!132577))

(declare-fun m!132597 () Bool)

(assert (=> b!116720 m!132597))

(assert (=> b!116720 m!132571))

(declare-fun m!132599 () Bool)

(assert (=> b!116720 m!132599))

(declare-fun m!132601 () Bool)

(assert (=> b!116730 m!132601))

(assert (=> b!116732 m!132567))

(assert (=> b!116732 m!132567))

(declare-fun m!132603 () Bool)

(assert (=> b!116732 m!132603))

(declare-fun m!132605 () Bool)

(assert (=> b!116733 m!132605))

(assert (=> b!116738 m!132567))

(assert (=> b!116738 m!132567))

(declare-fun m!132607 () Bool)

(assert (=> b!116738 m!132607))

(declare-fun m!132609 () Bool)

(assert (=> bm!12473 m!132609))

(declare-fun m!132611 () Bool)

(assert (=> b!116724 m!132611))

(assert (=> b!116737 m!132567))

(assert (=> b!116737 m!132567))

(assert (=> b!116737 m!132603))

(assert (=> bm!12474 m!132589))

(declare-fun m!132613 () Bool)

(assert (=> d!32615 m!132613))

(assert (=> b!116725 m!132567))

(declare-fun m!132615 () Bool)

(assert (=> b!116725 m!132615))

(declare-fun m!132617 () Bool)

(assert (=> b!116725 m!132617))

(declare-fun m!132619 () Bool)

(assert (=> b!116725 m!132619))

(assert (=> b!116725 m!132615))

(assert (=> b!116725 m!132567))

(declare-fun m!132621 () Bool)

(assert (=> b!116725 m!132621))

(assert (=> b!116725 m!132617))

(assert (=> b!116568 d!32615))

(declare-fun d!32617 () Bool)

(assert (=> d!32617 (= (map!1356 newMap!16) (getCurrentListMap!502 (_keys!4444 newMap!16) (_values!2704 newMap!16) (mask!6941 newMap!16) (extraKeys!2510 newMap!16) (zeroValue!2588 newMap!16) (minValue!2588 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2721 newMap!16)))))

(declare-fun bs!4743 () Bool)

(assert (= bs!4743 d!32617))

(declare-fun m!132623 () Bool)

(assert (=> bs!4743 m!132623))

(assert (=> b!116568 d!32617))

(declare-fun mapNonEmpty!4349 () Bool)

(declare-fun mapRes!4349 () Bool)

(declare-fun tp!10685 () Bool)

(declare-fun e!76281 () Bool)

(assert (=> mapNonEmpty!4349 (= mapRes!4349 (and tp!10685 e!76281))))

(declare-fun mapValue!4349 () ValueCell!1055)

(declare-fun mapKey!4349 () (_ BitVec 32))

(declare-fun mapRest!4349 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4349 (= mapRest!4334 (store mapRest!4349 mapKey!4349 mapValue!4349))))

(declare-fun condMapEmpty!4349 () Bool)

(declare-fun mapDefault!4349 () ValueCell!1055)

(assert (=> mapNonEmpty!4333 (= condMapEmpty!4349 (= mapRest!4334 ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4349)))))

(declare-fun e!76280 () Bool)

(assert (=> mapNonEmpty!4333 (= tp!10658 (and e!76280 mapRes!4349))))

(declare-fun b!116750 () Bool)

(assert (=> b!116750 (= e!76280 tp_is_empty!2797)))

(declare-fun b!116749 () Bool)

(assert (=> b!116749 (= e!76281 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4349 () Bool)

(assert (=> mapIsEmpty!4349 mapRes!4349))

(assert (= (and mapNonEmpty!4333 condMapEmpty!4349) mapIsEmpty!4349))

(assert (= (and mapNonEmpty!4333 (not condMapEmpty!4349)) mapNonEmpty!4349))

(assert (= (and mapNonEmpty!4349 ((_ is ValueCellFull!1055) mapValue!4349)) b!116749))

(assert (= (and mapNonEmpty!4333 ((_ is ValueCellFull!1055) mapDefault!4349)) b!116750))

(declare-fun m!132625 () Bool)

(assert (=> mapNonEmpty!4349 m!132625))

(declare-fun mapNonEmpty!4350 () Bool)

(declare-fun mapRes!4350 () Bool)

(declare-fun tp!10686 () Bool)

(declare-fun e!76283 () Bool)

(assert (=> mapNonEmpty!4350 (= mapRes!4350 (and tp!10686 e!76283))))

(declare-fun mapKey!4350 () (_ BitVec 32))

(declare-fun mapValue!4350 () ValueCell!1055)

(declare-fun mapRest!4350 () (Array (_ BitVec 32) ValueCell!1055))

(assert (=> mapNonEmpty!4350 (= mapRest!4333 (store mapRest!4350 mapKey!4350 mapValue!4350))))

(declare-fun condMapEmpty!4350 () Bool)

(declare-fun mapDefault!4350 () ValueCell!1055)

(assert (=> mapNonEmpty!4334 (= condMapEmpty!4350 (= mapRest!4333 ((as const (Array (_ BitVec 32) ValueCell!1055)) mapDefault!4350)))))

(declare-fun e!76282 () Bool)

(assert (=> mapNonEmpty!4334 (= tp!10657 (and e!76282 mapRes!4350))))

(declare-fun b!116752 () Bool)

(assert (=> b!116752 (= e!76282 tp_is_empty!2797)))

(declare-fun b!116751 () Bool)

(assert (=> b!116751 (= e!76283 tp_is_empty!2797)))

(declare-fun mapIsEmpty!4350 () Bool)

(assert (=> mapIsEmpty!4350 mapRes!4350))

(assert (= (and mapNonEmpty!4334 condMapEmpty!4350) mapIsEmpty!4350))

(assert (= (and mapNonEmpty!4334 (not condMapEmpty!4350)) mapNonEmpty!4350))

(assert (= (and mapNonEmpty!4350 ((_ is ValueCellFull!1055) mapValue!4350)) b!116751))

(assert (= (and mapNonEmpty!4334 ((_ is ValueCellFull!1055) mapDefault!4350)) b!116752))

(declare-fun m!132627 () Bool)

(assert (=> mapNonEmpty!4350 m!132627))

(declare-fun b_lambda!5179 () Bool)

(assert (= b_lambda!5177 (or (and b!116557 b_free!2761) (and b!116558 b_free!2763 (= (defaultEntry!2721 newMap!16) (defaultEntry!2721 (v!3058 (underlying!420 thiss!992))))) b_lambda!5179)))

(check-sat (not bm!12473) b_and!7273 (not b!116720) (not b!116724) (not b!116676) (not b!116673) (not b_next!2761) (not d!32609) (not b!116677) (not mapNonEmpty!4349) (not b!116738) (not b!116733) tp_is_empty!2797 (not b!116732) (not b!116725) (not d!32601) (not d!32617) (not b!116730) (not b!116675) (not mapNonEmpty!4350) (not bm!12469) (not b!116674) (not b!116737) b_and!7275 (not b_lambda!5179) (not b!116672) (not bm!12475) (not d!32607) (not bm!12474) (not b_next!2763) (not d!32615))
(check-sat b_and!7273 b_and!7275 (not b_next!2761) (not b_next!2763))
