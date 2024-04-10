; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8356 () Bool)

(assert start!8356)

(declare-fun b!55764 () Bool)

(declare-fun b_free!1877 () Bool)

(declare-fun b_next!1877 () Bool)

(assert (=> b!55764 (= b_free!1877 (not b_next!1877))))

(declare-fun tp!7732 () Bool)

(declare-fun b_and!3295 () Bool)

(assert (=> b!55764 (= tp!7732 b_and!3295)))

(declare-fun b!55775 () Bool)

(declare-fun b_free!1879 () Bool)

(declare-fun b_next!1879 () Bool)

(assert (=> b!55775 (= b_free!1879 (not b_next!1879))))

(declare-fun tp!7734 () Bool)

(declare-fun b_and!3297 () Bool)

(assert (=> b!55775 (= tp!7734 b_and!3297)))

(declare-fun b!55760 () Bool)

(declare-fun e!36671 () Bool)

(declare-fun tp_is_empty!2355 () Bool)

(assert (=> b!55760 (= e!36671 tp_is_empty!2355)))

(declare-fun res!31390 () Bool)

(declare-fun e!36665 () Bool)

(assert (=> start!8356 (=> (not res!31390) (not e!36665))))

(declare-datatypes ((V!2787 0))(
  ( (V!2788 (val!1222 Int)) )
))
(declare-datatypes ((array!3633 0))(
  ( (array!3634 (arr!1739 (Array (_ BitVec 32) (_ BitVec 64))) (size!1968 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!834 0))(
  ( (ValueCellFull!834 (v!2330 V!2787)) (EmptyCell!834) )
))
(declare-datatypes ((array!3635 0))(
  ( (array!3636 (arr!1740 (Array (_ BitVec 32) ValueCell!834)) (size!1969 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!576 0))(
  ( (LongMapFixedSize!577 (defaultEntry!2002 Int) (mask!5863 (_ BitVec 32)) (extraKeys!1893 (_ BitVec 32)) (zeroValue!1920 V!2787) (minValue!1920 V!2787) (_size!337 (_ BitVec 32)) (_keys!3622 array!3633) (_values!1985 array!3635) (_vacant!337 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!392 0))(
  ( (Cell!393 (v!2331 LongMapFixedSize!576)) )
))
(declare-datatypes ((LongMap!392 0))(
  ( (LongMap!393 (underlying!207 Cell!392)) )
))
(declare-fun thiss!992 () LongMap!392)

(declare-fun valid!230 (LongMap!392) Bool)

(assert (=> start!8356 (= res!31390 (valid!230 thiss!992))))

(assert (=> start!8356 e!36665))

(declare-fun e!36660 () Bool)

(assert (=> start!8356 e!36660))

(assert (=> start!8356 true))

(declare-fun e!36659 () Bool)

(assert (=> start!8356 e!36659))

(declare-fun b!55761 () Bool)

(declare-fun e!36668 () Bool)

(declare-fun e!36666 () Bool)

(declare-fun mapRes!2736 () Bool)

(assert (=> b!55761 (= e!36668 (and e!36666 mapRes!2736))))

(declare-fun condMapEmpty!2736 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!576)

(declare-fun mapDefault!2736 () ValueCell!834)

(assert (=> b!55761 (= condMapEmpty!2736 (= (arr!1740 (_values!1985 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!834)) mapDefault!2736)))))

(declare-fun b!55762 () Bool)

(declare-fun e!36661 () Bool)

(assert (=> b!55762 (= e!36661 tp_is_empty!2355)))

(declare-fun mapNonEmpty!2735 () Bool)

(declare-fun mapRes!2735 () Bool)

(declare-fun tp!7733 () Bool)

(assert (=> mapNonEmpty!2735 (= mapRes!2735 (and tp!7733 e!36671))))

(declare-fun mapRest!2735 () (Array (_ BitVec 32) ValueCell!834))

(declare-fun mapValue!2736 () ValueCell!834)

(declare-fun mapKey!2735 () (_ BitVec 32))

(assert (=> mapNonEmpty!2735 (= (arr!1740 (_values!1985 (v!2331 (underlying!207 thiss!992)))) (store mapRest!2735 mapKey!2735 mapValue!2736))))

(declare-fun b!55763 () Bool)

(declare-fun e!36667 () Bool)

(declare-fun e!36658 () Bool)

(assert (=> b!55763 (= e!36667 (not e!36658))))

(declare-fun res!31393 () Bool)

(assert (=> b!55763 (=> res!31393 e!36658)))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!55763 (= res!31393 (or (bvsge (size!1968 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!1968 (_keys!3622 (v!2331 (underlying!207 thiss!992)))))))))

(declare-datatypes ((List!1400 0))(
  ( (Nil!1397) (Cons!1396 (h!1976 (_ BitVec 64)) (t!4646 List!1400)) )
))
(declare-fun lt!22044 () List!1400)

(assert (=> b!55763 (= lt!22044 (Cons!1396 (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) Nil!1397))))

(declare-fun arrayNoDuplicates!0 (array!3633 (_ BitVec 32) List!1400) Bool)

(assert (=> b!55763 (arrayNoDuplicates!0 (_keys!3622 (v!2331 (underlying!207 thiss!992))) from!355 Nil!1397)))

(declare-datatypes ((Unit!1459 0))(
  ( (Unit!1460) )
))
(declare-fun lt!22045 () Unit!1459)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3633 (_ BitVec 32) (_ BitVec 32)) Unit!1459)

(assert (=> b!55763 (= lt!22045 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3622 (v!2331 (underlying!207 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-fun arrayContainsKey!0 (array!3633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!55763 (arrayContainsKey!0 (_keys!3622 (v!2331 (underlying!207 thiss!992))) (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!22042 () Unit!1459)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!19 (array!3633 array!3635 (_ BitVec 32) (_ BitVec 32) V!2787 V!2787 (_ BitVec 64) (_ BitVec 32) Int) Unit!1459)

(assert (=> b!55763 (= lt!22042 (lemmaListMapContainsThenArrayContainsFrom!19 (_keys!3622 (v!2331 (underlying!207 thiss!992))) (_values!1985 (v!2331 (underlying!207 thiss!992))) (mask!5863 (v!2331 (underlying!207 thiss!992))) (extraKeys!1893 (v!2331 (underlying!207 thiss!992))) (zeroValue!1920 (v!2331 (underlying!207 thiss!992))) (minValue!1920 (v!2331 (underlying!207 thiss!992))) (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2002 (v!2331 (underlying!207 thiss!992)))))))

(declare-fun e!36656 () Bool)

(declare-fun e!36664 () Bool)

(declare-fun array_inv!1075 (array!3633) Bool)

(declare-fun array_inv!1076 (array!3635) Bool)

(assert (=> b!55764 (= e!36664 (and tp!7732 tp_is_empty!2355 (array_inv!1075 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) (array_inv!1076 (_values!1985 (v!2331 (underlying!207 thiss!992)))) e!36656))))

(declare-fun b!55765 () Bool)

(declare-fun e!36663 () Bool)

(assert (=> b!55765 (= e!36663 tp_is_empty!2355)))

(declare-fun b!55766 () Bool)

(declare-fun res!31394 () Bool)

(assert (=> b!55766 (=> (not res!31394) (not e!36665))))

(declare-fun valid!231 (LongMapFixedSize!576) Bool)

(assert (=> b!55766 (= res!31394 (valid!231 newMap!16))))

(declare-fun b!55767 () Bool)

(declare-fun e!36670 () Bool)

(assert (=> b!55767 (= e!36670 e!36664)))

(declare-fun b!55768 () Bool)

(declare-fun e!36662 () Bool)

(assert (=> b!55768 (= e!36665 e!36662)))

(declare-fun res!31396 () Bool)

(assert (=> b!55768 (=> (not res!31396) (not e!36662))))

(declare-datatypes ((tuple2!1974 0))(
  ( (tuple2!1975 (_1!998 (_ BitVec 64)) (_2!998 V!2787)) )
))
(declare-datatypes ((List!1401 0))(
  ( (Nil!1398) (Cons!1397 (h!1977 tuple2!1974) (t!4647 List!1401)) )
))
(declare-datatypes ((ListLongMap!1335 0))(
  ( (ListLongMap!1336 (toList!683 List!1401)) )
))
(declare-fun lt!22043 () ListLongMap!1335)

(declare-fun lt!22047 () ListLongMap!1335)

(assert (=> b!55768 (= res!31396 (and (= lt!22043 lt!22047) (not (= (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1079 (LongMapFixedSize!576) ListLongMap!1335)

(assert (=> b!55768 (= lt!22047 (map!1079 newMap!16))))

(declare-fun getCurrentListMap!390 (array!3633 array!3635 (_ BitVec 32) (_ BitVec 32) V!2787 V!2787 (_ BitVec 32) Int) ListLongMap!1335)

(assert (=> b!55768 (= lt!22043 (getCurrentListMap!390 (_keys!3622 (v!2331 (underlying!207 thiss!992))) (_values!1985 (v!2331 (underlying!207 thiss!992))) (mask!5863 (v!2331 (underlying!207 thiss!992))) (extraKeys!1893 (v!2331 (underlying!207 thiss!992))) (zeroValue!1920 (v!2331 (underlying!207 thiss!992))) (minValue!1920 (v!2331 (underlying!207 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2002 (v!2331 (underlying!207 thiss!992)))))))

(declare-fun mapNonEmpty!2736 () Bool)

(declare-fun tp!7731 () Bool)

(assert (=> mapNonEmpty!2736 (= mapRes!2736 (and tp!7731 e!36661))))

(declare-fun mapKey!2736 () (_ BitVec 32))

(declare-fun mapRest!2736 () (Array (_ BitVec 32) ValueCell!834))

(declare-fun mapValue!2735 () ValueCell!834)

(assert (=> mapNonEmpty!2736 (= (arr!1740 (_values!1985 newMap!16)) (store mapRest!2736 mapKey!2736 mapValue!2735))))

(declare-fun b!55769 () Bool)

(declare-fun res!31387 () Bool)

(assert (=> b!55769 (=> res!31387 e!36658)))

(declare-fun noDuplicate!44 (List!1400) Bool)

(assert (=> b!55769 (= res!31387 (not (noDuplicate!44 lt!22044)))))

(declare-fun b!55770 () Bool)

(assert (=> b!55770 (= e!36656 (and e!36663 mapRes!2735))))

(declare-fun condMapEmpty!2735 () Bool)

(declare-fun mapDefault!2735 () ValueCell!834)

(assert (=> b!55770 (= condMapEmpty!2735 (= (arr!1740 (_values!1985 (v!2331 (underlying!207 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!834)) mapDefault!2735)))))

(declare-fun b!55771 () Bool)

(declare-fun res!31389 () Bool)

(assert (=> b!55771 (=> res!31389 e!36658)))

(declare-fun contains!660 (List!1400 (_ BitVec 64)) Bool)

(assert (=> b!55771 (= res!31389 (contains!660 lt!22044 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!55772 () Bool)

(assert (=> b!55772 (= e!36658 true)))

(declare-fun lt!22041 () Bool)

(assert (=> b!55772 (= lt!22041 (contains!660 lt!22044 (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355)))))

(declare-fun b!55773 () Bool)

(assert (=> b!55773 (= e!36666 tp_is_empty!2355)))

(declare-fun b!55774 () Bool)

(declare-fun res!31397 () Bool)

(assert (=> b!55774 (=> res!31397 e!36658)))

(assert (=> b!55774 (= res!31397 (contains!660 lt!22044 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!55775 (= e!36659 (and tp!7734 tp_is_empty!2355 (array_inv!1075 (_keys!3622 newMap!16)) (array_inv!1076 (_values!1985 newMap!16)) e!36668))))

(declare-fun b!55776 () Bool)

(assert (=> b!55776 (= e!36662 e!36667)))

(declare-fun res!31392 () Bool)

(assert (=> b!55776 (=> (not res!31392) (not e!36667))))

(declare-fun contains!661 (ListLongMap!1335 (_ BitVec 64)) Bool)

(assert (=> b!55776 (= res!31392 (contains!661 lt!22047 (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1976 0))(
  ( (tuple2!1977 (_1!999 Bool) (_2!999 LongMapFixedSize!576)) )
))
(declare-fun lt!22046 () tuple2!1976)

(declare-fun update!64 (LongMapFixedSize!576 (_ BitVec 64) V!2787) tuple2!1976)

(declare-fun get!1038 (ValueCell!834 V!2787) V!2787)

(declare-fun dynLambda!295 (Int (_ BitVec 64)) V!2787)

(assert (=> b!55776 (= lt!22046 (update!64 newMap!16 (select (arr!1739 (_keys!3622 (v!2331 (underlying!207 thiss!992)))) from!355) (get!1038 (select (arr!1740 (_values!1985 (v!2331 (underlying!207 thiss!992)))) from!355) (dynLambda!295 (defaultEntry!2002 (v!2331 (underlying!207 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!55777 () Bool)

(assert (=> b!55777 (= e!36660 e!36670)))

(declare-fun b!55778 () Bool)

(declare-fun res!31388 () Bool)

(assert (=> b!55778 (=> (not res!31388) (not e!36665))))

(assert (=> b!55778 (= res!31388 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5863 newMap!16)) (_size!337 (v!2331 (underlying!207 thiss!992)))))))

(declare-fun b!55779 () Bool)

(declare-fun res!31391 () Bool)

(assert (=> b!55779 (=> res!31391 e!36658)))

(assert (=> b!55779 (= res!31391 (not (arrayNoDuplicates!0 (_keys!3622 (v!2331 (underlying!207 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) lt!22044)))))

(declare-fun b!55780 () Bool)

(declare-fun res!31395 () Bool)

(assert (=> b!55780 (=> (not res!31395) (not e!36665))))

(assert (=> b!55780 (= res!31395 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1968 (_keys!3622 (v!2331 (underlying!207 thiss!992)))))))))

(declare-fun mapIsEmpty!2735 () Bool)

(assert (=> mapIsEmpty!2735 mapRes!2735))

(declare-fun mapIsEmpty!2736 () Bool)

(assert (=> mapIsEmpty!2736 mapRes!2736))

(assert (= (and start!8356 res!31390) b!55780))

(assert (= (and b!55780 res!31395) b!55766))

(assert (= (and b!55766 res!31394) b!55778))

(assert (= (and b!55778 res!31388) b!55768))

(assert (= (and b!55768 res!31396) b!55776))

(assert (= (and b!55776 res!31392) b!55763))

(assert (= (and b!55763 (not res!31393)) b!55769))

(assert (= (and b!55769 (not res!31387)) b!55774))

(assert (= (and b!55774 (not res!31397)) b!55771))

(assert (= (and b!55771 (not res!31389)) b!55779))

(assert (= (and b!55779 (not res!31391)) b!55772))

(assert (= (and b!55770 condMapEmpty!2735) mapIsEmpty!2735))

(assert (= (and b!55770 (not condMapEmpty!2735)) mapNonEmpty!2735))

(get-info :version)

(assert (= (and mapNonEmpty!2735 ((_ is ValueCellFull!834) mapValue!2736)) b!55760))

(assert (= (and b!55770 ((_ is ValueCellFull!834) mapDefault!2735)) b!55765))

(assert (= b!55764 b!55770))

(assert (= b!55767 b!55764))

(assert (= b!55777 b!55767))

(assert (= start!8356 b!55777))

(assert (= (and b!55761 condMapEmpty!2736) mapIsEmpty!2736))

(assert (= (and b!55761 (not condMapEmpty!2736)) mapNonEmpty!2736))

(assert (= (and mapNonEmpty!2736 ((_ is ValueCellFull!834) mapValue!2735)) b!55762))

(assert (= (and b!55761 ((_ is ValueCellFull!834) mapDefault!2736)) b!55773))

(assert (= b!55775 b!55761))

(assert (= start!8356 b!55775))

(declare-fun b_lambda!2449 () Bool)

(assert (=> (not b_lambda!2449) (not b!55776)))

(declare-fun t!4643 () Bool)

(declare-fun tb!1221 () Bool)

(assert (=> (and b!55764 (= (defaultEntry!2002 (v!2331 (underlying!207 thiss!992))) (defaultEntry!2002 (v!2331 (underlying!207 thiss!992)))) t!4643) tb!1221))

(declare-fun result!2229 () Bool)

(assert (=> tb!1221 (= result!2229 tp_is_empty!2355)))

(assert (=> b!55776 t!4643))

(declare-fun b_and!3299 () Bool)

(assert (= b_and!3295 (and (=> t!4643 result!2229) b_and!3299)))

(declare-fun tb!1223 () Bool)

(declare-fun t!4645 () Bool)

(assert (=> (and b!55775 (= (defaultEntry!2002 newMap!16) (defaultEntry!2002 (v!2331 (underlying!207 thiss!992)))) t!4645) tb!1223))

(declare-fun result!2233 () Bool)

(assert (= result!2233 result!2229))

(assert (=> b!55776 t!4645))

(declare-fun b_and!3301 () Bool)

(assert (= b_and!3297 (and (=> t!4645 result!2233) b_and!3301)))

(declare-fun m!47005 () Bool)

(assert (=> b!55766 m!47005))

(declare-fun m!47007 () Bool)

(assert (=> b!55774 m!47007))

(declare-fun m!47009 () Bool)

(assert (=> b!55769 m!47009))

(declare-fun m!47011 () Bool)

(assert (=> b!55764 m!47011))

(declare-fun m!47013 () Bool)

(assert (=> b!55764 m!47013))

(declare-fun m!47015 () Bool)

(assert (=> b!55772 m!47015))

(assert (=> b!55772 m!47015))

(declare-fun m!47017 () Bool)

(assert (=> b!55772 m!47017))

(assert (=> b!55776 m!47015))

(declare-fun m!47019 () Bool)

(assert (=> b!55776 m!47019))

(assert (=> b!55776 m!47015))

(declare-fun m!47021 () Bool)

(assert (=> b!55776 m!47021))

(declare-fun m!47023 () Bool)

(assert (=> b!55776 m!47023))

(declare-fun m!47025 () Bool)

(assert (=> b!55776 m!47025))

(assert (=> b!55776 m!47025))

(assert (=> b!55776 m!47019))

(assert (=> b!55776 m!47021))

(assert (=> b!55776 m!47015))

(declare-fun m!47027 () Bool)

(assert (=> b!55776 m!47027))

(declare-fun m!47029 () Bool)

(assert (=> b!55779 m!47029))

(declare-fun m!47031 () Bool)

(assert (=> mapNonEmpty!2736 m!47031))

(declare-fun m!47033 () Bool)

(assert (=> start!8356 m!47033))

(declare-fun m!47035 () Bool)

(assert (=> b!55775 m!47035))

(declare-fun m!47037 () Bool)

(assert (=> b!55775 m!47037))

(assert (=> b!55768 m!47015))

(declare-fun m!47039 () Bool)

(assert (=> b!55768 m!47039))

(declare-fun m!47041 () Bool)

(assert (=> b!55768 m!47041))

(declare-fun m!47043 () Bool)

(assert (=> mapNonEmpty!2735 m!47043))

(declare-fun m!47045 () Bool)

(assert (=> b!55763 m!47045))

(declare-fun m!47047 () Bool)

(assert (=> b!55763 m!47047))

(assert (=> b!55763 m!47015))

(declare-fun m!47049 () Bool)

(assert (=> b!55763 m!47049))

(assert (=> b!55763 m!47015))

(assert (=> b!55763 m!47015))

(declare-fun m!47051 () Bool)

(assert (=> b!55763 m!47051))

(declare-fun m!47053 () Bool)

(assert (=> b!55771 m!47053))

(check-sat (not b!55779) (not b!55768) b_and!3301 (not b!55764) (not mapNonEmpty!2735) (not b!55772) (not b!55766) (not mapNonEmpty!2736) (not b!55771) (not b!55763) (not start!8356) (not b_next!1877) (not b_next!1879) b_and!3299 (not b!55776) (not b!55775) (not b!55769) tp_is_empty!2355 (not b_lambda!2449) (not b!55774))
(check-sat b_and!3299 b_and!3301 (not b_next!1877) (not b_next!1879))
