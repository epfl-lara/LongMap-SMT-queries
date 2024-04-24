; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!9022 () Bool)

(assert start!9022)

(declare-fun b!63778 () Bool)

(declare-fun b_free!2005 () Bool)

(declare-fun b_next!2005 () Bool)

(assert (=> b!63778 (= b_free!2005 (not b_next!2005))))

(declare-fun tp!8154 () Bool)

(declare-fun b_and!3909 () Bool)

(assert (=> b!63778 (= tp!8154 b_and!3909)))

(declare-fun b!63776 () Bool)

(declare-fun b_free!2007 () Bool)

(declare-fun b_next!2007 () Bool)

(assert (=> b!63776 (= b_free!2007 (not b_next!2007))))

(declare-fun tp!8153 () Bool)

(declare-fun b_and!3911 () Bool)

(assert (=> b!63776 (= tp!8153 b_and!3911)))

(declare-fun b!63764 () Bool)

(declare-fun e!41816 () Bool)

(declare-fun e!41812 () Bool)

(assert (=> b!63764 (= e!41816 e!41812)))

(declare-fun b!63765 () Bool)

(declare-fun e!41811 () Bool)

(declare-fun e!41806 () Bool)

(assert (=> b!63765 (= e!41811 e!41806)))

(declare-fun res!34854 () Bool)

(assert (=> b!63765 (=> (not res!34854) (not e!41806))))

(declare-datatypes ((V!2873 0))(
  ( (V!2874 (val!1254 Int)) )
))
(declare-datatypes ((array!3757 0))(
  ( (array!3758 (arr!1796 (Array (_ BitVec 32) (_ BitVec 64))) (size!2029 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!866 0))(
  ( (ValueCellFull!866 (v!2434 V!2873)) (EmptyCell!866) )
))
(declare-datatypes ((array!3759 0))(
  ( (array!3760 (arr!1797 (Array (_ BitVec 32) ValueCell!866)) (size!2030 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!640 0))(
  ( (LongMapFixedSize!641 (defaultEntry!2108 Int) (mask!6024 (_ BitVec 32)) (extraKeys!1983 (_ BitVec 32)) (zeroValue!2018 V!2873) (minValue!2018 V!2873) (_size!369 (_ BitVec 32)) (_keys!3744 array!3757) (_values!2091 array!3759) (_vacant!369 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!450 0))(
  ( (Cell!451 (v!2435 LongMapFixedSize!640)) )
))
(declare-datatypes ((LongMap!450 0))(
  ( (LongMap!451 (underlying!236 Cell!450)) )
))
(declare-fun thiss!992 () LongMap!450)

(declare-datatypes ((tuple2!2038 0))(
  ( (tuple2!2039 (_1!1030 (_ BitVec 64)) (_2!1030 V!2873)) )
))
(declare-datatypes ((List!1433 0))(
  ( (Nil!1430) (Cons!1429 (h!2013 tuple2!2038) (t!4839 List!1433)) )
))
(declare-datatypes ((ListLongMap!1355 0))(
  ( (ListLongMap!1356 (toList!693 List!1433)) )
))
(declare-fun lt!26956 () ListLongMap!1355)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!26960 () ListLongMap!1355)

(assert (=> b!63765 (= res!34854 (and (= lt!26960 lt!26956) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!640)

(declare-fun map!1121 (LongMapFixedSize!640) ListLongMap!1355)

(assert (=> b!63765 (= lt!26956 (map!1121 newMap!16))))

(declare-fun getCurrentListMap!393 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) ListLongMap!1355)

(assert (=> b!63765 (= lt!26960 (getCurrentListMap!393 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun mapNonEmpty!2963 () Bool)

(declare-fun mapRes!2963 () Bool)

(declare-fun tp!8151 () Bool)

(declare-fun e!41803 () Bool)

(assert (=> mapNonEmpty!2963 (= mapRes!2963 (and tp!8151 e!41803))))

(declare-fun mapValue!2964 () ValueCell!866)

(declare-fun mapRest!2963 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapKey!2964 () (_ BitVec 32))

(assert (=> mapNonEmpty!2963 (= (arr!1797 (_values!2091 newMap!16)) (store mapRest!2963 mapKey!2964 mapValue!2964))))

(declare-fun b!63766 () Bool)

(declare-datatypes ((Unit!1748 0))(
  ( (Unit!1749) )
))
(declare-fun e!41804 () Unit!1748)

(declare-fun Unit!1750 () Unit!1748)

(assert (=> b!63766 (= e!41804 Unit!1750)))

(declare-fun lt!26954 () Unit!1748)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!29 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1748)

(assert (=> b!63766 (= lt!26954 (lemmaListMapContainsThenArrayContainsFrom!29 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!63766 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!26955 () Unit!1748)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3757 (_ BitVec 32) (_ BitVec 32)) Unit!1748)

(assert (=> b!63766 (= lt!26955 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1434 0))(
  ( (Nil!1431) (Cons!1430 (h!2014 (_ BitVec 64)) (t!4840 List!1434)) )
))
(declare-fun arrayNoDuplicates!0 (array!3757 (_ BitVec 32) List!1434) Bool)

(assert (=> b!63766 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1431)))

(declare-fun lt!26957 () Unit!1748)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3757 (_ BitVec 32) (_ BitVec 64) List!1434) Unit!1748)

(assert (=> b!63766 (= lt!26957 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431)))))

(assert (=> b!63766 false))

(declare-fun b!63767 () Bool)

(declare-fun e!41808 () Bool)

(declare-fun tp_is_empty!2419 () Bool)

(assert (=> b!63767 (= e!41808 tp_is_empty!2419)))

(declare-fun b!63768 () Bool)

(declare-fun e!41805 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3757 (_ BitVec 32)) Bool)

(assert (=> b!63768 (= e!41805 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!63769 () Bool)

(declare-fun res!34855 () Bool)

(assert (=> b!63769 (=> (not res!34855) (not e!41805))))

(assert (=> b!63769 (= res!34855 (and (= (size!2030 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!6024 (v!2435 (underlying!236 thiss!992))))) (= (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (size!2030 (_values!2091 (v!2435 (underlying!236 thiss!992))))) (bvsge (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!63770 () Bool)

(declare-fun e!41814 () Bool)

(assert (=> b!63770 (= e!41814 tp_is_empty!2419)))

(declare-fun b!63771 () Bool)

(declare-fun e!41815 () Bool)

(assert (=> b!63771 (= e!41815 (and e!41808 mapRes!2963))))

(declare-fun condMapEmpty!2963 () Bool)

(declare-fun mapDefault!2964 () ValueCell!866)

(assert (=> b!63771 (= condMapEmpty!2963 (= (arr!1797 (_values!2091 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2964)))))

(declare-fun b!63772 () Bool)

(declare-fun res!34858 () Bool)

(assert (=> b!63772 (=> (not res!34858) (not e!41811))))

(assert (=> b!63772 (= res!34858 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6024 newMap!16)) (_size!369 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63773 () Bool)

(declare-fun res!34860 () Bool)

(assert (=> b!63773 (=> (not res!34860) (not e!41811))))

(assert (=> b!63773 (= res!34860 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun mapIsEmpty!2963 () Bool)

(assert (=> mapIsEmpty!2963 mapRes!2963))

(declare-fun b!63774 () Bool)

(declare-fun res!34859 () Bool)

(assert (=> b!63774 (=> (not res!34859) (not e!41805))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!63774 (= res!34859 (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun mapIsEmpty!2964 () Bool)

(declare-fun mapRes!2964 () Bool)

(assert (=> mapIsEmpty!2964 mapRes!2964))

(declare-fun b!63775 () Bool)

(declare-fun Unit!1751 () Unit!1748)

(assert (=> b!63775 (= e!41804 Unit!1751)))

(declare-fun e!41817 () Bool)

(declare-fun array_inv!1101 (array!3757) Bool)

(declare-fun array_inv!1102 (array!3759) Bool)

(assert (=> b!63776 (= e!41817 (and tp!8153 tp_is_empty!2419 (array_inv!1101 (_keys!3744 newMap!16)) (array_inv!1102 (_values!2091 newMap!16)) e!41815))))

(declare-fun b!63777 () Bool)

(declare-fun e!41807 () Bool)

(assert (=> b!63777 (= e!41812 e!41807)))

(declare-fun res!34857 () Bool)

(assert (=> start!9022 (=> (not res!34857) (not e!41811))))

(declare-fun valid!273 (LongMap!450) Bool)

(assert (=> start!9022 (= res!34857 (valid!273 thiss!992))))

(assert (=> start!9022 e!41811))

(assert (=> start!9022 e!41816))

(assert (=> start!9022 true))

(assert (=> start!9022 e!41817))

(declare-fun e!41813 () Bool)

(assert (=> b!63778 (= e!41807 (and tp!8154 tp_is_empty!2419 (array_inv!1101 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (array_inv!1102 (_values!2091 (v!2435 (underlying!236 thiss!992)))) e!41813))))

(declare-fun b!63779 () Bool)

(declare-fun res!34856 () Bool)

(assert (=> b!63779 (=> (not res!34856) (not e!41811))))

(declare-fun valid!274 (LongMapFixedSize!640) Bool)

(assert (=> b!63779 (= res!34856 (valid!274 newMap!16))))

(declare-fun b!63780 () Bool)

(assert (=> b!63780 (= e!41806 e!41805)))

(declare-fun res!34853 () Bool)

(assert (=> b!63780 (=> (not res!34853) (not e!41805))))

(declare-datatypes ((tuple2!2040 0))(
  ( (tuple2!2041 (_1!1031 Bool) (_2!1031 LongMapFixedSize!640)) )
))
(declare-fun lt!26959 () tuple2!2040)

(assert (=> b!63780 (= res!34853 (and (_1!1031 lt!26959) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!26958 () Unit!1748)

(assert (=> b!63780 (= lt!26958 e!41804)))

(declare-fun c!8661 () Bool)

(declare-fun contains!690 (ListLongMap!1355 (_ BitVec 64)) Bool)

(assert (=> b!63780 (= c!8661 (contains!690 lt!26956 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun update!92 (LongMapFixedSize!640 (_ BitVec 64) V!2873) tuple2!2040)

(declare-fun get!1095 (ValueCell!866 V!2873) V!2873)

(declare-fun dynLambda!310 (Int (_ BitVec 64)) V!2873)

(assert (=> b!63780 (= lt!26959 (update!92 newMap!16 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!63781 () Bool)

(assert (=> b!63781 (= e!41803 tp_is_empty!2419)))

(declare-fun b!63782 () Bool)

(declare-fun e!41809 () Bool)

(assert (=> b!63782 (= e!41809 tp_is_empty!2419)))

(declare-fun b!63783 () Bool)

(assert (=> b!63783 (= e!41813 (and e!41809 mapRes!2964))))

(declare-fun condMapEmpty!2964 () Bool)

(declare-fun mapDefault!2963 () ValueCell!866)

(assert (=> b!63783 (= condMapEmpty!2964 (= (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2963)))))

(declare-fun mapNonEmpty!2964 () Bool)

(declare-fun tp!8152 () Bool)

(assert (=> mapNonEmpty!2964 (= mapRes!2964 (and tp!8152 e!41814))))

(declare-fun mapKey!2963 () (_ BitVec 32))

(declare-fun mapRest!2964 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2963 () ValueCell!866)

(assert (=> mapNonEmpty!2964 (= (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (store mapRest!2964 mapKey!2963 mapValue!2963))))

(assert (= (and start!9022 res!34857) b!63773))

(assert (= (and b!63773 res!34860) b!63779))

(assert (= (and b!63779 res!34856) b!63772))

(assert (= (and b!63772 res!34858) b!63765))

(assert (= (and b!63765 res!34854) b!63780))

(assert (= (and b!63780 c!8661) b!63766))

(assert (= (and b!63780 (not c!8661)) b!63775))

(assert (= (and b!63780 res!34853) b!63774))

(assert (= (and b!63774 res!34859) b!63769))

(assert (= (and b!63769 res!34855) b!63768))

(assert (= (and b!63783 condMapEmpty!2964) mapIsEmpty!2964))

(assert (= (and b!63783 (not condMapEmpty!2964)) mapNonEmpty!2964))

(get-info :version)

(assert (= (and mapNonEmpty!2964 ((_ is ValueCellFull!866) mapValue!2963)) b!63770))

(assert (= (and b!63783 ((_ is ValueCellFull!866) mapDefault!2963)) b!63782))

(assert (= b!63778 b!63783))

(assert (= b!63777 b!63778))

(assert (= b!63764 b!63777))

(assert (= start!9022 b!63764))

(assert (= (and b!63771 condMapEmpty!2963) mapIsEmpty!2963))

(assert (= (and b!63771 (not condMapEmpty!2963)) mapNonEmpty!2963))

(assert (= (and mapNonEmpty!2963 ((_ is ValueCellFull!866) mapValue!2964)) b!63781))

(assert (= (and b!63771 ((_ is ValueCellFull!866) mapDefault!2964)) b!63767))

(assert (= b!63776 b!63771))

(assert (= start!9022 b!63776))

(declare-fun b_lambda!2875 () Bool)

(assert (=> (not b_lambda!2875) (not b!63780)))

(declare-fun t!4836 () Bool)

(declare-fun tb!1381 () Bool)

(assert (=> (and b!63778 (= (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) t!4836) tb!1381))

(declare-fun result!2463 () Bool)

(assert (=> tb!1381 (= result!2463 tp_is_empty!2419)))

(assert (=> b!63780 t!4836))

(declare-fun b_and!3913 () Bool)

(assert (= b_and!3909 (and (=> t!4836 result!2463) b_and!3913)))

(declare-fun t!4838 () Bool)

(declare-fun tb!1383 () Bool)

(assert (=> (and b!63776 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) t!4838) tb!1383))

(declare-fun result!2467 () Bool)

(assert (= result!2467 result!2463))

(assert (=> b!63780 t!4838))

(declare-fun b_and!3915 () Bool)

(assert (= b_and!3911 (and (=> t!4838 result!2467) b_and!3915)))

(declare-fun m!58357 () Bool)

(assert (=> b!63766 m!58357))

(declare-fun m!58359 () Bool)

(assert (=> b!63766 m!58359))

(declare-fun m!58361 () Bool)

(assert (=> b!63766 m!58361))

(declare-fun m!58363 () Bool)

(assert (=> b!63766 m!58363))

(assert (=> b!63766 m!58361))

(assert (=> b!63766 m!58361))

(declare-fun m!58365 () Bool)

(assert (=> b!63766 m!58365))

(assert (=> b!63766 m!58361))

(declare-fun m!58367 () Bool)

(assert (=> b!63766 m!58367))

(declare-fun m!58369 () Bool)

(assert (=> b!63768 m!58369))

(declare-fun m!58371 () Bool)

(assert (=> b!63780 m!58371))

(declare-fun m!58373 () Bool)

(assert (=> b!63780 m!58373))

(declare-fun m!58375 () Bool)

(assert (=> b!63780 m!58375))

(assert (=> b!63780 m!58361))

(assert (=> b!63780 m!58373))

(assert (=> b!63780 m!58361))

(declare-fun m!58377 () Bool)

(assert (=> b!63780 m!58377))

(assert (=> b!63780 m!58361))

(assert (=> b!63780 m!58375))

(declare-fun m!58379 () Bool)

(assert (=> b!63780 m!58379))

(assert (=> b!63780 m!58371))

(declare-fun m!58381 () Bool)

(assert (=> b!63779 m!58381))

(declare-fun m!58383 () Bool)

(assert (=> b!63776 m!58383))

(declare-fun m!58385 () Bool)

(assert (=> b!63776 m!58385))

(declare-fun m!58387 () Bool)

(assert (=> start!9022 m!58387))

(declare-fun m!58389 () Bool)

(assert (=> b!63774 m!58389))

(declare-fun m!58391 () Bool)

(assert (=> mapNonEmpty!2963 m!58391))

(declare-fun m!58393 () Bool)

(assert (=> b!63778 m!58393))

(declare-fun m!58395 () Bool)

(assert (=> b!63778 m!58395))

(declare-fun m!58397 () Bool)

(assert (=> mapNonEmpty!2964 m!58397))

(assert (=> b!63765 m!58361))

(declare-fun m!58399 () Bool)

(assert (=> b!63765 m!58399))

(declare-fun m!58401 () Bool)

(assert (=> b!63765 m!58401))

(check-sat (not b_next!2005) (not b!63778) (not mapNonEmpty!2963) tp_is_empty!2419 (not b!63766) (not b_next!2007) (not b!63774) (not b!63776) (not mapNonEmpty!2964) (not b!63768) (not b!63765) b_and!3915 (not start!9022) (not b!63780) b_and!3913 (not b_lambda!2875) (not b!63779))
(check-sat b_and!3913 b_and!3915 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun b_lambda!2881 () Bool)

(assert (= b_lambda!2875 (or (and b!63778 b_free!2005) (and b!63776 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))))) b_lambda!2881)))

(check-sat (not b_next!2005) (not b!63778) (not mapNonEmpty!2963) tp_is_empty!2419 (not b!63766) (not b_lambda!2881) (not b_next!2007) (not b!63774) (not b!63776) (not mapNonEmpty!2964) (not b!63779) (not b!63768) (not b!63765) b_and!3915 (not start!9022) (not b!63780) b_and!3913)
(check-sat b_and!3913 b_and!3915 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun b!63918 () Bool)

(declare-fun e!41921 () Bool)

(declare-fun call!5060 () Bool)

(assert (=> b!63918 (= e!41921 call!5060)))

(declare-fun b!63919 () Bool)

(declare-fun e!41923 () Bool)

(declare-fun e!41922 () Bool)

(assert (=> b!63919 (= e!41923 e!41922)))

(declare-fun c!8670 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!63919 (= c!8670 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun bm!5057 () Bool)

(assert (=> bm!5057 (= call!5060 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63920 () Bool)

(assert (=> b!63920 (= e!41922 e!41921)))

(declare-fun lt!27009 () (_ BitVec 64))

(assert (=> b!63920 (= lt!27009 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(declare-fun lt!27010 () Unit!1748)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!3757 (_ BitVec 64) (_ BitVec 32)) Unit!1748)

(assert (=> b!63920 (= lt!27010 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000))))

(assert (=> b!63920 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000)))

(declare-fun lt!27011 () Unit!1748)

(assert (=> b!63920 (= lt!27011 lt!27010)))

(declare-fun res!34913 () Bool)

(declare-datatypes ((SeekEntryResult!224 0))(
  ( (MissingZero!224 (index!3022 (_ BitVec 32))) (Found!224 (index!3023 (_ BitVec 32))) (Intermediate!224 (undefined!1036 Bool) (index!3024 (_ BitVec 32)) (x!10446 (_ BitVec 32))) (Undefined!224) (MissingVacant!224 (index!3025 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!3757 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!63920 (= res!34913 (= (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!63920 (=> (not res!34913) (not e!41921))))

(declare-fun b!63921 () Bool)

(assert (=> b!63921 (= e!41922 call!5060)))

(declare-fun d!13333 () Bool)

(declare-fun res!34914 () Bool)

(assert (=> d!13333 (=> res!34914 e!41923)))

(assert (=> d!13333 (= res!34914 (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))) e!41923)))

(assert (= (and d!13333 (not res!34914)) b!63919))

(assert (= (and b!63919 c!8670) b!63920))

(assert (= (and b!63919 (not c!8670)) b!63921))

(assert (= (and b!63920 res!34913) b!63918))

(assert (= (or b!63918 b!63921) bm!5057))

(declare-fun m!58495 () Bool)

(assert (=> b!63919 m!58495))

(assert (=> b!63919 m!58495))

(declare-fun m!58497 () Bool)

(assert (=> b!63919 m!58497))

(declare-fun m!58499 () Bool)

(assert (=> bm!5057 m!58499))

(assert (=> b!63920 m!58495))

(declare-fun m!58501 () Bool)

(assert (=> b!63920 m!58501))

(declare-fun m!58503 () Bool)

(assert (=> b!63920 m!58503))

(assert (=> b!63920 m!58495))

(declare-fun m!58505 () Bool)

(assert (=> b!63920 m!58505))

(assert (=> b!63768 d!13333))

(declare-fun d!13335 () Bool)

(assert (=> d!13335 (= (array_inv!1101 (_keys!3744 newMap!16)) (bvsge (size!2029 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63776 d!13335))

(declare-fun d!13337 () Bool)

(assert (=> d!13337 (= (array_inv!1102 (_values!2091 newMap!16)) (bvsge (size!2030 (_values!2091 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!63776 d!13337))

(declare-fun d!13339 () Bool)

(assert (=> d!13339 (= (array_inv!1101 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvsge (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63778 d!13339))

(declare-fun d!13341 () Bool)

(assert (=> d!13341 (= (array_inv!1102 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvsge (size!2030 (_values!2091 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000))))

(assert (=> b!63778 d!13341))

(declare-fun d!13343 () Bool)

(assert (=> d!13343 (= (map!1121 newMap!16) (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun bs!2799 () Bool)

(assert (= bs!2799 d!13343))

(declare-fun m!58507 () Bool)

(assert (=> bs!2799 m!58507))

(assert (=> b!63765 d!13343))

(declare-fun b!63964 () Bool)

(declare-fun e!41959 () Bool)

(declare-fun e!41951 () Bool)

(assert (=> b!63964 (= e!41959 e!41951)))

(declare-fun res!34938 () Bool)

(assert (=> b!63964 (=> (not res!34938) (not e!41951))))

(declare-fun lt!27058 () ListLongMap!1355)

(assert (=> b!63964 (= res!34938 (contains!690 lt!27058 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!63964 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!63965 () Bool)

(declare-fun e!41957 () Bool)

(declare-fun e!41953 () Bool)

(assert (=> b!63965 (= e!41957 e!41953)))

(declare-fun c!8683 () Bool)

(assert (=> b!63965 (= c!8683 (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!63966 () Bool)

(declare-fun e!41952 () Bool)

(assert (=> b!63966 (= e!41952 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun bm!5072 () Bool)

(declare-fun call!5075 () ListLongMap!1355)

(declare-fun getCurrentListMapNoExtraKeys!47 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) ListLongMap!1355)

(assert (=> bm!5072 (= call!5075 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63967 () Bool)

(declare-fun e!41956 () Bool)

(declare-fun call!5076 () Bool)

(assert (=> b!63967 (= e!41956 (not call!5076))))

(declare-fun b!63968 () Bool)

(declare-fun e!41950 () Bool)

(declare-fun apply!69 (ListLongMap!1355 (_ BitVec 64)) V!2873)

(assert (=> b!63968 (= e!41950 (= (apply!69 lt!27058 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun d!13345 () Bool)

(assert (=> d!13345 e!41957))

(declare-fun res!34941 () Bool)

(assert (=> d!13345 (=> (not res!34941) (not e!41957))))

(assert (=> d!13345 (= res!34941 (or (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))) (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun lt!27072 () ListLongMap!1355)

(assert (=> d!13345 (= lt!27058 lt!27072)))

(declare-fun lt!27068 () Unit!1748)

(declare-fun e!41958 () Unit!1748)

(assert (=> d!13345 (= lt!27068 e!41958)))

(declare-fun c!8688 () Bool)

(declare-fun e!41955 () Bool)

(assert (=> d!13345 (= c!8688 e!41955)))

(declare-fun res!34937 () Bool)

(assert (=> d!13345 (=> (not res!34937) (not e!41955))))

(assert (=> d!13345 (= res!34937 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun e!41954 () ListLongMap!1355)

(assert (=> d!13345 (= lt!27072 e!41954)))

(declare-fun c!8684 () Bool)

(assert (=> d!13345 (= c!8684 (and (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13345 (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13345 (= (getCurrentListMap!393 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) lt!27058)))

(declare-fun b!63969 () Bool)

(declare-fun c!8687 () Bool)

(assert (=> b!63969 (= c!8687 (and (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!41961 () ListLongMap!1355)

(declare-fun e!41960 () ListLongMap!1355)

(assert (=> b!63969 (= e!41961 e!41960)))

(declare-fun b!63970 () Bool)

(declare-fun res!34934 () Bool)

(assert (=> b!63970 (=> (not res!34934) (not e!41957))))

(assert (=> b!63970 (= res!34934 e!41959)))

(declare-fun res!34940 () Bool)

(assert (=> b!63970 (=> res!34940 e!41959)))

(assert (=> b!63970 (= res!34940 (not e!41952))))

(declare-fun res!34936 () Bool)

(assert (=> b!63970 (=> (not res!34936) (not e!41952))))

(assert (=> b!63970 (= res!34936 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!63971 () Bool)

(assert (=> b!63971 (= e!41951 (= (apply!69 lt!27058 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!63971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2030 (_values!2091 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> b!63971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!63972 () Bool)

(declare-fun call!5078 () ListLongMap!1355)

(assert (=> b!63972 (= e!41961 call!5078)))

(declare-fun b!63973 () Bool)

(declare-fun res!34933 () Bool)

(assert (=> b!63973 (=> (not res!34933) (not e!41957))))

(assert (=> b!63973 (= res!34933 e!41956)))

(declare-fun c!8685 () Bool)

(assert (=> b!63973 (= c!8685 (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!5073 () Bool)

(declare-fun call!5081 () ListLongMap!1355)

(assert (=> bm!5073 (= call!5078 call!5081)))

(declare-fun b!63974 () Bool)

(assert (=> b!63974 (= e!41960 call!5078)))

(declare-fun b!63975 () Bool)

(assert (=> b!63975 (= e!41955 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!63976 () Bool)

(assert (=> b!63976 (= e!41953 e!41950)))

(declare-fun res!34939 () Bool)

(declare-fun call!5079 () Bool)

(assert (=> b!63976 (= res!34939 call!5079)))

(assert (=> b!63976 (=> (not res!34939) (not e!41950))))

(declare-fun b!63977 () Bool)

(declare-fun Unit!1759 () Unit!1748)

(assert (=> b!63977 (= e!41958 Unit!1759)))

(declare-fun bm!5074 () Bool)

(assert (=> bm!5074 (= call!5079 (contains!690 lt!27058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5075 () Bool)

(declare-fun call!5080 () ListLongMap!1355)

(assert (=> bm!5075 (= call!5080 call!5075)))

(declare-fun b!63978 () Bool)

(assert (=> b!63978 (= e!41954 e!41961)))

(declare-fun c!8686 () Bool)

(assert (=> b!63978 (= c!8686 (and (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5076 () Bool)

(assert (=> bm!5076 (= call!5076 (contains!690 lt!27058 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5077 () Bool)

(declare-fun call!5077 () ListLongMap!1355)

(assert (=> bm!5077 (= call!5077 call!5080)))

(declare-fun b!63979 () Bool)

(declare-fun e!41962 () Bool)

(assert (=> b!63979 (= e!41962 (= (apply!69 lt!27058 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!63980 () Bool)

(declare-fun lt!27059 () Unit!1748)

(assert (=> b!63980 (= e!41958 lt!27059)))

(declare-fun lt!27056 () ListLongMap!1355)

(assert (=> b!63980 (= lt!27056 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27071 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27071 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27066 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27066 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27070 () Unit!1748)

(declare-fun addStillContains!45 (ListLongMap!1355 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1748)

(assert (=> b!63980 (= lt!27070 (addStillContains!45 lt!27056 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27066))))

(declare-fun +!83 (ListLongMap!1355 tuple2!2038) ListLongMap!1355)

(assert (=> b!63980 (contains!690 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27066)))

(declare-fun lt!27077 () Unit!1748)

(assert (=> b!63980 (= lt!27077 lt!27070)))

(declare-fun lt!27074 () ListLongMap!1355)

(assert (=> b!63980 (= lt!27074 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27060 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27069 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27069 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27075 () Unit!1748)

(declare-fun addApplyDifferent!45 (ListLongMap!1355 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1748)

(assert (=> b!63980 (= lt!27075 (addApplyDifferent!45 lt!27074 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27069))))

(assert (=> b!63980 (= (apply!69 (+!83 lt!27074 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27069) (apply!69 lt!27074 lt!27069))))

(declare-fun lt!27064 () Unit!1748)

(assert (=> b!63980 (= lt!27064 lt!27075)))

(declare-fun lt!27065 () ListLongMap!1355)

(assert (=> b!63980 (= lt!27065 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27057 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27063 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27063 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27076 () Unit!1748)

(assert (=> b!63980 (= lt!27076 (addApplyDifferent!45 lt!27065 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27063))))

(assert (=> b!63980 (= (apply!69 (+!83 lt!27065 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27063) (apply!69 lt!27065 lt!27063))))

(declare-fun lt!27067 () Unit!1748)

(assert (=> b!63980 (= lt!27067 lt!27076)))

(declare-fun lt!27062 () ListLongMap!1355)

(assert (=> b!63980 (= lt!27062 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun lt!27073 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27073 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27061 () (_ BitVec 64))

(assert (=> b!63980 (= lt!27061 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!63980 (= lt!27059 (addApplyDifferent!45 lt!27062 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27061))))

(assert (=> b!63980 (= (apply!69 (+!83 lt!27062 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27061) (apply!69 lt!27062 lt!27061))))

(declare-fun b!63981 () Bool)

(assert (=> b!63981 (= e!41953 (not call!5079))))

(declare-fun b!63982 () Bool)

(assert (=> b!63982 (= e!41960 call!5077)))

(declare-fun b!63983 () Bool)

(assert (=> b!63983 (= e!41956 e!41962)))

(declare-fun res!34935 () Bool)

(assert (=> b!63983 (= res!34935 call!5076)))

(assert (=> b!63983 (=> (not res!34935) (not e!41962))))

(declare-fun bm!5078 () Bool)

(assert (=> bm!5078 (= call!5081 (+!83 (ite c!8684 call!5075 (ite c!8686 call!5080 call!5077)) (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun b!63984 () Bool)

(assert (=> b!63984 (= e!41954 (+!83 call!5081 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13345 c!8684) b!63984))

(assert (= (and d!13345 (not c!8684)) b!63978))

(assert (= (and b!63978 c!8686) b!63972))

(assert (= (and b!63978 (not c!8686)) b!63969))

(assert (= (and b!63969 c!8687) b!63974))

(assert (= (and b!63969 (not c!8687)) b!63982))

(assert (= (or b!63974 b!63982) bm!5077))

(assert (= (or b!63972 bm!5077) bm!5075))

(assert (= (or b!63972 b!63974) bm!5073))

(assert (= (or b!63984 bm!5075) bm!5072))

(assert (= (or b!63984 bm!5073) bm!5078))

(assert (= (and d!13345 res!34937) b!63975))

(assert (= (and d!13345 c!8688) b!63980))

(assert (= (and d!13345 (not c!8688)) b!63977))

(assert (= (and d!13345 res!34941) b!63970))

(assert (= (and b!63970 res!34936) b!63966))

(assert (= (and b!63970 (not res!34940)) b!63964))

(assert (= (and b!63964 res!34938) b!63971))

(assert (= (and b!63970 res!34934) b!63973))

(assert (= (and b!63973 c!8685) b!63983))

(assert (= (and b!63973 (not c!8685)) b!63967))

(assert (= (and b!63983 res!34935) b!63979))

(assert (= (or b!63983 b!63967) bm!5076))

(assert (= (and b!63973 res!34933) b!63965))

(assert (= (and b!63965 c!8683) b!63976))

(assert (= (and b!63965 (not c!8683)) b!63981))

(assert (= (and b!63976 res!34939) b!63968))

(assert (= (or b!63976 b!63981) bm!5074))

(declare-fun b_lambda!2883 () Bool)

(assert (=> (not b_lambda!2883) (not b!63971)))

(assert (=> b!63971 t!4836))

(declare-fun b_and!3933 () Bool)

(assert (= b_and!3913 (and (=> t!4836 result!2463) b_and!3933)))

(assert (=> b!63971 t!4838))

(declare-fun b_and!3935 () Bool)

(assert (= b_and!3915 (and (=> t!4838 result!2467) b_and!3935)))

(declare-fun m!58509 () Bool)

(assert (=> b!63979 m!58509))

(declare-fun m!58511 () Bool)

(assert (=> b!63964 m!58511))

(assert (=> b!63964 m!58511))

(declare-fun m!58513 () Bool)

(assert (=> b!63964 m!58513))

(assert (=> d!13345 m!58389))

(assert (=> b!63975 m!58511))

(assert (=> b!63975 m!58511))

(declare-fun m!58515 () Bool)

(assert (=> b!63975 m!58515))

(declare-fun m!58517 () Bool)

(assert (=> bm!5074 m!58517))

(declare-fun m!58519 () Bool)

(assert (=> bm!5072 m!58519))

(declare-fun m!58521 () Bool)

(assert (=> b!63984 m!58521))

(declare-fun m!58523 () Bool)

(assert (=> b!63980 m!58523))

(assert (=> b!63980 m!58511))

(declare-fun m!58525 () Bool)

(assert (=> b!63980 m!58525))

(assert (=> b!63980 m!58523))

(declare-fun m!58527 () Bool)

(assert (=> b!63980 m!58527))

(assert (=> b!63980 m!58519))

(declare-fun m!58529 () Bool)

(assert (=> b!63980 m!58529))

(declare-fun m!58531 () Bool)

(assert (=> b!63980 m!58531))

(declare-fun m!58533 () Bool)

(assert (=> b!63980 m!58533))

(declare-fun m!58535 () Bool)

(assert (=> b!63980 m!58535))

(declare-fun m!58537 () Bool)

(assert (=> b!63980 m!58537))

(declare-fun m!58539 () Bool)

(assert (=> b!63980 m!58539))

(declare-fun m!58541 () Bool)

(assert (=> b!63980 m!58541))

(declare-fun m!58543 () Bool)

(assert (=> b!63980 m!58543))

(declare-fun m!58545 () Bool)

(assert (=> b!63980 m!58545))

(declare-fun m!58547 () Bool)

(assert (=> b!63980 m!58547))

(assert (=> b!63980 m!58535))

(declare-fun m!58549 () Bool)

(assert (=> b!63980 m!58549))

(assert (=> b!63980 m!58539))

(assert (=> b!63980 m!58543))

(declare-fun m!58551 () Bool)

(assert (=> b!63980 m!58551))

(declare-fun m!58553 () Bool)

(assert (=> bm!5076 m!58553))

(assert (=> b!63971 m!58511))

(assert (=> b!63971 m!58511))

(declare-fun m!58555 () Bool)

(assert (=> b!63971 m!58555))

(declare-fun m!58557 () Bool)

(assert (=> b!63971 m!58557))

(assert (=> b!63971 m!58557))

(assert (=> b!63971 m!58373))

(declare-fun m!58559 () Bool)

(assert (=> b!63971 m!58559))

(assert (=> b!63971 m!58373))

(declare-fun m!58561 () Bool)

(assert (=> b!63968 m!58561))

(assert (=> b!63966 m!58511))

(assert (=> b!63966 m!58511))

(assert (=> b!63966 m!58515))

(declare-fun m!58563 () Bool)

(assert (=> bm!5078 m!58563))

(assert (=> b!63765 d!13345))

(declare-fun d!13347 () Bool)

(assert (=> d!13347 (= (valid!273 thiss!992) (valid!274 (v!2435 (underlying!236 thiss!992))))))

(declare-fun bs!2800 () Bool)

(assert (= bs!2800 d!13347))

(declare-fun m!58565 () Bool)

(assert (=> bs!2800 m!58565))

(assert (=> start!9022 d!13347))

(declare-fun d!13349 () Bool)

(declare-fun res!34948 () Bool)

(declare-fun e!41965 () Bool)

(assert (=> d!13349 (=> (not res!34948) (not e!41965))))

(declare-fun simpleValid!45 (LongMapFixedSize!640) Bool)

(assert (=> d!13349 (= res!34948 (simpleValid!45 newMap!16))))

(assert (=> d!13349 (= (valid!274 newMap!16) e!41965)))

(declare-fun b!63991 () Bool)

(declare-fun res!34949 () Bool)

(assert (=> b!63991 (=> (not res!34949) (not e!41965))))

(declare-fun arrayCountValidKeys!0 (array!3757 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!63991 (= res!34949 (= (arrayCountValidKeys!0 (_keys!3744 newMap!16) #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (_size!369 newMap!16)))))

(declare-fun b!63992 () Bool)

(declare-fun res!34950 () Bool)

(assert (=> b!63992 (=> (not res!34950) (not e!41965))))

(assert (=> b!63992 (= res!34950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun b!63993 () Bool)

(assert (=> b!63993 (= e!41965 (arrayNoDuplicates!0 (_keys!3744 newMap!16) #b00000000000000000000000000000000 Nil!1431))))

(assert (= (and d!13349 res!34948) b!63991))

(assert (= (and b!63991 res!34949) b!63992))

(assert (= (and b!63992 res!34950) b!63993))

(declare-fun m!58567 () Bool)

(assert (=> d!13349 m!58567))

(declare-fun m!58569 () Bool)

(assert (=> b!63991 m!58569))

(declare-fun m!58571 () Bool)

(assert (=> b!63992 m!58571))

(declare-fun m!58573 () Bool)

(assert (=> b!63993 m!58573))

(assert (=> b!63779 d!13349))

(declare-fun d!13351 () Bool)

(assert (=> d!13351 (= (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992)))) (and (or (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000001111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000011111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000001111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000011111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000001111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000011111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000001111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000011111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000000111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000001111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000011111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000000111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000001111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000011111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000000111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000001111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000011111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000000111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000001111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000011111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00000111111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00001111111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00011111111111111111111111111111) (= (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00111111111111111111111111111111)) (bvsle (mask!6024 (v!2435 (underlying!236 thiss!992))) #b00111111111111111111111111111111)))))

(assert (=> b!63774 d!13351))

(declare-fun d!13353 () Bool)

(declare-fun e!41970 () Bool)

(assert (=> d!13353 e!41970))

(declare-fun res!34953 () Bool)

(assert (=> d!13353 (=> res!34953 e!41970)))

(declare-fun lt!27089 () Bool)

(assert (=> d!13353 (= res!34953 (not lt!27089))))

(declare-fun lt!27086 () Bool)

(assert (=> d!13353 (= lt!27089 lt!27086)))

(declare-fun lt!27087 () Unit!1748)

(declare-fun e!41971 () Unit!1748)

(assert (=> d!13353 (= lt!27087 e!41971)))

(declare-fun c!8691 () Bool)

(assert (=> d!13353 (= c!8691 lt!27086)))

(declare-fun containsKey!131 (List!1433 (_ BitVec 64)) Bool)

(assert (=> d!13353 (= lt!27086 (containsKey!131 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13353 (= (contains!690 lt!26956 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27089)))

(declare-fun b!64000 () Bool)

(declare-fun lt!27088 () Unit!1748)

(assert (=> b!64000 (= e!41971 lt!27088)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!79 (List!1433 (_ BitVec 64)) Unit!1748)

(assert (=> b!64000 (= lt!27088 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-datatypes ((Option!134 0))(
  ( (Some!133 (v!2441 V!2873)) (None!132) )
))
(declare-fun isDefined!80 (Option!134) Bool)

(declare-fun getValueByKey!128 (List!1433 (_ BitVec 64)) Option!134)

(assert (=> b!64000 (isDefined!80 (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64001 () Bool)

(declare-fun Unit!1760 () Unit!1748)

(assert (=> b!64001 (= e!41971 Unit!1760)))

(declare-fun b!64002 () Bool)

(assert (=> b!64002 (= e!41970 (isDefined!80 (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13353 c!8691) b!64000))

(assert (= (and d!13353 (not c!8691)) b!64001))

(assert (= (and d!13353 (not res!34953)) b!64002))

(assert (=> d!13353 m!58361))

(declare-fun m!58575 () Bool)

(assert (=> d!13353 m!58575))

(assert (=> b!64000 m!58361))

(declare-fun m!58577 () Bool)

(assert (=> b!64000 m!58577))

(assert (=> b!64000 m!58361))

(declare-fun m!58579 () Bool)

(assert (=> b!64000 m!58579))

(assert (=> b!64000 m!58579))

(declare-fun m!58581 () Bool)

(assert (=> b!64000 m!58581))

(assert (=> b!64002 m!58361))

(assert (=> b!64002 m!58579))

(assert (=> b!64002 m!58579))

(assert (=> b!64002 m!58581))

(assert (=> b!63780 d!13353))

(declare-fun b!64087 () Bool)

(declare-fun lt!27144 () Unit!1748)

(declare-fun lt!27149 () Unit!1748)

(assert (=> b!64087 (= lt!27144 lt!27149)))

(declare-fun call!5146 () ListLongMap!1355)

(declare-fun call!5152 () ListLongMap!1355)

(assert (=> b!64087 (= call!5146 call!5152)))

(declare-fun lt!27166 () (_ BitVec 32))

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!18 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1748)

(assert (=> b!64087 (= lt!27149 (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27166 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64087 (= lt!27166 (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000001))))

(declare-fun e!42016 () tuple2!2040)

(assert (=> b!64087 (= e!42016 (tuple2!2041 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6024 newMap!16) (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (_size!369 newMap!16) (_keys!3744 newMap!16) (_values!2091 newMap!16) (_vacant!369 newMap!16))))))

(declare-fun b!64088 () Bool)

(declare-fun c!8723 () Bool)

(declare-fun lt!27165 () SeekEntryResult!224)

(assert (=> b!64088 (= c!8723 ((_ is MissingVacant!224) lt!27165))))

(declare-fun e!42020 () Bool)

(declare-fun e!42027 () Bool)

(assert (=> b!64088 (= e!42020 e!42027)))

(declare-fun b!64089 () Bool)

(declare-fun res!34990 () Bool)

(declare-fun e!42031 () Bool)

(assert (=> b!64089 (=> (not res!34990) (not e!42031))))

(assert (=> b!64089 (= res!34990 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3022 lt!27165)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64090 () Bool)

(declare-fun c!8724 () Bool)

(declare-fun lt!27153 () SeekEntryResult!224)

(assert (=> b!64090 (= c!8724 ((_ is MissingVacant!224) lt!27153))))

(declare-fun e!42021 () tuple2!2040)

(declare-fun e!42023 () tuple2!2040)

(assert (=> b!64090 (= e!42021 e!42023)))

(declare-fun bm!5127 () Bool)

(declare-fun call!5131 () Unit!1748)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1748)

(assert (=> bm!5127 (= call!5131 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(declare-fun b!64091 () Bool)

(declare-fun e!42036 () ListLongMap!1355)

(declare-fun call!5140 () ListLongMap!1355)

(assert (=> b!64091 (= e!42036 call!5140)))

(declare-fun b!64092 () Bool)

(declare-fun e!42017 () ListLongMap!1355)

(assert (=> b!64092 (= e!42017 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun c!8727 () Bool)

(declare-fun bm!5128 () Bool)

(declare-fun call!5138 () ListLongMap!1355)

(declare-fun c!8729 () Bool)

(assert (=> bm!5128 (= call!5138 (getCurrentListMap!393 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64093 () Bool)

(declare-fun e!42033 () Unit!1748)

(declare-fun Unit!1761 () Unit!1748)

(assert (=> b!64093 (= e!42033 Unit!1761)))

(declare-fun lt!27152 () Unit!1748)

(assert (=> b!64093 (= lt!27152 call!5131)))

(declare-fun lt!27169 () SeekEntryResult!224)

(declare-fun call!5145 () SeekEntryResult!224)

(assert (=> b!64093 (= lt!27169 call!5145)))

(declare-fun res!34994 () Bool)

(assert (=> b!64093 (= res!34994 ((_ is Found!224) lt!27169))))

(declare-fun e!42032 () Bool)

(assert (=> b!64093 (=> (not res!34994) (not e!42032))))

(assert (=> b!64093 e!42032))

(declare-fun lt!27150 () Unit!1748)

(assert (=> b!64093 (= lt!27150 lt!27152)))

(assert (=> b!64093 false))

(declare-fun bm!5129 () Bool)

(declare-fun call!5150 () Unit!1748)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1748)

(assert (=> bm!5129 (= call!5150 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(declare-fun b!64094 () Bool)

(declare-fun lt!27160 () Unit!1748)

(declare-fun lt!27168 () Unit!1748)

(assert (=> b!64094 (= lt!27160 lt!27168)))

(declare-fun call!5153 () ListLongMap!1355)

(assert (=> b!64094 (contains!690 call!5153 (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153)))))

(declare-fun lt!27163 () array!3759)

(declare-fun lemmaValidKeyInArrayIsInListMap!78 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) Unit!1748)

(assert (=> b!64094 (= lt!27168 (lemmaValidKeyInArrayIsInListMap!78 (_keys!3744 newMap!16) lt!27163 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64094 (= lt!27163 (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))))))

(declare-fun lt!27155 () Unit!1748)

(declare-fun lt!27170 () Unit!1748)

(assert (=> b!64094 (= lt!27155 lt!27170)))

(declare-fun call!5143 () ListLongMap!1355)

(declare-fun call!5139 () ListLongMap!1355)

(assert (=> b!64094 (= call!5143 call!5139)))

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1748)

(assert (=> b!64094 (= lt!27170 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27159 () Unit!1748)

(declare-fun e!42018 () Unit!1748)

(assert (=> b!64094 (= lt!27159 e!42018)))

(declare-fun c!8722 () Bool)

(declare-fun call!5136 () Bool)

(assert (=> b!64094 (= c!8722 call!5136)))

(declare-fun e!42019 () tuple2!2040)

(assert (=> b!64094 (= e!42019 (tuple2!2041 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (_size!369 newMap!16) (_keys!3744 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))) (_vacant!369 newMap!16))))))

(declare-fun b!64095 () Bool)

(declare-fun lt!27156 () Unit!1748)

(assert (=> b!64095 (= e!42033 lt!27156)))

(assert (=> b!64095 (= lt!27156 call!5150)))

(declare-fun lt!27147 () SeekEntryResult!224)

(assert (=> b!64095 (= lt!27147 call!5145)))

(declare-fun c!8730 () Bool)

(assert (=> b!64095 (= c!8730 ((_ is MissingZero!224) lt!27147))))

(declare-fun e!42028 () Bool)

(assert (=> b!64095 e!42028))

(declare-fun b!64096 () Bool)

(declare-fun lt!27148 () tuple2!2040)

(declare-fun call!5149 () tuple2!2040)

(assert (=> b!64096 (= lt!27148 call!5149)))

(assert (=> b!64096 (= e!42019 (tuple2!2041 (_1!1031 lt!27148) (_2!1031 lt!27148)))))

(declare-fun b!64097 () Bool)

(declare-fun e!42030 () Bool)

(declare-fun e!42024 () Bool)

(assert (=> b!64097 (= e!42030 e!42024)))

(declare-fun res!34985 () Bool)

(declare-fun call!5132 () Bool)

(assert (=> b!64097 (= res!34985 call!5132)))

(assert (=> b!64097 (=> (not res!34985) (not e!42024))))

(declare-fun bm!5130 () Bool)

(declare-fun call!5137 () SeekEntryResult!224)

(assert (=> bm!5130 (= call!5145 call!5137)))

(declare-fun b!64098 () Bool)

(declare-fun res!34989 () Bool)

(declare-fun call!5130 () Bool)

(assert (=> b!64098 (= res!34989 call!5130)))

(assert (=> b!64098 (=> (not res!34989) (not e!42032))))

(declare-fun bm!5131 () Bool)

(declare-fun call!5151 () Bool)

(declare-fun call!5134 () Bool)

(assert (=> bm!5131 (= call!5151 call!5134)))

(declare-fun bm!5132 () Bool)

(declare-fun call!5144 () ListLongMap!1355)

(declare-fun lt!27164 () tuple2!2040)

(assert (=> bm!5132 (= call!5144 (map!1121 (_2!1031 lt!27164)))))

(declare-fun b!64099 () Bool)

(assert (=> b!64099 (= e!42023 e!42019)))

(declare-fun c!8732 () Bool)

(assert (=> b!64099 (= c!8732 ((_ is MissingZero!224) lt!27153))))

(declare-fun b!64100 () Bool)

(declare-fun lt!27154 () Unit!1748)

(declare-fun lt!27158 () Unit!1748)

(assert (=> b!64100 (= lt!27154 lt!27158)))

(assert (=> b!64100 (= call!5146 call!5152)))

(declare-fun lt!27167 () (_ BitVec 32))

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1748)

(assert (=> b!64100 (= lt!27158 (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27167 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64100 (= lt!27167 (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000010))))

(assert (=> b!64100 (= e!42016 (tuple2!2041 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6024 newMap!16) (bvor (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) (zeroValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_size!369 newMap!16) (_keys!3744 newMap!16) (_values!2091 newMap!16) (_vacant!369 newMap!16))))))

(declare-fun b!64101 () Bool)

(declare-fun res!34987 () Bool)

(assert (=> b!64101 (= res!34987 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3025 lt!27147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64101 (=> (not res!34987) (not e!42024))))

(declare-fun b!64102 () Bool)

(declare-fun res!34984 () Bool)

(declare-fun e!42022 () Bool)

(assert (=> b!64102 (=> (not res!34984) (not e!42022))))

(assert (=> b!64102 (= res!34984 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3022 lt!27147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64103 () Bool)

(assert (=> b!64103 (= e!42024 (not call!5151))))

(declare-fun bm!5133 () Bool)

(declare-fun call!5133 () Bool)

(declare-fun call!5147 () Bool)

(assert (=> bm!5133 (= call!5133 call!5147)))

(declare-fun b!64104 () Bool)

(declare-fun lt!27157 () tuple2!2040)

(assert (=> b!64104 (= e!42023 (tuple2!2041 (_1!1031 lt!27157) (_2!1031 lt!27157)))))

(assert (=> b!64104 (= lt!27157 call!5149)))

(declare-fun b!64105 () Bool)

(declare-fun res!34986 () Bool)

(assert (=> b!64105 (= res!34986 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3025 lt!27165)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42025 () Bool)

(assert (=> b!64105 (=> (not res!34986) (not e!42025))))

(declare-fun bm!5134 () Bool)

(assert (=> bm!5134 (= call!5130 call!5147)))

(declare-fun b!64106 () Bool)

(declare-fun res!34995 () Bool)

(assert (=> b!64106 (=> (not res!34995) (not e!42031))))

(declare-fun call!5148 () Bool)

(assert (=> b!64106 (= res!34995 call!5148)))

(assert (=> b!64106 (= e!42020 e!42031)))

(declare-fun b!64107 () Bool)

(declare-fun e!42035 () Bool)

(declare-fun e!42034 () Bool)

(assert (=> b!64107 (= e!42035 e!42034)))

(declare-fun res!34991 () Bool)

(assert (=> b!64107 (= res!34991 (contains!690 call!5144 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64107 (=> (not res!34991) (not e!42034))))

(declare-fun bm!5135 () Bool)

(assert (=> bm!5135 (= call!5140 call!5138)))

(declare-fun lt!27151 () SeekEntryResult!224)

(declare-fun e!42029 () Bool)

(declare-fun b!64108 () Bool)

(assert (=> b!64108 (= e!42029 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27151)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64109 () Bool)

(assert (=> b!64109 (= e!42030 ((_ is Undefined!224) lt!27147))))

(declare-fun b!64110 () Bool)

(assert (=> b!64110 (= e!42036 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64111 () Bool)

(assert (=> b!64111 (= e!42017 call!5139)))

(declare-fun bm!5136 () Bool)

(assert (=> bm!5136 (= call!5134 (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun bm!5137 () Bool)

(assert (=> bm!5137 (= call!5146 call!5143)))

(declare-fun bm!5138 () Bool)

(declare-fun updateHelperNewKey!18 (LongMapFixedSize!640 (_ BitVec 64) V!2873 (_ BitVec 32)) tuple2!2040)

(assert (=> bm!5138 (= call!5149 (updateHelperNewKey!18 newMap!16 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153))))))

(declare-fun b!64112 () Bool)

(assert (=> b!64112 (= e!42032 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27169)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun bm!5139 () Bool)

(declare-fun call!5142 () Bool)

(assert (=> bm!5139 (= call!5142 call!5134)))

(declare-fun bm!5140 () Bool)

(assert (=> bm!5140 (= call!5137 (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun b!64113 () Bool)

(declare-fun Unit!1762 () Unit!1748)

(assert (=> b!64113 (= e!42018 Unit!1762)))

(declare-fun lt!27161 () Unit!1748)

(assert (=> b!64113 (= lt!27161 call!5150)))

(declare-fun call!5141 () SeekEntryResult!224)

(assert (=> b!64113 (= lt!27165 call!5141)))

(declare-fun c!8720 () Bool)

(assert (=> b!64113 (= c!8720 ((_ is MissingZero!224) lt!27165))))

(assert (=> b!64113 e!42020))

(declare-fun lt!27162 () Unit!1748)

(assert (=> b!64113 (= lt!27162 lt!27161)))

(assert (=> b!64113 false))

(declare-fun d!13355 () Bool)

(declare-fun e!42037 () Bool)

(assert (=> d!13355 e!42037))

(declare-fun res!34992 () Bool)

(assert (=> d!13355 (=> (not res!34992) (not e!42037))))

(assert (=> d!13355 (= res!34992 (valid!274 (_2!1031 lt!27164)))))

(declare-fun e!42026 () tuple2!2040)

(assert (=> d!13355 (= lt!27164 e!42026)))

(assert (=> d!13355 (= c!8727 (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvneg (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13355 (valid!274 newMap!16)))

(assert (=> d!13355 (= (update!92 newMap!16 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!27164)))

(declare-fun bm!5141 () Bool)

(declare-fun c!8721 () Bool)

(assert (=> bm!5141 (= c!8721 c!8729)))

(assert (=> bm!5141 (= call!5136 (contains!690 e!42017 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64114 () Bool)

(declare-fun res!34988 () Bool)

(assert (=> b!64114 (= res!34988 call!5133)))

(assert (=> b!64114 (=> (not res!34988) (not e!42029))))

(declare-fun b!64115 () Bool)

(declare-fun res!34993 () Bool)

(assert (=> b!64115 (=> (not res!34993) (not e!42022))))

(assert (=> b!64115 (= res!34993 call!5132)))

(assert (=> b!64115 (= e!42028 e!42022)))

(declare-fun b!64116 () Bool)

(assert (=> b!64116 (= e!42026 e!42021)))

(assert (=> b!64116 (= lt!27153 (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(assert (=> b!64116 (= c!8729 ((_ is Undefined!224) lt!27153))))

(declare-fun b!64117 () Bool)

(declare-fun call!5135 () ListLongMap!1355)

(assert (=> b!64117 (= e!42034 (= call!5144 (+!83 call!5135 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64118 () Bool)

(assert (=> b!64118 (= e!42025 (not call!5142))))

(declare-fun b!64119 () Bool)

(declare-fun lt!27146 () Unit!1748)

(assert (=> b!64119 (= e!42018 lt!27146)))

(assert (=> b!64119 (= lt!27146 call!5131)))

(assert (=> b!64119 (= lt!27151 call!5141)))

(declare-fun res!34982 () Bool)

(assert (=> b!64119 (= res!34982 ((_ is Found!224) lt!27151))))

(assert (=> b!64119 (=> (not res!34982) (not e!42029))))

(assert (=> b!64119 e!42029))

(declare-fun b!64120 () Bool)

(assert (=> b!64120 (= e!42037 e!42035)))

(declare-fun c!8726 () Bool)

(assert (=> b!64120 (= c!8726 (_1!1031 lt!27164))))

(declare-fun bm!5142 () Bool)

(assert (=> bm!5142 (= call!5135 (map!1121 newMap!16))))

(declare-fun bm!5143 () Bool)

(assert (=> bm!5143 (= call!5148 call!5133)))

(declare-fun c!8731 () Bool)

(declare-fun bm!5144 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!5144 (= call!5147 (inRange!0 (ite c!8729 (ite c!8731 (index!3023 lt!27169) (ite c!8730 (index!3022 lt!27147) (index!3025 lt!27147))) (ite c!8722 (index!3023 lt!27151) (ite c!8720 (index!3022 lt!27165) (index!3025 lt!27165)))) (mask!6024 newMap!16)))))

(declare-fun b!64121 () Bool)

(assert (=> b!64121 (= e!42035 (= call!5144 call!5135))))

(declare-fun bm!5145 () Bool)

(assert (=> bm!5145 (= call!5132 call!5130)))

(declare-fun bm!5146 () Bool)

(declare-fun c!8725 () Bool)

(assert (=> bm!5146 (= call!5143 (+!83 e!42036 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!8733 () Bool)

(assert (=> bm!5146 (= c!8733 c!8727)))

(declare-fun bm!5147 () Bool)

(assert (=> bm!5147 (= call!5139 call!5138)))

(declare-fun b!64122 () Bool)

(assert (=> b!64122 (= e!42031 (not call!5142))))

(declare-fun bm!5148 () Bool)

(assert (=> bm!5148 (= call!5141 call!5137)))

(declare-fun bm!5149 () Bool)

(assert (=> bm!5149 (= call!5152 call!5153)))

(declare-fun b!64123 () Bool)

(declare-fun lt!27145 () Unit!1748)

(assert (=> b!64123 (= lt!27145 e!42033)))

(assert (=> b!64123 (= c!8731 call!5136)))

(assert (=> b!64123 (= e!42021 (tuple2!2041 false newMap!16))))

(declare-fun b!64124 () Bool)

(assert (=> b!64124 (= e!42022 (not call!5151))))

(declare-fun b!64125 () Bool)

(assert (=> b!64125 (= e!42027 e!42025)))

(declare-fun res!34983 () Bool)

(assert (=> b!64125 (= res!34983 call!5148)))

(assert (=> b!64125 (=> (not res!34983) (not e!42025))))

(declare-fun b!64126 () Bool)

(assert (=> b!64126 (= e!42027 ((_ is Undefined!224) lt!27165))))

(declare-fun b!64127 () Bool)

(declare-fun c!8728 () Bool)

(assert (=> b!64127 (= c!8728 ((_ is MissingVacant!224) lt!27147))))

(assert (=> b!64127 (= e!42028 e!42030)))

(declare-fun bm!5150 () Bool)

(assert (=> bm!5150 (= call!5153 (getCurrentListMap!393 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64128 () Bool)

(assert (=> b!64128 (= e!42026 e!42016)))

(assert (=> b!64128 (= c!8725 (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!13355 c!8727) b!64128))

(assert (= (and d!13355 (not c!8727)) b!64116))

(assert (= (and b!64128 c!8725) b!64087))

(assert (= (and b!64128 (not c!8725)) b!64100))

(assert (= (or b!64087 b!64100) bm!5149))

(assert (= (or b!64087 b!64100) bm!5135))

(assert (= (or b!64087 b!64100) bm!5137))

(assert (= (and b!64116 c!8729) b!64123))

(assert (= (and b!64116 (not c!8729)) b!64090))

(assert (= (and b!64123 c!8731) b!64093))

(assert (= (and b!64123 (not c!8731)) b!64095))

(assert (= (and b!64093 res!34994) b!64098))

(assert (= (and b!64098 res!34989) b!64112))

(assert (= (and b!64095 c!8730) b!64115))

(assert (= (and b!64095 (not c!8730)) b!64127))

(assert (= (and b!64115 res!34993) b!64102))

(assert (= (and b!64102 res!34984) b!64124))

(assert (= (and b!64127 c!8728) b!64097))

(assert (= (and b!64127 (not c!8728)) b!64109))

(assert (= (and b!64097 res!34985) b!64101))

(assert (= (and b!64101 res!34987) b!64103))

(assert (= (or b!64115 b!64097) bm!5145))

(assert (= (or b!64124 b!64103) bm!5131))

(assert (= (or b!64098 bm!5145) bm!5134))

(assert (= (or b!64093 b!64095) bm!5130))

(assert (= (and b!64090 c!8724) b!64104))

(assert (= (and b!64090 (not c!8724)) b!64099))

(assert (= (and b!64099 c!8732) b!64096))

(assert (= (and b!64099 (not c!8732)) b!64094))

(assert (= (and b!64094 c!8722) b!64119))

(assert (= (and b!64094 (not c!8722)) b!64113))

(assert (= (and b!64119 res!34982) b!64114))

(assert (= (and b!64114 res!34988) b!64108))

(assert (= (and b!64113 c!8720) b!64106))

(assert (= (and b!64113 (not c!8720)) b!64088))

(assert (= (and b!64106 res!34995) b!64089))

(assert (= (and b!64089 res!34990) b!64122))

(assert (= (and b!64088 c!8723) b!64125))

(assert (= (and b!64088 (not c!8723)) b!64126))

(assert (= (and b!64125 res!34983) b!64105))

(assert (= (and b!64105 res!34986) b!64118))

(assert (= (or b!64106 b!64125) bm!5143))

(assert (= (or b!64122 b!64118) bm!5139))

(assert (= (or b!64114 bm!5143) bm!5133))

(assert (= (or b!64119 b!64113) bm!5148))

(assert (= (or b!64104 b!64096) bm!5138))

(assert (= (or b!64095 b!64113) bm!5129))

(assert (= (or b!64123 b!64094) bm!5147))

(assert (= (or b!64093 b!64119) bm!5127))

(assert (= (or bm!5134 bm!5133) bm!5144))

(assert (= (or bm!5131 bm!5139) bm!5136))

(assert (= (or bm!5130 bm!5148) bm!5140))

(assert (= (or b!64123 b!64094) bm!5141))

(assert (= (and bm!5141 c!8721) b!64111))

(assert (= (and bm!5141 (not c!8721)) b!64092))

(assert (= (or bm!5135 bm!5147) bm!5128))

(assert (= (or bm!5149 b!64094) bm!5150))

(assert (= (or bm!5137 b!64094) bm!5146))

(assert (= (and bm!5146 c!8733) b!64091))

(assert (= (and bm!5146 (not c!8733)) b!64110))

(assert (= (and d!13355 res!34992) b!64120))

(assert (= (and b!64120 c!8726) b!64107))

(assert (= (and b!64120 (not c!8726)) b!64121))

(assert (= (and b!64107 res!34991) b!64117))

(assert (= (or b!64107 b!64117 b!64121) bm!5132))

(assert (= (or b!64117 b!64121) bm!5142))

(assert (=> b!64092 m!58507))

(declare-fun m!58583 () Bool)

(assert (=> b!64117 m!58583))

(declare-fun m!58585 () Bool)

(assert (=> b!64105 m!58585))

(assert (=> b!64100 m!58375))

(declare-fun m!58587 () Bool)

(assert (=> b!64100 m!58587))

(assert (=> bm!5142 m!58399))

(declare-fun m!58589 () Bool)

(assert (=> b!64101 m!58589))

(declare-fun m!58591 () Bool)

(assert (=> b!64094 m!58591))

(assert (=> b!64094 m!58361))

(assert (=> b!64094 m!58375))

(declare-fun m!58593 () Bool)

(assert (=> b!64094 m!58593))

(declare-fun m!58595 () Bool)

(assert (=> b!64094 m!58595))

(assert (=> b!64094 m!58595))

(declare-fun m!58597 () Bool)

(assert (=> b!64094 m!58597))

(declare-fun m!58599 () Bool)

(assert (=> b!64094 m!58599))

(assert (=> bm!5140 m!58361))

(declare-fun m!58601 () Bool)

(assert (=> bm!5140 m!58601))

(declare-fun m!58603 () Bool)

(assert (=> bm!5144 m!58603))

(assert (=> b!64116 m!58361))

(assert (=> b!64116 m!58601))

(assert (=> bm!5141 m!58361))

(declare-fun m!58605 () Bool)

(assert (=> bm!5141 m!58605))

(declare-fun m!58607 () Bool)

(assert (=> b!64102 m!58607))

(declare-fun m!58609 () Bool)

(assert (=> b!64108 m!58609))

(assert (=> b!64087 m!58375))

(declare-fun m!58611 () Bool)

(assert (=> b!64087 m!58611))

(declare-fun m!58613 () Bool)

(assert (=> d!13355 m!58613))

(assert (=> d!13355 m!58381))

(declare-fun m!58615 () Bool)

(assert (=> bm!5146 m!58615))

(declare-fun m!58617 () Bool)

(assert (=> bm!5150 m!58617))

(assert (=> b!64110 m!58507))

(declare-fun m!58619 () Bool)

(assert (=> bm!5132 m!58619))

(assert (=> bm!5129 m!58361))

(declare-fun m!58621 () Bool)

(assert (=> bm!5129 m!58621))

(assert (=> bm!5128 m!58591))

(declare-fun m!58623 () Bool)

(assert (=> bm!5128 m!58623))

(assert (=> bm!5138 m!58361))

(assert (=> bm!5138 m!58375))

(declare-fun m!58625 () Bool)

(assert (=> bm!5138 m!58625))

(declare-fun m!58627 () Bool)

(assert (=> b!64112 m!58627))

(assert (=> bm!5136 m!58361))

(declare-fun m!58629 () Bool)

(assert (=> bm!5136 m!58629))

(assert (=> bm!5127 m!58361))

(declare-fun m!58631 () Bool)

(assert (=> bm!5127 m!58631))

(declare-fun m!58633 () Bool)

(assert (=> b!64089 m!58633))

(assert (=> b!64107 m!58361))

(declare-fun m!58635 () Bool)

(assert (=> b!64107 m!58635))

(assert (=> b!63780 d!13355))

(declare-fun d!13357 () Bool)

(declare-fun c!8736 () Bool)

(assert (=> d!13357 (= c!8736 ((_ is ValueCellFull!866) (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42040 () V!2873)

(assert (=> d!13357 (= (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42040)))

(declare-fun b!64133 () Bool)

(declare-fun get!1097 (ValueCell!866 V!2873) V!2873)

(assert (=> b!64133 (= e!42040 (get!1097 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64134 () Bool)

(declare-fun get!1098 (ValueCell!866 V!2873) V!2873)

(assert (=> b!64134 (= e!42040 (get!1098 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13357 c!8736) b!64133))

(assert (= (and d!13357 (not c!8736)) b!64134))

(assert (=> b!64133 m!58371))

(assert (=> b!64133 m!58373))

(declare-fun m!58637 () Bool)

(assert (=> b!64133 m!58637))

(assert (=> b!64134 m!58371))

(assert (=> b!64134 m!58373))

(declare-fun m!58639 () Bool)

(assert (=> b!64134 m!58639))

(assert (=> b!63780 d!13357))

(declare-fun d!13359 () Bool)

(assert (=> d!13359 (not (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun lt!27173 () Unit!1748)

(declare-fun choose!68 (array!3757 (_ BitVec 32) (_ BitVec 64) List!1434) Unit!1748)

(assert (=> d!13359 (= lt!27173 (choose!68 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431)))))

(assert (=> d!13359 (bvslt (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13359 (= (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431)) lt!27173)))

(declare-fun bs!2801 () Bool)

(assert (= bs!2801 d!13359))

(assert (=> bs!2801 m!58361))

(assert (=> bs!2801 m!58365))

(assert (=> bs!2801 m!58361))

(declare-fun m!58641 () Bool)

(assert (=> bs!2801 m!58641))

(assert (=> b!63766 d!13359))

(declare-fun d!13361 () Bool)

(assert (=> d!13361 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1431)))

(declare-fun lt!27176 () Unit!1748)

(declare-fun choose!39 (array!3757 (_ BitVec 32) (_ BitVec 32)) Unit!1748)

(assert (=> d!13361 (= lt!27176 (choose!39 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355))))

(assert (=> d!13361 (bvslt (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b01111111111111111111111111111111)))

(assert (=> d!13361 (= (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355) lt!27176)))

(declare-fun bs!2802 () Bool)

(assert (= bs!2802 d!13361))

(assert (=> bs!2802 m!58359))

(declare-fun m!58643 () Bool)

(assert (=> bs!2802 m!58643))

(assert (=> b!63766 d!13361))

(declare-fun d!13363 () Bool)

(declare-fun res!35000 () Bool)

(declare-fun e!42045 () Bool)

(assert (=> d!13363 (=> res!35000 e!42045)))

(assert (=> d!13363 (= res!35000 (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13363 (= (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)) e!42045)))

(declare-fun b!64139 () Bool)

(declare-fun e!42046 () Bool)

(assert (=> b!64139 (= e!42045 e!42046)))

(declare-fun res!35001 () Bool)

(assert (=> b!64139 (=> (not res!35001) (not e!42046))))

(assert (=> b!64139 (= res!35001 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64140 () Bool)

(assert (=> b!64140 (= e!42046 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)))))

(assert (= (and d!13363 (not res!35000)) b!64139))

(assert (= (and b!64139 res!35001) b!64140))

(assert (=> d!13363 m!58511))

(assert (=> b!64140 m!58361))

(declare-fun m!58645 () Bool)

(assert (=> b!64140 m!58645))

(assert (=> b!63766 d!13363))

(declare-fun d!13365 () Bool)

(declare-fun e!42049 () Bool)

(assert (=> d!13365 e!42049))

(declare-fun c!8739 () Bool)

(assert (=> d!13365 (= c!8739 (and (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27179 () Unit!1748)

(declare-fun choose!350 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1748)

(assert (=> d!13365 (= lt!27179 (choose!350 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(assert (=> d!13365 (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13365 (= (lemmaListMapContainsThenArrayContainsFrom!29 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) lt!27179)))

(declare-fun b!64145 () Bool)

(assert (=> b!64145 (= e!42049 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64146 () Bool)

(assert (=> b!64146 (= e!42049 (ite (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13365 c!8739) b!64145))

(assert (= (and d!13365 (not c!8739)) b!64146))

(assert (=> d!13365 m!58361))

(declare-fun m!58647 () Bool)

(assert (=> d!13365 m!58647))

(assert (=> d!13365 m!58389))

(assert (=> b!64145 m!58361))

(assert (=> b!64145 m!58365))

(assert (=> b!63766 d!13365))

(declare-fun b!64157 () Bool)

(declare-fun e!42061 () Bool)

(declare-fun e!42059 () Bool)

(assert (=> b!64157 (= e!42061 e!42059)))

(declare-fun c!8742 () Bool)

(assert (=> b!64157 (= c!8742 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64158 () Bool)

(declare-fun call!5156 () Bool)

(assert (=> b!64158 (= e!42059 call!5156)))

(declare-fun d!13367 () Bool)

(declare-fun res!35010 () Bool)

(declare-fun e!42058 () Bool)

(assert (=> d!13367 (=> res!35010 e!42058)))

(assert (=> d!13367 (= res!35010 (bvsge from!355 (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13367 (= (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1431) e!42058)))

(declare-fun b!64159 () Bool)

(assert (=> b!64159 (= e!42058 e!42061)))

(declare-fun res!35008 () Bool)

(assert (=> b!64159 (=> (not res!35008) (not e!42061))))

(declare-fun e!42060 () Bool)

(assert (=> b!64159 (= res!35008 (not e!42060))))

(declare-fun res!35009 () Bool)

(assert (=> b!64159 (=> (not res!35009) (not e!42060))))

(assert (=> b!64159 (= res!35009 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64160 () Bool)

(declare-fun contains!692 (List!1434 (_ BitVec 64)) Bool)

(assert (=> b!64160 (= e!42060 (contains!692 Nil!1431 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64161 () Bool)

(assert (=> b!64161 (= e!42059 call!5156)))

(declare-fun bm!5153 () Bool)

(assert (=> bm!5153 (= call!5156 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8742 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431) Nil!1431)))))

(assert (= (and d!13367 (not res!35010)) b!64159))

(assert (= (and b!64159 res!35009) b!64160))

(assert (= (and b!64159 res!35008) b!64157))

(assert (= (and b!64157 c!8742) b!64161))

(assert (= (and b!64157 (not c!8742)) b!64158))

(assert (= (or b!64161 b!64158) bm!5153))

(assert (=> b!64157 m!58361))

(assert (=> b!64157 m!58361))

(declare-fun m!58649 () Bool)

(assert (=> b!64157 m!58649))

(assert (=> b!64159 m!58361))

(assert (=> b!64159 m!58361))

(assert (=> b!64159 m!58649))

(assert (=> b!64160 m!58361))

(assert (=> b!64160 m!58361))

(declare-fun m!58651 () Bool)

(assert (=> b!64160 m!58651))

(assert (=> bm!5153 m!58361))

(declare-fun m!58653 () Bool)

(assert (=> bm!5153 m!58653))

(assert (=> b!63766 d!13367))

(declare-fun mapNonEmpty!2979 () Bool)

(declare-fun mapRes!2979 () Bool)

(declare-fun tp!8181 () Bool)

(declare-fun e!42067 () Bool)

(assert (=> mapNonEmpty!2979 (= mapRes!2979 (and tp!8181 e!42067))))

(declare-fun mapValue!2979 () ValueCell!866)

(declare-fun mapKey!2979 () (_ BitVec 32))

(declare-fun mapRest!2979 () (Array (_ BitVec 32) ValueCell!866))

(assert (=> mapNonEmpty!2979 (= mapRest!2963 (store mapRest!2979 mapKey!2979 mapValue!2979))))

(declare-fun b!64168 () Bool)

(assert (=> b!64168 (= e!42067 tp_is_empty!2419)))

(declare-fun mapIsEmpty!2979 () Bool)

(assert (=> mapIsEmpty!2979 mapRes!2979))

(declare-fun b!64169 () Bool)

(declare-fun e!42066 () Bool)

(assert (=> b!64169 (= e!42066 tp_is_empty!2419)))

(declare-fun condMapEmpty!2979 () Bool)

(declare-fun mapDefault!2979 () ValueCell!866)

(assert (=> mapNonEmpty!2963 (= condMapEmpty!2979 (= mapRest!2963 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2979)))))

(assert (=> mapNonEmpty!2963 (= tp!8151 (and e!42066 mapRes!2979))))

(assert (= (and mapNonEmpty!2963 condMapEmpty!2979) mapIsEmpty!2979))

(assert (= (and mapNonEmpty!2963 (not condMapEmpty!2979)) mapNonEmpty!2979))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!866) mapValue!2979)) b!64168))

(assert (= (and mapNonEmpty!2963 ((_ is ValueCellFull!866) mapDefault!2979)) b!64169))

(declare-fun m!58655 () Bool)

(assert (=> mapNonEmpty!2979 m!58655))

(declare-fun mapNonEmpty!2980 () Bool)

(declare-fun mapRes!2980 () Bool)

(declare-fun tp!8182 () Bool)

(declare-fun e!42069 () Bool)

(assert (=> mapNonEmpty!2980 (= mapRes!2980 (and tp!8182 e!42069))))

(declare-fun mapKey!2980 () (_ BitVec 32))

(declare-fun mapRest!2980 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2980 () ValueCell!866)

(assert (=> mapNonEmpty!2980 (= mapRest!2964 (store mapRest!2980 mapKey!2980 mapValue!2980))))

(declare-fun b!64170 () Bool)

(assert (=> b!64170 (= e!42069 tp_is_empty!2419)))

(declare-fun mapIsEmpty!2980 () Bool)

(assert (=> mapIsEmpty!2980 mapRes!2980))

(declare-fun b!64171 () Bool)

(declare-fun e!42068 () Bool)

(assert (=> b!64171 (= e!42068 tp_is_empty!2419)))

(declare-fun condMapEmpty!2980 () Bool)

(declare-fun mapDefault!2980 () ValueCell!866)

(assert (=> mapNonEmpty!2964 (= condMapEmpty!2980 (= mapRest!2964 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2980)))))

(assert (=> mapNonEmpty!2964 (= tp!8152 (and e!42068 mapRes!2980))))

(assert (= (and mapNonEmpty!2964 condMapEmpty!2980) mapIsEmpty!2980))

(assert (= (and mapNonEmpty!2964 (not condMapEmpty!2980)) mapNonEmpty!2980))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!866) mapValue!2980)) b!64170))

(assert (= (and mapNonEmpty!2964 ((_ is ValueCellFull!866) mapDefault!2980)) b!64171))

(declare-fun m!58657 () Bool)

(assert (=> mapNonEmpty!2980 m!58657))

(declare-fun b_lambda!2885 () Bool)

(assert (= b_lambda!2883 (or (and b!63778 b_free!2005) (and b!63776 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))))) b_lambda!2885)))

(check-sat (not d!13365) (not b!64094) b_and!3933 (not b!63979) (not mapNonEmpty!2979) (not mapNonEmpty!2980) (not b!64110) (not b_next!2005) (not b!63971) (not d!13347) (not b!63975) (not d!13349) (not bm!5076) (not b!64157) (not bm!5132) (not b!64134) (not bm!5078) (not b!63920) (not b!64140) (not bm!5074) (not b!64145) (not bm!5153) (not b!64087) (not b!63984) (not bm!5129) (not d!13361) tp_is_empty!2419 (not bm!5057) (not b!63919) (not b!64100) (not b!63992) (not b!63991) (not b_lambda!2881) (not bm!5142) (not b!64092) (not b!63980) (not d!13359) (not b!64000) (not b!64107) (not b_next!2007) (not d!13345) (not b!63993) (not bm!5138) (not b!64159) (not d!13343) (not b!64116) (not bm!5127) (not d!13353) b_and!3935 (not bm!5141) (not bm!5140) (not b!64117) (not bm!5150) (not b!64002) (not bm!5072) (not bm!5128) (not bm!5146) (not bm!5144) (not b!64133) (not b!63966) (not b_lambda!2885) (not bm!5136) (not b!63964) (not b!63968) (not b!64160) (not d!13355))
(check-sat b_and!3933 b_and!3935 (not b_next!2005) (not b_next!2007))
(get-model)

(declare-fun b!64172 () Bool)

(declare-fun e!42070 () Bool)

(declare-fun call!5157 () Bool)

(assert (=> b!64172 (= e!42070 call!5157)))

(declare-fun b!64173 () Bool)

(declare-fun e!42072 () Bool)

(declare-fun e!42071 () Bool)

(assert (=> b!64173 (= e!42072 e!42071)))

(declare-fun c!8743 () Bool)

(assert (=> b!64173 (= c!8743 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5154 () Bool)

(assert (=> bm!5154 (= call!5157 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun b!64174 () Bool)

(assert (=> b!64174 (= e!42071 e!42070)))

(declare-fun lt!27180 () (_ BitVec 64))

(assert (=> b!64174 (= lt!27180 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27181 () Unit!1748)

(assert (=> b!64174 (= lt!27181 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3744 newMap!16) lt!27180 #b00000000000000000000000000000000))))

(assert (=> b!64174 (arrayContainsKey!0 (_keys!3744 newMap!16) lt!27180 #b00000000000000000000000000000000)))

(declare-fun lt!27182 () Unit!1748)

(assert (=> b!64174 (= lt!27182 lt!27181)))

(declare-fun res!35011 () Bool)

(assert (=> b!64174 (= res!35011 (= (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000) (_keys!3744 newMap!16) (mask!6024 newMap!16)) (Found!224 #b00000000000000000000000000000000)))))

(assert (=> b!64174 (=> (not res!35011) (not e!42070))))

(declare-fun b!64175 () Bool)

(assert (=> b!64175 (= e!42071 call!5157)))

(declare-fun d!13369 () Bool)

(declare-fun res!35012 () Bool)

(assert (=> d!13369 (=> res!35012 e!42072)))

(assert (=> d!13369 (= res!35012 (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(assert (=> d!13369 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 newMap!16) (mask!6024 newMap!16)) e!42072)))

(assert (= (and d!13369 (not res!35012)) b!64173))

(assert (= (and b!64173 c!8743) b!64174))

(assert (= (and b!64173 (not c!8743)) b!64175))

(assert (= (and b!64174 res!35011) b!64172))

(assert (= (or b!64172 b!64175) bm!5154))

(declare-fun m!58659 () Bool)

(assert (=> b!64173 m!58659))

(assert (=> b!64173 m!58659))

(declare-fun m!58661 () Bool)

(assert (=> b!64173 m!58661))

(declare-fun m!58663 () Bool)

(assert (=> bm!5154 m!58663))

(assert (=> b!64174 m!58659))

(declare-fun m!58665 () Bool)

(assert (=> b!64174 m!58665))

(declare-fun m!58667 () Bool)

(assert (=> b!64174 m!58667))

(assert (=> b!64174 m!58659))

(declare-fun m!58669 () Bool)

(assert (=> b!64174 m!58669))

(assert (=> b!63992 d!13369))

(declare-fun d!13371 () Bool)

(declare-fun res!35013 () Bool)

(declare-fun e!42073 () Bool)

(assert (=> d!13371 (=> (not res!35013) (not e!42073))))

(assert (=> d!13371 (= res!35013 (simpleValid!45 (_2!1031 lt!27164)))))

(assert (=> d!13371 (= (valid!274 (_2!1031 lt!27164)) e!42073)))

(declare-fun b!64176 () Bool)

(declare-fun res!35014 () Bool)

(assert (=> b!64176 (=> (not res!35014) (not e!42073))))

(assert (=> b!64176 (= res!35014 (= (arrayCountValidKeys!0 (_keys!3744 (_2!1031 lt!27164)) #b00000000000000000000000000000000 (size!2029 (_keys!3744 (_2!1031 lt!27164)))) (_size!369 (_2!1031 lt!27164))))))

(declare-fun b!64177 () Bool)

(declare-fun res!35015 () Bool)

(assert (=> b!64177 (=> (not res!35015) (not e!42073))))

(assert (=> b!64177 (= res!35015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 (_2!1031 lt!27164)) (mask!6024 (_2!1031 lt!27164))))))

(declare-fun b!64178 () Bool)

(assert (=> b!64178 (= e!42073 (arrayNoDuplicates!0 (_keys!3744 (_2!1031 lt!27164)) #b00000000000000000000000000000000 Nil!1431))))

(assert (= (and d!13371 res!35013) b!64176))

(assert (= (and b!64176 res!35014) b!64177))

(assert (= (and b!64177 res!35015) b!64178))

(declare-fun m!58671 () Bool)

(assert (=> d!13371 m!58671))

(declare-fun m!58673 () Bool)

(assert (=> b!64176 m!58673))

(declare-fun m!58675 () Bool)

(assert (=> b!64177 m!58675))

(declare-fun m!58677 () Bool)

(assert (=> b!64178 m!58677))

(assert (=> d!13355 d!13371))

(assert (=> d!13355 d!13349))

(declare-fun d!13373 () Bool)

(assert (=> d!13373 (= (get!1097 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!2434 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64133 d!13373))

(assert (=> d!13361 d!13367))

(declare-fun d!13375 () Bool)

(assert (=> d!13375 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) from!355 Nil!1431)))

(assert (=> d!13375 true))

(declare-fun _$71!81 () Unit!1748)

(assert (=> d!13375 (= (choose!39 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 from!355) _$71!81)))

(declare-fun bs!2803 () Bool)

(assert (= bs!2803 d!13375))

(assert (=> bs!2803 m!58359))

(assert (=> d!13361 d!13375))

(assert (=> b!64145 d!13363))

(declare-fun d!13377 () Bool)

(declare-fun e!42074 () Bool)

(assert (=> d!13377 e!42074))

(declare-fun res!35016 () Bool)

(assert (=> d!13377 (=> res!35016 e!42074)))

(declare-fun lt!27186 () Bool)

(assert (=> d!13377 (= res!35016 (not lt!27186))))

(declare-fun lt!27183 () Bool)

(assert (=> d!13377 (= lt!27186 lt!27183)))

(declare-fun lt!27184 () Unit!1748)

(declare-fun e!42075 () Unit!1748)

(assert (=> d!13377 (= lt!27184 e!42075)))

(declare-fun c!8744 () Bool)

(assert (=> d!13377 (= c!8744 lt!27183)))

(assert (=> d!13377 (= lt!27183 (containsKey!131 (toList!693 call!5153) (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153))))))

(assert (=> d!13377 (= (contains!690 call!5153 (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153))) lt!27186)))

(declare-fun b!64179 () Bool)

(declare-fun lt!27185 () Unit!1748)

(assert (=> b!64179 (= e!42075 lt!27185)))

(assert (=> b!64179 (= lt!27185 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 call!5153) (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153))))))

(assert (=> b!64179 (isDefined!80 (getValueByKey!128 (toList!693 call!5153) (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153))))))

(declare-fun b!64180 () Bool)

(declare-fun Unit!1763 () Unit!1748)

(assert (=> b!64180 (= e!42075 Unit!1763)))

(declare-fun b!64181 () Bool)

(assert (=> b!64181 (= e!42074 (isDefined!80 (getValueByKey!128 (toList!693 call!5153) (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153)))))))

(assert (= (and d!13377 c!8744) b!64179))

(assert (= (and d!13377 (not c!8744)) b!64180))

(assert (= (and d!13377 (not res!35016)) b!64181))

(assert (=> d!13377 m!58595))

(declare-fun m!58679 () Bool)

(assert (=> d!13377 m!58679))

(assert (=> b!64179 m!58595))

(declare-fun m!58681 () Bool)

(assert (=> b!64179 m!58681))

(assert (=> b!64179 m!58595))

(declare-fun m!58683 () Bool)

(assert (=> b!64179 m!58683))

(assert (=> b!64179 m!58683))

(declare-fun m!58685 () Bool)

(assert (=> b!64179 m!58685))

(assert (=> b!64181 m!58595))

(assert (=> b!64181 m!58683))

(assert (=> b!64181 m!58683))

(assert (=> b!64181 m!58685))

(assert (=> b!64094 d!13377))

(declare-fun d!13379 () Bool)

(declare-fun e!42078 () Bool)

(assert (=> d!13379 e!42078))

(declare-fun res!35019 () Bool)

(assert (=> d!13379 (=> (not res!35019) (not e!42078))))

(assert (=> d!13379 (= res!35019 (and (bvsge (index!3023 lt!27153) #b00000000000000000000000000000000) (bvslt (index!3023 lt!27153) (size!2029 (_keys!3744 newMap!16)))))))

(declare-fun lt!27189 () Unit!1748)

(declare-fun choose!351 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) Int) Unit!1748)

(assert (=> d!13379 (= lt!27189 (choose!351 (_keys!3744 newMap!16) lt!27163 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13379 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13379 (= (lemmaValidKeyInArrayIsInListMap!78 (_keys!3744 newMap!16) lt!27163 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (defaultEntry!2108 newMap!16)) lt!27189)))

(declare-fun b!64184 () Bool)

(assert (=> b!64184 (= e!42078 (contains!690 (getCurrentListMap!393 (_keys!3744 newMap!16) lt!27163 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27153))))))

(assert (= (and d!13379 res!35019) b!64184))

(declare-fun m!58687 () Bool)

(assert (=> d!13379 m!58687))

(declare-fun m!58689 () Bool)

(assert (=> d!13379 m!58689))

(declare-fun m!58691 () Bool)

(assert (=> b!64184 m!58691))

(assert (=> b!64184 m!58595))

(assert (=> b!64184 m!58691))

(assert (=> b!64184 m!58595))

(declare-fun m!58693 () Bool)

(assert (=> b!64184 m!58693))

(assert (=> b!64094 d!13379))

(declare-fun d!13381 () Bool)

(declare-fun e!42081 () Bool)

(assert (=> d!13381 e!42081))

(declare-fun res!35022 () Bool)

(assert (=> d!13381 (=> (not res!35022) (not e!42081))))

(assert (=> d!13381 (= res!35022 (and (bvsge (index!3023 lt!27153) #b00000000000000000000000000000000) (bvslt (index!3023 lt!27153) (size!2030 (_values!2091 newMap!16)))))))

(declare-fun lt!27192 () Unit!1748)

(declare-fun choose!352 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1748)

(assert (=> d!13381 (= lt!27192 (choose!352 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13381 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13381 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (index!3023 lt!27153) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)) lt!27192)))

(declare-fun b!64187 () Bool)

(assert (=> b!64187 (= e!42081 (= (+!83 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!393 (_keys!3744 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16))))))

(assert (= (and d!13381 res!35022) b!64187))

(assert (=> d!13381 m!58361))

(assert (=> d!13381 m!58375))

(declare-fun m!58695 () Bool)

(assert (=> d!13381 m!58695))

(assert (=> d!13381 m!58689))

(assert (=> b!64187 m!58507))

(assert (=> b!64187 m!58507))

(declare-fun m!58697 () Bool)

(assert (=> b!64187 m!58697))

(assert (=> b!64187 m!58591))

(declare-fun m!58699 () Bool)

(assert (=> b!64187 m!58699))

(assert (=> b!64094 d!13381))

(declare-fun d!13383 () Bool)

(declare-fun e!42082 () Bool)

(assert (=> d!13383 e!42082))

(declare-fun res!35023 () Bool)

(assert (=> d!13383 (=> res!35023 e!42082)))

(declare-fun lt!27196 () Bool)

(assert (=> d!13383 (= res!35023 (not lt!27196))))

(declare-fun lt!27193 () Bool)

(assert (=> d!13383 (= lt!27196 lt!27193)))

(declare-fun lt!27194 () Unit!1748)

(declare-fun e!42083 () Unit!1748)

(assert (=> d!13383 (= lt!27194 e!42083)))

(declare-fun c!8745 () Bool)

(assert (=> d!13383 (= c!8745 lt!27193)))

(assert (=> d!13383 (= lt!27193 (containsKey!131 (toList!693 lt!27058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13383 (= (contains!690 lt!27058 #b0000000000000000000000000000000000000000000000000000000000000000) lt!27196)))

(declare-fun b!64188 () Bool)

(declare-fun lt!27195 () Unit!1748)

(assert (=> b!64188 (= e!42083 lt!27195)))

(assert (=> b!64188 (= lt!27195 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 lt!27058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64188 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64189 () Bool)

(declare-fun Unit!1764 () Unit!1748)

(assert (=> b!64189 (= e!42083 Unit!1764)))

(declare-fun b!64190 () Bool)

(assert (=> b!64190 (= e!42082 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13383 c!8745) b!64188))

(assert (= (and d!13383 (not c!8745)) b!64189))

(assert (= (and d!13383 (not res!35023)) b!64190))

(declare-fun m!58701 () Bool)

(assert (=> d!13383 m!58701))

(declare-fun m!58703 () Bool)

(assert (=> b!64188 m!58703))

(declare-fun m!58705 () Bool)

(assert (=> b!64188 m!58705))

(assert (=> b!64188 m!58705))

(declare-fun m!58707 () Bool)

(assert (=> b!64188 m!58707))

(assert (=> b!64190 m!58705))

(assert (=> b!64190 m!58705))

(assert (=> b!64190 m!58707))

(assert (=> bm!5076 d!13383))

(declare-fun d!13385 () Bool)

(declare-fun e!42086 () Bool)

(assert (=> d!13385 e!42086))

(declare-fun res!35028 () Bool)

(assert (=> d!13385 (=> (not res!35028) (not e!42086))))

(declare-fun lt!27206 () ListLongMap!1355)

(assert (=> d!13385 (= res!35028 (contains!690 lt!27206 (_1!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lt!27205 () List!1433)

(assert (=> d!13385 (= lt!27206 (ListLongMap!1356 lt!27205))))

(declare-fun lt!27207 () Unit!1748)

(declare-fun lt!27208 () Unit!1748)

(assert (=> d!13385 (= lt!27207 lt!27208)))

(assert (=> d!13385 (= (getValueByKey!128 lt!27205 (_1!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!133 (_2!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!45 (List!1433 (_ BitVec 64) V!2873) Unit!1748)

(assert (=> d!13385 (= lt!27208 (lemmaContainsTupThenGetReturnValue!45 lt!27205 (_1!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun insertStrictlySorted!48 (List!1433 (_ BitVec 64) V!2873) List!1433)

(assert (=> d!13385 (= lt!27205 (insertStrictlySorted!48 (toList!693 e!42036) (_1!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (_2!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!13385 (= (+!83 e!42036 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!27206)))

(declare-fun b!64195 () Bool)

(declare-fun res!35029 () Bool)

(assert (=> b!64195 (=> (not res!35029) (not e!42086))))

(assert (=> b!64195 (= res!35029 (= (getValueByKey!128 (toList!693 lt!27206) (_1!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))) (Some!133 (_2!1030 (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!64196 () Bool)

(declare-fun contains!693 (List!1433 tuple2!2038) Bool)

(assert (=> b!64196 (= e!42086 (contains!693 (toList!693 lt!27206) (ite c!8727 (ite c!8725 (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!13385 res!35028) b!64195))

(assert (= (and b!64195 res!35029) b!64196))

(declare-fun m!58709 () Bool)

(assert (=> d!13385 m!58709))

(declare-fun m!58711 () Bool)

(assert (=> d!13385 m!58711))

(declare-fun m!58713 () Bool)

(assert (=> d!13385 m!58713))

(declare-fun m!58715 () Bool)

(assert (=> d!13385 m!58715))

(declare-fun m!58717 () Bool)

(assert (=> b!64195 m!58717))

(declare-fun m!58719 () Bool)

(assert (=> b!64196 m!58719))

(assert (=> bm!5146 d!13385))

(declare-fun d!13387 () Bool)

(assert (=> d!13387 (= (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!63919 d!13387))

(declare-fun d!13389 () Bool)

(declare-fun get!1099 (Option!134) V!2873)

(assert (=> d!13389 (= (apply!69 lt!27058 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1099 (getValueByKey!128 (toList!693 lt!27058) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2804 () Bool)

(assert (= bs!2804 d!13389))

(assert (=> bs!2804 m!58705))

(assert (=> bs!2804 m!58705))

(declare-fun m!58721 () Bool)

(assert (=> bs!2804 m!58721))

(assert (=> b!63979 d!13389))

(declare-fun d!13391 () Bool)

(declare-fun e!42087 () Bool)

(assert (=> d!13391 e!42087))

(declare-fun res!35030 () Bool)

(assert (=> d!13391 (=> res!35030 e!42087)))

(declare-fun lt!27212 () Bool)

(assert (=> d!13391 (= res!35030 (not lt!27212))))

(declare-fun lt!27209 () Bool)

(assert (=> d!13391 (= lt!27212 lt!27209)))

(declare-fun lt!27210 () Unit!1748)

(declare-fun e!42088 () Unit!1748)

(assert (=> d!13391 (= lt!27210 e!42088)))

(declare-fun c!8746 () Bool)

(assert (=> d!13391 (= c!8746 lt!27209)))

(assert (=> d!13391 (= lt!27209 (containsKey!131 (toList!693 lt!27058) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> d!13391 (= (contains!690 lt!27058 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) lt!27212)))

(declare-fun b!64197 () Bool)

(declare-fun lt!27211 () Unit!1748)

(assert (=> b!64197 (= e!42088 lt!27211)))

(assert (=> b!64197 (= lt!27211 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 lt!27058) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64197 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64198 () Bool)

(declare-fun Unit!1765 () Unit!1748)

(assert (=> b!64198 (= e!42088 Unit!1765)))

(declare-fun b!64199 () Bool)

(assert (=> b!64199 (= e!42087 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(assert (= (and d!13391 c!8746) b!64197))

(assert (= (and d!13391 (not c!8746)) b!64198))

(assert (= (and d!13391 (not res!35030)) b!64199))

(assert (=> d!13391 m!58511))

(declare-fun m!58723 () Bool)

(assert (=> d!13391 m!58723))

(assert (=> b!64197 m!58511))

(declare-fun m!58725 () Bool)

(assert (=> b!64197 m!58725))

(assert (=> b!64197 m!58511))

(declare-fun m!58727 () Bool)

(assert (=> b!64197 m!58727))

(assert (=> b!64197 m!58727))

(declare-fun m!58729 () Bool)

(assert (=> b!64197 m!58729))

(assert (=> b!64199 m!58511))

(assert (=> b!64199 m!58727))

(assert (=> b!64199 m!58727))

(assert (=> b!64199 m!58729))

(assert (=> b!63964 d!13391))

(declare-fun d!13393 () Bool)

(assert (=> d!13393 (= (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (and (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!63966 d!13393))

(declare-fun d!13395 () Bool)

(assert (=> d!13395 (= (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (and (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64157 d!13395))

(declare-fun d!13397 () Bool)

(assert (=> d!13397 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000)))

(declare-fun lt!27215 () Unit!1748)

(declare-fun choose!13 (array!3757 (_ BitVec 64) (_ BitVec 32)) Unit!1748)

(assert (=> d!13397 (= lt!27215 (choose!13 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000))))

(assert (=> d!13397 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!13397 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000) lt!27215)))

(declare-fun bs!2805 () Bool)

(assert (= bs!2805 d!13397))

(assert (=> bs!2805 m!58503))

(declare-fun m!58731 () Bool)

(assert (=> bs!2805 m!58731))

(assert (=> b!63920 d!13397))

(declare-fun d!13399 () Bool)

(declare-fun res!35031 () Bool)

(declare-fun e!42089 () Bool)

(assert (=> d!13399 (=> res!35031 e!42089)))

(assert (=> d!13399 (= res!35031 (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) lt!27009))))

(assert (=> d!13399 (= (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 #b00000000000000000000000000000000) e!42089)))

(declare-fun b!64200 () Bool)

(declare-fun e!42090 () Bool)

(assert (=> b!64200 (= e!42089 e!42090)))

(declare-fun res!35032 () Bool)

(assert (=> b!64200 (=> (not res!35032) (not e!42090))))

(assert (=> b!64200 (= res!35032 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64201 () Bool)

(assert (=> b!64201 (= e!42090 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27009 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13399 (not res!35031)) b!64200))

(assert (= (and b!64200 res!35032) b!64201))

(assert (=> d!13399 m!58495))

(declare-fun m!58733 () Bool)

(assert (=> b!64201 m!58733))

(assert (=> b!63920 d!13399))

(declare-fun b!64214 () Bool)

(declare-fun e!42099 () SeekEntryResult!224)

(declare-fun lt!27222 () SeekEntryResult!224)

(assert (=> b!64214 (= e!42099 (Found!224 (index!3024 lt!27222)))))

(declare-fun b!64215 () Bool)

(declare-fun e!42097 () SeekEntryResult!224)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3757 (_ BitVec 32)) SeekEntryResult!224)

(assert (=> b!64215 (= e!42097 (seekKeyOrZeroReturnVacant!0 (x!10446 lt!27222) (index!3024 lt!27222) (index!3024 lt!27222) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64216 () Bool)

(declare-fun e!42098 () SeekEntryResult!224)

(assert (=> b!64216 (= e!42098 e!42099)))

(declare-fun lt!27224 () (_ BitVec 64))

(assert (=> b!64216 (= lt!27224 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (index!3024 lt!27222)))))

(declare-fun c!8753 () Bool)

(assert (=> b!64216 (= c!8753 (= lt!27224 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)))))

(declare-fun d!13401 () Bool)

(declare-fun lt!27223 () SeekEntryResult!224)

(assert (=> d!13401 (and (or ((_ is Undefined!224) lt!27223) (not ((_ is Found!224) lt!27223)) (and (bvsge (index!3023 lt!27223) #b00000000000000000000000000000000) (bvslt (index!3023 lt!27223) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!224) lt!27223) ((_ is Found!224) lt!27223) (not ((_ is MissingZero!224) lt!27223)) (and (bvsge (index!3022 lt!27223) #b00000000000000000000000000000000) (bvslt (index!3022 lt!27223) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!224) lt!27223) ((_ is Found!224) lt!27223) ((_ is MissingZero!224) lt!27223) (not ((_ is MissingVacant!224) lt!27223)) (and (bvsge (index!3025 lt!27223) #b00000000000000000000000000000000) (bvslt (index!3025 lt!27223) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))) (or ((_ is Undefined!224) lt!27223) (ite ((_ is Found!224) lt!27223) (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (index!3023 lt!27223)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!224) lt!27223) (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (index!3022 lt!27223)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!224) lt!27223) (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (index!3025 lt!27223)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13401 (= lt!27223 e!42098)))

(declare-fun c!8755 () Bool)

(assert (=> d!13401 (= c!8755 (and ((_ is Intermediate!224) lt!27222) (undefined!1036 lt!27222)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!3757 (_ BitVec 32)) SeekEntryResult!224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!13401 (= lt!27222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (mask!6024 (v!2435 (underlying!236 thiss!992)))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(assert (=> d!13401 (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13401 (= (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) #b00000000000000000000000000000000) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))) lt!27223)))

(declare-fun b!64217 () Bool)

(assert (=> b!64217 (= e!42098 Undefined!224)))

(declare-fun b!64218 () Bool)

(assert (=> b!64218 (= e!42097 (MissingZero!224 (index!3024 lt!27222)))))

(declare-fun b!64219 () Bool)

(declare-fun c!8754 () Bool)

(assert (=> b!64219 (= c!8754 (= lt!27224 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64219 (= e!42099 e!42097)))

(assert (= (and d!13401 c!8755) b!64217))

(assert (= (and d!13401 (not c!8755)) b!64216))

(assert (= (and b!64216 c!8753) b!64214))

(assert (= (and b!64216 (not c!8753)) b!64219))

(assert (= (and b!64219 c!8754) b!64218))

(assert (= (and b!64219 (not c!8754)) b!64215))

(assert (=> b!64215 m!58495))

(declare-fun m!58735 () Bool)

(assert (=> b!64215 m!58735))

(declare-fun m!58737 () Bool)

(assert (=> b!64216 m!58737))

(declare-fun m!58739 () Bool)

(assert (=> d!13401 m!58739))

(declare-fun m!58741 () Bool)

(assert (=> d!13401 m!58741))

(assert (=> d!13401 m!58495))

(declare-fun m!58743 () Bool)

(assert (=> d!13401 m!58743))

(assert (=> d!13401 m!58743))

(assert (=> d!13401 m!58495))

(declare-fun m!58745 () Bool)

(assert (=> d!13401 m!58745))

(declare-fun m!58747 () Bool)

(assert (=> d!13401 m!58747))

(assert (=> d!13401 m!58389))

(assert (=> b!63920 d!13401))

(declare-fun d!13403 () Bool)

(declare-fun isEmpty!308 (Option!134) Bool)

(assert (=> d!13403 (= (isDefined!80 (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))) (not (isEmpty!308 (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))))

(declare-fun bs!2806 () Bool)

(assert (= bs!2806 d!13403))

(assert (=> bs!2806 m!58579))

(declare-fun m!58749 () Bool)

(assert (=> bs!2806 m!58749))

(assert (=> b!64002 d!13403))

(declare-fun e!42105 () Option!134)

(declare-fun b!64230 () Bool)

(assert (=> b!64230 (= e!42105 (getValueByKey!128 (t!4839 (toList!693 lt!26956)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64228 () Bool)

(declare-fun e!42104 () Option!134)

(assert (=> b!64228 (= e!42104 (Some!133 (_2!1030 (h!2013 (toList!693 lt!26956)))))))

(declare-fun b!64231 () Bool)

(assert (=> b!64231 (= e!42105 None!132)))

(declare-fun b!64229 () Bool)

(assert (=> b!64229 (= e!42104 e!42105)))

(declare-fun c!8761 () Bool)

(assert (=> b!64229 (= c!8761 (and ((_ is Cons!1429) (toList!693 lt!26956)) (not (= (_1!1030 (h!2013 (toList!693 lt!26956))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))))

(declare-fun c!8760 () Bool)

(declare-fun d!13405 () Bool)

(assert (=> d!13405 (= c!8760 (and ((_ is Cons!1429) (toList!693 lt!26956)) (= (_1!1030 (h!2013 (toList!693 lt!26956))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13405 (= (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) e!42104)))

(assert (= (and d!13405 c!8760) b!64228))

(assert (= (and d!13405 (not c!8760)) b!64229))

(assert (= (and b!64229 c!8761) b!64230))

(assert (= (and b!64229 (not c!8761)) b!64231))

(assert (=> b!64230 m!58361))

(declare-fun m!58751 () Bool)

(assert (=> b!64230 m!58751))

(assert (=> b!64002 d!13405))

(declare-fun d!13407 () Bool)

(declare-fun e!42106 () Bool)

(assert (=> d!13407 e!42106))

(declare-fun res!35033 () Bool)

(assert (=> d!13407 (=> (not res!35033) (not e!42106))))

(declare-fun lt!27226 () ListLongMap!1355)

(assert (=> d!13407 (= res!35033 (contains!690 lt!27226 (_1!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun lt!27225 () List!1433)

(assert (=> d!13407 (= lt!27226 (ListLongMap!1356 lt!27225))))

(declare-fun lt!27227 () Unit!1748)

(declare-fun lt!27228 () Unit!1748)

(assert (=> d!13407 (= lt!27227 lt!27228)))

(assert (=> d!13407 (= (getValueByKey!128 lt!27225 (_1!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))) (Some!133 (_2!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13407 (= lt!27228 (lemmaContainsTupThenGetReturnValue!45 lt!27225 (_1!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (_2!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13407 (= lt!27225 (insertStrictlySorted!48 (toList!693 (ite c!8684 call!5075 (ite c!8686 call!5080 call!5077))) (_1!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (_2!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(assert (=> d!13407 (= (+!83 (ite c!8684 call!5075 (ite c!8686 call!5080 call!5077)) (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27226)))

(declare-fun b!64232 () Bool)

(declare-fun res!35034 () Bool)

(assert (=> b!64232 (=> (not res!35034) (not e!42106))))

(assert (=> b!64232 (= res!35034 (= (getValueByKey!128 (toList!693 lt!27226) (_1!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))) (Some!133 (_2!1030 (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))))

(declare-fun b!64233 () Bool)

(assert (=> b!64233 (= e!42106 (contains!693 (toList!693 lt!27226) (ite (or c!8684 c!8686) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (= (and d!13407 res!35033) b!64232))

(assert (= (and b!64232 res!35034) b!64233))

(declare-fun m!58753 () Bool)

(assert (=> d!13407 m!58753))

(declare-fun m!58755 () Bool)

(assert (=> d!13407 m!58755))

(declare-fun m!58757 () Bool)

(assert (=> d!13407 m!58757))

(declare-fun m!58759 () Bool)

(assert (=> d!13407 m!58759))

(declare-fun m!58761 () Bool)

(assert (=> b!64232 m!58761))

(declare-fun m!58763 () Bool)

(assert (=> b!64233 m!58763))

(assert (=> bm!5078 d!13407))

(declare-fun d!13409 () Bool)

(declare-fun res!35035 () Bool)

(declare-fun e!42107 () Bool)

(assert (=> d!13409 (=> (not res!35035) (not e!42107))))

(assert (=> d!13409 (= res!35035 (simpleValid!45 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13409 (= (valid!274 (v!2435 (underlying!236 thiss!992))) e!42107)))

(declare-fun b!64234 () Bool)

(declare-fun res!35036 () Bool)

(assert (=> b!64234 (=> (not res!35036) (not e!42107))))

(assert (=> b!64234 (= res!35036 (= (arrayCountValidKeys!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))) (_size!369 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64235 () Bool)

(declare-fun res!35037 () Bool)

(assert (=> b!64235 (=> (not res!35037) (not e!42107))))

(assert (=> b!64235 (= res!35037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64236 () Bool)

(assert (=> b!64236 (= e!42107 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000000 Nil!1431))))

(assert (= (and d!13409 res!35035) b!64234))

(assert (= (and b!64234 res!35036) b!64235))

(assert (= (and b!64235 res!35037) b!64236))

(declare-fun m!58765 () Bool)

(assert (=> d!13409 m!58765))

(declare-fun m!58767 () Bool)

(assert (=> b!64234 m!58767))

(assert (=> b!64235 m!58369))

(declare-fun m!58769 () Bool)

(assert (=> b!64236 m!58769))

(assert (=> d!13347 d!13409))

(declare-fun d!13411 () Bool)

(declare-fun lt!27231 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!70 (List!1434) (InoxSet (_ BitVec 64)))

(assert (=> d!13411 (= lt!27231 (select (content!70 Nil!1431) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42113 () Bool)

(assert (=> d!13411 (= lt!27231 e!42113)))

(declare-fun res!35043 () Bool)

(assert (=> d!13411 (=> (not res!35043) (not e!42113))))

(assert (=> d!13411 (= res!35043 ((_ is Cons!1430) Nil!1431))))

(assert (=> d!13411 (= (contains!692 Nil!1431 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27231)))

(declare-fun b!64241 () Bool)

(declare-fun e!42112 () Bool)

(assert (=> b!64241 (= e!42113 e!42112)))

(declare-fun res!35042 () Bool)

(assert (=> b!64241 (=> res!35042 e!42112)))

(assert (=> b!64241 (= res!35042 (= (h!2014 Nil!1431) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64242 () Bool)

(assert (=> b!64242 (= e!42112 (contains!692 (t!4840 Nil!1431) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13411 res!35043) b!64241))

(assert (= (and b!64241 (not res!35042)) b!64242))

(declare-fun m!58771 () Bool)

(assert (=> d!13411 m!58771))

(assert (=> d!13411 m!58361))

(declare-fun m!58773 () Bool)

(assert (=> d!13411 m!58773))

(assert (=> b!64242 m!58361))

(declare-fun m!58775 () Bool)

(assert (=> b!64242 m!58775))

(assert (=> b!64160 d!13411))

(declare-fun d!13413 () Bool)

(assert (=> d!13413 (= (+!83 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) lt!27167 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27234 () Unit!1748)

(declare-fun choose!353 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1748)

(assert (=> d!13413 (= lt!27234 (choose!353 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27167 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13413 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13413 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27167 (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)) lt!27234)))

(declare-fun bs!2807 () Bool)

(assert (= bs!2807 d!13413))

(assert (=> bs!2807 m!58689))

(assert (=> bs!2807 m!58507))

(assert (=> bs!2807 m!58507))

(declare-fun m!58777 () Bool)

(assert (=> bs!2807 m!58777))

(assert (=> bs!2807 m!58375))

(declare-fun m!58779 () Bool)

(assert (=> bs!2807 m!58779))

(assert (=> bs!2807 m!58375))

(declare-fun m!58781 () Bool)

(assert (=> bs!2807 m!58781))

(assert (=> b!64100 d!13413))

(declare-fun d!13415 () Bool)

(assert (=> d!13415 (= (apply!69 lt!27058 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1099 (getValueByKey!128 (toList!693 lt!27058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2808 () Bool)

(assert (= bs!2808 d!13415))

(declare-fun m!58783 () Bool)

(assert (=> bs!2808 m!58783))

(assert (=> bs!2808 m!58783))

(declare-fun m!58785 () Bool)

(assert (=> bs!2808 m!58785))

(assert (=> b!63968 d!13415))

(declare-fun d!13417 () Bool)

(assert (=> d!13417 (= (+!83 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) lt!27166 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27237 () Unit!1748)

(declare-fun choose!354 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 V!2873 Int) Unit!1748)

(assert (=> d!13417 (= lt!27237 (choose!354 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27166 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13417 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13417 (= (lemmaChangeZeroKeyThenAddPairToListMap!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) lt!27166 (zeroValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (minValue!2018 newMap!16) (defaultEntry!2108 newMap!16)) lt!27237)))

(declare-fun bs!2809 () Bool)

(assert (= bs!2809 d!13417))

(assert (=> bs!2809 m!58375))

(declare-fun m!58787 () Bool)

(assert (=> bs!2809 m!58787))

(assert (=> bs!2809 m!58689))

(assert (=> bs!2809 m!58507))

(declare-fun m!58789 () Bool)

(assert (=> bs!2809 m!58789))

(assert (=> bs!2809 m!58375))

(declare-fun m!58791 () Bool)

(assert (=> bs!2809 m!58791))

(assert (=> bs!2809 m!58507))

(assert (=> b!64087 d!13417))

(declare-fun b!64243 () Bool)

(declare-fun e!42117 () Bool)

(declare-fun e!42115 () Bool)

(assert (=> b!64243 (= e!42117 e!42115)))

(declare-fun c!8762 () Bool)

(assert (=> b!64243 (= c!8762 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64244 () Bool)

(declare-fun call!5158 () Bool)

(assert (=> b!64244 (= e!42115 call!5158)))

(declare-fun d!13419 () Bool)

(declare-fun res!35046 () Bool)

(declare-fun e!42114 () Bool)

(assert (=> d!13419 (=> res!35046 e!42114)))

(assert (=> d!13419 (= res!35046 (bvsge (bvadd from!355 #b00000000000000000000000000000001) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13419 (= (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001) (ite c!8742 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431) Nil!1431)) e!42114)))

(declare-fun b!64245 () Bool)

(assert (=> b!64245 (= e!42114 e!42117)))

(declare-fun res!35044 () Bool)

(assert (=> b!64245 (=> (not res!35044) (not e!42117))))

(declare-fun e!42116 () Bool)

(assert (=> b!64245 (= res!35044 (not e!42116))))

(declare-fun res!35045 () Bool)

(assert (=> b!64245 (=> (not res!35045) (not e!42116))))

(assert (=> b!64245 (= res!35045 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64246 () Bool)

(assert (=> b!64246 (= e!42116 (contains!692 (ite c!8742 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431) Nil!1431) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001))))))

(declare-fun b!64247 () Bool)

(assert (=> b!64247 (= e!42115 call!5158)))

(declare-fun bm!5155 () Bool)

(assert (=> bm!5155 (= call!5158 (arrayNoDuplicates!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!8762 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd from!355 #b00000000000000000000000000000001)) (ite c!8742 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431) Nil!1431)) (ite c!8742 (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431) Nil!1431))))))

(assert (= (and d!13419 (not res!35046)) b!64245))

(assert (= (and b!64245 res!35045) b!64246))

(assert (= (and b!64245 res!35044) b!64243))

(assert (= (and b!64243 c!8762) b!64247))

(assert (= (and b!64243 (not c!8762)) b!64244))

(assert (= (or b!64247 b!64244) bm!5155))

(declare-fun m!58793 () Bool)

(assert (=> b!64243 m!58793))

(assert (=> b!64243 m!58793))

(declare-fun m!58795 () Bool)

(assert (=> b!64243 m!58795))

(assert (=> b!64245 m!58793))

(assert (=> b!64245 m!58793))

(assert (=> b!64245 m!58795))

(assert (=> b!64246 m!58793))

(assert (=> b!64246 m!58793))

(declare-fun m!58797 () Bool)

(assert (=> b!64246 m!58797))

(assert (=> bm!5155 m!58793))

(declare-fun m!58799 () Bool)

(assert (=> bm!5155 m!58799))

(assert (=> bm!5153 d!13419))

(declare-fun b!64248 () Bool)

(declare-fun e!42120 () SeekEntryResult!224)

(declare-fun lt!27238 () SeekEntryResult!224)

(assert (=> b!64248 (= e!42120 (Found!224 (index!3024 lt!27238)))))

(declare-fun e!42118 () SeekEntryResult!224)

(declare-fun b!64249 () Bool)

(assert (=> b!64249 (= e!42118 (seekKeyOrZeroReturnVacant!0 (x!10446 lt!27238) (index!3024 lt!27238) (index!3024 lt!27238) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun b!64250 () Bool)

(declare-fun e!42119 () SeekEntryResult!224)

(assert (=> b!64250 (= e!42119 e!42120)))

(declare-fun lt!27240 () (_ BitVec 64))

(assert (=> b!64250 (= lt!27240 (select (arr!1796 (_keys!3744 newMap!16)) (index!3024 lt!27238)))))

(declare-fun c!8763 () Bool)

(assert (=> b!64250 (= c!8763 (= lt!27240 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun d!13421 () Bool)

(declare-fun lt!27239 () SeekEntryResult!224)

(assert (=> d!13421 (and (or ((_ is Undefined!224) lt!27239) (not ((_ is Found!224) lt!27239)) (and (bvsge (index!3023 lt!27239) #b00000000000000000000000000000000) (bvslt (index!3023 lt!27239) (size!2029 (_keys!3744 newMap!16))))) (or ((_ is Undefined!224) lt!27239) ((_ is Found!224) lt!27239) (not ((_ is MissingZero!224) lt!27239)) (and (bvsge (index!3022 lt!27239) #b00000000000000000000000000000000) (bvslt (index!3022 lt!27239) (size!2029 (_keys!3744 newMap!16))))) (or ((_ is Undefined!224) lt!27239) ((_ is Found!224) lt!27239) ((_ is MissingZero!224) lt!27239) (not ((_ is MissingVacant!224) lt!27239)) (and (bvsge (index!3025 lt!27239) #b00000000000000000000000000000000) (bvslt (index!3025 lt!27239) (size!2029 (_keys!3744 newMap!16))))) (or ((_ is Undefined!224) lt!27239) (ite ((_ is Found!224) lt!27239) (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27239)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (ite ((_ is MissingZero!224) lt!27239) (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3022 lt!27239)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!224) lt!27239) (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3025 lt!27239)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13421 (= lt!27239 e!42119)))

(declare-fun c!8765 () Bool)

(assert (=> d!13421 (= c!8765 (and ((_ is Intermediate!224) lt!27238) (undefined!1036 lt!27238)))))

(assert (=> d!13421 (= lt!27238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (mask!6024 newMap!16)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(assert (=> d!13421 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13421 (= (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)) lt!27239)))

(declare-fun b!64251 () Bool)

(assert (=> b!64251 (= e!42119 Undefined!224)))

(declare-fun b!64252 () Bool)

(assert (=> b!64252 (= e!42118 (MissingZero!224 (index!3024 lt!27238)))))

(declare-fun b!64253 () Bool)

(declare-fun c!8764 () Bool)

(assert (=> b!64253 (= c!8764 (= lt!27240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64253 (= e!42120 e!42118)))

(assert (= (and d!13421 c!8765) b!64251))

(assert (= (and d!13421 (not c!8765)) b!64250))

(assert (= (and b!64250 c!8763) b!64248))

(assert (= (and b!64250 (not c!8763)) b!64253))

(assert (= (and b!64253 c!8764) b!64252))

(assert (= (and b!64253 (not c!8764)) b!64249))

(assert (=> b!64249 m!58361))

(declare-fun m!58801 () Bool)

(assert (=> b!64249 m!58801))

(declare-fun m!58803 () Bool)

(assert (=> b!64250 m!58803))

(declare-fun m!58805 () Bool)

(assert (=> d!13421 m!58805))

(declare-fun m!58807 () Bool)

(assert (=> d!13421 m!58807))

(assert (=> d!13421 m!58361))

(declare-fun m!58809 () Bool)

(assert (=> d!13421 m!58809))

(assert (=> d!13421 m!58809))

(assert (=> d!13421 m!58361))

(declare-fun m!58811 () Bool)

(assert (=> d!13421 m!58811))

(declare-fun m!58813 () Bool)

(assert (=> d!13421 m!58813))

(assert (=> d!13421 m!58689))

(assert (=> b!64116 d!13421))

(declare-fun d!13423 () Bool)

(declare-fun res!35047 () Bool)

(declare-fun e!42121 () Bool)

(assert (=> d!13423 (=> res!35047 e!42121)))

(assert (=> d!13423 (= res!35047 (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13423 (= (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001)) e!42121)))

(declare-fun b!64254 () Bool)

(declare-fun e!42122 () Bool)

(assert (=> b!64254 (= e!42121 e!42122)))

(declare-fun res!35048 () Bool)

(assert (=> b!64254 (=> (not res!35048) (not e!42122))))

(assert (=> b!64254 (= res!35048 (bvslt (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64255 () Bool)

(assert (=> b!64255 (= e!42122 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!13423 (not res!35047)) b!64254))

(assert (= (and b!64254 res!35048) b!64255))

(declare-fun m!58815 () Bool)

(assert (=> d!13423 m!58815))

(assert (=> b!64255 m!58361))

(declare-fun m!58817 () Bool)

(assert (=> b!64255 m!58817))

(assert (=> b!64140 d!13423))

(declare-fun d!13425 () Bool)

(declare-fun e!42125 () Bool)

(assert (=> d!13425 e!42125))

(declare-fun res!35053 () Bool)

(assert (=> d!13425 (=> (not res!35053) (not e!42125))))

(declare-fun lt!27245 () SeekEntryResult!224)

(assert (=> d!13425 (= res!35053 ((_ is Found!224) lt!27245))))

(assert (=> d!13425 (= lt!27245 (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun lt!27246 () Unit!1748)

(declare-fun choose!355 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1748)

(assert (=> d!13425 (= lt!27246 (choose!355 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13425 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13425 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)) lt!27246)))

(declare-fun b!64260 () Bool)

(declare-fun res!35054 () Bool)

(assert (=> b!64260 (=> (not res!35054) (not e!42125))))

(assert (=> b!64260 (= res!35054 (inRange!0 (index!3023 lt!27245) (mask!6024 newMap!16)))))

(declare-fun b!64261 () Bool)

(assert (=> b!64261 (= e!42125 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27245)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64261 (and (bvsge (index!3023 lt!27245) #b00000000000000000000000000000000) (bvslt (index!3023 lt!27245) (size!2029 (_keys!3744 newMap!16))))))

(assert (= (and d!13425 res!35053) b!64260))

(assert (= (and b!64260 res!35054) b!64261))

(assert (=> d!13425 m!58361))

(assert (=> d!13425 m!58601))

(assert (=> d!13425 m!58361))

(declare-fun m!58819 () Bool)

(assert (=> d!13425 m!58819))

(assert (=> d!13425 m!58689))

(declare-fun m!58821 () Bool)

(assert (=> b!64260 m!58821))

(declare-fun m!58823 () Bool)

(assert (=> b!64261 m!58823))

(assert (=> bm!5127 d!13425))

(declare-fun d!13427 () Bool)

(declare-fun e!42128 () Bool)

(assert (=> d!13427 e!42128))

(declare-fun c!8768 () Bool)

(assert (=> d!13427 (= c!8768 (and (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!13427 true))

(declare-fun _$29!75 () Unit!1748)

(assert (=> d!13427 (= (choose!350 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) _$29!75)))

(declare-fun b!64266 () Bool)

(assert (=> b!64266 (= e!42128 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(declare-fun b!64267 () Bool)

(assert (=> b!64267 (= e!42128 (ite (= (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!13427 c!8768) b!64266))

(assert (= (and d!13427 (not c!8768)) b!64267))

(assert (=> b!64266 m!58361))

(assert (=> b!64266 m!58365))

(assert (=> d!13365 d!13427))

(assert (=> d!13365 d!13351))

(declare-fun b!64278 () Bool)

(declare-fun res!35066 () Bool)

(declare-fun e!42131 () Bool)

(assert (=> b!64278 (=> (not res!35066) (not e!42131))))

(declare-fun size!2035 (LongMapFixedSize!640) (_ BitVec 32))

(assert (=> b!64278 (= res!35066 (= (size!2035 newMap!16) (bvadd (_size!369 newMap!16) (bvsdiv (bvadd (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!13429 () Bool)

(declare-fun res!35064 () Bool)

(assert (=> d!13429 (=> (not res!35064) (not e!42131))))

(assert (=> d!13429 (= res!35064 (validMask!0 (mask!6024 newMap!16)))))

(assert (=> d!13429 (= (simpleValid!45 newMap!16) e!42131)))

(declare-fun b!64279 () Bool)

(assert (=> b!64279 (= e!42131 (and (bvsge (extraKeys!1983 newMap!16) #b00000000000000000000000000000000) (bvsle (extraKeys!1983 newMap!16) #b00000000000000000000000000000011) (bvsge (_vacant!369 newMap!16) #b00000000000000000000000000000000)))))

(declare-fun b!64276 () Bool)

(declare-fun res!35065 () Bool)

(assert (=> b!64276 (=> (not res!35065) (not e!42131))))

(assert (=> b!64276 (= res!35065 (and (= (size!2030 (_values!2091 newMap!16)) (bvadd (mask!6024 newMap!16) #b00000000000000000000000000000001)) (= (size!2029 (_keys!3744 newMap!16)) (size!2030 (_values!2091 newMap!16))) (bvsge (_size!369 newMap!16) #b00000000000000000000000000000000) (bvsle (_size!369 newMap!16) (bvadd (mask!6024 newMap!16) #b00000000000000000000000000000001))))))

(declare-fun b!64277 () Bool)

(declare-fun res!35063 () Bool)

(assert (=> b!64277 (=> (not res!35063) (not e!42131))))

(assert (=> b!64277 (= res!35063 (bvsge (size!2035 newMap!16) (_size!369 newMap!16)))))

(assert (= (and d!13429 res!35064) b!64276))

(assert (= (and b!64276 res!35065) b!64277))

(assert (= (and b!64277 res!35063) b!64278))

(assert (= (and b!64278 res!35066) b!64279))

(declare-fun m!58825 () Bool)

(assert (=> b!64278 m!58825))

(assert (=> d!13429 m!58689))

(assert (=> b!64277 m!58825))

(assert (=> d!13349 d!13429))

(declare-fun b!64280 () Bool)

(declare-fun e!42141 () Bool)

(declare-fun e!42133 () Bool)

(assert (=> b!64280 (= e!42141 e!42133)))

(declare-fun res!35072 () Bool)

(assert (=> b!64280 (=> (not res!35072) (not e!42133))))

(declare-fun lt!27249 () ListLongMap!1355)

(assert (=> b!64280 (= res!35072 (contains!690 lt!27249 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64280 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64281 () Bool)

(declare-fun e!42139 () Bool)

(declare-fun e!42135 () Bool)

(assert (=> b!64281 (= e!42139 e!42135)))

(declare-fun c!8769 () Bool)

(assert (=> b!64281 (= c!8769 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64282 () Bool)

(declare-fun e!42134 () Bool)

(assert (=> b!64282 (= e!42134 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun bm!5156 () Bool)

(declare-fun call!5159 () ListLongMap!1355)

(assert (=> bm!5156 (= call!5159 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64283 () Bool)

(declare-fun e!42138 () Bool)

(declare-fun call!5160 () Bool)

(assert (=> b!64283 (= e!42138 (not call!5160))))

(declare-fun b!64284 () Bool)

(declare-fun e!42132 () Bool)

(assert (=> b!64284 (= e!42132 (= (apply!69 lt!27249 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 newMap!16)))))

(declare-fun d!13431 () Bool)

(assert (=> d!13431 e!42139))

(declare-fun res!35075 () Bool)

(assert (=> d!13431 (=> (not res!35075) (not e!42139))))

(assert (=> d!13431 (= res!35075 (or (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))))

(declare-fun lt!27263 () ListLongMap!1355)

(assert (=> d!13431 (= lt!27249 lt!27263)))

(declare-fun lt!27259 () Unit!1748)

(declare-fun e!42140 () Unit!1748)

(assert (=> d!13431 (= lt!27259 e!42140)))

(declare-fun c!8774 () Bool)

(declare-fun e!42137 () Bool)

(assert (=> d!13431 (= c!8774 e!42137)))

(declare-fun res!35071 () Bool)

(assert (=> d!13431 (=> (not res!35071) (not e!42137))))

(assert (=> d!13431 (= res!35071 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun e!42136 () ListLongMap!1355)

(assert (=> d!13431 (= lt!27263 e!42136)))

(declare-fun c!8770 () Bool)

(assert (=> d!13431 (= c!8770 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13431 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13431 (= (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27249)))

(declare-fun b!64285 () Bool)

(declare-fun c!8773 () Bool)

(assert (=> b!64285 (= c!8773 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42143 () ListLongMap!1355)

(declare-fun e!42142 () ListLongMap!1355)

(assert (=> b!64285 (= e!42143 e!42142)))

(declare-fun b!64286 () Bool)

(declare-fun res!35068 () Bool)

(assert (=> b!64286 (=> (not res!35068) (not e!42139))))

(assert (=> b!64286 (= res!35068 e!42141)))

(declare-fun res!35074 () Bool)

(assert (=> b!64286 (=> res!35074 e!42141)))

(assert (=> b!64286 (= res!35074 (not e!42134))))

(declare-fun res!35070 () Bool)

(assert (=> b!64286 (=> (not res!35070) (not e!42134))))

(assert (=> b!64286 (= res!35070 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64287 () Bool)

(assert (=> b!64287 (= e!42133 (= (apply!69 lt!27249 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1797 (_values!2091 newMap!16)) #b00000000000000000000000000000000) (dynLambda!310 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2030 (_values!2091 newMap!16))))))

(assert (=> b!64287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64288 () Bool)

(declare-fun call!5162 () ListLongMap!1355)

(assert (=> b!64288 (= e!42143 call!5162)))

(declare-fun b!64289 () Bool)

(declare-fun res!35067 () Bool)

(assert (=> b!64289 (=> (not res!35067) (not e!42139))))

(assert (=> b!64289 (= res!35067 e!42138)))

(declare-fun c!8771 () Bool)

(assert (=> b!64289 (= c!8771 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!5157 () Bool)

(declare-fun call!5165 () ListLongMap!1355)

(assert (=> bm!5157 (= call!5162 call!5165)))

(declare-fun b!64290 () Bool)

(assert (=> b!64290 (= e!42142 call!5162)))

(declare-fun b!64291 () Bool)

(assert (=> b!64291 (= e!42137 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64292 () Bool)

(assert (=> b!64292 (= e!42135 e!42132)))

(declare-fun res!35073 () Bool)

(declare-fun call!5163 () Bool)

(assert (=> b!64292 (= res!35073 call!5163)))

(assert (=> b!64292 (=> (not res!35073) (not e!42132))))

(declare-fun b!64293 () Bool)

(declare-fun Unit!1766 () Unit!1748)

(assert (=> b!64293 (= e!42140 Unit!1766)))

(declare-fun bm!5158 () Bool)

(assert (=> bm!5158 (= call!5163 (contains!690 lt!27249 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5159 () Bool)

(declare-fun call!5164 () ListLongMap!1355)

(assert (=> bm!5159 (= call!5164 call!5159)))

(declare-fun b!64294 () Bool)

(assert (=> b!64294 (= e!42136 e!42143)))

(declare-fun c!8772 () Bool)

(assert (=> b!64294 (= c!8772 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5160 () Bool)

(assert (=> bm!5160 (= call!5160 (contains!690 lt!27249 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5161 () Bool)

(declare-fun call!5161 () ListLongMap!1355)

(assert (=> bm!5161 (= call!5161 call!5164)))

(declare-fun b!64295 () Bool)

(declare-fun e!42144 () Bool)

(assert (=> b!64295 (= e!42144 (= (apply!69 lt!27249 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 newMap!16)))))

(declare-fun b!64296 () Bool)

(declare-fun lt!27250 () Unit!1748)

(assert (=> b!64296 (= e!42140 lt!27250)))

(declare-fun lt!27247 () ListLongMap!1355)

(assert (=> b!64296 (= lt!27247 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27262 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27262 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27257 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27257 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27261 () Unit!1748)

(assert (=> b!64296 (= lt!27261 (addStillContains!45 lt!27247 lt!27262 (zeroValue!2018 newMap!16) lt!27257))))

(assert (=> b!64296 (contains!690 (+!83 lt!27247 (tuple2!2039 lt!27262 (zeroValue!2018 newMap!16))) lt!27257)))

(declare-fun lt!27268 () Unit!1748)

(assert (=> b!64296 (= lt!27268 lt!27261)))

(declare-fun lt!27265 () ListLongMap!1355)

(assert (=> b!64296 (= lt!27265 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27251 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27251 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27260 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27260 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27266 () Unit!1748)

(assert (=> b!64296 (= lt!27266 (addApplyDifferent!45 lt!27265 lt!27251 (minValue!2018 newMap!16) lt!27260))))

(assert (=> b!64296 (= (apply!69 (+!83 lt!27265 (tuple2!2039 lt!27251 (minValue!2018 newMap!16))) lt!27260) (apply!69 lt!27265 lt!27260))))

(declare-fun lt!27255 () Unit!1748)

(assert (=> b!64296 (= lt!27255 lt!27266)))

(declare-fun lt!27256 () ListLongMap!1355)

(assert (=> b!64296 (= lt!27256 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27248 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27248 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27254 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27254 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27267 () Unit!1748)

(assert (=> b!64296 (= lt!27267 (addApplyDifferent!45 lt!27256 lt!27248 (zeroValue!2018 newMap!16) lt!27254))))

(assert (=> b!64296 (= (apply!69 (+!83 lt!27256 (tuple2!2039 lt!27248 (zeroValue!2018 newMap!16))) lt!27254) (apply!69 lt!27256 lt!27254))))

(declare-fun lt!27258 () Unit!1748)

(assert (=> b!64296 (= lt!27258 lt!27267)))

(declare-fun lt!27253 () ListLongMap!1355)

(assert (=> b!64296 (= lt!27253 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27264 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27264 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27252 () (_ BitVec 64))

(assert (=> b!64296 (= lt!27252 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64296 (= lt!27250 (addApplyDifferent!45 lt!27253 lt!27264 (minValue!2018 newMap!16) lt!27252))))

(assert (=> b!64296 (= (apply!69 (+!83 lt!27253 (tuple2!2039 lt!27264 (minValue!2018 newMap!16))) lt!27252) (apply!69 lt!27253 lt!27252))))

(declare-fun b!64297 () Bool)

(assert (=> b!64297 (= e!42135 (not call!5163))))

(declare-fun b!64298 () Bool)

(assert (=> b!64298 (= e!42142 call!5161)))

(declare-fun b!64299 () Bool)

(assert (=> b!64299 (= e!42138 e!42144)))

(declare-fun res!35069 () Bool)

(assert (=> b!64299 (= res!35069 call!5160)))

(assert (=> b!64299 (=> (not res!35069) (not e!42144))))

(declare-fun bm!5162 () Bool)

(assert (=> bm!5162 (= call!5165 (+!83 (ite c!8770 call!5159 (ite c!8772 call!5164 call!5161)) (ite (or c!8770 c!8772) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 newMap!16)) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16)))))))

(declare-fun b!64300 () Bool)

(assert (=> b!64300 (= e!42136 (+!83 call!5165 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16))))))

(assert (= (and d!13431 c!8770) b!64300))

(assert (= (and d!13431 (not c!8770)) b!64294))

(assert (= (and b!64294 c!8772) b!64288))

(assert (= (and b!64294 (not c!8772)) b!64285))

(assert (= (and b!64285 c!8773) b!64290))

(assert (= (and b!64285 (not c!8773)) b!64298))

(assert (= (or b!64290 b!64298) bm!5161))

(assert (= (or b!64288 bm!5161) bm!5159))

(assert (= (or b!64288 b!64290) bm!5157))

(assert (= (or b!64300 bm!5159) bm!5156))

(assert (= (or b!64300 bm!5157) bm!5162))

(assert (= (and d!13431 res!35071) b!64291))

(assert (= (and d!13431 c!8774) b!64296))

(assert (= (and d!13431 (not c!8774)) b!64293))

(assert (= (and d!13431 res!35075) b!64286))

(assert (= (and b!64286 res!35070) b!64282))

(assert (= (and b!64286 (not res!35074)) b!64280))

(assert (= (and b!64280 res!35072) b!64287))

(assert (= (and b!64286 res!35068) b!64289))

(assert (= (and b!64289 c!8771) b!64299))

(assert (= (and b!64289 (not c!8771)) b!64283))

(assert (= (and b!64299 res!35069) b!64295))

(assert (= (or b!64299 b!64283) bm!5160))

(assert (= (and b!64289 res!35067) b!64281))

(assert (= (and b!64281 c!8769) b!64292))

(assert (= (and b!64281 (not c!8769)) b!64297))

(assert (= (and b!64292 res!35073) b!64284))

(assert (= (or b!64292 b!64297) bm!5158))

(declare-fun b_lambda!2887 () Bool)

(assert (=> (not b_lambda!2887) (not b!64287)))

(declare-fun tb!1393 () Bool)

(declare-fun t!4853 () Bool)

(assert (=> (and b!63778 (= (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2108 newMap!16)) t!4853) tb!1393))

(declare-fun result!2483 () Bool)

(assert (=> tb!1393 (= result!2483 tp_is_empty!2419)))

(assert (=> b!64287 t!4853))

(declare-fun b_and!3937 () Bool)

(assert (= b_and!3933 (and (=> t!4853 result!2483) b_and!3937)))

(declare-fun t!4855 () Bool)

(declare-fun tb!1395 () Bool)

(assert (=> (and b!63776 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 newMap!16)) t!4855) tb!1395))

(declare-fun result!2485 () Bool)

(assert (= result!2485 result!2483))

(assert (=> b!64287 t!4855))

(declare-fun b_and!3939 () Bool)

(assert (= b_and!3935 (and (=> t!4855 result!2485) b_and!3939)))

(declare-fun m!58827 () Bool)

(assert (=> b!64295 m!58827))

(assert (=> b!64280 m!58659))

(assert (=> b!64280 m!58659))

(declare-fun m!58829 () Bool)

(assert (=> b!64280 m!58829))

(assert (=> d!13431 m!58689))

(assert (=> b!64291 m!58659))

(assert (=> b!64291 m!58659))

(assert (=> b!64291 m!58661))

(declare-fun m!58831 () Bool)

(assert (=> bm!5158 m!58831))

(declare-fun m!58833 () Bool)

(assert (=> bm!5156 m!58833))

(declare-fun m!58835 () Bool)

(assert (=> b!64300 m!58835))

(declare-fun m!58837 () Bool)

(assert (=> b!64296 m!58837))

(assert (=> b!64296 m!58659))

(declare-fun m!58839 () Bool)

(assert (=> b!64296 m!58839))

(assert (=> b!64296 m!58837))

(declare-fun m!58841 () Bool)

(assert (=> b!64296 m!58841))

(assert (=> b!64296 m!58833))

(declare-fun m!58843 () Bool)

(assert (=> b!64296 m!58843))

(declare-fun m!58845 () Bool)

(assert (=> b!64296 m!58845))

(declare-fun m!58847 () Bool)

(assert (=> b!64296 m!58847))

(declare-fun m!58849 () Bool)

(assert (=> b!64296 m!58849))

(declare-fun m!58851 () Bool)

(assert (=> b!64296 m!58851))

(declare-fun m!58853 () Bool)

(assert (=> b!64296 m!58853))

(declare-fun m!58855 () Bool)

(assert (=> b!64296 m!58855))

(declare-fun m!58857 () Bool)

(assert (=> b!64296 m!58857))

(declare-fun m!58859 () Bool)

(assert (=> b!64296 m!58859))

(declare-fun m!58861 () Bool)

(assert (=> b!64296 m!58861))

(assert (=> b!64296 m!58849))

(declare-fun m!58863 () Bool)

(assert (=> b!64296 m!58863))

(assert (=> b!64296 m!58853))

(assert (=> b!64296 m!58857))

(declare-fun m!58865 () Bool)

(assert (=> b!64296 m!58865))

(declare-fun m!58867 () Bool)

(assert (=> bm!5160 m!58867))

(assert (=> b!64287 m!58659))

(assert (=> b!64287 m!58659))

(declare-fun m!58869 () Bool)

(assert (=> b!64287 m!58869))

(declare-fun m!58871 () Bool)

(assert (=> b!64287 m!58871))

(assert (=> b!64287 m!58871))

(declare-fun m!58873 () Bool)

(assert (=> b!64287 m!58873))

(declare-fun m!58875 () Bool)

(assert (=> b!64287 m!58875))

(assert (=> b!64287 m!58873))

(declare-fun m!58877 () Bool)

(assert (=> b!64284 m!58877))

(assert (=> b!64282 m!58659))

(assert (=> b!64282 m!58659))

(assert (=> b!64282 m!58661))

(declare-fun m!58879 () Bool)

(assert (=> bm!5162 m!58879))

(assert (=> b!64092 d!13431))

(assert (=> b!63975 d!13393))

(declare-fun b!64301 () Bool)

(declare-fun e!42154 () Bool)

(declare-fun e!42146 () Bool)

(assert (=> b!64301 (= e!42154 e!42146)))

(declare-fun res!35081 () Bool)

(assert (=> b!64301 (=> (not res!35081) (not e!42146))))

(declare-fun lt!27271 () ListLongMap!1355)

(assert (=> b!64301 (= res!35081 (contains!690 lt!27271 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64302 () Bool)

(declare-fun e!42152 () Bool)

(declare-fun e!42148 () Bool)

(assert (=> b!64302 (= e!42152 e!42148)))

(declare-fun c!8775 () Bool)

(assert (=> b!64302 (= c!8775 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64303 () Bool)

(declare-fun e!42147 () Bool)

(assert (=> b!64303 (= e!42147 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun call!5166 () ListLongMap!1355)

(declare-fun bm!5163 () Bool)

(assert (=> bm!5163 (= call!5166 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64304 () Bool)

(declare-fun e!42151 () Bool)

(declare-fun call!5167 () Bool)

(assert (=> b!64304 (= e!42151 (not call!5167))))

(declare-fun b!64305 () Bool)

(declare-fun e!42145 () Bool)

(assert (=> b!64305 (= e!42145 (= (apply!69 lt!27271 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!2018 newMap!16)))))

(declare-fun d!13433 () Bool)

(assert (=> d!13433 e!42152))

(declare-fun res!35084 () Bool)

(assert (=> d!13433 (=> (not res!35084) (not e!42152))))

(assert (=> d!13433 (= res!35084 (or (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))))

(declare-fun lt!27285 () ListLongMap!1355)

(assert (=> d!13433 (= lt!27271 lt!27285)))

(declare-fun lt!27281 () Unit!1748)

(declare-fun e!42153 () Unit!1748)

(assert (=> d!13433 (= lt!27281 e!42153)))

(declare-fun c!8780 () Bool)

(declare-fun e!42150 () Bool)

(assert (=> d!13433 (= c!8780 e!42150)))

(declare-fun res!35080 () Bool)

(assert (=> d!13433 (=> (not res!35080) (not e!42150))))

(assert (=> d!13433 (= res!35080 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun e!42149 () ListLongMap!1355)

(assert (=> d!13433 (= lt!27285 e!42149)))

(declare-fun c!8776 () Bool)

(assert (=> d!13433 (= c!8776 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13433 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13433 (= (getCurrentListMap!393 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27271)))

(declare-fun b!64306 () Bool)

(declare-fun c!8779 () Bool)

(assert (=> b!64306 (= c!8779 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42156 () ListLongMap!1355)

(declare-fun e!42155 () ListLongMap!1355)

(assert (=> b!64306 (= e!42156 e!42155)))

(declare-fun b!64307 () Bool)

(declare-fun res!35077 () Bool)

(assert (=> b!64307 (=> (not res!35077) (not e!42152))))

(assert (=> b!64307 (= res!35077 e!42154)))

(declare-fun res!35083 () Bool)

(assert (=> b!64307 (=> res!35083 e!42154)))

(assert (=> b!64307 (= res!35083 (not e!42147))))

(declare-fun res!35079 () Bool)

(assert (=> b!64307 (=> (not res!35079) (not e!42147))))

(assert (=> b!64307 (= res!35079 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64308 () Bool)

(assert (=> b!64308 (= e!42146 (= (apply!69 lt!27271 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1797 (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))))) #b00000000000000000000000000000000) (dynLambda!310 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2030 (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))))))))

(assert (=> b!64308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64309 () Bool)

(declare-fun call!5169 () ListLongMap!1355)

(assert (=> b!64309 (= e!42156 call!5169)))

(declare-fun b!64310 () Bool)

(declare-fun res!35076 () Bool)

(assert (=> b!64310 (=> (not res!35076) (not e!42152))))

(assert (=> b!64310 (= res!35076 e!42151)))

(declare-fun c!8777 () Bool)

(assert (=> b!64310 (= c!8777 (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!5164 () Bool)

(declare-fun call!5172 () ListLongMap!1355)

(assert (=> bm!5164 (= call!5169 call!5172)))

(declare-fun b!64311 () Bool)

(assert (=> b!64311 (= e!42155 call!5169)))

(declare-fun b!64312 () Bool)

(assert (=> b!64312 (= e!42150 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64313 () Bool)

(assert (=> b!64313 (= e!42148 e!42145)))

(declare-fun res!35082 () Bool)

(declare-fun call!5170 () Bool)

(assert (=> b!64313 (= res!35082 call!5170)))

(assert (=> b!64313 (=> (not res!35082) (not e!42145))))

(declare-fun b!64314 () Bool)

(declare-fun Unit!1767 () Unit!1748)

(assert (=> b!64314 (= e!42153 Unit!1767)))

(declare-fun bm!5165 () Bool)

(assert (=> bm!5165 (= call!5170 (contains!690 lt!27271 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5166 () Bool)

(declare-fun call!5171 () ListLongMap!1355)

(assert (=> bm!5166 (= call!5171 call!5166)))

(declare-fun b!64315 () Bool)

(assert (=> b!64315 (= e!42149 e!42156)))

(declare-fun c!8778 () Bool)

(assert (=> b!64315 (= c!8778 (and (not (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1983 newMap!16) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5167 () Bool)

(assert (=> bm!5167 (= call!5167 (contains!690 lt!27271 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5168 () Bool)

(declare-fun call!5168 () ListLongMap!1355)

(assert (=> bm!5168 (= call!5168 call!5171)))

(declare-fun b!64316 () Bool)

(declare-fun e!42157 () Bool)

(assert (=> b!64316 (= e!42157 (= (apply!69 lt!27271 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!2018 newMap!16)))))

(declare-fun b!64317 () Bool)

(declare-fun lt!27272 () Unit!1748)

(assert (=> b!64317 (= e!42153 lt!27272)))

(declare-fun lt!27269 () ListLongMap!1355)

(assert (=> b!64317 (= lt!27269 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27284 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27284 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27279 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27279 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27283 () Unit!1748)

(assert (=> b!64317 (= lt!27283 (addStillContains!45 lt!27269 lt!27284 (zeroValue!2018 newMap!16) lt!27279))))

(assert (=> b!64317 (contains!690 (+!83 lt!27269 (tuple2!2039 lt!27284 (zeroValue!2018 newMap!16))) lt!27279)))

(declare-fun lt!27290 () Unit!1748)

(assert (=> b!64317 (= lt!27290 lt!27283)))

(declare-fun lt!27287 () ListLongMap!1355)

(assert (=> b!64317 (= lt!27287 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27273 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27282 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27282 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27288 () Unit!1748)

(assert (=> b!64317 (= lt!27288 (addApplyDifferent!45 lt!27287 lt!27273 (minValue!2018 newMap!16) lt!27282))))

(assert (=> b!64317 (= (apply!69 (+!83 lt!27287 (tuple2!2039 lt!27273 (minValue!2018 newMap!16))) lt!27282) (apply!69 lt!27287 lt!27282))))

(declare-fun lt!27277 () Unit!1748)

(assert (=> b!64317 (= lt!27277 lt!27288)))

(declare-fun lt!27278 () ListLongMap!1355)

(assert (=> b!64317 (= lt!27278 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27270 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27270 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27276 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27276 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27289 () Unit!1748)

(assert (=> b!64317 (= lt!27289 (addApplyDifferent!45 lt!27278 lt!27270 (zeroValue!2018 newMap!16) lt!27276))))

(assert (=> b!64317 (= (apply!69 (+!83 lt!27278 (tuple2!2039 lt!27270 (zeroValue!2018 newMap!16))) lt!27276) (apply!69 lt!27278 lt!27276))))

(declare-fun lt!27280 () Unit!1748)

(assert (=> b!64317 (= lt!27280 lt!27289)))

(declare-fun lt!27275 () ListLongMap!1355)

(assert (=> b!64317 (= lt!27275 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite (or c!8727 c!8729) (_values!2091 newMap!16) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (index!3023 lt!27153) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16)))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27286 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27286 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27274 () (_ BitVec 64))

(assert (=> b!64317 (= lt!27274 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64317 (= lt!27272 (addApplyDifferent!45 lt!27275 lt!27286 (minValue!2018 newMap!16) lt!27274))))

(assert (=> b!64317 (= (apply!69 (+!83 lt!27275 (tuple2!2039 lt!27286 (minValue!2018 newMap!16))) lt!27274) (apply!69 lt!27275 lt!27274))))

(declare-fun b!64318 () Bool)

(assert (=> b!64318 (= e!42148 (not call!5170))))

(declare-fun b!64319 () Bool)

(assert (=> b!64319 (= e!42155 call!5168)))

(declare-fun b!64320 () Bool)

(assert (=> b!64320 (= e!42151 e!42157)))

(declare-fun res!35078 () Bool)

(assert (=> b!64320 (= res!35078 call!5167)))

(assert (=> b!64320 (=> (not res!35078) (not e!42157))))

(declare-fun bm!5169 () Bool)

(assert (=> bm!5169 (= call!5172 (+!83 (ite c!8776 call!5166 (ite c!8778 call!5171 call!5168)) (ite (or c!8776 c!8778) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2018 newMap!16)) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16)))))))

(declare-fun b!64321 () Bool)

(assert (=> b!64321 (= e!42149 (+!83 call!5172 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 newMap!16))))))

(assert (= (and d!13433 c!8776) b!64321))

(assert (= (and d!13433 (not c!8776)) b!64315))

(assert (= (and b!64315 c!8778) b!64309))

(assert (= (and b!64315 (not c!8778)) b!64306))

(assert (= (and b!64306 c!8779) b!64311))

(assert (= (and b!64306 (not c!8779)) b!64319))

(assert (= (or b!64311 b!64319) bm!5168))

(assert (= (or b!64309 bm!5168) bm!5166))

(assert (= (or b!64309 b!64311) bm!5164))

(assert (= (or b!64321 bm!5166) bm!5163))

(assert (= (or b!64321 bm!5164) bm!5169))

(assert (= (and d!13433 res!35080) b!64312))

(assert (= (and d!13433 c!8780) b!64317))

(assert (= (and d!13433 (not c!8780)) b!64314))

(assert (= (and d!13433 res!35084) b!64307))

(assert (= (and b!64307 res!35079) b!64303))

(assert (= (and b!64307 (not res!35083)) b!64301))

(assert (= (and b!64301 res!35081) b!64308))

(assert (= (and b!64307 res!35077) b!64310))

(assert (= (and b!64310 c!8777) b!64320))

(assert (= (and b!64310 (not c!8777)) b!64304))

(assert (= (and b!64320 res!35078) b!64316))

(assert (= (or b!64320 b!64304) bm!5167))

(assert (= (and b!64310 res!35076) b!64302))

(assert (= (and b!64302 c!8775) b!64313))

(assert (= (and b!64302 (not c!8775)) b!64318))

(assert (= (and b!64313 res!35082) b!64305))

(assert (= (or b!64313 b!64318) bm!5165))

(declare-fun b_lambda!2889 () Bool)

(assert (=> (not b_lambda!2889) (not b!64308)))

(assert (=> b!64308 t!4853))

(declare-fun b_and!3941 () Bool)

(assert (= b_and!3937 (and (=> t!4853 result!2483) b_and!3941)))

(assert (=> b!64308 t!4855))

(declare-fun b_and!3943 () Bool)

(assert (= b_and!3939 (and (=> t!4855 result!2485) b_and!3943)))

(declare-fun m!58881 () Bool)

(assert (=> b!64316 m!58881))

(assert (=> b!64301 m!58659))

(assert (=> b!64301 m!58659))

(declare-fun m!58883 () Bool)

(assert (=> b!64301 m!58883))

(assert (=> d!13433 m!58689))

(assert (=> b!64312 m!58659))

(assert (=> b!64312 m!58659))

(assert (=> b!64312 m!58661))

(declare-fun m!58885 () Bool)

(assert (=> bm!5165 m!58885))

(declare-fun m!58887 () Bool)

(assert (=> bm!5163 m!58887))

(declare-fun m!58889 () Bool)

(assert (=> b!64321 m!58889))

(declare-fun m!58891 () Bool)

(assert (=> b!64317 m!58891))

(assert (=> b!64317 m!58659))

(declare-fun m!58893 () Bool)

(assert (=> b!64317 m!58893))

(assert (=> b!64317 m!58891))

(declare-fun m!58895 () Bool)

(assert (=> b!64317 m!58895))

(assert (=> b!64317 m!58887))

(declare-fun m!58897 () Bool)

(assert (=> b!64317 m!58897))

(declare-fun m!58899 () Bool)

(assert (=> b!64317 m!58899))

(declare-fun m!58901 () Bool)

(assert (=> b!64317 m!58901))

(declare-fun m!58903 () Bool)

(assert (=> b!64317 m!58903))

(declare-fun m!58905 () Bool)

(assert (=> b!64317 m!58905))

(declare-fun m!58907 () Bool)

(assert (=> b!64317 m!58907))

(declare-fun m!58909 () Bool)

(assert (=> b!64317 m!58909))

(declare-fun m!58911 () Bool)

(assert (=> b!64317 m!58911))

(declare-fun m!58913 () Bool)

(assert (=> b!64317 m!58913))

(declare-fun m!58915 () Bool)

(assert (=> b!64317 m!58915))

(assert (=> b!64317 m!58903))

(declare-fun m!58917 () Bool)

(assert (=> b!64317 m!58917))

(assert (=> b!64317 m!58907))

(assert (=> b!64317 m!58911))

(declare-fun m!58919 () Bool)

(assert (=> b!64317 m!58919))

(declare-fun m!58921 () Bool)

(assert (=> bm!5167 m!58921))

(assert (=> b!64308 m!58659))

(assert (=> b!64308 m!58659))

(declare-fun m!58923 () Bool)

(assert (=> b!64308 m!58923))

(declare-fun m!58925 () Bool)

(assert (=> b!64308 m!58925))

(assert (=> b!64308 m!58925))

(assert (=> b!64308 m!58873))

(declare-fun m!58927 () Bool)

(assert (=> b!64308 m!58927))

(assert (=> b!64308 m!58873))

(declare-fun m!58929 () Bool)

(assert (=> b!64305 m!58929))

(assert (=> b!64303 m!58659))

(assert (=> b!64303 m!58659))

(assert (=> b!64303 m!58661))

(declare-fun m!58931 () Bool)

(assert (=> bm!5169 m!58931))

(assert (=> bm!5128 d!13433))

(declare-fun b!64330 () Bool)

(declare-fun e!42163 () (_ BitVec 32))

(declare-fun call!5175 () (_ BitVec 32))

(assert (=> b!64330 (= e!42163 (bvadd #b00000000000000000000000000000001 call!5175))))

(declare-fun bm!5172 () Bool)

(assert (=> bm!5172 (= call!5175 (arrayCountValidKeys!0 (_keys!3744 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64331 () Bool)

(declare-fun e!42162 () (_ BitVec 32))

(assert (=> b!64331 (= e!42162 e!42163)))

(declare-fun c!8785 () Bool)

(assert (=> b!64331 (= c!8785 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun d!13435 () Bool)

(declare-fun lt!27293 () (_ BitVec 32))

(assert (=> d!13435 (and (bvsge lt!27293 #b00000000000000000000000000000000) (bvsle lt!27293 (bvsub (size!2029 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> d!13435 (= lt!27293 e!42162)))

(declare-fun c!8786 () Bool)

(assert (=> d!13435 (= c!8786 (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(assert (=> d!13435 (and (bvsle #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!2029 (_keys!3744 newMap!16)) (size!2029 (_keys!3744 newMap!16))))))

(assert (=> d!13435 (= (arrayCountValidKeys!0 (_keys!3744 newMap!16) #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) lt!27293)))

(declare-fun b!64332 () Bool)

(assert (=> b!64332 (= e!42162 #b00000000000000000000000000000000)))

(declare-fun b!64333 () Bool)

(assert (=> b!64333 (= e!42163 call!5175)))

(assert (= (and d!13435 c!8786) b!64332))

(assert (= (and d!13435 (not c!8786)) b!64331))

(assert (= (and b!64331 c!8785) b!64330))

(assert (= (and b!64331 (not c!8785)) b!64333))

(assert (= (or b!64330 b!64333) bm!5172))

(declare-fun m!58933 () Bool)

(assert (=> bm!5172 m!58933))

(assert (=> b!64331 m!58659))

(assert (=> b!64331 m!58659))

(assert (=> b!64331 m!58661))

(assert (=> b!63991 d!13435))

(declare-fun b!64334 () Bool)

(declare-fun e!42167 () Bool)

(declare-fun e!42165 () Bool)

(assert (=> b!64334 (= e!42167 e!42165)))

(declare-fun c!8787 () Bool)

(assert (=> b!64334 (= c!8787 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64335 () Bool)

(declare-fun call!5176 () Bool)

(assert (=> b!64335 (= e!42165 call!5176)))

(declare-fun d!13437 () Bool)

(declare-fun res!35087 () Bool)

(declare-fun e!42164 () Bool)

(assert (=> d!13437 (=> res!35087 e!42164)))

(assert (=> d!13437 (= res!35087 (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(assert (=> d!13437 (= (arrayNoDuplicates!0 (_keys!3744 newMap!16) #b00000000000000000000000000000000 Nil!1431) e!42164)))

(declare-fun b!64336 () Bool)

(assert (=> b!64336 (= e!42164 e!42167)))

(declare-fun res!35085 () Bool)

(assert (=> b!64336 (=> (not res!35085) (not e!42167))))

(declare-fun e!42166 () Bool)

(assert (=> b!64336 (= res!35085 (not e!42166))))

(declare-fun res!35086 () Bool)

(assert (=> b!64336 (=> (not res!35086) (not e!42166))))

(assert (=> b!64336 (= res!35086 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64337 () Bool)

(assert (=> b!64337 (= e!42166 (contains!692 Nil!1431 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64338 () Bool)

(assert (=> b!64338 (= e!42165 call!5176)))

(declare-fun bm!5173 () Bool)

(assert (=> bm!5173 (= call!5176 (arrayNoDuplicates!0 (_keys!3744 newMap!16) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!8787 (Cons!1430 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000) Nil!1431) Nil!1431)))))

(assert (= (and d!13437 (not res!35087)) b!64336))

(assert (= (and b!64336 res!35086) b!64337))

(assert (= (and b!64336 res!35085) b!64334))

(assert (= (and b!64334 c!8787) b!64338))

(assert (= (and b!64334 (not c!8787)) b!64335))

(assert (= (or b!64338 b!64335) bm!5173))

(assert (=> b!64334 m!58659))

(assert (=> b!64334 m!58659))

(assert (=> b!64334 m!58661))

(assert (=> b!64336 m!58659))

(assert (=> b!64336 m!58659))

(assert (=> b!64336 m!58661))

(assert (=> b!64337 m!58659))

(assert (=> b!64337 m!58659))

(declare-fun m!58935 () Bool)

(assert (=> b!64337 m!58935))

(assert (=> bm!5173 m!58659))

(declare-fun m!58937 () Bool)

(assert (=> bm!5173 m!58937))

(assert (=> b!63993 d!13437))

(declare-fun d!13439 () Bool)

(assert (=> d!13439 (= (inRange!0 (ite c!8729 (ite c!8731 (index!3023 lt!27169) (ite c!8730 (index!3022 lt!27147) (index!3025 lt!27147))) (ite c!8722 (index!3023 lt!27151) (ite c!8720 (index!3022 lt!27165) (index!3025 lt!27165)))) (mask!6024 newMap!16)) (and (bvsge (ite c!8729 (ite c!8731 (index!3023 lt!27169) (ite c!8730 (index!3022 lt!27147) (index!3025 lt!27147))) (ite c!8722 (index!3023 lt!27151) (ite c!8720 (index!3022 lt!27165) (index!3025 lt!27165)))) #b00000000000000000000000000000000) (bvslt (ite c!8729 (ite c!8731 (index!3023 lt!27169) (ite c!8730 (index!3022 lt!27147) (index!3025 lt!27147))) (ite c!8722 (index!3023 lt!27151) (ite c!8720 (index!3022 lt!27165) (index!3025 lt!27165)))) (bvadd (mask!6024 newMap!16) #b00000000000000000000000000000001))))))

(assert (=> bm!5144 d!13439))

(declare-fun d!13441 () Bool)

(declare-fun e!42168 () Bool)

(assert (=> d!13441 e!42168))

(declare-fun res!35088 () Bool)

(assert (=> d!13441 (=> res!35088 e!42168)))

(declare-fun lt!27297 () Bool)

(assert (=> d!13441 (= res!35088 (not lt!27297))))

(declare-fun lt!27294 () Bool)

(assert (=> d!13441 (= lt!27297 lt!27294)))

(declare-fun lt!27295 () Unit!1748)

(declare-fun e!42169 () Unit!1748)

(assert (=> d!13441 (= lt!27295 e!42169)))

(declare-fun c!8788 () Bool)

(assert (=> d!13441 (= c!8788 lt!27294)))

(assert (=> d!13441 (= lt!27294 (containsKey!131 (toList!693 lt!27058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!13441 (= (contains!690 lt!27058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!27297)))

(declare-fun b!64339 () Bool)

(declare-fun lt!27296 () Unit!1748)

(assert (=> b!64339 (= e!42169 lt!27296)))

(assert (=> b!64339 (= lt!27296 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 lt!27058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64339 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64340 () Bool)

(declare-fun Unit!1768 () Unit!1748)

(assert (=> b!64340 (= e!42169 Unit!1768)))

(declare-fun b!64341 () Bool)

(assert (=> b!64341 (= e!42168 (isDefined!80 (getValueByKey!128 (toList!693 lt!27058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13441 c!8788) b!64339))

(assert (= (and d!13441 (not c!8788)) b!64340))

(assert (= (and d!13441 (not res!35088)) b!64341))

(declare-fun m!58939 () Bool)

(assert (=> d!13441 m!58939))

(declare-fun m!58941 () Bool)

(assert (=> b!64339 m!58941))

(assert (=> b!64339 m!58783))

(assert (=> b!64339 m!58783))

(declare-fun m!58943 () Bool)

(assert (=> b!64339 m!58943))

(assert (=> b!64341 m!58783))

(assert (=> b!64341 m!58783))

(assert (=> b!64341 m!58943))

(assert (=> bm!5074 d!13441))

(declare-fun d!13443 () Bool)

(assert (=> d!13443 (= (get!1098 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64134 d!13443))

(declare-fun call!5181 () Bool)

(declare-fun bm!5178 () Bool)

(assert (=> bm!5178 (= call!5181 (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64358 () Bool)

(declare-fun lt!27302 () SeekEntryResult!224)

(assert (=> b!64358 (and (bvsge (index!3022 lt!27302) #b00000000000000000000000000000000) (bvslt (index!3022 lt!27302) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun res!35097 () Bool)

(assert (=> b!64358 (= res!35097 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3022 lt!27302)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!42180 () Bool)

(assert (=> b!64358 (=> (not res!35097) (not e!42180))))

(declare-fun b!64359 () Bool)

(declare-fun res!35098 () Bool)

(declare-fun e!42178 () Bool)

(assert (=> b!64359 (=> (not res!35098) (not e!42178))))

(declare-fun call!5182 () Bool)

(assert (=> b!64359 (= res!35098 call!5182)))

(declare-fun e!42181 () Bool)

(assert (=> b!64359 (= e!42181 e!42178)))

(declare-fun c!8793 () Bool)

(declare-fun bm!5179 () Bool)

(assert (=> bm!5179 (= call!5182 (inRange!0 (ite c!8793 (index!3022 lt!27302) (index!3025 lt!27302)) (mask!6024 newMap!16)))))

(declare-fun b!64361 () Bool)

(assert (=> b!64361 (= e!42180 (not call!5181))))

(declare-fun b!64362 () Bool)

(declare-fun res!35100 () Bool)

(assert (=> b!64362 (=> (not res!35100) (not e!42178))))

(assert (=> b!64362 (= res!35100 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3025 lt!27302)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64362 (and (bvsge (index!3025 lt!27302) #b00000000000000000000000000000000) (bvslt (index!3025 lt!27302) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64363 () Bool)

(assert (=> b!64363 (= e!42181 ((_ is Undefined!224) lt!27302))))

(declare-fun b!64364 () Bool)

(declare-fun e!42179 () Bool)

(assert (=> b!64364 (= e!42179 e!42181)))

(declare-fun c!8794 () Bool)

(assert (=> b!64364 (= c!8794 ((_ is MissingVacant!224) lt!27302))))

(declare-fun b!64365 () Bool)

(assert (=> b!64365 (= e!42178 (not call!5181))))

(declare-fun d!13445 () Bool)

(assert (=> d!13445 e!42179))

(assert (=> d!13445 (= c!8793 ((_ is MissingZero!224) lt!27302))))

(assert (=> d!13445 (= lt!27302 (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun lt!27303 () Unit!1748)

(declare-fun choose!356 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) Int) Unit!1748)

(assert (=> d!13445 (= lt!27303 (choose!356 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13445 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13445 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)) lt!27303)))

(declare-fun b!64360 () Bool)

(assert (=> b!64360 (= e!42179 e!42180)))

(declare-fun res!35099 () Bool)

(assert (=> b!64360 (= res!35099 call!5182)))

(assert (=> b!64360 (=> (not res!35099) (not e!42180))))

(assert (= (and d!13445 c!8793) b!64360))

(assert (= (and d!13445 (not c!8793)) b!64364))

(assert (= (and b!64360 res!35099) b!64358))

(assert (= (and b!64358 res!35097) b!64361))

(assert (= (and b!64364 c!8794) b!64359))

(assert (= (and b!64364 (not c!8794)) b!64363))

(assert (= (and b!64359 res!35098) b!64362))

(assert (= (and b!64362 res!35100) b!64365))

(assert (= (or b!64360 b!64359) bm!5179))

(assert (= (or b!64361 b!64365) bm!5178))

(declare-fun m!58945 () Bool)

(assert (=> b!64362 m!58945))

(declare-fun m!58947 () Bool)

(assert (=> bm!5179 m!58947))

(assert (=> bm!5178 m!58361))

(assert (=> bm!5178 m!58629))

(declare-fun m!58949 () Bool)

(assert (=> b!64358 m!58949))

(assert (=> d!13445 m!58361))

(assert (=> d!13445 m!58601))

(assert (=> d!13445 m!58361))

(declare-fun m!58951 () Bool)

(assert (=> d!13445 m!58951))

(assert (=> d!13445 m!58689))

(assert (=> bm!5129 d!13445))

(assert (=> d!13345 d!13351))

(assert (=> b!64110 d!13431))

(declare-fun d!13447 () Bool)

(declare-fun res!35101 () Bool)

(declare-fun e!42182 () Bool)

(assert (=> d!13447 (=> res!35101 e!42182)))

(assert (=> d!13447 (= res!35101 (= (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13447 (= (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000) e!42182)))

(declare-fun b!64366 () Bool)

(declare-fun e!42183 () Bool)

(assert (=> b!64366 (= e!42182 e!42183)))

(declare-fun res!35102 () Bool)

(assert (=> b!64366 (=> (not res!35102) (not e!42183))))

(assert (=> b!64366 (= res!35102 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64367 () Bool)

(assert (=> b!64367 (= e!42183 (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!13447 (not res!35101)) b!64366))

(assert (= (and b!64366 res!35102) b!64367))

(assert (=> d!13447 m!58659))

(assert (=> b!64367 m!58361))

(declare-fun m!58953 () Bool)

(assert (=> b!64367 m!58953))

(assert (=> bm!5136 d!13447))

(declare-fun d!13449 () Bool)

(assert (=> d!13449 (contains!690 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27066)))

(declare-fun lt!27306 () Unit!1748)

(declare-fun choose!357 (ListLongMap!1355 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1748)

(assert (=> d!13449 (= lt!27306 (choose!357 lt!27056 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27066))))

(assert (=> d!13449 (contains!690 lt!27056 lt!27066)))

(assert (=> d!13449 (= (addStillContains!45 lt!27056 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27066) lt!27306)))

(declare-fun bs!2810 () Bool)

(assert (= bs!2810 d!13449))

(assert (=> bs!2810 m!58543))

(assert (=> bs!2810 m!58543))

(assert (=> bs!2810 m!58545))

(declare-fun m!58955 () Bool)

(assert (=> bs!2810 m!58955))

(declare-fun m!58957 () Bool)

(assert (=> bs!2810 m!58957))

(assert (=> b!63980 d!13449))

(declare-fun b!64393 () Bool)

(declare-fun e!42202 () ListLongMap!1355)

(assert (=> b!64393 (= e!42202 (ListLongMap!1356 Nil!1430))))

(declare-fun b!64394 () Bool)

(declare-fun e!42204 () ListLongMap!1355)

(assert (=> b!64394 (= e!42202 e!42204)))

(declare-fun c!8805 () Bool)

(assert (=> b!64394 (= c!8805 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun b!64395 () Bool)

(declare-fun e!42198 () Bool)

(declare-fun lt!27326 () ListLongMap!1355)

(declare-fun isEmpty!309 (ListLongMap!1355) Bool)

(assert (=> b!64395 (= e!42198 (isEmpty!309 lt!27326))))

(declare-fun bm!5182 () Bool)

(declare-fun call!5185 () ListLongMap!1355)

(assert (=> bm!5182 (= call!5185 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64396 () Bool)

(declare-fun e!42199 () Bool)

(assert (=> b!64396 (= e!42199 e!42198)))

(declare-fun c!8806 () Bool)

(assert (=> b!64396 (= c!8806 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64397 () Bool)

(assert (=> b!64397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> b!64397 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2030 (_values!2091 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun e!42200 () Bool)

(assert (=> b!64397 (= e!42200 (= (apply!69 lt!27326 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!13451 () Bool)

(declare-fun e!42201 () Bool)

(assert (=> d!13451 e!42201))

(declare-fun res!35111 () Bool)

(assert (=> d!13451 (=> (not res!35111) (not e!42201))))

(assert (=> d!13451 (= res!35111 (not (contains!690 lt!27326 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!13451 (= lt!27326 e!42202)))

(declare-fun c!8803 () Bool)

(assert (=> d!13451 (= c!8803 (bvsge (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13451 (validMask!0 (mask!6024 (v!2435 (underlying!236 thiss!992))))))

(assert (=> d!13451 (= (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992)))) lt!27326)))

(declare-fun b!64398 () Bool)

(declare-fun e!42203 () Bool)

(assert (=> b!64398 (= e!42203 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64398 (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000)))

(declare-fun b!64399 () Bool)

(declare-fun lt!27322 () Unit!1748)

(declare-fun lt!27325 () Unit!1748)

(assert (=> b!64399 (= lt!27322 lt!27325)))

(declare-fun lt!27327 () (_ BitVec 64))

(declare-fun lt!27323 () ListLongMap!1355)

(declare-fun lt!27324 () (_ BitVec 64))

(declare-fun lt!27321 () V!2873)

(assert (=> b!64399 (not (contains!690 (+!83 lt!27323 (tuple2!2039 lt!27327 lt!27321)) lt!27324))))

(declare-fun addStillNotContains!20 (ListLongMap!1355 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1748)

(assert (=> b!64399 (= lt!27325 (addStillNotContains!20 lt!27323 lt!27327 lt!27321 lt!27324))))

(assert (=> b!64399 (= lt!27324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!64399 (= lt!27321 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!64399 (= lt!27327 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> b!64399 (= lt!27323 call!5185)))

(assert (=> b!64399 (= e!42204 (+!83 call!5185 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!64400 () Bool)

(declare-fun res!35112 () Bool)

(assert (=> b!64400 (=> (not res!35112) (not e!42201))))

(assert (=> b!64400 (= res!35112 (not (contains!690 lt!27326 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64401 () Bool)

(assert (=> b!64401 (= e!42199 e!42200)))

(assert (=> b!64401 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun res!35113 () Bool)

(assert (=> b!64401 (= res!35113 (contains!690 lt!27326 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(assert (=> b!64401 (=> (not res!35113) (not e!42200))))

(declare-fun b!64402 () Bool)

(assert (=> b!64402 (= e!42201 e!42199)))

(declare-fun c!8804 () Bool)

(assert (=> b!64402 (= c!8804 e!42203)))

(declare-fun res!35114 () Bool)

(assert (=> b!64402 (=> (not res!35114) (not e!42203))))

(assert (=> b!64402 (= res!35114 (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(declare-fun b!64403 () Bool)

(assert (=> b!64403 (= e!42204 call!5185)))

(declare-fun b!64404 () Bool)

(assert (=> b!64404 (= e!42198 (= lt!27326 (getCurrentListMapNoExtraKeys!47 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (_values!2091 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992))) (extraKeys!1983 (v!2435 (underlying!236 thiss!992))) (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) (minValue!2018 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355 #b00000000000000000000000000000001) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13451 c!8803) b!64393))

(assert (= (and d!13451 (not c!8803)) b!64394))

(assert (= (and b!64394 c!8805) b!64399))

(assert (= (and b!64394 (not c!8805)) b!64403))

(assert (= (or b!64399 b!64403) bm!5182))

(assert (= (and d!13451 res!35111) b!64400))

(assert (= (and b!64400 res!35112) b!64402))

(assert (= (and b!64402 res!35114) b!64398))

(assert (= (and b!64402 c!8804) b!64401))

(assert (= (and b!64402 (not c!8804)) b!64396))

(assert (= (and b!64401 res!35113) b!64397))

(assert (= (and b!64396 c!8806) b!64404))

(assert (= (and b!64396 (not c!8806)) b!64395))

(declare-fun b_lambda!2891 () Bool)

(assert (=> (not b_lambda!2891) (not b!64397)))

(assert (=> b!64397 t!4836))

(declare-fun b_and!3945 () Bool)

(assert (= b_and!3941 (and (=> t!4836 result!2463) b_and!3945)))

(assert (=> b!64397 t!4838))

(declare-fun b_and!3947 () Bool)

(assert (= b_and!3943 (and (=> t!4838 result!2467) b_and!3947)))

(declare-fun b_lambda!2893 () Bool)

(assert (=> (not b_lambda!2893) (not b!64399)))

(assert (=> b!64399 t!4836))

(declare-fun b_and!3949 () Bool)

(assert (= b_and!3945 (and (=> t!4836 result!2463) b_and!3949)))

(assert (=> b!64399 t!4838))

(declare-fun b_and!3951 () Bool)

(assert (= b_and!3947 (and (=> t!4838 result!2467) b_and!3951)))

(assert (=> b!64401 m!58511))

(assert (=> b!64401 m!58511))

(declare-fun m!58959 () Bool)

(assert (=> b!64401 m!58959))

(assert (=> b!64399 m!58511))

(assert (=> b!64399 m!58373))

(assert (=> b!64399 m!58557))

(assert (=> b!64399 m!58557))

(assert (=> b!64399 m!58373))

(assert (=> b!64399 m!58559))

(declare-fun m!58961 () Bool)

(assert (=> b!64399 m!58961))

(declare-fun m!58963 () Bool)

(assert (=> b!64399 m!58963))

(declare-fun m!58965 () Bool)

(assert (=> b!64399 m!58965))

(assert (=> b!64399 m!58963))

(declare-fun m!58967 () Bool)

(assert (=> b!64399 m!58967))

(declare-fun m!58969 () Bool)

(assert (=> d!13451 m!58969))

(assert (=> d!13451 m!58389))

(assert (=> b!64394 m!58511))

(assert (=> b!64394 m!58511))

(assert (=> b!64394 m!58515))

(declare-fun m!58971 () Bool)

(assert (=> b!64400 m!58971))

(declare-fun m!58973 () Bool)

(assert (=> b!64395 m!58973))

(declare-fun m!58975 () Bool)

(assert (=> b!64404 m!58975))

(assert (=> b!64398 m!58511))

(assert (=> b!64398 m!58511))

(assert (=> b!64398 m!58515))

(assert (=> bm!5182 m!58975))

(assert (=> b!64397 m!58511))

(assert (=> b!64397 m!58373))

(assert (=> b!64397 m!58557))

(assert (=> b!64397 m!58557))

(assert (=> b!64397 m!58373))

(assert (=> b!64397 m!58559))

(assert (=> b!64397 m!58511))

(declare-fun m!58977 () Bool)

(assert (=> b!64397 m!58977))

(assert (=> b!63980 d!13451))

(declare-fun d!13453 () Bool)

(assert (=> d!13453 (= (apply!69 (+!83 lt!27062 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27061) (get!1099 (getValueByKey!128 (toList!693 (+!83 lt!27062 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27061)))))

(declare-fun bs!2811 () Bool)

(assert (= bs!2811 d!13453))

(declare-fun m!58979 () Bool)

(assert (=> bs!2811 m!58979))

(assert (=> bs!2811 m!58979))

(declare-fun m!58981 () Bool)

(assert (=> bs!2811 m!58981))

(assert (=> b!63980 d!13453))

(declare-fun d!13455 () Bool)

(declare-fun e!42205 () Bool)

(assert (=> d!13455 e!42205))

(declare-fun res!35115 () Bool)

(assert (=> d!13455 (=> (not res!35115) (not e!42205))))

(declare-fun lt!27329 () ListLongMap!1355)

(assert (=> d!13455 (= res!35115 (contains!690 lt!27329 (_1!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27328 () List!1433)

(assert (=> d!13455 (= lt!27329 (ListLongMap!1356 lt!27328))))

(declare-fun lt!27330 () Unit!1748)

(declare-fun lt!27331 () Unit!1748)

(assert (=> d!13455 (= lt!27330 lt!27331)))

(assert (=> d!13455 (= (getValueByKey!128 lt!27328 (_1!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13455 (= lt!27331 (lemmaContainsTupThenGetReturnValue!45 lt!27328 (_1!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13455 (= lt!27328 (insertStrictlySorted!48 (toList!693 lt!27056) (_1!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13455 (= (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27329)))

(declare-fun b!64405 () Bool)

(declare-fun res!35116 () Bool)

(assert (=> b!64405 (=> (not res!35116) (not e!42205))))

(assert (=> b!64405 (= res!35116 (= (getValueByKey!128 (toList!693 lt!27329) (_1!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64406 () Bool)

(assert (=> b!64406 (= e!42205 (contains!693 (toList!693 lt!27329) (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13455 res!35115) b!64405))

(assert (= (and b!64405 res!35116) b!64406))

(declare-fun m!58983 () Bool)

(assert (=> d!13455 m!58983))

(declare-fun m!58985 () Bool)

(assert (=> d!13455 m!58985))

(declare-fun m!58987 () Bool)

(assert (=> d!13455 m!58987))

(declare-fun m!58989 () Bool)

(assert (=> d!13455 m!58989))

(declare-fun m!58991 () Bool)

(assert (=> b!64405 m!58991))

(declare-fun m!58993 () Bool)

(assert (=> b!64406 m!58993))

(assert (=> b!63980 d!13455))

(declare-fun d!13457 () Bool)

(assert (=> d!13457 (= (apply!69 lt!27065 lt!27063) (get!1099 (getValueByKey!128 (toList!693 lt!27065) lt!27063)))))

(declare-fun bs!2812 () Bool)

(assert (= bs!2812 d!13457))

(declare-fun m!58995 () Bool)

(assert (=> bs!2812 m!58995))

(assert (=> bs!2812 m!58995))

(declare-fun m!58997 () Bool)

(assert (=> bs!2812 m!58997))

(assert (=> b!63980 d!13457))

(declare-fun d!13459 () Bool)

(assert (=> d!13459 (= (apply!69 (+!83 lt!27065 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27063) (get!1099 (getValueByKey!128 (toList!693 (+!83 lt!27065 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27063)))))

(declare-fun bs!2813 () Bool)

(assert (= bs!2813 d!13459))

(declare-fun m!58999 () Bool)

(assert (=> bs!2813 m!58999))

(assert (=> bs!2813 m!58999))

(declare-fun m!59001 () Bool)

(assert (=> bs!2813 m!59001))

(assert (=> b!63980 d!13459))

(declare-fun d!13461 () Bool)

(declare-fun e!42206 () Bool)

(assert (=> d!13461 e!42206))

(declare-fun res!35117 () Bool)

(assert (=> d!13461 (=> (not res!35117) (not e!42206))))

(declare-fun lt!27333 () ListLongMap!1355)

(assert (=> d!13461 (= res!35117 (contains!690 lt!27333 (_1!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27332 () List!1433)

(assert (=> d!13461 (= lt!27333 (ListLongMap!1356 lt!27332))))

(declare-fun lt!27334 () Unit!1748)

(declare-fun lt!27335 () Unit!1748)

(assert (=> d!13461 (= lt!27334 lt!27335)))

(assert (=> d!13461 (= (getValueByKey!128 lt!27332 (_1!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13461 (= lt!27335 (lemmaContainsTupThenGetReturnValue!45 lt!27332 (_1!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13461 (= lt!27332 (insertStrictlySorted!48 (toList!693 lt!27065) (_1!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13461 (= (+!83 lt!27065 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27333)))

(declare-fun b!64407 () Bool)

(declare-fun res!35118 () Bool)

(assert (=> b!64407 (=> (not res!35118) (not e!42206))))

(assert (=> b!64407 (= res!35118 (= (getValueByKey!128 (toList!693 lt!27333) (_1!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64408 () Bool)

(assert (=> b!64408 (= e!42206 (contains!693 (toList!693 lt!27333) (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13461 res!35117) b!64407))

(assert (= (and b!64407 res!35118) b!64408))

(declare-fun m!59003 () Bool)

(assert (=> d!13461 m!59003))

(declare-fun m!59005 () Bool)

(assert (=> d!13461 m!59005))

(declare-fun m!59007 () Bool)

(assert (=> d!13461 m!59007))

(declare-fun m!59009 () Bool)

(assert (=> d!13461 m!59009))

(declare-fun m!59011 () Bool)

(assert (=> b!64407 m!59011))

(declare-fun m!59013 () Bool)

(assert (=> b!64408 m!59013))

(assert (=> b!63980 d!13461))

(declare-fun d!13463 () Bool)

(assert (=> d!13463 (= (apply!69 (+!83 lt!27074 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27069) (apply!69 lt!27074 lt!27069))))

(declare-fun lt!27338 () Unit!1748)

(declare-fun choose!358 (ListLongMap!1355 (_ BitVec 64) V!2873 (_ BitVec 64)) Unit!1748)

(assert (=> d!13463 (= lt!27338 (choose!358 lt!27074 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27069))))

(declare-fun e!42209 () Bool)

(assert (=> d!13463 e!42209))

(declare-fun res!35121 () Bool)

(assert (=> d!13463 (=> (not res!35121) (not e!42209))))

(assert (=> d!13463 (= res!35121 (contains!690 lt!27074 lt!27069))))

(assert (=> d!13463 (= (addApplyDifferent!45 lt!27074 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27069) lt!27338)))

(declare-fun b!64412 () Bool)

(assert (=> b!64412 (= e!42209 (not (= lt!27069 lt!27060)))))

(assert (= (and d!13463 res!35121) b!64412))

(assert (=> d!13463 m!58535))

(assert (=> d!13463 m!58549))

(declare-fun m!59015 () Bool)

(assert (=> d!13463 m!59015))

(declare-fun m!59017 () Bool)

(assert (=> d!13463 m!59017))

(assert (=> d!13463 m!58535))

(assert (=> d!13463 m!58551))

(assert (=> b!63980 d!13463))

(declare-fun d!13465 () Bool)

(assert (=> d!13465 (= (apply!69 (+!83 lt!27074 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27069) (get!1099 (getValueByKey!128 (toList!693 (+!83 lt!27074 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27069)))))

(declare-fun bs!2814 () Bool)

(assert (= bs!2814 d!13465))

(declare-fun m!59019 () Bool)

(assert (=> bs!2814 m!59019))

(assert (=> bs!2814 m!59019))

(declare-fun m!59021 () Bool)

(assert (=> bs!2814 m!59021))

(assert (=> b!63980 d!13465))

(declare-fun d!13467 () Bool)

(assert (=> d!13467 (= (apply!69 lt!27074 lt!27069) (get!1099 (getValueByKey!128 (toList!693 lt!27074) lt!27069)))))

(declare-fun bs!2815 () Bool)

(assert (= bs!2815 d!13467))

(declare-fun m!59023 () Bool)

(assert (=> bs!2815 m!59023))

(assert (=> bs!2815 m!59023))

(declare-fun m!59025 () Bool)

(assert (=> bs!2815 m!59025))

(assert (=> b!63980 d!13467))

(declare-fun d!13469 () Bool)

(declare-fun e!42210 () Bool)

(assert (=> d!13469 e!42210))

(declare-fun res!35122 () Bool)

(assert (=> d!13469 (=> (not res!35122) (not e!42210))))

(declare-fun lt!27340 () ListLongMap!1355)

(assert (=> d!13469 (= res!35122 (contains!690 lt!27340 (_1!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27339 () List!1433)

(assert (=> d!13469 (= lt!27340 (ListLongMap!1356 lt!27339))))

(declare-fun lt!27341 () Unit!1748)

(declare-fun lt!27342 () Unit!1748)

(assert (=> d!13469 (= lt!27341 lt!27342)))

(assert (=> d!13469 (= (getValueByKey!128 lt!27339 (_1!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13469 (= lt!27342 (lemmaContainsTupThenGetReturnValue!45 lt!27339 (_1!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13469 (= lt!27339 (insertStrictlySorted!48 (toList!693 lt!27074) (_1!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13469 (= (+!83 lt!27074 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27340)))

(declare-fun b!64413 () Bool)

(declare-fun res!35123 () Bool)

(assert (=> b!64413 (=> (not res!35123) (not e!42210))))

(assert (=> b!64413 (= res!35123 (= (getValueByKey!128 (toList!693 lt!27340) (_1!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64414 () Bool)

(assert (=> b!64414 (= e!42210 (contains!693 (toList!693 lt!27340) (tuple2!2039 lt!27060 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13469 res!35122) b!64413))

(assert (= (and b!64413 res!35123) b!64414))

(declare-fun m!59027 () Bool)

(assert (=> d!13469 m!59027))

(declare-fun m!59029 () Bool)

(assert (=> d!13469 m!59029))

(declare-fun m!59031 () Bool)

(assert (=> d!13469 m!59031))

(declare-fun m!59033 () Bool)

(assert (=> d!13469 m!59033))

(declare-fun m!59035 () Bool)

(assert (=> b!64413 m!59035))

(declare-fun m!59037 () Bool)

(assert (=> b!64414 m!59037))

(assert (=> b!63980 d!13469))

(declare-fun d!13471 () Bool)

(declare-fun e!42211 () Bool)

(assert (=> d!13471 e!42211))

(declare-fun res!35124 () Bool)

(assert (=> d!13471 (=> (not res!35124) (not e!42211))))

(declare-fun lt!27344 () ListLongMap!1355)

(assert (=> d!13471 (= res!35124 (contains!690 lt!27344 (_1!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27343 () List!1433)

(assert (=> d!13471 (= lt!27344 (ListLongMap!1356 lt!27343))))

(declare-fun lt!27345 () Unit!1748)

(declare-fun lt!27346 () Unit!1748)

(assert (=> d!13471 (= lt!27345 lt!27346)))

(assert (=> d!13471 (= (getValueByKey!128 lt!27343 (_1!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13471 (= lt!27346 (lemmaContainsTupThenGetReturnValue!45 lt!27343 (_1!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13471 (= lt!27343 (insertStrictlySorted!48 (toList!693 lt!27062) (_1!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13471 (= (+!83 lt!27062 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27344)))

(declare-fun b!64415 () Bool)

(declare-fun res!35125 () Bool)

(assert (=> b!64415 (=> (not res!35125) (not e!42211))))

(assert (=> b!64415 (= res!35125 (= (getValueByKey!128 (toList!693 lt!27344) (_1!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64416 () Bool)

(assert (=> b!64416 (= e!42211 (contains!693 (toList!693 lt!27344) (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13471 res!35124) b!64415))

(assert (= (and b!64415 res!35125) b!64416))

(declare-fun m!59039 () Bool)

(assert (=> d!13471 m!59039))

(declare-fun m!59041 () Bool)

(assert (=> d!13471 m!59041))

(declare-fun m!59043 () Bool)

(assert (=> d!13471 m!59043))

(declare-fun m!59045 () Bool)

(assert (=> d!13471 m!59045))

(declare-fun m!59047 () Bool)

(assert (=> b!64415 m!59047))

(declare-fun m!59049 () Bool)

(assert (=> b!64416 m!59049))

(assert (=> b!63980 d!13471))

(declare-fun d!13473 () Bool)

(assert (=> d!13473 (= (apply!69 lt!27062 lt!27061) (get!1099 (getValueByKey!128 (toList!693 lt!27062) lt!27061)))))

(declare-fun bs!2816 () Bool)

(assert (= bs!2816 d!13473))

(declare-fun m!59051 () Bool)

(assert (=> bs!2816 m!59051))

(assert (=> bs!2816 m!59051))

(declare-fun m!59053 () Bool)

(assert (=> bs!2816 m!59053))

(assert (=> b!63980 d!13473))

(declare-fun d!13475 () Bool)

(assert (=> d!13475 (= (apply!69 (+!83 lt!27062 (tuple2!2039 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27061) (apply!69 lt!27062 lt!27061))))

(declare-fun lt!27347 () Unit!1748)

(assert (=> d!13475 (= lt!27347 (choose!358 lt!27062 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27061))))

(declare-fun e!42212 () Bool)

(assert (=> d!13475 e!42212))

(declare-fun res!35126 () Bool)

(assert (=> d!13475 (=> (not res!35126) (not e!42212))))

(assert (=> d!13475 (= res!35126 (contains!690 lt!27062 lt!27061))))

(assert (=> d!13475 (= (addApplyDifferent!45 lt!27062 lt!27073 (minValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27061) lt!27347)))

(declare-fun b!64417 () Bool)

(assert (=> b!64417 (= e!42212 (not (= lt!27061 lt!27073)))))

(assert (= (and d!13475 res!35126) b!64417))

(assert (=> d!13475 m!58539))

(assert (=> d!13475 m!58541))

(declare-fun m!59055 () Bool)

(assert (=> d!13475 m!59055))

(declare-fun m!59057 () Bool)

(assert (=> d!13475 m!59057))

(assert (=> d!13475 m!58539))

(assert (=> d!13475 m!58525))

(assert (=> b!63980 d!13475))

(declare-fun d!13477 () Bool)

(declare-fun e!42213 () Bool)

(assert (=> d!13477 e!42213))

(declare-fun res!35127 () Bool)

(assert (=> d!13477 (=> res!35127 e!42213)))

(declare-fun lt!27351 () Bool)

(assert (=> d!13477 (= res!35127 (not lt!27351))))

(declare-fun lt!27348 () Bool)

(assert (=> d!13477 (= lt!27351 lt!27348)))

(declare-fun lt!27349 () Unit!1748)

(declare-fun e!42214 () Unit!1748)

(assert (=> d!13477 (= lt!27349 e!42214)))

(declare-fun c!8807 () Bool)

(assert (=> d!13477 (= c!8807 lt!27348)))

(assert (=> d!13477 (= lt!27348 (containsKey!131 (toList!693 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27066))))

(assert (=> d!13477 (= (contains!690 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27066) lt!27351)))

(declare-fun b!64418 () Bool)

(declare-fun lt!27350 () Unit!1748)

(assert (=> b!64418 (= e!42214 lt!27350)))

(assert (=> b!64418 (= lt!27350 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27066))))

(assert (=> b!64418 (isDefined!80 (getValueByKey!128 (toList!693 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27066))))

(declare-fun b!64419 () Bool)

(declare-fun Unit!1769 () Unit!1748)

(assert (=> b!64419 (= e!42214 Unit!1769)))

(declare-fun b!64420 () Bool)

(assert (=> b!64420 (= e!42213 (isDefined!80 (getValueByKey!128 (toList!693 (+!83 lt!27056 (tuple2!2039 lt!27071 (zeroValue!2018 (v!2435 (underlying!236 thiss!992)))))) lt!27066)))))

(assert (= (and d!13477 c!8807) b!64418))

(assert (= (and d!13477 (not c!8807)) b!64419))

(assert (= (and d!13477 (not res!35127)) b!64420))

(declare-fun m!59059 () Bool)

(assert (=> d!13477 m!59059))

(declare-fun m!59061 () Bool)

(assert (=> b!64418 m!59061))

(declare-fun m!59063 () Bool)

(assert (=> b!64418 m!59063))

(assert (=> b!64418 m!59063))

(declare-fun m!59065 () Bool)

(assert (=> b!64418 m!59065))

(assert (=> b!64420 m!59063))

(assert (=> b!64420 m!59063))

(assert (=> b!64420 m!59065))

(assert (=> b!63980 d!13477))

(declare-fun d!13479 () Bool)

(assert (=> d!13479 (= (apply!69 (+!83 lt!27065 (tuple2!2039 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27063) (apply!69 lt!27065 lt!27063))))

(declare-fun lt!27352 () Unit!1748)

(assert (=> d!13479 (= lt!27352 (choose!358 lt!27065 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27063))))

(declare-fun e!42215 () Bool)

(assert (=> d!13479 e!42215))

(declare-fun res!35128 () Bool)

(assert (=> d!13479 (=> (not res!35128) (not e!42215))))

(assert (=> d!13479 (= res!35128 (contains!690 lt!27065 lt!27063))))

(assert (=> d!13479 (= (addApplyDifferent!45 lt!27065 lt!27057 (zeroValue!2018 (v!2435 (underlying!236 thiss!992))) lt!27063) lt!27352)))

(declare-fun b!64421 () Bool)

(assert (=> b!64421 (= e!42215 (not (= lt!27063 lt!27057)))))

(assert (= (and d!13479 res!35128) b!64421))

(assert (=> d!13479 m!58523))

(assert (=> d!13479 m!58527))

(declare-fun m!59067 () Bool)

(assert (=> d!13479 m!59067))

(declare-fun m!59069 () Bool)

(assert (=> d!13479 m!59069))

(assert (=> d!13479 m!58523))

(assert (=> d!13479 m!58547))

(assert (=> b!63980 d!13479))

(declare-fun bm!5191 () Bool)

(declare-fun c!8816 () Bool)

(declare-fun lt!27441 () SeekEntryResult!224)

(declare-fun lt!27425 () SeekEntryResult!224)

(declare-fun c!8819 () Bool)

(declare-fun call!5196 () Bool)

(assert (=> bm!5191 (= call!5196 (inRange!0 (ite c!8819 (index!3023 lt!27441) (ite c!8816 (index!3022 lt!27425) (index!3025 lt!27425))) (mask!6024 newMap!16)))))

(declare-fun call!5194 () Bool)

(declare-fun bm!5192 () Bool)

(assert (=> bm!5192 (= call!5194 (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun b!64456 () Bool)

(declare-fun e!42232 () Unit!1748)

(declare-fun lt!27433 () Unit!1748)

(assert (=> b!64456 (= e!42232 lt!27433)))

(assert (=> b!64456 (= lt!27433 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(declare-fun call!5195 () SeekEntryResult!224)

(assert (=> b!64456 (= lt!27425 call!5195)))

(assert (=> b!64456 (= c!8816 ((_ is MissingZero!224) lt!27425))))

(declare-fun e!42237 () Bool)

(assert (=> b!64456 e!42237))

(declare-fun b!64457 () Bool)

(declare-fun e!42234 () Unit!1748)

(declare-fun Unit!1770 () Unit!1748)

(assert (=> b!64457 (= e!42234 Unit!1770)))

(declare-fun lt!27429 () Unit!1748)

(declare-fun lemmaArrayContainsKeyThenInListMap!8 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 64) (_ BitVec 32) Int) Unit!1748)

(assert (=> b!64457 (= lt!27429 (lemmaArrayContainsKeyThenInListMap!8 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(assert (=> b!64457 (contains!690 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))

(declare-fun lt!27424 () Unit!1748)

(assert (=> b!64457 (= lt!27424 lt!27429)))

(assert (=> b!64457 false))

(declare-fun b!64458 () Bool)

(declare-fun e!42238 () Bool)

(assert (=> b!64458 (= e!42238 (not call!5194))))

(declare-fun b!64459 () Bool)

(declare-fun res!35155 () Bool)

(assert (=> b!64459 (= res!35155 call!5196)))

(declare-fun e!42233 () Bool)

(assert (=> b!64459 (=> (not res!35155) (not e!42233))))

(declare-fun b!64460 () Bool)

(declare-fun Unit!1771 () Unit!1748)

(assert (=> b!64460 (= e!42234 Unit!1771)))

(declare-fun b!64461 () Bool)

(declare-fun e!42235 () Bool)

(assert (=> b!64461 (= e!42235 ((_ is Undefined!224) lt!27425))))

(declare-fun bm!5193 () Bool)

(declare-fun call!5197 () Bool)

(assert (=> bm!5193 (= call!5197 call!5196)))

(declare-fun b!64462 () Bool)

(declare-fun res!35152 () Bool)

(declare-fun e!42239 () Bool)

(assert (=> b!64462 (=> (not res!35152) (not e!42239))))

(declare-fun lt!27417 () tuple2!2040)

(assert (=> b!64462 (= res!35152 (valid!274 (_2!1031 lt!27417)))))

(declare-fun b!64463 () Bool)

(declare-fun res!35147 () Bool)

(assert (=> b!64463 (=> (not res!35147) (not e!42239))))

(assert (=> b!64463 (= res!35147 (contains!690 (map!1121 (_2!1031 lt!27417)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64464 () Bool)

(declare-fun res!35154 () Bool)

(assert (=> b!64464 (=> (not res!35154) (not e!42238))))

(assert (=> b!64464 (= res!35154 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3022 lt!27425)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!64465 () Bool)

(declare-fun Unit!1772 () Unit!1748)

(assert (=> b!64465 (= e!42232 Unit!1772)))

(declare-fun lt!27421 () Unit!1748)

(assert (=> b!64465 (= lt!27421 (lemmaInListMapThenSeekEntryOrOpenFindsIt!18 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (defaultEntry!2108 newMap!16)))))

(assert (=> b!64465 (= lt!27441 call!5195)))

(declare-fun res!35149 () Bool)

(assert (=> b!64465 (= res!35149 ((_ is Found!224) lt!27441))))

(assert (=> b!64465 (=> (not res!35149) (not e!42233))))

(assert (=> b!64465 e!42233))

(declare-fun lt!27414 () Unit!1748)

(assert (=> b!64465 (= lt!27414 lt!27421)))

(assert (=> b!64465 false))

(declare-fun b!64466 () Bool)

(assert (=> b!64466 (= e!42233 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3023 lt!27441)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun bm!5194 () Bool)

(assert (=> bm!5194 (= call!5195 (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (mask!6024 newMap!16)))))

(declare-fun d!13481 () Bool)

(assert (=> d!13481 e!42239))

(declare-fun res!35148 () Bool)

(assert (=> d!13481 (=> (not res!35148) (not e!42239))))

(assert (=> d!13481 (= res!35148 (_1!1031 lt!27417))))

(assert (=> d!13481 (= lt!27417 (tuple2!2041 true (LongMapFixedSize!641 (defaultEntry!2108 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (bvadd (_size!369 newMap!16) #b00000000000000000000000000000001) (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))) (_vacant!369 newMap!16))))))

(declare-fun lt!27434 () Unit!1748)

(declare-fun lt!27418 () Unit!1748)

(assert (=> d!13481 (= lt!27434 lt!27418)))

(declare-fun lt!27415 () array!3759)

(declare-fun lt!27438 () array!3757)

(assert (=> d!13481 (contains!690 (getCurrentListMap!393 lt!27438 lt!27415 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153))))))

(assert (=> d!13481 (= lt!27418 (lemmaValidKeyInArrayIsInListMap!78 lt!27438 lt!27415 (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (defaultEntry!2108 newMap!16)))))

(assert (=> d!13481 (= lt!27415 (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))))))

(assert (=> d!13481 (= lt!27438 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun lt!27431 () Unit!1748)

(declare-fun lt!27435 () Unit!1748)

(assert (=> d!13481 (= lt!27431 lt!27435)))

(declare-fun lt!27442 () array!3757)

(assert (=> d!13481 (= (arrayCountValidKeys!0 lt!27442 (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (bvadd (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!3757 (_ BitVec 32)) Unit!1748)

(assert (=> d!13481 (= lt!27435 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!27442 (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153))))))

(assert (=> d!13481 (= lt!27442 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun lt!27416 () Unit!1748)

(declare-fun lt!27423 () Unit!1748)

(assert (=> d!13481 (= lt!27416 lt!27423)))

(declare-fun lt!27420 () array!3757)

(assert (=> d!13481 (arrayContainsKey!0 lt!27420 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000)))

(assert (=> d!13481 (= lt!27423 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!27420 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153))))))

(assert (=> d!13481 (= lt!27420 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))))))

(declare-fun lt!27430 () Unit!1748)

(declare-fun lt!27419 () Unit!1748)

(assert (=> d!13481 (= lt!27430 lt!27419)))

(assert (=> d!13481 (= (+!83 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (getCurrentListMap!393 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))) (array!3760 (store (arr!1797 (_values!2091 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (ValueCellFull!866 (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (size!2030 (_values!2091 newMap!16))) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!8 (array!3757 array!3759 (_ BitVec 32) (_ BitVec 32) V!2873 V!2873 (_ BitVec 32) (_ BitVec 64) V!2873 Int) Unit!1748)

(assert (=> d!13481 (= lt!27419 (lemmaAddValidKeyToArrayThenAddPairToListMap!8 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27422 () Unit!1748)

(declare-fun lt!27432 () Unit!1748)

(assert (=> d!13481 (= lt!27422 lt!27432)))

(assert (=> d!13481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))) (mask!6024 newMap!16))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!3757 (_ BitVec 32) (_ BitVec 32)) Unit!1748)

(assert (=> d!13481 (= lt!27432 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (_keys!3744 newMap!16) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (mask!6024 newMap!16)))))

(declare-fun lt!27413 () Unit!1748)

(declare-fun lt!27427 () Unit!1748)

(assert (=> d!13481 (= lt!27413 lt!27427)))

(assert (=> d!13481 (= (arrayCountValidKeys!0 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))) #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (bvadd (arrayCountValidKeys!0 (_keys!3744 newMap!16) #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!3757 (_ BitVec 32) (_ BitVec 64)) Unit!1748)

(assert (=> d!13481 (= lt!27427 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!3744 newMap!16) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun lt!27437 () Unit!1748)

(declare-fun lt!27426 () Unit!1748)

(assert (=> d!13481 (= lt!27437 lt!27426)))

(declare-fun lt!27439 () (_ BitVec 32))

(declare-fun lt!27436 () List!1434)

(assert (=> d!13481 (arrayNoDuplicates!0 (array!3758 (store (arr!1796 (_keys!3744 newMap!16)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) (size!2029 (_keys!3744 newMap!16))) lt!27439 lt!27436)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!3757 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!1434) Unit!1748)

(assert (=> d!13481 (= lt!27426 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153)) lt!27439 lt!27436))))

(assert (=> d!13481 (= lt!27436 Nil!1431)))

(assert (=> d!13481 (= lt!27439 #b00000000000000000000000000000000)))

(declare-fun lt!27440 () Unit!1748)

(assert (=> d!13481 (= lt!27440 e!42234)))

(declare-fun c!8818 () Bool)

(assert (=> d!13481 (= c!8818 (arrayContainsKey!0 (_keys!3744 newMap!16) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) #b00000000000000000000000000000000))))

(declare-fun lt!27428 () Unit!1748)

(assert (=> d!13481 (= lt!27428 e!42232)))

(assert (=> d!13481 (= c!8819 (contains!690 (getCurrentListMap!393 (_keys!3744 newMap!16) (_values!2091 newMap!16) (mask!6024 newMap!16) (extraKeys!1983 newMap!16) (zeroValue!2018 newMap!16) (minValue!2018 newMap!16) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13481 (valid!274 newMap!16)))

(assert (=> d!13481 (= (updateHelperNewKey!18 newMap!16 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite c!8724 (index!3025 lt!27153) (index!3022 lt!27153))) lt!27417)))

(declare-fun b!64467 () Bool)

(assert (=> b!64467 (= e!42239 (= (map!1121 (_2!1031 lt!27417)) (+!83 (map!1121 newMap!16) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!64468 () Bool)

(declare-fun e!42236 () Bool)

(assert (=> b!64468 (= e!42235 e!42236)))

(declare-fun res!35150 () Bool)

(assert (=> b!64468 (= res!35150 call!5197)))

(assert (=> b!64468 (=> (not res!35150) (not e!42236))))

(declare-fun b!64469 () Bool)

(declare-fun res!35153 () Bool)

(assert (=> b!64469 (= res!35153 (= (select (arr!1796 (_keys!3744 newMap!16)) (index!3025 lt!27425)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!64469 (=> (not res!35153) (not e!42236))))

(declare-fun b!64470 () Bool)

(assert (=> b!64470 (= e!42236 (not call!5194))))

(declare-fun b!64471 () Bool)

(declare-fun res!35151 () Bool)

(assert (=> b!64471 (=> (not res!35151) (not e!42238))))

(assert (=> b!64471 (= res!35151 call!5197)))

(assert (=> b!64471 (= e!42237 e!42238)))

(declare-fun b!64472 () Bool)

(declare-fun c!8817 () Bool)

(assert (=> b!64472 (= c!8817 ((_ is MissingVacant!224) lt!27425))))

(assert (=> b!64472 (= e!42237 e!42235)))

(assert (= (and d!13481 c!8819) b!64465))

(assert (= (and d!13481 (not c!8819)) b!64456))

(assert (= (and b!64465 res!35149) b!64459))

(assert (= (and b!64459 res!35155) b!64466))

(assert (= (and b!64456 c!8816) b!64471))

(assert (= (and b!64456 (not c!8816)) b!64472))

(assert (= (and b!64471 res!35151) b!64464))

(assert (= (and b!64464 res!35154) b!64458))

(assert (= (and b!64472 c!8817) b!64468))

(assert (= (and b!64472 (not c!8817)) b!64461))

(assert (= (and b!64468 res!35150) b!64469))

(assert (= (and b!64469 res!35153) b!64470))

(assert (= (or b!64471 b!64468) bm!5193))

(assert (= (or b!64458 b!64470) bm!5192))

(assert (= (or b!64459 bm!5193) bm!5191))

(assert (= (or b!64465 b!64456) bm!5194))

(assert (= (and d!13481 c!8818) b!64457))

(assert (= (and d!13481 (not c!8818)) b!64460))

(assert (= (and d!13481 res!35148) b!64462))

(assert (= (and b!64462 res!35152) b!64463))

(assert (= (and b!64463 res!35147) b!64467))

(declare-fun m!59071 () Bool)

(assert (=> bm!5191 m!59071))

(assert (=> b!64465 m!58361))

(assert (=> b!64465 m!58631))

(declare-fun m!59073 () Bool)

(assert (=> b!64463 m!59073))

(assert (=> b!64463 m!59073))

(assert (=> b!64463 m!58361))

(declare-fun m!59075 () Bool)

(assert (=> b!64463 m!59075))

(declare-fun m!59077 () Bool)

(assert (=> b!64469 m!59077))

(assert (=> b!64456 m!58361))

(assert (=> b!64456 m!58621))

(assert (=> b!64457 m!58361))

(declare-fun m!59079 () Bool)

(assert (=> b!64457 m!59079))

(assert (=> b!64457 m!58507))

(assert (=> b!64457 m!58507))

(assert (=> b!64457 m!58361))

(declare-fun m!59081 () Bool)

(assert (=> b!64457 m!59081))

(assert (=> bm!5192 m!58361))

(assert (=> bm!5192 m!58629))

(assert (=> bm!5194 m!58361))

(assert (=> bm!5194 m!58601))

(declare-fun m!59083 () Bool)

(assert (=> b!64462 m!59083))

(declare-fun m!59085 () Bool)

(assert (=> b!64464 m!59085))

(assert (=> d!13481 m!58381))

(declare-fun m!59087 () Bool)

(assert (=> d!13481 m!59087))

(declare-fun m!59089 () Bool)

(assert (=> d!13481 m!59089))

(assert (=> d!13481 m!58361))

(declare-fun m!59091 () Bool)

(assert (=> d!13481 m!59091))

(declare-fun m!59093 () Bool)

(assert (=> d!13481 m!59093))

(declare-fun m!59095 () Bool)

(assert (=> d!13481 m!59095))

(declare-fun m!59097 () Bool)

(assert (=> d!13481 m!59097))

(declare-fun m!59099 () Bool)

(assert (=> d!13481 m!59099))

(assert (=> d!13481 m!58361))

(declare-fun m!59101 () Bool)

(assert (=> d!13481 m!59101))

(assert (=> d!13481 m!58361))

(declare-fun m!59103 () Bool)

(assert (=> d!13481 m!59103))

(declare-fun m!59105 () Bool)

(assert (=> d!13481 m!59105))

(declare-fun m!59107 () Bool)

(assert (=> d!13481 m!59107))

(assert (=> d!13481 m!59095))

(assert (=> d!13481 m!59097))

(declare-fun m!59109 () Bool)

(assert (=> d!13481 m!59109))

(assert (=> d!13481 m!58361))

(assert (=> d!13481 m!58375))

(declare-fun m!59111 () Bool)

(assert (=> d!13481 m!59111))

(assert (=> d!13481 m!58507))

(assert (=> d!13481 m!58361))

(assert (=> d!13481 m!59081))

(assert (=> d!13481 m!58507))

(assert (=> d!13481 m!58697))

(assert (=> d!13481 m!58361))

(assert (=> d!13481 m!58629))

(declare-fun m!59113 () Bool)

(assert (=> d!13481 m!59113))

(declare-fun m!59115 () Bool)

(assert (=> d!13481 m!59115))

(assert (=> d!13481 m!58507))

(assert (=> d!13481 m!58361))

(declare-fun m!59117 () Bool)

(assert (=> d!13481 m!59117))

(assert (=> d!13481 m!58361))

(declare-fun m!59119 () Bool)

(assert (=> d!13481 m!59119))

(assert (=> d!13481 m!58569))

(declare-fun m!59121 () Bool)

(assert (=> d!13481 m!59121))

(assert (=> b!64467 m!59073))

(assert (=> b!64467 m!58399))

(assert (=> b!64467 m!58399))

(declare-fun m!59123 () Bool)

(assert (=> b!64467 m!59123))

(declare-fun m!59125 () Bool)

(assert (=> b!64466 m!59125))

(assert (=> bm!5138 d!13481))

(assert (=> d!13359 d!13363))

(declare-fun d!13483 () Bool)

(assert (=> d!13483 (not (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355)))))

(assert (=> d!13483 true))

(declare-fun _$68!40 () Unit!1748)

(assert (=> d!13483 (= (choose!68 (_keys!3744 (v!2435 (underlying!236 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (Cons!1430 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) Nil!1431)) _$68!40)))

(declare-fun bs!2817 () Bool)

(assert (= bs!2817 d!13483))

(assert (=> bs!2817 m!58361))

(assert (=> bs!2817 m!58365))

(assert (=> d!13359 d!13483))

(declare-fun b!64473 () Bool)

(declare-fun e!42240 () Bool)

(declare-fun call!5198 () Bool)

(assert (=> b!64473 (= e!42240 call!5198)))

(declare-fun b!64474 () Bool)

(declare-fun e!42242 () Bool)

(declare-fun e!42241 () Bool)

(assert (=> b!64474 (= e!42242 e!42241)))

(declare-fun c!8820 () Bool)

(assert (=> b!64474 (= c!8820 (validKeyInArray!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!5195 () Bool)

(assert (=> bm!5195 (= call!5198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))))))

(declare-fun b!64475 () Bool)

(assert (=> b!64475 (= e!42241 e!42240)))

(declare-fun lt!27443 () (_ BitVec 64))

(assert (=> b!64475 (= lt!27443 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!27444 () Unit!1748)

(assert (=> b!64475 (= lt!27444 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!64475 (arrayContainsKey!0 (_keys!3744 (v!2435 (underlying!236 thiss!992))) lt!27443 #b00000000000000000000000000000000)))

(declare-fun lt!27445 () Unit!1748)

(assert (=> b!64475 (= lt!27445 lt!27444)))

(declare-fun res!35156 () Bool)

(assert (=> b!64475 (= res!35156 (= (seekEntryOrOpen!0 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))) (Found!224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!64475 (=> (not res!35156) (not e!42240))))

(declare-fun b!64476 () Bool)

(assert (=> b!64476 (= e!42241 call!5198)))

(declare-fun d!13485 () Bool)

(declare-fun res!35157 () Bool)

(assert (=> d!13485 (=> res!35157 e!42242)))

(assert (=> d!13485 (= res!35157 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!2029 (_keys!3744 (v!2435 (underlying!236 thiss!992))))))))

(assert (=> d!13485 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3744 (v!2435 (underlying!236 thiss!992))) (mask!6024 (v!2435 (underlying!236 thiss!992)))) e!42242)))

(assert (= (and d!13485 (not res!35157)) b!64474))

(assert (= (and b!64474 c!8820) b!64475))

(assert (= (and b!64474 (not c!8820)) b!64476))

(assert (= (and b!64475 res!35156) b!64473))

(assert (= (or b!64473 b!64476) bm!5195))

(declare-fun m!59127 () Bool)

(assert (=> b!64474 m!59127))

(assert (=> b!64474 m!59127))

(declare-fun m!59129 () Bool)

(assert (=> b!64474 m!59129))

(declare-fun m!59131 () Bool)

(assert (=> bm!5195 m!59131))

(assert (=> b!64475 m!59127))

(declare-fun m!59133 () Bool)

(assert (=> b!64475 m!59133))

(declare-fun m!59135 () Bool)

(assert (=> b!64475 m!59135))

(assert (=> b!64475 m!59127))

(declare-fun m!59137 () Bool)

(assert (=> b!64475 m!59137))

(assert (=> bm!5057 d!13485))

(assert (=> bm!5072 d!13451))

(declare-fun d!13487 () Bool)

(assert (=> d!13487 (isDefined!80 (getValueByKey!128 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun lt!27448 () Unit!1748)

(declare-fun choose!359 (List!1433 (_ BitVec 64)) Unit!1748)

(assert (=> d!13487 (= lt!27448 (choose!359 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun e!42245 () Bool)

(assert (=> d!13487 e!42245))

(declare-fun res!35160 () Bool)

(assert (=> d!13487 (=> (not res!35160) (not e!42245))))

(declare-fun isStrictlySorted!274 (List!1433) Bool)

(assert (=> d!13487 (= res!35160 (isStrictlySorted!274 (toList!693 lt!26956)))))

(assert (=> d!13487 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27448)))

(declare-fun b!64479 () Bool)

(assert (=> b!64479 (= e!42245 (containsKey!131 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13487 res!35160) b!64479))

(assert (=> d!13487 m!58361))

(assert (=> d!13487 m!58579))

(assert (=> d!13487 m!58579))

(assert (=> d!13487 m!58581))

(assert (=> d!13487 m!58361))

(declare-fun m!59139 () Bool)

(assert (=> d!13487 m!59139))

(declare-fun m!59141 () Bool)

(assert (=> d!13487 m!59141))

(assert (=> b!64479 m!58361))

(assert (=> b!64479 m!58575))

(assert (=> b!64000 d!13487))

(assert (=> b!64000 d!13403))

(assert (=> b!64000 d!13405))

(declare-fun d!13489 () Bool)

(assert (=> d!13489 (= (map!1121 (_2!1031 lt!27164)) (getCurrentListMap!393 (_keys!3744 (_2!1031 lt!27164)) (_values!2091 (_2!1031 lt!27164)) (mask!6024 (_2!1031 lt!27164)) (extraKeys!1983 (_2!1031 lt!27164)) (zeroValue!2018 (_2!1031 lt!27164)) (minValue!2018 (_2!1031 lt!27164)) #b00000000000000000000000000000000 (defaultEntry!2108 (_2!1031 lt!27164))))))

(declare-fun bs!2818 () Bool)

(assert (= bs!2818 d!13489))

(declare-fun m!59143 () Bool)

(assert (=> bs!2818 m!59143))

(assert (=> bm!5132 d!13489))

(assert (=> b!64159 d!13395))

(assert (=> bm!5140 d!13421))

(declare-fun d!13491 () Bool)

(declare-fun e!42246 () Bool)

(assert (=> d!13491 e!42246))

(declare-fun res!35161 () Bool)

(assert (=> d!13491 (=> (not res!35161) (not e!42246))))

(declare-fun lt!27450 () ListLongMap!1355)

(assert (=> d!13491 (= res!35161 (contains!690 lt!27450 (_1!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(declare-fun lt!27449 () List!1433)

(assert (=> d!13491 (= lt!27450 (ListLongMap!1356 lt!27449))))

(declare-fun lt!27451 () Unit!1748)

(declare-fun lt!27452 () Unit!1748)

(assert (=> d!13491 (= lt!27451 lt!27452)))

(assert (=> d!13491 (= (getValueByKey!128 lt!27449 (_1!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13491 (= lt!27452 (lemmaContainsTupThenGetReturnValue!45 lt!27449 (_1!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13491 (= lt!27449 (insertStrictlySorted!48 (toList!693 call!5081) (_1!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) (_2!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))))))

(assert (=> d!13491 (= (+!83 call!5081 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))) lt!27450)))

(declare-fun b!64480 () Bool)

(declare-fun res!35162 () Bool)

(assert (=> b!64480 (=> (not res!35162) (not e!42246))))

(assert (=> b!64480 (= res!35162 (= (getValueByKey!128 (toList!693 lt!27450) (_1!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992)))))) (Some!133 (_2!1030 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))))

(declare-fun b!64481 () Bool)

(assert (=> b!64481 (= e!42246 (contains!693 (toList!693 lt!27450) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2018 (v!2435 (underlying!236 thiss!992))))))))

(assert (= (and d!13491 res!35161) b!64480))

(assert (= (and b!64480 res!35162) b!64481))

(declare-fun m!59145 () Bool)

(assert (=> d!13491 m!59145))

(declare-fun m!59147 () Bool)

(assert (=> d!13491 m!59147))

(declare-fun m!59149 () Bool)

(assert (=> d!13491 m!59149))

(declare-fun m!59151 () Bool)

(assert (=> d!13491 m!59151))

(declare-fun m!59153 () Bool)

(assert (=> b!64480 m!59153))

(declare-fun m!59155 () Bool)

(assert (=> b!64481 m!59155))

(assert (=> b!63984 d!13491))

(declare-fun d!13493 () Bool)

(declare-fun e!42247 () Bool)

(assert (=> d!13493 e!42247))

(declare-fun res!35163 () Bool)

(assert (=> d!13493 (=> res!35163 e!42247)))

(declare-fun lt!27456 () Bool)

(assert (=> d!13493 (= res!35163 (not lt!27456))))

(declare-fun lt!27453 () Bool)

(assert (=> d!13493 (= lt!27456 lt!27453)))

(declare-fun lt!27454 () Unit!1748)

(declare-fun e!42248 () Unit!1748)

(assert (=> d!13493 (= lt!27454 e!42248)))

(declare-fun c!8821 () Bool)

(assert (=> d!13493 (= c!8821 lt!27453)))

(assert (=> d!13493 (= lt!27453 (containsKey!131 (toList!693 e!42017) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13493 (= (contains!690 e!42017 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27456)))

(declare-fun b!64482 () Bool)

(declare-fun lt!27455 () Unit!1748)

(assert (=> b!64482 (= e!42248 lt!27455)))

(assert (=> b!64482 (= lt!27455 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 e!42017) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64482 (isDefined!80 (getValueByKey!128 (toList!693 e!42017) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64483 () Bool)

(declare-fun Unit!1773 () Unit!1748)

(assert (=> b!64483 (= e!42248 Unit!1773)))

(declare-fun b!64484 () Bool)

(assert (=> b!64484 (= e!42247 (isDefined!80 (getValueByKey!128 (toList!693 e!42017) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13493 c!8821) b!64482))

(assert (= (and d!13493 (not c!8821)) b!64483))

(assert (= (and d!13493 (not res!35163)) b!64484))

(assert (=> d!13493 m!58361))

(declare-fun m!59157 () Bool)

(assert (=> d!13493 m!59157))

(assert (=> b!64482 m!58361))

(declare-fun m!59159 () Bool)

(assert (=> b!64482 m!59159))

(assert (=> b!64482 m!58361))

(declare-fun m!59161 () Bool)

(assert (=> b!64482 m!59161))

(assert (=> b!64482 m!59161))

(declare-fun m!59163 () Bool)

(assert (=> b!64482 m!59163))

(assert (=> b!64484 m!58361))

(assert (=> b!64484 m!59161))

(assert (=> b!64484 m!59161))

(assert (=> b!64484 m!59163))

(assert (=> bm!5141 d!13493))

(declare-fun b!64485 () Bool)

(declare-fun e!42258 () Bool)

(declare-fun e!42250 () Bool)

(assert (=> b!64485 (= e!42258 e!42250)))

(declare-fun res!35169 () Bool)

(assert (=> b!64485 (=> (not res!35169) (not e!42250))))

(declare-fun lt!27459 () ListLongMap!1355)

(assert (=> b!64485 (= res!35169 (contains!690 lt!27459 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(assert (=> b!64485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64486 () Bool)

(declare-fun e!42256 () Bool)

(declare-fun e!42252 () Bool)

(assert (=> b!64486 (= e!42256 e!42252)))

(declare-fun c!8822 () Bool)

(assert (=> b!64486 (= c!8822 (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!64487 () Bool)

(declare-fun e!42251 () Bool)

(assert (=> b!64487 (= e!42251 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun call!5199 () ListLongMap!1355)

(declare-fun bm!5196 () Bool)

(assert (=> bm!5196 (= call!5199 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun b!64488 () Bool)

(declare-fun e!42255 () Bool)

(declare-fun call!5200 () Bool)

(assert (=> b!64488 (= e!42255 (not call!5200))))

(declare-fun b!64489 () Bool)

(declare-fun e!42249 () Bool)

(assert (=> b!64489 (= e!42249 (= (apply!69 lt!27459 #b1000000000000000000000000000000000000000000000000000000000000000) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16))))))

(declare-fun d!13495 () Bool)

(assert (=> d!13495 e!42256))

(declare-fun res!35172 () Bool)

(assert (=> d!13495 (=> (not res!35172) (not e!42256))))

(assert (=> d!13495 (= res!35172 (or (bvsge #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))))

(declare-fun lt!27473 () ListLongMap!1355)

(assert (=> d!13495 (= lt!27459 lt!27473)))

(declare-fun lt!27469 () Unit!1748)

(declare-fun e!42257 () Unit!1748)

(assert (=> d!13495 (= lt!27469 e!42257)))

(declare-fun c!8827 () Bool)

(declare-fun e!42254 () Bool)

(assert (=> d!13495 (= c!8827 e!42254)))

(declare-fun res!35168 () Bool)

(assert (=> d!13495 (=> (not res!35168) (not e!42254))))

(assert (=> d!13495 (= res!35168 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun e!42253 () ListLongMap!1355)

(assert (=> d!13495 (= lt!27473 e!42253)))

(declare-fun c!8823 () Bool)

(assert (=> d!13495 (= c!8823 (and (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!13495 (validMask!0 (mask!6024 newMap!16))))

(assert (=> d!13495 (= (getCurrentListMap!393 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)) lt!27459)))

(declare-fun b!64490 () Bool)

(declare-fun c!8826 () Bool)

(assert (=> b!64490 (= c!8826 (and (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!42260 () ListLongMap!1355)

(declare-fun e!42259 () ListLongMap!1355)

(assert (=> b!64490 (= e!42260 e!42259)))

(declare-fun b!64491 () Bool)

(declare-fun res!35165 () Bool)

(assert (=> b!64491 (=> (not res!35165) (not e!42256))))

(assert (=> b!64491 (= res!35165 e!42258)))

(declare-fun res!35171 () Bool)

(assert (=> b!64491 (=> res!35171 e!42258)))

(assert (=> b!64491 (= res!35171 (not e!42251))))

(declare-fun res!35167 () Bool)

(assert (=> b!64491 (=> (not res!35167) (not e!42251))))

(assert (=> b!64491 (= res!35167 (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64492 () Bool)

(assert (=> b!64492 (= e!42250 (= (apply!69 lt!27459 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)) (get!1095 (select (arr!1797 (ite c!8727 (_values!2091 newMap!16) lt!27163)) #b00000000000000000000000000000000) (dynLambda!310 (defaultEntry!2108 newMap!16) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!64492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2030 (ite c!8727 (_values!2091 newMap!16) lt!27163))))))

(assert (=> b!64492 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!2029 (_keys!3744 newMap!16))))))

(declare-fun b!64493 () Bool)

(declare-fun call!5202 () ListLongMap!1355)

(assert (=> b!64493 (= e!42260 call!5202)))

(declare-fun b!64494 () Bool)

(declare-fun res!35164 () Bool)

(assert (=> b!64494 (=> (not res!35164) (not e!42256))))

(assert (=> b!64494 (= res!35164 e!42255)))

(declare-fun c!8824 () Bool)

(assert (=> b!64494 (= c!8824 (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!5197 () Bool)

(declare-fun call!5205 () ListLongMap!1355)

(assert (=> bm!5197 (= call!5202 call!5205)))

(declare-fun b!64495 () Bool)

(assert (=> b!64495 (= e!42259 call!5202)))

(declare-fun b!64496 () Bool)

(assert (=> b!64496 (= e!42254 (validKeyInArray!0 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000)))))

(declare-fun b!64497 () Bool)

(assert (=> b!64497 (= e!42252 e!42249)))

(declare-fun res!35170 () Bool)

(declare-fun call!5203 () Bool)

(assert (=> b!64497 (= res!35170 call!5203)))

(assert (=> b!64497 (=> (not res!35170) (not e!42249))))

(declare-fun b!64498 () Bool)

(declare-fun Unit!1774 () Unit!1748)

(assert (=> b!64498 (= e!42257 Unit!1774)))

(declare-fun bm!5198 () Bool)

(assert (=> bm!5198 (= call!5203 (contains!690 lt!27459 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5199 () Bool)

(declare-fun call!5204 () ListLongMap!1355)

(assert (=> bm!5199 (= call!5204 call!5199)))

(declare-fun b!64499 () Bool)

(assert (=> b!64499 (= e!42253 e!42260)))

(declare-fun c!8825 () Bool)

(assert (=> b!64499 (= c!8825 (and (not (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!5200 () Bool)

(assert (=> bm!5200 (= call!5200 (contains!690 lt!27459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!5201 () Bool)

(declare-fun call!5201 () ListLongMap!1355)

(assert (=> bm!5201 (= call!5201 call!5204)))

(declare-fun e!42261 () Bool)

(declare-fun b!64500 () Bool)

(assert (=> b!64500 (= e!42261 (= (apply!69 lt!27459 #b0000000000000000000000000000000000000000000000000000000000000000) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16))))))

(declare-fun b!64501 () Bool)

(declare-fun lt!27460 () Unit!1748)

(assert (=> b!64501 (= e!42257 lt!27460)))

(declare-fun lt!27457 () ListLongMap!1355)

(assert (=> b!64501 (= lt!27457 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27472 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27467 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27467 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27471 () Unit!1748)

(assert (=> b!64501 (= lt!27471 (addStillContains!45 lt!27457 lt!27472 (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) lt!27467))))

(assert (=> b!64501 (contains!690 (+!83 lt!27457 (tuple2!2039 lt!27472 (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)))) lt!27467)))

(declare-fun lt!27478 () Unit!1748)

(assert (=> b!64501 (= lt!27478 lt!27471)))

(declare-fun lt!27475 () ListLongMap!1355)

(assert (=> b!64501 (= lt!27475 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27461 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27461 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27470 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27470 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27476 () Unit!1748)

(assert (=> b!64501 (= lt!27476 (addApplyDifferent!45 lt!27475 lt!27461 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) lt!27470))))

(assert (=> b!64501 (= (apply!69 (+!83 lt!27475 (tuple2!2039 lt!27461 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))) lt!27470) (apply!69 lt!27475 lt!27470))))

(declare-fun lt!27465 () Unit!1748)

(assert (=> b!64501 (= lt!27465 lt!27476)))

(declare-fun lt!27466 () ListLongMap!1355)

(assert (=> b!64501 (= lt!27466 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27458 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27458 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27464 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27464 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(declare-fun lt!27477 () Unit!1748)

(assert (=> b!64501 (= lt!27477 (addApplyDifferent!45 lt!27466 lt!27458 (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) lt!27464))))

(assert (=> b!64501 (= (apply!69 (+!83 lt!27466 (tuple2!2039 lt!27458 (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)))) lt!27464) (apply!69 lt!27466 lt!27464))))

(declare-fun lt!27468 () Unit!1748)

(assert (=> b!64501 (= lt!27468 lt!27477)))

(declare-fun lt!27463 () ListLongMap!1355)

(assert (=> b!64501 (= lt!27463 (getCurrentListMapNoExtraKeys!47 (_keys!3744 newMap!16) (ite c!8727 (_values!2091 newMap!16) lt!27163) (mask!6024 newMap!16) (ite c!8727 (ite c!8725 lt!27166 lt!27167) (extraKeys!1983 newMap!16)) (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16)) (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) #b00000000000000000000000000000000 (defaultEntry!2108 newMap!16)))))

(declare-fun lt!27474 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27474 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27462 () (_ BitVec 64))

(assert (=> b!64501 (= lt!27462 (select (arr!1796 (_keys!3744 newMap!16)) #b00000000000000000000000000000000))))

(assert (=> b!64501 (= lt!27460 (addApplyDifferent!45 lt!27463 lt!27474 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)) lt!27462))))

(assert (=> b!64501 (= (apply!69 (+!83 lt!27463 (tuple2!2039 lt!27474 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))) lt!27462) (apply!69 lt!27463 lt!27462))))

(declare-fun b!64502 () Bool)

(assert (=> b!64502 (= e!42252 (not call!5203))))

(declare-fun b!64503 () Bool)

(assert (=> b!64503 (= e!42259 call!5201)))

(declare-fun b!64504 () Bool)

(assert (=> b!64504 (= e!42255 e!42261)))

(declare-fun res!35166 () Bool)

(assert (=> b!64504 (= res!35166 call!5200)))

(assert (=> b!64504 (=> (not res!35166) (not e!42261))))

(declare-fun bm!5202 () Bool)

(assert (=> bm!5202 (= call!5205 (+!83 (ite c!8823 call!5199 (ite c!8825 call!5204 call!5201)) (ite (or c!8823 c!8825) (tuple2!2039 #b0000000000000000000000000000000000000000000000000000000000000000 (ite (and c!8727 c!8725) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) (zeroValue!2018 newMap!16))) (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16))))))))

(declare-fun b!64505 () Bool)

(assert (=> b!64505 (= e!42253 (+!83 call!5205 (tuple2!2039 #b1000000000000000000000000000000000000000000000000000000000000000 (ite c!8727 (ite c!8725 (minValue!2018 newMap!16) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))) (minValue!2018 newMap!16)))))))

(assert (= (and d!13495 c!8823) b!64505))

(assert (= (and d!13495 (not c!8823)) b!64499))

(assert (= (and b!64499 c!8825) b!64493))

(assert (= (and b!64499 (not c!8825)) b!64490))

(assert (= (and b!64490 c!8826) b!64495))

(assert (= (and b!64490 (not c!8826)) b!64503))

(assert (= (or b!64495 b!64503) bm!5201))

(assert (= (or b!64493 bm!5201) bm!5199))

(assert (= (or b!64493 b!64495) bm!5197))

(assert (= (or b!64505 bm!5199) bm!5196))

(assert (= (or b!64505 bm!5197) bm!5202))

(assert (= (and d!13495 res!35168) b!64496))

(assert (= (and d!13495 c!8827) b!64501))

(assert (= (and d!13495 (not c!8827)) b!64498))

(assert (= (and d!13495 res!35172) b!64491))

(assert (= (and b!64491 res!35167) b!64487))

(assert (= (and b!64491 (not res!35171)) b!64485))

(assert (= (and b!64485 res!35169) b!64492))

(assert (= (and b!64491 res!35165) b!64494))

(assert (= (and b!64494 c!8824) b!64504))

(assert (= (and b!64494 (not c!8824)) b!64488))

(assert (= (and b!64504 res!35166) b!64500))

(assert (= (or b!64504 b!64488) bm!5200))

(assert (= (and b!64494 res!35164) b!64486))

(assert (= (and b!64486 c!8822) b!64497))

(assert (= (and b!64486 (not c!8822)) b!64502))

(assert (= (and b!64497 res!35170) b!64489))

(assert (= (or b!64497 b!64502) bm!5198))

(declare-fun b_lambda!2895 () Bool)

(assert (=> (not b_lambda!2895) (not b!64492)))

(assert (=> b!64492 t!4853))

(declare-fun b_and!3953 () Bool)

(assert (= b_and!3949 (and (=> t!4853 result!2483) b_and!3953)))

(assert (=> b!64492 t!4855))

(declare-fun b_and!3955 () Bool)

(assert (= b_and!3951 (and (=> t!4855 result!2485) b_and!3955)))

(declare-fun m!59165 () Bool)

(assert (=> b!64500 m!59165))

(assert (=> b!64485 m!58659))

(assert (=> b!64485 m!58659))

(declare-fun m!59167 () Bool)

(assert (=> b!64485 m!59167))

(assert (=> d!13495 m!58689))

(assert (=> b!64496 m!58659))

(assert (=> b!64496 m!58659))

(assert (=> b!64496 m!58661))

(declare-fun m!59169 () Bool)

(assert (=> bm!5198 m!59169))

(declare-fun m!59171 () Bool)

(assert (=> bm!5196 m!59171))

(declare-fun m!59173 () Bool)

(assert (=> b!64505 m!59173))

(declare-fun m!59175 () Bool)

(assert (=> b!64501 m!59175))

(assert (=> b!64501 m!58659))

(declare-fun m!59177 () Bool)

(assert (=> b!64501 m!59177))

(assert (=> b!64501 m!59175))

(declare-fun m!59179 () Bool)

(assert (=> b!64501 m!59179))

(assert (=> b!64501 m!59171))

(declare-fun m!59181 () Bool)

(assert (=> b!64501 m!59181))

(declare-fun m!59183 () Bool)

(assert (=> b!64501 m!59183))

(declare-fun m!59185 () Bool)

(assert (=> b!64501 m!59185))

(declare-fun m!59187 () Bool)

(assert (=> b!64501 m!59187))

(declare-fun m!59189 () Bool)

(assert (=> b!64501 m!59189))

(declare-fun m!59191 () Bool)

(assert (=> b!64501 m!59191))

(declare-fun m!59193 () Bool)

(assert (=> b!64501 m!59193))

(declare-fun m!59195 () Bool)

(assert (=> b!64501 m!59195))

(declare-fun m!59197 () Bool)

(assert (=> b!64501 m!59197))

(declare-fun m!59199 () Bool)

(assert (=> b!64501 m!59199))

(assert (=> b!64501 m!59187))

(declare-fun m!59201 () Bool)

(assert (=> b!64501 m!59201))

(assert (=> b!64501 m!59191))

(assert (=> b!64501 m!59195))

(declare-fun m!59203 () Bool)

(assert (=> b!64501 m!59203))

(declare-fun m!59205 () Bool)

(assert (=> bm!5200 m!59205))

(assert (=> b!64492 m!58659))

(assert (=> b!64492 m!58659))

(declare-fun m!59207 () Bool)

(assert (=> b!64492 m!59207))

(declare-fun m!59209 () Bool)

(assert (=> b!64492 m!59209))

(assert (=> b!64492 m!59209))

(assert (=> b!64492 m!58873))

(declare-fun m!59211 () Bool)

(assert (=> b!64492 m!59211))

(assert (=> b!64492 m!58873))

(declare-fun m!59213 () Bool)

(assert (=> b!64489 m!59213))

(assert (=> b!64487 m!58659))

(assert (=> b!64487 m!58659))

(assert (=> b!64487 m!58661))

(declare-fun m!59215 () Bool)

(assert (=> bm!5202 m!59215))

(assert (=> bm!5150 d!13495))

(declare-fun d!13497 () Bool)

(assert (=> d!13497 (= (apply!69 lt!27058 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))) (get!1099 (getValueByKey!128 (toList!693 lt!27058) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)))))))

(declare-fun bs!2819 () Bool)

(assert (= bs!2819 d!13497))

(assert (=> bs!2819 m!58511))

(assert (=> bs!2819 m!58727))

(assert (=> bs!2819 m!58727))

(declare-fun m!59217 () Bool)

(assert (=> bs!2819 m!59217))

(assert (=> b!63971 d!13497))

(declare-fun d!13499 () Bool)

(declare-fun c!8828 () Bool)

(assert (=> d!13499 (= c!8828 ((_ is ValueCellFull!866) (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355))))))

(declare-fun e!42262 () V!2873)

(assert (=> d!13499 (= (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)) e!42262)))

(declare-fun b!64506 () Bool)

(assert (=> b!64506 (= e!42262 (get!1097 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!64507 () Bool)

(assert (=> b!64507 (= e!42262 (get!1098 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) (bvadd #b00000000000000000000000000000001 from!355)) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!13499 c!8828) b!64506))

(assert (= (and d!13499 (not c!8828)) b!64507))

(assert (=> b!64506 m!58557))

(assert (=> b!64506 m!58373))

(declare-fun m!59219 () Bool)

(assert (=> b!64506 m!59219))

(assert (=> b!64507 m!58557))

(assert (=> b!64507 m!58373))

(declare-fun m!59221 () Bool)

(assert (=> b!64507 m!59221))

(assert (=> b!63971 d!13499))

(declare-fun d!13501 () Bool)

(declare-fun res!35177 () Bool)

(declare-fun e!42267 () Bool)

(assert (=> d!13501 (=> res!35177 e!42267)))

(assert (=> d!13501 (= res!35177 (and ((_ is Cons!1429) (toList!693 lt!26956)) (= (_1!1030 (h!2013 (toList!693 lt!26956))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (=> d!13501 (= (containsKey!131 (toList!693 lt!26956) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) e!42267)))

(declare-fun b!64512 () Bool)

(declare-fun e!42268 () Bool)

(assert (=> b!64512 (= e!42267 e!42268)))

(declare-fun res!35178 () Bool)

(assert (=> b!64512 (=> (not res!35178) (not e!42268))))

(assert (=> b!64512 (= res!35178 (and (or (not ((_ is Cons!1429) (toList!693 lt!26956))) (bvsle (_1!1030 (h!2013 (toList!693 lt!26956))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))) ((_ is Cons!1429) (toList!693 lt!26956)) (bvslt (_1!1030 (h!2013 (toList!693 lt!26956))) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(declare-fun b!64513 () Bool)

(assert (=> b!64513 (= e!42268 (containsKey!131 (t!4839 (toList!693 lt!26956)) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (= (and d!13501 (not res!35177)) b!64512))

(assert (= (and b!64512 res!35178) b!64513))

(assert (=> b!64513 m!58361))

(declare-fun m!59223 () Bool)

(assert (=> b!64513 m!59223))

(assert (=> d!13353 d!13501))

(assert (=> d!13343 d!13431))

(declare-fun d!13503 () Bool)

(declare-fun e!42269 () Bool)

(assert (=> d!13503 e!42269))

(declare-fun res!35179 () Bool)

(assert (=> d!13503 (=> (not res!35179) (not e!42269))))

(declare-fun lt!27480 () ListLongMap!1355)

(assert (=> d!13503 (= res!35179 (contains!690 lt!27480 (_1!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!27479 () List!1433)

(assert (=> d!13503 (= lt!27480 (ListLongMap!1356 lt!27479))))

(declare-fun lt!27481 () Unit!1748)

(declare-fun lt!27482 () Unit!1748)

(assert (=> d!13503 (= lt!27481 lt!27482)))

(assert (=> d!13503 (= (getValueByKey!128 lt!27479 (_1!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!133 (_2!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13503 (= lt!27482 (lemmaContainsTupThenGetReturnValue!45 lt!27479 (_1!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13503 (= lt!27479 (insertStrictlySorted!48 (toList!693 call!5135) (_1!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!13503 (= (+!83 call!5135 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!27480)))

(declare-fun b!64514 () Bool)

(declare-fun res!35180 () Bool)

(assert (=> b!64514 (=> (not res!35180) (not e!42269))))

(assert (=> b!64514 (= res!35180 (= (getValueByKey!128 (toList!693 lt!27480) (_1!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!133 (_2!1030 (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!64515 () Bool)

(assert (=> b!64515 (= e!42269 (contains!693 (toList!693 lt!27480) (tuple2!2039 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355) (get!1095 (select (arr!1797 (_values!2091 (v!2435 (underlying!236 thiss!992)))) from!355) (dynLambda!310 (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!13503 res!35179) b!64514))

(assert (= (and b!64514 res!35180) b!64515))

(declare-fun m!59225 () Bool)

(assert (=> d!13503 m!59225))

(declare-fun m!59227 () Bool)

(assert (=> d!13503 m!59227))

(declare-fun m!59229 () Bool)

(assert (=> d!13503 m!59229))

(declare-fun m!59231 () Bool)

(assert (=> d!13503 m!59231))

(declare-fun m!59233 () Bool)

(assert (=> b!64514 m!59233))

(declare-fun m!59235 () Bool)

(assert (=> b!64515 m!59235))

(assert (=> b!64117 d!13503))

(declare-fun d!13505 () Bool)

(declare-fun e!42270 () Bool)

(assert (=> d!13505 e!42270))

(declare-fun res!35181 () Bool)

(assert (=> d!13505 (=> res!35181 e!42270)))

(declare-fun lt!27486 () Bool)

(assert (=> d!13505 (= res!35181 (not lt!27486))))

(declare-fun lt!27483 () Bool)

(assert (=> d!13505 (= lt!27486 lt!27483)))

(declare-fun lt!27484 () Unit!1748)

(declare-fun e!42271 () Unit!1748)

(assert (=> d!13505 (= lt!27484 e!42271)))

(declare-fun c!8829 () Bool)

(assert (=> d!13505 (= c!8829 lt!27483)))

(assert (=> d!13505 (= lt!27483 (containsKey!131 (toList!693 call!5144) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> d!13505 (= (contains!690 call!5144 (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)) lt!27486)))

(declare-fun b!64516 () Bool)

(declare-fun lt!27485 () Unit!1748)

(assert (=> b!64516 (= e!42271 lt!27485)))

(assert (=> b!64516 (= lt!27485 (lemmaContainsKeyImpliesGetValueByKeyDefined!79 (toList!693 call!5144) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(assert (=> b!64516 (isDefined!80 (getValueByKey!128 (toList!693 call!5144) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355)))))

(declare-fun b!64517 () Bool)

(declare-fun Unit!1775 () Unit!1748)

(assert (=> b!64517 (= e!42271 Unit!1775)))

(declare-fun b!64518 () Bool)

(assert (=> b!64518 (= e!42270 (isDefined!80 (getValueByKey!128 (toList!693 call!5144) (select (arr!1796 (_keys!3744 (v!2435 (underlying!236 thiss!992)))) from!355))))))

(assert (= (and d!13505 c!8829) b!64516))

(assert (= (and d!13505 (not c!8829)) b!64517))

(assert (= (and d!13505 (not res!35181)) b!64518))

(assert (=> d!13505 m!58361))

(declare-fun m!59237 () Bool)

(assert (=> d!13505 m!59237))

(assert (=> b!64516 m!58361))

(declare-fun m!59239 () Bool)

(assert (=> b!64516 m!59239))

(assert (=> b!64516 m!58361))

(declare-fun m!59241 () Bool)

(assert (=> b!64516 m!59241))

(assert (=> b!64516 m!59241))

(declare-fun m!59243 () Bool)

(assert (=> b!64516 m!59243))

(assert (=> b!64518 m!58361))

(assert (=> b!64518 m!59241))

(assert (=> b!64518 m!59241))

(assert (=> b!64518 m!59243))

(assert (=> b!64107 d!13505))

(assert (=> bm!5142 d!13343))

(declare-fun mapNonEmpty!2981 () Bool)

(declare-fun mapRes!2981 () Bool)

(declare-fun tp!8183 () Bool)

(declare-fun e!42273 () Bool)

(assert (=> mapNonEmpty!2981 (= mapRes!2981 (and tp!8183 e!42273))))

(declare-fun mapValue!2981 () ValueCell!866)

(declare-fun mapRest!2981 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapKey!2981 () (_ BitVec 32))

(assert (=> mapNonEmpty!2981 (= mapRest!2980 (store mapRest!2981 mapKey!2981 mapValue!2981))))

(declare-fun b!64519 () Bool)

(assert (=> b!64519 (= e!42273 tp_is_empty!2419)))

(declare-fun mapIsEmpty!2981 () Bool)

(assert (=> mapIsEmpty!2981 mapRes!2981))

(declare-fun b!64520 () Bool)

(declare-fun e!42272 () Bool)

(assert (=> b!64520 (= e!42272 tp_is_empty!2419)))

(declare-fun condMapEmpty!2981 () Bool)

(declare-fun mapDefault!2981 () ValueCell!866)

(assert (=> mapNonEmpty!2980 (= condMapEmpty!2981 (= mapRest!2980 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2981)))))

(assert (=> mapNonEmpty!2980 (= tp!8182 (and e!42272 mapRes!2981))))

(assert (= (and mapNonEmpty!2980 condMapEmpty!2981) mapIsEmpty!2981))

(assert (= (and mapNonEmpty!2980 (not condMapEmpty!2981)) mapNonEmpty!2981))

(assert (= (and mapNonEmpty!2981 ((_ is ValueCellFull!866) mapValue!2981)) b!64519))

(assert (= (and mapNonEmpty!2980 ((_ is ValueCellFull!866) mapDefault!2981)) b!64520))

(declare-fun m!59245 () Bool)

(assert (=> mapNonEmpty!2981 m!59245))

(declare-fun mapNonEmpty!2982 () Bool)

(declare-fun mapRes!2982 () Bool)

(declare-fun tp!8184 () Bool)

(declare-fun e!42275 () Bool)

(assert (=> mapNonEmpty!2982 (= mapRes!2982 (and tp!8184 e!42275))))

(declare-fun mapRest!2982 () (Array (_ BitVec 32) ValueCell!866))

(declare-fun mapValue!2982 () ValueCell!866)

(declare-fun mapKey!2982 () (_ BitVec 32))

(assert (=> mapNonEmpty!2982 (= mapRest!2979 (store mapRest!2982 mapKey!2982 mapValue!2982))))

(declare-fun b!64521 () Bool)

(assert (=> b!64521 (= e!42275 tp_is_empty!2419)))

(declare-fun mapIsEmpty!2982 () Bool)

(assert (=> mapIsEmpty!2982 mapRes!2982))

(declare-fun b!64522 () Bool)

(declare-fun e!42274 () Bool)

(assert (=> b!64522 (= e!42274 tp_is_empty!2419)))

(declare-fun condMapEmpty!2982 () Bool)

(declare-fun mapDefault!2982 () ValueCell!866)

(assert (=> mapNonEmpty!2979 (= condMapEmpty!2982 (= mapRest!2979 ((as const (Array (_ BitVec 32) ValueCell!866)) mapDefault!2982)))))

(assert (=> mapNonEmpty!2979 (= tp!8181 (and e!42274 mapRes!2982))))

(assert (= (and mapNonEmpty!2979 condMapEmpty!2982) mapIsEmpty!2982))

(assert (= (and mapNonEmpty!2979 (not condMapEmpty!2982)) mapNonEmpty!2982))

(assert (= (and mapNonEmpty!2982 ((_ is ValueCellFull!866) mapValue!2982)) b!64521))

(assert (= (and mapNonEmpty!2979 ((_ is ValueCellFull!866) mapDefault!2982)) b!64522))

(declare-fun m!59247 () Bool)

(assert (=> mapNonEmpty!2982 m!59247))

(declare-fun b_lambda!2897 () Bool)

(assert (= b_lambda!2893 (or (and b!63778 b_free!2005) (and b!63776 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))))) b_lambda!2897)))

(declare-fun b_lambda!2899 () Bool)

(assert (= b_lambda!2887 (or (and b!63778 b_free!2005 (= (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63776 b_free!2007) b_lambda!2899)))

(declare-fun b_lambda!2901 () Bool)

(assert (= b_lambda!2895 (or (and b!63778 b_free!2005 (= (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63776 b_free!2007) b_lambda!2901)))

(declare-fun b_lambda!2903 () Bool)

(assert (= b_lambda!2891 (or (and b!63778 b_free!2005) (and b!63776 b_free!2007 (= (defaultEntry!2108 newMap!16) (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))))) b_lambda!2903)))

(declare-fun b_lambda!2905 () Bool)

(assert (= b_lambda!2889 (or (and b!63778 b_free!2005 (= (defaultEntry!2108 (v!2435 (underlying!236 thiss!992))) (defaultEntry!2108 newMap!16))) (and b!63776 b_free!2007) b_lambda!2905)))

(check-sat (not b!64420) (not b!64300) (not d!13473) (not b!64197) (not b!64184) (not d!13375) (not bm!5167) (not b!64506) (not b!64399) (not b!64395) (not b!64266) (not b!64201) (not b!64282) (not b!64465) (not b!64305) (not b!64418) (not b!64280) (not b!64397) (not b!64467) (not mapNonEmpty!2982) (not b_next!2005) (not d!13417) (not bm!5195) (not b_lambda!2901) (not b!64394) (not d!13371) (not b!64195) (not b!64316) (not b!64484) (not bm!5198) (not bm!5169) (not b!64173) (not b!64230) (not b!64367) (not d!13433) (not b!64518) (not d!13389) (not b!64408) (not b!64475) (not b!64515) (not b!64295) (not b!64246) (not b!64485) (not b!64321) (not d!13505) (not b!64174) (not d!13431) (not d!13451) (not bm!5154) (not b!64284) (not bm!5163) (not b!64474) (not d!13491) (not b!64400) (not b!64287) (not b!64301) (not d!13455) (not d!13413) tp_is_empty!2419 (not b!64255) b_and!3953 (not d!13403) (not b!64414) (not b!64291) (not b!64463) (not bm!5158) (not d!13457) (not b!64415) (not b!64480) (not b!64489) (not b!64479) (not b_lambda!2897) (not b_lambda!2881) (not bm!5200) (not b!64331) (not d!13453) (not bm!5192) (not d!13381) (not bm!5178) (not b!64487) (not b!64242) (not b!64404) (not b!64236) (not b!64187) (not b!64249) (not b!64296) (not b!64188) (not bm!5165) (not b!64339) (not d!13489) (not bm!5196) (not b!64317) (not bm!5194) (not b!64181) (not bm!5162) (not b!64501) (not b!64507) (not b!64235) (not d!13461) (not b!64500) (not d!13471) (not b!64398) (not b!64303) (not b!64505) (not b!64190) (not b!64481) (not b!64233) (not d!13401) (not b!64334) (not b!64513) (not b!64337) (not bm!5202) (not b_next!2007) (not d!13421) (not d!13503) (not d!13497) (not d!13397) (not d!13429) (not d!13449) (not b!64462) (not b!64516) (not d!13425) (not d!13495) (not bm!5179) (not d!13415) (not d!13467) (not d!13481) (not b!64492) (not b!64496) (not b!64416) (not bm!5173) (not d!13441) (not d!13469) (not b!64341) (not b!64232) b_and!3955 (not d!13383) (not b!64401) (not d!13477) (not bm!5172) (not bm!5182) (not b!64177) (not d!13479) (not d!13391) (not bm!5160) (not b!64176) (not b!64336) (not b!64413) (not bm!5155) (not d!13411) (not d!13379) (not b!64234) (not d!13487) (not d!13475) (not b!64178) (not d!13483) (not b!64179) (not d!13407) (not b!64514) (not d!13377) (not b!64260) (not b_lambda!2905) (not bm!5191) (not b!64245) (not b_lambda!2885) (not d!13459) (not b_lambda!2899) (not d!13445) (not b_lambda!2903) (not b!64482) (not d!13493) (not b!64278) (not d!13409) (not b!64277) (not b!64405) (not b!64457) (not bm!5156) (not b!64308) (not b!64215) (not b!64407) (not d!13385) (not b!64312) (not mapNonEmpty!2981) (not b!64243) (not d!13465) (not b!64196) (not b!64199) (not b!64456) (not d!13463) (not b!64406))
(check-sat b_and!3953 b_and!3955 (not b_next!2005) (not b_next!2007))
