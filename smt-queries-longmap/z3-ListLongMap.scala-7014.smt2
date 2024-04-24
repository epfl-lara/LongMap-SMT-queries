; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89322 () Bool)

(assert start!89322)

(declare-fun b!1022705 () Bool)

(declare-fun b_free!20137 () Bool)

(declare-fun b_next!20137 () Bool)

(assert (=> b!1022705 (= b_free!20137 (not b_next!20137))))

(declare-fun tp!71443 () Bool)

(declare-fun b_and!32345 () Bool)

(assert (=> b!1022705 (= tp!71443 b_and!32345)))

(declare-fun b!1022700 () Bool)

(declare-fun e!576087 () Bool)

(declare-fun e!576092 () Bool)

(declare-fun mapRes!37200 () Bool)

(assert (=> b!1022700 (= e!576087 (and e!576092 mapRes!37200))))

(declare-fun condMapEmpty!37200 () Bool)

(declare-datatypes ((array!63805 0))(
  ( (array!63806 (arr!30709 (Array (_ BitVec 32) (_ BitVec 64))) (size!31221 (_ BitVec 32))) )
))
(declare-datatypes ((V!36683 0))(
  ( (V!36684 (val!11979 Int)) )
))
(declare-datatypes ((ValueCell!11225 0))(
  ( (ValueCellFull!11225 (v!14541 V!36683)) (EmptyCell!11225) )
))
(declare-datatypes ((array!63807 0))(
  ( (array!63808 (arr!30710 (Array (_ BitVec 32) ValueCell!11225)) (size!31222 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5044 0))(
  ( (LongMapFixedSize!5045 (defaultEntry!5874 Int) (mask!29503 (_ BitVec 32)) (extraKeys!5606 (_ BitVec 32)) (zeroValue!5710 V!36683) (minValue!5710 V!36683) (_size!2577 (_ BitVec 32)) (_keys!11057 array!63805) (_values!5897 array!63807) (_vacant!2577 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1118 0))(
  ( (Cell!1119 (v!14542 LongMapFixedSize!5044)) )
))
(declare-datatypes ((LongMap!1118 0))(
  ( (LongMap!1119 (underlying!570 Cell!1118)) )
))
(declare-fun thiss!1120 () LongMap!1118)

(declare-fun mapDefault!37200 () ValueCell!11225)

(assert (=> b!1022700 (= condMapEmpty!37200 (= (arr!30710 (_values!5897 (v!14542 (underlying!570 thiss!1120)))) ((as const (Array (_ BitVec 32) ValueCell!11225)) mapDefault!37200)))))

(declare-fun mapNonEmpty!37200 () Bool)

(declare-fun tp!71442 () Bool)

(declare-fun e!576086 () Bool)

(assert (=> mapNonEmpty!37200 (= mapRes!37200 (and tp!71442 e!576086))))

(declare-fun mapValue!37200 () ValueCell!11225)

(declare-fun mapKey!37200 () (_ BitVec 32))

(declare-fun mapRest!37200 () (Array (_ BitVec 32) ValueCell!11225))

(assert (=> mapNonEmpty!37200 (= (arr!30710 (_values!5897 (v!14542 (underlying!570 thiss!1120)))) (store mapRest!37200 mapKey!37200 mapValue!37200))))

(declare-fun b!1022701 () Bool)

(declare-fun e!576091 () Bool)

(declare-fun e!576089 () Bool)

(assert (=> b!1022701 (= e!576091 e!576089)))

(declare-fun b!1022703 () Bool)

(declare-fun tp_is_empty!23857 () Bool)

(assert (=> b!1022703 (= e!576092 tp_is_empty!23857)))

(declare-fun mapIsEmpty!37200 () Bool)

(assert (=> mapIsEmpty!37200 mapRes!37200))

(declare-fun b!1022704 () Bool)

(declare-fun e!576093 () Bool)

(assert (=> b!1022704 (= e!576093 e!576091)))

(declare-fun array_inv!23831 (array!63805) Bool)

(declare-fun array_inv!23832 (array!63807) Bool)

(assert (=> b!1022705 (= e!576089 (and tp!71443 tp_is_empty!23857 (array_inv!23831 (_keys!11057 (v!14542 (underlying!570 thiss!1120)))) (array_inv!23832 (_values!5897 (v!14542 (underlying!570 thiss!1120)))) e!576087))))

(declare-fun b!1022706 () Bool)

(assert (=> b!1022706 (= e!576086 tp_is_empty!23857)))

(declare-fun b!1022702 () Bool)

(declare-fun e!576088 () Bool)

(declare-fun valid!1927 (LongMapFixedSize!5044) Bool)

(assert (=> b!1022702 (= e!576088 (not (valid!1927 (v!14542 (underlying!570 thiss!1120)))))))

(declare-fun res!684881 () Bool)

(assert (=> start!89322 (=> (not res!684881) (not e!576088))))

(declare-fun valid!1928 (LongMap!1118) Bool)

(assert (=> start!89322 (= res!684881 (valid!1928 thiss!1120))))

(assert (=> start!89322 e!576088))

(assert (=> start!89322 e!576093))

(assert (= (and start!89322 res!684881) b!1022702))

(assert (= (and b!1022700 condMapEmpty!37200) mapIsEmpty!37200))

(assert (= (and b!1022700 (not condMapEmpty!37200)) mapNonEmpty!37200))

(get-info :version)

(assert (= (and mapNonEmpty!37200 ((_ is ValueCellFull!11225) mapValue!37200)) b!1022706))

(assert (= (and b!1022700 ((_ is ValueCellFull!11225) mapDefault!37200)) b!1022703))

(assert (= b!1022705 b!1022700))

(assert (= b!1022701 b!1022705))

(assert (= b!1022704 b!1022701))

(assert (= start!89322 b!1022704))

(declare-fun m!942609 () Bool)

(assert (=> mapNonEmpty!37200 m!942609))

(declare-fun m!942611 () Bool)

(assert (=> b!1022705 m!942611))

(declare-fun m!942613 () Bool)

(assert (=> b!1022705 m!942613))

(declare-fun m!942615 () Bool)

(assert (=> b!1022702 m!942615))

(declare-fun m!942617 () Bool)

(assert (=> start!89322 m!942617))

(check-sat b_and!32345 tp_is_empty!23857 (not b!1022705) (not mapNonEmpty!37200) (not start!89322) (not b!1022702) (not b_next!20137))
(check-sat b_and!32345 (not b_next!20137))
(get-model)

(declare-fun d!122975 () Bool)

(assert (=> d!122975 (= (array_inv!23831 (_keys!11057 (v!14542 (underlying!570 thiss!1120)))) (bvsge (size!31221 (_keys!11057 (v!14542 (underlying!570 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1022705 d!122975))

(declare-fun d!122977 () Bool)

(assert (=> d!122977 (= (array_inv!23832 (_values!5897 (v!14542 (underlying!570 thiss!1120)))) (bvsge (size!31222 (_values!5897 (v!14542 (underlying!570 thiss!1120)))) #b00000000000000000000000000000000))))

(assert (=> b!1022705 d!122977))

(declare-fun d!122979 () Bool)

(assert (=> d!122979 (= (valid!1928 thiss!1120) (valid!1927 (v!14542 (underlying!570 thiss!1120))))))

(declare-fun bs!29793 () Bool)

(assert (= bs!29793 d!122979))

(assert (=> bs!29793 m!942615))

(assert (=> start!89322 d!122979))

(declare-fun d!122981 () Bool)

(declare-fun res!684894 () Bool)

(declare-fun e!576144 () Bool)

(assert (=> d!122981 (=> (not res!684894) (not e!576144))))

(declare-fun simpleValid!386 (LongMapFixedSize!5044) Bool)

(assert (=> d!122981 (= res!684894 (simpleValid!386 (v!14542 (underlying!570 thiss!1120))))))

(assert (=> d!122981 (= (valid!1927 (v!14542 (underlying!570 thiss!1120))) e!576144)))

(declare-fun b!1022755 () Bool)

(declare-fun res!684895 () Bool)

(assert (=> b!1022755 (=> (not res!684895) (not e!576144))))

(declare-fun arrayCountValidKeys!0 (array!63805 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1022755 (= res!684895 (= (arrayCountValidKeys!0 (_keys!11057 (v!14542 (underlying!570 thiss!1120))) #b00000000000000000000000000000000 (size!31221 (_keys!11057 (v!14542 (underlying!570 thiss!1120))))) (_size!2577 (v!14542 (underlying!570 thiss!1120)))))))

(declare-fun b!1022756 () Bool)

(declare-fun res!684896 () Bool)

(assert (=> b!1022756 (=> (not res!684896) (not e!576144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63805 (_ BitVec 32)) Bool)

(assert (=> b!1022756 (= res!684896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11057 (v!14542 (underlying!570 thiss!1120))) (mask!29503 (v!14542 (underlying!570 thiss!1120)))))))

(declare-fun b!1022757 () Bool)

(declare-datatypes ((List!21642 0))(
  ( (Nil!21639) (Cons!21638 (h!22845 (_ BitVec 64)) (t!30648 List!21642)) )
))
(declare-fun arrayNoDuplicates!0 (array!63805 (_ BitVec 32) List!21642) Bool)

(assert (=> b!1022757 (= e!576144 (arrayNoDuplicates!0 (_keys!11057 (v!14542 (underlying!570 thiss!1120))) #b00000000000000000000000000000000 Nil!21639))))

(assert (= (and d!122981 res!684894) b!1022755))

(assert (= (and b!1022755 res!684895) b!1022756))

(assert (= (and b!1022756 res!684896) b!1022757))

(declare-fun m!942639 () Bool)

(assert (=> d!122981 m!942639))

(declare-fun m!942641 () Bool)

(assert (=> b!1022755 m!942641))

(declare-fun m!942643 () Bool)

(assert (=> b!1022756 m!942643))

(declare-fun m!942645 () Bool)

(assert (=> b!1022757 m!942645))

(assert (=> b!1022702 d!122981))

(declare-fun mapNonEmpty!37209 () Bool)

(declare-fun mapRes!37209 () Bool)

(declare-fun tp!71458 () Bool)

(declare-fun e!576149 () Bool)

(assert (=> mapNonEmpty!37209 (= mapRes!37209 (and tp!71458 e!576149))))

(declare-fun mapValue!37209 () ValueCell!11225)

(declare-fun mapRest!37209 () (Array (_ BitVec 32) ValueCell!11225))

(declare-fun mapKey!37209 () (_ BitVec 32))

(assert (=> mapNonEmpty!37209 (= mapRest!37200 (store mapRest!37209 mapKey!37209 mapValue!37209))))

(declare-fun mapIsEmpty!37209 () Bool)

(assert (=> mapIsEmpty!37209 mapRes!37209))

(declare-fun b!1022765 () Bool)

(declare-fun e!576150 () Bool)

(assert (=> b!1022765 (= e!576150 tp_is_empty!23857)))

(declare-fun condMapEmpty!37209 () Bool)

(declare-fun mapDefault!37209 () ValueCell!11225)

(assert (=> mapNonEmpty!37200 (= condMapEmpty!37209 (= mapRest!37200 ((as const (Array (_ BitVec 32) ValueCell!11225)) mapDefault!37209)))))

(assert (=> mapNonEmpty!37200 (= tp!71442 (and e!576150 mapRes!37209))))

(declare-fun b!1022764 () Bool)

(assert (=> b!1022764 (= e!576149 tp_is_empty!23857)))

(assert (= (and mapNonEmpty!37200 condMapEmpty!37209) mapIsEmpty!37209))

(assert (= (and mapNonEmpty!37200 (not condMapEmpty!37209)) mapNonEmpty!37209))

(assert (= (and mapNonEmpty!37209 ((_ is ValueCellFull!11225) mapValue!37209)) b!1022764))

(assert (= (and mapNonEmpty!37200 ((_ is ValueCellFull!11225) mapDefault!37209)) b!1022765))

(declare-fun m!942647 () Bool)

(assert (=> mapNonEmpty!37209 m!942647))

(check-sat (not b!1022756) b_and!32345 tp_is_empty!23857 (not d!122981) (not b!1022757) (not mapNonEmpty!37209) (not b_next!20137) (not d!122979) (not b!1022755))
(check-sat b_and!32345 (not b_next!20137))
