; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13828 () Bool)

(assert start!13828)

(declare-fun b!127810 () Bool)

(declare-fun b_free!2869 () Bool)

(declare-fun b_next!2869 () Bool)

(assert (=> b!127810 (= b_free!2869 (not b_next!2869))))

(declare-fun tp!11024 () Bool)

(declare-fun b_and!7889 () Bool)

(assert (=> b!127810 (= tp!11024 b_and!7889)))

(declare-fun b!127825 () Bool)

(declare-fun b_free!2871 () Bool)

(declare-fun b_next!2871 () Bool)

(assert (=> b!127825 (= b_free!2871 (not b_next!2871))))

(declare-fun tp!11022 () Bool)

(declare-fun b_and!7891 () Bool)

(assert (=> b!127825 (= tp!11022 b_and!7891)))

(declare-fun e!83457 () Bool)

(declare-datatypes ((V!3449 0))(
  ( (V!3450 (val!1470 Int)) )
))
(declare-datatypes ((array!4707 0))(
  ( (array!4708 (arr!2228 (Array (_ BitVec 32) (_ BitVec 64))) (size!2493 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1082 0))(
  ( (ValueCellFull!1082 (v!3143 V!3449)) (EmptyCell!1082) )
))
(declare-datatypes ((array!4709 0))(
  ( (array!4710 (arr!2229 (Array (_ BitVec 32) ValueCell!1082)) (size!2494 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1072 0))(
  ( (LongMapFixedSize!1073 (defaultEntry!2804 Int) (mask!7072 (_ BitVec 32)) (extraKeys!2581 (_ BitVec 32)) (zeroValue!2665 V!3449) (minValue!2665 V!3449) (_size!585 (_ BitVec 32)) (_keys!4541 array!4707) (_values!2787 array!4709) (_vacant!585 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!864 0))(
  ( (Cell!865 (v!3144 LongMapFixedSize!1072)) )
))
(declare-datatypes ((LongMap!864 0))(
  ( (LongMap!865 (underlying!443 Cell!864)) )
))
(declare-fun thiss!992 () LongMap!864)

(declare-fun e!83458 () Bool)

(declare-fun tp_is_empty!2851 () Bool)

(declare-fun array_inv!1397 (array!4707) Bool)

(declare-fun array_inv!1398 (array!4709) Bool)

(assert (=> b!127810 (= e!83458 (and tp!11024 tp_is_empty!2851 (array_inv!1397 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (array_inv!1398 (_values!2787 (v!3144 (underlying!443 thiss!992)))) e!83457))))

(declare-fun b!127811 () Bool)

(declare-fun e!83470 () Bool)

(declare-fun e!83469 () Bool)

(declare-fun mapRes!4538 () Bool)

(assert (=> b!127811 (= e!83470 (and e!83469 mapRes!4538))))

(declare-fun condMapEmpty!4537 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1072)

(declare-fun mapDefault!4537 () ValueCell!1082)

(assert (=> b!127811 (= condMapEmpty!4537 (= (arr!2229 (_values!2787 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4537)))))

(declare-fun b!127812 () Bool)

(declare-fun res!61750 () Bool)

(declare-fun e!83462 () Bool)

(assert (=> b!127812 (=> (not res!61750) (not e!83462))))

(declare-fun valid!527 (LongMapFixedSize!1072) Bool)

(assert (=> b!127812 (= res!61750 (valid!527 newMap!16))))

(declare-fun mapIsEmpty!4537 () Bool)

(declare-fun mapRes!4537 () Bool)

(assert (=> mapIsEmpty!4537 mapRes!4537))

(declare-fun b!127813 () Bool)

(declare-fun e!83461 () Bool)

(assert (=> b!127813 (= e!83461 tp_is_empty!2851)))

(declare-fun mapNonEmpty!4537 () Bool)

(declare-fun tp!11023 () Bool)

(assert (=> mapNonEmpty!4537 (= mapRes!4537 (and tp!11023 e!83461))))

(declare-fun mapRest!4538 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapKey!4538 () (_ BitVec 32))

(declare-fun mapValue!4537 () ValueCell!1082)

(assert (=> mapNonEmpty!4537 (= (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (store mapRest!4538 mapKey!4538 mapValue!4537))))

(declare-fun b!127814 () Bool)

(declare-fun e!83467 () Bool)

(assert (=> b!127814 (= e!83457 (and e!83467 mapRes!4537))))

(declare-fun condMapEmpty!4538 () Bool)

(declare-fun mapDefault!4538 () ValueCell!1082)

(assert (=> b!127814 (= condMapEmpty!4538 (= (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4538)))))

(declare-fun b!127815 () Bool)

(declare-fun e!83468 () Bool)

(assert (=> b!127815 (= e!83462 e!83468)))

(declare-fun res!61748 () Bool)

(assert (=> b!127815 (=> (not res!61748) (not e!83468))))

(declare-datatypes ((tuple2!2536 0))(
  ( (tuple2!2537 (_1!1279 (_ BitVec 64)) (_2!1279 V!3449)) )
))
(declare-datatypes ((List!1682 0))(
  ( (Nil!1679) (Cons!1678 (h!2281 tuple2!2536) (t!6053 List!1682)) )
))
(declare-datatypes ((ListLongMap!1639 0))(
  ( (ListLongMap!1640 (toList!835 List!1682)) )
))
(declare-fun lt!66092 () ListLongMap!1639)

(declare-fun lt!66093 () ListLongMap!1639)

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!127815 (= res!61748 (and (= lt!66093 lt!66092) (not (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1386 (LongMapFixedSize!1072) ListLongMap!1639)

(assert (=> b!127815 (= lt!66092 (map!1386 newMap!16))))

(declare-fun getCurrentListMap!514 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) ListLongMap!1639)

(assert (=> b!127815 (= lt!66093 (getCurrentListMap!514 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!127817 () Bool)

(declare-fun res!61746 () Bool)

(assert (=> b!127817 (=> (not res!61746) (not e!83462))))

(assert (=> b!127817 (= res!61746 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!127818 () Bool)

(declare-fun e!83460 () Bool)

(assert (=> b!127818 (= e!83460 (and (= (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!7072 (v!3144 (underlying!443 thiss!992))))) (= (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992))))) (bvsge (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000) (bvslt (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!127819 () Bool)

(declare-fun e!83464 () Bool)

(assert (=> b!127819 (= e!83464 e!83458)))

(declare-fun b!127820 () Bool)

(assert (=> b!127820 (= e!83469 tp_is_empty!2851)))

(declare-fun b!127821 () Bool)

(declare-fun res!61745 () Bool)

(assert (=> b!127821 (=> (not res!61745) (not e!83460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!127821 (= res!61745 (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!127822 () Bool)

(assert (=> b!127822 (= e!83467 tp_is_empty!2851)))

(declare-fun b!127823 () Bool)

(declare-fun e!83465 () Bool)

(assert (=> b!127823 (= e!83465 tp_is_empty!2851)))

(declare-fun b!127824 () Bool)

(declare-fun res!61747 () Bool)

(assert (=> b!127824 (=> (not res!61747) (not e!83462))))

(assert (=> b!127824 (= res!61747 (bvsge (bvadd #b00000000000000000000000000000001 (mask!7072 newMap!16)) (_size!585 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun mapNonEmpty!4538 () Bool)

(declare-fun tp!11021 () Bool)

(assert (=> mapNonEmpty!4538 (= mapRes!4538 (and tp!11021 e!83465))))

(declare-fun mapValue!4538 () ValueCell!1082)

(declare-fun mapKey!4537 () (_ BitVec 32))

(declare-fun mapRest!4537 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4538 (= (arr!2229 (_values!2787 newMap!16)) (store mapRest!4537 mapKey!4537 mapValue!4538))))

(declare-fun mapIsEmpty!4538 () Bool)

(assert (=> mapIsEmpty!4538 mapRes!4538))

(declare-fun b!127816 () Bool)

(assert (=> b!127816 (= e!83468 e!83460)))

(declare-fun res!61744 () Bool)

(assert (=> b!127816 (=> (not res!61744) (not e!83460))))

(declare-fun contains!869 (ListLongMap!1639 (_ BitVec 64)) Bool)

(assert (=> b!127816 (= res!61744 (contains!869 lt!66092 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!2538 0))(
  ( (tuple2!2539 (_1!1280 Bool) (_2!1280 LongMapFixedSize!1072)) )
))
(declare-fun lt!66091 () tuple2!2538)

(declare-fun update!189 (LongMapFixedSize!1072 (_ BitVec 64) V!3449) tuple2!2538)

(declare-fun get!1462 (ValueCell!1082 V!3449) V!3449)

(declare-fun dynLambda!419 (Int (_ BitVec 64)) V!3449)

(assert (=> b!127816 (= lt!66091 (update!189 newMap!16 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!61749 () Bool)

(assert (=> start!13828 (=> (not res!61749) (not e!83462))))

(declare-fun valid!528 (LongMap!864) Bool)

(assert (=> start!13828 (= res!61749 (valid!528 thiss!992))))

(assert (=> start!13828 e!83462))

(declare-fun e!83456 () Bool)

(assert (=> start!13828 e!83456))

(assert (=> start!13828 true))

(declare-fun e!83463 () Bool)

(assert (=> start!13828 e!83463))

(assert (=> b!127825 (= e!83463 (and tp!11022 tp_is_empty!2851 (array_inv!1397 (_keys!4541 newMap!16)) (array_inv!1398 (_values!2787 newMap!16)) e!83470))))

(declare-fun b!127826 () Bool)

(assert (=> b!127826 (= e!83456 e!83464)))

(assert (= (and start!13828 res!61749) b!127817))

(assert (= (and b!127817 res!61746) b!127812))

(assert (= (and b!127812 res!61750) b!127824))

(assert (= (and b!127824 res!61747) b!127815))

(assert (= (and b!127815 res!61748) b!127816))

(assert (= (and b!127816 res!61744) b!127821))

(assert (= (and b!127821 res!61745) b!127818))

(assert (= (and b!127814 condMapEmpty!4538) mapIsEmpty!4537))

(assert (= (and b!127814 (not condMapEmpty!4538)) mapNonEmpty!4537))

(get-info :version)

(assert (= (and mapNonEmpty!4537 ((_ is ValueCellFull!1082) mapValue!4537)) b!127813))

(assert (= (and b!127814 ((_ is ValueCellFull!1082) mapDefault!4538)) b!127822))

(assert (= b!127810 b!127814))

(assert (= b!127819 b!127810))

(assert (= b!127826 b!127819))

(assert (= start!13828 b!127826))

(assert (= (and b!127811 condMapEmpty!4537) mapIsEmpty!4538))

(assert (= (and b!127811 (not condMapEmpty!4537)) mapNonEmpty!4538))

(assert (= (and mapNonEmpty!4538 ((_ is ValueCellFull!1082) mapValue!4538)) b!127823))

(assert (= (and b!127811 ((_ is ValueCellFull!1082) mapDefault!4537)) b!127820))

(assert (= b!127825 b!127811))

(assert (= start!13828 b!127825))

(declare-fun b_lambda!5661 () Bool)

(assert (=> (not b_lambda!5661) (not b!127816)))

(declare-fun t!6050 () Bool)

(declare-fun tb!2333 () Bool)

(assert (=> (and b!127810 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))) t!6050) tb!2333))

(declare-fun result!3869 () Bool)

(assert (=> tb!2333 (= result!3869 tp_is_empty!2851)))

(assert (=> b!127816 t!6050))

(declare-fun b_and!7893 () Bool)

(assert (= b_and!7889 (and (=> t!6050 result!3869) b_and!7893)))

(declare-fun t!6052 () Bool)

(declare-fun tb!2335 () Bool)

(assert (=> (and b!127825 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))) t!6052) tb!2335))

(declare-fun result!3873 () Bool)

(assert (= result!3873 result!3869))

(assert (=> b!127816 t!6052))

(declare-fun b_and!7895 () Bool)

(assert (= b_and!7891 (and (=> t!6052 result!3873) b_and!7895)))

(declare-fun m!149715 () Bool)

(assert (=> b!127816 m!149715))

(declare-fun m!149717 () Bool)

(assert (=> b!127816 m!149717))

(declare-fun m!149719 () Bool)

(assert (=> b!127816 m!149719))

(declare-fun m!149721 () Bool)

(assert (=> b!127816 m!149721))

(declare-fun m!149723 () Bool)

(assert (=> b!127816 m!149723))

(assert (=> b!127816 m!149721))

(assert (=> b!127816 m!149717))

(assert (=> b!127816 m!149721))

(assert (=> b!127816 m!149719))

(declare-fun m!149725 () Bool)

(assert (=> b!127816 m!149725))

(assert (=> b!127816 m!149715))

(declare-fun m!149727 () Bool)

(assert (=> mapNonEmpty!4538 m!149727))

(declare-fun m!149729 () Bool)

(assert (=> b!127810 m!149729))

(declare-fun m!149731 () Bool)

(assert (=> b!127810 m!149731))

(declare-fun m!149733 () Bool)

(assert (=> b!127825 m!149733))

(declare-fun m!149735 () Bool)

(assert (=> b!127825 m!149735))

(declare-fun m!149737 () Bool)

(assert (=> b!127821 m!149737))

(declare-fun m!149739 () Bool)

(assert (=> start!13828 m!149739))

(assert (=> b!127815 m!149721))

(declare-fun m!149741 () Bool)

(assert (=> b!127815 m!149741))

(declare-fun m!149743 () Bool)

(assert (=> b!127815 m!149743))

(declare-fun m!149745 () Bool)

(assert (=> mapNonEmpty!4537 m!149745))

(declare-fun m!149747 () Bool)

(assert (=> b!127812 m!149747))

(check-sat (not mapNonEmpty!4537) tp_is_empty!2851 b_and!7893 (not b_next!2871) (not b!127825) (not b!127815) (not b!127821) (not mapNonEmpty!4538) (not b!127810) (not b_next!2869) b_and!7895 (not b_lambda!5661) (not b!127816) (not b!127812) (not start!13828))
(check-sat b_and!7893 b_and!7895 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun b_lambda!5667 () Bool)

(assert (= b_lambda!5661 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5667)))

(check-sat (not mapNonEmpty!4537) tp_is_empty!2851 b_and!7893 (not b_next!2871) (not b!127825) (not b!127815) (not b!127821) (not b!127816) (not mapNonEmpty!4538) (not b_lambda!5667) (not b!127810) (not b_next!2869) b_and!7895 (not b!127812) (not start!13828))
(check-sat b_and!7893 b_and!7895 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun d!38779 () Bool)

(declare-fun e!83566 () Bool)

(assert (=> d!38779 e!83566))

(declare-fun res!61795 () Bool)

(assert (=> d!38779 (=> res!61795 e!83566)))

(declare-fun lt!66120 () Bool)

(assert (=> d!38779 (= res!61795 (not lt!66120))))

(declare-fun lt!66123 () Bool)

(assert (=> d!38779 (= lt!66120 lt!66123)))

(declare-datatypes ((Unit!3985 0))(
  ( (Unit!3986) )
))
(declare-fun lt!66121 () Unit!3985)

(declare-fun e!83565 () Unit!3985)

(assert (=> d!38779 (= lt!66121 e!83565)))

(declare-fun c!23433 () Bool)

(assert (=> d!38779 (= c!23433 lt!66123)))

(declare-fun containsKey!172 (List!1682 (_ BitVec 64)) Bool)

(assert (=> d!38779 (= lt!66123 (containsKey!172 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38779 (= (contains!869 lt!66092 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66120)))

(declare-fun b!127941 () Bool)

(declare-fun lt!66122 () Unit!3985)

(assert (=> b!127941 (= e!83565 lt!66122)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!120 (List!1682 (_ BitVec 64)) Unit!3985)

(assert (=> b!127941 (= lt!66122 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-datatypes ((Option!175 0))(
  ( (Some!174 (v!3150 V!3449)) (None!173) )
))
(declare-fun isDefined!121 (Option!175) Bool)

(declare-fun getValueByKey!169 (List!1682 (_ BitVec 64)) Option!175)

(assert (=> b!127941 (isDefined!121 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!127942 () Bool)

(declare-fun Unit!3987 () Unit!3985)

(assert (=> b!127942 (= e!83565 Unit!3987)))

(declare-fun b!127943 () Bool)

(assert (=> b!127943 (= e!83566 (isDefined!121 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (= (and d!38779 c!23433) b!127941))

(assert (= (and d!38779 (not c!23433)) b!127942))

(assert (= (and d!38779 (not res!61795)) b!127943))

(assert (=> d!38779 m!149721))

(declare-fun m!149817 () Bool)

(assert (=> d!38779 m!149817))

(assert (=> b!127941 m!149721))

(declare-fun m!149819 () Bool)

(assert (=> b!127941 m!149819))

(assert (=> b!127941 m!149721))

(declare-fun m!149821 () Bool)

(assert (=> b!127941 m!149821))

(assert (=> b!127941 m!149821))

(declare-fun m!149823 () Bool)

(assert (=> b!127941 m!149823))

(assert (=> b!127943 m!149721))

(assert (=> b!127943 m!149821))

(assert (=> b!127943 m!149821))

(assert (=> b!127943 m!149823))

(assert (=> b!127816 d!38779))

(declare-datatypes ((SeekEntryResult!265 0))(
  ( (MissingZero!265 (index!3216 (_ BitVec 32))) (Found!265 (index!3217 (_ BitVec 32))) (Intermediate!265 (undefined!1077 Bool) (index!3218 (_ BitVec 32)) (x!15116 (_ BitVec 32))) (Undefined!265) (MissingVacant!265 (index!3219 (_ BitVec 32))) )
))
(declare-fun lt!66190 () SeekEntryResult!265)

(declare-fun b!128028 () Bool)

(declare-fun e!83630 () Bool)

(assert (=> b!128028 (= e!83630 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66190)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128029 () Bool)

(declare-fun c!23464 () Bool)

(declare-fun lt!66186 () SeekEntryResult!265)

(assert (=> b!128029 (= c!23464 ((_ is MissingVacant!265) lt!66186))))

(declare-fun e!83625 () Bool)

(declare-fun e!83616 () Bool)

(assert (=> b!128029 (= e!83625 e!83616)))

(declare-fun bm!13791 () Bool)

(declare-fun call!13802 () Bool)

(declare-fun call!13816 () Bool)

(assert (=> bm!13791 (= call!13802 call!13816)))

(declare-fun b!128030 () Bool)

(declare-fun e!83619 () Unit!3985)

(declare-fun lt!66183 () Unit!3985)

(assert (=> b!128030 (= e!83619 lt!66183)))

(declare-fun call!13807 () Unit!3985)

(assert (=> b!128030 (= lt!66183 call!13807)))

(declare-fun lt!66179 () SeekEntryResult!265)

(declare-fun call!13815 () SeekEntryResult!265)

(assert (=> b!128030 (= lt!66179 call!13815)))

(declare-fun res!61826 () Bool)

(assert (=> b!128030 (= res!61826 ((_ is Found!265) lt!66179))))

(declare-fun e!83626 () Bool)

(assert (=> b!128030 (=> (not res!61826) (not e!83626))))

(assert (=> b!128030 e!83626))

(declare-fun b!128031 () Bool)

(declare-fun c!23465 () Bool)

(declare-fun lt!66201 () SeekEntryResult!265)

(assert (=> b!128031 (= c!23465 ((_ is MissingVacant!265) lt!66201))))

(declare-fun e!83617 () Bool)

(declare-fun e!83632 () Bool)

(assert (=> b!128031 (= e!83617 e!83632)))

(declare-fun b!128032 () Bool)

(declare-fun e!83628 () tuple2!2538)

(declare-fun lt!66197 () tuple2!2538)

(assert (=> b!128032 (= e!83628 (tuple2!2539 (_1!1280 lt!66197) (_2!1280 lt!66197)))))

(declare-fun call!13808 () tuple2!2538)

(assert (=> b!128032 (= lt!66197 call!13808)))

(declare-fun bm!13792 () Bool)

(declare-fun call!13796 () Bool)

(declare-fun call!13811 () Bool)

(assert (=> bm!13792 (= call!13796 call!13811)))

(declare-fun b!128033 () Bool)

(declare-fun e!83613 () Bool)

(assert (=> b!128033 (= e!83632 e!83613)))

(declare-fun res!61831 () Bool)

(declare-fun call!13814 () Bool)

(assert (=> b!128033 (= res!61831 call!13814)))

(assert (=> b!128033 (=> (not res!61831) (not e!83613))))

(declare-fun b!128034 () Bool)

(declare-fun e!83629 () tuple2!2538)

(declare-fun e!83631 () tuple2!2538)

(assert (=> b!128034 (= e!83629 e!83631)))

(declare-fun c!23467 () Bool)

(assert (=> b!128034 (= c!23467 (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13793 () Bool)

(declare-fun c!23466 () Bool)

(declare-fun c!23471 () Bool)

(assert (=> bm!13793 (= c!23466 c!23471)))

(declare-fun e!83614 () ListLongMap!1639)

(declare-fun lt!66202 () SeekEntryResult!265)

(declare-fun call!13799 () Bool)

(assert (=> bm!13793 (= call!13799 (contains!869 e!83614 (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(declare-fun b!128035 () Bool)

(declare-fun lt!66195 () Unit!3985)

(declare-fun lt!66181 () Unit!3985)

(assert (=> b!128035 (= lt!66195 lt!66181)))

(assert (=> b!128035 call!13799))

(declare-fun lt!66194 () array!4709)

(declare-fun lemmaValidKeyInArrayIsInListMap!117 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) Unit!3985)

(assert (=> b!128035 (= lt!66181 (lemmaValidKeyInArrayIsInListMap!117 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128035 (= lt!66194 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))))

(declare-fun lt!66182 () Unit!3985)

(declare-fun lt!66192 () Unit!3985)

(assert (=> b!128035 (= lt!66182 lt!66192)))

(declare-fun call!13800 () ListLongMap!1639)

(declare-fun call!13805 () ListLongMap!1639)

(assert (=> b!128035 (= call!13800 call!13805)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3985)

(assert (=> b!128035 (= lt!66192 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66204 () Unit!3985)

(assert (=> b!128035 (= lt!66204 e!83619)))

(declare-fun c!23473 () Bool)

(assert (=> b!128035 (= c!23473 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun e!83618 () tuple2!2538)

(assert (=> b!128035 (= e!83618 (tuple2!2539 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (_size!585 newMap!16) (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (_vacant!585 newMap!16))))))

(declare-fun b!128036 () Bool)

(declare-fun e!83621 () Unit!3985)

(declare-fun Unit!3988 () Unit!3985)

(assert (=> b!128036 (= e!83621 Unit!3988)))

(declare-fun lt!66180 () Unit!3985)

(assert (=> b!128036 (= lt!66180 call!13807)))

(declare-fun call!13809 () SeekEntryResult!265)

(assert (=> b!128036 (= lt!66190 call!13809)))

(declare-fun res!61828 () Bool)

(assert (=> b!128036 (= res!61828 ((_ is Found!265) lt!66190))))

(assert (=> b!128036 (=> (not res!61828) (not e!83630))))

(assert (=> b!128036 e!83630))

(declare-fun lt!66178 () Unit!3985)

(assert (=> b!128036 (= lt!66178 lt!66180)))

(assert (=> b!128036 false))

(declare-fun d!38781 () Bool)

(declare-fun e!83612 () Bool)

(assert (=> d!38781 e!83612))

(declare-fun res!61834 () Bool)

(assert (=> d!38781 (=> (not res!61834) (not e!83612))))

(declare-fun lt!66196 () tuple2!2538)

(assert (=> d!38781 (= res!61834 (valid!527 (_2!1280 lt!66196)))))

(assert (=> d!38781 (= lt!66196 e!83629)))

(declare-fun c!23474 () Bool)

(assert (=> d!38781 (= c!23474 (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvneg (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (=> d!38781 (valid!527 newMap!16)))

(assert (=> d!38781 (= (update!189 newMap!16 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!66196)))

(declare-fun b!128037 () Bool)

(declare-fun res!61830 () Bool)

(declare-fun e!83623 () Bool)

(assert (=> b!128037 (=> (not res!61830) (not e!83623))))

(assert (=> b!128037 (= res!61830 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66201)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128038 () Bool)

(declare-fun e!83627 () Bool)

(declare-fun call!13798 () Bool)

(assert (=> b!128038 (= e!83627 (not call!13798))))

(declare-fun call!13804 () Unit!3985)

(declare-fun bm!13794 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3985)

(assert (=> bm!13794 (= call!13804 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun bm!13795 () Bool)

(declare-fun call!13812 () ListLongMap!1639)

(assert (=> bm!13795 (= call!13812 call!13800)))

(declare-fun b!128039 () Bool)

(declare-fun e!83624 () Bool)

(declare-fun call!13817 () ListLongMap!1639)

(declare-fun call!13795 () ListLongMap!1639)

(assert (=> b!128039 (= e!83624 (= call!13817 call!13795))))

(declare-fun bm!13796 () Bool)

(declare-fun call!13797 () SeekEntryResult!265)

(assert (=> bm!13796 (= call!13809 call!13797)))

(declare-fun call!13813 () ListLongMap!1639)

(declare-fun bm!13797 () Bool)

(declare-fun lt!66185 () (_ BitVec 32))

(assert (=> bm!13797 (= call!13813 (getCurrentListMap!514 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128040 () Bool)

(declare-fun res!61827 () Bool)

(assert (=> b!128040 (= res!61827 call!13802)))

(assert (=> b!128040 (=> (not res!61827) (not e!83630))))

(declare-fun bm!13798 () Bool)

(assert (=> bm!13798 (= call!13805 call!13813)))

(declare-fun b!128041 () Bool)

(declare-fun e!83611 () ListLongMap!1639)

(declare-fun call!13806 () ListLongMap!1639)

(declare-fun call!13810 () ListLongMap!1639)

(assert (=> b!128041 (= e!83611 (ite c!23467 call!13806 call!13810))))

(declare-fun b!128042 () Bool)

(declare-fun lt!66198 () Unit!3985)

(assert (=> b!128042 (= lt!66198 e!83621)))

(declare-fun c!23469 () Bool)

(assert (=> b!128042 (= c!23469 call!13799)))

(declare-fun e!83615 () tuple2!2538)

(assert (=> b!128042 (= e!83615 (tuple2!2539 false newMap!16))))

(declare-fun bm!13799 () Bool)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3985)

(assert (=> bm!13799 (= call!13807 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun b!128043 () Bool)

(assert (=> b!128043 (= e!83623 (not call!13796))))

(declare-fun b!128044 () Bool)

(declare-fun Unit!3989 () Unit!3985)

(assert (=> b!128044 (= e!83619 Unit!3989)))

(declare-fun lt!66193 () Unit!3985)

(assert (=> b!128044 (= lt!66193 call!13804)))

(assert (=> b!128044 (= lt!66201 call!13815)))

(declare-fun c!23463 () Bool)

(assert (=> b!128044 (= c!23463 ((_ is MissingZero!265) lt!66201))))

(assert (=> b!128044 e!83617))

(declare-fun lt!66200 () Unit!3985)

(assert (=> b!128044 (= lt!66200 lt!66193)))

(assert (=> b!128044 false))

(declare-fun b!128045 () Bool)

(assert (=> b!128045 (= e!83611 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128046 () Bool)

(assert (=> b!128046 (= e!83614 call!13805)))

(declare-fun bm!13800 () Bool)

(declare-fun c!23470 () Bool)

(declare-fun updateHelperNewKey!57 (LongMapFixedSize!1072 (_ BitVec 64) V!3449 (_ BitVec 32)) tuple2!2538)

(assert (=> bm!13800 (= call!13808 (updateHelperNewKey!57 newMap!16 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(declare-fun b!128047 () Bool)

(declare-fun res!61837 () Bool)

(assert (=> b!128047 (=> (not res!61837) (not e!83627))))

(assert (=> b!128047 (= res!61837 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128048 () Bool)

(declare-fun lt!66199 () Unit!3985)

(declare-fun lt!66187 () Unit!3985)

(assert (=> b!128048 (= lt!66199 lt!66187)))

(assert (=> b!128048 (= call!13812 call!13810)))

(declare-fun lt!66184 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!57 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3985)

(assert (=> b!128048 (= lt!66187 (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66184 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128048 (= lt!66184 (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000001))))

(assert (=> b!128048 (= e!83631 (tuple2!2539 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7072 newMap!16) (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (_size!585 newMap!16) (_keys!4541 newMap!16) (_values!2787 newMap!16) (_vacant!585 newMap!16))))))

(declare-fun bm!13801 () Bool)

(assert (=> bm!13801 (= call!13817 (map!1386 (_2!1280 lt!66196)))))

(declare-fun b!128049 () Bool)

(declare-fun e!83622 () Bool)

(assert (=> b!128049 (= e!83624 e!83622)))

(declare-fun res!61833 () Bool)

(assert (=> b!128049 (= res!61833 (contains!869 call!13817 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128049 (=> (not res!61833) (not e!83622))))

(declare-fun b!128050 () Bool)

(assert (=> b!128050 (= e!83629 e!83615)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!4707 (_ BitVec 32)) SeekEntryResult!265)

(assert (=> b!128050 (= lt!66202 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(assert (=> b!128050 (= c!23471 ((_ is Undefined!265) lt!66202))))

(declare-fun b!128051 () Bool)

(declare-fun +!165 (ListLongMap!1639 tuple2!2536) ListLongMap!1639)

(assert (=> b!128051 (= e!83622 (= call!13817 (+!165 call!13795 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128052 () Bool)

(declare-fun res!61824 () Bool)

(assert (=> b!128052 (=> (not res!61824) (not e!83627))))

(declare-fun call!13794 () Bool)

(assert (=> b!128052 (= res!61824 call!13794)))

(assert (=> b!128052 (= e!83625 e!83627)))

(declare-fun bm!13802 () Bool)

(declare-fun call!13803 () ListLongMap!1639)

(assert (=> bm!13802 (= call!13810 call!13803)))

(declare-fun bm!13803 () Bool)

(assert (=> bm!13803 (= call!13798 call!13811)))

(declare-fun bm!13804 () Bool)

(assert (=> bm!13804 (= call!13795 (map!1386 newMap!16))))

(declare-fun b!128053 () Bool)

(assert (=> b!128053 (= e!83628 e!83618)))

(declare-fun c!23468 () Bool)

(assert (=> b!128053 (= c!23468 ((_ is MissingZero!265) lt!66202))))

(declare-fun bm!13805 () Bool)

(assert (=> bm!13805 (= call!13815 call!13797)))

(declare-fun b!128054 () Bool)

(declare-fun lt!66191 () Unit!3985)

(declare-fun lt!66188 () Unit!3985)

(assert (=> b!128054 (= lt!66191 lt!66188)))

(assert (=> b!128054 (= call!13812 call!13806)))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3985)

(assert (=> b!128054 (= lt!66188 (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128054 (= lt!66185 (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!128054 (= e!83631 (tuple2!2539 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7072 newMap!16) (bvor (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!585 newMap!16) (_keys!4541 newMap!16) (_values!2787 newMap!16) (_vacant!585 newMap!16))))))

(declare-fun b!128055 () Bool)

(assert (=> b!128055 (= e!83626 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66179)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun bm!13806 () Bool)

(declare-fun c!23462 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!13806 (= call!13816 (inRange!0 (ite c!23471 (ite c!23469 (index!3217 lt!66190) (ite c!23462 (index!3216 lt!66186) (index!3219 lt!66186))) (ite c!23473 (index!3217 lt!66179) (ite c!23463 (index!3216 lt!66201) (index!3219 lt!66201)))) (mask!7072 newMap!16)))))

(declare-fun bm!13807 () Bool)

(declare-fun call!13801 () Bool)

(assert (=> bm!13807 (= call!13801 call!13816)))

(declare-fun b!128056 () Bool)

(declare-fun lt!66189 () tuple2!2538)

(assert (=> b!128056 (= lt!66189 call!13808)))

(assert (=> b!128056 (= e!83618 (tuple2!2539 (_1!1280 lt!66189) (_2!1280 lt!66189)))))

(declare-fun b!128057 () Bool)

(declare-fun res!61836 () Bool)

(assert (=> b!128057 (= res!61836 call!13801)))

(assert (=> b!128057 (=> (not res!61836) (not e!83626))))

(declare-fun b!128058 () Bool)

(declare-fun e!83620 () Bool)

(assert (=> b!128058 (= e!83620 (not call!13798))))

(declare-fun bm!13808 () Bool)

(assert (=> bm!13808 (= call!13794 call!13802)))

(declare-fun bm!13809 () Bool)

(declare-fun arrayContainsKey!0 (array!4707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!13809 (= call!13811 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128059 () Bool)

(assert (=> b!128059 (= e!83613 (not call!13796))))

(declare-fun b!128060 () Bool)

(assert (=> b!128060 (= e!83614 call!13803)))

(declare-fun b!128061 () Bool)

(declare-fun res!61825 () Bool)

(assert (=> b!128061 (=> (not res!61825) (not e!83623))))

(assert (=> b!128061 (= res!61825 call!13814)))

(assert (=> b!128061 (= e!83617 e!83623)))

(declare-fun bm!13810 () Bool)

(assert (=> bm!13810 (= call!13814 call!13801)))

(declare-fun b!128062 () Bool)

(assert (=> b!128062 (= e!83616 e!83620)))

(declare-fun res!61829 () Bool)

(assert (=> b!128062 (= res!61829 call!13794)))

(assert (=> b!128062 (=> (not res!61829) (not e!83620))))

(declare-fun b!128063 () Bool)

(declare-fun res!61832 () Bool)

(assert (=> b!128063 (= res!61832 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128063 (=> (not res!61832) (not e!83620))))

(declare-fun bm!13811 () Bool)

(assert (=> bm!13811 (= call!13803 (getCurrentListMap!514 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128064 () Bool)

(assert (=> b!128064 (= e!83632 ((_ is Undefined!265) lt!66201))))

(declare-fun b!128065 () Bool)

(declare-fun lt!66203 () Unit!3985)

(assert (=> b!128065 (= e!83621 lt!66203)))

(assert (=> b!128065 (= lt!66203 call!13804)))

(assert (=> b!128065 (= lt!66186 call!13809)))

(assert (=> b!128065 (= c!23462 ((_ is MissingZero!265) lt!66186))))

(assert (=> b!128065 e!83625))

(declare-fun b!128066 () Bool)

(declare-fun res!61835 () Bool)

(assert (=> b!128066 (= res!61835 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66201)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128066 (=> (not res!61835) (not e!83613))))

(declare-fun bm!13812 () Bool)

(assert (=> bm!13812 (= call!13797 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128067 () Bool)

(assert (=> b!128067 (= e!83616 ((_ is Undefined!265) lt!66186))))

(declare-fun bm!13813 () Bool)

(assert (=> bm!13813 (= call!13800 (+!165 e!83611 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23475 () Bool)

(assert (=> bm!13813 (= c!23475 c!23474)))

(declare-fun bm!13814 () Bool)

(assert (=> bm!13814 (= call!13806 call!13813)))

(declare-fun b!128068 () Bool)

(assert (=> b!128068 (= c!23470 ((_ is MissingVacant!265) lt!66202))))

(assert (=> b!128068 (= e!83615 e!83628)))

(declare-fun b!128069 () Bool)

(assert (=> b!128069 (= e!83612 e!83624)))

(declare-fun c!23472 () Bool)

(assert (=> b!128069 (= c!23472 (_1!1280 lt!66196))))

(assert (= (and d!38781 c!23474) b!128034))

(assert (= (and d!38781 (not c!23474)) b!128050))

(assert (= (and b!128034 c!23467) b!128048))

(assert (= (and b!128034 (not c!23467)) b!128054))

(assert (= (or b!128048 b!128054) bm!13814))

(assert (= (or b!128048 b!128054) bm!13802))

(assert (= (or b!128048 b!128054) bm!13795))

(assert (= (and b!128050 c!23471) b!128042))

(assert (= (and b!128050 (not c!23471)) b!128068))

(assert (= (and b!128042 c!23469) b!128036))

(assert (= (and b!128042 (not c!23469)) b!128065))

(assert (= (and b!128036 res!61828) b!128040))

(assert (= (and b!128040 res!61827) b!128028))

(assert (= (and b!128065 c!23462) b!128052))

(assert (= (and b!128065 (not c!23462)) b!128029))

(assert (= (and b!128052 res!61824) b!128047))

(assert (= (and b!128047 res!61837) b!128038))

(assert (= (and b!128029 c!23464) b!128062))

(assert (= (and b!128029 (not c!23464)) b!128067))

(assert (= (and b!128062 res!61829) b!128063))

(assert (= (and b!128063 res!61832) b!128058))

(assert (= (or b!128052 b!128062) bm!13808))

(assert (= (or b!128038 b!128058) bm!13803))

(assert (= (or b!128040 bm!13808) bm!13791))

(assert (= (or b!128036 b!128065) bm!13796))

(assert (= (and b!128068 c!23470) b!128032))

(assert (= (and b!128068 (not c!23470)) b!128053))

(assert (= (and b!128053 c!23468) b!128056))

(assert (= (and b!128053 (not c!23468)) b!128035))

(assert (= (and b!128035 c!23473) b!128030))

(assert (= (and b!128035 (not c!23473)) b!128044))

(assert (= (and b!128030 res!61826) b!128057))

(assert (= (and b!128057 res!61836) b!128055))

(assert (= (and b!128044 c!23463) b!128061))

(assert (= (and b!128044 (not c!23463)) b!128031))

(assert (= (and b!128061 res!61825) b!128037))

(assert (= (and b!128037 res!61830) b!128043))

(assert (= (and b!128031 c!23465) b!128033))

(assert (= (and b!128031 (not c!23465)) b!128064))

(assert (= (and b!128033 res!61831) b!128066))

(assert (= (and b!128066 res!61835) b!128059))

(assert (= (or b!128061 b!128033) bm!13810))

(assert (= (or b!128043 b!128059) bm!13792))

(assert (= (or b!128057 bm!13810) bm!13807))

(assert (= (or b!128030 b!128044) bm!13805))

(assert (= (or b!128032 b!128056) bm!13800))

(assert (= (or bm!13791 bm!13807) bm!13806))

(assert (= (or b!128036 b!128030) bm!13799))

(assert (= (or b!128065 b!128044) bm!13794))

(assert (= (or bm!13803 bm!13792) bm!13809))

(assert (= (or bm!13796 bm!13805) bm!13812))

(assert (= (or b!128042 b!128035) bm!13798))

(assert (= (or b!128042 b!128035) bm!13793))

(assert (= (and bm!13793 c!23466) b!128046))

(assert (= (and bm!13793 (not c!23466)) b!128060))

(assert (= (or bm!13802 b!128060) bm!13811))

(assert (= (or bm!13814 bm!13798) bm!13797))

(assert (= (or bm!13795 b!128035) bm!13813))

(assert (= (and bm!13813 c!23475) b!128041))

(assert (= (and bm!13813 (not c!23475)) b!128045))

(assert (= (and d!38781 res!61834) b!128069))

(assert (= (and b!128069 c!23472) b!128049))

(assert (= (and b!128069 (not c!23472)) b!128039))

(assert (= (and b!128049 res!61833) b!128051))

(assert (= (or b!128049 b!128051 b!128039) bm!13801))

(assert (= (or b!128051 b!128039) bm!13804))

(assert (=> bm!13794 m!149721))

(declare-fun m!149825 () Bool)

(assert (=> bm!13794 m!149825))

(declare-fun m!149827 () Bool)

(assert (=> b!128037 m!149827))

(assert (=> b!128054 m!149719))

(declare-fun m!149829 () Bool)

(assert (=> b!128054 m!149829))

(declare-fun m!149831 () Bool)

(assert (=> bm!13811 m!149831))

(declare-fun m!149833 () Bool)

(assert (=> b!128047 m!149833))

(assert (=> b!128049 m!149721))

(declare-fun m!149835 () Bool)

(assert (=> b!128049 m!149835))

(declare-fun m!149837 () Bool)

(assert (=> bm!13806 m!149837))

(declare-fun m!149839 () Bool)

(assert (=> bm!13797 m!149839))

(declare-fun m!149841 () Bool)

(assert (=> bm!13797 m!149841))

(assert (=> b!128048 m!149719))

(declare-fun m!149843 () Bool)

(assert (=> b!128048 m!149843))

(declare-fun m!149845 () Bool)

(assert (=> b!128028 m!149845))

(assert (=> bm!13799 m!149721))

(declare-fun m!149847 () Bool)

(assert (=> bm!13799 m!149847))

(assert (=> bm!13800 m!149721))

(assert (=> bm!13800 m!149719))

(declare-fun m!149849 () Bool)

(assert (=> bm!13800 m!149849))

(assert (=> b!128050 m!149721))

(declare-fun m!149851 () Bool)

(assert (=> b!128050 m!149851))

(declare-fun m!149853 () Bool)

(assert (=> b!128055 m!149853))

(declare-fun m!149855 () Bool)

(assert (=> bm!13813 m!149855))

(declare-fun m!149857 () Bool)

(assert (=> b!128066 m!149857))

(assert (=> bm!13804 m!149741))

(declare-fun m!149859 () Bool)

(assert (=> b!128045 m!149859))

(assert (=> b!128035 m!149721))

(assert (=> b!128035 m!149719))

(declare-fun m!149861 () Bool)

(assert (=> b!128035 m!149861))

(assert (=> b!128035 m!149839))

(declare-fun m!149863 () Bool)

(assert (=> b!128035 m!149863))

(assert (=> b!128035 m!149859))

(assert (=> b!128035 m!149859))

(assert (=> b!128035 m!149721))

(declare-fun m!149865 () Bool)

(assert (=> b!128035 m!149865))

(declare-fun m!149867 () Bool)

(assert (=> b!128051 m!149867))

(declare-fun m!149869 () Bool)

(assert (=> b!128063 m!149869))

(declare-fun m!149871 () Bool)

(assert (=> bm!13793 m!149871))

(declare-fun m!149873 () Bool)

(assert (=> bm!13793 m!149873))

(declare-fun m!149875 () Bool)

(assert (=> bm!13801 m!149875))

(assert (=> bm!13809 m!149721))

(declare-fun m!149877 () Bool)

(assert (=> bm!13809 m!149877))

(declare-fun m!149879 () Bool)

(assert (=> d!38781 m!149879))

(assert (=> d!38781 m!149747))

(assert (=> bm!13812 m!149721))

(assert (=> bm!13812 m!149851))

(assert (=> b!127816 d!38781))

(declare-fun d!38783 () Bool)

(declare-fun c!23478 () Bool)

(assert (=> d!38783 (= c!23478 ((_ is ValueCellFull!1082) (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun e!83635 () V!3449)

(assert (=> d!38783 (= (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83635)))

(declare-fun b!128074 () Bool)

(declare-fun get!1464 (ValueCell!1082 V!3449) V!3449)

(assert (=> b!128074 (= e!83635 (get!1464 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128075 () Bool)

(declare-fun get!1465 (ValueCell!1082 V!3449) V!3449)

(assert (=> b!128075 (= e!83635 (get!1465 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38783 c!23478) b!128074))

(assert (= (and d!38783 (not c!23478)) b!128075))

(assert (=> b!128074 m!149715))

(assert (=> b!128074 m!149717))

(declare-fun m!149881 () Bool)

(assert (=> b!128074 m!149881))

(assert (=> b!128075 m!149715))

(assert (=> b!128075 m!149717))

(declare-fun m!149883 () Bool)

(assert (=> b!128075 m!149883))

(assert (=> b!127816 d!38783))

(declare-fun d!38785 () Bool)

(assert (=> d!38785 (= (valid!528 thiss!992) (valid!527 (v!3144 (underlying!443 thiss!992))))))

(declare-fun bs!5312 () Bool)

(assert (= bs!5312 d!38785))

(declare-fun m!149885 () Bool)

(assert (=> bs!5312 m!149885))

(assert (=> start!13828 d!38785))

(declare-fun d!38787 () Bool)

(assert (=> d!38787 (= (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992)))) (and (or (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000001111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000011111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000001111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000011111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000001111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000011111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000001111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000011111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000001111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000011111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000001111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000011111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000001111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000011111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000001111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000011111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000111111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00001111111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00011111111111111111111111111111) (= (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!127821 d!38787))

(declare-fun d!38789 () Bool)

(assert (=> d!38789 (= (array_inv!1397 (_keys!4541 newMap!16)) (bvsge (size!2493 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127825 d!38789))

(declare-fun d!38791 () Bool)

(assert (=> d!38791 (= (array_inv!1398 (_values!2787 newMap!16)) (bvsge (size!2494 (_values!2787 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!127825 d!38791))

(declare-fun d!38793 () Bool)

(assert (=> d!38793 (= (array_inv!1397 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvsge (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127810 d!38793))

(declare-fun d!38795 () Bool)

(assert (=> d!38795 (= (array_inv!1398 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvsge (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!127810 d!38795))

(declare-fun d!38797 () Bool)

(declare-fun res!61844 () Bool)

(declare-fun e!83638 () Bool)

(assert (=> d!38797 (=> (not res!61844) (not e!83638))))

(declare-fun simpleValid!88 (LongMapFixedSize!1072) Bool)

(assert (=> d!38797 (= res!61844 (simpleValid!88 newMap!16))))

(assert (=> d!38797 (= (valid!527 newMap!16) e!83638)))

(declare-fun b!128082 () Bool)

(declare-fun res!61845 () Bool)

(assert (=> b!128082 (=> (not res!61845) (not e!83638))))

(declare-fun arrayCountValidKeys!0 (array!4707 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!128082 (= res!61845 (= (arrayCountValidKeys!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (_size!585 newMap!16)))))

(declare-fun b!128083 () Bool)

(declare-fun res!61846 () Bool)

(assert (=> b!128083 (=> (not res!61846) (not e!83638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!4707 (_ BitVec 32)) Bool)

(assert (=> b!128083 (= res!61846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128084 () Bool)

(declare-datatypes ((List!1684 0))(
  ( (Nil!1681) (Cons!1680 (h!2283 (_ BitVec 64)) (t!6063 List!1684)) )
))
(declare-fun arrayNoDuplicates!0 (array!4707 (_ BitVec 32) List!1684) Bool)

(assert (=> b!128084 (= e!83638 (arrayNoDuplicates!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!38797 res!61844) b!128082))

(assert (= (and b!128082 res!61845) b!128083))

(assert (= (and b!128083 res!61846) b!128084))

(declare-fun m!149887 () Bool)

(assert (=> d!38797 m!149887))

(declare-fun m!149889 () Bool)

(assert (=> b!128082 m!149889))

(declare-fun m!149891 () Bool)

(assert (=> b!128083 m!149891))

(declare-fun m!149893 () Bool)

(assert (=> b!128084 m!149893))

(assert (=> b!127812 d!38797))

(declare-fun d!38799 () Bool)

(assert (=> d!38799 (= (map!1386 newMap!16) (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun bs!5313 () Bool)

(assert (= bs!5313 d!38799))

(assert (=> bs!5313 m!149859))

(assert (=> b!127815 d!38799))

(declare-fun bm!13829 () Bool)

(declare-fun call!13838 () ListLongMap!1639)

(declare-fun call!13835 () ListLongMap!1639)

(assert (=> bm!13829 (= call!13838 call!13835)))

(declare-fun b!128127 () Bool)

(declare-fun res!61871 () Bool)

(declare-fun e!83666 () Bool)

(assert (=> b!128127 (=> (not res!61871) (not e!83666))))

(declare-fun e!83675 () Bool)

(assert (=> b!128127 (= res!61871 e!83675)))

(declare-fun c!23494 () Bool)

(assert (=> b!128127 (= c!23494 (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128128 () Bool)

(declare-fun e!83669 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!128128 (= e!83669 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128129 () Bool)

(declare-fun e!83671 () ListLongMap!1639)

(declare-fun e!83676 () ListLongMap!1639)

(assert (=> b!128129 (= e!83671 e!83676)))

(declare-fun c!23496 () Bool)

(assert (=> b!128129 (= c!23496 (and (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128130 () Bool)

(declare-fun call!13836 () Bool)

(assert (=> b!128130 (= e!83675 (not call!13836))))

(declare-fun bm!13830 () Bool)

(declare-fun lt!66270 () ListLongMap!1639)

(assert (=> bm!13830 (= call!13836 (contains!869 lt!66270 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13831 () Bool)

(declare-fun call!13833 () ListLongMap!1639)

(declare-fun call!13837 () ListLongMap!1639)

(assert (=> bm!13831 (= call!13833 call!13837)))

(declare-fun b!128131 () Bool)

(declare-fun e!83673 () Bool)

(assert (=> b!128131 (= e!83673 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128132 () Bool)

(declare-fun e!83665 () Bool)

(declare-fun apply!112 (ListLongMap!1639 (_ BitVec 64)) V!3449)

(assert (=> b!128132 (= e!83665 (= (apply!112 lt!66270 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!128133 () Bool)

(assert (=> b!128133 (= e!83675 e!83665)))

(declare-fun res!61866 () Bool)

(assert (=> b!128133 (= res!61866 call!13836)))

(assert (=> b!128133 (=> (not res!61866) (not e!83665))))

(declare-fun d!38801 () Bool)

(assert (=> d!38801 e!83666))

(declare-fun res!61867 () Bool)

(assert (=> d!38801 (=> (not res!61867) (not e!83666))))

(assert (=> d!38801 (= res!61867 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun lt!66258 () ListLongMap!1639)

(assert (=> d!38801 (= lt!66270 lt!66258)))

(declare-fun lt!66262 () Unit!3985)

(declare-fun e!83672 () Unit!3985)

(assert (=> d!38801 (= lt!66262 e!83672)))

(declare-fun c!23495 () Bool)

(assert (=> d!38801 (= c!23495 e!83669)))

(declare-fun res!61868 () Bool)

(assert (=> d!38801 (=> (not res!61868) (not e!83669))))

(assert (=> d!38801 (= res!61868 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!38801 (= lt!66258 e!83671)))

(declare-fun c!23492 () Bool)

(assert (=> d!38801 (= c!23492 (and (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38801 (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992))))))

(assert (=> d!38801 (= (getCurrentListMap!514 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))) lt!66270)))

(declare-fun b!128134 () Bool)

(declare-fun Unit!3990 () Unit!3985)

(assert (=> b!128134 (= e!83672 Unit!3990)))

(declare-fun bm!13832 () Bool)

(declare-fun call!13832 () Bool)

(assert (=> bm!13832 (= call!13832 (contains!869 lt!66270 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128135 () Bool)

(declare-fun e!83668 () ListLongMap!1639)

(assert (=> b!128135 (= e!83668 call!13838)))

(declare-fun b!128136 () Bool)

(declare-fun e!83667 () Bool)

(assert (=> b!128136 (= e!83667 (not call!13832))))

(declare-fun b!128137 () Bool)

(declare-fun e!83670 () Bool)

(declare-fun e!83674 () Bool)

(assert (=> b!128137 (= e!83670 e!83674)))

(declare-fun res!61872 () Bool)

(assert (=> b!128137 (=> (not res!61872) (not e!83674))))

(assert (=> b!128137 (= res!61872 (contains!869 lt!66270 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128137 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun bm!13833 () Bool)

(declare-fun call!13834 () ListLongMap!1639)

(declare-fun getCurrentListMapNoExtraKeys!132 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) ListLongMap!1639)

(assert (=> bm!13833 (= call!13834 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!128138 () Bool)

(assert (=> b!128138 (= e!83671 (+!165 call!13835 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun bm!13834 () Bool)

(assert (=> bm!13834 (= call!13837 call!13834)))

(declare-fun b!128139 () Bool)

(assert (=> b!128139 (= e!83666 e!83667)))

(declare-fun c!23493 () Bool)

(assert (=> b!128139 (= c!23493 (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128140 () Bool)

(assert (=> b!128140 (= e!83674 (= (apply!112 lt!66270 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128140 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> b!128140 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128141 () Bool)

(declare-fun res!61873 () Bool)

(assert (=> b!128141 (=> (not res!61873) (not e!83666))))

(assert (=> b!128141 (= res!61873 e!83670)))

(declare-fun res!61865 () Bool)

(assert (=> b!128141 (=> res!61865 e!83670)))

(assert (=> b!128141 (= res!61865 (not e!83673))))

(declare-fun res!61870 () Bool)

(assert (=> b!128141 (=> (not res!61870) (not e!83673))))

(assert (=> b!128141 (= res!61870 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun bm!13835 () Bool)

(assert (=> bm!13835 (= call!13835 (+!165 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128142 () Bool)

(declare-fun lt!66249 () Unit!3985)

(assert (=> b!128142 (= e!83672 lt!66249)))

(declare-fun lt!66251 () ListLongMap!1639)

(assert (=> b!128142 (= lt!66251 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun lt!66255 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66255 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66252 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66252 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66269 () Unit!3985)

(declare-fun addStillContains!88 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> b!128142 (= lt!66269 (addStillContains!88 lt!66251 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66252))))

(assert (=> b!128142 (contains!869 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66252)))

(declare-fun lt!66256 () Unit!3985)

(assert (=> b!128142 (= lt!66256 lt!66269)))

(declare-fun lt!66268 () ListLongMap!1639)

(assert (=> b!128142 (= lt!66268 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun lt!66254 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66254 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66263 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66263 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66264 () Unit!3985)

(declare-fun addApplyDifferent!88 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> b!128142 (= lt!66264 (addApplyDifferent!88 lt!66268 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66263))))

(assert (=> b!128142 (= (apply!112 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66263) (apply!112 lt!66268 lt!66263))))

(declare-fun lt!66260 () Unit!3985)

(assert (=> b!128142 (= lt!66260 lt!66264)))

(declare-fun lt!66265 () ListLongMap!1639)

(assert (=> b!128142 (= lt!66265 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun lt!66266 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66266 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66257 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66257 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!66259 () Unit!3985)

(assert (=> b!128142 (= lt!66259 (addApplyDifferent!88 lt!66265 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66257))))

(assert (=> b!128142 (= (apply!112 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66257) (apply!112 lt!66265 lt!66257))))

(declare-fun lt!66253 () Unit!3985)

(assert (=> b!128142 (= lt!66253 lt!66259)))

(declare-fun lt!66267 () ListLongMap!1639)

(assert (=> b!128142 (= lt!66267 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun lt!66261 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66261 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66250 () (_ BitVec 64))

(assert (=> b!128142 (= lt!66250 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!128142 (= lt!66249 (addApplyDifferent!88 lt!66267 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66250))))

(assert (=> b!128142 (= (apply!112 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66250) (apply!112 lt!66267 lt!66250))))

(declare-fun b!128143 () Bool)

(assert (=> b!128143 (= e!83668 call!13833)))

(declare-fun b!128144 () Bool)

(declare-fun e!83677 () Bool)

(assert (=> b!128144 (= e!83677 (= (apply!112 lt!66270 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!128145 () Bool)

(assert (=> b!128145 (= e!83676 call!13838)))

(declare-fun b!128146 () Bool)

(declare-fun c!23491 () Bool)

(assert (=> b!128146 (= c!23491 (and (not (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128146 (= e!83676 e!83668)))

(declare-fun b!128147 () Bool)

(assert (=> b!128147 (= e!83667 e!83677)))

(declare-fun res!61869 () Bool)

(assert (=> b!128147 (= res!61869 call!13832)))

(assert (=> b!128147 (=> (not res!61869) (not e!83677))))

(assert (= (and d!38801 c!23492) b!128138))

(assert (= (and d!38801 (not c!23492)) b!128129))

(assert (= (and b!128129 c!23496) b!128145))

(assert (= (and b!128129 (not c!23496)) b!128146))

(assert (= (and b!128146 c!23491) b!128135))

(assert (= (and b!128146 (not c!23491)) b!128143))

(assert (= (or b!128135 b!128143) bm!13831))

(assert (= (or b!128145 bm!13831) bm!13834))

(assert (= (or b!128145 b!128135) bm!13829))

(assert (= (or b!128138 bm!13834) bm!13833))

(assert (= (or b!128138 bm!13829) bm!13835))

(assert (= (and d!38801 res!61868) b!128128))

(assert (= (and d!38801 c!23495) b!128142))

(assert (= (and d!38801 (not c!23495)) b!128134))

(assert (= (and d!38801 res!61867) b!128141))

(assert (= (and b!128141 res!61870) b!128131))

(assert (= (and b!128141 (not res!61865)) b!128137))

(assert (= (and b!128137 res!61872) b!128140))

(assert (= (and b!128141 res!61873) b!128127))

(assert (= (and b!128127 c!23494) b!128133))

(assert (= (and b!128127 (not c!23494)) b!128130))

(assert (= (and b!128133 res!61866) b!128132))

(assert (= (or b!128133 b!128130) bm!13830))

(assert (= (and b!128127 res!61871) b!128139))

(assert (= (and b!128139 c!23493) b!128147))

(assert (= (and b!128139 (not c!23493)) b!128136))

(assert (= (and b!128147 res!61869) b!128144))

(assert (= (or b!128147 b!128136) bm!13832))

(declare-fun b_lambda!5669 () Bool)

(assert (=> (not b_lambda!5669) (not b!128140)))

(assert (=> b!128140 t!6050))

(declare-fun b_and!7913 () Bool)

(assert (= b_and!7893 (and (=> t!6050 result!3869) b_and!7913)))

(assert (=> b!128140 t!6052))

(declare-fun b_and!7915 () Bool)

(assert (= b_and!7895 (and (=> t!6052 result!3873) b_and!7915)))

(declare-fun m!149895 () Bool)

(assert (=> bm!13830 m!149895))

(declare-fun m!149897 () Bool)

(assert (=> bm!13833 m!149897))

(declare-fun m!149899 () Bool)

(assert (=> b!128137 m!149899))

(assert (=> b!128137 m!149899))

(declare-fun m!149901 () Bool)

(assert (=> b!128137 m!149901))

(assert (=> d!38801 m!149737))

(assert (=> b!128131 m!149899))

(assert (=> b!128131 m!149899))

(declare-fun m!149903 () Bool)

(assert (=> b!128131 m!149903))

(assert (=> b!128128 m!149899))

(assert (=> b!128128 m!149899))

(assert (=> b!128128 m!149903))

(declare-fun m!149905 () Bool)

(assert (=> b!128138 m!149905))

(declare-fun m!149907 () Bool)

(assert (=> bm!13832 m!149907))

(declare-fun m!149909 () Bool)

(assert (=> b!128144 m!149909))

(declare-fun m!149911 () Bool)

(assert (=> b!128142 m!149911))

(declare-fun m!149913 () Bool)

(assert (=> b!128142 m!149913))

(declare-fun m!149915 () Bool)

(assert (=> b!128142 m!149915))

(declare-fun m!149917 () Bool)

(assert (=> b!128142 m!149917))

(declare-fun m!149919 () Bool)

(assert (=> b!128142 m!149919))

(declare-fun m!149921 () Bool)

(assert (=> b!128142 m!149921))

(declare-fun m!149923 () Bool)

(assert (=> b!128142 m!149923))

(declare-fun m!149925 () Bool)

(assert (=> b!128142 m!149925))

(declare-fun m!149927 () Bool)

(assert (=> b!128142 m!149927))

(assert (=> b!128142 m!149915))

(declare-fun m!149929 () Bool)

(assert (=> b!128142 m!149929))

(declare-fun m!149931 () Bool)

(assert (=> b!128142 m!149931))

(declare-fun m!149933 () Bool)

(assert (=> b!128142 m!149933))

(declare-fun m!149935 () Bool)

(assert (=> b!128142 m!149935))

(assert (=> b!128142 m!149925))

(declare-fun m!149937 () Bool)

(assert (=> b!128142 m!149937))

(declare-fun m!149939 () Bool)

(assert (=> b!128142 m!149939))

(assert (=> b!128142 m!149899))

(assert (=> b!128142 m!149919))

(assert (=> b!128142 m!149933))

(assert (=> b!128142 m!149897))

(declare-fun m!149941 () Bool)

(assert (=> b!128132 m!149941))

(declare-fun m!149943 () Bool)

(assert (=> bm!13835 m!149943))

(assert (=> b!128140 m!149899))

(assert (=> b!128140 m!149899))

(declare-fun m!149945 () Bool)

(assert (=> b!128140 m!149945))

(declare-fun m!149947 () Bool)

(assert (=> b!128140 m!149947))

(assert (=> b!128140 m!149717))

(declare-fun m!149949 () Bool)

(assert (=> b!128140 m!149949))

(assert (=> b!128140 m!149947))

(assert (=> b!128140 m!149717))

(assert (=> b!127815 d!38801))

(declare-fun mapNonEmpty!4553 () Bool)

(declare-fun mapRes!4553 () Bool)

(declare-fun tp!11051 () Bool)

(declare-fun e!83683 () Bool)

(assert (=> mapNonEmpty!4553 (= mapRes!4553 (and tp!11051 e!83683))))

(declare-fun mapRest!4553 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapValue!4553 () ValueCell!1082)

(declare-fun mapKey!4553 () (_ BitVec 32))

(assert (=> mapNonEmpty!4553 (= mapRest!4538 (store mapRest!4553 mapKey!4553 mapValue!4553))))

(declare-fun b!128154 () Bool)

(assert (=> b!128154 (= e!83683 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4553 () Bool)

(assert (=> mapIsEmpty!4553 mapRes!4553))

(declare-fun condMapEmpty!4553 () Bool)

(declare-fun mapDefault!4553 () ValueCell!1082)

(assert (=> mapNonEmpty!4537 (= condMapEmpty!4553 (= mapRest!4538 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4553)))))

(declare-fun e!83682 () Bool)

(assert (=> mapNonEmpty!4537 (= tp!11023 (and e!83682 mapRes!4553))))

(declare-fun b!128155 () Bool)

(assert (=> b!128155 (= e!83682 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4537 condMapEmpty!4553) mapIsEmpty!4553))

(assert (= (and mapNonEmpty!4537 (not condMapEmpty!4553)) mapNonEmpty!4553))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1082) mapValue!4553)) b!128154))

(assert (= (and mapNonEmpty!4537 ((_ is ValueCellFull!1082) mapDefault!4553)) b!128155))

(declare-fun m!149951 () Bool)

(assert (=> mapNonEmpty!4553 m!149951))

(declare-fun mapNonEmpty!4554 () Bool)

(declare-fun mapRes!4554 () Bool)

(declare-fun tp!11052 () Bool)

(declare-fun e!83685 () Bool)

(assert (=> mapNonEmpty!4554 (= mapRes!4554 (and tp!11052 e!83685))))

(declare-fun mapValue!4554 () ValueCell!1082)

(declare-fun mapKey!4554 () (_ BitVec 32))

(declare-fun mapRest!4554 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4554 (= mapRest!4537 (store mapRest!4554 mapKey!4554 mapValue!4554))))

(declare-fun b!128156 () Bool)

(assert (=> b!128156 (= e!83685 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4554 () Bool)

(assert (=> mapIsEmpty!4554 mapRes!4554))

(declare-fun condMapEmpty!4554 () Bool)

(declare-fun mapDefault!4554 () ValueCell!1082)

(assert (=> mapNonEmpty!4538 (= condMapEmpty!4554 (= mapRest!4537 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4554)))))

(declare-fun e!83684 () Bool)

(assert (=> mapNonEmpty!4538 (= tp!11021 (and e!83684 mapRes!4554))))

(declare-fun b!128157 () Bool)

(assert (=> b!128157 (= e!83684 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4538 condMapEmpty!4554) mapIsEmpty!4554))

(assert (= (and mapNonEmpty!4538 (not condMapEmpty!4554)) mapNonEmpty!4554))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1082) mapValue!4554)) b!128156))

(assert (= (and mapNonEmpty!4538 ((_ is ValueCellFull!1082) mapDefault!4554)) b!128157))

(declare-fun m!149953 () Bool)

(assert (=> mapNonEmpty!4554 m!149953))

(declare-fun b_lambda!5671 () Bool)

(assert (= b_lambda!5669 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5671)))

(check-sat (not b!128137) (not b!128131) (not bm!13813) (not d!38785) b_and!7915 (not bm!13800) (not b_next!2869) (not bm!13835) (not bm!13804) (not d!38799) (not bm!13799) (not b!128075) (not bm!13794) (not d!38801) (not b!128035) (not bm!13833) (not d!38797) (not bm!13793) (not b!128128) (not mapNonEmpty!4554) (not b!128051) (not bm!13809) (not bm!13801) (not b!128049) (not d!38779) (not b!128054) tp_is_empty!2851 (not b!128082) (not bm!13806) (not b!128138) b_and!7913 (not bm!13830) (not b!128050) (not bm!13812) (not b_lambda!5671) (not b!127941) (not b_next!2871) (not b!128045) (not bm!13811) (not b!128048) (not b!128140) (not b!128074) (not b!128132) (not b!128144) (not bm!13797) (not d!38781) (not b!128083) (not b!127943) (not b!128084) (not b!128142) (not mapNonEmpty!4553) (not b_lambda!5667) (not bm!13832))
(check-sat b_and!7913 b_and!7915 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun bm!13836 () Bool)

(declare-fun call!13845 () ListLongMap!1639)

(declare-fun call!13842 () ListLongMap!1639)

(assert (=> bm!13836 (= call!13845 call!13842)))

(declare-fun b!128158 () Bool)

(declare-fun res!61880 () Bool)

(declare-fun e!83687 () Bool)

(assert (=> b!128158 (=> (not res!61880) (not e!83687))))

(declare-fun e!83696 () Bool)

(assert (=> b!128158 (= res!61880 e!83696)))

(declare-fun c!23500 () Bool)

(assert (=> b!128158 (= c!23500 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128159 () Bool)

(declare-fun e!83690 () Bool)

(assert (=> b!128159 (= e!83690 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128160 () Bool)

(declare-fun e!83692 () ListLongMap!1639)

(declare-fun e!83697 () ListLongMap!1639)

(assert (=> b!128160 (= e!83692 e!83697)))

(declare-fun c!23502 () Bool)

(assert (=> b!128160 (= c!23502 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128161 () Bool)

(declare-fun call!13843 () Bool)

(assert (=> b!128161 (= e!83696 (not call!13843))))

(declare-fun bm!13837 () Bool)

(declare-fun lt!66292 () ListLongMap!1639)

(assert (=> bm!13837 (= call!13843 (contains!869 lt!66292 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13838 () Bool)

(declare-fun call!13840 () ListLongMap!1639)

(declare-fun call!13844 () ListLongMap!1639)

(assert (=> bm!13838 (= call!13840 call!13844)))

(declare-fun b!128162 () Bool)

(declare-fun e!83694 () Bool)

(assert (=> b!128162 (= e!83694 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128163 () Bool)

(declare-fun e!83686 () Bool)

(assert (=> b!128163 (= e!83686 (= (apply!112 lt!66292 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128164 () Bool)

(assert (=> b!128164 (= e!83696 e!83686)))

(declare-fun res!61875 () Bool)

(assert (=> b!128164 (= res!61875 call!13843)))

(assert (=> b!128164 (=> (not res!61875) (not e!83686))))

(declare-fun d!38803 () Bool)

(assert (=> d!38803 e!83687))

(declare-fun res!61876 () Bool)

(assert (=> d!38803 (=> (not res!61876) (not e!83687))))

(assert (=> d!38803 (= res!61876 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66280 () ListLongMap!1639)

(assert (=> d!38803 (= lt!66292 lt!66280)))

(declare-fun lt!66284 () Unit!3985)

(declare-fun e!83693 () Unit!3985)

(assert (=> d!38803 (= lt!66284 e!83693)))

(declare-fun c!23501 () Bool)

(assert (=> d!38803 (= c!23501 e!83690)))

(declare-fun res!61877 () Bool)

(assert (=> d!38803 (=> (not res!61877) (not e!83690))))

(assert (=> d!38803 (= res!61877 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38803 (= lt!66280 e!83692)))

(declare-fun c!23498 () Bool)

(assert (=> d!38803 (= c!23498 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38803 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38803 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66292)))

(declare-fun b!128165 () Bool)

(declare-fun Unit!3991 () Unit!3985)

(assert (=> b!128165 (= e!83693 Unit!3991)))

(declare-fun bm!13839 () Bool)

(declare-fun call!13839 () Bool)

(assert (=> bm!13839 (= call!13839 (contains!869 lt!66292 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128166 () Bool)

(declare-fun e!83689 () ListLongMap!1639)

(assert (=> b!128166 (= e!83689 call!13845)))

(declare-fun b!128167 () Bool)

(declare-fun e!83688 () Bool)

(assert (=> b!128167 (= e!83688 (not call!13839))))

(declare-fun b!128168 () Bool)

(declare-fun e!83691 () Bool)

(declare-fun e!83695 () Bool)

(assert (=> b!128168 (= e!83691 e!83695)))

(declare-fun res!61881 () Bool)

(assert (=> b!128168 (=> (not res!61881) (not e!83695))))

(assert (=> b!128168 (= res!61881 (contains!869 lt!66292 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128168 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13840 () Bool)

(declare-fun call!13841 () ListLongMap!1639)

(assert (=> bm!13840 (= call!13841 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128169 () Bool)

(assert (=> b!128169 (= e!83692 (+!165 call!13842 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13841 () Bool)

(assert (=> bm!13841 (= call!13844 call!13841)))

(declare-fun b!128170 () Bool)

(assert (=> b!128170 (= e!83687 e!83688)))

(declare-fun c!23499 () Bool)

(assert (=> b!128170 (= c!23499 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128171 () Bool)

(assert (=> b!128171 (= e!83695 (= (apply!112 lt!66292 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (_values!2787 newMap!16))))))

(assert (=> b!128171 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128172 () Bool)

(declare-fun res!61882 () Bool)

(assert (=> b!128172 (=> (not res!61882) (not e!83687))))

(assert (=> b!128172 (= res!61882 e!83691)))

(declare-fun res!61874 () Bool)

(assert (=> b!128172 (=> res!61874 e!83691)))

(assert (=> b!128172 (= res!61874 (not e!83694))))

(declare-fun res!61879 () Bool)

(assert (=> b!128172 (=> (not res!61879) (not e!83694))))

(assert (=> b!128172 (= res!61879 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13842 () Bool)

(assert (=> bm!13842 (= call!13842 (+!165 (ite c!23498 call!13841 (ite c!23502 call!13844 call!13840)) (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128173 () Bool)

(declare-fun lt!66271 () Unit!3985)

(assert (=> b!128173 (= e!83693 lt!66271)))

(declare-fun lt!66273 () ListLongMap!1639)

(assert (=> b!128173 (= lt!66273 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66277 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66277 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66274 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66274 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66291 () Unit!3985)

(assert (=> b!128173 (= lt!66291 (addStillContains!88 lt!66273 lt!66277 (zeroValue!2665 newMap!16) lt!66274))))

(assert (=> b!128173 (contains!869 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) lt!66274)))

(declare-fun lt!66278 () Unit!3985)

(assert (=> b!128173 (= lt!66278 lt!66291)))

(declare-fun lt!66290 () ListLongMap!1639)

(assert (=> b!128173 (= lt!66290 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66276 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66276 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66285 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66285 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66286 () Unit!3985)

(assert (=> b!128173 (= lt!66286 (addApplyDifferent!88 lt!66290 lt!66276 (minValue!2665 newMap!16) lt!66285))))

(assert (=> b!128173 (= (apply!112 (+!165 lt!66290 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) lt!66285) (apply!112 lt!66290 lt!66285))))

(declare-fun lt!66282 () Unit!3985)

(assert (=> b!128173 (= lt!66282 lt!66286)))

(declare-fun lt!66287 () ListLongMap!1639)

(assert (=> b!128173 (= lt!66287 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66288 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66288 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66279 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66279 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66281 () Unit!3985)

(assert (=> b!128173 (= lt!66281 (addApplyDifferent!88 lt!66287 lt!66288 (zeroValue!2665 newMap!16) lt!66279))))

(assert (=> b!128173 (= (apply!112 (+!165 lt!66287 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) lt!66279) (apply!112 lt!66287 lt!66279))))

(declare-fun lt!66275 () Unit!3985)

(assert (=> b!128173 (= lt!66275 lt!66281)))

(declare-fun lt!66289 () ListLongMap!1639)

(assert (=> b!128173 (= lt!66289 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66283 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66283 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66272 () (_ BitVec 64))

(assert (=> b!128173 (= lt!66272 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128173 (= lt!66271 (addApplyDifferent!88 lt!66289 lt!66283 (minValue!2665 newMap!16) lt!66272))))

(assert (=> b!128173 (= (apply!112 (+!165 lt!66289 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) lt!66272) (apply!112 lt!66289 lt!66272))))

(declare-fun b!128174 () Bool)

(assert (=> b!128174 (= e!83689 call!13840)))

(declare-fun b!128175 () Bool)

(declare-fun e!83698 () Bool)

(assert (=> b!128175 (= e!83698 (= (apply!112 lt!66292 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128176 () Bool)

(assert (=> b!128176 (= e!83697 call!13845)))

(declare-fun b!128177 () Bool)

(declare-fun c!23497 () Bool)

(assert (=> b!128177 (= c!23497 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128177 (= e!83697 e!83689)))

(declare-fun b!128178 () Bool)

(assert (=> b!128178 (= e!83688 e!83698)))

(declare-fun res!61878 () Bool)

(assert (=> b!128178 (= res!61878 call!13839)))

(assert (=> b!128178 (=> (not res!61878) (not e!83698))))

(assert (= (and d!38803 c!23498) b!128169))

(assert (= (and d!38803 (not c!23498)) b!128160))

(assert (= (and b!128160 c!23502) b!128176))

(assert (= (and b!128160 (not c!23502)) b!128177))

(assert (= (and b!128177 c!23497) b!128166))

(assert (= (and b!128177 (not c!23497)) b!128174))

(assert (= (or b!128166 b!128174) bm!13838))

(assert (= (or b!128176 bm!13838) bm!13841))

(assert (= (or b!128176 b!128166) bm!13836))

(assert (= (or b!128169 bm!13841) bm!13840))

(assert (= (or b!128169 bm!13836) bm!13842))

(assert (= (and d!38803 res!61877) b!128159))

(assert (= (and d!38803 c!23501) b!128173))

(assert (= (and d!38803 (not c!23501)) b!128165))

(assert (= (and d!38803 res!61876) b!128172))

(assert (= (and b!128172 res!61879) b!128162))

(assert (= (and b!128172 (not res!61874)) b!128168))

(assert (= (and b!128168 res!61881) b!128171))

(assert (= (and b!128172 res!61882) b!128158))

(assert (= (and b!128158 c!23500) b!128164))

(assert (= (and b!128158 (not c!23500)) b!128161))

(assert (= (and b!128164 res!61875) b!128163))

(assert (= (or b!128164 b!128161) bm!13837))

(assert (= (and b!128158 res!61880) b!128170))

(assert (= (and b!128170 c!23499) b!128178))

(assert (= (and b!128170 (not c!23499)) b!128167))

(assert (= (and b!128178 res!61878) b!128175))

(assert (= (or b!128178 b!128167) bm!13839))

(declare-fun b_lambda!5673 () Bool)

(assert (=> (not b_lambda!5673) (not b!128171)))

(declare-fun tb!2345 () Bool)

(declare-fun t!6065 () Bool)

(assert (=> (and b!127810 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16)) t!6065) tb!2345))

(declare-fun result!3889 () Bool)

(assert (=> tb!2345 (= result!3889 tp_is_empty!2851)))

(assert (=> b!128171 t!6065))

(declare-fun b_and!7917 () Bool)

(assert (= b_and!7913 (and (=> t!6065 result!3889) b_and!7917)))

(declare-fun t!6067 () Bool)

(declare-fun tb!2347 () Bool)

(assert (=> (and b!127825 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 newMap!16)) t!6067) tb!2347))

(declare-fun result!3891 () Bool)

(assert (= result!3891 result!3889))

(assert (=> b!128171 t!6067))

(declare-fun b_and!7919 () Bool)

(assert (= b_and!7915 (and (=> t!6067 result!3891) b_and!7919)))

(declare-fun m!149955 () Bool)

(assert (=> bm!13837 m!149955))

(declare-fun m!149957 () Bool)

(assert (=> bm!13840 m!149957))

(declare-fun m!149959 () Bool)

(assert (=> b!128168 m!149959))

(assert (=> b!128168 m!149959))

(declare-fun m!149961 () Bool)

(assert (=> b!128168 m!149961))

(declare-fun m!149963 () Bool)

(assert (=> d!38803 m!149963))

(assert (=> b!128162 m!149959))

(assert (=> b!128162 m!149959))

(declare-fun m!149965 () Bool)

(assert (=> b!128162 m!149965))

(assert (=> b!128159 m!149959))

(assert (=> b!128159 m!149959))

(assert (=> b!128159 m!149965))

(declare-fun m!149967 () Bool)

(assert (=> b!128169 m!149967))

(declare-fun m!149969 () Bool)

(assert (=> bm!13839 m!149969))

(declare-fun m!149971 () Bool)

(assert (=> b!128175 m!149971))

(declare-fun m!149973 () Bool)

(assert (=> b!128173 m!149973))

(declare-fun m!149975 () Bool)

(assert (=> b!128173 m!149975))

(declare-fun m!149977 () Bool)

(assert (=> b!128173 m!149977))

(declare-fun m!149979 () Bool)

(assert (=> b!128173 m!149979))

(declare-fun m!149981 () Bool)

(assert (=> b!128173 m!149981))

(declare-fun m!149983 () Bool)

(assert (=> b!128173 m!149983))

(declare-fun m!149985 () Bool)

(assert (=> b!128173 m!149985))

(declare-fun m!149987 () Bool)

(assert (=> b!128173 m!149987))

(declare-fun m!149989 () Bool)

(assert (=> b!128173 m!149989))

(assert (=> b!128173 m!149977))

(declare-fun m!149991 () Bool)

(assert (=> b!128173 m!149991))

(declare-fun m!149993 () Bool)

(assert (=> b!128173 m!149993))

(declare-fun m!149995 () Bool)

(assert (=> b!128173 m!149995))

(declare-fun m!149997 () Bool)

(assert (=> b!128173 m!149997))

(assert (=> b!128173 m!149987))

(declare-fun m!149999 () Bool)

(assert (=> b!128173 m!149999))

(declare-fun m!150001 () Bool)

(assert (=> b!128173 m!150001))

(assert (=> b!128173 m!149959))

(assert (=> b!128173 m!149981))

(assert (=> b!128173 m!149995))

(assert (=> b!128173 m!149957))

(declare-fun m!150003 () Bool)

(assert (=> b!128163 m!150003))

(declare-fun m!150005 () Bool)

(assert (=> bm!13842 m!150005))

(assert (=> b!128171 m!149959))

(assert (=> b!128171 m!149959))

(declare-fun m!150007 () Bool)

(assert (=> b!128171 m!150007))

(declare-fun m!150009 () Bool)

(assert (=> b!128171 m!150009))

(declare-fun m!150011 () Bool)

(assert (=> b!128171 m!150011))

(declare-fun m!150013 () Bool)

(assert (=> b!128171 m!150013))

(assert (=> b!128171 m!150009))

(assert (=> b!128171 m!150011))

(assert (=> b!128045 d!38803))

(declare-fun d!38805 () Bool)

(assert (=> d!38805 (= (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128128 d!38805))

(declare-fun d!38807 () Bool)

(declare-fun res!61887 () Bool)

(declare-fun e!83703 () Bool)

(assert (=> d!38807 (=> res!61887 e!83703)))

(assert (=> d!38807 (= res!61887 (= (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38807 (= (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000) e!83703)))

(declare-fun b!128183 () Bool)

(declare-fun e!83704 () Bool)

(assert (=> b!128183 (= e!83703 e!83704)))

(declare-fun res!61888 () Bool)

(assert (=> b!128183 (=> (not res!61888) (not e!83704))))

(assert (=> b!128183 (= res!61888 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128184 () Bool)

(assert (=> b!128184 (= e!83704 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!38807 (not res!61887)) b!128183))

(assert (= (and b!128183 res!61888) b!128184))

(assert (=> d!38807 m!149959))

(assert (=> b!128184 m!149721))

(declare-fun m!150015 () Bool)

(assert (=> b!128184 m!150015))

(assert (=> bm!13809 d!38807))

(declare-fun d!38809 () Bool)

(declare-fun get!1466 (Option!175) V!3449)

(assert (=> d!38809 (= (apply!112 lt!66268 lt!66263) (get!1466 (getValueByKey!169 (toList!835 lt!66268) lt!66263)))))

(declare-fun bs!5314 () Bool)

(assert (= bs!5314 d!38809))

(declare-fun m!150017 () Bool)

(assert (=> bs!5314 m!150017))

(assert (=> bs!5314 m!150017))

(declare-fun m!150019 () Bool)

(assert (=> bs!5314 m!150019))

(assert (=> b!128142 d!38809))

(declare-fun d!38811 () Bool)

(assert (=> d!38811 (= (apply!112 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66263) (apply!112 lt!66268 lt!66263))))

(declare-fun lt!66295 () Unit!3985)

(declare-fun choose!780 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> d!38811 (= lt!66295 (choose!780 lt!66268 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66263))))

(declare-fun e!83707 () Bool)

(assert (=> d!38811 e!83707))

(declare-fun res!61891 () Bool)

(assert (=> d!38811 (=> (not res!61891) (not e!83707))))

(assert (=> d!38811 (= res!61891 (contains!869 lt!66268 lt!66263))))

(assert (=> d!38811 (= (addApplyDifferent!88 lt!66268 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66263) lt!66295)))

(declare-fun b!128188 () Bool)

(assert (=> b!128188 (= e!83707 (not (= lt!66263 lt!66254)))))

(assert (= (and d!38811 res!61891) b!128188))

(assert (=> d!38811 m!149931))

(declare-fun m!150021 () Bool)

(assert (=> d!38811 m!150021))

(assert (=> d!38811 m!149915))

(assert (=> d!38811 m!149917))

(declare-fun m!150023 () Bool)

(assert (=> d!38811 m!150023))

(assert (=> d!38811 m!149915))

(assert (=> b!128142 d!38811))

(declare-fun d!38813 () Bool)

(declare-fun e!83710 () Bool)

(assert (=> d!38813 e!83710))

(declare-fun res!61897 () Bool)

(assert (=> d!38813 (=> (not res!61897) (not e!83710))))

(declare-fun lt!66304 () ListLongMap!1639)

(assert (=> d!38813 (= res!61897 (contains!869 lt!66304 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66306 () List!1682)

(assert (=> d!38813 (= lt!66304 (ListLongMap!1640 lt!66306))))

(declare-fun lt!66305 () Unit!3985)

(declare-fun lt!66307 () Unit!3985)

(assert (=> d!38813 (= lt!66305 lt!66307)))

(assert (=> d!38813 (= (getValueByKey!169 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!84 (List!1682 (_ BitVec 64) V!3449) Unit!3985)

(assert (=> d!38813 (= lt!66307 (lemmaContainsTupThenGetReturnValue!84 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun insertStrictlySorted!87 (List!1682 (_ BitVec 64) V!3449) List!1682)

(assert (=> d!38813 (= lt!66306 (insertStrictlySorted!87 (toList!835 lt!66267) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38813 (= (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66304)))

(declare-fun b!128193 () Bool)

(declare-fun res!61896 () Bool)

(assert (=> b!128193 (=> (not res!61896) (not e!83710))))

(assert (=> b!128193 (= res!61896 (= (getValueByKey!169 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128194 () Bool)

(declare-fun contains!871 (List!1682 tuple2!2536) Bool)

(assert (=> b!128194 (= e!83710 (contains!871 (toList!835 lt!66304) (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38813 res!61897) b!128193))

(assert (= (and b!128193 res!61896) b!128194))

(declare-fun m!150025 () Bool)

(assert (=> d!38813 m!150025))

(declare-fun m!150027 () Bool)

(assert (=> d!38813 m!150027))

(declare-fun m!150029 () Bool)

(assert (=> d!38813 m!150029))

(declare-fun m!150031 () Bool)

(assert (=> d!38813 m!150031))

(declare-fun m!150033 () Bool)

(assert (=> b!128193 m!150033))

(declare-fun m!150035 () Bool)

(assert (=> b!128194 m!150035))

(assert (=> b!128142 d!38813))

(declare-fun d!38815 () Bool)

(assert (=> d!38815 (= (apply!112 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66257) (apply!112 lt!66265 lt!66257))))

(declare-fun lt!66308 () Unit!3985)

(assert (=> d!38815 (= lt!66308 (choose!780 lt!66265 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66257))))

(declare-fun e!83711 () Bool)

(assert (=> d!38815 e!83711))

(declare-fun res!61898 () Bool)

(assert (=> d!38815 (=> (not res!61898) (not e!83711))))

(assert (=> d!38815 (= res!61898 (contains!869 lt!66265 lt!66257))))

(assert (=> d!38815 (= (addApplyDifferent!88 lt!66265 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66257) lt!66308)))

(declare-fun b!128195 () Bool)

(assert (=> b!128195 (= e!83711 (not (= lt!66257 lt!66266)))))

(assert (= (and d!38815 res!61898) b!128195))

(assert (=> d!38815 m!149923))

(declare-fun m!150037 () Bool)

(assert (=> d!38815 m!150037))

(assert (=> d!38815 m!149925))

(assert (=> d!38815 m!149937))

(declare-fun m!150039 () Bool)

(assert (=> d!38815 m!150039))

(assert (=> d!38815 m!149925))

(assert (=> b!128142 d!38815))

(declare-fun b!128220 () Bool)

(declare-fun res!61908 () Bool)

(declare-fun e!83731 () Bool)

(assert (=> b!128220 (=> (not res!61908) (not e!83731))))

(declare-fun lt!66328 () ListLongMap!1639)

(assert (=> b!128220 (= res!61908 (not (contains!869 lt!66328 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128221 () Bool)

(assert (=> b!128221 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> b!128221 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!83726 () Bool)

(assert (=> b!128221 (= e!83726 (= (apply!112 lt!66328 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128222 () Bool)

(declare-fun e!83730 () ListLongMap!1639)

(declare-fun e!83728 () ListLongMap!1639)

(assert (=> b!128222 (= e!83730 e!83728)))

(declare-fun c!23514 () Bool)

(assert (=> b!128222 (= c!23514 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128223 () Bool)

(declare-fun lt!66325 () Unit!3985)

(declare-fun lt!66324 () Unit!3985)

(assert (=> b!128223 (= lt!66325 lt!66324)))

(declare-fun lt!66323 () (_ BitVec 64))

(declare-fun lt!66329 () ListLongMap!1639)

(declare-fun lt!66326 () (_ BitVec 64))

(declare-fun lt!66327 () V!3449)

(assert (=> b!128223 (not (contains!869 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327)) lt!66323))))

(declare-fun addStillNotContains!59 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> b!128223 (= lt!66324 (addStillNotContains!59 lt!66329 lt!66326 lt!66327 lt!66323))))

(assert (=> b!128223 (= lt!66323 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128223 (= lt!66327 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128223 (= lt!66326 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun call!13848 () ListLongMap!1639)

(assert (=> b!128223 (= lt!66329 call!13848)))

(assert (=> b!128223 (= e!83728 (+!165 call!13848 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!83729 () Bool)

(declare-fun b!128224 () Bool)

(assert (=> b!128224 (= e!83729 (= lt!66328 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128225 () Bool)

(assert (=> b!128225 (= e!83730 (ListLongMap!1640 Nil!1679))))

(declare-fun b!128226 () Bool)

(declare-fun e!83732 () Bool)

(assert (=> b!128226 (= e!83731 e!83732)))

(declare-fun c!23511 () Bool)

(declare-fun e!83727 () Bool)

(assert (=> b!128226 (= c!23511 e!83727)))

(declare-fun res!61910 () Bool)

(assert (=> b!128226 (=> (not res!61910) (not e!83727))))

(assert (=> b!128226 (= res!61910 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128227 () Bool)

(assert (=> b!128227 (= e!83728 call!13848)))

(declare-fun b!128228 () Bool)

(assert (=> b!128228 (= e!83732 e!83729)))

(declare-fun c!23513 () Bool)

(assert (=> b!128228 (= c!23513 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128229 () Bool)

(assert (=> b!128229 (= e!83732 e!83726)))

(assert (=> b!128229 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun res!61907 () Bool)

(assert (=> b!128229 (= res!61907 (contains!869 lt!66328 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128229 (=> (not res!61907) (not e!83726))))

(declare-fun b!128230 () Bool)

(assert (=> b!128230 (= e!83727 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128230 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!128231 () Bool)

(declare-fun isEmpty!405 (ListLongMap!1639) Bool)

(assert (=> b!128231 (= e!83729 (isEmpty!405 lt!66328))))

(declare-fun d!38817 () Bool)

(assert (=> d!38817 e!83731))

(declare-fun res!61909 () Bool)

(assert (=> d!38817 (=> (not res!61909) (not e!83731))))

(assert (=> d!38817 (= res!61909 (not (contains!869 lt!66328 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38817 (= lt!66328 e!83730)))

(declare-fun c!23512 () Bool)

(assert (=> d!38817 (= c!23512 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!38817 (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992))))))

(assert (=> d!38817 (= (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))) lt!66328)))

(declare-fun bm!13845 () Bool)

(assert (=> bm!13845 (= call!13848 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(assert (= (and d!38817 c!23512) b!128225))

(assert (= (and d!38817 (not c!23512)) b!128222))

(assert (= (and b!128222 c!23514) b!128223))

(assert (= (and b!128222 (not c!23514)) b!128227))

(assert (= (or b!128223 b!128227) bm!13845))

(assert (= (and d!38817 res!61909) b!128220))

(assert (= (and b!128220 res!61908) b!128226))

(assert (= (and b!128226 res!61910) b!128230))

(assert (= (and b!128226 c!23511) b!128229))

(assert (= (and b!128226 (not c!23511)) b!128228))

(assert (= (and b!128229 res!61907) b!128221))

(assert (= (and b!128228 c!23513) b!128224))

(assert (= (and b!128228 (not c!23513)) b!128231))

(declare-fun b_lambda!5675 () Bool)

(assert (=> (not b_lambda!5675) (not b!128221)))

(assert (=> b!128221 t!6050))

(declare-fun b_and!7921 () Bool)

(assert (= b_and!7917 (and (=> t!6050 result!3869) b_and!7921)))

(assert (=> b!128221 t!6052))

(declare-fun b_and!7923 () Bool)

(assert (= b_and!7919 (and (=> t!6052 result!3873) b_and!7923)))

(declare-fun b_lambda!5677 () Bool)

(assert (=> (not b_lambda!5677) (not b!128223)))

(assert (=> b!128223 t!6050))

(declare-fun b_and!7925 () Bool)

(assert (= b_and!7921 (and (=> t!6050 result!3869) b_and!7925)))

(assert (=> b!128223 t!6052))

(declare-fun b_and!7927 () Bool)

(assert (= b_and!7923 (and (=> t!6052 result!3873) b_and!7927)))

(declare-fun m!150041 () Bool)

(assert (=> d!38817 m!150041))

(assert (=> d!38817 m!149737))

(assert (=> b!128223 m!149717))

(assert (=> b!128223 m!149899))

(declare-fun m!150043 () Bool)

(assert (=> b!128223 m!150043))

(declare-fun m!150045 () Bool)

(assert (=> b!128223 m!150045))

(assert (=> b!128223 m!149947))

(declare-fun m!150047 () Bool)

(assert (=> b!128223 m!150047))

(declare-fun m!150049 () Bool)

(assert (=> b!128223 m!150049))

(assert (=> b!128223 m!150043))

(assert (=> b!128223 m!149947))

(assert (=> b!128223 m!149717))

(assert (=> b!128223 m!149949))

(assert (=> b!128229 m!149899))

(assert (=> b!128229 m!149899))

(declare-fun m!150051 () Bool)

(assert (=> b!128229 m!150051))

(declare-fun m!150053 () Bool)

(assert (=> bm!13845 m!150053))

(declare-fun m!150055 () Bool)

(assert (=> b!128220 m!150055))

(assert (=> b!128222 m!149899))

(assert (=> b!128222 m!149899))

(assert (=> b!128222 m!149903))

(assert (=> b!128224 m!150053))

(declare-fun m!150057 () Bool)

(assert (=> b!128231 m!150057))

(assert (=> b!128230 m!149899))

(assert (=> b!128230 m!149899))

(assert (=> b!128230 m!149903))

(assert (=> b!128221 m!149717))

(assert (=> b!128221 m!149899))

(assert (=> b!128221 m!149947))

(assert (=> b!128221 m!149899))

(declare-fun m!150059 () Bool)

(assert (=> b!128221 m!150059))

(assert (=> b!128221 m!149947))

(assert (=> b!128221 m!149717))

(assert (=> b!128221 m!149949))

(assert (=> b!128142 d!38817))

(declare-fun d!38819 () Bool)

(declare-fun e!83733 () Bool)

(assert (=> d!38819 e!83733))

(declare-fun res!61912 () Bool)

(assert (=> d!38819 (=> (not res!61912) (not e!83733))))

(declare-fun lt!66330 () ListLongMap!1639)

(assert (=> d!38819 (= res!61912 (contains!869 lt!66330 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66332 () List!1682)

(assert (=> d!38819 (= lt!66330 (ListLongMap!1640 lt!66332))))

(declare-fun lt!66331 () Unit!3985)

(declare-fun lt!66333 () Unit!3985)

(assert (=> d!38819 (= lt!66331 lt!66333)))

(assert (=> d!38819 (= (getValueByKey!169 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38819 (= lt!66333 (lemmaContainsTupThenGetReturnValue!84 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38819 (= lt!66332 (insertStrictlySorted!87 (toList!835 lt!66268) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38819 (= (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66330)))

(declare-fun b!128232 () Bool)

(declare-fun res!61911 () Bool)

(assert (=> b!128232 (=> (not res!61911) (not e!83733))))

(assert (=> b!128232 (= res!61911 (= (getValueByKey!169 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128233 () Bool)

(assert (=> b!128233 (= e!83733 (contains!871 (toList!835 lt!66330) (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38819 res!61912) b!128232))

(assert (= (and b!128232 res!61911) b!128233))

(declare-fun m!150061 () Bool)

(assert (=> d!38819 m!150061))

(declare-fun m!150063 () Bool)

(assert (=> d!38819 m!150063))

(declare-fun m!150065 () Bool)

(assert (=> d!38819 m!150065))

(declare-fun m!150067 () Bool)

(assert (=> d!38819 m!150067))

(declare-fun m!150069 () Bool)

(assert (=> b!128232 m!150069))

(declare-fun m!150071 () Bool)

(assert (=> b!128233 m!150071))

(assert (=> b!128142 d!38819))

(declare-fun d!38821 () Bool)

(assert (=> d!38821 (= (apply!112 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66257) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66257)))))

(declare-fun bs!5315 () Bool)

(assert (= bs!5315 d!38821))

(declare-fun m!150073 () Bool)

(assert (=> bs!5315 m!150073))

(assert (=> bs!5315 m!150073))

(declare-fun m!150075 () Bool)

(assert (=> bs!5315 m!150075))

(assert (=> b!128142 d!38821))

(declare-fun d!38823 () Bool)

(assert (=> d!38823 (= (apply!112 lt!66267 lt!66250) (get!1466 (getValueByKey!169 (toList!835 lt!66267) lt!66250)))))

(declare-fun bs!5316 () Bool)

(assert (= bs!5316 d!38823))

(declare-fun m!150077 () Bool)

(assert (=> bs!5316 m!150077))

(assert (=> bs!5316 m!150077))

(declare-fun m!150079 () Bool)

(assert (=> bs!5316 m!150079))

(assert (=> b!128142 d!38823))

(declare-fun d!38825 () Bool)

(assert (=> d!38825 (contains!869 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66252)))

(declare-fun lt!66336 () Unit!3985)

(declare-fun choose!781 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> d!38825 (= lt!66336 (choose!781 lt!66251 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66252))))

(assert (=> d!38825 (contains!869 lt!66251 lt!66252)))

(assert (=> d!38825 (= (addStillContains!88 lt!66251 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66252) lt!66336)))

(declare-fun bs!5317 () Bool)

(assert (= bs!5317 d!38825))

(assert (=> bs!5317 m!149933))

(assert (=> bs!5317 m!149933))

(assert (=> bs!5317 m!149935))

(declare-fun m!150081 () Bool)

(assert (=> bs!5317 m!150081))

(declare-fun m!150083 () Bool)

(assert (=> bs!5317 m!150083))

(assert (=> b!128142 d!38825))

(declare-fun d!38827 () Bool)

(assert (=> d!38827 (= (apply!112 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66250) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66250)))))

(declare-fun bs!5318 () Bool)

(assert (= bs!5318 d!38827))

(declare-fun m!150085 () Bool)

(assert (=> bs!5318 m!150085))

(assert (=> bs!5318 m!150085))

(declare-fun m!150087 () Bool)

(assert (=> bs!5318 m!150087))

(assert (=> b!128142 d!38827))

(declare-fun d!38829 () Bool)

(assert (=> d!38829 (= (apply!112 lt!66265 lt!66257) (get!1466 (getValueByKey!169 (toList!835 lt!66265) lt!66257)))))

(declare-fun bs!5319 () Bool)

(assert (= bs!5319 d!38829))

(declare-fun m!150089 () Bool)

(assert (=> bs!5319 m!150089))

(assert (=> bs!5319 m!150089))

(declare-fun m!150091 () Bool)

(assert (=> bs!5319 m!150091))

(assert (=> b!128142 d!38829))

(declare-fun d!38831 () Bool)

(declare-fun e!83735 () Bool)

(assert (=> d!38831 e!83735))

(declare-fun res!61913 () Bool)

(assert (=> d!38831 (=> res!61913 e!83735)))

(declare-fun lt!66337 () Bool)

(assert (=> d!38831 (= res!61913 (not lt!66337))))

(declare-fun lt!66340 () Bool)

(assert (=> d!38831 (= lt!66337 lt!66340)))

(declare-fun lt!66338 () Unit!3985)

(declare-fun e!83734 () Unit!3985)

(assert (=> d!38831 (= lt!66338 e!83734)))

(declare-fun c!23515 () Bool)

(assert (=> d!38831 (= c!23515 lt!66340)))

(assert (=> d!38831 (= lt!66340 (containsKey!172 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(assert (=> d!38831 (= (contains!869 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66252) lt!66337)))

(declare-fun b!128235 () Bool)

(declare-fun lt!66339 () Unit!3985)

(assert (=> b!128235 (= e!83734 lt!66339)))

(assert (=> b!128235 (= lt!66339 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(assert (=> b!128235 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(declare-fun b!128236 () Bool)

(declare-fun Unit!3992 () Unit!3985)

(assert (=> b!128236 (= e!83734 Unit!3992)))

(declare-fun b!128237 () Bool)

(assert (=> b!128237 (= e!83735 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252)))))

(assert (= (and d!38831 c!23515) b!128235))

(assert (= (and d!38831 (not c!23515)) b!128236))

(assert (= (and d!38831 (not res!61913)) b!128237))

(declare-fun m!150093 () Bool)

(assert (=> d!38831 m!150093))

(declare-fun m!150095 () Bool)

(assert (=> b!128235 m!150095))

(declare-fun m!150097 () Bool)

(assert (=> b!128235 m!150097))

(assert (=> b!128235 m!150097))

(declare-fun m!150099 () Bool)

(assert (=> b!128235 m!150099))

(assert (=> b!128237 m!150097))

(assert (=> b!128237 m!150097))

(assert (=> b!128237 m!150099))

(assert (=> b!128142 d!38831))

(declare-fun d!38833 () Bool)

(declare-fun e!83736 () Bool)

(assert (=> d!38833 e!83736))

(declare-fun res!61915 () Bool)

(assert (=> d!38833 (=> (not res!61915) (not e!83736))))

(declare-fun lt!66341 () ListLongMap!1639)

(assert (=> d!38833 (= res!61915 (contains!869 lt!66341 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66343 () List!1682)

(assert (=> d!38833 (= lt!66341 (ListLongMap!1640 lt!66343))))

(declare-fun lt!66342 () Unit!3985)

(declare-fun lt!66344 () Unit!3985)

(assert (=> d!38833 (= lt!66342 lt!66344)))

(assert (=> d!38833 (= (getValueByKey!169 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38833 (= lt!66344 (lemmaContainsTupThenGetReturnValue!84 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38833 (= lt!66343 (insertStrictlySorted!87 (toList!835 lt!66251) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38833 (= (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66341)))

(declare-fun b!128238 () Bool)

(declare-fun res!61914 () Bool)

(assert (=> b!128238 (=> (not res!61914) (not e!83736))))

(assert (=> b!128238 (= res!61914 (= (getValueByKey!169 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128239 () Bool)

(assert (=> b!128239 (= e!83736 (contains!871 (toList!835 lt!66341) (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38833 res!61915) b!128238))

(assert (= (and b!128238 res!61914) b!128239))

(declare-fun m!150101 () Bool)

(assert (=> d!38833 m!150101))

(declare-fun m!150103 () Bool)

(assert (=> d!38833 m!150103))

(declare-fun m!150105 () Bool)

(assert (=> d!38833 m!150105))

(declare-fun m!150107 () Bool)

(assert (=> d!38833 m!150107))

(declare-fun m!150109 () Bool)

(assert (=> b!128238 m!150109))

(declare-fun m!150111 () Bool)

(assert (=> b!128239 m!150111))

(assert (=> b!128142 d!38833))

(declare-fun d!38835 () Bool)

(assert (=> d!38835 (= (apply!112 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66263) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66263)))))

(declare-fun bs!5320 () Bool)

(assert (= bs!5320 d!38835))

(declare-fun m!150113 () Bool)

(assert (=> bs!5320 m!150113))

(assert (=> bs!5320 m!150113))

(declare-fun m!150115 () Bool)

(assert (=> bs!5320 m!150115))

(assert (=> b!128142 d!38835))

(declare-fun d!38837 () Bool)

(assert (=> d!38837 (= (apply!112 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66250) (apply!112 lt!66267 lt!66250))))

(declare-fun lt!66345 () Unit!3985)

(assert (=> d!38837 (= lt!66345 (choose!780 lt!66267 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66250))))

(declare-fun e!83737 () Bool)

(assert (=> d!38837 e!83737))

(declare-fun res!61916 () Bool)

(assert (=> d!38837 (=> (not res!61916) (not e!83737))))

(assert (=> d!38837 (= res!61916 (contains!869 lt!66267 lt!66250))))

(assert (=> d!38837 (= (addApplyDifferent!88 lt!66267 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66250) lt!66345)))

(declare-fun b!128240 () Bool)

(assert (=> b!128240 (= e!83737 (not (= lt!66250 lt!66261)))))

(assert (= (and d!38837 res!61916) b!128240))

(assert (=> d!38837 m!149911))

(declare-fun m!150117 () Bool)

(assert (=> d!38837 m!150117))

(assert (=> d!38837 m!149919))

(assert (=> d!38837 m!149921))

(declare-fun m!150119 () Bool)

(assert (=> d!38837 m!150119))

(assert (=> d!38837 m!149919))

(assert (=> b!128142 d!38837))

(declare-fun d!38839 () Bool)

(declare-fun e!83738 () Bool)

(assert (=> d!38839 e!83738))

(declare-fun res!61918 () Bool)

(assert (=> d!38839 (=> (not res!61918) (not e!83738))))

(declare-fun lt!66346 () ListLongMap!1639)

(assert (=> d!38839 (= res!61918 (contains!869 lt!66346 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66348 () List!1682)

(assert (=> d!38839 (= lt!66346 (ListLongMap!1640 lt!66348))))

(declare-fun lt!66347 () Unit!3985)

(declare-fun lt!66349 () Unit!3985)

(assert (=> d!38839 (= lt!66347 lt!66349)))

(assert (=> d!38839 (= (getValueByKey!169 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38839 (= lt!66349 (lemmaContainsTupThenGetReturnValue!84 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38839 (= lt!66348 (insertStrictlySorted!87 (toList!835 lt!66265) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38839 (= (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66346)))

(declare-fun b!128241 () Bool)

(declare-fun res!61917 () Bool)

(assert (=> b!128241 (=> (not res!61917) (not e!83738))))

(assert (=> b!128241 (= res!61917 (= (getValueByKey!169 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128242 () Bool)

(assert (=> b!128242 (= e!83738 (contains!871 (toList!835 lt!66346) (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38839 res!61918) b!128241))

(assert (= (and b!128241 res!61917) b!128242))

(declare-fun m!150121 () Bool)

(assert (=> d!38839 m!150121))

(declare-fun m!150123 () Bool)

(assert (=> d!38839 m!150123))

(declare-fun m!150125 () Bool)

(assert (=> d!38839 m!150125))

(declare-fun m!150127 () Bool)

(assert (=> d!38839 m!150127))

(declare-fun m!150129 () Bool)

(assert (=> b!128241 m!150129))

(declare-fun m!150131 () Bool)

(assert (=> b!128242 m!150131))

(assert (=> b!128142 d!38839))

(declare-fun b!128277 () Bool)

(declare-fun e!83759 () Unit!3985)

(declare-fun lt!66431 () Unit!3985)

(assert (=> b!128277 (= e!83759 lt!66431)))

(assert (=> b!128277 (= lt!66431 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66434 () SeekEntryResult!265)

(declare-fun call!13859 () SeekEntryResult!265)

(assert (=> b!128277 (= lt!66434 call!13859)))

(declare-fun c!23526 () Bool)

(assert (=> b!128277 (= c!23526 ((_ is MissingZero!265) lt!66434))))

(declare-fun e!83760 () Bool)

(assert (=> b!128277 e!83760))

(declare-fun e!83757 () Bool)

(declare-fun lt!66414 () tuple2!2538)

(declare-fun b!128278 () Bool)

(assert (=> b!128278 (= e!83757 (= (map!1386 (_2!1280 lt!66414)) (+!165 (map!1386 newMap!16) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128279 () Bool)

(declare-fun res!61939 () Bool)

(assert (=> b!128279 (= res!61939 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66434)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!83755 () Bool)

(assert (=> b!128279 (=> (not res!61939) (not e!83755))))

(declare-fun b!128280 () Bool)

(declare-fun res!61942 () Bool)

(assert (=> b!128280 (=> (not res!61942) (not e!83757))))

(assert (=> b!128280 (= res!61942 (valid!527 (_2!1280 lt!66414)))))

(declare-fun bm!13854 () Bool)

(assert (=> bm!13854 (= call!13859 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128281 () Bool)

(declare-fun res!61937 () Bool)

(assert (=> b!128281 (=> (not res!61937) (not e!83757))))

(assert (=> b!128281 (= res!61937 (contains!869 (map!1386 (_2!1280 lt!66414)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128282 () Bool)

(declare-fun e!83758 () Bool)

(declare-fun call!13860 () Bool)

(assert (=> b!128282 (= e!83758 (not call!13860))))

(declare-fun b!128283 () Bool)

(declare-fun e!83762 () Bool)

(assert (=> b!128283 (= e!83762 e!83755)))

(declare-fun res!61944 () Bool)

(declare-fun call!13857 () Bool)

(assert (=> b!128283 (= res!61944 call!13857)))

(assert (=> b!128283 (=> (not res!61944) (not e!83755))))

(declare-fun b!128284 () Bool)

(assert (=> b!128284 (= e!83762 ((_ is Undefined!265) lt!66434))))

(declare-fun b!128285 () Bool)

(declare-fun res!61941 () Bool)

(assert (=> b!128285 (=> (not res!61941) (not e!83758))))

(assert (=> b!128285 (= res!61941 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66434)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!13858 () Bool)

(declare-fun lt!66411 () SeekEntryResult!265)

(declare-fun c!23525 () Bool)

(declare-fun bm!13855 () Bool)

(assert (=> bm!13855 (= call!13858 (inRange!0 (ite c!23525 (index!3217 lt!66411) (ite c!23526 (index!3216 lt!66434) (index!3219 lt!66434))) (mask!7072 newMap!16)))))

(declare-fun b!128286 () Bool)

(assert (=> b!128286 (= e!83755 (not call!13860))))

(declare-fun b!128287 () Bool)

(declare-fun e!83761 () Unit!3985)

(declare-fun Unit!3993 () Unit!3985)

(assert (=> b!128287 (= e!83761 Unit!3993)))

(declare-fun b!128288 () Bool)

(declare-fun Unit!3994 () Unit!3985)

(assert (=> b!128288 (= e!83761 Unit!3994)))

(declare-fun lt!66432 () Unit!3985)

(declare-fun lemmaArrayContainsKeyThenInListMap!38 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) (_ BitVec 32) Int) Unit!3985)

(assert (=> b!128288 (= lt!66432 (lemmaArrayContainsKeyThenInListMap!38 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> b!128288 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))

(declare-fun lt!66427 () Unit!3985)

(assert (=> b!128288 (= lt!66427 lt!66432)))

(assert (=> b!128288 false))

(declare-fun b!128289 () Bool)

(declare-fun Unit!3995 () Unit!3985)

(assert (=> b!128289 (= e!83759 Unit!3995)))

(declare-fun lt!66428 () Unit!3985)

(assert (=> b!128289 (= lt!66428 (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> b!128289 (= lt!66411 call!13859)))

(declare-fun res!61945 () Bool)

(assert (=> b!128289 (= res!61945 ((_ is Found!265) lt!66411))))

(declare-fun e!83756 () Bool)

(assert (=> b!128289 (=> (not res!61945) (not e!83756))))

(assert (=> b!128289 e!83756))

(declare-fun lt!66421 () Unit!3985)

(assert (=> b!128289 (= lt!66421 lt!66428)))

(assert (=> b!128289 false))

(declare-fun b!128290 () Bool)

(declare-fun res!61943 () Bool)

(assert (=> b!128290 (=> (not res!61943) (not e!83758))))

(assert (=> b!128290 (= res!61943 call!13857)))

(assert (=> b!128290 (= e!83760 e!83758)))

(declare-fun b!128291 () Bool)

(declare-fun res!61940 () Bool)

(assert (=> b!128291 (= res!61940 call!13858)))

(assert (=> b!128291 (=> (not res!61940) (not e!83756))))

(declare-fun bm!13856 () Bool)

(assert (=> bm!13856 (= call!13857 call!13858)))

(declare-fun bm!13857 () Bool)

(assert (=> bm!13857 (= call!13860 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!128292 () Bool)

(declare-fun c!23527 () Bool)

(assert (=> b!128292 (= c!23527 ((_ is MissingVacant!265) lt!66434))))

(assert (=> b!128292 (= e!83760 e!83762)))

(declare-fun d!38841 () Bool)

(assert (=> d!38841 e!83757))

(declare-fun res!61938 () Bool)

(assert (=> d!38841 (=> (not res!61938) (not e!83757))))

(assert (=> d!38841 (= res!61938 (_1!1280 lt!66414))))

(assert (=> d!38841 (= lt!66414 (tuple2!2539 true (LongMapFixedSize!1073 (defaultEntry!2804 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd (_size!585 newMap!16) #b00000000000000000000000000000001) (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (_vacant!585 newMap!16))))))

(declare-fun lt!66424 () Unit!3985)

(declare-fun lt!66417 () Unit!3985)

(assert (=> d!38841 (= lt!66424 lt!66417)))

(declare-fun lt!66429 () array!4709)

(declare-fun lt!66430 () array!4707)

(assert (=> d!38841 (contains!869 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(assert (=> d!38841 (= lt!66417 (lemmaValidKeyInArrayIsInListMap!117 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38841 (= lt!66429 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))))

(assert (=> d!38841 (= lt!66430 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun lt!66416 () Unit!3985)

(declare-fun lt!66435 () Unit!3985)

(assert (=> d!38841 (= lt!66416 lt!66435)))

(declare-fun lt!66418 () array!4707)

(assert (=> d!38841 (= (arrayCountValidKeys!0 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!4707 (_ BitVec 32)) Unit!3985)

(assert (=> d!38841 (= lt!66435 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(assert (=> d!38841 (= lt!66418 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun lt!66426 () Unit!3985)

(declare-fun lt!66413 () Unit!3985)

(assert (=> d!38841 (= lt!66426 lt!66413)))

(declare-fun lt!66436 () array!4707)

(assert (=> d!38841 (arrayContainsKey!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4707 (_ BitVec 64) (_ BitVec 32)) Unit!3985)

(assert (=> d!38841 (= lt!66413 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(assert (=> d!38841 (= lt!66436 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun lt!66437 () Unit!3985)

(declare-fun lt!66438 () Unit!3985)

(assert (=> d!38841 (= lt!66437 lt!66438)))

(assert (=> d!38841 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!38 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3985)

(assert (=> d!38841 (= lt!66438 (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66423 () Unit!3985)

(declare-fun lt!66410 () Unit!3985)

(assert (=> d!38841 (= lt!66423 lt!66410)))

(assert (=> d!38841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (mask!7072 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!4707 (_ BitVec 32) (_ BitVec 32)) Unit!3985)

(assert (=> d!38841 (= lt!66410 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (mask!7072 newMap!16)))))

(declare-fun lt!66420 () Unit!3985)

(declare-fun lt!66425 () Unit!3985)

(assert (=> d!38841 (= lt!66420 lt!66425)))

(assert (=> d!38841 (= (arrayCountValidKeys!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!4707 (_ BitVec 32) (_ BitVec 64)) Unit!3985)

(assert (=> d!38841 (= lt!66425 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun lt!66415 () Unit!3985)

(declare-fun lt!66422 () Unit!3985)

(assert (=> d!38841 (= lt!66415 lt!66422)))

(declare-fun lt!66433 () (_ BitVec 32))

(declare-fun lt!66412 () List!1684)

(assert (=> d!38841 (arrayNoDuplicates!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) lt!66433 lt!66412)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!4707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1684) Unit!3985)

(assert (=> d!38841 (= lt!66422 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) lt!66433 lt!66412))))

(assert (=> d!38841 (= lt!66412 Nil!1681)))

(assert (=> d!38841 (= lt!66433 #b00000000000000000000000000000000)))

(declare-fun lt!66419 () Unit!3985)

(assert (=> d!38841 (= lt!66419 e!83761)))

(declare-fun c!23524 () Bool)

(assert (=> d!38841 (= c!23524 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!66439 () Unit!3985)

(assert (=> d!38841 (= lt!66439 e!83759)))

(assert (=> d!38841 (= c!23525 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38841 (valid!527 newMap!16)))

(assert (=> d!38841 (= (updateHelperNewKey!57 newMap!16 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))) lt!66414)))

(declare-fun b!128293 () Bool)

(assert (=> b!128293 (= e!83756 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66411)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!38841 c!23525) b!128289))

(assert (= (and d!38841 (not c!23525)) b!128277))

(assert (= (and b!128289 res!61945) b!128291))

(assert (= (and b!128291 res!61940) b!128293))

(assert (= (and b!128277 c!23526) b!128290))

(assert (= (and b!128277 (not c!23526)) b!128292))

(assert (= (and b!128290 res!61943) b!128285))

(assert (= (and b!128285 res!61941) b!128282))

(assert (= (and b!128292 c!23527) b!128283))

(assert (= (and b!128292 (not c!23527)) b!128284))

(assert (= (and b!128283 res!61944) b!128279))

(assert (= (and b!128279 res!61939) b!128286))

(assert (= (or b!128290 b!128283) bm!13856))

(assert (= (or b!128282 b!128286) bm!13857))

(assert (= (or b!128291 bm!13856) bm!13855))

(assert (= (or b!128289 b!128277) bm!13854))

(assert (= (and d!38841 c!23524) b!128288))

(assert (= (and d!38841 (not c!23524)) b!128287))

(assert (= (and d!38841 res!61938) b!128280))

(assert (= (and b!128280 res!61942) b!128281))

(assert (= (and b!128281 res!61937) b!128278))

(declare-fun m!150133 () Bool)

(assert (=> b!128280 m!150133))

(assert (=> b!128277 m!149721))

(assert (=> b!128277 m!149825))

(assert (=> d!38841 m!149721))

(assert (=> d!38841 m!149877))

(assert (=> d!38841 m!149859))

(declare-fun m!150135 () Bool)

(assert (=> d!38841 m!150135))

(declare-fun m!150137 () Bool)

(assert (=> d!38841 m!150137))

(assert (=> d!38841 m!149721))

(declare-fun m!150139 () Bool)

(assert (=> d!38841 m!150139))

(declare-fun m!150141 () Bool)

(assert (=> d!38841 m!150141))

(declare-fun m!150143 () Bool)

(assert (=> d!38841 m!150143))

(declare-fun m!150145 () Bool)

(assert (=> d!38841 m!150145))

(declare-fun m!150147 () Bool)

(assert (=> d!38841 m!150147))

(assert (=> d!38841 m!149721))

(declare-fun m!150149 () Bool)

(assert (=> d!38841 m!150149))

(assert (=> d!38841 m!150141))

(declare-fun m!150151 () Bool)

(assert (=> d!38841 m!150151))

(declare-fun m!150153 () Bool)

(assert (=> d!38841 m!150153))

(assert (=> d!38841 m!149721))

(assert (=> d!38841 m!149719))

(declare-fun m!150155 () Bool)

(assert (=> d!38841 m!150155))

(assert (=> d!38841 m!149721))

(declare-fun m!150157 () Bool)

(assert (=> d!38841 m!150157))

(declare-fun m!150159 () Bool)

(assert (=> d!38841 m!150159))

(assert (=> d!38841 m!149721))

(declare-fun m!150161 () Bool)

(assert (=> d!38841 m!150161))

(declare-fun m!150163 () Bool)

(assert (=> d!38841 m!150163))

(assert (=> d!38841 m!149721))

(declare-fun m!150165 () Bool)

(assert (=> d!38841 m!150165))

(declare-fun m!150167 () Bool)

(assert (=> d!38841 m!150167))

(assert (=> d!38841 m!149889))

(declare-fun m!150169 () Bool)

(assert (=> d!38841 m!150169))

(assert (=> d!38841 m!149859))

(assert (=> d!38841 m!149721))

(assert (=> d!38841 m!149865))

(assert (=> d!38841 m!150143))

(assert (=> d!38841 m!149859))

(assert (=> d!38841 m!149747))

(declare-fun m!150171 () Bool)

(assert (=> d!38841 m!150171))

(assert (=> b!128289 m!149721))

(assert (=> b!128289 m!149847))

(declare-fun m!150173 () Bool)

(assert (=> b!128279 m!150173))

(declare-fun m!150175 () Bool)

(assert (=> b!128293 m!150175))

(declare-fun m!150177 () Bool)

(assert (=> b!128281 m!150177))

(assert (=> b!128281 m!150177))

(assert (=> b!128281 m!149721))

(declare-fun m!150179 () Bool)

(assert (=> b!128281 m!150179))

(assert (=> bm!13857 m!149721))

(assert (=> bm!13857 m!149877))

(declare-fun m!150181 () Bool)

(assert (=> bm!13855 m!150181))

(declare-fun m!150183 () Bool)

(assert (=> b!128285 m!150183))

(assert (=> b!128288 m!149721))

(declare-fun m!150185 () Bool)

(assert (=> b!128288 m!150185))

(assert (=> b!128288 m!149859))

(assert (=> b!128288 m!149859))

(assert (=> b!128288 m!149721))

(assert (=> b!128288 m!149865))

(assert (=> b!128278 m!150177))

(assert (=> b!128278 m!149741))

(assert (=> b!128278 m!149741))

(declare-fun m!150187 () Bool)

(assert (=> b!128278 m!150187))

(assert (=> bm!13854 m!149721))

(assert (=> bm!13854 m!149851))

(assert (=> bm!13800 d!38841))

(declare-fun d!38843 () Bool)

(declare-fun res!61946 () Bool)

(declare-fun e!83763 () Bool)

(assert (=> d!38843 (=> (not res!61946) (not e!83763))))

(assert (=> d!38843 (= res!61946 (simpleValid!88 (_2!1280 lt!66196)))))

(assert (=> d!38843 (= (valid!527 (_2!1280 lt!66196)) e!83763)))

(declare-fun b!128294 () Bool)

(declare-fun res!61947 () Bool)

(assert (=> b!128294 (=> (not res!61947) (not e!83763))))

(assert (=> b!128294 (= res!61947 (= (arrayCountValidKeys!0 (_keys!4541 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))) (_size!585 (_2!1280 lt!66196))))))

(declare-fun b!128295 () Bool)

(declare-fun res!61948 () Bool)

(assert (=> b!128295 (=> (not res!61948) (not e!83763))))

(assert (=> b!128295 (= res!61948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196))))))

(declare-fun b!128296 () Bool)

(assert (=> b!128296 (= e!83763 (arrayNoDuplicates!0 (_keys!4541 (_2!1280 lt!66196)) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!38843 res!61946) b!128294))

(assert (= (and b!128294 res!61947) b!128295))

(assert (= (and b!128295 res!61948) b!128296))

(declare-fun m!150189 () Bool)

(assert (=> d!38843 m!150189))

(declare-fun m!150191 () Bool)

(assert (=> b!128294 m!150191))

(declare-fun m!150193 () Bool)

(assert (=> b!128295 m!150193))

(declare-fun m!150195 () Bool)

(assert (=> b!128296 m!150195))

(assert (=> d!38781 d!38843))

(assert (=> d!38781 d!38797))

(declare-fun d!38845 () Bool)

(declare-fun e!83764 () Bool)

(assert (=> d!38845 e!83764))

(declare-fun res!61950 () Bool)

(assert (=> d!38845 (=> (not res!61950) (not e!83764))))

(declare-fun lt!66440 () ListLongMap!1639)

(assert (=> d!38845 (= res!61950 (contains!869 lt!66440 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun lt!66442 () List!1682)

(assert (=> d!38845 (= lt!66440 (ListLongMap!1640 lt!66442))))

(declare-fun lt!66441 () Unit!3985)

(declare-fun lt!66443 () Unit!3985)

(assert (=> d!38845 (= lt!66441 lt!66443)))

(assert (=> d!38845 (= (getValueByKey!169 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (Some!174 (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!38845 (= lt!66443 (lemmaContainsTupThenGetReturnValue!84 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!38845 (= lt!66442 (insertStrictlySorted!87 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!38845 (= (+!165 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66440)))

(declare-fun b!128297 () Bool)

(declare-fun res!61949 () Bool)

(assert (=> b!128297 (=> (not res!61949) (not e!83764))))

(assert (=> b!128297 (= res!61949 (= (getValueByKey!169 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (Some!174 (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!128298 () Bool)

(assert (=> b!128298 (= e!83764 (contains!871 (toList!835 lt!66440) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (= (and d!38845 res!61950) b!128297))

(assert (= (and b!128297 res!61949) b!128298))

(declare-fun m!150197 () Bool)

(assert (=> d!38845 m!150197))

(declare-fun m!150199 () Bool)

(assert (=> d!38845 m!150199))

(declare-fun m!150201 () Bool)

(assert (=> d!38845 m!150201))

(declare-fun m!150203 () Bool)

(assert (=> d!38845 m!150203))

(declare-fun m!150205 () Bool)

(assert (=> b!128297 m!150205))

(declare-fun m!150207 () Bool)

(assert (=> b!128298 m!150207))

(assert (=> bm!13835 d!38845))

(declare-fun d!38847 () Bool)

(assert (=> d!38847 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66446 () Unit!3985)

(declare-fun choose!782 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3985)

(assert (=> d!38847 (= lt!66446 (choose!782 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66184 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38847 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38847 (= (lemmaChangeZeroKeyThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66184 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)) lt!66446)))

(declare-fun bs!5321 () Bool)

(assert (= bs!5321 d!38847))

(assert (=> bs!5321 m!149963))

(assert (=> bs!5321 m!149859))

(assert (=> bs!5321 m!149719))

(declare-fun m!150209 () Bool)

(assert (=> bs!5321 m!150209))

(assert (=> bs!5321 m!149719))

(declare-fun m!150211 () Bool)

(assert (=> bs!5321 m!150211))

(assert (=> bs!5321 m!149859))

(declare-fun m!150213 () Bool)

(assert (=> bs!5321 m!150213))

(assert (=> b!128048 d!38847))

(declare-fun d!38849 () Bool)

(declare-fun e!83766 () Bool)

(assert (=> d!38849 e!83766))

(declare-fun res!61951 () Bool)

(assert (=> d!38849 (=> res!61951 e!83766)))

(declare-fun lt!66447 () Bool)

(assert (=> d!38849 (= res!61951 (not lt!66447))))

(declare-fun lt!66450 () Bool)

(assert (=> d!38849 (= lt!66447 lt!66450)))

(declare-fun lt!66448 () Unit!3985)

(declare-fun e!83765 () Unit!3985)

(assert (=> d!38849 (= lt!66448 e!83765)))

(declare-fun c!23528 () Bool)

(assert (=> d!38849 (= c!23528 lt!66450)))

(assert (=> d!38849 (= lt!66450 (containsKey!172 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(assert (=> d!38849 (= (contains!869 e!83614 (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))) lt!66447)))

(declare-fun b!128299 () Bool)

(declare-fun lt!66449 () Unit!3985)

(assert (=> b!128299 (= e!83765 lt!66449)))

(assert (=> b!128299 (= lt!66449 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(assert (=> b!128299 (isDefined!121 (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(declare-fun b!128300 () Bool)

(declare-fun Unit!3996 () Unit!3985)

(assert (=> b!128300 (= e!83765 Unit!3996)))

(declare-fun b!128301 () Bool)

(assert (=> b!128301 (= e!83766 (isDefined!121 (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))))

(assert (= (and d!38849 c!23528) b!128299))

(assert (= (and d!38849 (not c!23528)) b!128300))

(assert (= (and d!38849 (not res!61951)) b!128301))

(declare-fun m!150215 () Bool)

(assert (=> d!38849 m!150215))

(declare-fun m!150217 () Bool)

(assert (=> b!128299 m!150217))

(declare-fun m!150219 () Bool)

(assert (=> b!128299 m!150219))

(assert (=> b!128299 m!150219))

(declare-fun m!150221 () Bool)

(assert (=> b!128299 m!150221))

(assert (=> b!128301 m!150219))

(assert (=> b!128301 m!150219))

(assert (=> b!128301 m!150221))

(assert (=> bm!13793 d!38849))

(declare-fun d!38851 () Bool)

(assert (=> d!38851 (= (apply!112 lt!66270 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5322 () Bool)

(assert (= bs!5322 d!38851))

(assert (=> bs!5322 m!149899))

(declare-fun m!150223 () Bool)

(assert (=> bs!5322 m!150223))

(assert (=> bs!5322 m!150223))

(declare-fun m!150225 () Bool)

(assert (=> bs!5322 m!150225))

(assert (=> b!128140 d!38851))

(declare-fun d!38853 () Bool)

(declare-fun c!23529 () Bool)

(assert (=> d!38853 (= c!23529 ((_ is ValueCellFull!1082) (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!83767 () V!3449)

(assert (=> d!38853 (= (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!83767)))

(declare-fun b!128302 () Bool)

(assert (=> b!128302 (= e!83767 (get!1464 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128303 () Bool)

(assert (=> b!128303 (= e!83767 (get!1465 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38853 c!23529) b!128302))

(assert (= (and d!38853 (not c!23529)) b!128303))

(assert (=> b!128302 m!149947))

(assert (=> b!128302 m!149717))

(declare-fun m!150227 () Bool)

(assert (=> b!128302 m!150227))

(assert (=> b!128303 m!149947))

(assert (=> b!128303 m!149717))

(declare-fun m!150229 () Bool)

(assert (=> b!128303 m!150229))

(assert (=> b!128140 d!38853))

(declare-fun d!38855 () Bool)

(assert (=> d!38855 (= (map!1386 (_2!1280 lt!66196)) (getCurrentListMap!514 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun bs!5323 () Bool)

(assert (= bs!5323 d!38855))

(declare-fun m!150231 () Bool)

(assert (=> bs!5323 m!150231))

(assert (=> bm!13801 d!38855))

(assert (=> b!128131 d!38805))

(declare-fun d!38857 () Bool)

(assert (=> d!38857 (= (inRange!0 (ite c!23471 (ite c!23469 (index!3217 lt!66190) (ite c!23462 (index!3216 lt!66186) (index!3219 lt!66186))) (ite c!23473 (index!3217 lt!66179) (ite c!23463 (index!3216 lt!66201) (index!3219 lt!66201)))) (mask!7072 newMap!16)) (and (bvsge (ite c!23471 (ite c!23469 (index!3217 lt!66190) (ite c!23462 (index!3216 lt!66186) (index!3219 lt!66186))) (ite c!23473 (index!3217 lt!66179) (ite c!23463 (index!3216 lt!66201) (index!3219 lt!66201)))) #b00000000000000000000000000000000) (bvslt (ite c!23471 (ite c!23469 (index!3217 lt!66190) (ite c!23462 (index!3216 lt!66186) (index!3219 lt!66186))) (ite c!23473 (index!3217 lt!66179) (ite c!23463 (index!3216 lt!66201) (index!3219 lt!66201)))) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13806 d!38857))

(declare-fun b!128315 () Bool)

(declare-fun e!83770 () Bool)

(assert (=> b!128315 (= e!83770 (and (bvsge (extraKeys!2581 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!585 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!128312 () Bool)

(declare-fun res!61962 () Bool)

(assert (=> b!128312 (=> (not res!61962) (not e!83770))))

(assert (=> b!128312 (= res!61962 (and (= (size!2494 (_values!2787 newMap!16)) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001)) (= (size!2493 (_keys!4541 newMap!16)) (size!2494 (_values!2787 newMap!16))) (bvsge (_size!585 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!585 newMap!16) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!128313 () Bool)

(declare-fun res!61960 () Bool)

(assert (=> b!128313 (=> (not res!61960) (not e!83770))))

(declare-fun size!2499 (LongMapFixedSize!1072) (_ BitVec 32))

(assert (=> b!128313 (= res!61960 (bvsge (size!2499 newMap!16) (_size!585 newMap!16)))))

(declare-fun d!38859 () Bool)

(declare-fun res!61961 () Bool)

(assert (=> d!38859 (=> (not res!61961) (not e!83770))))

(assert (=> d!38859 (= res!61961 (validMask!0 (mask!7072 newMap!16)))))

(assert (=> d!38859 (= (simpleValid!88 newMap!16) e!83770)))

(declare-fun b!128314 () Bool)

(declare-fun res!61963 () Bool)

(assert (=> b!128314 (=> (not res!61963) (not e!83770))))

(assert (=> b!128314 (= res!61963 (= (size!2499 newMap!16) (bvadd (_size!585 newMap!16) (bvsdiv (bvadd (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!38859 res!61961) b!128312))

(assert (= (and b!128312 res!61962) b!128313))

(assert (= (and b!128313 res!61960) b!128314))

(assert (= (and b!128314 res!61963) b!128315))

(declare-fun m!150233 () Bool)

(assert (=> b!128313 m!150233))

(assert (=> d!38859 m!149963))

(assert (=> b!128314 m!150233))

(assert (=> d!38797 d!38859))

(declare-fun d!38861 () Bool)

(declare-fun e!83773 () Bool)

(assert (=> d!38861 e!83773))

(declare-fun res!61969 () Bool)

(assert (=> d!38861 (=> (not res!61969) (not e!83773))))

(declare-fun lt!66455 () SeekEntryResult!265)

(assert (=> d!38861 (= res!61969 ((_ is Found!265) lt!66455))))

(assert (=> d!38861 (= lt!66455 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun lt!66456 () Unit!3985)

(declare-fun choose!783 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3985)

(assert (=> d!38861 (= lt!66456 (choose!783 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38861 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38861 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) lt!66456)))

(declare-fun b!128320 () Bool)

(declare-fun res!61968 () Bool)

(assert (=> b!128320 (=> (not res!61968) (not e!83773))))

(assert (=> b!128320 (= res!61968 (inRange!0 (index!3217 lt!66455) (mask!7072 newMap!16)))))

(declare-fun b!128321 () Bool)

(assert (=> b!128321 (= e!83773 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66455)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128321 (and (bvsge (index!3217 lt!66455) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66455) (size!2493 (_keys!4541 newMap!16))))))

(assert (= (and d!38861 res!61969) b!128320))

(assert (= (and b!128320 res!61968) b!128321))

(assert (=> d!38861 m!149721))

(assert (=> d!38861 m!149851))

(assert (=> d!38861 m!149721))

(declare-fun m!150235 () Bool)

(assert (=> d!38861 m!150235))

(assert (=> d!38861 m!149963))

(declare-fun m!150237 () Bool)

(assert (=> b!128320 m!150237))

(declare-fun m!150239 () Bool)

(assert (=> b!128321 m!150239))

(assert (=> bm!13799 d!38861))

(declare-fun b!128330 () Bool)

(declare-fun e!83778 () (_ BitVec 32))

(declare-fun call!13863 () (_ BitVec 32))

(assert (=> b!128330 (= e!83778 (bvadd #b00000000000000000000000000000001 call!13863))))

(declare-fun b!128331 () Bool)

(declare-fun e!83779 () (_ BitVec 32))

(assert (=> b!128331 (= e!83779 #b00000000000000000000000000000000)))

(declare-fun bm!13860 () Bool)

(assert (=> bm!13860 (= call!13863 (arrayCountValidKeys!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun d!38863 () Bool)

(declare-fun lt!66459 () (_ BitVec 32))

(assert (=> d!38863 (and (bvsge lt!66459 #b00000000000000000000000000000000) (bvsle lt!66459 (bvsub (size!2493 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38863 (= lt!66459 e!83779)))

(declare-fun c!23535 () Bool)

(assert (=> d!38863 (= c!23535 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38863 (and (bvsle #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2493 (_keys!4541 newMap!16)) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38863 (= (arrayCountValidKeys!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) lt!66459)))

(declare-fun b!128332 () Bool)

(assert (=> b!128332 (= e!83778 call!13863)))

(declare-fun b!128333 () Bool)

(assert (=> b!128333 (= e!83779 e!83778)))

(declare-fun c!23534 () Bool)

(assert (=> b!128333 (= c!23534 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!38863 c!23535) b!128331))

(assert (= (and d!38863 (not c!23535)) b!128333))

(assert (= (and b!128333 c!23534) b!128330))

(assert (= (and b!128333 (not c!23534)) b!128332))

(assert (= (or b!128330 b!128332) bm!13860))

(declare-fun m!150241 () Bool)

(assert (=> bm!13860 m!150241))

(assert (=> b!128333 m!149959))

(assert (=> b!128333 m!149959))

(assert (=> b!128333 m!149965))

(assert (=> b!128082 d!38863))

(declare-fun d!38865 () Bool)

(declare-fun e!83781 () Bool)

(assert (=> d!38865 e!83781))

(declare-fun res!61970 () Bool)

(assert (=> d!38865 (=> res!61970 e!83781)))

(declare-fun lt!66460 () Bool)

(assert (=> d!38865 (= res!61970 (not lt!66460))))

(declare-fun lt!66463 () Bool)

(assert (=> d!38865 (= lt!66460 lt!66463)))

(declare-fun lt!66461 () Unit!3985)

(declare-fun e!83780 () Unit!3985)

(assert (=> d!38865 (= lt!66461 e!83780)))

(declare-fun c!23536 () Bool)

(assert (=> d!38865 (= c!23536 lt!66463)))

(assert (=> d!38865 (= lt!66463 (containsKey!172 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38865 (= (contains!869 lt!66270 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66460)))

(declare-fun b!128334 () Bool)

(declare-fun lt!66462 () Unit!3985)

(assert (=> b!128334 (= e!83780 lt!66462)))

(assert (=> b!128334 (= lt!66462 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128334 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128335 () Bool)

(declare-fun Unit!3997 () Unit!3985)

(assert (=> b!128335 (= e!83780 Unit!3997)))

(declare-fun b!128336 () Bool)

(assert (=> b!128336 (= e!83781 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38865 c!23536) b!128334))

(assert (= (and d!38865 (not c!23536)) b!128335))

(assert (= (and d!38865 (not res!61970)) b!128336))

(declare-fun m!150243 () Bool)

(assert (=> d!38865 m!150243))

(declare-fun m!150245 () Bool)

(assert (=> b!128334 m!150245))

(declare-fun m!150247 () Bool)

(assert (=> b!128334 m!150247))

(assert (=> b!128334 m!150247))

(declare-fun m!150249 () Bool)

(assert (=> b!128334 m!150249))

(assert (=> b!128336 m!150247))

(assert (=> b!128336 m!150247))

(assert (=> b!128336 m!150249))

(assert (=> bm!13830 d!38865))

(declare-fun d!38867 () Bool)

(declare-fun res!61975 () Bool)

(declare-fun e!83786 () Bool)

(assert (=> d!38867 (=> res!61975 e!83786)))

(assert (=> d!38867 (= res!61975 (and ((_ is Cons!1678) (toList!835 lt!66092)) (= (_1!1279 (h!2281 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (=> d!38867 (= (containsKey!172 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!83786)))

(declare-fun b!128341 () Bool)

(declare-fun e!83787 () Bool)

(assert (=> b!128341 (= e!83786 e!83787)))

(declare-fun res!61976 () Bool)

(assert (=> b!128341 (=> (not res!61976) (not e!83787))))

(assert (=> b!128341 (= res!61976 (and (or (not ((_ is Cons!1678) (toList!835 lt!66092))) (bvsle (_1!1279 (h!2281 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) ((_ is Cons!1678) (toList!835 lt!66092)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun b!128342 () Bool)

(assert (=> b!128342 (= e!83787 (containsKey!172 (t!6053 (toList!835 lt!66092)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!38867 (not res!61975)) b!128341))

(assert (= (and b!128341 res!61976) b!128342))

(assert (=> b!128342 m!149721))

(declare-fun m!150251 () Bool)

(assert (=> b!128342 m!150251))

(assert (=> d!38779 d!38867))

(declare-fun b!128351 () Bool)

(declare-fun e!83796 () Bool)

(declare-fun e!83795 () Bool)

(assert (=> b!128351 (= e!83796 e!83795)))

(declare-fun lt!66470 () (_ BitVec 64))

(assert (=> b!128351 (= lt!66470 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66472 () Unit!3985)

(assert (=> b!128351 (= lt!66472 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000))))

(assert (=> b!128351 (arrayContainsKey!0 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000)))

(declare-fun lt!66471 () Unit!3985)

(assert (=> b!128351 (= lt!66471 lt!66472)))

(declare-fun res!61981 () Bool)

(assert (=> b!128351 (= res!61981 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (_keys!4541 newMap!16) (mask!7072 newMap!16)) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!128351 (=> (not res!61981) (not e!83795))))

(declare-fun b!128352 () Bool)

(declare-fun call!13866 () Bool)

(assert (=> b!128352 (= e!83795 call!13866)))

(declare-fun d!38869 () Bool)

(declare-fun res!61982 () Bool)

(declare-fun e!83794 () Bool)

(assert (=> d!38869 (=> res!61982 e!83794)))

(assert (=> d!38869 (= res!61982 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38869 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 newMap!16) (mask!7072 newMap!16)) e!83794)))

(declare-fun bm!13863 () Bool)

(assert (=> bm!13863 (= call!13866 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128353 () Bool)

(assert (=> b!128353 (= e!83794 e!83796)))

(declare-fun c!23539 () Bool)

(assert (=> b!128353 (= c!23539 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128354 () Bool)

(assert (=> b!128354 (= e!83796 call!13866)))

(assert (= (and d!38869 (not res!61982)) b!128353))

(assert (= (and b!128353 c!23539) b!128351))

(assert (= (and b!128353 (not c!23539)) b!128354))

(assert (= (and b!128351 res!61981) b!128352))

(assert (= (or b!128352 b!128354) bm!13863))

(assert (=> b!128351 m!149959))

(declare-fun m!150253 () Bool)

(assert (=> b!128351 m!150253))

(declare-fun m!150255 () Bool)

(assert (=> b!128351 m!150255))

(assert (=> b!128351 m!149959))

(declare-fun m!150257 () Bool)

(assert (=> b!128351 m!150257))

(declare-fun m!150259 () Bool)

(assert (=> bm!13863 m!150259))

(assert (=> b!128353 m!149959))

(assert (=> b!128353 m!149959))

(assert (=> b!128353 m!149965))

(assert (=> b!128083 d!38869))

(declare-fun b!128365 () Bool)

(declare-fun e!83807 () Bool)

(declare-fun e!83805 () Bool)

(assert (=> b!128365 (= e!83807 e!83805)))

(declare-fun c!23542 () Bool)

(assert (=> b!128365 (= c!23542 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!13866 () Bool)

(declare-fun call!13869 () Bool)

(assert (=> bm!13866 (= call!13869 (arrayNoDuplicates!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23542 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) Nil!1681) Nil!1681)))))

(declare-fun b!128366 () Bool)

(declare-fun e!83806 () Bool)

(declare-fun contains!872 (List!1684 (_ BitVec 64)) Bool)

(assert (=> b!128366 (= e!83806 (contains!872 Nil!1681 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!38871 () Bool)

(declare-fun res!61990 () Bool)

(declare-fun e!83808 () Bool)

(assert (=> d!38871 (=> res!61990 e!83808)))

(assert (=> d!38871 (= res!61990 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38871 (= (arrayNoDuplicates!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 Nil!1681) e!83808)))

(declare-fun b!128367 () Bool)

(assert (=> b!128367 (= e!83805 call!13869)))

(declare-fun b!128368 () Bool)

(assert (=> b!128368 (= e!83808 e!83807)))

(declare-fun res!61989 () Bool)

(assert (=> b!128368 (=> (not res!61989) (not e!83807))))

(assert (=> b!128368 (= res!61989 (not e!83806))))

(declare-fun res!61991 () Bool)

(assert (=> b!128368 (=> (not res!61991) (not e!83806))))

(assert (=> b!128368 (= res!61991 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128369 () Bool)

(assert (=> b!128369 (= e!83805 call!13869)))

(assert (= (and d!38871 (not res!61990)) b!128368))

(assert (= (and b!128368 res!61991) b!128366))

(assert (= (and b!128368 res!61989) b!128365))

(assert (= (and b!128365 c!23542) b!128369))

(assert (= (and b!128365 (not c!23542)) b!128367))

(assert (= (or b!128369 b!128367) bm!13866))

(assert (=> b!128365 m!149959))

(assert (=> b!128365 m!149959))

(assert (=> b!128365 m!149965))

(assert (=> bm!13866 m!149959))

(declare-fun m!150261 () Bool)

(assert (=> bm!13866 m!150261))

(assert (=> b!128366 m!149959))

(assert (=> b!128366 m!149959))

(declare-fun m!150263 () Bool)

(assert (=> b!128366 m!150263))

(assert (=> b!128368 m!149959))

(assert (=> b!128368 m!149959))

(assert (=> b!128368 m!149965))

(assert (=> b!128084 d!38871))

(declare-fun d!38873 () Bool)

(assert (=> d!38873 (= (apply!112 lt!66270 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5324 () Bool)

(assert (= bs!5324 d!38873))

(declare-fun m!150265 () Bool)

(assert (=> bs!5324 m!150265))

(assert (=> bs!5324 m!150265))

(declare-fun m!150267 () Bool)

(assert (=> bs!5324 m!150267))

(assert (=> b!128144 d!38873))

(declare-fun d!38875 () Bool)

(assert (=> d!38875 (isDefined!121 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun lt!66475 () Unit!3985)

(declare-fun choose!784 (List!1682 (_ BitVec 64)) Unit!3985)

(assert (=> d!38875 (= lt!66475 (choose!784 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun e!83811 () Bool)

(assert (=> d!38875 e!83811))

(declare-fun res!61994 () Bool)

(assert (=> d!38875 (=> (not res!61994) (not e!83811))))

(declare-fun isStrictlySorted!305 (List!1682) Bool)

(assert (=> d!38875 (= res!61994 (isStrictlySorted!305 (toList!835 lt!66092)))))

(assert (=> d!38875 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66475)))

(declare-fun b!128372 () Bool)

(assert (=> b!128372 (= e!83811 (containsKey!172 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!38875 res!61994) b!128372))

(assert (=> d!38875 m!149721))

(assert (=> d!38875 m!149821))

(assert (=> d!38875 m!149821))

(assert (=> d!38875 m!149823))

(assert (=> d!38875 m!149721))

(declare-fun m!150269 () Bool)

(assert (=> d!38875 m!150269))

(declare-fun m!150271 () Bool)

(assert (=> d!38875 m!150271))

(assert (=> b!128372 m!149721))

(assert (=> b!128372 m!149817))

(assert (=> b!127941 d!38875))

(declare-fun d!38877 () Bool)

(declare-fun isEmpty!406 (Option!175) Bool)

(assert (=> d!38877 (= (isDefined!121 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) (not (isEmpty!406 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun bs!5325 () Bool)

(assert (= bs!5325 d!38877))

(assert (=> bs!5325 m!149821))

(declare-fun m!150273 () Bool)

(assert (=> bs!5325 m!150273))

(assert (=> b!127941 d!38877))

(declare-fun b!128384 () Bool)

(declare-fun e!83817 () Option!175)

(assert (=> b!128384 (= e!83817 None!173)))

(declare-fun b!128383 () Bool)

(assert (=> b!128383 (= e!83817 (getValueByKey!169 (t!6053 (toList!835 lt!66092)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun d!38879 () Bool)

(declare-fun c!23547 () Bool)

(assert (=> d!38879 (= c!23547 (and ((_ is Cons!1678) (toList!835 lt!66092)) (= (_1!1279 (h!2281 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun e!83816 () Option!175)

(assert (=> d!38879 (= (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!83816)))

(declare-fun b!128382 () Bool)

(assert (=> b!128382 (= e!83816 e!83817)))

(declare-fun c!23548 () Bool)

(assert (=> b!128382 (= c!23548 (and ((_ is Cons!1678) (toList!835 lt!66092)) (not (= (_1!1279 (h!2281 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun b!128381 () Bool)

(assert (=> b!128381 (= e!83816 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66092)))))))

(assert (= (and d!38879 c!23547) b!128381))

(assert (= (and d!38879 (not c!23547)) b!128382))

(assert (= (and b!128382 c!23548) b!128383))

(assert (= (and b!128382 (not c!23548)) b!128384))

(assert (=> b!128383 m!149721))

(declare-fun m!150275 () Bool)

(assert (=> b!128383 m!150275))

(assert (=> b!127941 d!38879))

(assert (=> bm!13804 d!38799))

(declare-fun d!38881 () Bool)

(declare-fun res!61995 () Bool)

(declare-fun e!83818 () Bool)

(assert (=> d!38881 (=> (not res!61995) (not e!83818))))

(assert (=> d!38881 (= res!61995 (simpleValid!88 (v!3144 (underlying!443 thiss!992))))))

(assert (=> d!38881 (= (valid!527 (v!3144 (underlying!443 thiss!992))) e!83818)))

(declare-fun b!128385 () Bool)

(declare-fun res!61996 () Bool)

(assert (=> b!128385 (=> (not res!61996) (not e!83818))))

(assert (=> b!128385 (= res!61996 (= (arrayCountValidKeys!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))) (_size!585 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!128386 () Bool)

(declare-fun res!61997 () Bool)

(assert (=> b!128386 (=> (not res!61997) (not e!83818))))

(assert (=> b!128386 (= res!61997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!128387 () Bool)

(assert (=> b!128387 (= e!83818 (arrayNoDuplicates!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!38881 res!61995) b!128385))

(assert (= (and b!128385 res!61996) b!128386))

(assert (= (and b!128386 res!61997) b!128387))

(declare-fun m!150277 () Bool)

(assert (=> d!38881 m!150277))

(declare-fun m!150279 () Bool)

(assert (=> b!128385 m!150279))

(declare-fun m!150281 () Bool)

(assert (=> b!128386 m!150281))

(declare-fun m!150283 () Bool)

(assert (=> b!128387 m!150283))

(assert (=> d!38785 d!38881))

(declare-fun b!128400 () Bool)

(declare-fun e!83826 () SeekEntryResult!265)

(declare-fun lt!66484 () SeekEntryResult!265)

(assert (=> b!128400 (= e!83826 (MissingZero!265 (index!3218 lt!66484)))))

(declare-fun b!128401 () Bool)

(declare-fun e!83825 () SeekEntryResult!265)

(assert (=> b!128401 (= e!83825 (Found!265 (index!3218 lt!66484)))))

(declare-fun lt!66482 () SeekEntryResult!265)

(declare-fun d!38883 () Bool)

(assert (=> d!38883 (and (or ((_ is Undefined!265) lt!66482) (not ((_ is Found!265) lt!66482)) (and (bvsge (index!3217 lt!66482) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66482) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66482) ((_ is Found!265) lt!66482) (not ((_ is MissingZero!265) lt!66482)) (and (bvsge (index!3216 lt!66482) #b00000000000000000000000000000000) (bvslt (index!3216 lt!66482) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66482) ((_ is Found!265) lt!66482) ((_ is MissingZero!265) lt!66482) (not ((_ is MissingVacant!265) lt!66482)) (and (bvsge (index!3219 lt!66482) #b00000000000000000000000000000000) (bvslt (index!3219 lt!66482) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66482) (ite ((_ is Found!265) lt!66482) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66482)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite ((_ is MissingZero!265) lt!66482) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66482)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!265) lt!66482) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66482)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!83827 () SeekEntryResult!265)

(assert (=> d!38883 (= lt!66482 e!83827)))

(declare-fun c!23555 () Bool)

(assert (=> d!38883 (= c!23555 (and ((_ is Intermediate!265) lt!66484) (undefined!1077 lt!66484)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4707 (_ BitVec 32)) SeekEntryResult!265)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!38883 (= lt!66484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(assert (=> d!38883 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38883 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)) lt!66482)))

(declare-fun b!128402 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!4707 (_ BitVec 32)) SeekEntryResult!265)

(assert (=> b!128402 (= e!83826 (seekKeyOrZeroReturnVacant!0 (x!15116 lt!66484) (index!3218 lt!66484) (index!3218 lt!66484) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128403 () Bool)

(assert (=> b!128403 (= e!83827 Undefined!265)))

(declare-fun b!128404 () Bool)

(declare-fun c!23556 () Bool)

(declare-fun lt!66483 () (_ BitVec 64))

(assert (=> b!128404 (= c!23556 (= lt!66483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128404 (= e!83825 e!83826)))

(declare-fun b!128405 () Bool)

(assert (=> b!128405 (= e!83827 e!83825)))

(assert (=> b!128405 (= lt!66483 (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66484)))))

(declare-fun c!23557 () Bool)

(assert (=> b!128405 (= c!23557 (= lt!66483 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!38883 c!23555) b!128403))

(assert (= (and d!38883 (not c!23555)) b!128405))

(assert (= (and b!128405 c!23557) b!128401))

(assert (= (and b!128405 (not c!23557)) b!128404))

(assert (= (and b!128404 c!23556) b!128400))

(assert (= (and b!128404 (not c!23556)) b!128402))

(declare-fun m!150285 () Bool)

(assert (=> d!38883 m!150285))

(declare-fun m!150287 () Bool)

(assert (=> d!38883 m!150287))

(assert (=> d!38883 m!149721))

(declare-fun m!150289 () Bool)

(assert (=> d!38883 m!150289))

(declare-fun m!150291 () Bool)

(assert (=> d!38883 m!150291))

(assert (=> d!38883 m!149963))

(assert (=> d!38883 m!150289))

(assert (=> d!38883 m!149721))

(declare-fun m!150293 () Bool)

(assert (=> d!38883 m!150293))

(assert (=> b!128402 m!149721))

(declare-fun m!150295 () Bool)

(assert (=> b!128402 m!150295))

(declare-fun m!150297 () Bool)

(assert (=> b!128405 m!150297))

(assert (=> bm!13812 d!38883))

(declare-fun d!38885 () Bool)

(declare-fun e!83829 () Bool)

(assert (=> d!38885 e!83829))

(declare-fun res!61998 () Bool)

(assert (=> d!38885 (=> res!61998 e!83829)))

(declare-fun lt!66485 () Bool)

(assert (=> d!38885 (= res!61998 (not lt!66485))))

(declare-fun lt!66488 () Bool)

(assert (=> d!38885 (= lt!66485 lt!66488)))

(declare-fun lt!66486 () Unit!3985)

(declare-fun e!83828 () Unit!3985)

(assert (=> d!38885 (= lt!66486 e!83828)))

(declare-fun c!23558 () Bool)

(assert (=> d!38885 (= c!23558 lt!66488)))

(assert (=> d!38885 (= lt!66488 (containsKey!172 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38885 (= (contains!869 lt!66270 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66485)))

(declare-fun b!128406 () Bool)

(declare-fun lt!66487 () Unit!3985)

(assert (=> b!128406 (= e!83828 lt!66487)))

(assert (=> b!128406 (= lt!66487 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128406 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128407 () Bool)

(declare-fun Unit!3998 () Unit!3985)

(assert (=> b!128407 (= e!83828 Unit!3998)))

(declare-fun b!128408 () Bool)

(assert (=> b!128408 (= e!83829 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38885 c!23558) b!128406))

(assert (= (and d!38885 (not c!23558)) b!128407))

(assert (= (and d!38885 (not res!61998)) b!128408))

(declare-fun m!150299 () Bool)

(assert (=> d!38885 m!150299))

(declare-fun m!150301 () Bool)

(assert (=> b!128406 m!150301))

(assert (=> b!128406 m!150265))

(assert (=> b!128406 m!150265))

(declare-fun m!150303 () Bool)

(assert (=> b!128406 m!150303))

(assert (=> b!128408 m!150265))

(assert (=> b!128408 m!150265))

(assert (=> b!128408 m!150303))

(assert (=> bm!13832 d!38885))

(declare-fun bm!13867 () Bool)

(declare-fun call!13876 () ListLongMap!1639)

(declare-fun call!13873 () ListLongMap!1639)

(assert (=> bm!13867 (= call!13876 call!13873)))

(declare-fun b!128409 () Bool)

(declare-fun res!62005 () Bool)

(declare-fun e!83831 () Bool)

(assert (=> b!128409 (=> (not res!62005) (not e!83831))))

(declare-fun e!83840 () Bool)

(assert (=> b!128409 (= res!62005 e!83840)))

(declare-fun c!23562 () Bool)

(assert (=> b!128409 (= c!23562 (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128410 () Bool)

(declare-fun e!83834 () Bool)

(assert (=> b!128410 (= e!83834 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128411 () Bool)

(declare-fun e!83836 () ListLongMap!1639)

(declare-fun e!83841 () ListLongMap!1639)

(assert (=> b!128411 (= e!83836 e!83841)))

(declare-fun c!23564 () Bool)

(assert (=> b!128411 (= c!23564 (and (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128412 () Bool)

(declare-fun call!13874 () Bool)

(assert (=> b!128412 (= e!83840 (not call!13874))))

(declare-fun bm!13868 () Bool)

(declare-fun lt!66510 () ListLongMap!1639)

(assert (=> bm!13868 (= call!13874 (contains!869 lt!66510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13869 () Bool)

(declare-fun call!13871 () ListLongMap!1639)

(declare-fun call!13875 () ListLongMap!1639)

(assert (=> bm!13869 (= call!13871 call!13875)))

(declare-fun b!128413 () Bool)

(declare-fun e!83838 () Bool)

(assert (=> b!128413 (= e!83838 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128414 () Bool)

(declare-fun e!83830 () Bool)

(assert (=> b!128414 (= e!83830 (= (apply!112 lt!66510 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128415 () Bool)

(assert (=> b!128415 (= e!83840 e!83830)))

(declare-fun res!62000 () Bool)

(assert (=> b!128415 (= res!62000 call!13874)))

(assert (=> b!128415 (=> (not res!62000) (not e!83830))))

(declare-fun d!38887 () Bool)

(assert (=> d!38887 e!83831))

(declare-fun res!62001 () Bool)

(assert (=> d!38887 (=> (not res!62001) (not e!83831))))

(assert (=> d!38887 (= res!62001 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66498 () ListLongMap!1639)

(assert (=> d!38887 (= lt!66510 lt!66498)))

(declare-fun lt!66502 () Unit!3985)

(declare-fun e!83837 () Unit!3985)

(assert (=> d!38887 (= lt!66502 e!83837)))

(declare-fun c!23563 () Bool)

(assert (=> d!38887 (= c!23563 e!83834)))

(declare-fun res!62002 () Bool)

(assert (=> d!38887 (=> (not res!62002) (not e!83834))))

(assert (=> d!38887 (= res!62002 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38887 (= lt!66498 e!83836)))

(declare-fun c!23560 () Bool)

(assert (=> d!38887 (= c!23560 (and (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38887 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38887 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66510)))

(declare-fun b!128416 () Bool)

(declare-fun Unit!3999 () Unit!3985)

(assert (=> b!128416 (= e!83837 Unit!3999)))

(declare-fun bm!13870 () Bool)

(declare-fun call!13870 () Bool)

(assert (=> bm!13870 (= call!13870 (contains!869 lt!66510 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128417 () Bool)

(declare-fun e!83833 () ListLongMap!1639)

(assert (=> b!128417 (= e!83833 call!13876)))

(declare-fun b!128418 () Bool)

(declare-fun e!83832 () Bool)

(assert (=> b!128418 (= e!83832 (not call!13870))))

(declare-fun b!128419 () Bool)

(declare-fun e!83835 () Bool)

(declare-fun e!83839 () Bool)

(assert (=> b!128419 (= e!83835 e!83839)))

(declare-fun res!62006 () Bool)

(assert (=> b!128419 (=> (not res!62006) (not e!83839))))

(assert (=> b!128419 (= res!62006 (contains!869 lt!66510 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128419 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13871 () Bool)

(declare-fun call!13872 () ListLongMap!1639)

(assert (=> bm!13871 (= call!13872 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128420 () Bool)

(assert (=> b!128420 (= e!83836 (+!165 call!13873 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(declare-fun bm!13872 () Bool)

(assert (=> bm!13872 (= call!13875 call!13872)))

(declare-fun b!128421 () Bool)

(assert (=> b!128421 (= e!83831 e!83832)))

(declare-fun c!23561 () Bool)

(assert (=> b!128421 (= c!23561 (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128422 () Bool)

(assert (=> b!128422 (= e!83839 (= (apply!112 lt!66510 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))))))))

(assert (=> b!128422 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128423 () Bool)

(declare-fun res!62007 () Bool)

(assert (=> b!128423 (=> (not res!62007) (not e!83831))))

(assert (=> b!128423 (= res!62007 e!83835)))

(declare-fun res!61999 () Bool)

(assert (=> b!128423 (=> res!61999 e!83835)))

(assert (=> b!128423 (= res!61999 (not e!83838))))

(declare-fun res!62004 () Bool)

(assert (=> b!128423 (=> (not res!62004) (not e!83838))))

(assert (=> b!128423 (= res!62004 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13873 () Bool)

(assert (=> bm!13873 (= call!13873 (+!165 (ite c!23560 call!13872 (ite c!23564 call!13875 call!13871)) (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun b!128424 () Bool)

(declare-fun lt!66489 () Unit!3985)

(assert (=> b!128424 (= e!83837 lt!66489)))

(declare-fun lt!66491 () ListLongMap!1639)

(assert (=> b!128424 (= lt!66491 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66495 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66495 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66492 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66492 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66509 () Unit!3985)

(assert (=> b!128424 (= lt!66509 (addStillContains!88 lt!66491 lt!66495 (zeroValue!2665 newMap!16) lt!66492))))

(assert (=> b!128424 (contains!869 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) lt!66492)))

(declare-fun lt!66496 () Unit!3985)

(assert (=> b!128424 (= lt!66496 lt!66509)))

(declare-fun lt!66508 () ListLongMap!1639)

(assert (=> b!128424 (= lt!66508 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66494 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66494 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66503 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66503 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66504 () Unit!3985)

(assert (=> b!128424 (= lt!66504 (addApplyDifferent!88 lt!66508 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66503))))

(assert (=> b!128424 (= (apply!112 (+!165 lt!66508 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66503) (apply!112 lt!66508 lt!66503))))

(declare-fun lt!66500 () Unit!3985)

(assert (=> b!128424 (= lt!66500 lt!66504)))

(declare-fun lt!66505 () ListLongMap!1639)

(assert (=> b!128424 (= lt!66505 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66506 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66506 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66497 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66497 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66499 () Unit!3985)

(assert (=> b!128424 (= lt!66499 (addApplyDifferent!88 lt!66505 lt!66506 (zeroValue!2665 newMap!16) lt!66497))))

(assert (=> b!128424 (= (apply!112 (+!165 lt!66505 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) lt!66497) (apply!112 lt!66505 lt!66497))))

(declare-fun lt!66493 () Unit!3985)

(assert (=> b!128424 (= lt!66493 lt!66499)))

(declare-fun lt!66507 () ListLongMap!1639)

(assert (=> b!128424 (= lt!66507 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66501 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66501 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66490 () (_ BitVec 64))

(assert (=> b!128424 (= lt!66490 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128424 (= lt!66489 (addApplyDifferent!88 lt!66507 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66490))))

(assert (=> b!128424 (= (apply!112 (+!165 lt!66507 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66490) (apply!112 lt!66507 lt!66490))))

(declare-fun b!128425 () Bool)

(assert (=> b!128425 (= e!83833 call!13871)))

(declare-fun e!83842 () Bool)

(declare-fun b!128426 () Bool)

(assert (=> b!128426 (= e!83842 (= (apply!112 lt!66510 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))

(declare-fun b!128427 () Bool)

(assert (=> b!128427 (= e!83841 call!13876)))

(declare-fun c!23559 () Bool)

(declare-fun b!128428 () Bool)

(assert (=> b!128428 (= c!23559 (and (not (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128428 (= e!83841 e!83833)))

(declare-fun b!128429 () Bool)

(assert (=> b!128429 (= e!83832 e!83842)))

(declare-fun res!62003 () Bool)

(assert (=> b!128429 (= res!62003 call!13870)))

(assert (=> b!128429 (=> (not res!62003) (not e!83842))))

(assert (= (and d!38887 c!23560) b!128420))

(assert (= (and d!38887 (not c!23560)) b!128411))

(assert (= (and b!128411 c!23564) b!128427))

(assert (= (and b!128411 (not c!23564)) b!128428))

(assert (= (and b!128428 c!23559) b!128417))

(assert (= (and b!128428 (not c!23559)) b!128425))

(assert (= (or b!128417 b!128425) bm!13869))

(assert (= (or b!128427 bm!13869) bm!13872))

(assert (= (or b!128427 b!128417) bm!13867))

(assert (= (or b!128420 bm!13872) bm!13871))

(assert (= (or b!128420 bm!13867) bm!13873))

(assert (= (and d!38887 res!62002) b!128410))

(assert (= (and d!38887 c!23563) b!128424))

(assert (= (and d!38887 (not c!23563)) b!128416))

(assert (= (and d!38887 res!62001) b!128423))

(assert (= (and b!128423 res!62004) b!128413))

(assert (= (and b!128423 (not res!61999)) b!128419))

(assert (= (and b!128419 res!62006) b!128422))

(assert (= (and b!128423 res!62007) b!128409))

(assert (= (and b!128409 c!23562) b!128415))

(assert (= (and b!128409 (not c!23562)) b!128412))

(assert (= (and b!128415 res!62000) b!128414))

(assert (= (or b!128415 b!128412) bm!13868))

(assert (= (and b!128409 res!62005) b!128421))

(assert (= (and b!128421 c!23561) b!128429))

(assert (= (and b!128421 (not c!23561)) b!128418))

(assert (= (and b!128429 res!62003) b!128426))

(assert (= (or b!128429 b!128418) bm!13870))

(declare-fun b_lambda!5679 () Bool)

(assert (=> (not b_lambda!5679) (not b!128422)))

(assert (=> b!128422 t!6065))

(declare-fun b_and!7929 () Bool)

(assert (= b_and!7925 (and (=> t!6065 result!3889) b_and!7929)))

(assert (=> b!128422 t!6067))

(declare-fun b_and!7931 () Bool)

(assert (= b_and!7927 (and (=> t!6067 result!3891) b_and!7931)))

(declare-fun m!150305 () Bool)

(assert (=> bm!13868 m!150305))

(declare-fun m!150307 () Bool)

(assert (=> bm!13871 m!150307))

(assert (=> b!128419 m!149959))

(assert (=> b!128419 m!149959))

(declare-fun m!150309 () Bool)

(assert (=> b!128419 m!150309))

(assert (=> d!38887 m!149963))

(assert (=> b!128413 m!149959))

(assert (=> b!128413 m!149959))

(assert (=> b!128413 m!149965))

(assert (=> b!128410 m!149959))

(assert (=> b!128410 m!149959))

(assert (=> b!128410 m!149965))

(declare-fun m!150311 () Bool)

(assert (=> b!128420 m!150311))

(declare-fun m!150313 () Bool)

(assert (=> bm!13870 m!150313))

(declare-fun m!150315 () Bool)

(assert (=> b!128426 m!150315))

(declare-fun m!150317 () Bool)

(assert (=> b!128424 m!150317))

(declare-fun m!150319 () Bool)

(assert (=> b!128424 m!150319))

(declare-fun m!150321 () Bool)

(assert (=> b!128424 m!150321))

(declare-fun m!150323 () Bool)

(assert (=> b!128424 m!150323))

(declare-fun m!150325 () Bool)

(assert (=> b!128424 m!150325))

(declare-fun m!150327 () Bool)

(assert (=> b!128424 m!150327))

(declare-fun m!150329 () Bool)

(assert (=> b!128424 m!150329))

(declare-fun m!150331 () Bool)

(assert (=> b!128424 m!150331))

(declare-fun m!150333 () Bool)

(assert (=> b!128424 m!150333))

(assert (=> b!128424 m!150321))

(declare-fun m!150335 () Bool)

(assert (=> b!128424 m!150335))

(declare-fun m!150337 () Bool)

(assert (=> b!128424 m!150337))

(declare-fun m!150339 () Bool)

(assert (=> b!128424 m!150339))

(declare-fun m!150341 () Bool)

(assert (=> b!128424 m!150341))

(assert (=> b!128424 m!150331))

(declare-fun m!150343 () Bool)

(assert (=> b!128424 m!150343))

(declare-fun m!150345 () Bool)

(assert (=> b!128424 m!150345))

(assert (=> b!128424 m!149959))

(assert (=> b!128424 m!150325))

(assert (=> b!128424 m!150339))

(assert (=> b!128424 m!150307))

(declare-fun m!150347 () Bool)

(assert (=> b!128414 m!150347))

(declare-fun m!150349 () Bool)

(assert (=> bm!13873 m!150349))

(assert (=> b!128422 m!149959))

(assert (=> b!128422 m!149959))

(declare-fun m!150351 () Bool)

(assert (=> b!128422 m!150351))

(declare-fun m!150353 () Bool)

(assert (=> b!128422 m!150353))

(assert (=> b!128422 m!150011))

(declare-fun m!150355 () Bool)

(assert (=> b!128422 m!150355))

(assert (=> b!128422 m!150353))

(assert (=> b!128422 m!150011))

(assert (=> bm!13797 d!38887))

(assert (=> b!127943 d!38877))

(assert (=> b!127943 d!38879))

(declare-fun d!38889 () Bool)

(declare-fun e!83843 () Bool)

(assert (=> d!38889 e!83843))

(declare-fun res!62009 () Bool)

(assert (=> d!38889 (=> (not res!62009) (not e!83843))))

(declare-fun lt!66511 () ListLongMap!1639)

(assert (=> d!38889 (= res!62009 (contains!869 lt!66511 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!66513 () List!1682)

(assert (=> d!38889 (= lt!66511 (ListLongMap!1640 lt!66513))))

(declare-fun lt!66512 () Unit!3985)

(declare-fun lt!66514 () Unit!3985)

(assert (=> d!38889 (= lt!66512 lt!66514)))

(assert (=> d!38889 (= (getValueByKey!169 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38889 (= lt!66514 (lemmaContainsTupThenGetReturnValue!84 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38889 (= lt!66513 (insertStrictlySorted!87 (toList!835 e!83611) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!38889 (= (+!165 e!83611 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66511)))

(declare-fun b!128430 () Bool)

(declare-fun res!62008 () Bool)

(assert (=> b!128430 (=> (not res!62008) (not e!83843))))

(assert (=> b!128430 (= res!62008 (= (getValueByKey!169 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!128431 () Bool)

(assert (=> b!128431 (= e!83843 (contains!871 (toList!835 lt!66511) (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!38889 res!62009) b!128430))

(assert (= (and b!128430 res!62008) b!128431))

(declare-fun m!150357 () Bool)

(assert (=> d!38889 m!150357))

(declare-fun m!150359 () Bool)

(assert (=> d!38889 m!150359))

(declare-fun m!150361 () Bool)

(assert (=> d!38889 m!150361))

(declare-fun m!150363 () Bool)

(assert (=> d!38889 m!150363))

(declare-fun m!150365 () Bool)

(assert (=> b!128430 m!150365))

(declare-fun m!150367 () Bool)

(assert (=> b!128431 m!150367))

(assert (=> bm!13813 d!38889))

(declare-fun d!38891 () Bool)

(assert (=> d!38891 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66517 () Unit!3985)

(declare-fun choose!785 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 V!3449 Int) Unit!3985)

(assert (=> d!38891 (= lt!66517 (choose!785 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38891 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38891 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66517)))

(declare-fun bs!5326 () Bool)

(assert (= bs!5326 d!38891))

(assert (=> bs!5326 m!149963))

(assert (=> bs!5326 m!149719))

(declare-fun m!150369 () Bool)

(assert (=> bs!5326 m!150369))

(assert (=> bs!5326 m!149859))

(assert (=> bs!5326 m!149859))

(declare-fun m!150371 () Bool)

(assert (=> bs!5326 m!150371))

(assert (=> bs!5326 m!149719))

(declare-fun m!150373 () Bool)

(assert (=> bs!5326 m!150373))

(assert (=> b!128054 d!38891))

(assert (=> d!38801 d!38787))

(declare-fun d!38893 () Bool)

(assert (=> d!38893 (= (apply!112 lt!66270 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5327 () Bool)

(assert (= bs!5327 d!38893))

(assert (=> bs!5327 m!150247))

(assert (=> bs!5327 m!150247))

(declare-fun m!150375 () Bool)

(assert (=> bs!5327 m!150375))

(assert (=> b!128132 d!38893))

(declare-fun d!38895 () Bool)

(assert (=> d!38895 (= (get!1464 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3143 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128074 d!38895))

(declare-fun d!38897 () Bool)

(declare-fun e!83846 () Bool)

(assert (=> d!38897 e!83846))

(declare-fun res!62012 () Bool)

(assert (=> d!38897 (=> (not res!62012) (not e!83846))))

(assert (=> d!38897 (= res!62012 (and (bvsge (index!3217 lt!66202) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66202) (size!2493 (_keys!4541 newMap!16)))))))

(declare-fun lt!66520 () Unit!3985)

(declare-fun choose!786 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) Int) Unit!3985)

(assert (=> d!38897 (= lt!66520 (choose!786 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38897 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38897 (= (lemmaValidKeyInArrayIsInListMap!117 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (defaultEntry!2804 newMap!16)) lt!66520)))

(declare-fun b!128434 () Bool)

(assert (=> b!128434 (= e!83846 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))

(assert (= (and d!38897 res!62012) b!128434))

(declare-fun m!150377 () Bool)

(assert (=> d!38897 m!150377))

(assert (=> d!38897 m!149963))

(declare-fun m!150379 () Bool)

(assert (=> b!128434 m!150379))

(assert (=> b!128434 m!149871))

(assert (=> b!128434 m!150379))

(assert (=> b!128434 m!149871))

(declare-fun m!150381 () Bool)

(assert (=> b!128434 m!150381))

(assert (=> b!128035 d!38897))

(declare-fun d!38899 () Bool)

(declare-fun e!83849 () Bool)

(assert (=> d!38899 e!83849))

(declare-fun res!62015 () Bool)

(assert (=> d!38899 (=> (not res!62015) (not e!83849))))

(assert (=> d!38899 (= res!62015 (and (bvsge (index!3217 lt!66202) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66202) (size!2494 (_values!2787 newMap!16)))))))

(declare-fun lt!66523 () Unit!3985)

(declare-fun choose!787 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3985)

(assert (=> d!38899 (= lt!66523 (choose!787 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38899 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38899 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66523)))

(declare-fun b!128437 () Bool)

(assert (=> b!128437 (= e!83849 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))))

(assert (= (and d!38899 res!62015) b!128437))

(assert (=> d!38899 m!149721))

(assert (=> d!38899 m!149719))

(declare-fun m!150383 () Bool)

(assert (=> d!38899 m!150383))

(assert (=> d!38899 m!149963))

(assert (=> b!128437 m!149859))

(assert (=> b!128437 m!149859))

(assert (=> b!128437 m!150135))

(assert (=> b!128437 m!149839))

(declare-fun m!150385 () Bool)

(assert (=> b!128437 m!150385))

(assert (=> b!128035 d!38899))

(declare-fun d!38901 () Bool)

(declare-fun e!83851 () Bool)

(assert (=> d!38901 e!83851))

(declare-fun res!62016 () Bool)

(assert (=> d!38901 (=> res!62016 e!83851)))

(declare-fun lt!66524 () Bool)

(assert (=> d!38901 (= res!62016 (not lt!66524))))

(declare-fun lt!66527 () Bool)

(assert (=> d!38901 (= lt!66524 lt!66527)))

(declare-fun lt!66525 () Unit!3985)

(declare-fun e!83850 () Unit!3985)

(assert (=> d!38901 (= lt!66525 e!83850)))

(declare-fun c!23565 () Bool)

(assert (=> d!38901 (= c!23565 lt!66527)))

(assert (=> d!38901 (= lt!66527 (containsKey!172 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38901 (= (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66524)))

(declare-fun b!128438 () Bool)

(declare-fun lt!66526 () Unit!3985)

(assert (=> b!128438 (= e!83850 lt!66526)))

(assert (=> b!128438 (= lt!66526 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128438 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128439 () Bool)

(declare-fun Unit!4000 () Unit!3985)

(assert (=> b!128439 (= e!83850 Unit!4000)))

(declare-fun b!128440 () Bool)

(assert (=> b!128440 (= e!83851 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (= (and d!38901 c!23565) b!128438))

(assert (= (and d!38901 (not c!23565)) b!128439))

(assert (= (and d!38901 (not res!62016)) b!128440))

(assert (=> d!38901 m!149721))

(declare-fun m!150387 () Bool)

(assert (=> d!38901 m!150387))

(assert (=> b!128438 m!149721))

(declare-fun m!150389 () Bool)

(assert (=> b!128438 m!150389))

(assert (=> b!128438 m!149721))

(declare-fun m!150391 () Bool)

(assert (=> b!128438 m!150391))

(assert (=> b!128438 m!150391))

(declare-fun m!150393 () Bool)

(assert (=> b!128438 m!150393))

(assert (=> b!128440 m!149721))

(assert (=> b!128440 m!150391))

(assert (=> b!128440 m!150391))

(assert (=> b!128440 m!150393))

(assert (=> b!128035 d!38901))

(assert (=> b!128035 d!38803))

(declare-fun d!38903 () Bool)

(declare-fun e!83853 () Bool)

(assert (=> d!38903 e!83853))

(declare-fun res!62017 () Bool)

(assert (=> d!38903 (=> res!62017 e!83853)))

(declare-fun lt!66528 () Bool)

(assert (=> d!38903 (= res!62017 (not lt!66528))))

(declare-fun lt!66531 () Bool)

(assert (=> d!38903 (= lt!66528 lt!66531)))

(declare-fun lt!66529 () Unit!3985)

(declare-fun e!83852 () Unit!3985)

(assert (=> d!38903 (= lt!66529 e!83852)))

(declare-fun c!23566 () Bool)

(assert (=> d!38903 (= c!23566 lt!66531)))

(assert (=> d!38903 (= lt!66531 (containsKey!172 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38903 (= (contains!869 call!13817 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66528)))

(declare-fun b!128441 () Bool)

(declare-fun lt!66530 () Unit!3985)

(assert (=> b!128441 (= e!83852 lt!66530)))

(assert (=> b!128441 (= lt!66530 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128441 (isDefined!121 (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128442 () Bool)

(declare-fun Unit!4001 () Unit!3985)

(assert (=> b!128442 (= e!83852 Unit!4001)))

(declare-fun b!128443 () Bool)

(assert (=> b!128443 (= e!83853 (isDefined!121 (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (= (and d!38903 c!23566) b!128441))

(assert (= (and d!38903 (not c!23566)) b!128442))

(assert (= (and d!38903 (not res!62017)) b!128443))

(assert (=> d!38903 m!149721))

(declare-fun m!150395 () Bool)

(assert (=> d!38903 m!150395))

(assert (=> b!128441 m!149721))

(declare-fun m!150397 () Bool)

(assert (=> b!128441 m!150397))

(assert (=> b!128441 m!149721))

(declare-fun m!150399 () Bool)

(assert (=> b!128441 m!150399))

(assert (=> b!128441 m!150399))

(declare-fun m!150401 () Bool)

(assert (=> b!128441 m!150401))

(assert (=> b!128443 m!149721))

(assert (=> b!128443 m!150399))

(assert (=> b!128443 m!150399))

(assert (=> b!128443 m!150401))

(assert (=> b!128049 d!38903))

(declare-fun d!38905 () Bool)

(assert (=> d!38905 (= (get!1465 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128075 d!38905))

(assert (=> b!128050 d!38883))

(declare-fun d!38907 () Bool)

(declare-fun e!83854 () Bool)

(assert (=> d!38907 e!83854))

(declare-fun res!62019 () Bool)

(assert (=> d!38907 (=> (not res!62019) (not e!83854))))

(declare-fun lt!66532 () ListLongMap!1639)

(assert (=> d!38907 (= res!62019 (contains!869 lt!66532 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66534 () List!1682)

(assert (=> d!38907 (= lt!66532 (ListLongMap!1640 lt!66534))))

(declare-fun lt!66533 () Unit!3985)

(declare-fun lt!66535 () Unit!3985)

(assert (=> d!38907 (= lt!66533 lt!66535)))

(assert (=> d!38907 (= (getValueByKey!169 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38907 (= lt!66535 (lemmaContainsTupThenGetReturnValue!84 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38907 (= lt!66534 (insertStrictlySorted!87 (toList!835 call!13835) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38907 (= (+!165 call!13835 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66532)))

(declare-fun b!128444 () Bool)

(declare-fun res!62018 () Bool)

(assert (=> b!128444 (=> (not res!62018) (not e!83854))))

(assert (=> b!128444 (= res!62018 (= (getValueByKey!169 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128445 () Bool)

(assert (=> b!128445 (= e!83854 (contains!871 (toList!835 lt!66532) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38907 res!62019) b!128444))

(assert (= (and b!128444 res!62018) b!128445))

(declare-fun m!150403 () Bool)

(assert (=> d!38907 m!150403))

(declare-fun m!150405 () Bool)

(assert (=> d!38907 m!150405))

(declare-fun m!150407 () Bool)

(assert (=> d!38907 m!150407))

(declare-fun m!150409 () Bool)

(assert (=> d!38907 m!150409))

(declare-fun m!150411 () Bool)

(assert (=> b!128444 m!150411))

(declare-fun m!150413 () Bool)

(assert (=> b!128445 m!150413))

(assert (=> b!128138 d!38907))

(declare-fun d!38909 () Bool)

(declare-fun e!83855 () Bool)

(assert (=> d!38909 e!83855))

(declare-fun res!62021 () Bool)

(assert (=> d!38909 (=> (not res!62021) (not e!83855))))

(declare-fun lt!66536 () ListLongMap!1639)

(assert (=> d!38909 (= res!62021 (contains!869 lt!66536 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66538 () List!1682)

(assert (=> d!38909 (= lt!66536 (ListLongMap!1640 lt!66538))))

(declare-fun lt!66537 () Unit!3985)

(declare-fun lt!66539 () Unit!3985)

(assert (=> d!38909 (= lt!66537 lt!66539)))

(assert (=> d!38909 (= (getValueByKey!169 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38909 (= lt!66539 (lemmaContainsTupThenGetReturnValue!84 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38909 (= lt!66538 (insertStrictlySorted!87 (toList!835 call!13795) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38909 (= (+!165 call!13795 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66536)))

(declare-fun b!128446 () Bool)

(declare-fun res!62020 () Bool)

(assert (=> b!128446 (=> (not res!62020) (not e!83855))))

(assert (=> b!128446 (= res!62020 (= (getValueByKey!169 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128447 () Bool)

(assert (=> b!128447 (= e!83855 (contains!871 (toList!835 lt!66536) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38909 res!62021) b!128446))

(assert (= (and b!128446 res!62020) b!128447))

(declare-fun m!150415 () Bool)

(assert (=> d!38909 m!150415))

(declare-fun m!150417 () Bool)

(assert (=> d!38909 m!150417))

(declare-fun m!150419 () Bool)

(assert (=> d!38909 m!150419))

(declare-fun m!150421 () Bool)

(assert (=> d!38909 m!150421))

(declare-fun m!150423 () Bool)

(assert (=> b!128446 m!150423))

(declare-fun m!150425 () Bool)

(assert (=> b!128447 m!150425))

(assert (=> b!128051 d!38909))

(declare-fun bm!13874 () Bool)

(declare-fun call!13883 () ListLongMap!1639)

(declare-fun call!13880 () ListLongMap!1639)

(assert (=> bm!13874 (= call!13883 call!13880)))

(declare-fun b!128448 () Bool)

(declare-fun res!62028 () Bool)

(declare-fun e!83857 () Bool)

(assert (=> b!128448 (=> (not res!62028) (not e!83857))))

(declare-fun e!83866 () Bool)

(assert (=> b!128448 (= res!62028 e!83866)))

(declare-fun c!23570 () Bool)

(assert (=> b!128448 (= c!23570 (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128449 () Bool)

(declare-fun e!83860 () Bool)

(assert (=> b!128449 (= e!83860 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128450 () Bool)

(declare-fun e!83862 () ListLongMap!1639)

(declare-fun e!83867 () ListLongMap!1639)

(assert (=> b!128450 (= e!83862 e!83867)))

(declare-fun c!23572 () Bool)

(assert (=> b!128450 (= c!23572 (and (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128451 () Bool)

(declare-fun call!13881 () Bool)

(assert (=> b!128451 (= e!83866 (not call!13881))))

(declare-fun bm!13875 () Bool)

(declare-fun lt!66561 () ListLongMap!1639)

(assert (=> bm!13875 (= call!13881 (contains!869 lt!66561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13876 () Bool)

(declare-fun call!13878 () ListLongMap!1639)

(declare-fun call!13882 () ListLongMap!1639)

(assert (=> bm!13876 (= call!13878 call!13882)))

(declare-fun b!128452 () Bool)

(declare-fun e!83864 () Bool)

(assert (=> b!128452 (= e!83864 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128453 () Bool)

(declare-fun e!83856 () Bool)

(assert (=> b!128453 (= e!83856 (= (apply!112 lt!66561 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))

(declare-fun b!128454 () Bool)

(assert (=> b!128454 (= e!83866 e!83856)))

(declare-fun res!62023 () Bool)

(assert (=> b!128454 (= res!62023 call!13881)))

(assert (=> b!128454 (=> (not res!62023) (not e!83856))))

(declare-fun d!38911 () Bool)

(assert (=> d!38911 e!83857))

(declare-fun res!62024 () Bool)

(assert (=> d!38911 (=> (not res!62024) (not e!83857))))

(assert (=> d!38911 (= res!62024 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66549 () ListLongMap!1639)

(assert (=> d!38911 (= lt!66561 lt!66549)))

(declare-fun lt!66553 () Unit!3985)

(declare-fun e!83863 () Unit!3985)

(assert (=> d!38911 (= lt!66553 e!83863)))

(declare-fun c!23571 () Bool)

(assert (=> d!38911 (= c!23571 e!83860)))

(declare-fun res!62025 () Bool)

(assert (=> d!38911 (=> (not res!62025) (not e!83860))))

(assert (=> d!38911 (= res!62025 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38911 (= lt!66549 e!83862)))

(declare-fun c!23568 () Bool)

(assert (=> d!38911 (= c!23568 (and (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38911 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38911 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66561)))

(declare-fun b!128455 () Bool)

(declare-fun Unit!4002 () Unit!3985)

(assert (=> b!128455 (= e!83863 Unit!4002)))

(declare-fun bm!13877 () Bool)

(declare-fun call!13877 () Bool)

(assert (=> bm!13877 (= call!13877 (contains!869 lt!66561 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128456 () Bool)

(declare-fun e!83859 () ListLongMap!1639)

(assert (=> b!128456 (= e!83859 call!13883)))

(declare-fun b!128457 () Bool)

(declare-fun e!83858 () Bool)

(assert (=> b!128457 (= e!83858 (not call!13877))))

(declare-fun b!128458 () Bool)

(declare-fun e!83861 () Bool)

(declare-fun e!83865 () Bool)

(assert (=> b!128458 (= e!83861 e!83865)))

(declare-fun res!62029 () Bool)

(assert (=> b!128458 (=> (not res!62029) (not e!83865))))

(assert (=> b!128458 (= res!62029 (contains!869 lt!66561 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128458 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun call!13879 () ListLongMap!1639)

(declare-fun bm!13878 () Bool)

(assert (=> bm!13878 (= call!13879 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128459 () Bool)

(assert (=> b!128459 (= e!83862 (+!165 call!13880 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13879 () Bool)

(assert (=> bm!13879 (= call!13882 call!13879)))

(declare-fun b!128460 () Bool)

(assert (=> b!128460 (= e!83857 e!83858)))

(declare-fun c!23569 () Bool)

(assert (=> b!128460 (= c!23569 (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128461 () Bool)

(assert (=> b!128461 (= e!83865 (= (apply!112 lt!66561 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (ite c!23474 (_values!2787 newMap!16) lt!66194))))))

(assert (=> b!128461 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128462 () Bool)

(declare-fun res!62030 () Bool)

(assert (=> b!128462 (=> (not res!62030) (not e!83857))))

(assert (=> b!128462 (= res!62030 e!83861)))

(declare-fun res!62022 () Bool)

(assert (=> b!128462 (=> res!62022 e!83861)))

(assert (=> b!128462 (= res!62022 (not e!83864))))

(declare-fun res!62027 () Bool)

(assert (=> b!128462 (=> (not res!62027) (not e!83864))))

(assert (=> b!128462 (= res!62027 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13880 () Bool)

(assert (=> bm!13880 (= call!13880 (+!165 (ite c!23568 call!13879 (ite c!23572 call!13882 call!13878)) (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128463 () Bool)

(declare-fun lt!66540 () Unit!3985)

(assert (=> b!128463 (= e!83863 lt!66540)))

(declare-fun lt!66542 () ListLongMap!1639)

(assert (=> b!128463 (= lt!66542 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66546 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66546 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66543 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66543 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66560 () Unit!3985)

(assert (=> b!128463 (= lt!66560 (addStillContains!88 lt!66542 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66543))))

(assert (=> b!128463 (contains!869 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66543)))

(declare-fun lt!66547 () Unit!3985)

(assert (=> b!128463 (= lt!66547 lt!66560)))

(declare-fun lt!66559 () ListLongMap!1639)

(assert (=> b!128463 (= lt!66559 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66545 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66545 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66554 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66554 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66555 () Unit!3985)

(assert (=> b!128463 (= lt!66555 (addApplyDifferent!88 lt!66559 lt!66545 (minValue!2665 newMap!16) lt!66554))))

(assert (=> b!128463 (= (apply!112 (+!165 lt!66559 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) lt!66554) (apply!112 lt!66559 lt!66554))))

(declare-fun lt!66551 () Unit!3985)

(assert (=> b!128463 (= lt!66551 lt!66555)))

(declare-fun lt!66556 () ListLongMap!1639)

(assert (=> b!128463 (= lt!66556 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66557 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66557 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66548 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66548 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66550 () Unit!3985)

(assert (=> b!128463 (= lt!66550 (addApplyDifferent!88 lt!66556 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66548))))

(assert (=> b!128463 (= (apply!112 (+!165 lt!66556 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66548) (apply!112 lt!66556 lt!66548))))

(declare-fun lt!66544 () Unit!3985)

(assert (=> b!128463 (= lt!66544 lt!66550)))

(declare-fun lt!66558 () ListLongMap!1639)

(assert (=> b!128463 (= lt!66558 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66552 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66552 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66541 () (_ BitVec 64))

(assert (=> b!128463 (= lt!66541 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128463 (= lt!66540 (addApplyDifferent!88 lt!66558 lt!66552 (minValue!2665 newMap!16) lt!66541))))

(assert (=> b!128463 (= (apply!112 (+!165 lt!66558 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) lt!66541) (apply!112 lt!66558 lt!66541))))

(declare-fun b!128464 () Bool)

(assert (=> b!128464 (= e!83859 call!13878)))

(declare-fun b!128465 () Bool)

(declare-fun e!83868 () Bool)

(assert (=> b!128465 (= e!83868 (= (apply!112 lt!66561 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128466 () Bool)

(assert (=> b!128466 (= e!83867 call!13883)))

(declare-fun b!128467 () Bool)

(declare-fun c!23567 () Bool)

(assert (=> b!128467 (= c!23567 (and (not (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128467 (= e!83867 e!83859)))

(declare-fun b!128468 () Bool)

(assert (=> b!128468 (= e!83858 e!83868)))

(declare-fun res!62026 () Bool)

(assert (=> b!128468 (= res!62026 call!13877)))

(assert (=> b!128468 (=> (not res!62026) (not e!83868))))

(assert (= (and d!38911 c!23568) b!128459))

(assert (= (and d!38911 (not c!23568)) b!128450))

(assert (= (and b!128450 c!23572) b!128466))

(assert (= (and b!128450 (not c!23572)) b!128467))

(assert (= (and b!128467 c!23567) b!128456))

(assert (= (and b!128467 (not c!23567)) b!128464))

(assert (= (or b!128456 b!128464) bm!13876))

(assert (= (or b!128466 bm!13876) bm!13879))

(assert (= (or b!128466 b!128456) bm!13874))

(assert (= (or b!128459 bm!13879) bm!13878))

(assert (= (or b!128459 bm!13874) bm!13880))

(assert (= (and d!38911 res!62025) b!128449))

(assert (= (and d!38911 c!23571) b!128463))

(assert (= (and d!38911 (not c!23571)) b!128455))

(assert (= (and d!38911 res!62024) b!128462))

(assert (= (and b!128462 res!62027) b!128452))

(assert (= (and b!128462 (not res!62022)) b!128458))

(assert (= (and b!128458 res!62029) b!128461))

(assert (= (and b!128462 res!62030) b!128448))

(assert (= (and b!128448 c!23570) b!128454))

(assert (= (and b!128448 (not c!23570)) b!128451))

(assert (= (and b!128454 res!62023) b!128453))

(assert (= (or b!128454 b!128451) bm!13875))

(assert (= (and b!128448 res!62028) b!128460))

(assert (= (and b!128460 c!23569) b!128468))

(assert (= (and b!128460 (not c!23569)) b!128457))

(assert (= (and b!128468 res!62026) b!128465))

(assert (= (or b!128468 b!128457) bm!13877))

(declare-fun b_lambda!5681 () Bool)

(assert (=> (not b_lambda!5681) (not b!128461)))

(assert (=> b!128461 t!6065))

(declare-fun b_and!7933 () Bool)

(assert (= b_and!7929 (and (=> t!6065 result!3889) b_and!7933)))

(assert (=> b!128461 t!6067))

(declare-fun b_and!7935 () Bool)

(assert (= b_and!7931 (and (=> t!6067 result!3891) b_and!7935)))

(declare-fun m!150427 () Bool)

(assert (=> bm!13875 m!150427))

(declare-fun m!150429 () Bool)

(assert (=> bm!13878 m!150429))

(assert (=> b!128458 m!149959))

(assert (=> b!128458 m!149959))

(declare-fun m!150431 () Bool)

(assert (=> b!128458 m!150431))

(assert (=> d!38911 m!149963))

(assert (=> b!128452 m!149959))

(assert (=> b!128452 m!149959))

(assert (=> b!128452 m!149965))

(assert (=> b!128449 m!149959))

(assert (=> b!128449 m!149959))

(assert (=> b!128449 m!149965))

(declare-fun m!150433 () Bool)

(assert (=> b!128459 m!150433))

(declare-fun m!150435 () Bool)

(assert (=> bm!13877 m!150435))

(declare-fun m!150437 () Bool)

(assert (=> b!128465 m!150437))

(declare-fun m!150439 () Bool)

(assert (=> b!128463 m!150439))

(declare-fun m!150441 () Bool)

(assert (=> b!128463 m!150441))

(declare-fun m!150443 () Bool)

(assert (=> b!128463 m!150443))

(declare-fun m!150445 () Bool)

(assert (=> b!128463 m!150445))

(declare-fun m!150447 () Bool)

(assert (=> b!128463 m!150447))

(declare-fun m!150449 () Bool)

(assert (=> b!128463 m!150449))

(declare-fun m!150451 () Bool)

(assert (=> b!128463 m!150451))

(declare-fun m!150453 () Bool)

(assert (=> b!128463 m!150453))

(declare-fun m!150455 () Bool)

(assert (=> b!128463 m!150455))

(assert (=> b!128463 m!150443))

(declare-fun m!150457 () Bool)

(assert (=> b!128463 m!150457))

(declare-fun m!150459 () Bool)

(assert (=> b!128463 m!150459))

(declare-fun m!150461 () Bool)

(assert (=> b!128463 m!150461))

(declare-fun m!150463 () Bool)

(assert (=> b!128463 m!150463))

(assert (=> b!128463 m!150453))

(declare-fun m!150465 () Bool)

(assert (=> b!128463 m!150465))

(declare-fun m!150467 () Bool)

(assert (=> b!128463 m!150467))

(assert (=> b!128463 m!149959))

(assert (=> b!128463 m!150447))

(assert (=> b!128463 m!150461))

(assert (=> b!128463 m!150429))

(declare-fun m!150469 () Bool)

(assert (=> b!128453 m!150469))

(declare-fun m!150471 () Bool)

(assert (=> bm!13880 m!150471))

(assert (=> b!128461 m!149959))

(assert (=> b!128461 m!149959))

(declare-fun m!150473 () Bool)

(assert (=> b!128461 m!150473))

(declare-fun m!150475 () Bool)

(assert (=> b!128461 m!150475))

(assert (=> b!128461 m!150011))

(declare-fun m!150477 () Bool)

(assert (=> b!128461 m!150477))

(assert (=> b!128461 m!150475))

(assert (=> b!128461 m!150011))

(assert (=> bm!13811 d!38911))

(assert (=> bm!13833 d!38817))

(assert (=> d!38799 d!38803))

(declare-fun b!128485 () Bool)

(declare-fun e!83877 () Bool)

(declare-fun call!13889 () Bool)

(assert (=> b!128485 (= e!83877 (not call!13889))))

(declare-fun b!128486 () Bool)

(declare-fun e!83878 () Bool)

(assert (=> b!128486 (= e!83878 (not call!13889))))

(declare-fun b!128487 () Bool)

(declare-fun e!83879 () Bool)

(declare-fun e!83880 () Bool)

(assert (=> b!128487 (= e!83879 e!83880)))

(declare-fun c!23578 () Bool)

(declare-fun lt!66567 () SeekEntryResult!265)

(assert (=> b!128487 (= c!23578 ((_ is MissingVacant!265) lt!66567))))

(declare-fun b!128488 () Bool)

(declare-fun res!62039 () Bool)

(assert (=> b!128488 (=> (not res!62039) (not e!83878))))

(declare-fun call!13888 () Bool)

(assert (=> b!128488 (= res!62039 call!13888)))

(assert (=> b!128488 (= e!83880 e!83878)))

(declare-fun d!38913 () Bool)

(assert (=> d!38913 e!83879))

(declare-fun c!23577 () Bool)

(assert (=> d!38913 (= c!23577 ((_ is MissingZero!265) lt!66567))))

(assert (=> d!38913 (= lt!66567 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun lt!66566 () Unit!3985)

(declare-fun choose!788 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) Int) Unit!3985)

(assert (=> d!38913 (= lt!66566 (choose!788 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)))))

(assert (=> d!38913 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38913 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!57 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) lt!66566)))

(declare-fun b!128489 () Bool)

(assert (=> b!128489 (and (bvsge (index!3216 lt!66567) #b00000000000000000000000000000000) (bvslt (index!3216 lt!66567) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62040 () Bool)

(assert (=> b!128489 (= res!62040 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66567)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128489 (=> (not res!62040) (not e!83877))))

(declare-fun b!128490 () Bool)

(declare-fun res!62041 () Bool)

(assert (=> b!128490 (=> (not res!62041) (not e!83878))))

(assert (=> b!128490 (= res!62041 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66567)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128490 (and (bvsge (index!3219 lt!66567) #b00000000000000000000000000000000) (bvslt (index!3219 lt!66567) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128491 () Bool)

(assert (=> b!128491 (= e!83879 e!83877)))

(declare-fun res!62042 () Bool)

(assert (=> b!128491 (= res!62042 call!13888)))

(assert (=> b!128491 (=> (not res!62042) (not e!83877))))

(declare-fun bm!13885 () Bool)

(assert (=> bm!13885 (= call!13889 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!13886 () Bool)

(assert (=> bm!13886 (= call!13888 (inRange!0 (ite c!23577 (index!3216 lt!66567) (index!3219 lt!66567)) (mask!7072 newMap!16)))))

(declare-fun b!128492 () Bool)

(assert (=> b!128492 (= e!83880 ((_ is Undefined!265) lt!66567))))

(assert (= (and d!38913 c!23577) b!128491))

(assert (= (and d!38913 (not c!23577)) b!128487))

(assert (= (and b!128491 res!62042) b!128489))

(assert (= (and b!128489 res!62040) b!128485))

(assert (= (and b!128487 c!23578) b!128488))

(assert (= (and b!128487 (not c!23578)) b!128492))

(assert (= (and b!128488 res!62039) b!128490))

(assert (= (and b!128490 res!62041) b!128486))

(assert (= (or b!128491 b!128488) bm!13886))

(assert (= (or b!128485 b!128486) bm!13885))

(assert (=> bm!13885 m!149721))

(assert (=> bm!13885 m!149877))

(declare-fun m!150479 () Bool)

(assert (=> b!128490 m!150479))

(declare-fun m!150481 () Bool)

(assert (=> bm!13886 m!150481))

(assert (=> d!38913 m!149721))

(assert (=> d!38913 m!149851))

(assert (=> d!38913 m!149721))

(declare-fun m!150483 () Bool)

(assert (=> d!38913 m!150483))

(assert (=> d!38913 m!149963))

(declare-fun m!150485 () Bool)

(assert (=> b!128489 m!150485))

(assert (=> bm!13794 d!38913))

(declare-fun d!38915 () Bool)

(declare-fun e!83882 () Bool)

(assert (=> d!38915 e!83882))

(declare-fun res!62043 () Bool)

(assert (=> d!38915 (=> res!62043 e!83882)))

(declare-fun lt!66568 () Bool)

(assert (=> d!38915 (= res!62043 (not lt!66568))))

(declare-fun lt!66571 () Bool)

(assert (=> d!38915 (= lt!66568 lt!66571)))

(declare-fun lt!66569 () Unit!3985)

(declare-fun e!83881 () Unit!3985)

(assert (=> d!38915 (= lt!66569 e!83881)))

(declare-fun c!23579 () Bool)

(assert (=> d!38915 (= c!23579 lt!66571)))

(assert (=> d!38915 (= lt!66571 (containsKey!172 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!38915 (= (contains!869 lt!66270 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66568)))

(declare-fun b!128493 () Bool)

(declare-fun lt!66570 () Unit!3985)

(assert (=> b!128493 (= e!83881 lt!66570)))

(assert (=> b!128493 (= lt!66570 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128493 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!128494 () Bool)

(declare-fun Unit!4003 () Unit!3985)

(assert (=> b!128494 (= e!83881 Unit!4003)))

(declare-fun b!128495 () Bool)

(assert (=> b!128495 (= e!83882 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!38915 c!23579) b!128493))

(assert (= (and d!38915 (not c!23579)) b!128494))

(assert (= (and d!38915 (not res!62043)) b!128495))

(assert (=> d!38915 m!149899))

(declare-fun m!150487 () Bool)

(assert (=> d!38915 m!150487))

(assert (=> b!128493 m!149899))

(declare-fun m!150489 () Bool)

(assert (=> b!128493 m!150489))

(assert (=> b!128493 m!149899))

(assert (=> b!128493 m!150223))

(assert (=> b!128493 m!150223))

(declare-fun m!150491 () Bool)

(assert (=> b!128493 m!150491))

(assert (=> b!128495 m!149899))

(assert (=> b!128495 m!150223))

(assert (=> b!128495 m!150223))

(assert (=> b!128495 m!150491))

(assert (=> b!128137 d!38915))

(declare-fun mapNonEmpty!4555 () Bool)

(declare-fun mapRes!4555 () Bool)

(declare-fun tp!11053 () Bool)

(declare-fun e!83884 () Bool)

(assert (=> mapNonEmpty!4555 (= mapRes!4555 (and tp!11053 e!83884))))

(declare-fun mapValue!4555 () ValueCell!1082)

(declare-fun mapKey!4555 () (_ BitVec 32))

(declare-fun mapRest!4555 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4555 (= mapRest!4553 (store mapRest!4555 mapKey!4555 mapValue!4555))))

(declare-fun b!128496 () Bool)

(assert (=> b!128496 (= e!83884 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4555 () Bool)

(assert (=> mapIsEmpty!4555 mapRes!4555))

(declare-fun condMapEmpty!4555 () Bool)

(declare-fun mapDefault!4555 () ValueCell!1082)

(assert (=> mapNonEmpty!4553 (= condMapEmpty!4555 (= mapRest!4553 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4555)))))

(declare-fun e!83883 () Bool)

(assert (=> mapNonEmpty!4553 (= tp!11051 (and e!83883 mapRes!4555))))

(declare-fun b!128497 () Bool)

(assert (=> b!128497 (= e!83883 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4553 condMapEmpty!4555) mapIsEmpty!4555))

(assert (= (and mapNonEmpty!4553 (not condMapEmpty!4555)) mapNonEmpty!4555))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1082) mapValue!4555)) b!128496))

(assert (= (and mapNonEmpty!4553 ((_ is ValueCellFull!1082) mapDefault!4555)) b!128497))

(declare-fun m!150493 () Bool)

(assert (=> mapNonEmpty!4555 m!150493))

(declare-fun mapNonEmpty!4556 () Bool)

(declare-fun mapRes!4556 () Bool)

(declare-fun tp!11054 () Bool)

(declare-fun e!83886 () Bool)

(assert (=> mapNonEmpty!4556 (= mapRes!4556 (and tp!11054 e!83886))))

(declare-fun mapValue!4556 () ValueCell!1082)

(declare-fun mapRest!4556 () (Array (_ BitVec 32) ValueCell!1082))

(declare-fun mapKey!4556 () (_ BitVec 32))

(assert (=> mapNonEmpty!4556 (= mapRest!4554 (store mapRest!4556 mapKey!4556 mapValue!4556))))

(declare-fun b!128498 () Bool)

(assert (=> b!128498 (= e!83886 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4556 () Bool)

(assert (=> mapIsEmpty!4556 mapRes!4556))

(declare-fun condMapEmpty!4556 () Bool)

(declare-fun mapDefault!4556 () ValueCell!1082)

(assert (=> mapNonEmpty!4554 (= condMapEmpty!4556 (= mapRest!4554 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4556)))))

(declare-fun e!83885 () Bool)

(assert (=> mapNonEmpty!4554 (= tp!11052 (and e!83885 mapRes!4556))))

(declare-fun b!128499 () Bool)

(assert (=> b!128499 (= e!83885 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4554 condMapEmpty!4556) mapIsEmpty!4556))

(assert (= (and mapNonEmpty!4554 (not condMapEmpty!4556)) mapNonEmpty!4556))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1082) mapValue!4556)) b!128498))

(assert (= (and mapNonEmpty!4554 ((_ is ValueCellFull!1082) mapDefault!4556)) b!128499))

(declare-fun m!150495 () Bool)

(assert (=> mapNonEmpty!4556 m!150495))

(declare-fun b_lambda!5683 () Bool)

(assert (= b_lambda!5681 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5683)))

(declare-fun b_lambda!5685 () Bool)

(assert (= b_lambda!5679 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5685)))

(declare-fun b_lambda!5687 () Bool)

(assert (= b_lambda!5675 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5687)))

(declare-fun b_lambda!5689 () Bool)

(assert (= b_lambda!5673 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5689)))

(declare-fun b_lambda!5691 () Bool)

(assert (= b_lambda!5677 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5691)))

(check-sat (not bm!13855) (not d!38855) (not b!128419) (not b!128463) (not bm!13877) (not bm!13866) b_and!7933 (not d!38847) (not bm!13842) (not b!128238) (not b!128296) (not b!128277) (not bm!13870) (not bm!13854) (not b!128422) (not b_lambda!5683) (not b!128169) (not d!38885) (not b!128235) (not b!128301) (not b!128299) (not b!128239) (not bm!13839) (not b!128231) (not b!128163) (not b!128173) (not d!38825) (not b!128229) (not d!38829) (not d!38883) (not b!128353) (not b!128430) (not d!38877) (not b!128461) (not b!128342) (not b!128168) (not b!128232) (not b!128410) (not b!128385) (not b!128440) (not b!128230) (not d!38835) (not b!128220) (not b!128224) (not b!128222) (not b_lambda!5687) (not d!38837) (not b!128383) (not b!128447) (not d!38839) (not b!128162) (not b!128295) (not d!38803) (not d!38887) (not b!128408) (not b!128434) (not d!38831) (not d!38909) (not d!38889) (not d!38901) (not b!128221) (not b!128241) (not bm!13857) (not b_lambda!5689) (not bm!13886) (not bm!13863) (not b!128193) b_and!7935 (not b!128175) (not d!38913) (not b!128446) tp_is_empty!2851 (not d!38891) (not b!128449) (not b!128298) (not d!38843) (not b!128458) (not b!128420) (not mapNonEmpty!4555) (not b!128424) (not d!38833) (not b!128333) (not b!128223) (not b!128233) (not b!128438) (not b!128406) (not bm!13880) (not d!38849) (not b!128453) (not d!38813) (not bm!13873) (not b_lambda!5671) (not d!38823) (not b!128444) (not b_next!2871) (not d!38861) (not d!38875) (not d!38859) (not b!128171) (not b!128459) (not d!38873) (not b!128368) (not d!38815) (not b!128402) (not b!128426) (not b!128441) (not b!128437) (not b_lambda!5685) (not d!38821) (not d!38915) (not bm!13875) (not b!128443) (not b!128445) (not b_next!2869) (not bm!13860) (not d!38893) (not d!38911) (not b!128387) (not b!128493) (not b!128288) (not d!38817) (not bm!13871) (not b!128452) (not b!128465) (not b!128314) (not b!128281) (not b!128280) (not bm!13845) (not b!128351) (not b!128365) (not b!128320) (not bm!13837) (not b_lambda!5691) (not b!128242) (not d!38865) (not b!128495) (not d!38845) (not d!38881) (not d!38851) (not b!128313) (not bm!13885) (not d!38811) (not bm!13840) (not b!128194) (not d!38899) (not b!128336) (not b!128294) (not b!128289) (not d!38809) (not d!38819) (not d!38907) (not b!128386) (not d!38897) (not b!128372) (not b!128237) (not b!128431) (not b!128413) (not b!128302) (not b!128278) (not mapNonEmpty!4556) (not b_lambda!5667) (not b!128297) (not b!128303) (not bm!13878) (not b!128184) (not b!128159) (not d!38903) (not b!128366) (not b!128334) (not d!38827) (not b!128414) (not d!38841) (not bm!13868))
(check-sat b_and!7933 b_and!7935 (not b_next!2869) (not b_next!2871))
(get-model)

(declare-fun d!38917 () Bool)

(declare-fun e!83887 () Bool)

(assert (=> d!38917 e!83887))

(declare-fun res!62045 () Bool)

(assert (=> d!38917 (=> (not res!62045) (not e!83887))))

(declare-fun lt!66572 () ListLongMap!1639)

(assert (=> d!38917 (= res!62045 (contains!869 lt!66572 (_1!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66574 () List!1682)

(assert (=> d!38917 (= lt!66572 (ListLongMap!1640 lt!66574))))

(declare-fun lt!66573 () Unit!3985)

(declare-fun lt!66575 () Unit!3985)

(assert (=> d!38917 (= lt!66573 lt!66575)))

(assert (=> d!38917 (= (getValueByKey!169 lt!66574 (_1!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38917 (= lt!66575 (lemmaContainsTupThenGetReturnValue!84 lt!66574 (_1!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38917 (= lt!66574 (insertStrictlySorted!87 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!38917 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66572)))

(declare-fun b!128500 () Bool)

(declare-fun res!62044 () Bool)

(assert (=> b!128500 (=> (not res!62044) (not e!83887))))

(assert (=> b!128500 (= res!62044 (= (getValueByKey!169 (toList!835 lt!66572) (_1!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128501 () Bool)

(assert (=> b!128501 (= e!83887 (contains!871 (toList!835 lt!66572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!38917 res!62045) b!128500))

(assert (= (and b!128500 res!62044) b!128501))

(declare-fun m!150497 () Bool)

(assert (=> d!38917 m!150497))

(declare-fun m!150499 () Bool)

(assert (=> d!38917 m!150499))

(declare-fun m!150501 () Bool)

(assert (=> d!38917 m!150501))

(declare-fun m!150503 () Bool)

(assert (=> d!38917 m!150503))

(declare-fun m!150505 () Bool)

(assert (=> b!128500 m!150505))

(declare-fun m!150507 () Bool)

(assert (=> b!128501 m!150507))

(assert (=> d!38847 d!38917))

(declare-fun d!38919 () Bool)

(assert (=> d!38919 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!38919 true))

(declare-fun _$7!110 () Unit!3985)

(assert (=> d!38919 (= (choose!782 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66184 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) (defaultEntry!2804 newMap!16)) _$7!110)))

(declare-fun bs!5328 () Bool)

(assert (= bs!5328 d!38919))

(assert (=> bs!5328 m!149859))

(assert (=> bs!5328 m!149859))

(assert (=> bs!5328 m!150213))

(assert (=> bs!5328 m!149719))

(assert (=> bs!5328 m!150209))

(assert (=> d!38847 d!38919))

(assert (=> d!38847 d!38803))

(declare-fun d!38921 () Bool)

(assert (=> d!38921 (= (validMask!0 (mask!7072 newMap!16)) (and (or (= (mask!7072 newMap!16) #b00000000000000000000000000000111) (= (mask!7072 newMap!16) #b00000000000000000000000000001111) (= (mask!7072 newMap!16) #b00000000000000000000000000011111) (= (mask!7072 newMap!16) #b00000000000000000000000000111111) (= (mask!7072 newMap!16) #b00000000000000000000000001111111) (= (mask!7072 newMap!16) #b00000000000000000000000011111111) (= (mask!7072 newMap!16) #b00000000000000000000000111111111) (= (mask!7072 newMap!16) #b00000000000000000000001111111111) (= (mask!7072 newMap!16) #b00000000000000000000011111111111) (= (mask!7072 newMap!16) #b00000000000000000000111111111111) (= (mask!7072 newMap!16) #b00000000000000000001111111111111) (= (mask!7072 newMap!16) #b00000000000000000011111111111111) (= (mask!7072 newMap!16) #b00000000000000000111111111111111) (= (mask!7072 newMap!16) #b00000000000000001111111111111111) (= (mask!7072 newMap!16) #b00000000000000011111111111111111) (= (mask!7072 newMap!16) #b00000000000000111111111111111111) (= (mask!7072 newMap!16) #b00000000000001111111111111111111) (= (mask!7072 newMap!16) #b00000000000011111111111111111111) (= (mask!7072 newMap!16) #b00000000000111111111111111111111) (= (mask!7072 newMap!16) #b00000000001111111111111111111111) (= (mask!7072 newMap!16) #b00000000011111111111111111111111) (= (mask!7072 newMap!16) #b00000000111111111111111111111111) (= (mask!7072 newMap!16) #b00000001111111111111111111111111) (= (mask!7072 newMap!16) #b00000011111111111111111111111111) (= (mask!7072 newMap!16) #b00000111111111111111111111111111) (= (mask!7072 newMap!16) #b00001111111111111111111111111111) (= (mask!7072 newMap!16) #b00011111111111111111111111111111) (= (mask!7072 newMap!16) #b00111111111111111111111111111111)) (bvsle (mask!7072 newMap!16) #b00111111111111111111111111111111)))))

(assert (=> d!38847 d!38921))

(declare-fun bm!13887 () Bool)

(declare-fun call!13896 () ListLongMap!1639)

(declare-fun call!13893 () ListLongMap!1639)

(assert (=> bm!13887 (= call!13896 call!13893)))

(declare-fun b!128502 () Bool)

(declare-fun res!62052 () Bool)

(declare-fun e!83889 () Bool)

(assert (=> b!128502 (=> (not res!62052) (not e!83889))))

(declare-fun e!83898 () Bool)

(assert (=> b!128502 (= res!62052 e!83898)))

(declare-fun c!23583 () Bool)

(assert (=> b!128502 (= c!23583 (not (= (bvand lt!66184 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128503 () Bool)

(declare-fun e!83892 () Bool)

(assert (=> b!128503 (= e!83892 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128504 () Bool)

(declare-fun e!83894 () ListLongMap!1639)

(declare-fun e!83899 () ListLongMap!1639)

(assert (=> b!128504 (= e!83894 e!83899)))

(declare-fun c!23585 () Bool)

(assert (=> b!128504 (= c!23585 (and (not (= (bvand lt!66184 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66184 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128505 () Bool)

(declare-fun call!13894 () Bool)

(assert (=> b!128505 (= e!83898 (not call!13894))))

(declare-fun bm!13888 () Bool)

(declare-fun lt!66597 () ListLongMap!1639)

(assert (=> bm!13888 (= call!13894 (contains!869 lt!66597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13889 () Bool)

(declare-fun call!13891 () ListLongMap!1639)

(declare-fun call!13895 () ListLongMap!1639)

(assert (=> bm!13889 (= call!13891 call!13895)))

(declare-fun b!128506 () Bool)

(declare-fun e!83896 () Bool)

(assert (=> b!128506 (= e!83896 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!83888 () Bool)

(declare-fun b!128507 () Bool)

(assert (=> b!128507 (= e!83888 (= (apply!112 lt!66597 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128508 () Bool)

(assert (=> b!128508 (= e!83898 e!83888)))

(declare-fun res!62047 () Bool)

(assert (=> b!128508 (= res!62047 call!13894)))

(assert (=> b!128508 (=> (not res!62047) (not e!83888))))

(declare-fun d!38923 () Bool)

(assert (=> d!38923 e!83889))

(declare-fun res!62048 () Bool)

(assert (=> d!38923 (=> (not res!62048) (not e!83889))))

(assert (=> d!38923 (= res!62048 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66585 () ListLongMap!1639)

(assert (=> d!38923 (= lt!66597 lt!66585)))

(declare-fun lt!66589 () Unit!3985)

(declare-fun e!83895 () Unit!3985)

(assert (=> d!38923 (= lt!66589 e!83895)))

(declare-fun c!23584 () Bool)

(assert (=> d!38923 (= c!23584 e!83892)))

(declare-fun res!62049 () Bool)

(assert (=> d!38923 (=> (not res!62049) (not e!83892))))

(assert (=> d!38923 (= res!62049 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38923 (= lt!66585 e!83894)))

(declare-fun c!23581 () Bool)

(assert (=> d!38923 (= c!23581 (and (not (= (bvand lt!66184 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66184 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!38923 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38923 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66597)))

(declare-fun b!128509 () Bool)

(declare-fun Unit!4004 () Unit!3985)

(assert (=> b!128509 (= e!83895 Unit!4004)))

(declare-fun bm!13890 () Bool)

(declare-fun call!13890 () Bool)

(assert (=> bm!13890 (= call!13890 (contains!869 lt!66597 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128510 () Bool)

(declare-fun e!83891 () ListLongMap!1639)

(assert (=> b!128510 (= e!83891 call!13896)))

(declare-fun b!128511 () Bool)

(declare-fun e!83890 () Bool)

(assert (=> b!128511 (= e!83890 (not call!13890))))

(declare-fun b!128512 () Bool)

(declare-fun e!83893 () Bool)

(declare-fun e!83897 () Bool)

(assert (=> b!128512 (= e!83893 e!83897)))

(declare-fun res!62053 () Bool)

(assert (=> b!128512 (=> (not res!62053) (not e!83897))))

(assert (=> b!128512 (= res!62053 (contains!869 lt!66597 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128512 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13891 () Bool)

(declare-fun call!13892 () ListLongMap!1639)

(assert (=> bm!13891 (= call!13892 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128513 () Bool)

(assert (=> b!128513 (= e!83894 (+!165 call!13893 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13892 () Bool)

(assert (=> bm!13892 (= call!13895 call!13892)))

(declare-fun b!128514 () Bool)

(assert (=> b!128514 (= e!83889 e!83890)))

(declare-fun c!23582 () Bool)

(assert (=> b!128514 (= c!23582 (not (= (bvand lt!66184 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128515 () Bool)

(assert (=> b!128515 (= e!83897 (= (apply!112 lt!66597 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (_values!2787 newMap!16))))))

(assert (=> b!128515 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128516 () Bool)

(declare-fun res!62054 () Bool)

(assert (=> b!128516 (=> (not res!62054) (not e!83889))))

(assert (=> b!128516 (= res!62054 e!83893)))

(declare-fun res!62046 () Bool)

(assert (=> b!128516 (=> res!62046 e!83893)))

(assert (=> b!128516 (= res!62046 (not e!83896))))

(declare-fun res!62051 () Bool)

(assert (=> b!128516 (=> (not res!62051) (not e!83896))))

(assert (=> b!128516 (= res!62051 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13893 () Bool)

(assert (=> bm!13893 (= call!13893 (+!165 (ite c!23581 call!13892 (ite c!23585 call!13895 call!13891)) (ite (or c!23581 c!23585) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128517 () Bool)

(declare-fun lt!66576 () Unit!3985)

(assert (=> b!128517 (= e!83895 lt!66576)))

(declare-fun lt!66578 () ListLongMap!1639)

(assert (=> b!128517 (= lt!66578 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66582 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66579 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66579 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66596 () Unit!3985)

(assert (=> b!128517 (= lt!66596 (addStillContains!88 lt!66578 lt!66582 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66579))))

(assert (=> b!128517 (contains!869 (+!165 lt!66578 (tuple2!2537 lt!66582 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66579)))

(declare-fun lt!66583 () Unit!3985)

(assert (=> b!128517 (= lt!66583 lt!66596)))

(declare-fun lt!66595 () ListLongMap!1639)

(assert (=> b!128517 (= lt!66595 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66581 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66581 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66590 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66590 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66591 () Unit!3985)

(assert (=> b!128517 (= lt!66591 (addApplyDifferent!88 lt!66595 lt!66581 (minValue!2665 newMap!16) lt!66590))))

(assert (=> b!128517 (= (apply!112 (+!165 lt!66595 (tuple2!2537 lt!66581 (minValue!2665 newMap!16))) lt!66590) (apply!112 lt!66595 lt!66590))))

(declare-fun lt!66587 () Unit!3985)

(assert (=> b!128517 (= lt!66587 lt!66591)))

(declare-fun lt!66592 () ListLongMap!1639)

(assert (=> b!128517 (= lt!66592 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66593 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66593 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66584 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66584 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66586 () Unit!3985)

(assert (=> b!128517 (= lt!66586 (addApplyDifferent!88 lt!66592 lt!66593 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66584))))

(assert (=> b!128517 (= (apply!112 (+!165 lt!66592 (tuple2!2537 lt!66593 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66584) (apply!112 lt!66592 lt!66584))))

(declare-fun lt!66580 () Unit!3985)

(assert (=> b!128517 (= lt!66580 lt!66586)))

(declare-fun lt!66594 () ListLongMap!1639)

(assert (=> b!128517 (= lt!66594 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66184 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66588 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66588 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66577 () (_ BitVec 64))

(assert (=> b!128517 (= lt!66577 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128517 (= lt!66576 (addApplyDifferent!88 lt!66594 lt!66588 (minValue!2665 newMap!16) lt!66577))))

(assert (=> b!128517 (= (apply!112 (+!165 lt!66594 (tuple2!2537 lt!66588 (minValue!2665 newMap!16))) lt!66577) (apply!112 lt!66594 lt!66577))))

(declare-fun b!128518 () Bool)

(assert (=> b!128518 (= e!83891 call!13891)))

(declare-fun b!128519 () Bool)

(declare-fun e!83900 () Bool)

(assert (=> b!128519 (= e!83900 (= (apply!112 lt!66597 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128520 () Bool)

(assert (=> b!128520 (= e!83899 call!13896)))

(declare-fun b!128521 () Bool)

(declare-fun c!23580 () Bool)

(assert (=> b!128521 (= c!23580 (and (not (= (bvand lt!66184 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66184 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128521 (= e!83899 e!83891)))

(declare-fun b!128522 () Bool)

(assert (=> b!128522 (= e!83890 e!83900)))

(declare-fun res!62050 () Bool)

(assert (=> b!128522 (= res!62050 call!13890)))

(assert (=> b!128522 (=> (not res!62050) (not e!83900))))

(assert (= (and d!38923 c!23581) b!128513))

(assert (= (and d!38923 (not c!23581)) b!128504))

(assert (= (and b!128504 c!23585) b!128520))

(assert (= (and b!128504 (not c!23585)) b!128521))

(assert (= (and b!128521 c!23580) b!128510))

(assert (= (and b!128521 (not c!23580)) b!128518))

(assert (= (or b!128510 b!128518) bm!13889))

(assert (= (or b!128520 bm!13889) bm!13892))

(assert (= (or b!128520 b!128510) bm!13887))

(assert (= (or b!128513 bm!13892) bm!13891))

(assert (= (or b!128513 bm!13887) bm!13893))

(assert (= (and d!38923 res!62049) b!128503))

(assert (= (and d!38923 c!23584) b!128517))

(assert (= (and d!38923 (not c!23584)) b!128509))

(assert (= (and d!38923 res!62048) b!128516))

(assert (= (and b!128516 res!62051) b!128506))

(assert (= (and b!128516 (not res!62046)) b!128512))

(assert (= (and b!128512 res!62053) b!128515))

(assert (= (and b!128516 res!62054) b!128502))

(assert (= (and b!128502 c!23583) b!128508))

(assert (= (and b!128502 (not c!23583)) b!128505))

(assert (= (and b!128508 res!62047) b!128507))

(assert (= (or b!128508 b!128505) bm!13888))

(assert (= (and b!128502 res!62052) b!128514))

(assert (= (and b!128514 c!23582) b!128522))

(assert (= (and b!128514 (not c!23582)) b!128511))

(assert (= (and b!128522 res!62050) b!128519))

(assert (= (or b!128522 b!128511) bm!13890))

(declare-fun b_lambda!5693 () Bool)

(assert (=> (not b_lambda!5693) (not b!128515)))

(assert (=> b!128515 t!6065))

(declare-fun b_and!7937 () Bool)

(assert (= b_and!7933 (and (=> t!6065 result!3889) b_and!7937)))

(assert (=> b!128515 t!6067))

(declare-fun b_and!7939 () Bool)

(assert (= b_and!7935 (and (=> t!6067 result!3891) b_and!7939)))

(declare-fun m!150509 () Bool)

(assert (=> bm!13888 m!150509))

(assert (=> bm!13891 m!149719))

(declare-fun m!150511 () Bool)

(assert (=> bm!13891 m!150511))

(assert (=> b!128512 m!149959))

(assert (=> b!128512 m!149959))

(declare-fun m!150513 () Bool)

(assert (=> b!128512 m!150513))

(assert (=> d!38923 m!149963))

(assert (=> b!128506 m!149959))

(assert (=> b!128506 m!149959))

(assert (=> b!128506 m!149965))

(assert (=> b!128503 m!149959))

(assert (=> b!128503 m!149959))

(assert (=> b!128503 m!149965))

(declare-fun m!150515 () Bool)

(assert (=> b!128513 m!150515))

(declare-fun m!150517 () Bool)

(assert (=> bm!13890 m!150517))

(declare-fun m!150519 () Bool)

(assert (=> b!128519 m!150519))

(declare-fun m!150521 () Bool)

(assert (=> b!128517 m!150521))

(assert (=> b!128517 m!149719))

(declare-fun m!150523 () Bool)

(assert (=> b!128517 m!150523))

(declare-fun m!150525 () Bool)

(assert (=> b!128517 m!150525))

(declare-fun m!150527 () Bool)

(assert (=> b!128517 m!150527))

(declare-fun m!150529 () Bool)

(assert (=> b!128517 m!150529))

(declare-fun m!150531 () Bool)

(assert (=> b!128517 m!150531))

(declare-fun m!150533 () Bool)

(assert (=> b!128517 m!150533))

(declare-fun m!150535 () Bool)

(assert (=> b!128517 m!150535))

(assert (=> b!128517 m!149719))

(declare-fun m!150537 () Bool)

(assert (=> b!128517 m!150537))

(assert (=> b!128517 m!150525))

(declare-fun m!150539 () Bool)

(assert (=> b!128517 m!150539))

(declare-fun m!150541 () Bool)

(assert (=> b!128517 m!150541))

(declare-fun m!150543 () Bool)

(assert (=> b!128517 m!150543))

(declare-fun m!150545 () Bool)

(assert (=> b!128517 m!150545))

(assert (=> b!128517 m!150535))

(declare-fun m!150547 () Bool)

(assert (=> b!128517 m!150547))

(declare-fun m!150549 () Bool)

(assert (=> b!128517 m!150549))

(assert (=> b!128517 m!149959))

(assert (=> b!128517 m!150529))

(assert (=> b!128517 m!150543))

(assert (=> b!128517 m!149719))

(assert (=> b!128517 m!150511))

(declare-fun m!150551 () Bool)

(assert (=> b!128507 m!150551))

(declare-fun m!150553 () Bool)

(assert (=> bm!13893 m!150553))

(assert (=> b!128515 m!149959))

(assert (=> b!128515 m!149959))

(declare-fun m!150555 () Bool)

(assert (=> b!128515 m!150555))

(assert (=> b!128515 m!150009))

(assert (=> b!128515 m!150011))

(assert (=> b!128515 m!150013))

(assert (=> b!128515 m!150009))

(assert (=> b!128515 m!150011))

(assert (=> d!38847 d!38923))

(declare-fun d!38925 () Bool)

(assert (=> d!38925 (= (get!1466 (getValueByKey!169 (toList!835 lt!66268) lt!66263)) (v!3150 (getValueByKey!169 (toList!835 lt!66268) lt!66263)))))

(assert (=> d!38809 d!38925))

(declare-fun b!128526 () Bool)

(declare-fun e!83902 () Option!175)

(assert (=> b!128526 (= e!83902 None!173)))

(declare-fun b!128525 () Bool)

(assert (=> b!128525 (= e!83902 (getValueByKey!169 (t!6053 (toList!835 lt!66268)) lt!66263))))

(declare-fun d!38927 () Bool)

(declare-fun c!23586 () Bool)

(assert (=> d!38927 (= c!23586 (and ((_ is Cons!1678) (toList!835 lt!66268)) (= (_1!1279 (h!2281 (toList!835 lt!66268))) lt!66263)))))

(declare-fun e!83901 () Option!175)

(assert (=> d!38927 (= (getValueByKey!169 (toList!835 lt!66268) lt!66263) e!83901)))

(declare-fun b!128524 () Bool)

(assert (=> b!128524 (= e!83901 e!83902)))

(declare-fun c!23587 () Bool)

(assert (=> b!128524 (= c!23587 (and ((_ is Cons!1678) (toList!835 lt!66268)) (not (= (_1!1279 (h!2281 (toList!835 lt!66268))) lt!66263))))))

(declare-fun b!128523 () Bool)

(assert (=> b!128523 (= e!83901 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66268)))))))

(assert (= (and d!38927 c!23586) b!128523))

(assert (= (and d!38927 (not c!23586)) b!128524))

(assert (= (and b!128524 c!23587) b!128525))

(assert (= (and b!128524 (not c!23587)) b!128526))

(declare-fun m!150557 () Bool)

(assert (=> b!128525 m!150557))

(assert (=> d!38809 d!38927))

(declare-fun d!38929 () Bool)

(assert (=> d!38929 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(declare-fun lt!66598 () Unit!3985)

(assert (=> d!38929 (= lt!66598 (choose!784 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(declare-fun e!83903 () Bool)

(assert (=> d!38929 e!83903))

(declare-fun res!62055 () Bool)

(assert (=> d!38929 (=> (not res!62055) (not e!83903))))

(assert (=> d!38929 (= res!62055 (isStrictlySorted!305 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!38929 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252) lt!66598)))

(declare-fun b!128527 () Bool)

(assert (=> b!128527 (= e!83903 (containsKey!172 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))

(assert (= (and d!38929 res!62055) b!128527))

(assert (=> d!38929 m!150097))

(assert (=> d!38929 m!150097))

(assert (=> d!38929 m!150099))

(declare-fun m!150559 () Bool)

(assert (=> d!38929 m!150559))

(declare-fun m!150561 () Bool)

(assert (=> d!38929 m!150561))

(assert (=> b!128527 m!150093))

(assert (=> b!128235 d!38929))

(declare-fun d!38931 () Bool)

(assert (=> d!38931 (= (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252)) (not (isEmpty!406 (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252))))))

(declare-fun bs!5329 () Bool)

(assert (= bs!5329 d!38931))

(assert (=> bs!5329 m!150097))

(declare-fun m!150563 () Bool)

(assert (=> bs!5329 m!150563))

(assert (=> b!128235 d!38931))

(declare-fun b!128531 () Bool)

(declare-fun e!83905 () Option!175)

(assert (=> b!128531 (= e!83905 None!173)))

(declare-fun b!128530 () Bool)

(assert (=> b!128530 (= e!83905 (getValueByKey!169 (t!6053 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66252))))

(declare-fun c!23588 () Bool)

(declare-fun d!38933 () Bool)

(assert (=> d!38933 (= c!23588 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66252)))))

(declare-fun e!83904 () Option!175)

(assert (=> d!38933 (= (getValueByKey!169 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252) e!83904)))

(declare-fun b!128529 () Bool)

(assert (=> b!128529 (= e!83904 e!83905)))

(declare-fun c!23589 () Bool)

(assert (=> b!128529 (= c!23589 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (not (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66252))))))

(declare-fun b!128528 () Bool)

(assert (=> b!128528 (= e!83904 (Some!174 (_2!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(assert (= (and d!38933 c!23588) b!128528))

(assert (= (and d!38933 (not c!23588)) b!128529))

(assert (= (and b!128529 c!23589) b!128530))

(assert (= (and b!128529 (not c!23589)) b!128531))

(declare-fun m!150565 () Bool)

(assert (=> b!128530 m!150565))

(assert (=> b!128235 d!38933))

(declare-fun d!38935 () Bool)

(declare-fun e!83907 () Bool)

(assert (=> d!38935 e!83907))

(declare-fun res!62056 () Bool)

(assert (=> d!38935 (=> res!62056 e!83907)))

(declare-fun lt!66599 () Bool)

(assert (=> d!38935 (= res!62056 (not lt!66599))))

(declare-fun lt!66602 () Bool)

(assert (=> d!38935 (= lt!66599 lt!66602)))

(declare-fun lt!66600 () Unit!3985)

(declare-fun e!83906 () Unit!3985)

(assert (=> d!38935 (= lt!66600 e!83906)))

(declare-fun c!23590 () Bool)

(assert (=> d!38935 (= c!23590 lt!66602)))

(assert (=> d!38935 (= lt!66602 (containsKey!172 (toList!835 lt!66510) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!38935 (= (contains!869 lt!66510 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) lt!66599)))

(declare-fun b!128532 () Bool)

(declare-fun lt!66601 () Unit!3985)

(assert (=> b!128532 (= e!83906 lt!66601)))

(assert (=> b!128532 (= lt!66601 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66510) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128532 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128533 () Bool)

(declare-fun Unit!4005 () Unit!3985)

(assert (=> b!128533 (= e!83906 Unit!4005)))

(declare-fun b!128534 () Bool)

(assert (=> b!128534 (= e!83907 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!38935 c!23590) b!128532))

(assert (= (and d!38935 (not c!23590)) b!128533))

(assert (= (and d!38935 (not res!62056)) b!128534))

(assert (=> d!38935 m!149959))

(declare-fun m!150567 () Bool)

(assert (=> d!38935 m!150567))

(assert (=> b!128532 m!149959))

(declare-fun m!150569 () Bool)

(assert (=> b!128532 m!150569))

(assert (=> b!128532 m!149959))

(declare-fun m!150571 () Bool)

(assert (=> b!128532 m!150571))

(assert (=> b!128532 m!150571))

(declare-fun m!150573 () Bool)

(assert (=> b!128532 m!150573))

(assert (=> b!128534 m!149959))

(assert (=> b!128534 m!150571))

(assert (=> b!128534 m!150571))

(assert (=> b!128534 m!150573))

(assert (=> b!128419 d!38935))

(declare-fun b!128535 () Bool)

(declare-fun e!83910 () Bool)

(declare-fun e!83908 () Bool)

(assert (=> b!128535 (= e!83910 e!83908)))

(declare-fun c!23591 () Bool)

(assert (=> b!128535 (= c!23591 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!13897 () Bool)

(declare-fun bm!13894 () Bool)

(assert (=> bm!13894 (= call!13897 (arrayNoDuplicates!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!23591 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!23542 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) Nil!1681) Nil!1681)) (ite c!23542 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) Nil!1681) Nil!1681))))))

(declare-fun b!128536 () Bool)

(declare-fun e!83909 () Bool)

(assert (=> b!128536 (= e!83909 (contains!872 (ite c!23542 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) Nil!1681) Nil!1681) (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!38937 () Bool)

(declare-fun res!62058 () Bool)

(declare-fun e!83911 () Bool)

(assert (=> d!38937 (=> res!62058 e!83911)))

(assert (=> d!38937 (= res!62058 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!38937 (= (arrayNoDuplicates!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23542 (Cons!1680 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) Nil!1681) Nil!1681)) e!83911)))

(declare-fun b!128537 () Bool)

(assert (=> b!128537 (= e!83908 call!13897)))

(declare-fun b!128538 () Bool)

(assert (=> b!128538 (= e!83911 e!83910)))

(declare-fun res!62057 () Bool)

(assert (=> b!128538 (=> (not res!62057) (not e!83910))))

(assert (=> b!128538 (= res!62057 (not e!83909))))

(declare-fun res!62059 () Bool)

(assert (=> b!128538 (=> (not res!62059) (not e!83909))))

(assert (=> b!128538 (= res!62059 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!128539 () Bool)

(assert (=> b!128539 (= e!83908 call!13897)))

(assert (= (and d!38937 (not res!62058)) b!128538))

(assert (= (and b!128538 res!62059) b!128536))

(assert (= (and b!128538 res!62057) b!128535))

(assert (= (and b!128535 c!23591) b!128539))

(assert (= (and b!128535 (not c!23591)) b!128537))

(assert (= (or b!128539 b!128537) bm!13894))

(declare-fun m!150575 () Bool)

(assert (=> b!128535 m!150575))

(assert (=> b!128535 m!150575))

(declare-fun m!150577 () Bool)

(assert (=> b!128535 m!150577))

(assert (=> bm!13894 m!150575))

(declare-fun m!150579 () Bool)

(assert (=> bm!13894 m!150579))

(assert (=> b!128536 m!150575))

(assert (=> b!128536 m!150575))

(declare-fun m!150581 () Bool)

(assert (=> b!128536 m!150581))

(assert (=> b!128538 m!150575))

(assert (=> b!128538 m!150575))

(assert (=> b!128538 m!150577))

(assert (=> bm!13866 d!38937))

(declare-fun lt!66605 () Bool)

(declare-fun d!38939 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!128 (List!1682) (InoxSet tuple2!2536))

(assert (=> d!38939 (= lt!66605 (select (content!128 (toList!835 lt!66341)) (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!83917 () Bool)

(assert (=> d!38939 (= lt!66605 e!83917)))

(declare-fun res!62065 () Bool)

(assert (=> d!38939 (=> (not res!62065) (not e!83917))))

(assert (=> d!38939 (= res!62065 ((_ is Cons!1678) (toList!835 lt!66341)))))

(assert (=> d!38939 (= (contains!871 (toList!835 lt!66341) (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66605)))

(declare-fun b!128544 () Bool)

(declare-fun e!83916 () Bool)

(assert (=> b!128544 (= e!83917 e!83916)))

(declare-fun res!62064 () Bool)

(assert (=> b!128544 (=> res!62064 e!83916)))

(assert (=> b!128544 (= res!62064 (= (h!2281 (toList!835 lt!66341)) (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128545 () Bool)

(assert (=> b!128545 (= e!83916 (contains!871 (t!6053 (toList!835 lt!66341)) (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38939 res!62065) b!128544))

(assert (= (and b!128544 (not res!62064)) b!128545))

(declare-fun m!150583 () Bool)

(assert (=> d!38939 m!150583))

(declare-fun m!150585 () Bool)

(assert (=> d!38939 m!150585))

(declare-fun m!150587 () Bool)

(assert (=> b!128545 m!150587))

(assert (=> b!128239 d!38939))

(assert (=> d!38837 d!38813))

(declare-fun d!38941 () Bool)

(assert (=> d!38941 (= (apply!112 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66250) (apply!112 lt!66267 lt!66250))))

(assert (=> d!38941 true))

(declare-fun _$34!958 () Unit!3985)

(assert (=> d!38941 (= (choose!780 lt!66267 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66250) _$34!958)))

(declare-fun bs!5330 () Bool)

(assert (= bs!5330 d!38941))

(assert (=> bs!5330 m!149919))

(assert (=> bs!5330 m!149919))

(assert (=> bs!5330 m!149921))

(assert (=> bs!5330 m!149911))

(assert (=> d!38837 d!38941))

(assert (=> d!38837 d!38823))

(declare-fun d!38943 () Bool)

(declare-fun e!83919 () Bool)

(assert (=> d!38943 e!83919))

(declare-fun res!62066 () Bool)

(assert (=> d!38943 (=> res!62066 e!83919)))

(declare-fun lt!66606 () Bool)

(assert (=> d!38943 (= res!62066 (not lt!66606))))

(declare-fun lt!66609 () Bool)

(assert (=> d!38943 (= lt!66606 lt!66609)))

(declare-fun lt!66607 () Unit!3985)

(declare-fun e!83918 () Unit!3985)

(assert (=> d!38943 (= lt!66607 e!83918)))

(declare-fun c!23592 () Bool)

(assert (=> d!38943 (= c!23592 lt!66609)))

(assert (=> d!38943 (= lt!66609 (containsKey!172 (toList!835 lt!66267) lt!66250))))

(assert (=> d!38943 (= (contains!869 lt!66267 lt!66250) lt!66606)))

(declare-fun b!128547 () Bool)

(declare-fun lt!66608 () Unit!3985)

(assert (=> b!128547 (= e!83918 lt!66608)))

(assert (=> b!128547 (= lt!66608 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66267) lt!66250))))

(assert (=> b!128547 (isDefined!121 (getValueByKey!169 (toList!835 lt!66267) lt!66250))))

(declare-fun b!128548 () Bool)

(declare-fun Unit!4006 () Unit!3985)

(assert (=> b!128548 (= e!83918 Unit!4006)))

(declare-fun b!128549 () Bool)

(assert (=> b!128549 (= e!83919 (isDefined!121 (getValueByKey!169 (toList!835 lt!66267) lt!66250)))))

(assert (= (and d!38943 c!23592) b!128547))

(assert (= (and d!38943 (not c!23592)) b!128548))

(assert (= (and d!38943 (not res!62066)) b!128549))

(declare-fun m!150589 () Bool)

(assert (=> d!38943 m!150589))

(declare-fun m!150591 () Bool)

(assert (=> b!128547 m!150591))

(assert (=> b!128547 m!150077))

(assert (=> b!128547 m!150077))

(declare-fun m!150593 () Bool)

(assert (=> b!128547 m!150593))

(assert (=> b!128549 m!150077))

(assert (=> b!128549 m!150077))

(assert (=> b!128549 m!150593))

(assert (=> d!38837 d!38943))

(assert (=> d!38837 d!38827))

(declare-fun d!38945 () Bool)

(assert (=> d!38945 (= (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (not (isEmpty!406 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun bs!5331 () Bool)

(assert (= bs!5331 d!38945))

(assert (=> bs!5331 m!150223))

(declare-fun m!150595 () Bool)

(assert (=> bs!5331 m!150595))

(assert (=> b!128495 d!38945))

(declare-fun b!128553 () Bool)

(declare-fun e!83921 () Option!175)

(assert (=> b!128553 (= e!83921 None!173)))

(declare-fun b!128552 () Bool)

(assert (=> b!128552 (= e!83921 (getValueByKey!169 (t!6053 (toList!835 lt!66270)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun c!23593 () Bool)

(declare-fun d!38947 () Bool)

(assert (=> d!38947 (= c!23593 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun e!83920 () Option!175)

(assert (=> d!38947 (= (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!83920)))

(declare-fun b!128551 () Bool)

(assert (=> b!128551 (= e!83920 e!83921)))

(declare-fun c!23594 () Bool)

(assert (=> b!128551 (= c!23594 (and ((_ is Cons!1678) (toList!835 lt!66270)) (not (= (_1!1279 (h!2281 (toList!835 lt!66270))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))))

(declare-fun b!128550 () Bool)

(assert (=> b!128550 (= e!83920 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66270)))))))

(assert (= (and d!38947 c!23593) b!128550))

(assert (= (and d!38947 (not c!23593)) b!128551))

(assert (= (and b!128551 c!23594) b!128552))

(assert (= (and b!128551 (not c!23594)) b!128553))

(assert (=> b!128552 m!149899))

(declare-fun m!150597 () Bool)

(assert (=> b!128552 m!150597))

(assert (=> b!128495 d!38947))

(declare-fun b!128554 () Bool)

(declare-fun e!83922 () (_ BitVec 32))

(declare-fun call!13898 () (_ BitVec 32))

(assert (=> b!128554 (= e!83922 (bvadd #b00000000000000000000000000000001 call!13898))))

(declare-fun b!128555 () Bool)

(declare-fun e!83923 () (_ BitVec 32))

(assert (=> b!128555 (= e!83923 #b00000000000000000000000000000000)))

(declare-fun bm!13895 () Bool)

(assert (=> bm!13895 (= call!13898 (arrayCountValidKeys!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun d!38949 () Bool)

(declare-fun lt!66610 () (_ BitVec 32))

(assert (=> d!38949 (and (bvsge lt!66610 #b00000000000000000000000000000000) (bvsle lt!66610 (bvsub (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (=> d!38949 (= lt!66610 e!83923)))

(declare-fun c!23596 () Bool)

(assert (=> d!38949 (= c!23596 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!38949 (and (bvsle #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!38949 (= (arrayCountValidKeys!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))) lt!66610)))

(declare-fun b!128556 () Bool)

(assert (=> b!128556 (= e!83922 call!13898)))

(declare-fun b!128557 () Bool)

(assert (=> b!128557 (= e!83923 e!83922)))

(declare-fun c!23595 () Bool)

(assert (=> b!128557 (= c!23595 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(assert (= (and d!38949 c!23596) b!128555))

(assert (= (and d!38949 (not c!23596)) b!128557))

(assert (= (and b!128557 c!23595) b!128554))

(assert (= (and b!128557 (not c!23595)) b!128556))

(assert (= (or b!128554 b!128556) bm!13895))

(declare-fun m!150599 () Bool)

(assert (=> bm!13895 m!150599))

(declare-fun m!150601 () Bool)

(assert (=> b!128557 m!150601))

(assert (=> b!128557 m!150601))

(declare-fun m!150603 () Bool)

(assert (=> b!128557 m!150603))

(assert (=> b!128385 d!38949))

(declare-fun d!38951 () Bool)

(declare-fun lt!66611 () Bool)

(assert (=> d!38951 (= lt!66611 (select (content!128 (toList!835 lt!66330)) (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!83925 () Bool)

(assert (=> d!38951 (= lt!66611 e!83925)))

(declare-fun res!62068 () Bool)

(assert (=> d!38951 (=> (not res!62068) (not e!83925))))

(assert (=> d!38951 (= res!62068 ((_ is Cons!1678) (toList!835 lt!66330)))))

(assert (=> d!38951 (= (contains!871 (toList!835 lt!66330) (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66611)))

(declare-fun b!128558 () Bool)

(declare-fun e!83924 () Bool)

(assert (=> b!128558 (= e!83925 e!83924)))

(declare-fun res!62067 () Bool)

(assert (=> b!128558 (=> res!62067 e!83924)))

(assert (=> b!128558 (= res!62067 (= (h!2281 (toList!835 lt!66330)) (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128559 () Bool)

(assert (=> b!128559 (= e!83924 (contains!871 (t!6053 (toList!835 lt!66330)) (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!38951 res!62068) b!128558))

(assert (= (and b!128558 (not res!62067)) b!128559))

(declare-fun m!150605 () Bool)

(assert (=> d!38951 m!150605))

(declare-fun m!150607 () Bool)

(assert (=> d!38951 m!150607))

(declare-fun m!150609 () Bool)

(assert (=> b!128559 m!150609))

(assert (=> b!128233 d!38951))

(declare-fun d!38953 () Bool)

(declare-fun res!62069 () Bool)

(declare-fun e!83926 () Bool)

(assert (=> d!38953 (=> res!62069 e!83926)))

(assert (=> d!38953 (= res!62069 (= (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!38953 (= (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!83926)))

(declare-fun b!128560 () Bool)

(declare-fun e!83927 () Bool)

(assert (=> b!128560 (= e!83926 e!83927)))

(declare-fun res!62070 () Bool)

(assert (=> b!128560 (=> (not res!62070) (not e!83927))))

(assert (=> b!128560 (= res!62070 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128561 () Bool)

(assert (=> b!128561 (= e!83927 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!38953 (not res!62069)) b!128560))

(assert (= (and b!128560 res!62070) b!128561))

(assert (=> d!38953 m!150575))

(assert (=> b!128561 m!149721))

(declare-fun m!150611 () Bool)

(assert (=> b!128561 m!150611))

(assert (=> b!128184 d!38953))

(declare-fun d!38955 () Bool)

(assert (=> d!38955 (= (get!1466 (getValueByKey!169 (toList!835 lt!66267) lt!66250)) (v!3150 (getValueByKey!169 (toList!835 lt!66267) lt!66250)))))

(assert (=> d!38823 d!38955))

(declare-fun b!128565 () Bool)

(declare-fun e!83929 () Option!175)

(assert (=> b!128565 (= e!83929 None!173)))

(declare-fun b!128564 () Bool)

(assert (=> b!128564 (= e!83929 (getValueByKey!169 (t!6053 (toList!835 lt!66267)) lt!66250))))

(declare-fun d!38957 () Bool)

(declare-fun c!23597 () Bool)

(assert (=> d!38957 (= c!23597 (and ((_ is Cons!1678) (toList!835 lt!66267)) (= (_1!1279 (h!2281 (toList!835 lt!66267))) lt!66250)))))

(declare-fun e!83928 () Option!175)

(assert (=> d!38957 (= (getValueByKey!169 (toList!835 lt!66267) lt!66250) e!83928)))

(declare-fun b!128563 () Bool)

(assert (=> b!128563 (= e!83928 e!83929)))

(declare-fun c!23598 () Bool)

(assert (=> b!128563 (= c!23598 (and ((_ is Cons!1678) (toList!835 lt!66267)) (not (= (_1!1279 (h!2281 (toList!835 lt!66267))) lt!66250))))))

(declare-fun b!128562 () Bool)

(assert (=> b!128562 (= e!83928 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66267)))))))

(assert (= (and d!38957 c!23597) b!128562))

(assert (= (and d!38957 (not c!23597)) b!128563))

(assert (= (and b!128563 c!23598) b!128564))

(assert (= (and b!128563 (not c!23598)) b!128565))

(declare-fun m!150613 () Bool)

(assert (=> b!128564 m!150613))

(assert (=> d!38823 d!38957))

(declare-fun d!38959 () Bool)

(declare-fun e!83931 () Bool)

(assert (=> d!38959 e!83931))

(declare-fun res!62071 () Bool)

(assert (=> d!38959 (=> res!62071 e!83931)))

(declare-fun lt!66612 () Bool)

(assert (=> d!38959 (= res!62071 (not lt!66612))))

(declare-fun lt!66615 () Bool)

(assert (=> d!38959 (= lt!66612 lt!66615)))

(declare-fun lt!66613 () Unit!3985)

(declare-fun e!83930 () Unit!3985)

(assert (=> d!38959 (= lt!66613 e!83930)))

(declare-fun c!23599 () Bool)

(assert (=> d!38959 (= c!23599 lt!66615)))

(assert (=> d!38959 (= lt!66615 (containsKey!172 (toList!835 lt!66561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38959 (= (contains!869 lt!66561 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66612)))

(declare-fun b!128566 () Bool)

(declare-fun lt!66614 () Unit!3985)

(assert (=> b!128566 (= e!83930 lt!66614)))

(assert (=> b!128566 (= lt!66614 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128566 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128567 () Bool)

(declare-fun Unit!4007 () Unit!3985)

(assert (=> b!128567 (= e!83930 Unit!4007)))

(declare-fun b!128568 () Bool)

(assert (=> b!128568 (= e!83931 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38959 c!23599) b!128566))

(assert (= (and d!38959 (not c!23599)) b!128567))

(assert (= (and d!38959 (not res!62071)) b!128568))

(declare-fun m!150615 () Bool)

(assert (=> d!38959 m!150615))

(declare-fun m!150617 () Bool)

(assert (=> b!128566 m!150617))

(declare-fun m!150619 () Bool)

(assert (=> b!128566 m!150619))

(assert (=> b!128566 m!150619))

(declare-fun m!150621 () Bool)

(assert (=> b!128566 m!150621))

(assert (=> b!128568 m!150619))

(assert (=> b!128568 m!150619))

(assert (=> b!128568 m!150621))

(assert (=> bm!13875 d!38959))

(declare-fun d!38961 () Bool)

(declare-fun e!83933 () Bool)

(assert (=> d!38961 e!83933))

(declare-fun res!62072 () Bool)

(assert (=> d!38961 (=> res!62072 e!83933)))

(declare-fun lt!66616 () Bool)

(assert (=> d!38961 (= res!62072 (not lt!66616))))

(declare-fun lt!66619 () Bool)

(assert (=> d!38961 (= lt!66616 lt!66619)))

(declare-fun lt!66617 () Unit!3985)

(declare-fun e!83932 () Unit!3985)

(assert (=> d!38961 (= lt!66617 e!83932)))

(declare-fun c!23600 () Bool)

(assert (=> d!38961 (= c!23600 lt!66619)))

(assert (=> d!38961 (= lt!66619 (containsKey!172 (toList!835 lt!66328) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!38961 (= (contains!869 lt!66328 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66616)))

(declare-fun b!128569 () Bool)

(declare-fun lt!66618 () Unit!3985)

(assert (=> b!128569 (= e!83932 lt!66618)))

(assert (=> b!128569 (= lt!66618 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66328) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128569 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128570 () Bool)

(declare-fun Unit!4008 () Unit!3985)

(assert (=> b!128570 (= e!83932 Unit!4008)))

(declare-fun b!128571 () Bool)

(assert (=> b!128571 (= e!83933 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!38961 c!23600) b!128569))

(assert (= (and d!38961 (not c!23600)) b!128570))

(assert (= (and d!38961 (not res!62072)) b!128571))

(declare-fun m!150623 () Bool)

(assert (=> d!38961 m!150623))

(declare-fun m!150625 () Bool)

(assert (=> b!128569 m!150625))

(declare-fun m!150627 () Bool)

(assert (=> b!128569 m!150627))

(assert (=> b!128569 m!150627))

(declare-fun m!150629 () Bool)

(assert (=> b!128569 m!150629))

(assert (=> b!128571 m!150627))

(assert (=> b!128571 m!150627))

(assert (=> b!128571 m!150629))

(assert (=> b!128220 d!38961))

(declare-fun d!38963 () Bool)

(assert (=> d!38963 (= (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!406 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5332 () Bool)

(assert (= bs!5332 d!38963))

(assert (=> bs!5332 m!150265))

(declare-fun m!150631 () Bool)

(assert (=> bs!5332 m!150631))

(assert (=> b!128408 d!38963))

(declare-fun b!128575 () Bool)

(declare-fun e!83935 () Option!175)

(assert (=> b!128575 (= e!83935 None!173)))

(declare-fun b!128574 () Bool)

(assert (=> b!128574 (= e!83935 (getValueByKey!169 (t!6053 (toList!835 lt!66270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!38965 () Bool)

(declare-fun c!23601 () Bool)

(assert (=> d!38965 (= c!23601 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!83934 () Option!175)

(assert (=> d!38965 (= (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000) e!83934)))

(declare-fun b!128573 () Bool)

(assert (=> b!128573 (= e!83934 e!83935)))

(declare-fun c!23602 () Bool)

(assert (=> b!128573 (= c!23602 (and ((_ is Cons!1678) (toList!835 lt!66270)) (not (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128572 () Bool)

(assert (=> b!128572 (= e!83934 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66270)))))))

(assert (= (and d!38965 c!23601) b!128572))

(assert (= (and d!38965 (not c!23601)) b!128573))

(assert (= (and b!128573 c!23602) b!128574))

(assert (= (and b!128573 (not c!23602)) b!128575))

(declare-fun m!150633 () Bool)

(assert (=> b!128574 m!150633))

(assert (=> b!128408 d!38965))

(declare-fun d!38967 () Bool)

(declare-fun e!83937 () Bool)

(assert (=> d!38967 e!83937))

(declare-fun res!62073 () Bool)

(assert (=> d!38967 (=> res!62073 e!83937)))

(declare-fun lt!66620 () Bool)

(assert (=> d!38967 (= res!62073 (not lt!66620))))

(declare-fun lt!66623 () Bool)

(assert (=> d!38967 (= lt!66620 lt!66623)))

(declare-fun lt!66621 () Unit!3985)

(declare-fun e!83936 () Unit!3985)

(assert (=> d!38967 (= lt!66621 e!83936)))

(declare-fun c!23603 () Bool)

(assert (=> d!38967 (= c!23603 lt!66623)))

(assert (=> d!38967 (= lt!66623 (containsKey!172 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!38967 (= (contains!869 lt!66532 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66620)))

(declare-fun b!128576 () Bool)

(declare-fun lt!66622 () Unit!3985)

(assert (=> b!128576 (= e!83936 lt!66622)))

(assert (=> b!128576 (= lt!66622 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> b!128576 (isDefined!121 (getValueByKey!169 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128577 () Bool)

(declare-fun Unit!4009 () Unit!3985)

(assert (=> b!128577 (= e!83936 Unit!4009)))

(declare-fun b!128578 () Bool)

(assert (=> b!128578 (= e!83937 (isDefined!121 (getValueByKey!169 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!38967 c!23603) b!128576))

(assert (= (and d!38967 (not c!23603)) b!128577))

(assert (= (and d!38967 (not res!62073)) b!128578))

(declare-fun m!150635 () Bool)

(assert (=> d!38967 m!150635))

(declare-fun m!150637 () Bool)

(assert (=> b!128576 m!150637))

(assert (=> b!128576 m!150411))

(assert (=> b!128576 m!150411))

(declare-fun m!150639 () Bool)

(assert (=> b!128576 m!150639))

(assert (=> b!128578 m!150411))

(assert (=> b!128578 m!150411))

(assert (=> b!128578 m!150639))

(assert (=> d!38907 d!38967))

(declare-fun b!128582 () Bool)

(declare-fun e!83939 () Option!175)

(assert (=> b!128582 (= e!83939 None!173)))

(declare-fun b!128581 () Bool)

(assert (=> b!128581 (= e!83939 (getValueByKey!169 (t!6053 lt!66534) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!38969 () Bool)

(declare-fun c!23604 () Bool)

(assert (=> d!38969 (= c!23604 (and ((_ is Cons!1678) lt!66534) (= (_1!1279 (h!2281 lt!66534)) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!83938 () Option!175)

(assert (=> d!38969 (= (getValueByKey!169 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!83938)))

(declare-fun b!128580 () Bool)

(assert (=> b!128580 (= e!83938 e!83939)))

(declare-fun c!23605 () Bool)

(assert (=> b!128580 (= c!23605 (and ((_ is Cons!1678) lt!66534) (not (= (_1!1279 (h!2281 lt!66534)) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!128579 () Bool)

(assert (=> b!128579 (= e!83938 (Some!174 (_2!1279 (h!2281 lt!66534))))))

(assert (= (and d!38969 c!23604) b!128579))

(assert (= (and d!38969 (not c!23604)) b!128580))

(assert (= (and b!128580 c!23605) b!128581))

(assert (= (and b!128580 (not c!23605)) b!128582))

(declare-fun m!150641 () Bool)

(assert (=> b!128581 m!150641))

(assert (=> d!38907 d!38969))

(declare-fun d!38971 () Bool)

(assert (=> d!38971 (= (getValueByKey!169 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66626 () Unit!3985)

(declare-fun choose!789 (List!1682 (_ BitVec 64) V!3449) Unit!3985)

(assert (=> d!38971 (= lt!66626 (choose!789 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!83942 () Bool)

(assert (=> d!38971 e!83942))

(declare-fun res!62078 () Bool)

(assert (=> d!38971 (=> (not res!62078) (not e!83942))))

(assert (=> d!38971 (= res!62078 (isStrictlySorted!305 lt!66534))))

(assert (=> d!38971 (= (lemmaContainsTupThenGetReturnValue!84 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66626)))

(declare-fun b!128587 () Bool)

(declare-fun res!62079 () Bool)

(assert (=> b!128587 (=> (not res!62079) (not e!83942))))

(assert (=> b!128587 (= res!62079 (containsKey!172 lt!66534 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128588 () Bool)

(assert (=> b!128588 (= e!83942 (contains!871 lt!66534 (tuple2!2537 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!38971 res!62078) b!128587))

(assert (= (and b!128587 res!62079) b!128588))

(assert (=> d!38971 m!150405))

(declare-fun m!150643 () Bool)

(assert (=> d!38971 m!150643))

(declare-fun m!150645 () Bool)

(assert (=> d!38971 m!150645))

(declare-fun m!150647 () Bool)

(assert (=> b!128587 m!150647))

(declare-fun m!150649 () Bool)

(assert (=> b!128588 m!150649))

(assert (=> d!38907 d!38971))

(declare-fun c!23615 () Bool)

(declare-fun e!83953 () List!1682)

(declare-fun bm!13902 () Bool)

(declare-fun call!13905 () List!1682)

(declare-fun $colon$colon!89 (List!1682 tuple2!2536) List!1682)

(assert (=> bm!13902 (= call!13905 ($colon$colon!89 e!83953 (ite c!23615 (h!2281 (toList!835 call!13835)) (tuple2!2537 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun c!23616 () Bool)

(assert (=> bm!13902 (= c!23616 c!23615)))

(declare-fun d!38973 () Bool)

(declare-fun e!83956 () Bool)

(assert (=> d!38973 e!83956))

(declare-fun res!62084 () Bool)

(assert (=> d!38973 (=> (not res!62084) (not e!83956))))

(declare-fun lt!66629 () List!1682)

(assert (=> d!38973 (= res!62084 (isStrictlySorted!305 lt!66629))))

(declare-fun e!83957 () List!1682)

(assert (=> d!38973 (= lt!66629 e!83957)))

(assert (=> d!38973 (= c!23615 (and ((_ is Cons!1678) (toList!835 call!13835)) (bvslt (_1!1279 (h!2281 (toList!835 call!13835))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!38973 (isStrictlySorted!305 (toList!835 call!13835))))

(assert (=> d!38973 (= (insertStrictlySorted!87 (toList!835 call!13835) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66629)))

(declare-fun b!128609 () Bool)

(assert (=> b!128609 (= e!83953 (insertStrictlySorted!87 (t!6053 (toList!835 call!13835)) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128610 () Bool)

(assert (=> b!128610 (= e!83957 call!13905)))

(declare-fun b!128611 () Bool)

(declare-fun e!83954 () List!1682)

(assert (=> b!128611 (= e!83957 e!83954)))

(declare-fun c!23617 () Bool)

(assert (=> b!128611 (= c!23617 (and ((_ is Cons!1678) (toList!835 call!13835)) (= (_1!1279 (h!2281 (toList!835 call!13835))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128612 () Bool)

(declare-fun e!83955 () List!1682)

(declare-fun call!13907 () List!1682)

(assert (=> b!128612 (= e!83955 call!13907)))

(declare-fun bm!13903 () Bool)

(declare-fun call!13906 () List!1682)

(assert (=> bm!13903 (= call!13907 call!13906)))

(declare-fun b!128613 () Bool)

(declare-fun c!23614 () Bool)

(assert (=> b!128613 (= e!83953 (ite c!23617 (t!6053 (toList!835 call!13835)) (ite c!23614 (Cons!1678 (h!2281 (toList!835 call!13835)) (t!6053 (toList!835 call!13835))) Nil!1679)))))

(declare-fun b!128614 () Bool)

(assert (=> b!128614 (= e!83955 call!13907)))

(declare-fun b!128615 () Bool)

(assert (=> b!128615 (= e!83956 (contains!871 lt!66629 (tuple2!2537 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128616 () Bool)

(assert (=> b!128616 (= c!23614 (and ((_ is Cons!1678) (toList!835 call!13835)) (bvsgt (_1!1279 (h!2281 (toList!835 call!13835))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!128616 (= e!83954 e!83955)))

(declare-fun b!128617 () Bool)

(declare-fun res!62085 () Bool)

(assert (=> b!128617 (=> (not res!62085) (not e!83956))))

(assert (=> b!128617 (= res!62085 (containsKey!172 lt!66629 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun bm!13904 () Bool)

(assert (=> bm!13904 (= call!13906 call!13905)))

(declare-fun b!128618 () Bool)

(assert (=> b!128618 (= e!83954 call!13906)))

(assert (= (and d!38973 c!23615) b!128610))

(assert (= (and d!38973 (not c!23615)) b!128611))

(assert (= (and b!128611 c!23617) b!128618))

(assert (= (and b!128611 (not c!23617)) b!128616))

(assert (= (and b!128616 c!23614) b!128614))

(assert (= (and b!128616 (not c!23614)) b!128612))

(assert (= (or b!128614 b!128612) bm!13903))

(assert (= (or b!128618 bm!13903) bm!13904))

(assert (= (or b!128610 bm!13904) bm!13902))

(assert (= (and bm!13902 c!23616) b!128609))

(assert (= (and bm!13902 (not c!23616)) b!128613))

(assert (= (and d!38973 res!62084) b!128617))

(assert (= (and b!128617 res!62085) b!128615))

(declare-fun m!150651 () Bool)

(assert (=> b!128617 m!150651))

(declare-fun m!150653 () Bool)

(assert (=> b!128609 m!150653))

(declare-fun m!150655 () Bool)

(assert (=> d!38973 m!150655))

(declare-fun m!150657 () Bool)

(assert (=> d!38973 m!150657))

(declare-fun m!150659 () Bool)

(assert (=> bm!13902 m!150659))

(declare-fun m!150661 () Bool)

(assert (=> b!128615 m!150661))

(assert (=> d!38907 d!38973))

(declare-fun d!38975 () Bool)

(assert (=> d!38975 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))

(declare-fun lt!66632 () Unit!3985)

(declare-fun choose!790 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 64) (_ BitVec 32) Int) Unit!3985)

(assert (=> d!38975 (= lt!66632 (choose!790 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!38975 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!38975 (= (lemmaArrayContainsKeyThenInListMap!38 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66632)))

(declare-fun bs!5333 () Bool)

(assert (= bs!5333 d!38975))

(assert (=> bs!5333 m!149859))

(assert (=> bs!5333 m!149859))

(assert (=> bs!5333 m!149721))

(assert (=> bs!5333 m!149865))

(assert (=> bs!5333 m!149721))

(declare-fun m!150663 () Bool)

(assert (=> bs!5333 m!150663))

(assert (=> bs!5333 m!149963))

(assert (=> b!128288 d!38975))

(assert (=> b!128288 d!38901))

(assert (=> b!128288 d!38803))

(declare-fun d!38977 () Bool)

(assert (=> d!38977 (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))

(assert (=> d!38977 true))

(declare-fun _$16!145 () Unit!3985)

(assert (=> d!38977 (= (choose!786 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (defaultEntry!2804 newMap!16)) _$16!145)))

(declare-fun bs!5334 () Bool)

(assert (= bs!5334 d!38977))

(assert (=> bs!5334 m!150379))

(assert (=> bs!5334 m!149871))

(assert (=> bs!5334 m!150379))

(assert (=> bs!5334 m!149871))

(assert (=> bs!5334 m!150381))

(assert (=> d!38897 d!38977))

(assert (=> d!38897 d!38921))

(declare-fun d!38979 () Bool)

(assert (=> d!38979 (= (apply!112 (+!165 lt!66559 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) lt!66554) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66559 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))) lt!66554)))))

(declare-fun bs!5335 () Bool)

(assert (= bs!5335 d!38979))

(declare-fun m!150665 () Bool)

(assert (=> bs!5335 m!150665))

(assert (=> bs!5335 m!150665))

(declare-fun m!150667 () Bool)

(assert (=> bs!5335 m!150667))

(assert (=> b!128463 d!38979))

(declare-fun d!38981 () Bool)

(assert (=> d!38981 (= (apply!112 (+!165 lt!66558 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) lt!66541) (apply!112 lt!66558 lt!66541))))

(declare-fun lt!66633 () Unit!3985)

(assert (=> d!38981 (= lt!66633 (choose!780 lt!66558 lt!66552 (minValue!2665 newMap!16) lt!66541))))

(declare-fun e!83958 () Bool)

(assert (=> d!38981 e!83958))

(declare-fun res!62086 () Bool)

(assert (=> d!38981 (=> (not res!62086) (not e!83958))))

(assert (=> d!38981 (= res!62086 (contains!869 lt!66558 lt!66541))))

(assert (=> d!38981 (= (addApplyDifferent!88 lt!66558 lt!66552 (minValue!2665 newMap!16) lt!66541) lt!66633)))

(declare-fun b!128619 () Bool)

(assert (=> b!128619 (= e!83958 (not (= lt!66541 lt!66552)))))

(assert (= (and d!38981 res!62086) b!128619))

(assert (=> d!38981 m!150439))

(declare-fun m!150669 () Bool)

(assert (=> d!38981 m!150669))

(assert (=> d!38981 m!150447))

(assert (=> d!38981 m!150449))

(declare-fun m!150671 () Bool)

(assert (=> d!38981 m!150671))

(assert (=> d!38981 m!150447))

(assert (=> b!128463 d!38981))

(declare-fun d!38983 () Bool)

(assert (=> d!38983 (= (apply!112 (+!165 lt!66556 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66548) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66556 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66548)))))

(declare-fun bs!5336 () Bool)

(assert (= bs!5336 d!38983))

(declare-fun m!150673 () Bool)

(assert (=> bs!5336 m!150673))

(assert (=> bs!5336 m!150673))

(declare-fun m!150675 () Bool)

(assert (=> bs!5336 m!150675))

(assert (=> b!128463 d!38983))

(declare-fun d!38985 () Bool)

(assert (=> d!38985 (= (apply!112 (+!165 lt!66559 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) lt!66554) (apply!112 lt!66559 lt!66554))))

(declare-fun lt!66634 () Unit!3985)

(assert (=> d!38985 (= lt!66634 (choose!780 lt!66559 lt!66545 (minValue!2665 newMap!16) lt!66554))))

(declare-fun e!83959 () Bool)

(assert (=> d!38985 e!83959))

(declare-fun res!62087 () Bool)

(assert (=> d!38985 (=> (not res!62087) (not e!83959))))

(assert (=> d!38985 (= res!62087 (contains!869 lt!66559 lt!66554))))

(assert (=> d!38985 (= (addApplyDifferent!88 lt!66559 lt!66545 (minValue!2665 newMap!16) lt!66554) lt!66634)))

(declare-fun b!128620 () Bool)

(assert (=> b!128620 (= e!83959 (not (= lt!66554 lt!66545)))))

(assert (= (and d!38985 res!62087) b!128620))

(assert (=> d!38985 m!150459))

(declare-fun m!150677 () Bool)

(assert (=> d!38985 m!150677))

(assert (=> d!38985 m!150443))

(assert (=> d!38985 m!150445))

(declare-fun m!150679 () Bool)

(assert (=> d!38985 m!150679))

(assert (=> d!38985 m!150443))

(assert (=> b!128463 d!38985))

(declare-fun d!38987 () Bool)

(assert (=> d!38987 (= (apply!112 lt!66559 lt!66554) (get!1466 (getValueByKey!169 (toList!835 lt!66559) lt!66554)))))

(declare-fun bs!5337 () Bool)

(assert (= bs!5337 d!38987))

(declare-fun m!150681 () Bool)

(assert (=> bs!5337 m!150681))

(assert (=> bs!5337 m!150681))

(declare-fun m!150683 () Bool)

(assert (=> bs!5337 m!150683))

(assert (=> b!128463 d!38987))

(declare-fun d!38989 () Bool)

(assert (=> d!38989 (= (apply!112 (+!165 lt!66556 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66548) (apply!112 lt!66556 lt!66548))))

(declare-fun lt!66635 () Unit!3985)

(assert (=> d!38989 (= lt!66635 (choose!780 lt!66556 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66548))))

(declare-fun e!83960 () Bool)

(assert (=> d!38989 e!83960))

(declare-fun res!62088 () Bool)

(assert (=> d!38989 (=> (not res!62088) (not e!83960))))

(assert (=> d!38989 (= res!62088 (contains!869 lt!66556 lt!66548))))

(assert (=> d!38989 (= (addApplyDifferent!88 lt!66556 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66548) lt!66635)))

(declare-fun b!128621 () Bool)

(assert (=> b!128621 (= e!83960 (not (= lt!66548 lt!66557)))))

(assert (= (and d!38989 res!62088) b!128621))

(assert (=> d!38989 m!150451))

(declare-fun m!150685 () Bool)

(assert (=> d!38989 m!150685))

(assert (=> d!38989 m!150453))

(assert (=> d!38989 m!150465))

(declare-fun m!150687 () Bool)

(assert (=> d!38989 m!150687))

(assert (=> d!38989 m!150453))

(assert (=> b!128463 d!38989))

(declare-fun d!38991 () Bool)

(assert (=> d!38991 (= (apply!112 lt!66558 lt!66541) (get!1466 (getValueByKey!169 (toList!835 lt!66558) lt!66541)))))

(declare-fun bs!5338 () Bool)

(assert (= bs!5338 d!38991))

(declare-fun m!150689 () Bool)

(assert (=> bs!5338 m!150689))

(assert (=> bs!5338 m!150689))

(declare-fun m!150691 () Bool)

(assert (=> bs!5338 m!150691))

(assert (=> b!128463 d!38991))

(declare-fun d!38993 () Bool)

(declare-fun e!83961 () Bool)

(assert (=> d!38993 e!83961))

(declare-fun res!62090 () Bool)

(assert (=> d!38993 (=> (not res!62090) (not e!83961))))

(declare-fun lt!66636 () ListLongMap!1639)

(assert (=> d!38993 (= res!62090 (contains!869 lt!66636 (_1!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))))))

(declare-fun lt!66638 () List!1682)

(assert (=> d!38993 (= lt!66636 (ListLongMap!1640 lt!66638))))

(declare-fun lt!66637 () Unit!3985)

(declare-fun lt!66639 () Unit!3985)

(assert (=> d!38993 (= lt!66637 lt!66639)))

(assert (=> d!38993 (= (getValueByKey!169 lt!66638 (_1!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))))))

(assert (=> d!38993 (= lt!66639 (lemmaContainsTupThenGetReturnValue!84 lt!66638 (_1!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))))))

(assert (=> d!38993 (= lt!66638 (insertStrictlySorted!87 (toList!835 lt!66558) (_1!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))))))

(assert (=> d!38993 (= (+!165 lt!66558 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) lt!66636)))

(declare-fun b!128622 () Bool)

(declare-fun res!62089 () Bool)

(assert (=> b!128622 (=> (not res!62089) (not e!83961))))

(assert (=> b!128622 (= res!62089 (= (getValueByKey!169 (toList!835 lt!66636) (_1!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))))))))

(declare-fun b!128623 () Bool)

(assert (=> b!128623 (= e!83961 (contains!871 (toList!835 lt!66636) (tuple2!2537 lt!66552 (minValue!2665 newMap!16))))))

(assert (= (and d!38993 res!62090) b!128622))

(assert (= (and b!128622 res!62089) b!128623))

(declare-fun m!150693 () Bool)

(assert (=> d!38993 m!150693))

(declare-fun m!150695 () Bool)

(assert (=> d!38993 m!150695))

(declare-fun m!150697 () Bool)

(assert (=> d!38993 m!150697))

(declare-fun m!150699 () Bool)

(assert (=> d!38993 m!150699))

(declare-fun m!150701 () Bool)

(assert (=> b!128622 m!150701))

(declare-fun m!150703 () Bool)

(assert (=> b!128623 m!150703))

(assert (=> b!128463 d!38993))

(declare-fun d!38995 () Bool)

(declare-fun e!83962 () Bool)

(assert (=> d!38995 e!83962))

(declare-fun res!62092 () Bool)

(assert (=> d!38995 (=> (not res!62092) (not e!83962))))

(declare-fun lt!66640 () ListLongMap!1639)

(assert (=> d!38995 (= res!62092 (contains!869 lt!66640 (_1!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(declare-fun lt!66642 () List!1682)

(assert (=> d!38995 (= lt!66640 (ListLongMap!1640 lt!66642))))

(declare-fun lt!66641 () Unit!3985)

(declare-fun lt!66643 () Unit!3985)

(assert (=> d!38995 (= lt!66641 lt!66643)))

(assert (=> d!38995 (= (getValueByKey!169 lt!66642 (_1!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!38995 (= lt!66643 (lemmaContainsTupThenGetReturnValue!84 lt!66642 (_1!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!38995 (= lt!66642 (insertStrictlySorted!87 (toList!835 lt!66542) (_1!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!38995 (= (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66640)))

(declare-fun b!128624 () Bool)

(declare-fun res!62091 () Bool)

(assert (=> b!128624 (=> (not res!62091) (not e!83962))))

(assert (=> b!128624 (= res!62091 (= (getValueByKey!169 (toList!835 lt!66640) (_1!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))))

(declare-fun b!128625 () Bool)

(assert (=> b!128625 (= e!83962 (contains!871 (toList!835 lt!66640) (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))

(assert (= (and d!38995 res!62092) b!128624))

(assert (= (and b!128624 res!62091) b!128625))

(declare-fun m!150705 () Bool)

(assert (=> d!38995 m!150705))

(declare-fun m!150707 () Bool)

(assert (=> d!38995 m!150707))

(declare-fun m!150709 () Bool)

(assert (=> d!38995 m!150709))

(declare-fun m!150711 () Bool)

(assert (=> d!38995 m!150711))

(declare-fun m!150713 () Bool)

(assert (=> b!128624 m!150713))

(declare-fun m!150715 () Bool)

(assert (=> b!128625 m!150715))

(assert (=> b!128463 d!38995))

(declare-fun d!38997 () Bool)

(assert (=> d!38997 (= (apply!112 lt!66556 lt!66548) (get!1466 (getValueByKey!169 (toList!835 lt!66556) lt!66548)))))

(declare-fun bs!5339 () Bool)

(assert (= bs!5339 d!38997))

(declare-fun m!150717 () Bool)

(assert (=> bs!5339 m!150717))

(assert (=> bs!5339 m!150717))

(declare-fun m!150719 () Bool)

(assert (=> bs!5339 m!150719))

(assert (=> b!128463 d!38997))

(declare-fun d!38999 () Bool)

(declare-fun e!83963 () Bool)

(assert (=> d!38999 e!83963))

(declare-fun res!62094 () Bool)

(assert (=> d!38999 (=> (not res!62094) (not e!83963))))

(declare-fun lt!66644 () ListLongMap!1639)

(assert (=> d!38999 (= res!62094 (contains!869 lt!66644 (_1!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))))))

(declare-fun lt!66646 () List!1682)

(assert (=> d!38999 (= lt!66644 (ListLongMap!1640 lt!66646))))

(declare-fun lt!66645 () Unit!3985)

(declare-fun lt!66647 () Unit!3985)

(assert (=> d!38999 (= lt!66645 lt!66647)))

(assert (=> d!38999 (= (getValueByKey!169 lt!66646 (_1!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))))))

(assert (=> d!38999 (= lt!66647 (lemmaContainsTupThenGetReturnValue!84 lt!66646 (_1!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))))))

(assert (=> d!38999 (= lt!66646 (insertStrictlySorted!87 (toList!835 lt!66559) (_1!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))))))

(assert (=> d!38999 (= (+!165 lt!66559 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))) lt!66644)))

(declare-fun b!128626 () Bool)

(declare-fun res!62093 () Bool)

(assert (=> b!128626 (=> (not res!62093) (not e!83963))))

(assert (=> b!128626 (= res!62093 (= (getValueByKey!169 (toList!835 lt!66644) (_1!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66545 (minValue!2665 newMap!16))))))))

(declare-fun b!128627 () Bool)

(assert (=> b!128627 (= e!83963 (contains!871 (toList!835 lt!66644) (tuple2!2537 lt!66545 (minValue!2665 newMap!16))))))

(assert (= (and d!38999 res!62094) b!128626))

(assert (= (and b!128626 res!62093) b!128627))

(declare-fun m!150721 () Bool)

(assert (=> d!38999 m!150721))

(declare-fun m!150723 () Bool)

(assert (=> d!38999 m!150723))

(declare-fun m!150725 () Bool)

(assert (=> d!38999 m!150725))

(declare-fun m!150727 () Bool)

(assert (=> d!38999 m!150727))

(declare-fun m!150729 () Bool)

(assert (=> b!128626 m!150729))

(declare-fun m!150731 () Bool)

(assert (=> b!128627 m!150731))

(assert (=> b!128463 d!38999))

(declare-fun d!39001 () Bool)

(assert (=> d!39001 (contains!869 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66543)))

(declare-fun lt!66648 () Unit!3985)

(assert (=> d!39001 (= lt!66648 (choose!781 lt!66542 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66543))))

(assert (=> d!39001 (contains!869 lt!66542 lt!66543)))

(assert (=> d!39001 (= (addStillContains!88 lt!66542 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) lt!66543) lt!66648)))

(declare-fun bs!5340 () Bool)

(assert (= bs!5340 d!39001))

(assert (=> bs!5340 m!150461))

(assert (=> bs!5340 m!150461))

(assert (=> bs!5340 m!150463))

(declare-fun m!150733 () Bool)

(assert (=> bs!5340 m!150733))

(declare-fun m!150735 () Bool)

(assert (=> bs!5340 m!150735))

(assert (=> b!128463 d!39001))

(declare-fun d!39003 () Bool)

(declare-fun e!83965 () Bool)

(assert (=> d!39003 e!83965))

(declare-fun res!62095 () Bool)

(assert (=> d!39003 (=> res!62095 e!83965)))

(declare-fun lt!66649 () Bool)

(assert (=> d!39003 (= res!62095 (not lt!66649))))

(declare-fun lt!66652 () Bool)

(assert (=> d!39003 (= lt!66649 lt!66652)))

(declare-fun lt!66650 () Unit!3985)

(declare-fun e!83964 () Unit!3985)

(assert (=> d!39003 (= lt!66650 e!83964)))

(declare-fun c!23618 () Bool)

(assert (=> d!39003 (= c!23618 lt!66652)))

(assert (=> d!39003 (= lt!66652 (containsKey!172 (toList!835 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66543))))

(assert (=> d!39003 (= (contains!869 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66543) lt!66649)))

(declare-fun b!128628 () Bool)

(declare-fun lt!66651 () Unit!3985)

(assert (=> b!128628 (= e!83964 lt!66651)))

(assert (=> b!128628 (= lt!66651 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66543))))

(assert (=> b!128628 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66543))))

(declare-fun b!128629 () Bool)

(declare-fun Unit!4010 () Unit!3985)

(assert (=> b!128629 (= e!83964 Unit!4010)))

(declare-fun b!128630 () Bool)

(assert (=> b!128630 (= e!83965 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66542 (tuple2!2537 lt!66546 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) lt!66543)))))

(assert (= (and d!39003 c!23618) b!128628))

(assert (= (and d!39003 (not c!23618)) b!128629))

(assert (= (and d!39003 (not res!62095)) b!128630))

(declare-fun m!150737 () Bool)

(assert (=> d!39003 m!150737))

(declare-fun m!150739 () Bool)

(assert (=> b!128628 m!150739))

(declare-fun m!150741 () Bool)

(assert (=> b!128628 m!150741))

(assert (=> b!128628 m!150741))

(declare-fun m!150743 () Bool)

(assert (=> b!128628 m!150743))

(assert (=> b!128630 m!150741))

(assert (=> b!128630 m!150741))

(assert (=> b!128630 m!150743))

(assert (=> b!128463 d!39003))

(declare-fun b!128631 () Bool)

(declare-fun res!62097 () Bool)

(declare-fun e!83971 () Bool)

(assert (=> b!128631 (=> (not res!62097) (not e!83971))))

(declare-fun lt!66658 () ListLongMap!1639)

(assert (=> b!128631 (= res!62097 (not (contains!869 lt!66658 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128632 () Bool)

(assert (=> b!128632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> b!128632 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (ite c!23474 (_values!2787 newMap!16) lt!66194))))))

(declare-fun e!83966 () Bool)

(assert (=> b!128632 (= e!83966 (= (apply!112 lt!66658 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128633 () Bool)

(declare-fun e!83970 () ListLongMap!1639)

(declare-fun e!83968 () ListLongMap!1639)

(assert (=> b!128633 (= e!83970 e!83968)))

(declare-fun c!23622 () Bool)

(assert (=> b!128633 (= c!23622 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128634 () Bool)

(declare-fun lt!66655 () Unit!3985)

(declare-fun lt!66654 () Unit!3985)

(assert (=> b!128634 (= lt!66655 lt!66654)))

(declare-fun lt!66659 () ListLongMap!1639)

(declare-fun lt!66653 () (_ BitVec 64))

(declare-fun lt!66657 () V!3449)

(declare-fun lt!66656 () (_ BitVec 64))

(assert (=> b!128634 (not (contains!869 (+!165 lt!66659 (tuple2!2537 lt!66656 lt!66657)) lt!66653))))

(assert (=> b!128634 (= lt!66654 (addStillNotContains!59 lt!66659 lt!66656 lt!66657 lt!66653))))

(assert (=> b!128634 (= lt!66653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128634 (= lt!66657 (get!1462 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128634 (= lt!66656 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13908 () ListLongMap!1639)

(assert (=> b!128634 (= lt!66659 call!13908)))

(assert (=> b!128634 (= e!83968 (+!165 call!13908 (tuple2!2537 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (get!1462 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!83969 () Bool)

(declare-fun b!128635 () Bool)

(assert (=> b!128635 (= e!83969 (= lt!66658 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!128636 () Bool)

(assert (=> b!128636 (= e!83970 (ListLongMap!1640 Nil!1679))))

(declare-fun b!128637 () Bool)

(declare-fun e!83972 () Bool)

(assert (=> b!128637 (= e!83971 e!83972)))

(declare-fun c!23619 () Bool)

(declare-fun e!83967 () Bool)

(assert (=> b!128637 (= c!23619 e!83967)))

(declare-fun res!62099 () Bool)

(assert (=> b!128637 (=> (not res!62099) (not e!83967))))

(assert (=> b!128637 (= res!62099 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128638 () Bool)

(assert (=> b!128638 (= e!83968 call!13908)))

(declare-fun b!128639 () Bool)

(assert (=> b!128639 (= e!83972 e!83969)))

(declare-fun c!23621 () Bool)

(assert (=> b!128639 (= c!23621 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128640 () Bool)

(assert (=> b!128640 (= e!83972 e!83966)))

(assert (=> b!128640 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62096 () Bool)

(assert (=> b!128640 (= res!62096 (contains!869 lt!66658 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128640 (=> (not res!62096) (not e!83966))))

(declare-fun b!128641 () Bool)

(assert (=> b!128641 (= e!83967 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128641 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128642 () Bool)

(assert (=> b!128642 (= e!83969 (isEmpty!405 lt!66658))))

(declare-fun d!39005 () Bool)

(assert (=> d!39005 e!83971))

(declare-fun res!62098 () Bool)

(assert (=> d!39005 (=> (not res!62098) (not e!83971))))

(assert (=> d!39005 (= res!62098 (not (contains!869 lt!66658 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39005 (= lt!66658 e!83970)))

(declare-fun c!23620 () Bool)

(assert (=> d!39005 (= c!23620 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39005 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39005 (= (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66658)))

(declare-fun bm!13905 () Bool)

(assert (=> bm!13905 (= call!13908 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite c!23474 (_values!2787 newMap!16) lt!66194) (mask!7072 newMap!16) (ite (and c!23474 c!23467) lt!66184 (extraKeys!2581 newMap!16)) (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(assert (= (and d!39005 c!23620) b!128636))

(assert (= (and d!39005 (not c!23620)) b!128633))

(assert (= (and b!128633 c!23622) b!128634))

(assert (= (and b!128633 (not c!23622)) b!128638))

(assert (= (or b!128634 b!128638) bm!13905))

(assert (= (and d!39005 res!62098) b!128631))

(assert (= (and b!128631 res!62097) b!128637))

(assert (= (and b!128637 res!62099) b!128641))

(assert (= (and b!128637 c!23619) b!128640))

(assert (= (and b!128637 (not c!23619)) b!128639))

(assert (= (and b!128640 res!62096) b!128632))

(assert (= (and b!128639 c!23621) b!128635))

(assert (= (and b!128639 (not c!23621)) b!128642))

(declare-fun b_lambda!5695 () Bool)

(assert (=> (not b_lambda!5695) (not b!128632)))

(assert (=> b!128632 t!6065))

(declare-fun b_and!7941 () Bool)

(assert (= b_and!7937 (and (=> t!6065 result!3889) b_and!7941)))

(assert (=> b!128632 t!6067))

(declare-fun b_and!7943 () Bool)

(assert (= b_and!7939 (and (=> t!6067 result!3891) b_and!7943)))

(declare-fun b_lambda!5697 () Bool)

(assert (=> (not b_lambda!5697) (not b!128634)))

(assert (=> b!128634 t!6065))

(declare-fun b_and!7945 () Bool)

(assert (= b_and!7941 (and (=> t!6065 result!3889) b_and!7945)))

(assert (=> b!128634 t!6067))

(declare-fun b_and!7947 () Bool)

(assert (= b_and!7943 (and (=> t!6067 result!3891) b_and!7947)))

(declare-fun m!150745 () Bool)

(assert (=> d!39005 m!150745))

(assert (=> d!39005 m!149963))

(assert (=> b!128634 m!150011))

(assert (=> b!128634 m!149959))

(declare-fun m!150747 () Bool)

(assert (=> b!128634 m!150747))

(declare-fun m!150749 () Bool)

(assert (=> b!128634 m!150749))

(assert (=> b!128634 m!150475))

(declare-fun m!150751 () Bool)

(assert (=> b!128634 m!150751))

(declare-fun m!150753 () Bool)

(assert (=> b!128634 m!150753))

(assert (=> b!128634 m!150747))

(assert (=> b!128634 m!150475))

(assert (=> b!128634 m!150011))

(assert (=> b!128634 m!150477))

(assert (=> b!128640 m!149959))

(assert (=> b!128640 m!149959))

(declare-fun m!150755 () Bool)

(assert (=> b!128640 m!150755))

(declare-fun m!150757 () Bool)

(assert (=> bm!13905 m!150757))

(declare-fun m!150759 () Bool)

(assert (=> b!128631 m!150759))

(assert (=> b!128633 m!149959))

(assert (=> b!128633 m!149959))

(assert (=> b!128633 m!149965))

(assert (=> b!128635 m!150757))

(declare-fun m!150761 () Bool)

(assert (=> b!128642 m!150761))

(assert (=> b!128641 m!149959))

(assert (=> b!128641 m!149959))

(assert (=> b!128641 m!149965))

(assert (=> b!128632 m!150011))

(assert (=> b!128632 m!149959))

(assert (=> b!128632 m!150475))

(assert (=> b!128632 m!149959))

(declare-fun m!150763 () Bool)

(assert (=> b!128632 m!150763))

(assert (=> b!128632 m!150475))

(assert (=> b!128632 m!150011))

(assert (=> b!128632 m!150477))

(assert (=> b!128463 d!39005))

(declare-fun d!39007 () Bool)

(declare-fun e!83973 () Bool)

(assert (=> d!39007 e!83973))

(declare-fun res!62101 () Bool)

(assert (=> d!39007 (=> (not res!62101) (not e!83973))))

(declare-fun lt!66660 () ListLongMap!1639)

(assert (=> d!39007 (= res!62101 (contains!869 lt!66660 (_1!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(declare-fun lt!66662 () List!1682)

(assert (=> d!39007 (= lt!66660 (ListLongMap!1640 lt!66662))))

(declare-fun lt!66661 () Unit!3985)

(declare-fun lt!66663 () Unit!3985)

(assert (=> d!39007 (= lt!66661 lt!66663)))

(assert (=> d!39007 (= (getValueByKey!169 lt!66662 (_1!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39007 (= lt!66663 (lemmaContainsTupThenGetReturnValue!84 lt!66662 (_1!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39007 (= lt!66662 (insertStrictlySorted!87 (toList!835 lt!66556) (_1!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))))))

(assert (=> d!39007 (= (+!165 lt!66556 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))) lt!66660)))

(declare-fun b!128643 () Bool)

(declare-fun res!62100 () Bool)

(assert (=> b!128643 (=> (not res!62100) (not e!83973))))

(assert (=> b!128643 (= res!62100 (= (getValueByKey!169 (toList!835 lt!66660) (_1!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))))

(declare-fun b!128644 () Bool)

(assert (=> b!128644 (= e!83973 (contains!871 (toList!835 lt!66660) (tuple2!2537 lt!66557 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16)))))))

(assert (= (and d!39007 res!62101) b!128643))

(assert (= (and b!128643 res!62100) b!128644))

(declare-fun m!150765 () Bool)

(assert (=> d!39007 m!150765))

(declare-fun m!150767 () Bool)

(assert (=> d!39007 m!150767))

(declare-fun m!150769 () Bool)

(assert (=> d!39007 m!150769))

(declare-fun m!150771 () Bool)

(assert (=> d!39007 m!150771))

(declare-fun m!150773 () Bool)

(assert (=> b!128643 m!150773))

(declare-fun m!150775 () Bool)

(assert (=> b!128644 m!150775))

(assert (=> b!128463 d!39007))

(declare-fun d!39009 () Bool)

(assert (=> d!39009 (= (apply!112 (+!165 lt!66558 (tuple2!2537 lt!66552 (minValue!2665 newMap!16))) lt!66541) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66558 (tuple2!2537 lt!66552 (minValue!2665 newMap!16)))) lt!66541)))))

(declare-fun bs!5341 () Bool)

(assert (= bs!5341 d!39009))

(declare-fun m!150777 () Bool)

(assert (=> bs!5341 m!150777))

(assert (=> bs!5341 m!150777))

(declare-fun m!150779 () Bool)

(assert (=> bs!5341 m!150779))

(assert (=> b!128463 d!39009))

(declare-fun b!128645 () Bool)

(declare-fun e!83974 () (_ BitVec 32))

(declare-fun call!13909 () (_ BitVec 32))

(assert (=> b!128645 (= e!83974 (bvadd #b00000000000000000000000000000001 call!13909))))

(declare-fun b!128646 () Bool)

(declare-fun e!83975 () (_ BitVec 32))

(assert (=> b!128646 (= e!83975 #b00000000000000000000000000000000)))

(declare-fun bm!13906 () Bool)

(assert (=> bm!13906 (= call!13909 (arrayCountValidKeys!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun d!39011 () Bool)

(declare-fun lt!66664 () (_ BitVec 32))

(assert (=> d!39011 (and (bvsge lt!66664 #b00000000000000000000000000000000) (bvsle lt!66664 (bvsub (size!2493 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!39011 (= lt!66664 e!83975)))

(declare-fun c!23624 () Bool)

(assert (=> d!39011 (= c!23624 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39011 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!2493 (_keys!4541 newMap!16)) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39011 (= (arrayCountValidKeys!0 (_keys!4541 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))) lt!66664)))

(declare-fun b!128647 () Bool)

(assert (=> b!128647 (= e!83974 call!13909)))

(declare-fun b!128648 () Bool)

(assert (=> b!128648 (= e!83975 e!83974)))

(declare-fun c!23623 () Bool)

(assert (=> b!128648 (= c!23623 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!39011 c!23624) b!128646))

(assert (= (and d!39011 (not c!23624)) b!128648))

(assert (= (and b!128648 c!23623) b!128645))

(assert (= (and b!128648 (not c!23623)) b!128647))

(assert (= (or b!128645 b!128647) bm!13906))

(declare-fun m!150781 () Bool)

(assert (=> bm!13906 m!150781))

(assert (=> b!128648 m!150575))

(assert (=> b!128648 m!150575))

(assert (=> b!128648 m!150577))

(assert (=> bm!13860 d!39011))

(declare-fun d!39013 () Bool)

(assert (=> d!39013 (= (apply!112 lt!66287 lt!66279) (get!1466 (getValueByKey!169 (toList!835 lt!66287) lt!66279)))))

(declare-fun bs!5342 () Bool)

(assert (= bs!5342 d!39013))

(declare-fun m!150783 () Bool)

(assert (=> bs!5342 m!150783))

(assert (=> bs!5342 m!150783))

(declare-fun m!150785 () Bool)

(assert (=> bs!5342 m!150785))

(assert (=> b!128173 d!39013))

(declare-fun d!39015 () Bool)

(assert (=> d!39015 (contains!869 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) lt!66274)))

(declare-fun lt!66665 () Unit!3985)

(assert (=> d!39015 (= lt!66665 (choose!781 lt!66273 lt!66277 (zeroValue!2665 newMap!16) lt!66274))))

(assert (=> d!39015 (contains!869 lt!66273 lt!66274)))

(assert (=> d!39015 (= (addStillContains!88 lt!66273 lt!66277 (zeroValue!2665 newMap!16) lt!66274) lt!66665)))

(declare-fun bs!5343 () Bool)

(assert (= bs!5343 d!39015))

(assert (=> bs!5343 m!149995))

(assert (=> bs!5343 m!149995))

(assert (=> bs!5343 m!149997))

(declare-fun m!150787 () Bool)

(assert (=> bs!5343 m!150787))

(declare-fun m!150789 () Bool)

(assert (=> bs!5343 m!150789))

(assert (=> b!128173 d!39015))

(declare-fun d!39017 () Bool)

(declare-fun e!83976 () Bool)

(assert (=> d!39017 e!83976))

(declare-fun res!62103 () Bool)

(assert (=> d!39017 (=> (not res!62103) (not e!83976))))

(declare-fun lt!66666 () ListLongMap!1639)

(assert (=> d!39017 (= res!62103 (contains!869 lt!66666 (_1!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66668 () List!1682)

(assert (=> d!39017 (= lt!66666 (ListLongMap!1640 lt!66668))))

(declare-fun lt!66667 () Unit!3985)

(declare-fun lt!66669 () Unit!3985)

(assert (=> d!39017 (= lt!66667 lt!66669)))

(assert (=> d!39017 (= (getValueByKey!169 lt!66668 (_1!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39017 (= lt!66669 (lemmaContainsTupThenGetReturnValue!84 lt!66668 (_1!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39017 (= lt!66668 (insertStrictlySorted!87 (toList!835 lt!66273) (_1!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39017 (= (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) lt!66666)))

(declare-fun b!128649 () Bool)

(declare-fun res!62102 () Bool)

(assert (=> b!128649 (=> (not res!62102) (not e!83976))))

(assert (=> b!128649 (= res!62102 (= (getValueByKey!169 (toList!835 lt!66666) (_1!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))))))))

(declare-fun b!128650 () Bool)

(assert (=> b!128650 (= e!83976 (contains!871 (toList!835 lt!66666) (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39017 res!62103) b!128649))

(assert (= (and b!128649 res!62102) b!128650))

(declare-fun m!150791 () Bool)

(assert (=> d!39017 m!150791))

(declare-fun m!150793 () Bool)

(assert (=> d!39017 m!150793))

(declare-fun m!150795 () Bool)

(assert (=> d!39017 m!150795))

(declare-fun m!150797 () Bool)

(assert (=> d!39017 m!150797))

(declare-fun m!150799 () Bool)

(assert (=> b!128649 m!150799))

(declare-fun m!150801 () Bool)

(assert (=> b!128650 m!150801))

(assert (=> b!128173 d!39017))

(declare-fun d!39019 () Bool)

(assert (=> d!39019 (= (apply!112 lt!66290 lt!66285) (get!1466 (getValueByKey!169 (toList!835 lt!66290) lt!66285)))))

(declare-fun bs!5344 () Bool)

(assert (= bs!5344 d!39019))

(declare-fun m!150803 () Bool)

(assert (=> bs!5344 m!150803))

(assert (=> bs!5344 m!150803))

(declare-fun m!150805 () Bool)

(assert (=> bs!5344 m!150805))

(assert (=> b!128173 d!39019))

(declare-fun d!39021 () Bool)

(declare-fun e!83977 () Bool)

(assert (=> d!39021 e!83977))

(declare-fun res!62105 () Bool)

(assert (=> d!39021 (=> (not res!62105) (not e!83977))))

(declare-fun lt!66670 () ListLongMap!1639)

(assert (=> d!39021 (= res!62105 (contains!869 lt!66670 (_1!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))))))

(declare-fun lt!66672 () List!1682)

(assert (=> d!39021 (= lt!66670 (ListLongMap!1640 lt!66672))))

(declare-fun lt!66671 () Unit!3985)

(declare-fun lt!66673 () Unit!3985)

(assert (=> d!39021 (= lt!66671 lt!66673)))

(assert (=> d!39021 (= (getValueByKey!169 lt!66672 (_1!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))))))

(assert (=> d!39021 (= lt!66673 (lemmaContainsTupThenGetReturnValue!84 lt!66672 (_1!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))))))

(assert (=> d!39021 (= lt!66672 (insertStrictlySorted!87 (toList!835 lt!66290) (_1!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))))))

(assert (=> d!39021 (= (+!165 lt!66290 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) lt!66670)))

(declare-fun b!128651 () Bool)

(declare-fun res!62104 () Bool)

(assert (=> b!128651 (=> (not res!62104) (not e!83977))))

(assert (=> b!128651 (= res!62104 (= (getValueByKey!169 (toList!835 lt!66670) (_1!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))))))))

(declare-fun b!128652 () Bool)

(assert (=> b!128652 (= e!83977 (contains!871 (toList!835 lt!66670) (tuple2!2537 lt!66276 (minValue!2665 newMap!16))))))

(assert (= (and d!39021 res!62105) b!128651))

(assert (= (and b!128651 res!62104) b!128652))

(declare-fun m!150807 () Bool)

(assert (=> d!39021 m!150807))

(declare-fun m!150809 () Bool)

(assert (=> d!39021 m!150809))

(declare-fun m!150811 () Bool)

(assert (=> d!39021 m!150811))

(declare-fun m!150813 () Bool)

(assert (=> d!39021 m!150813))

(declare-fun m!150815 () Bool)

(assert (=> b!128651 m!150815))

(declare-fun m!150817 () Bool)

(assert (=> b!128652 m!150817))

(assert (=> b!128173 d!39021))

(declare-fun d!39023 () Bool)

(assert (=> d!39023 (= (apply!112 (+!165 lt!66290 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) lt!66285) (apply!112 lt!66290 lt!66285))))

(declare-fun lt!66674 () Unit!3985)

(assert (=> d!39023 (= lt!66674 (choose!780 lt!66290 lt!66276 (minValue!2665 newMap!16) lt!66285))))

(declare-fun e!83978 () Bool)

(assert (=> d!39023 e!83978))

(declare-fun res!62106 () Bool)

(assert (=> d!39023 (=> (not res!62106) (not e!83978))))

(assert (=> d!39023 (= res!62106 (contains!869 lt!66290 lt!66285))))

(assert (=> d!39023 (= (addApplyDifferent!88 lt!66290 lt!66276 (minValue!2665 newMap!16) lt!66285) lt!66674)))

(declare-fun b!128653 () Bool)

(assert (=> b!128653 (= e!83978 (not (= lt!66285 lt!66276)))))

(assert (= (and d!39023 res!62106) b!128653))

(assert (=> d!39023 m!149993))

(declare-fun m!150819 () Bool)

(assert (=> d!39023 m!150819))

(assert (=> d!39023 m!149977))

(assert (=> d!39023 m!149979))

(declare-fun m!150821 () Bool)

(assert (=> d!39023 m!150821))

(assert (=> d!39023 m!149977))

(assert (=> b!128173 d!39023))

(declare-fun d!39025 () Bool)

(assert (=> d!39025 (= (apply!112 (+!165 lt!66289 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) lt!66272) (apply!112 lt!66289 lt!66272))))

(declare-fun lt!66675 () Unit!3985)

(assert (=> d!39025 (= lt!66675 (choose!780 lt!66289 lt!66283 (minValue!2665 newMap!16) lt!66272))))

(declare-fun e!83979 () Bool)

(assert (=> d!39025 e!83979))

(declare-fun res!62107 () Bool)

(assert (=> d!39025 (=> (not res!62107) (not e!83979))))

(assert (=> d!39025 (= res!62107 (contains!869 lt!66289 lt!66272))))

(assert (=> d!39025 (= (addApplyDifferent!88 lt!66289 lt!66283 (minValue!2665 newMap!16) lt!66272) lt!66675)))

(declare-fun b!128654 () Bool)

(assert (=> b!128654 (= e!83979 (not (= lt!66272 lt!66283)))))

(assert (= (and d!39025 res!62107) b!128654))

(assert (=> d!39025 m!149973))

(declare-fun m!150823 () Bool)

(assert (=> d!39025 m!150823))

(assert (=> d!39025 m!149981))

(assert (=> d!39025 m!149983))

(declare-fun m!150825 () Bool)

(assert (=> d!39025 m!150825))

(assert (=> d!39025 m!149981))

(assert (=> b!128173 d!39025))

(declare-fun d!39027 () Bool)

(assert (=> d!39027 (= (apply!112 (+!165 lt!66290 (tuple2!2537 lt!66276 (minValue!2665 newMap!16))) lt!66285) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66290 (tuple2!2537 lt!66276 (minValue!2665 newMap!16)))) lt!66285)))))

(declare-fun bs!5345 () Bool)

(assert (= bs!5345 d!39027))

(declare-fun m!150827 () Bool)

(assert (=> bs!5345 m!150827))

(assert (=> bs!5345 m!150827))

(declare-fun m!150829 () Bool)

(assert (=> bs!5345 m!150829))

(assert (=> b!128173 d!39027))

(declare-fun d!39029 () Bool)

(declare-fun e!83980 () Bool)

(assert (=> d!39029 e!83980))

(declare-fun res!62109 () Bool)

(assert (=> d!39029 (=> (not res!62109) (not e!83980))))

(declare-fun lt!66676 () ListLongMap!1639)

(assert (=> d!39029 (= res!62109 (contains!869 lt!66676 (_1!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66678 () List!1682)

(assert (=> d!39029 (= lt!66676 (ListLongMap!1640 lt!66678))))

(declare-fun lt!66677 () Unit!3985)

(declare-fun lt!66679 () Unit!3985)

(assert (=> d!39029 (= lt!66677 lt!66679)))

(assert (=> d!39029 (= (getValueByKey!169 lt!66678 (_1!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39029 (= lt!66679 (lemmaContainsTupThenGetReturnValue!84 lt!66678 (_1!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39029 (= lt!66678 (insertStrictlySorted!87 (toList!835 lt!66287) (_1!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39029 (= (+!165 lt!66287 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) lt!66676)))

(declare-fun b!128655 () Bool)

(declare-fun res!62108 () Bool)

(assert (=> b!128655 (=> (not res!62108) (not e!83980))))

(assert (=> b!128655 (= res!62108 (= (getValueByKey!169 (toList!835 lt!66676) (_1!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))))))))

(declare-fun b!128656 () Bool)

(assert (=> b!128656 (= e!83980 (contains!871 (toList!835 lt!66676) (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39029 res!62109) b!128655))

(assert (= (and b!128655 res!62108) b!128656))

(declare-fun m!150831 () Bool)

(assert (=> d!39029 m!150831))

(declare-fun m!150833 () Bool)

(assert (=> d!39029 m!150833))

(declare-fun m!150835 () Bool)

(assert (=> d!39029 m!150835))

(declare-fun m!150837 () Bool)

(assert (=> d!39029 m!150837))

(declare-fun m!150839 () Bool)

(assert (=> b!128655 m!150839))

(declare-fun m!150841 () Bool)

(assert (=> b!128656 m!150841))

(assert (=> b!128173 d!39029))

(declare-fun d!39031 () Bool)

(declare-fun e!83981 () Bool)

(assert (=> d!39031 e!83981))

(declare-fun res!62111 () Bool)

(assert (=> d!39031 (=> (not res!62111) (not e!83981))))

(declare-fun lt!66680 () ListLongMap!1639)

(assert (=> d!39031 (= res!62111 (contains!869 lt!66680 (_1!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))))))

(declare-fun lt!66682 () List!1682)

(assert (=> d!39031 (= lt!66680 (ListLongMap!1640 lt!66682))))

(declare-fun lt!66681 () Unit!3985)

(declare-fun lt!66683 () Unit!3985)

(assert (=> d!39031 (= lt!66681 lt!66683)))

(assert (=> d!39031 (= (getValueByKey!169 lt!66682 (_1!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))))))

(assert (=> d!39031 (= lt!66683 (lemmaContainsTupThenGetReturnValue!84 lt!66682 (_1!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))))))

(assert (=> d!39031 (= lt!66682 (insertStrictlySorted!87 (toList!835 lt!66289) (_1!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))))))

(assert (=> d!39031 (= (+!165 lt!66289 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) lt!66680)))

(declare-fun b!128657 () Bool)

(declare-fun res!62110 () Bool)

(assert (=> b!128657 (=> (not res!62110) (not e!83981))))

(assert (=> b!128657 (= res!62110 (= (getValueByKey!169 (toList!835 lt!66680) (_1!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))))))))

(declare-fun b!128658 () Bool)

(assert (=> b!128658 (= e!83981 (contains!871 (toList!835 lt!66680) (tuple2!2537 lt!66283 (minValue!2665 newMap!16))))))

(assert (= (and d!39031 res!62111) b!128657))

(assert (= (and b!128657 res!62110) b!128658))

(declare-fun m!150843 () Bool)

(assert (=> d!39031 m!150843))

(declare-fun m!150845 () Bool)

(assert (=> d!39031 m!150845))

(declare-fun m!150847 () Bool)

(assert (=> d!39031 m!150847))

(declare-fun m!150849 () Bool)

(assert (=> d!39031 m!150849))

(declare-fun m!150851 () Bool)

(assert (=> b!128657 m!150851))

(declare-fun m!150853 () Bool)

(assert (=> b!128658 m!150853))

(assert (=> b!128173 d!39031))

(declare-fun d!39033 () Bool)

(assert (=> d!39033 (= (apply!112 (+!165 lt!66289 (tuple2!2537 lt!66283 (minValue!2665 newMap!16))) lt!66272) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66289 (tuple2!2537 lt!66283 (minValue!2665 newMap!16)))) lt!66272)))))

(declare-fun bs!5346 () Bool)

(assert (= bs!5346 d!39033))

(declare-fun m!150855 () Bool)

(assert (=> bs!5346 m!150855))

(assert (=> bs!5346 m!150855))

(declare-fun m!150857 () Bool)

(assert (=> bs!5346 m!150857))

(assert (=> b!128173 d!39033))

(declare-fun b!128659 () Bool)

(declare-fun res!62113 () Bool)

(declare-fun e!83987 () Bool)

(assert (=> b!128659 (=> (not res!62113) (not e!83987))))

(declare-fun lt!66689 () ListLongMap!1639)

(assert (=> b!128659 (= res!62113 (not (contains!869 lt!66689 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128660 () Bool)

(assert (=> b!128660 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> b!128660 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (_values!2787 newMap!16))))))

(declare-fun e!83982 () Bool)

(assert (=> b!128660 (= e!83982 (= (apply!112 lt!66689 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128661 () Bool)

(declare-fun e!83986 () ListLongMap!1639)

(declare-fun e!83984 () ListLongMap!1639)

(assert (=> b!128661 (= e!83986 e!83984)))

(declare-fun c!23628 () Bool)

(assert (=> b!128661 (= c!23628 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128662 () Bool)

(declare-fun lt!66686 () Unit!3985)

(declare-fun lt!66685 () Unit!3985)

(assert (=> b!128662 (= lt!66686 lt!66685)))

(declare-fun lt!66684 () (_ BitVec 64))

(declare-fun lt!66690 () ListLongMap!1639)

(declare-fun lt!66688 () V!3449)

(declare-fun lt!66687 () (_ BitVec 64))

(assert (=> b!128662 (not (contains!869 (+!165 lt!66690 (tuple2!2537 lt!66687 lt!66688)) lt!66684))))

(assert (=> b!128662 (= lt!66685 (addStillNotContains!59 lt!66690 lt!66687 lt!66688 lt!66684))))

(assert (=> b!128662 (= lt!66684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128662 (= lt!66688 (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128662 (= lt!66687 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13910 () ListLongMap!1639)

(assert (=> b!128662 (= lt!66690 call!13910)))

(assert (=> b!128662 (= e!83984 (+!165 call!13910 (tuple2!2537 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128663 () Bool)

(declare-fun e!83985 () Bool)

(assert (=> b!128663 (= e!83985 (= lt!66689 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!128664 () Bool)

(assert (=> b!128664 (= e!83986 (ListLongMap!1640 Nil!1679))))

(declare-fun b!128665 () Bool)

(declare-fun e!83988 () Bool)

(assert (=> b!128665 (= e!83987 e!83988)))

(declare-fun c!23625 () Bool)

(declare-fun e!83983 () Bool)

(assert (=> b!128665 (= c!23625 e!83983)))

(declare-fun res!62115 () Bool)

(assert (=> b!128665 (=> (not res!62115) (not e!83983))))

(assert (=> b!128665 (= res!62115 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128666 () Bool)

(assert (=> b!128666 (= e!83984 call!13910)))

(declare-fun b!128667 () Bool)

(assert (=> b!128667 (= e!83988 e!83985)))

(declare-fun c!23627 () Bool)

(assert (=> b!128667 (= c!23627 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128668 () Bool)

(assert (=> b!128668 (= e!83988 e!83982)))

(assert (=> b!128668 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62112 () Bool)

(assert (=> b!128668 (= res!62112 (contains!869 lt!66689 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128668 (=> (not res!62112) (not e!83982))))

(declare-fun b!128669 () Bool)

(assert (=> b!128669 (= e!83983 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128669 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!128670 () Bool)

(assert (=> b!128670 (= e!83985 (isEmpty!405 lt!66689))))

(declare-fun d!39035 () Bool)

(assert (=> d!39035 e!83987))

(declare-fun res!62114 () Bool)

(assert (=> d!39035 (=> (not res!62114) (not e!83987))))

(assert (=> d!39035 (= res!62114 (not (contains!869 lt!66689 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39035 (= lt!66689 e!83986)))

(declare-fun c!23626 () Bool)

(assert (=> d!39035 (= c!23626 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39035 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39035 (= (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66689)))

(declare-fun bm!13907 () Bool)

(assert (=> bm!13907 (= call!13910 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(assert (= (and d!39035 c!23626) b!128664))

(assert (= (and d!39035 (not c!23626)) b!128661))

(assert (= (and b!128661 c!23628) b!128662))

(assert (= (and b!128661 (not c!23628)) b!128666))

(assert (= (or b!128662 b!128666) bm!13907))

(assert (= (and d!39035 res!62114) b!128659))

(assert (= (and b!128659 res!62113) b!128665))

(assert (= (and b!128665 res!62115) b!128669))

(assert (= (and b!128665 c!23625) b!128668))

(assert (= (and b!128665 (not c!23625)) b!128667))

(assert (= (and b!128668 res!62112) b!128660))

(assert (= (and b!128667 c!23627) b!128663))

(assert (= (and b!128667 (not c!23627)) b!128670))

(declare-fun b_lambda!5699 () Bool)

(assert (=> (not b_lambda!5699) (not b!128660)))

(assert (=> b!128660 t!6065))

(declare-fun b_and!7949 () Bool)

(assert (= b_and!7945 (and (=> t!6065 result!3889) b_and!7949)))

(assert (=> b!128660 t!6067))

(declare-fun b_and!7951 () Bool)

(assert (= b_and!7947 (and (=> t!6067 result!3891) b_and!7951)))

(declare-fun b_lambda!5701 () Bool)

(assert (=> (not b_lambda!5701) (not b!128662)))

(assert (=> b!128662 t!6065))

(declare-fun b_and!7953 () Bool)

(assert (= b_and!7949 (and (=> t!6065 result!3889) b_and!7953)))

(assert (=> b!128662 t!6067))

(declare-fun b_and!7955 () Bool)

(assert (= b_and!7951 (and (=> t!6067 result!3891) b_and!7955)))

(declare-fun m!150859 () Bool)

(assert (=> d!39035 m!150859))

(assert (=> d!39035 m!149963))

(assert (=> b!128662 m!150011))

(assert (=> b!128662 m!149959))

(declare-fun m!150861 () Bool)

(assert (=> b!128662 m!150861))

(declare-fun m!150863 () Bool)

(assert (=> b!128662 m!150863))

(assert (=> b!128662 m!150009))

(declare-fun m!150865 () Bool)

(assert (=> b!128662 m!150865))

(declare-fun m!150867 () Bool)

(assert (=> b!128662 m!150867))

(assert (=> b!128662 m!150861))

(assert (=> b!128662 m!150009))

(assert (=> b!128662 m!150011))

(assert (=> b!128662 m!150013))

(assert (=> b!128668 m!149959))

(assert (=> b!128668 m!149959))

(declare-fun m!150869 () Bool)

(assert (=> b!128668 m!150869))

(declare-fun m!150871 () Bool)

(assert (=> bm!13907 m!150871))

(declare-fun m!150873 () Bool)

(assert (=> b!128659 m!150873))

(assert (=> b!128661 m!149959))

(assert (=> b!128661 m!149959))

(assert (=> b!128661 m!149965))

(assert (=> b!128663 m!150871))

(declare-fun m!150875 () Bool)

(assert (=> b!128670 m!150875))

(assert (=> b!128669 m!149959))

(assert (=> b!128669 m!149959))

(assert (=> b!128669 m!149965))

(assert (=> b!128660 m!150011))

(assert (=> b!128660 m!149959))

(assert (=> b!128660 m!150009))

(assert (=> b!128660 m!149959))

(declare-fun m!150877 () Bool)

(assert (=> b!128660 m!150877))

(assert (=> b!128660 m!150009))

(assert (=> b!128660 m!150011))

(assert (=> b!128660 m!150013))

(assert (=> b!128173 d!39035))

(declare-fun d!39037 () Bool)

(declare-fun e!83990 () Bool)

(assert (=> d!39037 e!83990))

(declare-fun res!62116 () Bool)

(assert (=> d!39037 (=> res!62116 e!83990)))

(declare-fun lt!66691 () Bool)

(assert (=> d!39037 (= res!62116 (not lt!66691))))

(declare-fun lt!66694 () Bool)

(assert (=> d!39037 (= lt!66691 lt!66694)))

(declare-fun lt!66692 () Unit!3985)

(declare-fun e!83989 () Unit!3985)

(assert (=> d!39037 (= lt!66692 e!83989)))

(declare-fun c!23629 () Bool)

(assert (=> d!39037 (= c!23629 lt!66694)))

(assert (=> d!39037 (= lt!66694 (containsKey!172 (toList!835 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) lt!66274))))

(assert (=> d!39037 (= (contains!869 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16))) lt!66274) lt!66691)))

(declare-fun b!128671 () Bool)

(declare-fun lt!66693 () Unit!3985)

(assert (=> b!128671 (= e!83989 lt!66693)))

(assert (=> b!128671 (= lt!66693 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) lt!66274))))

(assert (=> b!128671 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) lt!66274))))

(declare-fun b!128672 () Bool)

(declare-fun Unit!4011 () Unit!3985)

(assert (=> b!128672 (= e!83989 Unit!4011)))

(declare-fun b!128673 () Bool)

(assert (=> b!128673 (= e!83990 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66273 (tuple2!2537 lt!66277 (zeroValue!2665 newMap!16)))) lt!66274)))))

(assert (= (and d!39037 c!23629) b!128671))

(assert (= (and d!39037 (not c!23629)) b!128672))

(assert (= (and d!39037 (not res!62116)) b!128673))

(declare-fun m!150879 () Bool)

(assert (=> d!39037 m!150879))

(declare-fun m!150881 () Bool)

(assert (=> b!128671 m!150881))

(declare-fun m!150883 () Bool)

(assert (=> b!128671 m!150883))

(assert (=> b!128671 m!150883))

(declare-fun m!150885 () Bool)

(assert (=> b!128671 m!150885))

(assert (=> b!128673 m!150883))

(assert (=> b!128673 m!150883))

(assert (=> b!128673 m!150885))

(assert (=> b!128173 d!39037))

(declare-fun d!39039 () Bool)

(assert (=> d!39039 (= (apply!112 (+!165 lt!66287 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) lt!66279) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66287 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16)))) lt!66279)))))

(declare-fun bs!5347 () Bool)

(assert (= bs!5347 d!39039))

(declare-fun m!150887 () Bool)

(assert (=> bs!5347 m!150887))

(assert (=> bs!5347 m!150887))

(declare-fun m!150889 () Bool)

(assert (=> bs!5347 m!150889))

(assert (=> b!128173 d!39039))

(declare-fun d!39041 () Bool)

(assert (=> d!39041 (= (apply!112 lt!66289 lt!66272) (get!1466 (getValueByKey!169 (toList!835 lt!66289) lt!66272)))))

(declare-fun bs!5348 () Bool)

(assert (= bs!5348 d!39041))

(declare-fun m!150891 () Bool)

(assert (=> bs!5348 m!150891))

(assert (=> bs!5348 m!150891))

(declare-fun m!150893 () Bool)

(assert (=> bs!5348 m!150893))

(assert (=> b!128173 d!39041))

(declare-fun d!39043 () Bool)

(assert (=> d!39043 (= (apply!112 (+!165 lt!66287 (tuple2!2537 lt!66288 (zeroValue!2665 newMap!16))) lt!66279) (apply!112 lt!66287 lt!66279))))

(declare-fun lt!66695 () Unit!3985)

(assert (=> d!39043 (= lt!66695 (choose!780 lt!66287 lt!66288 (zeroValue!2665 newMap!16) lt!66279))))

(declare-fun e!83991 () Bool)

(assert (=> d!39043 e!83991))

(declare-fun res!62117 () Bool)

(assert (=> d!39043 (=> (not res!62117) (not e!83991))))

(assert (=> d!39043 (= res!62117 (contains!869 lt!66287 lt!66279))))

(assert (=> d!39043 (= (addApplyDifferent!88 lt!66287 lt!66288 (zeroValue!2665 newMap!16) lt!66279) lt!66695)))

(declare-fun b!128674 () Bool)

(assert (=> b!128674 (= e!83991 (not (= lt!66279 lt!66288)))))

(assert (= (and d!39043 res!62117) b!128674))

(assert (=> d!39043 m!149985))

(declare-fun m!150895 () Bool)

(assert (=> d!39043 m!150895))

(assert (=> d!39043 m!149987))

(assert (=> d!39043 m!149999))

(declare-fun m!150897 () Bool)

(assert (=> d!39043 m!150897))

(assert (=> d!39043 m!149987))

(assert (=> b!128173 d!39043))

(declare-fun b!128675 () Bool)

(declare-fun e!83994 () Bool)

(declare-fun e!83992 () Bool)

(assert (=> b!128675 (= e!83994 e!83992)))

(declare-fun c!23630 () Bool)

(assert (=> b!128675 (= c!23630 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun bm!13908 () Bool)

(declare-fun call!13911 () Bool)

(assert (=> bm!13908 (= call!13911 (arrayNoDuplicates!0 (_keys!4541 (_2!1280 lt!66196)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23630 (Cons!1680 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000) Nil!1681) Nil!1681)))))

(declare-fun b!128676 () Bool)

(declare-fun e!83993 () Bool)

(assert (=> b!128676 (= e!83993 (contains!872 Nil!1681 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun d!39045 () Bool)

(declare-fun res!62119 () Bool)

(declare-fun e!83995 () Bool)

(assert (=> d!39045 (=> res!62119 e!83995)))

(assert (=> d!39045 (= res!62119 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(assert (=> d!39045 (= (arrayNoDuplicates!0 (_keys!4541 (_2!1280 lt!66196)) #b00000000000000000000000000000000 Nil!1681) e!83995)))

(declare-fun b!128677 () Bool)

(assert (=> b!128677 (= e!83992 call!13911)))

(declare-fun b!128678 () Bool)

(assert (=> b!128678 (= e!83995 e!83994)))

(declare-fun res!62118 () Bool)

(assert (=> b!128678 (=> (not res!62118) (not e!83994))))

(assert (=> b!128678 (= res!62118 (not e!83993))))

(declare-fun res!62120 () Bool)

(assert (=> b!128678 (=> (not res!62120) (not e!83993))))

(assert (=> b!128678 (= res!62120 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun b!128679 () Bool)

(assert (=> b!128679 (= e!83992 call!13911)))

(assert (= (and d!39045 (not res!62119)) b!128678))

(assert (= (and b!128678 res!62120) b!128676))

(assert (= (and b!128678 res!62118) b!128675))

(assert (= (and b!128675 c!23630) b!128679))

(assert (= (and b!128675 (not c!23630)) b!128677))

(assert (= (or b!128679 b!128677) bm!13908))

(declare-fun m!150899 () Bool)

(assert (=> b!128675 m!150899))

(assert (=> b!128675 m!150899))

(declare-fun m!150901 () Bool)

(assert (=> b!128675 m!150901))

(assert (=> bm!13908 m!150899))

(declare-fun m!150903 () Bool)

(assert (=> bm!13908 m!150903))

(assert (=> b!128676 m!150899))

(assert (=> b!128676 m!150899))

(declare-fun m!150905 () Bool)

(assert (=> b!128676 m!150905))

(assert (=> b!128678 m!150899))

(assert (=> b!128678 m!150899))

(assert (=> b!128678 m!150901))

(assert (=> b!128296 d!39045))

(declare-fun b!128680 () Bool)

(declare-fun res!62122 () Bool)

(declare-fun e!84001 () Bool)

(assert (=> b!128680 (=> (not res!62122) (not e!84001))))

(declare-fun lt!66701 () ListLongMap!1639)

(assert (=> b!128680 (= res!62122 (not (contains!869 lt!66701 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128681 () Bool)

(assert (=> b!128681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> b!128681 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!83996 () Bool)

(assert (=> b!128681 (= e!83996 (= (apply!112 lt!66701 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128682 () Bool)

(declare-fun e!84000 () ListLongMap!1639)

(declare-fun e!83998 () ListLongMap!1639)

(assert (=> b!128682 (= e!84000 e!83998)))

(declare-fun c!23634 () Bool)

(assert (=> b!128682 (= c!23634 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(declare-fun b!128683 () Bool)

(declare-fun lt!66698 () Unit!3985)

(declare-fun lt!66697 () Unit!3985)

(assert (=> b!128683 (= lt!66698 lt!66697)))

(declare-fun lt!66699 () (_ BitVec 64))

(declare-fun lt!66696 () (_ BitVec 64))

(declare-fun lt!66702 () ListLongMap!1639)

(declare-fun lt!66700 () V!3449)

(assert (=> b!128683 (not (contains!869 (+!165 lt!66702 (tuple2!2537 lt!66699 lt!66700)) lt!66696))))

(assert (=> b!128683 (= lt!66697 (addStillNotContains!59 lt!66702 lt!66699 lt!66700 lt!66696))))

(assert (=> b!128683 (= lt!66696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!128683 (= lt!66700 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128683 (= lt!66699 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(declare-fun call!13912 () ListLongMap!1639)

(assert (=> b!128683 (= lt!66702 call!13912)))

(assert (=> b!128683 (= e!83998 (+!165 call!13912 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!128684 () Bool)

(declare-fun e!83999 () Bool)

(assert (=> b!128684 (= e!83999 (= lt!66701 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128685 () Bool)

(assert (=> b!128685 (= e!84000 (ListLongMap!1640 Nil!1679))))

(declare-fun b!128686 () Bool)

(declare-fun e!84002 () Bool)

(assert (=> b!128686 (= e!84001 e!84002)))

(declare-fun c!23631 () Bool)

(declare-fun e!83997 () Bool)

(assert (=> b!128686 (= c!23631 e!83997)))

(declare-fun res!62124 () Bool)

(assert (=> b!128686 (=> (not res!62124) (not e!83997))))

(assert (=> b!128686 (= res!62124 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128687 () Bool)

(assert (=> b!128687 (= e!83998 call!13912)))

(declare-fun b!128688 () Bool)

(assert (=> b!128688 (= e!84002 e!83999)))

(declare-fun c!23633 () Bool)

(assert (=> b!128688 (= c!23633 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128689 () Bool)

(assert (=> b!128689 (= e!84002 e!83996)))

(assert (=> b!128689 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun res!62121 () Bool)

(assert (=> b!128689 (= res!62121 (contains!869 lt!66701 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128689 (=> (not res!62121) (not e!83996))))

(declare-fun b!128690 () Bool)

(assert (=> b!128690 (= e!83997 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001))))))

(assert (=> b!128690 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!128691 () Bool)

(assert (=> b!128691 (= e!83999 (isEmpty!405 lt!66701))))

(declare-fun d!39047 () Bool)

(assert (=> d!39047 e!84001))

(declare-fun res!62123 () Bool)

(assert (=> d!39047 (=> (not res!62123) (not e!84001))))

(assert (=> d!39047 (= res!62123 (not (contains!869 lt!66701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39047 (= lt!66701 e!84000)))

(declare-fun c!23632 () Bool)

(assert (=> d!39047 (= c!23632 (bvsge (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!39047 (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992))))))

(assert (=> d!39047 (= (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))) lt!66701)))

(declare-fun bm!13909 () Bool)

(assert (=> bm!13909 (= call!13912 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (_values!2787 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992))) (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) (minValue!2665 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992)))))))

(assert (= (and d!39047 c!23632) b!128685))

(assert (= (and d!39047 (not c!23632)) b!128682))

(assert (= (and b!128682 c!23634) b!128683))

(assert (= (and b!128682 (not c!23634)) b!128687))

(assert (= (or b!128683 b!128687) bm!13909))

(assert (= (and d!39047 res!62123) b!128680))

(assert (= (and b!128680 res!62122) b!128686))

(assert (= (and b!128686 res!62124) b!128690))

(assert (= (and b!128686 c!23631) b!128689))

(assert (= (and b!128686 (not c!23631)) b!128688))

(assert (= (and b!128689 res!62121) b!128681))

(assert (= (and b!128688 c!23633) b!128684))

(assert (= (and b!128688 (not c!23633)) b!128691))

(declare-fun b_lambda!5703 () Bool)

(assert (=> (not b_lambda!5703) (not b!128681)))

(assert (=> b!128681 t!6050))

(declare-fun b_and!7957 () Bool)

(assert (= b_and!7953 (and (=> t!6050 result!3869) b_and!7957)))

(assert (=> b!128681 t!6052))

(declare-fun b_and!7959 () Bool)

(assert (= b_and!7955 (and (=> t!6052 result!3873) b_and!7959)))

(declare-fun b_lambda!5705 () Bool)

(assert (=> (not b_lambda!5705) (not b!128683)))

(assert (=> b!128683 t!6050))

(declare-fun b_and!7961 () Bool)

(assert (= b_and!7957 (and (=> t!6050 result!3869) b_and!7961)))

(assert (=> b!128683 t!6052))

(declare-fun b_and!7963 () Bool)

(assert (= b_and!7959 (and (=> t!6052 result!3873) b_and!7963)))

(declare-fun m!150907 () Bool)

(assert (=> d!39047 m!150907))

(assert (=> d!39047 m!149737))

(assert (=> b!128683 m!149717))

(declare-fun m!150909 () Bool)

(assert (=> b!128683 m!150909))

(declare-fun m!150911 () Bool)

(assert (=> b!128683 m!150911))

(declare-fun m!150913 () Bool)

(assert (=> b!128683 m!150913))

(declare-fun m!150915 () Bool)

(assert (=> b!128683 m!150915))

(declare-fun m!150917 () Bool)

(assert (=> b!128683 m!150917))

(declare-fun m!150919 () Bool)

(assert (=> b!128683 m!150919))

(assert (=> b!128683 m!150911))

(assert (=> b!128683 m!150915))

(assert (=> b!128683 m!149717))

(declare-fun m!150921 () Bool)

(assert (=> b!128683 m!150921))

(assert (=> b!128689 m!150909))

(assert (=> b!128689 m!150909))

(declare-fun m!150923 () Bool)

(assert (=> b!128689 m!150923))

(declare-fun m!150925 () Bool)

(assert (=> bm!13909 m!150925))

(declare-fun m!150927 () Bool)

(assert (=> b!128680 m!150927))

(assert (=> b!128682 m!150909))

(assert (=> b!128682 m!150909))

(declare-fun m!150929 () Bool)

(assert (=> b!128682 m!150929))

(assert (=> b!128684 m!150925))

(declare-fun m!150931 () Bool)

(assert (=> b!128691 m!150931))

(assert (=> b!128690 m!150909))

(assert (=> b!128690 m!150909))

(assert (=> b!128690 m!150929))

(assert (=> b!128681 m!149717))

(assert (=> b!128681 m!150909))

(assert (=> b!128681 m!150915))

(assert (=> b!128681 m!150909))

(declare-fun m!150933 () Bool)

(assert (=> b!128681 m!150933))

(assert (=> b!128681 m!150915))

(assert (=> b!128681 m!149717))

(assert (=> b!128681 m!150921))

(assert (=> b!128224 d!39047))

(declare-fun d!39049 () Bool)

(assert (=> d!39049 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39049 true))

(declare-fun _$5!128 () Unit!3985)

(assert (=> d!39049 (= (choose!787 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (index!3217 lt!66202) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) _$5!128)))

(declare-fun bs!5349 () Bool)

(assert (= bs!5349 d!39049))

(assert (=> bs!5349 m!149859))

(assert (=> bs!5349 m!149859))

(assert (=> bs!5349 m!150135))

(assert (=> bs!5349 m!149839))

(assert (=> bs!5349 m!150385))

(assert (=> d!38899 d!39049))

(assert (=> d!38899 d!38921))

(declare-fun d!39051 () Bool)

(assert (=> d!39051 (= (isDefined!121 (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) (not (isEmpty!406 (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun bs!5350 () Bool)

(assert (= bs!5350 d!39051))

(assert (=> bs!5350 m!150399))

(declare-fun m!150935 () Bool)

(assert (=> bs!5350 m!150935))

(assert (=> b!128443 d!39051))

(declare-fun b!128695 () Bool)

(declare-fun e!84004 () Option!175)

(assert (=> b!128695 (= e!84004 None!173)))

(declare-fun b!128694 () Bool)

(assert (=> b!128694 (= e!84004 (getValueByKey!169 (t!6053 (toList!835 call!13817)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun c!23635 () Bool)

(declare-fun d!39053 () Bool)

(assert (=> d!39053 (= c!23635 (and ((_ is Cons!1678) (toList!835 call!13817)) (= (_1!1279 (h!2281 (toList!835 call!13817))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun e!84003 () Option!175)

(assert (=> d!39053 (= (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84003)))

(declare-fun b!128693 () Bool)

(assert (=> b!128693 (= e!84003 e!84004)))

(declare-fun c!23636 () Bool)

(assert (=> b!128693 (= c!23636 (and ((_ is Cons!1678) (toList!835 call!13817)) (not (= (_1!1279 (h!2281 (toList!835 call!13817))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun b!128692 () Bool)

(assert (=> b!128692 (= e!84003 (Some!174 (_2!1279 (h!2281 (toList!835 call!13817)))))))

(assert (= (and d!39053 c!23635) b!128692))

(assert (= (and d!39053 (not c!23635)) b!128693))

(assert (= (and b!128693 c!23636) b!128694))

(assert (= (and b!128693 (not c!23636)) b!128695))

(assert (=> b!128694 m!149721))

(declare-fun m!150937 () Bool)

(assert (=> b!128694 m!150937))

(assert (=> b!128443 d!39053))

(declare-fun d!39055 () Bool)

(assert (=> d!39055 (= (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) (not (isEmpty!406 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun bs!5351 () Bool)

(assert (= bs!5351 d!39055))

(assert (=> bs!5351 m!150391))

(declare-fun m!150939 () Bool)

(assert (=> bs!5351 m!150939))

(assert (=> b!128440 d!39055))

(declare-fun b!128699 () Bool)

(declare-fun e!84006 () Option!175)

(assert (=> b!128699 (= e!84006 None!173)))

(declare-fun b!128698 () Bool)

(assert (=> b!128698 (= e!84006 (getValueByKey!169 (t!6053 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun d!39057 () Bool)

(declare-fun c!23637 () Bool)

(assert (=> d!39057 (= c!23637 (and ((_ is Cons!1678) (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (= (_1!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun e!84005 () Option!175)

(assert (=> d!39057 (= (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84005)))

(declare-fun b!128697 () Bool)

(assert (=> b!128697 (= e!84005 e!84006)))

(declare-fun c!23638 () Bool)

(assert (=> b!128697 (= c!23638 (and ((_ is Cons!1678) (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (not (= (_1!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun b!128696 () Bool)

(assert (=> b!128696 (= e!84005 (Some!174 (_2!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))))))

(assert (= (and d!39057 c!23637) b!128696))

(assert (= (and d!39057 (not c!23637)) b!128697))

(assert (= (and b!128697 c!23638) b!128698))

(assert (= (and b!128697 (not c!23638)) b!128699))

(assert (=> b!128698 m!149721))

(declare-fun m!150941 () Bool)

(assert (=> b!128698 m!150941))

(assert (=> b!128440 d!39057))

(declare-fun d!39059 () Bool)

(assert (=> d!39059 (= (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (and (not (= (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128410 d!39059))

(assert (=> d!38859 d!38921))

(assert (=> bm!13857 d!38807))

(declare-fun d!39061 () Bool)

(assert (=> d!39061 (= (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!406 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!5352 () Bool)

(assert (= bs!5352 d!39061))

(assert (=> bs!5352 m!150247))

(declare-fun m!150943 () Bool)

(assert (=> bs!5352 m!150943))

(assert (=> b!128336 d!39061))

(declare-fun b!128703 () Bool)

(declare-fun e!84008 () Option!175)

(assert (=> b!128703 (= e!84008 None!173)))

(declare-fun b!128702 () Bool)

(assert (=> b!128702 (= e!84008 (getValueByKey!169 (t!6053 (toList!835 lt!66270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!39063 () Bool)

(declare-fun c!23639 () Bool)

(assert (=> d!39063 (= c!23639 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!84007 () Option!175)

(assert (=> d!39063 (= (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000) e!84007)))

(declare-fun b!128701 () Bool)

(assert (=> b!128701 (= e!84007 e!84008)))

(declare-fun c!23640 () Bool)

(assert (=> b!128701 (= c!23640 (and ((_ is Cons!1678) (toList!835 lt!66270)) (not (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128700 () Bool)

(assert (=> b!128700 (= e!84007 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66270)))))))

(assert (= (and d!39063 c!23639) b!128700))

(assert (= (and d!39063 (not c!23639)) b!128701))

(assert (= (and b!128701 c!23640) b!128702))

(assert (= (and b!128701 (not c!23640)) b!128703))

(declare-fun m!150945 () Bool)

(assert (=> b!128702 m!150945))

(assert (=> b!128336 d!39063))

(assert (=> d!38875 d!38877))

(assert (=> d!38875 d!38879))

(declare-fun d!39065 () Bool)

(assert (=> d!39065 (isDefined!121 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!39065 true))

(declare-fun _$12!393 () Unit!3985)

(assert (=> d!39065 (= (choose!784 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) _$12!393)))

(declare-fun bs!5353 () Bool)

(assert (= bs!5353 d!39065))

(assert (=> bs!5353 m!149721))

(assert (=> bs!5353 m!149821))

(assert (=> bs!5353 m!149821))

(assert (=> bs!5353 m!149823))

(assert (=> d!38875 d!39065))

(declare-fun d!39067 () Bool)

(declare-fun res!62129 () Bool)

(declare-fun e!84013 () Bool)

(assert (=> d!39067 (=> res!62129 e!84013)))

(assert (=> d!39067 (= res!62129 (or ((_ is Nil!1679) (toList!835 lt!66092)) ((_ is Nil!1679) (t!6053 (toList!835 lt!66092)))))))

(assert (=> d!39067 (= (isStrictlySorted!305 (toList!835 lt!66092)) e!84013)))

(declare-fun b!128708 () Bool)

(declare-fun e!84014 () Bool)

(assert (=> b!128708 (= e!84013 e!84014)))

(declare-fun res!62130 () Bool)

(assert (=> b!128708 (=> (not res!62130) (not e!84014))))

(assert (=> b!128708 (= res!62130 (bvslt (_1!1279 (h!2281 (toList!835 lt!66092))) (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092))))))))

(declare-fun b!128709 () Bool)

(assert (=> b!128709 (= e!84014 (isStrictlySorted!305 (t!6053 (toList!835 lt!66092))))))

(assert (= (and d!39067 (not res!62129)) b!128708))

(assert (= (and b!128708 res!62130) b!128709))

(declare-fun m!150947 () Bool)

(assert (=> b!128709 m!150947))

(assert (=> d!38875 d!39067))

(declare-fun d!39069 () Bool)

(assert (=> d!39069 (= (size!2499 newMap!16) (bvadd (_size!585 newMap!16) (bvsdiv (bvadd (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!128314 d!39069))

(assert (=> d!38803 d!38921))

(declare-fun d!39071 () Bool)

(declare-fun e!84016 () Bool)

(assert (=> d!39071 e!84016))

(declare-fun res!62131 () Bool)

(assert (=> d!39071 (=> res!62131 e!84016)))

(declare-fun lt!66703 () Bool)

(assert (=> d!39071 (= res!62131 (not lt!66703))))

(declare-fun lt!66706 () Bool)

(assert (=> d!39071 (= lt!66703 lt!66706)))

(declare-fun lt!66704 () Unit!3985)

(declare-fun e!84015 () Unit!3985)

(assert (=> d!39071 (= lt!66704 e!84015)))

(declare-fun c!23641 () Bool)

(assert (=> d!39071 (= c!23641 lt!66706)))

(assert (=> d!39071 (= lt!66706 (containsKey!172 (toList!835 lt!66265) lt!66257))))

(assert (=> d!39071 (= (contains!869 lt!66265 lt!66257) lt!66703)))

(declare-fun b!128710 () Bool)

(declare-fun lt!66705 () Unit!3985)

(assert (=> b!128710 (= e!84015 lt!66705)))

(assert (=> b!128710 (= lt!66705 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66265) lt!66257))))

(assert (=> b!128710 (isDefined!121 (getValueByKey!169 (toList!835 lt!66265) lt!66257))))

(declare-fun b!128711 () Bool)

(declare-fun Unit!4012 () Unit!3985)

(assert (=> b!128711 (= e!84015 Unit!4012)))

(declare-fun b!128712 () Bool)

(assert (=> b!128712 (= e!84016 (isDefined!121 (getValueByKey!169 (toList!835 lt!66265) lt!66257)))))

(assert (= (and d!39071 c!23641) b!128710))

(assert (= (and d!39071 (not c!23641)) b!128711))

(assert (= (and d!39071 (not res!62131)) b!128712))

(declare-fun m!150949 () Bool)

(assert (=> d!39071 m!150949))

(declare-fun m!150951 () Bool)

(assert (=> b!128710 m!150951))

(assert (=> b!128710 m!150089))

(assert (=> b!128710 m!150089))

(declare-fun m!150953 () Bool)

(assert (=> b!128710 m!150953))

(assert (=> b!128712 m!150089))

(assert (=> b!128712 m!150089))

(assert (=> b!128712 m!150953))

(assert (=> d!38815 d!39071))

(assert (=> d!38815 d!38821))

(assert (=> d!38815 d!38839))

(assert (=> d!38815 d!38829))

(declare-fun d!39073 () Bool)

(assert (=> d!39073 (= (apply!112 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66257) (apply!112 lt!66265 lt!66257))))

(assert (=> d!39073 true))

(declare-fun _$34!959 () Unit!3985)

(assert (=> d!39073 (= (choose!780 lt!66265 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66257) _$34!959)))

(declare-fun bs!5354 () Bool)

(assert (= bs!5354 d!39073))

(assert (=> bs!5354 m!149925))

(assert (=> bs!5354 m!149925))

(assert (=> bs!5354 m!149937))

(assert (=> bs!5354 m!149923))

(assert (=> d!38815 d!39073))

(declare-fun d!39075 () Bool)

(declare-fun e!84018 () Bool)

(assert (=> d!39075 e!84018))

(declare-fun res!62132 () Bool)

(assert (=> d!39075 (=> res!62132 e!84018)))

(declare-fun lt!66707 () Bool)

(assert (=> d!39075 (= res!62132 (not lt!66707))))

(declare-fun lt!66710 () Bool)

(assert (=> d!39075 (= lt!66707 lt!66710)))

(declare-fun lt!66708 () Unit!3985)

(declare-fun e!84017 () Unit!3985)

(assert (=> d!39075 (= lt!66708 e!84017)))

(declare-fun c!23642 () Bool)

(assert (=> d!39075 (= c!23642 lt!66710)))

(assert (=> d!39075 (= lt!66710 (containsKey!172 (toList!835 (map!1386 (_2!1280 lt!66414))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!39075 (= (contains!869 (map!1386 (_2!1280 lt!66414)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66707)))

(declare-fun b!128713 () Bool)

(declare-fun lt!66709 () Unit!3985)

(assert (=> b!128713 (= e!84017 lt!66709)))

(assert (=> b!128713 (= lt!66709 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (map!1386 (_2!1280 lt!66414))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128713 (isDefined!121 (getValueByKey!169 (toList!835 (map!1386 (_2!1280 lt!66414))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128714 () Bool)

(declare-fun Unit!4013 () Unit!3985)

(assert (=> b!128714 (= e!84017 Unit!4013)))

(declare-fun b!128715 () Bool)

(assert (=> b!128715 (= e!84018 (isDefined!121 (getValueByKey!169 (toList!835 (map!1386 (_2!1280 lt!66414))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (= (and d!39075 c!23642) b!128713))

(assert (= (and d!39075 (not c!23642)) b!128714))

(assert (= (and d!39075 (not res!62132)) b!128715))

(assert (=> d!39075 m!149721))

(declare-fun m!150955 () Bool)

(assert (=> d!39075 m!150955))

(assert (=> b!128713 m!149721))

(declare-fun m!150957 () Bool)

(assert (=> b!128713 m!150957))

(assert (=> b!128713 m!149721))

(declare-fun m!150959 () Bool)

(assert (=> b!128713 m!150959))

(assert (=> b!128713 m!150959))

(declare-fun m!150961 () Bool)

(assert (=> b!128713 m!150961))

(assert (=> b!128715 m!149721))

(assert (=> b!128715 m!150959))

(assert (=> b!128715 m!150959))

(assert (=> b!128715 m!150961))

(assert (=> b!128281 d!39075))

(declare-fun d!39077 () Bool)

(assert (=> d!39077 (= (map!1386 (_2!1280 lt!66414)) (getCurrentListMap!514 (_keys!4541 (_2!1280 lt!66414)) (_values!2787 (_2!1280 lt!66414)) (mask!7072 (_2!1280 lt!66414)) (extraKeys!2581 (_2!1280 lt!66414)) (zeroValue!2665 (_2!1280 lt!66414)) (minValue!2665 (_2!1280 lt!66414)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66414))))))

(declare-fun bs!5355 () Bool)

(assert (= bs!5355 d!39077))

(declare-fun m!150963 () Bool)

(assert (=> bs!5355 m!150963))

(assert (=> b!128281 d!39077))

(declare-fun d!39079 () Bool)

(declare-fun e!84020 () Bool)

(assert (=> d!39079 e!84020))

(declare-fun res!62133 () Bool)

(assert (=> d!39079 (=> res!62133 e!84020)))

(declare-fun lt!66711 () Bool)

(assert (=> d!39079 (= res!62133 (not lt!66711))))

(declare-fun lt!66714 () Bool)

(assert (=> d!39079 (= lt!66711 lt!66714)))

(declare-fun lt!66712 () Unit!3985)

(declare-fun e!84019 () Unit!3985)

(assert (=> d!39079 (= lt!66712 e!84019)))

(declare-fun c!23643 () Bool)

(assert (=> d!39079 (= c!23643 lt!66714)))

(assert (=> d!39079 (= lt!66714 (containsKey!172 (toList!835 lt!66292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39079 (= (contains!869 lt!66292 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66711)))

(declare-fun b!128716 () Bool)

(declare-fun lt!66713 () Unit!3985)

(assert (=> b!128716 (= e!84019 lt!66713)))

(assert (=> b!128716 (= lt!66713 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128716 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128717 () Bool)

(declare-fun Unit!4014 () Unit!3985)

(assert (=> b!128717 (= e!84019 Unit!4014)))

(declare-fun b!128718 () Bool)

(assert (=> b!128718 (= e!84020 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39079 c!23643) b!128716))

(assert (= (and d!39079 (not c!23643)) b!128717))

(assert (= (and d!39079 (not res!62133)) b!128718))

(declare-fun m!150965 () Bool)

(assert (=> d!39079 m!150965))

(declare-fun m!150967 () Bool)

(assert (=> b!128716 m!150967))

(declare-fun m!150969 () Bool)

(assert (=> b!128716 m!150969))

(assert (=> b!128716 m!150969))

(declare-fun m!150971 () Bool)

(assert (=> b!128716 m!150971))

(assert (=> b!128718 m!150969))

(assert (=> b!128718 m!150969))

(assert (=> b!128718 m!150971))

(assert (=> bm!13837 d!39079))

(declare-fun d!39081 () Bool)

(declare-fun e!84022 () Bool)

(assert (=> d!39081 e!84022))

(declare-fun res!62134 () Bool)

(assert (=> d!39081 (=> res!62134 e!84022)))

(declare-fun lt!66715 () Bool)

(assert (=> d!39081 (= res!62134 (not lt!66715))))

(declare-fun lt!66718 () Bool)

(assert (=> d!39081 (= lt!66715 lt!66718)))

(declare-fun lt!66716 () Unit!3985)

(declare-fun e!84021 () Unit!3985)

(assert (=> d!39081 (= lt!66716 e!84021)))

(declare-fun c!23644 () Bool)

(assert (=> d!39081 (= c!23644 lt!66718)))

(assert (=> d!39081 (= lt!66718 (containsKey!172 (toList!835 lt!66561) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39081 (= (contains!869 lt!66561 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) lt!66715)))

(declare-fun b!128719 () Bool)

(declare-fun lt!66717 () Unit!3985)

(assert (=> b!128719 (= e!84021 lt!66717)))

(assert (=> b!128719 (= lt!66717 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66561) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128719 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128720 () Bool)

(declare-fun Unit!4015 () Unit!3985)

(assert (=> b!128720 (= e!84021 Unit!4015)))

(declare-fun b!128721 () Bool)

(assert (=> b!128721 (= e!84022 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39081 c!23644) b!128719))

(assert (= (and d!39081 (not c!23644)) b!128720))

(assert (= (and d!39081 (not res!62134)) b!128721))

(assert (=> d!39081 m!149959))

(declare-fun m!150973 () Bool)

(assert (=> d!39081 m!150973))

(assert (=> b!128719 m!149959))

(declare-fun m!150975 () Bool)

(assert (=> b!128719 m!150975))

(assert (=> b!128719 m!149959))

(declare-fun m!150977 () Bool)

(assert (=> b!128719 m!150977))

(assert (=> b!128719 m!150977))

(declare-fun m!150979 () Bool)

(assert (=> b!128719 m!150979))

(assert (=> b!128721 m!149959))

(assert (=> b!128721 m!150977))

(assert (=> b!128721 m!150977))

(assert (=> b!128721 m!150979))

(assert (=> b!128458 d!39081))

(declare-fun d!39083 () Bool)

(declare-fun e!84023 () Bool)

(assert (=> d!39083 e!84023))

(declare-fun res!62136 () Bool)

(assert (=> d!39083 (=> (not res!62136) (not e!84023))))

(declare-fun lt!66719 () ListLongMap!1639)

(assert (=> d!39083 (= res!62136 (contains!869 lt!66719 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66721 () List!1682)

(assert (=> d!39083 (= lt!66719 (ListLongMap!1640 lt!66721))))

(declare-fun lt!66720 () Unit!3985)

(declare-fun lt!66722 () Unit!3985)

(assert (=> d!39083 (= lt!66720 lt!66722)))

(assert (=> d!39083 (= (getValueByKey!169 lt!66721 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39083 (= lt!66722 (lemmaContainsTupThenGetReturnValue!84 lt!66721 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39083 (= lt!66721 (insertStrictlySorted!87 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39083 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66719)))

(declare-fun b!128722 () Bool)

(declare-fun res!62135 () Bool)

(assert (=> b!128722 (=> (not res!62135) (not e!84023))))

(assert (=> b!128722 (= res!62135 (= (getValueByKey!169 (toList!835 lt!66719) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128723 () Bool)

(assert (=> b!128723 (= e!84023 (contains!871 (toList!835 lt!66719) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39083 res!62136) b!128722))

(assert (= (and b!128722 res!62135) b!128723))

(declare-fun m!150981 () Bool)

(assert (=> d!39083 m!150981))

(declare-fun m!150983 () Bool)

(assert (=> d!39083 m!150983))

(declare-fun m!150985 () Bool)

(assert (=> d!39083 m!150985))

(declare-fun m!150987 () Bool)

(assert (=> d!39083 m!150987))

(declare-fun m!150989 () Bool)

(assert (=> b!128722 m!150989))

(declare-fun m!150991 () Bool)

(assert (=> b!128723 m!150991))

(assert (=> b!128437 d!39083))

(assert (=> b!128437 d!38803))

(declare-fun bm!13910 () Bool)

(declare-fun call!13919 () ListLongMap!1639)

(declare-fun call!13916 () ListLongMap!1639)

(assert (=> bm!13910 (= call!13919 call!13916)))

(declare-fun b!128724 () Bool)

(declare-fun res!62143 () Bool)

(declare-fun e!84025 () Bool)

(assert (=> b!128724 (=> (not res!62143) (not e!84025))))

(declare-fun e!84034 () Bool)

(assert (=> b!128724 (= res!62143 e!84034)))

(declare-fun c!23648 () Bool)

(assert (=> b!128724 (= c!23648 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128725 () Bool)

(declare-fun e!84028 () Bool)

(assert (=> b!128725 (= e!84028 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128726 () Bool)

(declare-fun e!84030 () ListLongMap!1639)

(declare-fun e!84035 () ListLongMap!1639)

(assert (=> b!128726 (= e!84030 e!84035)))

(declare-fun c!23650 () Bool)

(assert (=> b!128726 (= c!23650 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128727 () Bool)

(declare-fun call!13917 () Bool)

(assert (=> b!128727 (= e!84034 (not call!13917))))

(declare-fun bm!13911 () Bool)

(declare-fun lt!66744 () ListLongMap!1639)

(assert (=> bm!13911 (= call!13917 (contains!869 lt!66744 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13912 () Bool)

(declare-fun call!13914 () ListLongMap!1639)

(declare-fun call!13918 () ListLongMap!1639)

(assert (=> bm!13912 (= call!13914 call!13918)))

(declare-fun b!128728 () Bool)

(declare-fun e!84032 () Bool)

(assert (=> b!128728 (= e!84032 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128729 () Bool)

(declare-fun e!84024 () Bool)

(assert (=> b!128729 (= e!84024 (= (apply!112 lt!66744 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128730 () Bool)

(assert (=> b!128730 (= e!84034 e!84024)))

(declare-fun res!62138 () Bool)

(assert (=> b!128730 (= res!62138 call!13917)))

(assert (=> b!128730 (=> (not res!62138) (not e!84024))))

(declare-fun d!39085 () Bool)

(assert (=> d!39085 e!84025))

(declare-fun res!62139 () Bool)

(assert (=> d!39085 (=> (not res!62139) (not e!84025))))

(assert (=> d!39085 (= res!62139 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66732 () ListLongMap!1639)

(assert (=> d!39085 (= lt!66744 lt!66732)))

(declare-fun lt!66736 () Unit!3985)

(declare-fun e!84031 () Unit!3985)

(assert (=> d!39085 (= lt!66736 e!84031)))

(declare-fun c!23649 () Bool)

(assert (=> d!39085 (= c!23649 e!84028)))

(declare-fun res!62140 () Bool)

(assert (=> d!39085 (=> (not res!62140) (not e!84028))))

(assert (=> d!39085 (= res!62140 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39085 (= lt!66732 e!84030)))

(declare-fun c!23646 () Bool)

(assert (=> d!39085 (= c!23646 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39085 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39085 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66744)))

(declare-fun b!128731 () Bool)

(declare-fun Unit!4016 () Unit!3985)

(assert (=> b!128731 (= e!84031 Unit!4016)))

(declare-fun bm!13913 () Bool)

(declare-fun call!13913 () Bool)

(assert (=> bm!13913 (= call!13913 (contains!869 lt!66744 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128732 () Bool)

(declare-fun e!84027 () ListLongMap!1639)

(assert (=> b!128732 (= e!84027 call!13919)))

(declare-fun b!128733 () Bool)

(declare-fun e!84026 () Bool)

(assert (=> b!128733 (= e!84026 (not call!13913))))

(declare-fun b!128734 () Bool)

(declare-fun e!84029 () Bool)

(declare-fun e!84033 () Bool)

(assert (=> b!128734 (= e!84029 e!84033)))

(declare-fun res!62144 () Bool)

(assert (=> b!128734 (=> (not res!62144) (not e!84033))))

(assert (=> b!128734 (= res!62144 (contains!869 lt!66744 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128734 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13914 () Bool)

(declare-fun call!13915 () ListLongMap!1639)

(assert (=> bm!13914 (= call!13915 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128735 () Bool)

(assert (=> b!128735 (= e!84030 (+!165 call!13916 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13915 () Bool)

(assert (=> bm!13915 (= call!13918 call!13915)))

(declare-fun b!128736 () Bool)

(assert (=> b!128736 (= e!84025 e!84026)))

(declare-fun c!23647 () Bool)

(assert (=> b!128736 (= c!23647 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128737 () Bool)

(assert (=> b!128737 (= e!84033 (= (apply!112 lt!66744 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))))))

(assert (=> b!128737 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128738 () Bool)

(declare-fun res!62145 () Bool)

(assert (=> b!128738 (=> (not res!62145) (not e!84025))))

(assert (=> b!128738 (= res!62145 e!84029)))

(declare-fun res!62137 () Bool)

(assert (=> b!128738 (=> res!62137 e!84029)))

(assert (=> b!128738 (= res!62137 (not e!84032))))

(declare-fun res!62142 () Bool)

(assert (=> b!128738 (=> (not res!62142) (not e!84032))))

(assert (=> b!128738 (= res!62142 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13916 () Bool)

(assert (=> bm!13916 (= call!13916 (+!165 (ite c!23646 call!13915 (ite c!23650 call!13918 call!13914)) (ite (or c!23646 c!23650) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128739 () Bool)

(declare-fun lt!66723 () Unit!3985)

(assert (=> b!128739 (= e!84031 lt!66723)))

(declare-fun lt!66725 () ListLongMap!1639)

(assert (=> b!128739 (= lt!66725 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66729 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66726 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66726 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66743 () Unit!3985)

(assert (=> b!128739 (= lt!66743 (addStillContains!88 lt!66725 lt!66729 (zeroValue!2665 newMap!16) lt!66726))))

(assert (=> b!128739 (contains!869 (+!165 lt!66725 (tuple2!2537 lt!66729 (zeroValue!2665 newMap!16))) lt!66726)))

(declare-fun lt!66730 () Unit!3985)

(assert (=> b!128739 (= lt!66730 lt!66743)))

(declare-fun lt!66742 () ListLongMap!1639)

(assert (=> b!128739 (= lt!66742 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66728 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66728 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66737 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66737 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66738 () Unit!3985)

(assert (=> b!128739 (= lt!66738 (addApplyDifferent!88 lt!66742 lt!66728 (minValue!2665 newMap!16) lt!66737))))

(assert (=> b!128739 (= (apply!112 (+!165 lt!66742 (tuple2!2537 lt!66728 (minValue!2665 newMap!16))) lt!66737) (apply!112 lt!66742 lt!66737))))

(declare-fun lt!66734 () Unit!3985)

(assert (=> b!128739 (= lt!66734 lt!66738)))

(declare-fun lt!66739 () ListLongMap!1639)

(assert (=> b!128739 (= lt!66739 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66740 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66740 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66731 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66731 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66733 () Unit!3985)

(assert (=> b!128739 (= lt!66733 (addApplyDifferent!88 lt!66739 lt!66740 (zeroValue!2665 newMap!16) lt!66731))))

(assert (=> b!128739 (= (apply!112 (+!165 lt!66739 (tuple2!2537 lt!66740 (zeroValue!2665 newMap!16))) lt!66731) (apply!112 lt!66739 lt!66731))))

(declare-fun lt!66727 () Unit!3985)

(assert (=> b!128739 (= lt!66727 lt!66733)))

(declare-fun lt!66741 () ListLongMap!1639)

(assert (=> b!128739 (= lt!66741 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66735 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66724 () (_ BitVec 64))

(assert (=> b!128739 (= lt!66724 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128739 (= lt!66723 (addApplyDifferent!88 lt!66741 lt!66735 (minValue!2665 newMap!16) lt!66724))))

(assert (=> b!128739 (= (apply!112 (+!165 lt!66741 (tuple2!2537 lt!66735 (minValue!2665 newMap!16))) lt!66724) (apply!112 lt!66741 lt!66724))))

(declare-fun b!128740 () Bool)

(assert (=> b!128740 (= e!84027 call!13914)))

(declare-fun b!128741 () Bool)

(declare-fun e!84036 () Bool)

(assert (=> b!128741 (= e!84036 (= (apply!112 lt!66744 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128742 () Bool)

(assert (=> b!128742 (= e!84035 call!13919)))

(declare-fun b!128743 () Bool)

(declare-fun c!23645 () Bool)

(assert (=> b!128743 (= c!23645 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128743 (= e!84035 e!84027)))

(declare-fun b!128744 () Bool)

(assert (=> b!128744 (= e!84026 e!84036)))

(declare-fun res!62141 () Bool)

(assert (=> b!128744 (= res!62141 call!13913)))

(assert (=> b!128744 (=> (not res!62141) (not e!84036))))

(assert (= (and d!39085 c!23646) b!128735))

(assert (= (and d!39085 (not c!23646)) b!128726))

(assert (= (and b!128726 c!23650) b!128742))

(assert (= (and b!128726 (not c!23650)) b!128743))

(assert (= (and b!128743 c!23645) b!128732))

(assert (= (and b!128743 (not c!23645)) b!128740))

(assert (= (or b!128732 b!128740) bm!13912))

(assert (= (or b!128742 bm!13912) bm!13915))

(assert (= (or b!128742 b!128732) bm!13910))

(assert (= (or b!128735 bm!13915) bm!13914))

(assert (= (or b!128735 bm!13910) bm!13916))

(assert (= (and d!39085 res!62140) b!128725))

(assert (= (and d!39085 c!23649) b!128739))

(assert (= (and d!39085 (not c!23649)) b!128731))

(assert (= (and d!39085 res!62139) b!128738))

(assert (= (and b!128738 res!62142) b!128728))

(assert (= (and b!128738 (not res!62137)) b!128734))

(assert (= (and b!128734 res!62144) b!128737))

(assert (= (and b!128738 res!62145) b!128724))

(assert (= (and b!128724 c!23648) b!128730))

(assert (= (and b!128724 (not c!23648)) b!128727))

(assert (= (and b!128730 res!62138) b!128729))

(assert (= (or b!128730 b!128727) bm!13911))

(assert (= (and b!128724 res!62143) b!128736))

(assert (= (and b!128736 c!23647) b!128744))

(assert (= (and b!128736 (not c!23647)) b!128733))

(assert (= (and b!128744 res!62141) b!128741))

(assert (= (or b!128744 b!128733) bm!13913))

(declare-fun b_lambda!5707 () Bool)

(assert (=> (not b_lambda!5707) (not b!128737)))

(assert (=> b!128737 t!6065))

(declare-fun b_and!7965 () Bool)

(assert (= b_and!7961 (and (=> t!6065 result!3889) b_and!7965)))

(assert (=> b!128737 t!6067))

(declare-fun b_and!7967 () Bool)

(assert (= b_and!7963 (and (=> t!6067 result!3891) b_and!7967)))

(declare-fun m!150993 () Bool)

(assert (=> bm!13911 m!150993))

(declare-fun m!150995 () Bool)

(assert (=> bm!13914 m!150995))

(assert (=> b!128734 m!149959))

(assert (=> b!128734 m!149959))

(declare-fun m!150997 () Bool)

(assert (=> b!128734 m!150997))

(assert (=> d!39085 m!149963))

(assert (=> b!128728 m!149959))

(assert (=> b!128728 m!149959))

(assert (=> b!128728 m!149965))

(assert (=> b!128725 m!149959))

(assert (=> b!128725 m!149959))

(assert (=> b!128725 m!149965))

(declare-fun m!150999 () Bool)

(assert (=> b!128735 m!150999))

(declare-fun m!151001 () Bool)

(assert (=> bm!13913 m!151001))

(declare-fun m!151003 () Bool)

(assert (=> b!128741 m!151003))

(declare-fun m!151005 () Bool)

(assert (=> b!128739 m!151005))

(declare-fun m!151007 () Bool)

(assert (=> b!128739 m!151007))

(declare-fun m!151009 () Bool)

(assert (=> b!128739 m!151009))

(declare-fun m!151011 () Bool)

(assert (=> b!128739 m!151011))

(declare-fun m!151013 () Bool)

(assert (=> b!128739 m!151013))

(declare-fun m!151015 () Bool)

(assert (=> b!128739 m!151015))

(declare-fun m!151017 () Bool)

(assert (=> b!128739 m!151017))

(declare-fun m!151019 () Bool)

(assert (=> b!128739 m!151019))

(declare-fun m!151021 () Bool)

(assert (=> b!128739 m!151021))

(assert (=> b!128739 m!151009))

(declare-fun m!151023 () Bool)

(assert (=> b!128739 m!151023))

(declare-fun m!151025 () Bool)

(assert (=> b!128739 m!151025))

(declare-fun m!151027 () Bool)

(assert (=> b!128739 m!151027))

(declare-fun m!151029 () Bool)

(assert (=> b!128739 m!151029))

(assert (=> b!128739 m!151019))

(declare-fun m!151031 () Bool)

(assert (=> b!128739 m!151031))

(declare-fun m!151033 () Bool)

(assert (=> b!128739 m!151033))

(assert (=> b!128739 m!149959))

(assert (=> b!128739 m!151013))

(assert (=> b!128739 m!151027))

(assert (=> b!128739 m!150995))

(declare-fun m!151035 () Bool)

(assert (=> b!128729 m!151035))

(declare-fun m!151037 () Bool)

(assert (=> bm!13916 m!151037))

(assert (=> b!128737 m!149959))

(assert (=> b!128737 m!149959))

(declare-fun m!151039 () Bool)

(assert (=> b!128737 m!151039))

(declare-fun m!151041 () Bool)

(assert (=> b!128737 m!151041))

(assert (=> b!128737 m!150011))

(declare-fun m!151043 () Bool)

(assert (=> b!128737 m!151043))

(assert (=> b!128737 m!151041))

(assert (=> b!128737 m!150011))

(assert (=> b!128437 d!39085))

(declare-fun d!39087 () Bool)

(assert (=> d!39087 (= (get!1465 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128303 d!39087))

(declare-fun d!39089 () Bool)

(assert (=> d!39089 (= (isDefined!121 (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))) (not (isEmpty!406 (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))))

(declare-fun bs!5356 () Bool)

(assert (= bs!5356 d!39089))

(assert (=> bs!5356 m!150219))

(declare-fun m!151045 () Bool)

(assert (=> bs!5356 m!151045))

(assert (=> b!128301 d!39089))

(declare-fun b!128748 () Bool)

(declare-fun e!84038 () Option!175)

(assert (=> b!128748 (= e!84038 None!173)))

(declare-fun b!128747 () Bool)

(assert (=> b!128747 (= e!84038 (getValueByKey!169 (t!6053 (toList!835 e!83614)) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(declare-fun c!23651 () Bool)

(declare-fun d!39091 () Bool)

(assert (=> d!39091 (= c!23651 (and ((_ is Cons!1678) (toList!835 e!83614)) (= (_1!1279 (h!2281 (toList!835 e!83614))) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))))

(declare-fun e!84037 () Option!175)

(assert (=> d!39091 (= (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))) e!84037)))

(declare-fun b!128746 () Bool)

(assert (=> b!128746 (= e!84037 e!84038)))

(declare-fun c!23652 () Bool)

(assert (=> b!128746 (= c!23652 (and ((_ is Cons!1678) (toList!835 e!83614)) (not (= (_1!1279 (h!2281 (toList!835 e!83614))) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))))

(declare-fun b!128745 () Bool)

(assert (=> b!128745 (= e!84037 (Some!174 (_2!1279 (h!2281 (toList!835 e!83614)))))))

(assert (= (and d!39091 c!23651) b!128745))

(assert (= (and d!39091 (not c!23651)) b!128746))

(assert (= (and b!128746 c!23652) b!128747))

(assert (= (and b!128746 (not c!23652)) b!128748))

(declare-fun m!151047 () Bool)

(assert (=> b!128747 m!151047))

(assert (=> b!128301 d!39091))

(assert (=> b!128278 d!39077))

(declare-fun d!39093 () Bool)

(declare-fun e!84039 () Bool)

(assert (=> d!39093 e!84039))

(declare-fun res!62147 () Bool)

(assert (=> d!39093 (=> (not res!62147) (not e!84039))))

(declare-fun lt!66745 () ListLongMap!1639)

(assert (=> d!39093 (= res!62147 (contains!869 lt!66745 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66747 () List!1682)

(assert (=> d!39093 (= lt!66745 (ListLongMap!1640 lt!66747))))

(declare-fun lt!66746 () Unit!3985)

(declare-fun lt!66748 () Unit!3985)

(assert (=> d!39093 (= lt!66746 lt!66748)))

(assert (=> d!39093 (= (getValueByKey!169 lt!66747 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39093 (= lt!66748 (lemmaContainsTupThenGetReturnValue!84 lt!66747 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39093 (= lt!66747 (insertStrictlySorted!87 (toList!835 (map!1386 newMap!16)) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39093 (= (+!165 (map!1386 newMap!16) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66745)))

(declare-fun b!128749 () Bool)

(declare-fun res!62146 () Bool)

(assert (=> b!128749 (=> (not res!62146) (not e!84039))))

(assert (=> b!128749 (= res!62146 (= (getValueByKey!169 (toList!835 lt!66745) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128750 () Bool)

(assert (=> b!128750 (= e!84039 (contains!871 (toList!835 lt!66745) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39093 res!62147) b!128749))

(assert (= (and b!128749 res!62146) b!128750))

(declare-fun m!151049 () Bool)

(assert (=> d!39093 m!151049))

(declare-fun m!151051 () Bool)

(assert (=> d!39093 m!151051))

(declare-fun m!151053 () Bool)

(assert (=> d!39093 m!151053))

(declare-fun m!151055 () Bool)

(assert (=> d!39093 m!151055))

(declare-fun m!151057 () Bool)

(assert (=> b!128749 m!151057))

(declare-fun m!151059 () Bool)

(assert (=> b!128750 m!151059))

(assert (=> b!128278 d!39093))

(assert (=> b!128278 d!38799))

(declare-fun d!39095 () Bool)

(declare-fun lt!66749 () Bool)

(assert (=> d!39095 (= lt!66749 (select (content!128 (toList!835 lt!66532)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!84041 () Bool)

(assert (=> d!39095 (= lt!66749 e!84041)))

(declare-fun res!62149 () Bool)

(assert (=> d!39095 (=> (not res!62149) (not e!84041))))

(assert (=> d!39095 (= res!62149 ((_ is Cons!1678) (toList!835 lt!66532)))))

(assert (=> d!39095 (= (contains!871 (toList!835 lt!66532) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66749)))

(declare-fun b!128751 () Bool)

(declare-fun e!84040 () Bool)

(assert (=> b!128751 (= e!84041 e!84040)))

(declare-fun res!62148 () Bool)

(assert (=> b!128751 (=> res!62148 e!84040)))

(assert (=> b!128751 (= res!62148 (= (h!2281 (toList!835 lt!66532)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128752 () Bool)

(assert (=> b!128752 (= e!84040 (contains!871 (t!6053 (toList!835 lt!66532)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!39095 res!62149) b!128751))

(assert (= (and b!128751 (not res!62148)) b!128752))

(declare-fun m!151061 () Bool)

(assert (=> d!39095 m!151061))

(declare-fun m!151063 () Bool)

(assert (=> d!39095 m!151063))

(declare-fun m!151065 () Bool)

(assert (=> b!128752 m!151065))

(assert (=> b!128445 d!39095))

(declare-fun d!39097 () Bool)

(declare-fun e!84042 () Bool)

(assert (=> d!39097 e!84042))

(declare-fun res!62151 () Bool)

(assert (=> d!39097 (=> (not res!62151) (not e!84042))))

(declare-fun lt!66750 () ListLongMap!1639)

(assert (=> d!39097 (= res!62151 (contains!869 lt!66750 (_1!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun lt!66752 () List!1682)

(assert (=> d!39097 (= lt!66750 (ListLongMap!1640 lt!66752))))

(declare-fun lt!66751 () Unit!3985)

(declare-fun lt!66753 () Unit!3985)

(assert (=> d!39097 (= lt!66751 lt!66753)))

(assert (=> d!39097 (= (getValueByKey!169 lt!66752 (_1!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39097 (= lt!66753 (lemmaContainsTupThenGetReturnValue!84 lt!66752 (_1!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39097 (= lt!66752 (insertStrictlySorted!87 (toList!835 (ite c!23568 call!13879 (ite c!23572 call!13882 call!13878))) (_1!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39097 (= (+!165 (ite c!23568 call!13879 (ite c!23572 call!13882 call!13878)) (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) lt!66750)))

(declare-fun b!128753 () Bool)

(declare-fun res!62150 () Bool)

(assert (=> b!128753 (=> (not res!62150) (not e!84042))))

(assert (=> b!128753 (= res!62150 (= (getValueByKey!169 (toList!835 lt!66750) (_1!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))))

(declare-fun b!128754 () Bool)

(assert (=> b!128754 (= e!84042 (contains!871 (toList!835 lt!66750) (ite (or c!23568 c!23572) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!23474 c!23467) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2665 newMap!16))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (= (and d!39097 res!62151) b!128753))

(assert (= (and b!128753 res!62150) b!128754))

(declare-fun m!151067 () Bool)

(assert (=> d!39097 m!151067))

(declare-fun m!151069 () Bool)

(assert (=> d!39097 m!151069))

(declare-fun m!151071 () Bool)

(assert (=> d!39097 m!151071))

(declare-fun m!151073 () Bool)

(assert (=> d!39097 m!151073))

(declare-fun m!151075 () Bool)

(assert (=> b!128753 m!151075))

(declare-fun m!151077 () Bool)

(assert (=> b!128754 m!151077))

(assert (=> bm!13880 d!39097))

(declare-fun d!39099 () Bool)

(assert (=> d!39099 (= (inRange!0 (ite c!23577 (index!3216 lt!66567) (index!3219 lt!66567)) (mask!7072 newMap!16)) (and (bvsge (ite c!23577 (index!3216 lt!66567) (index!3219 lt!66567)) #b00000000000000000000000000000000) (bvslt (ite c!23577 (index!3216 lt!66567) (index!3219 lt!66567)) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13886 d!39099))

(assert (=> b!128365 d!39059))

(declare-fun b!128758 () Bool)

(declare-fun e!84044 () Option!175)

(assert (=> b!128758 (= e!84044 None!173)))

(declare-fun b!128757 () Bool)

(assert (=> b!128757 (= e!84044 (getValueByKey!169 (t!6053 (toList!835 lt!66341)) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!39101 () Bool)

(declare-fun c!23653 () Bool)

(assert (=> d!39101 (= c!23653 (and ((_ is Cons!1678) (toList!835 lt!66341)) (= (_1!1279 (h!2281 (toList!835 lt!66341))) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84043 () Option!175)

(assert (=> d!39101 (= (getValueByKey!169 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84043)))

(declare-fun b!128756 () Bool)

(assert (=> b!128756 (= e!84043 e!84044)))

(declare-fun c!23654 () Bool)

(assert (=> b!128756 (= c!23654 (and ((_ is Cons!1678) (toList!835 lt!66341)) (not (= (_1!1279 (h!2281 (toList!835 lt!66341))) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!128755 () Bool)

(assert (=> b!128755 (= e!84043 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66341)))))))

(assert (= (and d!39101 c!23653) b!128755))

(assert (= (and d!39101 (not c!23653)) b!128756))

(assert (= (and b!128756 c!23654) b!128757))

(assert (= (and b!128756 (not c!23654)) b!128758))

(declare-fun m!151079 () Bool)

(assert (=> b!128757 m!151079))

(assert (=> b!128238 d!39101))

(declare-fun d!39103 () Bool)

(assert (=> d!39103 (= (apply!112 lt!66292 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66292) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5357 () Bool)

(assert (= bs!5357 d!39103))

(assert (=> bs!5357 m!150969))

(assert (=> bs!5357 m!150969))

(declare-fun m!151081 () Bool)

(assert (=> bs!5357 m!151081))

(assert (=> b!128163 d!39103))

(declare-fun d!39105 () Bool)

(declare-fun isEmpty!407 (List!1682) Bool)

(assert (=> d!39105 (= (isEmpty!405 lt!66328) (isEmpty!407 (toList!835 lt!66328)))))

(declare-fun bs!5358 () Bool)

(assert (= bs!5358 d!39105))

(declare-fun m!151083 () Bool)

(assert (=> bs!5358 m!151083))

(assert (=> b!128231 d!39105))

(declare-fun b!128771 () Bool)

(declare-fun e!84052 () SeekEntryResult!265)

(assert (=> b!128771 (= e!84052 (Found!265 (index!3218 lt!66484)))))

(declare-fun b!128772 () Bool)

(declare-fun c!23663 () Bool)

(declare-fun lt!66759 () (_ BitVec 64))

(assert (=> b!128772 (= c!23663 (= lt!66759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84053 () SeekEntryResult!265)

(assert (=> b!128772 (= e!84052 e!84053)))

(declare-fun b!128773 () Bool)

(assert (=> b!128773 (= e!84053 (MissingVacant!265 (index!3218 lt!66484)))))

(declare-fun b!128774 () Bool)

(declare-fun e!84051 () SeekEntryResult!265)

(assert (=> b!128774 (= e!84051 Undefined!265)))

(declare-fun b!128775 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!128775 (= e!84053 (seekKeyOrZeroReturnVacant!0 (bvadd (x!15116 lt!66484) #b00000000000000000000000000000001) (nextIndex!0 (index!3218 lt!66484) (bvadd (x!15116 lt!66484) #b00000000000000000000000000000001) (mask!7072 newMap!16)) (index!3218 lt!66484) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun lt!66758 () SeekEntryResult!265)

(declare-fun d!39107 () Bool)

(assert (=> d!39107 (and (or ((_ is Undefined!265) lt!66758) (not ((_ is Found!265) lt!66758)) (and (bvsge (index!3217 lt!66758) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66758) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66758) ((_ is Found!265) lt!66758) (not ((_ is MissingVacant!265) lt!66758)) (not (= (index!3219 lt!66758) (index!3218 lt!66484))) (and (bvsge (index!3219 lt!66758) #b00000000000000000000000000000000) (bvslt (index!3219 lt!66758) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66758) (ite ((_ is Found!265) lt!66758) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66758)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (and ((_ is MissingVacant!265) lt!66758) (= (index!3219 lt!66758) (index!3218 lt!66484)) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66758)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!39107 (= lt!66758 e!84051)))

(declare-fun c!23661 () Bool)

(assert (=> d!39107 (= c!23661 (bvsge (x!15116 lt!66484) #b01111111111111111111111111111110))))

(assert (=> d!39107 (= lt!66759 (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66484)))))

(assert (=> d!39107 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39107 (= (seekKeyOrZeroReturnVacant!0 (x!15116 lt!66484) (index!3218 lt!66484) (index!3218 lt!66484) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)) lt!66758)))

(declare-fun b!128776 () Bool)

(assert (=> b!128776 (= e!84051 e!84052)))

(declare-fun c!23662 () Bool)

(assert (=> b!128776 (= c!23662 (= lt!66759 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39107 c!23661) b!128774))

(assert (= (and d!39107 (not c!23661)) b!128776))

(assert (= (and b!128776 c!23662) b!128771))

(assert (= (and b!128776 (not c!23662)) b!128772))

(assert (= (and b!128772 c!23663) b!128773))

(assert (= (and b!128772 (not c!23663)) b!128775))

(declare-fun m!151085 () Bool)

(assert (=> b!128775 m!151085))

(assert (=> b!128775 m!151085))

(assert (=> b!128775 m!149721))

(declare-fun m!151087 () Bool)

(assert (=> b!128775 m!151087))

(declare-fun m!151089 () Bool)

(assert (=> d!39107 m!151089))

(declare-fun m!151091 () Bool)

(assert (=> d!39107 m!151091))

(assert (=> d!39107 m!150297))

(assert (=> d!39107 m!149963))

(assert (=> b!128402 d!39107))

(declare-fun d!39109 () Bool)

(declare-fun res!62152 () Bool)

(declare-fun e!84054 () Bool)

(assert (=> d!39109 (=> res!62152 e!84054)))

(assert (=> d!39109 (= res!62152 (and ((_ is Cons!1678) (t!6053 (toList!835 lt!66092))) (= (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (=> d!39109 (= (containsKey!172 (t!6053 (toList!835 lt!66092)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84054)))

(declare-fun b!128777 () Bool)

(declare-fun e!84055 () Bool)

(assert (=> b!128777 (= e!84054 e!84055)))

(declare-fun res!62153 () Bool)

(assert (=> b!128777 (=> (not res!62153) (not e!84055))))

(assert (=> b!128777 (= res!62153 (and (or (not ((_ is Cons!1678) (t!6053 (toList!835 lt!66092)))) (bvsle (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) ((_ is Cons!1678) (t!6053 (toList!835 lt!66092))) (bvslt (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun b!128778 () Bool)

(assert (=> b!128778 (= e!84055 (containsKey!172 (t!6053 (t!6053 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39109 (not res!62152)) b!128777))

(assert (= (and b!128777 res!62153) b!128778))

(assert (=> b!128778 m!149721))

(declare-fun m!151093 () Bool)

(assert (=> b!128778 m!151093))

(assert (=> b!128342 d!39109))

(declare-fun d!39111 () Bool)

(declare-fun e!84056 () Bool)

(assert (=> d!39111 e!84056))

(declare-fun res!62155 () Bool)

(assert (=> d!39111 (=> (not res!62155) (not e!84056))))

(declare-fun lt!66760 () ListLongMap!1639)

(assert (=> d!39111 (= res!62155 (contains!869 lt!66760 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun lt!66762 () List!1682)

(assert (=> d!39111 (= lt!66760 (ListLongMap!1640 lt!66762))))

(declare-fun lt!66761 () Unit!3985)

(declare-fun lt!66763 () Unit!3985)

(assert (=> d!39111 (= lt!66761 lt!66763)))

(assert (=> d!39111 (= (getValueByKey!169 lt!66762 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39111 (= lt!66763 (lemmaContainsTupThenGetReturnValue!84 lt!66762 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39111 (= lt!66762 (insertStrictlySorted!87 (toList!835 call!13842) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39111 (= (+!165 call!13842 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) lt!66760)))

(declare-fun b!128779 () Bool)

(declare-fun res!62154 () Bool)

(assert (=> b!128779 (=> (not res!62154) (not e!84056))))

(assert (=> b!128779 (= res!62154 (= (getValueByKey!169 (toList!835 lt!66760) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun b!128780 () Bool)

(assert (=> b!128780 (= e!84056 (contains!871 (toList!835 lt!66760) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(assert (= (and d!39111 res!62155) b!128779))

(assert (= (and b!128779 res!62154) b!128780))

(declare-fun m!151095 () Bool)

(assert (=> d!39111 m!151095))

(declare-fun m!151097 () Bool)

(assert (=> d!39111 m!151097))

(declare-fun m!151099 () Bool)

(assert (=> d!39111 m!151099))

(declare-fun m!151101 () Bool)

(assert (=> d!39111 m!151101))

(declare-fun m!151103 () Bool)

(assert (=> b!128779 m!151103))

(declare-fun m!151105 () Bool)

(assert (=> b!128780 m!151105))

(assert (=> b!128169 d!39111))

(declare-fun d!39113 () Bool)

(assert (=> d!39113 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!66764 () Unit!3985)

(assert (=> d!39113 (= lt!66764 (choose!784 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84057 () Bool)

(assert (=> d!39113 e!84057))

(declare-fun res!62156 () Bool)

(assert (=> d!39113 (=> (not res!62156) (not e!84057))))

(assert (=> d!39113 (= res!62156 (isStrictlySorted!305 (toList!835 lt!66270)))))

(assert (=> d!39113 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000) lt!66764)))

(declare-fun b!128781 () Bool)

(assert (=> b!128781 (= e!84057 (containsKey!172 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39113 res!62156) b!128781))

(assert (=> d!39113 m!150247))

(assert (=> d!39113 m!150247))

(assert (=> d!39113 m!150249))

(declare-fun m!151107 () Bool)

(assert (=> d!39113 m!151107))

(declare-fun m!151109 () Bool)

(assert (=> d!39113 m!151109))

(assert (=> b!128781 m!150243))

(assert (=> b!128334 d!39113))

(assert (=> b!128334 d!39061))

(assert (=> b!128334 d!39063))

(declare-fun d!39115 () Bool)

(assert (=> d!39115 (arrayContainsKey!0 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000)))

(declare-fun lt!66767 () Unit!3985)

(declare-fun choose!13 (array!4707 (_ BitVec 64) (_ BitVec 32)) Unit!3985)

(assert (=> d!39115 (= lt!66767 (choose!13 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000))))

(assert (=> d!39115 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!39115 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000) lt!66767)))

(declare-fun bs!5359 () Bool)

(assert (= bs!5359 d!39115))

(assert (=> bs!5359 m!150255))

(declare-fun m!151111 () Bool)

(assert (=> bs!5359 m!151111))

(assert (=> b!128351 d!39115))

(declare-fun d!39117 () Bool)

(declare-fun res!62157 () Bool)

(declare-fun e!84058 () Bool)

(assert (=> d!39117 (=> res!62157 e!84058)))

(assert (=> d!39117 (= res!62157 (= (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) lt!66470))))

(assert (=> d!39117 (= (arrayContainsKey!0 (_keys!4541 newMap!16) lt!66470 #b00000000000000000000000000000000) e!84058)))

(declare-fun b!128782 () Bool)

(declare-fun e!84059 () Bool)

(assert (=> b!128782 (= e!84058 e!84059)))

(declare-fun res!62158 () Bool)

(assert (=> b!128782 (=> (not res!62158) (not e!84059))))

(assert (=> b!128782 (= res!62158 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128783 () Bool)

(assert (=> b!128783 (= e!84059 (arrayContainsKey!0 (_keys!4541 newMap!16) lt!66470 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39117 (not res!62157)) b!128782))

(assert (= (and b!128782 res!62158) b!128783))

(assert (=> d!39117 m!149959))

(declare-fun m!151113 () Bool)

(assert (=> b!128783 m!151113))

(assert (=> b!128351 d!39117))

(declare-fun b!128784 () Bool)

(declare-fun e!84061 () SeekEntryResult!265)

(declare-fun lt!66770 () SeekEntryResult!265)

(assert (=> b!128784 (= e!84061 (MissingZero!265 (index!3218 lt!66770)))))

(declare-fun b!128785 () Bool)

(declare-fun e!84060 () SeekEntryResult!265)

(assert (=> b!128785 (= e!84060 (Found!265 (index!3218 lt!66770)))))

(declare-fun d!39119 () Bool)

(declare-fun lt!66768 () SeekEntryResult!265)

(assert (=> d!39119 (and (or ((_ is Undefined!265) lt!66768) (not ((_ is Found!265) lt!66768)) (and (bvsge (index!3217 lt!66768) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66768) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66768) ((_ is Found!265) lt!66768) (not ((_ is MissingZero!265) lt!66768)) (and (bvsge (index!3216 lt!66768) #b00000000000000000000000000000000) (bvslt (index!3216 lt!66768) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66768) ((_ is Found!265) lt!66768) ((_ is MissingZero!265) lt!66768) (not ((_ is MissingVacant!265) lt!66768)) (and (bvsge (index!3219 lt!66768) #b00000000000000000000000000000000) (bvslt (index!3219 lt!66768) (size!2493 (_keys!4541 newMap!16))))) (or ((_ is Undefined!265) lt!66768) (ite ((_ is Found!265) lt!66768) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66768)) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!265) lt!66768) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!66768)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!265) lt!66768) (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!66768)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84062 () SeekEntryResult!265)

(assert (=> d!39119 (= lt!66768 e!84062)))

(declare-fun c!23664 () Bool)

(assert (=> d!39119 (= c!23664 (and ((_ is Intermediate!265) lt!66770) (undefined!1077 lt!66770)))))

(assert (=> d!39119 (= lt!66770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (mask!7072 newMap!16)) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(assert (=> d!39119 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39119 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (_keys!4541 newMap!16) (mask!7072 newMap!16)) lt!66768)))

(declare-fun b!128786 () Bool)

(assert (=> b!128786 (= e!84061 (seekKeyOrZeroReturnVacant!0 (x!15116 lt!66770) (index!3218 lt!66770) (index!3218 lt!66770) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128787 () Bool)

(assert (=> b!128787 (= e!84062 Undefined!265)))

(declare-fun b!128788 () Bool)

(declare-fun c!23665 () Bool)

(declare-fun lt!66769 () (_ BitVec 64))

(assert (=> b!128788 (= c!23665 (= lt!66769 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!128788 (= e!84060 e!84061)))

(declare-fun b!128789 () Bool)

(assert (=> b!128789 (= e!84062 e!84060)))

(assert (=> b!128789 (= lt!66769 (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66770)))))

(declare-fun c!23666 () Bool)

(assert (=> b!128789 (= c!23666 (= lt!66769 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39119 c!23664) b!128787))

(assert (= (and d!39119 (not c!23664)) b!128789))

(assert (= (and b!128789 c!23666) b!128785))

(assert (= (and b!128789 (not c!23666)) b!128788))

(assert (= (and b!128788 c!23665) b!128784))

(assert (= (and b!128788 (not c!23665)) b!128786))

(declare-fun m!151115 () Bool)

(assert (=> d!39119 m!151115))

(declare-fun m!151117 () Bool)

(assert (=> d!39119 m!151117))

(assert (=> d!39119 m!149959))

(declare-fun m!151119 () Bool)

(assert (=> d!39119 m!151119))

(declare-fun m!151121 () Bool)

(assert (=> d!39119 m!151121))

(assert (=> d!39119 m!149963))

(assert (=> d!39119 m!151119))

(assert (=> d!39119 m!149959))

(declare-fun m!151123 () Bool)

(assert (=> d!39119 m!151123))

(assert (=> b!128786 m!149959))

(declare-fun m!151125 () Bool)

(assert (=> b!128786 m!151125))

(declare-fun m!151127 () Bool)

(assert (=> b!128789 m!151127))

(assert (=> b!128351 d!39119))

(assert (=> d!38825 d!38831))

(assert (=> d!38825 d!38833))

(declare-fun d!39121 () Bool)

(assert (=> d!39121 (contains!869 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66252)))

(assert (=> d!39121 true))

(declare-fun _$35!375 () Unit!3985)

(assert (=> d!39121 (= (choose!781 lt!66251 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66252) _$35!375)))

(declare-fun bs!5360 () Bool)

(assert (= bs!5360 d!39121))

(assert (=> bs!5360 m!149933))

(assert (=> bs!5360 m!149933))

(assert (=> bs!5360 m!149935))

(assert (=> d!38825 d!39121))

(declare-fun d!39123 () Bool)

(declare-fun e!84064 () Bool)

(assert (=> d!39123 e!84064))

(declare-fun res!62159 () Bool)

(assert (=> d!39123 (=> res!62159 e!84064)))

(declare-fun lt!66771 () Bool)

(assert (=> d!39123 (= res!62159 (not lt!66771))))

(declare-fun lt!66774 () Bool)

(assert (=> d!39123 (= lt!66771 lt!66774)))

(declare-fun lt!66772 () Unit!3985)

(declare-fun e!84063 () Unit!3985)

(assert (=> d!39123 (= lt!66772 e!84063)))

(declare-fun c!23667 () Bool)

(assert (=> d!39123 (= c!23667 lt!66774)))

(assert (=> d!39123 (= lt!66774 (containsKey!172 (toList!835 lt!66251) lt!66252))))

(assert (=> d!39123 (= (contains!869 lt!66251 lt!66252) lt!66771)))

(declare-fun b!128791 () Bool)

(declare-fun lt!66773 () Unit!3985)

(assert (=> b!128791 (= e!84063 lt!66773)))

(assert (=> b!128791 (= lt!66773 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66251) lt!66252))))

(assert (=> b!128791 (isDefined!121 (getValueByKey!169 (toList!835 lt!66251) lt!66252))))

(declare-fun b!128792 () Bool)

(declare-fun Unit!4017 () Unit!3985)

(assert (=> b!128792 (= e!84063 Unit!4017)))

(declare-fun b!128793 () Bool)

(assert (=> b!128793 (= e!84064 (isDefined!121 (getValueByKey!169 (toList!835 lt!66251) lt!66252)))))

(assert (= (and d!39123 c!23667) b!128791))

(assert (= (and d!39123 (not c!23667)) b!128792))

(assert (= (and d!39123 (not res!62159)) b!128793))

(declare-fun m!151129 () Bool)

(assert (=> d!39123 m!151129))

(declare-fun m!151131 () Bool)

(assert (=> b!128791 m!151131))

(declare-fun m!151133 () Bool)

(assert (=> b!128791 m!151133))

(assert (=> b!128791 m!151133))

(declare-fun m!151135 () Bool)

(assert (=> b!128791 m!151135))

(assert (=> b!128793 m!151133))

(assert (=> b!128793 m!151133))

(assert (=> b!128793 m!151135))

(assert (=> d!38825 d!39123))

(assert (=> b!128368 d!39059))

(declare-fun d!39125 () Bool)

(declare-fun lt!66775 () Bool)

(assert (=> d!39125 (= lt!66775 (select (content!128 (toList!835 lt!66304)) (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!84066 () Bool)

(assert (=> d!39125 (= lt!66775 e!84066)))

(declare-fun res!62161 () Bool)

(assert (=> d!39125 (=> (not res!62161) (not e!84066))))

(assert (=> d!39125 (= res!62161 ((_ is Cons!1678) (toList!835 lt!66304)))))

(assert (=> d!39125 (= (contains!871 (toList!835 lt!66304) (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66775)))

(declare-fun b!128794 () Bool)

(declare-fun e!84065 () Bool)

(assert (=> b!128794 (= e!84066 e!84065)))

(declare-fun res!62160 () Bool)

(assert (=> b!128794 (=> res!62160 e!84065)))

(assert (=> b!128794 (= res!62160 (= (h!2281 (toList!835 lt!66304)) (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!128795 () Bool)

(assert (=> b!128795 (= e!84065 (contains!871 (t!6053 (toList!835 lt!66304)) (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!39125 res!62161) b!128794))

(assert (= (and b!128794 (not res!62160)) b!128795))

(declare-fun m!151137 () Bool)

(assert (=> d!39125 m!151137))

(declare-fun m!151139 () Bool)

(assert (=> d!39125 m!151139))

(declare-fun m!151141 () Bool)

(assert (=> b!128795 m!151141))

(assert (=> b!128194 d!39125))

(declare-fun d!39127 () Bool)

(declare-fun res!62162 () Bool)

(declare-fun e!84067 () Bool)

(assert (=> d!39127 (=> res!62162 e!84067)))

(assert (=> d!39127 (= res!62162 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66252)))))

(assert (=> d!39127 (= (containsKey!172 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66252) e!84067)))

(declare-fun b!128796 () Bool)

(declare-fun e!84068 () Bool)

(assert (=> b!128796 (= e!84067 e!84068)))

(declare-fun res!62163 () Bool)

(assert (=> b!128796 (=> (not res!62163) (not e!84068))))

(assert (=> b!128796 (= res!62163 (and (or (not ((_ is Cons!1678) (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) (bvsle (_1!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66252)) ((_ is Cons!1678) (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (bvslt (_1!1279 (h!2281 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66252)))))

(declare-fun b!128797 () Bool)

(assert (=> b!128797 (= e!84068 (containsKey!172 (t!6053 (toList!835 (+!165 lt!66251 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66252))))

(assert (= (and d!39127 (not res!62162)) b!128796))

(assert (= (and b!128796 res!62163) b!128797))

(declare-fun m!151143 () Bool)

(assert (=> b!128797 m!151143))

(assert (=> d!38831 d!39127))

(assert (=> b!128372 d!38867))

(declare-fun d!39129 () Bool)

(declare-fun e!84070 () Bool)

(assert (=> d!39129 e!84070))

(declare-fun res!62164 () Bool)

(assert (=> d!39129 (=> res!62164 e!84070)))

(declare-fun lt!66776 () Bool)

(assert (=> d!39129 (= res!62164 (not lt!66776))))

(declare-fun lt!66779 () Bool)

(assert (=> d!39129 (= lt!66776 lt!66779)))

(declare-fun lt!66777 () Unit!3985)

(declare-fun e!84069 () Unit!3985)

(assert (=> d!39129 (= lt!66777 e!84069)))

(declare-fun c!23668 () Bool)

(assert (=> d!39129 (= c!23668 lt!66779)))

(assert (=> d!39129 (= lt!66779 (containsKey!172 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!39129 (= (contains!869 lt!66341 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66776)))

(declare-fun b!128798 () Bool)

(declare-fun lt!66778 () Unit!3985)

(assert (=> b!128798 (= e!84069 lt!66778)))

(assert (=> b!128798 (= lt!66778 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> b!128798 (isDefined!121 (getValueByKey!169 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128799 () Bool)

(declare-fun Unit!4018 () Unit!3985)

(assert (=> b!128799 (= e!84069 Unit!4018)))

(declare-fun b!128800 () Bool)

(assert (=> b!128800 (= e!84070 (isDefined!121 (getValueByKey!169 (toList!835 lt!66341) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39129 c!23668) b!128798))

(assert (= (and d!39129 (not c!23668)) b!128799))

(assert (= (and d!39129 (not res!62164)) b!128800))

(declare-fun m!151145 () Bool)

(assert (=> d!39129 m!151145))

(declare-fun m!151147 () Bool)

(assert (=> b!128798 m!151147))

(assert (=> b!128798 m!150109))

(assert (=> b!128798 m!150109))

(declare-fun m!151149 () Bool)

(assert (=> b!128798 m!151149))

(assert (=> b!128800 m!150109))

(assert (=> b!128800 m!150109))

(assert (=> b!128800 m!151149))

(assert (=> d!38833 d!39129))

(declare-fun b!128804 () Bool)

(declare-fun e!84072 () Option!175)

(assert (=> b!128804 (= e!84072 None!173)))

(declare-fun b!128803 () Bool)

(assert (=> b!128803 (= e!84072 (getValueByKey!169 (t!6053 lt!66343) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun c!23669 () Bool)

(declare-fun d!39131 () Bool)

(assert (=> d!39131 (= c!23669 (and ((_ is Cons!1678) lt!66343) (= (_1!1279 (h!2281 lt!66343)) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84071 () Option!175)

(assert (=> d!39131 (= (getValueByKey!169 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84071)))

(declare-fun b!128802 () Bool)

(assert (=> b!128802 (= e!84071 e!84072)))

(declare-fun c!23670 () Bool)

(assert (=> b!128802 (= c!23670 (and ((_ is Cons!1678) lt!66343) (not (= (_1!1279 (h!2281 lt!66343)) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!128801 () Bool)

(assert (=> b!128801 (= e!84071 (Some!174 (_2!1279 (h!2281 lt!66343))))))

(assert (= (and d!39131 c!23669) b!128801))

(assert (= (and d!39131 (not c!23669)) b!128802))

(assert (= (and b!128802 c!23670) b!128803))

(assert (= (and b!128802 (not c!23670)) b!128804))

(declare-fun m!151151 () Bool)

(assert (=> b!128803 m!151151))

(assert (=> d!38833 d!39131))

(declare-fun d!39133 () Bool)

(assert (=> d!39133 (= (getValueByKey!169 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66780 () Unit!3985)

(assert (=> d!39133 (= lt!66780 (choose!789 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!84073 () Bool)

(assert (=> d!39133 e!84073))

(declare-fun res!62165 () Bool)

(assert (=> d!39133 (=> (not res!62165) (not e!84073))))

(assert (=> d!39133 (= res!62165 (isStrictlySorted!305 lt!66343))))

(assert (=> d!39133 (= (lemmaContainsTupThenGetReturnValue!84 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66780)))

(declare-fun b!128805 () Bool)

(declare-fun res!62166 () Bool)

(assert (=> b!128805 (=> (not res!62166) (not e!84073))))

(assert (=> b!128805 (= res!62166 (containsKey!172 lt!66343 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128806 () Bool)

(assert (=> b!128806 (= e!84073 (contains!871 lt!66343 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39133 res!62165) b!128805))

(assert (= (and b!128805 res!62166) b!128806))

(assert (=> d!39133 m!150103))

(declare-fun m!151153 () Bool)

(assert (=> d!39133 m!151153))

(declare-fun m!151155 () Bool)

(assert (=> d!39133 m!151155))

(declare-fun m!151157 () Bool)

(assert (=> b!128805 m!151157))

(declare-fun m!151159 () Bool)

(assert (=> b!128806 m!151159))

(assert (=> d!38833 d!39133))

(declare-fun call!13920 () List!1682)

(declare-fun e!84074 () List!1682)

(declare-fun bm!13917 () Bool)

(declare-fun c!23672 () Bool)

(assert (=> bm!13917 (= call!13920 ($colon$colon!89 e!84074 (ite c!23672 (h!2281 (toList!835 lt!66251)) (tuple2!2537 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun c!23673 () Bool)

(assert (=> bm!13917 (= c!23673 c!23672)))

(declare-fun d!39135 () Bool)

(declare-fun e!84077 () Bool)

(assert (=> d!39135 e!84077))

(declare-fun res!62167 () Bool)

(assert (=> d!39135 (=> (not res!62167) (not e!84077))))

(declare-fun lt!66781 () List!1682)

(assert (=> d!39135 (= res!62167 (isStrictlySorted!305 lt!66781))))

(declare-fun e!84078 () List!1682)

(assert (=> d!39135 (= lt!66781 e!84078)))

(assert (=> d!39135 (= c!23672 (and ((_ is Cons!1678) (toList!835 lt!66251)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66251))) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!39135 (isStrictlySorted!305 (toList!835 lt!66251))))

(assert (=> d!39135 (= (insertStrictlySorted!87 (toList!835 lt!66251) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66781)))

(declare-fun b!128807 () Bool)

(assert (=> b!128807 (= e!84074 (insertStrictlySorted!87 (t!6053 (toList!835 lt!66251)) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128808 () Bool)

(assert (=> b!128808 (= e!84078 call!13920)))

(declare-fun b!128809 () Bool)

(declare-fun e!84075 () List!1682)

(assert (=> b!128809 (= e!84078 e!84075)))

(declare-fun c!23674 () Bool)

(assert (=> b!128809 (= c!23674 (and ((_ is Cons!1678) (toList!835 lt!66251)) (= (_1!1279 (h!2281 (toList!835 lt!66251))) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128810 () Bool)

(declare-fun e!84076 () List!1682)

(declare-fun call!13922 () List!1682)

(assert (=> b!128810 (= e!84076 call!13922)))

(declare-fun bm!13918 () Bool)

(declare-fun call!13921 () List!1682)

(assert (=> bm!13918 (= call!13922 call!13921)))

(declare-fun c!23671 () Bool)

(declare-fun b!128811 () Bool)

(assert (=> b!128811 (= e!84074 (ite c!23674 (t!6053 (toList!835 lt!66251)) (ite c!23671 (Cons!1678 (h!2281 (toList!835 lt!66251)) (t!6053 (toList!835 lt!66251))) Nil!1679)))))

(declare-fun b!128812 () Bool)

(assert (=> b!128812 (= e!84076 call!13922)))

(declare-fun b!128813 () Bool)

(assert (=> b!128813 (= e!84077 (contains!871 lt!66781 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128814 () Bool)

(assert (=> b!128814 (= c!23671 (and ((_ is Cons!1678) (toList!835 lt!66251)) (bvsgt (_1!1279 (h!2281 (toList!835 lt!66251))) (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!128814 (= e!84075 e!84076)))

(declare-fun b!128815 () Bool)

(declare-fun res!62168 () Bool)

(assert (=> b!128815 (=> (not res!62168) (not e!84077))))

(assert (=> b!128815 (= res!62168 (containsKey!172 lt!66781 (_1!1279 (tuple2!2537 lt!66255 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun bm!13919 () Bool)

(assert (=> bm!13919 (= call!13921 call!13920)))

(declare-fun b!128816 () Bool)

(assert (=> b!128816 (= e!84075 call!13921)))

(assert (= (and d!39135 c!23672) b!128808))

(assert (= (and d!39135 (not c!23672)) b!128809))

(assert (= (and b!128809 c!23674) b!128816))

(assert (= (and b!128809 (not c!23674)) b!128814))

(assert (= (and b!128814 c!23671) b!128812))

(assert (= (and b!128814 (not c!23671)) b!128810))

(assert (= (or b!128812 b!128810) bm!13918))

(assert (= (or b!128816 bm!13918) bm!13919))

(assert (= (or b!128808 bm!13919) bm!13917))

(assert (= (and bm!13917 c!23673) b!128807))

(assert (= (and bm!13917 (not c!23673)) b!128811))

(assert (= (and d!39135 res!62167) b!128815))

(assert (= (and b!128815 res!62168) b!128813))

(declare-fun m!151161 () Bool)

(assert (=> b!128815 m!151161))

(declare-fun m!151163 () Bool)

(assert (=> b!128807 m!151163))

(declare-fun m!151165 () Bool)

(assert (=> d!39135 m!151165))

(declare-fun m!151167 () Bool)

(assert (=> d!39135 m!151167))

(declare-fun m!151169 () Bool)

(assert (=> bm!13917 m!151169))

(declare-fun m!151171 () Bool)

(assert (=> b!128813 m!151171))

(assert (=> d!38833 d!39135))

(assert (=> b!128277 d!38913))

(declare-fun b!128817 () Bool)

(declare-fun e!84081 () Bool)

(declare-fun e!84079 () Bool)

(assert (=> b!128817 (= e!84081 e!84079)))

(declare-fun c!23675 () Bool)

(assert (=> b!128817 (= c!23675 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) lt!66433)))))

(declare-fun bm!13920 () Bool)

(declare-fun call!13923 () Bool)

(assert (=> bm!13920 (= call!13923 (arrayNoDuplicates!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (bvadd lt!66433 #b00000000000000000000000000000001) (ite c!23675 (Cons!1680 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) lt!66433) lt!66412) lt!66412)))))

(declare-fun b!128818 () Bool)

(declare-fun e!84080 () Bool)

(assert (=> b!128818 (= e!84080 (contains!872 lt!66412 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) lt!66433)))))

(declare-fun d!39137 () Bool)

(declare-fun res!62170 () Bool)

(declare-fun e!84082 () Bool)

(assert (=> d!39137 (=> res!62170 e!84082)))

(assert (=> d!39137 (= res!62170 (bvsge lt!66433 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(assert (=> d!39137 (= (arrayNoDuplicates!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) lt!66433 lt!66412) e!84082)))

(declare-fun b!128819 () Bool)

(assert (=> b!128819 (= e!84079 call!13923)))

(declare-fun b!128820 () Bool)

(assert (=> b!128820 (= e!84082 e!84081)))

(declare-fun res!62169 () Bool)

(assert (=> b!128820 (=> (not res!62169) (not e!84081))))

(assert (=> b!128820 (= res!62169 (not e!84080))))

(declare-fun res!62171 () Bool)

(assert (=> b!128820 (=> (not res!62171) (not e!84080))))

(assert (=> b!128820 (= res!62171 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) lt!66433)))))

(declare-fun b!128821 () Bool)

(assert (=> b!128821 (= e!84079 call!13923)))

(assert (= (and d!39137 (not res!62170)) b!128820))

(assert (= (and b!128820 res!62171) b!128818))

(assert (= (and b!128820 res!62169) b!128817))

(assert (= (and b!128817 c!23675) b!128821))

(assert (= (and b!128817 (not c!23675)) b!128819))

(assert (= (or b!128821 b!128819) bm!13920))

(declare-fun m!151173 () Bool)

(assert (=> b!128817 m!151173))

(assert (=> b!128817 m!151173))

(declare-fun m!151175 () Bool)

(assert (=> b!128817 m!151175))

(assert (=> bm!13920 m!151173))

(declare-fun m!151177 () Bool)

(assert (=> bm!13920 m!151177))

(assert (=> b!128818 m!151173))

(assert (=> b!128818 m!151173))

(declare-fun m!151179 () Bool)

(assert (=> b!128818 m!151179))

(assert (=> b!128820 m!151173))

(assert (=> b!128820 m!151173))

(assert (=> b!128820 m!151175))

(assert (=> d!38841 d!39137))

(declare-fun d!39139 () Bool)

(declare-fun e!84085 () Bool)

(assert (=> d!39139 e!84085))

(declare-fun res!62174 () Bool)

(assert (=> d!39139 (=> (not res!62174) (not e!84085))))

(assert (=> d!39139 (= res!62174 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 (_keys!4541 newMap!16)))))))

(declare-fun lt!66784 () Unit!3985)

(declare-fun choose!102 ((_ BitVec 64) array!4707 (_ BitVec 32) (_ BitVec 32)) Unit!3985)

(assert (=> d!39139 (= lt!66784 (choose!102 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (mask!7072 newMap!16)))))

(assert (=> d!39139 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39139 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (mask!7072 newMap!16)) lt!66784)))

(declare-fun b!128824 () Bool)

(assert (=> b!128824 (= e!84085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (mask!7072 newMap!16)))))

(assert (= (and d!39139 res!62174) b!128824))

(assert (=> d!39139 m!149721))

(declare-fun m!151181 () Bool)

(assert (=> d!39139 m!151181))

(assert (=> d!39139 m!149963))

(assert (=> b!128824 m!150153))

(assert (=> b!128824 m!150151))

(assert (=> d!38841 d!39139))

(assert (=> d!38841 d!38901))

(assert (=> d!38841 d!38797))

(assert (=> d!38841 d!38807))

(declare-fun bm!13921 () Bool)

(declare-fun call!13930 () ListLongMap!1639)

(declare-fun call!13927 () ListLongMap!1639)

(assert (=> bm!13921 (= call!13930 call!13927)))

(declare-fun b!128825 () Bool)

(declare-fun res!62181 () Bool)

(declare-fun e!84087 () Bool)

(assert (=> b!128825 (=> (not res!62181) (not e!84087))))

(declare-fun e!84096 () Bool)

(assert (=> b!128825 (= res!62181 e!84096)))

(declare-fun c!23679 () Bool)

(assert (=> b!128825 (= c!23679 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!84090 () Bool)

(declare-fun b!128826 () Bool)

(assert (=> b!128826 (= e!84090 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128827 () Bool)

(declare-fun e!84092 () ListLongMap!1639)

(declare-fun e!84097 () ListLongMap!1639)

(assert (=> b!128827 (= e!84092 e!84097)))

(declare-fun c!23681 () Bool)

(assert (=> b!128827 (= c!23681 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128828 () Bool)

(declare-fun call!13928 () Bool)

(assert (=> b!128828 (= e!84096 (not call!13928))))

(declare-fun bm!13922 () Bool)

(declare-fun lt!66806 () ListLongMap!1639)

(assert (=> bm!13922 (= call!13928 (contains!869 lt!66806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13923 () Bool)

(declare-fun call!13925 () ListLongMap!1639)

(declare-fun call!13929 () ListLongMap!1639)

(assert (=> bm!13923 (= call!13925 call!13929)))

(declare-fun b!128829 () Bool)

(declare-fun e!84094 () Bool)

(assert (=> b!128829 (= e!84094 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128830 () Bool)

(declare-fun e!84086 () Bool)

(assert (=> b!128830 (= e!84086 (= (apply!112 lt!66806 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128831 () Bool)

(assert (=> b!128831 (= e!84096 e!84086)))

(declare-fun res!62176 () Bool)

(assert (=> b!128831 (= res!62176 call!13928)))

(assert (=> b!128831 (=> (not res!62176) (not e!84086))))

(declare-fun d!39141 () Bool)

(assert (=> d!39141 e!84087))

(declare-fun res!62177 () Bool)

(assert (=> d!39141 (=> (not res!62177) (not e!84087))))

(assert (=> d!39141 (= res!62177 (or (bvsge #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))))

(declare-fun lt!66794 () ListLongMap!1639)

(assert (=> d!39141 (= lt!66806 lt!66794)))

(declare-fun lt!66798 () Unit!3985)

(declare-fun e!84093 () Unit!3985)

(assert (=> d!39141 (= lt!66798 e!84093)))

(declare-fun c!23680 () Bool)

(assert (=> d!39141 (= c!23680 e!84090)))

(declare-fun res!62178 () Bool)

(assert (=> d!39141 (=> (not res!62178) (not e!84090))))

(assert (=> d!39141 (= res!62178 (bvslt #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(assert (=> d!39141 (= lt!66794 e!84092)))

(declare-fun c!23677 () Bool)

(assert (=> d!39141 (= c!23677 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39141 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39141 (= (getCurrentListMap!514 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66806)))

(declare-fun b!128832 () Bool)

(declare-fun Unit!4019 () Unit!3985)

(assert (=> b!128832 (= e!84093 Unit!4019)))

(declare-fun bm!13924 () Bool)

(declare-fun call!13924 () Bool)

(assert (=> bm!13924 (= call!13924 (contains!869 lt!66806 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128833 () Bool)

(declare-fun e!84089 () ListLongMap!1639)

(assert (=> b!128833 (= e!84089 call!13930)))

(declare-fun b!128834 () Bool)

(declare-fun e!84088 () Bool)

(assert (=> b!128834 (= e!84088 (not call!13924))))

(declare-fun b!128835 () Bool)

(declare-fun e!84091 () Bool)

(declare-fun e!84095 () Bool)

(assert (=> b!128835 (= e!84091 e!84095)))

(declare-fun res!62182 () Bool)

(assert (=> b!128835 (=> (not res!62182) (not e!84095))))

(assert (=> b!128835 (= res!62182 (contains!869 lt!66806 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> b!128835 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun bm!13925 () Bool)

(declare-fun call!13926 () ListLongMap!1639)

(assert (=> bm!13925 (= call!13926 (getCurrentListMapNoExtraKeys!132 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128836 () Bool)

(assert (=> b!128836 (= e!84092 (+!165 call!13927 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13926 () Bool)

(assert (=> bm!13926 (= call!13929 call!13926)))

(declare-fun b!128837 () Bool)

(assert (=> b!128837 (= e!84087 e!84088)))

(declare-fun c!23678 () Bool)

(assert (=> b!128837 (= c!23678 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128838 () Bool)

(assert (=> b!128838 (= e!84095 (= (apply!112 lt!66806 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))))))

(assert (=> b!128838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun b!128839 () Bool)

(declare-fun res!62183 () Bool)

(assert (=> b!128839 (=> (not res!62183) (not e!84087))))

(assert (=> b!128839 (= res!62183 e!84091)))

(declare-fun res!62175 () Bool)

(assert (=> b!128839 (=> res!62175 e!84091)))

(assert (=> b!128839 (= res!62175 (not e!84094))))

(declare-fun res!62180 () Bool)

(assert (=> b!128839 (=> (not res!62180) (not e!84094))))

(assert (=> b!128839 (= res!62180 (bvslt #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun bm!13927 () Bool)

(assert (=> bm!13927 (= call!13927 (+!165 (ite c!23677 call!13926 (ite c!23681 call!13929 call!13925)) (ite (or c!23677 c!23681) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128840 () Bool)

(declare-fun lt!66785 () Unit!3985)

(assert (=> b!128840 (= e!84093 lt!66785)))

(declare-fun lt!66787 () ListLongMap!1639)

(assert (=> b!128840 (= lt!66787 (getCurrentListMapNoExtraKeys!132 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66791 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66791 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66788 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66788 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66805 () Unit!3985)

(assert (=> b!128840 (= lt!66805 (addStillContains!88 lt!66787 lt!66791 (zeroValue!2665 newMap!16) lt!66788))))

(assert (=> b!128840 (contains!869 (+!165 lt!66787 (tuple2!2537 lt!66791 (zeroValue!2665 newMap!16))) lt!66788)))

(declare-fun lt!66792 () Unit!3985)

(assert (=> b!128840 (= lt!66792 lt!66805)))

(declare-fun lt!66804 () ListLongMap!1639)

(assert (=> b!128840 (= lt!66804 (getCurrentListMapNoExtraKeys!132 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66790 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66790 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66799 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66799 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66800 () Unit!3985)

(assert (=> b!128840 (= lt!66800 (addApplyDifferent!88 lt!66804 lt!66790 (minValue!2665 newMap!16) lt!66799))))

(assert (=> b!128840 (= (apply!112 (+!165 lt!66804 (tuple2!2537 lt!66790 (minValue!2665 newMap!16))) lt!66799) (apply!112 lt!66804 lt!66799))))

(declare-fun lt!66796 () Unit!3985)

(assert (=> b!128840 (= lt!66796 lt!66800)))

(declare-fun lt!66801 () ListLongMap!1639)

(assert (=> b!128840 (= lt!66801 (getCurrentListMapNoExtraKeys!132 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66802 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66802 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66793 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66793 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66795 () Unit!3985)

(assert (=> b!128840 (= lt!66795 (addApplyDifferent!88 lt!66801 lt!66802 (zeroValue!2665 newMap!16) lt!66793))))

(assert (=> b!128840 (= (apply!112 (+!165 lt!66801 (tuple2!2537 lt!66802 (zeroValue!2665 newMap!16))) lt!66793) (apply!112 lt!66801 lt!66793))))

(declare-fun lt!66789 () Unit!3985)

(assert (=> b!128840 (= lt!66789 lt!66795)))

(declare-fun lt!66803 () ListLongMap!1639)

(assert (=> b!128840 (= lt!66803 (getCurrentListMapNoExtraKeys!132 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66797 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66786 () (_ BitVec 64))

(assert (=> b!128840 (= lt!66786 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000))))

(assert (=> b!128840 (= lt!66785 (addApplyDifferent!88 lt!66803 lt!66797 (minValue!2665 newMap!16) lt!66786))))

(assert (=> b!128840 (= (apply!112 (+!165 lt!66803 (tuple2!2537 lt!66797 (minValue!2665 newMap!16))) lt!66786) (apply!112 lt!66803 lt!66786))))

(declare-fun b!128841 () Bool)

(assert (=> b!128841 (= e!84089 call!13925)))

(declare-fun b!128842 () Bool)

(declare-fun e!84098 () Bool)

(assert (=> b!128842 (= e!84098 (= (apply!112 lt!66806 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128843 () Bool)

(assert (=> b!128843 (= e!84097 call!13930)))

(declare-fun b!128844 () Bool)

(declare-fun c!23676 () Bool)

(assert (=> b!128844 (= c!23676 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128844 (= e!84097 e!84089)))

(declare-fun b!128845 () Bool)

(assert (=> b!128845 (= e!84088 e!84098)))

(declare-fun res!62179 () Bool)

(assert (=> b!128845 (= res!62179 call!13924)))

(assert (=> b!128845 (=> (not res!62179) (not e!84098))))

(assert (= (and d!39141 c!23677) b!128836))

(assert (= (and d!39141 (not c!23677)) b!128827))

(assert (= (and b!128827 c!23681) b!128843))

(assert (= (and b!128827 (not c!23681)) b!128844))

(assert (= (and b!128844 c!23676) b!128833))

(assert (= (and b!128844 (not c!23676)) b!128841))

(assert (= (or b!128833 b!128841) bm!13923))

(assert (= (or b!128843 bm!13923) bm!13926))

(assert (= (or b!128843 b!128833) bm!13921))

(assert (= (or b!128836 bm!13926) bm!13925))

(assert (= (or b!128836 bm!13921) bm!13927))

(assert (= (and d!39141 res!62178) b!128826))

(assert (= (and d!39141 c!23680) b!128840))

(assert (= (and d!39141 (not c!23680)) b!128832))

(assert (= (and d!39141 res!62177) b!128839))

(assert (= (and b!128839 res!62180) b!128829))

(assert (= (and b!128839 (not res!62175)) b!128835))

(assert (= (and b!128835 res!62182) b!128838))

(assert (= (and b!128839 res!62183) b!128825))

(assert (= (and b!128825 c!23679) b!128831))

(assert (= (and b!128825 (not c!23679)) b!128828))

(assert (= (and b!128831 res!62176) b!128830))

(assert (= (or b!128831 b!128828) bm!13922))

(assert (= (and b!128825 res!62181) b!128837))

(assert (= (and b!128837 c!23678) b!128845))

(assert (= (and b!128837 (not c!23678)) b!128834))

(assert (= (and b!128845 res!62179) b!128842))

(assert (= (or b!128845 b!128834) bm!13924))

(declare-fun b_lambda!5709 () Bool)

(assert (=> (not b_lambda!5709) (not b!128838)))

(assert (=> b!128838 t!6065))

(declare-fun b_and!7969 () Bool)

(assert (= b_and!7965 (and (=> t!6065 result!3889) b_and!7969)))

(assert (=> b!128838 t!6067))

(declare-fun b_and!7971 () Bool)

(assert (= b_and!7967 (and (=> t!6067 result!3891) b_and!7971)))

(declare-fun m!151183 () Bool)

(assert (=> bm!13922 m!151183))

(declare-fun m!151185 () Bool)

(assert (=> bm!13925 m!151185))

(declare-fun m!151187 () Bool)

(assert (=> b!128835 m!151187))

(assert (=> b!128835 m!151187))

(declare-fun m!151189 () Bool)

(assert (=> b!128835 m!151189))

(assert (=> d!39141 m!149963))

(assert (=> b!128829 m!151187))

(assert (=> b!128829 m!151187))

(declare-fun m!151191 () Bool)

(assert (=> b!128829 m!151191))

(assert (=> b!128826 m!151187))

(assert (=> b!128826 m!151187))

(assert (=> b!128826 m!151191))

(declare-fun m!151193 () Bool)

(assert (=> b!128836 m!151193))

(declare-fun m!151195 () Bool)

(assert (=> bm!13924 m!151195))

(declare-fun m!151197 () Bool)

(assert (=> b!128842 m!151197))

(declare-fun m!151199 () Bool)

(assert (=> b!128840 m!151199))

(declare-fun m!151201 () Bool)

(assert (=> b!128840 m!151201))

(declare-fun m!151203 () Bool)

(assert (=> b!128840 m!151203))

(declare-fun m!151205 () Bool)

(assert (=> b!128840 m!151205))

(declare-fun m!151207 () Bool)

(assert (=> b!128840 m!151207))

(declare-fun m!151209 () Bool)

(assert (=> b!128840 m!151209))

(declare-fun m!151211 () Bool)

(assert (=> b!128840 m!151211))

(declare-fun m!151213 () Bool)

(assert (=> b!128840 m!151213))

(declare-fun m!151215 () Bool)

(assert (=> b!128840 m!151215))

(assert (=> b!128840 m!151203))

(declare-fun m!151217 () Bool)

(assert (=> b!128840 m!151217))

(declare-fun m!151219 () Bool)

(assert (=> b!128840 m!151219))

(declare-fun m!151221 () Bool)

(assert (=> b!128840 m!151221))

(declare-fun m!151223 () Bool)

(assert (=> b!128840 m!151223))

(assert (=> b!128840 m!151213))

(declare-fun m!151225 () Bool)

(assert (=> b!128840 m!151225))

(declare-fun m!151227 () Bool)

(assert (=> b!128840 m!151227))

(assert (=> b!128840 m!151187))

(assert (=> b!128840 m!151207))

(assert (=> b!128840 m!151221))

(assert (=> b!128840 m!151185))

(declare-fun m!151229 () Bool)

(assert (=> b!128830 m!151229))

(declare-fun m!151231 () Bool)

(assert (=> bm!13927 m!151231))

(assert (=> b!128838 m!151187))

(assert (=> b!128838 m!151187))

(declare-fun m!151233 () Bool)

(assert (=> b!128838 m!151233))

(declare-fun m!151235 () Bool)

(assert (=> b!128838 m!151235))

(assert (=> b!128838 m!150011))

(declare-fun m!151237 () Bool)

(assert (=> b!128838 m!151237))

(assert (=> b!128838 m!151235))

(assert (=> b!128838 m!150011))

(assert (=> d!38841 d!39141))

(declare-fun d!39143 () Bool)

(declare-fun e!84099 () Bool)

(assert (=> d!39143 e!84099))

(declare-fun res!62184 () Bool)

(assert (=> d!39143 (=> (not res!62184) (not e!84099))))

(assert (=> d!39143 (= res!62184 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 lt!66430))))))

(declare-fun lt!66807 () Unit!3985)

(assert (=> d!39143 (= lt!66807 (choose!786 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!39143 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39143 (= (lemmaValidKeyInArrayIsInListMap!117 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (defaultEntry!2804 newMap!16)) lt!66807)))

(declare-fun b!128846 () Bool)

(assert (=> b!128846 (= e!84099 (contains!869 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 lt!66430) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(assert (= (and d!39143 res!62184) b!128846))

(declare-fun m!151239 () Bool)

(assert (=> d!39143 m!151239))

(assert (=> d!39143 m!149963))

(assert (=> b!128846 m!150141))

(declare-fun m!151241 () Bool)

(assert (=> b!128846 m!151241))

(assert (=> b!128846 m!150141))

(assert (=> b!128846 m!151241))

(declare-fun m!151243 () Bool)

(assert (=> b!128846 m!151243))

(assert (=> d!38841 d!39143))

(declare-fun b!128856 () Bool)

(declare-fun res!62193 () Bool)

(declare-fun e!84105 () Bool)

(assert (=> b!128856 (=> (not res!62193) (not e!84105))))

(assert (=> b!128856 (= res!62193 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun b!128858 () Bool)

(declare-fun e!84104 () Bool)

(assert (=> b!128858 (= e!84104 (= (arrayCountValidKeys!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!4541 newMap!16) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) #b00000000000000000000000000000001)))))

(declare-fun b!128857 () Bool)

(assert (=> b!128857 (= e!84105 (bvslt (size!2493 (_keys!4541 newMap!16)) #b01111111111111111111111111111111))))

(declare-fun b!128855 () Bool)

(declare-fun res!62195 () Bool)

(assert (=> b!128855 (=> (not res!62195) (not e!84105))))

(assert (=> b!128855 (= res!62195 (not (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))))

(declare-fun d!39145 () Bool)

(assert (=> d!39145 e!84104))

(declare-fun res!62194 () Bool)

(assert (=> d!39145 (=> (not res!62194) (not e!84104))))

(assert (=> d!39145 (= res!62194 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 (_keys!4541 newMap!16)))))))

(declare-fun lt!66810 () Unit!3985)

(declare-fun choose!1 (array!4707 (_ BitVec 32) (_ BitVec 64)) Unit!3985)

(assert (=> d!39145 (= lt!66810 (choose!1 (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!39145 e!84105))

(declare-fun res!62196 () Bool)

(assert (=> d!39145 (=> (not res!62196) (not e!84105))))

(assert (=> d!39145 (= res!62196 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 (_keys!4541 newMap!16)))))))

(assert (=> d!39145 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!4541 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!66810)))

(assert (= (and d!39145 res!62196) b!128855))

(assert (= (and b!128855 res!62195) b!128856))

(assert (= (and b!128856 res!62193) b!128857))

(assert (= (and d!39145 res!62194) b!128858))

(assert (=> b!128856 m!149721))

(declare-fun m!151245 () Bool)

(assert (=> b!128856 m!151245))

(assert (=> b!128858 m!150153))

(assert (=> b!128858 m!150147))

(assert (=> b!128858 m!149889))

(declare-fun m!151247 () Bool)

(assert (=> b!128855 m!151247))

(assert (=> b!128855 m!151247))

(declare-fun m!151249 () Bool)

(assert (=> b!128855 m!151249))

(assert (=> d!39145 m!149721))

(declare-fun m!151251 () Bool)

(assert (=> d!39145 m!151251))

(assert (=> d!38841 d!39145))

(declare-fun d!39147 () Bool)

(declare-fun e!84107 () Bool)

(assert (=> d!39147 e!84107))

(declare-fun res!62197 () Bool)

(assert (=> d!39147 (=> res!62197 e!84107)))

(declare-fun lt!66811 () Bool)

(assert (=> d!39147 (= res!62197 (not lt!66811))))

(declare-fun lt!66814 () Bool)

(assert (=> d!39147 (= lt!66811 lt!66814)))

(declare-fun lt!66812 () Unit!3985)

(declare-fun e!84106 () Unit!3985)

(assert (=> d!39147 (= lt!66812 e!84106)))

(declare-fun c!23682 () Bool)

(assert (=> d!39147 (= c!23682 lt!66814)))

(assert (=> d!39147 (= lt!66814 (containsKey!172 (toList!835 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(assert (=> d!39147 (= (contains!869 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))) lt!66811)))

(declare-fun b!128859 () Bool)

(declare-fun lt!66813 () Unit!3985)

(assert (=> b!128859 (= e!84106 lt!66813)))

(assert (=> b!128859 (= lt!66813 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(assert (=> b!128859 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(declare-fun b!128860 () Bool)

(declare-fun Unit!4020 () Unit!3985)

(assert (=> b!128860 (= e!84106 Unit!4020)))

(declare-fun b!128861 () Bool)

(assert (=> b!128861 (= e!84107 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))))

(assert (= (and d!39147 c!23682) b!128859))

(assert (= (and d!39147 (not c!23682)) b!128860))

(assert (= (and d!39147 (not res!62197)) b!128861))

(assert (=> d!39147 m!150143))

(declare-fun m!151253 () Bool)

(assert (=> d!39147 m!151253))

(assert (=> b!128859 m!150143))

(declare-fun m!151255 () Bool)

(assert (=> b!128859 m!151255))

(assert (=> b!128859 m!150143))

(declare-fun m!151257 () Bool)

(assert (=> b!128859 m!151257))

(assert (=> b!128859 m!151257))

(declare-fun m!151259 () Bool)

(assert (=> b!128859 m!151259))

(assert (=> b!128861 m!150143))

(assert (=> b!128861 m!151257))

(assert (=> b!128861 m!151257))

(assert (=> b!128861 m!151259))

(assert (=> d!38841 d!39147))

(declare-fun d!39149 () Bool)

(declare-fun res!62198 () Bool)

(declare-fun e!84108 () Bool)

(assert (=> d!39149 (=> res!62198 e!84108)))

(assert (=> d!39149 (= res!62198 (= (select (arr!2228 lt!66436) #b00000000000000000000000000000000) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> d!39149 (= (arrayContainsKey!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000) e!84108)))

(declare-fun b!128862 () Bool)

(declare-fun e!84109 () Bool)

(assert (=> b!128862 (= e!84108 e!84109)))

(declare-fun res!62199 () Bool)

(assert (=> b!128862 (=> (not res!62199) (not e!84109))))

(assert (=> b!128862 (= res!62199 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 lt!66436)))))

(declare-fun b!128863 () Bool)

(assert (=> b!128863 (= e!84109 (arrayContainsKey!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39149 (not res!62198)) b!128862))

(assert (= (and b!128862 res!62199) b!128863))

(declare-fun m!151261 () Bool)

(assert (=> d!39149 m!151261))

(assert (=> b!128863 m!149721))

(declare-fun m!151263 () Bool)

(assert (=> b!128863 m!151263))

(assert (=> d!38841 d!39149))

(declare-fun d!39151 () Bool)

(declare-fun e!84112 () Bool)

(assert (=> d!39151 e!84112))

(declare-fun res!62202 () Bool)

(assert (=> d!39151 (=> (not res!62202) (not e!84112))))

(assert (=> d!39151 (= res!62202 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 (_keys!4541 newMap!16)))))))

(declare-fun lt!66817 () Unit!3985)

(declare-fun choose!41 (array!4707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1684) Unit!3985)

(assert (=> d!39151 (= lt!66817 (choose!41 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) lt!66433 lt!66412))))

(assert (=> d!39151 (bvslt (size!2493 (_keys!4541 newMap!16)) #b01111111111111111111111111111111)))

(assert (=> d!39151 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) lt!66433 lt!66412) lt!66817)))

(declare-fun b!128866 () Bool)

(assert (=> b!128866 (= e!84112 (arrayNoDuplicates!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) lt!66433 lt!66412))))

(assert (= (and d!39151 res!62202) b!128866))

(assert (=> d!39151 m!149721))

(declare-fun m!151265 () Bool)

(assert (=> d!39151 m!151265))

(assert (=> b!128866 m!150153))

(assert (=> b!128866 m!150137))

(assert (=> d!38841 d!39151))

(declare-fun b!128867 () Bool)

(declare-fun e!84115 () Bool)

(declare-fun e!84114 () Bool)

(assert (=> b!128867 (= e!84115 e!84114)))

(declare-fun lt!66818 () (_ BitVec 64))

(assert (=> b!128867 (= lt!66818 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000))))

(declare-fun lt!66820 () Unit!3985)

(assert (=> b!128867 (= lt!66820 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) lt!66818 #b00000000000000000000000000000000))))

(assert (=> b!128867 (arrayContainsKey!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) lt!66818 #b00000000000000000000000000000000)))

(declare-fun lt!66819 () Unit!3985)

(assert (=> b!128867 (= lt!66819 lt!66820)))

(declare-fun res!62203 () Bool)

(assert (=> b!128867 (= res!62203 (= (seekEntryOrOpen!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000) (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (mask!7072 newMap!16)) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!128867 (=> (not res!62203) (not e!84114))))

(declare-fun b!128868 () Bool)

(declare-fun call!13931 () Bool)

(assert (=> b!128868 (= e!84114 call!13931)))

(declare-fun d!39153 () Bool)

(declare-fun res!62204 () Bool)

(declare-fun e!84113 () Bool)

(assert (=> d!39153 (=> res!62204 e!84113)))

(assert (=> d!39153 (= res!62204 (bvsge #b00000000000000000000000000000000 (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(assert (=> d!39153 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (mask!7072 newMap!16)) e!84113)))

(declare-fun bm!13928 () Bool)

(assert (=> bm!13928 (= call!13931 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (mask!7072 newMap!16)))))

(declare-fun b!128869 () Bool)

(assert (=> b!128869 (= e!84113 e!84115)))

(declare-fun c!23683 () Bool)

(assert (=> b!128869 (= c!23683 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(declare-fun b!128870 () Bool)

(assert (=> b!128870 (= e!84115 call!13931)))

(assert (= (and d!39153 (not res!62204)) b!128869))

(assert (= (and b!128869 c!23683) b!128867))

(assert (= (and b!128869 (not c!23683)) b!128870))

(assert (= (and b!128867 res!62203) b!128868))

(assert (= (or b!128868 b!128870) bm!13928))

(assert (=> b!128867 m!151187))

(declare-fun m!151267 () Bool)

(assert (=> b!128867 m!151267))

(declare-fun m!151269 () Bool)

(assert (=> b!128867 m!151269))

(assert (=> b!128867 m!151187))

(declare-fun m!151271 () Bool)

(assert (=> b!128867 m!151271))

(declare-fun m!151273 () Bool)

(assert (=> bm!13928 m!151273))

(assert (=> b!128869 m!151187))

(assert (=> b!128869 m!151187))

(assert (=> b!128869 m!151191))

(assert (=> d!38841 d!39153))

(assert (=> d!38841 d!39083))

(declare-fun d!39155 () Bool)

(declare-fun e!84118 () Bool)

(assert (=> d!39155 e!84118))

(declare-fun res!62207 () Bool)

(assert (=> d!39155 (=> (not res!62207) (not e!84118))))

(assert (=> d!39155 (= res!62207 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 (_keys!4541 newMap!16))) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2494 (_values!2787 newMap!16)))))))

(declare-fun lt!66823 () Unit!3985)

(declare-fun choose!791 (array!4707 array!4709 (_ BitVec 32) (_ BitVec 32) V!3449 V!3449 (_ BitVec 32) (_ BitVec 64) V!3449 Int) Unit!3985)

(assert (=> d!39155 (= lt!66823 (choose!791 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)))))

(assert (=> d!39155 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39155 (= (lemmaAddValidKeyToArrayThenAddPairToListMap!38 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) lt!66823)))

(declare-fun b!128873 () Bool)

(assert (=> b!128873 (= e!84118 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))))

(assert (= (and d!39155 res!62207) b!128873))

(assert (=> d!39155 m!149721))

(assert (=> d!39155 m!149719))

(declare-fun m!151275 () Bool)

(assert (=> d!39155 m!151275))

(assert (=> d!39155 m!149963))

(assert (=> b!128873 m!149859))

(assert (=> b!128873 m!150135))

(assert (=> b!128873 m!150159))

(assert (=> b!128873 m!150153))

(assert (=> b!128873 m!150169))

(assert (=> b!128873 m!149859))

(assert (=> d!38841 d!39155))

(declare-fun d!39157 () Bool)

(assert (=> d!39157 (arrayContainsKey!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(declare-fun lt!66824 () Unit!3985)

(assert (=> d!39157 (= lt!66824 (choose!13 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(assert (=> d!39157 (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000)))

(assert (=> d!39157 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!66436 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))) lt!66824)))

(declare-fun bs!5361 () Bool)

(assert (= bs!5361 d!39157))

(assert (=> bs!5361 m!149721))

(assert (=> bs!5361 m!150165))

(assert (=> bs!5361 m!149721))

(declare-fun m!151277 () Bool)

(assert (=> bs!5361 m!151277))

(assert (=> d!38841 d!39157))

(assert (=> d!38841 d!38803))

(declare-fun d!39159 () Bool)

(assert (=> d!39159 (= (arrayCountValidKeys!0 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lt!66827 () Unit!3985)

(declare-fun choose!2 (array!4707 (_ BitVec 32)) Unit!3985)

(assert (=> d!39159 (= lt!66827 (choose!2 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))))))

(declare-fun e!84121 () Bool)

(assert (=> d!39159 e!84121))

(declare-fun res!62212 () Bool)

(assert (=> d!39159 (=> (not res!62212) (not e!84121))))

(assert (=> d!39159 (= res!62212 (and (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvslt (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (size!2493 lt!66418))))))

(assert (=> d!39159 (= (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202))) lt!66827)))

(declare-fun b!128878 () Bool)

(declare-fun res!62213 () Bool)

(assert (=> b!128878 (=> (not res!62213) (not e!84121))))

(assert (=> b!128878 (= res!62213 (validKeyInArray!0 (select (arr!2228 lt!66418) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(declare-fun b!128879 () Bool)

(assert (=> b!128879 (= e!84121 (bvslt (size!2493 lt!66418) #b01111111111111111111111111111111))))

(assert (= (and d!39159 res!62212) b!128878))

(assert (= (and b!128878 res!62213) b!128879))

(assert (=> d!39159 m!150171))

(declare-fun m!151279 () Bool)

(assert (=> d!39159 m!151279))

(declare-fun m!151281 () Bool)

(assert (=> b!128878 m!151281))

(assert (=> b!128878 m!151281))

(declare-fun m!151283 () Bool)

(assert (=> b!128878 m!151283))

(assert (=> d!38841 d!39159))

(declare-fun b!128880 () Bool)

(declare-fun e!84122 () (_ BitVec 32))

(declare-fun call!13932 () (_ BitVec 32))

(assert (=> b!128880 (= e!84122 (bvadd #b00000000000000000000000000000001 call!13932))))

(declare-fun b!128881 () Bool)

(declare-fun e!84123 () (_ BitVec 32))

(assert (=> b!128881 (= e!84123 #b00000000000000000000000000000000)))

(declare-fun bm!13929 () Bool)

(assert (=> bm!13929 (= call!13932 (arrayCountValidKeys!0 lt!66418 (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)))))

(declare-fun d!39161 () Bool)

(declare-fun lt!66828 () (_ BitVec 32))

(assert (=> d!39161 (and (bvsge lt!66828 #b00000000000000000000000000000000) (bvsle lt!66828 (bvsub (size!2493 lt!66418) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(assert (=> d!39161 (= lt!66828 e!84123)))

(declare-fun c!23685 () Bool)

(assert (=> d!39161 (= c!23685 (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)))))

(assert (=> d!39161 (and (bvsle (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)) (bvsge (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000000) (bvsle (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001) (size!2493 lt!66418)))))

(assert (=> d!39161 (= (arrayCountValidKeys!0 lt!66418 (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (bvadd (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) #b00000000000000000000000000000001)) lt!66828)))

(declare-fun b!128882 () Bool)

(assert (=> b!128882 (= e!84122 call!13932)))

(declare-fun b!128883 () Bool)

(assert (=> b!128883 (= e!84123 e!84122)))

(declare-fun c!23684 () Bool)

(assert (=> b!128883 (= c!23684 (validKeyInArray!0 (select (arr!2228 lt!66418) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)))))))

(assert (= (and d!39161 c!23685) b!128881))

(assert (= (and d!39161 (not c!23685)) b!128883))

(assert (= (and b!128883 c!23684) b!128880))

(assert (= (and b!128883 (not c!23684)) b!128882))

(assert (= (or b!128880 b!128882) bm!13929))

(declare-fun m!151285 () Bool)

(assert (=> bm!13929 m!151285))

(assert (=> b!128883 m!151281))

(assert (=> b!128883 m!151281))

(assert (=> b!128883 m!151283))

(assert (=> d!38841 d!39161))

(declare-fun b!128884 () Bool)

(declare-fun e!84124 () (_ BitVec 32))

(declare-fun call!13933 () (_ BitVec 32))

(assert (=> b!128884 (= e!84124 (bvadd #b00000000000000000000000000000001 call!13933))))

(declare-fun b!128885 () Bool)

(declare-fun e!84125 () (_ BitVec 32))

(assert (=> b!128885 (= e!84125 #b00000000000000000000000000000000)))

(declare-fun bm!13930 () Bool)

(assert (=> bm!13930 (= call!13933 (arrayCountValidKeys!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun lt!66829 () (_ BitVec 32))

(declare-fun d!39163 () Bool)

(assert (=> d!39163 (and (bvsge lt!66829 #b00000000000000000000000000000000) (bvsle lt!66829 (bvsub (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (=> d!39163 (= lt!66829 e!84125)))

(declare-fun c!23687 () Bool)

(assert (=> d!39163 (= c!23687 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39163 (and (bvsle #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2493 (_keys!4541 newMap!16)) (size!2493 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))))))))

(assert (=> d!39163 (= (arrayCountValidKeys!0 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16))) #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) lt!66829)))

(declare-fun b!128886 () Bool)

(assert (=> b!128886 (= e!84124 call!13933)))

(declare-fun b!128887 () Bool)

(assert (=> b!128887 (= e!84125 e!84124)))

(declare-fun c!23686 () Bool)

(assert (=> b!128887 (= c!23686 (validKeyInArray!0 (select (arr!2228 (array!4708 (store (arr!2228 (_keys!4541 newMap!16)) (ite c!23470 (index!3219 lt!66202) (index!3216 lt!66202)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (size!2493 (_keys!4541 newMap!16)))) #b00000000000000000000000000000000)))))

(assert (= (and d!39163 c!23687) b!128885))

(assert (= (and d!39163 (not c!23687)) b!128887))

(assert (= (and b!128887 c!23686) b!128884))

(assert (= (and b!128887 (not c!23686)) b!128886))

(assert (= (or b!128884 b!128886) bm!13930))

(declare-fun m!151287 () Bool)

(assert (=> bm!13930 m!151287))

(assert (=> b!128887 m!151187))

(assert (=> b!128887 m!151187))

(assert (=> b!128887 m!151191))

(assert (=> d!38841 d!39163))

(declare-fun bm!13931 () Bool)

(declare-fun call!13940 () ListLongMap!1639)

(declare-fun call!13937 () ListLongMap!1639)

(assert (=> bm!13931 (= call!13940 call!13937)))

(declare-fun b!128888 () Bool)

(declare-fun res!62220 () Bool)

(declare-fun e!84127 () Bool)

(assert (=> b!128888 (=> (not res!62220) (not e!84127))))

(declare-fun e!84136 () Bool)

(assert (=> b!128888 (= res!62220 e!84136)))

(declare-fun c!23691 () Bool)

(assert (=> b!128888 (= c!23691 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128889 () Bool)

(declare-fun e!84130 () Bool)

(assert (=> b!128889 (= e!84130 (validKeyInArray!0 (select (arr!2228 lt!66430) #b00000000000000000000000000000000)))))

(declare-fun b!128890 () Bool)

(declare-fun e!84132 () ListLongMap!1639)

(declare-fun e!84137 () ListLongMap!1639)

(assert (=> b!128890 (= e!84132 e!84137)))

(declare-fun c!23693 () Bool)

(assert (=> b!128890 (= c!23693 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128891 () Bool)

(declare-fun call!13938 () Bool)

(assert (=> b!128891 (= e!84136 (not call!13938))))

(declare-fun bm!13932 () Bool)

(declare-fun lt!66851 () ListLongMap!1639)

(assert (=> bm!13932 (= call!13938 (contains!869 lt!66851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13933 () Bool)

(declare-fun call!13935 () ListLongMap!1639)

(declare-fun call!13939 () ListLongMap!1639)

(assert (=> bm!13933 (= call!13935 call!13939)))

(declare-fun b!128892 () Bool)

(declare-fun e!84134 () Bool)

(assert (=> b!128892 (= e!84134 (validKeyInArray!0 (select (arr!2228 lt!66430) #b00000000000000000000000000000000)))))

(declare-fun b!128893 () Bool)

(declare-fun e!84126 () Bool)

(assert (=> b!128893 (= e!84126 (= (apply!112 lt!66851 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128894 () Bool)

(assert (=> b!128894 (= e!84136 e!84126)))

(declare-fun res!62215 () Bool)

(assert (=> b!128894 (= res!62215 call!13938)))

(assert (=> b!128894 (=> (not res!62215) (not e!84126))))

(declare-fun d!39165 () Bool)

(assert (=> d!39165 e!84127))

(declare-fun res!62216 () Bool)

(assert (=> d!39165 (=> (not res!62216) (not e!84127))))

(assert (=> d!39165 (= res!62216 (or (bvsge #b00000000000000000000000000000000 (size!2493 lt!66430)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 lt!66430)))))))

(declare-fun lt!66839 () ListLongMap!1639)

(assert (=> d!39165 (= lt!66851 lt!66839)))

(declare-fun lt!66843 () Unit!3985)

(declare-fun e!84133 () Unit!3985)

(assert (=> d!39165 (= lt!66843 e!84133)))

(declare-fun c!23692 () Bool)

(assert (=> d!39165 (= c!23692 e!84130)))

(declare-fun res!62217 () Bool)

(assert (=> d!39165 (=> (not res!62217) (not e!84130))))

(assert (=> d!39165 (= res!62217 (bvslt #b00000000000000000000000000000000 (size!2493 lt!66430)))))

(assert (=> d!39165 (= lt!66839 e!84132)))

(declare-fun c!23689 () Bool)

(assert (=> d!39165 (= c!23689 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39165 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39165 (= (getCurrentListMap!514 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66851)))

(declare-fun b!128895 () Bool)

(declare-fun Unit!4021 () Unit!3985)

(assert (=> b!128895 (= e!84133 Unit!4021)))

(declare-fun bm!13934 () Bool)

(declare-fun call!13934 () Bool)

(assert (=> bm!13934 (= call!13934 (contains!869 lt!66851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128896 () Bool)

(declare-fun e!84129 () ListLongMap!1639)

(assert (=> b!128896 (= e!84129 call!13940)))

(declare-fun b!128897 () Bool)

(declare-fun e!84128 () Bool)

(assert (=> b!128897 (= e!84128 (not call!13934))))

(declare-fun b!128898 () Bool)

(declare-fun e!84131 () Bool)

(declare-fun e!84135 () Bool)

(assert (=> b!128898 (= e!84131 e!84135)))

(declare-fun res!62221 () Bool)

(assert (=> b!128898 (=> (not res!62221) (not e!84135))))

(assert (=> b!128898 (= res!62221 (contains!869 lt!66851 (select (arr!2228 lt!66430) #b00000000000000000000000000000000)))))

(assert (=> b!128898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 lt!66430)))))

(declare-fun call!13936 () ListLongMap!1639)

(declare-fun bm!13935 () Bool)

(assert (=> bm!13935 (= call!13936 (getCurrentListMapNoExtraKeys!132 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128899 () Bool)

(assert (=> b!128899 (= e!84132 (+!165 call!13937 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13936 () Bool)

(assert (=> bm!13936 (= call!13939 call!13936)))

(declare-fun b!128900 () Bool)

(assert (=> b!128900 (= e!84127 e!84128)))

(declare-fun c!23690 () Bool)

(assert (=> b!128900 (= c!23690 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128901 () Bool)

(assert (=> b!128901 (= e!84135 (= (apply!112 lt!66851 (select (arr!2228 lt!66430) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 lt!66429) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 lt!66429)))))

(assert (=> b!128901 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 lt!66430)))))

(declare-fun b!128902 () Bool)

(declare-fun res!62222 () Bool)

(assert (=> b!128902 (=> (not res!62222) (not e!84127))))

(assert (=> b!128902 (= res!62222 e!84131)))

(declare-fun res!62214 () Bool)

(assert (=> b!128902 (=> res!62214 e!84131)))

(assert (=> b!128902 (= res!62214 (not e!84134))))

(declare-fun res!62219 () Bool)

(assert (=> b!128902 (=> (not res!62219) (not e!84134))))

(assert (=> b!128902 (= res!62219 (bvslt #b00000000000000000000000000000000 (size!2493 lt!66430)))))

(declare-fun bm!13937 () Bool)

(assert (=> bm!13937 (= call!13937 (+!165 (ite c!23689 call!13936 (ite c!23693 call!13939 call!13935)) (ite (or c!23689 c!23693) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!128903 () Bool)

(declare-fun lt!66830 () Unit!3985)

(assert (=> b!128903 (= e!84133 lt!66830)))

(declare-fun lt!66832 () ListLongMap!1639)

(assert (=> b!128903 (= lt!66832 (getCurrentListMapNoExtraKeys!132 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66836 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66836 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66833 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66833 (select (arr!2228 lt!66430) #b00000000000000000000000000000000))))

(declare-fun lt!66850 () Unit!3985)

(assert (=> b!128903 (= lt!66850 (addStillContains!88 lt!66832 lt!66836 (zeroValue!2665 newMap!16) lt!66833))))

(assert (=> b!128903 (contains!869 (+!165 lt!66832 (tuple2!2537 lt!66836 (zeroValue!2665 newMap!16))) lt!66833)))

(declare-fun lt!66837 () Unit!3985)

(assert (=> b!128903 (= lt!66837 lt!66850)))

(declare-fun lt!66849 () ListLongMap!1639)

(assert (=> b!128903 (= lt!66849 (getCurrentListMapNoExtraKeys!132 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66835 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66835 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66844 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66844 (select (arr!2228 lt!66430) #b00000000000000000000000000000000))))

(declare-fun lt!66845 () Unit!3985)

(assert (=> b!128903 (= lt!66845 (addApplyDifferent!88 lt!66849 lt!66835 (minValue!2665 newMap!16) lt!66844))))

(assert (=> b!128903 (= (apply!112 (+!165 lt!66849 (tuple2!2537 lt!66835 (minValue!2665 newMap!16))) lt!66844) (apply!112 lt!66849 lt!66844))))

(declare-fun lt!66841 () Unit!3985)

(assert (=> b!128903 (= lt!66841 lt!66845)))

(declare-fun lt!66846 () ListLongMap!1639)

(assert (=> b!128903 (= lt!66846 (getCurrentListMapNoExtraKeys!132 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66847 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66838 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66838 (select (arr!2228 lt!66430) #b00000000000000000000000000000000))))

(declare-fun lt!66840 () Unit!3985)

(assert (=> b!128903 (= lt!66840 (addApplyDifferent!88 lt!66846 lt!66847 (zeroValue!2665 newMap!16) lt!66838))))

(assert (=> b!128903 (= (apply!112 (+!165 lt!66846 (tuple2!2537 lt!66847 (zeroValue!2665 newMap!16))) lt!66838) (apply!112 lt!66846 lt!66838))))

(declare-fun lt!66834 () Unit!3985)

(assert (=> b!128903 (= lt!66834 lt!66840)))

(declare-fun lt!66848 () ListLongMap!1639)

(assert (=> b!128903 (= lt!66848 (getCurrentListMapNoExtraKeys!132 lt!66430 lt!66429 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66842 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66842 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66831 () (_ BitVec 64))

(assert (=> b!128903 (= lt!66831 (select (arr!2228 lt!66430) #b00000000000000000000000000000000))))

(assert (=> b!128903 (= lt!66830 (addApplyDifferent!88 lt!66848 lt!66842 (minValue!2665 newMap!16) lt!66831))))

(assert (=> b!128903 (= (apply!112 (+!165 lt!66848 (tuple2!2537 lt!66842 (minValue!2665 newMap!16))) lt!66831) (apply!112 lt!66848 lt!66831))))

(declare-fun b!128904 () Bool)

(assert (=> b!128904 (= e!84129 call!13935)))

(declare-fun b!128905 () Bool)

(declare-fun e!84138 () Bool)

(assert (=> b!128905 (= e!84138 (= (apply!112 lt!66851 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!128906 () Bool)

(assert (=> b!128906 (= e!84137 call!13940)))

(declare-fun b!128907 () Bool)

(declare-fun c!23688 () Bool)

(assert (=> b!128907 (= c!23688 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128907 (= e!84137 e!84129)))

(declare-fun b!128908 () Bool)

(assert (=> b!128908 (= e!84128 e!84138)))

(declare-fun res!62218 () Bool)

(assert (=> b!128908 (= res!62218 call!13934)))

(assert (=> b!128908 (=> (not res!62218) (not e!84138))))

(assert (= (and d!39165 c!23689) b!128899))

(assert (= (and d!39165 (not c!23689)) b!128890))

(assert (= (and b!128890 c!23693) b!128906))

(assert (= (and b!128890 (not c!23693)) b!128907))

(assert (= (and b!128907 c!23688) b!128896))

(assert (= (and b!128907 (not c!23688)) b!128904))

(assert (= (or b!128896 b!128904) bm!13933))

(assert (= (or b!128906 bm!13933) bm!13936))

(assert (= (or b!128906 b!128896) bm!13931))

(assert (= (or b!128899 bm!13936) bm!13935))

(assert (= (or b!128899 bm!13931) bm!13937))

(assert (= (and d!39165 res!62217) b!128889))

(assert (= (and d!39165 c!23692) b!128903))

(assert (= (and d!39165 (not c!23692)) b!128895))

(assert (= (and d!39165 res!62216) b!128902))

(assert (= (and b!128902 res!62219) b!128892))

(assert (= (and b!128902 (not res!62214)) b!128898))

(assert (= (and b!128898 res!62221) b!128901))

(assert (= (and b!128902 res!62222) b!128888))

(assert (= (and b!128888 c!23691) b!128894))

(assert (= (and b!128888 (not c!23691)) b!128891))

(assert (= (and b!128894 res!62215) b!128893))

(assert (= (or b!128894 b!128891) bm!13932))

(assert (= (and b!128888 res!62220) b!128900))

(assert (= (and b!128900 c!23690) b!128908))

(assert (= (and b!128900 (not c!23690)) b!128897))

(assert (= (and b!128908 res!62218) b!128905))

(assert (= (or b!128908 b!128897) bm!13934))

(declare-fun b_lambda!5711 () Bool)

(assert (=> (not b_lambda!5711) (not b!128901)))

(assert (=> b!128901 t!6065))

(declare-fun b_and!7973 () Bool)

(assert (= b_and!7969 (and (=> t!6065 result!3889) b_and!7973)))

(assert (=> b!128901 t!6067))

(declare-fun b_and!7975 () Bool)

(assert (= b_and!7971 (and (=> t!6067 result!3891) b_and!7975)))

(declare-fun m!151289 () Bool)

(assert (=> bm!13932 m!151289))

(declare-fun m!151291 () Bool)

(assert (=> bm!13935 m!151291))

(declare-fun m!151293 () Bool)

(assert (=> b!128898 m!151293))

(assert (=> b!128898 m!151293))

(declare-fun m!151295 () Bool)

(assert (=> b!128898 m!151295))

(assert (=> d!39165 m!149963))

(assert (=> b!128892 m!151293))

(assert (=> b!128892 m!151293))

(declare-fun m!151297 () Bool)

(assert (=> b!128892 m!151297))

(assert (=> b!128889 m!151293))

(assert (=> b!128889 m!151293))

(assert (=> b!128889 m!151297))

(declare-fun m!151299 () Bool)

(assert (=> b!128899 m!151299))

(declare-fun m!151301 () Bool)

(assert (=> bm!13934 m!151301))

(declare-fun m!151303 () Bool)

(assert (=> b!128905 m!151303))

(declare-fun m!151305 () Bool)

(assert (=> b!128903 m!151305))

(declare-fun m!151307 () Bool)

(assert (=> b!128903 m!151307))

(declare-fun m!151309 () Bool)

(assert (=> b!128903 m!151309))

(declare-fun m!151311 () Bool)

(assert (=> b!128903 m!151311))

(declare-fun m!151313 () Bool)

(assert (=> b!128903 m!151313))

(declare-fun m!151315 () Bool)

(assert (=> b!128903 m!151315))

(declare-fun m!151317 () Bool)

(assert (=> b!128903 m!151317))

(declare-fun m!151319 () Bool)

(assert (=> b!128903 m!151319))

(declare-fun m!151321 () Bool)

(assert (=> b!128903 m!151321))

(assert (=> b!128903 m!151309))

(declare-fun m!151323 () Bool)

(assert (=> b!128903 m!151323))

(declare-fun m!151325 () Bool)

(assert (=> b!128903 m!151325))

(declare-fun m!151327 () Bool)

(assert (=> b!128903 m!151327))

(declare-fun m!151329 () Bool)

(assert (=> b!128903 m!151329))

(assert (=> b!128903 m!151319))

(declare-fun m!151331 () Bool)

(assert (=> b!128903 m!151331))

(declare-fun m!151333 () Bool)

(assert (=> b!128903 m!151333))

(assert (=> b!128903 m!151293))

(assert (=> b!128903 m!151313))

(assert (=> b!128903 m!151327))

(assert (=> b!128903 m!151291))

(declare-fun m!151335 () Bool)

(assert (=> b!128893 m!151335))

(declare-fun m!151337 () Bool)

(assert (=> bm!13937 m!151337))

(assert (=> b!128901 m!151293))

(assert (=> b!128901 m!151293))

(declare-fun m!151339 () Bool)

(assert (=> b!128901 m!151339))

(declare-fun m!151341 () Bool)

(assert (=> b!128901 m!151341))

(assert (=> b!128901 m!150011))

(declare-fun m!151343 () Bool)

(assert (=> b!128901 m!151343))

(assert (=> b!128901 m!151341))

(assert (=> b!128901 m!150011))

(assert (=> d!38841 d!39165))

(assert (=> d!38841 d!38863))

(declare-fun d!39167 () Bool)

(declare-fun e!84139 () Bool)

(assert (=> d!39167 e!84139))

(declare-fun res!62224 () Bool)

(assert (=> d!39167 (=> (not res!62224) (not e!84139))))

(declare-fun lt!66852 () ListLongMap!1639)

(assert (=> d!39167 (= res!62224 (contains!869 lt!66852 (_1!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun lt!66854 () List!1682)

(assert (=> d!39167 (= lt!66852 (ListLongMap!1640 lt!66854))))

(declare-fun lt!66853 () Unit!3985)

(declare-fun lt!66855 () Unit!3985)

(assert (=> d!39167 (= lt!66853 lt!66855)))

(assert (=> d!39167 (= (getValueByKey!169 lt!66854 (_1!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39167 (= lt!66855 (lemmaContainsTupThenGetReturnValue!84 lt!66854 (_1!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39167 (= lt!66854 (insertStrictlySorted!87 (toList!835 (ite c!23498 call!13841 (ite c!23502 call!13844 call!13840))) (_1!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (_2!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(assert (=> d!39167 (= (+!165 (ite c!23498 call!13841 (ite c!23502 call!13844 call!13840)) (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) lt!66852)))

(declare-fun b!128909 () Bool)

(declare-fun res!62223 () Bool)

(assert (=> b!128909 (=> (not res!62223) (not e!84139))))

(assert (=> b!128909 (= res!62223 (= (getValueByKey!169 (toList!835 lt!66852) (_1!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))))

(declare-fun b!128910 () Bool)

(assert (=> b!128910 (= e!84139 (contains!871 (toList!835 lt!66852) (ite (or c!23498 c!23502) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (= (and d!39167 res!62224) b!128909))

(assert (= (and b!128909 res!62223) b!128910))

(declare-fun m!151345 () Bool)

(assert (=> d!39167 m!151345))

(declare-fun m!151347 () Bool)

(assert (=> d!39167 m!151347))

(declare-fun m!151349 () Bool)

(assert (=> d!39167 m!151349))

(declare-fun m!151351 () Bool)

(assert (=> d!39167 m!151351))

(declare-fun m!151353 () Bool)

(assert (=> b!128909 m!151353))

(declare-fun m!151355 () Bool)

(assert (=> b!128910 m!151355))

(assert (=> bm!13842 d!39167))

(declare-fun d!39169 () Bool)

(declare-fun e!84140 () Bool)

(assert (=> d!39169 e!84140))

(declare-fun res!62226 () Bool)

(assert (=> d!39169 (=> (not res!62226) (not e!84140))))

(declare-fun lt!66856 () ListLongMap!1639)

(assert (=> d!39169 (= res!62226 (contains!869 lt!66856 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66858 () List!1682)

(assert (=> d!39169 (= lt!66856 (ListLongMap!1640 lt!66858))))

(declare-fun lt!66857 () Unit!3985)

(declare-fun lt!66859 () Unit!3985)

(assert (=> d!39169 (= lt!66857 lt!66859)))

(assert (=> d!39169 (= (getValueByKey!169 lt!66858 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39169 (= lt!66859 (lemmaContainsTupThenGetReturnValue!84 lt!66858 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39169 (= lt!66858 (insertStrictlySorted!87 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39169 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66856)))

(declare-fun b!128911 () Bool)

(declare-fun res!62225 () Bool)

(assert (=> b!128911 (=> (not res!62225) (not e!84140))))

(assert (=> b!128911 (= res!62225 (= (getValueByKey!169 (toList!835 lt!66856) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128912 () Bool)

(assert (=> b!128912 (= e!84140 (contains!871 (toList!835 lt!66856) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39169 res!62226) b!128911))

(assert (= (and b!128911 res!62225) b!128912))

(declare-fun m!151357 () Bool)

(assert (=> d!39169 m!151357))

(declare-fun m!151359 () Bool)

(assert (=> d!39169 m!151359))

(declare-fun m!151361 () Bool)

(assert (=> d!39169 m!151361))

(declare-fun m!151363 () Bool)

(assert (=> d!39169 m!151363))

(declare-fun m!151365 () Bool)

(assert (=> b!128911 m!151365))

(declare-fun m!151367 () Bool)

(assert (=> b!128912 m!151367))

(assert (=> d!38891 d!39169))

(assert (=> d!38891 d!38803))

(assert (=> d!38891 d!38921))

(declare-fun bm!13938 () Bool)

(declare-fun call!13947 () ListLongMap!1639)

(declare-fun call!13944 () ListLongMap!1639)

(assert (=> bm!13938 (= call!13947 call!13944)))

(declare-fun b!128913 () Bool)

(declare-fun res!62233 () Bool)

(declare-fun e!84142 () Bool)

(assert (=> b!128913 (=> (not res!62233) (not e!84142))))

(declare-fun e!84151 () Bool)

(assert (=> b!128913 (= res!62233 e!84151)))

(declare-fun c!23697 () Bool)

(assert (=> b!128913 (= c!23697 (not (= (bvand lt!66185 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!128914 () Bool)

(declare-fun e!84145 () Bool)

(assert (=> b!128914 (= e!84145 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128915 () Bool)

(declare-fun e!84147 () ListLongMap!1639)

(declare-fun e!84152 () ListLongMap!1639)

(assert (=> b!128915 (= e!84147 e!84152)))

(declare-fun c!23699 () Bool)

(assert (=> b!128915 (= c!23699 (and (not (= (bvand lt!66185 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand lt!66185 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128916 () Bool)

(declare-fun call!13945 () Bool)

(assert (=> b!128916 (= e!84151 (not call!13945))))

(declare-fun bm!13939 () Bool)

(declare-fun lt!66881 () ListLongMap!1639)

(assert (=> bm!13939 (= call!13945 (contains!869 lt!66881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13940 () Bool)

(declare-fun call!13942 () ListLongMap!1639)

(declare-fun call!13946 () ListLongMap!1639)

(assert (=> bm!13940 (= call!13942 call!13946)))

(declare-fun b!128917 () Bool)

(declare-fun e!84149 () Bool)

(assert (=> b!128917 (= e!84149 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!128918 () Bool)

(declare-fun e!84141 () Bool)

(assert (=> b!128918 (= e!84141 (= (apply!112 lt!66881 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!128919 () Bool)

(assert (=> b!128919 (= e!84151 e!84141)))

(declare-fun res!62228 () Bool)

(assert (=> b!128919 (= res!62228 call!13945)))

(assert (=> b!128919 (=> (not res!62228) (not e!84141))))

(declare-fun d!39171 () Bool)

(assert (=> d!39171 e!84142))

(declare-fun res!62229 () Bool)

(assert (=> d!39171 (=> (not res!62229) (not e!84142))))

(assert (=> d!39171 (= res!62229 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!66869 () ListLongMap!1639)

(assert (=> d!39171 (= lt!66881 lt!66869)))

(declare-fun lt!66873 () Unit!3985)

(declare-fun e!84148 () Unit!3985)

(assert (=> d!39171 (= lt!66873 e!84148)))

(declare-fun c!23698 () Bool)

(assert (=> d!39171 (= c!23698 e!84145)))

(declare-fun res!62230 () Bool)

(assert (=> d!39171 (=> (not res!62230) (not e!84145))))

(assert (=> d!39171 (= res!62230 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39171 (= lt!66869 e!84147)))

(declare-fun c!23695 () Bool)

(assert (=> d!39171 (= c!23695 (and (not (= (bvand lt!66185 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!66185 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39171 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39171 (= (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66881)))

(declare-fun b!128920 () Bool)

(declare-fun Unit!4022 () Unit!3985)

(assert (=> b!128920 (= e!84148 Unit!4022)))

(declare-fun bm!13941 () Bool)

(declare-fun call!13941 () Bool)

(assert (=> bm!13941 (= call!13941 (contains!869 lt!66881 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128921 () Bool)

(declare-fun e!84144 () ListLongMap!1639)

(assert (=> b!128921 (= e!84144 call!13947)))

(declare-fun b!128922 () Bool)

(declare-fun e!84143 () Bool)

(assert (=> b!128922 (= e!84143 (not call!13941))))

(declare-fun b!128923 () Bool)

(declare-fun e!84146 () Bool)

(declare-fun e!84150 () Bool)

(assert (=> b!128923 (= e!84146 e!84150)))

(declare-fun res!62234 () Bool)

(assert (=> b!128923 (=> (not res!62234) (not e!84150))))

(assert (=> b!128923 (= res!62234 (contains!869 lt!66881 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!128923 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun call!13943 () ListLongMap!1639)

(declare-fun bm!13942 () Bool)

(assert (=> bm!13942 (= call!13943 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!128924 () Bool)

(assert (=> b!128924 (= e!84147 (+!165 call!13944 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!13943 () Bool)

(assert (=> bm!13943 (= call!13946 call!13943)))

(declare-fun b!128925 () Bool)

(assert (=> b!128925 (= e!84142 e!84143)))

(declare-fun c!23696 () Bool)

(assert (=> b!128925 (= c!23696 (not (= (bvand lt!66185 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!128926 () Bool)

(assert (=> b!128926 (= e!84150 (= (apply!112 lt!66881 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!128926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (_values!2787 newMap!16))))))

(assert (=> b!128926 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!128927 () Bool)

(declare-fun res!62235 () Bool)

(assert (=> b!128927 (=> (not res!62235) (not e!84142))))

(assert (=> b!128927 (= res!62235 e!84146)))

(declare-fun res!62227 () Bool)

(assert (=> b!128927 (=> res!62227 e!84146)))

(assert (=> b!128927 (= res!62227 (not e!84149))))

(declare-fun res!62232 () Bool)

(assert (=> b!128927 (=> (not res!62232) (not e!84149))))

(assert (=> b!128927 (= res!62232 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13944 () Bool)

(assert (=> bm!13944 (= call!13944 (+!165 (ite c!23695 call!13943 (ite c!23699 call!13946 call!13942)) (ite (or c!23695 c!23699) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!128928 () Bool)

(declare-fun lt!66860 () Unit!3985)

(assert (=> b!128928 (= e!84148 lt!66860)))

(declare-fun lt!66862 () ListLongMap!1639)

(assert (=> b!128928 (= lt!66862 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66866 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66863 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66863 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66880 () Unit!3985)

(assert (=> b!128928 (= lt!66880 (addStillContains!88 lt!66862 lt!66866 (zeroValue!2665 newMap!16) lt!66863))))

(assert (=> b!128928 (contains!869 (+!165 lt!66862 (tuple2!2537 lt!66866 (zeroValue!2665 newMap!16))) lt!66863)))

(declare-fun lt!66867 () Unit!3985)

(assert (=> b!128928 (= lt!66867 lt!66880)))

(declare-fun lt!66879 () ListLongMap!1639)

(assert (=> b!128928 (= lt!66879 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66865 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66865 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66874 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66874 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66875 () Unit!3985)

(assert (=> b!128928 (= lt!66875 (addApplyDifferent!88 lt!66879 lt!66865 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66874))))

(assert (=> b!128928 (= (apply!112 (+!165 lt!66879 (tuple2!2537 lt!66865 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66874) (apply!112 lt!66879 lt!66874))))

(declare-fun lt!66871 () Unit!3985)

(assert (=> b!128928 (= lt!66871 lt!66875)))

(declare-fun lt!66876 () ListLongMap!1639)

(assert (=> b!128928 (= lt!66876 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66877 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66868 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66868 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!66870 () Unit!3985)

(assert (=> b!128928 (= lt!66870 (addApplyDifferent!88 lt!66876 lt!66877 (zeroValue!2665 newMap!16) lt!66868))))

(assert (=> b!128928 (= (apply!112 (+!165 lt!66876 (tuple2!2537 lt!66877 (zeroValue!2665 newMap!16))) lt!66868) (apply!112 lt!66876 lt!66868))))

(declare-fun lt!66864 () Unit!3985)

(assert (=> b!128928 (= lt!66864 lt!66870)))

(declare-fun lt!66878 () ListLongMap!1639)

(assert (=> b!128928 (= lt!66878 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!66872 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66861 () (_ BitVec 64))

(assert (=> b!128928 (= lt!66861 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!128928 (= lt!66860 (addApplyDifferent!88 lt!66878 lt!66872 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) lt!66861))))

(assert (=> b!128928 (= (apply!112 (+!165 lt!66878 (tuple2!2537 lt!66872 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66861) (apply!112 lt!66878 lt!66861))))

(declare-fun b!128929 () Bool)

(assert (=> b!128929 (= e!84144 call!13942)))

(declare-fun e!84153 () Bool)

(declare-fun b!128930 () Bool)

(assert (=> b!128930 (= e!84153 (= (apply!112 lt!66881 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!128931 () Bool)

(assert (=> b!128931 (= e!84152 call!13947)))

(declare-fun b!128932 () Bool)

(declare-fun c!23694 () Bool)

(assert (=> b!128932 (= c!23694 (and (not (= (bvand lt!66185 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand lt!66185 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!128932 (= e!84152 e!84144)))

(declare-fun b!128933 () Bool)

(assert (=> b!128933 (= e!84143 e!84153)))

(declare-fun res!62231 () Bool)

(assert (=> b!128933 (= res!62231 call!13941)))

(assert (=> b!128933 (=> (not res!62231) (not e!84153))))

(assert (= (and d!39171 c!23695) b!128924))

(assert (= (and d!39171 (not c!23695)) b!128915))

(assert (= (and b!128915 c!23699) b!128931))

(assert (= (and b!128915 (not c!23699)) b!128932))

(assert (= (and b!128932 c!23694) b!128921))

(assert (= (and b!128932 (not c!23694)) b!128929))

(assert (= (or b!128921 b!128929) bm!13940))

(assert (= (or b!128931 bm!13940) bm!13943))

(assert (= (or b!128931 b!128921) bm!13938))

(assert (= (or b!128924 bm!13943) bm!13942))

(assert (= (or b!128924 bm!13938) bm!13944))

(assert (= (and d!39171 res!62230) b!128914))

(assert (= (and d!39171 c!23698) b!128928))

(assert (= (and d!39171 (not c!23698)) b!128920))

(assert (= (and d!39171 res!62229) b!128927))

(assert (= (and b!128927 res!62232) b!128917))

(assert (= (and b!128927 (not res!62227)) b!128923))

(assert (= (and b!128923 res!62234) b!128926))

(assert (= (and b!128927 res!62235) b!128913))

(assert (= (and b!128913 c!23697) b!128919))

(assert (= (and b!128913 (not c!23697)) b!128916))

(assert (= (and b!128919 res!62228) b!128918))

(assert (= (or b!128919 b!128916) bm!13939))

(assert (= (and b!128913 res!62233) b!128925))

(assert (= (and b!128925 c!23696) b!128933))

(assert (= (and b!128925 (not c!23696)) b!128922))

(assert (= (and b!128933 res!62231) b!128930))

(assert (= (or b!128933 b!128922) bm!13941))

(declare-fun b_lambda!5713 () Bool)

(assert (=> (not b_lambda!5713) (not b!128926)))

(assert (=> b!128926 t!6065))

(declare-fun b_and!7977 () Bool)

(assert (= b_and!7973 (and (=> t!6065 result!3889) b_and!7977)))

(assert (=> b!128926 t!6067))

(declare-fun b_and!7979 () Bool)

(assert (= b_and!7975 (and (=> t!6067 result!3891) b_and!7979)))

(declare-fun m!151369 () Bool)

(assert (=> bm!13939 m!151369))

(assert (=> bm!13942 m!149719))

(declare-fun m!151371 () Bool)

(assert (=> bm!13942 m!151371))

(assert (=> b!128923 m!149959))

(assert (=> b!128923 m!149959))

(declare-fun m!151373 () Bool)

(assert (=> b!128923 m!151373))

(assert (=> d!39171 m!149963))

(assert (=> b!128917 m!149959))

(assert (=> b!128917 m!149959))

(assert (=> b!128917 m!149965))

(assert (=> b!128914 m!149959))

(assert (=> b!128914 m!149959))

(assert (=> b!128914 m!149965))

(declare-fun m!151375 () Bool)

(assert (=> b!128924 m!151375))

(declare-fun m!151377 () Bool)

(assert (=> bm!13941 m!151377))

(declare-fun m!151379 () Bool)

(assert (=> b!128930 m!151379))

(declare-fun m!151381 () Bool)

(assert (=> b!128928 m!151381))

(declare-fun m!151383 () Bool)

(assert (=> b!128928 m!151383))

(declare-fun m!151385 () Bool)

(assert (=> b!128928 m!151385))

(declare-fun m!151387 () Bool)

(assert (=> b!128928 m!151387))

(declare-fun m!151389 () Bool)

(assert (=> b!128928 m!151389))

(declare-fun m!151391 () Bool)

(assert (=> b!128928 m!151391))

(declare-fun m!151393 () Bool)

(assert (=> b!128928 m!151393))

(declare-fun m!151395 () Bool)

(assert (=> b!128928 m!151395))

(declare-fun m!151397 () Bool)

(assert (=> b!128928 m!151397))

(assert (=> b!128928 m!151385))

(assert (=> b!128928 m!149719))

(declare-fun m!151399 () Bool)

(assert (=> b!128928 m!151399))

(declare-fun m!151401 () Bool)

(assert (=> b!128928 m!151401))

(declare-fun m!151403 () Bool)

(assert (=> b!128928 m!151403))

(declare-fun m!151405 () Bool)

(assert (=> b!128928 m!151405))

(assert (=> b!128928 m!151395))

(declare-fun m!151407 () Bool)

(assert (=> b!128928 m!151407))

(assert (=> b!128928 m!149719))

(declare-fun m!151409 () Bool)

(assert (=> b!128928 m!151409))

(assert (=> b!128928 m!149959))

(assert (=> b!128928 m!151389))

(assert (=> b!128928 m!151403))

(assert (=> b!128928 m!149719))

(assert (=> b!128928 m!151371))

(declare-fun m!151411 () Bool)

(assert (=> b!128918 m!151411))

(declare-fun m!151413 () Bool)

(assert (=> bm!13944 m!151413))

(assert (=> b!128926 m!149959))

(assert (=> b!128926 m!149959))

(declare-fun m!151415 () Bool)

(assert (=> b!128926 m!151415))

(assert (=> b!128926 m!150009))

(assert (=> b!128926 m!150011))

(assert (=> b!128926 m!150013))

(assert (=> b!128926 m!150009))

(assert (=> b!128926 m!150011))

(assert (=> d!38891 d!39171))

(declare-fun d!39173 () Bool)

(assert (=> d!39173 (= (+!165 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(assert (=> d!39173 true))

(declare-fun _$8!112 () Unit!3985)

(assert (=> d!39173 (= (choose!785 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) lt!66185 (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2804 newMap!16)) _$8!112)))

(declare-fun bs!5362 () Bool)

(assert (= bs!5362 d!39173))

(assert (=> bs!5362 m!149859))

(assert (=> bs!5362 m!149859))

(assert (=> bs!5362 m!150371))

(assert (=> bs!5362 m!149719))

(assert (=> bs!5362 m!150369))

(assert (=> d!38891 d!39173))

(declare-fun b!128952 () Bool)

(declare-fun e!84166 () SeekEntryResult!265)

(declare-fun e!84168 () SeekEntryResult!265)

(assert (=> b!128952 (= e!84166 e!84168)))

(declare-fun lt!66886 () (_ BitVec 64))

(declare-fun c!23708 () Bool)

(assert (=> b!128952 (= c!23708 (or (= lt!66886 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) (= (bvadd lt!66886 lt!66886) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!128953 () Bool)

(assert (=> b!128953 (= e!84168 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!7072 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!128954 () Bool)

(declare-fun e!84167 () Bool)

(declare-fun e!84164 () Bool)

(assert (=> b!128954 (= e!84167 e!84164)))

(declare-fun res!62242 () Bool)

(declare-fun lt!66887 () SeekEntryResult!265)

(assert (=> b!128954 (= res!62242 (and ((_ is Intermediate!265) lt!66887) (not (undefined!1077 lt!66887)) (bvslt (x!15116 lt!66887) #b01111111111111111111111111111110) (bvsge (x!15116 lt!66887) #b00000000000000000000000000000000) (bvsge (x!15116 lt!66887) #b00000000000000000000000000000000)))))

(assert (=> b!128954 (=> (not res!62242) (not e!84164))))

(declare-fun b!128955 () Bool)

(assert (=> b!128955 (= e!84166 (Intermediate!265 true (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun b!128956 () Bool)

(assert (=> b!128956 (= e!84167 (bvsge (x!15116 lt!66887) #b01111111111111111111111111111110))))

(declare-fun b!128957 () Bool)

(assert (=> b!128957 (and (bvsge (index!3218 lt!66887) #b00000000000000000000000000000000) (bvslt (index!3218 lt!66887) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62243 () Bool)

(assert (=> b!128957 (= res!62243 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66887)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84165 () Bool)

(assert (=> b!128957 (=> res!62243 e!84165)))

(declare-fun b!128958 () Bool)

(assert (=> b!128958 (and (bvsge (index!3218 lt!66887) #b00000000000000000000000000000000) (bvslt (index!3218 lt!66887) (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62244 () Bool)

(assert (=> b!128958 (= res!62244 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66887)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (=> b!128958 (=> res!62244 e!84165)))

(assert (=> b!128958 (= e!84164 e!84165)))

(declare-fun d!39175 () Bool)

(assert (=> d!39175 e!84167))

(declare-fun c!23706 () Bool)

(assert (=> d!39175 (= c!23706 (and ((_ is Intermediate!265) lt!66887) (undefined!1077 lt!66887)))))

(assert (=> d!39175 (= lt!66887 e!84166)))

(declare-fun c!23707 () Bool)

(assert (=> d!39175 (= c!23707 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!39175 (= lt!66886 (select (arr!2228 (_keys!4541 newMap!16)) (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16))))))

(assert (=> d!39175 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39175 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)) lt!66887)))

(declare-fun b!128959 () Bool)

(assert (=> b!128959 (and (bvsge (index!3218 lt!66887) #b00000000000000000000000000000000) (bvslt (index!3218 lt!66887) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> b!128959 (= e!84165 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3218 lt!66887)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!128960 () Bool)

(assert (=> b!128960 (= e!84168 (Intermediate!265 false (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) #b00000000000000000000000000000000))))

(assert (= (and d!39175 c!23707) b!128955))

(assert (= (and d!39175 (not c!23707)) b!128952))

(assert (= (and b!128952 c!23708) b!128960))

(assert (= (and b!128952 (not c!23708)) b!128953))

(assert (= (and d!39175 c!23706) b!128956))

(assert (= (and d!39175 (not c!23706)) b!128954))

(assert (= (and b!128954 res!62242) b!128958))

(assert (= (and b!128958 (not res!62244)) b!128957))

(assert (= (and b!128957 (not res!62243)) b!128959))

(assert (=> b!128953 m!150289))

(declare-fun m!151417 () Bool)

(assert (=> b!128953 m!151417))

(assert (=> b!128953 m!151417))

(assert (=> b!128953 m!149721))

(declare-fun m!151419 () Bool)

(assert (=> b!128953 m!151419))

(assert (=> d!39175 m!150289))

(declare-fun m!151421 () Bool)

(assert (=> d!39175 m!151421))

(assert (=> d!39175 m!149963))

(declare-fun m!151423 () Bool)

(assert (=> b!128959 m!151423))

(assert (=> b!128957 m!151423))

(assert (=> b!128958 m!151423))

(assert (=> d!38883 d!39175))

(declare-fun d!39177 () Bool)

(declare-fun lt!66893 () (_ BitVec 32))

(declare-fun lt!66892 () (_ BitVec 32))

(assert (=> d!39177 (= lt!66893 (bvmul (bvxor lt!66892 (bvlshr lt!66892 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!39177 (= lt!66892 ((_ extract 31 0) (bvand (bvxor (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvlshr (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!39177 (and (bvsge (mask!7072 newMap!16) #b00000000000000000000000000000000) (let ((res!62245 (let ((h!2284 ((_ extract 31 0) (bvand (bvxor (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (bvlshr (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!15220 (bvmul (bvxor h!2284 (bvlshr h!2284 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!15220 (bvlshr x!15220 #b00000000000000000000000000001101)) (mask!7072 newMap!16)))))) (and (bvslt res!62245 (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001)) (bvsge res!62245 #b00000000000000000000000000000000))))))

(assert (=> d!39177 (= (toIndex!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (mask!7072 newMap!16)) (bvand (bvxor lt!66893 (bvlshr lt!66893 #b00000000000000000000000000001101)) (mask!7072 newMap!16)))))

(assert (=> d!38883 d!39177))

(assert (=> d!38883 d!38921))

(declare-fun d!39179 () Bool)

(assert (=> d!39179 (not (contains!869 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327)) lt!66323))))

(declare-fun lt!66896 () Unit!3985)

(declare-fun choose!792 (ListLongMap!1639 (_ BitVec 64) V!3449 (_ BitVec 64)) Unit!3985)

(assert (=> d!39179 (= lt!66896 (choose!792 lt!66329 lt!66326 lt!66327 lt!66323))))

(declare-fun e!84171 () Bool)

(assert (=> d!39179 e!84171))

(declare-fun res!62248 () Bool)

(assert (=> d!39179 (=> (not res!62248) (not e!84171))))

(assert (=> d!39179 (= res!62248 (not (contains!869 lt!66329 lt!66323)))))

(assert (=> d!39179 (= (addStillNotContains!59 lt!66329 lt!66326 lt!66327 lt!66323) lt!66896)))

(declare-fun b!128964 () Bool)

(assert (=> b!128964 (= e!84171 (not (= lt!66326 lt!66323)))))

(assert (= (and d!39179 res!62248) b!128964))

(assert (=> d!39179 m!150043))

(assert (=> d!39179 m!150043))

(assert (=> d!39179 m!150045))

(declare-fun m!151425 () Bool)

(assert (=> d!39179 m!151425))

(declare-fun m!151427 () Bool)

(assert (=> d!39179 m!151427))

(assert (=> b!128223 d!39179))

(assert (=> b!128223 d!38853))

(declare-fun d!39181 () Bool)

(declare-fun e!84172 () Bool)

(assert (=> d!39181 e!84172))

(declare-fun res!62250 () Bool)

(assert (=> d!39181 (=> (not res!62250) (not e!84172))))

(declare-fun lt!66897 () ListLongMap!1639)

(assert (=> d!39181 (= res!62250 (contains!869 lt!66897 (_1!1279 (tuple2!2537 lt!66326 lt!66327))))))

(declare-fun lt!66899 () List!1682)

(assert (=> d!39181 (= lt!66897 (ListLongMap!1640 lt!66899))))

(declare-fun lt!66898 () Unit!3985)

(declare-fun lt!66900 () Unit!3985)

(assert (=> d!39181 (= lt!66898 lt!66900)))

(assert (=> d!39181 (= (getValueByKey!169 lt!66899 (_1!1279 (tuple2!2537 lt!66326 lt!66327))) (Some!174 (_2!1279 (tuple2!2537 lt!66326 lt!66327))))))

(assert (=> d!39181 (= lt!66900 (lemmaContainsTupThenGetReturnValue!84 lt!66899 (_1!1279 (tuple2!2537 lt!66326 lt!66327)) (_2!1279 (tuple2!2537 lt!66326 lt!66327))))))

(assert (=> d!39181 (= lt!66899 (insertStrictlySorted!87 (toList!835 lt!66329) (_1!1279 (tuple2!2537 lt!66326 lt!66327)) (_2!1279 (tuple2!2537 lt!66326 lt!66327))))))

(assert (=> d!39181 (= (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327)) lt!66897)))

(declare-fun b!128965 () Bool)

(declare-fun res!62249 () Bool)

(assert (=> b!128965 (=> (not res!62249) (not e!84172))))

(assert (=> b!128965 (= res!62249 (= (getValueByKey!169 (toList!835 lt!66897) (_1!1279 (tuple2!2537 lt!66326 lt!66327))) (Some!174 (_2!1279 (tuple2!2537 lt!66326 lt!66327)))))))

(declare-fun b!128966 () Bool)

(assert (=> b!128966 (= e!84172 (contains!871 (toList!835 lt!66897) (tuple2!2537 lt!66326 lt!66327)))))

(assert (= (and d!39181 res!62250) b!128965))

(assert (= (and b!128965 res!62249) b!128966))

(declare-fun m!151429 () Bool)

(assert (=> d!39181 m!151429))

(declare-fun m!151431 () Bool)

(assert (=> d!39181 m!151431))

(declare-fun m!151433 () Bool)

(assert (=> d!39181 m!151433))

(declare-fun m!151435 () Bool)

(assert (=> d!39181 m!151435))

(declare-fun m!151437 () Bool)

(assert (=> b!128965 m!151437))

(declare-fun m!151439 () Bool)

(assert (=> b!128966 m!151439))

(assert (=> b!128223 d!39181))

(declare-fun d!39183 () Bool)

(declare-fun e!84173 () Bool)

(assert (=> d!39183 e!84173))

(declare-fun res!62252 () Bool)

(assert (=> d!39183 (=> (not res!62252) (not e!84173))))

(declare-fun lt!66901 () ListLongMap!1639)

(assert (=> d!39183 (= res!62252 (contains!869 lt!66901 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66903 () List!1682)

(assert (=> d!39183 (= lt!66901 (ListLongMap!1640 lt!66903))))

(declare-fun lt!66902 () Unit!3985)

(declare-fun lt!66904 () Unit!3985)

(assert (=> d!39183 (= lt!66902 lt!66904)))

(assert (=> d!39183 (= (getValueByKey!169 lt!66903 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39183 (= lt!66904 (lemmaContainsTupThenGetReturnValue!84 lt!66903 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39183 (= lt!66903 (insertStrictlySorted!87 (toList!835 call!13848) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39183 (= (+!165 call!13848 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!66901)))

(declare-fun b!128967 () Bool)

(declare-fun res!62251 () Bool)

(assert (=> b!128967 (=> (not res!62251) (not e!84173))))

(assert (=> b!128967 (= res!62251 (= (getValueByKey!169 (toList!835 lt!66901) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!128968 () Bool)

(assert (=> b!128968 (= e!84173 (contains!871 (toList!835 lt!66901) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39183 res!62252) b!128967))

(assert (= (and b!128967 res!62251) b!128968))

(declare-fun m!151441 () Bool)

(assert (=> d!39183 m!151441))

(declare-fun m!151443 () Bool)

(assert (=> d!39183 m!151443))

(declare-fun m!151445 () Bool)

(assert (=> d!39183 m!151445))

(declare-fun m!151447 () Bool)

(assert (=> d!39183 m!151447))

(declare-fun m!151449 () Bool)

(assert (=> b!128967 m!151449))

(declare-fun m!151451 () Bool)

(assert (=> b!128968 m!151451))

(assert (=> b!128223 d!39183))

(declare-fun d!39185 () Bool)

(declare-fun e!84175 () Bool)

(assert (=> d!39185 e!84175))

(declare-fun res!62253 () Bool)

(assert (=> d!39185 (=> res!62253 e!84175)))

(declare-fun lt!66905 () Bool)

(assert (=> d!39185 (= res!62253 (not lt!66905))))

(declare-fun lt!66908 () Bool)

(assert (=> d!39185 (= lt!66905 lt!66908)))

(declare-fun lt!66906 () Unit!3985)

(declare-fun e!84174 () Unit!3985)

(assert (=> d!39185 (= lt!66906 e!84174)))

(declare-fun c!23709 () Bool)

(assert (=> d!39185 (= c!23709 lt!66908)))

(assert (=> d!39185 (= lt!66908 (containsKey!172 (toList!835 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327))) lt!66323))))

(assert (=> d!39185 (= (contains!869 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327)) lt!66323) lt!66905)))

(declare-fun b!128969 () Bool)

(declare-fun lt!66907 () Unit!3985)

(assert (=> b!128969 (= e!84174 lt!66907)))

(assert (=> b!128969 (= lt!66907 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327))) lt!66323))))

(assert (=> b!128969 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327))) lt!66323))))

(declare-fun b!128970 () Bool)

(declare-fun Unit!4023 () Unit!3985)

(assert (=> b!128970 (= e!84174 Unit!4023)))

(declare-fun b!128971 () Bool)

(assert (=> b!128971 (= e!84175 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66329 (tuple2!2537 lt!66326 lt!66327))) lt!66323)))))

(assert (= (and d!39185 c!23709) b!128969))

(assert (= (and d!39185 (not c!23709)) b!128970))

(assert (= (and d!39185 (not res!62253)) b!128971))

(declare-fun m!151453 () Bool)

(assert (=> d!39185 m!151453))

(declare-fun m!151455 () Bool)

(assert (=> b!128969 m!151455))

(declare-fun m!151457 () Bool)

(assert (=> b!128969 m!151457))

(assert (=> b!128969 m!151457))

(declare-fun m!151459 () Bool)

(assert (=> b!128969 m!151459))

(assert (=> b!128971 m!151457))

(assert (=> b!128971 m!151457))

(assert (=> b!128971 m!151459))

(assert (=> b!128223 d!39185))

(declare-fun b!128972 () Bool)

(declare-fun e!84178 () Bool)

(declare-fun e!84177 () Bool)

(assert (=> b!128972 (= e!84178 e!84177)))

(declare-fun lt!66909 () (_ BitVec 64))

(assert (=> b!128972 (= lt!66909 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000))))

(declare-fun lt!66911 () Unit!3985)

(assert (=> b!128972 (= lt!66911 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4541 (_2!1280 lt!66196)) lt!66909 #b00000000000000000000000000000000))))

(assert (=> b!128972 (arrayContainsKey!0 (_keys!4541 (_2!1280 lt!66196)) lt!66909 #b00000000000000000000000000000000)))

(declare-fun lt!66910 () Unit!3985)

(assert (=> b!128972 (= lt!66910 lt!66911)))

(declare-fun res!62254 () Bool)

(assert (=> b!128972 (= res!62254 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000) (_keys!4541 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196))) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!128972 (=> (not res!62254) (not e!84177))))

(declare-fun b!128973 () Bool)

(declare-fun call!13948 () Bool)

(assert (=> b!128973 (= e!84177 call!13948)))

(declare-fun d!39187 () Bool)

(declare-fun res!62255 () Bool)

(declare-fun e!84176 () Bool)

(assert (=> d!39187 (=> res!62255 e!84176)))

(assert (=> d!39187 (= res!62255 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(assert (=> d!39187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196))) e!84176)))

(declare-fun bm!13945 () Bool)

(assert (=> bm!13945 (= call!13948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4541 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196))))))

(declare-fun b!128974 () Bool)

(assert (=> b!128974 (= e!84176 e!84178)))

(declare-fun c!23710 () Bool)

(assert (=> b!128974 (= c!23710 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun b!128975 () Bool)

(assert (=> b!128975 (= e!84178 call!13948)))

(assert (= (and d!39187 (not res!62255)) b!128974))

(assert (= (and b!128974 c!23710) b!128972))

(assert (= (and b!128974 (not c!23710)) b!128975))

(assert (= (and b!128972 res!62254) b!128973))

(assert (= (or b!128973 b!128975) bm!13945))

(assert (=> b!128972 m!150899))

(declare-fun m!151461 () Bool)

(assert (=> b!128972 m!151461))

(declare-fun m!151463 () Bool)

(assert (=> b!128972 m!151463))

(assert (=> b!128972 m!150899))

(declare-fun m!151465 () Bool)

(assert (=> b!128972 m!151465))

(declare-fun m!151467 () Bool)

(assert (=> bm!13945 m!151467))

(assert (=> b!128974 m!150899))

(assert (=> b!128974 m!150899))

(assert (=> b!128974 m!150901))

(assert (=> b!128295 d!39187))

(declare-fun d!39189 () Bool)

(declare-fun e!84180 () Bool)

(assert (=> d!39189 e!84180))

(declare-fun res!62256 () Bool)

(assert (=> d!39189 (=> res!62256 e!84180)))

(declare-fun lt!66912 () Bool)

(assert (=> d!39189 (= res!62256 (not lt!66912))))

(declare-fun lt!66915 () Bool)

(assert (=> d!39189 (= lt!66912 lt!66915)))

(declare-fun lt!66913 () Unit!3985)

(declare-fun e!84179 () Unit!3985)

(assert (=> d!39189 (= lt!66913 e!84179)))

(declare-fun c!23711 () Bool)

(assert (=> d!39189 (= c!23711 lt!66915)))

(assert (=> d!39189 (= lt!66915 (containsKey!172 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!39189 (= (contains!869 lt!66330 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66912)))

(declare-fun b!128976 () Bool)

(declare-fun lt!66914 () Unit!3985)

(assert (=> b!128976 (= e!84179 lt!66914)))

(assert (=> b!128976 (= lt!66914 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> b!128976 (isDefined!121 (getValueByKey!169 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128977 () Bool)

(declare-fun Unit!4024 () Unit!3985)

(assert (=> b!128977 (= e!84179 Unit!4024)))

(declare-fun b!128978 () Bool)

(assert (=> b!128978 (= e!84180 (isDefined!121 (getValueByKey!169 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39189 c!23711) b!128976))

(assert (= (and d!39189 (not c!23711)) b!128977))

(assert (= (and d!39189 (not res!62256)) b!128978))

(declare-fun m!151469 () Bool)

(assert (=> d!39189 m!151469))

(declare-fun m!151471 () Bool)

(assert (=> b!128976 m!151471))

(assert (=> b!128976 m!150069))

(assert (=> b!128976 m!150069))

(declare-fun m!151473 () Bool)

(assert (=> b!128976 m!151473))

(assert (=> b!128978 m!150069))

(assert (=> b!128978 m!150069))

(assert (=> b!128978 m!151473))

(assert (=> d!38819 d!39189))

(declare-fun b!128982 () Bool)

(declare-fun e!84182 () Option!175)

(assert (=> b!128982 (= e!84182 None!173)))

(declare-fun b!128981 () Bool)

(assert (=> b!128981 (= e!84182 (getValueByKey!169 (t!6053 lt!66332) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun c!23712 () Bool)

(declare-fun d!39191 () Bool)

(assert (=> d!39191 (= c!23712 (and ((_ is Cons!1678) lt!66332) (= (_1!1279 (h!2281 lt!66332)) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84181 () Option!175)

(assert (=> d!39191 (= (getValueByKey!169 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84181)))

(declare-fun b!128980 () Bool)

(assert (=> b!128980 (= e!84181 e!84182)))

(declare-fun c!23713 () Bool)

(assert (=> b!128980 (= c!23713 (and ((_ is Cons!1678) lt!66332) (not (= (_1!1279 (h!2281 lt!66332)) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!128979 () Bool)

(assert (=> b!128979 (= e!84181 (Some!174 (_2!1279 (h!2281 lt!66332))))))

(assert (= (and d!39191 c!23712) b!128979))

(assert (= (and d!39191 (not c!23712)) b!128980))

(assert (= (and b!128980 c!23713) b!128981))

(assert (= (and b!128980 (not c!23713)) b!128982))

(declare-fun m!151475 () Bool)

(assert (=> b!128981 m!151475))

(assert (=> d!38819 d!39191))

(declare-fun d!39193 () Bool)

(assert (=> d!39193 (= (getValueByKey!169 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!66916 () Unit!3985)

(assert (=> d!39193 (= lt!66916 (choose!789 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!84183 () Bool)

(assert (=> d!39193 e!84183))

(declare-fun res!62257 () Bool)

(assert (=> d!39193 (=> (not res!62257) (not e!84183))))

(assert (=> d!39193 (= res!62257 (isStrictlySorted!305 lt!66332))))

(assert (=> d!39193 (= (lemmaContainsTupThenGetReturnValue!84 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66916)))

(declare-fun b!128983 () Bool)

(declare-fun res!62258 () Bool)

(assert (=> b!128983 (=> (not res!62258) (not e!84183))))

(assert (=> b!128983 (= res!62258 (containsKey!172 lt!66332 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128984 () Bool)

(assert (=> b!128984 (= e!84183 (contains!871 lt!66332 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39193 res!62257) b!128983))

(assert (= (and b!128983 res!62258) b!128984))

(assert (=> d!39193 m!150063))

(declare-fun m!151477 () Bool)

(assert (=> d!39193 m!151477))

(declare-fun m!151479 () Bool)

(assert (=> d!39193 m!151479))

(declare-fun m!151481 () Bool)

(assert (=> b!128983 m!151481))

(declare-fun m!151483 () Bool)

(assert (=> b!128984 m!151483))

(assert (=> d!38819 d!39193))

(declare-fun e!84184 () List!1682)

(declare-fun bm!13946 () Bool)

(declare-fun c!23715 () Bool)

(declare-fun call!13949 () List!1682)

(assert (=> bm!13946 (= call!13949 ($colon$colon!89 e!84184 (ite c!23715 (h!2281 (toList!835 lt!66268)) (tuple2!2537 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun c!23716 () Bool)

(assert (=> bm!13946 (= c!23716 c!23715)))

(declare-fun d!39195 () Bool)

(declare-fun e!84187 () Bool)

(assert (=> d!39195 e!84187))

(declare-fun res!62259 () Bool)

(assert (=> d!39195 (=> (not res!62259) (not e!84187))))

(declare-fun lt!66917 () List!1682)

(assert (=> d!39195 (= res!62259 (isStrictlySorted!305 lt!66917))))

(declare-fun e!84188 () List!1682)

(assert (=> d!39195 (= lt!66917 e!84188)))

(assert (=> d!39195 (= c!23715 (and ((_ is Cons!1678) (toList!835 lt!66268)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66268))) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!39195 (isStrictlySorted!305 (toList!835 lt!66268))))

(assert (=> d!39195 (= (insertStrictlySorted!87 (toList!835 lt!66268) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66917)))

(declare-fun b!128985 () Bool)

(assert (=> b!128985 (= e!84184 (insertStrictlySorted!87 (t!6053 (toList!835 lt!66268)) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!128986 () Bool)

(assert (=> b!128986 (= e!84188 call!13949)))

(declare-fun b!128987 () Bool)

(declare-fun e!84185 () List!1682)

(assert (=> b!128987 (= e!84188 e!84185)))

(declare-fun c!23717 () Bool)

(assert (=> b!128987 (= c!23717 (and ((_ is Cons!1678) (toList!835 lt!66268)) (= (_1!1279 (h!2281 (toList!835 lt!66268))) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128988 () Bool)

(declare-fun e!84186 () List!1682)

(declare-fun call!13951 () List!1682)

(assert (=> b!128988 (= e!84186 call!13951)))

(declare-fun bm!13947 () Bool)

(declare-fun call!13950 () List!1682)

(assert (=> bm!13947 (= call!13951 call!13950)))

(declare-fun c!23714 () Bool)

(declare-fun b!128989 () Bool)

(assert (=> b!128989 (= e!84184 (ite c!23717 (t!6053 (toList!835 lt!66268)) (ite c!23714 (Cons!1678 (h!2281 (toList!835 lt!66268)) (t!6053 (toList!835 lt!66268))) Nil!1679)))))

(declare-fun b!128990 () Bool)

(assert (=> b!128990 (= e!84186 call!13951)))

(declare-fun b!128991 () Bool)

(assert (=> b!128991 (= e!84187 (contains!871 lt!66917 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!128992 () Bool)

(assert (=> b!128992 (= c!23714 (and ((_ is Cons!1678) (toList!835 lt!66268)) (bvsgt (_1!1279 (h!2281 (toList!835 lt!66268))) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!128992 (= e!84185 e!84186)))

(declare-fun b!128993 () Bool)

(declare-fun res!62260 () Bool)

(assert (=> b!128993 (=> (not res!62260) (not e!84187))))

(assert (=> b!128993 (= res!62260 (containsKey!172 lt!66917 (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun bm!13948 () Bool)

(assert (=> bm!13948 (= call!13950 call!13949)))

(declare-fun b!128994 () Bool)

(assert (=> b!128994 (= e!84185 call!13950)))

(assert (= (and d!39195 c!23715) b!128986))

(assert (= (and d!39195 (not c!23715)) b!128987))

(assert (= (and b!128987 c!23717) b!128994))

(assert (= (and b!128987 (not c!23717)) b!128992))

(assert (= (and b!128992 c!23714) b!128990))

(assert (= (and b!128992 (not c!23714)) b!128988))

(assert (= (or b!128990 b!128988) bm!13947))

(assert (= (or b!128994 bm!13947) bm!13948))

(assert (= (or b!128986 bm!13948) bm!13946))

(assert (= (and bm!13946 c!23716) b!128985))

(assert (= (and bm!13946 (not c!23716)) b!128989))

(assert (= (and d!39195 res!62259) b!128993))

(assert (= (and b!128993 res!62260) b!128991))

(declare-fun m!151485 () Bool)

(assert (=> b!128993 m!151485))

(declare-fun m!151487 () Bool)

(assert (=> b!128985 m!151487))

(declare-fun m!151489 () Bool)

(assert (=> d!39195 m!151489))

(declare-fun m!151491 () Bool)

(assert (=> d!39195 m!151491))

(declare-fun m!151493 () Bool)

(assert (=> bm!13946 m!151493))

(declare-fun m!151495 () Bool)

(assert (=> b!128991 m!151495))

(assert (=> d!38819 d!39195))

(declare-fun d!39197 () Bool)

(assert (=> d!39197 (contains!869 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) lt!66492)))

(declare-fun lt!66918 () Unit!3985)

(assert (=> d!39197 (= lt!66918 (choose!781 lt!66491 lt!66495 (zeroValue!2665 newMap!16) lt!66492))))

(assert (=> d!39197 (contains!869 lt!66491 lt!66492)))

(assert (=> d!39197 (= (addStillContains!88 lt!66491 lt!66495 (zeroValue!2665 newMap!16) lt!66492) lt!66918)))

(declare-fun bs!5363 () Bool)

(assert (= bs!5363 d!39197))

(assert (=> bs!5363 m!150339))

(assert (=> bs!5363 m!150339))

(assert (=> bs!5363 m!150341))

(declare-fun m!151497 () Bool)

(assert (=> bs!5363 m!151497))

(declare-fun m!151499 () Bool)

(assert (=> bs!5363 m!151499))

(assert (=> b!128424 d!39197))

(declare-fun d!39199 () Bool)

(assert (=> d!39199 (= (apply!112 lt!66505 lt!66497) (get!1466 (getValueByKey!169 (toList!835 lt!66505) lt!66497)))))

(declare-fun bs!5364 () Bool)

(assert (= bs!5364 d!39199))

(declare-fun m!151501 () Bool)

(assert (=> bs!5364 m!151501))

(assert (=> bs!5364 m!151501))

(declare-fun m!151503 () Bool)

(assert (=> bs!5364 m!151503))

(assert (=> b!128424 d!39199))

(declare-fun d!39201 () Bool)

(declare-fun e!84190 () Bool)

(assert (=> d!39201 e!84190))

(declare-fun res!62261 () Bool)

(assert (=> d!39201 (=> res!62261 e!84190)))

(declare-fun lt!66919 () Bool)

(assert (=> d!39201 (= res!62261 (not lt!66919))))

(declare-fun lt!66922 () Bool)

(assert (=> d!39201 (= lt!66919 lt!66922)))

(declare-fun lt!66920 () Unit!3985)

(declare-fun e!84189 () Unit!3985)

(assert (=> d!39201 (= lt!66920 e!84189)))

(declare-fun c!23718 () Bool)

(assert (=> d!39201 (= c!23718 lt!66922)))

(assert (=> d!39201 (= lt!66922 (containsKey!172 (toList!835 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) lt!66492))))

(assert (=> d!39201 (= (contains!869 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) lt!66492) lt!66919)))

(declare-fun b!128995 () Bool)

(declare-fun lt!66921 () Unit!3985)

(assert (=> b!128995 (= e!84189 lt!66921)))

(assert (=> b!128995 (= lt!66921 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) lt!66492))))

(assert (=> b!128995 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) lt!66492))))

(declare-fun b!128996 () Bool)

(declare-fun Unit!4025 () Unit!3985)

(assert (=> b!128996 (= e!84189 Unit!4025)))

(declare-fun b!128997 () Bool)

(assert (=> b!128997 (= e!84190 (isDefined!121 (getValueByKey!169 (toList!835 (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) lt!66492)))))

(assert (= (and d!39201 c!23718) b!128995))

(assert (= (and d!39201 (not c!23718)) b!128996))

(assert (= (and d!39201 (not res!62261)) b!128997))

(declare-fun m!151505 () Bool)

(assert (=> d!39201 m!151505))

(declare-fun m!151507 () Bool)

(assert (=> b!128995 m!151507))

(declare-fun m!151509 () Bool)

(assert (=> b!128995 m!151509))

(assert (=> b!128995 m!151509))

(declare-fun m!151511 () Bool)

(assert (=> b!128995 m!151511))

(assert (=> b!128997 m!151509))

(assert (=> b!128997 m!151509))

(assert (=> b!128997 m!151511))

(assert (=> b!128424 d!39201))

(declare-fun d!39203 () Bool)

(assert (=> d!39203 (= (apply!112 lt!66508 lt!66503) (get!1466 (getValueByKey!169 (toList!835 lt!66508) lt!66503)))))

(declare-fun bs!5365 () Bool)

(assert (= bs!5365 d!39203))

(declare-fun m!151513 () Bool)

(assert (=> bs!5365 m!151513))

(assert (=> bs!5365 m!151513))

(declare-fun m!151515 () Bool)

(assert (=> bs!5365 m!151515))

(assert (=> b!128424 d!39203))

(declare-fun d!39205 () Bool)

(declare-fun e!84191 () Bool)

(assert (=> d!39205 e!84191))

(declare-fun res!62263 () Bool)

(assert (=> d!39205 (=> (not res!62263) (not e!84191))))

(declare-fun lt!66923 () ListLongMap!1639)

(assert (=> d!39205 (= res!62263 (contains!869 lt!66923 (_1!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!66925 () List!1682)

(assert (=> d!39205 (= lt!66923 (ListLongMap!1640 lt!66925))))

(declare-fun lt!66924 () Unit!3985)

(declare-fun lt!66926 () Unit!3985)

(assert (=> d!39205 (= lt!66924 lt!66926)))

(assert (=> d!39205 (= (getValueByKey!169 lt!66925 (_1!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39205 (= lt!66926 (lemmaContainsTupThenGetReturnValue!84 lt!66925 (_1!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39205 (= lt!66925 (insertStrictlySorted!87 (toList!835 lt!66508) (_1!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39205 (= (+!165 lt!66508 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66923)))

(declare-fun b!128998 () Bool)

(declare-fun res!62262 () Bool)

(assert (=> b!128998 (=> (not res!62262) (not e!84191))))

(assert (=> b!128998 (= res!62262 (= (getValueByKey!169 (toList!835 lt!66923) (_1!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!128999 () Bool)

(assert (=> b!128999 (= e!84191 (contains!871 (toList!835 lt!66923) (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!39205 res!62263) b!128998))

(assert (= (and b!128998 res!62262) b!128999))

(declare-fun m!151517 () Bool)

(assert (=> d!39205 m!151517))

(declare-fun m!151519 () Bool)

(assert (=> d!39205 m!151519))

(declare-fun m!151521 () Bool)

(assert (=> d!39205 m!151521))

(declare-fun m!151523 () Bool)

(assert (=> d!39205 m!151523))

(declare-fun m!151525 () Bool)

(assert (=> b!128998 m!151525))

(declare-fun m!151527 () Bool)

(assert (=> b!128999 m!151527))

(assert (=> b!128424 d!39205))

(declare-fun d!39207 () Bool)

(assert (=> d!39207 (= (apply!112 (+!165 lt!66507 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66490) (apply!112 lt!66507 lt!66490))))

(declare-fun lt!66927 () Unit!3985)

(assert (=> d!39207 (= lt!66927 (choose!780 lt!66507 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66490))))

(declare-fun e!84192 () Bool)

(assert (=> d!39207 e!84192))

(declare-fun res!62264 () Bool)

(assert (=> d!39207 (=> (not res!62264) (not e!84192))))

(assert (=> d!39207 (= res!62264 (contains!869 lt!66507 lt!66490))))

(assert (=> d!39207 (= (addApplyDifferent!88 lt!66507 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66490) lt!66927)))

(declare-fun b!129000 () Bool)

(assert (=> b!129000 (= e!84192 (not (= lt!66490 lt!66501)))))

(assert (= (and d!39207 res!62264) b!129000))

(assert (=> d!39207 m!150317))

(declare-fun m!151529 () Bool)

(assert (=> d!39207 m!151529))

(assert (=> d!39207 m!150325))

(assert (=> d!39207 m!150327))

(declare-fun m!151531 () Bool)

(assert (=> d!39207 m!151531))

(assert (=> d!39207 m!150325))

(assert (=> b!128424 d!39207))

(declare-fun d!39209 () Bool)

(declare-fun e!84193 () Bool)

(assert (=> d!39209 e!84193))

(declare-fun res!62266 () Bool)

(assert (=> d!39209 (=> (not res!62266) (not e!84193))))

(declare-fun lt!66928 () ListLongMap!1639)

(assert (=> d!39209 (= res!62266 (contains!869 lt!66928 (_1!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!66930 () List!1682)

(assert (=> d!39209 (= lt!66928 (ListLongMap!1640 lt!66930))))

(declare-fun lt!66929 () Unit!3985)

(declare-fun lt!66931 () Unit!3985)

(assert (=> d!39209 (= lt!66929 lt!66931)))

(assert (=> d!39209 (= (getValueByKey!169 lt!66930 (_1!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39209 (= lt!66931 (lemmaContainsTupThenGetReturnValue!84 lt!66930 (_1!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39209 (= lt!66930 (insertStrictlySorted!87 (toList!835 lt!66507) (_1!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39209 (= (+!165 lt!66507 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66928)))

(declare-fun b!129001 () Bool)

(declare-fun res!62265 () Bool)

(assert (=> b!129001 (=> (not res!62265) (not e!84193))))

(assert (=> b!129001 (= res!62265 (= (getValueByKey!169 (toList!835 lt!66928) (_1!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!129002 () Bool)

(assert (=> b!129002 (= e!84193 (contains!871 (toList!835 lt!66928) (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!39209 res!62266) b!129001))

(assert (= (and b!129001 res!62265) b!129002))

(declare-fun m!151533 () Bool)

(assert (=> d!39209 m!151533))

(declare-fun m!151535 () Bool)

(assert (=> d!39209 m!151535))

(declare-fun m!151537 () Bool)

(assert (=> d!39209 m!151537))

(declare-fun m!151539 () Bool)

(assert (=> d!39209 m!151539))

(declare-fun m!151541 () Bool)

(assert (=> b!129001 m!151541))

(declare-fun m!151543 () Bool)

(assert (=> b!129002 m!151543))

(assert (=> b!128424 d!39209))

(declare-fun d!39211 () Bool)

(declare-fun e!84194 () Bool)

(assert (=> d!39211 e!84194))

(declare-fun res!62268 () Bool)

(assert (=> d!39211 (=> (not res!62268) (not e!84194))))

(declare-fun lt!66932 () ListLongMap!1639)

(assert (=> d!39211 (= res!62268 (contains!869 lt!66932 (_1!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66934 () List!1682)

(assert (=> d!39211 (= lt!66932 (ListLongMap!1640 lt!66934))))

(declare-fun lt!66933 () Unit!3985)

(declare-fun lt!66935 () Unit!3985)

(assert (=> d!39211 (= lt!66933 lt!66935)))

(assert (=> d!39211 (= (getValueByKey!169 lt!66934 (_1!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39211 (= lt!66935 (lemmaContainsTupThenGetReturnValue!84 lt!66934 (_1!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39211 (= lt!66934 (insertStrictlySorted!87 (toList!835 lt!66491) (_1!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39211 (= (+!165 lt!66491 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))) lt!66932)))

(declare-fun b!129003 () Bool)

(declare-fun res!62267 () Bool)

(assert (=> b!129003 (=> (not res!62267) (not e!84194))))

(assert (=> b!129003 (= res!62267 (= (getValueByKey!169 (toList!835 lt!66932) (_1!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))))))))

(declare-fun b!129004 () Bool)

(assert (=> b!129004 (= e!84194 (contains!871 (toList!835 lt!66932) (tuple2!2537 lt!66495 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39211 res!62268) b!129003))

(assert (= (and b!129003 res!62267) b!129004))

(declare-fun m!151545 () Bool)

(assert (=> d!39211 m!151545))

(declare-fun m!151547 () Bool)

(assert (=> d!39211 m!151547))

(declare-fun m!151549 () Bool)

(assert (=> d!39211 m!151549))

(declare-fun m!151551 () Bool)

(assert (=> d!39211 m!151551))

(declare-fun m!151553 () Bool)

(assert (=> b!129003 m!151553))

(declare-fun m!151555 () Bool)

(assert (=> b!129004 m!151555))

(assert (=> b!128424 d!39211))

(declare-fun d!39213 () Bool)

(assert (=> d!39213 (= (apply!112 (+!165 lt!66507 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66490) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66507 (tuple2!2537 lt!66501 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!66490)))))

(declare-fun bs!5366 () Bool)

(assert (= bs!5366 d!39213))

(declare-fun m!151557 () Bool)

(assert (=> bs!5366 m!151557))

(assert (=> bs!5366 m!151557))

(declare-fun m!151559 () Bool)

(assert (=> bs!5366 m!151559))

(assert (=> b!128424 d!39213))

(declare-fun d!39215 () Bool)

(assert (=> d!39215 (= (apply!112 (+!165 lt!66505 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) lt!66497) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66505 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))) lt!66497)))))

(declare-fun bs!5367 () Bool)

(assert (= bs!5367 d!39215))

(declare-fun m!151561 () Bool)

(assert (=> bs!5367 m!151561))

(assert (=> bs!5367 m!151561))

(declare-fun m!151563 () Bool)

(assert (=> bs!5367 m!151563))

(assert (=> b!128424 d!39215))

(declare-fun d!39217 () Bool)

(assert (=> d!39217 (= (apply!112 lt!66507 lt!66490) (get!1466 (getValueByKey!169 (toList!835 lt!66507) lt!66490)))))

(declare-fun bs!5368 () Bool)

(assert (= bs!5368 d!39217))

(declare-fun m!151565 () Bool)

(assert (=> bs!5368 m!151565))

(assert (=> bs!5368 m!151565))

(declare-fun m!151567 () Bool)

(assert (=> bs!5368 m!151567))

(assert (=> b!128424 d!39217))

(declare-fun d!39219 () Bool)

(assert (=> d!39219 (= (apply!112 (+!165 lt!66505 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) lt!66497) (apply!112 lt!66505 lt!66497))))

(declare-fun lt!66936 () Unit!3985)

(assert (=> d!39219 (= lt!66936 (choose!780 lt!66505 lt!66506 (zeroValue!2665 newMap!16) lt!66497))))

(declare-fun e!84195 () Bool)

(assert (=> d!39219 e!84195))

(declare-fun res!62269 () Bool)

(assert (=> d!39219 (=> (not res!62269) (not e!84195))))

(assert (=> d!39219 (= res!62269 (contains!869 lt!66505 lt!66497))))

(assert (=> d!39219 (= (addApplyDifferent!88 lt!66505 lt!66506 (zeroValue!2665 newMap!16) lt!66497) lt!66936)))

(declare-fun b!129005 () Bool)

(assert (=> b!129005 (= e!84195 (not (= lt!66497 lt!66506)))))

(assert (= (and d!39219 res!62269) b!129005))

(assert (=> d!39219 m!150329))

(declare-fun m!151569 () Bool)

(assert (=> d!39219 m!151569))

(assert (=> d!39219 m!150331))

(assert (=> d!39219 m!150343))

(declare-fun m!151571 () Bool)

(assert (=> d!39219 m!151571))

(assert (=> d!39219 m!150331))

(assert (=> b!128424 d!39219))

(declare-fun b!129006 () Bool)

(declare-fun res!62271 () Bool)

(declare-fun e!84201 () Bool)

(assert (=> b!129006 (=> (not res!62271) (not e!84201))))

(declare-fun lt!66942 () ListLongMap!1639)

(assert (=> b!129006 (= res!62271 (not (contains!869 lt!66942 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129007 () Bool)

(assert (=> b!129007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> b!129007 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))))))))

(declare-fun e!84196 () Bool)

(assert (=> b!129007 (= e!84196 (= (apply!112 lt!66942 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!129008 () Bool)

(declare-fun e!84200 () ListLongMap!1639)

(declare-fun e!84198 () ListLongMap!1639)

(assert (=> b!129008 (= e!84200 e!84198)))

(declare-fun c!23722 () Bool)

(assert (=> b!129008 (= c!23722 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129009 () Bool)

(declare-fun lt!66939 () Unit!3985)

(declare-fun lt!66938 () Unit!3985)

(assert (=> b!129009 (= lt!66939 lt!66938)))

(declare-fun lt!66941 () V!3449)

(declare-fun lt!66940 () (_ BitVec 64))

(declare-fun lt!66937 () (_ BitVec 64))

(declare-fun lt!66943 () ListLongMap!1639)

(assert (=> b!129009 (not (contains!869 (+!165 lt!66943 (tuple2!2537 lt!66940 lt!66941)) lt!66937))))

(assert (=> b!129009 (= lt!66938 (addStillNotContains!59 lt!66943 lt!66940 lt!66941 lt!66937))))

(assert (=> b!129009 (= lt!66937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!129009 (= lt!66941 (get!1462 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!129009 (= lt!66940 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun call!13952 () ListLongMap!1639)

(assert (=> b!129009 (= lt!66943 call!13952)))

(assert (=> b!129009 (= e!84198 (+!165 call!13952 (tuple2!2537 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000) (get!1462 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84199 () Bool)

(declare-fun b!129010 () Bool)

(assert (=> b!129010 (= e!84199 (= lt!66942 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16))))))

(declare-fun b!129011 () Bool)

(assert (=> b!129011 (= e!84200 (ListLongMap!1640 Nil!1679))))

(declare-fun b!129012 () Bool)

(declare-fun e!84202 () Bool)

(assert (=> b!129012 (= e!84201 e!84202)))

(declare-fun c!23719 () Bool)

(declare-fun e!84197 () Bool)

(assert (=> b!129012 (= c!23719 e!84197)))

(declare-fun res!62273 () Bool)

(assert (=> b!129012 (=> (not res!62273) (not e!84197))))

(assert (=> b!129012 (= res!62273 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!129013 () Bool)

(assert (=> b!129013 (= e!84198 call!13952)))

(declare-fun b!129014 () Bool)

(assert (=> b!129014 (= e!84202 e!84199)))

(declare-fun c!23721 () Bool)

(assert (=> b!129014 (= c!23721 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!129015 () Bool)

(assert (=> b!129015 (= e!84202 e!84196)))

(assert (=> b!129015 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun res!62270 () Bool)

(assert (=> b!129015 (= res!62270 (contains!869 lt!66942 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129015 (=> (not res!62270) (not e!84196))))

(declare-fun b!129016 () Bool)

(assert (=> b!129016 (= e!84197 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129016 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!129017 () Bool)

(assert (=> b!129017 (= e!84199 (isEmpty!405 lt!66942))))

(declare-fun d!39221 () Bool)

(assert (=> d!39221 e!84201))

(declare-fun res!62272 () Bool)

(assert (=> d!39221 (=> (not res!62272) (not e!84201))))

(assert (=> d!39221 (= res!62272 (not (contains!869 lt!66942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39221 (= lt!66942 e!84200)))

(declare-fun c!23720 () Bool)

(assert (=> d!39221 (= c!23720 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39221 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39221 (= (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!66942)))

(declare-fun bm!13949 () Bool)

(assert (=> bm!13949 (= call!13952 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16)))) (mask!7072 newMap!16) (ite c!23474 (ite c!23467 (extraKeys!2581 newMap!16) lt!66185) (extraKeys!2581 newMap!16)) (zeroValue!2665 newMap!16) (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!2804 newMap!16)))))

(assert (= (and d!39221 c!23720) b!129011))

(assert (= (and d!39221 (not c!23720)) b!129008))

(assert (= (and b!129008 c!23722) b!129009))

(assert (= (and b!129008 (not c!23722)) b!129013))

(assert (= (or b!129009 b!129013) bm!13949))

(assert (= (and d!39221 res!62272) b!129006))

(assert (= (and b!129006 res!62271) b!129012))

(assert (= (and b!129012 res!62273) b!129016))

(assert (= (and b!129012 c!23719) b!129015))

(assert (= (and b!129012 (not c!23719)) b!129014))

(assert (= (and b!129015 res!62270) b!129007))

(assert (= (and b!129014 c!23721) b!129010))

(assert (= (and b!129014 (not c!23721)) b!129017))

(declare-fun b_lambda!5715 () Bool)

(assert (=> (not b_lambda!5715) (not b!129007)))

(assert (=> b!129007 t!6065))

(declare-fun b_and!7981 () Bool)

(assert (= b_and!7977 (and (=> t!6065 result!3889) b_and!7981)))

(assert (=> b!129007 t!6067))

(declare-fun b_and!7983 () Bool)

(assert (= b_and!7979 (and (=> t!6067 result!3891) b_and!7983)))

(declare-fun b_lambda!5717 () Bool)

(assert (=> (not b_lambda!5717) (not b!129009)))

(assert (=> b!129009 t!6065))

(declare-fun b_and!7985 () Bool)

(assert (= b_and!7981 (and (=> t!6065 result!3889) b_and!7985)))

(assert (=> b!129009 t!6067))

(declare-fun b_and!7987 () Bool)

(assert (= b_and!7983 (and (=> t!6067 result!3891) b_and!7987)))

(declare-fun m!151573 () Bool)

(assert (=> d!39221 m!151573))

(assert (=> d!39221 m!149963))

(assert (=> b!129009 m!150011))

(assert (=> b!129009 m!149959))

(declare-fun m!151575 () Bool)

(assert (=> b!129009 m!151575))

(declare-fun m!151577 () Bool)

(assert (=> b!129009 m!151577))

(assert (=> b!129009 m!150353))

(declare-fun m!151579 () Bool)

(assert (=> b!129009 m!151579))

(declare-fun m!151581 () Bool)

(assert (=> b!129009 m!151581))

(assert (=> b!129009 m!151575))

(assert (=> b!129009 m!150353))

(assert (=> b!129009 m!150011))

(assert (=> b!129009 m!150355))

(assert (=> b!129015 m!149959))

(assert (=> b!129015 m!149959))

(declare-fun m!151583 () Bool)

(assert (=> b!129015 m!151583))

(declare-fun m!151585 () Bool)

(assert (=> bm!13949 m!151585))

(declare-fun m!151587 () Bool)

(assert (=> b!129006 m!151587))

(assert (=> b!129008 m!149959))

(assert (=> b!129008 m!149959))

(assert (=> b!129008 m!149965))

(assert (=> b!129010 m!151585))

(declare-fun m!151589 () Bool)

(assert (=> b!129017 m!151589))

(assert (=> b!129016 m!149959))

(assert (=> b!129016 m!149959))

(assert (=> b!129016 m!149965))

(assert (=> b!129007 m!150011))

(assert (=> b!129007 m!149959))

(assert (=> b!129007 m!150353))

(assert (=> b!129007 m!149959))

(declare-fun m!151591 () Bool)

(assert (=> b!129007 m!151591))

(assert (=> b!129007 m!150353))

(assert (=> b!129007 m!150011))

(assert (=> b!129007 m!150355))

(assert (=> b!128424 d!39221))

(declare-fun d!39223 () Bool)

(assert (=> d!39223 (= (apply!112 (+!165 lt!66508 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66503) (apply!112 lt!66508 lt!66503))))

(declare-fun lt!66944 () Unit!3985)

(assert (=> d!39223 (= lt!66944 (choose!780 lt!66508 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66503))))

(declare-fun e!84203 () Bool)

(assert (=> d!39223 e!84203))

(declare-fun res!62274 () Bool)

(assert (=> d!39223 (=> (not res!62274) (not e!84203))))

(assert (=> d!39223 (= res!62274 (contains!869 lt!66508 lt!66503))))

(assert (=> d!39223 (= (addApplyDifferent!88 lt!66508 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)) lt!66503) lt!66944)))

(declare-fun b!129018 () Bool)

(assert (=> b!129018 (= e!84203 (not (= lt!66503 lt!66494)))))

(assert (= (and d!39223 res!62274) b!129018))

(assert (=> d!39223 m!150337))

(declare-fun m!151593 () Bool)

(assert (=> d!39223 m!151593))

(assert (=> d!39223 m!150321))

(assert (=> d!39223 m!150323))

(declare-fun m!151595 () Bool)

(assert (=> d!39223 m!151595))

(assert (=> d!39223 m!150321))

(assert (=> b!128424 d!39223))

(declare-fun d!39225 () Bool)

(declare-fun e!84204 () Bool)

(assert (=> d!39225 e!84204))

(declare-fun res!62276 () Bool)

(assert (=> d!39225 (=> (not res!62276) (not e!84204))))

(declare-fun lt!66945 () ListLongMap!1639)

(assert (=> d!39225 (= res!62276 (contains!869 lt!66945 (_1!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))))))

(declare-fun lt!66947 () List!1682)

(assert (=> d!39225 (= lt!66945 (ListLongMap!1640 lt!66947))))

(declare-fun lt!66946 () Unit!3985)

(declare-fun lt!66948 () Unit!3985)

(assert (=> d!39225 (= lt!66946 lt!66948)))

(assert (=> d!39225 (= (getValueByKey!169 lt!66947 (_1!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39225 (= lt!66948 (lemmaContainsTupThenGetReturnValue!84 lt!66947 (_1!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39225 (= lt!66947 (insertStrictlySorted!87 (toList!835 lt!66505) (_1!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) (_2!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))))))

(assert (=> d!39225 (= (+!165 lt!66505 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))) lt!66945)))

(declare-fun b!129019 () Bool)

(declare-fun res!62275 () Bool)

(assert (=> b!129019 (=> (not res!62275) (not e!84204))))

(assert (=> b!129019 (= res!62275 (= (getValueByKey!169 (toList!835 lt!66945) (_1!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))))))))

(declare-fun b!129020 () Bool)

(assert (=> b!129020 (= e!84204 (contains!871 (toList!835 lt!66945) (tuple2!2537 lt!66506 (zeroValue!2665 newMap!16))))))

(assert (= (and d!39225 res!62276) b!129019))

(assert (= (and b!129019 res!62275) b!129020))

(declare-fun m!151597 () Bool)

(assert (=> d!39225 m!151597))

(declare-fun m!151599 () Bool)

(assert (=> d!39225 m!151599))

(declare-fun m!151601 () Bool)

(assert (=> d!39225 m!151601))

(declare-fun m!151603 () Bool)

(assert (=> d!39225 m!151603))

(declare-fun m!151605 () Bool)

(assert (=> b!129019 m!151605))

(declare-fun m!151607 () Bool)

(assert (=> b!129020 m!151607))

(assert (=> b!128424 d!39225))

(declare-fun d!39227 () Bool)

(assert (=> d!39227 (= (apply!112 (+!165 lt!66508 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!66503) (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66508 (tuple2!2537 lt!66494 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!66503)))))

(declare-fun bs!5369 () Bool)

(assert (= bs!5369 d!39227))

(declare-fun m!151609 () Bool)

(assert (=> bs!5369 m!151609))

(assert (=> bs!5369 m!151609))

(declare-fun m!151611 () Bool)

(assert (=> bs!5369 m!151611))

(assert (=> b!128424 d!39227))

(assert (=> d!38911 d!38921))

(declare-fun b!129024 () Bool)

(declare-fun e!84206 () Option!175)

(assert (=> b!129024 (= e!84206 None!173)))

(declare-fun b!129023 () Bool)

(assert (=> b!129023 (= e!84206 (getValueByKey!169 (t!6053 (toList!835 lt!66330)) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!39229 () Bool)

(declare-fun c!23723 () Bool)

(assert (=> d!39229 (= c!23723 (and ((_ is Cons!1678) (toList!835 lt!66330)) (= (_1!1279 (h!2281 (toList!835 lt!66330))) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84205 () Option!175)

(assert (=> d!39229 (= (getValueByKey!169 (toList!835 lt!66330) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84205)))

(declare-fun b!129022 () Bool)

(assert (=> b!129022 (= e!84205 e!84206)))

(declare-fun c!23724 () Bool)

(assert (=> b!129022 (= c!23724 (and ((_ is Cons!1678) (toList!835 lt!66330)) (not (= (_1!1279 (h!2281 (toList!835 lt!66330))) (_1!1279 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129021 () Bool)

(assert (=> b!129021 (= e!84205 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66330)))))))

(assert (= (and d!39229 c!23723) b!129021))

(assert (= (and d!39229 (not c!23723)) b!129022))

(assert (= (and b!129022 c!23724) b!129023))

(assert (= (and b!129022 (not c!23724)) b!129024))

(declare-fun m!151613 () Bool)

(assert (=> b!129023 m!151613))

(assert (=> b!128232 d!39229))

(assert (=> b!128313 d!39069))

(declare-fun b!129028 () Bool)

(declare-fun e!84207 () Bool)

(assert (=> b!129028 (= e!84207 (and (bvsge (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000011) (bvsge (_vacant!585 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000)))))

(declare-fun b!129025 () Bool)

(declare-fun res!62279 () Bool)

(assert (=> b!129025 (=> (not res!62279) (not e!84207))))

(assert (=> b!129025 (= res!62279 (and (= (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001)) (= (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (size!2494 (_values!2787 (v!3144 (underlying!443 thiss!992))))) (bvsge (_size!585 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000) (bvsle (_size!585 (v!3144 (underlying!443 thiss!992))) (bvadd (mask!7072 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001))))))

(declare-fun b!129026 () Bool)

(declare-fun res!62277 () Bool)

(assert (=> b!129026 (=> (not res!62277) (not e!84207))))

(assert (=> b!129026 (= res!62277 (bvsge (size!2499 (v!3144 (underlying!443 thiss!992))) (_size!585 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun d!39231 () Bool)

(declare-fun res!62278 () Bool)

(assert (=> d!39231 (=> (not res!62278) (not e!84207))))

(assert (=> d!39231 (= res!62278 (validMask!0 (mask!7072 (v!3144 (underlying!443 thiss!992)))))))

(assert (=> d!39231 (= (simpleValid!88 (v!3144 (underlying!443 thiss!992))) e!84207)))

(declare-fun b!129027 () Bool)

(declare-fun res!62280 () Bool)

(assert (=> b!129027 (=> (not res!62280) (not e!84207))))

(assert (=> b!129027 (= res!62280 (= (size!2499 (v!3144 (underlying!443 thiss!992))) (bvadd (_size!585 (v!3144 (underlying!443 thiss!992))) (bvsdiv (bvadd (extraKeys!2581 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!39231 res!62278) b!129025))

(assert (= (and b!129025 res!62279) b!129026))

(assert (= (and b!129026 res!62277) b!129027))

(assert (= (and b!129027 res!62280) b!129028))

(declare-fun m!151615 () Bool)

(assert (=> b!129026 m!151615))

(assert (=> d!39231 m!149737))

(assert (=> b!129027 m!151615))

(assert (=> d!38881 d!39231))

(assert (=> bm!13854 d!38883))

(assert (=> d!38887 d!38921))

(declare-fun b!129032 () Bool)

(declare-fun e!84209 () Option!175)

(assert (=> b!129032 (= e!84209 None!173)))

(declare-fun b!129031 () Bool)

(assert (=> b!129031 (= e!84209 (getValueByKey!169 (t!6053 (toList!835 lt!66532)) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!39233 () Bool)

(declare-fun c!23725 () Bool)

(assert (=> d!39233 (= c!23725 (and ((_ is Cons!1678) (toList!835 lt!66532)) (= (_1!1279 (h!2281 (toList!835 lt!66532))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84208 () Option!175)

(assert (=> d!39233 (= (getValueByKey!169 (toList!835 lt!66532) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84208)))

(declare-fun b!129030 () Bool)

(assert (=> b!129030 (= e!84208 e!84209)))

(declare-fun c!23726 () Bool)

(assert (=> b!129030 (= c!23726 (and ((_ is Cons!1678) (toList!835 lt!66532)) (not (= (_1!1279 (h!2281 (toList!835 lt!66532))) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129029 () Bool)

(assert (=> b!129029 (= e!84208 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66532)))))))

(assert (= (and d!39233 c!23725) b!129029))

(assert (= (and d!39233 (not c!23725)) b!129030))

(assert (= (and b!129030 c!23726) b!129031))

(assert (= (and b!129030 (not c!23726)) b!129032))

(declare-fun m!151617 () Bool)

(assert (=> b!129031 m!151617))

(assert (=> b!128444 d!39233))

(declare-fun d!39235 () Bool)

(declare-fun e!84211 () Bool)

(assert (=> d!39235 e!84211))

(declare-fun res!62281 () Bool)

(assert (=> d!39235 (=> res!62281 e!84211)))

(declare-fun lt!66949 () Bool)

(assert (=> d!39235 (= res!62281 (not lt!66949))))

(declare-fun lt!66952 () Bool)

(assert (=> d!39235 (= lt!66949 lt!66952)))

(declare-fun lt!66950 () Unit!3985)

(declare-fun e!84210 () Unit!3985)

(assert (=> d!39235 (= lt!66950 e!84210)))

(declare-fun c!23727 () Bool)

(assert (=> d!39235 (= c!23727 lt!66952)))

(assert (=> d!39235 (= lt!66952 (containsKey!172 (toList!835 lt!66510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39235 (= (contains!869 lt!66510 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66949)))

(declare-fun b!129033 () Bool)

(declare-fun lt!66951 () Unit!3985)

(assert (=> b!129033 (= e!84210 lt!66951)))

(assert (=> b!129033 (= lt!66951 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129033 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129034 () Bool)

(declare-fun Unit!4026 () Unit!3985)

(assert (=> b!129034 (= e!84210 Unit!4026)))

(declare-fun b!129035 () Bool)

(assert (=> b!129035 (= e!84211 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39235 c!23727) b!129033))

(assert (= (and d!39235 (not c!23727)) b!129034))

(assert (= (and d!39235 (not res!62281)) b!129035))

(declare-fun m!151619 () Bool)

(assert (=> d!39235 m!151619))

(declare-fun m!151621 () Bool)

(assert (=> b!129033 m!151621))

(declare-fun m!151623 () Bool)

(assert (=> b!129033 m!151623))

(assert (=> b!129033 m!151623))

(declare-fun m!151625 () Bool)

(assert (=> b!129033 m!151625))

(assert (=> b!129035 m!151623))

(assert (=> b!129035 m!151623))

(assert (=> b!129035 m!151625))

(assert (=> bm!13868 d!39235))

(declare-fun d!39237 () Bool)

(assert (=> d!39237 (= (get!1464 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3143 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!128302 d!39237))

(declare-fun d!39239 () Bool)

(declare-fun e!84213 () Bool)

(assert (=> d!39239 e!84213))

(declare-fun res!62282 () Bool)

(assert (=> d!39239 (=> res!62282 e!84213)))

(declare-fun lt!66953 () Bool)

(assert (=> d!39239 (= res!62282 (not lt!66953))))

(declare-fun lt!66956 () Bool)

(assert (=> d!39239 (= lt!66953 lt!66956)))

(declare-fun lt!66954 () Unit!3985)

(declare-fun e!84212 () Unit!3985)

(assert (=> d!39239 (= lt!66954 e!84212)))

(declare-fun c!23728 () Bool)

(assert (=> d!39239 (= c!23728 lt!66956)))

(assert (=> d!39239 (= lt!66956 (containsKey!172 (toList!835 lt!66292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39239 (= (contains!869 lt!66292 #b1000000000000000000000000000000000000000000000000000000000000000) lt!66953)))

(declare-fun b!129036 () Bool)

(declare-fun lt!66955 () Unit!3985)

(assert (=> b!129036 (= e!84212 lt!66955)))

(assert (=> b!129036 (= lt!66955 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129036 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129037 () Bool)

(declare-fun Unit!4027 () Unit!3985)

(assert (=> b!129037 (= e!84212 Unit!4027)))

(declare-fun b!129038 () Bool)

(assert (=> b!129038 (= e!84213 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39239 c!23728) b!129036))

(assert (= (and d!39239 (not c!23728)) b!129037))

(assert (= (and d!39239 (not res!62282)) b!129038))

(declare-fun m!151627 () Bool)

(assert (=> d!39239 m!151627))

(declare-fun m!151629 () Bool)

(assert (=> b!129036 m!151629))

(declare-fun m!151631 () Bool)

(assert (=> b!129036 m!151631))

(assert (=> b!129036 m!151631))

(declare-fun m!151633 () Bool)

(assert (=> b!129036 m!151633))

(assert (=> b!129038 m!151631))

(assert (=> b!129038 m!151631))

(assert (=> b!129038 m!151633))

(assert (=> bm!13839 d!39239))

(declare-fun b!129039 () Bool)

(declare-fun e!84216 () Bool)

(declare-fun e!84214 () Bool)

(assert (=> b!129039 (= e!84216 e!84214)))

(declare-fun c!23729 () Bool)

(assert (=> b!129039 (= c!23729 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!13950 () Bool)

(declare-fun call!13953 () Bool)

(assert (=> bm!13950 (= call!13953 (arrayNoDuplicates!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!23729 (Cons!1680 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000) Nil!1681) Nil!1681)))))

(declare-fun b!129040 () Bool)

(declare-fun e!84215 () Bool)

(assert (=> b!129040 (= e!84215 (contains!872 Nil!1681 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!39241 () Bool)

(declare-fun res!62284 () Bool)

(declare-fun e!84217 () Bool)

(assert (=> d!39241 (=> res!62284 e!84217)))

(assert (=> d!39241 (= res!62284 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!39241 (= (arrayNoDuplicates!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) #b00000000000000000000000000000000 Nil!1681) e!84217)))

(declare-fun b!129041 () Bool)

(assert (=> b!129041 (= e!84214 call!13953)))

(declare-fun b!129042 () Bool)

(assert (=> b!129042 (= e!84217 e!84216)))

(declare-fun res!62283 () Bool)

(assert (=> b!129042 (=> (not res!62283) (not e!84216))))

(assert (=> b!129042 (= res!62283 (not e!84215))))

(declare-fun res!62285 () Bool)

(assert (=> b!129042 (=> (not res!62285) (not e!84215))))

(assert (=> b!129042 (= res!62285 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!129043 () Bool)

(assert (=> b!129043 (= e!84214 call!13953)))

(assert (= (and d!39241 (not res!62284)) b!129042))

(assert (= (and b!129042 res!62285) b!129040))

(assert (= (and b!129042 res!62283) b!129039))

(assert (= (and b!129039 c!23729) b!129043))

(assert (= (and b!129039 (not c!23729)) b!129041))

(assert (= (or b!129043 b!129041) bm!13950))

(assert (=> b!129039 m!150601))

(assert (=> b!129039 m!150601))

(assert (=> b!129039 m!150603))

(assert (=> bm!13950 m!150601))

(declare-fun m!151635 () Bool)

(assert (=> bm!13950 m!151635))

(assert (=> b!129040 m!150601))

(assert (=> b!129040 m!150601))

(declare-fun m!151637 () Bool)

(assert (=> b!129040 m!151637))

(assert (=> b!129042 m!150601))

(assert (=> b!129042 m!150601))

(assert (=> b!129042 m!150603))

(assert (=> b!128387 d!39241))

(declare-fun d!39243 () Bool)

(declare-fun e!84219 () Bool)

(assert (=> d!39243 e!84219))

(declare-fun res!62286 () Bool)

(assert (=> d!39243 (=> res!62286 e!84219)))

(declare-fun lt!66957 () Bool)

(assert (=> d!39243 (= res!62286 (not lt!66957))))

(declare-fun lt!66960 () Bool)

(assert (=> d!39243 (= lt!66957 lt!66960)))

(declare-fun lt!66958 () Unit!3985)

(declare-fun e!84218 () Unit!3985)

(assert (=> d!39243 (= lt!66958 e!84218)))

(declare-fun c!23730 () Bool)

(assert (=> d!39243 (= c!23730 lt!66960)))

(assert (=> d!39243 (= lt!66960 (containsKey!172 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!39243 (= (contains!869 lt!66440 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66957)))

(declare-fun b!129044 () Bool)

(declare-fun lt!66959 () Unit!3985)

(assert (=> b!129044 (= e!84218 lt!66959)))

(assert (=> b!129044 (= lt!66959 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!129044 (isDefined!121 (getValueByKey!169 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129045 () Bool)

(declare-fun Unit!4028 () Unit!3985)

(assert (=> b!129045 (= e!84218 Unit!4028)))

(declare-fun b!129046 () Bool)

(assert (=> b!129046 (= e!84219 (isDefined!121 (getValueByKey!169 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(assert (= (and d!39243 c!23730) b!129044))

(assert (= (and d!39243 (not c!23730)) b!129045))

(assert (= (and d!39243 (not res!62286)) b!129046))

(declare-fun m!151639 () Bool)

(assert (=> d!39243 m!151639))

(declare-fun m!151641 () Bool)

(assert (=> b!129044 m!151641))

(assert (=> b!129044 m!150205))

(assert (=> b!129044 m!150205))

(declare-fun m!151643 () Bool)

(assert (=> b!129044 m!151643))

(assert (=> b!129046 m!150205))

(assert (=> b!129046 m!150205))

(assert (=> b!129046 m!151643))

(assert (=> d!38845 d!39243))

(declare-fun b!129050 () Bool)

(declare-fun e!84221 () Option!175)

(assert (=> b!129050 (= e!84221 None!173)))

(declare-fun b!129049 () Bool)

(assert (=> b!129049 (= e!84221 (getValueByKey!169 (t!6053 lt!66442) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun d!39245 () Bool)

(declare-fun c!23731 () Bool)

(assert (=> d!39245 (= c!23731 (and ((_ is Cons!1678) lt!66442) (= (_1!1279 (h!2281 lt!66442)) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun e!84220 () Option!175)

(assert (=> d!39245 (= (getValueByKey!169 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) e!84220)))

(declare-fun b!129048 () Bool)

(assert (=> b!129048 (= e!84220 e!84221)))

(declare-fun c!23732 () Bool)

(assert (=> b!129048 (= c!23732 (and ((_ is Cons!1678) lt!66442) (not (= (_1!1279 (h!2281 lt!66442)) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(declare-fun b!129047 () Bool)

(assert (=> b!129047 (= e!84220 (Some!174 (_2!1279 (h!2281 lt!66442))))))

(assert (= (and d!39245 c!23731) b!129047))

(assert (= (and d!39245 (not c!23731)) b!129048))

(assert (= (and b!129048 c!23732) b!129049))

(assert (= (and b!129048 (not c!23732)) b!129050))

(declare-fun m!151645 () Bool)

(assert (=> b!129049 m!151645))

(assert (=> d!38845 d!39245))

(declare-fun d!39247 () Bool)

(assert (=> d!39247 (= (getValueByKey!169 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (Some!174 (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun lt!66961 () Unit!3985)

(assert (=> d!39247 (= lt!66961 (choose!789 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84222 () Bool)

(assert (=> d!39247 e!84222))

(declare-fun res!62287 () Bool)

(assert (=> d!39247 (=> (not res!62287) (not e!84222))))

(assert (=> d!39247 (= res!62287 (isStrictlySorted!305 lt!66442))))

(assert (=> d!39247 (= (lemmaContainsTupThenGetReturnValue!84 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66961)))

(declare-fun b!129051 () Bool)

(declare-fun res!62288 () Bool)

(assert (=> b!129051 (=> (not res!62288) (not e!84222))))

(assert (=> b!129051 (= res!62288 (containsKey!172 lt!66442 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129052 () Bool)

(assert (=> b!129052 (= e!84222 (contains!871 lt!66442 (tuple2!2537 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(assert (= (and d!39247 res!62287) b!129051))

(assert (= (and b!129051 res!62288) b!129052))

(assert (=> d!39247 m!150199))

(declare-fun m!151647 () Bool)

(assert (=> d!39247 m!151647))

(declare-fun m!151649 () Bool)

(assert (=> d!39247 m!151649))

(declare-fun m!151651 () Bool)

(assert (=> b!129051 m!151651))

(declare-fun m!151653 () Bool)

(assert (=> b!129052 m!151653))

(assert (=> d!38845 d!39247))

(declare-fun call!13954 () List!1682)

(declare-fun bm!13951 () Bool)

(declare-fun e!84223 () List!1682)

(declare-fun c!23734 () Bool)

(assert (=> bm!13951 (= call!13954 ($colon$colon!89 e!84223 (ite c!23734 (h!2281 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (tuple2!2537 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(declare-fun c!23735 () Bool)

(assert (=> bm!13951 (= c!23735 c!23734)))

(declare-fun d!39249 () Bool)

(declare-fun e!84226 () Bool)

(assert (=> d!39249 e!84226))

(declare-fun res!62289 () Bool)

(assert (=> d!39249 (=> (not res!62289) (not e!84226))))

(declare-fun lt!66962 () List!1682)

(assert (=> d!39249 (= res!62289 (isStrictlySorted!305 lt!66962))))

(declare-fun e!84227 () List!1682)

(assert (=> d!39249 (= lt!66962 e!84227)))

(assert (=> d!39249 (= c!23734 (and ((_ is Cons!1678) (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (bvslt (_1!1279 (h!2281 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(assert (=> d!39249 (isStrictlySorted!305 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))))))

(assert (=> d!39249 (= (insertStrictlySorted!87 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66962)))

(declare-fun b!129053 () Bool)

(assert (=> b!129053 (= e!84223 (insertStrictlySorted!87 (t!6053 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129054 () Bool)

(assert (=> b!129054 (= e!84227 call!13954)))

(declare-fun b!129055 () Bool)

(declare-fun e!84224 () List!1682)

(assert (=> b!129055 (= e!84227 e!84224)))

(declare-fun c!23736 () Bool)

(assert (=> b!129055 (= c!23736 (and ((_ is Cons!1678) (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (= (_1!1279 (h!2281 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129056 () Bool)

(declare-fun e!84225 () List!1682)

(declare-fun call!13956 () List!1682)

(assert (=> b!129056 (= e!84225 call!13956)))

(declare-fun bm!13952 () Bool)

(declare-fun call!13955 () List!1682)

(assert (=> bm!13952 (= call!13956 call!13955)))

(declare-fun c!23733 () Bool)

(declare-fun b!129057 () Bool)

(assert (=> b!129057 (= e!84223 (ite c!23736 (t!6053 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (ite c!23733 (Cons!1678 (h!2281 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (t!6053 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))))) Nil!1679)))))

(declare-fun b!129058 () Bool)

(assert (=> b!129058 (= e!84225 call!13956)))

(declare-fun b!129059 () Bool)

(assert (=> b!129059 (= e!84226 (contains!871 lt!66962 (tuple2!2537 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (_2!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129060 () Bool)

(assert (=> b!129060 (= c!23733 (and ((_ is Cons!1678) (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833)))) (bvsgt (_1!1279 (h!2281 (toList!835 (ite c!23492 call!13834 (ite c!23496 call!13837 call!13833))))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(assert (=> b!129060 (= e!84224 e!84225)))

(declare-fun b!129061 () Bool)

(declare-fun res!62290 () Bool)

(assert (=> b!129061 (=> (not res!62290) (not e!84226))))

(assert (=> b!129061 (= res!62290 (containsKey!172 lt!66962 (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun bm!13953 () Bool)

(assert (=> bm!13953 (= call!13955 call!13954)))

(declare-fun b!129062 () Bool)

(assert (=> b!129062 (= e!84224 call!13955)))

(assert (= (and d!39249 c!23734) b!129054))

(assert (= (and d!39249 (not c!23734)) b!129055))

(assert (= (and b!129055 c!23736) b!129062))

(assert (= (and b!129055 (not c!23736)) b!129060))

(assert (= (and b!129060 c!23733) b!129058))

(assert (= (and b!129060 (not c!23733)) b!129056))

(assert (= (or b!129058 b!129056) bm!13952))

(assert (= (or b!129062 bm!13952) bm!13953))

(assert (= (or b!129054 bm!13953) bm!13951))

(assert (= (and bm!13951 c!23735) b!129053))

(assert (= (and bm!13951 (not c!23735)) b!129057))

(assert (= (and d!39249 res!62289) b!129061))

(assert (= (and b!129061 res!62290) b!129059))

(declare-fun m!151655 () Bool)

(assert (=> b!129061 m!151655))

(declare-fun m!151657 () Bool)

(assert (=> b!129053 m!151657))

(declare-fun m!151659 () Bool)

(assert (=> d!39249 m!151659))

(declare-fun m!151661 () Bool)

(assert (=> d!39249 m!151661))

(declare-fun m!151663 () Bool)

(assert (=> bm!13951 m!151663))

(declare-fun m!151665 () Bool)

(assert (=> b!129059 m!151665))

(assert (=> d!38845 d!39249))

(declare-fun d!39251 () Bool)

(declare-fun res!62291 () Bool)

(declare-fun e!84228 () Bool)

(assert (=> d!39251 (=> res!62291 e!84228)))

(assert (=> d!39251 (= res!62291 (and ((_ is Cons!1678) (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (= (_1!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (=> d!39251 (= (containsKey!172 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84228)))

(declare-fun b!129063 () Bool)

(declare-fun e!84229 () Bool)

(assert (=> b!129063 (= e!84228 e!84229)))

(declare-fun res!62292 () Bool)

(assert (=> b!129063 (=> (not res!62292) (not e!84229))))

(assert (=> b!129063 (= res!62292 (and (or (not ((_ is Cons!1678) (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (bvsle (_1!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) ((_ is Cons!1678) (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (bvslt (_1!1279 (h!2281 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun b!129064 () Bool)

(assert (=> b!129064 (= e!84229 (containsKey!172 (t!6053 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39251 (not res!62291)) b!129063))

(assert (= (and b!129063 res!62292) b!129064))

(assert (=> b!129064 m!149721))

(declare-fun m!151667 () Bool)

(assert (=> b!129064 m!151667))

(assert (=> d!38901 d!39251))

(declare-fun bm!13954 () Bool)

(declare-fun call!13963 () ListLongMap!1639)

(declare-fun call!13960 () ListLongMap!1639)

(assert (=> bm!13954 (= call!13963 call!13960)))

(declare-fun b!129065 () Bool)

(declare-fun res!62299 () Bool)

(declare-fun e!84231 () Bool)

(assert (=> b!129065 (=> (not res!62299) (not e!84231))))

(declare-fun e!84240 () Bool)

(assert (=> b!129065 (= res!62299 e!84240)))

(declare-fun c!23740 () Bool)

(assert (=> b!129065 (= c!23740 (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129066 () Bool)

(declare-fun e!84234 () Bool)

(assert (=> b!129066 (= e!84234 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun b!129067 () Bool)

(declare-fun e!84236 () ListLongMap!1639)

(declare-fun e!84241 () ListLongMap!1639)

(assert (=> b!129067 (= e!84236 e!84241)))

(declare-fun c!23742 () Bool)

(assert (=> b!129067 (= c!23742 (and (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129068 () Bool)

(declare-fun call!13961 () Bool)

(assert (=> b!129068 (= e!84240 (not call!13961))))

(declare-fun bm!13955 () Bool)

(declare-fun lt!66984 () ListLongMap!1639)

(assert (=> bm!13955 (= call!13961 (contains!869 lt!66984 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13956 () Bool)

(declare-fun call!13958 () ListLongMap!1639)

(declare-fun call!13962 () ListLongMap!1639)

(assert (=> bm!13956 (= call!13958 call!13962)))

(declare-fun b!129069 () Bool)

(declare-fun e!84238 () Bool)

(assert (=> b!129069 (= e!84238 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(declare-fun b!129070 () Bool)

(declare-fun e!84230 () Bool)

(assert (=> b!129070 (= e!84230 (= (apply!112 lt!66984 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 (_2!1280 lt!66196))))))

(declare-fun b!129071 () Bool)

(assert (=> b!129071 (= e!84240 e!84230)))

(declare-fun res!62294 () Bool)

(assert (=> b!129071 (= res!62294 call!13961)))

(assert (=> b!129071 (=> (not res!62294) (not e!84230))))

(declare-fun d!39253 () Bool)

(assert (=> d!39253 e!84231))

(declare-fun res!62295 () Bool)

(assert (=> d!39253 (=> (not res!62295) (not e!84231))))

(assert (=> d!39253 (= res!62295 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))))

(declare-fun lt!66972 () ListLongMap!1639)

(assert (=> d!39253 (= lt!66984 lt!66972)))

(declare-fun lt!66976 () Unit!3985)

(declare-fun e!84237 () Unit!3985)

(assert (=> d!39253 (= lt!66976 e!84237)))

(declare-fun c!23741 () Bool)

(assert (=> d!39253 (= c!23741 e!84234)))

(declare-fun res!62296 () Bool)

(assert (=> d!39253 (=> (not res!62296) (not e!84234))))

(assert (=> d!39253 (= res!62296 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(assert (=> d!39253 (= lt!66972 e!84236)))

(declare-fun c!23738 () Bool)

(assert (=> d!39253 (= c!23738 (and (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39253 (validMask!0 (mask!7072 (_2!1280 lt!66196)))))

(assert (=> d!39253 (= (getCurrentListMap!514 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))) lt!66984)))

(declare-fun b!129072 () Bool)

(declare-fun Unit!4029 () Unit!3985)

(assert (=> b!129072 (= e!84237 Unit!4029)))

(declare-fun bm!13957 () Bool)

(declare-fun call!13957 () Bool)

(assert (=> bm!13957 (= call!13957 (contains!869 lt!66984 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129073 () Bool)

(declare-fun e!84233 () ListLongMap!1639)

(assert (=> b!129073 (= e!84233 call!13963)))

(declare-fun b!129074 () Bool)

(declare-fun e!84232 () Bool)

(assert (=> b!129074 (= e!84232 (not call!13957))))

(declare-fun b!129075 () Bool)

(declare-fun e!84235 () Bool)

(declare-fun e!84239 () Bool)

(assert (=> b!129075 (= e!84235 e!84239)))

(declare-fun res!62300 () Bool)

(assert (=> b!129075 (=> (not res!62300) (not e!84239))))

(assert (=> b!129075 (= res!62300 (contains!869 lt!66984 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(assert (=> b!129075 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(declare-fun bm!13958 () Bool)

(declare-fun call!13959 () ListLongMap!1639)

(assert (=> bm!13958 (= call!13959 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun b!129076 () Bool)

(assert (=> b!129076 (= e!84236 (+!165 call!13960 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (_2!1280 lt!66196)))))))

(declare-fun bm!13959 () Bool)

(assert (=> bm!13959 (= call!13962 call!13959)))

(declare-fun b!129077 () Bool)

(assert (=> b!129077 (= e!84231 e!84232)))

(declare-fun c!23739 () Bool)

(assert (=> b!129077 (= c!23739 (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129078 () Bool)

(assert (=> b!129078 (= e!84239 (= (apply!112 lt!66984 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 (_values!2787 (_2!1280 lt!66196))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 (_2!1280 lt!66196)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 (_values!2787 (_2!1280 lt!66196)))))))

(assert (=> b!129078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(declare-fun b!129079 () Bool)

(declare-fun res!62301 () Bool)

(assert (=> b!129079 (=> (not res!62301) (not e!84231))))

(assert (=> b!129079 (= res!62301 e!84235)))

(declare-fun res!62293 () Bool)

(assert (=> b!129079 (=> res!62293 e!84235)))

(assert (=> b!129079 (= res!62293 (not e!84238))))

(declare-fun res!62298 () Bool)

(assert (=> b!129079 (=> (not res!62298) (not e!84238))))

(assert (=> b!129079 (= res!62298 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(declare-fun bm!13960 () Bool)

(assert (=> bm!13960 (= call!13960 (+!165 (ite c!23738 call!13959 (ite c!23742 call!13962 call!13958)) (ite (or c!23738 c!23742) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (_2!1280 lt!66196))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (_2!1280 lt!66196))))))))

(declare-fun b!129080 () Bool)

(declare-fun lt!66963 () Unit!3985)

(assert (=> b!129080 (= e!84237 lt!66963)))

(declare-fun lt!66965 () ListLongMap!1639)

(assert (=> b!129080 (= lt!66965 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun lt!66969 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66969 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66966 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66966 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000))))

(declare-fun lt!66983 () Unit!3985)

(assert (=> b!129080 (= lt!66983 (addStillContains!88 lt!66965 lt!66969 (zeroValue!2665 (_2!1280 lt!66196)) lt!66966))))

(assert (=> b!129080 (contains!869 (+!165 lt!66965 (tuple2!2537 lt!66969 (zeroValue!2665 (_2!1280 lt!66196)))) lt!66966)))

(declare-fun lt!66970 () Unit!3985)

(assert (=> b!129080 (= lt!66970 lt!66983)))

(declare-fun lt!66982 () ListLongMap!1639)

(assert (=> b!129080 (= lt!66982 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun lt!66968 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66968 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66977 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66977 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000))))

(declare-fun lt!66978 () Unit!3985)

(assert (=> b!129080 (= lt!66978 (addApplyDifferent!88 lt!66982 lt!66968 (minValue!2665 (_2!1280 lt!66196)) lt!66977))))

(assert (=> b!129080 (= (apply!112 (+!165 lt!66982 (tuple2!2537 lt!66968 (minValue!2665 (_2!1280 lt!66196)))) lt!66977) (apply!112 lt!66982 lt!66977))))

(declare-fun lt!66974 () Unit!3985)

(assert (=> b!129080 (= lt!66974 lt!66978)))

(declare-fun lt!66979 () ListLongMap!1639)

(assert (=> b!129080 (= lt!66979 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun lt!66980 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66980 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66971 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66971 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000))))

(declare-fun lt!66973 () Unit!3985)

(assert (=> b!129080 (= lt!66973 (addApplyDifferent!88 lt!66979 lt!66980 (zeroValue!2665 (_2!1280 lt!66196)) lt!66971))))

(assert (=> b!129080 (= (apply!112 (+!165 lt!66979 (tuple2!2537 lt!66980 (zeroValue!2665 (_2!1280 lt!66196)))) lt!66971) (apply!112 lt!66979 lt!66971))))

(declare-fun lt!66967 () Unit!3985)

(assert (=> b!129080 (= lt!66967 lt!66973)))

(declare-fun lt!66981 () ListLongMap!1639)

(assert (=> b!129080 (= lt!66981 (getCurrentListMapNoExtraKeys!132 (_keys!4541 (_2!1280 lt!66196)) (_values!2787 (_2!1280 lt!66196)) (mask!7072 (_2!1280 lt!66196)) (extraKeys!2581 (_2!1280 lt!66196)) (zeroValue!2665 (_2!1280 lt!66196)) (minValue!2665 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (defaultEntry!2804 (_2!1280 lt!66196))))))

(declare-fun lt!66975 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66975 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!66964 () (_ BitVec 64))

(assert (=> b!129080 (= lt!66964 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000))))

(assert (=> b!129080 (= lt!66963 (addApplyDifferent!88 lt!66981 lt!66975 (minValue!2665 (_2!1280 lt!66196)) lt!66964))))

(assert (=> b!129080 (= (apply!112 (+!165 lt!66981 (tuple2!2537 lt!66975 (minValue!2665 (_2!1280 lt!66196)))) lt!66964) (apply!112 lt!66981 lt!66964))))

(declare-fun b!129081 () Bool)

(assert (=> b!129081 (= e!84233 call!13958)))

(declare-fun b!129082 () Bool)

(declare-fun e!84242 () Bool)

(assert (=> b!129082 (= e!84242 (= (apply!112 lt!66984 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 (_2!1280 lt!66196))))))

(declare-fun b!129083 () Bool)

(assert (=> b!129083 (= e!84241 call!13963)))

(declare-fun b!129084 () Bool)

(declare-fun c!23737 () Bool)

(assert (=> b!129084 (= c!23737 (and (not (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129084 (= e!84241 e!84233)))

(declare-fun b!129085 () Bool)

(assert (=> b!129085 (= e!84232 e!84242)))

(declare-fun res!62297 () Bool)

(assert (=> b!129085 (= res!62297 call!13957)))

(assert (=> b!129085 (=> (not res!62297) (not e!84242))))

(assert (= (and d!39253 c!23738) b!129076))

(assert (= (and d!39253 (not c!23738)) b!129067))

(assert (= (and b!129067 c!23742) b!129083))

(assert (= (and b!129067 (not c!23742)) b!129084))

(assert (= (and b!129084 c!23737) b!129073))

(assert (= (and b!129084 (not c!23737)) b!129081))

(assert (= (or b!129073 b!129081) bm!13956))

(assert (= (or b!129083 bm!13956) bm!13959))

(assert (= (or b!129083 b!129073) bm!13954))

(assert (= (or b!129076 bm!13959) bm!13958))

(assert (= (or b!129076 bm!13954) bm!13960))

(assert (= (and d!39253 res!62296) b!129066))

(assert (= (and d!39253 c!23741) b!129080))

(assert (= (and d!39253 (not c!23741)) b!129072))

(assert (= (and d!39253 res!62295) b!129079))

(assert (= (and b!129079 res!62298) b!129069))

(assert (= (and b!129079 (not res!62293)) b!129075))

(assert (= (and b!129075 res!62300) b!129078))

(assert (= (and b!129079 res!62301) b!129065))

(assert (= (and b!129065 c!23740) b!129071))

(assert (= (and b!129065 (not c!23740)) b!129068))

(assert (= (and b!129071 res!62294) b!129070))

(assert (= (or b!129071 b!129068) bm!13955))

(assert (= (and b!129065 res!62299) b!129077))

(assert (= (and b!129077 c!23739) b!129085))

(assert (= (and b!129077 (not c!23739)) b!129074))

(assert (= (and b!129085 res!62297) b!129082))

(assert (= (or b!129085 b!129074) bm!13957))

(declare-fun b_lambda!5719 () Bool)

(assert (=> (not b_lambda!5719) (not b!129078)))

(declare-fun t!6069 () Bool)

(declare-fun tb!2349 () Bool)

(assert (=> (and b!127810 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 (_2!1280 lt!66196))) t!6069) tb!2349))

(declare-fun result!3893 () Bool)

(assert (=> tb!2349 (= result!3893 tp_is_empty!2851)))

(assert (=> b!129078 t!6069))

(declare-fun b_and!7989 () Bool)

(assert (= b_and!7985 (and (=> t!6069 result!3893) b_and!7989)))

(declare-fun tb!2351 () Bool)

(declare-fun t!6071 () Bool)

(assert (=> (and b!127825 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (_2!1280 lt!66196))) t!6071) tb!2351))

(declare-fun result!3895 () Bool)

(assert (= result!3895 result!3893))

(assert (=> b!129078 t!6071))

(declare-fun b_and!7991 () Bool)

(assert (= b_and!7987 (and (=> t!6071 result!3895) b_and!7991)))

(declare-fun m!151669 () Bool)

(assert (=> bm!13955 m!151669))

(declare-fun m!151671 () Bool)

(assert (=> bm!13958 m!151671))

(assert (=> b!129075 m!150899))

(assert (=> b!129075 m!150899))

(declare-fun m!151673 () Bool)

(assert (=> b!129075 m!151673))

(declare-fun m!151675 () Bool)

(assert (=> d!39253 m!151675))

(assert (=> b!129069 m!150899))

(assert (=> b!129069 m!150899))

(assert (=> b!129069 m!150901))

(assert (=> b!129066 m!150899))

(assert (=> b!129066 m!150899))

(assert (=> b!129066 m!150901))

(declare-fun m!151677 () Bool)

(assert (=> b!129076 m!151677))

(declare-fun m!151679 () Bool)

(assert (=> bm!13957 m!151679))

(declare-fun m!151681 () Bool)

(assert (=> b!129082 m!151681))

(declare-fun m!151683 () Bool)

(assert (=> b!129080 m!151683))

(declare-fun m!151685 () Bool)

(assert (=> b!129080 m!151685))

(declare-fun m!151687 () Bool)

(assert (=> b!129080 m!151687))

(declare-fun m!151689 () Bool)

(assert (=> b!129080 m!151689))

(declare-fun m!151691 () Bool)

(assert (=> b!129080 m!151691))

(declare-fun m!151693 () Bool)

(assert (=> b!129080 m!151693))

(declare-fun m!151695 () Bool)

(assert (=> b!129080 m!151695))

(declare-fun m!151697 () Bool)

(assert (=> b!129080 m!151697))

(declare-fun m!151699 () Bool)

(assert (=> b!129080 m!151699))

(assert (=> b!129080 m!151687))

(declare-fun m!151701 () Bool)

(assert (=> b!129080 m!151701))

(declare-fun m!151703 () Bool)

(assert (=> b!129080 m!151703))

(declare-fun m!151705 () Bool)

(assert (=> b!129080 m!151705))

(declare-fun m!151707 () Bool)

(assert (=> b!129080 m!151707))

(assert (=> b!129080 m!151697))

(declare-fun m!151709 () Bool)

(assert (=> b!129080 m!151709))

(declare-fun m!151711 () Bool)

(assert (=> b!129080 m!151711))

(assert (=> b!129080 m!150899))

(assert (=> b!129080 m!151691))

(assert (=> b!129080 m!151705))

(assert (=> b!129080 m!151671))

(declare-fun m!151713 () Bool)

(assert (=> b!129070 m!151713))

(declare-fun m!151715 () Bool)

(assert (=> bm!13960 m!151715))

(assert (=> b!129078 m!150899))

(assert (=> b!129078 m!150899))

(declare-fun m!151717 () Bool)

(assert (=> b!129078 m!151717))

(declare-fun m!151719 () Bool)

(assert (=> b!129078 m!151719))

(declare-fun m!151721 () Bool)

(assert (=> b!129078 m!151721))

(declare-fun m!151723 () Bool)

(assert (=> b!129078 m!151723))

(assert (=> b!129078 m!151719))

(assert (=> b!129078 m!151721))

(assert (=> d!38855 d!39253))

(assert (=> bm!13885 d!38807))

(declare-fun d!39255 () Bool)

(declare-fun res!62302 () Bool)

(declare-fun e!84243 () Bool)

(assert (=> d!39255 (=> res!62302 e!84243)))

(assert (=> d!39255 (= res!62302 (and ((_ is Cons!1678) (toList!835 call!13817)) (= (_1!1279 (h!2281 (toList!835 call!13817))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(assert (=> d!39255 (= (containsKey!172 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84243)))

(declare-fun b!129086 () Bool)

(declare-fun e!84244 () Bool)

(assert (=> b!129086 (= e!84243 e!84244)))

(declare-fun res!62303 () Bool)

(assert (=> b!129086 (=> (not res!62303) (not e!84244))))

(assert (=> b!129086 (= res!62303 (and (or (not ((_ is Cons!1678) (toList!835 call!13817))) (bvsle (_1!1279 (h!2281 (toList!835 call!13817))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) ((_ is Cons!1678) (toList!835 call!13817)) (bvslt (_1!1279 (h!2281 (toList!835 call!13817))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun b!129087 () Bool)

(assert (=> b!129087 (= e!84244 (containsKey!172 (t!6053 (toList!835 call!13817)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39255 (not res!62302)) b!129086))

(assert (= (and b!129086 res!62303) b!129087))

(assert (=> b!129087 m!149721))

(declare-fun m!151725 () Bool)

(assert (=> b!129087 m!151725))

(assert (=> d!38903 d!39255))

(declare-fun d!39257 () Bool)

(assert (=> d!39257 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun lt!66985 () Unit!3985)

(assert (=> d!39257 (= lt!66985 (choose!784 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!84245 () Bool)

(assert (=> d!39257 e!84245))

(declare-fun res!62304 () Bool)

(assert (=> d!39257 (=> (not res!62304) (not e!84245))))

(assert (=> d!39257 (= res!62304 (isStrictlySorted!305 (toList!835 lt!66270)))))

(assert (=> d!39257 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!66985)))

(declare-fun b!129088 () Bool)

(assert (=> b!129088 (= e!84245 (containsKey!172 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39257 res!62304) b!129088))

(assert (=> d!39257 m!149899))

(assert (=> d!39257 m!150223))

(assert (=> d!39257 m!150223))

(assert (=> d!39257 m!150491))

(assert (=> d!39257 m!149899))

(declare-fun m!151727 () Bool)

(assert (=> d!39257 m!151727))

(assert (=> d!39257 m!151109))

(assert (=> b!129088 m!149899))

(assert (=> b!129088 m!150487))

(assert (=> b!128493 d!39257))

(assert (=> b!128493 d!38945))

(assert (=> b!128493 d!38947))

(declare-fun d!39259 () Bool)

(assert (=> d!39259 (= (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66250)) (v!3150 (getValueByKey!169 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66250)))))

(assert (=> d!38827 d!39259))

(declare-fun b!129092 () Bool)

(declare-fun e!84247 () Option!175)

(assert (=> b!129092 (= e!84247 None!173)))

(declare-fun b!129091 () Bool)

(assert (=> b!129091 (= e!84247 (getValueByKey!169 (t!6053 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66250))))

(declare-fun c!23743 () Bool)

(declare-fun d!39261 () Bool)

(assert (=> d!39261 (= c!23743 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66250)))))

(declare-fun e!84246 () Option!175)

(assert (=> d!39261 (= (getValueByKey!169 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66250) e!84246)))

(declare-fun b!129090 () Bool)

(assert (=> b!129090 (= e!84246 e!84247)))

(declare-fun c!23744 () Bool)

(assert (=> b!129090 (= c!23744 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (not (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66250))))))

(declare-fun b!129089 () Bool)

(assert (=> b!129089 (= e!84246 (Some!174 (_2!1279 (h!2281 (toList!835 (+!165 lt!66267 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(assert (= (and d!39261 c!23743) b!129089))

(assert (= (and d!39261 (not c!23743)) b!129090))

(assert (= (and b!129090 c!23744) b!129091))

(assert (= (and b!129090 (not c!23744)) b!129092))

(declare-fun m!151729 () Bool)

(assert (=> b!129091 m!151729))

(assert (=> d!38827 d!39261))

(declare-fun d!39263 () Bool)

(declare-fun e!84248 () Bool)

(assert (=> d!39263 e!84248))

(declare-fun res!62306 () Bool)

(assert (=> d!39263 (=> (not res!62306) (not e!84248))))

(declare-fun lt!66986 () ListLongMap!1639)

(assert (=> d!39263 (= res!62306 (contains!869 lt!66986 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun lt!66988 () List!1682)

(assert (=> d!39263 (= lt!66986 (ListLongMap!1640 lt!66988))))

(declare-fun lt!66987 () Unit!3985)

(declare-fun lt!66989 () Unit!3985)

(assert (=> d!39263 (= lt!66987 lt!66989)))

(assert (=> d!39263 (= (getValueByKey!169 lt!66988 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39263 (= lt!66989 (lemmaContainsTupThenGetReturnValue!84 lt!66988 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39263 (= lt!66988 (insertStrictlySorted!87 (toList!835 call!13880) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(assert (=> d!39263 (= (+!165 call!13880 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))) lt!66986)))

(declare-fun b!129093 () Bool)

(declare-fun res!62305 () Bool)

(assert (=> b!129093 (=> (not res!62305) (not e!84248))))

(assert (=> b!129093 (= res!62305 (= (getValueByKey!169 (toList!835 lt!66986) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))))

(declare-fun b!129094 () Bool)

(assert (=> b!129094 (= e!84248 (contains!871 (toList!835 lt!66986) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(assert (= (and d!39263 res!62306) b!129093))

(assert (= (and b!129093 res!62305) b!129094))

(declare-fun m!151731 () Bool)

(assert (=> d!39263 m!151731))

(declare-fun m!151733 () Bool)

(assert (=> d!39263 m!151733))

(declare-fun m!151735 () Bool)

(assert (=> d!39263 m!151735))

(declare-fun m!151737 () Bool)

(assert (=> d!39263 m!151737))

(declare-fun m!151739 () Bool)

(assert (=> b!129093 m!151739))

(declare-fun m!151741 () Bool)

(assert (=> b!129094 m!151741))

(assert (=> b!128459 d!39263))

(declare-fun lt!66990 () Bool)

(declare-fun d!39265 () Bool)

(assert (=> d!39265 (= lt!66990 (select (content!128 (toList!835 lt!66346)) (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun e!84250 () Bool)

(assert (=> d!39265 (= lt!66990 e!84250)))

(declare-fun res!62308 () Bool)

(assert (=> d!39265 (=> (not res!62308) (not e!84250))))

(assert (=> d!39265 (= res!62308 ((_ is Cons!1678) (toList!835 lt!66346)))))

(assert (=> d!39265 (= (contains!871 (toList!835 lt!66346) (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66990)))

(declare-fun b!129095 () Bool)

(declare-fun e!84249 () Bool)

(assert (=> b!129095 (= e!84250 e!84249)))

(declare-fun res!62307 () Bool)

(assert (=> b!129095 (=> res!62307 e!84249)))

(assert (=> b!129095 (= res!62307 (= (h!2281 (toList!835 lt!66346)) (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(declare-fun b!129096 () Bool)

(assert (=> b!129096 (= e!84249 (contains!871 (t!6053 (toList!835 lt!66346)) (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))

(assert (= (and d!39265 res!62308) b!129095))

(assert (= (and b!129095 (not res!62307)) b!129096))

(declare-fun m!151743 () Bool)

(assert (=> d!39265 m!151743))

(declare-fun m!151745 () Bool)

(assert (=> d!39265 m!151745))

(declare-fun m!151747 () Bool)

(assert (=> b!129096 m!151747))

(assert (=> b!128242 d!39265))

(assert (=> b!128162 d!39059))

(declare-fun d!39267 () Bool)

(declare-fun res!62309 () Bool)

(declare-fun e!84251 () Bool)

(assert (=> d!39267 (=> res!62309 e!84251)))

(assert (=> d!39267 (= res!62309 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39267 (= (containsKey!172 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000) e!84251)))

(declare-fun b!129097 () Bool)

(declare-fun e!84252 () Bool)

(assert (=> b!129097 (= e!84251 e!84252)))

(declare-fun res!62310 () Bool)

(assert (=> b!129097 (=> (not res!62310) (not e!84252))))

(assert (=> b!129097 (= res!62310 (and (or (not ((_ is Cons!1678) (toList!835 lt!66270))) (bvsle (_1!1279 (h!2281 (toList!835 lt!66270))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1678) (toList!835 lt!66270)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66270))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129098 () Bool)

(assert (=> b!129098 (= e!84252 (containsKey!172 (t!6053 (toList!835 lt!66270)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39267 (not res!62309)) b!129097))

(assert (= (and b!129097 res!62310) b!129098))

(declare-fun m!151749 () Bool)

(assert (=> b!129098 m!151749))

(assert (=> d!38865 d!39267))

(declare-fun lt!66991 () Bool)

(declare-fun d!39269 () Bool)

(assert (=> d!39269 (= lt!66991 (select (content!128 (toList!835 lt!66511)) (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84254 () Bool)

(assert (=> d!39269 (= lt!66991 e!84254)))

(declare-fun res!62312 () Bool)

(assert (=> d!39269 (=> (not res!62312) (not e!84254))))

(assert (=> d!39269 (= res!62312 ((_ is Cons!1678) (toList!835 lt!66511)))))

(assert (=> d!39269 (= (contains!871 (toList!835 lt!66511) (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66991)))

(declare-fun b!129099 () Bool)

(declare-fun e!84253 () Bool)

(assert (=> b!129099 (= e!84254 e!84253)))

(declare-fun res!62311 () Bool)

(assert (=> b!129099 (=> res!62311 e!84253)))

(assert (=> b!129099 (= res!62311 (= (h!2281 (toList!835 lt!66511)) (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129100 () Bool)

(assert (=> b!129100 (= e!84253 (contains!871 (t!6053 (toList!835 lt!66511)) (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!39269 res!62312) b!129099))

(assert (= (and b!129099 (not res!62311)) b!129100))

(declare-fun m!151751 () Bool)

(assert (=> d!39269 m!151751))

(declare-fun m!151753 () Bool)

(assert (=> d!39269 m!151753))

(declare-fun m!151755 () Bool)

(assert (=> b!129100 m!151755))

(assert (=> b!128431 d!39269))

(declare-fun d!39271 () Bool)

(declare-fun e!84256 () Bool)

(assert (=> d!39271 e!84256))

(declare-fun res!62313 () Bool)

(assert (=> d!39271 (=> res!62313 e!84256)))

(declare-fun lt!66992 () Bool)

(assert (=> d!39271 (= res!62313 (not lt!66992))))

(declare-fun lt!66995 () Bool)

(assert (=> d!39271 (= lt!66992 lt!66995)))

(declare-fun lt!66993 () Unit!3985)

(declare-fun e!84255 () Unit!3985)

(assert (=> d!39271 (= lt!66993 e!84255)))

(declare-fun c!23745 () Bool)

(assert (=> d!39271 (= c!23745 lt!66995)))

(assert (=> d!39271 (= lt!66995 (containsKey!172 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!39271 (= (contains!869 lt!66536 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66992)))

(declare-fun b!129101 () Bool)

(declare-fun lt!66994 () Unit!3985)

(assert (=> b!129101 (= e!84255 lt!66994)))

(assert (=> b!129101 (= lt!66994 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!129101 (isDefined!121 (getValueByKey!169 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129102 () Bool)

(declare-fun Unit!4030 () Unit!3985)

(assert (=> b!129102 (= e!84255 Unit!4030)))

(declare-fun b!129103 () Bool)

(assert (=> b!129103 (= e!84256 (isDefined!121 (getValueByKey!169 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39271 c!23745) b!129101))

(assert (= (and d!39271 (not c!23745)) b!129102))

(assert (= (and d!39271 (not res!62313)) b!129103))

(declare-fun m!151757 () Bool)

(assert (=> d!39271 m!151757))

(declare-fun m!151759 () Bool)

(assert (=> b!129101 m!151759))

(assert (=> b!129101 m!150423))

(assert (=> b!129101 m!150423))

(declare-fun m!151761 () Bool)

(assert (=> b!129101 m!151761))

(assert (=> b!129103 m!150423))

(assert (=> b!129103 m!150423))

(assert (=> b!129103 m!151761))

(assert (=> d!38909 d!39271))

(declare-fun b!129107 () Bool)

(declare-fun e!84258 () Option!175)

(assert (=> b!129107 (= e!84258 None!173)))

(declare-fun b!129106 () Bool)

(assert (=> b!129106 (= e!84258 (getValueByKey!169 (t!6053 lt!66538) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!39273 () Bool)

(declare-fun c!23746 () Bool)

(assert (=> d!39273 (= c!23746 (and ((_ is Cons!1678) lt!66538) (= (_1!1279 (h!2281 lt!66538)) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84257 () Option!175)

(assert (=> d!39273 (= (getValueByKey!169 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84257)))

(declare-fun b!129105 () Bool)

(assert (=> b!129105 (= e!84257 e!84258)))

(declare-fun c!23747 () Bool)

(assert (=> b!129105 (= c!23747 (and ((_ is Cons!1678) lt!66538) (not (= (_1!1279 (h!2281 lt!66538)) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129104 () Bool)

(assert (=> b!129104 (= e!84257 (Some!174 (_2!1279 (h!2281 lt!66538))))))

(assert (= (and d!39273 c!23746) b!129104))

(assert (= (and d!39273 (not c!23746)) b!129105))

(assert (= (and b!129105 c!23747) b!129106))

(assert (= (and b!129105 (not c!23747)) b!129107))

(declare-fun m!151763 () Bool)

(assert (=> b!129106 m!151763))

(assert (=> d!38909 d!39273))

(declare-fun d!39275 () Bool)

(assert (=> d!39275 (= (getValueByKey!169 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!174 (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!66996 () Unit!3985)

(assert (=> d!39275 (= lt!66996 (choose!789 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!84259 () Bool)

(assert (=> d!39275 e!84259))

(declare-fun res!62314 () Bool)

(assert (=> d!39275 (=> (not res!62314) (not e!84259))))

(assert (=> d!39275 (= res!62314 (isStrictlySorted!305 lt!66538))))

(assert (=> d!39275 (= (lemmaContainsTupThenGetReturnValue!84 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66996)))

(declare-fun b!129108 () Bool)

(declare-fun res!62315 () Bool)

(assert (=> b!129108 (=> (not res!62315) (not e!84259))))

(assert (=> b!129108 (= res!62315 (containsKey!172 lt!66538 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129109 () Bool)

(assert (=> b!129109 (= e!84259 (contains!871 lt!66538 (tuple2!2537 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!39275 res!62314) b!129108))

(assert (= (and b!129108 res!62315) b!129109))

(assert (=> d!39275 m!150417))

(declare-fun m!151765 () Bool)

(assert (=> d!39275 m!151765))

(declare-fun m!151767 () Bool)

(assert (=> d!39275 m!151767))

(declare-fun m!151769 () Bool)

(assert (=> b!129108 m!151769))

(declare-fun m!151771 () Bool)

(assert (=> b!129109 m!151771))

(assert (=> d!38909 d!39275))

(declare-fun e!84260 () List!1682)

(declare-fun call!13964 () List!1682)

(declare-fun c!23749 () Bool)

(declare-fun bm!13961 () Bool)

(assert (=> bm!13961 (= call!13964 ($colon$colon!89 e!84260 (ite c!23749 (h!2281 (toList!835 call!13795)) (tuple2!2537 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!23750 () Bool)

(assert (=> bm!13961 (= c!23750 c!23749)))

(declare-fun d!39277 () Bool)

(declare-fun e!84263 () Bool)

(assert (=> d!39277 e!84263))

(declare-fun res!62316 () Bool)

(assert (=> d!39277 (=> (not res!62316) (not e!84263))))

(declare-fun lt!66997 () List!1682)

(assert (=> d!39277 (= res!62316 (isStrictlySorted!305 lt!66997))))

(declare-fun e!84264 () List!1682)

(assert (=> d!39277 (= lt!66997 e!84264)))

(assert (=> d!39277 (= c!23749 (and ((_ is Cons!1678) (toList!835 call!13795)) (bvslt (_1!1279 (h!2281 (toList!835 call!13795))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39277 (isStrictlySorted!305 (toList!835 call!13795))))

(assert (=> d!39277 (= (insertStrictlySorted!87 (toList!835 call!13795) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!66997)))

(declare-fun b!129110 () Bool)

(assert (=> b!129110 (= e!84260 (insertStrictlySorted!87 (t!6053 (toList!835 call!13795)) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!129111 () Bool)

(assert (=> b!129111 (= e!84264 call!13964)))

(declare-fun b!129112 () Bool)

(declare-fun e!84261 () List!1682)

(assert (=> b!129112 (= e!84264 e!84261)))

(declare-fun c!23751 () Bool)

(assert (=> b!129112 (= c!23751 (and ((_ is Cons!1678) (toList!835 call!13795)) (= (_1!1279 (h!2281 (toList!835 call!13795))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129113 () Bool)

(declare-fun e!84262 () List!1682)

(declare-fun call!13966 () List!1682)

(assert (=> b!129113 (= e!84262 call!13966)))

(declare-fun bm!13962 () Bool)

(declare-fun call!13965 () List!1682)

(assert (=> bm!13962 (= call!13966 call!13965)))

(declare-fun b!129114 () Bool)

(declare-fun c!23748 () Bool)

(assert (=> b!129114 (= e!84260 (ite c!23751 (t!6053 (toList!835 call!13795)) (ite c!23748 (Cons!1678 (h!2281 (toList!835 call!13795)) (t!6053 (toList!835 call!13795))) Nil!1679)))))

(declare-fun b!129115 () Bool)

(assert (=> b!129115 (= e!84262 call!13966)))

(declare-fun b!129116 () Bool)

(assert (=> b!129116 (= e!84263 (contains!871 lt!66997 (tuple2!2537 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129117 () Bool)

(assert (=> b!129117 (= c!23748 (and ((_ is Cons!1678) (toList!835 call!13795)) (bvsgt (_1!1279 (h!2281 (toList!835 call!13795))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!129117 (= e!84261 e!84262)))

(declare-fun b!129118 () Bool)

(declare-fun res!62317 () Bool)

(assert (=> b!129118 (=> (not res!62317) (not e!84263))))

(assert (=> b!129118 (= res!62317 (containsKey!172 lt!66997 (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!13963 () Bool)

(assert (=> bm!13963 (= call!13965 call!13964)))

(declare-fun b!129119 () Bool)

(assert (=> b!129119 (= e!84261 call!13965)))

(assert (= (and d!39277 c!23749) b!129111))

(assert (= (and d!39277 (not c!23749)) b!129112))

(assert (= (and b!129112 c!23751) b!129119))

(assert (= (and b!129112 (not c!23751)) b!129117))

(assert (= (and b!129117 c!23748) b!129115))

(assert (= (and b!129117 (not c!23748)) b!129113))

(assert (= (or b!129115 b!129113) bm!13962))

(assert (= (or b!129119 bm!13962) bm!13963))

(assert (= (or b!129111 bm!13963) bm!13961))

(assert (= (and bm!13961 c!23750) b!129110))

(assert (= (and bm!13961 (not c!23750)) b!129114))

(assert (= (and d!39277 res!62316) b!129118))

(assert (= (and b!129118 res!62317) b!129116))

(declare-fun m!151773 () Bool)

(assert (=> b!129118 m!151773))

(declare-fun m!151775 () Bool)

(assert (=> b!129110 m!151775))

(declare-fun m!151777 () Bool)

(assert (=> d!39277 m!151777))

(declare-fun m!151779 () Bool)

(assert (=> d!39277 m!151779))

(declare-fun m!151781 () Bool)

(assert (=> bm!13961 m!151781))

(declare-fun m!151783 () Bool)

(assert (=> b!129116 m!151783))

(assert (=> d!38909 d!39277))

(declare-fun d!39279 () Bool)

(declare-fun e!84266 () Bool)

(assert (=> d!39279 e!84266))

(declare-fun res!62318 () Bool)

(assert (=> d!39279 (=> res!62318 e!84266)))

(declare-fun lt!66998 () Bool)

(assert (=> d!39279 (= res!62318 (not lt!66998))))

(declare-fun lt!67001 () Bool)

(assert (=> d!39279 (= lt!66998 lt!67001)))

(declare-fun lt!66999 () Unit!3985)

(declare-fun e!84265 () Unit!3985)

(assert (=> d!39279 (= lt!66999 e!84265)))

(declare-fun c!23752 () Bool)

(assert (=> d!39279 (= c!23752 lt!67001)))

(assert (=> d!39279 (= lt!67001 (containsKey!172 (toList!835 lt!66328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39279 (= (contains!869 lt!66328 #b0000000000000000000000000000000000000000000000000000000000000000) lt!66998)))

(declare-fun b!129120 () Bool)

(declare-fun lt!67000 () Unit!3985)

(assert (=> b!129120 (= e!84265 lt!67000)))

(assert (=> b!129120 (= lt!67000 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129120 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129121 () Bool)

(declare-fun Unit!4031 () Unit!3985)

(assert (=> b!129121 (= e!84265 Unit!4031)))

(declare-fun b!129122 () Bool)

(assert (=> b!129122 (= e!84266 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39279 c!23752) b!129120))

(assert (= (and d!39279 (not c!23752)) b!129121))

(assert (= (and d!39279 (not res!62318)) b!129122))

(declare-fun m!151785 () Bool)

(assert (=> d!39279 m!151785))

(declare-fun m!151787 () Bool)

(assert (=> b!129120 m!151787))

(declare-fun m!151789 () Bool)

(assert (=> b!129120 m!151789))

(assert (=> b!129120 m!151789))

(declare-fun m!151791 () Bool)

(assert (=> b!129120 m!151791))

(assert (=> b!129122 m!151789))

(assert (=> b!129122 m!151789))

(assert (=> b!129122 m!151791))

(assert (=> d!38817 d!39279))

(assert (=> d!38817 d!38787))

(declare-fun d!39281 () Bool)

(assert (=> d!39281 (= (apply!112 lt!66561 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5370 () Bool)

(assert (= bs!5370 d!39281))

(declare-fun m!151793 () Bool)

(assert (=> bs!5370 m!151793))

(assert (=> bs!5370 m!151793))

(declare-fun m!151795 () Bool)

(assert (=> bs!5370 m!151795))

(assert (=> b!128465 d!39281))

(assert (=> bm!13840 d!39035))

(assert (=> d!38913 d!38883))

(declare-fun d!39283 () Bool)

(declare-fun e!84276 () Bool)

(assert (=> d!39283 e!84276))

(declare-fun c!23757 () Bool)

(declare-fun lt!67004 () SeekEntryResult!265)

(assert (=> d!39283 (= c!23757 ((_ is MissingZero!265) lt!67004))))

(assert (=> d!39283 (= lt!67004 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(assert (=> d!39283 true))

(declare-fun _$34!962 () Unit!3985)

(assert (=> d!39283 (= (choose!788 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) _$34!962)))

(declare-fun b!129139 () Bool)

(declare-fun res!62330 () Bool)

(assert (=> b!129139 (= res!62330 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3216 lt!67004)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84275 () Bool)

(assert (=> b!129139 (=> (not res!62330) (not e!84275))))

(declare-fun b!129140 () Bool)

(declare-fun e!84278 () Bool)

(declare-fun call!13971 () Bool)

(assert (=> b!129140 (= e!84278 (not call!13971))))

(declare-fun b!129141 () Bool)

(declare-fun e!84277 () Bool)

(assert (=> b!129141 (= e!84277 ((_ is Undefined!265) lt!67004))))

(declare-fun bm!13968 () Bool)

(assert (=> bm!13968 (= call!13971 (arrayContainsKey!0 (_keys!4541 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!129142 () Bool)

(declare-fun res!62328 () Bool)

(assert (=> b!129142 (=> (not res!62328) (not e!84278))))

(assert (=> b!129142 (= res!62328 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3219 lt!67004)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129143 () Bool)

(declare-fun res!62327 () Bool)

(assert (=> b!129143 (=> (not res!62327) (not e!84278))))

(declare-fun call!13972 () Bool)

(assert (=> b!129143 (= res!62327 call!13972)))

(assert (=> b!129143 (= e!84277 e!84278)))

(declare-fun b!129144 () Bool)

(assert (=> b!129144 (= e!84276 e!84277)))

(declare-fun c!23758 () Bool)

(assert (=> b!129144 (= c!23758 ((_ is MissingVacant!265) lt!67004))))

(declare-fun b!129145 () Bool)

(assert (=> b!129145 (= e!84275 (not call!13971))))

(declare-fun bm!13969 () Bool)

(assert (=> bm!13969 (= call!13972 (inRange!0 (ite c!23757 (index!3216 lt!67004) (index!3219 lt!67004)) (mask!7072 newMap!16)))))

(declare-fun b!129146 () Bool)

(assert (=> b!129146 (= e!84276 e!84275)))

(declare-fun res!62329 () Bool)

(assert (=> b!129146 (= res!62329 call!13972)))

(assert (=> b!129146 (=> (not res!62329) (not e!84275))))

(assert (= (and d!39283 c!23757) b!129146))

(assert (= (and d!39283 (not c!23757)) b!129144))

(assert (= (and b!129146 res!62329) b!129139))

(assert (= (and b!129139 res!62330) b!129145))

(assert (= (and b!129144 c!23758) b!129143))

(assert (= (and b!129144 (not c!23758)) b!129141))

(assert (= (and b!129143 res!62327) b!129142))

(assert (= (and b!129142 res!62328) b!129140))

(assert (= (or b!129146 b!129143) bm!13969))

(assert (= (or b!129145 b!129140) bm!13968))

(declare-fun m!151797 () Bool)

(assert (=> b!129142 m!151797))

(assert (=> d!39283 m!149721))

(assert (=> d!39283 m!149851))

(declare-fun m!151799 () Bool)

(assert (=> bm!13969 m!151799))

(assert (=> bm!13968 m!149721))

(assert (=> bm!13968 m!149877))

(declare-fun m!151801 () Bool)

(assert (=> b!129139 m!151801))

(assert (=> d!38913 d!39283))

(assert (=> d!38913 d!38921))

(declare-fun b!129150 () Bool)

(declare-fun e!84279 () Bool)

(assert (=> b!129150 (= e!84279 (and (bvsge (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000000) (bvsle (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000011) (bvsge (_vacant!585 (_2!1280 lt!66196)) #b00000000000000000000000000000000)))))

(declare-fun b!129147 () Bool)

(declare-fun res!62333 () Bool)

(assert (=> b!129147 (=> (not res!62333) (not e!84279))))

(assert (=> b!129147 (= res!62333 (and (= (size!2494 (_values!2787 (_2!1280 lt!66196))) (bvadd (mask!7072 (_2!1280 lt!66196)) #b00000000000000000000000000000001)) (= (size!2493 (_keys!4541 (_2!1280 lt!66196))) (size!2494 (_values!2787 (_2!1280 lt!66196)))) (bvsge (_size!585 (_2!1280 lt!66196)) #b00000000000000000000000000000000) (bvsle (_size!585 (_2!1280 lt!66196)) (bvadd (mask!7072 (_2!1280 lt!66196)) #b00000000000000000000000000000001))))))

(declare-fun b!129148 () Bool)

(declare-fun res!62331 () Bool)

(assert (=> b!129148 (=> (not res!62331) (not e!84279))))

(assert (=> b!129148 (= res!62331 (bvsge (size!2499 (_2!1280 lt!66196)) (_size!585 (_2!1280 lt!66196))))))

(declare-fun d!39285 () Bool)

(declare-fun res!62332 () Bool)

(assert (=> d!39285 (=> (not res!62332) (not e!84279))))

(assert (=> d!39285 (= res!62332 (validMask!0 (mask!7072 (_2!1280 lt!66196))))))

(assert (=> d!39285 (= (simpleValid!88 (_2!1280 lt!66196)) e!84279)))

(declare-fun b!129149 () Bool)

(declare-fun res!62334 () Bool)

(assert (=> b!129149 (=> (not res!62334) (not e!84279))))

(assert (=> b!129149 (= res!62334 (= (size!2499 (_2!1280 lt!66196)) (bvadd (_size!585 (_2!1280 lt!66196)) (bvsdiv (bvadd (extraKeys!2581 (_2!1280 lt!66196)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!39285 res!62332) b!129147))

(assert (= (and b!129147 res!62333) b!129148))

(assert (= (and b!129148 res!62331) b!129149))

(assert (= (and b!129149 res!62334) b!129150))

(declare-fun m!151803 () Bool)

(assert (=> b!129148 m!151803))

(assert (=> d!39285 m!151675))

(assert (=> b!129149 m!151803))

(assert (=> d!38843 d!39285))

(declare-fun d!39287 () Bool)

(declare-fun res!62335 () Bool)

(declare-fun e!84280 () Bool)

(assert (=> d!39287 (=> res!62335 e!84280)))

(assert (=> d!39287 (= res!62335 (and ((_ is Cons!1678) (toList!835 e!83614)) (= (_1!1279 (h!2281 (toList!835 e!83614))) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))))

(assert (=> d!39287 (= (containsKey!172 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))) e!84280)))

(declare-fun b!129151 () Bool)

(declare-fun e!84281 () Bool)

(assert (=> b!129151 (= e!84280 e!84281)))

(declare-fun res!62336 () Bool)

(assert (=> b!129151 (=> (not res!62336) (not e!84281))))

(assert (=> b!129151 (= res!62336 (and (or (not ((_ is Cons!1678) (toList!835 e!83614))) (bvsle (_1!1279 (h!2281 (toList!835 e!83614))) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))) ((_ is Cons!1678) (toList!835 e!83614)) (bvslt (_1!1279 (h!2281 (toList!835 e!83614))) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))))

(declare-fun b!129152 () Bool)

(assert (=> b!129152 (= e!84281 (containsKey!172 (t!6053 (toList!835 e!83614)) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(assert (= (and d!39287 (not res!62335)) b!129151))

(assert (= (and b!129151 res!62336) b!129152))

(declare-fun m!151805 () Bool)

(assert (=> b!129152 m!151805))

(assert (=> d!38849 d!39287))

(declare-fun d!39289 () Bool)

(assert (=> d!39289 (isDefined!121 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!67005 () Unit!3985)

(assert (=> d!39289 (= lt!67005 (choose!784 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!84282 () Bool)

(assert (=> d!39289 e!84282))

(declare-fun res!62337 () Bool)

(assert (=> d!39289 (=> (not res!62337) (not e!84282))))

(assert (=> d!39289 (= res!62337 (isStrictlySorted!305 (toList!835 lt!66270)))))

(assert (=> d!39289 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000) lt!67005)))

(declare-fun b!129153 () Bool)

(assert (=> b!129153 (= e!84282 (containsKey!172 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39289 res!62337) b!129153))

(assert (=> d!39289 m!150265))

(assert (=> d!39289 m!150265))

(assert (=> d!39289 m!150303))

(declare-fun m!151807 () Bool)

(assert (=> d!39289 m!151807))

(assert (=> d!39289 m!151109))

(assert (=> b!129153 m!150299))

(assert (=> b!128406 d!39289))

(assert (=> b!128406 d!38963))

(assert (=> b!128406 d!38965))

(declare-fun d!39291 () Bool)

(assert (=> d!39291 (= (get!1466 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) (v!3150 (getValueByKey!169 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!38851 d!39291))

(assert (=> d!38851 d!38947))

(assert (=> b!128237 d!38931))

(assert (=> b!128237 d!38933))

(declare-fun b!129157 () Bool)

(declare-fun e!84284 () Option!175)

(assert (=> b!129157 (= e!84284 None!173)))

(declare-fun b!129156 () Bool)

(assert (=> b!129156 (= e!84284 (getValueByKey!169 (t!6053 (toList!835 lt!66304)) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!39293 () Bool)

(declare-fun c!23759 () Bool)

(assert (=> d!39293 (= c!23759 (and ((_ is Cons!1678) (toList!835 lt!66304)) (= (_1!1279 (h!2281 (toList!835 lt!66304))) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84283 () Option!175)

(assert (=> d!39293 (= (getValueByKey!169 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84283)))

(declare-fun b!129155 () Bool)

(assert (=> b!129155 (= e!84283 e!84284)))

(declare-fun c!23760 () Bool)

(assert (=> b!129155 (= c!23760 (and ((_ is Cons!1678) (toList!835 lt!66304)) (not (= (_1!1279 (h!2281 (toList!835 lt!66304))) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129154 () Bool)

(assert (=> b!129154 (= e!84283 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66304)))))))

(assert (= (and d!39293 c!23759) b!129154))

(assert (= (and d!39293 (not c!23759)) b!129155))

(assert (= (and b!129155 c!23760) b!129156))

(assert (= (and b!129155 (not c!23760)) b!129157))

(declare-fun m!151809 () Bool)

(assert (=> b!129156 m!151809))

(assert (=> b!128193 d!39293))

(declare-fun d!39295 () Bool)

(declare-fun e!84285 () Bool)

(assert (=> d!39295 e!84285))

(declare-fun res!62339 () Bool)

(assert (=> d!39295 (=> (not res!62339) (not e!84285))))

(declare-fun lt!67006 () ListLongMap!1639)

(assert (=> d!39295 (= res!62339 (contains!869 lt!67006 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(declare-fun lt!67008 () List!1682)

(assert (=> d!39295 (= lt!67006 (ListLongMap!1640 lt!67008))))

(declare-fun lt!67007 () Unit!3985)

(declare-fun lt!67009 () Unit!3985)

(assert (=> d!39295 (= lt!67007 lt!67009)))

(assert (=> d!39295 (= (getValueByKey!169 lt!67008 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39295 (= lt!67009 (lemmaContainsTupThenGetReturnValue!84 lt!67008 (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39295 (= lt!67008 (insertStrictlySorted!87 (toList!835 call!13873) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (=> d!39295 (= (+!165 call!13873 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))) lt!67006)))

(declare-fun b!129158 () Bool)

(declare-fun res!62338 () Bool)

(assert (=> b!129158 (=> (not res!62338) (not e!84285))))

(assert (=> b!129158 (= res!62338 (= (getValueByKey!169 (toList!835 lt!67006) (_1!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (Some!174 (_2!1279 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun b!129159 () Bool)

(assert (=> b!129159 (= e!84285 (contains!871 (toList!835 lt!67006) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))

(assert (= (and d!39295 res!62339) b!129158))

(assert (= (and b!129158 res!62338) b!129159))

(declare-fun m!151811 () Bool)

(assert (=> d!39295 m!151811))

(declare-fun m!151813 () Bool)

(assert (=> d!39295 m!151813))

(declare-fun m!151815 () Bool)

(assert (=> d!39295 m!151815))

(declare-fun m!151817 () Bool)

(assert (=> d!39295 m!151817))

(declare-fun m!151819 () Bool)

(assert (=> b!129158 m!151819))

(declare-fun m!151821 () Bool)

(assert (=> b!129159 m!151821))

(assert (=> b!128420 d!39295))

(assert (=> d!38811 d!38809))

(assert (=> d!38811 d!38819))

(assert (=> d!38811 d!38835))

(declare-fun d!39297 () Bool)

(declare-fun e!84287 () Bool)

(assert (=> d!39297 e!84287))

(declare-fun res!62340 () Bool)

(assert (=> d!39297 (=> res!62340 e!84287)))

(declare-fun lt!67010 () Bool)

(assert (=> d!39297 (= res!62340 (not lt!67010))))

(declare-fun lt!67013 () Bool)

(assert (=> d!39297 (= lt!67010 lt!67013)))

(declare-fun lt!67011 () Unit!3985)

(declare-fun e!84286 () Unit!3985)

(assert (=> d!39297 (= lt!67011 e!84286)))

(declare-fun c!23761 () Bool)

(assert (=> d!39297 (= c!23761 lt!67013)))

(assert (=> d!39297 (= lt!67013 (containsKey!172 (toList!835 lt!66268) lt!66263))))

(assert (=> d!39297 (= (contains!869 lt!66268 lt!66263) lt!67010)))

(declare-fun b!129160 () Bool)

(declare-fun lt!67012 () Unit!3985)

(assert (=> b!129160 (= e!84286 lt!67012)))

(assert (=> b!129160 (= lt!67012 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66268) lt!66263))))

(assert (=> b!129160 (isDefined!121 (getValueByKey!169 (toList!835 lt!66268) lt!66263))))

(declare-fun b!129161 () Bool)

(declare-fun Unit!4032 () Unit!3985)

(assert (=> b!129161 (= e!84286 Unit!4032)))

(declare-fun b!129162 () Bool)

(assert (=> b!129162 (= e!84287 (isDefined!121 (getValueByKey!169 (toList!835 lt!66268) lt!66263)))))

(assert (= (and d!39297 c!23761) b!129160))

(assert (= (and d!39297 (not c!23761)) b!129161))

(assert (= (and d!39297 (not res!62340)) b!129162))

(declare-fun m!151823 () Bool)

(assert (=> d!39297 m!151823))

(declare-fun m!151825 () Bool)

(assert (=> b!129160 m!151825))

(assert (=> b!129160 m!150017))

(assert (=> b!129160 m!150017))

(declare-fun m!151827 () Bool)

(assert (=> b!129160 m!151827))

(assert (=> b!129162 m!150017))

(assert (=> b!129162 m!150017))

(assert (=> b!129162 m!151827))

(assert (=> d!38811 d!39297))

(declare-fun d!39299 () Bool)

(assert (=> d!39299 (= (apply!112 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) lt!66263) (apply!112 lt!66268 lt!66263))))

(assert (=> d!39299 true))

(declare-fun _$34!963 () Unit!3985)

(assert (=> d!39299 (= (choose!780 lt!66268 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))) lt!66263) _$34!963)))

(declare-fun bs!5371 () Bool)

(assert (= bs!5371 d!39299))

(assert (=> bs!5371 m!149915))

(assert (=> bs!5371 m!149915))

(assert (=> bs!5371 m!149917))

(assert (=> bs!5371 m!149931))

(assert (=> d!38811 d!39299))

(declare-fun d!39301 () Bool)

(assert (=> d!39301 (isDefined!121 (getValueByKey!169 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(declare-fun lt!67014 () Unit!3985)

(assert (=> d!39301 (= lt!67014 (choose!784 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(declare-fun e!84288 () Bool)

(assert (=> d!39301 e!84288))

(declare-fun res!62341 () Bool)

(assert (=> d!39301 (=> (not res!62341) (not e!84288))))

(assert (=> d!39301 (= res!62341 (isStrictlySorted!305 (toList!835 e!83614)))))

(assert (=> d!39301 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))) lt!67014)))

(declare-fun b!129163 () Bool)

(assert (=> b!129163 (= e!84288 (containsKey!172 (toList!835 e!83614) (ite c!23471 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(assert (= (and d!39301 res!62341) b!129163))

(assert (=> d!39301 m!150219))

(assert (=> d!39301 m!150219))

(assert (=> d!39301 m!150221))

(declare-fun m!151829 () Bool)

(assert (=> d!39301 m!151829))

(declare-fun m!151831 () Bool)

(assert (=> d!39301 m!151831))

(assert (=> b!129163 m!150215))

(assert (=> b!128299 d!39301))

(assert (=> b!128299 d!39089))

(assert (=> b!128299 d!39091))

(declare-fun d!39303 () Bool)

(assert (=> d!39303 (= (apply!112 lt!66561 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66561) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5372 () Bool)

(assert (= bs!5372 d!39303))

(assert (=> bs!5372 m!150619))

(assert (=> bs!5372 m!150619))

(declare-fun m!151833 () Bool)

(assert (=> bs!5372 m!151833))

(assert (=> b!128453 d!39303))

(declare-fun b!129167 () Bool)

(declare-fun e!84290 () Option!175)

(assert (=> b!129167 (= e!84290 None!173)))

(declare-fun b!129166 () Bool)

(assert (=> b!129166 (= e!84290 (getValueByKey!169 (t!6053 (t!6053 (toList!835 lt!66092))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun c!23762 () Bool)

(declare-fun d!39305 () Bool)

(assert (=> d!39305 (= c!23762 (and ((_ is Cons!1678) (t!6053 (toList!835 lt!66092))) (= (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))))))

(declare-fun e!84289 () Option!175)

(assert (=> d!39305 (= (getValueByKey!169 (t!6053 (toList!835 lt!66092)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) e!84289)))

(declare-fun b!129165 () Bool)

(assert (=> b!129165 (= e!84289 e!84290)))

(declare-fun c!23763 () Bool)

(assert (=> b!129165 (= c!23763 (and ((_ is Cons!1678) (t!6053 (toList!835 lt!66092))) (not (= (_1!1279 (h!2281 (t!6053 (toList!835 lt!66092)))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(declare-fun b!129164 () Bool)

(assert (=> b!129164 (= e!84289 (Some!174 (_2!1279 (h!2281 (t!6053 (toList!835 lt!66092))))))))

(assert (= (and d!39305 c!23762) b!129164))

(assert (= (and d!39305 (not c!23762)) b!129165))

(assert (= (and b!129165 c!23763) b!129166))

(assert (= (and b!129165 (not c!23763)) b!129167))

(assert (=> b!129166 m!149721))

(declare-fun m!151835 () Bool)

(assert (=> b!129166 m!151835))

(assert (=> b!128383 d!39305))

(declare-fun b!129168 () Bool)

(declare-fun e!84291 () (_ BitVec 32))

(declare-fun call!13973 () (_ BitVec 32))

(assert (=> b!129168 (= e!84291 (bvadd #b00000000000000000000000000000001 call!13973))))

(declare-fun b!129169 () Bool)

(declare-fun e!84292 () (_ BitVec 32))

(assert (=> b!129169 (= e!84292 #b00000000000000000000000000000000)))

(declare-fun bm!13970 () Bool)

(assert (=> bm!13970 (= call!13973 (arrayCountValidKeys!0 (_keys!4541 (_2!1280 lt!66196)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(declare-fun d!39307 () Bool)

(declare-fun lt!67015 () (_ BitVec 32))

(assert (=> d!39307 (and (bvsge lt!67015 #b00000000000000000000000000000000) (bvsle lt!67015 (bvsub (size!2493 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(assert (=> d!39307 (= lt!67015 e!84292)))

(declare-fun c!23765 () Bool)

(assert (=> d!39307 (= c!23765 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(assert (=> d!39307 (and (bvsle #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2493 (_keys!4541 (_2!1280 lt!66196))) (size!2493 (_keys!4541 (_2!1280 lt!66196)))))))

(assert (=> d!39307 (= (arrayCountValidKeys!0 (_keys!4541 (_2!1280 lt!66196)) #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66196)))) lt!67015)))

(declare-fun b!129170 () Bool)

(assert (=> b!129170 (= e!84291 call!13973)))

(declare-fun b!129171 () Bool)

(assert (=> b!129171 (= e!84292 e!84291)))

(declare-fun c!23764 () Bool)

(assert (=> b!129171 (= c!23764 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (_2!1280 lt!66196))) #b00000000000000000000000000000000)))))

(assert (= (and d!39307 c!23765) b!129169))

(assert (= (and d!39307 (not c!23765)) b!129171))

(assert (= (and b!129171 c!23764) b!129168))

(assert (= (and b!129171 (not c!23764)) b!129170))

(assert (= (or b!129168 b!129170) bm!13970))

(declare-fun m!151837 () Bool)

(assert (=> bm!13970 m!151837))

(assert (=> b!129171 m!150899))

(assert (=> b!129171 m!150899))

(assert (=> b!129171 m!150901))

(assert (=> b!128294 d!39307))

(assert (=> b!128222 d!38805))

(declare-fun lt!67016 () Bool)

(declare-fun d!39309 () Bool)

(assert (=> d!39309 (= lt!67016 (select (content!128 (toList!835 lt!66440)) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!84294 () Bool)

(assert (=> d!39309 (= lt!67016 e!84294)))

(declare-fun res!62343 () Bool)

(assert (=> d!39309 (=> (not res!62343) (not e!84294))))

(assert (=> d!39309 (= res!62343 ((_ is Cons!1678) (toList!835 lt!66440)))))

(assert (=> d!39309 (= (contains!871 (toList!835 lt!66440) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67016)))

(declare-fun b!129172 () Bool)

(declare-fun e!84293 () Bool)

(assert (=> b!129172 (= e!84294 e!84293)))

(declare-fun res!62342 () Bool)

(assert (=> b!129172 (=> res!62342 e!84293)))

(assert (=> b!129172 (= res!62342 (= (h!2281 (toList!835 lt!66440)) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129173 () Bool)

(assert (=> b!129173 (= e!84293 (contains!871 (t!6053 (toList!835 lt!66440)) (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (= (and d!39309 res!62343) b!129172))

(assert (= (and b!129172 (not res!62342)) b!129173))

(declare-fun m!151839 () Bool)

(assert (=> d!39309 m!151839))

(declare-fun m!151841 () Bool)

(assert (=> d!39309 m!151841))

(declare-fun m!151843 () Bool)

(assert (=> b!129173 m!151843))

(assert (=> b!128298 d!39309))

(declare-fun d!39311 () Bool)

(assert (=> d!39311 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun lt!67017 () Unit!3985)

(assert (=> d!39311 (= lt!67017 (choose!784 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun e!84295 () Bool)

(assert (=> d!39311 e!84295))

(declare-fun res!62344 () Bool)

(assert (=> d!39311 (=> (not res!62344) (not e!84295))))

(assert (=> d!39311 (= res!62344 (isStrictlySorted!305 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))))

(assert (=> d!39311 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!67017)))

(declare-fun b!129174 () Bool)

(assert (=> b!129174 (= e!84295 (containsKey!172 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39311 res!62344) b!129174))

(assert (=> d!39311 m!149721))

(assert (=> d!39311 m!150391))

(assert (=> d!39311 m!150391))

(assert (=> d!39311 m!150393))

(assert (=> d!39311 m!149721))

(declare-fun m!151845 () Bool)

(assert (=> d!39311 m!151845))

(declare-fun m!151847 () Bool)

(assert (=> d!39311 m!151847))

(assert (=> b!129174 m!149721))

(assert (=> b!129174 m!150387))

(assert (=> b!128438 d!39311))

(assert (=> b!128438 d!39055))

(assert (=> b!128438 d!39057))

(declare-fun d!39313 () Bool)

(declare-fun e!84296 () Bool)

(assert (=> d!39313 e!84296))

(declare-fun res!62346 () Bool)

(assert (=> d!39313 (=> (not res!62346) (not e!84296))))

(declare-fun lt!67018 () ListLongMap!1639)

(assert (=> d!39313 (= res!62346 (contains!869 lt!67018 (_1!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(declare-fun lt!67020 () List!1682)

(assert (=> d!39313 (= lt!67018 (ListLongMap!1640 lt!67020))))

(declare-fun lt!67019 () Unit!3985)

(declare-fun lt!67021 () Unit!3985)

(assert (=> d!39313 (= lt!67019 lt!67021)))

(assert (=> d!39313 (= (getValueByKey!169 lt!67020 (_1!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))) (Some!174 (_2!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!39313 (= lt!67021 (lemmaContainsTupThenGetReturnValue!84 lt!67020 (_1!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (_2!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!39313 (= lt!67020 (insertStrictlySorted!87 (toList!835 (ite c!23560 call!13872 (ite c!23564 call!13875 call!13871))) (_1!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) (_2!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))))))

(assert (=> d!39313 (= (+!165 (ite c!23560 call!13872 (ite c!23564 call!13875 call!13871)) (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))) lt!67018)))

(declare-fun b!129175 () Bool)

(declare-fun res!62345 () Bool)

(assert (=> b!129175 (=> (not res!62345) (not e!84296))))

(assert (=> b!129175 (= res!62345 (= (getValueByKey!169 (toList!835 lt!67018) (_1!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16)))))) (Some!174 (_2!1279 (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))))

(declare-fun b!129176 () Bool)

(assert (=> b!129176 (= e!84296 (contains!871 (toList!835 lt!67018) (ite (or c!23560 c!23564) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!23474 (ite c!23467 (minValue!2665 newMap!16) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2665 newMap!16))))))))

(assert (= (and d!39313 res!62346) b!129175))

(assert (= (and b!129175 res!62345) b!129176))

(declare-fun m!151849 () Bool)

(assert (=> d!39313 m!151849))

(declare-fun m!151851 () Bool)

(assert (=> d!39313 m!151851))

(declare-fun m!151853 () Bool)

(assert (=> d!39313 m!151853))

(declare-fun m!151855 () Bool)

(assert (=> d!39313 m!151855))

(declare-fun m!151857 () Bool)

(assert (=> b!129175 m!151857))

(declare-fun m!151859 () Bool)

(assert (=> b!129176 m!151859))

(assert (=> bm!13873 d!39313))

(declare-fun d!39315 () Bool)

(assert (=> d!39315 (isDefined!121 (getValueByKey!169 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun lt!67022 () Unit!3985)

(assert (=> d!39315 (= lt!67022 (choose!784 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(declare-fun e!84297 () Bool)

(assert (=> d!39315 e!84297))

(declare-fun res!62347 () Bool)

(assert (=> d!39315 (=> (not res!62347) (not e!84297))))

(assert (=> d!39315 (= res!62347 (isStrictlySorted!305 (toList!835 call!13817)))))

(assert (=> d!39315 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)) lt!67022)))

(declare-fun b!129177 () Bool)

(assert (=> b!129177 (= e!84297 (containsKey!172 (toList!835 call!13817) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39315 res!62347) b!129177))

(assert (=> d!39315 m!149721))

(assert (=> d!39315 m!150399))

(assert (=> d!39315 m!150399))

(assert (=> d!39315 m!150401))

(assert (=> d!39315 m!149721))

(declare-fun m!151861 () Bool)

(assert (=> d!39315 m!151861))

(declare-fun m!151863 () Bool)

(assert (=> d!39315 m!151863))

(assert (=> b!129177 m!149721))

(assert (=> b!129177 m!150395))

(assert (=> b!128441 d!39315))

(assert (=> b!128441 d!39051))

(assert (=> b!128441 d!39053))

(assert (=> b!128230 d!38805))

(declare-fun d!39317 () Bool)

(declare-fun lt!67023 () Bool)

(assert (=> d!39317 (= lt!67023 (select (content!128 (toList!835 lt!66536)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!84299 () Bool)

(assert (=> d!39317 (= lt!67023 e!84299)))

(declare-fun res!62349 () Bool)

(assert (=> d!39317 (=> (not res!62349) (not e!84299))))

(assert (=> d!39317 (= res!62349 ((_ is Cons!1678) (toList!835 lt!66536)))))

(assert (=> d!39317 (= (contains!871 (toList!835 lt!66536) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!67023)))

(declare-fun b!129178 () Bool)

(declare-fun e!84298 () Bool)

(assert (=> b!129178 (= e!84299 e!84298)))

(declare-fun res!62348 () Bool)

(assert (=> b!129178 (=> res!62348 e!84298)))

(assert (=> b!129178 (= res!62348 (= (h!2281 (toList!835 lt!66536)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!129179 () Bool)

(assert (=> b!129179 (= e!84298 (contains!871 (t!6053 (toList!835 lt!66536)) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!39317 res!62349) b!129178))

(assert (= (and b!129178 (not res!62348)) b!129179))

(declare-fun m!151865 () Bool)

(assert (=> d!39317 m!151865))

(declare-fun m!151867 () Bool)

(assert (=> d!39317 m!151867))

(declare-fun m!151869 () Bool)

(assert (=> b!129179 m!151869))

(assert (=> b!128447 d!39317))

(declare-fun d!39319 () Bool)

(assert (=> d!39319 (= (apply!112 lt!66510 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66510) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5373 () Bool)

(assert (= bs!5373 d!39319))

(assert (=> bs!5373 m!151623))

(assert (=> bs!5373 m!151623))

(declare-fun m!151871 () Bool)

(assert (=> bs!5373 m!151871))

(assert (=> b!128414 d!39319))

(declare-fun d!39321 () Bool)

(declare-fun res!62350 () Bool)

(declare-fun e!84300 () Bool)

(assert (=> d!39321 (=> (not res!62350) (not e!84300))))

(assert (=> d!39321 (= res!62350 (simpleValid!88 (_2!1280 lt!66414)))))

(assert (=> d!39321 (= (valid!527 (_2!1280 lt!66414)) e!84300)))

(declare-fun b!129180 () Bool)

(declare-fun res!62351 () Bool)

(assert (=> b!129180 (=> (not res!62351) (not e!84300))))

(assert (=> b!129180 (= res!62351 (= (arrayCountValidKeys!0 (_keys!4541 (_2!1280 lt!66414)) #b00000000000000000000000000000000 (size!2493 (_keys!4541 (_2!1280 lt!66414)))) (_size!585 (_2!1280 lt!66414))))))

(declare-fun b!129181 () Bool)

(declare-fun res!62352 () Bool)

(assert (=> b!129181 (=> (not res!62352) (not e!84300))))

(assert (=> b!129181 (= res!62352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 (_2!1280 lt!66414)) (mask!7072 (_2!1280 lt!66414))))))

(declare-fun b!129182 () Bool)

(assert (=> b!129182 (= e!84300 (arrayNoDuplicates!0 (_keys!4541 (_2!1280 lt!66414)) #b00000000000000000000000000000000 Nil!1681))))

(assert (= (and d!39321 res!62350) b!129180))

(assert (= (and b!129180 res!62351) b!129181))

(assert (= (and b!129181 res!62352) b!129182))

(declare-fun m!151873 () Bool)

(assert (=> d!39321 m!151873))

(declare-fun m!151875 () Bool)

(assert (=> b!129180 m!151875))

(declare-fun m!151877 () Bool)

(assert (=> b!129181 m!151877))

(declare-fun m!151879 () Bool)

(assert (=> b!129182 m!151879))

(assert (=> b!128280 d!39321))

(assert (=> b!128333 d!39059))

(declare-fun d!39323 () Bool)

(assert (=> d!39323 (= (apply!112 lt!66292 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66292) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5374 () Bool)

(assert (= bs!5374 d!39323))

(assert (=> bs!5374 m!151631))

(assert (=> bs!5374 m!151631))

(declare-fun m!151881 () Bool)

(assert (=> bs!5374 m!151881))

(assert (=> b!128175 d!39323))

(assert (=> bm!13871 d!39221))

(declare-fun d!39325 () Bool)

(declare-fun lt!67026 () Bool)

(declare-fun content!129 (List!1684) (InoxSet (_ BitVec 64)))

(assert (=> d!39325 (= lt!67026 (select (content!129 Nil!1681) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!84305 () Bool)

(assert (=> d!39325 (= lt!67026 e!84305)))

(declare-fun res!62357 () Bool)

(assert (=> d!39325 (=> (not res!62357) (not e!84305))))

(assert (=> d!39325 (= res!62357 ((_ is Cons!1680) Nil!1681))))

(assert (=> d!39325 (= (contains!872 Nil!1681 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) lt!67026)))

(declare-fun b!129187 () Bool)

(declare-fun e!84306 () Bool)

(assert (=> b!129187 (= e!84305 e!84306)))

(declare-fun res!62358 () Bool)

(assert (=> b!129187 (=> res!62358 e!84306)))

(assert (=> b!129187 (= res!62358 (= (h!2283 Nil!1681) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129188 () Bool)

(assert (=> b!129188 (= e!84306 (contains!872 (t!6063 Nil!1681) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (= (and d!39325 res!62357) b!129187))

(assert (= (and b!129187 (not res!62358)) b!129188))

(declare-fun m!151883 () Bool)

(assert (=> d!39325 m!151883))

(assert (=> d!39325 m!149959))

(declare-fun m!151885 () Bool)

(assert (=> d!39325 m!151885))

(assert (=> b!129188 m!149959))

(declare-fun m!151887 () Bool)

(assert (=> b!129188 m!151887))

(assert (=> b!128366 d!39325))

(assert (=> d!38861 d!38883))

(declare-fun d!39327 () Bool)

(declare-fun e!84309 () Bool)

(assert (=> d!39327 e!84309))

(declare-fun res!62363 () Bool)

(assert (=> d!39327 (=> (not res!62363) (not e!84309))))

(declare-fun lt!67029 () SeekEntryResult!265)

(assert (=> d!39327 (= res!62363 ((_ is Found!265) lt!67029))))

(assert (=> d!39327 (= lt!67029 (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(assert (=> d!39327 true))

(declare-fun _$33!108 () Unit!3985)

(assert (=> d!39327 (= (choose!783 (_keys!4541 newMap!16) (_values!2787 newMap!16) (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (defaultEntry!2804 newMap!16)) _$33!108)))

(declare-fun b!129193 () Bool)

(declare-fun res!62364 () Bool)

(assert (=> b!129193 (=> (not res!62364) (not e!84309))))

(assert (=> b!129193 (= res!62364 (inRange!0 (index!3217 lt!67029) (mask!7072 newMap!16)))))

(declare-fun b!129194 () Bool)

(assert (=> b!129194 (= e!84309 (= (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!67029)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))

(assert (= (and d!39327 res!62363) b!129193))

(assert (= (and b!129193 res!62364) b!129194))

(assert (=> d!39327 m!149721))

(assert (=> d!39327 m!149851))

(declare-fun m!151889 () Bool)

(assert (=> b!129193 m!151889))

(declare-fun m!151891 () Bool)

(assert (=> b!129194 m!151891))

(assert (=> d!38861 d!39327))

(assert (=> d!38861 d!38921))

(declare-fun b!129195 () Bool)

(declare-fun e!84312 () Bool)

(declare-fun e!84311 () Bool)

(assert (=> b!129195 (= e!84312 e!84311)))

(declare-fun lt!67030 () (_ BitVec 64))

(assert (=> b!129195 (= lt!67030 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!67032 () Unit!3985)

(assert (=> b!129195 (= lt!67032 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) lt!67030 #b00000000000000000000000000000000))))

(assert (=> b!129195 (arrayContainsKey!0 (_keys!4541 (v!3144 (underlying!443 thiss!992))) lt!67030 #b00000000000000000000000000000000)))

(declare-fun lt!67031 () Unit!3985)

(assert (=> b!129195 (= lt!67031 lt!67032)))

(declare-fun res!62365 () Bool)

(assert (=> b!129195 (= res!62365 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000) (_keys!4541 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992)))) (Found!265 #b00000000000000000000000000000000)))))

(assert (=> b!129195 (=> (not res!62365) (not e!84311))))

(declare-fun b!129196 () Bool)

(declare-fun call!13974 () Bool)

(assert (=> b!129196 (= e!84311 call!13974)))

(declare-fun d!39329 () Bool)

(declare-fun res!62366 () Bool)

(declare-fun e!84310 () Bool)

(assert (=> d!39329 (=> res!62366 e!84310)))

(assert (=> d!39329 (= res!62366 (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 (v!3144 (underlying!443 thiss!992))))))))

(assert (=> d!39329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4541 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992)))) e!84310)))

(declare-fun bm!13971 () Bool)

(assert (=> bm!13971 (= call!13974 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4541 (v!3144 (underlying!443 thiss!992))) (mask!7072 (v!3144 (underlying!443 thiss!992)))))))

(declare-fun b!129197 () Bool)

(assert (=> b!129197 (= e!84310 e!84312)))

(declare-fun c!23766 () Bool)

(assert (=> b!129197 (= c!23766 (validKeyInArray!0 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun b!129198 () Bool)

(assert (=> b!129198 (= e!84312 call!13974)))

(assert (= (and d!39329 (not res!62366)) b!129197))

(assert (= (and b!129197 c!23766) b!129195))

(assert (= (and b!129197 (not c!23766)) b!129198))

(assert (= (and b!129195 res!62365) b!129196))

(assert (= (or b!129196 b!129198) bm!13971))

(assert (=> b!129195 m!150601))

(declare-fun m!151893 () Bool)

(assert (=> b!129195 m!151893))

(declare-fun m!151895 () Bool)

(assert (=> b!129195 m!151895))

(assert (=> b!129195 m!150601))

(declare-fun m!151897 () Bool)

(assert (=> b!129195 m!151897))

(declare-fun m!151899 () Bool)

(assert (=> bm!13971 m!151899))

(assert (=> b!129197 m!150601))

(assert (=> b!129197 m!150601))

(assert (=> b!129197 m!150603))

(assert (=> b!128386 d!39329))

(declare-fun d!39331 () Bool)

(assert (=> d!39331 (= (apply!112 lt!66561 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!835 lt!66561) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5375 () Bool)

(assert (= bs!5375 d!39331))

(assert (=> bs!5375 m!149959))

(assert (=> bs!5375 m!150977))

(assert (=> bs!5375 m!150977))

(declare-fun m!151901 () Bool)

(assert (=> bs!5375 m!151901))

(assert (=> b!128461 d!39331))

(declare-fun d!39333 () Bool)

(declare-fun c!23767 () Bool)

(assert (=> d!39333 (= c!23767 ((_ is ValueCellFull!1082) (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000)))))

(declare-fun e!84313 () V!3449)

(assert (=> d!39333 (= (get!1462 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84313)))

(declare-fun b!129199 () Bool)

(assert (=> b!129199 (= e!84313 (get!1464 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129200 () Bool)

(assert (=> b!129200 (= e!84313 (get!1465 (select (arr!2229 (ite c!23474 (_values!2787 newMap!16) lt!66194)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39333 c!23767) b!129199))

(assert (= (and d!39333 (not c!23767)) b!129200))

(assert (=> b!129199 m!150475))

(assert (=> b!129199 m!150011))

(declare-fun m!151903 () Bool)

(assert (=> b!129199 m!151903))

(assert (=> b!129200 m!150475))

(assert (=> b!129200 m!150011))

(declare-fun m!151905 () Bool)

(assert (=> b!129200 m!151905))

(assert (=> b!128461 d!39333))

(declare-fun d!39335 () Bool)

(assert (=> d!39335 (= (inRange!0 (ite c!23525 (index!3217 lt!66411) (ite c!23526 (index!3216 lt!66434) (index!3219 lt!66434))) (mask!7072 newMap!16)) (and (bvsge (ite c!23525 (index!3217 lt!66411) (ite c!23526 (index!3216 lt!66434) (index!3219 lt!66434))) #b00000000000000000000000000000000) (bvslt (ite c!23525 (index!3217 lt!66411) (ite c!23526 (index!3216 lt!66434) (index!3219 lt!66434))) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!13855 d!39335))

(declare-fun d!39337 () Bool)

(declare-fun e!84315 () Bool)

(assert (=> d!39337 e!84315))

(declare-fun res!62367 () Bool)

(assert (=> d!39337 (=> res!62367 e!84315)))

(declare-fun lt!67033 () Bool)

(assert (=> d!39337 (= res!62367 (not lt!67033))))

(declare-fun lt!67036 () Bool)

(assert (=> d!39337 (= lt!67033 lt!67036)))

(declare-fun lt!67034 () Unit!3985)

(declare-fun e!84314 () Unit!3985)

(assert (=> d!39337 (= lt!67034 e!84314)))

(declare-fun c!23768 () Bool)

(assert (=> d!39337 (= c!23768 lt!67036)))

(assert (=> d!39337 (= lt!67036 (containsKey!172 (toList!835 lt!66510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39337 (= (contains!869 lt!66510 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67033)))

(declare-fun b!129201 () Bool)

(declare-fun lt!67035 () Unit!3985)

(assert (=> b!129201 (= e!84314 lt!67035)))

(assert (=> b!129201 (= lt!67035 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129201 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129202 () Bool)

(declare-fun Unit!4033 () Unit!3985)

(assert (=> b!129202 (= e!84314 Unit!4033)))

(declare-fun b!129203 () Bool)

(assert (=> b!129203 (= e!84315 (isDefined!121 (getValueByKey!169 (toList!835 lt!66510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39337 c!23768) b!129201))

(assert (= (and d!39337 (not c!23768)) b!129202))

(assert (= (and d!39337 (not res!62367)) b!129203))

(declare-fun m!151907 () Bool)

(assert (=> d!39337 m!151907))

(declare-fun m!151909 () Bool)

(assert (=> b!129201 m!151909))

(declare-fun m!151911 () Bool)

(assert (=> b!129201 m!151911))

(assert (=> b!129201 m!151911))

(declare-fun m!151913 () Bool)

(assert (=> b!129201 m!151913))

(assert (=> b!129203 m!151911))

(assert (=> b!129203 m!151911))

(assert (=> b!129203 m!151913))

(assert (=> bm!13870 d!39337))

(declare-fun d!39339 () Bool)

(assert (=> d!39339 (= (isEmpty!406 (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355))) (not ((_ is Some!174) (getValueByKey!169 (toList!835 lt!66092) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355)))))))

(assert (=> d!38877 d!39339))

(declare-fun d!39341 () Bool)

(assert (=> d!39341 (= (apply!112 lt!66328 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1466 (getValueByKey!169 (toList!835 lt!66328) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!5376 () Bool)

(assert (= bs!5376 d!39341))

(assert (=> bs!5376 m!149899))

(declare-fun m!151915 () Bool)

(assert (=> bs!5376 m!151915))

(assert (=> bs!5376 m!151915))

(declare-fun m!151917 () Bool)

(assert (=> bs!5376 m!151917))

(assert (=> b!128221 d!39341))

(assert (=> b!128221 d!38853))

(declare-fun b!129204 () Bool)

(declare-fun e!84318 () Bool)

(declare-fun e!84317 () Bool)

(assert (=> b!129204 (= e!84318 e!84317)))

(declare-fun lt!67037 () (_ BitVec 64))

(assert (=> b!129204 (= lt!67037 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!67039 () Unit!3985)

(assert (=> b!129204 (= lt!67039 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!4541 newMap!16) lt!67037 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!129204 (arrayContainsKey!0 (_keys!4541 newMap!16) lt!67037 #b00000000000000000000000000000000)))

(declare-fun lt!67038 () Unit!3985)

(assert (=> b!129204 (= lt!67038 lt!67039)))

(declare-fun res!62368 () Bool)

(assert (=> b!129204 (= res!62368 (= (seekEntryOrOpen!0 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!4541 newMap!16) (mask!7072 newMap!16)) (Found!265 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!129204 (=> (not res!62368) (not e!84317))))

(declare-fun b!129205 () Bool)

(declare-fun call!13975 () Bool)

(assert (=> b!129205 (= e!84317 call!13975)))

(declare-fun d!39343 () Bool)

(declare-fun res!62369 () Bool)

(declare-fun e!84316 () Bool)

(assert (=> d!39343 (=> res!62369 e!84316)))

(assert (=> d!39343 (= res!62369 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39343 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!4541 newMap!16) (mask!7072 newMap!16)) e!84316)))

(declare-fun bm!13972 () Bool)

(assert (=> bm!13972 (= call!13975 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!4541 newMap!16) (mask!7072 newMap!16)))))

(declare-fun b!129206 () Bool)

(assert (=> b!129206 (= e!84316 e!84318)))

(declare-fun c!23769 () Bool)

(assert (=> b!129206 (= c!23769 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!129207 () Bool)

(assert (=> b!129207 (= e!84318 call!13975)))

(assert (= (and d!39343 (not res!62369)) b!129206))

(assert (= (and b!129206 c!23769) b!129204))

(assert (= (and b!129206 (not c!23769)) b!129207))

(assert (= (and b!129204 res!62368) b!129205))

(assert (= (or b!129205 b!129207) bm!13972))

(assert (=> b!129204 m!150575))

(declare-fun m!151919 () Bool)

(assert (=> b!129204 m!151919))

(declare-fun m!151921 () Bool)

(assert (=> b!129204 m!151921))

(assert (=> b!129204 m!150575))

(declare-fun m!151923 () Bool)

(assert (=> b!129204 m!151923))

(declare-fun m!151925 () Bool)

(assert (=> bm!13972 m!151925))

(assert (=> b!129206 m!150575))

(assert (=> b!129206 m!150575))

(assert (=> b!129206 m!150577))

(assert (=> bm!13863 d!39343))

(declare-fun d!39345 () Bool)

(assert (=> d!39345 (= (apply!112 lt!66510 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!835 lt!66510) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5377 () Bool)

(assert (= bs!5377 d!39345))

(assert (=> bs!5377 m!149959))

(assert (=> bs!5377 m!150571))

(assert (=> bs!5377 m!150571))

(declare-fun m!151927 () Bool)

(assert (=> bs!5377 m!151927))

(assert (=> b!128422 d!39345))

(declare-fun c!23770 () Bool)

(declare-fun d!39347 () Bool)

(assert (=> d!39347 (= c!23770 ((_ is ValueCellFull!1082) (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000)))))

(declare-fun e!84319 () V!3449)

(assert (=> d!39347 (= (get!1462 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84319)))

(declare-fun b!129208 () Bool)

(assert (=> b!129208 (= e!84319 (get!1464 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129209 () Bool)

(assert (=> b!129209 (= e!84319 (get!1465 (select (arr!2229 (ite (or c!23474 c!23471) (_values!2787 newMap!16) (array!4710 (store (arr!2229 (_values!2787 newMap!16)) (index!3217 lt!66202) (ValueCellFull!1082 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2494 (_values!2787 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39347 c!23770) b!129208))

(assert (= (and d!39347 (not c!23770)) b!129209))

(assert (=> b!129208 m!150353))

(assert (=> b!129208 m!150011))

(declare-fun m!151929 () Bool)

(assert (=> b!129208 m!151929))

(assert (=> b!129209 m!150353))

(assert (=> b!129209 m!150011))

(declare-fun m!151931 () Bool)

(assert (=> b!129209 m!151931))

(assert (=> b!128422 d!39347))

(declare-fun d!39349 () Bool)

(assert (=> d!39349 (= (get!1466 (getValueByKey!169 (toList!835 lt!66265) lt!66257)) (v!3150 (getValueByKey!169 (toList!835 lt!66265) lt!66257)))))

(assert (=> d!38829 d!39349))

(declare-fun b!129213 () Bool)

(declare-fun e!84321 () Option!175)

(assert (=> b!129213 (= e!84321 None!173)))

(declare-fun b!129212 () Bool)

(assert (=> b!129212 (= e!84321 (getValueByKey!169 (t!6053 (toList!835 lt!66265)) lt!66257))))

(declare-fun d!39351 () Bool)

(declare-fun c!23771 () Bool)

(assert (=> d!39351 (= c!23771 (and ((_ is Cons!1678) (toList!835 lt!66265)) (= (_1!1279 (h!2281 (toList!835 lt!66265))) lt!66257)))))

(declare-fun e!84320 () Option!175)

(assert (=> d!39351 (= (getValueByKey!169 (toList!835 lt!66265) lt!66257) e!84320)))

(declare-fun b!129211 () Bool)

(assert (=> b!129211 (= e!84320 e!84321)))

(declare-fun c!23772 () Bool)

(assert (=> b!129211 (= c!23772 (and ((_ is Cons!1678) (toList!835 lt!66265)) (not (= (_1!1279 (h!2281 (toList!835 lt!66265))) lt!66257))))))

(declare-fun b!129210 () Bool)

(assert (=> b!129210 (= e!84320 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66265)))))))

(assert (= (and d!39351 c!23771) b!129210))

(assert (= (and d!39351 (not c!23771)) b!129211))

(assert (= (and b!129211 c!23772) b!129212))

(assert (= (and b!129211 (not c!23772)) b!129213))

(declare-fun m!151933 () Bool)

(assert (=> b!129212 m!151933))

(assert (=> d!38829 d!39351))

(declare-fun d!39353 () Bool)

(declare-fun e!84323 () Bool)

(assert (=> d!39353 e!84323))

(declare-fun res!62370 () Bool)

(assert (=> d!39353 (=> res!62370 e!84323)))

(declare-fun lt!67040 () Bool)

(assert (=> d!39353 (= res!62370 (not lt!67040))))

(declare-fun lt!67043 () Bool)

(assert (=> d!39353 (= lt!67040 lt!67043)))

(declare-fun lt!67041 () Unit!3985)

(declare-fun e!84322 () Unit!3985)

(assert (=> d!39353 (= lt!67041 e!84322)))

(declare-fun c!23773 () Bool)

(assert (=> d!39353 (= c!23773 lt!67043)))

(assert (=> d!39353 (= lt!67043 (containsKey!172 (toList!835 lt!66292) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!39353 (= (contains!869 lt!66292 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) lt!67040)))

(declare-fun b!129214 () Bool)

(declare-fun lt!67042 () Unit!3985)

(assert (=> b!129214 (= e!84322 lt!67042)))

(assert (=> b!129214 (= lt!67042 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66292) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129214 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129215 () Bool)

(declare-fun Unit!4034 () Unit!3985)

(assert (=> b!129215 (= e!84322 Unit!4034)))

(declare-fun b!129216 () Bool)

(assert (=> b!129216 (= e!84323 (isDefined!121 (getValueByKey!169 (toList!835 lt!66292) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(assert (= (and d!39353 c!23773) b!129214))

(assert (= (and d!39353 (not c!23773)) b!129215))

(assert (= (and d!39353 (not res!62370)) b!129216))

(assert (=> d!39353 m!149959))

(declare-fun m!151935 () Bool)

(assert (=> d!39353 m!151935))

(assert (=> b!129214 m!149959))

(declare-fun m!151937 () Bool)

(assert (=> b!129214 m!151937))

(assert (=> b!129214 m!149959))

(declare-fun m!151939 () Bool)

(assert (=> b!129214 m!151939))

(assert (=> b!129214 m!151939))

(declare-fun m!151941 () Bool)

(assert (=> b!129214 m!151941))

(assert (=> b!129216 m!149959))

(assert (=> b!129216 m!151939))

(assert (=> b!129216 m!151939))

(assert (=> b!129216 m!151941))

(assert (=> b!128168 d!39353))

(assert (=> b!128289 d!38861))

(assert (=> b!128449 d!39059))

(declare-fun d!39355 () Bool)

(declare-fun e!84325 () Bool)

(assert (=> d!39355 e!84325))

(declare-fun res!62371 () Bool)

(assert (=> d!39355 (=> res!62371 e!84325)))

(declare-fun lt!67044 () Bool)

(assert (=> d!39355 (= res!62371 (not lt!67044))))

(declare-fun lt!67047 () Bool)

(assert (=> d!39355 (= lt!67044 lt!67047)))

(declare-fun lt!67045 () Unit!3985)

(declare-fun e!84324 () Unit!3985)

(assert (=> d!39355 (= lt!67045 e!84324)))

(declare-fun c!23774 () Bool)

(assert (=> d!39355 (= c!23774 lt!67047)))

(assert (=> d!39355 (= lt!67047 (containsKey!172 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))

(assert (=> d!39355 (= (contains!869 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))) lt!67044)))

(declare-fun b!129217 () Bool)

(declare-fun lt!67046 () Unit!3985)

(assert (=> b!129217 (= e!84324 lt!67046)))

(assert (=> b!129217 (= lt!67046 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))

(assert (=> b!129217 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202))))))

(declare-fun b!129218 () Bool)

(declare-fun Unit!4035 () Unit!3985)

(assert (=> b!129218 (= e!84324 Unit!4035)))

(declare-fun b!129219 () Bool)

(assert (=> b!129219 (= e!84325 (isDefined!121 (getValueByKey!169 (toList!835 (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16))) (select (arr!2228 (_keys!4541 newMap!16)) (index!3217 lt!66202)))))))

(assert (= (and d!39355 c!23774) b!129217))

(assert (= (and d!39355 (not c!23774)) b!129218))

(assert (= (and d!39355 (not res!62371)) b!129219))

(assert (=> d!39355 m!149871))

(declare-fun m!151943 () Bool)

(assert (=> d!39355 m!151943))

(assert (=> b!129217 m!149871))

(declare-fun m!151945 () Bool)

(assert (=> b!129217 m!151945))

(assert (=> b!129217 m!149871))

(declare-fun m!151947 () Bool)

(assert (=> b!129217 m!151947))

(assert (=> b!129217 m!151947))

(declare-fun m!151949 () Bool)

(assert (=> b!129217 m!151949))

(assert (=> b!129219 m!149871))

(assert (=> b!129219 m!151947))

(assert (=> b!129219 m!151947))

(assert (=> b!129219 m!151949))

(assert (=> b!128434 d!39355))

(declare-fun bm!13973 () Bool)

(declare-fun call!13982 () ListLongMap!1639)

(declare-fun call!13979 () ListLongMap!1639)

(assert (=> bm!13973 (= call!13982 call!13979)))

(declare-fun b!129220 () Bool)

(declare-fun res!62378 () Bool)

(declare-fun e!84327 () Bool)

(assert (=> b!129220 (=> (not res!62378) (not e!84327))))

(declare-fun e!84336 () Bool)

(assert (=> b!129220 (= res!62378 e!84336)))

(declare-fun c!23778 () Bool)

(assert (=> b!129220 (= c!23778 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!129221 () Bool)

(declare-fun e!84330 () Bool)

(assert (=> b!129221 (= e!84330 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129222 () Bool)

(declare-fun e!84332 () ListLongMap!1639)

(declare-fun e!84337 () ListLongMap!1639)

(assert (=> b!129222 (= e!84332 e!84337)))

(declare-fun c!23780 () Bool)

(assert (=> b!129222 (= c!23780 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129223 () Bool)

(declare-fun call!13980 () Bool)

(assert (=> b!129223 (= e!84336 (not call!13980))))

(declare-fun bm!13974 () Bool)

(declare-fun lt!67069 () ListLongMap!1639)

(assert (=> bm!13974 (= call!13980 (contains!869 lt!67069 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!13975 () Bool)

(declare-fun call!13977 () ListLongMap!1639)

(declare-fun call!13981 () ListLongMap!1639)

(assert (=> bm!13975 (= call!13977 call!13981)))

(declare-fun b!129224 () Bool)

(declare-fun e!84334 () Bool)

(assert (=> b!129224 (= e!84334 (validKeyInArray!0 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!129225 () Bool)

(declare-fun e!84326 () Bool)

(assert (=> b!129225 (= e!84326 (= (apply!112 lt!67069 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2665 newMap!16)))))

(declare-fun b!129226 () Bool)

(assert (=> b!129226 (= e!84336 e!84326)))

(declare-fun res!62373 () Bool)

(assert (=> b!129226 (= res!62373 call!13980)))

(assert (=> b!129226 (=> (not res!62373) (not e!84326))))

(declare-fun d!39357 () Bool)

(assert (=> d!39357 e!84327))

(declare-fun res!62374 () Bool)

(assert (=> d!39357 (=> (not res!62374) (not e!84327))))

(assert (=> d!39357 (= res!62374 (or (bvsge #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))))

(declare-fun lt!67057 () ListLongMap!1639)

(assert (=> d!39357 (= lt!67069 lt!67057)))

(declare-fun lt!67061 () Unit!3985)

(declare-fun e!84333 () Unit!3985)

(assert (=> d!39357 (= lt!67061 e!84333)))

(declare-fun c!23779 () Bool)

(assert (=> d!39357 (= c!23779 e!84330)))

(declare-fun res!62375 () Bool)

(assert (=> d!39357 (=> (not res!62375) (not e!84330))))

(assert (=> d!39357 (= res!62375 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(assert (=> d!39357 (= lt!67057 e!84332)))

(declare-fun c!23776 () Bool)

(assert (=> d!39357 (= c!23776 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!39357 (validMask!0 (mask!7072 newMap!16))))

(assert (=> d!39357 (= (getCurrentListMap!514 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)) lt!67069)))

(declare-fun b!129227 () Bool)

(declare-fun Unit!4036 () Unit!3985)

(assert (=> b!129227 (= e!84333 Unit!4036)))

(declare-fun bm!13976 () Bool)

(declare-fun call!13976 () Bool)

(assert (=> bm!13976 (= call!13976 (contains!869 lt!67069 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129228 () Bool)

(declare-fun e!84329 () ListLongMap!1639)

(assert (=> b!129228 (= e!84329 call!13982)))

(declare-fun b!129229 () Bool)

(declare-fun e!84328 () Bool)

(assert (=> b!129229 (= e!84328 (not call!13976))))

(declare-fun b!129230 () Bool)

(declare-fun e!84331 () Bool)

(declare-fun e!84335 () Bool)

(assert (=> b!129230 (= e!84331 e!84335)))

(declare-fun res!62379 () Bool)

(assert (=> b!129230 (=> (not res!62379) (not e!84335))))

(assert (=> b!129230 (= res!62379 (contains!869 lt!67069 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!129230 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13977 () Bool)

(declare-fun call!13978 () ListLongMap!1639)

(assert (=> bm!13977 (= call!13978 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun b!129231 () Bool)

(assert (=> b!129231 (= e!84332 (+!165 call!13979 (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16))))))

(declare-fun bm!13978 () Bool)

(assert (=> bm!13978 (= call!13981 call!13978)))

(declare-fun b!129232 () Bool)

(assert (=> b!129232 (= e!84327 e!84328)))

(declare-fun c!23777 () Bool)

(assert (=> b!129232 (= c!23777 (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!129233 () Bool)

(assert (=> b!129233 (= e!84335 (= (apply!112 lt!67069 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1462 (select (arr!2229 lt!66194) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!129233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2494 lt!66194)))))

(assert (=> b!129233 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun b!129234 () Bool)

(declare-fun res!62380 () Bool)

(assert (=> b!129234 (=> (not res!62380) (not e!84327))))

(assert (=> b!129234 (= res!62380 e!84331)))

(declare-fun res!62372 () Bool)

(assert (=> b!129234 (=> res!62372 e!84331)))

(assert (=> b!129234 (= res!62372 (not e!84334))))

(declare-fun res!62377 () Bool)

(assert (=> b!129234 (=> (not res!62377) (not e!84334))))

(assert (=> b!129234 (= res!62377 (bvslt #b00000000000000000000000000000000 (size!2493 (_keys!4541 newMap!16))))))

(declare-fun bm!13979 () Bool)

(assert (=> bm!13979 (= call!13979 (+!165 (ite c!23776 call!13978 (ite c!23780 call!13981 call!13977)) (ite (or c!23776 c!23780) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 newMap!16)) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 newMap!16)))))))

(declare-fun b!129235 () Bool)

(declare-fun lt!67048 () Unit!3985)

(assert (=> b!129235 (= e!84333 lt!67048)))

(declare-fun lt!67050 () ListLongMap!1639)

(assert (=> b!129235 (= lt!67050 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!67054 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67054 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67051 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67051 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67068 () Unit!3985)

(assert (=> b!129235 (= lt!67068 (addStillContains!88 lt!67050 lt!67054 (zeroValue!2665 newMap!16) lt!67051))))

(assert (=> b!129235 (contains!869 (+!165 lt!67050 (tuple2!2537 lt!67054 (zeroValue!2665 newMap!16))) lt!67051)))

(declare-fun lt!67055 () Unit!3985)

(assert (=> b!129235 (= lt!67055 lt!67068)))

(declare-fun lt!67067 () ListLongMap!1639)

(assert (=> b!129235 (= lt!67067 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!67053 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67062 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67062 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67063 () Unit!3985)

(assert (=> b!129235 (= lt!67063 (addApplyDifferent!88 lt!67067 lt!67053 (minValue!2665 newMap!16) lt!67062))))

(assert (=> b!129235 (= (apply!112 (+!165 lt!67067 (tuple2!2537 lt!67053 (minValue!2665 newMap!16))) lt!67062) (apply!112 lt!67067 lt!67062))))

(declare-fun lt!67059 () Unit!3985)

(assert (=> b!129235 (= lt!67059 lt!67063)))

(declare-fun lt!67064 () ListLongMap!1639)

(assert (=> b!129235 (= lt!67064 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!67065 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67065 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67056 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67056 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!67058 () Unit!3985)

(assert (=> b!129235 (= lt!67058 (addApplyDifferent!88 lt!67064 lt!67065 (zeroValue!2665 newMap!16) lt!67056))))

(assert (=> b!129235 (= (apply!112 (+!165 lt!67064 (tuple2!2537 lt!67065 (zeroValue!2665 newMap!16))) lt!67056) (apply!112 lt!67064 lt!67056))))

(declare-fun lt!67052 () Unit!3985)

(assert (=> b!129235 (= lt!67052 lt!67058)))

(declare-fun lt!67066 () ListLongMap!1639)

(assert (=> b!129235 (= lt!67066 (getCurrentListMapNoExtraKeys!132 (_keys!4541 newMap!16) lt!66194 (mask!7072 newMap!16) (extraKeys!2581 newMap!16) (zeroValue!2665 newMap!16) (minValue!2665 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2804 newMap!16)))))

(declare-fun lt!67060 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!67049 () (_ BitVec 64))

(assert (=> b!129235 (= lt!67049 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!129235 (= lt!67048 (addApplyDifferent!88 lt!67066 lt!67060 (minValue!2665 newMap!16) lt!67049))))

(assert (=> b!129235 (= (apply!112 (+!165 lt!67066 (tuple2!2537 lt!67060 (minValue!2665 newMap!16))) lt!67049) (apply!112 lt!67066 lt!67049))))

(declare-fun b!129236 () Bool)

(assert (=> b!129236 (= e!84329 call!13977)))

(declare-fun b!129237 () Bool)

(declare-fun e!84338 () Bool)

(assert (=> b!129237 (= e!84338 (= (apply!112 lt!67069 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2665 newMap!16)))))

(declare-fun b!129238 () Bool)

(assert (=> b!129238 (= e!84337 call!13982)))

(declare-fun b!129239 () Bool)

(declare-fun c!23775 () Bool)

(assert (=> b!129239 (= c!23775 (and (not (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!2581 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!129239 (= e!84337 e!84329)))

(declare-fun b!129240 () Bool)

(assert (=> b!129240 (= e!84328 e!84338)))

(declare-fun res!62376 () Bool)

(assert (=> b!129240 (= res!62376 call!13976)))

(assert (=> b!129240 (=> (not res!62376) (not e!84338))))

(assert (= (and d!39357 c!23776) b!129231))

(assert (= (and d!39357 (not c!23776)) b!129222))

(assert (= (and b!129222 c!23780) b!129238))

(assert (= (and b!129222 (not c!23780)) b!129239))

(assert (= (and b!129239 c!23775) b!129228))

(assert (= (and b!129239 (not c!23775)) b!129236))

(assert (= (or b!129228 b!129236) bm!13975))

(assert (= (or b!129238 bm!13975) bm!13978))

(assert (= (or b!129238 b!129228) bm!13973))

(assert (= (or b!129231 bm!13978) bm!13977))

(assert (= (or b!129231 bm!13973) bm!13979))

(assert (= (and d!39357 res!62375) b!129221))

(assert (= (and d!39357 c!23779) b!129235))

(assert (= (and d!39357 (not c!23779)) b!129227))

(assert (= (and d!39357 res!62374) b!129234))

(assert (= (and b!129234 res!62377) b!129224))

(assert (= (and b!129234 (not res!62372)) b!129230))

(assert (= (and b!129230 res!62379) b!129233))

(assert (= (and b!129234 res!62380) b!129220))

(assert (= (and b!129220 c!23778) b!129226))

(assert (= (and b!129220 (not c!23778)) b!129223))

(assert (= (and b!129226 res!62373) b!129225))

(assert (= (or b!129226 b!129223) bm!13974))

(assert (= (and b!129220 res!62378) b!129232))

(assert (= (and b!129232 c!23777) b!129240))

(assert (= (and b!129232 (not c!23777)) b!129229))

(assert (= (and b!129240 res!62376) b!129237))

(assert (= (or b!129240 b!129229) bm!13976))

(declare-fun b_lambda!5721 () Bool)

(assert (=> (not b_lambda!5721) (not b!129233)))

(assert (=> b!129233 t!6065))

(declare-fun b_and!7993 () Bool)

(assert (= b_and!7989 (and (=> t!6065 result!3889) b_and!7993)))

(assert (=> b!129233 t!6067))

(declare-fun b_and!7995 () Bool)

(assert (= b_and!7991 (and (=> t!6067 result!3891) b_and!7995)))

(declare-fun m!151951 () Bool)

(assert (=> bm!13974 m!151951))

(declare-fun m!151953 () Bool)

(assert (=> bm!13977 m!151953))

(assert (=> b!129230 m!149959))

(assert (=> b!129230 m!149959))

(declare-fun m!151955 () Bool)

(assert (=> b!129230 m!151955))

(assert (=> d!39357 m!149963))

(assert (=> b!129224 m!149959))

(assert (=> b!129224 m!149959))

(assert (=> b!129224 m!149965))

(assert (=> b!129221 m!149959))

(assert (=> b!129221 m!149959))

(assert (=> b!129221 m!149965))

(declare-fun m!151957 () Bool)

(assert (=> b!129231 m!151957))

(declare-fun m!151959 () Bool)

(assert (=> bm!13976 m!151959))

(declare-fun m!151961 () Bool)

(assert (=> b!129237 m!151961))

(declare-fun m!151963 () Bool)

(assert (=> b!129235 m!151963))

(declare-fun m!151965 () Bool)

(assert (=> b!129235 m!151965))

(declare-fun m!151967 () Bool)

(assert (=> b!129235 m!151967))

(declare-fun m!151969 () Bool)

(assert (=> b!129235 m!151969))

(declare-fun m!151971 () Bool)

(assert (=> b!129235 m!151971))

(declare-fun m!151973 () Bool)

(assert (=> b!129235 m!151973))

(declare-fun m!151975 () Bool)

(assert (=> b!129235 m!151975))

(declare-fun m!151977 () Bool)

(assert (=> b!129235 m!151977))

(declare-fun m!151979 () Bool)

(assert (=> b!129235 m!151979))

(assert (=> b!129235 m!151967))

(declare-fun m!151981 () Bool)

(assert (=> b!129235 m!151981))

(declare-fun m!151983 () Bool)

(assert (=> b!129235 m!151983))

(declare-fun m!151985 () Bool)

(assert (=> b!129235 m!151985))

(declare-fun m!151987 () Bool)

(assert (=> b!129235 m!151987))

(assert (=> b!129235 m!151977))

(declare-fun m!151989 () Bool)

(assert (=> b!129235 m!151989))

(declare-fun m!151991 () Bool)

(assert (=> b!129235 m!151991))

(assert (=> b!129235 m!149959))

(assert (=> b!129235 m!151971))

(assert (=> b!129235 m!151985))

(assert (=> b!129235 m!151953))

(declare-fun m!151993 () Bool)

(assert (=> b!129225 m!151993))

(declare-fun m!151995 () Bool)

(assert (=> bm!13979 m!151995))

(assert (=> b!129233 m!149959))

(assert (=> b!129233 m!149959))

(declare-fun m!151997 () Bool)

(assert (=> b!129233 m!151997))

(declare-fun m!151999 () Bool)

(assert (=> b!129233 m!151999))

(assert (=> b!129233 m!150011))

(declare-fun m!152001 () Bool)

(assert (=> b!129233 m!152001))

(assert (=> b!129233 m!151999))

(assert (=> b!129233 m!150011))

(assert (=> b!128434 d!39357))

(declare-fun d!39359 () Bool)

(assert (=> d!39359 (= (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66257)) (v!3150 (getValueByKey!169 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66257)))))

(assert (=> d!38821 d!39359))

(declare-fun b!129244 () Bool)

(declare-fun e!84340 () Option!175)

(assert (=> b!129244 (= e!84340 None!173)))

(declare-fun b!129243 () Bool)

(assert (=> b!129243 (= e!84340 (getValueByKey!169 (t!6053 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66257))))

(declare-fun c!23781 () Bool)

(declare-fun d!39361 () Bool)

(assert (=> d!39361 (= c!23781 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66257)))))

(declare-fun e!84339 () Option!175)

(assert (=> d!39361 (= (getValueByKey!169 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66257) e!84339)))

(declare-fun b!129242 () Bool)

(assert (=> b!129242 (= e!84339 e!84340)))

(declare-fun c!23782 () Bool)

(assert (=> b!129242 (= c!23782 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))) (not (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66257))))))

(declare-fun b!129241 () Bool)

(assert (=> b!129241 (= e!84339 (Some!174 (_2!1279 (h!2281 (toList!835 (+!165 lt!66265 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(assert (= (and d!39361 c!23781) b!129241))

(assert (= (and d!39361 (not c!23781)) b!129242))

(assert (= (and b!129242 c!23782) b!129243))

(assert (= (and b!129242 (not c!23782)) b!129244))

(declare-fun m!152003 () Bool)

(assert (=> b!129243 m!152003))

(assert (=> d!38821 d!39361))

(declare-fun d!39363 () Bool)

(declare-fun res!62381 () Bool)

(declare-fun e!84341 () Bool)

(assert (=> d!39363 (=> res!62381 e!84341)))

(assert (=> d!39363 (= res!62381 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (=> d!39363 (= (containsKey!172 (toList!835 lt!66270) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) e!84341)))

(declare-fun b!129245 () Bool)

(declare-fun e!84342 () Bool)

(assert (=> b!129245 (= e!84341 e!84342)))

(declare-fun res!62382 () Bool)

(assert (=> b!129245 (=> (not res!62382) (not e!84342))))

(assert (=> b!129245 (= res!62382 (and (or (not ((_ is Cons!1678) (toList!835 lt!66270))) (bvsle (_1!1279 (h!2281 (toList!835 lt!66270))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))) ((_ is Cons!1678) (toList!835 lt!66270)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66270))) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun b!129246 () Bool)

(assert (=> b!129246 (= e!84342 (containsKey!172 (t!6053 (toList!835 lt!66270)) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (= (and d!39363 (not res!62381)) b!129245))

(assert (= (and b!129245 res!62382) b!129246))

(assert (=> b!129246 m!149899))

(declare-fun m!152005 () Bool)

(assert (=> b!129246 m!152005))

(assert (=> d!38915 d!39363))

(declare-fun d!39365 () Bool)

(assert (=> d!39365 (= (apply!112 lt!66510 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1466 (getValueByKey!169 (toList!835 lt!66510) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!5378 () Bool)

(assert (= bs!5378 d!39365))

(assert (=> bs!5378 m!151911))

(assert (=> bs!5378 m!151911))

(declare-fun m!152007 () Bool)

(assert (=> bs!5378 m!152007))

(assert (=> b!128426 d!39365))

(declare-fun d!39367 () Bool)

(assert (=> d!39367 (= (get!1466 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3150 (getValueByKey!169 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38873 d!39367))

(assert (=> d!38873 d!38965))

(declare-fun d!39369 () Bool)

(declare-fun e!84344 () Bool)

(assert (=> d!39369 e!84344))

(declare-fun res!62383 () Bool)

(assert (=> d!39369 (=> res!62383 e!84344)))

(declare-fun lt!67070 () Bool)

(assert (=> d!39369 (= res!62383 (not lt!67070))))

(declare-fun lt!67073 () Bool)

(assert (=> d!39369 (= lt!67070 lt!67073)))

(declare-fun lt!67071 () Unit!3985)

(declare-fun e!84343 () Unit!3985)

(assert (=> d!39369 (= lt!67071 e!84343)))

(declare-fun c!23783 () Bool)

(assert (=> d!39369 (= c!23783 lt!67073)))

(assert (=> d!39369 (= lt!67073 (containsKey!172 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!39369 (= (contains!869 lt!66511 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67070)))

(declare-fun b!129247 () Bool)

(declare-fun lt!67072 () Unit!3985)

(assert (=> b!129247 (= e!84343 lt!67072)))

(assert (=> b!129247 (= lt!67072 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!129247 (isDefined!121 (getValueByKey!169 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129248 () Bool)

(declare-fun Unit!4037 () Unit!3985)

(assert (=> b!129248 (= e!84343 Unit!4037)))

(declare-fun b!129249 () Bool)

(assert (=> b!129249 (= e!84344 (isDefined!121 (getValueByKey!169 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39369 c!23783) b!129247))

(assert (= (and d!39369 (not c!23783)) b!129248))

(assert (= (and d!39369 (not res!62383)) b!129249))

(declare-fun m!152009 () Bool)

(assert (=> d!39369 m!152009))

(declare-fun m!152011 () Bool)

(assert (=> b!129247 m!152011))

(assert (=> b!129247 m!150365))

(assert (=> b!129247 m!150365))

(declare-fun m!152013 () Bool)

(assert (=> b!129247 m!152013))

(assert (=> b!129249 m!150365))

(assert (=> b!129249 m!150365))

(assert (=> b!129249 m!152013))

(assert (=> d!38889 d!39369))

(declare-fun b!129253 () Bool)

(declare-fun e!84346 () Option!175)

(assert (=> b!129253 (= e!84346 None!173)))

(declare-fun b!129252 () Bool)

(assert (=> b!129252 (= e!84346 (getValueByKey!169 (t!6053 lt!66513) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!39371 () Bool)

(declare-fun c!23784 () Bool)

(assert (=> d!39371 (= c!23784 (and ((_ is Cons!1678) lt!66513) (= (_1!1279 (h!2281 lt!66513)) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!84345 () Option!175)

(assert (=> d!39371 (= (getValueByKey!169 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84345)))

(declare-fun b!129251 () Bool)

(assert (=> b!129251 (= e!84345 e!84346)))

(declare-fun c!23785 () Bool)

(assert (=> b!129251 (= c!23785 (and ((_ is Cons!1678) lt!66513) (not (= (_1!1279 (h!2281 lt!66513)) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!129250 () Bool)

(assert (=> b!129250 (= e!84345 (Some!174 (_2!1279 (h!2281 lt!66513))))))

(assert (= (and d!39371 c!23784) b!129250))

(assert (= (and d!39371 (not c!23784)) b!129251))

(assert (= (and b!129251 c!23785) b!129252))

(assert (= (and b!129251 (not c!23785)) b!129253))

(declare-fun m!152015 () Bool)

(assert (=> b!129252 m!152015))

(assert (=> d!38889 d!39371))

(declare-fun d!39373 () Bool)

(assert (=> d!39373 (= (getValueByKey!169 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!174 (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!67074 () Unit!3985)

(assert (=> d!39373 (= lt!67074 (choose!789 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84347 () Bool)

(assert (=> d!39373 e!84347))

(declare-fun res!62384 () Bool)

(assert (=> d!39373 (=> (not res!62384) (not e!84347))))

(assert (=> d!39373 (= res!62384 (isStrictlySorted!305 lt!66513))))

(assert (=> d!39373 (= (lemmaContainsTupThenGetReturnValue!84 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67074)))

(declare-fun b!129254 () Bool)

(declare-fun res!62385 () Bool)

(assert (=> b!129254 (=> (not res!62385) (not e!84347))))

(assert (=> b!129254 (= res!62385 (containsKey!172 lt!66513 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129255 () Bool)

(assert (=> b!129255 (= e!84347 (contains!871 lt!66513 (tuple2!2537 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (= (and d!39373 res!62384) b!129254))

(assert (= (and b!129254 res!62385) b!129255))

(assert (=> d!39373 m!150359))

(declare-fun m!152017 () Bool)

(assert (=> d!39373 m!152017))

(declare-fun m!152019 () Bool)

(assert (=> d!39373 m!152019))

(declare-fun m!152021 () Bool)

(assert (=> b!129254 m!152021))

(declare-fun m!152023 () Bool)

(assert (=> b!129255 m!152023))

(assert (=> d!38889 d!39373))

(declare-fun bm!13980 () Bool)

(declare-fun call!13983 () List!1682)

(declare-fun c!23787 () Bool)

(declare-fun e!84348 () List!1682)

(assert (=> bm!13980 (= call!13983 ($colon$colon!89 e!84348 (ite c!23787 (h!2281 (toList!835 e!83611)) (tuple2!2537 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun c!23788 () Bool)

(assert (=> bm!13980 (= c!23788 c!23787)))

(declare-fun d!39375 () Bool)

(declare-fun e!84351 () Bool)

(assert (=> d!39375 e!84351))

(declare-fun res!62386 () Bool)

(assert (=> d!39375 (=> (not res!62386) (not e!84351))))

(declare-fun lt!67075 () List!1682)

(assert (=> d!39375 (= res!62386 (isStrictlySorted!305 lt!67075))))

(declare-fun e!84352 () List!1682)

(assert (=> d!39375 (= lt!67075 e!84352)))

(assert (=> d!39375 (= c!23787 (and ((_ is Cons!1678) (toList!835 e!83611)) (bvslt (_1!1279 (h!2281 (toList!835 e!83611))) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> d!39375 (isStrictlySorted!305 (toList!835 e!83611))))

(assert (=> d!39375 (= (insertStrictlySorted!87 (toList!835 e!83611) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) lt!67075)))

(declare-fun b!129256 () Bool)

(assert (=> b!129256 (= e!84348 (insertStrictlySorted!87 (t!6053 (toList!835 e!83611)) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!129257 () Bool)

(assert (=> b!129257 (= e!84352 call!13983)))

(declare-fun b!129258 () Bool)

(declare-fun e!84349 () List!1682)

(assert (=> b!129258 (= e!84352 e!84349)))

(declare-fun c!23789 () Bool)

(assert (=> b!129258 (= c!23789 (and ((_ is Cons!1678) (toList!835 e!83611)) (= (_1!1279 (h!2281 (toList!835 e!83611))) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129259 () Bool)

(declare-fun e!84350 () List!1682)

(declare-fun call!13985 () List!1682)

(assert (=> b!129259 (= e!84350 call!13985)))

(declare-fun bm!13981 () Bool)

(declare-fun call!13984 () List!1682)

(assert (=> bm!13981 (= call!13985 call!13984)))

(declare-fun c!23786 () Bool)

(declare-fun b!129260 () Bool)

(assert (=> b!129260 (= e!84348 (ite c!23789 (t!6053 (toList!835 e!83611)) (ite c!23786 (Cons!1678 (h!2281 (toList!835 e!83611)) (t!6053 (toList!835 e!83611))) Nil!1679)))))

(declare-fun b!129261 () Bool)

(assert (=> b!129261 (= e!84350 call!13985)))

(declare-fun b!129262 () Bool)

(assert (=> b!129262 (= e!84351 (contains!871 lt!67075 (tuple2!2537 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129263 () Bool)

(assert (=> b!129263 (= c!23786 (and ((_ is Cons!1678) (toList!835 e!83611)) (bvsgt (_1!1279 (h!2281 (toList!835 e!83611))) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(assert (=> b!129263 (= e!84349 e!84350)))

(declare-fun b!129264 () Bool)

(declare-fun res!62387 () Bool)

(assert (=> b!129264 (=> (not res!62387) (not e!84351))))

(assert (=> b!129264 (= res!62387 (containsKey!172 lt!67075 (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!13982 () Bool)

(assert (=> bm!13982 (= call!13984 call!13983)))

(declare-fun b!129265 () Bool)

(assert (=> b!129265 (= e!84349 call!13984)))

(assert (= (and d!39375 c!23787) b!129257))

(assert (= (and d!39375 (not c!23787)) b!129258))

(assert (= (and b!129258 c!23789) b!129265))

(assert (= (and b!129258 (not c!23789)) b!129263))

(assert (= (and b!129263 c!23786) b!129261))

(assert (= (and b!129263 (not c!23786)) b!129259))

(assert (= (or b!129261 b!129259) bm!13981))

(assert (= (or b!129265 bm!13981) bm!13982))

(assert (= (or b!129257 bm!13982) bm!13980))

(assert (= (and bm!13980 c!23788) b!129256))

(assert (= (and bm!13980 (not c!23788)) b!129260))

(assert (= (and d!39375 res!62386) b!129264))

(assert (= (and b!129264 res!62387) b!129262))

(declare-fun m!152025 () Bool)

(assert (=> b!129264 m!152025))

(declare-fun m!152027 () Bool)

(assert (=> b!129256 m!152027))

(declare-fun m!152029 () Bool)

(assert (=> d!39375 m!152029))

(declare-fun m!152031 () Bool)

(assert (=> d!39375 m!152031))

(declare-fun m!152033 () Bool)

(assert (=> bm!13980 m!152033))

(declare-fun m!152035 () Bool)

(assert (=> b!129262 m!152035))

(assert (=> d!38889 d!39375))

(assert (=> b!128452 d!39059))

(declare-fun d!39377 () Bool)

(declare-fun e!84354 () Bool)

(assert (=> d!39377 e!84354))

(declare-fun res!62388 () Bool)

(assert (=> d!39377 (=> res!62388 e!84354)))

(declare-fun lt!67076 () Bool)

(assert (=> d!39377 (= res!62388 (not lt!67076))))

(declare-fun lt!67079 () Bool)

(assert (=> d!39377 (= lt!67076 lt!67079)))

(declare-fun lt!67077 () Unit!3985)

(declare-fun e!84353 () Unit!3985)

(assert (=> d!39377 (= lt!67077 e!84353)))

(declare-fun c!23790 () Bool)

(assert (=> d!39377 (= c!23790 lt!67079)))

(assert (=> d!39377 (= lt!67079 (containsKey!172 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!39377 (= (contains!869 lt!66346 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67076)))

(declare-fun b!129266 () Bool)

(declare-fun lt!67078 () Unit!3985)

(assert (=> b!129266 (= e!84353 lt!67078)))

(assert (=> b!129266 (= lt!67078 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> b!129266 (isDefined!121 (getValueByKey!169 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129267 () Bool)

(declare-fun Unit!4038 () Unit!3985)

(assert (=> b!129267 (= e!84353 Unit!4038)))

(declare-fun b!129268 () Bool)

(assert (=> b!129268 (= e!84354 (isDefined!121 (getValueByKey!169 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39377 c!23790) b!129266))

(assert (= (and d!39377 (not c!23790)) b!129267))

(assert (= (and d!39377 (not res!62388)) b!129268))

(declare-fun m!152037 () Bool)

(assert (=> d!39377 m!152037))

(declare-fun m!152039 () Bool)

(assert (=> b!129266 m!152039))

(assert (=> b!129266 m!150129))

(assert (=> b!129266 m!150129))

(declare-fun m!152041 () Bool)

(assert (=> b!129266 m!152041))

(assert (=> b!129268 m!150129))

(assert (=> b!129268 m!150129))

(assert (=> b!129268 m!152041))

(assert (=> d!38839 d!39377))

(declare-fun b!129272 () Bool)

(declare-fun e!84356 () Option!175)

(assert (=> b!129272 (= e!84356 None!173)))

(declare-fun b!129271 () Bool)

(assert (=> b!129271 (= e!84356 (getValueByKey!169 (t!6053 lt!66348) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun c!23791 () Bool)

(declare-fun d!39379 () Bool)

(assert (=> d!39379 (= c!23791 (and ((_ is Cons!1678) lt!66348) (= (_1!1279 (h!2281 lt!66348)) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84355 () Option!175)

(assert (=> d!39379 (= (getValueByKey!169 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84355)))

(declare-fun b!129270 () Bool)

(assert (=> b!129270 (= e!84355 e!84356)))

(declare-fun c!23792 () Bool)

(assert (=> b!129270 (= c!23792 (and ((_ is Cons!1678) lt!66348) (not (= (_1!1279 (h!2281 lt!66348)) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129269 () Bool)

(assert (=> b!129269 (= e!84355 (Some!174 (_2!1279 (h!2281 lt!66348))))))

(assert (= (and d!39379 c!23791) b!129269))

(assert (= (and d!39379 (not c!23791)) b!129270))

(assert (= (and b!129270 c!23792) b!129271))

(assert (= (and b!129270 (not c!23792)) b!129272))

(declare-fun m!152043 () Bool)

(assert (=> b!129271 m!152043))

(assert (=> d!38839 d!39379))

(declare-fun d!39381 () Bool)

(assert (=> d!39381 (= (getValueByKey!169 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!67080 () Unit!3985)

(assert (=> d!39381 (= lt!67080 (choose!789 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!84357 () Bool)

(assert (=> d!39381 e!84357))

(declare-fun res!62389 () Bool)

(assert (=> d!39381 (=> (not res!62389) (not e!84357))))

(assert (=> d!39381 (= res!62389 (isStrictlySorted!305 lt!66348))))

(assert (=> d!39381 (= (lemmaContainsTupThenGetReturnValue!84 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67080)))

(declare-fun b!129273 () Bool)

(declare-fun res!62390 () Bool)

(assert (=> b!129273 (=> (not res!62390) (not e!84357))))

(assert (=> b!129273 (= res!62390 (containsKey!172 lt!66348 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129274 () Bool)

(assert (=> b!129274 (= e!84357 (contains!871 lt!66348 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39381 res!62389) b!129273))

(assert (= (and b!129273 res!62390) b!129274))

(assert (=> d!39381 m!150123))

(declare-fun m!152045 () Bool)

(assert (=> d!39381 m!152045))

(declare-fun m!152047 () Bool)

(assert (=> d!39381 m!152047))

(declare-fun m!152049 () Bool)

(assert (=> b!129273 m!152049))

(declare-fun m!152051 () Bool)

(assert (=> b!129274 m!152051))

(assert (=> d!38839 d!39381))

(declare-fun call!13986 () List!1682)

(declare-fun c!23794 () Bool)

(declare-fun e!84358 () List!1682)

(declare-fun bm!13983 () Bool)

(assert (=> bm!13983 (= call!13986 ($colon$colon!89 e!84358 (ite c!23794 (h!2281 (toList!835 lt!66265)) (tuple2!2537 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun c!23795 () Bool)

(assert (=> bm!13983 (= c!23795 c!23794)))

(declare-fun d!39383 () Bool)

(declare-fun e!84361 () Bool)

(assert (=> d!39383 e!84361))

(declare-fun res!62391 () Bool)

(assert (=> d!39383 (=> (not res!62391) (not e!84361))))

(declare-fun lt!67081 () List!1682)

(assert (=> d!39383 (= res!62391 (isStrictlySorted!305 lt!67081))))

(declare-fun e!84362 () List!1682)

(assert (=> d!39383 (= lt!67081 e!84362)))

(assert (=> d!39383 (= c!23794 (and ((_ is Cons!1678) (toList!835 lt!66265)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66265))) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!39383 (isStrictlySorted!305 (toList!835 lt!66265))))

(assert (=> d!39383 (= (insertStrictlySorted!87 (toList!835 lt!66265) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67081)))

(declare-fun b!129275 () Bool)

(assert (=> b!129275 (= e!84358 (insertStrictlySorted!87 (t!6053 (toList!835 lt!66265)) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129276 () Bool)

(assert (=> b!129276 (= e!84362 call!13986)))

(declare-fun b!129277 () Bool)

(declare-fun e!84359 () List!1682)

(assert (=> b!129277 (= e!84362 e!84359)))

(declare-fun c!23796 () Bool)

(assert (=> b!129277 (= c!23796 (and ((_ is Cons!1678) (toList!835 lt!66265)) (= (_1!1279 (h!2281 (toList!835 lt!66265))) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129278 () Bool)

(declare-fun e!84360 () List!1682)

(declare-fun call!13988 () List!1682)

(assert (=> b!129278 (= e!84360 call!13988)))

(declare-fun bm!13984 () Bool)

(declare-fun call!13987 () List!1682)

(assert (=> bm!13984 (= call!13988 call!13987)))

(declare-fun b!129279 () Bool)

(declare-fun c!23793 () Bool)

(assert (=> b!129279 (= e!84358 (ite c!23796 (t!6053 (toList!835 lt!66265)) (ite c!23793 (Cons!1678 (h!2281 (toList!835 lt!66265)) (t!6053 (toList!835 lt!66265))) Nil!1679)))))

(declare-fun b!129280 () Bool)

(assert (=> b!129280 (= e!84360 call!13988)))

(declare-fun b!129281 () Bool)

(assert (=> b!129281 (= e!84361 (contains!871 lt!67081 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129282 () Bool)

(assert (=> b!129282 (= c!23793 (and ((_ is Cons!1678) (toList!835 lt!66265)) (bvsgt (_1!1279 (h!2281 (toList!835 lt!66265))) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!129282 (= e!84359 e!84360)))

(declare-fun b!129283 () Bool)

(declare-fun res!62392 () Bool)

(assert (=> b!129283 (=> (not res!62392) (not e!84361))))

(assert (=> b!129283 (= res!62392 (containsKey!172 lt!67081 (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun bm!13985 () Bool)

(assert (=> bm!13985 (= call!13987 call!13986)))

(declare-fun b!129284 () Bool)

(assert (=> b!129284 (= e!84359 call!13987)))

(assert (= (and d!39383 c!23794) b!129276))

(assert (= (and d!39383 (not c!23794)) b!129277))

(assert (= (and b!129277 c!23796) b!129284))

(assert (= (and b!129277 (not c!23796)) b!129282))

(assert (= (and b!129282 c!23793) b!129280))

(assert (= (and b!129282 (not c!23793)) b!129278))

(assert (= (or b!129280 b!129278) bm!13984))

(assert (= (or b!129284 bm!13984) bm!13985))

(assert (= (or b!129276 bm!13985) bm!13983))

(assert (= (and bm!13983 c!23795) b!129275))

(assert (= (and bm!13983 (not c!23795)) b!129279))

(assert (= (and d!39383 res!62391) b!129283))

(assert (= (and b!129283 res!62392) b!129281))

(declare-fun m!152053 () Bool)

(assert (=> b!129283 m!152053))

(declare-fun m!152055 () Bool)

(assert (=> b!129275 m!152055))

(declare-fun m!152057 () Bool)

(assert (=> d!39383 m!152057))

(declare-fun m!152059 () Bool)

(assert (=> d!39383 m!152059))

(declare-fun m!152061 () Bool)

(assert (=> bm!13983 m!152061))

(declare-fun m!152063 () Bool)

(assert (=> b!129281 m!152063))

(assert (=> d!38839 d!39383))

(declare-fun d!39385 () Bool)

(assert (=> d!39385 (= (inRange!0 (index!3217 lt!66455) (mask!7072 newMap!16)) (and (bvsge (index!3217 lt!66455) #b00000000000000000000000000000000) (bvslt (index!3217 lt!66455) (bvadd (mask!7072 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> b!128320 d!39385))

(declare-fun d!39387 () Bool)

(assert (=> d!39387 (= (apply!112 lt!66292 (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000)) (get!1466 (getValueByKey!169 (toList!835 lt!66292) (select (arr!2228 (_keys!4541 newMap!16)) #b00000000000000000000000000000000))))))

(declare-fun bs!5379 () Bool)

(assert (= bs!5379 d!39387))

(assert (=> bs!5379 m!149959))

(assert (=> bs!5379 m!151939))

(assert (=> bs!5379 m!151939))

(declare-fun m!152065 () Bool)

(assert (=> bs!5379 m!152065))

(assert (=> b!128171 d!39387))

(declare-fun d!39389 () Bool)

(declare-fun c!23797 () Bool)

(assert (=> d!39389 (= c!23797 ((_ is ValueCellFull!1082) (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun e!84363 () V!3449)

(assert (=> d!39389 (= (get!1462 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)) e!84363)))

(declare-fun b!129285 () Bool)

(assert (=> b!129285 (= e!84363 (get!1464 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129286 () Bool)

(assert (=> b!129286 (= e!84363 (get!1465 (select (arr!2229 (_values!2787 newMap!16)) #b00000000000000000000000000000000) (dynLambda!419 (defaultEntry!2804 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39389 c!23797) b!129285))

(assert (= (and d!39389 (not c!23797)) b!129286))

(assert (=> b!129285 m!150009))

(assert (=> b!129285 m!150011))

(declare-fun m!152067 () Bool)

(assert (=> b!129285 m!152067))

(assert (=> b!129286 m!150009))

(assert (=> b!129286 m!150011))

(declare-fun m!152069 () Bool)

(assert (=> b!129286 m!152069))

(assert (=> b!128171 d!39389))

(declare-fun b!129290 () Bool)

(declare-fun e!84365 () Option!175)

(assert (=> b!129290 (= e!84365 None!173)))

(declare-fun b!129289 () Bool)

(assert (=> b!129289 (= e!84365 (getValueByKey!169 (t!6053 (toList!835 lt!66440)) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun c!23798 () Bool)

(declare-fun d!39391 () Bool)

(assert (=> d!39391 (= c!23798 (and ((_ is Cons!1678) (toList!835 lt!66440)) (= (_1!1279 (h!2281 (toList!835 lt!66440))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun e!84364 () Option!175)

(assert (=> d!39391 (= (getValueByKey!169 (toList!835 lt!66440) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) e!84364)))

(declare-fun b!129288 () Bool)

(assert (=> b!129288 (= e!84364 e!84365)))

(declare-fun c!23799 () Bool)

(assert (=> b!129288 (= c!23799 (and ((_ is Cons!1678) (toList!835 lt!66440)) (not (= (_1!1279 (h!2281 (toList!835 lt!66440))) (_1!1279 (ite (or c!23492 c!23496) (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(declare-fun b!129287 () Bool)

(assert (=> b!129287 (= e!84364 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66440)))))))

(assert (= (and d!39391 c!23798) b!129287))

(assert (= (and d!39391 (not c!23798)) b!129288))

(assert (= (and b!129288 c!23799) b!129289))

(assert (= (and b!129288 (not c!23799)) b!129290))

(declare-fun m!152071 () Bool)

(assert (=> b!129289 m!152071))

(assert (=> b!128297 d!39391))

(assert (=> bm!13845 d!39047))

(assert (=> b!128353 d!39059))

(declare-fun b!129294 () Bool)

(declare-fun e!84367 () Option!175)

(assert (=> b!129294 (= e!84367 None!173)))

(declare-fun b!129293 () Bool)

(assert (=> b!129293 (= e!84367 (getValueByKey!169 (t!6053 (toList!835 lt!66511)) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!39393 () Bool)

(declare-fun c!23800 () Bool)

(assert (=> d!39393 (= c!23800 (and ((_ is Cons!1678) (toList!835 lt!66511)) (= (_1!1279 (h!2281 (toList!835 lt!66511))) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun e!84366 () Option!175)

(assert (=> d!39393 (= (getValueByKey!169 (toList!835 lt!66511) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) e!84366)))

(declare-fun b!129292 () Bool)

(assert (=> b!129292 (= e!84366 e!84367)))

(declare-fun c!23801 () Bool)

(assert (=> b!129292 (= c!23801 (and ((_ is Cons!1678) (toList!835 lt!66511)) (not (= (_1!1279 (h!2281 (toList!835 lt!66511))) (_1!1279 (ite c!23474 (ite c!23467 (tuple2!2537 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2537 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!129291 () Bool)

(assert (=> b!129291 (= e!84366 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66511)))))))

(assert (= (and d!39393 c!23800) b!129291))

(assert (= (and d!39393 (not c!23800)) b!129292))

(assert (= (and b!129292 c!23801) b!129293))

(assert (= (and b!129292 (not c!23801)) b!129294))

(declare-fun m!152073 () Bool)

(assert (=> b!129293 m!152073))

(assert (=> b!128430 d!39393))

(assert (=> bm!13878 d!39005))

(declare-fun b!129298 () Bool)

(declare-fun e!84369 () Option!175)

(assert (=> b!129298 (= e!84369 None!173)))

(declare-fun b!129297 () Bool)

(assert (=> b!129297 (= e!84369 (getValueByKey!169 (t!6053 (toList!835 lt!66346)) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun d!39395 () Bool)

(declare-fun c!23802 () Bool)

(assert (=> d!39395 (= c!23802 (and ((_ is Cons!1678) (toList!835 lt!66346)) (= (_1!1279 (h!2281 (toList!835 lt!66346))) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84368 () Option!175)

(assert (=> d!39395 (= (getValueByKey!169 (toList!835 lt!66346) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84368)))

(declare-fun b!129296 () Bool)

(assert (=> b!129296 (= e!84368 e!84369)))

(declare-fun c!23803 () Bool)

(assert (=> b!129296 (= c!23803 (and ((_ is Cons!1678) (toList!835 lt!66346)) (not (= (_1!1279 (h!2281 (toList!835 lt!66346))) (_1!1279 (tuple2!2537 lt!66266 (zeroValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129295 () Bool)

(assert (=> b!129295 (= e!84368 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66346)))))))

(assert (= (and d!39395 c!23802) b!129295))

(assert (= (and d!39395 (not c!23802)) b!129296))

(assert (= (and b!129296 c!23803) b!129297))

(assert (= (and b!129296 (not c!23803)) b!129298))

(declare-fun m!152075 () Bool)

(assert (=> b!129297 m!152075))

(assert (=> b!128241 d!39395))

(declare-fun d!39397 () Bool)

(declare-fun res!62393 () Bool)

(declare-fun e!84370 () Bool)

(assert (=> d!39397 (=> res!62393 e!84370)))

(assert (=> d!39397 (= res!62393 (and ((_ is Cons!1678) (toList!835 lt!66270)) (= (_1!1279 (h!2281 (toList!835 lt!66270))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39397 (= (containsKey!172 (toList!835 lt!66270) #b1000000000000000000000000000000000000000000000000000000000000000) e!84370)))

(declare-fun b!129299 () Bool)

(declare-fun e!84371 () Bool)

(assert (=> b!129299 (= e!84370 e!84371)))

(declare-fun res!62394 () Bool)

(assert (=> b!129299 (=> (not res!62394) (not e!84371))))

(assert (=> b!129299 (= res!62394 (and (or (not ((_ is Cons!1678) (toList!835 lt!66270))) (bvsle (_1!1279 (h!2281 (toList!835 lt!66270))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!1678) (toList!835 lt!66270)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66270))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!129300 () Bool)

(assert (=> b!129300 (= e!84371 (containsKey!172 (t!6053 (toList!835 lt!66270)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!39397 (not res!62393)) b!129299))

(assert (= (and b!129299 res!62394) b!129300))

(declare-fun m!152077 () Bool)

(assert (=> b!129300 m!152077))

(assert (=> d!38885 d!39397))

(declare-fun d!39399 () Bool)

(declare-fun e!84373 () Bool)

(assert (=> d!39399 e!84373))

(declare-fun res!62395 () Bool)

(assert (=> d!39399 (=> res!62395 e!84373)))

(declare-fun lt!67082 () Bool)

(assert (=> d!39399 (= res!62395 (not lt!67082))))

(declare-fun lt!67085 () Bool)

(assert (=> d!39399 (= lt!67082 lt!67085)))

(declare-fun lt!67083 () Unit!3985)

(declare-fun e!84372 () Unit!3985)

(assert (=> d!39399 (= lt!67083 e!84372)))

(declare-fun c!23804 () Bool)

(assert (=> d!39399 (= c!23804 lt!67085)))

(assert (=> d!39399 (= lt!67085 (containsKey!172 (toList!835 lt!66328) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!39399 (= (contains!869 lt!66328 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!67082)))

(declare-fun b!129301 () Bool)

(declare-fun lt!67084 () Unit!3985)

(assert (=> b!129301 (= e!84372 lt!67084)))

(assert (=> b!129301 (= lt!67084 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66328) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!129301 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!129302 () Bool)

(declare-fun Unit!4039 () Unit!3985)

(assert (=> b!129302 (= e!84372 Unit!4039)))

(declare-fun b!129303 () Bool)

(assert (=> b!129303 (= e!84373 (isDefined!121 (getValueByKey!169 (toList!835 lt!66328) (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!39399 c!23804) b!129301))

(assert (= (and d!39399 (not c!23804)) b!129302))

(assert (= (and d!39399 (not res!62395)) b!129303))

(assert (=> d!39399 m!149899))

(declare-fun m!152079 () Bool)

(assert (=> d!39399 m!152079))

(assert (=> b!129301 m!149899))

(declare-fun m!152081 () Bool)

(assert (=> b!129301 m!152081))

(assert (=> b!129301 m!149899))

(assert (=> b!129301 m!151915))

(assert (=> b!129301 m!151915))

(declare-fun m!152083 () Bool)

(assert (=> b!129301 m!152083))

(assert (=> b!129303 m!149899))

(assert (=> b!129303 m!151915))

(assert (=> b!129303 m!151915))

(assert (=> b!129303 m!152083))

(assert (=> b!128229 d!39399))

(assert (=> b!128413 d!39059))

(declare-fun b!129307 () Bool)

(declare-fun e!84375 () Option!175)

(assert (=> b!129307 (= e!84375 None!173)))

(declare-fun b!129306 () Bool)

(assert (=> b!129306 (= e!84375 (getValueByKey!169 (t!6053 (toList!835 lt!66536)) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!23805 () Bool)

(declare-fun d!39401 () Bool)

(assert (=> d!39401 (= c!23805 (and ((_ is Cons!1678) (toList!835 lt!66536)) (= (_1!1279 (h!2281 (toList!835 lt!66536))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!84374 () Option!175)

(assert (=> d!39401 (= (getValueByKey!169 (toList!835 lt!66536) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) e!84374)))

(declare-fun b!129305 () Bool)

(assert (=> b!129305 (= e!84374 e!84375)))

(declare-fun c!23806 () Bool)

(assert (=> b!129305 (= c!23806 (and ((_ is Cons!1678) (toList!835 lt!66536)) (not (= (_1!1279 (h!2281 (toList!835 lt!66536))) (_1!1279 (tuple2!2537 (select (arr!2228 (_keys!4541 (v!3144 (underlying!443 thiss!992)))) from!355) (get!1462 (select (arr!2229 (_values!2787 (v!3144 (underlying!443 thiss!992)))) from!355) (dynLambda!419 (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!129304 () Bool)

(assert (=> b!129304 (= e!84374 (Some!174 (_2!1279 (h!2281 (toList!835 lt!66536)))))))

(assert (= (and d!39401 c!23805) b!129304))

(assert (= (and d!39401 (not c!23805)) b!129305))

(assert (= (and b!129305 c!23806) b!129306))

(assert (= (and b!129305 (not c!23806)) b!129307))

(declare-fun m!152085 () Bool)

(assert (=> b!129306 m!152085))

(assert (=> b!128446 d!39401))

(declare-fun d!39403 () Bool)

(declare-fun e!84377 () Bool)

(assert (=> d!39403 e!84377))

(declare-fun res!62396 () Bool)

(assert (=> d!39403 (=> res!62396 e!84377)))

(declare-fun lt!67086 () Bool)

(assert (=> d!39403 (= res!62396 (not lt!67086))))

(declare-fun lt!67089 () Bool)

(assert (=> d!39403 (= lt!67086 lt!67089)))

(declare-fun lt!67087 () Unit!3985)

(declare-fun e!84376 () Unit!3985)

(assert (=> d!39403 (= lt!67087 e!84376)))

(declare-fun c!23807 () Bool)

(assert (=> d!39403 (= c!23807 lt!67089)))

(assert (=> d!39403 (= lt!67089 (containsKey!172 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> d!39403 (= (contains!869 lt!66304 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67086)))

(declare-fun b!129308 () Bool)

(declare-fun lt!67088 () Unit!3985)

(assert (=> b!129308 (= e!84376 lt!67088)))

(assert (=> b!129308 (= lt!67088 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(assert (=> b!129308 (isDefined!121 (getValueByKey!169 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129309 () Bool)

(declare-fun Unit!4040 () Unit!3985)

(assert (=> b!129309 (= e!84376 Unit!4040)))

(declare-fun b!129310 () Bool)

(assert (=> b!129310 (= e!84377 (isDefined!121 (getValueByKey!169 (toList!835 lt!66304) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39403 c!23807) b!129308))

(assert (= (and d!39403 (not c!23807)) b!129309))

(assert (= (and d!39403 (not res!62396)) b!129310))

(declare-fun m!152087 () Bool)

(assert (=> d!39403 m!152087))

(declare-fun m!152089 () Bool)

(assert (=> b!129308 m!152089))

(assert (=> b!129308 m!150033))

(assert (=> b!129308 m!150033))

(declare-fun m!152091 () Bool)

(assert (=> b!129308 m!152091))

(assert (=> b!129310 m!150033))

(assert (=> b!129310 m!150033))

(assert (=> b!129310 m!152091))

(assert (=> d!38813 d!39403))

(declare-fun b!129314 () Bool)

(declare-fun e!84379 () Option!175)

(assert (=> b!129314 (= e!84379 None!173)))

(declare-fun b!129313 () Bool)

(assert (=> b!129313 (= e!84379 (getValueByKey!169 (t!6053 lt!66306) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun c!23808 () Bool)

(declare-fun d!39405 () Bool)

(assert (=> d!39405 (= c!23808 (and ((_ is Cons!1678) lt!66306) (= (_1!1279 (h!2281 lt!66306)) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun e!84378 () Option!175)

(assert (=> d!39405 (= (getValueByKey!169 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) e!84378)))

(declare-fun b!129312 () Bool)

(assert (=> b!129312 (= e!84378 e!84379)))

(declare-fun c!23809 () Bool)

(assert (=> b!129312 (= c!23809 (and ((_ is Cons!1678) lt!66306) (not (= (_1!1279 (h!2281 lt!66306)) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun b!129311 () Bool)

(assert (=> b!129311 (= e!84378 (Some!174 (_2!1279 (h!2281 lt!66306))))))

(assert (= (and d!39405 c!23808) b!129311))

(assert (= (and d!39405 (not c!23808)) b!129312))

(assert (= (and b!129312 c!23809) b!129313))

(assert (= (and b!129312 (not c!23809)) b!129314))

(declare-fun m!152093 () Bool)

(assert (=> b!129313 m!152093))

(assert (=> d!38813 d!39405))

(declare-fun d!39407 () Bool)

(assert (=> d!39407 (= (getValueByKey!169 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) (Some!174 (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun lt!67090 () Unit!3985)

(assert (=> d!39407 (= lt!67090 (choose!789 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun e!84380 () Bool)

(assert (=> d!39407 e!84380))

(declare-fun res!62397 () Bool)

(assert (=> d!39407 (=> (not res!62397) (not e!84380))))

(assert (=> d!39407 (= res!62397 (isStrictlySorted!305 lt!66306))))

(assert (=> d!39407 (= (lemmaContainsTupThenGetReturnValue!84 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67090)))

(declare-fun b!129315 () Bool)

(declare-fun res!62398 () Bool)

(assert (=> b!129315 (=> (not res!62398) (not e!84380))))

(assert (=> b!129315 (= res!62398 (containsKey!172 lt!66306 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129316 () Bool)

(assert (=> b!129316 (= e!84380 (contains!871 lt!66306 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (= (and d!39407 res!62397) b!129315))

(assert (= (and b!129315 res!62398) b!129316))

(assert (=> d!39407 m!150027))

(declare-fun m!152095 () Bool)

(assert (=> d!39407 m!152095))

(declare-fun m!152097 () Bool)

(assert (=> d!39407 m!152097))

(declare-fun m!152099 () Bool)

(assert (=> b!129315 m!152099))

(declare-fun m!152101 () Bool)

(assert (=> b!129316 m!152101))

(assert (=> d!38813 d!39407))

(declare-fun call!13989 () List!1682)

(declare-fun bm!13986 () Bool)

(declare-fun e!84381 () List!1682)

(declare-fun c!23811 () Bool)

(assert (=> bm!13986 (= call!13989 ($colon$colon!89 e!84381 (ite c!23811 (h!2281 (toList!835 lt!66267)) (tuple2!2537 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))))

(declare-fun c!23812 () Bool)

(assert (=> bm!13986 (= c!23812 c!23811)))

(declare-fun d!39409 () Bool)

(declare-fun e!84384 () Bool)

(assert (=> d!39409 e!84384))

(declare-fun res!62399 () Bool)

(assert (=> d!39409 (=> (not res!62399) (not e!84384))))

(declare-fun lt!67091 () List!1682)

(assert (=> d!39409 (= res!62399 (isStrictlySorted!305 lt!67091))))

(declare-fun e!84385 () List!1682)

(assert (=> d!39409 (= lt!67091 e!84385)))

(assert (=> d!39409 (= c!23811 (and ((_ is Cons!1678) (toList!835 lt!66267)) (bvslt (_1!1279 (h!2281 (toList!835 lt!66267))) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> d!39409 (isStrictlySorted!305 (toList!835 lt!66267))))

(assert (=> d!39409 (= (insertStrictlySorted!87 (toList!835 lt!66267) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!67091)))

(declare-fun b!129317 () Bool)

(assert (=> b!129317 (= e!84381 (insertStrictlySorted!87 (t!6053 (toList!835 lt!66267)) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun b!129318 () Bool)

(assert (=> b!129318 (= e!84385 call!13989)))

(declare-fun b!129319 () Bool)

(declare-fun e!84382 () List!1682)

(assert (=> b!129319 (= e!84385 e!84382)))

(declare-fun c!23813 () Bool)

(assert (=> b!129319 (= c!23813 (and ((_ is Cons!1678) (toList!835 lt!66267)) (= (_1!1279 (h!2281 (toList!835 lt!66267))) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129320 () Bool)

(declare-fun e!84383 () List!1682)

(declare-fun call!13991 () List!1682)

(assert (=> b!129320 (= e!84383 call!13991)))

(declare-fun bm!13987 () Bool)

(declare-fun call!13990 () List!1682)

(assert (=> bm!13987 (= call!13991 call!13990)))

(declare-fun c!23810 () Bool)

(declare-fun b!129321 () Bool)

(assert (=> b!129321 (= e!84381 (ite c!23813 (t!6053 (toList!835 lt!66267)) (ite c!23810 (Cons!1678 (h!2281 (toList!835 lt!66267)) (t!6053 (toList!835 lt!66267))) Nil!1679)))))

(declare-fun b!129322 () Bool)

(assert (=> b!129322 (= e!84383 call!13991)))

(declare-fun b!129323 () Bool)

(assert (=> b!129323 (= e!84384 (contains!871 lt!67091 (tuple2!2537 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))) (_2!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(declare-fun b!129324 () Bool)

(assert (=> b!129324 (= c!23810 (and ((_ is Cons!1678) (toList!835 lt!66267)) (bvsgt (_1!1279 (h!2281 (toList!835 lt!66267))) (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))

(assert (=> b!129324 (= e!84382 e!84383)))

(declare-fun b!129325 () Bool)

(declare-fun res!62400 () Bool)

(assert (=> b!129325 (=> (not res!62400) (not e!84384))))

(assert (=> b!129325 (= res!62400 (containsKey!172 lt!67091 (_1!1279 (tuple2!2537 lt!66261 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))))

(declare-fun bm!13988 () Bool)

(assert (=> bm!13988 (= call!13990 call!13989)))

(declare-fun b!129326 () Bool)

(assert (=> b!129326 (= e!84382 call!13990)))

(assert (= (and d!39409 c!23811) b!129318))

(assert (= (and d!39409 (not c!23811)) b!129319))

(assert (= (and b!129319 c!23813) b!129326))

(assert (= (and b!129319 (not c!23813)) b!129324))

(assert (= (and b!129324 c!23810) b!129322))

(assert (= (and b!129324 (not c!23810)) b!129320))

(assert (= (or b!129322 b!129320) bm!13987))

(assert (= (or b!129326 bm!13987) bm!13988))

(assert (= (or b!129318 bm!13988) bm!13986))

(assert (= (and bm!13986 c!23812) b!129317))

(assert (= (and bm!13986 (not c!23812)) b!129321))

(assert (= (and d!39409 res!62399) b!129325))

(assert (= (and b!129325 res!62400) b!129323))

(declare-fun m!152103 () Bool)

(assert (=> b!129325 m!152103))

(declare-fun m!152105 () Bool)

(assert (=> b!129317 m!152105))

(declare-fun m!152107 () Bool)

(assert (=> d!39409 m!152107))

(declare-fun m!152109 () Bool)

(assert (=> d!39409 m!152109))

(declare-fun m!152111 () Bool)

(assert (=> bm!13986 m!152111))

(declare-fun m!152113 () Bool)

(assert (=> b!129323 m!152113))

(assert (=> d!38813 d!39409))

(declare-fun d!39411 () Bool)

(assert (=> d!39411 (= (get!1466 (getValueByKey!169 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66263)) (v!3150 (getValueByKey!169 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66263)))))

(assert (=> d!38835 d!39411))

(declare-fun b!129330 () Bool)

(declare-fun e!84387 () Option!175)

(assert (=> b!129330 (= e!84387 None!173)))

(declare-fun b!129329 () Bool)

(assert (=> b!129329 (= e!84387 (getValueByKey!169 (t!6053 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) lt!66263))))

(declare-fun c!23814 () Bool)

(declare-fun d!39413 () Bool)

(assert (=> d!39413 (= c!23814 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66263)))))

(declare-fun e!84386 () Option!175)

(assert (=> d!39413 (= (getValueByKey!169 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))) lt!66263) e!84386)))

(declare-fun b!129328 () Bool)

(assert (=> b!129328 (= e!84386 e!84387)))

(declare-fun c!23815 () Bool)

(assert (=> b!129328 (= c!23815 (and ((_ is Cons!1678) (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))) (not (= (_1!1279 (h!2281 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992)))))))) lt!66263))))))

(declare-fun b!129327 () Bool)

(assert (=> b!129327 (= e!84386 (Some!174 (_2!1279 (h!2281 (toList!835 (+!165 lt!66268 (tuple2!2537 lt!66254 (minValue!2665 (v!3144 (underlying!443 thiss!992))))))))))))

(assert (= (and d!39413 c!23814) b!129327))

(assert (= (and d!39413 (not c!23814)) b!129328))

(assert (= (and b!129328 c!23815) b!129329))

(assert (= (and b!129328 (not c!23815)) b!129330))

(declare-fun m!152115 () Bool)

(assert (=> b!129329 m!152115))

(assert (=> d!38835 d!39413))

(declare-fun d!39415 () Bool)

(declare-fun e!84389 () Bool)

(assert (=> d!39415 e!84389))

(declare-fun res!62401 () Bool)

(assert (=> d!39415 (=> res!62401 e!84389)))

(declare-fun lt!67092 () Bool)

(assert (=> d!39415 (= res!62401 (not lt!67092))))

(declare-fun lt!67095 () Bool)

(assert (=> d!39415 (= lt!67092 lt!67095)))

(declare-fun lt!67093 () Unit!3985)

(declare-fun e!84388 () Unit!3985)

(assert (=> d!39415 (= lt!67093 e!84388)))

(declare-fun c!23816 () Bool)

(assert (=> d!39415 (= c!23816 lt!67095)))

(assert (=> d!39415 (= lt!67095 (containsKey!172 (toList!835 lt!66561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!39415 (= (contains!869 lt!66561 #b1000000000000000000000000000000000000000000000000000000000000000) lt!67092)))

(declare-fun b!129331 () Bool)

(declare-fun lt!67094 () Unit!3985)

(assert (=> b!129331 (= e!84388 lt!67094)))

(assert (=> b!129331 (= lt!67094 (lemmaContainsKeyImpliesGetValueByKeyDefined!120 (toList!835 lt!66561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!129331 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!129332 () Bool)

(declare-fun Unit!4041 () Unit!3985)

(assert (=> b!129332 (= e!84388 Unit!4041)))

(declare-fun b!129333 () Bool)

(assert (=> b!129333 (= e!84389 (isDefined!121 (getValueByKey!169 (toList!835 lt!66561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!39415 c!23816) b!129331))

(assert (= (and d!39415 (not c!23816)) b!129332))

(assert (= (and d!39415 (not res!62401)) b!129333))

(declare-fun m!152117 () Bool)

(assert (=> d!39415 m!152117))

(declare-fun m!152119 () Bool)

(assert (=> b!129331 m!152119))

(assert (=> b!129331 m!151793))

(assert (=> b!129331 m!151793))

(declare-fun m!152121 () Bool)

(assert (=> b!129331 m!152121))

(assert (=> b!129333 m!151793))

(assert (=> b!129333 m!151793))

(assert (=> b!129333 m!152121))

(assert (=> bm!13877 d!39415))

(assert (=> b!128159 d!39059))

(declare-fun d!39417 () Bool)

(assert (=> d!39417 (= (get!1466 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3150 (getValueByKey!169 (toList!835 lt!66270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38893 d!39417))

(assert (=> d!38893 d!39063))

(declare-fun mapNonEmpty!4557 () Bool)

(declare-fun mapRes!4557 () Bool)

(declare-fun tp!11055 () Bool)

(declare-fun e!84391 () Bool)

(assert (=> mapNonEmpty!4557 (= mapRes!4557 (and tp!11055 e!84391))))

(declare-fun mapKey!4557 () (_ BitVec 32))

(declare-fun mapValue!4557 () ValueCell!1082)

(declare-fun mapRest!4557 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4557 (= mapRest!4555 (store mapRest!4557 mapKey!4557 mapValue!4557))))

(declare-fun b!129334 () Bool)

(assert (=> b!129334 (= e!84391 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4557 () Bool)

(assert (=> mapIsEmpty!4557 mapRes!4557))

(declare-fun condMapEmpty!4557 () Bool)

(declare-fun mapDefault!4557 () ValueCell!1082)

(assert (=> mapNonEmpty!4555 (= condMapEmpty!4557 (= mapRest!4555 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4557)))))

(declare-fun e!84390 () Bool)

(assert (=> mapNonEmpty!4555 (= tp!11053 (and e!84390 mapRes!4557))))

(declare-fun b!129335 () Bool)

(assert (=> b!129335 (= e!84390 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4555 condMapEmpty!4557) mapIsEmpty!4557))

(assert (= (and mapNonEmpty!4555 (not condMapEmpty!4557)) mapNonEmpty!4557))

(assert (= (and mapNonEmpty!4557 ((_ is ValueCellFull!1082) mapValue!4557)) b!129334))

(assert (= (and mapNonEmpty!4555 ((_ is ValueCellFull!1082) mapDefault!4557)) b!129335))

(declare-fun m!152123 () Bool)

(assert (=> mapNonEmpty!4557 m!152123))

(declare-fun mapNonEmpty!4558 () Bool)

(declare-fun mapRes!4558 () Bool)

(declare-fun tp!11056 () Bool)

(declare-fun e!84393 () Bool)

(assert (=> mapNonEmpty!4558 (= mapRes!4558 (and tp!11056 e!84393))))

(declare-fun mapValue!4558 () ValueCell!1082)

(declare-fun mapKey!4558 () (_ BitVec 32))

(declare-fun mapRest!4558 () (Array (_ BitVec 32) ValueCell!1082))

(assert (=> mapNonEmpty!4558 (= mapRest!4556 (store mapRest!4558 mapKey!4558 mapValue!4558))))

(declare-fun b!129336 () Bool)

(assert (=> b!129336 (= e!84393 tp_is_empty!2851)))

(declare-fun mapIsEmpty!4558 () Bool)

(assert (=> mapIsEmpty!4558 mapRes!4558))

(declare-fun condMapEmpty!4558 () Bool)

(declare-fun mapDefault!4558 () ValueCell!1082)

(assert (=> mapNonEmpty!4556 (= condMapEmpty!4558 (= mapRest!4556 ((as const (Array (_ BitVec 32) ValueCell!1082)) mapDefault!4558)))))

(declare-fun e!84392 () Bool)

(assert (=> mapNonEmpty!4556 (= tp!11054 (and e!84392 mapRes!4558))))

(declare-fun b!129337 () Bool)

(assert (=> b!129337 (= e!84392 tp_is_empty!2851)))

(assert (= (and mapNonEmpty!4556 condMapEmpty!4558) mapIsEmpty!4558))

(assert (= (and mapNonEmpty!4556 (not condMapEmpty!4558)) mapNonEmpty!4558))

(assert (= (and mapNonEmpty!4558 ((_ is ValueCellFull!1082) mapValue!4558)) b!129336))

(assert (= (and mapNonEmpty!4556 ((_ is ValueCellFull!1082) mapDefault!4558)) b!129337))

(declare-fun m!152125 () Bool)

(assert (=> mapNonEmpty!4558 m!152125))

(declare-fun b_lambda!5723 () Bool)

(assert (= b_lambda!5703 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5723)))

(declare-fun b_lambda!5725 () Bool)

(assert (= b_lambda!5697 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5725)))

(declare-fun b_lambda!5727 () Bool)

(assert (= b_lambda!5707 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5727)))

(declare-fun b_lambda!5729 () Bool)

(assert (= b_lambda!5695 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5729)))

(declare-fun b_lambda!5731 () Bool)

(assert (= b_lambda!5715 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5731)))

(declare-fun b_lambda!5733 () Bool)

(assert (= b_lambda!5699 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5733)))

(declare-fun b_lambda!5735 () Bool)

(assert (= b_lambda!5705 (or (and b!127810 b_free!2869) (and b!127825 b_free!2871 (= (defaultEntry!2804 newMap!16) (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))))) b_lambda!5735)))

(declare-fun b_lambda!5737 () Bool)

(assert (= b_lambda!5713 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5737)))

(declare-fun b_lambda!5739 () Bool)

(assert (= b_lambda!5717 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5739)))

(declare-fun b_lambda!5741 () Bool)

(assert (= b_lambda!5701 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5741)))

(declare-fun b_lambda!5743 () Bool)

(assert (= b_lambda!5711 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5743)))

(declare-fun b_lambda!5745 () Bool)

(assert (= b_lambda!5709 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5745)))

(declare-fun b_lambda!5747 () Bool)

(assert (= b_lambda!5693 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5747)))

(declare-fun b_lambda!5749 () Bool)

(assert (= b_lambda!5721 (or (and b!127810 b_free!2869 (= (defaultEntry!2804 (v!3144 (underlying!443 thiss!992))) (defaultEntry!2804 newMap!16))) (and b!127825 b_free!2871) b_lambda!5749)))

(check-sat (not b!128530) (not b!128628) (not b!128506) (not b!129255) (not b!128587) (not b!128930) (not d!39313) (not bm!13928) (not b!129093) (not d!39135) (not d!39013) (not d!39247) (not b!128723) (not mapNonEmpty!4557) (not d!39159) (not b!129049) (not b!129039) (not b!128641) (not b!128725) (not b!129053) (not b!129230) (not b!128545) (not b!129329) (not b!129199) (not b!129052) (not b!129017) (not b!129082) (not d!39201) (not b!128803) (not b!129201) (not b!129289) (not b!128918) (not b!129333) (not d!39323) (not b!129275) (not d!39387) (not d!39107) (not d!39375) (not b!128974) (not d!39041) (not b!129224) (not d!39211) (not b!129008) (not b!128615) (not d!38941) (not d!39035) (not b!128712) (not b!128622) (not b!128747) (not b!128581) (not b!128859) (not b!128661) (not b!129091) (not b!129110) (not b!129209) (not b!129325) (not b!128670) (not b!129120) (not b!129331) (not b!128702) (not b!128741) (not b!128680) (not b!129019) (not b!128997) (not b!129262) (not b!128817) (not d!38975) (not d!38985) (not d!39253) (not b!129179) (not b!129313) (not bm!13960) (not b!128669) (not b!128662) (not d!39077) (not d!39415) (not b_lambda!5729) (not b!128749) (not b!129023) (not d!39039) (not d!39025) (not b!129316) (not b!129162) (not b!129214) (not d!39317) (not bm!13977) (not b!128967) (not d!38917) (not d!38935) (not b!129203) (not b!128642) (not b!128861) (not b!129268) (not b!128690) (not d!39169) (not b_lambda!5727) (not b!128561) (not d!39075) (not bm!13955) (not d!39205) (not b!128976) (not d!39007) (not d!38983) (not d!38943) (not b_lambda!5683) (not d!39015) (not b!128552) (not bm!13902) (not d!38973) (not b!129094) (not d!39071) (not b!128634) (not b!128659) (not d!39285) (not d!39031) (not b!128965) (not bm!13961) (not b!128609) (not d!39217) (not b!129106) (not d!38987) (not b!128858) (not b!128569) (not b!129027) (not d!39215) (not b!129171) b_and!7993 (not d!39227) (not b!128754) (not b!129231) (not d!39309) (not bm!13907) (not b_lambda!5725) (not b!129254) (not b!128797) (not b!129243) (not bm!13932) (not b!128691) (not b!128901) (not bm!13920) (not b!128780) (not b!128715) (not b!129096) (not b!129246) (not b!128981) (not d!39081) (not b!128818) (not b!128648) (not d!39179) (not b!128869) (not d!39243) (not d!39353) (not b!128910) (not b!128651) (not b!128793) (not b!128689) (not d!39289) (not bm!13945) (not b!129317) (not b!128991) (not b!129204) (not d!39003) (not b!129208) (not b!128984) (not b!128515) (not b!129148) (not b!128683) (not b!129206) (not b!128624) (not d!39199) (not b!129249) (not d!38963) (not d!39303) (not b!128739) (not b!128652) (not b!128835) (not d!39097) (not b_lambda!5719) (not b!128623) (not d!39193) (not b!129315) (not b!128985) (not b!128574) (not bm!13929) (not b!128633) (not b!128783) (not b!129271) (not d!39383) (not d!39165) (not b!129038) (not b!129087) (not b!129035) (not b!128826) (not b!129098) (not b!129016) (not b!129101) (not b_lambda!5687) (not b!128855) (not b!128836) (not d!38979) (not b!129159) (not b!128675) (not d!39311) (not b!128534) (not b!128838) (not b_lambda!5737) (not bm!13927) (not b_lambda!5739) (not b!129036) (not bm!13924) (not d!39023) (not d!39223) (not d!39355) (not d!39061) (not bm!13986) (not b!128578) (not b!128911) (not b!129152) (not b!129007) (not d!39189) (not b!128914) (not b!129042) (not b!128846) (not b!128791) (not d!38945) (not b!128892) (not d!39207) (not bm!13971) (not b!128750) (not b!128815) (not b!129217) (not d!38951) (not b!128798) (not b!129103) (not b!128713) (not b!128503) (not bm!13976) (not b!128657) (not d!39235) (not d!38993) (not b!128926) (not b!128829) (not d!39279) (not b!129026) (not b!128820) (not b!128999) (not b!128889) (not d!39029) (not b!128968) (not b!129301) (not d!39409) (not b!128631) (not d!39271) (not d!39073) (not b!129009) (not bm!13939) (not d!38919) (not b!128917) (not b!128632) (not d!39141) (not d!39345) (not b!128716) (not b!128678) (not b!129066) (not b!128840) (not d!38995) (not mapNonEmpty!4558) (not b!129078) (not d!38989) tp_is_empty!2851 (not b!129303) (not d!38939) (not d!39093) (not b_lambda!5689) (not bm!13893) (not b_lambda!5741) (not b!128559) (not d!39119) (not d!39089) (not bm!13934) (not b!128668) (not d!39265) (not b!128923) (not b!128517) (not b!129015) (not d!39157) (not d!39095) (not bm!13958) (not b!128718) (not b!129109) (not b_lambda!5745) (not b!128752) (not b!128795) (not b!128532) (not d!39009) (not b_lambda!5733) (not d!39085) (not bm!13916) (not b!128753) (not b!129173) (not b_lambda!5749) (not b!128658) (not b!128663) (not b!129300) (not d!39369) (not b!129176) (not b!128972) (not b!129310) (not b!128684) (not b!128635) (not d!39055) (not b!128757) (not bm!13906) (not b!129247) (not b!128719) (not b!129181) (not b!129221) (not b!128644) (not b!129216) (not d!39017) (not d!38997) (not b!128993) (not b!128903) (not b!128660) (not d!39341) (not b!128709) (not b!128694) (not b!128867) (not b!128507) (not b!128995) (not b!128512) (not bm!13925) (not d!39079) (not b!128775) (not d!39213) (not d!39001) (not b!128576) (not b!129051) (not b!128721) (not b!128807) (not d!39111) (not b!129033) (not b!128538) (not b!128842) (not d!39325) (not b!128735) (not b_lambda!5747) (not b_lambda!5671) (not d!39121) (not d!39151) (not b!128671) (not d!39225) (not d!39357) (not bm!13935) (not b!129273) (not d!39275) (not d!39403) (not b!128971) (not bm!13930) (not b!129200) (not b!128501) (not d!39337) b_and!7995 (not d!39315) (not d!39321) (not b!128824) (not b!128557) (not d!39283) (not b_next!2871) (not d!38923) (not b!128527) (not d!39037) (not d!39183) (not d!39381) (not b_lambda!5731) (not d!39365) (not b!128928) (not bm!13891) (not d!39301) (not d!39281) (not b!128626) (not bm!13908) (not b!129281) (not bm!13941) (not b!129156) (not b!128566) (not d!39269) (not b!128681) (not d!38961) (not d!38999) (not d!38977) (not bm!13968) (not d!39027) (not b!128625) (not b!128571) (not b!129293) (not b_lambda!5685) (not b!128878) (not b!128813) (not b!129174) (not b_lambda!5723) (not bm!13911) (not d!39257) (not b!128728) (not b!128549) (not b!128805) (not b!129252) (not b!129100) (not b!129306) (not d!39139) (not d!39123) (not d!39327) (not d!39239) (not d!39115) (not b!128898) (not b!129212) (not bm!13949) (not b!129069) (not d!39299) (not b!129160) (not b!129044) (not b!129046) (not b!129108) (not b!129158) (not b!128500) (not b_next!2869) (not bm!13957) (not d!39125) (not b!128525) (not b!129070) (not b!128905) (not d!39181) (not b!128912) (not b!129177) (not b!128779) (not b!129323) (not b!129182) (not b!129285) (not b!129195) (not d!39295) (not b!128786) (not d!39129) (not b!128536) (not bm!13944) (not b!129274) (not d!39331) (not bm!13922) (not d!38971) (not d!39167) (not d!38931) (not d!39133) (not bm!13979) (not b!129308) (not b!128778) (not b!128899) (not d!39145) (not b!129235) (not d!39377) (not b!128655) (not b!128806) (not b!129283) (not b!128513) (not d!39105) (not d!39203) (not b!129006) (not b!129266) (not b!128998) (not d!39407) (not b!128673) (not d!38991) (not b_lambda!5735) (not b!128969) (not d!39249) (not b!129001) (not b!128564) (not d!39021) (not b!128893) (not d!39197) (not d!39399) (not d!39185) (not b!129061) (not b!128682) (not bm!13974) (not b!128547) (not b!128643) (not d!38959) (not b!128627) (not b!128722) (not bm!13942) (not d!39175) (not d!39319) (not d!39219) (not d!39143) (not b_lambda!5691) (not b!128640) (not d!38929) (not b!129076) (not d!39043) (not bm!13950) (not d!39047) (not bm!13914) (not d!39263) (not b!128617) (not d!39083) (not bm!13909) (not d!39033) (not b!128909) (not bm!13972) (not b!129225) (not d!39277) (not b!129175) (not b!128588) (not b!128656) (not d!39103) (not bm!13888) (not d!39155) (not b!129122) (not b!129040) (not b!128649) (not b!128781) (not b_lambda!5743) (not bm!13951) (not b!129010) (not d!39005) (not b!129088) (not b!129075) (not b!129116) (not d!38967) (not d!39049) (not b!129059) (not d!39171) (not bm!13895) (not b!128737) (not b!128650) (not b!128873) (not d!39173) (not b!129003) (not d!39221) (not b!128863) (not d!39065) (not b!129297) (not bm!13937) (not bm!13946) (not bm!13980) (not b!128953) (not b!129219) (not d!39231) (not b!129286) (not b!129020) (not b!129197) (not d!39113) (not b!129233) (not b!129188) (not b!129153) (not b!128887) (not bm!13913) (not b!129031) (not b!128710) (not b!129004) (not b!128983) (not d!39019) (not b!128856) (not b!129256) (not bm!13905) (not bm!13969) (not b!129149) (not b!129237) (not b!129080) (not bm!13983) (not b!128568) (not b!129118) (not bm!13917) (not b_lambda!5667) (not b!128519) (not b!128883) (not b!128729) (not b!129264) (not b!128978) (not bm!13894) (not b!128924) (not b!129002) (not bm!13890) (not b!129193) (not d!39373) (not b!128734) (not b!128676) (not d!39209) (not b!129163) (not d!39051) (not b!128630) (not d!39195) (not b!129064) (not b!128698) (not b!128866) (not d!39297) (not b!129166) (not d!39147) (not b!128830) (not b!129180) (not b!128800) (not b!128966) (not b!128535) (not bm!13970) (not d!38981))
(check-sat b_and!7993 b_and!7995 (not b_next!2869) (not b_next!2871))
