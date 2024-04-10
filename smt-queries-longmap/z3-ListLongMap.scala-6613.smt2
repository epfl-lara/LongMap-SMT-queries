; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83564 () Bool)

(assert start!83564)

(declare-fun b_free!19551 () Bool)

(declare-fun b_next!19551 () Bool)

(assert (=> start!83564 (= b_free!19551 (not b_next!19551))))

(declare-fun tp!67941 () Bool)

(declare-fun b_and!31189 () Bool)

(assert (=> start!83564 (= tp!67941 b_and!31189)))

(declare-fun b!976530 () Bool)

(declare-fun e!550336 () Bool)

(declare-fun e!550333 () Bool)

(assert (=> b!976530 (= e!550336 e!550333)))

(declare-fun res!653742 () Bool)

(assert (=> b!976530 (=> (not res!653742) (not e!550333))))

(declare-datatypes ((array!60935 0))(
  ( (array!60936 (arr!29331 (Array (_ BitVec 32) (_ BitVec 64))) (size!29810 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60935)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976530 (= res!653742 (not (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34923 0))(
  ( (V!34924 (val!11278 Int)) )
))
(declare-datatypes ((ValueCell!10746 0))(
  ( (ValueCellFull!10746 (v!13837 V!34923)) (EmptyCell!10746) )
))
(declare-datatypes ((array!60937 0))(
  ( (array!60938 (arr!29332 (Array (_ BitVec 32) ValueCell!10746)) (size!29811 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60937)

(declare-fun zeroValue!1367 () V!34923)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34923)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14514 0))(
  ( (tuple2!14515 (_1!7268 (_ BitVec 64)) (_2!7268 V!34923)) )
))
(declare-datatypes ((List!20363 0))(
  ( (Nil!20360) (Cons!20359 (h!21521 tuple2!14514) (t!28876 List!20363)) )
))
(declare-datatypes ((ListLongMap!13211 0))(
  ( (ListLongMap!13212 (toList!6621 List!20363)) )
))
(declare-fun lt!433142 () ListLongMap!13211)

(declare-fun getCurrentListMap!3853 (array!60935 array!60937 (_ BitVec 32) (_ BitVec 32) V!34923 V!34923 (_ BitVec 32) Int) ListLongMap!13211)

(assert (=> b!976530 (= lt!433142 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!653745 () Bool)

(assert (=> start!83564 (=> (not res!653745) (not e!550336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83564 (= res!653745 (validMask!0 mask!2147))))

(assert (=> start!83564 e!550336))

(assert (=> start!83564 true))

(declare-fun e!550331 () Bool)

(declare-fun array_inv!22675 (array!60937) Bool)

(assert (=> start!83564 (and (array_inv!22675 _values!1425) e!550331)))

(declare-fun tp_is_empty!22455 () Bool)

(assert (=> start!83564 tp_is_empty!22455))

(assert (=> start!83564 tp!67941))

(declare-fun array_inv!22676 (array!60935) Bool)

(assert (=> start!83564 (array_inv!22676 _keys!1717)))

(declare-fun b!976531 () Bool)

(declare-fun e!550332 () Bool)

(assert (=> b!976531 (= e!550332 tp_is_empty!22455)))

(declare-fun b!976532 () Bool)

(declare-fun res!653741 () Bool)

(assert (=> b!976532 (=> (not res!653741) (not e!550336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60935 (_ BitVec 32)) Bool)

(assert (=> b!976532 (= res!653741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!35692 () Bool)

(declare-fun mapRes!35692 () Bool)

(assert (=> mapIsEmpty!35692 mapRes!35692))

(declare-fun b!976533 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5699 (ListLongMap!13211 (_ BitVec 64)) Bool)

(assert (=> b!976533 (= e!550333 (not (contains!5699 lt!433142 (select (arr!29331 _keys!1717) i!822))))))

(declare-fun b!976534 () Bool)

(declare-fun res!653746 () Bool)

(assert (=> b!976534 (=> (not res!653746) (not e!550336))))

(assert (=> b!976534 (= res!653746 (and (= (size!29811 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29810 _keys!1717) (size!29811 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976535 () Bool)

(declare-fun res!653744 () Bool)

(assert (=> b!976535 (=> (not res!653744) (not e!550336))))

(assert (=> b!976535 (= res!653744 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29810 _keys!1717))))))

(declare-fun mapNonEmpty!35692 () Bool)

(declare-fun tp!67940 () Bool)

(assert (=> mapNonEmpty!35692 (= mapRes!35692 (and tp!67940 e!550332))))

(declare-fun mapKey!35692 () (_ BitVec 32))

(declare-fun mapValue!35692 () ValueCell!10746)

(declare-fun mapRest!35692 () (Array (_ BitVec 32) ValueCell!10746))

(assert (=> mapNonEmpty!35692 (= (arr!29332 _values!1425) (store mapRest!35692 mapKey!35692 mapValue!35692))))

(declare-fun b!976536 () Bool)

(declare-fun res!653747 () Bool)

(assert (=> b!976536 (=> (not res!653747) (not e!550336))))

(declare-datatypes ((List!20364 0))(
  ( (Nil!20361) (Cons!20360 (h!21522 (_ BitVec 64)) (t!28877 List!20364)) )
))
(declare-fun arrayNoDuplicates!0 (array!60935 (_ BitVec 32) List!20364) Bool)

(assert (=> b!976536 (= res!653747 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20361))))

(declare-fun b!976537 () Bool)

(declare-fun e!550335 () Bool)

(assert (=> b!976537 (= e!550335 tp_is_empty!22455)))

(declare-fun b!976538 () Bool)

(declare-fun res!653748 () Bool)

(assert (=> b!976538 (=> (not res!653748) (not e!550336))))

(assert (=> b!976538 (= res!653748 (contains!5699 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun b!976539 () Bool)

(assert (=> b!976539 (= e!550331 (and e!550335 mapRes!35692))))

(declare-fun condMapEmpty!35692 () Bool)

(declare-fun mapDefault!35692 () ValueCell!10746)

(assert (=> b!976539 (= condMapEmpty!35692 (= (arr!29332 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10746)) mapDefault!35692)))))

(declare-fun b!976540 () Bool)

(declare-fun res!653743 () Bool)

(assert (=> b!976540 (=> (not res!653743) (not e!550336))))

(assert (=> b!976540 (= res!653743 (validKeyInArray!0 (select (arr!29331 _keys!1717) i!822)))))

(assert (= (and start!83564 res!653745) b!976534))

(assert (= (and b!976534 res!653746) b!976532))

(assert (= (and b!976532 res!653741) b!976536))

(assert (= (and b!976536 res!653747) b!976535))

(assert (= (and b!976535 res!653744) b!976540))

(assert (= (and b!976540 res!653743) b!976538))

(assert (= (and b!976538 res!653748) b!976530))

(assert (= (and b!976530 res!653742) b!976533))

(assert (= (and b!976539 condMapEmpty!35692) mapIsEmpty!35692))

(assert (= (and b!976539 (not condMapEmpty!35692)) mapNonEmpty!35692))

(get-info :version)

(assert (= (and mapNonEmpty!35692 ((_ is ValueCellFull!10746) mapValue!35692)) b!976531))

(assert (= (and b!976539 ((_ is ValueCellFull!10746) mapDefault!35692)) b!976537))

(assert (= start!83564 b!976539))

(declare-fun m!903761 () Bool)

(assert (=> b!976538 m!903761))

(declare-fun m!903763 () Bool)

(assert (=> b!976538 m!903763))

(assert (=> b!976538 m!903761))

(assert (=> b!976538 m!903763))

(declare-fun m!903765 () Bool)

(assert (=> b!976538 m!903765))

(declare-fun m!903767 () Bool)

(assert (=> b!976530 m!903767))

(assert (=> b!976530 m!903767))

(declare-fun m!903769 () Bool)

(assert (=> b!976530 m!903769))

(declare-fun m!903771 () Bool)

(assert (=> b!976530 m!903771))

(declare-fun m!903773 () Bool)

(assert (=> start!83564 m!903773))

(declare-fun m!903775 () Bool)

(assert (=> start!83564 m!903775))

(declare-fun m!903777 () Bool)

(assert (=> start!83564 m!903777))

(declare-fun m!903779 () Bool)

(assert (=> mapNonEmpty!35692 m!903779))

(assert (=> b!976540 m!903763))

(assert (=> b!976540 m!903763))

(declare-fun m!903781 () Bool)

(assert (=> b!976540 m!903781))

(declare-fun m!903783 () Bool)

(assert (=> b!976536 m!903783))

(assert (=> b!976533 m!903763))

(assert (=> b!976533 m!903763))

(declare-fun m!903785 () Bool)

(assert (=> b!976533 m!903785))

(declare-fun m!903787 () Bool)

(assert (=> b!976532 m!903787))

(check-sat (not b!976540) (not b!976532) (not mapNonEmpty!35692) (not b!976538) (not start!83564) (not b_next!19551) (not b!976536) (not b!976530) b_and!31189 tp_is_empty!22455 (not b!976533))
(check-sat b_and!31189 (not b_next!19551))
(get-model)

(declare-fun d!116459 () Bool)

(declare-fun e!550360 () Bool)

(assert (=> d!116459 e!550360))

(declare-fun res!653775 () Bool)

(assert (=> d!116459 (=> res!653775 e!550360)))

(declare-fun lt!433157 () Bool)

(assert (=> d!116459 (= res!653775 (not lt!433157))))

(declare-fun lt!433154 () Bool)

(assert (=> d!116459 (= lt!433157 lt!433154)))

(declare-datatypes ((Unit!32475 0))(
  ( (Unit!32476) )
))
(declare-fun lt!433156 () Unit!32475)

(declare-fun e!550359 () Unit!32475)

(assert (=> d!116459 (= lt!433156 e!550359)))

(declare-fun c!99932 () Bool)

(assert (=> d!116459 (= c!99932 lt!433154)))

(declare-fun containsKey!476 (List!20363 (_ BitVec 64)) Bool)

(assert (=> d!116459 (= lt!433154 (containsKey!476 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(assert (=> d!116459 (= (contains!5699 lt!433142 (select (arr!29331 _keys!1717) i!822)) lt!433157)))

(declare-fun b!976580 () Bool)

(declare-fun lt!433155 () Unit!32475)

(assert (=> b!976580 (= e!550359 lt!433155)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!372 (List!20363 (_ BitVec 64)) Unit!32475)

(assert (=> b!976580 (= lt!433155 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(declare-datatypes ((Option!515 0))(
  ( (Some!514 (v!13839 V!34923)) (None!513) )
))
(declare-fun isDefined!381 (Option!515) Bool)

(declare-fun getValueByKey!509 (List!20363 (_ BitVec 64)) Option!515)

(assert (=> b!976580 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun b!976581 () Bool)

(declare-fun Unit!32477 () Unit!32475)

(assert (=> b!976581 (= e!550359 Unit!32477)))

(declare-fun b!976582 () Bool)

(assert (=> b!976582 (= e!550360 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822))))))

(assert (= (and d!116459 c!99932) b!976580))

(assert (= (and d!116459 (not c!99932)) b!976581))

(assert (= (and d!116459 (not res!653775)) b!976582))

(assert (=> d!116459 m!903763))

(declare-fun m!903817 () Bool)

(assert (=> d!116459 m!903817))

(assert (=> b!976580 m!903763))

(declare-fun m!903819 () Bool)

(assert (=> b!976580 m!903819))

(assert (=> b!976580 m!903763))

(declare-fun m!903821 () Bool)

(assert (=> b!976580 m!903821))

(assert (=> b!976580 m!903821))

(declare-fun m!903823 () Bool)

(assert (=> b!976580 m!903823))

(assert (=> b!976582 m!903763))

(assert (=> b!976582 m!903821))

(assert (=> b!976582 m!903821))

(assert (=> b!976582 m!903823))

(assert (=> b!976533 d!116459))

(declare-fun d!116461 () Bool)

(assert (=> d!116461 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83564 d!116461))

(declare-fun d!116463 () Bool)

(assert (=> d!116463 (= (array_inv!22675 _values!1425) (bvsge (size!29811 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83564 d!116463))

(declare-fun d!116465 () Bool)

(assert (=> d!116465 (= (array_inv!22676 _keys!1717) (bvsge (size!29810 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83564 d!116465))

(declare-fun d!116467 () Bool)

(assert (=> d!116467 (= (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (and (not (= (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976530 d!116467))

(declare-fun b!976625 () Bool)

(declare-fun res!653802 () Bool)

(declare-fun e!550398 () Bool)

(assert (=> b!976625 (=> (not res!653802) (not e!550398))))

(declare-fun e!550391 () Bool)

(assert (=> b!976625 (= res!653802 e!550391)))

(declare-fun res!653801 () Bool)

(assert (=> b!976625 (=> res!653801 e!550391)))

(declare-fun e!550390 () Bool)

(assert (=> b!976625 (= res!653801 (not e!550390))))

(declare-fun res!653800 () Bool)

(assert (=> b!976625 (=> (not res!653800) (not e!550390))))

(assert (=> b!976625 (= res!653800 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun call!41760 () ListLongMap!13211)

(declare-fun bm!41753 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3329 (array!60935 array!60937 (_ BitVec 32) (_ BitVec 32) V!34923 V!34923 (_ BitVec 32) Int) ListLongMap!13211)

(assert (=> bm!41753 (= call!41760 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976626 () Bool)

(assert (=> b!976626 (= e!550390 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976627 () Bool)

(declare-fun e!550395 () Bool)

(declare-fun call!41756 () Bool)

(assert (=> b!976627 (= e!550395 (not call!41756))))

(declare-fun b!976628 () Bool)

(declare-fun e!550389 () ListLongMap!13211)

(declare-fun call!41757 () ListLongMap!13211)

(assert (=> b!976628 (= e!550389 call!41757)))

(declare-fun b!976629 () Bool)

(declare-fun e!550399 () Bool)

(declare-fun e!550387 () Bool)

(assert (=> b!976629 (= e!550399 e!550387)))

(declare-fun res!653798 () Bool)

(declare-fun call!41758 () Bool)

(assert (=> b!976629 (= res!653798 call!41758)))

(assert (=> b!976629 (=> (not res!653798) (not e!550387))))

(declare-fun bm!41754 () Bool)

(declare-fun lt!433206 () ListLongMap!13211)

(assert (=> bm!41754 (= call!41756 (contains!5699 lt!433206 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!116469 () Bool)

(assert (=> d!116469 e!550398))

(declare-fun res!653794 () Bool)

(assert (=> d!116469 (=> (not res!653794) (not e!550398))))

(assert (=> d!116469 (= res!653794 (or (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)) (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))))

(declare-fun lt!433203 () ListLongMap!13211)

(assert (=> d!116469 (= lt!433206 lt!433203)))

(declare-fun lt!433214 () Unit!32475)

(declare-fun e!550394 () Unit!32475)

(assert (=> d!116469 (= lt!433214 e!550394)))

(declare-fun c!99950 () Bool)

(declare-fun e!550396 () Bool)

(assert (=> d!116469 (= c!99950 e!550396)))

(declare-fun res!653797 () Bool)

(assert (=> d!116469 (=> (not res!653797) (not e!550396))))

(assert (=> d!116469 (= res!653797 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun e!550388 () ListLongMap!13211)

(assert (=> d!116469 (= lt!433203 e!550388)))

(declare-fun c!99947 () Bool)

(assert (=> d!116469 (= c!99947 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116469 (validMask!0 mask!2147)))

(assert (=> d!116469 (= (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433206)))

(declare-fun bm!41755 () Bool)

(declare-fun call!41759 () ListLongMap!13211)

(assert (=> bm!41755 (= call!41757 call!41759)))

(declare-fun b!976630 () Bool)

(declare-fun Unit!32478 () Unit!32475)

(assert (=> b!976630 (= e!550394 Unit!32478)))

(declare-fun b!976631 () Bool)

(declare-fun e!550393 () Bool)

(assert (=> b!976631 (= e!550391 e!550393)))

(declare-fun res!653795 () Bool)

(assert (=> b!976631 (=> (not res!653795) (not e!550393))))

(assert (=> b!976631 (= res!653795 (contains!5699 lt!433206 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976631 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun b!976632 () Bool)

(declare-fun e!550397 () ListLongMap!13211)

(declare-fun call!41761 () ListLongMap!13211)

(assert (=> b!976632 (= e!550397 call!41761)))

(declare-fun b!976633 () Bool)

(assert (=> b!976633 (= e!550398 e!550395)))

(declare-fun c!99946 () Bool)

(assert (=> b!976633 (= c!99946 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!976634 () Bool)

(assert (=> b!976634 (= e!550388 e!550397)))

(declare-fun c!99949 () Bool)

(assert (=> b!976634 (= c!99949 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41756 () Bool)

(assert (=> bm!41756 (= call!41758 (contains!5699 lt!433206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976635 () Bool)

(assert (=> b!976635 (= e!550396 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976636 () Bool)

(assert (=> b!976636 (= e!550389 call!41761)))

(declare-fun b!976637 () Bool)

(declare-fun res!653796 () Bool)

(assert (=> b!976637 (=> (not res!653796) (not e!550398))))

(assert (=> b!976637 (= res!653796 e!550399)))

(declare-fun c!99945 () Bool)

(assert (=> b!976637 (= c!99945 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41757 () Bool)

(declare-fun call!41762 () ListLongMap!13211)

(assert (=> bm!41757 (= call!41761 call!41762)))

(declare-fun b!976638 () Bool)

(declare-fun e!550392 () Bool)

(declare-fun apply!890 (ListLongMap!13211 (_ BitVec 64)) V!34923)

(assert (=> b!976638 (= e!550392 (= (apply!890 lt!433206 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!976639 () Bool)

(assert (=> b!976639 (= e!550399 (not call!41758))))

(declare-fun bm!41758 () Bool)

(declare-fun +!2927 (ListLongMap!13211 tuple2!14514) ListLongMap!13211)

(assert (=> bm!41758 (= call!41762 (+!2927 (ite c!99947 call!41760 (ite c!99949 call!41759 call!41757)) (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun b!976640 () Bool)

(declare-fun c!99948 () Bool)

(assert (=> b!976640 (= c!99948 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!976640 (= e!550397 e!550389)))

(declare-fun b!976641 () Bool)

(declare-fun lt!433209 () Unit!32475)

(assert (=> b!976641 (= e!550394 lt!433209)))

(declare-fun lt!433223 () ListLongMap!13211)

(assert (=> b!976641 (= lt!433223 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433213 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433205 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433205 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433212 () Unit!32475)

(declare-fun addStillContains!613 (ListLongMap!13211 (_ BitVec 64) V!34923 (_ BitVec 64)) Unit!32475)

(assert (=> b!976641 (= lt!433212 (addStillContains!613 lt!433223 lt!433213 zeroValue!1367 lt!433205))))

(assert (=> b!976641 (contains!5699 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367)) lt!433205)))

(declare-fun lt!433207 () Unit!32475)

(assert (=> b!976641 (= lt!433207 lt!433212)))

(declare-fun lt!433219 () ListLongMap!13211)

(assert (=> b!976641 (= lt!433219 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433221 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433221 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433211 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433211 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433202 () Unit!32475)

(declare-fun addApplyDifferent!473 (ListLongMap!13211 (_ BitVec 64) V!34923 (_ BitVec 64)) Unit!32475)

(assert (=> b!976641 (= lt!433202 (addApplyDifferent!473 lt!433219 lt!433221 minValue!1367 lt!433211))))

(assert (=> b!976641 (= (apply!890 (+!2927 lt!433219 (tuple2!14515 lt!433221 minValue!1367)) lt!433211) (apply!890 lt!433219 lt!433211))))

(declare-fun lt!433210 () Unit!32475)

(assert (=> b!976641 (= lt!433210 lt!433202)))

(declare-fun lt!433215 () ListLongMap!13211)

(assert (=> b!976641 (= lt!433215 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433220 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433220 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433216 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433216 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun lt!433218 () Unit!32475)

(assert (=> b!976641 (= lt!433218 (addApplyDifferent!473 lt!433215 lt!433220 zeroValue!1367 lt!433216))))

(assert (=> b!976641 (= (apply!890 (+!2927 lt!433215 (tuple2!14515 lt!433220 zeroValue!1367)) lt!433216) (apply!890 lt!433215 lt!433216))))

(declare-fun lt!433208 () Unit!32475)

(assert (=> b!976641 (= lt!433208 lt!433218)))

(declare-fun lt!433222 () ListLongMap!13211)

(assert (=> b!976641 (= lt!433222 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun lt!433217 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433217 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433204 () (_ BitVec 64))

(assert (=> b!976641 (= lt!433204 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976641 (= lt!433209 (addApplyDifferent!473 lt!433222 lt!433217 minValue!1367 lt!433204))))

(assert (=> b!976641 (= (apply!890 (+!2927 lt!433222 (tuple2!14515 lt!433217 minValue!1367)) lt!433204) (apply!890 lt!433222 lt!433204))))

(declare-fun b!976642 () Bool)

(assert (=> b!976642 (= e!550387 (= (apply!890 lt!433206 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun b!976643 () Bool)

(assert (=> b!976643 (= e!550395 e!550392)))

(declare-fun res!653799 () Bool)

(assert (=> b!976643 (= res!653799 call!41756)))

(assert (=> b!976643 (=> (not res!653799) (not e!550392))))

(declare-fun b!976644 () Bool)

(declare-fun get!15192 (ValueCell!10746 V!34923) V!34923)

(declare-fun dynLambda!1716 (Int (_ BitVec 64)) V!34923)

(assert (=> b!976644 (= e!550393 (= (apply!890 lt!433206 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15192 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976644 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29811 _values!1425)))))

(assert (=> b!976644 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun b!976645 () Bool)

(assert (=> b!976645 (= e!550388 (+!2927 call!41762 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun bm!41759 () Bool)

(assert (=> bm!41759 (= call!41759 call!41760)))

(assert (= (and d!116469 c!99947) b!976645))

(assert (= (and d!116469 (not c!99947)) b!976634))

(assert (= (and b!976634 c!99949) b!976632))

(assert (= (and b!976634 (not c!99949)) b!976640))

(assert (= (and b!976640 c!99948) b!976636))

(assert (= (and b!976640 (not c!99948)) b!976628))

(assert (= (or b!976636 b!976628) bm!41755))

(assert (= (or b!976632 bm!41755) bm!41759))

(assert (= (or b!976632 b!976636) bm!41757))

(assert (= (or b!976645 bm!41759) bm!41753))

(assert (= (or b!976645 bm!41757) bm!41758))

(assert (= (and d!116469 res!653797) b!976635))

(assert (= (and d!116469 c!99950) b!976641))

(assert (= (and d!116469 (not c!99950)) b!976630))

(assert (= (and d!116469 res!653794) b!976625))

(assert (= (and b!976625 res!653800) b!976626))

(assert (= (and b!976625 (not res!653801)) b!976631))

(assert (= (and b!976631 res!653795) b!976644))

(assert (= (and b!976625 res!653802) b!976637))

(assert (= (and b!976637 c!99945) b!976629))

(assert (= (and b!976637 (not c!99945)) b!976639))

(assert (= (and b!976629 res!653798) b!976642))

(assert (= (or b!976629 b!976639) bm!41756))

(assert (= (and b!976637 res!653796) b!976633))

(assert (= (and b!976633 c!99946) b!976643))

(assert (= (and b!976633 (not c!99946)) b!976627))

(assert (= (and b!976643 res!653799) b!976638))

(assert (= (or b!976643 b!976627) bm!41754))

(declare-fun b_lambda!14581 () Bool)

(assert (=> (not b_lambda!14581) (not b!976644)))

(declare-fun t!28881 () Bool)

(declare-fun tb!6365 () Bool)

(assert (=> (and start!83564 (= defaultEntry!1428 defaultEntry!1428) t!28881) tb!6365))

(declare-fun result!12707 () Bool)

(assert (=> tb!6365 (= result!12707 tp_is_empty!22455)))

(assert (=> b!976644 t!28881))

(declare-fun b_and!31193 () Bool)

(assert (= b_and!31189 (and (=> t!28881 result!12707) b_and!31193)))

(declare-fun m!903825 () Bool)

(assert (=> b!976642 m!903825))

(declare-fun m!903827 () Bool)

(assert (=> b!976638 m!903827))

(assert (=> b!976631 m!903767))

(assert (=> b!976631 m!903767))

(declare-fun m!903829 () Bool)

(assert (=> b!976631 m!903829))

(declare-fun m!903831 () Bool)

(assert (=> bm!41756 m!903831))

(declare-fun m!903833 () Bool)

(assert (=> bm!41758 m!903833))

(assert (=> b!976635 m!903767))

(assert (=> b!976635 m!903767))

(assert (=> b!976635 m!903769))

(declare-fun m!903835 () Bool)

(assert (=> b!976645 m!903835))

(declare-fun m!903837 () Bool)

(assert (=> b!976641 m!903837))

(declare-fun m!903839 () Bool)

(assert (=> b!976641 m!903839))

(declare-fun m!903841 () Bool)

(assert (=> b!976641 m!903841))

(declare-fun m!903843 () Bool)

(assert (=> b!976641 m!903843))

(declare-fun m!903845 () Bool)

(assert (=> b!976641 m!903845))

(declare-fun m!903847 () Bool)

(assert (=> b!976641 m!903847))

(assert (=> b!976641 m!903841))

(assert (=> b!976641 m!903845))

(declare-fun m!903849 () Bool)

(assert (=> b!976641 m!903849))

(assert (=> b!976641 m!903767))

(declare-fun m!903851 () Bool)

(assert (=> b!976641 m!903851))

(declare-fun m!903853 () Bool)

(assert (=> b!976641 m!903853))

(declare-fun m!903855 () Bool)

(assert (=> b!976641 m!903855))

(declare-fun m!903857 () Bool)

(assert (=> b!976641 m!903857))

(declare-fun m!903859 () Bool)

(assert (=> b!976641 m!903859))

(declare-fun m!903861 () Bool)

(assert (=> b!976641 m!903861))

(declare-fun m!903863 () Bool)

(assert (=> b!976641 m!903863))

(assert (=> b!976641 m!903861))

(declare-fun m!903865 () Bool)

(assert (=> b!976641 m!903865))

(assert (=> b!976641 m!903865))

(declare-fun m!903867 () Bool)

(assert (=> b!976641 m!903867))

(declare-fun m!903869 () Bool)

(assert (=> bm!41754 m!903869))

(declare-fun m!903871 () Bool)

(assert (=> b!976644 m!903871))

(assert (=> b!976644 m!903767))

(declare-fun m!903873 () Bool)

(assert (=> b!976644 m!903873))

(declare-fun m!903875 () Bool)

(assert (=> b!976644 m!903875))

(assert (=> b!976644 m!903875))

(assert (=> b!976644 m!903871))

(declare-fun m!903877 () Bool)

(assert (=> b!976644 m!903877))

(assert (=> b!976644 m!903767))

(assert (=> b!976626 m!903767))

(assert (=> b!976626 m!903767))

(assert (=> b!976626 m!903769))

(assert (=> d!116469 m!903773))

(assert (=> bm!41753 m!903855))

(assert (=> b!976530 d!116469))

(declare-fun d!116471 () Bool)

(declare-fun e!550401 () Bool)

(assert (=> d!116471 e!550401))

(declare-fun res!653803 () Bool)

(assert (=> d!116471 (=> res!653803 e!550401)))

(declare-fun lt!433227 () Bool)

(assert (=> d!116471 (= res!653803 (not lt!433227))))

(declare-fun lt!433224 () Bool)

(assert (=> d!116471 (= lt!433227 lt!433224)))

(declare-fun lt!433226 () Unit!32475)

(declare-fun e!550400 () Unit!32475)

(assert (=> d!116471 (= lt!433226 e!550400)))

(declare-fun c!99951 () Bool)

(assert (=> d!116471 (= c!99951 lt!433224)))

(assert (=> d!116471 (= lt!433224 (containsKey!476 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(assert (=> d!116471 (= (contains!5699 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29331 _keys!1717) i!822)) lt!433227)))

(declare-fun b!976648 () Bool)

(declare-fun lt!433225 () Unit!32475)

(assert (=> b!976648 (= e!550400 lt!433225)))

(assert (=> b!976648 (= lt!433225 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(assert (=> b!976648 (isDefined!381 (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun b!976649 () Bool)

(declare-fun Unit!32479 () Unit!32475)

(assert (=> b!976649 (= e!550400 Unit!32479)))

(declare-fun b!976650 () Bool)

(assert (=> b!976650 (= e!550401 (isDefined!381 (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822))))))

(assert (= (and d!116471 c!99951) b!976648))

(assert (= (and d!116471 (not c!99951)) b!976649))

(assert (= (and d!116471 (not res!653803)) b!976650))

(assert (=> d!116471 m!903763))

(declare-fun m!903879 () Bool)

(assert (=> d!116471 m!903879))

(assert (=> b!976648 m!903763))

(declare-fun m!903881 () Bool)

(assert (=> b!976648 m!903881))

(assert (=> b!976648 m!903763))

(declare-fun m!903883 () Bool)

(assert (=> b!976648 m!903883))

(assert (=> b!976648 m!903883))

(declare-fun m!903885 () Bool)

(assert (=> b!976648 m!903885))

(assert (=> b!976650 m!903763))

(assert (=> b!976650 m!903883))

(assert (=> b!976650 m!903883))

(assert (=> b!976650 m!903885))

(assert (=> b!976538 d!116471))

(declare-fun b!976651 () Bool)

(declare-fun res!653812 () Bool)

(declare-fun e!550413 () Bool)

(assert (=> b!976651 (=> (not res!653812) (not e!550413))))

(declare-fun e!550406 () Bool)

(assert (=> b!976651 (= res!653812 e!550406)))

(declare-fun res!653811 () Bool)

(assert (=> b!976651 (=> res!653811 e!550406)))

(declare-fun e!550405 () Bool)

(assert (=> b!976651 (= res!653811 (not e!550405))))

(declare-fun res!653810 () Bool)

(assert (=> b!976651 (=> (not res!653810) (not e!550405))))

(assert (=> b!976651 (= res!653810 (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun call!41767 () ListLongMap!13211)

(declare-fun bm!41760 () Bool)

(assert (=> bm!41760 (= call!41767 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!976652 () Bool)

(assert (=> b!976652 (= e!550405 (validKeyInArray!0 (select (arr!29331 _keys!1717) from!2118)))))

(declare-fun b!976653 () Bool)

(declare-fun e!550410 () Bool)

(declare-fun call!41763 () Bool)

(assert (=> b!976653 (= e!550410 (not call!41763))))

(declare-fun b!976654 () Bool)

(declare-fun e!550404 () ListLongMap!13211)

(declare-fun call!41764 () ListLongMap!13211)

(assert (=> b!976654 (= e!550404 call!41764)))

(declare-fun b!976655 () Bool)

(declare-fun e!550414 () Bool)

(declare-fun e!550402 () Bool)

(assert (=> b!976655 (= e!550414 e!550402)))

(declare-fun res!653808 () Bool)

(declare-fun call!41765 () Bool)

(assert (=> b!976655 (= res!653808 call!41765)))

(assert (=> b!976655 (=> (not res!653808) (not e!550402))))

(declare-fun bm!41761 () Bool)

(declare-fun lt!433232 () ListLongMap!13211)

(assert (=> bm!41761 (= call!41763 (contains!5699 lt!433232 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!116473 () Bool)

(assert (=> d!116473 e!550413))

(declare-fun res!653804 () Bool)

(assert (=> d!116473 (=> (not res!653804) (not e!550413))))

(assert (=> d!116473 (= res!653804 (or (bvsge from!2118 (size!29810 _keys!1717)) (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)))))))

(declare-fun lt!433229 () ListLongMap!13211)

(assert (=> d!116473 (= lt!433232 lt!433229)))

(declare-fun lt!433240 () Unit!32475)

(declare-fun e!550409 () Unit!32475)

(assert (=> d!116473 (= lt!433240 e!550409)))

(declare-fun c!99957 () Bool)

(declare-fun e!550411 () Bool)

(assert (=> d!116473 (= c!99957 e!550411)))

(declare-fun res!653807 () Bool)

(assert (=> d!116473 (=> (not res!653807) (not e!550411))))

(assert (=> d!116473 (= res!653807 (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun e!550403 () ListLongMap!13211)

(assert (=> d!116473 (= lt!433229 e!550403)))

(declare-fun c!99954 () Bool)

(assert (=> d!116473 (= c!99954 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!116473 (validMask!0 mask!2147)))

(assert (=> d!116473 (= (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!433232)))

(declare-fun bm!41762 () Bool)

(declare-fun call!41766 () ListLongMap!13211)

(assert (=> bm!41762 (= call!41764 call!41766)))

(declare-fun b!976656 () Bool)

(declare-fun Unit!32480 () Unit!32475)

(assert (=> b!976656 (= e!550409 Unit!32480)))

(declare-fun b!976657 () Bool)

(declare-fun e!550408 () Bool)

(assert (=> b!976657 (= e!550406 e!550408)))

(declare-fun res!653805 () Bool)

(assert (=> b!976657 (=> (not res!653805) (not e!550408))))

(assert (=> b!976657 (= res!653805 (contains!5699 lt!433232 (select (arr!29331 _keys!1717) from!2118)))))

(assert (=> b!976657 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun b!976658 () Bool)

(declare-fun e!550412 () ListLongMap!13211)

(declare-fun call!41768 () ListLongMap!13211)

(assert (=> b!976658 (= e!550412 call!41768)))

(declare-fun b!976659 () Bool)

(assert (=> b!976659 (= e!550413 e!550410)))

(declare-fun c!99953 () Bool)

(assert (=> b!976659 (= c!99953 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!976660 () Bool)

(assert (=> b!976660 (= e!550403 e!550412)))

(declare-fun c!99956 () Bool)

(assert (=> b!976660 (= c!99956 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41763 () Bool)

(assert (=> bm!41763 (= call!41765 (contains!5699 lt!433232 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976661 () Bool)

(assert (=> b!976661 (= e!550411 (validKeyInArray!0 (select (arr!29331 _keys!1717) from!2118)))))

(declare-fun b!976662 () Bool)

(assert (=> b!976662 (= e!550404 call!41768)))

(declare-fun b!976663 () Bool)

(declare-fun res!653806 () Bool)

(assert (=> b!976663 (=> (not res!653806) (not e!550413))))

(assert (=> b!976663 (= res!653806 e!550414)))

(declare-fun c!99952 () Bool)

(assert (=> b!976663 (= c!99952 (not (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41764 () Bool)

(declare-fun call!41769 () ListLongMap!13211)

(assert (=> bm!41764 (= call!41768 call!41769)))

(declare-fun b!976664 () Bool)

(declare-fun e!550407 () Bool)

(assert (=> b!976664 (= e!550407 (= (apply!890 lt!433232 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1367))))

(declare-fun b!976665 () Bool)

(assert (=> b!976665 (= e!550414 (not call!41765))))

(declare-fun bm!41765 () Bool)

(assert (=> bm!41765 (= call!41769 (+!2927 (ite c!99954 call!41767 (ite c!99956 call!41766 call!41764)) (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun b!976666 () Bool)

(declare-fun c!99955 () Bool)

(assert (=> b!976666 (= c!99955 (and (not (= (bvand extraKeys!1346 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1346 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!976666 (= e!550412 e!550404)))

(declare-fun b!976667 () Bool)

(declare-fun lt!433235 () Unit!32475)

(assert (=> b!976667 (= e!550409 lt!433235)))

(declare-fun lt!433249 () ListLongMap!13211)

(assert (=> b!976667 (= lt!433249 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433239 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433239 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433231 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433231 (select (arr!29331 _keys!1717) from!2118))))

(declare-fun lt!433238 () Unit!32475)

(assert (=> b!976667 (= lt!433238 (addStillContains!613 lt!433249 lt!433239 zeroValue!1367 lt!433231))))

(assert (=> b!976667 (contains!5699 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367)) lt!433231)))

(declare-fun lt!433233 () Unit!32475)

(assert (=> b!976667 (= lt!433233 lt!433238)))

(declare-fun lt!433245 () ListLongMap!13211)

(assert (=> b!976667 (= lt!433245 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433247 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433247 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433237 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433237 (select (arr!29331 _keys!1717) from!2118))))

(declare-fun lt!433228 () Unit!32475)

(assert (=> b!976667 (= lt!433228 (addApplyDifferent!473 lt!433245 lt!433247 minValue!1367 lt!433237))))

(assert (=> b!976667 (= (apply!890 (+!2927 lt!433245 (tuple2!14515 lt!433247 minValue!1367)) lt!433237) (apply!890 lt!433245 lt!433237))))

(declare-fun lt!433236 () Unit!32475)

(assert (=> b!976667 (= lt!433236 lt!433228)))

(declare-fun lt!433241 () ListLongMap!13211)

(assert (=> b!976667 (= lt!433241 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433246 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433246 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433242 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433242 (select (arr!29331 _keys!1717) from!2118))))

(declare-fun lt!433244 () Unit!32475)

(assert (=> b!976667 (= lt!433244 (addApplyDifferent!473 lt!433241 lt!433246 zeroValue!1367 lt!433242))))

(assert (=> b!976667 (= (apply!890 (+!2927 lt!433241 (tuple2!14515 lt!433246 zeroValue!1367)) lt!433242) (apply!890 lt!433241 lt!433242))))

(declare-fun lt!433234 () Unit!32475)

(assert (=> b!976667 (= lt!433234 lt!433244)))

(declare-fun lt!433248 () ListLongMap!13211)

(assert (=> b!976667 (= lt!433248 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun lt!433243 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433243 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!433230 () (_ BitVec 64))

(assert (=> b!976667 (= lt!433230 (select (arr!29331 _keys!1717) from!2118))))

(assert (=> b!976667 (= lt!433235 (addApplyDifferent!473 lt!433248 lt!433243 minValue!1367 lt!433230))))

(assert (=> b!976667 (= (apply!890 (+!2927 lt!433248 (tuple2!14515 lt!433243 minValue!1367)) lt!433230) (apply!890 lt!433248 lt!433230))))

(declare-fun b!976668 () Bool)

(assert (=> b!976668 (= e!550402 (= (apply!890 lt!433232 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1367))))

(declare-fun b!976669 () Bool)

(assert (=> b!976669 (= e!550410 e!550407)))

(declare-fun res!653809 () Bool)

(assert (=> b!976669 (= res!653809 call!41763)))

(assert (=> b!976669 (=> (not res!653809) (not e!550407))))

(declare-fun b!976670 () Bool)

(assert (=> b!976670 (= e!550408 (= (apply!890 lt!433232 (select (arr!29331 _keys!1717) from!2118)) (get!15192 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976670 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29811 _values!1425)))))

(assert (=> b!976670 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun b!976671 () Bool)

(assert (=> b!976671 (= e!550403 (+!2927 call!41769 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(declare-fun bm!41766 () Bool)

(assert (=> bm!41766 (= call!41766 call!41767)))

(assert (= (and d!116473 c!99954) b!976671))

(assert (= (and d!116473 (not c!99954)) b!976660))

(assert (= (and b!976660 c!99956) b!976658))

(assert (= (and b!976660 (not c!99956)) b!976666))

(assert (= (and b!976666 c!99955) b!976662))

(assert (= (and b!976666 (not c!99955)) b!976654))

(assert (= (or b!976662 b!976654) bm!41762))

(assert (= (or b!976658 bm!41762) bm!41766))

(assert (= (or b!976658 b!976662) bm!41764))

(assert (= (or b!976671 bm!41766) bm!41760))

(assert (= (or b!976671 bm!41764) bm!41765))

(assert (= (and d!116473 res!653807) b!976661))

(assert (= (and d!116473 c!99957) b!976667))

(assert (= (and d!116473 (not c!99957)) b!976656))

(assert (= (and d!116473 res!653804) b!976651))

(assert (= (and b!976651 res!653810) b!976652))

(assert (= (and b!976651 (not res!653811)) b!976657))

(assert (= (and b!976657 res!653805) b!976670))

(assert (= (and b!976651 res!653812) b!976663))

(assert (= (and b!976663 c!99952) b!976655))

(assert (= (and b!976663 (not c!99952)) b!976665))

(assert (= (and b!976655 res!653808) b!976668))

(assert (= (or b!976655 b!976665) bm!41763))

(assert (= (and b!976663 res!653806) b!976659))

(assert (= (and b!976659 c!99953) b!976669))

(assert (= (and b!976659 (not c!99953)) b!976653))

(assert (= (and b!976669 res!653809) b!976664))

(assert (= (or b!976669 b!976653) bm!41761))

(declare-fun b_lambda!14583 () Bool)

(assert (=> (not b_lambda!14583) (not b!976670)))

(assert (=> b!976670 t!28881))

(declare-fun b_and!31195 () Bool)

(assert (= b_and!31193 (and (=> t!28881 result!12707) b_and!31195)))

(declare-fun m!903887 () Bool)

(assert (=> b!976668 m!903887))

(declare-fun m!903889 () Bool)

(assert (=> b!976664 m!903889))

(declare-fun m!903891 () Bool)

(assert (=> b!976657 m!903891))

(assert (=> b!976657 m!903891))

(declare-fun m!903893 () Bool)

(assert (=> b!976657 m!903893))

(declare-fun m!903895 () Bool)

(assert (=> bm!41763 m!903895))

(declare-fun m!903897 () Bool)

(assert (=> bm!41765 m!903897))

(assert (=> b!976661 m!903891))

(assert (=> b!976661 m!903891))

(declare-fun m!903899 () Bool)

(assert (=> b!976661 m!903899))

(declare-fun m!903901 () Bool)

(assert (=> b!976671 m!903901))

(declare-fun m!903903 () Bool)

(assert (=> b!976667 m!903903))

(declare-fun m!903905 () Bool)

(assert (=> b!976667 m!903905))

(declare-fun m!903907 () Bool)

(assert (=> b!976667 m!903907))

(declare-fun m!903909 () Bool)

(assert (=> b!976667 m!903909))

(declare-fun m!903911 () Bool)

(assert (=> b!976667 m!903911))

(declare-fun m!903913 () Bool)

(assert (=> b!976667 m!903913))

(assert (=> b!976667 m!903907))

(assert (=> b!976667 m!903911))

(declare-fun m!903915 () Bool)

(assert (=> b!976667 m!903915))

(assert (=> b!976667 m!903891))

(declare-fun m!903917 () Bool)

(assert (=> b!976667 m!903917))

(declare-fun m!903919 () Bool)

(assert (=> b!976667 m!903919))

(declare-fun m!903921 () Bool)

(assert (=> b!976667 m!903921))

(declare-fun m!903923 () Bool)

(assert (=> b!976667 m!903923))

(declare-fun m!903925 () Bool)

(assert (=> b!976667 m!903925))

(declare-fun m!903927 () Bool)

(assert (=> b!976667 m!903927))

(declare-fun m!903929 () Bool)

(assert (=> b!976667 m!903929))

(assert (=> b!976667 m!903927))

(declare-fun m!903931 () Bool)

(assert (=> b!976667 m!903931))

(assert (=> b!976667 m!903931))

(declare-fun m!903933 () Bool)

(assert (=> b!976667 m!903933))

(declare-fun m!903935 () Bool)

(assert (=> bm!41761 m!903935))

(assert (=> b!976670 m!903871))

(assert (=> b!976670 m!903891))

(declare-fun m!903937 () Bool)

(assert (=> b!976670 m!903937))

(declare-fun m!903939 () Bool)

(assert (=> b!976670 m!903939))

(assert (=> b!976670 m!903939))

(assert (=> b!976670 m!903871))

(declare-fun m!903941 () Bool)

(assert (=> b!976670 m!903941))

(assert (=> b!976670 m!903891))

(assert (=> b!976652 m!903891))

(assert (=> b!976652 m!903891))

(assert (=> b!976652 m!903899))

(assert (=> d!116473 m!903773))

(assert (=> bm!41760 m!903921))

(assert (=> b!976538 d!116473))

(declare-fun d!116475 () Bool)

(assert (=> d!116475 (= (validKeyInArray!0 (select (arr!29331 _keys!1717) i!822)) (and (not (= (select (arr!29331 _keys!1717) i!822) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29331 _keys!1717) i!822) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976540 d!116475))

(declare-fun d!116477 () Bool)

(declare-fun res!653821 () Bool)

(declare-fun e!550424 () Bool)

(assert (=> d!116477 (=> res!653821 e!550424)))

(assert (=> d!116477 (= res!653821 (bvsge #b00000000000000000000000000000000 (size!29810 _keys!1717)))))

(assert (=> d!116477 (= (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20361) e!550424)))

(declare-fun b!976682 () Bool)

(declare-fun e!550426 () Bool)

(declare-fun call!41772 () Bool)

(assert (=> b!976682 (= e!550426 call!41772)))

(declare-fun bm!41769 () Bool)

(declare-fun c!99960 () Bool)

(assert (=> bm!41769 (= call!41772 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99960 (Cons!20360 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) Nil!20361) Nil!20361)))))

(declare-fun b!976683 () Bool)

(declare-fun e!550423 () Bool)

(declare-fun contains!5701 (List!20364 (_ BitVec 64)) Bool)

(assert (=> b!976683 (= e!550423 (contains!5701 Nil!20361 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976684 () Bool)

(assert (=> b!976684 (= e!550426 call!41772)))

(declare-fun b!976685 () Bool)

(declare-fun e!550425 () Bool)

(assert (=> b!976685 (= e!550425 e!550426)))

(assert (=> b!976685 (= c!99960 (validKeyInArray!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976686 () Bool)

(assert (=> b!976686 (= e!550424 e!550425)))

(declare-fun res!653819 () Bool)

(assert (=> b!976686 (=> (not res!653819) (not e!550425))))

(assert (=> b!976686 (= res!653819 (not e!550423))))

(declare-fun res!653820 () Bool)

(assert (=> b!976686 (=> (not res!653820) (not e!550423))))

(assert (=> b!976686 (= res!653820 (validKeyInArray!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116477 (not res!653821)) b!976686))

(assert (= (and b!976686 res!653820) b!976683))

(assert (= (and b!976686 res!653819) b!976685))

(assert (= (and b!976685 c!99960) b!976682))

(assert (= (and b!976685 (not c!99960)) b!976684))

(assert (= (or b!976682 b!976684) bm!41769))

(declare-fun m!903943 () Bool)

(assert (=> bm!41769 m!903943))

(declare-fun m!903945 () Bool)

(assert (=> bm!41769 m!903945))

(assert (=> b!976683 m!903943))

(assert (=> b!976683 m!903943))

(declare-fun m!903947 () Bool)

(assert (=> b!976683 m!903947))

(assert (=> b!976685 m!903943))

(assert (=> b!976685 m!903943))

(declare-fun m!903949 () Bool)

(assert (=> b!976685 m!903949))

(assert (=> b!976686 m!903943))

(assert (=> b!976686 m!903943))

(assert (=> b!976686 m!903949))

(assert (=> b!976536 d!116477))

(declare-fun bm!41772 () Bool)

(declare-fun call!41775 () Bool)

(assert (=> bm!41772 (= call!41775 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116479 () Bool)

(declare-fun res!653827 () Bool)

(declare-fun e!550434 () Bool)

(assert (=> d!116479 (=> res!653827 e!550434)))

(assert (=> d!116479 (= res!653827 (bvsge #b00000000000000000000000000000000 (size!29810 _keys!1717)))))

(assert (=> d!116479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!550434)))

(declare-fun b!976695 () Bool)

(declare-fun e!550435 () Bool)

(assert (=> b!976695 (= e!550435 call!41775)))

(declare-fun b!976696 () Bool)

(declare-fun e!550433 () Bool)

(assert (=> b!976696 (= e!550433 call!41775)))

(declare-fun b!976697 () Bool)

(assert (=> b!976697 (= e!550433 e!550435)))

(declare-fun lt!433257 () (_ BitVec 64))

(assert (=> b!976697 (= lt!433257 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000))))

(declare-fun lt!433256 () Unit!32475)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60935 (_ BitVec 64) (_ BitVec 32)) Unit!32475)

(assert (=> b!976697 (= lt!433256 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433257 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60935 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!976697 (arrayContainsKey!0 _keys!1717 lt!433257 #b00000000000000000000000000000000)))

(declare-fun lt!433258 () Unit!32475)

(assert (=> b!976697 (= lt!433258 lt!433256)))

(declare-fun res!653826 () Bool)

(declare-datatypes ((SeekEntryResult!9201 0))(
  ( (MissingZero!9201 (index!39175 (_ BitVec 32))) (Found!9201 (index!39176 (_ BitVec 32))) (Intermediate!9201 (undefined!10013 Bool) (index!39177 (_ BitVec 32)) (x!84499 (_ BitVec 32))) (Undefined!9201) (MissingVacant!9201 (index!39178 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60935 (_ BitVec 32)) SeekEntryResult!9201)

(assert (=> b!976697 (= res!653826 (= (seekEntryOrOpen!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9201 #b00000000000000000000000000000000)))))

(assert (=> b!976697 (=> (not res!653826) (not e!550435))))

(declare-fun b!976698 () Bool)

(assert (=> b!976698 (= e!550434 e!550433)))

(declare-fun c!99963 () Bool)

(assert (=> b!976698 (= c!99963 (validKeyInArray!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116479 (not res!653827)) b!976698))

(assert (= (and b!976698 c!99963) b!976697))

(assert (= (and b!976698 (not c!99963)) b!976696))

(assert (= (and b!976697 res!653826) b!976695))

(assert (= (or b!976695 b!976696) bm!41772))

(declare-fun m!903951 () Bool)

(assert (=> bm!41772 m!903951))

(assert (=> b!976697 m!903943))

(declare-fun m!903953 () Bool)

(assert (=> b!976697 m!903953))

(declare-fun m!903955 () Bool)

(assert (=> b!976697 m!903955))

(assert (=> b!976697 m!903943))

(declare-fun m!903957 () Bool)

(assert (=> b!976697 m!903957))

(assert (=> b!976698 m!903943))

(assert (=> b!976698 m!903943))

(assert (=> b!976698 m!903949))

(assert (=> b!976532 d!116479))

(declare-fun condMapEmpty!35698 () Bool)

(declare-fun mapDefault!35698 () ValueCell!10746)

(assert (=> mapNonEmpty!35692 (= condMapEmpty!35698 (= mapRest!35692 ((as const (Array (_ BitVec 32) ValueCell!10746)) mapDefault!35698)))))

(declare-fun e!550441 () Bool)

(declare-fun mapRes!35698 () Bool)

(assert (=> mapNonEmpty!35692 (= tp!67940 (and e!550441 mapRes!35698))))

(declare-fun mapIsEmpty!35698 () Bool)

(assert (=> mapIsEmpty!35698 mapRes!35698))

(declare-fun mapNonEmpty!35698 () Bool)

(declare-fun tp!67950 () Bool)

(declare-fun e!550440 () Bool)

(assert (=> mapNonEmpty!35698 (= mapRes!35698 (and tp!67950 e!550440))))

(declare-fun mapKey!35698 () (_ BitVec 32))

(declare-fun mapRest!35698 () (Array (_ BitVec 32) ValueCell!10746))

(declare-fun mapValue!35698 () ValueCell!10746)

(assert (=> mapNonEmpty!35698 (= mapRest!35692 (store mapRest!35698 mapKey!35698 mapValue!35698))))

(declare-fun b!976705 () Bool)

(assert (=> b!976705 (= e!550440 tp_is_empty!22455)))

(declare-fun b!976706 () Bool)

(assert (=> b!976706 (= e!550441 tp_is_empty!22455)))

(assert (= (and mapNonEmpty!35692 condMapEmpty!35698) mapIsEmpty!35698))

(assert (= (and mapNonEmpty!35692 (not condMapEmpty!35698)) mapNonEmpty!35698))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10746) mapValue!35698)) b!976705))

(assert (= (and mapNonEmpty!35692 ((_ is ValueCellFull!10746) mapDefault!35698)) b!976706))

(declare-fun m!903959 () Bool)

(assert (=> mapNonEmpty!35698 m!903959))

(declare-fun b_lambda!14585 () Bool)

(assert (= b_lambda!14583 (or (and start!83564 b_free!19551) b_lambda!14585)))

(declare-fun b_lambda!14587 () Bool)

(assert (= b_lambda!14581 (or (and start!83564 b_free!19551) b_lambda!14587)))

(check-sat (not d!116471) (not bm!41763) (not b!976626) (not b!976638) (not b!976642) (not bm!41772) (not b!976631) (not b!976664) (not b!976671) (not b!976641) (not b!976650) (not mapNonEmpty!35698) (not bm!41769) (not b!976698) (not b!976648) (not b_lambda!14587) (not b!976686) (not b!976580) (not bm!41756) (not b!976644) b_and!31195 (not b!976582) (not bm!41760) (not b!976683) (not b_lambda!14585) (not d!116459) (not b!976635) (not b!976645) (not bm!41754) (not d!116473) (not b!976667) (not bm!41758) (not b!976668) (not d!116469) (not b!976661) (not b!976685) (not b_next!19551) (not b!976657) (not bm!41761) (not bm!41765) (not bm!41753) (not b!976652) (not b!976697) tp_is_empty!22455 (not b!976670))
(check-sat b_and!31195 (not b_next!19551))
(get-model)

(assert (=> b!976626 d!116467))

(declare-fun d!116481 () Bool)

(declare-fun get!15193 (Option!515) V!34923)

(assert (=> d!116481 (= (apply!890 lt!433232 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15193 (getValueByKey!509 (toList!6621 lt!433232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27623 () Bool)

(assert (= bs!27623 d!116481))

(declare-fun m!903961 () Bool)

(assert (=> bs!27623 m!903961))

(assert (=> bs!27623 m!903961))

(declare-fun m!903963 () Bool)

(assert (=> bs!27623 m!903963))

(assert (=> b!976664 d!116481))

(declare-fun d!116483 () Bool)

(declare-fun isEmpty!716 (Option!515) Bool)

(assert (=> d!116483 (= (isDefined!381 (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822))) (not (isEmpty!716 (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))))

(declare-fun bs!27624 () Bool)

(assert (= bs!27624 d!116483))

(assert (=> bs!27624 m!903883))

(declare-fun m!903965 () Bool)

(assert (=> bs!27624 m!903965))

(assert (=> b!976650 d!116483))

(declare-fun e!550446 () Option!515)

(declare-fun b!976715 () Bool)

(assert (=> b!976715 (= e!550446 (Some!514 (_2!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))))

(declare-fun b!976717 () Bool)

(declare-fun e!550447 () Option!515)

(assert (=> b!976717 (= e!550447 (getValueByKey!509 (t!28876 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun c!99968 () Bool)

(declare-fun d!116485 () Bool)

(assert (=> d!116485 (= c!99968 (and ((_ is Cons!20359) (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29331 _keys!1717) i!822))))))

(assert (=> d!116485 (= (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)) e!550446)))

(declare-fun b!976716 () Bool)

(assert (=> b!976716 (= e!550446 e!550447)))

(declare-fun c!99969 () Bool)

(assert (=> b!976716 (= c!99969 (and ((_ is Cons!20359) (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (not (= (_1!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29331 _keys!1717) i!822)))))))

(declare-fun b!976718 () Bool)

(assert (=> b!976718 (= e!550447 None!513)))

(assert (= (and d!116485 c!99968) b!976715))

(assert (= (and d!116485 (not c!99968)) b!976716))

(assert (= (and b!976716 c!99969) b!976717))

(assert (= (and b!976716 (not c!99969)) b!976718))

(assert (=> b!976717 m!903763))

(declare-fun m!903967 () Bool)

(assert (=> b!976717 m!903967))

(assert (=> b!976650 d!116485))

(declare-fun d!116487 () Bool)

(assert (=> d!116487 (= (apply!890 lt!433206 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15193 (getValueByKey!509 (toList!6621 lt!433206) (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(declare-fun bs!27625 () Bool)

(assert (= bs!27625 d!116487))

(assert (=> bs!27625 m!903767))

(declare-fun m!903969 () Bool)

(assert (=> bs!27625 m!903969))

(assert (=> bs!27625 m!903969))

(declare-fun m!903971 () Bool)

(assert (=> bs!27625 m!903971))

(assert (=> b!976644 d!116487))

(declare-fun d!116489 () Bool)

(declare-fun c!99972 () Bool)

(assert (=> d!116489 (= c!99972 ((_ is ValueCellFull!10746) (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun e!550450 () V!34923)

(assert (=> d!116489 (= (get!15192 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!550450)))

(declare-fun b!976723 () Bool)

(declare-fun get!15194 (ValueCell!10746 V!34923) V!34923)

(assert (=> b!976723 (= e!550450 (get!15194 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976724 () Bool)

(declare-fun get!15195 (ValueCell!10746 V!34923) V!34923)

(assert (=> b!976724 (= e!550450 (get!15195 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116489 c!99972) b!976723))

(assert (= (and d!116489 (not c!99972)) b!976724))

(assert (=> b!976723 m!903875))

(assert (=> b!976723 m!903871))

(declare-fun m!903973 () Bool)

(assert (=> b!976723 m!903973))

(assert (=> b!976724 m!903875))

(assert (=> b!976724 m!903871))

(declare-fun m!903975 () Bool)

(assert (=> b!976724 m!903975))

(assert (=> b!976644 d!116489))

(declare-fun d!116491 () Bool)

(declare-fun e!550453 () Bool)

(assert (=> d!116491 e!550453))

(declare-fun res!653832 () Bool)

(assert (=> d!116491 (=> (not res!653832) (not e!550453))))

(declare-fun lt!433268 () ListLongMap!13211)

(assert (=> d!116491 (= res!653832 (contains!5699 lt!433268 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433270 () List!20363)

(assert (=> d!116491 (= lt!433268 (ListLongMap!13212 lt!433270))))

(declare-fun lt!433267 () Unit!32475)

(declare-fun lt!433269 () Unit!32475)

(assert (=> d!116491 (= lt!433267 lt!433269)))

(assert (=> d!116491 (= (getValueByKey!509 lt!433270 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lemmaContainsTupThenGetReturnValue!268 (List!20363 (_ BitVec 64) V!34923) Unit!32475)

(assert (=> d!116491 (= lt!433269 (lemmaContainsTupThenGetReturnValue!268 lt!433270 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun insertStrictlySorted!325 (List!20363 (_ BitVec 64) V!34923) List!20363)

(assert (=> d!116491 (= lt!433270 (insertStrictlySorted!325 (toList!6621 call!41762) (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116491 (= (+!2927 call!41762 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433268)))

(declare-fun b!976729 () Bool)

(declare-fun res!653833 () Bool)

(assert (=> b!976729 (=> (not res!653833) (not e!550453))))

(assert (=> b!976729 (= res!653833 (= (getValueByKey!509 (toList!6621 lt!433268) (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!976730 () Bool)

(declare-fun contains!5702 (List!20363 tuple2!14514) Bool)

(assert (=> b!976730 (= e!550453 (contains!5702 (toList!6621 lt!433268) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116491 res!653832) b!976729))

(assert (= (and b!976729 res!653833) b!976730))

(declare-fun m!903977 () Bool)

(assert (=> d!116491 m!903977))

(declare-fun m!903979 () Bool)

(assert (=> d!116491 m!903979))

(declare-fun m!903981 () Bool)

(assert (=> d!116491 m!903981))

(declare-fun m!903983 () Bool)

(assert (=> d!116491 m!903983))

(declare-fun m!903985 () Bool)

(assert (=> b!976729 m!903985))

(declare-fun m!903987 () Bool)

(assert (=> b!976730 m!903987))

(assert (=> b!976645 d!116491))

(declare-fun d!116493 () Bool)

(declare-fun e!550454 () Bool)

(assert (=> d!116493 e!550454))

(declare-fun res!653834 () Bool)

(assert (=> d!116493 (=> (not res!653834) (not e!550454))))

(declare-fun lt!433272 () ListLongMap!13211)

(assert (=> d!116493 (= res!653834 (contains!5699 lt!433272 (_1!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433274 () List!20363)

(assert (=> d!116493 (= lt!433272 (ListLongMap!13212 lt!433274))))

(declare-fun lt!433271 () Unit!32475)

(declare-fun lt!433273 () Unit!32475)

(assert (=> d!116493 (= lt!433271 lt!433273)))

(assert (=> d!116493 (= (getValueByKey!509 lt!433274 (_1!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!514 (_2!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116493 (= lt!433273 (lemmaContainsTupThenGetReturnValue!268 lt!433274 (_1!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116493 (= lt!433274 (insertStrictlySorted!325 (toList!6621 (ite c!99954 call!41767 (ite c!99956 call!41766 call!41764))) (_1!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116493 (= (+!2927 (ite c!99954 call!41767 (ite c!99956 call!41766 call!41764)) (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433272)))

(declare-fun b!976731 () Bool)

(declare-fun res!653835 () Bool)

(assert (=> b!976731 (=> (not res!653835) (not e!550454))))

(assert (=> b!976731 (= res!653835 (= (getValueByKey!509 (toList!6621 lt!433272) (_1!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!514 (_2!7268 (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!976732 () Bool)

(assert (=> b!976732 (= e!550454 (contains!5702 (toList!6621 lt!433272) (ite (or c!99954 c!99956) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116493 res!653834) b!976731))

(assert (= (and b!976731 res!653835) b!976732))

(declare-fun m!903989 () Bool)

(assert (=> d!116493 m!903989))

(declare-fun m!903991 () Bool)

(assert (=> d!116493 m!903991))

(declare-fun m!903993 () Bool)

(assert (=> d!116493 m!903993))

(declare-fun m!903995 () Bool)

(assert (=> d!116493 m!903995))

(declare-fun m!903997 () Bool)

(assert (=> b!976731 m!903997))

(declare-fun m!903999 () Bool)

(assert (=> b!976732 m!903999))

(assert (=> bm!41765 d!116493))

(declare-fun d!116495 () Bool)

(declare-fun e!550456 () Bool)

(assert (=> d!116495 e!550456))

(declare-fun res!653836 () Bool)

(assert (=> d!116495 (=> res!653836 e!550456)))

(declare-fun lt!433278 () Bool)

(assert (=> d!116495 (= res!653836 (not lt!433278))))

(declare-fun lt!433275 () Bool)

(assert (=> d!116495 (= lt!433278 lt!433275)))

(declare-fun lt!433277 () Unit!32475)

(declare-fun e!550455 () Unit!32475)

(assert (=> d!116495 (= lt!433277 e!550455)))

(declare-fun c!99973 () Bool)

(assert (=> d!116495 (= c!99973 lt!433275)))

(assert (=> d!116495 (= lt!433275 (containsKey!476 (toList!6621 lt!433206) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116495 (= (contains!5699 lt!433206 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433278)))

(declare-fun b!976733 () Bool)

(declare-fun lt!433276 () Unit!32475)

(assert (=> b!976733 (= e!550455 lt!433276)))

(assert (=> b!976733 (= lt!433276 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433206) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976733 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976734 () Bool)

(declare-fun Unit!32481 () Unit!32475)

(assert (=> b!976734 (= e!550455 Unit!32481)))

(declare-fun b!976735 () Bool)

(assert (=> b!976735 (= e!550456 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116495 c!99973) b!976733))

(assert (= (and d!116495 (not c!99973)) b!976734))

(assert (= (and d!116495 (not res!653836)) b!976735))

(declare-fun m!904001 () Bool)

(assert (=> d!116495 m!904001))

(declare-fun m!904003 () Bool)

(assert (=> b!976733 m!904003))

(declare-fun m!904005 () Bool)

(assert (=> b!976733 m!904005))

(assert (=> b!976733 m!904005))

(declare-fun m!904007 () Bool)

(assert (=> b!976733 m!904007))

(assert (=> b!976735 m!904005))

(assert (=> b!976735 m!904005))

(assert (=> b!976735 m!904007))

(assert (=> bm!41754 d!116495))

(declare-fun d!116497 () Bool)

(declare-fun e!550457 () Bool)

(assert (=> d!116497 e!550457))

(declare-fun res!653837 () Bool)

(assert (=> d!116497 (=> (not res!653837) (not e!550457))))

(declare-fun lt!433280 () ListLongMap!13211)

(assert (=> d!116497 (= res!653837 (contains!5699 lt!433280 (_1!7268 (tuple2!14515 lt!433247 minValue!1367))))))

(declare-fun lt!433282 () List!20363)

(assert (=> d!116497 (= lt!433280 (ListLongMap!13212 lt!433282))))

(declare-fun lt!433279 () Unit!32475)

(declare-fun lt!433281 () Unit!32475)

(assert (=> d!116497 (= lt!433279 lt!433281)))

(assert (=> d!116497 (= (getValueByKey!509 lt!433282 (_1!7268 (tuple2!14515 lt!433247 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433247 minValue!1367))))))

(assert (=> d!116497 (= lt!433281 (lemmaContainsTupThenGetReturnValue!268 lt!433282 (_1!7268 (tuple2!14515 lt!433247 minValue!1367)) (_2!7268 (tuple2!14515 lt!433247 minValue!1367))))))

(assert (=> d!116497 (= lt!433282 (insertStrictlySorted!325 (toList!6621 lt!433245) (_1!7268 (tuple2!14515 lt!433247 minValue!1367)) (_2!7268 (tuple2!14515 lt!433247 minValue!1367))))))

(assert (=> d!116497 (= (+!2927 lt!433245 (tuple2!14515 lt!433247 minValue!1367)) lt!433280)))

(declare-fun b!976736 () Bool)

(declare-fun res!653838 () Bool)

(assert (=> b!976736 (=> (not res!653838) (not e!550457))))

(assert (=> b!976736 (= res!653838 (= (getValueByKey!509 (toList!6621 lt!433280) (_1!7268 (tuple2!14515 lt!433247 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433247 minValue!1367)))))))

(declare-fun b!976737 () Bool)

(assert (=> b!976737 (= e!550457 (contains!5702 (toList!6621 lt!433280) (tuple2!14515 lt!433247 minValue!1367)))))

(assert (= (and d!116497 res!653837) b!976736))

(assert (= (and b!976736 res!653838) b!976737))

(declare-fun m!904009 () Bool)

(assert (=> d!116497 m!904009))

(declare-fun m!904011 () Bool)

(assert (=> d!116497 m!904011))

(declare-fun m!904013 () Bool)

(assert (=> d!116497 m!904013))

(declare-fun m!904015 () Bool)

(assert (=> d!116497 m!904015))

(declare-fun m!904017 () Bool)

(assert (=> b!976736 m!904017))

(declare-fun m!904019 () Bool)

(assert (=> b!976737 m!904019))

(assert (=> b!976667 d!116497))

(declare-fun d!116499 () Bool)

(assert (=> d!116499 (= (apply!890 (+!2927 lt!433241 (tuple2!14515 lt!433246 zeroValue!1367)) lt!433242) (apply!890 lt!433241 lt!433242))))

(declare-fun lt!433285 () Unit!32475)

(declare-fun choose!1601 (ListLongMap!13211 (_ BitVec 64) V!34923 (_ BitVec 64)) Unit!32475)

(assert (=> d!116499 (= lt!433285 (choose!1601 lt!433241 lt!433246 zeroValue!1367 lt!433242))))

(declare-fun e!550460 () Bool)

(assert (=> d!116499 e!550460))

(declare-fun res!653841 () Bool)

(assert (=> d!116499 (=> (not res!653841) (not e!550460))))

(assert (=> d!116499 (= res!653841 (contains!5699 lt!433241 lt!433242))))

(assert (=> d!116499 (= (addApplyDifferent!473 lt!433241 lt!433246 zeroValue!1367 lt!433242) lt!433285)))

(declare-fun b!976741 () Bool)

(assert (=> b!976741 (= e!550460 (not (= lt!433242 lt!433246)))))

(assert (= (and d!116499 res!653841) b!976741))

(assert (=> d!116499 m!903919))

(declare-fun m!904021 () Bool)

(assert (=> d!116499 m!904021))

(assert (=> d!116499 m!903927))

(assert (=> d!116499 m!903929))

(assert (=> d!116499 m!903927))

(declare-fun m!904023 () Bool)

(assert (=> d!116499 m!904023))

(assert (=> b!976667 d!116499))

(declare-fun d!116501 () Bool)

(assert (=> d!116501 (= (apply!890 lt!433248 lt!433230) (get!15193 (getValueByKey!509 (toList!6621 lt!433248) lt!433230)))))

(declare-fun bs!27626 () Bool)

(assert (= bs!27626 d!116501))

(declare-fun m!904025 () Bool)

(assert (=> bs!27626 m!904025))

(assert (=> bs!27626 m!904025))

(declare-fun m!904027 () Bool)

(assert (=> bs!27626 m!904027))

(assert (=> b!976667 d!116501))

(declare-fun d!116503 () Bool)

(declare-fun e!550480 () Bool)

(assert (=> d!116503 e!550480))

(declare-fun res!653853 () Bool)

(assert (=> d!116503 (=> (not res!653853) (not e!550480))))

(declare-fun lt!433302 () ListLongMap!13211)

(assert (=> d!116503 (= res!653853 (not (contains!5699 lt!433302 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!550477 () ListLongMap!13211)

(assert (=> d!116503 (= lt!433302 e!550477)))

(declare-fun c!99985 () Bool)

(assert (=> d!116503 (= c!99985 (bvsge from!2118 (size!29810 _keys!1717)))))

(assert (=> d!116503 (validMask!0 mask!2147)))

(assert (=> d!116503 (= (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) lt!433302)))

(declare-fun b!976766 () Bool)

(assert (=> b!976766 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)))))

(assert (=> b!976766 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29811 _values!1425)))))

(declare-fun e!550479 () Bool)

(assert (=> b!976766 (= e!550479 (= (apply!890 lt!433302 (select (arr!29331 _keys!1717) from!2118)) (get!15192 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!976767 () Bool)

(declare-fun e!550475 () ListLongMap!13211)

(declare-fun call!41778 () ListLongMap!13211)

(assert (=> b!976767 (= e!550475 call!41778)))

(declare-fun bm!41775 () Bool)

(assert (=> bm!41775 (= call!41778 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976768 () Bool)

(declare-fun e!550478 () Bool)

(assert (=> b!976768 (= e!550478 e!550479)))

(assert (=> b!976768 (and (bvsge from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun res!653851 () Bool)

(assert (=> b!976768 (= res!653851 (contains!5699 lt!433302 (select (arr!29331 _keys!1717) from!2118)))))

(assert (=> b!976768 (=> (not res!653851) (not e!550479))))

(declare-fun b!976769 () Bool)

(declare-fun e!550481 () Bool)

(assert (=> b!976769 (= e!550478 e!550481)))

(declare-fun c!99984 () Bool)

(assert (=> b!976769 (= c!99984 (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun b!976770 () Bool)

(assert (=> b!976770 (= e!550480 e!550478)))

(declare-fun c!99982 () Bool)

(declare-fun e!550476 () Bool)

(assert (=> b!976770 (= c!99982 e!550476)))

(declare-fun res!653850 () Bool)

(assert (=> b!976770 (=> (not res!653850) (not e!550476))))

(assert (=> b!976770 (= res!653850 (bvslt from!2118 (size!29810 _keys!1717)))))

(declare-fun b!976771 () Bool)

(assert (=> b!976771 (= e!550477 (ListLongMap!13212 Nil!20360))))

(declare-fun b!976772 () Bool)

(declare-fun isEmpty!717 (ListLongMap!13211) Bool)

(assert (=> b!976772 (= e!550481 (isEmpty!717 lt!433302))))

(declare-fun b!976773 () Bool)

(declare-fun res!653852 () Bool)

(assert (=> b!976773 (=> (not res!653852) (not e!550480))))

(assert (=> b!976773 (= res!653852 (not (contains!5699 lt!433302 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976774 () Bool)

(assert (=> b!976774 (= e!550477 e!550475)))

(declare-fun c!99983 () Bool)

(assert (=> b!976774 (= c!99983 (validKeyInArray!0 (select (arr!29331 _keys!1717) from!2118)))))

(declare-fun b!976775 () Bool)

(assert (=> b!976775 (= e!550476 (validKeyInArray!0 (select (arr!29331 _keys!1717) from!2118)))))

(assert (=> b!976775 (bvsge from!2118 #b00000000000000000000000000000000)))

(declare-fun b!976776 () Bool)

(declare-fun lt!433306 () Unit!32475)

(declare-fun lt!433300 () Unit!32475)

(assert (=> b!976776 (= lt!433306 lt!433300)))

(declare-fun lt!433305 () (_ BitVec 64))

(declare-fun lt!433303 () V!34923)

(declare-fun lt!433301 () (_ BitVec 64))

(declare-fun lt!433304 () ListLongMap!13211)

(assert (=> b!976776 (not (contains!5699 (+!2927 lt!433304 (tuple2!14515 lt!433305 lt!433303)) lt!433301))))

(declare-fun addStillNotContains!229 (ListLongMap!13211 (_ BitVec 64) V!34923 (_ BitVec 64)) Unit!32475)

(assert (=> b!976776 (= lt!433300 (addStillNotContains!229 lt!433304 lt!433305 lt!433303 lt!433301))))

(assert (=> b!976776 (= lt!433301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!976776 (= lt!433303 (get!15192 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!976776 (= lt!433305 (select (arr!29331 _keys!1717) from!2118))))

(assert (=> b!976776 (= lt!433304 call!41778)))

(assert (=> b!976776 (= e!550475 (+!2927 call!41778 (tuple2!14515 (select (arr!29331 _keys!1717) from!2118) (get!15192 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!976777 () Bool)

(assert (=> b!976777 (= e!550481 (= lt!433302 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd from!2118 #b00000000000000000000000000000001) defaultEntry!1428)))))

(assert (= (and d!116503 c!99985) b!976771))

(assert (= (and d!116503 (not c!99985)) b!976774))

(assert (= (and b!976774 c!99983) b!976776))

(assert (= (and b!976774 (not c!99983)) b!976767))

(assert (= (or b!976776 b!976767) bm!41775))

(assert (= (and d!116503 res!653853) b!976773))

(assert (= (and b!976773 res!653852) b!976770))

(assert (= (and b!976770 res!653850) b!976775))

(assert (= (and b!976770 c!99982) b!976768))

(assert (= (and b!976770 (not c!99982)) b!976769))

(assert (= (and b!976768 res!653851) b!976766))

(assert (= (and b!976769 c!99984) b!976777))

(assert (= (and b!976769 (not c!99984)) b!976772))

(declare-fun b_lambda!14589 () Bool)

(assert (=> (not b_lambda!14589) (not b!976766)))

(assert (=> b!976766 t!28881))

(declare-fun b_and!31197 () Bool)

(assert (= b_and!31195 (and (=> t!28881 result!12707) b_and!31197)))

(declare-fun b_lambda!14591 () Bool)

(assert (=> (not b_lambda!14591) (not b!976776)))

(assert (=> b!976776 t!28881))

(declare-fun b_and!31199 () Bool)

(assert (= b_and!31197 (and (=> t!28881 result!12707) b_and!31199)))

(declare-fun m!904029 () Bool)

(assert (=> bm!41775 m!904029))

(assert (=> b!976776 m!903939))

(declare-fun m!904031 () Bool)

(assert (=> b!976776 m!904031))

(declare-fun m!904033 () Bool)

(assert (=> b!976776 m!904033))

(assert (=> b!976776 m!903891))

(declare-fun m!904035 () Bool)

(assert (=> b!976776 m!904035))

(declare-fun m!904037 () Bool)

(assert (=> b!976776 m!904037))

(assert (=> b!976776 m!903871))

(assert (=> b!976776 m!903939))

(assert (=> b!976776 m!903871))

(assert (=> b!976776 m!903941))

(assert (=> b!976776 m!904035))

(declare-fun m!904039 () Bool)

(assert (=> b!976772 m!904039))

(declare-fun m!904041 () Bool)

(assert (=> b!976773 m!904041))

(assert (=> b!976766 m!903939))

(assert (=> b!976766 m!903891))

(declare-fun m!904043 () Bool)

(assert (=> b!976766 m!904043))

(assert (=> b!976766 m!903891))

(assert (=> b!976766 m!903871))

(assert (=> b!976766 m!903939))

(assert (=> b!976766 m!903871))

(assert (=> b!976766 m!903941))

(assert (=> b!976768 m!903891))

(assert (=> b!976768 m!903891))

(declare-fun m!904045 () Bool)

(assert (=> b!976768 m!904045))

(assert (=> b!976774 m!903891))

(assert (=> b!976774 m!903891))

(assert (=> b!976774 m!903899))

(declare-fun m!904047 () Bool)

(assert (=> d!116503 m!904047))

(assert (=> d!116503 m!903773))

(assert (=> b!976777 m!904029))

(assert (=> b!976775 m!903891))

(assert (=> b!976775 m!903891))

(assert (=> b!976775 m!903899))

(assert (=> b!976667 d!116503))

(declare-fun d!116505 () Bool)

(assert (=> d!116505 (= (apply!890 (+!2927 lt!433245 (tuple2!14515 lt!433247 minValue!1367)) lt!433237) (apply!890 lt!433245 lt!433237))))

(declare-fun lt!433307 () Unit!32475)

(assert (=> d!116505 (= lt!433307 (choose!1601 lt!433245 lt!433247 minValue!1367 lt!433237))))

(declare-fun e!550482 () Bool)

(assert (=> d!116505 e!550482))

(declare-fun res!653854 () Bool)

(assert (=> d!116505 (=> (not res!653854) (not e!550482))))

(assert (=> d!116505 (= res!653854 (contains!5699 lt!433245 lt!433237))))

(assert (=> d!116505 (= (addApplyDifferent!473 lt!433245 lt!433247 minValue!1367 lt!433237) lt!433307)))

(declare-fun b!976778 () Bool)

(assert (=> b!976778 (= e!550482 (not (= lt!433237 lt!433247)))))

(assert (= (and d!116505 res!653854) b!976778))

(assert (=> d!116505 m!903923))

(declare-fun m!904049 () Bool)

(assert (=> d!116505 m!904049))

(assert (=> d!116505 m!903911))

(assert (=> d!116505 m!903913))

(assert (=> d!116505 m!903911))

(declare-fun m!904051 () Bool)

(assert (=> d!116505 m!904051))

(assert (=> b!976667 d!116505))

(declare-fun d!116507 () Bool)

(declare-fun e!550484 () Bool)

(assert (=> d!116507 e!550484))

(declare-fun res!653855 () Bool)

(assert (=> d!116507 (=> res!653855 e!550484)))

(declare-fun lt!433311 () Bool)

(assert (=> d!116507 (= res!653855 (not lt!433311))))

(declare-fun lt!433308 () Bool)

(assert (=> d!116507 (= lt!433311 lt!433308)))

(declare-fun lt!433310 () Unit!32475)

(declare-fun e!550483 () Unit!32475)

(assert (=> d!116507 (= lt!433310 e!550483)))

(declare-fun c!99986 () Bool)

(assert (=> d!116507 (= c!99986 lt!433308)))

(assert (=> d!116507 (= lt!433308 (containsKey!476 (toList!6621 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367))) lt!433231))))

(assert (=> d!116507 (= (contains!5699 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367)) lt!433231) lt!433311)))

(declare-fun b!976779 () Bool)

(declare-fun lt!433309 () Unit!32475)

(assert (=> b!976779 (= e!550483 lt!433309)))

(assert (=> b!976779 (= lt!433309 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367))) lt!433231))))

(assert (=> b!976779 (isDefined!381 (getValueByKey!509 (toList!6621 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367))) lt!433231))))

(declare-fun b!976780 () Bool)

(declare-fun Unit!32482 () Unit!32475)

(assert (=> b!976780 (= e!550483 Unit!32482)))

(declare-fun b!976781 () Bool)

(assert (=> b!976781 (= e!550484 (isDefined!381 (getValueByKey!509 (toList!6621 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367))) lt!433231)))))

(assert (= (and d!116507 c!99986) b!976779))

(assert (= (and d!116507 (not c!99986)) b!976780))

(assert (= (and d!116507 (not res!653855)) b!976781))

(declare-fun m!904053 () Bool)

(assert (=> d!116507 m!904053))

(declare-fun m!904055 () Bool)

(assert (=> b!976779 m!904055))

(declare-fun m!904057 () Bool)

(assert (=> b!976779 m!904057))

(assert (=> b!976779 m!904057))

(declare-fun m!904059 () Bool)

(assert (=> b!976779 m!904059))

(assert (=> b!976781 m!904057))

(assert (=> b!976781 m!904057))

(assert (=> b!976781 m!904059))

(assert (=> b!976667 d!116507))

(declare-fun d!116509 () Bool)

(assert (=> d!116509 (= (apply!890 (+!2927 lt!433248 (tuple2!14515 lt!433243 minValue!1367)) lt!433230) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433248 (tuple2!14515 lt!433243 minValue!1367))) lt!433230)))))

(declare-fun bs!27627 () Bool)

(assert (= bs!27627 d!116509))

(declare-fun m!904061 () Bool)

(assert (=> bs!27627 m!904061))

(assert (=> bs!27627 m!904061))

(declare-fun m!904063 () Bool)

(assert (=> bs!27627 m!904063))

(assert (=> b!976667 d!116509))

(declare-fun d!116511 () Bool)

(assert (=> d!116511 (= (apply!890 (+!2927 lt!433248 (tuple2!14515 lt!433243 minValue!1367)) lt!433230) (apply!890 lt!433248 lt!433230))))

(declare-fun lt!433312 () Unit!32475)

(assert (=> d!116511 (= lt!433312 (choose!1601 lt!433248 lt!433243 minValue!1367 lt!433230))))

(declare-fun e!550485 () Bool)

(assert (=> d!116511 e!550485))

(declare-fun res!653856 () Bool)

(assert (=> d!116511 (=> (not res!653856) (not e!550485))))

(assert (=> d!116511 (= res!653856 (contains!5699 lt!433248 lt!433230))))

(assert (=> d!116511 (= (addApplyDifferent!473 lt!433248 lt!433243 minValue!1367 lt!433230) lt!433312)))

(declare-fun b!976782 () Bool)

(assert (=> b!976782 (= e!550485 (not (= lt!433230 lt!433243)))))

(assert (= (and d!116511 res!653856) b!976782))

(assert (=> d!116511 m!903917))

(declare-fun m!904065 () Bool)

(assert (=> d!116511 m!904065))

(assert (=> d!116511 m!903931))

(assert (=> d!116511 m!903933))

(assert (=> d!116511 m!903931))

(declare-fun m!904067 () Bool)

(assert (=> d!116511 m!904067))

(assert (=> b!976667 d!116511))

(declare-fun d!116513 () Bool)

(declare-fun e!550486 () Bool)

(assert (=> d!116513 e!550486))

(declare-fun res!653857 () Bool)

(assert (=> d!116513 (=> (not res!653857) (not e!550486))))

(declare-fun lt!433314 () ListLongMap!13211)

(assert (=> d!116513 (= res!653857 (contains!5699 lt!433314 (_1!7268 (tuple2!14515 lt!433246 zeroValue!1367))))))

(declare-fun lt!433316 () List!20363)

(assert (=> d!116513 (= lt!433314 (ListLongMap!13212 lt!433316))))

(declare-fun lt!433313 () Unit!32475)

(declare-fun lt!433315 () Unit!32475)

(assert (=> d!116513 (= lt!433313 lt!433315)))

(assert (=> d!116513 (= (getValueByKey!509 lt!433316 (_1!7268 (tuple2!14515 lt!433246 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433246 zeroValue!1367))))))

(assert (=> d!116513 (= lt!433315 (lemmaContainsTupThenGetReturnValue!268 lt!433316 (_1!7268 (tuple2!14515 lt!433246 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433246 zeroValue!1367))))))

(assert (=> d!116513 (= lt!433316 (insertStrictlySorted!325 (toList!6621 lt!433241) (_1!7268 (tuple2!14515 lt!433246 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433246 zeroValue!1367))))))

(assert (=> d!116513 (= (+!2927 lt!433241 (tuple2!14515 lt!433246 zeroValue!1367)) lt!433314)))

(declare-fun b!976783 () Bool)

(declare-fun res!653858 () Bool)

(assert (=> b!976783 (=> (not res!653858) (not e!550486))))

(assert (=> b!976783 (= res!653858 (= (getValueByKey!509 (toList!6621 lt!433314) (_1!7268 (tuple2!14515 lt!433246 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433246 zeroValue!1367)))))))

(declare-fun b!976784 () Bool)

(assert (=> b!976784 (= e!550486 (contains!5702 (toList!6621 lt!433314) (tuple2!14515 lt!433246 zeroValue!1367)))))

(assert (= (and d!116513 res!653857) b!976783))

(assert (= (and b!976783 res!653858) b!976784))

(declare-fun m!904069 () Bool)

(assert (=> d!116513 m!904069))

(declare-fun m!904071 () Bool)

(assert (=> d!116513 m!904071))

(declare-fun m!904073 () Bool)

(assert (=> d!116513 m!904073))

(declare-fun m!904075 () Bool)

(assert (=> d!116513 m!904075))

(declare-fun m!904077 () Bool)

(assert (=> b!976783 m!904077))

(declare-fun m!904079 () Bool)

(assert (=> b!976784 m!904079))

(assert (=> b!976667 d!116513))

(declare-fun d!116515 () Bool)

(assert (=> d!116515 (= (apply!890 (+!2927 lt!433245 (tuple2!14515 lt!433247 minValue!1367)) lt!433237) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433245 (tuple2!14515 lt!433247 minValue!1367))) lt!433237)))))

(declare-fun bs!27628 () Bool)

(assert (= bs!27628 d!116515))

(declare-fun m!904081 () Bool)

(assert (=> bs!27628 m!904081))

(assert (=> bs!27628 m!904081))

(declare-fun m!904083 () Bool)

(assert (=> bs!27628 m!904083))

(assert (=> b!976667 d!116515))

(declare-fun d!116517 () Bool)

(assert (=> d!116517 (= (apply!890 lt!433241 lt!433242) (get!15193 (getValueByKey!509 (toList!6621 lt!433241) lt!433242)))))

(declare-fun bs!27629 () Bool)

(assert (= bs!27629 d!116517))

(declare-fun m!904085 () Bool)

(assert (=> bs!27629 m!904085))

(assert (=> bs!27629 m!904085))

(declare-fun m!904087 () Bool)

(assert (=> bs!27629 m!904087))

(assert (=> b!976667 d!116517))

(declare-fun d!116519 () Bool)

(assert (=> d!116519 (= (apply!890 (+!2927 lt!433241 (tuple2!14515 lt!433246 zeroValue!1367)) lt!433242) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433241 (tuple2!14515 lt!433246 zeroValue!1367))) lt!433242)))))

(declare-fun bs!27630 () Bool)

(assert (= bs!27630 d!116519))

(declare-fun m!904089 () Bool)

(assert (=> bs!27630 m!904089))

(assert (=> bs!27630 m!904089))

(declare-fun m!904091 () Bool)

(assert (=> bs!27630 m!904091))

(assert (=> b!976667 d!116519))

(declare-fun d!116521 () Bool)

(declare-fun e!550487 () Bool)

(assert (=> d!116521 e!550487))

(declare-fun res!653859 () Bool)

(assert (=> d!116521 (=> (not res!653859) (not e!550487))))

(declare-fun lt!433318 () ListLongMap!13211)

(assert (=> d!116521 (= res!653859 (contains!5699 lt!433318 (_1!7268 (tuple2!14515 lt!433239 zeroValue!1367))))))

(declare-fun lt!433320 () List!20363)

(assert (=> d!116521 (= lt!433318 (ListLongMap!13212 lt!433320))))

(declare-fun lt!433317 () Unit!32475)

(declare-fun lt!433319 () Unit!32475)

(assert (=> d!116521 (= lt!433317 lt!433319)))

(assert (=> d!116521 (= (getValueByKey!509 lt!433320 (_1!7268 (tuple2!14515 lt!433239 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433239 zeroValue!1367))))))

(assert (=> d!116521 (= lt!433319 (lemmaContainsTupThenGetReturnValue!268 lt!433320 (_1!7268 (tuple2!14515 lt!433239 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433239 zeroValue!1367))))))

(assert (=> d!116521 (= lt!433320 (insertStrictlySorted!325 (toList!6621 lt!433249) (_1!7268 (tuple2!14515 lt!433239 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433239 zeroValue!1367))))))

(assert (=> d!116521 (= (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367)) lt!433318)))

(declare-fun b!976785 () Bool)

(declare-fun res!653860 () Bool)

(assert (=> b!976785 (=> (not res!653860) (not e!550487))))

(assert (=> b!976785 (= res!653860 (= (getValueByKey!509 (toList!6621 lt!433318) (_1!7268 (tuple2!14515 lt!433239 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433239 zeroValue!1367)))))))

(declare-fun b!976786 () Bool)

(assert (=> b!976786 (= e!550487 (contains!5702 (toList!6621 lt!433318) (tuple2!14515 lt!433239 zeroValue!1367)))))

(assert (= (and d!116521 res!653859) b!976785))

(assert (= (and b!976785 res!653860) b!976786))

(declare-fun m!904093 () Bool)

(assert (=> d!116521 m!904093))

(declare-fun m!904095 () Bool)

(assert (=> d!116521 m!904095))

(declare-fun m!904097 () Bool)

(assert (=> d!116521 m!904097))

(declare-fun m!904099 () Bool)

(assert (=> d!116521 m!904099))

(declare-fun m!904101 () Bool)

(assert (=> b!976785 m!904101))

(declare-fun m!904103 () Bool)

(assert (=> b!976786 m!904103))

(assert (=> b!976667 d!116521))

(declare-fun d!116523 () Bool)

(declare-fun e!550488 () Bool)

(assert (=> d!116523 e!550488))

(declare-fun res!653861 () Bool)

(assert (=> d!116523 (=> (not res!653861) (not e!550488))))

(declare-fun lt!433322 () ListLongMap!13211)

(assert (=> d!116523 (= res!653861 (contains!5699 lt!433322 (_1!7268 (tuple2!14515 lt!433243 minValue!1367))))))

(declare-fun lt!433324 () List!20363)

(assert (=> d!116523 (= lt!433322 (ListLongMap!13212 lt!433324))))

(declare-fun lt!433321 () Unit!32475)

(declare-fun lt!433323 () Unit!32475)

(assert (=> d!116523 (= lt!433321 lt!433323)))

(assert (=> d!116523 (= (getValueByKey!509 lt!433324 (_1!7268 (tuple2!14515 lt!433243 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433243 minValue!1367))))))

(assert (=> d!116523 (= lt!433323 (lemmaContainsTupThenGetReturnValue!268 lt!433324 (_1!7268 (tuple2!14515 lt!433243 minValue!1367)) (_2!7268 (tuple2!14515 lt!433243 minValue!1367))))))

(assert (=> d!116523 (= lt!433324 (insertStrictlySorted!325 (toList!6621 lt!433248) (_1!7268 (tuple2!14515 lt!433243 minValue!1367)) (_2!7268 (tuple2!14515 lt!433243 minValue!1367))))))

(assert (=> d!116523 (= (+!2927 lt!433248 (tuple2!14515 lt!433243 minValue!1367)) lt!433322)))

(declare-fun b!976787 () Bool)

(declare-fun res!653862 () Bool)

(assert (=> b!976787 (=> (not res!653862) (not e!550488))))

(assert (=> b!976787 (= res!653862 (= (getValueByKey!509 (toList!6621 lt!433322) (_1!7268 (tuple2!14515 lt!433243 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433243 minValue!1367)))))))

(declare-fun b!976788 () Bool)

(assert (=> b!976788 (= e!550488 (contains!5702 (toList!6621 lt!433322) (tuple2!14515 lt!433243 minValue!1367)))))

(assert (= (and d!116523 res!653861) b!976787))

(assert (= (and b!976787 res!653862) b!976788))

(declare-fun m!904105 () Bool)

(assert (=> d!116523 m!904105))

(declare-fun m!904107 () Bool)

(assert (=> d!116523 m!904107))

(declare-fun m!904109 () Bool)

(assert (=> d!116523 m!904109))

(declare-fun m!904111 () Bool)

(assert (=> d!116523 m!904111))

(declare-fun m!904113 () Bool)

(assert (=> b!976787 m!904113))

(declare-fun m!904115 () Bool)

(assert (=> b!976788 m!904115))

(assert (=> b!976667 d!116523))

(declare-fun d!116525 () Bool)

(assert (=> d!116525 (contains!5699 (+!2927 lt!433249 (tuple2!14515 lt!433239 zeroValue!1367)) lt!433231)))

(declare-fun lt!433327 () Unit!32475)

(declare-fun choose!1602 (ListLongMap!13211 (_ BitVec 64) V!34923 (_ BitVec 64)) Unit!32475)

(assert (=> d!116525 (= lt!433327 (choose!1602 lt!433249 lt!433239 zeroValue!1367 lt!433231))))

(assert (=> d!116525 (contains!5699 lt!433249 lt!433231)))

(assert (=> d!116525 (= (addStillContains!613 lt!433249 lt!433239 zeroValue!1367 lt!433231) lt!433327)))

(declare-fun bs!27631 () Bool)

(assert (= bs!27631 d!116525))

(assert (=> bs!27631 m!903907))

(assert (=> bs!27631 m!903907))

(assert (=> bs!27631 m!903909))

(declare-fun m!904117 () Bool)

(assert (=> bs!27631 m!904117))

(declare-fun m!904119 () Bool)

(assert (=> bs!27631 m!904119))

(assert (=> b!976667 d!116525))

(declare-fun d!116527 () Bool)

(assert (=> d!116527 (= (apply!890 lt!433245 lt!433237) (get!15193 (getValueByKey!509 (toList!6621 lt!433245) lt!433237)))))

(declare-fun bs!27632 () Bool)

(assert (= bs!27632 d!116527))

(declare-fun m!904121 () Bool)

(assert (=> bs!27632 m!904121))

(assert (=> bs!27632 m!904121))

(declare-fun m!904123 () Bool)

(assert (=> bs!27632 m!904123))

(assert (=> b!976667 d!116527))

(assert (=> bm!41760 d!116503))

(declare-fun d!116529 () Bool)

(assert (=> d!116529 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun lt!433330 () Unit!32475)

(declare-fun choose!1603 (List!20363 (_ BitVec 64)) Unit!32475)

(assert (=> d!116529 (= lt!433330 (choose!1603 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun e!550491 () Bool)

(assert (=> d!116529 e!550491))

(declare-fun res!653865 () Bool)

(assert (=> d!116529 (=> (not res!653865) (not e!550491))))

(declare-fun isStrictlySorted!514 (List!20363) Bool)

(assert (=> d!116529 (= res!653865 (isStrictlySorted!514 (toList!6621 lt!433142)))))

(assert (=> d!116529 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)) lt!433330)))

(declare-fun b!976792 () Bool)

(assert (=> b!976792 (= e!550491 (containsKey!476 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))

(assert (= (and d!116529 res!653865) b!976792))

(assert (=> d!116529 m!903763))

(assert (=> d!116529 m!903821))

(assert (=> d!116529 m!903821))

(assert (=> d!116529 m!903823))

(assert (=> d!116529 m!903763))

(declare-fun m!904125 () Bool)

(assert (=> d!116529 m!904125))

(declare-fun m!904127 () Bool)

(assert (=> d!116529 m!904127))

(assert (=> b!976792 m!903763))

(assert (=> b!976792 m!903817))

(assert (=> b!976580 d!116529))

(declare-fun d!116531 () Bool)

(assert (=> d!116531 (= (isDefined!381 (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822))) (not (isEmpty!716 (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)))))))

(declare-fun bs!27633 () Bool)

(assert (= bs!27633 d!116531))

(assert (=> bs!27633 m!903821))

(declare-fun m!904129 () Bool)

(assert (=> bs!27633 m!904129))

(assert (=> b!976580 d!116531))

(declare-fun b!976793 () Bool)

(declare-fun e!550492 () Option!515)

(assert (=> b!976793 (= e!550492 (Some!514 (_2!7268 (h!21521 (toList!6621 lt!433142)))))))

(declare-fun e!550493 () Option!515)

(declare-fun b!976795 () Bool)

(assert (=> b!976795 (= e!550493 (getValueByKey!509 (t!28876 (toList!6621 lt!433142)) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun c!99987 () Bool)

(declare-fun d!116533 () Bool)

(assert (=> d!116533 (= c!99987 (and ((_ is Cons!20359) (toList!6621 lt!433142)) (= (_1!7268 (h!21521 (toList!6621 lt!433142))) (select (arr!29331 _keys!1717) i!822))))))

(assert (=> d!116533 (= (getValueByKey!509 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)) e!550492)))

(declare-fun b!976794 () Bool)

(assert (=> b!976794 (= e!550492 e!550493)))

(declare-fun c!99988 () Bool)

(assert (=> b!976794 (= c!99988 (and ((_ is Cons!20359) (toList!6621 lt!433142)) (not (= (_1!7268 (h!21521 (toList!6621 lt!433142))) (select (arr!29331 _keys!1717) i!822)))))))

(declare-fun b!976796 () Bool)

(assert (=> b!976796 (= e!550493 None!513)))

(assert (= (and d!116533 c!99987) b!976793))

(assert (= (and d!116533 (not c!99987)) b!976794))

(assert (= (and b!976794 c!99988) b!976795))

(assert (= (and b!976794 (not c!99988)) b!976796))

(assert (=> b!976795 m!903763))

(declare-fun m!904131 () Bool)

(assert (=> b!976795 m!904131))

(assert (=> b!976580 d!116533))

(declare-fun d!116535 () Bool)

(assert (=> d!116535 (= (validKeyInArray!0 (select (arr!29331 _keys!1717) from!2118)) (and (not (= (select (arr!29331 _keys!1717) from!2118) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29331 _keys!1717) from!2118) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976652 d!116535))

(assert (=> b!976582 d!116531))

(assert (=> b!976582 d!116533))

(declare-fun d!116537 () Bool)

(assert (=> d!116537 (= (apply!890 lt!433232 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15193 (getValueByKey!509 (toList!6621 lt!433232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27634 () Bool)

(assert (= bs!27634 d!116537))

(declare-fun m!904133 () Bool)

(assert (=> bs!27634 m!904133))

(assert (=> bs!27634 m!904133))

(declare-fun m!904135 () Bool)

(assert (=> bs!27634 m!904135))

(assert (=> b!976668 d!116537))

(declare-fun d!116539 () Bool)

(declare-fun e!550495 () Bool)

(assert (=> d!116539 e!550495))

(declare-fun res!653866 () Bool)

(assert (=> d!116539 (=> res!653866 e!550495)))

(declare-fun lt!433334 () Bool)

(assert (=> d!116539 (= res!653866 (not lt!433334))))

(declare-fun lt!433331 () Bool)

(assert (=> d!116539 (= lt!433334 lt!433331)))

(declare-fun lt!433333 () Unit!32475)

(declare-fun e!550494 () Unit!32475)

(assert (=> d!116539 (= lt!433333 e!550494)))

(declare-fun c!99989 () Bool)

(assert (=> d!116539 (= c!99989 lt!433331)))

(assert (=> d!116539 (= lt!433331 (containsKey!476 (toList!6621 lt!433206) (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> d!116539 (= (contains!5699 lt!433206 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) lt!433334)))

(declare-fun b!976797 () Bool)

(declare-fun lt!433332 () Unit!32475)

(assert (=> b!976797 (= e!550494 lt!433332)))

(assert (=> b!976797 (= lt!433332 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433206) (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976797 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976798 () Bool)

(declare-fun Unit!32483 () Unit!32475)

(assert (=> b!976798 (= e!550494 Unit!32483)))

(declare-fun b!976799 () Bool)

(assert (=> b!976799 (= e!550495 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))))

(assert (= (and d!116539 c!99989) b!976797))

(assert (= (and d!116539 (not c!99989)) b!976798))

(assert (= (and d!116539 (not res!653866)) b!976799))

(assert (=> d!116539 m!903767))

(declare-fun m!904137 () Bool)

(assert (=> d!116539 m!904137))

(assert (=> b!976797 m!903767))

(declare-fun m!904139 () Bool)

(assert (=> b!976797 m!904139))

(assert (=> b!976797 m!903767))

(assert (=> b!976797 m!903969))

(assert (=> b!976797 m!903969))

(declare-fun m!904141 () Bool)

(assert (=> b!976797 m!904141))

(assert (=> b!976799 m!903767))

(assert (=> b!976799 m!903969))

(assert (=> b!976799 m!903969))

(assert (=> b!976799 m!904141))

(assert (=> b!976631 d!116539))

(declare-fun d!116541 () Bool)

(assert (=> d!116541 (= (apply!890 lt!433232 (select (arr!29331 _keys!1717) from!2118)) (get!15193 (getValueByKey!509 (toList!6621 lt!433232) (select (arr!29331 _keys!1717) from!2118))))))

(declare-fun bs!27635 () Bool)

(assert (= bs!27635 d!116541))

(assert (=> bs!27635 m!903891))

(declare-fun m!904143 () Bool)

(assert (=> bs!27635 m!904143))

(assert (=> bs!27635 m!904143))

(declare-fun m!904145 () Bool)

(assert (=> bs!27635 m!904145))

(assert (=> b!976670 d!116541))

(declare-fun d!116543 () Bool)

(declare-fun c!99990 () Bool)

(assert (=> d!116543 (= c!99990 ((_ is ValueCellFull!10746) (select (arr!29332 _values!1425) from!2118)))))

(declare-fun e!550496 () V!34923)

(assert (=> d!116543 (= (get!15192 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)) e!550496)))

(declare-fun b!976800 () Bool)

(assert (=> b!976800 (= e!550496 (get!15194 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976801 () Bool)

(assert (=> b!976801 (= e!550496 (get!15195 (select (arr!29332 _values!1425) from!2118) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116543 c!99990) b!976800))

(assert (= (and d!116543 (not c!99990)) b!976801))

(assert (=> b!976800 m!903939))

(assert (=> b!976800 m!903871))

(declare-fun m!904147 () Bool)

(assert (=> b!976800 m!904147))

(assert (=> b!976801 m!903939))

(assert (=> b!976801 m!903871))

(declare-fun m!904149 () Bool)

(assert (=> b!976801 m!904149))

(assert (=> b!976670 d!116543))

(declare-fun d!116545 () Bool)

(declare-fun e!550497 () Bool)

(assert (=> d!116545 e!550497))

(declare-fun res!653867 () Bool)

(assert (=> d!116545 (=> (not res!653867) (not e!550497))))

(declare-fun lt!433336 () ListLongMap!13211)

(assert (=> d!116545 (= res!653867 (contains!5699 lt!433336 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(declare-fun lt!433338 () List!20363)

(assert (=> d!116545 (= lt!433336 (ListLongMap!13212 lt!433338))))

(declare-fun lt!433335 () Unit!32475)

(declare-fun lt!433337 () Unit!32475)

(assert (=> d!116545 (= lt!433335 lt!433337)))

(assert (=> d!116545 (= (getValueByKey!509 lt!433338 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116545 (= lt!433337 (lemmaContainsTupThenGetReturnValue!268 lt!433338 (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116545 (= lt!433338 (insertStrictlySorted!325 (toList!6621 call!41769) (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (=> d!116545 (= (+!2927 call!41769 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)) lt!433336)))

(declare-fun b!976802 () Bool)

(declare-fun res!653868 () Bool)

(assert (=> b!976802 (=> (not res!653868) (not e!550497))))

(assert (=> b!976802 (= res!653868 (= (getValueByKey!509 (toList!6621 lt!433336) (_1!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun b!976803 () Bool)

(assert (=> b!976803 (= e!550497 (contains!5702 (toList!6621 lt!433336) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))

(assert (= (and d!116545 res!653867) b!976802))

(assert (= (and b!976802 res!653868) b!976803))

(declare-fun m!904151 () Bool)

(assert (=> d!116545 m!904151))

(declare-fun m!904153 () Bool)

(assert (=> d!116545 m!904153))

(declare-fun m!904155 () Bool)

(assert (=> d!116545 m!904155))

(declare-fun m!904157 () Bool)

(assert (=> d!116545 m!904157))

(declare-fun m!904159 () Bool)

(assert (=> b!976802 m!904159))

(declare-fun m!904161 () Bool)

(assert (=> b!976803 m!904161))

(assert (=> b!976671 d!116545))

(declare-fun bm!41776 () Bool)

(declare-fun call!41779 () Bool)

(assert (=> bm!41776 (= call!41779 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116547 () Bool)

(declare-fun res!653870 () Bool)

(declare-fun e!550499 () Bool)

(assert (=> d!116547 (=> res!653870 e!550499)))

(assert (=> d!116547 (= res!653870 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(assert (=> d!116547 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147) e!550499)))

(declare-fun b!976804 () Bool)

(declare-fun e!550500 () Bool)

(assert (=> b!976804 (= e!550500 call!41779)))

(declare-fun b!976805 () Bool)

(declare-fun e!550498 () Bool)

(assert (=> b!976805 (= e!550498 call!41779)))

(declare-fun b!976806 () Bool)

(assert (=> b!976806 (= e!550498 e!550500)))

(declare-fun lt!433340 () (_ BitVec 64))

(assert (=> b!976806 (= lt!433340 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!433339 () Unit!32475)

(assert (=> b!976806 (= lt!433339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!976806 (arrayContainsKey!0 _keys!1717 lt!433340 #b00000000000000000000000000000000)))

(declare-fun lt!433341 () Unit!32475)

(assert (=> b!976806 (= lt!433341 lt!433339)))

(declare-fun res!653869 () Bool)

(assert (=> b!976806 (= res!653869 (= (seekEntryOrOpen!0 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1717 mask!2147) (Found!9201 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!976806 (=> (not res!653869) (not e!550500))))

(declare-fun b!976807 () Bool)

(assert (=> b!976807 (= e!550499 e!550498)))

(declare-fun c!99991 () Bool)

(assert (=> b!976807 (= c!99991 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!116547 (not res!653870)) b!976807))

(assert (= (and b!976807 c!99991) b!976806))

(assert (= (and b!976807 (not c!99991)) b!976805))

(assert (= (and b!976806 res!653869) b!976804))

(assert (= (or b!976804 b!976805) bm!41776))

(declare-fun m!904163 () Bool)

(assert (=> bm!41776 m!904163))

(declare-fun m!904165 () Bool)

(assert (=> b!976806 m!904165))

(declare-fun m!904167 () Bool)

(assert (=> b!976806 m!904167))

(declare-fun m!904169 () Bool)

(assert (=> b!976806 m!904169))

(assert (=> b!976806 m!904165))

(declare-fun m!904171 () Bool)

(assert (=> b!976806 m!904171))

(assert (=> b!976807 m!904165))

(assert (=> b!976807 m!904165))

(declare-fun m!904173 () Bool)

(assert (=> b!976807 m!904173))

(assert (=> bm!41772 d!116547))

(declare-fun d!116549 () Bool)

(declare-fun e!550502 () Bool)

(assert (=> d!116549 e!550502))

(declare-fun res!653871 () Bool)

(assert (=> d!116549 (=> res!653871 e!550502)))

(declare-fun lt!433345 () Bool)

(assert (=> d!116549 (= res!653871 (not lt!433345))))

(declare-fun lt!433342 () Bool)

(assert (=> d!116549 (= lt!433345 lt!433342)))

(declare-fun lt!433344 () Unit!32475)

(declare-fun e!550501 () Unit!32475)

(assert (=> d!116549 (= lt!433344 e!550501)))

(declare-fun c!99992 () Bool)

(assert (=> d!116549 (= c!99992 lt!433342)))

(assert (=> d!116549 (= lt!433342 (containsKey!476 (toList!6621 lt!433232) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116549 (= (contains!5699 lt!433232 #b1000000000000000000000000000000000000000000000000000000000000000) lt!433345)))

(declare-fun b!976808 () Bool)

(declare-fun lt!433343 () Unit!32475)

(assert (=> b!976808 (= e!550501 lt!433343)))

(assert (=> b!976808 (= lt!433343 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433232) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976808 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976809 () Bool)

(declare-fun Unit!32484 () Unit!32475)

(assert (=> b!976809 (= e!550501 Unit!32484)))

(declare-fun b!976810 () Bool)

(assert (=> b!976810 (= e!550502 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116549 c!99992) b!976808))

(assert (= (and d!116549 (not c!99992)) b!976809))

(assert (= (and d!116549 (not res!653871)) b!976810))

(declare-fun m!904175 () Bool)

(assert (=> d!116549 m!904175))

(declare-fun m!904177 () Bool)

(assert (=> b!976808 m!904177))

(assert (=> b!976808 m!903961))

(assert (=> b!976808 m!903961))

(declare-fun m!904179 () Bool)

(assert (=> b!976808 m!904179))

(assert (=> b!976810 m!903961))

(assert (=> b!976810 m!903961))

(assert (=> b!976810 m!904179))

(assert (=> bm!41761 d!116549))

(assert (=> d!116473 d!116461))

(declare-fun d!116551 () Bool)

(declare-fun res!653876 () Bool)

(declare-fun e!550507 () Bool)

(assert (=> d!116551 (=> res!653876 e!550507)))

(assert (=> d!116551 (= res!653876 (and ((_ is Cons!20359) (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (= (_1!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29331 _keys!1717) i!822))))))

(assert (=> d!116551 (= (containsKey!476 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)) e!550507)))

(declare-fun b!976815 () Bool)

(declare-fun e!550508 () Bool)

(assert (=> b!976815 (= e!550507 e!550508)))

(declare-fun res!653877 () Bool)

(assert (=> b!976815 (=> (not res!653877) (not e!550508))))

(assert (=> b!976815 (= res!653877 (and (or (not ((_ is Cons!20359) (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (bvsle (_1!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29331 _keys!1717) i!822))) ((_ is Cons!20359) (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (bvslt (_1!7268 (h!21521 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)))) (select (arr!29331 _keys!1717) i!822))))))

(declare-fun b!976816 () Bool)

(assert (=> b!976816 (= e!550508 (containsKey!476 (t!28876 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))) (select (arr!29331 _keys!1717) i!822)))))

(assert (= (and d!116551 (not res!653876)) b!976815))

(assert (= (and b!976815 res!653877) b!976816))

(assert (=> b!976816 m!903763))

(declare-fun m!904181 () Bool)

(assert (=> b!976816 m!904181))

(assert (=> d!116471 d!116551))

(declare-fun d!116553 () Bool)

(declare-fun e!550510 () Bool)

(assert (=> d!116553 e!550510))

(declare-fun res!653878 () Bool)

(assert (=> d!116553 (=> res!653878 e!550510)))

(declare-fun lt!433349 () Bool)

(assert (=> d!116553 (= res!653878 (not lt!433349))))

(declare-fun lt!433346 () Bool)

(assert (=> d!116553 (= lt!433349 lt!433346)))

(declare-fun lt!433348 () Unit!32475)

(declare-fun e!550509 () Unit!32475)

(assert (=> d!116553 (= lt!433348 e!550509)))

(declare-fun c!99993 () Bool)

(assert (=> d!116553 (= c!99993 lt!433346)))

(assert (=> d!116553 (= lt!433346 (containsKey!476 (toList!6621 lt!433206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116553 (= (contains!5699 lt!433206 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433349)))

(declare-fun b!976817 () Bool)

(declare-fun lt!433347 () Unit!32475)

(assert (=> b!976817 (= e!550509 lt!433347)))

(assert (=> b!976817 (= lt!433347 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976817 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976818 () Bool)

(declare-fun Unit!32485 () Unit!32475)

(assert (=> b!976818 (= e!550509 Unit!32485)))

(declare-fun b!976819 () Bool)

(assert (=> b!976819 (= e!550510 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433206) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116553 c!99993) b!976817))

(assert (= (and d!116553 (not c!99993)) b!976818))

(assert (= (and d!116553 (not res!653878)) b!976819))

(declare-fun m!904183 () Bool)

(assert (=> d!116553 m!904183))

(declare-fun m!904185 () Bool)

(assert (=> b!976817 m!904185))

(declare-fun m!904187 () Bool)

(assert (=> b!976817 m!904187))

(assert (=> b!976817 m!904187))

(declare-fun m!904189 () Bool)

(assert (=> b!976817 m!904189))

(assert (=> b!976819 m!904187))

(assert (=> b!976819 m!904187))

(assert (=> b!976819 m!904189))

(assert (=> bm!41756 d!116553))

(declare-fun d!116555 () Bool)

(declare-fun res!653879 () Bool)

(declare-fun e!550511 () Bool)

(assert (=> d!116555 (=> res!653879 e!550511)))

(assert (=> d!116555 (= res!653879 (and ((_ is Cons!20359) (toList!6621 lt!433142)) (= (_1!7268 (h!21521 (toList!6621 lt!433142))) (select (arr!29331 _keys!1717) i!822))))))

(assert (=> d!116555 (= (containsKey!476 (toList!6621 lt!433142) (select (arr!29331 _keys!1717) i!822)) e!550511)))

(declare-fun b!976820 () Bool)

(declare-fun e!550512 () Bool)

(assert (=> b!976820 (= e!550511 e!550512)))

(declare-fun res!653880 () Bool)

(assert (=> b!976820 (=> (not res!653880) (not e!550512))))

(assert (=> b!976820 (= res!653880 (and (or (not ((_ is Cons!20359) (toList!6621 lt!433142))) (bvsle (_1!7268 (h!21521 (toList!6621 lt!433142))) (select (arr!29331 _keys!1717) i!822))) ((_ is Cons!20359) (toList!6621 lt!433142)) (bvslt (_1!7268 (h!21521 (toList!6621 lt!433142))) (select (arr!29331 _keys!1717) i!822))))))

(declare-fun b!976821 () Bool)

(assert (=> b!976821 (= e!550512 (containsKey!476 (t!28876 (toList!6621 lt!433142)) (select (arr!29331 _keys!1717) i!822)))))

(assert (= (and d!116555 (not res!653879)) b!976820))

(assert (= (and b!976820 res!653880) b!976821))

(assert (=> b!976821 m!903763))

(declare-fun m!904191 () Bool)

(assert (=> b!976821 m!904191))

(assert (=> d!116459 d!116555))

(assert (=> b!976635 d!116467))

(declare-fun d!116557 () Bool)

(assert (=> d!116557 (= (validKeyInArray!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)) (and (not (= (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!976698 d!116557))

(declare-fun d!116559 () Bool)

(declare-fun res!653883 () Bool)

(declare-fun e!550514 () Bool)

(assert (=> d!116559 (=> res!653883 e!550514)))

(assert (=> d!116559 (= res!653883 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(assert (=> d!116559 (= (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99960 (Cons!20360 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) Nil!20361) Nil!20361)) e!550514)))

(declare-fun b!976822 () Bool)

(declare-fun e!550516 () Bool)

(declare-fun call!41780 () Bool)

(assert (=> b!976822 (= e!550516 call!41780)))

(declare-fun bm!41777 () Bool)

(declare-fun c!99994 () Bool)

(assert (=> bm!41777 (= call!41780 (arrayNoDuplicates!0 _keys!1717 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!99994 (Cons!20360 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!99960 (Cons!20360 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) Nil!20361) Nil!20361)) (ite c!99960 (Cons!20360 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) Nil!20361) Nil!20361))))))

(declare-fun b!976823 () Bool)

(declare-fun e!550513 () Bool)

(assert (=> b!976823 (= e!550513 (contains!5701 (ite c!99960 (Cons!20360 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) Nil!20361) Nil!20361) (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!976824 () Bool)

(assert (=> b!976824 (= e!550516 call!41780)))

(declare-fun b!976825 () Bool)

(declare-fun e!550515 () Bool)

(assert (=> b!976825 (= e!550515 e!550516)))

(assert (=> b!976825 (= c!99994 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!976826 () Bool)

(assert (=> b!976826 (= e!550514 e!550515)))

(declare-fun res!653881 () Bool)

(assert (=> b!976826 (=> (not res!653881) (not e!550515))))

(assert (=> b!976826 (= res!653881 (not e!550513))))

(declare-fun res!653882 () Bool)

(assert (=> b!976826 (=> (not res!653882) (not e!550513))))

(assert (=> b!976826 (= res!653882 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!116559 (not res!653883)) b!976826))

(assert (= (and b!976826 res!653882) b!976823))

(assert (= (and b!976826 res!653881) b!976825))

(assert (= (and b!976825 c!99994) b!976822))

(assert (= (and b!976825 (not c!99994)) b!976824))

(assert (= (or b!976822 b!976824) bm!41777))

(assert (=> bm!41777 m!904165))

(declare-fun m!904193 () Bool)

(assert (=> bm!41777 m!904193))

(assert (=> b!976823 m!904165))

(assert (=> b!976823 m!904165))

(declare-fun m!904195 () Bool)

(assert (=> b!976823 m!904195))

(assert (=> b!976825 m!904165))

(assert (=> b!976825 m!904165))

(assert (=> b!976825 m!904173))

(assert (=> b!976826 m!904165))

(assert (=> b!976826 m!904165))

(assert (=> b!976826 m!904173))

(assert (=> bm!41769 d!116559))

(declare-fun d!116561 () Bool)

(declare-fun e!550518 () Bool)

(assert (=> d!116561 e!550518))

(declare-fun res!653884 () Bool)

(assert (=> d!116561 (=> res!653884 e!550518)))

(declare-fun lt!433353 () Bool)

(assert (=> d!116561 (= res!653884 (not lt!433353))))

(declare-fun lt!433350 () Bool)

(assert (=> d!116561 (= lt!433353 lt!433350)))

(declare-fun lt!433352 () Unit!32475)

(declare-fun e!550517 () Unit!32475)

(assert (=> d!116561 (= lt!433352 e!550517)))

(declare-fun c!99995 () Bool)

(assert (=> d!116561 (= c!99995 lt!433350)))

(assert (=> d!116561 (= lt!433350 (containsKey!476 (toList!6621 lt!433232) (select (arr!29331 _keys!1717) from!2118)))))

(assert (=> d!116561 (= (contains!5699 lt!433232 (select (arr!29331 _keys!1717) from!2118)) lt!433353)))

(declare-fun b!976827 () Bool)

(declare-fun lt!433351 () Unit!32475)

(assert (=> b!976827 (= e!550517 lt!433351)))

(assert (=> b!976827 (= lt!433351 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433232) (select (arr!29331 _keys!1717) from!2118)))))

(assert (=> b!976827 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) (select (arr!29331 _keys!1717) from!2118)))))

(declare-fun b!976828 () Bool)

(declare-fun Unit!32486 () Unit!32475)

(assert (=> b!976828 (= e!550517 Unit!32486)))

(declare-fun b!976829 () Bool)

(assert (=> b!976829 (= e!550518 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) (select (arr!29331 _keys!1717) from!2118))))))

(assert (= (and d!116561 c!99995) b!976827))

(assert (= (and d!116561 (not c!99995)) b!976828))

(assert (= (and d!116561 (not res!653884)) b!976829))

(assert (=> d!116561 m!903891))

(declare-fun m!904197 () Bool)

(assert (=> d!116561 m!904197))

(assert (=> b!976827 m!903891))

(declare-fun m!904199 () Bool)

(assert (=> b!976827 m!904199))

(assert (=> b!976827 m!903891))

(assert (=> b!976827 m!904143))

(assert (=> b!976827 m!904143))

(declare-fun m!904201 () Bool)

(assert (=> b!976827 m!904201))

(assert (=> b!976829 m!903891))

(assert (=> b!976829 m!904143))

(assert (=> b!976829 m!904143))

(assert (=> b!976829 m!904201))

(assert (=> b!976657 d!116561))

(declare-fun d!116563 () Bool)

(assert (=> d!116563 (arrayContainsKey!0 _keys!1717 lt!433257 #b00000000000000000000000000000000)))

(declare-fun lt!433356 () Unit!32475)

(declare-fun choose!13 (array!60935 (_ BitVec 64) (_ BitVec 32)) Unit!32475)

(assert (=> d!116563 (= lt!433356 (choose!13 _keys!1717 lt!433257 #b00000000000000000000000000000000))))

(assert (=> d!116563 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!116563 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!433257 #b00000000000000000000000000000000) lt!433356)))

(declare-fun bs!27636 () Bool)

(assert (= bs!27636 d!116563))

(assert (=> bs!27636 m!903955))

(declare-fun m!904203 () Bool)

(assert (=> bs!27636 m!904203))

(assert (=> b!976697 d!116563))

(declare-fun d!116565 () Bool)

(declare-fun res!653889 () Bool)

(declare-fun e!550523 () Bool)

(assert (=> d!116565 (=> res!653889 e!550523)))

(assert (=> d!116565 (= res!653889 (= (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) lt!433257))))

(assert (=> d!116565 (= (arrayContainsKey!0 _keys!1717 lt!433257 #b00000000000000000000000000000000) e!550523)))

(declare-fun b!976834 () Bool)

(declare-fun e!550524 () Bool)

(assert (=> b!976834 (= e!550523 e!550524)))

(declare-fun res!653890 () Bool)

(assert (=> b!976834 (=> (not res!653890) (not e!550524))))

(assert (=> b!976834 (= res!653890 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun b!976835 () Bool)

(assert (=> b!976835 (= e!550524 (arrayContainsKey!0 _keys!1717 lt!433257 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!116565 (not res!653889)) b!976834))

(assert (= (and b!976834 res!653890) b!976835))

(assert (=> d!116565 m!903943))

(declare-fun m!904205 () Bool)

(assert (=> b!976835 m!904205))

(assert (=> b!976697 d!116565))

(declare-fun e!550532 () SeekEntryResult!9201)

(declare-fun lt!433365 () SeekEntryResult!9201)

(declare-fun b!976848 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60935 (_ BitVec 32)) SeekEntryResult!9201)

(assert (=> b!976848 (= e!550532 (seekKeyOrZeroReturnVacant!0 (x!84499 lt!433365) (index!39177 lt!433365) (index!39177 lt!433365) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(declare-fun b!976849 () Bool)

(declare-fun e!550531 () SeekEntryResult!9201)

(assert (=> b!976849 (= e!550531 (Found!9201 (index!39177 lt!433365)))))

(declare-fun b!976850 () Bool)

(declare-fun c!100003 () Bool)

(declare-fun lt!433364 () (_ BitVec 64))

(assert (=> b!976850 (= c!100003 (= lt!433364 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976850 (= e!550531 e!550532)))

(declare-fun d!116567 () Bool)

(declare-fun lt!433363 () SeekEntryResult!9201)

(assert (=> d!116567 (and (or ((_ is Undefined!9201) lt!433363) (not ((_ is Found!9201) lt!433363)) (and (bvsge (index!39176 lt!433363) #b00000000000000000000000000000000) (bvslt (index!39176 lt!433363) (size!29810 _keys!1717)))) (or ((_ is Undefined!9201) lt!433363) ((_ is Found!9201) lt!433363) (not ((_ is MissingZero!9201) lt!433363)) (and (bvsge (index!39175 lt!433363) #b00000000000000000000000000000000) (bvslt (index!39175 lt!433363) (size!29810 _keys!1717)))) (or ((_ is Undefined!9201) lt!433363) ((_ is Found!9201) lt!433363) ((_ is MissingZero!9201) lt!433363) (not ((_ is MissingVacant!9201) lt!433363)) (and (bvsge (index!39178 lt!433363) #b00000000000000000000000000000000) (bvslt (index!39178 lt!433363) (size!29810 _keys!1717)))) (or ((_ is Undefined!9201) lt!433363) (ite ((_ is Found!9201) lt!433363) (= (select (arr!29331 _keys!1717) (index!39176 lt!433363)) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9201) lt!433363) (= (select (arr!29331 _keys!1717) (index!39175 lt!433363)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9201) lt!433363) (= (select (arr!29331 _keys!1717) (index!39178 lt!433363)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!550533 () SeekEntryResult!9201)

(assert (=> d!116567 (= lt!433363 e!550533)))

(declare-fun c!100004 () Bool)

(assert (=> d!116567 (= c!100004 (and ((_ is Intermediate!9201) lt!433365) (undefined!10013 lt!433365)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!60935 (_ BitVec 32)) SeekEntryResult!9201)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!116567 (= lt!433365 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) mask!2147) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147))))

(assert (=> d!116567 (validMask!0 mask!2147)))

(assert (=> d!116567 (= (seekEntryOrOpen!0 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) lt!433363)))

(declare-fun b!976851 () Bool)

(assert (=> b!976851 (= e!550533 e!550531)))

(assert (=> b!976851 (= lt!433364 (select (arr!29331 _keys!1717) (index!39177 lt!433365)))))

(declare-fun c!100002 () Bool)

(assert (=> b!976851 (= c!100002 (= lt!433364 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976852 () Bool)

(assert (=> b!976852 (= e!550532 (MissingZero!9201 (index!39177 lt!433365)))))

(declare-fun b!976853 () Bool)

(assert (=> b!976853 (= e!550533 Undefined!9201)))

(assert (= (and d!116567 c!100004) b!976853))

(assert (= (and d!116567 (not c!100004)) b!976851))

(assert (= (and b!976851 c!100002) b!976849))

(assert (= (and b!976851 (not c!100002)) b!976850))

(assert (= (and b!976850 c!100003) b!976852))

(assert (= (and b!976850 (not c!100003)) b!976848))

(assert (=> b!976848 m!903943))

(declare-fun m!904207 () Bool)

(assert (=> b!976848 m!904207))

(assert (=> d!116567 m!903773))

(declare-fun m!904209 () Bool)

(assert (=> d!116567 m!904209))

(declare-fun m!904211 () Bool)

(assert (=> d!116567 m!904211))

(assert (=> d!116567 m!903943))

(declare-fun m!904213 () Bool)

(assert (=> d!116567 m!904213))

(declare-fun m!904215 () Bool)

(assert (=> d!116567 m!904215))

(assert (=> d!116567 m!903943))

(assert (=> d!116567 m!904211))

(declare-fun m!904217 () Bool)

(assert (=> d!116567 m!904217))

(declare-fun m!904219 () Bool)

(assert (=> b!976851 m!904219))

(assert (=> b!976697 d!116567))

(declare-fun d!116569 () Bool)

(declare-fun lt!433368 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!416 (List!20364) (InoxSet (_ BitVec 64)))

(assert (=> d!116569 (= lt!433368 (select (content!416 Nil!20361) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun e!550539 () Bool)

(assert (=> d!116569 (= lt!433368 e!550539)))

(declare-fun res!653895 () Bool)

(assert (=> d!116569 (=> (not res!653895) (not e!550539))))

(assert (=> d!116569 (= res!653895 ((_ is Cons!20360) Nil!20361))))

(assert (=> d!116569 (= (contains!5701 Nil!20361 (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)) lt!433368)))

(declare-fun b!976858 () Bool)

(declare-fun e!550538 () Bool)

(assert (=> b!976858 (= e!550539 e!550538)))

(declare-fun res!653896 () Bool)

(assert (=> b!976858 (=> res!653896 e!550538)))

(assert (=> b!976858 (= res!653896 (= (h!21522 Nil!20361) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!976859 () Bool)

(assert (=> b!976859 (= e!550538 (contains!5701 (t!28877 Nil!20361) (select (arr!29331 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116569 res!653895) b!976858))

(assert (= (and b!976858 (not res!653896)) b!976859))

(declare-fun m!904221 () Bool)

(assert (=> d!116569 m!904221))

(assert (=> d!116569 m!903943))

(declare-fun m!904223 () Bool)

(assert (=> d!116569 m!904223))

(assert (=> b!976859 m!903943))

(declare-fun m!904225 () Bool)

(assert (=> b!976859 m!904225))

(assert (=> b!976683 d!116569))

(declare-fun d!116571 () Bool)

(assert (=> d!116571 (= (apply!890 lt!433206 #b1000000000000000000000000000000000000000000000000000000000000000) (get!15193 (getValueByKey!509 (toList!6621 lt!433206) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27637 () Bool)

(assert (= bs!27637 d!116571))

(assert (=> bs!27637 m!904005))

(assert (=> bs!27637 m!904005))

(declare-fun m!904227 () Bool)

(assert (=> bs!27637 m!904227))

(assert (=> b!976638 d!116571))

(assert (=> d!116469 d!116461))

(declare-fun d!116573 () Bool)

(declare-fun e!550540 () Bool)

(assert (=> d!116573 e!550540))

(declare-fun res!653897 () Bool)

(assert (=> d!116573 (=> (not res!653897) (not e!550540))))

(declare-fun lt!433370 () ListLongMap!13211)

(assert (=> d!116573 (= res!653897 (contains!5699 lt!433370 (_1!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(declare-fun lt!433372 () List!20363)

(assert (=> d!116573 (= lt!433370 (ListLongMap!13212 lt!433372))))

(declare-fun lt!433369 () Unit!32475)

(declare-fun lt!433371 () Unit!32475)

(assert (=> d!116573 (= lt!433369 lt!433371)))

(assert (=> d!116573 (= (getValueByKey!509 lt!433372 (_1!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!514 (_2!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116573 (= lt!433371 (lemmaContainsTupThenGetReturnValue!268 lt!433372 (_1!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116573 (= lt!433372 (insertStrictlySorted!325 (toList!6621 (ite c!99947 call!41760 (ite c!99949 call!41759 call!41757))) (_1!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) (_2!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))))))

(assert (=> d!116573 (= (+!2927 (ite c!99947 call!41760 (ite c!99949 call!41759 call!41757)) (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))) lt!433370)))

(declare-fun b!976860 () Bool)

(declare-fun res!653898 () Bool)

(assert (=> b!976860 (=> (not res!653898) (not e!550540))))

(assert (=> b!976860 (= res!653898 (= (getValueByKey!509 (toList!6621 lt!433370) (_1!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367)))) (Some!514 (_2!7268 (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))))

(declare-fun b!976861 () Bool)

(assert (=> b!976861 (= e!550540 (contains!5702 (toList!6621 lt!433370) (ite (or c!99947 c!99949) (tuple2!14515 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1367) (tuple2!14515 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1367))))))

(assert (= (and d!116573 res!653897) b!976860))

(assert (= (and b!976860 res!653898) b!976861))

(declare-fun m!904229 () Bool)

(assert (=> d!116573 m!904229))

(declare-fun m!904231 () Bool)

(assert (=> d!116573 m!904231))

(declare-fun m!904233 () Bool)

(assert (=> d!116573 m!904233))

(declare-fun m!904235 () Bool)

(assert (=> d!116573 m!904235))

(declare-fun m!904237 () Bool)

(assert (=> b!976860 m!904237))

(declare-fun m!904239 () Bool)

(assert (=> b!976861 m!904239))

(assert (=> bm!41758 d!116573))

(assert (=> b!976686 d!116557))

(declare-fun d!116575 () Bool)

(declare-fun e!550542 () Bool)

(assert (=> d!116575 e!550542))

(declare-fun res!653899 () Bool)

(assert (=> d!116575 (=> res!653899 e!550542)))

(declare-fun lt!433376 () Bool)

(assert (=> d!116575 (= res!653899 (not lt!433376))))

(declare-fun lt!433373 () Bool)

(assert (=> d!116575 (= lt!433376 lt!433373)))

(declare-fun lt!433375 () Unit!32475)

(declare-fun e!550541 () Unit!32475)

(assert (=> d!116575 (= lt!433375 e!550541)))

(declare-fun c!100005 () Bool)

(assert (=> d!116575 (= c!100005 lt!433373)))

(assert (=> d!116575 (= lt!433373 (containsKey!476 (toList!6621 lt!433232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!116575 (= (contains!5699 lt!433232 #b0000000000000000000000000000000000000000000000000000000000000000) lt!433376)))

(declare-fun b!976862 () Bool)

(declare-fun lt!433374 () Unit!32475)

(assert (=> b!976862 (= e!550541 lt!433374)))

(assert (=> b!976862 (= lt!433374 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 lt!433232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!976862 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!976863 () Bool)

(declare-fun Unit!32487 () Unit!32475)

(assert (=> b!976863 (= e!550541 Unit!32487)))

(declare-fun b!976864 () Bool)

(assert (=> b!976864 (= e!550542 (isDefined!381 (getValueByKey!509 (toList!6621 lt!433232) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116575 c!100005) b!976862))

(assert (= (and d!116575 (not c!100005)) b!976863))

(assert (= (and d!116575 (not res!653899)) b!976864))

(declare-fun m!904241 () Bool)

(assert (=> d!116575 m!904241))

(declare-fun m!904243 () Bool)

(assert (=> b!976862 m!904243))

(assert (=> b!976862 m!904133))

(assert (=> b!976862 m!904133))

(declare-fun m!904245 () Bool)

(assert (=> b!976862 m!904245))

(assert (=> b!976864 m!904133))

(assert (=> b!976864 m!904133))

(assert (=> b!976864 m!904245))

(assert (=> bm!41763 d!116575))

(assert (=> b!976685 d!116557))

(assert (=> b!976661 d!116535))

(declare-fun d!116577 () Bool)

(assert (=> d!116577 (isDefined!381 (getValueByKey!509 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun lt!433377 () Unit!32475)

(assert (=> d!116577 (= lt!433377 (choose!1603 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(declare-fun e!550543 () Bool)

(assert (=> d!116577 e!550543))

(declare-fun res!653900 () Bool)

(assert (=> d!116577 (=> (not res!653900) (not e!550543))))

(assert (=> d!116577 (= res!653900 (isStrictlySorted!514 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))))

(assert (=> d!116577 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)) lt!433377)))

(declare-fun b!976865 () Bool)

(assert (=> b!976865 (= e!550543 (containsKey!476 (toList!6621 (getCurrentListMap!3853 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428)) (select (arr!29331 _keys!1717) i!822)))))

(assert (= (and d!116577 res!653900) b!976865))

(assert (=> d!116577 m!903763))

(assert (=> d!116577 m!903883))

(assert (=> d!116577 m!903883))

(assert (=> d!116577 m!903885))

(assert (=> d!116577 m!903763))

(declare-fun m!904247 () Bool)

(assert (=> d!116577 m!904247))

(declare-fun m!904249 () Bool)

(assert (=> d!116577 m!904249))

(assert (=> b!976865 m!903763))

(assert (=> b!976865 m!903879))

(assert (=> b!976648 d!116577))

(assert (=> b!976648 d!116483))

(assert (=> b!976648 d!116485))

(declare-fun d!116579 () Bool)

(assert (=> d!116579 (= (apply!890 lt!433206 #b0000000000000000000000000000000000000000000000000000000000000000) (get!15193 (getValueByKey!509 (toList!6621 lt!433206) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!27638 () Bool)

(assert (= bs!27638 d!116579))

(assert (=> bs!27638 m!904187))

(assert (=> bs!27638 m!904187))

(declare-fun m!904251 () Bool)

(assert (=> bs!27638 m!904251))

(assert (=> b!976642 d!116579))

(declare-fun d!116581 () Bool)

(assert (=> d!116581 (= (apply!890 lt!433222 lt!433204) (get!15193 (getValueByKey!509 (toList!6621 lt!433222) lt!433204)))))

(declare-fun bs!27639 () Bool)

(assert (= bs!27639 d!116581))

(declare-fun m!904253 () Bool)

(assert (=> bs!27639 m!904253))

(assert (=> bs!27639 m!904253))

(declare-fun m!904255 () Bool)

(assert (=> bs!27639 m!904255))

(assert (=> b!976641 d!116581))

(declare-fun d!116583 () Bool)

(assert (=> d!116583 (= (apply!890 lt!433219 lt!433211) (get!15193 (getValueByKey!509 (toList!6621 lt!433219) lt!433211)))))

(declare-fun bs!27640 () Bool)

(assert (= bs!27640 d!116583))

(declare-fun m!904257 () Bool)

(assert (=> bs!27640 m!904257))

(assert (=> bs!27640 m!904257))

(declare-fun m!904259 () Bool)

(assert (=> bs!27640 m!904259))

(assert (=> b!976641 d!116583))

(declare-fun d!116585 () Bool)

(declare-fun e!550549 () Bool)

(assert (=> d!116585 e!550549))

(declare-fun res!653904 () Bool)

(assert (=> d!116585 (=> (not res!653904) (not e!550549))))

(declare-fun lt!433380 () ListLongMap!13211)

(assert (=> d!116585 (= res!653904 (not (contains!5699 lt!433380 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!550546 () ListLongMap!13211)

(assert (=> d!116585 (= lt!433380 e!550546)))

(declare-fun c!100009 () Bool)

(assert (=> d!116585 (= c!100009 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(assert (=> d!116585 (validMask!0 mask!2147)))

(assert (=> d!116585 (= (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428) lt!433380)))

(declare-fun b!976866 () Bool)

(assert (=> b!976866 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(assert (=> b!976866 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29811 _values!1425)))))

(declare-fun e!550548 () Bool)

(assert (=> b!976866 (= e!550548 (= (apply!890 lt!433380 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))) (get!15192 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!976867 () Bool)

(declare-fun e!550544 () ListLongMap!13211)

(declare-fun call!41781 () ListLongMap!13211)

(assert (=> b!976867 (= e!550544 call!41781)))

(declare-fun bm!41778 () Bool)

(assert (=> bm!41778 (= call!41781 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976868 () Bool)

(declare-fun e!550547 () Bool)

(assert (=> b!976868 (= e!550547 e!550548)))

(assert (=> b!976868 (and (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun res!653902 () Bool)

(assert (=> b!976868 (= res!653902 (contains!5699 lt!433380 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976868 (=> (not res!653902) (not e!550548))))

(declare-fun b!976869 () Bool)

(declare-fun e!550550 () Bool)

(assert (=> b!976869 (= e!550547 e!550550)))

(declare-fun c!100008 () Bool)

(assert (=> b!976869 (= c!100008 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun b!976870 () Bool)

(assert (=> b!976870 (= e!550549 e!550547)))

(declare-fun c!100006 () Bool)

(declare-fun e!550545 () Bool)

(assert (=> b!976870 (= c!100006 e!550545)))

(declare-fun res!653901 () Bool)

(assert (=> b!976870 (=> (not res!653901) (not e!550545))))

(assert (=> b!976870 (= res!653901 (bvslt (bvsub from!2118 #b00000000000000000000000000000001) (size!29810 _keys!1717)))))

(declare-fun b!976871 () Bool)

(assert (=> b!976871 (= e!550546 (ListLongMap!13212 Nil!20360))))

(declare-fun b!976872 () Bool)

(assert (=> b!976872 (= e!550550 (isEmpty!717 lt!433380))))

(declare-fun b!976873 () Bool)

(declare-fun res!653903 () Bool)

(assert (=> b!976873 (=> (not res!653903) (not e!550549))))

(assert (=> b!976873 (= res!653903 (not (contains!5699 lt!433380 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!976874 () Bool)

(assert (=> b!976874 (= e!550546 e!550544)))

(declare-fun c!100007 () Bool)

(assert (=> b!976874 (= c!100007 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(declare-fun b!976875 () Bool)

(assert (=> b!976875 (= e!550545 (validKeyInArray!0 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001))))))

(assert (=> b!976875 (bvsge (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!976876 () Bool)

(declare-fun lt!433384 () Unit!32475)

(declare-fun lt!433378 () Unit!32475)

(assert (=> b!976876 (= lt!433384 lt!433378)))

(declare-fun lt!433379 () (_ BitVec 64))

(declare-fun lt!433381 () V!34923)

(declare-fun lt!433382 () ListLongMap!13211)

(declare-fun lt!433383 () (_ BitVec 64))

(assert (=> b!976876 (not (contains!5699 (+!2927 lt!433382 (tuple2!14515 lt!433383 lt!433381)) lt!433379))))

(assert (=> b!976876 (= lt!433378 (addStillNotContains!229 lt!433382 lt!433383 lt!433381 lt!433379))))

(assert (=> b!976876 (= lt!433379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!976876 (= lt!433381 (get!15192 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!976876 (= lt!433383 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!976876 (= lt!433382 call!41781)))

(assert (=> b!976876 (= e!550544 (+!2927 call!41781 (tuple2!14515 (select (arr!29331 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)) (get!15192 (select (arr!29332 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1716 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!976877 () Bool)

(assert (=> b!976877 (= e!550550 (= lt!433380 (getCurrentListMapNoExtraKeys!3329 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd (bvsub from!2118 #b00000000000000000000000000000001) #b00000000000000000000000000000001) defaultEntry!1428)))))

(assert (= (and d!116585 c!100009) b!976871))

(assert (= (and d!116585 (not c!100009)) b!976874))

(assert (= (and b!976874 c!100007) b!976876))

(assert (= (and b!976874 (not c!100007)) b!976867))

(assert (= (or b!976876 b!976867) bm!41778))

(assert (= (and d!116585 res!653904) b!976873))

(assert (= (and b!976873 res!653903) b!976870))

(assert (= (and b!976870 res!653901) b!976875))

(assert (= (and b!976870 c!100006) b!976868))

(assert (= (and b!976870 (not c!100006)) b!976869))

(assert (= (and b!976868 res!653902) b!976866))

(assert (= (and b!976869 c!100008) b!976877))

(assert (= (and b!976869 (not c!100008)) b!976872))

(declare-fun b_lambda!14593 () Bool)

(assert (=> (not b_lambda!14593) (not b!976866)))

(assert (=> b!976866 t!28881))

(declare-fun b_and!31201 () Bool)

(assert (= b_and!31199 (and (=> t!28881 result!12707) b_and!31201)))

(declare-fun b_lambda!14595 () Bool)

(assert (=> (not b_lambda!14595) (not b!976876)))

(assert (=> b!976876 t!28881))

(declare-fun b_and!31203 () Bool)

(assert (= b_and!31201 (and (=> t!28881 result!12707) b_and!31203)))

(declare-fun m!904261 () Bool)

(assert (=> bm!41778 m!904261))

(assert (=> b!976876 m!903875))

(declare-fun m!904263 () Bool)

(assert (=> b!976876 m!904263))

(declare-fun m!904265 () Bool)

(assert (=> b!976876 m!904265))

(assert (=> b!976876 m!903767))

(declare-fun m!904267 () Bool)

(assert (=> b!976876 m!904267))

(declare-fun m!904269 () Bool)

(assert (=> b!976876 m!904269))

(assert (=> b!976876 m!903871))

(assert (=> b!976876 m!903875))

(assert (=> b!976876 m!903871))

(assert (=> b!976876 m!903877))

(assert (=> b!976876 m!904267))

(declare-fun m!904271 () Bool)

(assert (=> b!976872 m!904271))

(declare-fun m!904273 () Bool)

(assert (=> b!976873 m!904273))

(assert (=> b!976866 m!903875))

(assert (=> b!976866 m!903767))

(declare-fun m!904275 () Bool)

(assert (=> b!976866 m!904275))

(assert (=> b!976866 m!903767))

(assert (=> b!976866 m!903871))

(assert (=> b!976866 m!903875))

(assert (=> b!976866 m!903871))

(assert (=> b!976866 m!903877))

(assert (=> b!976868 m!903767))

(assert (=> b!976868 m!903767))

(declare-fun m!904277 () Bool)

(assert (=> b!976868 m!904277))

(assert (=> b!976874 m!903767))

(assert (=> b!976874 m!903767))

(assert (=> b!976874 m!903769))

(declare-fun m!904279 () Bool)

(assert (=> d!116585 m!904279))

(assert (=> d!116585 m!903773))

(assert (=> b!976877 m!904261))

(assert (=> b!976875 m!903767))

(assert (=> b!976875 m!903767))

(assert (=> b!976875 m!903769))

(assert (=> b!976641 d!116585))

(declare-fun d!116587 () Bool)

(assert (=> d!116587 (= (apply!890 (+!2927 lt!433222 (tuple2!14515 lt!433217 minValue!1367)) lt!433204) (apply!890 lt!433222 lt!433204))))

(declare-fun lt!433385 () Unit!32475)

(assert (=> d!116587 (= lt!433385 (choose!1601 lt!433222 lt!433217 minValue!1367 lt!433204))))

(declare-fun e!550551 () Bool)

(assert (=> d!116587 e!550551))

(declare-fun res!653905 () Bool)

(assert (=> d!116587 (=> (not res!653905) (not e!550551))))

(assert (=> d!116587 (= res!653905 (contains!5699 lt!433222 lt!433204))))

(assert (=> d!116587 (= (addApplyDifferent!473 lt!433222 lt!433217 minValue!1367 lt!433204) lt!433385)))

(declare-fun b!976878 () Bool)

(assert (=> b!976878 (= e!550551 (not (= lt!433204 lt!433217)))))

(assert (= (and d!116587 res!653905) b!976878))

(assert (=> d!116587 m!903851))

(declare-fun m!904281 () Bool)

(assert (=> d!116587 m!904281))

(assert (=> d!116587 m!903865))

(assert (=> d!116587 m!903867))

(assert (=> d!116587 m!903865))

(declare-fun m!904283 () Bool)

(assert (=> d!116587 m!904283))

(assert (=> b!976641 d!116587))

(declare-fun d!116589 () Bool)

(assert (=> d!116589 (= (apply!890 (+!2927 lt!433219 (tuple2!14515 lt!433221 minValue!1367)) lt!433211) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433219 (tuple2!14515 lt!433221 minValue!1367))) lt!433211)))))

(declare-fun bs!27641 () Bool)

(assert (= bs!27641 d!116589))

(declare-fun m!904285 () Bool)

(assert (=> bs!27641 m!904285))

(assert (=> bs!27641 m!904285))

(declare-fun m!904287 () Bool)

(assert (=> bs!27641 m!904287))

(assert (=> b!976641 d!116589))

(declare-fun d!116591 () Bool)

(assert (=> d!116591 (= (apply!890 (+!2927 lt!433215 (tuple2!14515 lt!433220 zeroValue!1367)) lt!433216) (apply!890 lt!433215 lt!433216))))

(declare-fun lt!433386 () Unit!32475)

(assert (=> d!116591 (= lt!433386 (choose!1601 lt!433215 lt!433220 zeroValue!1367 lt!433216))))

(declare-fun e!550552 () Bool)

(assert (=> d!116591 e!550552))

(declare-fun res!653906 () Bool)

(assert (=> d!116591 (=> (not res!653906) (not e!550552))))

(assert (=> d!116591 (= res!653906 (contains!5699 lt!433215 lt!433216))))

(assert (=> d!116591 (= (addApplyDifferent!473 lt!433215 lt!433220 zeroValue!1367 lt!433216) lt!433386)))

(declare-fun b!976879 () Bool)

(assert (=> b!976879 (= e!550552 (not (= lt!433216 lt!433220)))))

(assert (= (and d!116591 res!653906) b!976879))

(assert (=> d!116591 m!903853))

(declare-fun m!904289 () Bool)

(assert (=> d!116591 m!904289))

(assert (=> d!116591 m!903861))

(assert (=> d!116591 m!903863))

(assert (=> d!116591 m!903861))

(declare-fun m!904291 () Bool)

(assert (=> d!116591 m!904291))

(assert (=> b!976641 d!116591))

(declare-fun d!116593 () Bool)

(declare-fun e!550553 () Bool)

(assert (=> d!116593 e!550553))

(declare-fun res!653907 () Bool)

(assert (=> d!116593 (=> (not res!653907) (not e!550553))))

(declare-fun lt!433388 () ListLongMap!13211)

(assert (=> d!116593 (= res!653907 (contains!5699 lt!433388 (_1!7268 (tuple2!14515 lt!433217 minValue!1367))))))

(declare-fun lt!433390 () List!20363)

(assert (=> d!116593 (= lt!433388 (ListLongMap!13212 lt!433390))))

(declare-fun lt!433387 () Unit!32475)

(declare-fun lt!433389 () Unit!32475)

(assert (=> d!116593 (= lt!433387 lt!433389)))

(assert (=> d!116593 (= (getValueByKey!509 lt!433390 (_1!7268 (tuple2!14515 lt!433217 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433217 minValue!1367))))))

(assert (=> d!116593 (= lt!433389 (lemmaContainsTupThenGetReturnValue!268 lt!433390 (_1!7268 (tuple2!14515 lt!433217 minValue!1367)) (_2!7268 (tuple2!14515 lt!433217 minValue!1367))))))

(assert (=> d!116593 (= lt!433390 (insertStrictlySorted!325 (toList!6621 lt!433222) (_1!7268 (tuple2!14515 lt!433217 minValue!1367)) (_2!7268 (tuple2!14515 lt!433217 minValue!1367))))))

(assert (=> d!116593 (= (+!2927 lt!433222 (tuple2!14515 lt!433217 minValue!1367)) lt!433388)))

(declare-fun b!976880 () Bool)

(declare-fun res!653908 () Bool)

(assert (=> b!976880 (=> (not res!653908) (not e!550553))))

(assert (=> b!976880 (= res!653908 (= (getValueByKey!509 (toList!6621 lt!433388) (_1!7268 (tuple2!14515 lt!433217 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433217 minValue!1367)))))))

(declare-fun b!976881 () Bool)

(assert (=> b!976881 (= e!550553 (contains!5702 (toList!6621 lt!433388) (tuple2!14515 lt!433217 minValue!1367)))))

(assert (= (and d!116593 res!653907) b!976880))

(assert (= (and b!976880 res!653908) b!976881))

(declare-fun m!904293 () Bool)

(assert (=> d!116593 m!904293))

(declare-fun m!904295 () Bool)

(assert (=> d!116593 m!904295))

(declare-fun m!904297 () Bool)

(assert (=> d!116593 m!904297))

(declare-fun m!904299 () Bool)

(assert (=> d!116593 m!904299))

(declare-fun m!904301 () Bool)

(assert (=> b!976880 m!904301))

(declare-fun m!904303 () Bool)

(assert (=> b!976881 m!904303))

(assert (=> b!976641 d!116593))

(declare-fun d!116595 () Bool)

(declare-fun e!550554 () Bool)

(assert (=> d!116595 e!550554))

(declare-fun res!653909 () Bool)

(assert (=> d!116595 (=> (not res!653909) (not e!550554))))

(declare-fun lt!433392 () ListLongMap!13211)

(assert (=> d!116595 (= res!653909 (contains!5699 lt!433392 (_1!7268 (tuple2!14515 lt!433221 minValue!1367))))))

(declare-fun lt!433394 () List!20363)

(assert (=> d!116595 (= lt!433392 (ListLongMap!13212 lt!433394))))

(declare-fun lt!433391 () Unit!32475)

(declare-fun lt!433393 () Unit!32475)

(assert (=> d!116595 (= lt!433391 lt!433393)))

(assert (=> d!116595 (= (getValueByKey!509 lt!433394 (_1!7268 (tuple2!14515 lt!433221 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433221 minValue!1367))))))

(assert (=> d!116595 (= lt!433393 (lemmaContainsTupThenGetReturnValue!268 lt!433394 (_1!7268 (tuple2!14515 lt!433221 minValue!1367)) (_2!7268 (tuple2!14515 lt!433221 minValue!1367))))))

(assert (=> d!116595 (= lt!433394 (insertStrictlySorted!325 (toList!6621 lt!433219) (_1!7268 (tuple2!14515 lt!433221 minValue!1367)) (_2!7268 (tuple2!14515 lt!433221 minValue!1367))))))

(assert (=> d!116595 (= (+!2927 lt!433219 (tuple2!14515 lt!433221 minValue!1367)) lt!433392)))

(declare-fun b!976882 () Bool)

(declare-fun res!653910 () Bool)

(assert (=> b!976882 (=> (not res!653910) (not e!550554))))

(assert (=> b!976882 (= res!653910 (= (getValueByKey!509 (toList!6621 lt!433392) (_1!7268 (tuple2!14515 lt!433221 minValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433221 minValue!1367)))))))

(declare-fun b!976883 () Bool)

(assert (=> b!976883 (= e!550554 (contains!5702 (toList!6621 lt!433392) (tuple2!14515 lt!433221 minValue!1367)))))

(assert (= (and d!116595 res!653909) b!976882))

(assert (= (and b!976882 res!653910) b!976883))

(declare-fun m!904305 () Bool)

(assert (=> d!116595 m!904305))

(declare-fun m!904307 () Bool)

(assert (=> d!116595 m!904307))

(declare-fun m!904309 () Bool)

(assert (=> d!116595 m!904309))

(declare-fun m!904311 () Bool)

(assert (=> d!116595 m!904311))

(declare-fun m!904313 () Bool)

(assert (=> b!976882 m!904313))

(declare-fun m!904315 () Bool)

(assert (=> b!976883 m!904315))

(assert (=> b!976641 d!116595))

(declare-fun d!116597 () Bool)

(declare-fun e!550555 () Bool)

(assert (=> d!116597 e!550555))

(declare-fun res!653911 () Bool)

(assert (=> d!116597 (=> (not res!653911) (not e!550555))))

(declare-fun lt!433396 () ListLongMap!13211)

(assert (=> d!116597 (= res!653911 (contains!5699 lt!433396 (_1!7268 (tuple2!14515 lt!433213 zeroValue!1367))))))

(declare-fun lt!433398 () List!20363)

(assert (=> d!116597 (= lt!433396 (ListLongMap!13212 lt!433398))))

(declare-fun lt!433395 () Unit!32475)

(declare-fun lt!433397 () Unit!32475)

(assert (=> d!116597 (= lt!433395 lt!433397)))

(assert (=> d!116597 (= (getValueByKey!509 lt!433398 (_1!7268 (tuple2!14515 lt!433213 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433213 zeroValue!1367))))))

(assert (=> d!116597 (= lt!433397 (lemmaContainsTupThenGetReturnValue!268 lt!433398 (_1!7268 (tuple2!14515 lt!433213 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433213 zeroValue!1367))))))

(assert (=> d!116597 (= lt!433398 (insertStrictlySorted!325 (toList!6621 lt!433223) (_1!7268 (tuple2!14515 lt!433213 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433213 zeroValue!1367))))))

(assert (=> d!116597 (= (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367)) lt!433396)))

(declare-fun b!976884 () Bool)

(declare-fun res!653912 () Bool)

(assert (=> b!976884 (=> (not res!653912) (not e!550555))))

(assert (=> b!976884 (= res!653912 (= (getValueByKey!509 (toList!6621 lt!433396) (_1!7268 (tuple2!14515 lt!433213 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433213 zeroValue!1367)))))))

(declare-fun b!976885 () Bool)

(assert (=> b!976885 (= e!550555 (contains!5702 (toList!6621 lt!433396) (tuple2!14515 lt!433213 zeroValue!1367)))))

(assert (= (and d!116597 res!653911) b!976884))

(assert (= (and b!976884 res!653912) b!976885))

(declare-fun m!904317 () Bool)

(assert (=> d!116597 m!904317))

(declare-fun m!904319 () Bool)

(assert (=> d!116597 m!904319))

(declare-fun m!904321 () Bool)

(assert (=> d!116597 m!904321))

(declare-fun m!904323 () Bool)

(assert (=> d!116597 m!904323))

(declare-fun m!904325 () Bool)

(assert (=> b!976884 m!904325))

(declare-fun m!904327 () Bool)

(assert (=> b!976885 m!904327))

(assert (=> b!976641 d!116597))

(declare-fun d!116599 () Bool)

(declare-fun e!550557 () Bool)

(assert (=> d!116599 e!550557))

(declare-fun res!653913 () Bool)

(assert (=> d!116599 (=> res!653913 e!550557)))

(declare-fun lt!433402 () Bool)

(assert (=> d!116599 (= res!653913 (not lt!433402))))

(declare-fun lt!433399 () Bool)

(assert (=> d!116599 (= lt!433402 lt!433399)))

(declare-fun lt!433401 () Unit!32475)

(declare-fun e!550556 () Unit!32475)

(assert (=> d!116599 (= lt!433401 e!550556)))

(declare-fun c!100010 () Bool)

(assert (=> d!116599 (= c!100010 lt!433399)))

(assert (=> d!116599 (= lt!433399 (containsKey!476 (toList!6621 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367))) lt!433205))))

(assert (=> d!116599 (= (contains!5699 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367)) lt!433205) lt!433402)))

(declare-fun b!976886 () Bool)

(declare-fun lt!433400 () Unit!32475)

(assert (=> b!976886 (= e!550556 lt!433400)))

(assert (=> b!976886 (= lt!433400 (lemmaContainsKeyImpliesGetValueByKeyDefined!372 (toList!6621 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367))) lt!433205))))

(assert (=> b!976886 (isDefined!381 (getValueByKey!509 (toList!6621 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367))) lt!433205))))

(declare-fun b!976887 () Bool)

(declare-fun Unit!32488 () Unit!32475)

(assert (=> b!976887 (= e!550556 Unit!32488)))

(declare-fun b!976888 () Bool)

(assert (=> b!976888 (= e!550557 (isDefined!381 (getValueByKey!509 (toList!6621 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367))) lt!433205)))))

(assert (= (and d!116599 c!100010) b!976886))

(assert (= (and d!116599 (not c!100010)) b!976887))

(assert (= (and d!116599 (not res!653913)) b!976888))

(declare-fun m!904329 () Bool)

(assert (=> d!116599 m!904329))

(declare-fun m!904331 () Bool)

(assert (=> b!976886 m!904331))

(declare-fun m!904333 () Bool)

(assert (=> b!976886 m!904333))

(assert (=> b!976886 m!904333))

(declare-fun m!904335 () Bool)

(assert (=> b!976886 m!904335))

(assert (=> b!976888 m!904333))

(assert (=> b!976888 m!904333))

(assert (=> b!976888 m!904335))

(assert (=> b!976641 d!116599))

(declare-fun d!116601 () Bool)

(assert (=> d!116601 (= (apply!890 (+!2927 lt!433219 (tuple2!14515 lt!433221 minValue!1367)) lt!433211) (apply!890 lt!433219 lt!433211))))

(declare-fun lt!433403 () Unit!32475)

(assert (=> d!116601 (= lt!433403 (choose!1601 lt!433219 lt!433221 minValue!1367 lt!433211))))

(declare-fun e!550558 () Bool)

(assert (=> d!116601 e!550558))

(declare-fun res!653914 () Bool)

(assert (=> d!116601 (=> (not res!653914) (not e!550558))))

(assert (=> d!116601 (= res!653914 (contains!5699 lt!433219 lt!433211))))

(assert (=> d!116601 (= (addApplyDifferent!473 lt!433219 lt!433221 minValue!1367 lt!433211) lt!433403)))

(declare-fun b!976889 () Bool)

(assert (=> b!976889 (= e!550558 (not (= lt!433211 lt!433221)))))

(assert (= (and d!116601 res!653914) b!976889))

(assert (=> d!116601 m!903857))

(declare-fun m!904337 () Bool)

(assert (=> d!116601 m!904337))

(assert (=> d!116601 m!903845))

(assert (=> d!116601 m!903847))

(assert (=> d!116601 m!903845))

(declare-fun m!904339 () Bool)

(assert (=> d!116601 m!904339))

(assert (=> b!976641 d!116601))

(declare-fun d!116603 () Bool)

(assert (=> d!116603 (= (apply!890 (+!2927 lt!433222 (tuple2!14515 lt!433217 minValue!1367)) lt!433204) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433222 (tuple2!14515 lt!433217 minValue!1367))) lt!433204)))))

(declare-fun bs!27642 () Bool)

(assert (= bs!27642 d!116603))

(declare-fun m!904341 () Bool)

(assert (=> bs!27642 m!904341))

(assert (=> bs!27642 m!904341))

(declare-fun m!904343 () Bool)

(assert (=> bs!27642 m!904343))

(assert (=> b!976641 d!116603))

(declare-fun d!116605 () Bool)

(assert (=> d!116605 (= (apply!890 lt!433215 lt!433216) (get!15193 (getValueByKey!509 (toList!6621 lt!433215) lt!433216)))))

(declare-fun bs!27643 () Bool)

(assert (= bs!27643 d!116605))

(declare-fun m!904345 () Bool)

(assert (=> bs!27643 m!904345))

(assert (=> bs!27643 m!904345))

(declare-fun m!904347 () Bool)

(assert (=> bs!27643 m!904347))

(assert (=> b!976641 d!116605))

(declare-fun d!116607 () Bool)

(assert (=> d!116607 (= (apply!890 (+!2927 lt!433215 (tuple2!14515 lt!433220 zeroValue!1367)) lt!433216) (get!15193 (getValueByKey!509 (toList!6621 (+!2927 lt!433215 (tuple2!14515 lt!433220 zeroValue!1367))) lt!433216)))))

(declare-fun bs!27644 () Bool)

(assert (= bs!27644 d!116607))

(declare-fun m!904349 () Bool)

(assert (=> bs!27644 m!904349))

(assert (=> bs!27644 m!904349))

(declare-fun m!904351 () Bool)

(assert (=> bs!27644 m!904351))

(assert (=> b!976641 d!116607))

(declare-fun d!116609 () Bool)

(declare-fun e!550559 () Bool)

(assert (=> d!116609 e!550559))

(declare-fun res!653915 () Bool)

(assert (=> d!116609 (=> (not res!653915) (not e!550559))))

(declare-fun lt!433405 () ListLongMap!13211)

(assert (=> d!116609 (= res!653915 (contains!5699 lt!433405 (_1!7268 (tuple2!14515 lt!433220 zeroValue!1367))))))

(declare-fun lt!433407 () List!20363)

(assert (=> d!116609 (= lt!433405 (ListLongMap!13212 lt!433407))))

(declare-fun lt!433404 () Unit!32475)

(declare-fun lt!433406 () Unit!32475)

(assert (=> d!116609 (= lt!433404 lt!433406)))

(assert (=> d!116609 (= (getValueByKey!509 lt!433407 (_1!7268 (tuple2!14515 lt!433220 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433220 zeroValue!1367))))))

(assert (=> d!116609 (= lt!433406 (lemmaContainsTupThenGetReturnValue!268 lt!433407 (_1!7268 (tuple2!14515 lt!433220 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433220 zeroValue!1367))))))

(assert (=> d!116609 (= lt!433407 (insertStrictlySorted!325 (toList!6621 lt!433215) (_1!7268 (tuple2!14515 lt!433220 zeroValue!1367)) (_2!7268 (tuple2!14515 lt!433220 zeroValue!1367))))))

(assert (=> d!116609 (= (+!2927 lt!433215 (tuple2!14515 lt!433220 zeroValue!1367)) lt!433405)))

(declare-fun b!976890 () Bool)

(declare-fun res!653916 () Bool)

(assert (=> b!976890 (=> (not res!653916) (not e!550559))))

(assert (=> b!976890 (= res!653916 (= (getValueByKey!509 (toList!6621 lt!433405) (_1!7268 (tuple2!14515 lt!433220 zeroValue!1367))) (Some!514 (_2!7268 (tuple2!14515 lt!433220 zeroValue!1367)))))))

(declare-fun b!976891 () Bool)

(assert (=> b!976891 (= e!550559 (contains!5702 (toList!6621 lt!433405) (tuple2!14515 lt!433220 zeroValue!1367)))))

(assert (= (and d!116609 res!653915) b!976890))

(assert (= (and b!976890 res!653916) b!976891))

(declare-fun m!904353 () Bool)

(assert (=> d!116609 m!904353))

(declare-fun m!904355 () Bool)

(assert (=> d!116609 m!904355))

(declare-fun m!904357 () Bool)

(assert (=> d!116609 m!904357))

(declare-fun m!904359 () Bool)

(assert (=> d!116609 m!904359))

(declare-fun m!904361 () Bool)

(assert (=> b!976890 m!904361))

(declare-fun m!904363 () Bool)

(assert (=> b!976891 m!904363))

(assert (=> b!976641 d!116609))

(declare-fun d!116611 () Bool)

(assert (=> d!116611 (contains!5699 (+!2927 lt!433223 (tuple2!14515 lt!433213 zeroValue!1367)) lt!433205)))

(declare-fun lt!433408 () Unit!32475)

(assert (=> d!116611 (= lt!433408 (choose!1602 lt!433223 lt!433213 zeroValue!1367 lt!433205))))

(assert (=> d!116611 (contains!5699 lt!433223 lt!433205)))

(assert (=> d!116611 (= (addStillContains!613 lt!433223 lt!433213 zeroValue!1367 lt!433205) lt!433408)))

(declare-fun bs!27645 () Bool)

(assert (= bs!27645 d!116611))

(assert (=> bs!27645 m!903841))

(assert (=> bs!27645 m!903841))

(assert (=> bs!27645 m!903843))

(declare-fun m!904365 () Bool)

(assert (=> bs!27645 m!904365))

(declare-fun m!904367 () Bool)

(assert (=> bs!27645 m!904367))

(assert (=> b!976641 d!116611))

(assert (=> bm!41753 d!116585))

(declare-fun condMapEmpty!35699 () Bool)

(declare-fun mapDefault!35699 () ValueCell!10746)

(assert (=> mapNonEmpty!35698 (= condMapEmpty!35699 (= mapRest!35698 ((as const (Array (_ BitVec 32) ValueCell!10746)) mapDefault!35699)))))

(declare-fun e!550561 () Bool)

(declare-fun mapRes!35699 () Bool)

(assert (=> mapNonEmpty!35698 (= tp!67950 (and e!550561 mapRes!35699))))

(declare-fun mapIsEmpty!35699 () Bool)

(assert (=> mapIsEmpty!35699 mapRes!35699))

(declare-fun mapNonEmpty!35699 () Bool)

(declare-fun tp!67951 () Bool)

(declare-fun e!550560 () Bool)

(assert (=> mapNonEmpty!35699 (= mapRes!35699 (and tp!67951 e!550560))))

(declare-fun mapRest!35699 () (Array (_ BitVec 32) ValueCell!10746))

(declare-fun mapKey!35699 () (_ BitVec 32))

(declare-fun mapValue!35699 () ValueCell!10746)

(assert (=> mapNonEmpty!35699 (= mapRest!35698 (store mapRest!35699 mapKey!35699 mapValue!35699))))

(declare-fun b!976892 () Bool)

(assert (=> b!976892 (= e!550560 tp_is_empty!22455)))

(declare-fun b!976893 () Bool)

(assert (=> b!976893 (= e!550561 tp_is_empty!22455)))

(assert (= (and mapNonEmpty!35698 condMapEmpty!35699) mapIsEmpty!35699))

(assert (= (and mapNonEmpty!35698 (not condMapEmpty!35699)) mapNonEmpty!35699))

(assert (= (and mapNonEmpty!35699 ((_ is ValueCellFull!10746) mapValue!35699)) b!976892))

(assert (= (and mapNonEmpty!35698 ((_ is ValueCellFull!10746) mapDefault!35699)) b!976893))

(declare-fun m!904369 () Bool)

(assert (=> mapNonEmpty!35699 m!904369))

(declare-fun b_lambda!14597 () Bool)

(assert (= b_lambda!14589 (or (and start!83564 b_free!19551) b_lambda!14597)))

(declare-fun b_lambda!14599 () Bool)

(assert (= b_lambda!14593 (or (and start!83564 b_free!19551) b_lambda!14599)))

(declare-fun b_lambda!14601 () Bool)

(assert (= b_lambda!14595 (or (and start!83564 b_free!19551) b_lambda!14601)))

(declare-fun b_lambda!14603 () Bool)

(assert (= b_lambda!14591 (or (and start!83564 b_free!19551) b_lambda!14603)))

(check-sat (not d!116525) (not b!976884) (not b!976868) (not d!116587) (not d!116491) (not b_lambda!14603) (not d!116541) (not b!976835) (not d!116515) (not b!976779) (not b!976826) (not b!976866) (not b!976873) (not b!976880) (not d!116495) (not d!116579) (not b_lambda!14597) (not b!976766) (not d!116517) (not d!116567) (not d!116591) (not b!976883) (not b!976774) (not b_lambda!14587) (not d!116481) (not d!116553) (not b!976803) (not b!976885) (not b!976792) (not b!976735) (not d!116487) (not b!976891) b_and!31203 (not b!976882) (not b!976816) (not b!976810) (not d!116483) (not b!976801) (not b_lambda!14599) (not b!976768) (not b!976777) (not b!976806) (not bm!41776) (not d!116589) (not d!116611) (not d!116529) (not d!116593) (not b_lambda!14585) (not b!976825) (not b!976823) (not b!976736) (not d!116549) (not b!976819) (not d!116539) (not d!116509) (not d!116581) (not b!976872) (not b!976864) (not d!116601) (not d!116609) (not d!116575) (not d!116583) (not d!116513) (not b!976799) (not b!976786) (not bm!41777) (not b!976876) (not b!976881) (not b!976829) (not b!976772) (not d!116537) (not d!116501) (not b!976859) (not d!116523) (not b!976807) (not b!976784) (not b!976785) (not b!976723) (not b!976808) (not d!116505) (not b!976737) (not d!116503) (not d!116545) (not d!116577) (not b!976775) (not b!976724) (not b!976787) (not d!116573) (not b!976877) (not d!116507) (not b!976886) (not d!116497) (not b!976860) (not d!116607) (not d!116585) (not b!976717) (not d!116603) (not d!116605) (not b!976783) (not b!976827) (not d!116569) (not b!976729) (not d!116493) (not d!116571) (not b!976865) (not b!976776) (not d!116599) (not b_next!19551) (not d!116531) (not d!116521) (not d!116527) (not b!976874) (not b!976733) (not b!976795) (not b!976861) (not d!116597) (not b!976797) (not b!976862) (not b!976802) (not d!116519) (not d!116499) (not b!976731) (not bm!41775) (not b!976888) (not b!976781) (not b!976890) (not b!976773) (not b!976875) (not b!976732) tp_is_empty!22455 (not b_lambda!14601) (not b!976848) (not b!976788) (not b!976730) (not d!116595) (not bm!41778) (not b!976817) (not d!116563) (not mapNonEmpty!35699) (not d!116561) (not b!976821) (not b!976800) (not d!116511))
(check-sat b_and!31203 (not b_next!19551))
