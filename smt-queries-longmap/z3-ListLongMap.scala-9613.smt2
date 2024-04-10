; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113708 () Bool)

(assert start!113708)

(declare-fun b_free!31593 () Bool)

(declare-fun b_next!31593 () Bool)

(assert (=> start!113708 (= b_free!31593 (not b_next!31593))))

(declare-fun tp!110597 () Bool)

(declare-fun b_and!50991 () Bool)

(assert (=> start!113708 (= tp!110597 b_and!50991)))

(declare-fun b!1349605 () Bool)

(declare-fun res!895348 () Bool)

(declare-fun e!767727 () Bool)

(assert (=> b!1349605 (=> (not res!895348) (not e!767727))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!92018 0))(
  ( (array!92019 (arr!44461 (Array (_ BitVec 32) (_ BitVec 64))) (size!45011 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92018)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349605 (= res!895348 (not (= (select (arr!44461 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1349606 () Bool)

(declare-fun res!895341 () Bool)

(assert (=> b!1349606 (=> (not res!895341) (not e!767727))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!92018 (_ BitVec 32)) Bool)

(assert (=> b!1349606 (= res!895341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!895344 () Bool)

(assert (=> start!113708 (=> (not res!895344) (not e!767727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113708 (= res!895344 (validMask!0 mask!1977))))

(assert (=> start!113708 e!767727))

(declare-fun tp_is_empty!37593 () Bool)

(assert (=> start!113708 tp_is_empty!37593))

(assert (=> start!113708 true))

(declare-fun array_inv!33491 (array!92018) Bool)

(assert (=> start!113708 (array_inv!33491 _keys!1571)))

(declare-datatypes ((V!55227 0))(
  ( (V!55228 (val!18871 Int)) )
))
(declare-datatypes ((ValueCell!17898 0))(
  ( (ValueCellFull!17898 (v!21527 V!55227)) (EmptyCell!17898) )
))
(declare-datatypes ((array!92020 0))(
  ( (array!92021 (arr!44462 (Array (_ BitVec 32) ValueCell!17898)) (size!45012 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92020)

(declare-fun e!767724 () Bool)

(declare-fun array_inv!33492 (array!92020) Bool)

(assert (=> start!113708 (and (array_inv!33492 _values!1303) e!767724)))

(assert (=> start!113708 tp!110597))

(declare-fun b!1349607 () Bool)

(declare-fun res!895347 () Bool)

(assert (=> b!1349607 (=> (not res!895347) (not e!767727))))

(declare-fun minValue!1245 () V!55227)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!55227)

(declare-datatypes ((tuple2!24338 0))(
  ( (tuple2!24339 (_1!12180 (_ BitVec 64)) (_2!12180 V!55227)) )
))
(declare-datatypes ((List!31489 0))(
  ( (Nil!31486) (Cons!31485 (h!32694 tuple2!24338) (t!46145 List!31489)) )
))
(declare-datatypes ((ListLongMap!21995 0))(
  ( (ListLongMap!21996 (toList!11013 List!31489)) )
))
(declare-fun contains!9197 (ListLongMap!21995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5961 (array!92018 array!92020 (_ BitVec 32) (_ BitVec 32) V!55227 V!55227 (_ BitVec 32) Int) ListLongMap!21995)

(assert (=> b!1349607 (= res!895347 (contains!9197 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349608 () Bool)

(declare-fun res!895342 () Bool)

(assert (=> b!1349608 (=> (not res!895342) (not e!767727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349608 (= res!895342 (not (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960))))))

(declare-fun b!1349609 () Bool)

(declare-fun res!895343 () Bool)

(assert (=> b!1349609 (=> (not res!895343) (not e!767727))))

(assert (=> b!1349609 (= res!895343 (and (= (size!45012 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45011 _keys!1571) (size!45012 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58110 () Bool)

(declare-fun mapRes!58110 () Bool)

(assert (=> mapIsEmpty!58110 mapRes!58110))

(declare-fun mapNonEmpty!58110 () Bool)

(declare-fun tp!110598 () Bool)

(declare-fun e!767725 () Bool)

(assert (=> mapNonEmpty!58110 (= mapRes!58110 (and tp!110598 e!767725))))

(declare-fun mapKey!58110 () (_ BitVec 32))

(declare-fun mapValue!58110 () ValueCell!17898)

(declare-fun mapRest!58110 () (Array (_ BitVec 32) ValueCell!17898))

(assert (=> mapNonEmpty!58110 (= (arr!44462 _values!1303) (store mapRest!58110 mapKey!58110 mapValue!58110))))

(declare-fun b!1349610 () Bool)

(declare-fun e!767726 () Bool)

(assert (=> b!1349610 (= e!767726 tp_is_empty!37593)))

(declare-fun b!1349611 () Bool)

(declare-fun res!895346 () Bool)

(assert (=> b!1349611 (=> (not res!895346) (not e!767727))))

(declare-datatypes ((List!31490 0))(
  ( (Nil!31487) (Cons!31486 (h!32695 (_ BitVec 64)) (t!46146 List!31490)) )
))
(declare-fun arrayNoDuplicates!0 (array!92018 (_ BitVec 32) List!31490) Bool)

(assert (=> b!1349611 (= res!895346 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31487))))

(declare-fun b!1349612 () Bool)

(assert (=> b!1349612 (= e!767725 tp_is_empty!37593)))

(declare-fun b!1349613 () Bool)

(assert (=> b!1349613 (= e!767727 (not (contains!9197 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142)))))

(declare-fun b!1349614 () Bool)

(declare-fun res!895345 () Bool)

(assert (=> b!1349614 (=> (not res!895345) (not e!767727))))

(assert (=> b!1349614 (= res!895345 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349615 () Bool)

(assert (=> b!1349615 (= e!767724 (and e!767726 mapRes!58110))))

(declare-fun condMapEmpty!58110 () Bool)

(declare-fun mapDefault!58110 () ValueCell!17898)

(assert (=> b!1349615 (= condMapEmpty!58110 (= (arr!44462 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17898)) mapDefault!58110)))))

(assert (= (and start!113708 res!895344) b!1349609))

(assert (= (and b!1349609 res!895343) b!1349606))

(assert (= (and b!1349606 res!895341) b!1349611))

(assert (= (and b!1349611 res!895346) b!1349614))

(assert (= (and b!1349614 res!895345) b!1349607))

(assert (= (and b!1349607 res!895347) b!1349605))

(assert (= (and b!1349605 res!895348) b!1349608))

(assert (= (and b!1349608 res!895342) b!1349613))

(assert (= (and b!1349615 condMapEmpty!58110) mapIsEmpty!58110))

(assert (= (and b!1349615 (not condMapEmpty!58110)) mapNonEmpty!58110))

(get-info :version)

(assert (= (and mapNonEmpty!58110 ((_ is ValueCellFull!17898) mapValue!58110)) b!1349612))

(assert (= (and b!1349615 ((_ is ValueCellFull!17898) mapDefault!58110)) b!1349610))

(assert (= start!113708 b!1349615))

(declare-fun m!1236695 () Bool)

(assert (=> b!1349611 m!1236695))

(declare-fun m!1236697 () Bool)

(assert (=> b!1349605 m!1236697))

(declare-fun m!1236699 () Bool)

(assert (=> mapNonEmpty!58110 m!1236699))

(declare-fun m!1236701 () Bool)

(assert (=> b!1349607 m!1236701))

(assert (=> b!1349607 m!1236701))

(declare-fun m!1236703 () Bool)

(assert (=> b!1349607 m!1236703))

(declare-fun m!1236705 () Bool)

(assert (=> b!1349606 m!1236705))

(assert (=> b!1349608 m!1236697))

(assert (=> b!1349608 m!1236697))

(declare-fun m!1236707 () Bool)

(assert (=> b!1349608 m!1236707))

(declare-fun m!1236709 () Bool)

(assert (=> start!113708 m!1236709))

(declare-fun m!1236711 () Bool)

(assert (=> start!113708 m!1236711))

(declare-fun m!1236713 () Bool)

(assert (=> start!113708 m!1236713))

(declare-fun m!1236715 () Bool)

(assert (=> b!1349613 m!1236715))

(assert (=> b!1349613 m!1236715))

(declare-fun m!1236717 () Bool)

(assert (=> b!1349613 m!1236717))

(check-sat b_and!50991 (not b!1349611) tp_is_empty!37593 (not b!1349613) (not start!113708) (not b!1349608) (not b_next!31593) (not b!1349607) (not mapNonEmpty!58110) (not b!1349606))
(check-sat b_and!50991 (not b_next!31593))
(get-model)

(declare-fun bm!65200 () Bool)

(declare-fun call!65203 () Bool)

(assert (=> bm!65200 (= call!65203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144691 () Bool)

(declare-fun res!895378 () Bool)

(declare-fun e!767752 () Bool)

(assert (=> d!144691 (=> res!895378 e!767752)))

(assert (=> d!144691 (= res!895378 (bvsge #b00000000000000000000000000000000 (size!45011 _keys!1571)))))

(assert (=> d!144691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767752)))

(declare-fun b!1349657 () Bool)

(declare-fun e!767750 () Bool)

(assert (=> b!1349657 (= e!767750 call!65203)))

(declare-fun b!1349658 () Bool)

(declare-fun e!767751 () Bool)

(assert (=> b!1349658 (= e!767751 e!767750)))

(declare-fun lt!596616 () (_ BitVec 64))

(assert (=> b!1349658 (= lt!596616 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!44203 0))(
  ( (Unit!44204) )
))
(declare-fun lt!596617 () Unit!44203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!92018 (_ BitVec 64) (_ BitVec 32)) Unit!44203)

(assert (=> b!1349658 (= lt!596617 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596616 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!92018 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1349658 (arrayContainsKey!0 _keys!1571 lt!596616 #b00000000000000000000000000000000)))

(declare-fun lt!596618 () Unit!44203)

(assert (=> b!1349658 (= lt!596618 lt!596617)))

(declare-fun res!895377 () Bool)

(declare-datatypes ((SeekEntryResult!10060 0))(
  ( (MissingZero!10060 (index!42611 (_ BitVec 32))) (Found!10060 (index!42612 (_ BitVec 32))) (Intermediate!10060 (undefined!10872 Bool) (index!42613 (_ BitVec 32)) (x!120779 (_ BitVec 32))) (Undefined!10060) (MissingVacant!10060 (index!42614 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!92018 (_ BitVec 32)) SeekEntryResult!10060)

(assert (=> b!1349658 (= res!895377 (= (seekEntryOrOpen!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10060 #b00000000000000000000000000000000)))))

(assert (=> b!1349658 (=> (not res!895377) (not e!767750))))

(declare-fun b!1349659 () Bool)

(assert (=> b!1349659 (= e!767752 e!767751)))

(declare-fun c!126605 () Bool)

(assert (=> b!1349659 (= c!126605 (validKeyInArray!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349660 () Bool)

(assert (=> b!1349660 (= e!767751 call!65203)))

(assert (= (and d!144691 (not res!895378)) b!1349659))

(assert (= (and b!1349659 c!126605) b!1349658))

(assert (= (and b!1349659 (not c!126605)) b!1349660))

(assert (= (and b!1349658 res!895377) b!1349657))

(assert (= (or b!1349657 b!1349660) bm!65200))

(declare-fun m!1236743 () Bool)

(assert (=> bm!65200 m!1236743))

(declare-fun m!1236745 () Bool)

(assert (=> b!1349658 m!1236745))

(declare-fun m!1236747 () Bool)

(assert (=> b!1349658 m!1236747))

(declare-fun m!1236749 () Bool)

(assert (=> b!1349658 m!1236749))

(assert (=> b!1349658 m!1236745))

(declare-fun m!1236751 () Bool)

(assert (=> b!1349658 m!1236751))

(assert (=> b!1349659 m!1236745))

(assert (=> b!1349659 m!1236745))

(declare-fun m!1236753 () Bool)

(assert (=> b!1349659 m!1236753))

(assert (=> b!1349606 d!144691))

(declare-fun d!144693 () Bool)

(declare-fun e!767758 () Bool)

(assert (=> d!144693 e!767758))

(declare-fun res!895381 () Bool)

(assert (=> d!144693 (=> res!895381 e!767758)))

(declare-fun lt!596630 () Bool)

(assert (=> d!144693 (= res!895381 (not lt!596630))))

(declare-fun lt!596627 () Bool)

(assert (=> d!144693 (= lt!596630 lt!596627)))

(declare-fun lt!596628 () Unit!44203)

(declare-fun e!767757 () Unit!44203)

(assert (=> d!144693 (= lt!596628 e!767757)))

(declare-fun c!126608 () Bool)

(assert (=> d!144693 (= c!126608 lt!596627)))

(declare-fun containsKey!746 (List!31489 (_ BitVec 64)) Bool)

(assert (=> d!144693 (= lt!596627 (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (=> d!144693 (= (contains!9197 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) k0!1142) lt!596630)))

(declare-fun b!1349667 () Bool)

(declare-fun lt!596629 () Unit!44203)

(assert (=> b!1349667 (= e!767757 lt!596629)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!492 (List!31489 (_ BitVec 64)) Unit!44203)

(assert (=> b!1349667 (= lt!596629 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!776 0))(
  ( (Some!775 (v!21529 V!55227)) (None!774) )
))
(declare-fun isDefined!531 (Option!776) Bool)

(declare-fun getValueByKey!724 (List!31489 (_ BitVec 64)) Option!776)

(assert (=> b!1349667 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun b!1349668 () Bool)

(declare-fun Unit!44205 () Unit!44203)

(assert (=> b!1349668 (= e!767757 Unit!44205)))

(declare-fun b!1349669 () Bool)

(assert (=> b!1349669 (= e!767758 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144693 c!126608) b!1349667))

(assert (= (and d!144693 (not c!126608)) b!1349668))

(assert (= (and d!144693 (not res!895381)) b!1349669))

(declare-fun m!1236755 () Bool)

(assert (=> d!144693 m!1236755))

(declare-fun m!1236757 () Bool)

(assert (=> b!1349667 m!1236757))

(declare-fun m!1236759 () Bool)

(assert (=> b!1349667 m!1236759))

(assert (=> b!1349667 m!1236759))

(declare-fun m!1236761 () Bool)

(assert (=> b!1349667 m!1236761))

(assert (=> b!1349669 m!1236759))

(assert (=> b!1349669 m!1236759))

(assert (=> b!1349669 m!1236761))

(assert (=> b!1349613 d!144693))

(declare-fun b!1349712 () Bool)

(declare-fun e!767788 () Bool)

(declare-fun e!767785 () Bool)

(assert (=> b!1349712 (= e!767788 e!767785)))

(declare-fun res!895403 () Bool)

(declare-fun call!65223 () Bool)

(assert (=> b!1349712 (= res!895403 call!65223)))

(assert (=> b!1349712 (=> (not res!895403) (not e!767785))))

(declare-fun bm!65215 () Bool)

(declare-fun call!65220 () Bool)

(declare-fun lt!596691 () ListLongMap!21995)

(assert (=> bm!65215 (= call!65220 (contains!9197 lt!596691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349713 () Bool)

(assert (=> b!1349713 (= e!767788 (not call!65223))))

(declare-fun b!1349714 () Bool)

(declare-fun res!895402 () Bool)

(declare-fun e!767795 () Bool)

(assert (=> b!1349714 (=> (not res!895402) (not e!767795))))

(assert (=> b!1349714 (= res!895402 e!767788)))

(declare-fun c!126626 () Bool)

(assert (=> b!1349714 (= c!126626 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349715 () Bool)

(declare-fun e!767787 () Unit!44203)

(declare-fun Unit!44206 () Unit!44203)

(assert (=> b!1349715 (= e!767787 Unit!44206)))

(declare-fun e!767786 () Bool)

(declare-fun b!1349716 () Bool)

(declare-fun apply!1041 (ListLongMap!21995 (_ BitVec 64)) V!55227)

(declare-fun get!22468 (ValueCell!17898 V!55227) V!55227)

(declare-fun dynLambda!3794 (Int (_ BitVec 64)) V!55227)

(assert (=> b!1349716 (= e!767786 (= (apply!1041 lt!596691 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22468 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349716 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45012 _values!1303)))))

(assert (=> b!1349716 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun call!65224 () ListLongMap!21995)

(declare-fun call!65221 () ListLongMap!21995)

(declare-fun c!126622 () Bool)

(declare-fun call!65218 () ListLongMap!21995)

(declare-fun c!126624 () Bool)

(declare-fun call!65222 () ListLongMap!21995)

(declare-fun bm!65216 () Bool)

(declare-fun +!4855 (ListLongMap!21995 tuple2!24338) ListLongMap!21995)

(assert (=> bm!65216 (= call!65218 (+!4855 (ite c!126622 call!65221 (ite c!126624 call!65224 call!65222)) (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1349717 () Bool)

(declare-fun e!767792 () Bool)

(assert (=> b!1349717 (= e!767792 e!767786)))

(declare-fun res!895404 () Bool)

(assert (=> b!1349717 (=> (not res!895404) (not e!767786))))

(assert (=> b!1349717 (= res!895404 (contains!9197 lt!596691 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349717 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun b!1349718 () Bool)

(declare-fun e!767796 () ListLongMap!21995)

(assert (=> b!1349718 (= e!767796 (+!4855 call!65218 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349719 () Bool)

(declare-fun e!767791 () Bool)

(assert (=> b!1349719 (= e!767791 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349720 () Bool)

(declare-fun c!126621 () Bool)

(assert (=> b!1349720 (= c!126621 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767793 () ListLongMap!21995)

(declare-fun e!767789 () ListLongMap!21995)

(assert (=> b!1349720 (= e!767793 e!767789)))

(declare-fun b!1349721 () Bool)

(declare-fun e!767794 () Bool)

(assert (=> b!1349721 (= e!767795 e!767794)))

(declare-fun c!126625 () Bool)

(assert (=> b!1349721 (= c!126625 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349722 () Bool)

(declare-fun call!65219 () ListLongMap!21995)

(assert (=> b!1349722 (= e!767793 call!65219)))

(declare-fun b!1349723 () Bool)

(declare-fun e!767790 () Bool)

(assert (=> b!1349723 (= e!767790 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun bm!65217 () Bool)

(assert (=> bm!65217 (= call!65223 (contains!9197 lt!596691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65218 () Bool)

(assert (=> bm!65218 (= call!65224 call!65221)))

(declare-fun bm!65219 () Bool)

(assert (=> bm!65219 (= call!65222 call!65224)))

(declare-fun d!144695 () Bool)

(assert (=> d!144695 e!767795))

(declare-fun res!895401 () Bool)

(assert (=> d!144695 (=> (not res!895401) (not e!767795))))

(assert (=> d!144695 (= res!895401 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))))

(declare-fun lt!596694 () ListLongMap!21995)

(assert (=> d!144695 (= lt!596691 lt!596694)))

(declare-fun lt!596678 () Unit!44203)

(assert (=> d!144695 (= lt!596678 e!767787)))

(declare-fun c!126623 () Bool)

(assert (=> d!144695 (= c!126623 e!767791)))

(declare-fun res!895408 () Bool)

(assert (=> d!144695 (=> (not res!895408) (not e!767791))))

(assert (=> d!144695 (= res!895408 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(assert (=> d!144695 (= lt!596694 e!767796)))

(assert (=> d!144695 (= c!126622 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144695 (validMask!0 mask!1977)))

(assert (=> d!144695 (= (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596691)))

(declare-fun b!1349724 () Bool)

(declare-fun res!895400 () Bool)

(assert (=> b!1349724 (=> (not res!895400) (not e!767795))))

(assert (=> b!1349724 (= res!895400 e!767792)))

(declare-fun res!895407 () Bool)

(assert (=> b!1349724 (=> res!895407 e!767792)))

(assert (=> b!1349724 (= res!895407 (not e!767790))))

(declare-fun res!895405 () Bool)

(assert (=> b!1349724 (=> (not res!895405) (not e!767790))))

(assert (=> b!1349724 (= res!895405 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun b!1349725 () Bool)

(declare-fun e!767797 () Bool)

(assert (=> b!1349725 (= e!767797 (= (apply!1041 lt!596691 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349726 () Bool)

(assert (=> b!1349726 (= e!767794 (not call!65220))))

(declare-fun b!1349727 () Bool)

(assert (=> b!1349727 (= e!767796 e!767793)))

(assert (=> b!1349727 (= c!126624 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349728 () Bool)

(declare-fun lt!596689 () Unit!44203)

(assert (=> b!1349728 (= e!767787 lt!596689)))

(declare-fun lt!596683 () ListLongMap!21995)

(declare-fun getCurrentListMapNoExtraKeys!6501 (array!92018 array!92020 (_ BitVec 32) (_ BitVec 32) V!55227 V!55227 (_ BitVec 32) Int) ListLongMap!21995)

(assert (=> b!1349728 (= lt!596683 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596688 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596688 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596686 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596686 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596681 () Unit!44203)

(declare-fun addStillContains!1216 (ListLongMap!21995 (_ BitVec 64) V!55227 (_ BitVec 64)) Unit!44203)

(assert (=> b!1349728 (= lt!596681 (addStillContains!1216 lt!596683 lt!596688 zeroValue!1245 lt!596686))))

(assert (=> b!1349728 (contains!9197 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245)) lt!596686)))

(declare-fun lt!596684 () Unit!44203)

(assert (=> b!1349728 (= lt!596684 lt!596681)))

(declare-fun lt!596680 () ListLongMap!21995)

(assert (=> b!1349728 (= lt!596680 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596679 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596679 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596675 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596675 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596696 () Unit!44203)

(declare-fun addApplyDifferent!583 (ListLongMap!21995 (_ BitVec 64) V!55227 (_ BitVec 64)) Unit!44203)

(assert (=> b!1349728 (= lt!596696 (addApplyDifferent!583 lt!596680 lt!596679 minValue!1245 lt!596675))))

(assert (=> b!1349728 (= (apply!1041 (+!4855 lt!596680 (tuple2!24339 lt!596679 minValue!1245)) lt!596675) (apply!1041 lt!596680 lt!596675))))

(declare-fun lt!596682 () Unit!44203)

(assert (=> b!1349728 (= lt!596682 lt!596696)))

(declare-fun lt!596690 () ListLongMap!21995)

(assert (=> b!1349728 (= lt!596690 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596693 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596692 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596692 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun lt!596676 () Unit!44203)

(assert (=> b!1349728 (= lt!596676 (addApplyDifferent!583 lt!596690 lt!596693 zeroValue!1245 lt!596692))))

(assert (=> b!1349728 (= (apply!1041 (+!4855 lt!596690 (tuple2!24339 lt!596693 zeroValue!1245)) lt!596692) (apply!1041 lt!596690 lt!596692))))

(declare-fun lt!596685 () Unit!44203)

(assert (=> b!1349728 (= lt!596685 lt!596676)))

(declare-fun lt!596687 () ListLongMap!21995)

(assert (=> b!1349728 (= lt!596687 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun lt!596695 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596695 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596677 () (_ BitVec 64))

(assert (=> b!1349728 (= lt!596677 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349728 (= lt!596689 (addApplyDifferent!583 lt!596687 lt!596695 minValue!1245 lt!596677))))

(assert (=> b!1349728 (= (apply!1041 (+!4855 lt!596687 (tuple2!24339 lt!596695 minValue!1245)) lt!596677) (apply!1041 lt!596687 lt!596677))))

(declare-fun b!1349729 () Bool)

(assert (=> b!1349729 (= e!767785 (= (apply!1041 lt!596691 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun bm!65220 () Bool)

(assert (=> bm!65220 (= call!65219 call!65218)))

(declare-fun b!1349730 () Bool)

(assert (=> b!1349730 (= e!767794 e!767797)))

(declare-fun res!895406 () Bool)

(assert (=> b!1349730 (= res!895406 call!65220)))

(assert (=> b!1349730 (=> (not res!895406) (not e!767797))))

(declare-fun b!1349731 () Bool)

(assert (=> b!1349731 (= e!767789 call!65222)))

(declare-fun b!1349732 () Bool)

(assert (=> b!1349732 (= e!767789 call!65219)))

(declare-fun bm!65221 () Bool)

(assert (=> bm!65221 (= call!65221 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and d!144695 c!126622) b!1349718))

(assert (= (and d!144695 (not c!126622)) b!1349727))

(assert (= (and b!1349727 c!126624) b!1349722))

(assert (= (and b!1349727 (not c!126624)) b!1349720))

(assert (= (and b!1349720 c!126621) b!1349732))

(assert (= (and b!1349720 (not c!126621)) b!1349731))

(assert (= (or b!1349732 b!1349731) bm!65219))

(assert (= (or b!1349722 bm!65219) bm!65218))

(assert (= (or b!1349722 b!1349732) bm!65220))

(assert (= (or b!1349718 bm!65218) bm!65221))

(assert (= (or b!1349718 bm!65220) bm!65216))

(assert (= (and d!144695 res!895408) b!1349719))

(assert (= (and d!144695 c!126623) b!1349728))

(assert (= (and d!144695 (not c!126623)) b!1349715))

(assert (= (and d!144695 res!895401) b!1349724))

(assert (= (and b!1349724 res!895405) b!1349723))

(assert (= (and b!1349724 (not res!895407)) b!1349717))

(assert (= (and b!1349717 res!895404) b!1349716))

(assert (= (and b!1349724 res!895400) b!1349714))

(assert (= (and b!1349714 c!126626) b!1349712))

(assert (= (and b!1349714 (not c!126626)) b!1349713))

(assert (= (and b!1349712 res!895403) b!1349729))

(assert (= (or b!1349712 b!1349713) bm!65217))

(assert (= (and b!1349714 res!895402) b!1349721))

(assert (= (and b!1349721 c!126625) b!1349730))

(assert (= (and b!1349721 (not c!126625)) b!1349726))

(assert (= (and b!1349730 res!895406) b!1349725))

(assert (= (or b!1349730 b!1349726) bm!65215))

(declare-fun b_lambda!24719 () Bool)

(assert (=> (not b_lambda!24719) (not b!1349716)))

(declare-fun t!46148 () Bool)

(declare-fun tb!12461 () Bool)

(assert (=> (and start!113708 (= defaultEntry!1306 defaultEntry!1306) t!46148) tb!12461))

(declare-fun result!26021 () Bool)

(assert (=> tb!12461 (= result!26021 tp_is_empty!37593)))

(assert (=> b!1349716 t!46148))

(declare-fun b_and!50995 () Bool)

(assert (= b_and!50991 (and (=> t!46148 result!26021) b_and!50995)))

(declare-fun m!1236763 () Bool)

(assert (=> b!1349723 m!1236763))

(assert (=> b!1349723 m!1236763))

(declare-fun m!1236765 () Bool)

(assert (=> b!1349723 m!1236765))

(declare-fun m!1236767 () Bool)

(assert (=> bm!65216 m!1236767))

(declare-fun m!1236769 () Bool)

(assert (=> bm!65217 m!1236769))

(assert (=> d!144695 m!1236709))

(declare-fun m!1236771 () Bool)

(assert (=> b!1349729 m!1236771))

(assert (=> b!1349719 m!1236763))

(assert (=> b!1349719 m!1236763))

(assert (=> b!1349719 m!1236765))

(declare-fun m!1236773 () Bool)

(assert (=> b!1349725 m!1236773))

(declare-fun m!1236775 () Bool)

(assert (=> bm!65215 m!1236775))

(declare-fun m!1236777 () Bool)

(assert (=> b!1349718 m!1236777))

(declare-fun m!1236779 () Bool)

(assert (=> bm!65221 m!1236779))

(declare-fun m!1236781 () Bool)

(assert (=> b!1349728 m!1236781))

(declare-fun m!1236783 () Bool)

(assert (=> b!1349728 m!1236783))

(declare-fun m!1236785 () Bool)

(assert (=> b!1349728 m!1236785))

(declare-fun m!1236787 () Bool)

(assert (=> b!1349728 m!1236787))

(assert (=> b!1349728 m!1236781))

(declare-fun m!1236789 () Bool)

(assert (=> b!1349728 m!1236789))

(assert (=> b!1349728 m!1236763))

(assert (=> b!1349728 m!1236785))

(declare-fun m!1236791 () Bool)

(assert (=> b!1349728 m!1236791))

(declare-fun m!1236793 () Bool)

(assert (=> b!1349728 m!1236793))

(declare-fun m!1236795 () Bool)

(assert (=> b!1349728 m!1236795))

(declare-fun m!1236797 () Bool)

(assert (=> b!1349728 m!1236797))

(assert (=> b!1349728 m!1236779))

(declare-fun m!1236799 () Bool)

(assert (=> b!1349728 m!1236799))

(assert (=> b!1349728 m!1236791))

(declare-fun m!1236801 () Bool)

(assert (=> b!1349728 m!1236801))

(declare-fun m!1236803 () Bool)

(assert (=> b!1349728 m!1236803))

(declare-fun m!1236805 () Bool)

(assert (=> b!1349728 m!1236805))

(declare-fun m!1236807 () Bool)

(assert (=> b!1349728 m!1236807))

(assert (=> b!1349728 m!1236805))

(declare-fun m!1236809 () Bool)

(assert (=> b!1349728 m!1236809))

(declare-fun m!1236811 () Bool)

(assert (=> b!1349716 m!1236811))

(assert (=> b!1349716 m!1236763))

(declare-fun m!1236813 () Bool)

(assert (=> b!1349716 m!1236813))

(assert (=> b!1349716 m!1236811))

(declare-fun m!1236815 () Bool)

(assert (=> b!1349716 m!1236815))

(declare-fun m!1236817 () Bool)

(assert (=> b!1349716 m!1236817))

(assert (=> b!1349716 m!1236763))

(assert (=> b!1349716 m!1236815))

(assert (=> b!1349717 m!1236763))

(assert (=> b!1349717 m!1236763))

(declare-fun m!1236819 () Bool)

(assert (=> b!1349717 m!1236819))

(assert (=> b!1349613 d!144695))

(declare-fun d!144697 () Bool)

(assert (=> d!144697 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113708 d!144697))

(declare-fun d!144699 () Bool)

(assert (=> d!144699 (= (array_inv!33491 _keys!1571) (bvsge (size!45011 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113708 d!144699))

(declare-fun d!144701 () Bool)

(assert (=> d!144701 (= (array_inv!33492 _values!1303) (bvsge (size!45012 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113708 d!144701))

(declare-fun d!144703 () Bool)

(declare-fun e!767799 () Bool)

(assert (=> d!144703 e!767799))

(declare-fun res!895409 () Bool)

(assert (=> d!144703 (=> res!895409 e!767799)))

(declare-fun lt!596700 () Bool)

(assert (=> d!144703 (= res!895409 (not lt!596700))))

(declare-fun lt!596697 () Bool)

(assert (=> d!144703 (= lt!596700 lt!596697)))

(declare-fun lt!596698 () Unit!44203)

(declare-fun e!767798 () Unit!44203)

(assert (=> d!144703 (= lt!596698 e!767798)))

(declare-fun c!126627 () Bool)

(assert (=> d!144703 (= c!126627 lt!596697)))

(assert (=> d!144703 (= lt!596697 (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144703 (= (contains!9197 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596700)))

(declare-fun b!1349735 () Bool)

(declare-fun lt!596699 () Unit!44203)

(assert (=> b!1349735 (= e!767798 lt!596699)))

(assert (=> b!1349735 (= lt!596699 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> b!1349735 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1349736 () Bool)

(declare-fun Unit!44207 () Unit!44203)

(assert (=> b!1349736 (= e!767798 Unit!44207)))

(declare-fun b!1349737 () Bool)

(assert (=> b!1349737 (= e!767799 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144703 c!126627) b!1349735))

(assert (= (and d!144703 (not c!126627)) b!1349736))

(assert (= (and d!144703 (not res!895409)) b!1349737))

(declare-fun m!1236821 () Bool)

(assert (=> d!144703 m!1236821))

(declare-fun m!1236823 () Bool)

(assert (=> b!1349735 m!1236823))

(declare-fun m!1236825 () Bool)

(assert (=> b!1349735 m!1236825))

(assert (=> b!1349735 m!1236825))

(declare-fun m!1236827 () Bool)

(assert (=> b!1349735 m!1236827))

(assert (=> b!1349737 m!1236825))

(assert (=> b!1349737 m!1236825))

(assert (=> b!1349737 m!1236827))

(assert (=> b!1349607 d!144703))

(declare-fun b!1349738 () Bool)

(declare-fun e!767803 () Bool)

(declare-fun e!767800 () Bool)

(assert (=> b!1349738 (= e!767803 e!767800)))

(declare-fun res!895413 () Bool)

(declare-fun call!65230 () Bool)

(assert (=> b!1349738 (= res!895413 call!65230)))

(assert (=> b!1349738 (=> (not res!895413) (not e!767800))))

(declare-fun bm!65222 () Bool)

(declare-fun call!65227 () Bool)

(declare-fun lt!596717 () ListLongMap!21995)

(assert (=> bm!65222 (= call!65227 (contains!9197 lt!596717 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349739 () Bool)

(assert (=> b!1349739 (= e!767803 (not call!65230))))

(declare-fun b!1349740 () Bool)

(declare-fun res!895412 () Bool)

(declare-fun e!767810 () Bool)

(assert (=> b!1349740 (=> (not res!895412) (not e!767810))))

(assert (=> b!1349740 (= res!895412 e!767803)))

(declare-fun c!126633 () Bool)

(assert (=> b!1349740 (= c!126633 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1349741 () Bool)

(declare-fun e!767802 () Unit!44203)

(declare-fun Unit!44208 () Unit!44203)

(assert (=> b!1349741 (= e!767802 Unit!44208)))

(declare-fun e!767801 () Bool)

(declare-fun b!1349742 () Bool)

(assert (=> b!1349742 (= e!767801 (= (apply!1041 lt!596717 (select (arr!44461 _keys!1571) from!1960)) (get!22468 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349742 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45012 _values!1303)))))

(assert (=> b!1349742 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun bm!65223 () Bool)

(declare-fun c!126631 () Bool)

(declare-fun call!65225 () ListLongMap!21995)

(declare-fun call!65228 () ListLongMap!21995)

(declare-fun call!65229 () ListLongMap!21995)

(declare-fun c!126629 () Bool)

(declare-fun call!65231 () ListLongMap!21995)

(assert (=> bm!65223 (= call!65225 (+!4855 (ite c!126629 call!65228 (ite c!126631 call!65231 call!65229)) (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1349743 () Bool)

(declare-fun e!767807 () Bool)

(assert (=> b!1349743 (= e!767807 e!767801)))

(declare-fun res!895414 () Bool)

(assert (=> b!1349743 (=> (not res!895414) (not e!767801))))

(assert (=> b!1349743 (= res!895414 (contains!9197 lt!596717 (select (arr!44461 _keys!1571) from!1960)))))

(assert (=> b!1349743 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun b!1349744 () Bool)

(declare-fun e!767811 () ListLongMap!21995)

(assert (=> b!1349744 (= e!767811 (+!4855 call!65225 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1349745 () Bool)

(declare-fun e!767806 () Bool)

(assert (=> b!1349745 (= e!767806 (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960)))))

(declare-fun b!1349746 () Bool)

(declare-fun c!126628 () Bool)

(assert (=> b!1349746 (= c!126628 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!767808 () ListLongMap!21995)

(declare-fun e!767804 () ListLongMap!21995)

(assert (=> b!1349746 (= e!767808 e!767804)))

(declare-fun b!1349747 () Bool)

(declare-fun e!767809 () Bool)

(assert (=> b!1349747 (= e!767810 e!767809)))

(declare-fun c!126632 () Bool)

(assert (=> b!1349747 (= c!126632 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349748 () Bool)

(declare-fun call!65226 () ListLongMap!21995)

(assert (=> b!1349748 (= e!767808 call!65226)))

(declare-fun b!1349749 () Bool)

(declare-fun e!767805 () Bool)

(assert (=> b!1349749 (= e!767805 (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960)))))

(declare-fun bm!65224 () Bool)

(assert (=> bm!65224 (= call!65230 (contains!9197 lt!596717 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!65225 () Bool)

(assert (=> bm!65225 (= call!65231 call!65228)))

(declare-fun bm!65226 () Bool)

(assert (=> bm!65226 (= call!65229 call!65231)))

(declare-fun d!144705 () Bool)

(assert (=> d!144705 e!767810))

(declare-fun res!895411 () Bool)

(assert (=> d!144705 (=> (not res!895411) (not e!767810))))

(assert (=> d!144705 (= res!895411 (or (bvsge from!1960 (size!45011 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)))))))

(declare-fun lt!596720 () ListLongMap!21995)

(assert (=> d!144705 (= lt!596717 lt!596720)))

(declare-fun lt!596704 () Unit!44203)

(assert (=> d!144705 (= lt!596704 e!767802)))

(declare-fun c!126630 () Bool)

(assert (=> d!144705 (= c!126630 e!767806)))

(declare-fun res!895418 () Bool)

(assert (=> d!144705 (=> (not res!895418) (not e!767806))))

(assert (=> d!144705 (= res!895418 (bvslt from!1960 (size!45011 _keys!1571)))))

(assert (=> d!144705 (= lt!596720 e!767811)))

(assert (=> d!144705 (= c!126629 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144705 (validMask!0 mask!1977)))

(assert (=> d!144705 (= (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596717)))

(declare-fun b!1349750 () Bool)

(declare-fun res!895410 () Bool)

(assert (=> b!1349750 (=> (not res!895410) (not e!767810))))

(assert (=> b!1349750 (= res!895410 e!767807)))

(declare-fun res!895417 () Bool)

(assert (=> b!1349750 (=> res!895417 e!767807)))

(assert (=> b!1349750 (= res!895417 (not e!767805))))

(declare-fun res!895415 () Bool)

(assert (=> b!1349750 (=> (not res!895415) (not e!767805))))

(assert (=> b!1349750 (= res!895415 (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun b!1349751 () Bool)

(declare-fun e!767812 () Bool)

(assert (=> b!1349751 (= e!767812 (= (apply!1041 lt!596717 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1349752 () Bool)

(assert (=> b!1349752 (= e!767809 (not call!65227))))

(declare-fun b!1349753 () Bool)

(assert (=> b!1349753 (= e!767811 e!767808)))

(assert (=> b!1349753 (= c!126631 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1349754 () Bool)

(declare-fun lt!596715 () Unit!44203)

(assert (=> b!1349754 (= e!767802 lt!596715)))

(declare-fun lt!596709 () ListLongMap!21995)

(assert (=> b!1349754 (= lt!596709 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596714 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596714 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596712 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596712 (select (arr!44461 _keys!1571) from!1960))))

(declare-fun lt!596707 () Unit!44203)

(assert (=> b!1349754 (= lt!596707 (addStillContains!1216 lt!596709 lt!596714 zeroValue!1245 lt!596712))))

(assert (=> b!1349754 (contains!9197 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245)) lt!596712)))

(declare-fun lt!596710 () Unit!44203)

(assert (=> b!1349754 (= lt!596710 lt!596707)))

(declare-fun lt!596706 () ListLongMap!21995)

(assert (=> b!1349754 (= lt!596706 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596705 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596705 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596701 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596701 (select (arr!44461 _keys!1571) from!1960))))

(declare-fun lt!596722 () Unit!44203)

(assert (=> b!1349754 (= lt!596722 (addApplyDifferent!583 lt!596706 lt!596705 minValue!1245 lt!596701))))

(assert (=> b!1349754 (= (apply!1041 (+!4855 lt!596706 (tuple2!24339 lt!596705 minValue!1245)) lt!596701) (apply!1041 lt!596706 lt!596701))))

(declare-fun lt!596708 () Unit!44203)

(assert (=> b!1349754 (= lt!596708 lt!596722)))

(declare-fun lt!596716 () ListLongMap!21995)

(assert (=> b!1349754 (= lt!596716 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596719 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596719 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596718 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596718 (select (arr!44461 _keys!1571) from!1960))))

(declare-fun lt!596702 () Unit!44203)

(assert (=> b!1349754 (= lt!596702 (addApplyDifferent!583 lt!596716 lt!596719 zeroValue!1245 lt!596718))))

(assert (=> b!1349754 (= (apply!1041 (+!4855 lt!596716 (tuple2!24339 lt!596719 zeroValue!1245)) lt!596718) (apply!1041 lt!596716 lt!596718))))

(declare-fun lt!596711 () Unit!44203)

(assert (=> b!1349754 (= lt!596711 lt!596702)))

(declare-fun lt!596713 () ListLongMap!21995)

(assert (=> b!1349754 (= lt!596713 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596721 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596721 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596703 () (_ BitVec 64))

(assert (=> b!1349754 (= lt!596703 (select (arr!44461 _keys!1571) from!1960))))

(assert (=> b!1349754 (= lt!596715 (addApplyDifferent!583 lt!596713 lt!596721 minValue!1245 lt!596703))))

(assert (=> b!1349754 (= (apply!1041 (+!4855 lt!596713 (tuple2!24339 lt!596721 minValue!1245)) lt!596703) (apply!1041 lt!596713 lt!596703))))

(declare-fun b!1349755 () Bool)

(assert (=> b!1349755 (= e!767800 (= (apply!1041 lt!596717 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(declare-fun bm!65227 () Bool)

(assert (=> bm!65227 (= call!65226 call!65225)))

(declare-fun b!1349756 () Bool)

(assert (=> b!1349756 (= e!767809 e!767812)))

(declare-fun res!895416 () Bool)

(assert (=> b!1349756 (= res!895416 call!65227)))

(assert (=> b!1349756 (=> (not res!895416) (not e!767812))))

(declare-fun b!1349757 () Bool)

(assert (=> b!1349757 (= e!767804 call!65229)))

(declare-fun b!1349758 () Bool)

(assert (=> b!1349758 (= e!767804 call!65226)))

(declare-fun bm!65228 () Bool)

(assert (=> bm!65228 (= call!65228 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(assert (= (and d!144705 c!126629) b!1349744))

(assert (= (and d!144705 (not c!126629)) b!1349753))

(assert (= (and b!1349753 c!126631) b!1349748))

(assert (= (and b!1349753 (not c!126631)) b!1349746))

(assert (= (and b!1349746 c!126628) b!1349758))

(assert (= (and b!1349746 (not c!126628)) b!1349757))

(assert (= (or b!1349758 b!1349757) bm!65226))

(assert (= (or b!1349748 bm!65226) bm!65225))

(assert (= (or b!1349748 b!1349758) bm!65227))

(assert (= (or b!1349744 bm!65225) bm!65228))

(assert (= (or b!1349744 bm!65227) bm!65223))

(assert (= (and d!144705 res!895418) b!1349745))

(assert (= (and d!144705 c!126630) b!1349754))

(assert (= (and d!144705 (not c!126630)) b!1349741))

(assert (= (and d!144705 res!895411) b!1349750))

(assert (= (and b!1349750 res!895415) b!1349749))

(assert (= (and b!1349750 (not res!895417)) b!1349743))

(assert (= (and b!1349743 res!895414) b!1349742))

(assert (= (and b!1349750 res!895410) b!1349740))

(assert (= (and b!1349740 c!126633) b!1349738))

(assert (= (and b!1349740 (not c!126633)) b!1349739))

(assert (= (and b!1349738 res!895413) b!1349755))

(assert (= (or b!1349738 b!1349739) bm!65224))

(assert (= (and b!1349740 res!895412) b!1349747))

(assert (= (and b!1349747 c!126632) b!1349756))

(assert (= (and b!1349747 (not c!126632)) b!1349752))

(assert (= (and b!1349756 res!895416) b!1349751))

(assert (= (or b!1349756 b!1349752) bm!65222))

(declare-fun b_lambda!24721 () Bool)

(assert (=> (not b_lambda!24721) (not b!1349742)))

(assert (=> b!1349742 t!46148))

(declare-fun b_and!50997 () Bool)

(assert (= b_and!50995 (and (=> t!46148 result!26021) b_and!50997)))

(assert (=> b!1349749 m!1236697))

(assert (=> b!1349749 m!1236697))

(assert (=> b!1349749 m!1236707))

(declare-fun m!1236829 () Bool)

(assert (=> bm!65223 m!1236829))

(declare-fun m!1236831 () Bool)

(assert (=> bm!65224 m!1236831))

(assert (=> d!144705 m!1236709))

(declare-fun m!1236833 () Bool)

(assert (=> b!1349755 m!1236833))

(assert (=> b!1349745 m!1236697))

(assert (=> b!1349745 m!1236697))

(assert (=> b!1349745 m!1236707))

(declare-fun m!1236835 () Bool)

(assert (=> b!1349751 m!1236835))

(declare-fun m!1236837 () Bool)

(assert (=> bm!65222 m!1236837))

(declare-fun m!1236839 () Bool)

(assert (=> b!1349744 m!1236839))

(declare-fun m!1236841 () Bool)

(assert (=> bm!65228 m!1236841))

(declare-fun m!1236843 () Bool)

(assert (=> b!1349754 m!1236843))

(declare-fun m!1236845 () Bool)

(assert (=> b!1349754 m!1236845))

(declare-fun m!1236847 () Bool)

(assert (=> b!1349754 m!1236847))

(declare-fun m!1236849 () Bool)

(assert (=> b!1349754 m!1236849))

(assert (=> b!1349754 m!1236843))

(declare-fun m!1236851 () Bool)

(assert (=> b!1349754 m!1236851))

(assert (=> b!1349754 m!1236697))

(assert (=> b!1349754 m!1236847))

(declare-fun m!1236853 () Bool)

(assert (=> b!1349754 m!1236853))

(declare-fun m!1236855 () Bool)

(assert (=> b!1349754 m!1236855))

(declare-fun m!1236857 () Bool)

(assert (=> b!1349754 m!1236857))

(declare-fun m!1236859 () Bool)

(assert (=> b!1349754 m!1236859))

(assert (=> b!1349754 m!1236841))

(declare-fun m!1236861 () Bool)

(assert (=> b!1349754 m!1236861))

(assert (=> b!1349754 m!1236853))

(declare-fun m!1236863 () Bool)

(assert (=> b!1349754 m!1236863))

(declare-fun m!1236865 () Bool)

(assert (=> b!1349754 m!1236865))

(declare-fun m!1236867 () Bool)

(assert (=> b!1349754 m!1236867))

(declare-fun m!1236869 () Bool)

(assert (=> b!1349754 m!1236869))

(assert (=> b!1349754 m!1236867))

(declare-fun m!1236871 () Bool)

(assert (=> b!1349754 m!1236871))

(declare-fun m!1236873 () Bool)

(assert (=> b!1349742 m!1236873))

(assert (=> b!1349742 m!1236697))

(declare-fun m!1236875 () Bool)

(assert (=> b!1349742 m!1236875))

(assert (=> b!1349742 m!1236873))

(assert (=> b!1349742 m!1236815))

(declare-fun m!1236877 () Bool)

(assert (=> b!1349742 m!1236877))

(assert (=> b!1349742 m!1236697))

(assert (=> b!1349742 m!1236815))

(assert (=> b!1349743 m!1236697))

(assert (=> b!1349743 m!1236697))

(declare-fun m!1236879 () Bool)

(assert (=> b!1349743 m!1236879))

(assert (=> b!1349607 d!144705))

(declare-fun d!144707 () Bool)

(assert (=> d!144707 (= (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960)) (and (not (= (select (arr!44461 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44461 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349608 d!144707))

(declare-fun bm!65231 () Bool)

(declare-fun call!65234 () Bool)

(declare-fun c!126636 () Bool)

(assert (=> bm!65231 (= call!65234 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126636 (Cons!31486 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) Nil!31487) Nil!31487)))))

(declare-fun b!1349769 () Bool)

(declare-fun e!767824 () Bool)

(declare-fun e!767823 () Bool)

(assert (=> b!1349769 (= e!767824 e!767823)))

(assert (=> b!1349769 (= c!126636 (validKeyInArray!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349770 () Bool)

(declare-fun e!767821 () Bool)

(declare-fun contains!9198 (List!31490 (_ BitVec 64)) Bool)

(assert (=> b!1349770 (= e!767821 (contains!9198 Nil!31487 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun d!144709 () Bool)

(declare-fun res!895426 () Bool)

(declare-fun e!767822 () Bool)

(assert (=> d!144709 (=> res!895426 e!767822)))

(assert (=> d!144709 (= res!895426 (bvsge #b00000000000000000000000000000000 (size!45011 _keys!1571)))))

(assert (=> d!144709 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31487) e!767822)))

(declare-fun b!1349771 () Bool)

(assert (=> b!1349771 (= e!767823 call!65234)))

(declare-fun b!1349772 () Bool)

(assert (=> b!1349772 (= e!767822 e!767824)))

(declare-fun res!895425 () Bool)

(assert (=> b!1349772 (=> (not res!895425) (not e!767824))))

(assert (=> b!1349772 (= res!895425 (not e!767821))))

(declare-fun res!895427 () Bool)

(assert (=> b!1349772 (=> (not res!895427) (not e!767821))))

(assert (=> b!1349772 (= res!895427 (validKeyInArray!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349773 () Bool)

(assert (=> b!1349773 (= e!767823 call!65234)))

(assert (= (and d!144709 (not res!895426)) b!1349772))

(assert (= (and b!1349772 res!895427) b!1349770))

(assert (= (and b!1349772 res!895425) b!1349769))

(assert (= (and b!1349769 c!126636) b!1349771))

(assert (= (and b!1349769 (not c!126636)) b!1349773))

(assert (= (or b!1349771 b!1349773) bm!65231))

(assert (=> bm!65231 m!1236745))

(declare-fun m!1236881 () Bool)

(assert (=> bm!65231 m!1236881))

(assert (=> b!1349769 m!1236745))

(assert (=> b!1349769 m!1236745))

(assert (=> b!1349769 m!1236753))

(assert (=> b!1349770 m!1236745))

(assert (=> b!1349770 m!1236745))

(declare-fun m!1236883 () Bool)

(assert (=> b!1349770 m!1236883))

(assert (=> b!1349772 m!1236745))

(assert (=> b!1349772 m!1236745))

(assert (=> b!1349772 m!1236753))

(assert (=> b!1349611 d!144709))

(declare-fun mapNonEmpty!58116 () Bool)

(declare-fun mapRes!58116 () Bool)

(declare-fun tp!110607 () Bool)

(declare-fun e!767830 () Bool)

(assert (=> mapNonEmpty!58116 (= mapRes!58116 (and tp!110607 e!767830))))

(declare-fun mapKey!58116 () (_ BitVec 32))

(declare-fun mapRest!58116 () (Array (_ BitVec 32) ValueCell!17898))

(declare-fun mapValue!58116 () ValueCell!17898)

(assert (=> mapNonEmpty!58116 (= mapRest!58110 (store mapRest!58116 mapKey!58116 mapValue!58116))))

(declare-fun mapIsEmpty!58116 () Bool)

(assert (=> mapIsEmpty!58116 mapRes!58116))

(declare-fun b!1349781 () Bool)

(declare-fun e!767829 () Bool)

(assert (=> b!1349781 (= e!767829 tp_is_empty!37593)))

(declare-fun b!1349780 () Bool)

(assert (=> b!1349780 (= e!767830 tp_is_empty!37593)))

(declare-fun condMapEmpty!58116 () Bool)

(declare-fun mapDefault!58116 () ValueCell!17898)

(assert (=> mapNonEmpty!58110 (= condMapEmpty!58116 (= mapRest!58110 ((as const (Array (_ BitVec 32) ValueCell!17898)) mapDefault!58116)))))

(assert (=> mapNonEmpty!58110 (= tp!110598 (and e!767829 mapRes!58116))))

(assert (= (and mapNonEmpty!58110 condMapEmpty!58116) mapIsEmpty!58116))

(assert (= (and mapNonEmpty!58110 (not condMapEmpty!58116)) mapNonEmpty!58116))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17898) mapValue!58116)) b!1349780))

(assert (= (and mapNonEmpty!58110 ((_ is ValueCellFull!17898) mapDefault!58116)) b!1349781))

(declare-fun m!1236885 () Bool)

(assert (=> mapNonEmpty!58116 m!1236885))

(declare-fun b_lambda!24723 () Bool)

(assert (= b_lambda!24719 (or (and start!113708 b_free!31593) b_lambda!24723)))

(declare-fun b_lambda!24725 () Bool)

(assert (= b_lambda!24721 (or (and start!113708 b_free!31593) b_lambda!24725)))

(check-sat (not bm!65215) (not b!1349751) (not bm!65222) (not bm!65217) (not d!144695) (not d!144693) tp_is_empty!37593 (not bm!65200) (not bm!65231) (not b!1349770) (not b!1349735) (not mapNonEmpty!58116) (not b!1349716) (not b_next!31593) (not b!1349658) (not b!1349667) (not bm!65224) (not b!1349725) (not d!144705) (not bm!65228) (not b!1349745) (not b!1349743) (not bm!65216) (not b!1349754) (not b!1349737) (not b_lambda!24725) (not b!1349728) (not b!1349718) (not d!144703) (not b!1349729) (not b!1349749) (not bm!65221) (not b!1349742) (not b!1349744) (not b!1349719) (not b!1349669) (not bm!65223) (not b!1349717) (not b!1349769) (not b!1349723) (not b_lambda!24723) b_and!50997 (not b!1349659) (not b!1349772) (not b!1349755))
(check-sat b_and!50997 (not b_next!31593))
(get-model)

(declare-fun d!144711 () Bool)

(declare-fun get!22469 (Option!776) V!55227)

(assert (=> d!144711 (= (apply!1041 (+!4855 lt!596687 (tuple2!24339 lt!596695 minValue!1245)) lt!596677) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596687 (tuple2!24339 lt!596695 minValue!1245))) lt!596677)))))

(declare-fun bs!38686 () Bool)

(assert (= bs!38686 d!144711))

(declare-fun m!1236887 () Bool)

(assert (=> bs!38686 m!1236887))

(assert (=> bs!38686 m!1236887))

(declare-fun m!1236889 () Bool)

(assert (=> bs!38686 m!1236889))

(assert (=> b!1349728 d!144711))

(declare-fun d!144713 () Bool)

(assert (=> d!144713 (= (apply!1041 (+!4855 lt!596680 (tuple2!24339 lt!596679 minValue!1245)) lt!596675) (apply!1041 lt!596680 lt!596675))))

(declare-fun lt!596725 () Unit!44203)

(declare-fun choose!1984 (ListLongMap!21995 (_ BitVec 64) V!55227 (_ BitVec 64)) Unit!44203)

(assert (=> d!144713 (= lt!596725 (choose!1984 lt!596680 lt!596679 minValue!1245 lt!596675))))

(declare-fun e!767833 () Bool)

(assert (=> d!144713 e!767833))

(declare-fun res!895430 () Bool)

(assert (=> d!144713 (=> (not res!895430) (not e!767833))))

(assert (=> d!144713 (= res!895430 (contains!9197 lt!596680 lt!596675))))

(assert (=> d!144713 (= (addApplyDifferent!583 lt!596680 lt!596679 minValue!1245 lt!596675) lt!596725)))

(declare-fun b!1349785 () Bool)

(assert (=> b!1349785 (= e!767833 (not (= lt!596675 lt!596679)))))

(assert (= (and d!144713 res!895430) b!1349785))

(assert (=> d!144713 m!1236783))

(declare-fun m!1236891 () Bool)

(assert (=> d!144713 m!1236891))

(assert (=> d!144713 m!1236791))

(assert (=> d!144713 m!1236793))

(assert (=> d!144713 m!1236791))

(declare-fun m!1236893 () Bool)

(assert (=> d!144713 m!1236893))

(assert (=> b!1349728 d!144713))

(declare-fun d!144715 () Bool)

(assert (=> d!144715 (= (apply!1041 lt!596687 lt!596677) (get!22469 (getValueByKey!724 (toList!11013 lt!596687) lt!596677)))))

(declare-fun bs!38687 () Bool)

(assert (= bs!38687 d!144715))

(declare-fun m!1236895 () Bool)

(assert (=> bs!38687 m!1236895))

(assert (=> bs!38687 m!1236895))

(declare-fun m!1236897 () Bool)

(assert (=> bs!38687 m!1236897))

(assert (=> b!1349728 d!144715))

(declare-fun d!144717 () Bool)

(assert (=> d!144717 (= (apply!1041 (+!4855 lt!596680 (tuple2!24339 lt!596679 minValue!1245)) lt!596675) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596680 (tuple2!24339 lt!596679 minValue!1245))) lt!596675)))))

(declare-fun bs!38688 () Bool)

(assert (= bs!38688 d!144717))

(declare-fun m!1236899 () Bool)

(assert (=> bs!38688 m!1236899))

(assert (=> bs!38688 m!1236899))

(declare-fun m!1236901 () Bool)

(assert (=> bs!38688 m!1236901))

(assert (=> b!1349728 d!144717))

(declare-fun d!144719 () Bool)

(assert (=> d!144719 (= (apply!1041 (+!4855 lt!596687 (tuple2!24339 lt!596695 minValue!1245)) lt!596677) (apply!1041 lt!596687 lt!596677))))

(declare-fun lt!596726 () Unit!44203)

(assert (=> d!144719 (= lt!596726 (choose!1984 lt!596687 lt!596695 minValue!1245 lt!596677))))

(declare-fun e!767834 () Bool)

(assert (=> d!144719 e!767834))

(declare-fun res!895431 () Bool)

(assert (=> d!144719 (=> (not res!895431) (not e!767834))))

(assert (=> d!144719 (= res!895431 (contains!9197 lt!596687 lt!596677))))

(assert (=> d!144719 (= (addApplyDifferent!583 lt!596687 lt!596695 minValue!1245 lt!596677) lt!596726)))

(declare-fun b!1349786 () Bool)

(assert (=> b!1349786 (= e!767834 (not (= lt!596677 lt!596695)))))

(assert (= (and d!144719 res!895431) b!1349786))

(assert (=> d!144719 m!1236803))

(declare-fun m!1236903 () Bool)

(assert (=> d!144719 m!1236903))

(assert (=> d!144719 m!1236781))

(assert (=> d!144719 m!1236789))

(assert (=> d!144719 m!1236781))

(declare-fun m!1236905 () Bool)

(assert (=> d!144719 m!1236905))

(assert (=> b!1349728 d!144719))

(declare-fun d!144721 () Bool)

(assert (=> d!144721 (= (apply!1041 lt!596680 lt!596675) (get!22469 (getValueByKey!724 (toList!11013 lt!596680) lt!596675)))))

(declare-fun bs!38689 () Bool)

(assert (= bs!38689 d!144721))

(declare-fun m!1236907 () Bool)

(assert (=> bs!38689 m!1236907))

(assert (=> bs!38689 m!1236907))

(declare-fun m!1236909 () Bool)

(assert (=> bs!38689 m!1236909))

(assert (=> b!1349728 d!144721))

(declare-fun d!144723 () Bool)

(declare-fun e!767837 () Bool)

(assert (=> d!144723 e!767837))

(declare-fun res!895437 () Bool)

(assert (=> d!144723 (=> (not res!895437) (not e!767837))))

(declare-fun lt!596738 () ListLongMap!21995)

(assert (=> d!144723 (= res!895437 (contains!9197 lt!596738 (_1!12180 (tuple2!24339 lt!596695 minValue!1245))))))

(declare-fun lt!596736 () List!31489)

(assert (=> d!144723 (= lt!596738 (ListLongMap!21996 lt!596736))))

(declare-fun lt!596735 () Unit!44203)

(declare-fun lt!596737 () Unit!44203)

(assert (=> d!144723 (= lt!596735 lt!596737)))

(assert (=> d!144723 (= (getValueByKey!724 lt!596736 (_1!12180 (tuple2!24339 lt!596695 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596695 minValue!1245))))))

(declare-fun lemmaContainsTupThenGetReturnValue!369 (List!31489 (_ BitVec 64) V!55227) Unit!44203)

(assert (=> d!144723 (= lt!596737 (lemmaContainsTupThenGetReturnValue!369 lt!596736 (_1!12180 (tuple2!24339 lt!596695 minValue!1245)) (_2!12180 (tuple2!24339 lt!596695 minValue!1245))))))

(declare-fun insertStrictlySorted!498 (List!31489 (_ BitVec 64) V!55227) List!31489)

(assert (=> d!144723 (= lt!596736 (insertStrictlySorted!498 (toList!11013 lt!596687) (_1!12180 (tuple2!24339 lt!596695 minValue!1245)) (_2!12180 (tuple2!24339 lt!596695 minValue!1245))))))

(assert (=> d!144723 (= (+!4855 lt!596687 (tuple2!24339 lt!596695 minValue!1245)) lt!596738)))

(declare-fun b!1349791 () Bool)

(declare-fun res!895436 () Bool)

(assert (=> b!1349791 (=> (not res!895436) (not e!767837))))

(assert (=> b!1349791 (= res!895436 (= (getValueByKey!724 (toList!11013 lt!596738) (_1!12180 (tuple2!24339 lt!596695 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596695 minValue!1245)))))))

(declare-fun b!1349792 () Bool)

(declare-fun contains!9199 (List!31489 tuple2!24338) Bool)

(assert (=> b!1349792 (= e!767837 (contains!9199 (toList!11013 lt!596738) (tuple2!24339 lt!596695 minValue!1245)))))

(assert (= (and d!144723 res!895437) b!1349791))

(assert (= (and b!1349791 res!895436) b!1349792))

(declare-fun m!1236911 () Bool)

(assert (=> d!144723 m!1236911))

(declare-fun m!1236913 () Bool)

(assert (=> d!144723 m!1236913))

(declare-fun m!1236915 () Bool)

(assert (=> d!144723 m!1236915))

(declare-fun m!1236917 () Bool)

(assert (=> d!144723 m!1236917))

(declare-fun m!1236919 () Bool)

(assert (=> b!1349791 m!1236919))

(declare-fun m!1236921 () Bool)

(assert (=> b!1349792 m!1236921))

(assert (=> b!1349728 d!144723))

(declare-fun d!144725 () Bool)

(declare-fun e!767839 () Bool)

(assert (=> d!144725 e!767839))

(declare-fun res!895438 () Bool)

(assert (=> d!144725 (=> res!895438 e!767839)))

(declare-fun lt!596742 () Bool)

(assert (=> d!144725 (= res!895438 (not lt!596742))))

(declare-fun lt!596739 () Bool)

(assert (=> d!144725 (= lt!596742 lt!596739)))

(declare-fun lt!596740 () Unit!44203)

(declare-fun e!767838 () Unit!44203)

(assert (=> d!144725 (= lt!596740 e!767838)))

(declare-fun c!126637 () Bool)

(assert (=> d!144725 (= c!126637 lt!596739)))

(assert (=> d!144725 (= lt!596739 (containsKey!746 (toList!11013 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245))) lt!596686))))

(assert (=> d!144725 (= (contains!9197 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245)) lt!596686) lt!596742)))

(declare-fun b!1349793 () Bool)

(declare-fun lt!596741 () Unit!44203)

(assert (=> b!1349793 (= e!767838 lt!596741)))

(assert (=> b!1349793 (= lt!596741 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245))) lt!596686))))

(assert (=> b!1349793 (isDefined!531 (getValueByKey!724 (toList!11013 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245))) lt!596686))))

(declare-fun b!1349794 () Bool)

(declare-fun Unit!44209 () Unit!44203)

(assert (=> b!1349794 (= e!767838 Unit!44209)))

(declare-fun b!1349795 () Bool)

(assert (=> b!1349795 (= e!767839 (isDefined!531 (getValueByKey!724 (toList!11013 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245))) lt!596686)))))

(assert (= (and d!144725 c!126637) b!1349793))

(assert (= (and d!144725 (not c!126637)) b!1349794))

(assert (= (and d!144725 (not res!895438)) b!1349795))

(declare-fun m!1236923 () Bool)

(assert (=> d!144725 m!1236923))

(declare-fun m!1236925 () Bool)

(assert (=> b!1349793 m!1236925))

(declare-fun m!1236927 () Bool)

(assert (=> b!1349793 m!1236927))

(assert (=> b!1349793 m!1236927))

(declare-fun m!1236929 () Bool)

(assert (=> b!1349793 m!1236929))

(assert (=> b!1349795 m!1236927))

(assert (=> b!1349795 m!1236927))

(assert (=> b!1349795 m!1236929))

(assert (=> b!1349728 d!144725))

(declare-fun d!144727 () Bool)

(assert (=> d!144727 (contains!9197 (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245)) lt!596686)))

(declare-fun lt!596745 () Unit!44203)

(declare-fun choose!1985 (ListLongMap!21995 (_ BitVec 64) V!55227 (_ BitVec 64)) Unit!44203)

(assert (=> d!144727 (= lt!596745 (choose!1985 lt!596683 lt!596688 zeroValue!1245 lt!596686))))

(assert (=> d!144727 (contains!9197 lt!596683 lt!596686)))

(assert (=> d!144727 (= (addStillContains!1216 lt!596683 lt!596688 zeroValue!1245 lt!596686) lt!596745)))

(declare-fun bs!38690 () Bool)

(assert (= bs!38690 d!144727))

(assert (=> bs!38690 m!1236805))

(assert (=> bs!38690 m!1236805))

(assert (=> bs!38690 m!1236809))

(declare-fun m!1236931 () Bool)

(assert (=> bs!38690 m!1236931))

(declare-fun m!1236933 () Bool)

(assert (=> bs!38690 m!1236933))

(assert (=> b!1349728 d!144727))

(declare-fun d!144729 () Bool)

(assert (=> d!144729 (= (apply!1041 (+!4855 lt!596690 (tuple2!24339 lt!596693 zeroValue!1245)) lt!596692) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596690 (tuple2!24339 lt!596693 zeroValue!1245))) lt!596692)))))

(declare-fun bs!38691 () Bool)

(assert (= bs!38691 d!144729))

(declare-fun m!1236935 () Bool)

(assert (=> bs!38691 m!1236935))

(assert (=> bs!38691 m!1236935))

(declare-fun m!1236937 () Bool)

(assert (=> bs!38691 m!1236937))

(assert (=> b!1349728 d!144729))

(declare-fun d!144731 () Bool)

(declare-fun e!767840 () Bool)

(assert (=> d!144731 e!767840))

(declare-fun res!895440 () Bool)

(assert (=> d!144731 (=> (not res!895440) (not e!767840))))

(declare-fun lt!596749 () ListLongMap!21995)

(assert (=> d!144731 (= res!895440 (contains!9197 lt!596749 (_1!12180 (tuple2!24339 lt!596679 minValue!1245))))))

(declare-fun lt!596747 () List!31489)

(assert (=> d!144731 (= lt!596749 (ListLongMap!21996 lt!596747))))

(declare-fun lt!596746 () Unit!44203)

(declare-fun lt!596748 () Unit!44203)

(assert (=> d!144731 (= lt!596746 lt!596748)))

(assert (=> d!144731 (= (getValueByKey!724 lt!596747 (_1!12180 (tuple2!24339 lt!596679 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596679 minValue!1245))))))

(assert (=> d!144731 (= lt!596748 (lemmaContainsTupThenGetReturnValue!369 lt!596747 (_1!12180 (tuple2!24339 lt!596679 minValue!1245)) (_2!12180 (tuple2!24339 lt!596679 minValue!1245))))))

(assert (=> d!144731 (= lt!596747 (insertStrictlySorted!498 (toList!11013 lt!596680) (_1!12180 (tuple2!24339 lt!596679 minValue!1245)) (_2!12180 (tuple2!24339 lt!596679 minValue!1245))))))

(assert (=> d!144731 (= (+!4855 lt!596680 (tuple2!24339 lt!596679 minValue!1245)) lt!596749)))

(declare-fun b!1349797 () Bool)

(declare-fun res!895439 () Bool)

(assert (=> b!1349797 (=> (not res!895439) (not e!767840))))

(assert (=> b!1349797 (= res!895439 (= (getValueByKey!724 (toList!11013 lt!596749) (_1!12180 (tuple2!24339 lt!596679 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596679 minValue!1245)))))))

(declare-fun b!1349798 () Bool)

(assert (=> b!1349798 (= e!767840 (contains!9199 (toList!11013 lt!596749) (tuple2!24339 lt!596679 minValue!1245)))))

(assert (= (and d!144731 res!895440) b!1349797))

(assert (= (and b!1349797 res!895439) b!1349798))

(declare-fun m!1236939 () Bool)

(assert (=> d!144731 m!1236939))

(declare-fun m!1236941 () Bool)

(assert (=> d!144731 m!1236941))

(declare-fun m!1236943 () Bool)

(assert (=> d!144731 m!1236943))

(declare-fun m!1236945 () Bool)

(assert (=> d!144731 m!1236945))

(declare-fun m!1236947 () Bool)

(assert (=> b!1349797 m!1236947))

(declare-fun m!1236949 () Bool)

(assert (=> b!1349798 m!1236949))

(assert (=> b!1349728 d!144731))

(declare-fun d!144733 () Bool)

(declare-fun e!767841 () Bool)

(assert (=> d!144733 e!767841))

(declare-fun res!895442 () Bool)

(assert (=> d!144733 (=> (not res!895442) (not e!767841))))

(declare-fun lt!596753 () ListLongMap!21995)

(assert (=> d!144733 (= res!895442 (contains!9197 lt!596753 (_1!12180 (tuple2!24339 lt!596693 zeroValue!1245))))))

(declare-fun lt!596751 () List!31489)

(assert (=> d!144733 (= lt!596753 (ListLongMap!21996 lt!596751))))

(declare-fun lt!596750 () Unit!44203)

(declare-fun lt!596752 () Unit!44203)

(assert (=> d!144733 (= lt!596750 lt!596752)))

(assert (=> d!144733 (= (getValueByKey!724 lt!596751 (_1!12180 (tuple2!24339 lt!596693 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596693 zeroValue!1245))))))

(assert (=> d!144733 (= lt!596752 (lemmaContainsTupThenGetReturnValue!369 lt!596751 (_1!12180 (tuple2!24339 lt!596693 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596693 zeroValue!1245))))))

(assert (=> d!144733 (= lt!596751 (insertStrictlySorted!498 (toList!11013 lt!596690) (_1!12180 (tuple2!24339 lt!596693 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596693 zeroValue!1245))))))

(assert (=> d!144733 (= (+!4855 lt!596690 (tuple2!24339 lt!596693 zeroValue!1245)) lt!596753)))

(declare-fun b!1349799 () Bool)

(declare-fun res!895441 () Bool)

(assert (=> b!1349799 (=> (not res!895441) (not e!767841))))

(assert (=> b!1349799 (= res!895441 (= (getValueByKey!724 (toList!11013 lt!596753) (_1!12180 (tuple2!24339 lt!596693 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596693 zeroValue!1245)))))))

(declare-fun b!1349800 () Bool)

(assert (=> b!1349800 (= e!767841 (contains!9199 (toList!11013 lt!596753) (tuple2!24339 lt!596693 zeroValue!1245)))))

(assert (= (and d!144733 res!895442) b!1349799))

(assert (= (and b!1349799 res!895441) b!1349800))

(declare-fun m!1236951 () Bool)

(assert (=> d!144733 m!1236951))

(declare-fun m!1236953 () Bool)

(assert (=> d!144733 m!1236953))

(declare-fun m!1236955 () Bool)

(assert (=> d!144733 m!1236955))

(declare-fun m!1236957 () Bool)

(assert (=> d!144733 m!1236957))

(declare-fun m!1236959 () Bool)

(assert (=> b!1349799 m!1236959))

(declare-fun m!1236961 () Bool)

(assert (=> b!1349800 m!1236961))

(assert (=> b!1349728 d!144733))

(declare-fun d!144735 () Bool)

(assert (=> d!144735 (= (apply!1041 (+!4855 lt!596690 (tuple2!24339 lt!596693 zeroValue!1245)) lt!596692) (apply!1041 lt!596690 lt!596692))))

(declare-fun lt!596754 () Unit!44203)

(assert (=> d!144735 (= lt!596754 (choose!1984 lt!596690 lt!596693 zeroValue!1245 lt!596692))))

(declare-fun e!767842 () Bool)

(assert (=> d!144735 e!767842))

(declare-fun res!895443 () Bool)

(assert (=> d!144735 (=> (not res!895443) (not e!767842))))

(assert (=> d!144735 (= res!895443 (contains!9197 lt!596690 lt!596692))))

(assert (=> d!144735 (= (addApplyDifferent!583 lt!596690 lt!596693 zeroValue!1245 lt!596692) lt!596754)))

(declare-fun b!1349801 () Bool)

(assert (=> b!1349801 (= e!767842 (not (= lt!596692 lt!596693)))))

(assert (= (and d!144735 res!895443) b!1349801))

(assert (=> d!144735 m!1236799))

(declare-fun m!1236963 () Bool)

(assert (=> d!144735 m!1236963))

(assert (=> d!144735 m!1236785))

(assert (=> d!144735 m!1236787))

(assert (=> d!144735 m!1236785))

(declare-fun m!1236965 () Bool)

(assert (=> d!144735 m!1236965))

(assert (=> b!1349728 d!144735))

(declare-fun d!144737 () Bool)

(declare-fun e!767859 () Bool)

(assert (=> d!144737 e!767859))

(declare-fun res!895455 () Bool)

(assert (=> d!144737 (=> (not res!895455) (not e!767859))))

(declare-fun lt!596770 () ListLongMap!21995)

(assert (=> d!144737 (= res!895455 (not (contains!9197 lt!596770 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767863 () ListLongMap!21995)

(assert (=> d!144737 (= lt!596770 e!767863)))

(declare-fun c!126648 () Bool)

(assert (=> d!144737 (= c!126648 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(assert (=> d!144737 (validMask!0 mask!1977)))

(assert (=> d!144737 (= (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596770)))

(declare-fun b!1349826 () Bool)

(declare-fun e!767861 () Bool)

(assert (=> b!1349826 (= e!767861 (= lt!596770 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349827 () Bool)

(declare-fun e!767857 () Bool)

(assert (=> b!1349827 (= e!767857 e!767861)))

(declare-fun c!126649 () Bool)

(assert (=> b!1349827 (= c!126649 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun b!1349828 () Bool)

(declare-fun e!767858 () ListLongMap!21995)

(assert (=> b!1349828 (= e!767863 e!767858)))

(declare-fun c!126646 () Bool)

(assert (=> b!1349828 (= c!126646 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349829 () Bool)

(assert (=> b!1349829 (= e!767859 e!767857)))

(declare-fun c!126647 () Bool)

(declare-fun e!767862 () Bool)

(assert (=> b!1349829 (= c!126647 e!767862)))

(declare-fun res!895454 () Bool)

(assert (=> b!1349829 (=> (not res!895454) (not e!767862))))

(assert (=> b!1349829 (= res!895454 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun b!1349830 () Bool)

(declare-fun isEmpty!1099 (ListLongMap!21995) Bool)

(assert (=> b!1349830 (= e!767861 (isEmpty!1099 lt!596770))))

(declare-fun b!1349831 () Bool)

(declare-fun e!767860 () Bool)

(assert (=> b!1349831 (= e!767857 e!767860)))

(assert (=> b!1349831 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(declare-fun res!895453 () Bool)

(assert (=> b!1349831 (= res!895453 (contains!9197 lt!596770 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349831 (=> (not res!895453) (not e!767860))))

(declare-fun call!65237 () ListLongMap!21995)

(declare-fun bm!65234 () Bool)

(assert (=> bm!65234 (= call!65237 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349832 () Bool)

(assert (=> b!1349832 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45011 _keys!1571)))))

(assert (=> b!1349832 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!45012 _values!1303)))))

(assert (=> b!1349832 (= e!767860 (= (apply!1041 lt!596770 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22468 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349833 () Bool)

(declare-fun res!895452 () Bool)

(assert (=> b!1349833 (=> (not res!895452) (not e!767859))))

(assert (=> b!1349833 (= res!895452 (not (contains!9197 lt!596770 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349834 () Bool)

(assert (=> b!1349834 (= e!767863 (ListLongMap!21996 Nil!31486))))

(declare-fun b!1349835 () Bool)

(assert (=> b!1349835 (= e!767858 call!65237)))

(declare-fun b!1349836 () Bool)

(assert (=> b!1349836 (= e!767862 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349836 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1349837 () Bool)

(declare-fun lt!596769 () Unit!44203)

(declare-fun lt!596771 () Unit!44203)

(assert (=> b!1349837 (= lt!596769 lt!596771)))

(declare-fun lt!596775 () ListLongMap!21995)

(declare-fun lt!596773 () V!55227)

(declare-fun lt!596772 () (_ BitVec 64))

(declare-fun lt!596774 () (_ BitVec 64))

(assert (=> b!1349837 (not (contains!9197 (+!4855 lt!596775 (tuple2!24339 lt!596772 lt!596773)) lt!596774))))

(declare-fun addStillNotContains!505 (ListLongMap!21995 (_ BitVec 64) V!55227 (_ BitVec 64)) Unit!44203)

(assert (=> b!1349837 (= lt!596771 (addStillNotContains!505 lt!596775 lt!596772 lt!596773 lt!596774))))

(assert (=> b!1349837 (= lt!596774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349837 (= lt!596773 (get!22468 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349837 (= lt!596772 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(assert (=> b!1349837 (= lt!596775 call!65237)))

(assert (=> b!1349837 (= e!767858 (+!4855 call!65237 (tuple2!24339 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22468 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144737 c!126648) b!1349834))

(assert (= (and d!144737 (not c!126648)) b!1349828))

(assert (= (and b!1349828 c!126646) b!1349837))

(assert (= (and b!1349828 (not c!126646)) b!1349835))

(assert (= (or b!1349837 b!1349835) bm!65234))

(assert (= (and d!144737 res!895455) b!1349833))

(assert (= (and b!1349833 res!895452) b!1349829))

(assert (= (and b!1349829 res!895454) b!1349836))

(assert (= (and b!1349829 c!126647) b!1349831))

(assert (= (and b!1349829 (not c!126647)) b!1349827))

(assert (= (and b!1349831 res!895453) b!1349832))

(assert (= (and b!1349827 c!126649) b!1349826))

(assert (= (and b!1349827 (not c!126649)) b!1349830))

(declare-fun b_lambda!24727 () Bool)

(assert (=> (not b_lambda!24727) (not b!1349832)))

(assert (=> b!1349832 t!46148))

(declare-fun b_and!50999 () Bool)

(assert (= b_and!50997 (and (=> t!46148 result!26021) b_and!50999)))

(declare-fun b_lambda!24729 () Bool)

(assert (=> (not b_lambda!24729) (not b!1349837)))

(assert (=> b!1349837 t!46148))

(declare-fun b_and!51001 () Bool)

(assert (= b_and!50999 (and (=> t!46148 result!26021) b_and!51001)))

(declare-fun m!1236967 () Bool)

(assert (=> bm!65234 m!1236967))

(declare-fun m!1236969 () Bool)

(assert (=> d!144737 m!1236969))

(assert (=> d!144737 m!1236709))

(assert (=> b!1349828 m!1236763))

(assert (=> b!1349828 m!1236763))

(assert (=> b!1349828 m!1236765))

(assert (=> b!1349836 m!1236763))

(assert (=> b!1349836 m!1236763))

(assert (=> b!1349836 m!1236765))

(assert (=> b!1349831 m!1236763))

(assert (=> b!1349831 m!1236763))

(declare-fun m!1236971 () Bool)

(assert (=> b!1349831 m!1236971))

(assert (=> b!1349832 m!1236763))

(declare-fun m!1236973 () Bool)

(assert (=> b!1349832 m!1236973))

(assert (=> b!1349832 m!1236811))

(assert (=> b!1349832 m!1236763))

(assert (=> b!1349832 m!1236815))

(assert (=> b!1349832 m!1236811))

(assert (=> b!1349832 m!1236815))

(assert (=> b!1349832 m!1236817))

(assert (=> b!1349826 m!1236967))

(declare-fun m!1236975 () Bool)

(assert (=> b!1349837 m!1236975))

(assert (=> b!1349837 m!1236811))

(declare-fun m!1236977 () Bool)

(assert (=> b!1349837 m!1236977))

(declare-fun m!1236979 () Bool)

(assert (=> b!1349837 m!1236979))

(declare-fun m!1236981 () Bool)

(assert (=> b!1349837 m!1236981))

(assert (=> b!1349837 m!1236815))

(assert (=> b!1349837 m!1236811))

(assert (=> b!1349837 m!1236815))

(assert (=> b!1349837 m!1236817))

(assert (=> b!1349837 m!1236979))

(assert (=> b!1349837 m!1236763))

(declare-fun m!1236983 () Bool)

(assert (=> b!1349830 m!1236983))

(declare-fun m!1236985 () Bool)

(assert (=> b!1349833 m!1236985))

(assert (=> b!1349728 d!144737))

(declare-fun d!144739 () Bool)

(assert (=> d!144739 (= (apply!1041 lt!596690 lt!596692) (get!22469 (getValueByKey!724 (toList!11013 lt!596690) lt!596692)))))

(declare-fun bs!38692 () Bool)

(assert (= bs!38692 d!144739))

(declare-fun m!1236987 () Bool)

(assert (=> bs!38692 m!1236987))

(assert (=> bs!38692 m!1236987))

(declare-fun m!1236989 () Bool)

(assert (=> bs!38692 m!1236989))

(assert (=> b!1349728 d!144739))

(declare-fun d!144741 () Bool)

(declare-fun e!767864 () Bool)

(assert (=> d!144741 e!767864))

(declare-fun res!895457 () Bool)

(assert (=> d!144741 (=> (not res!895457) (not e!767864))))

(declare-fun lt!596779 () ListLongMap!21995)

(assert (=> d!144741 (= res!895457 (contains!9197 lt!596779 (_1!12180 (tuple2!24339 lt!596688 zeroValue!1245))))))

(declare-fun lt!596777 () List!31489)

(assert (=> d!144741 (= lt!596779 (ListLongMap!21996 lt!596777))))

(declare-fun lt!596776 () Unit!44203)

(declare-fun lt!596778 () Unit!44203)

(assert (=> d!144741 (= lt!596776 lt!596778)))

(assert (=> d!144741 (= (getValueByKey!724 lt!596777 (_1!12180 (tuple2!24339 lt!596688 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596688 zeroValue!1245))))))

(assert (=> d!144741 (= lt!596778 (lemmaContainsTupThenGetReturnValue!369 lt!596777 (_1!12180 (tuple2!24339 lt!596688 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596688 zeroValue!1245))))))

(assert (=> d!144741 (= lt!596777 (insertStrictlySorted!498 (toList!11013 lt!596683) (_1!12180 (tuple2!24339 lt!596688 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596688 zeroValue!1245))))))

(assert (=> d!144741 (= (+!4855 lt!596683 (tuple2!24339 lt!596688 zeroValue!1245)) lt!596779)))

(declare-fun b!1349838 () Bool)

(declare-fun res!895456 () Bool)

(assert (=> b!1349838 (=> (not res!895456) (not e!767864))))

(assert (=> b!1349838 (= res!895456 (= (getValueByKey!724 (toList!11013 lt!596779) (_1!12180 (tuple2!24339 lt!596688 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596688 zeroValue!1245)))))))

(declare-fun b!1349839 () Bool)

(assert (=> b!1349839 (= e!767864 (contains!9199 (toList!11013 lt!596779) (tuple2!24339 lt!596688 zeroValue!1245)))))

(assert (= (and d!144741 res!895457) b!1349838))

(assert (= (and b!1349838 res!895456) b!1349839))

(declare-fun m!1236991 () Bool)

(assert (=> d!144741 m!1236991))

(declare-fun m!1236993 () Bool)

(assert (=> d!144741 m!1236993))

(declare-fun m!1236995 () Bool)

(assert (=> d!144741 m!1236995))

(declare-fun m!1236997 () Bool)

(assert (=> d!144741 m!1236997))

(declare-fun m!1236999 () Bool)

(assert (=> b!1349838 m!1236999))

(declare-fun m!1237001 () Bool)

(assert (=> b!1349839 m!1237001))

(assert (=> b!1349728 d!144741))

(declare-fun d!144743 () Bool)

(assert (=> d!144743 (= (validKeyInArray!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349659 d!144743))

(declare-fun d!144745 () Bool)

(assert (=> d!144745 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596782 () Unit!44203)

(declare-fun choose!1986 (List!31489 (_ BitVec 64)) Unit!44203)

(assert (=> d!144745 (= lt!596782 (choose!1986 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!767867 () Bool)

(assert (=> d!144745 e!767867))

(declare-fun res!895460 () Bool)

(assert (=> d!144745 (=> (not res!895460) (not e!767867))))

(declare-fun isStrictlySorted!883 (List!31489) Bool)

(assert (=> d!144745 (= res!895460 (isStrictlySorted!883 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144745 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596782)))

(declare-fun b!1349842 () Bool)

(assert (=> b!1349842 (= e!767867 (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144745 res!895460) b!1349842))

(assert (=> d!144745 m!1236825))

(assert (=> d!144745 m!1236825))

(assert (=> d!144745 m!1236827))

(declare-fun m!1237003 () Bool)

(assert (=> d!144745 m!1237003))

(declare-fun m!1237005 () Bool)

(assert (=> d!144745 m!1237005))

(assert (=> b!1349842 m!1236821))

(assert (=> b!1349735 d!144745))

(declare-fun d!144747 () Bool)

(declare-fun isEmpty!1100 (Option!776) Bool)

(assert (=> d!144747 (= (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1100 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38693 () Bool)

(assert (= bs!38693 d!144747))

(assert (=> bs!38693 m!1236825))

(declare-fun m!1237007 () Bool)

(assert (=> bs!38693 m!1237007))

(assert (=> b!1349735 d!144747))

(declare-fun b!1349851 () Bool)

(declare-fun e!767872 () Option!776)

(assert (=> b!1349851 (= e!767872 (Some!775 (_2!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1349854 () Bool)

(declare-fun e!767873 () Option!776)

(assert (=> b!1349854 (= e!767873 None!774)))

(declare-fun b!1349853 () Bool)

(assert (=> b!1349853 (= e!767873 (getValueByKey!724 (t!46145 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(declare-fun b!1349852 () Bool)

(assert (=> b!1349852 (= e!767872 e!767873)))

(declare-fun c!126655 () Bool)

(assert (=> b!1349852 (= c!126655 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun d!144749 () Bool)

(declare-fun c!126654 () Bool)

(assert (=> d!144749 (= c!126654 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144749 (= (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767872)))

(assert (= (and d!144749 c!126654) b!1349851))

(assert (= (and d!144749 (not c!126654)) b!1349852))

(assert (= (and b!1349852 c!126655) b!1349853))

(assert (= (and b!1349852 (not c!126655)) b!1349854))

(declare-fun m!1237009 () Bool)

(assert (=> b!1349853 m!1237009))

(assert (=> b!1349735 d!144749))

(assert (=> d!144695 d!144697))

(declare-fun d!144751 () Bool)

(assert (=> d!144751 (= (apply!1041 lt!596691 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!724 (toList!11013 lt!596691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38694 () Bool)

(assert (= bs!38694 d!144751))

(declare-fun m!1237011 () Bool)

(assert (=> bs!38694 m!1237011))

(assert (=> bs!38694 m!1237011))

(declare-fun m!1237013 () Bool)

(assert (=> bs!38694 m!1237013))

(assert (=> b!1349725 d!144751))

(assert (=> b!1349749 d!144707))

(declare-fun d!144753 () Bool)

(assert (=> d!144753 (arrayContainsKey!0 _keys!1571 lt!596616 #b00000000000000000000000000000000)))

(declare-fun lt!596785 () Unit!44203)

(declare-fun choose!13 (array!92018 (_ BitVec 64) (_ BitVec 32)) Unit!44203)

(assert (=> d!144753 (= lt!596785 (choose!13 _keys!1571 lt!596616 #b00000000000000000000000000000000))))

(assert (=> d!144753 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144753 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596616 #b00000000000000000000000000000000) lt!596785)))

(declare-fun bs!38695 () Bool)

(assert (= bs!38695 d!144753))

(assert (=> bs!38695 m!1236749))

(declare-fun m!1237015 () Bool)

(assert (=> bs!38695 m!1237015))

(assert (=> b!1349658 d!144753))

(declare-fun d!144755 () Bool)

(declare-fun res!895465 () Bool)

(declare-fun e!767878 () Bool)

(assert (=> d!144755 (=> res!895465 e!767878)))

(assert (=> d!144755 (= res!895465 (= (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) lt!596616))))

(assert (=> d!144755 (= (arrayContainsKey!0 _keys!1571 lt!596616 #b00000000000000000000000000000000) e!767878)))

(declare-fun b!1349859 () Bool)

(declare-fun e!767879 () Bool)

(assert (=> b!1349859 (= e!767878 e!767879)))

(declare-fun res!895466 () Bool)

(assert (=> b!1349859 (=> (not res!895466) (not e!767879))))

(assert (=> b!1349859 (= res!895466 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45011 _keys!1571)))))

(declare-fun b!1349860 () Bool)

(assert (=> b!1349860 (= e!767879 (arrayContainsKey!0 _keys!1571 lt!596616 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144755 (not res!895465)) b!1349859))

(assert (= (and b!1349859 res!895466) b!1349860))

(assert (=> d!144755 m!1236745))

(declare-fun m!1237017 () Bool)

(assert (=> b!1349860 m!1237017))

(assert (=> b!1349658 d!144755))

(declare-fun b!1349873 () Bool)

(declare-fun e!767886 () SeekEntryResult!10060)

(declare-fun e!767888 () SeekEntryResult!10060)

(assert (=> b!1349873 (= e!767886 e!767888)))

(declare-fun lt!596794 () (_ BitVec 64))

(declare-fun lt!596793 () SeekEntryResult!10060)

(assert (=> b!1349873 (= lt!596794 (select (arr!44461 _keys!1571) (index!42613 lt!596793)))))

(declare-fun c!126662 () Bool)

(assert (=> b!1349873 (= c!126662 (= lt!596794 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349874 () Bool)

(assert (=> b!1349874 (= e!767888 (Found!10060 (index!42613 lt!596793)))))

(declare-fun b!1349875 () Bool)

(assert (=> b!1349875 (= e!767886 Undefined!10060)))

(declare-fun d!144757 () Bool)

(declare-fun lt!596792 () SeekEntryResult!10060)

(assert (=> d!144757 (and (or ((_ is Undefined!10060) lt!596792) (not ((_ is Found!10060) lt!596792)) (and (bvsge (index!42612 lt!596792) #b00000000000000000000000000000000) (bvslt (index!42612 lt!596792) (size!45011 _keys!1571)))) (or ((_ is Undefined!10060) lt!596792) ((_ is Found!10060) lt!596792) (not ((_ is MissingZero!10060) lt!596792)) (and (bvsge (index!42611 lt!596792) #b00000000000000000000000000000000) (bvslt (index!42611 lt!596792) (size!45011 _keys!1571)))) (or ((_ is Undefined!10060) lt!596792) ((_ is Found!10060) lt!596792) ((_ is MissingZero!10060) lt!596792) (not ((_ is MissingVacant!10060) lt!596792)) (and (bvsge (index!42614 lt!596792) #b00000000000000000000000000000000) (bvslt (index!42614 lt!596792) (size!45011 _keys!1571)))) (or ((_ is Undefined!10060) lt!596792) (ite ((_ is Found!10060) lt!596792) (= (select (arr!44461 _keys!1571) (index!42612 lt!596792)) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10060) lt!596792) (= (select (arr!44461 _keys!1571) (index!42611 lt!596792)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10060) lt!596792) (= (select (arr!44461 _keys!1571) (index!42614 lt!596792)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144757 (= lt!596792 e!767886)))

(declare-fun c!126663 () Bool)

(assert (=> d!144757 (= c!126663 (and ((_ is Intermediate!10060) lt!596793) (undefined!10872 lt!596793)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92018 (_ BitVec 32)) SeekEntryResult!10060)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144757 (= lt!596793 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144757 (validMask!0 mask!1977)))

(assert (=> d!144757 (= (seekEntryOrOpen!0 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596792)))

(declare-fun b!1349876 () Bool)

(declare-fun e!767887 () SeekEntryResult!10060)

(assert (=> b!1349876 (= e!767887 (MissingZero!10060 (index!42613 lt!596793)))))

(declare-fun b!1349877 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!92018 (_ BitVec 32)) SeekEntryResult!10060)

(assert (=> b!1349877 (= e!767887 (seekKeyOrZeroReturnVacant!0 (x!120779 lt!596793) (index!42613 lt!596793) (index!42613 lt!596793) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(declare-fun b!1349878 () Bool)

(declare-fun c!126664 () Bool)

(assert (=> b!1349878 (= c!126664 (= lt!596794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349878 (= e!767888 e!767887)))

(assert (= (and d!144757 c!126663) b!1349875))

(assert (= (and d!144757 (not c!126663)) b!1349873))

(assert (= (and b!1349873 c!126662) b!1349874))

(assert (= (and b!1349873 (not c!126662)) b!1349878))

(assert (= (and b!1349878 c!126664) b!1349876))

(assert (= (and b!1349878 (not c!126664)) b!1349877))

(declare-fun m!1237019 () Bool)

(assert (=> b!1349873 m!1237019))

(assert (=> d!144757 m!1236709))

(declare-fun m!1237021 () Bool)

(assert (=> d!144757 m!1237021))

(declare-fun m!1237023 () Bool)

(assert (=> d!144757 m!1237023))

(assert (=> d!144757 m!1236745))

(declare-fun m!1237025 () Bool)

(assert (=> d!144757 m!1237025))

(declare-fun m!1237027 () Bool)

(assert (=> d!144757 m!1237027))

(declare-fun m!1237029 () Bool)

(assert (=> d!144757 m!1237029))

(assert (=> d!144757 m!1236745))

(assert (=> d!144757 m!1237023))

(assert (=> b!1349877 m!1236745))

(declare-fun m!1237031 () Bool)

(assert (=> b!1349877 m!1237031))

(assert (=> b!1349658 d!144757))

(declare-fun d!144759 () Bool)

(declare-fun e!767890 () Bool)

(assert (=> d!144759 e!767890))

(declare-fun res!895467 () Bool)

(assert (=> d!144759 (=> res!895467 e!767890)))

(declare-fun lt!596798 () Bool)

(assert (=> d!144759 (= res!895467 (not lt!596798))))

(declare-fun lt!596795 () Bool)

(assert (=> d!144759 (= lt!596798 lt!596795)))

(declare-fun lt!596796 () Unit!44203)

(declare-fun e!767889 () Unit!44203)

(assert (=> d!144759 (= lt!596796 e!767889)))

(declare-fun c!126665 () Bool)

(assert (=> d!144759 (= c!126665 lt!596795)))

(assert (=> d!144759 (= lt!596795 (containsKey!746 (toList!11013 lt!596717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144759 (= (contains!9197 lt!596717 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596798)))

(declare-fun b!1349879 () Bool)

(declare-fun lt!596797 () Unit!44203)

(assert (=> b!1349879 (= e!767889 lt!596797)))

(assert (=> b!1349879 (= lt!596797 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349879 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349880 () Bool)

(declare-fun Unit!44210 () Unit!44203)

(assert (=> b!1349880 (= e!767889 Unit!44210)))

(declare-fun b!1349881 () Bool)

(assert (=> b!1349881 (= e!767890 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144759 c!126665) b!1349879))

(assert (= (and d!144759 (not c!126665)) b!1349880))

(assert (= (and d!144759 (not res!895467)) b!1349881))

(declare-fun m!1237033 () Bool)

(assert (=> d!144759 m!1237033))

(declare-fun m!1237035 () Bool)

(assert (=> b!1349879 m!1237035))

(declare-fun m!1237037 () Bool)

(assert (=> b!1349879 m!1237037))

(assert (=> b!1349879 m!1237037))

(declare-fun m!1237039 () Bool)

(assert (=> b!1349879 m!1237039))

(assert (=> b!1349881 m!1237037))

(assert (=> b!1349881 m!1237037))

(assert (=> b!1349881 m!1237039))

(assert (=> bm!65224 d!144759))

(declare-fun bm!65235 () Bool)

(declare-fun call!65238 () Bool)

(assert (=> bm!65235 (= call!65238 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun d!144761 () Bool)

(declare-fun res!895469 () Bool)

(declare-fun e!767893 () Bool)

(assert (=> d!144761 (=> res!895469 e!767893)))

(assert (=> d!144761 (= res!895469 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45011 _keys!1571)))))

(assert (=> d!144761 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!767893)))

(declare-fun b!1349882 () Bool)

(declare-fun e!767891 () Bool)

(assert (=> b!1349882 (= e!767891 call!65238)))

(declare-fun b!1349883 () Bool)

(declare-fun e!767892 () Bool)

(assert (=> b!1349883 (= e!767892 e!767891)))

(declare-fun lt!596799 () (_ BitVec 64))

(assert (=> b!1349883 (= lt!596799 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596800 () Unit!44203)

(assert (=> b!1349883 (= lt!596800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596799 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1349883 (arrayContainsKey!0 _keys!1571 lt!596799 #b00000000000000000000000000000000)))

(declare-fun lt!596801 () Unit!44203)

(assert (=> b!1349883 (= lt!596801 lt!596800)))

(declare-fun res!895468 () Bool)

(assert (=> b!1349883 (= res!895468 (= (seekEntryOrOpen!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10060 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1349883 (=> (not res!895468) (not e!767891))))

(declare-fun b!1349884 () Bool)

(assert (=> b!1349884 (= e!767893 e!767892)))

(declare-fun c!126666 () Bool)

(assert (=> b!1349884 (= c!126666 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349885 () Bool)

(assert (=> b!1349885 (= e!767892 call!65238)))

(assert (= (and d!144761 (not res!895469)) b!1349884))

(assert (= (and b!1349884 c!126666) b!1349883))

(assert (= (and b!1349884 (not c!126666)) b!1349885))

(assert (= (and b!1349883 res!895468) b!1349882))

(assert (= (or b!1349882 b!1349885) bm!65235))

(declare-fun m!1237041 () Bool)

(assert (=> bm!65235 m!1237041))

(declare-fun m!1237043 () Bool)

(assert (=> b!1349883 m!1237043))

(declare-fun m!1237045 () Bool)

(assert (=> b!1349883 m!1237045))

(declare-fun m!1237047 () Bool)

(assert (=> b!1349883 m!1237047))

(assert (=> b!1349883 m!1237043))

(declare-fun m!1237049 () Bool)

(assert (=> b!1349883 m!1237049))

(assert (=> b!1349884 m!1237043))

(assert (=> b!1349884 m!1237043))

(declare-fun m!1237051 () Bool)

(assert (=> b!1349884 m!1237051))

(assert (=> bm!65200 d!144761))

(declare-fun d!144763 () Bool)

(declare-fun e!767894 () Bool)

(assert (=> d!144763 e!767894))

(declare-fun res!895471 () Bool)

(assert (=> d!144763 (=> (not res!895471) (not e!767894))))

(declare-fun lt!596805 () ListLongMap!21995)

(assert (=> d!144763 (= res!895471 (contains!9197 lt!596805 (_1!12180 (tuple2!24339 lt!596721 minValue!1245))))))

(declare-fun lt!596803 () List!31489)

(assert (=> d!144763 (= lt!596805 (ListLongMap!21996 lt!596803))))

(declare-fun lt!596802 () Unit!44203)

(declare-fun lt!596804 () Unit!44203)

(assert (=> d!144763 (= lt!596802 lt!596804)))

(assert (=> d!144763 (= (getValueByKey!724 lt!596803 (_1!12180 (tuple2!24339 lt!596721 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596721 minValue!1245))))))

(assert (=> d!144763 (= lt!596804 (lemmaContainsTupThenGetReturnValue!369 lt!596803 (_1!12180 (tuple2!24339 lt!596721 minValue!1245)) (_2!12180 (tuple2!24339 lt!596721 minValue!1245))))))

(assert (=> d!144763 (= lt!596803 (insertStrictlySorted!498 (toList!11013 lt!596713) (_1!12180 (tuple2!24339 lt!596721 minValue!1245)) (_2!12180 (tuple2!24339 lt!596721 minValue!1245))))))

(assert (=> d!144763 (= (+!4855 lt!596713 (tuple2!24339 lt!596721 minValue!1245)) lt!596805)))

(declare-fun b!1349886 () Bool)

(declare-fun res!895470 () Bool)

(assert (=> b!1349886 (=> (not res!895470) (not e!767894))))

(assert (=> b!1349886 (= res!895470 (= (getValueByKey!724 (toList!11013 lt!596805) (_1!12180 (tuple2!24339 lt!596721 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596721 minValue!1245)))))))

(declare-fun b!1349887 () Bool)

(assert (=> b!1349887 (= e!767894 (contains!9199 (toList!11013 lt!596805) (tuple2!24339 lt!596721 minValue!1245)))))

(assert (= (and d!144763 res!895471) b!1349886))

(assert (= (and b!1349886 res!895470) b!1349887))

(declare-fun m!1237053 () Bool)

(assert (=> d!144763 m!1237053))

(declare-fun m!1237055 () Bool)

(assert (=> d!144763 m!1237055))

(declare-fun m!1237057 () Bool)

(assert (=> d!144763 m!1237057))

(declare-fun m!1237059 () Bool)

(assert (=> d!144763 m!1237059))

(declare-fun m!1237061 () Bool)

(assert (=> b!1349886 m!1237061))

(declare-fun m!1237063 () Bool)

(assert (=> b!1349887 m!1237063))

(assert (=> b!1349754 d!144763))

(declare-fun d!144765 () Bool)

(assert (=> d!144765 (= (apply!1041 lt!596713 lt!596703) (get!22469 (getValueByKey!724 (toList!11013 lt!596713) lt!596703)))))

(declare-fun bs!38696 () Bool)

(assert (= bs!38696 d!144765))

(declare-fun m!1237065 () Bool)

(assert (=> bs!38696 m!1237065))

(assert (=> bs!38696 m!1237065))

(declare-fun m!1237067 () Bool)

(assert (=> bs!38696 m!1237067))

(assert (=> b!1349754 d!144765))

(declare-fun d!144767 () Bool)

(assert (=> d!144767 (= (apply!1041 lt!596716 lt!596718) (get!22469 (getValueByKey!724 (toList!11013 lt!596716) lt!596718)))))

(declare-fun bs!38697 () Bool)

(assert (= bs!38697 d!144767))

(declare-fun m!1237069 () Bool)

(assert (=> bs!38697 m!1237069))

(assert (=> bs!38697 m!1237069))

(declare-fun m!1237071 () Bool)

(assert (=> bs!38697 m!1237071))

(assert (=> b!1349754 d!144767))

(declare-fun d!144769 () Bool)

(assert (=> d!144769 (= (apply!1041 lt!596706 lt!596701) (get!22469 (getValueByKey!724 (toList!11013 lt!596706) lt!596701)))))

(declare-fun bs!38698 () Bool)

(assert (= bs!38698 d!144769))

(declare-fun m!1237073 () Bool)

(assert (=> bs!38698 m!1237073))

(assert (=> bs!38698 m!1237073))

(declare-fun m!1237075 () Bool)

(assert (=> bs!38698 m!1237075))

(assert (=> b!1349754 d!144769))

(declare-fun d!144771 () Bool)

(assert (=> d!144771 (= (apply!1041 (+!4855 lt!596713 (tuple2!24339 lt!596721 minValue!1245)) lt!596703) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596713 (tuple2!24339 lt!596721 minValue!1245))) lt!596703)))))

(declare-fun bs!38699 () Bool)

(assert (= bs!38699 d!144771))

(declare-fun m!1237077 () Bool)

(assert (=> bs!38699 m!1237077))

(assert (=> bs!38699 m!1237077))

(declare-fun m!1237079 () Bool)

(assert (=> bs!38699 m!1237079))

(assert (=> b!1349754 d!144771))

(declare-fun d!144773 () Bool)

(declare-fun e!767895 () Bool)

(assert (=> d!144773 e!767895))

(declare-fun res!895473 () Bool)

(assert (=> d!144773 (=> (not res!895473) (not e!767895))))

(declare-fun lt!596809 () ListLongMap!21995)

(assert (=> d!144773 (= res!895473 (contains!9197 lt!596809 (_1!12180 (tuple2!24339 lt!596705 minValue!1245))))))

(declare-fun lt!596807 () List!31489)

(assert (=> d!144773 (= lt!596809 (ListLongMap!21996 lt!596807))))

(declare-fun lt!596806 () Unit!44203)

(declare-fun lt!596808 () Unit!44203)

(assert (=> d!144773 (= lt!596806 lt!596808)))

(assert (=> d!144773 (= (getValueByKey!724 lt!596807 (_1!12180 (tuple2!24339 lt!596705 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596705 minValue!1245))))))

(assert (=> d!144773 (= lt!596808 (lemmaContainsTupThenGetReturnValue!369 lt!596807 (_1!12180 (tuple2!24339 lt!596705 minValue!1245)) (_2!12180 (tuple2!24339 lt!596705 minValue!1245))))))

(assert (=> d!144773 (= lt!596807 (insertStrictlySorted!498 (toList!11013 lt!596706) (_1!12180 (tuple2!24339 lt!596705 minValue!1245)) (_2!12180 (tuple2!24339 lt!596705 minValue!1245))))))

(assert (=> d!144773 (= (+!4855 lt!596706 (tuple2!24339 lt!596705 minValue!1245)) lt!596809)))

(declare-fun b!1349888 () Bool)

(declare-fun res!895472 () Bool)

(assert (=> b!1349888 (=> (not res!895472) (not e!767895))))

(assert (=> b!1349888 (= res!895472 (= (getValueByKey!724 (toList!11013 lt!596809) (_1!12180 (tuple2!24339 lt!596705 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596705 minValue!1245)))))))

(declare-fun b!1349889 () Bool)

(assert (=> b!1349889 (= e!767895 (contains!9199 (toList!11013 lt!596809) (tuple2!24339 lt!596705 minValue!1245)))))

(assert (= (and d!144773 res!895473) b!1349888))

(assert (= (and b!1349888 res!895472) b!1349889))

(declare-fun m!1237081 () Bool)

(assert (=> d!144773 m!1237081))

(declare-fun m!1237083 () Bool)

(assert (=> d!144773 m!1237083))

(declare-fun m!1237085 () Bool)

(assert (=> d!144773 m!1237085))

(declare-fun m!1237087 () Bool)

(assert (=> d!144773 m!1237087))

(declare-fun m!1237089 () Bool)

(assert (=> b!1349888 m!1237089))

(declare-fun m!1237091 () Bool)

(assert (=> b!1349889 m!1237091))

(assert (=> b!1349754 d!144773))

(declare-fun d!144775 () Bool)

(declare-fun e!767898 () Bool)

(assert (=> d!144775 e!767898))

(declare-fun res!895477 () Bool)

(assert (=> d!144775 (=> (not res!895477) (not e!767898))))

(declare-fun lt!596811 () ListLongMap!21995)

(assert (=> d!144775 (= res!895477 (not (contains!9197 lt!596811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767902 () ListLongMap!21995)

(assert (=> d!144775 (= lt!596811 e!767902)))

(declare-fun c!126669 () Bool)

(assert (=> d!144775 (= c!126669 (bvsge from!1960 (size!45011 _keys!1571)))))

(assert (=> d!144775 (validMask!0 mask!1977)))

(assert (=> d!144775 (= (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596811)))

(declare-fun b!1349890 () Bool)

(declare-fun e!767900 () Bool)

(assert (=> b!1349890 (= e!767900 (= lt!596811 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1349891 () Bool)

(declare-fun e!767896 () Bool)

(assert (=> b!1349891 (= e!767896 e!767900)))

(declare-fun c!126670 () Bool)

(assert (=> b!1349891 (= c!126670 (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun b!1349892 () Bool)

(declare-fun e!767897 () ListLongMap!21995)

(assert (=> b!1349892 (= e!767902 e!767897)))

(declare-fun c!126667 () Bool)

(assert (=> b!1349892 (= c!126667 (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960)))))

(declare-fun b!1349893 () Bool)

(assert (=> b!1349893 (= e!767898 e!767896)))

(declare-fun c!126668 () Bool)

(declare-fun e!767901 () Bool)

(assert (=> b!1349893 (= c!126668 e!767901)))

(declare-fun res!895476 () Bool)

(assert (=> b!1349893 (=> (not res!895476) (not e!767901))))

(assert (=> b!1349893 (= res!895476 (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun b!1349894 () Bool)

(assert (=> b!1349894 (= e!767900 (isEmpty!1099 lt!596811))))

(declare-fun b!1349895 () Bool)

(declare-fun e!767899 () Bool)

(assert (=> b!1349895 (= e!767896 e!767899)))

(assert (=> b!1349895 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)))))

(declare-fun res!895475 () Bool)

(assert (=> b!1349895 (= res!895475 (contains!9197 lt!596811 (select (arr!44461 _keys!1571) from!1960)))))

(assert (=> b!1349895 (=> (not res!895475) (not e!767899))))

(declare-fun call!65239 () ListLongMap!21995)

(declare-fun bm!65236 () Bool)

(assert (=> bm!65236 (= call!65239 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1349896 () Bool)

(assert (=> b!1349896 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45011 _keys!1571)))))

(assert (=> b!1349896 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45012 _values!1303)))))

(assert (=> b!1349896 (= e!767899 (= (apply!1041 lt!596811 (select (arr!44461 _keys!1571) from!1960)) (get!22468 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349897 () Bool)

(declare-fun res!895474 () Bool)

(assert (=> b!1349897 (=> (not res!895474) (not e!767898))))

(assert (=> b!1349897 (= res!895474 (not (contains!9197 lt!596811 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349898 () Bool)

(assert (=> b!1349898 (= e!767902 (ListLongMap!21996 Nil!31486))))

(declare-fun b!1349899 () Bool)

(assert (=> b!1349899 (= e!767897 call!65239)))

(declare-fun b!1349900 () Bool)

(assert (=> b!1349900 (= e!767901 (validKeyInArray!0 (select (arr!44461 _keys!1571) from!1960)))))

(assert (=> b!1349900 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1349901 () Bool)

(declare-fun lt!596810 () Unit!44203)

(declare-fun lt!596812 () Unit!44203)

(assert (=> b!1349901 (= lt!596810 lt!596812)))

(declare-fun lt!596813 () (_ BitVec 64))

(declare-fun lt!596814 () V!55227)

(declare-fun lt!596815 () (_ BitVec 64))

(declare-fun lt!596816 () ListLongMap!21995)

(assert (=> b!1349901 (not (contains!9197 (+!4855 lt!596816 (tuple2!24339 lt!596813 lt!596814)) lt!596815))))

(assert (=> b!1349901 (= lt!596812 (addStillNotContains!505 lt!596816 lt!596813 lt!596814 lt!596815))))

(assert (=> b!1349901 (= lt!596815 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1349901 (= lt!596814 (get!22468 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1349901 (= lt!596813 (select (arr!44461 _keys!1571) from!1960))))

(assert (=> b!1349901 (= lt!596816 call!65239)))

(assert (=> b!1349901 (= e!767897 (+!4855 call!65239 (tuple2!24339 (select (arr!44461 _keys!1571) from!1960) (get!22468 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144775 c!126669) b!1349898))

(assert (= (and d!144775 (not c!126669)) b!1349892))

(assert (= (and b!1349892 c!126667) b!1349901))

(assert (= (and b!1349892 (not c!126667)) b!1349899))

(assert (= (or b!1349901 b!1349899) bm!65236))

(assert (= (and d!144775 res!895477) b!1349897))

(assert (= (and b!1349897 res!895474) b!1349893))

(assert (= (and b!1349893 res!895476) b!1349900))

(assert (= (and b!1349893 c!126668) b!1349895))

(assert (= (and b!1349893 (not c!126668)) b!1349891))

(assert (= (and b!1349895 res!895475) b!1349896))

(assert (= (and b!1349891 c!126670) b!1349890))

(assert (= (and b!1349891 (not c!126670)) b!1349894))

(declare-fun b_lambda!24731 () Bool)

(assert (=> (not b_lambda!24731) (not b!1349896)))

(assert (=> b!1349896 t!46148))

(declare-fun b_and!51003 () Bool)

(assert (= b_and!51001 (and (=> t!46148 result!26021) b_and!51003)))

(declare-fun b_lambda!24733 () Bool)

(assert (=> (not b_lambda!24733) (not b!1349901)))

(assert (=> b!1349901 t!46148))

(declare-fun b_and!51005 () Bool)

(assert (= b_and!51003 (and (=> t!46148 result!26021) b_and!51005)))

(declare-fun m!1237093 () Bool)

(assert (=> bm!65236 m!1237093))

(declare-fun m!1237095 () Bool)

(assert (=> d!144775 m!1237095))

(assert (=> d!144775 m!1236709))

(assert (=> b!1349892 m!1236697))

(assert (=> b!1349892 m!1236697))

(assert (=> b!1349892 m!1236707))

(assert (=> b!1349900 m!1236697))

(assert (=> b!1349900 m!1236697))

(assert (=> b!1349900 m!1236707))

(assert (=> b!1349895 m!1236697))

(assert (=> b!1349895 m!1236697))

(declare-fun m!1237097 () Bool)

(assert (=> b!1349895 m!1237097))

(assert (=> b!1349896 m!1236697))

(declare-fun m!1237099 () Bool)

(assert (=> b!1349896 m!1237099))

(assert (=> b!1349896 m!1236873))

(assert (=> b!1349896 m!1236697))

(assert (=> b!1349896 m!1236815))

(assert (=> b!1349896 m!1236873))

(assert (=> b!1349896 m!1236815))

(assert (=> b!1349896 m!1236877))

(assert (=> b!1349890 m!1237093))

(declare-fun m!1237101 () Bool)

(assert (=> b!1349901 m!1237101))

(assert (=> b!1349901 m!1236873))

(declare-fun m!1237103 () Bool)

(assert (=> b!1349901 m!1237103))

(declare-fun m!1237105 () Bool)

(assert (=> b!1349901 m!1237105))

(declare-fun m!1237107 () Bool)

(assert (=> b!1349901 m!1237107))

(assert (=> b!1349901 m!1236815))

(assert (=> b!1349901 m!1236873))

(assert (=> b!1349901 m!1236815))

(assert (=> b!1349901 m!1236877))

(assert (=> b!1349901 m!1237105))

(assert (=> b!1349901 m!1236697))

(declare-fun m!1237109 () Bool)

(assert (=> b!1349894 m!1237109))

(declare-fun m!1237111 () Bool)

(assert (=> b!1349897 m!1237111))

(assert (=> b!1349754 d!144775))

(declare-fun d!144777 () Bool)

(declare-fun e!767903 () Bool)

(assert (=> d!144777 e!767903))

(declare-fun res!895479 () Bool)

(assert (=> d!144777 (=> (not res!895479) (not e!767903))))

(declare-fun lt!596820 () ListLongMap!21995)

(assert (=> d!144777 (= res!895479 (contains!9197 lt!596820 (_1!12180 (tuple2!24339 lt!596719 zeroValue!1245))))))

(declare-fun lt!596818 () List!31489)

(assert (=> d!144777 (= lt!596820 (ListLongMap!21996 lt!596818))))

(declare-fun lt!596817 () Unit!44203)

(declare-fun lt!596819 () Unit!44203)

(assert (=> d!144777 (= lt!596817 lt!596819)))

(assert (=> d!144777 (= (getValueByKey!724 lt!596818 (_1!12180 (tuple2!24339 lt!596719 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596719 zeroValue!1245))))))

(assert (=> d!144777 (= lt!596819 (lemmaContainsTupThenGetReturnValue!369 lt!596818 (_1!12180 (tuple2!24339 lt!596719 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596719 zeroValue!1245))))))

(assert (=> d!144777 (= lt!596818 (insertStrictlySorted!498 (toList!11013 lt!596716) (_1!12180 (tuple2!24339 lt!596719 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596719 zeroValue!1245))))))

(assert (=> d!144777 (= (+!4855 lt!596716 (tuple2!24339 lt!596719 zeroValue!1245)) lt!596820)))

(declare-fun b!1349902 () Bool)

(declare-fun res!895478 () Bool)

(assert (=> b!1349902 (=> (not res!895478) (not e!767903))))

(assert (=> b!1349902 (= res!895478 (= (getValueByKey!724 (toList!11013 lt!596820) (_1!12180 (tuple2!24339 lt!596719 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596719 zeroValue!1245)))))))

(declare-fun b!1349903 () Bool)

(assert (=> b!1349903 (= e!767903 (contains!9199 (toList!11013 lt!596820) (tuple2!24339 lt!596719 zeroValue!1245)))))

(assert (= (and d!144777 res!895479) b!1349902))

(assert (= (and b!1349902 res!895478) b!1349903))

(declare-fun m!1237113 () Bool)

(assert (=> d!144777 m!1237113))

(declare-fun m!1237115 () Bool)

(assert (=> d!144777 m!1237115))

(declare-fun m!1237117 () Bool)

(assert (=> d!144777 m!1237117))

(declare-fun m!1237119 () Bool)

(assert (=> d!144777 m!1237119))

(declare-fun m!1237121 () Bool)

(assert (=> b!1349902 m!1237121))

(declare-fun m!1237123 () Bool)

(assert (=> b!1349903 m!1237123))

(assert (=> b!1349754 d!144777))

(declare-fun d!144779 () Bool)

(assert (=> d!144779 (= (apply!1041 (+!4855 lt!596706 (tuple2!24339 lt!596705 minValue!1245)) lt!596701) (apply!1041 lt!596706 lt!596701))))

(declare-fun lt!596821 () Unit!44203)

(assert (=> d!144779 (= lt!596821 (choose!1984 lt!596706 lt!596705 minValue!1245 lt!596701))))

(declare-fun e!767904 () Bool)

(assert (=> d!144779 e!767904))

(declare-fun res!895480 () Bool)

(assert (=> d!144779 (=> (not res!895480) (not e!767904))))

(assert (=> d!144779 (= res!895480 (contains!9197 lt!596706 lt!596701))))

(assert (=> d!144779 (= (addApplyDifferent!583 lt!596706 lt!596705 minValue!1245 lt!596701) lt!596821)))

(declare-fun b!1349904 () Bool)

(assert (=> b!1349904 (= e!767904 (not (= lt!596701 lt!596705)))))

(assert (= (and d!144779 res!895480) b!1349904))

(assert (=> d!144779 m!1236845))

(declare-fun m!1237125 () Bool)

(assert (=> d!144779 m!1237125))

(assert (=> d!144779 m!1236853))

(assert (=> d!144779 m!1236855))

(assert (=> d!144779 m!1236853))

(declare-fun m!1237127 () Bool)

(assert (=> d!144779 m!1237127))

(assert (=> b!1349754 d!144779))

(declare-fun d!144781 () Bool)

(assert (=> d!144781 (= (apply!1041 (+!4855 lt!596716 (tuple2!24339 lt!596719 zeroValue!1245)) lt!596718) (apply!1041 lt!596716 lt!596718))))

(declare-fun lt!596822 () Unit!44203)

(assert (=> d!144781 (= lt!596822 (choose!1984 lt!596716 lt!596719 zeroValue!1245 lt!596718))))

(declare-fun e!767905 () Bool)

(assert (=> d!144781 e!767905))

(declare-fun res!895481 () Bool)

(assert (=> d!144781 (=> (not res!895481) (not e!767905))))

(assert (=> d!144781 (= res!895481 (contains!9197 lt!596716 lt!596718))))

(assert (=> d!144781 (= (addApplyDifferent!583 lt!596716 lt!596719 zeroValue!1245 lt!596718) lt!596822)))

(declare-fun b!1349905 () Bool)

(assert (=> b!1349905 (= e!767905 (not (= lt!596718 lt!596719)))))

(assert (= (and d!144781 res!895481) b!1349905))

(assert (=> d!144781 m!1236861))

(declare-fun m!1237129 () Bool)

(assert (=> d!144781 m!1237129))

(assert (=> d!144781 m!1236847))

(assert (=> d!144781 m!1236849))

(assert (=> d!144781 m!1236847))

(declare-fun m!1237131 () Bool)

(assert (=> d!144781 m!1237131))

(assert (=> b!1349754 d!144781))

(declare-fun d!144783 () Bool)

(declare-fun e!767906 () Bool)

(assert (=> d!144783 e!767906))

(declare-fun res!895483 () Bool)

(assert (=> d!144783 (=> (not res!895483) (not e!767906))))

(declare-fun lt!596826 () ListLongMap!21995)

(assert (=> d!144783 (= res!895483 (contains!9197 lt!596826 (_1!12180 (tuple2!24339 lt!596714 zeroValue!1245))))))

(declare-fun lt!596824 () List!31489)

(assert (=> d!144783 (= lt!596826 (ListLongMap!21996 lt!596824))))

(declare-fun lt!596823 () Unit!44203)

(declare-fun lt!596825 () Unit!44203)

(assert (=> d!144783 (= lt!596823 lt!596825)))

(assert (=> d!144783 (= (getValueByKey!724 lt!596824 (_1!12180 (tuple2!24339 lt!596714 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596714 zeroValue!1245))))))

(assert (=> d!144783 (= lt!596825 (lemmaContainsTupThenGetReturnValue!369 lt!596824 (_1!12180 (tuple2!24339 lt!596714 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596714 zeroValue!1245))))))

(assert (=> d!144783 (= lt!596824 (insertStrictlySorted!498 (toList!11013 lt!596709) (_1!12180 (tuple2!24339 lt!596714 zeroValue!1245)) (_2!12180 (tuple2!24339 lt!596714 zeroValue!1245))))))

(assert (=> d!144783 (= (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245)) lt!596826)))

(declare-fun b!1349906 () Bool)

(declare-fun res!895482 () Bool)

(assert (=> b!1349906 (=> (not res!895482) (not e!767906))))

(assert (=> b!1349906 (= res!895482 (= (getValueByKey!724 (toList!11013 lt!596826) (_1!12180 (tuple2!24339 lt!596714 zeroValue!1245))) (Some!775 (_2!12180 (tuple2!24339 lt!596714 zeroValue!1245)))))))

(declare-fun b!1349907 () Bool)

(assert (=> b!1349907 (= e!767906 (contains!9199 (toList!11013 lt!596826) (tuple2!24339 lt!596714 zeroValue!1245)))))

(assert (= (and d!144783 res!895483) b!1349906))

(assert (= (and b!1349906 res!895482) b!1349907))

(declare-fun m!1237133 () Bool)

(assert (=> d!144783 m!1237133))

(declare-fun m!1237135 () Bool)

(assert (=> d!144783 m!1237135))

(declare-fun m!1237137 () Bool)

(assert (=> d!144783 m!1237137))

(declare-fun m!1237139 () Bool)

(assert (=> d!144783 m!1237139))

(declare-fun m!1237141 () Bool)

(assert (=> b!1349906 m!1237141))

(declare-fun m!1237143 () Bool)

(assert (=> b!1349907 m!1237143))

(assert (=> b!1349754 d!144783))

(declare-fun d!144785 () Bool)

(assert (=> d!144785 (contains!9197 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245)) lt!596712)))

(declare-fun lt!596827 () Unit!44203)

(assert (=> d!144785 (= lt!596827 (choose!1985 lt!596709 lt!596714 zeroValue!1245 lt!596712))))

(assert (=> d!144785 (contains!9197 lt!596709 lt!596712)))

(assert (=> d!144785 (= (addStillContains!1216 lt!596709 lt!596714 zeroValue!1245 lt!596712) lt!596827)))

(declare-fun bs!38700 () Bool)

(assert (= bs!38700 d!144785))

(assert (=> bs!38700 m!1236867))

(assert (=> bs!38700 m!1236867))

(assert (=> bs!38700 m!1236871))

(declare-fun m!1237145 () Bool)

(assert (=> bs!38700 m!1237145))

(declare-fun m!1237147 () Bool)

(assert (=> bs!38700 m!1237147))

(assert (=> b!1349754 d!144785))

(declare-fun d!144787 () Bool)

(assert (=> d!144787 (= (apply!1041 (+!4855 lt!596713 (tuple2!24339 lt!596721 minValue!1245)) lt!596703) (apply!1041 lt!596713 lt!596703))))

(declare-fun lt!596828 () Unit!44203)

(assert (=> d!144787 (= lt!596828 (choose!1984 lt!596713 lt!596721 minValue!1245 lt!596703))))

(declare-fun e!767907 () Bool)

(assert (=> d!144787 e!767907))

(declare-fun res!895484 () Bool)

(assert (=> d!144787 (=> (not res!895484) (not e!767907))))

(assert (=> d!144787 (= res!895484 (contains!9197 lt!596713 lt!596703))))

(assert (=> d!144787 (= (addApplyDifferent!583 lt!596713 lt!596721 minValue!1245 lt!596703) lt!596828)))

(declare-fun b!1349908 () Bool)

(assert (=> b!1349908 (= e!767907 (not (= lt!596703 lt!596721)))))

(assert (= (and d!144787 res!895484) b!1349908))

(assert (=> d!144787 m!1236865))

(declare-fun m!1237149 () Bool)

(assert (=> d!144787 m!1237149))

(assert (=> d!144787 m!1236843))

(assert (=> d!144787 m!1236851))

(assert (=> d!144787 m!1236843))

(declare-fun m!1237151 () Bool)

(assert (=> d!144787 m!1237151))

(assert (=> b!1349754 d!144787))

(declare-fun d!144789 () Bool)

(assert (=> d!144789 (= (apply!1041 (+!4855 lt!596706 (tuple2!24339 lt!596705 minValue!1245)) lt!596701) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596706 (tuple2!24339 lt!596705 minValue!1245))) lt!596701)))))

(declare-fun bs!38701 () Bool)

(assert (= bs!38701 d!144789))

(declare-fun m!1237153 () Bool)

(assert (=> bs!38701 m!1237153))

(assert (=> bs!38701 m!1237153))

(declare-fun m!1237155 () Bool)

(assert (=> bs!38701 m!1237155))

(assert (=> b!1349754 d!144789))

(declare-fun d!144791 () Bool)

(assert (=> d!144791 (= (apply!1041 (+!4855 lt!596716 (tuple2!24339 lt!596719 zeroValue!1245)) lt!596718) (get!22469 (getValueByKey!724 (toList!11013 (+!4855 lt!596716 (tuple2!24339 lt!596719 zeroValue!1245))) lt!596718)))))

(declare-fun bs!38702 () Bool)

(assert (= bs!38702 d!144791))

(declare-fun m!1237157 () Bool)

(assert (=> bs!38702 m!1237157))

(assert (=> bs!38702 m!1237157))

(declare-fun m!1237159 () Bool)

(assert (=> bs!38702 m!1237159))

(assert (=> b!1349754 d!144791))

(declare-fun d!144793 () Bool)

(declare-fun e!767909 () Bool)

(assert (=> d!144793 e!767909))

(declare-fun res!895485 () Bool)

(assert (=> d!144793 (=> res!895485 e!767909)))

(declare-fun lt!596832 () Bool)

(assert (=> d!144793 (= res!895485 (not lt!596832))))

(declare-fun lt!596829 () Bool)

(assert (=> d!144793 (= lt!596832 lt!596829)))

(declare-fun lt!596830 () Unit!44203)

(declare-fun e!767908 () Unit!44203)

(assert (=> d!144793 (= lt!596830 e!767908)))

(declare-fun c!126671 () Bool)

(assert (=> d!144793 (= c!126671 lt!596829)))

(assert (=> d!144793 (= lt!596829 (containsKey!746 (toList!11013 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245))) lt!596712))))

(assert (=> d!144793 (= (contains!9197 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245)) lt!596712) lt!596832)))

(declare-fun b!1349909 () Bool)

(declare-fun lt!596831 () Unit!44203)

(assert (=> b!1349909 (= e!767908 lt!596831)))

(assert (=> b!1349909 (= lt!596831 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245))) lt!596712))))

(assert (=> b!1349909 (isDefined!531 (getValueByKey!724 (toList!11013 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245))) lt!596712))))

(declare-fun b!1349910 () Bool)

(declare-fun Unit!44211 () Unit!44203)

(assert (=> b!1349910 (= e!767908 Unit!44211)))

(declare-fun b!1349911 () Bool)

(assert (=> b!1349911 (= e!767909 (isDefined!531 (getValueByKey!724 (toList!11013 (+!4855 lt!596709 (tuple2!24339 lt!596714 zeroValue!1245))) lt!596712)))))

(assert (= (and d!144793 c!126671) b!1349909))

(assert (= (and d!144793 (not c!126671)) b!1349910))

(assert (= (and d!144793 (not res!895485)) b!1349911))

(declare-fun m!1237161 () Bool)

(assert (=> d!144793 m!1237161))

(declare-fun m!1237163 () Bool)

(assert (=> b!1349909 m!1237163))

(declare-fun m!1237165 () Bool)

(assert (=> b!1349909 m!1237165))

(assert (=> b!1349909 m!1237165))

(declare-fun m!1237167 () Bool)

(assert (=> b!1349909 m!1237167))

(assert (=> b!1349911 m!1237165))

(assert (=> b!1349911 m!1237165))

(assert (=> b!1349911 m!1237167))

(assert (=> b!1349754 d!144793))

(declare-fun d!144795 () Bool)

(assert (=> d!144795 (= (apply!1041 lt!596691 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22469 (getValueByKey!724 (toList!11013 lt!596691) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38703 () Bool)

(assert (= bs!38703 d!144795))

(assert (=> bs!38703 m!1236763))

(declare-fun m!1237169 () Bool)

(assert (=> bs!38703 m!1237169))

(assert (=> bs!38703 m!1237169))

(declare-fun m!1237171 () Bool)

(assert (=> bs!38703 m!1237171))

(assert (=> b!1349716 d!144795))

(declare-fun d!144797 () Bool)

(declare-fun c!126674 () Bool)

(assert (=> d!144797 (= c!126674 ((_ is ValueCellFull!17898) (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!767912 () V!55227)

(assert (=> d!144797 (= (get!22468 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767912)))

(declare-fun b!1349916 () Bool)

(declare-fun get!22470 (ValueCell!17898 V!55227) V!55227)

(assert (=> b!1349916 (= e!767912 (get!22470 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349917 () Bool)

(declare-fun get!22471 (ValueCell!17898 V!55227) V!55227)

(assert (=> b!1349917 (= e!767912 (get!22471 (select (arr!44462 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144797 c!126674) b!1349916))

(assert (= (and d!144797 (not c!126674)) b!1349917))

(assert (=> b!1349916 m!1236811))

(assert (=> b!1349916 m!1236815))

(declare-fun m!1237173 () Bool)

(assert (=> b!1349916 m!1237173))

(assert (=> b!1349917 m!1236811))

(assert (=> b!1349917 m!1236815))

(declare-fun m!1237175 () Bool)

(assert (=> b!1349917 m!1237175))

(assert (=> b!1349716 d!144797))

(assert (=> bm!65221 d!144737))

(declare-fun d!144799 () Bool)

(assert (=> d!144799 (= (apply!1041 lt!596717 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!724 (toList!11013 lt!596717) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38704 () Bool)

(assert (= bs!38704 d!144799))

(assert (=> bs!38704 m!1237037))

(assert (=> bs!38704 m!1237037))

(declare-fun m!1237177 () Bool)

(assert (=> bs!38704 m!1237177))

(assert (=> b!1349755 d!144799))

(declare-fun d!144801 () Bool)

(assert (=> d!144801 (= (apply!1041 lt!596691 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!724 (toList!11013 lt!596691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38705 () Bool)

(assert (= bs!38705 d!144801))

(declare-fun m!1237179 () Bool)

(assert (=> bs!38705 m!1237179))

(assert (=> bs!38705 m!1237179))

(declare-fun m!1237181 () Bool)

(assert (=> bs!38705 m!1237181))

(assert (=> b!1349729 d!144801))

(declare-fun d!144803 () Bool)

(declare-fun e!767914 () Bool)

(assert (=> d!144803 e!767914))

(declare-fun res!895486 () Bool)

(assert (=> d!144803 (=> res!895486 e!767914)))

(declare-fun lt!596836 () Bool)

(assert (=> d!144803 (= res!895486 (not lt!596836))))

(declare-fun lt!596833 () Bool)

(assert (=> d!144803 (= lt!596836 lt!596833)))

(declare-fun lt!596834 () Unit!44203)

(declare-fun e!767913 () Unit!44203)

(assert (=> d!144803 (= lt!596834 e!767913)))

(declare-fun c!126675 () Bool)

(assert (=> d!144803 (= c!126675 lt!596833)))

(assert (=> d!144803 (= lt!596833 (containsKey!746 (toList!11013 lt!596691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144803 (= (contains!9197 lt!596691 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596836)))

(declare-fun b!1349918 () Bool)

(declare-fun lt!596835 () Unit!44203)

(assert (=> b!1349918 (= e!767913 lt!596835)))

(assert (=> b!1349918 (= lt!596835 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349918 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349919 () Bool)

(declare-fun Unit!44212 () Unit!44203)

(assert (=> b!1349919 (= e!767913 Unit!44212)))

(declare-fun b!1349920 () Bool)

(assert (=> b!1349920 (= e!767914 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144803 c!126675) b!1349918))

(assert (= (and d!144803 (not c!126675)) b!1349919))

(assert (= (and d!144803 (not res!895486)) b!1349920))

(declare-fun m!1237183 () Bool)

(assert (=> d!144803 m!1237183))

(declare-fun m!1237185 () Bool)

(assert (=> b!1349918 m!1237185))

(assert (=> b!1349918 m!1237011))

(assert (=> b!1349918 m!1237011))

(declare-fun m!1237187 () Bool)

(assert (=> b!1349918 m!1237187))

(assert (=> b!1349920 m!1237011))

(assert (=> b!1349920 m!1237011))

(assert (=> b!1349920 m!1237187))

(assert (=> bm!65215 d!144803))

(assert (=> b!1349737 d!144747))

(assert (=> b!1349737 d!144749))

(declare-fun d!144805 () Bool)

(assert (=> d!144805 (= (apply!1041 lt!596717 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22469 (getValueByKey!724 (toList!11013 lt!596717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38706 () Bool)

(assert (= bs!38706 d!144805))

(declare-fun m!1237189 () Bool)

(assert (=> bs!38706 m!1237189))

(assert (=> bs!38706 m!1237189))

(declare-fun m!1237191 () Bool)

(assert (=> bs!38706 m!1237191))

(assert (=> b!1349751 d!144805))

(declare-fun d!144807 () Bool)

(assert (=> d!144807 (= (apply!1041 lt!596717 (select (arr!44461 _keys!1571) from!1960)) (get!22469 (getValueByKey!724 (toList!11013 lt!596717) (select (arr!44461 _keys!1571) from!1960))))))

(declare-fun bs!38707 () Bool)

(assert (= bs!38707 d!144807))

(assert (=> bs!38707 m!1236697))

(declare-fun m!1237193 () Bool)

(assert (=> bs!38707 m!1237193))

(assert (=> bs!38707 m!1237193))

(declare-fun m!1237195 () Bool)

(assert (=> bs!38707 m!1237195))

(assert (=> b!1349742 d!144807))

(declare-fun d!144809 () Bool)

(declare-fun c!126676 () Bool)

(assert (=> d!144809 (= c!126676 ((_ is ValueCellFull!17898) (select (arr!44462 _values!1303) from!1960)))))

(declare-fun e!767915 () V!55227)

(assert (=> d!144809 (= (get!22468 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767915)))

(declare-fun b!1349921 () Bool)

(assert (=> b!1349921 (= e!767915 (get!22470 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1349922 () Bool)

(assert (=> b!1349922 (= e!767915 (get!22471 (select (arr!44462 _values!1303) from!1960) (dynLambda!3794 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144809 c!126676) b!1349921))

(assert (= (and d!144809 (not c!126676)) b!1349922))

(assert (=> b!1349921 m!1236873))

(assert (=> b!1349921 m!1236815))

(declare-fun m!1237197 () Bool)

(assert (=> b!1349921 m!1237197))

(assert (=> b!1349922 m!1236873))

(assert (=> b!1349922 m!1236815))

(declare-fun m!1237199 () Bool)

(assert (=> b!1349922 m!1237199))

(assert (=> b!1349742 d!144809))

(assert (=> bm!65228 d!144775))

(assert (=> d!144705 d!144697))

(declare-fun d!144811 () Bool)

(declare-fun e!767916 () Bool)

(assert (=> d!144811 e!767916))

(declare-fun res!895488 () Bool)

(assert (=> d!144811 (=> (not res!895488) (not e!767916))))

(declare-fun lt!596840 () ListLongMap!21995)

(assert (=> d!144811 (= res!895488 (contains!9197 lt!596840 (_1!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596838 () List!31489)

(assert (=> d!144811 (= lt!596840 (ListLongMap!21996 lt!596838))))

(declare-fun lt!596837 () Unit!44203)

(declare-fun lt!596839 () Unit!44203)

(assert (=> d!144811 (= lt!596837 lt!596839)))

(assert (=> d!144811 (= (getValueByKey!724 lt!596838 (_1!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144811 (= lt!596839 (lemmaContainsTupThenGetReturnValue!369 lt!596838 (_1!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144811 (= lt!596838 (insertStrictlySorted!498 (toList!11013 (ite c!126629 call!65228 (ite c!126631 call!65231 call!65229))) (_1!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144811 (= (+!4855 (ite c!126629 call!65228 (ite c!126631 call!65231 call!65229)) (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596840)))

(declare-fun b!1349923 () Bool)

(declare-fun res!895487 () Bool)

(assert (=> b!1349923 (=> (not res!895487) (not e!767916))))

(assert (=> b!1349923 (= res!895487 (= (getValueByKey!724 (toList!11013 lt!596840) (_1!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12180 (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1349924 () Bool)

(assert (=> b!1349924 (= e!767916 (contains!9199 (toList!11013 lt!596840) (ite (or c!126629 c!126631) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144811 res!895488) b!1349923))

(assert (= (and b!1349923 res!895487) b!1349924))

(declare-fun m!1237201 () Bool)

(assert (=> d!144811 m!1237201))

(declare-fun m!1237203 () Bool)

(assert (=> d!144811 m!1237203))

(declare-fun m!1237205 () Bool)

(assert (=> d!144811 m!1237205))

(declare-fun m!1237207 () Bool)

(assert (=> d!144811 m!1237207))

(declare-fun m!1237209 () Bool)

(assert (=> b!1349923 m!1237209))

(declare-fun m!1237211 () Bool)

(assert (=> b!1349924 m!1237211))

(assert (=> bm!65223 d!144811))

(declare-fun d!144813 () Bool)

(assert (=> d!144813 (= (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1349719 d!144813))

(declare-fun d!144815 () Bool)

(assert (=> d!144815 (= (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142)) (not (isEmpty!1100 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38708 () Bool)

(assert (= bs!38708 d!144815))

(assert (=> bs!38708 m!1236759))

(declare-fun m!1237213 () Bool)

(assert (=> bs!38708 m!1237213))

(assert (=> b!1349669 d!144815))

(declare-fun e!767917 () Option!776)

(declare-fun b!1349925 () Bool)

(assert (=> b!1349925 (= e!767917 (Some!775 (_2!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))))

(declare-fun b!1349928 () Bool)

(declare-fun e!767918 () Option!776)

(assert (=> b!1349928 (= e!767918 None!774)))

(declare-fun b!1349927 () Bool)

(assert (=> b!1349927 (= e!767918 (getValueByKey!724 (t!46145 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(declare-fun b!1349926 () Bool)

(assert (=> b!1349926 (= e!767917 e!767918)))

(declare-fun c!126678 () Bool)

(assert (=> b!1349926 (= c!126678 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (not (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142))))))

(declare-fun c!126677 () Bool)

(declare-fun d!144817 () Bool)

(assert (=> d!144817 (= c!126677 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144817 (= (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!767917)))

(assert (= (and d!144817 c!126677) b!1349925))

(assert (= (and d!144817 (not c!126677)) b!1349926))

(assert (= (and b!1349926 c!126678) b!1349927))

(assert (= (and b!1349926 (not c!126678)) b!1349928))

(declare-fun m!1237215 () Bool)

(assert (=> b!1349927 m!1237215))

(assert (=> b!1349669 d!144817))

(declare-fun d!144819 () Bool)

(declare-fun e!767919 () Bool)

(assert (=> d!144819 e!767919))

(declare-fun res!895490 () Bool)

(assert (=> d!144819 (=> (not res!895490) (not e!767919))))

(declare-fun lt!596844 () ListLongMap!21995)

(assert (=> d!144819 (= res!895490 (contains!9197 lt!596844 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596842 () List!31489)

(assert (=> d!144819 (= lt!596844 (ListLongMap!21996 lt!596842))))

(declare-fun lt!596841 () Unit!44203)

(declare-fun lt!596843 () Unit!44203)

(assert (=> d!144819 (= lt!596841 lt!596843)))

(assert (=> d!144819 (= (getValueByKey!724 lt!596842 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144819 (= lt!596843 (lemmaContainsTupThenGetReturnValue!369 lt!596842 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144819 (= lt!596842 (insertStrictlySorted!498 (toList!11013 call!65218) (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144819 (= (+!4855 call!65218 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596844)))

(declare-fun b!1349929 () Bool)

(declare-fun res!895489 () Bool)

(assert (=> b!1349929 (=> (not res!895489) (not e!767919))))

(assert (=> b!1349929 (= res!895489 (= (getValueByKey!724 (toList!11013 lt!596844) (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1349930 () Bool)

(assert (=> b!1349930 (= e!767919 (contains!9199 (toList!11013 lt!596844) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144819 res!895490) b!1349929))

(assert (= (and b!1349929 res!895489) b!1349930))

(declare-fun m!1237217 () Bool)

(assert (=> d!144819 m!1237217))

(declare-fun m!1237219 () Bool)

(assert (=> d!144819 m!1237219))

(declare-fun m!1237221 () Bool)

(assert (=> d!144819 m!1237221))

(declare-fun m!1237223 () Bool)

(assert (=> d!144819 m!1237223))

(declare-fun m!1237225 () Bool)

(assert (=> b!1349929 m!1237225))

(declare-fun m!1237227 () Bool)

(assert (=> b!1349930 m!1237227))

(assert (=> b!1349718 d!144819))

(declare-fun d!144821 () Bool)

(assert (=> d!144821 (isDefined!531 (getValueByKey!724 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun lt!596845 () Unit!44203)

(assert (=> d!144821 (= lt!596845 (choose!1986 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(declare-fun e!767920 () Bool)

(assert (=> d!144821 e!767920))

(declare-fun res!895491 () Bool)

(assert (=> d!144821 (=> (not res!895491) (not e!767920))))

(assert (=> d!144821 (= res!895491 (isStrictlySorted!883 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))))

(assert (=> d!144821 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) lt!596845)))

(declare-fun b!1349931 () Bool)

(assert (=> b!1349931 (= e!767920 (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142))))

(assert (= (and d!144821 res!895491) b!1349931))

(assert (=> d!144821 m!1236759))

(assert (=> d!144821 m!1236759))

(assert (=> d!144821 m!1236761))

(declare-fun m!1237229 () Bool)

(assert (=> d!144821 m!1237229))

(declare-fun m!1237231 () Bool)

(assert (=> d!144821 m!1237231))

(assert (=> b!1349931 m!1236755))

(assert (=> b!1349667 d!144821))

(assert (=> b!1349667 d!144815))

(assert (=> b!1349667 d!144817))

(declare-fun d!144823 () Bool)

(declare-fun e!767921 () Bool)

(assert (=> d!144823 e!767921))

(declare-fun res!895493 () Bool)

(assert (=> d!144823 (=> (not res!895493) (not e!767921))))

(declare-fun lt!596849 () ListLongMap!21995)

(assert (=> d!144823 (= res!895493 (contains!9197 lt!596849 (_1!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596847 () List!31489)

(assert (=> d!144823 (= lt!596849 (ListLongMap!21996 lt!596847))))

(declare-fun lt!596846 () Unit!44203)

(declare-fun lt!596848 () Unit!44203)

(assert (=> d!144823 (= lt!596846 lt!596848)))

(assert (=> d!144823 (= (getValueByKey!724 lt!596847 (_1!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144823 (= lt!596848 (lemmaContainsTupThenGetReturnValue!369 lt!596847 (_1!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144823 (= lt!596847 (insertStrictlySorted!498 (toList!11013 (ite c!126622 call!65221 (ite c!126624 call!65224 call!65222))) (_1!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144823 (= (+!4855 (ite c!126622 call!65221 (ite c!126624 call!65224 call!65222)) (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596849)))

(declare-fun b!1349932 () Bool)

(declare-fun res!895492 () Bool)

(assert (=> b!1349932 (=> (not res!895492) (not e!767921))))

(assert (=> b!1349932 (= res!895492 (= (getValueByKey!724 (toList!11013 lt!596849) (_1!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12180 (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1349933 () Bool)

(assert (=> b!1349933 (= e!767921 (contains!9199 (toList!11013 lt!596849) (ite (or c!126622 c!126624) (tuple2!24339 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144823 res!895493) b!1349932))

(assert (= (and b!1349932 res!895492) b!1349933))

(declare-fun m!1237233 () Bool)

(assert (=> d!144823 m!1237233))

(declare-fun m!1237235 () Bool)

(assert (=> d!144823 m!1237235))

(declare-fun m!1237237 () Bool)

(assert (=> d!144823 m!1237237))

(declare-fun m!1237239 () Bool)

(assert (=> d!144823 m!1237239))

(declare-fun m!1237241 () Bool)

(assert (=> b!1349932 m!1237241))

(declare-fun m!1237243 () Bool)

(assert (=> b!1349933 m!1237243))

(assert (=> bm!65216 d!144823))

(declare-fun d!144825 () Bool)

(declare-fun e!767923 () Bool)

(assert (=> d!144825 e!767923))

(declare-fun res!895494 () Bool)

(assert (=> d!144825 (=> res!895494 e!767923)))

(declare-fun lt!596853 () Bool)

(assert (=> d!144825 (= res!895494 (not lt!596853))))

(declare-fun lt!596850 () Bool)

(assert (=> d!144825 (= lt!596853 lt!596850)))

(declare-fun lt!596851 () Unit!44203)

(declare-fun e!767922 () Unit!44203)

(assert (=> d!144825 (= lt!596851 e!767922)))

(declare-fun c!126679 () Bool)

(assert (=> d!144825 (= c!126679 lt!596850)))

(assert (=> d!144825 (= lt!596850 (containsKey!746 (toList!11013 lt!596717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144825 (= (contains!9197 lt!596717 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596853)))

(declare-fun b!1349934 () Bool)

(declare-fun lt!596852 () Unit!44203)

(assert (=> b!1349934 (= e!767922 lt!596852)))

(assert (=> b!1349934 (= lt!596852 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349934 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349935 () Bool)

(declare-fun Unit!44213 () Unit!44203)

(assert (=> b!1349935 (= e!767922 Unit!44213)))

(declare-fun b!1349936 () Bool)

(assert (=> b!1349936 (= e!767923 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144825 c!126679) b!1349934))

(assert (= (and d!144825 (not c!126679)) b!1349935))

(assert (= (and d!144825 (not res!895494)) b!1349936))

(declare-fun m!1237245 () Bool)

(assert (=> d!144825 m!1237245))

(declare-fun m!1237247 () Bool)

(assert (=> b!1349934 m!1237247))

(assert (=> b!1349934 m!1237189))

(assert (=> b!1349934 m!1237189))

(declare-fun m!1237249 () Bool)

(assert (=> b!1349934 m!1237249))

(assert (=> b!1349936 m!1237189))

(assert (=> b!1349936 m!1237189))

(assert (=> b!1349936 m!1237249))

(assert (=> bm!65222 d!144825))

(declare-fun d!144827 () Bool)

(declare-fun e!767925 () Bool)

(assert (=> d!144827 e!767925))

(declare-fun res!895495 () Bool)

(assert (=> d!144827 (=> res!895495 e!767925)))

(declare-fun lt!596857 () Bool)

(assert (=> d!144827 (= res!895495 (not lt!596857))))

(declare-fun lt!596854 () Bool)

(assert (=> d!144827 (= lt!596857 lt!596854)))

(declare-fun lt!596855 () Unit!44203)

(declare-fun e!767924 () Unit!44203)

(assert (=> d!144827 (= lt!596855 e!767924)))

(declare-fun c!126680 () Bool)

(assert (=> d!144827 (= c!126680 lt!596854)))

(assert (=> d!144827 (= lt!596854 (containsKey!746 (toList!11013 lt!596691) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144827 (= (contains!9197 lt!596691 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596857)))

(declare-fun b!1349937 () Bool)

(declare-fun lt!596856 () Unit!44203)

(assert (=> b!1349937 (= e!767924 lt!596856)))

(assert (=> b!1349937 (= lt!596856 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596691) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1349937 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1349938 () Bool)

(declare-fun Unit!44214 () Unit!44203)

(assert (=> b!1349938 (= e!767924 Unit!44214)))

(declare-fun b!1349939 () Bool)

(assert (=> b!1349939 (= e!767925 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144827 c!126680) b!1349937))

(assert (= (and d!144827 (not c!126680)) b!1349938))

(assert (= (and d!144827 (not res!895495)) b!1349939))

(assert (=> d!144827 m!1236763))

(declare-fun m!1237251 () Bool)

(assert (=> d!144827 m!1237251))

(assert (=> b!1349937 m!1236763))

(declare-fun m!1237253 () Bool)

(assert (=> b!1349937 m!1237253))

(assert (=> b!1349937 m!1236763))

(assert (=> b!1349937 m!1237169))

(assert (=> b!1349937 m!1237169))

(declare-fun m!1237255 () Bool)

(assert (=> b!1349937 m!1237255))

(assert (=> b!1349939 m!1236763))

(assert (=> b!1349939 m!1237169))

(assert (=> b!1349939 m!1237169))

(assert (=> b!1349939 m!1237255))

(assert (=> b!1349717 d!144827))

(assert (=> b!1349772 d!144743))

(declare-fun d!144829 () Bool)

(declare-fun e!767927 () Bool)

(assert (=> d!144829 e!767927))

(declare-fun res!895496 () Bool)

(assert (=> d!144829 (=> res!895496 e!767927)))

(declare-fun lt!596861 () Bool)

(assert (=> d!144829 (= res!895496 (not lt!596861))))

(declare-fun lt!596858 () Bool)

(assert (=> d!144829 (= lt!596861 lt!596858)))

(declare-fun lt!596859 () Unit!44203)

(declare-fun e!767926 () Unit!44203)

(assert (=> d!144829 (= lt!596859 e!767926)))

(declare-fun c!126681 () Bool)

(assert (=> d!144829 (= c!126681 lt!596858)))

(assert (=> d!144829 (= lt!596858 (containsKey!746 (toList!11013 lt!596691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144829 (= (contains!9197 lt!596691 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596861)))

(declare-fun b!1349940 () Bool)

(declare-fun lt!596860 () Unit!44203)

(assert (=> b!1349940 (= e!767926 lt!596860)))

(assert (=> b!1349940 (= lt!596860 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1349940 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1349941 () Bool)

(declare-fun Unit!44215 () Unit!44203)

(assert (=> b!1349941 (= e!767926 Unit!44215)))

(declare-fun b!1349942 () Bool)

(assert (=> b!1349942 (= e!767927 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596691) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144829 c!126681) b!1349940))

(assert (= (and d!144829 (not c!126681)) b!1349941))

(assert (= (and d!144829 (not res!895496)) b!1349942))

(declare-fun m!1237257 () Bool)

(assert (=> d!144829 m!1237257))

(declare-fun m!1237259 () Bool)

(assert (=> b!1349940 m!1237259))

(assert (=> b!1349940 m!1237179))

(assert (=> b!1349940 m!1237179))

(declare-fun m!1237261 () Bool)

(assert (=> b!1349940 m!1237261))

(assert (=> b!1349942 m!1237179))

(assert (=> b!1349942 m!1237179))

(assert (=> b!1349942 m!1237261))

(assert (=> bm!65217 d!144829))

(assert (=> b!1349745 d!144707))

(declare-fun d!144831 () Bool)

(declare-fun lt!596864 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!667 (List!31490) (InoxSet (_ BitVec 64)))

(assert (=> d!144831 (= lt!596864 (select (content!667 Nil!31487) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!767933 () Bool)

(assert (=> d!144831 (= lt!596864 e!767933)))

(declare-fun res!895501 () Bool)

(assert (=> d!144831 (=> (not res!895501) (not e!767933))))

(assert (=> d!144831 (= res!895501 ((_ is Cons!31486) Nil!31487))))

(assert (=> d!144831 (= (contains!9198 Nil!31487 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)) lt!596864)))

(declare-fun b!1349947 () Bool)

(declare-fun e!767932 () Bool)

(assert (=> b!1349947 (= e!767933 e!767932)))

(declare-fun res!895502 () Bool)

(assert (=> b!1349947 (=> res!895502 e!767932)))

(assert (=> b!1349947 (= res!895502 (= (h!32695 Nil!31487) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349948 () Bool)

(assert (=> b!1349948 (= e!767932 (contains!9198 (t!46146 Nil!31487) (select (arr!44461 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144831 res!895501) b!1349947))

(assert (= (and b!1349947 (not res!895502)) b!1349948))

(declare-fun m!1237263 () Bool)

(assert (=> d!144831 m!1237263))

(assert (=> d!144831 m!1236745))

(declare-fun m!1237265 () Bool)

(assert (=> d!144831 m!1237265))

(assert (=> b!1349948 m!1236745))

(declare-fun m!1237267 () Bool)

(assert (=> b!1349948 m!1237267))

(assert (=> b!1349770 d!144831))

(assert (=> b!1349723 d!144813))

(declare-fun d!144833 () Bool)

(declare-fun e!767934 () Bool)

(assert (=> d!144833 e!767934))

(declare-fun res!895504 () Bool)

(assert (=> d!144833 (=> (not res!895504) (not e!767934))))

(declare-fun lt!596868 () ListLongMap!21995)

(assert (=> d!144833 (= res!895504 (contains!9197 lt!596868 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596866 () List!31489)

(assert (=> d!144833 (= lt!596868 (ListLongMap!21996 lt!596866))))

(declare-fun lt!596865 () Unit!44203)

(declare-fun lt!596867 () Unit!44203)

(assert (=> d!144833 (= lt!596865 lt!596867)))

(assert (=> d!144833 (= (getValueByKey!724 lt!596866 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144833 (= lt!596867 (lemmaContainsTupThenGetReturnValue!369 lt!596866 (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144833 (= lt!596866 (insertStrictlySorted!498 (toList!11013 call!65225) (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144833 (= (+!4855 call!65225 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596868)))

(declare-fun b!1349949 () Bool)

(declare-fun res!895503 () Bool)

(assert (=> b!1349949 (=> (not res!895503) (not e!767934))))

(assert (=> b!1349949 (= res!895503 (= (getValueByKey!724 (toList!11013 lt!596868) (_1!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12180 (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1349950 () Bool)

(assert (=> b!1349950 (= e!767934 (contains!9199 (toList!11013 lt!596868) (tuple2!24339 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144833 res!895504) b!1349949))

(assert (= (and b!1349949 res!895503) b!1349950))

(declare-fun m!1237269 () Bool)

(assert (=> d!144833 m!1237269))

(declare-fun m!1237271 () Bool)

(assert (=> d!144833 m!1237271))

(declare-fun m!1237273 () Bool)

(assert (=> d!144833 m!1237273))

(declare-fun m!1237275 () Bool)

(assert (=> d!144833 m!1237275))

(declare-fun m!1237277 () Bool)

(assert (=> b!1349949 m!1237277))

(declare-fun m!1237279 () Bool)

(assert (=> b!1349950 m!1237279))

(assert (=> b!1349744 d!144833))

(assert (=> b!1349769 d!144743))

(declare-fun d!144835 () Bool)

(declare-fun res!895509 () Bool)

(declare-fun e!767939 () Bool)

(assert (=> d!144835 (=> res!895509 e!767939)))

(assert (=> d!144835 (= res!895509 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144835 (= (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) k0!1142) e!767939)))

(declare-fun b!1349955 () Bool)

(declare-fun e!767940 () Bool)

(assert (=> b!1349955 (= e!767939 e!767940)))

(declare-fun res!895510 () Bool)

(assert (=> b!1349955 (=> (not res!895510) (not e!767940))))

(assert (=> b!1349955 (= res!895510 (and (or (not ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (bvsle (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)) ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1349956 () Bool)

(assert (=> b!1349956 (= e!767940 (containsKey!746 (t!46145 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) k0!1142))))

(assert (= (and d!144835 (not res!895509)) b!1349955))

(assert (= (and b!1349955 res!895510) b!1349956))

(declare-fun m!1237281 () Bool)

(assert (=> b!1349956 m!1237281))

(assert (=> d!144693 d!144835))

(declare-fun d!144837 () Bool)

(declare-fun res!895511 () Bool)

(declare-fun e!767941 () Bool)

(assert (=> d!144837 (=> res!895511 e!767941)))

(assert (=> d!144837 (= res!895511 (and ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144837 (= (containsKey!746 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767941)))

(declare-fun b!1349957 () Bool)

(declare-fun e!767942 () Bool)

(assert (=> b!1349957 (= e!767941 e!767942)))

(declare-fun res!895512 () Bool)

(assert (=> b!1349957 (=> (not res!895512) (not e!767942))))

(assert (=> b!1349957 (= res!895512 (and (or (not ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31485) (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12180 (h!32694 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1349958 () Bool)

(assert (=> b!1349958 (= e!767942 (containsKey!746 (t!46145 (toList!11013 (getCurrentListMap!5961 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144837 (not res!895511)) b!1349957))

(assert (= (and b!1349957 res!895512) b!1349958))

(declare-fun m!1237283 () Bool)

(assert (=> b!1349958 m!1237283))

(assert (=> d!144703 d!144837))

(declare-fun d!144839 () Bool)

(declare-fun e!767944 () Bool)

(assert (=> d!144839 e!767944))

(declare-fun res!895513 () Bool)

(assert (=> d!144839 (=> res!895513 e!767944)))

(declare-fun lt!596872 () Bool)

(assert (=> d!144839 (= res!895513 (not lt!596872))))

(declare-fun lt!596869 () Bool)

(assert (=> d!144839 (= lt!596872 lt!596869)))

(declare-fun lt!596870 () Unit!44203)

(declare-fun e!767943 () Unit!44203)

(assert (=> d!144839 (= lt!596870 e!767943)))

(declare-fun c!126682 () Bool)

(assert (=> d!144839 (= c!126682 lt!596869)))

(assert (=> d!144839 (= lt!596869 (containsKey!746 (toList!11013 lt!596717) (select (arr!44461 _keys!1571) from!1960)))))

(assert (=> d!144839 (= (contains!9197 lt!596717 (select (arr!44461 _keys!1571) from!1960)) lt!596872)))

(declare-fun b!1349959 () Bool)

(declare-fun lt!596871 () Unit!44203)

(assert (=> b!1349959 (= e!767943 lt!596871)))

(assert (=> b!1349959 (= lt!596871 (lemmaContainsKeyImpliesGetValueByKeyDefined!492 (toList!11013 lt!596717) (select (arr!44461 _keys!1571) from!1960)))))

(assert (=> b!1349959 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) (select (arr!44461 _keys!1571) from!1960)))))

(declare-fun b!1349960 () Bool)

(declare-fun Unit!44216 () Unit!44203)

(assert (=> b!1349960 (= e!767943 Unit!44216)))

(declare-fun b!1349961 () Bool)

(assert (=> b!1349961 (= e!767944 (isDefined!531 (getValueByKey!724 (toList!11013 lt!596717) (select (arr!44461 _keys!1571) from!1960))))))

(assert (= (and d!144839 c!126682) b!1349959))

(assert (= (and d!144839 (not c!126682)) b!1349960))

(assert (= (and d!144839 (not res!895513)) b!1349961))

(assert (=> d!144839 m!1236697))

(declare-fun m!1237285 () Bool)

(assert (=> d!144839 m!1237285))

(assert (=> b!1349959 m!1236697))

(declare-fun m!1237287 () Bool)

(assert (=> b!1349959 m!1237287))

(assert (=> b!1349959 m!1236697))

(assert (=> b!1349959 m!1237193))

(assert (=> b!1349959 m!1237193))

(declare-fun m!1237289 () Bool)

(assert (=> b!1349959 m!1237289))

(assert (=> b!1349961 m!1236697))

(assert (=> b!1349961 m!1237193))

(assert (=> b!1349961 m!1237193))

(assert (=> b!1349961 m!1237289))

(assert (=> b!1349743 d!144839))

(declare-fun call!65240 () Bool)

(declare-fun c!126683 () Bool)

(declare-fun bm!65237 () Bool)

(assert (=> bm!65237 (= call!65240 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126683 (Cons!31486 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126636 (Cons!31486 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) Nil!31487) Nil!31487)) (ite c!126636 (Cons!31486 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) Nil!31487) Nil!31487))))))

(declare-fun b!1349962 () Bool)

(declare-fun e!767948 () Bool)

(declare-fun e!767947 () Bool)

(assert (=> b!1349962 (= e!767948 e!767947)))

(assert (=> b!1349962 (= c!126683 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349963 () Bool)

(declare-fun e!767945 () Bool)

(assert (=> b!1349963 (= e!767945 (contains!9198 (ite c!126636 (Cons!31486 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) Nil!31487) Nil!31487) (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!144841 () Bool)

(declare-fun res!895515 () Bool)

(declare-fun e!767946 () Bool)

(assert (=> d!144841 (=> res!895515 e!767946)))

(assert (=> d!144841 (= res!895515 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!45011 _keys!1571)))))

(assert (=> d!144841 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126636 (Cons!31486 (select (arr!44461 _keys!1571) #b00000000000000000000000000000000) Nil!31487) Nil!31487)) e!767946)))

(declare-fun b!1349964 () Bool)

(assert (=> b!1349964 (= e!767947 call!65240)))

(declare-fun b!1349965 () Bool)

(assert (=> b!1349965 (= e!767946 e!767948)))

(declare-fun res!895514 () Bool)

(assert (=> b!1349965 (=> (not res!895514) (not e!767948))))

(assert (=> b!1349965 (= res!895514 (not e!767945))))

(declare-fun res!895516 () Bool)

(assert (=> b!1349965 (=> (not res!895516) (not e!767945))))

(assert (=> b!1349965 (= res!895516 (validKeyInArray!0 (select (arr!44461 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349966 () Bool)

(assert (=> b!1349966 (= e!767947 call!65240)))

(assert (= (and d!144841 (not res!895515)) b!1349965))

(assert (= (and b!1349965 res!895516) b!1349963))

(assert (= (and b!1349965 res!895514) b!1349962))

(assert (= (and b!1349962 c!126683) b!1349964))

(assert (= (and b!1349962 (not c!126683)) b!1349966))

(assert (= (or b!1349964 b!1349966) bm!65237))

(assert (=> bm!65237 m!1237043))

(declare-fun m!1237291 () Bool)

(assert (=> bm!65237 m!1237291))

(assert (=> b!1349962 m!1237043))

(assert (=> b!1349962 m!1237043))

(assert (=> b!1349962 m!1237051))

(assert (=> b!1349963 m!1237043))

(assert (=> b!1349963 m!1237043))

(declare-fun m!1237293 () Bool)

(assert (=> b!1349963 m!1237293))

(assert (=> b!1349965 m!1237043))

(assert (=> b!1349965 m!1237043))

(assert (=> b!1349965 m!1237051))

(assert (=> bm!65231 d!144841))

(declare-fun mapNonEmpty!58117 () Bool)

(declare-fun mapRes!58117 () Bool)

(declare-fun tp!110608 () Bool)

(declare-fun e!767950 () Bool)

(assert (=> mapNonEmpty!58117 (= mapRes!58117 (and tp!110608 e!767950))))

(declare-fun mapValue!58117 () ValueCell!17898)

(declare-fun mapKey!58117 () (_ BitVec 32))

(declare-fun mapRest!58117 () (Array (_ BitVec 32) ValueCell!17898))

(assert (=> mapNonEmpty!58117 (= mapRest!58116 (store mapRest!58117 mapKey!58117 mapValue!58117))))

(declare-fun mapIsEmpty!58117 () Bool)

(assert (=> mapIsEmpty!58117 mapRes!58117))

(declare-fun b!1349968 () Bool)

(declare-fun e!767949 () Bool)

(assert (=> b!1349968 (= e!767949 tp_is_empty!37593)))

(declare-fun b!1349967 () Bool)

(assert (=> b!1349967 (= e!767950 tp_is_empty!37593)))

(declare-fun condMapEmpty!58117 () Bool)

(declare-fun mapDefault!58117 () ValueCell!17898)

(assert (=> mapNonEmpty!58116 (= condMapEmpty!58117 (= mapRest!58116 ((as const (Array (_ BitVec 32) ValueCell!17898)) mapDefault!58117)))))

(assert (=> mapNonEmpty!58116 (= tp!110607 (and e!767949 mapRes!58117))))

(assert (= (and mapNonEmpty!58116 condMapEmpty!58117) mapIsEmpty!58117))

(assert (= (and mapNonEmpty!58116 (not condMapEmpty!58117)) mapNonEmpty!58117))

(assert (= (and mapNonEmpty!58117 ((_ is ValueCellFull!17898) mapValue!58117)) b!1349967))

(assert (= (and mapNonEmpty!58116 ((_ is ValueCellFull!17898) mapDefault!58117)) b!1349968))

(declare-fun m!1237295 () Bool)

(assert (=> mapNonEmpty!58117 m!1237295))

(declare-fun b_lambda!24735 () Bool)

(assert (= b_lambda!24731 (or (and start!113708 b_free!31593) b_lambda!24735)))

(declare-fun b_lambda!24737 () Bool)

(assert (= b_lambda!24729 (or (and start!113708 b_free!31593) b_lambda!24737)))

(declare-fun b_lambda!24739 () Bool)

(assert (= b_lambda!24733 (or (and start!113708 b_free!31593) b_lambda!24739)))

(declare-fun b_lambda!24741 () Bool)

(assert (= b_lambda!24727 (or (and start!113708 b_free!31593) b_lambda!24741)))

(check-sat (not b!1349918) (not b!1349886) (not d!144833) (not b_next!31593) (not b!1349853) (not mapNonEmpty!58117) (not b!1349894) (not b!1349903) (not b!1349830) (not b!1349860) (not b!1349902) (not d!144783) (not b!1349921) (not b!1349842) (not d!144775) (not d!144745) (not b!1349959) (not d!144771) (not b!1349933) (not b!1349948) (not b!1349936) (not b_lambda!24735) (not d!144765) (not b!1349932) (not b!1349923) (not b!1349920) (not b!1349962) (not b!1349958) (not b!1349965) (not b!1349798) (not b!1349833) (not d!144713) (not d!144821) (not d!144711) (not b!1349939) (not b!1349931) (not b!1349922) (not d!144737) (not b_lambda!24725) (not d!144741) (not d!144721) (not d!144723) (not d!144719) (not b!1349924) (not b!1349826) (not d!144767) (not d!144819) (not b!1349963) (not b!1349793) (not d!144759) (not b!1349837) (not b!1349881) (not d!144791) (not b!1349906) (not b!1349897) (not d!144731) (not d!144785) (not d!144777) (not b!1349792) (not d!144789) (not b!1349832) (not d!144839) (not b!1349828) (not b!1349927) (not d!144747) (not b!1349956) (not b_lambda!24741) (not d!144757) (not d!144773) (not b!1349831) (not d!144801) (not b!1349907) (not b!1349836) (not d!144811) (not d!144793) (not b!1349838) (not d!144805) (not b!1349934) (not b!1349896) (not d!144827) (not d!144735) (not d!144733) (not b!1349890) (not b!1349889) (not b!1349883) (not d!144729) (not b!1349839) (not b!1349791) (not b!1349799) (not d!144795) (not b!1349895) (not b!1349930) (not bm!65234) (not b!1349961) (not b!1349797) (not b!1349942) (not d!144803) tp_is_empty!37593 (not b!1349950) (not b!1349800) (not d!144739) b_and!51005 (not b!1349916) (not d!144781) (not b!1349884) (not b_lambda!24739) (not d!144715) (not b!1349901) (not d!144787) (not d!144815) (not d!144725) (not b!1349888) (not d!144823) (not b_lambda!24737) (not d!144825) (not b!1349949) (not b!1349887) (not d!144717) (not d!144779) (not d!144763) (not d!144753) (not b!1349877) (not b!1349940) (not b!1349909) (not bm!65237) (not b!1349917) (not b!1349929) (not b!1349795) (not d!144807) (not d!144751) (not b_lambda!24723) (not d!144799) (not bm!65235) (not d!144831) (not b!1349911) (not b!1349937) (not d!144727) (not b!1349879) (not bm!65236) (not d!144829) (not b!1349892) (not d!144769) (not b!1349900))
(check-sat b_and!51005 (not b_next!31593))
