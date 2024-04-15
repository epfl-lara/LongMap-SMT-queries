; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8304 () Bool)

(assert start!8304)

(declare-fun b!54072 () Bool)

(declare-fun b_free!1765 () Bool)

(declare-fun b_next!1765 () Bool)

(assert (=> b!54072 (= b_free!1765 (not b_next!1765))))

(declare-fun tp!7396 () Bool)

(declare-fun b_and!3073 () Bool)

(assert (=> b!54072 (= tp!7396 b_and!3073)))

(declare-fun b!54055 () Bool)

(declare-fun b_free!1767 () Bool)

(declare-fun b_next!1767 () Bool)

(assert (=> b!54055 (= b_free!1767 (not b_next!1767))))

(declare-fun tp!7397 () Bool)

(declare-fun b_and!3075 () Bool)

(assert (=> b!54055 (= tp!7397 b_and!3075)))

(declare-fun b!54054 () Bool)

(declare-fun res!30630 () Bool)

(declare-fun e!35287 () Bool)

(assert (=> b!54054 (=> (not res!30630) (not e!35287))))

(declare-datatypes ((V!2713 0))(
  ( (V!2714 (val!1194 Int)) )
))
(declare-datatypes ((array!3501 0))(
  ( (array!3502 (arr!1672 (Array (_ BitVec 32) (_ BitVec 64))) (size!1902 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!806 0))(
  ( (ValueCellFull!806 (v!2273 V!2713)) (EmptyCell!806) )
))
(declare-datatypes ((array!3503 0))(
  ( (array!3504 (arr!1673 (Array (_ BitVec 32) ValueCell!806)) (size!1903 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!520 0))(
  ( (LongMapFixedSize!521 (defaultEntry!1974 Int) (mask!5816 (_ BitVec 32)) (extraKeys!1865 (_ BitVec 32)) (zeroValue!1892 V!2713) (minValue!1892 V!2713) (_size!309 (_ BitVec 32)) (_keys!3593 array!3501) (_values!1957 array!3503) (_vacant!309 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!338 0))(
  ( (Cell!339 (v!2274 LongMapFixedSize!520)) )
))
(declare-datatypes ((LongMap!338 0))(
  ( (LongMap!339 (underlying!180 Cell!338)) )
))
(declare-fun thiss!992 () LongMap!338)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54054 (= res!30630 (validMask!0 (mask!5816 (v!2274 (underlying!180 thiss!992)))))))

(declare-fun e!35296 () Bool)

(declare-fun tp_is_empty!2299 () Bool)

(declare-fun e!35289 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!520)

(declare-fun array_inv!1029 (array!3501) Bool)

(declare-fun array_inv!1030 (array!3503) Bool)

(assert (=> b!54055 (= e!35289 (and tp!7397 tp_is_empty!2299 (array_inv!1029 (_keys!3593 newMap!16)) (array_inv!1030 (_values!1957 newMap!16)) e!35296))))

(declare-fun b!54056 () Bool)

(declare-fun e!35285 () Bool)

(assert (=> b!54056 (= e!35285 tp_is_empty!2299)))

(declare-fun res!30624 () Bool)

(declare-fun e!35297 () Bool)

(assert (=> start!8304 (=> (not res!30624) (not e!35297))))

(declare-fun valid!201 (LongMap!338) Bool)

(assert (=> start!8304 (= res!30624 (valid!201 thiss!992))))

(assert (=> start!8304 e!35297))

(declare-fun e!35299 () Bool)

(assert (=> start!8304 e!35299))

(assert (=> start!8304 true))

(assert (=> start!8304 e!35289))

(declare-fun b!54057 () Bool)

(declare-fun e!35292 () Bool)

(declare-fun e!35293 () Bool)

(declare-fun mapRes!2568 () Bool)

(assert (=> b!54057 (= e!35292 (and e!35293 mapRes!2568))))

(declare-fun condMapEmpty!2568 () Bool)

(declare-fun mapDefault!2568 () ValueCell!806)

(assert (=> b!54057 (= condMapEmpty!2568 (= (arr!1673 (_values!1957 (v!2274 (underlying!180 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!806)) mapDefault!2568)))))

(declare-fun b!54058 () Bool)

(declare-fun res!30627 () Bool)

(assert (=> b!54058 (=> (not res!30627) (not e!35297))))

(declare-fun from!355 () (_ BitVec 32))

(assert (=> b!54058 (= res!30627 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1902 (_keys!3593 (v!2274 (underlying!180 thiss!992)))))))))

(declare-fun b!54059 () Bool)

(declare-fun e!35294 () Bool)

(assert (=> b!54059 (= e!35294 tp_is_empty!2299)))

(declare-fun b!54060 () Bool)

(declare-fun e!35286 () Bool)

(declare-fun e!35295 () Bool)

(assert (=> b!54060 (= e!35286 e!35295)))

(declare-fun b!54061 () Bool)

(declare-fun res!30631 () Bool)

(assert (=> b!54061 (=> (not res!30631) (not e!35287))))

(declare-datatypes ((List!1373 0))(
  ( (Nil!1370) (Cons!1369 (h!1949 (_ BitVec 64)) (t!4506 List!1373)) )
))
(declare-fun arrayNoDuplicates!0 (array!3501 (_ BitVec 32) List!1373) Bool)

(assert (=> b!54061 (= res!30631 (arrayNoDuplicates!0 (_keys!3593 (v!2274 (underlying!180 thiss!992))) #b00000000000000000000000000000000 Nil!1370))))

(declare-fun b!54062 () Bool)

(assert (=> b!54062 (= e!35287 false)))

(declare-datatypes ((tuple2!1924 0))(
  ( (tuple2!1925 (_1!973 (_ BitVec 64)) (_2!973 V!2713)) )
))
(declare-datatypes ((List!1374 0))(
  ( (Nil!1371) (Cons!1370 (h!1950 tuple2!1924) (t!4507 List!1374)) )
))
(declare-datatypes ((ListLongMap!1297 0))(
  ( (ListLongMap!1298 (toList!664 List!1374)) )
))
(declare-fun lt!21577 () ListLongMap!1297)

(declare-fun lt!21578 () Bool)

(declare-fun contains!639 (ListLongMap!1297 (_ BitVec 64)) Bool)

(assert (=> b!54062 (= lt!21578 (contains!639 lt!21577 (select (arr!1672 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) from!355)))))

(declare-fun b!54063 () Bool)

(declare-fun e!35291 () Bool)

(assert (=> b!54063 (= e!35297 e!35291)))

(declare-fun res!30628 () Bool)

(assert (=> b!54063 (=> (not res!30628) (not e!35291))))

(declare-fun lt!21575 () ListLongMap!1297)

(assert (=> b!54063 (= res!30628 (and (= lt!21577 lt!21575) (not (= (select (arr!1672 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1672 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun map!1049 (LongMapFixedSize!520) ListLongMap!1297)

(assert (=> b!54063 (= lt!21575 (map!1049 newMap!16))))

(declare-fun getCurrentListMap!367 (array!3501 array!3503 (_ BitVec 32) (_ BitVec 32) V!2713 V!2713 (_ BitVec 32) Int) ListLongMap!1297)

(assert (=> b!54063 (= lt!21577 (getCurrentListMap!367 (_keys!3593 (v!2274 (underlying!180 thiss!992))) (_values!1957 (v!2274 (underlying!180 thiss!992))) (mask!5816 (v!2274 (underlying!180 thiss!992))) (extraKeys!1865 (v!2274 (underlying!180 thiss!992))) (zeroValue!1892 (v!2274 (underlying!180 thiss!992))) (minValue!1892 (v!2274 (underlying!180 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1974 (v!2274 (underlying!180 thiss!992)))))))

(declare-fun b!54064 () Bool)

(assert (=> b!54064 (= e!35291 e!35287)))

(declare-fun res!30629 () Bool)

(assert (=> b!54064 (=> (not res!30629) (not e!35287))))

(assert (=> b!54064 (= res!30629 (contains!639 lt!21575 (select (arr!1672 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1926 0))(
  ( (tuple2!1927 (_1!974 Bool) (_2!974 LongMapFixedSize!520)) )
))
(declare-fun lt!21576 () tuple2!1926)

(declare-fun update!58 (LongMapFixedSize!520 (_ BitVec 64) V!2713) tuple2!1926)

(declare-fun get!1010 (ValueCell!806 V!2713) V!2713)

(declare-fun dynLambda!282 (Int (_ BitVec 64)) V!2713)

(assert (=> b!54064 (= lt!21576 (update!58 newMap!16 (select (arr!1672 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) from!355) (get!1010 (select (arr!1673 (_values!1957 (v!2274 (underlying!180 thiss!992)))) from!355) (dynLambda!282 (defaultEntry!1974 (v!2274 (underlying!180 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!54065 () Bool)

(declare-fun res!30633 () Bool)

(assert (=> b!54065 (=> (not res!30633) (not e!35287))))

(assert (=> b!54065 (= res!30633 (and (= (size!1903 (_values!1957 (v!2274 (underlying!180 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5816 (v!2274 (underlying!180 thiss!992))))) (= (size!1902 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) (size!1903 (_values!1957 (v!2274 (underlying!180 thiss!992))))) (bvsge (mask!5816 (v!2274 (underlying!180 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1865 (v!2274 (underlying!180 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1865 (v!2274 (underlying!180 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54066 () Bool)

(declare-fun e!35290 () Bool)

(declare-fun mapRes!2567 () Bool)

(assert (=> b!54066 (= e!35296 (and e!35290 mapRes!2567))))

(declare-fun condMapEmpty!2567 () Bool)

(declare-fun mapDefault!2567 () ValueCell!806)

(assert (=> b!54066 (= condMapEmpty!2567 (= (arr!1673 (_values!1957 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!806)) mapDefault!2567)))))

(declare-fun mapNonEmpty!2567 () Bool)

(declare-fun tp!7398 () Bool)

(assert (=> mapNonEmpty!2567 (= mapRes!2567 (and tp!7398 e!35294))))

(declare-fun mapValue!2567 () ValueCell!806)

(declare-fun mapRest!2567 () (Array (_ BitVec 32) ValueCell!806))

(declare-fun mapKey!2567 () (_ BitVec 32))

(assert (=> mapNonEmpty!2567 (= (arr!1673 (_values!1957 newMap!16)) (store mapRest!2567 mapKey!2567 mapValue!2567))))

(declare-fun b!54067 () Bool)

(assert (=> b!54067 (= e!35293 tp_is_empty!2299)))

(declare-fun b!54068 () Bool)

(declare-fun res!30626 () Bool)

(assert (=> b!54068 (=> (not res!30626) (not e!35297))))

(declare-fun valid!202 (LongMapFixedSize!520) Bool)

(assert (=> b!54068 (= res!30626 (valid!202 newMap!16))))

(declare-fun b!54069 () Bool)

(assert (=> b!54069 (= e!35299 e!35286)))

(declare-fun b!54070 () Bool)

(declare-fun res!30623 () Bool)

(assert (=> b!54070 (=> (not res!30623) (not e!35287))))

(assert (=> b!54070 (= res!30623 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1902 (_keys!3593 (v!2274 (underlying!180 thiss!992)))))))))

(declare-fun b!54071 () Bool)

(declare-fun res!30632 () Bool)

(assert (=> b!54071 (=> (not res!30632) (not e!35287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3501 (_ BitVec 32)) Bool)

(assert (=> b!54071 (= res!30632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3593 (v!2274 (underlying!180 thiss!992))) (mask!5816 (v!2274 (underlying!180 thiss!992)))))))

(assert (=> b!54072 (= e!35295 (and tp!7396 tp_is_empty!2299 (array_inv!1029 (_keys!3593 (v!2274 (underlying!180 thiss!992)))) (array_inv!1030 (_values!1957 (v!2274 (underlying!180 thiss!992)))) e!35292))))

(declare-fun b!54073 () Bool)

(assert (=> b!54073 (= e!35290 tp_is_empty!2299)))

(declare-fun mapIsEmpty!2567 () Bool)

(assert (=> mapIsEmpty!2567 mapRes!2567))

(declare-fun mapIsEmpty!2568 () Bool)

(assert (=> mapIsEmpty!2568 mapRes!2568))

(declare-fun b!54074 () Bool)

(declare-fun res!30625 () Bool)

(assert (=> b!54074 (=> (not res!30625) (not e!35297))))

(assert (=> b!54074 (= res!30625 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5816 newMap!16)) (_size!309 (v!2274 (underlying!180 thiss!992)))))))

(declare-fun mapNonEmpty!2568 () Bool)

(declare-fun tp!7395 () Bool)

(assert (=> mapNonEmpty!2568 (= mapRes!2568 (and tp!7395 e!35285))))

(declare-fun mapRest!2568 () (Array (_ BitVec 32) ValueCell!806))

(declare-fun mapKey!2568 () (_ BitVec 32))

(declare-fun mapValue!2568 () ValueCell!806)

(assert (=> mapNonEmpty!2568 (= (arr!1673 (_values!1957 (v!2274 (underlying!180 thiss!992)))) (store mapRest!2568 mapKey!2568 mapValue!2568))))

(assert (= (and start!8304 res!30624) b!54058))

(assert (= (and b!54058 res!30627) b!54068))

(assert (= (and b!54068 res!30626) b!54074))

(assert (= (and b!54074 res!30625) b!54063))

(assert (= (and b!54063 res!30628) b!54064))

(assert (= (and b!54064 res!30629) b!54054))

(assert (= (and b!54054 res!30630) b!54065))

(assert (= (and b!54065 res!30633) b!54071))

(assert (= (and b!54071 res!30632) b!54061))

(assert (= (and b!54061 res!30631) b!54070))

(assert (= (and b!54070 res!30623) b!54062))

(assert (= (and b!54057 condMapEmpty!2568) mapIsEmpty!2568))

(assert (= (and b!54057 (not condMapEmpty!2568)) mapNonEmpty!2568))

(get-info :version)

(assert (= (and mapNonEmpty!2568 ((_ is ValueCellFull!806) mapValue!2568)) b!54056))

(assert (= (and b!54057 ((_ is ValueCellFull!806) mapDefault!2568)) b!54067))

(assert (= b!54072 b!54057))

(assert (= b!54060 b!54072))

(assert (= b!54069 b!54060))

(assert (= start!8304 b!54069))

(assert (= (and b!54066 condMapEmpty!2567) mapIsEmpty!2567))

(assert (= (and b!54066 (not condMapEmpty!2567)) mapNonEmpty!2567))

(assert (= (and mapNonEmpty!2567 ((_ is ValueCellFull!806) mapValue!2567)) b!54059))

(assert (= (and b!54066 ((_ is ValueCellFull!806) mapDefault!2567)) b!54073))

(assert (= b!54055 b!54066))

(assert (= start!8304 b!54055))

(declare-fun b_lambda!2397 () Bool)

(assert (=> (not b_lambda!2397) (not b!54064)))

(declare-fun t!4503 () Bool)

(declare-fun tb!1109 () Bool)

(assert (=> (and b!54072 (= (defaultEntry!1974 (v!2274 (underlying!180 thiss!992))) (defaultEntry!1974 (v!2274 (underlying!180 thiss!992)))) t!4503) tb!1109))

(declare-fun result!2061 () Bool)

(assert (=> tb!1109 (= result!2061 tp_is_empty!2299)))

(assert (=> b!54064 t!4503))

(declare-fun b_and!3077 () Bool)

(assert (= b_and!3073 (and (=> t!4503 result!2061) b_and!3077)))

(declare-fun t!4505 () Bool)

(declare-fun tb!1111 () Bool)

(assert (=> (and b!54055 (= (defaultEntry!1974 newMap!16) (defaultEntry!1974 (v!2274 (underlying!180 thiss!992)))) t!4505) tb!1111))

(declare-fun result!2065 () Bool)

(assert (= result!2065 result!2061))

(assert (=> b!54064 t!4505))

(declare-fun b_and!3079 () Bool)

(assert (= b_and!3075 (and (=> t!4505 result!2065) b_and!3079)))

(declare-fun m!45763 () Bool)

(assert (=> mapNonEmpty!2567 m!45763))

(declare-fun m!45765 () Bool)

(assert (=> b!54062 m!45765))

(assert (=> b!54062 m!45765))

(declare-fun m!45767 () Bool)

(assert (=> b!54062 m!45767))

(declare-fun m!45769 () Bool)

(assert (=> b!54061 m!45769))

(assert (=> b!54063 m!45765))

(declare-fun m!45771 () Bool)

(assert (=> b!54063 m!45771))

(declare-fun m!45773 () Bool)

(assert (=> b!54063 m!45773))

(declare-fun m!45775 () Bool)

(assert (=> mapNonEmpty!2568 m!45775))

(declare-fun m!45777 () Bool)

(assert (=> b!54071 m!45777))

(declare-fun m!45779 () Bool)

(assert (=> b!54072 m!45779))

(declare-fun m!45781 () Bool)

(assert (=> b!54072 m!45781))

(declare-fun m!45783 () Bool)

(assert (=> b!54068 m!45783))

(declare-fun m!45785 () Bool)

(assert (=> b!54054 m!45785))

(declare-fun m!45787 () Bool)

(assert (=> start!8304 m!45787))

(declare-fun m!45789 () Bool)

(assert (=> b!54055 m!45789))

(declare-fun m!45791 () Bool)

(assert (=> b!54055 m!45791))

(declare-fun m!45793 () Bool)

(assert (=> b!54064 m!45793))

(declare-fun m!45795 () Bool)

(assert (=> b!54064 m!45795))

(declare-fun m!45797 () Bool)

(assert (=> b!54064 m!45797))

(assert (=> b!54064 m!45765))

(declare-fun m!45799 () Bool)

(assert (=> b!54064 m!45799))

(assert (=> b!54064 m!45765))

(assert (=> b!54064 m!45795))

(assert (=> b!54064 m!45765))

(assert (=> b!54064 m!45797))

(declare-fun m!45801 () Bool)

(assert (=> b!54064 m!45801))

(assert (=> b!54064 m!45793))

(check-sat (not start!8304) (not b!54071) tp_is_empty!2299 (not b!54068) (not b_next!1765) (not mapNonEmpty!2567) (not b!54055) (not mapNonEmpty!2568) (not b!54062) (not b_next!1767) (not b!54064) (not b!54054) (not b!54072) (not b!54061) b_and!3079 b_and!3077 (not b!54063) (not b_lambda!2397))
(check-sat b_and!3077 b_and!3079 (not b_next!1765) (not b_next!1767))
