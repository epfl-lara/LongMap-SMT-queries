; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8296 () Bool)

(assert start!8296)

(declare-fun b!54009 () Bool)

(declare-fun b_free!1757 () Bool)

(declare-fun b_next!1757 () Bool)

(assert (=> b!54009 (= b_free!1757 (not b_next!1757))))

(declare-fun tp!7374 () Bool)

(declare-fun b_and!3055 () Bool)

(assert (=> b!54009 (= tp!7374 b_and!3055)))

(declare-fun b!54008 () Bool)

(declare-fun b_free!1759 () Bool)

(declare-fun b_next!1759 () Bool)

(assert (=> b!54008 (= b_free!1759 (not b_next!1759))))

(declare-fun tp!7371 () Bool)

(declare-fun b_and!3057 () Bool)

(assert (=> b!54008 (= tp!7371 b_and!3057)))

(declare-fun b!53990 () Bool)

(declare-fun e!35246 () Bool)

(declare-fun tp_is_empty!2295 () Bool)

(assert (=> b!53990 (= e!35246 tp_is_empty!2295)))

(declare-fun b!53991 () Bool)

(declare-fun e!35240 () Bool)

(declare-fun e!35252 () Bool)

(assert (=> b!53991 (= e!35240 e!35252)))

(declare-fun b!53992 () Bool)

(declare-fun res!30583 () Bool)

(declare-fun e!35251 () Bool)

(assert (=> b!53992 (=> (not res!30583) (not e!35251))))

(declare-datatypes ((V!2707 0))(
  ( (V!2708 (val!1192 Int)) )
))
(declare-datatypes ((array!3513 0))(
  ( (array!3514 (arr!1679 (Array (_ BitVec 32) (_ BitVec 64))) (size!1908 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!804 0))(
  ( (ValueCellFull!804 (v!2270 V!2707)) (EmptyCell!804) )
))
(declare-datatypes ((array!3515 0))(
  ( (array!3516 (arr!1680 (Array (_ BitVec 32) ValueCell!804)) (size!1909 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!516 0))(
  ( (LongMapFixedSize!517 (defaultEntry!1972 Int) (mask!5813 (_ BitVec 32)) (extraKeys!1863 (_ BitVec 32)) (zeroValue!1890 V!2707) (minValue!1890 V!2707) (_size!307 (_ BitVec 32)) (_keys!3592 array!3513) (_values!1955 array!3515) (_vacant!307 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!332 0))(
  ( (Cell!333 (v!2271 LongMapFixedSize!516)) )
))
(declare-datatypes ((LongMap!332 0))(
  ( (LongMap!333 (underlying!177 Cell!332)) )
))
(declare-fun thiss!992 () LongMap!332)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3513 (_ BitVec 32)) Bool)

(assert (=> b!53992 (= res!30583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3592 (v!2271 (underlying!177 thiss!992))) (mask!5813 (v!2271 (underlying!177 thiss!992)))))))

(declare-fun b!53993 () Bool)

(declare-fun e!35239 () Bool)

(declare-fun e!35244 () Bool)

(assert (=> b!53993 (= e!35239 e!35244)))

(declare-fun res!30578 () Bool)

(assert (=> b!53993 (=> (not res!30578) (not e!35244))))

(declare-datatypes ((tuple2!1900 0))(
  ( (tuple2!1901 (_1!961 (_ BitVec 64)) (_2!961 V!2707)) )
))
(declare-datatypes ((List!1365 0))(
  ( (Nil!1362) (Cons!1361 (h!1941 tuple2!1900) (t!4491 List!1365)) )
))
(declare-datatypes ((ListLongMap!1297 0))(
  ( (ListLongMap!1298 (toList!664 List!1365)) )
))
(declare-fun lt!21570 () ListLongMap!1297)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lt!21567 () ListLongMap!1297)

(assert (=> b!53993 (= res!30578 (and (= lt!21570 lt!21567) (not (= (select (arr!1679 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) from!355) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1679 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) from!355) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun newMap!16 () LongMapFixedSize!516)

(declare-fun map!1044 (LongMapFixedSize!516) ListLongMap!1297)

(assert (=> b!53993 (= lt!21567 (map!1044 newMap!16))))

(declare-fun getCurrentListMap!375 (array!3513 array!3515 (_ BitVec 32) (_ BitVec 32) V!2707 V!2707 (_ BitVec 32) Int) ListLongMap!1297)

(assert (=> b!53993 (= lt!21570 (getCurrentListMap!375 (_keys!3592 (v!2271 (underlying!177 thiss!992))) (_values!1955 (v!2271 (underlying!177 thiss!992))) (mask!5813 (v!2271 (underlying!177 thiss!992))) (extraKeys!1863 (v!2271 (underlying!177 thiss!992))) (zeroValue!1890 (v!2271 (underlying!177 thiss!992))) (minValue!1890 (v!2271 (underlying!177 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!1972 (v!2271 (underlying!177 thiss!992)))))))

(declare-fun b!53994 () Bool)

(declare-fun e!35243 () Bool)

(assert (=> b!53994 (= e!35252 e!35243)))

(declare-fun b!53995 () Bool)

(declare-fun e!35247 () Bool)

(assert (=> b!53995 (= e!35247 tp_is_empty!2295)))

(declare-fun b!53996 () Bool)

(declare-fun e!35242 () Bool)

(assert (=> b!53996 (= e!35242 tp_is_empty!2295)))

(declare-fun b!53997 () Bool)

(declare-fun res!30586 () Bool)

(assert (=> b!53997 (=> (not res!30586) (not e!35251))))

(declare-datatypes ((List!1366 0))(
  ( (Nil!1363) (Cons!1362 (h!1942 (_ BitVec 64)) (t!4492 List!1366)) )
))
(declare-fun arrayNoDuplicates!0 (array!3513 (_ BitVec 32) List!1366) Bool)

(assert (=> b!53997 (= res!30586 (arrayNoDuplicates!0 (_keys!3592 (v!2271 (underlying!177 thiss!992))) #b00000000000000000000000000000000 Nil!1363))))

(declare-fun b!53999 () Bool)

(declare-fun e!35238 () Bool)

(declare-fun mapRes!2556 () Bool)

(assert (=> b!53999 (= e!35238 (and e!35246 mapRes!2556))))

(declare-fun condMapEmpty!2556 () Bool)

(declare-fun mapDefault!2555 () ValueCell!804)

(assert (=> b!53999 (= condMapEmpty!2556 (= (arr!1680 (_values!1955 newMap!16)) ((as const (Array (_ BitVec 32) ValueCell!804)) mapDefault!2555)))))

(declare-fun b!54000 () Bool)

(declare-fun e!35248 () Bool)

(assert (=> b!54000 (= e!35248 tp_is_empty!2295)))

(declare-fun b!54001 () Bool)

(declare-fun res!30582 () Bool)

(assert (=> b!54001 (=> (not res!30582) (not e!35239))))

(assert (=> b!54001 (= res!30582 (and (bvsge from!355 #b00000000000000000000000000000000) (bvslt from!355 (size!1908 (_keys!3592 (v!2271 (underlying!177 thiss!992)))))))))

(declare-fun mapIsEmpty!2555 () Bool)

(assert (=> mapIsEmpty!2555 mapRes!2556))

(declare-fun mapIsEmpty!2556 () Bool)

(declare-fun mapRes!2555 () Bool)

(assert (=> mapIsEmpty!2556 mapRes!2555))

(declare-fun b!54002 () Bool)

(declare-fun res!30584 () Bool)

(assert (=> b!54002 (=> (not res!30584) (not e!35239))))

(assert (=> b!54002 (= res!30584 (bvsge (bvadd #b00000000000000000000000000000001 (mask!5813 newMap!16)) (_size!307 (v!2271 (underlying!177 thiss!992)))))))

(declare-fun b!54003 () Bool)

(declare-fun res!30585 () Bool)

(assert (=> b!54003 (=> (not res!30585) (not e!35251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!54003 (= res!30585 (validMask!0 (mask!5813 (v!2271 (underlying!177 thiss!992)))))))

(declare-fun b!54004 () Bool)

(declare-fun res!30577 () Bool)

(assert (=> b!54004 (=> (not res!30577) (not e!35251))))

(assert (=> b!54004 (= res!30577 (and (bvsge (bvadd #b00000000000000000000000000000001 from!355) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!355) (size!1908 (_keys!3592 (v!2271 (underlying!177 thiss!992)))))))))

(declare-fun b!54005 () Bool)

(declare-fun res!30581 () Bool)

(assert (=> b!54005 (=> (not res!30581) (not e!35251))))

(assert (=> b!54005 (= res!30581 (and (= (size!1909 (_values!1955 (v!2271 (underlying!177 thiss!992)))) (bvadd #b00000000000000000000000000000001 (mask!5813 (v!2271 (underlying!177 thiss!992))))) (= (size!1908 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) (size!1909 (_values!1955 (v!2271 (underlying!177 thiss!992))))) (bvsge (mask!5813 (v!2271 (underlying!177 thiss!992))) #b00000000000000000000000000000000) (bvsge (extraKeys!1863 (v!2271 (underlying!177 thiss!992))) #b00000000000000000000000000000000) (bvsle (extraKeys!1863 (v!2271 (underlying!177 thiss!992))) #b00000000000000000000000000000011)))))

(declare-fun b!54006 () Bool)

(declare-fun res!30580 () Bool)

(assert (=> b!54006 (=> (not res!30580) (not e!35239))))

(declare-fun valid!197 (LongMapFixedSize!516) Bool)

(assert (=> b!54006 (= res!30580 (valid!197 newMap!16))))

(declare-fun b!54007 () Bool)

(declare-fun e!35245 () Bool)

(assert (=> b!54007 (= e!35245 (and e!35248 mapRes!2555))))

(declare-fun condMapEmpty!2555 () Bool)

(declare-fun mapDefault!2556 () ValueCell!804)

(assert (=> b!54007 (= condMapEmpty!2555 (= (arr!1680 (_values!1955 (v!2271 (underlying!177 thiss!992)))) ((as const (Array (_ BitVec 32) ValueCell!804)) mapDefault!2556)))))

(declare-fun e!35249 () Bool)

(declare-fun array_inv!1037 (array!3513) Bool)

(declare-fun array_inv!1038 (array!3515) Bool)

(assert (=> b!54008 (= e!35249 (and tp!7371 tp_is_empty!2295 (array_inv!1037 (_keys!3592 newMap!16)) (array_inv!1038 (_values!1955 newMap!16)) e!35238))))

(declare-fun mapNonEmpty!2555 () Bool)

(declare-fun tp!7372 () Bool)

(assert (=> mapNonEmpty!2555 (= mapRes!2556 (and tp!7372 e!35247))))

(declare-fun mapKey!2555 () (_ BitVec 32))

(declare-fun mapValue!2555 () ValueCell!804)

(declare-fun mapRest!2556 () (Array (_ BitVec 32) ValueCell!804))

(assert (=> mapNonEmpty!2555 (= (arr!1680 (_values!1955 newMap!16)) (store mapRest!2556 mapKey!2555 mapValue!2555))))

(assert (=> b!54009 (= e!35243 (and tp!7374 tp_is_empty!2295 (array_inv!1037 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) (array_inv!1038 (_values!1955 (v!2271 (underlying!177 thiss!992)))) e!35245))))

(declare-fun res!30587 () Bool)

(assert (=> start!8296 (=> (not res!30587) (not e!35239))))

(declare-fun valid!198 (LongMap!332) Bool)

(assert (=> start!8296 (= res!30587 (valid!198 thiss!992))))

(assert (=> start!8296 e!35239))

(assert (=> start!8296 e!35240))

(assert (=> start!8296 true))

(assert (=> start!8296 e!35249))

(declare-fun b!53998 () Bool)

(assert (=> b!53998 (= e!35251 false)))

(declare-fun lt!21568 () Bool)

(declare-fun contains!638 (ListLongMap!1297 (_ BitVec 64)) Bool)

(assert (=> b!53998 (= lt!21568 (contains!638 lt!21570 (select (arr!1679 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) from!355)))))

(declare-fun mapNonEmpty!2556 () Bool)

(declare-fun tp!7373 () Bool)

(assert (=> mapNonEmpty!2556 (= mapRes!2555 (and tp!7373 e!35242))))

(declare-fun mapValue!2556 () ValueCell!804)

(declare-fun mapKey!2556 () (_ BitVec 32))

(declare-fun mapRest!2555 () (Array (_ BitVec 32) ValueCell!804))

(assert (=> mapNonEmpty!2556 (= (arr!1680 (_values!1955 (v!2271 (underlying!177 thiss!992)))) (store mapRest!2555 mapKey!2556 mapValue!2556))))

(declare-fun b!54010 () Bool)

(assert (=> b!54010 (= e!35244 e!35251)))

(declare-fun res!30579 () Bool)

(assert (=> b!54010 (=> (not res!30579) (not e!35251))))

(assert (=> b!54010 (= res!30579 (contains!638 lt!21567 (select (arr!1679 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) from!355)))))

(declare-datatypes ((tuple2!1902 0))(
  ( (tuple2!1903 (_1!962 Bool) (_2!962 LongMapFixedSize!516)) )
))
(declare-fun lt!21569 () tuple2!1902)

(declare-fun update!46 (LongMapFixedSize!516 (_ BitVec 64) V!2707) tuple2!1902)

(declare-fun get!1000 (ValueCell!804 V!2707) V!2707)

(declare-fun dynLambda!277 (Int (_ BitVec 64)) V!2707)

(assert (=> b!54010 (= lt!21569 (update!46 newMap!16 (select (arr!1679 (_keys!3592 (v!2271 (underlying!177 thiss!992)))) from!355) (get!1000 (select (arr!1680 (_values!1955 (v!2271 (underlying!177 thiss!992)))) from!355) (dynLambda!277 (defaultEntry!1972 (v!2271 (underlying!177 thiss!992))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!8296 res!30587) b!54001))

(assert (= (and b!54001 res!30582) b!54006))

(assert (= (and b!54006 res!30580) b!54002))

(assert (= (and b!54002 res!30584) b!53993))

(assert (= (and b!53993 res!30578) b!54010))

(assert (= (and b!54010 res!30579) b!54003))

(assert (= (and b!54003 res!30585) b!54005))

(assert (= (and b!54005 res!30581) b!53992))

(assert (= (and b!53992 res!30583) b!53997))

(assert (= (and b!53997 res!30586) b!54004))

(assert (= (and b!54004 res!30577) b!53998))

(assert (= (and b!54007 condMapEmpty!2555) mapIsEmpty!2556))

(assert (= (and b!54007 (not condMapEmpty!2555)) mapNonEmpty!2556))

(get-info :version)

(assert (= (and mapNonEmpty!2556 ((_ is ValueCellFull!804) mapValue!2556)) b!53996))

(assert (= (and b!54007 ((_ is ValueCellFull!804) mapDefault!2556)) b!54000))

(assert (= b!54009 b!54007))

(assert (= b!53994 b!54009))

(assert (= b!53991 b!53994))

(assert (= start!8296 b!53991))

(assert (= (and b!53999 condMapEmpty!2556) mapIsEmpty!2555))

(assert (= (and b!53999 (not condMapEmpty!2556)) mapNonEmpty!2555))

(assert (= (and mapNonEmpty!2555 ((_ is ValueCellFull!804) mapValue!2555)) b!53995))

(assert (= (and b!53999 ((_ is ValueCellFull!804) mapDefault!2555)) b!53990))

(assert (= b!54008 b!53999))

(assert (= start!8296 b!54008))

(declare-fun b_lambda!2389 () Bool)

(assert (=> (not b_lambda!2389) (not b!54010)))

(declare-fun t!4488 () Bool)

(declare-fun tb!1101 () Bool)

(assert (=> (and b!54009 (= (defaultEntry!1972 (v!2271 (underlying!177 thiss!992))) (defaultEntry!1972 (v!2271 (underlying!177 thiss!992)))) t!4488) tb!1101))

(declare-fun result!2049 () Bool)

(assert (=> tb!1101 (= result!2049 tp_is_empty!2295)))

(assert (=> b!54010 t!4488))

(declare-fun b_and!3059 () Bool)

(assert (= b_and!3055 (and (=> t!4488 result!2049) b_and!3059)))

(declare-fun t!4490 () Bool)

(declare-fun tb!1103 () Bool)

(assert (=> (and b!54008 (= (defaultEntry!1972 newMap!16) (defaultEntry!1972 (v!2271 (underlying!177 thiss!992)))) t!4490) tb!1103))

(declare-fun result!2053 () Bool)

(assert (= result!2053 result!2049))

(assert (=> b!54010 t!4490))

(declare-fun b_and!3061 () Bool)

(assert (= b_and!3057 (and (=> t!4490 result!2053) b_and!3061)))

(declare-fun m!45765 () Bool)

(assert (=> b!53997 m!45765))

(declare-fun m!45767 () Bool)

(assert (=> b!54008 m!45767))

(declare-fun m!45769 () Bool)

(assert (=> b!54008 m!45769))

(declare-fun m!45771 () Bool)

(assert (=> b!53993 m!45771))

(declare-fun m!45773 () Bool)

(assert (=> b!53993 m!45773))

(declare-fun m!45775 () Bool)

(assert (=> b!53993 m!45775))

(declare-fun m!45777 () Bool)

(assert (=> b!54003 m!45777))

(declare-fun m!45779 () Bool)

(assert (=> start!8296 m!45779))

(assert (=> b!53998 m!45771))

(assert (=> b!53998 m!45771))

(declare-fun m!45781 () Bool)

(assert (=> b!53998 m!45781))

(declare-fun m!45783 () Bool)

(assert (=> mapNonEmpty!2555 m!45783))

(declare-fun m!45785 () Bool)

(assert (=> b!54009 m!45785))

(declare-fun m!45787 () Bool)

(assert (=> b!54009 m!45787))

(declare-fun m!45789 () Bool)

(assert (=> mapNonEmpty!2556 m!45789))

(declare-fun m!45791 () Bool)

(assert (=> b!54010 m!45791))

(declare-fun m!45793 () Bool)

(assert (=> b!54010 m!45793))

(declare-fun m!45795 () Bool)

(assert (=> b!54010 m!45795))

(assert (=> b!54010 m!45771))

(declare-fun m!45797 () Bool)

(assert (=> b!54010 m!45797))

(assert (=> b!54010 m!45771))

(assert (=> b!54010 m!45793))

(assert (=> b!54010 m!45771))

(assert (=> b!54010 m!45795))

(declare-fun m!45799 () Bool)

(assert (=> b!54010 m!45799))

(assert (=> b!54010 m!45791))

(declare-fun m!45801 () Bool)

(assert (=> b!53992 m!45801))

(declare-fun m!45803 () Bool)

(assert (=> b!54006 m!45803))

(check-sat (not b_next!1759) tp_is_empty!2295 (not b!53998) (not start!8296) (not b!54010) b_and!3059 (not b_next!1757) b_and!3061 (not b!54008) (not b!54006) (not mapNonEmpty!2555) (not b!53992) (not b!54003) (not b!53997) (not b!53993) (not b!54009) (not mapNonEmpty!2556) (not b_lambda!2389))
(check-sat b_and!3059 b_and!3061 (not b_next!1757) (not b_next!1759))
