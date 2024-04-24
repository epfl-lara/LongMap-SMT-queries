; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90534 () Bool)

(assert start!90534)

(declare-fun b!1034889 () Bool)

(declare-fun b_free!20797 () Bool)

(declare-fun b_next!20797 () Bool)

(assert (=> b!1034889 (= b_free!20797 (not b_next!20797))))

(declare-fun tp!73490 () Bool)

(declare-fun b_and!33275 () Bool)

(assert (=> b!1034889 (= tp!73490 b_and!33275)))

(declare-fun b!1034885 () Bool)

(declare-fun e!585064 () Bool)

(declare-fun tp_is_empty!24517 () Bool)

(assert (=> b!1034885 (= e!585064 tp_is_empty!24517)))

(declare-fun b!1034886 () Bool)

(declare-fun e!585061 () Bool)

(declare-fun e!585062 () Bool)

(declare-fun mapRes!38258 () Bool)

(assert (=> b!1034886 (= e!585061 (and e!585062 mapRes!38258))))

(declare-fun condMapEmpty!38258 () Bool)

(declare-datatypes ((V!37563 0))(
  ( (V!37564 (val!12309 Int)) )
))
(declare-datatypes ((ValueCell!11555 0))(
  ( (ValueCellFull!11555 (v!14882 V!37563)) (EmptyCell!11555) )
))
(declare-datatypes ((array!65163 0))(
  ( (array!65164 (arr!31369 (Array (_ BitVec 32) (_ BitVec 64))) (size!31892 (_ BitVec 32))) )
))
(declare-datatypes ((array!65165 0))(
  ( (array!65166 (arr!31370 (Array (_ BitVec 32) ValueCell!11555)) (size!31893 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5704 0))(
  ( (LongMapFixedSize!5705 (defaultEntry!6226 Int) (mask!30143 (_ BitVec 32)) (extraKeys!5958 (_ BitVec 32)) (zeroValue!6062 V!37563) (minValue!6062 V!37563) (_size!2907 (_ BitVec 32)) (_keys!11444 array!65163) (_values!6249 array!65165) (_vacant!2907 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5704)

(declare-fun mapDefault!38258 () ValueCell!11555)

(assert (=> b!1034886 (= condMapEmpty!38258 (= (arr!31370 (_values!6249 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38258)))))

(declare-fun mapNonEmpty!38258 () Bool)

(declare-fun tp!73491 () Bool)

(assert (=> mapNonEmpty!38258 (= mapRes!38258 (and tp!73491 e!585064))))

(declare-fun mapKey!38258 () (_ BitVec 32))

(declare-fun mapValue!38258 () ValueCell!11555)

(declare-fun mapRest!38258 () (Array (_ BitVec 32) ValueCell!11555))

(assert (=> mapNonEmpty!38258 (= (arr!31370 (_values!6249 thiss!1427)) (store mapRest!38258 mapKey!38258 mapValue!38258))))

(declare-fun b!1034888 () Bool)

(declare-fun e!585065 () Bool)

(declare-fun key!909 () (_ BitVec 64))

(declare-fun lt!456630 () LongMapFixedSize!5704)

(declare-datatypes ((tuple2!15726 0))(
  ( (tuple2!15727 (_1!7874 (_ BitVec 64)) (_2!7874 V!37563)) )
))
(declare-datatypes ((List!21892 0))(
  ( (Nil!21889) (Cons!21888 (h!23099 tuple2!15726) (t!31080 List!21892)) )
))
(declare-datatypes ((ListLongMap!13761 0))(
  ( (ListLongMap!13762 (toList!6896 List!21892)) )
))
(declare-fun map!14685 (LongMapFixedSize!5704) ListLongMap!13761)

(declare-fun -!519 (ListLongMap!13761 (_ BitVec 64)) ListLongMap!13761)

(assert (=> b!1034888 (= e!585065 (= (map!14685 lt!456630) (-!519 (map!14685 thiss!1427) key!909)))))

(declare-fun e!585067 () Bool)

(declare-fun array_inv!24279 (array!65163) Bool)

(declare-fun array_inv!24280 (array!65165) Bool)

(assert (=> b!1034889 (= e!585067 (and tp!73490 tp_is_empty!24517 (array_inv!24279 (_keys!11444 thiss!1427)) (array_inv!24280 (_values!6249 thiss!1427)) e!585061))))

(declare-fun mapIsEmpty!38258 () Bool)

(assert (=> mapIsEmpty!38258 mapRes!38258))

(declare-fun b!1034890 () Bool)

(declare-fun res!691087 () Bool)

(declare-fun e!585063 () Bool)

(assert (=> b!1034890 (=> (not res!691087) (not e!585063))))

(assert (=> b!1034890 (= res!691087 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034891 () Bool)

(assert (=> b!1034891 (= e!585063 (not e!585065))))

(declare-fun res!691088 () Bool)

(assert (=> b!1034891 (=> (not res!691088) (not e!585065))))

(declare-fun valid!2163 (LongMapFixedSize!5704) Bool)

(assert (=> b!1034891 (= res!691088 (valid!2163 lt!456630))))

(declare-fun lt!456631 () V!37563)

(assert (=> b!1034891 (= lt!456630 (LongMapFixedSize!5705 (defaultEntry!6226 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (_size!2907 thiss!1427) (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (_vacant!2907 thiss!1427)))))

(declare-fun getCurrentListMap!3942 (array!65163 array!65165 (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 (_ BitVec 32) Int) ListLongMap!13761)

(assert (=> b!1034891 (= (-!519 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-datatypes ((Unit!33837 0))(
  ( (Unit!33838) )
))
(declare-fun lt!456629 () Unit!33837)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (array!65163 array!65165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 V!37563 Int) Unit!33837)

(assert (=> b!1034891 (= lt!456629 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!456631 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)))))

(declare-fun dynLambda!2013 (Int (_ BitVec 64)) V!37563)

(assert (=> b!1034891 (= lt!456631 (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034887 () Bool)

(assert (=> b!1034887 (= e!585062 tp_is_empty!24517)))

(declare-fun res!691086 () Bool)

(assert (=> start!90534 (=> (not res!691086) (not e!585063))))

(assert (=> start!90534 (= res!691086 (valid!2163 thiss!1427))))

(assert (=> start!90534 e!585063))

(assert (=> start!90534 e!585067))

(assert (=> start!90534 true))

(assert (= (and start!90534 res!691086) b!1034890))

(assert (= (and b!1034890 res!691087) b!1034891))

(assert (= (and b!1034891 res!691088) b!1034888))

(assert (= (and b!1034886 condMapEmpty!38258) mapIsEmpty!38258))

(assert (= (and b!1034886 (not condMapEmpty!38258)) mapNonEmpty!38258))

(get-info :version)

(assert (= (and mapNonEmpty!38258 ((_ is ValueCellFull!11555) mapValue!38258)) b!1034885))

(assert (= (and b!1034886 ((_ is ValueCellFull!11555) mapDefault!38258)) b!1034887))

(assert (= b!1034889 b!1034886))

(assert (= start!90534 b!1034889))

(declare-fun b_lambda!16055 () Bool)

(assert (=> (not b_lambda!16055) (not b!1034891)))

(declare-fun t!31079 () Bool)

(declare-fun tb!7011 () Bool)

(assert (=> (and b!1034889 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 thiss!1427)) t!31079) tb!7011))

(declare-fun result!14375 () Bool)

(assert (=> tb!7011 (= result!14375 tp_is_empty!24517)))

(assert (=> b!1034891 t!31079))

(declare-fun b_and!33277 () Bool)

(assert (= b_and!33275 (and (=> t!31079 result!14375) b_and!33277)))

(declare-fun m!954931 () Bool)

(assert (=> b!1034891 m!954931))

(declare-fun m!954933 () Bool)

(assert (=> b!1034891 m!954933))

(declare-fun m!954935 () Bool)

(assert (=> b!1034891 m!954935))

(declare-fun m!954937 () Bool)

(assert (=> b!1034891 m!954937))

(declare-fun m!954939 () Bool)

(assert (=> b!1034891 m!954939))

(declare-fun m!954941 () Bool)

(assert (=> b!1034891 m!954941))

(assert (=> b!1034891 m!954939))

(declare-fun m!954943 () Bool)

(assert (=> mapNonEmpty!38258 m!954943))

(declare-fun m!954945 () Bool)

(assert (=> b!1034889 m!954945))

(declare-fun m!954947 () Bool)

(assert (=> b!1034889 m!954947))

(declare-fun m!954949 () Bool)

(assert (=> start!90534 m!954949))

(declare-fun m!954951 () Bool)

(assert (=> b!1034888 m!954951))

(declare-fun m!954953 () Bool)

(assert (=> b!1034888 m!954953))

(assert (=> b!1034888 m!954953))

(declare-fun m!954955 () Bool)

(assert (=> b!1034888 m!954955))

(check-sat (not b!1034891) (not b_lambda!16055) (not b!1034888) (not start!90534) (not b!1034889) b_and!33277 (not mapNonEmpty!38258) (not b_next!20797) tp_is_empty!24517)
(check-sat b_and!33277 (not b_next!20797))
(get-model)

(declare-fun b_lambda!16061 () Bool)

(assert (= b_lambda!16055 (or (and b!1034889 b_free!20797) b_lambda!16061)))

(check-sat (not b!1034891) (not b!1034888) (not start!90534) (not b!1034889) (not mapNonEmpty!38258) (not b_next!20797) tp_is_empty!24517 b_and!33277 (not b_lambda!16061))
(check-sat b_and!33277 (not b_next!20797))
(get-model)

(declare-fun d!124267 () Bool)

(declare-fun res!691113 () Bool)

(declare-fun e!585112 () Bool)

(assert (=> d!124267 (=> (not res!691113) (not e!585112))))

(declare-fun simpleValid!405 (LongMapFixedSize!5704) Bool)

(assert (=> d!124267 (= res!691113 (simpleValid!405 thiss!1427))))

(assert (=> d!124267 (= (valid!2163 thiss!1427) e!585112)))

(declare-fun b!1034946 () Bool)

(declare-fun res!691114 () Bool)

(assert (=> b!1034946 (=> (not res!691114) (not e!585112))))

(declare-fun arrayCountValidKeys!0 (array!65163 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034946 (= res!691114 (= (arrayCountValidKeys!0 (_keys!11444 thiss!1427) #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))) (_size!2907 thiss!1427)))))

(declare-fun b!1034947 () Bool)

(declare-fun res!691115 () Bool)

(assert (=> b!1034947 (=> (not res!691115) (not e!585112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65163 (_ BitVec 32)) Bool)

(assert (=> b!1034947 (= res!691115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11444 thiss!1427) (mask!30143 thiss!1427)))))

(declare-fun b!1034948 () Bool)

(declare-datatypes ((List!21893 0))(
  ( (Nil!21890) (Cons!21889 (h!23100 (_ BitVec 64)) (t!31085 List!21893)) )
))
(declare-fun arrayNoDuplicates!0 (array!65163 (_ BitVec 32) List!21893) Bool)

(assert (=> b!1034948 (= e!585112 (arrayNoDuplicates!0 (_keys!11444 thiss!1427) #b00000000000000000000000000000000 Nil!21890))))

(assert (= (and d!124267 res!691113) b!1034946))

(assert (= (and b!1034946 res!691114) b!1034947))

(assert (= (and b!1034947 res!691115) b!1034948))

(declare-fun m!955009 () Bool)

(assert (=> d!124267 m!955009))

(declare-fun m!955011 () Bool)

(assert (=> b!1034946 m!955011))

(declare-fun m!955013 () Bool)

(assert (=> b!1034947 m!955013))

(declare-fun m!955015 () Bool)

(assert (=> b!1034948 m!955015))

(assert (=> start!90534 d!124267))

(declare-fun d!124269 () Bool)

(assert (=> d!124269 (= (array_inv!24279 (_keys!11444 thiss!1427)) (bvsge (size!31892 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034889 d!124269))

(declare-fun d!124271 () Bool)

(assert (=> d!124271 (= (array_inv!24280 (_values!6249 thiss!1427)) (bvsge (size!31893 (_values!6249 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034889 d!124271))

(declare-fun d!124273 () Bool)

(assert (=> d!124273 (= (map!14685 lt!456630) (getCurrentListMap!3942 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun bs!30231 () Bool)

(assert (= bs!30231 d!124273))

(declare-fun m!955017 () Bool)

(assert (=> bs!30231 m!955017))

(assert (=> b!1034888 d!124273))

(declare-fun d!124275 () Bool)

(declare-fun lt!456652 () ListLongMap!13761)

(declare-fun contains!6037 (ListLongMap!13761 (_ BitVec 64)) Bool)

(assert (=> d!124275 (not (contains!6037 lt!456652 key!909))))

(declare-fun removeStrictlySorted!55 (List!21892 (_ BitVec 64)) List!21892)

(assert (=> d!124275 (= lt!456652 (ListLongMap!13762 (removeStrictlySorted!55 (toList!6896 (map!14685 thiss!1427)) key!909)))))

(assert (=> d!124275 (= (-!519 (map!14685 thiss!1427) key!909) lt!456652)))

(declare-fun bs!30232 () Bool)

(assert (= bs!30232 d!124275))

(declare-fun m!955019 () Bool)

(assert (=> bs!30232 m!955019))

(declare-fun m!955021 () Bool)

(assert (=> bs!30232 m!955021))

(assert (=> b!1034888 d!124275))

(declare-fun d!124277 () Bool)

(assert (=> d!124277 (= (map!14685 thiss!1427) (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun bs!30233 () Bool)

(assert (= bs!30233 d!124277))

(assert (=> bs!30233 m!954939))

(assert (=> b!1034888 d!124277))

(declare-fun d!124279 () Bool)

(declare-fun res!691116 () Bool)

(declare-fun e!585113 () Bool)

(assert (=> d!124279 (=> (not res!691116) (not e!585113))))

(assert (=> d!124279 (= res!691116 (simpleValid!405 lt!456630))))

(assert (=> d!124279 (= (valid!2163 lt!456630) e!585113)))

(declare-fun b!1034949 () Bool)

(declare-fun res!691117 () Bool)

(assert (=> b!1034949 (=> (not res!691117) (not e!585113))))

(assert (=> b!1034949 (= res!691117 (= (arrayCountValidKeys!0 (_keys!11444 lt!456630) #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))) (_size!2907 lt!456630)))))

(declare-fun b!1034950 () Bool)

(declare-fun res!691118 () Bool)

(assert (=> b!1034950 (=> (not res!691118) (not e!585113))))

(assert (=> b!1034950 (= res!691118 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11444 lt!456630) (mask!30143 lt!456630)))))

(declare-fun b!1034951 () Bool)

(assert (=> b!1034951 (= e!585113 (arrayNoDuplicates!0 (_keys!11444 lt!456630) #b00000000000000000000000000000000 Nil!21890))))

(assert (= (and d!124279 res!691116) b!1034949))

(assert (= (and b!1034949 res!691117) b!1034950))

(assert (= (and b!1034950 res!691118) b!1034951))

(declare-fun m!955023 () Bool)

(assert (=> d!124279 m!955023))

(declare-fun m!955025 () Bool)

(assert (=> b!1034949 m!955025))

(declare-fun m!955027 () Bool)

(assert (=> b!1034950 m!955027))

(declare-fun m!955029 () Bool)

(assert (=> b!1034951 m!955029))

(assert (=> b!1034891 d!124279))

(declare-fun b!1034994 () Bool)

(declare-fun e!585152 () Bool)

(declare-fun e!585147 () Bool)

(assert (=> b!1034994 (= e!585152 e!585147)))

(declare-fun res!691143 () Bool)

(assert (=> b!1034994 (=> (not res!691143) (not e!585147))))

(declare-fun lt!456716 () ListLongMap!13761)

(assert (=> b!1034994 (= res!691143 (contains!6037 lt!456716 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1034994 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1034995 () Bool)

(declare-fun e!585148 () ListLongMap!13761)

(declare-fun e!585144 () ListLongMap!13761)

(assert (=> b!1034995 (= e!585148 e!585144)))

(declare-fun c!104798 () Bool)

(assert (=> b!1034995 (= c!104798 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1034996 () Bool)

(declare-fun e!585146 () ListLongMap!13761)

(declare-fun call!43731 () ListLongMap!13761)

(assert (=> b!1034996 (= e!585146 call!43731)))

(declare-fun b!1034997 () Bool)

(declare-fun e!585149 () Bool)

(declare-fun apply!915 (ListLongMap!13761 (_ BitVec 64)) V!37563)

(assert (=> b!1034997 (= e!585149 (= (apply!915 lt!456716 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456631))))

(declare-fun b!1034998 () Bool)

(declare-fun e!585142 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034998 (= e!585142 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034999 () Bool)

(declare-fun e!585150 () Bool)

(assert (=> b!1034999 (= e!585150 e!585149)))

(declare-fun res!691145 () Bool)

(declare-fun call!43728 () Bool)

(assert (=> b!1034999 (= res!691145 call!43728)))

(assert (=> b!1034999 (=> (not res!691145) (not e!585149))))

(declare-fun bm!43723 () Bool)

(declare-fun call!43729 () Bool)

(assert (=> bm!43723 (= call!43729 (contains!6037 lt!456716 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43724 () Bool)

(assert (=> bm!43724 (= call!43728 (contains!6037 lt!456716 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035000 () Bool)

(assert (=> b!1035000 (= e!585150 (not call!43728))))

(declare-fun b!1035001 () Bool)

(declare-fun call!43730 () ListLongMap!13761)

(assert (=> b!1035001 (= e!585146 call!43730)))

(declare-fun b!1035002 () Bool)

(declare-fun e!585143 () Bool)

(declare-fun e!585140 () Bool)

(assert (=> b!1035002 (= e!585143 e!585140)))

(declare-fun res!691139 () Bool)

(assert (=> b!1035002 (= res!691139 call!43729)))

(assert (=> b!1035002 (=> (not res!691139) (not e!585140))))

(declare-fun d!124281 () Bool)

(declare-fun e!585141 () Bool)

(assert (=> d!124281 e!585141))

(declare-fun res!691140 () Bool)

(assert (=> d!124281 (=> (not res!691140) (not e!585141))))

(assert (=> d!124281 (= res!691140 (or (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))))

(declare-fun lt!456706 () ListLongMap!13761)

(assert (=> d!124281 (= lt!456716 lt!456706)))

(declare-fun lt!456702 () Unit!33837)

(declare-fun e!585145 () Unit!33837)

(assert (=> d!124281 (= lt!456702 e!585145)))

(declare-fun c!104796 () Bool)

(declare-fun e!585151 () Bool)

(assert (=> d!124281 (= c!104796 e!585151)))

(declare-fun res!691144 () Bool)

(assert (=> d!124281 (=> (not res!691144) (not e!585151))))

(assert (=> d!124281 (= res!691144 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124281 (= lt!456706 e!585148)))

(declare-fun c!104793 () Bool)

(assert (=> d!124281 (= c!104793 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!124281 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124281 (= (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456716)))

(declare-fun bm!43725 () Bool)

(declare-fun call!43727 () ListLongMap!13761)

(assert (=> bm!43725 (= call!43730 call!43727)))

(declare-fun b!1035003 () Bool)

(assert (=> b!1035003 (= e!585141 e!585143)))

(declare-fun c!104795 () Bool)

(assert (=> b!1035003 (= c!104795 (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035004 () Bool)

(assert (=> b!1035004 (= e!585140 (= (apply!915 lt!456716 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 thiss!1427)))))

(declare-fun b!1035005 () Bool)

(assert (=> b!1035005 (= e!585143 (not call!43729))))

(declare-fun bm!43726 () Bool)

(declare-fun call!43726 () ListLongMap!13761)

(declare-fun call!43732 () ListLongMap!13761)

(assert (=> bm!43726 (= call!43726 call!43732)))

(declare-fun b!1035006 () Bool)

(assert (=> b!1035006 (= e!585151 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035007 () Bool)

(declare-fun +!3126 (ListLongMap!13761 tuple2!15726) ListLongMap!13761)

(assert (=> b!1035007 (= e!585148 (+!3126 call!43727 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun bm!43727 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3566 (array!65163 array!65165 (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 (_ BitVec 32) Int) ListLongMap!13761)

(assert (=> bm!43727 (= call!43732 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1035008 () Bool)

(declare-fun res!691138 () Bool)

(assert (=> b!1035008 (=> (not res!691138) (not e!585141))))

(assert (=> b!1035008 (= res!691138 e!585150)))

(declare-fun c!104797 () Bool)

(assert (=> b!1035008 (= c!104797 (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43728 () Bool)

(assert (=> bm!43728 (= call!43727 (+!3126 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035009 () Bool)

(declare-fun Unit!33839 () Unit!33837)

(assert (=> b!1035009 (= e!585145 Unit!33839)))

(declare-fun b!1035010 () Bool)

(declare-fun c!104794 () Bool)

(assert (=> b!1035010 (= c!104794 (and (not (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035010 (= e!585144 e!585146)))

(declare-fun b!1035011 () Bool)

(declare-fun get!16462 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1035011 (= e!585147 (= (apply!915 lt!456716 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 thiss!1427))))))

(assert (=> b!1035011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035012 () Bool)

(assert (=> b!1035012 (= e!585144 call!43730)))

(declare-fun b!1035013 () Bool)

(declare-fun res!691142 () Bool)

(assert (=> b!1035013 (=> (not res!691142) (not e!585141))))

(assert (=> b!1035013 (= res!691142 e!585152)))

(declare-fun res!691141 () Bool)

(assert (=> b!1035013 (=> res!691141 e!585152)))

(assert (=> b!1035013 (= res!691141 (not e!585142))))

(declare-fun res!691137 () Bool)

(assert (=> b!1035013 (=> (not res!691137) (not e!585142))))

(assert (=> b!1035013 (= res!691137 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035014 () Bool)

(declare-fun lt!456711 () Unit!33837)

(assert (=> b!1035014 (= e!585145 lt!456711)))

(declare-fun lt!456700 () ListLongMap!13761)

(assert (=> b!1035014 (= lt!456700 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456717 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456703 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456703 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456707 () Unit!33837)

(declare-fun addStillContains!625 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> b!1035014 (= lt!456707 (addStillContains!625 lt!456700 lt!456717 lt!456631 lt!456703))))

(assert (=> b!1035014 (contains!6037 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)) lt!456703)))

(declare-fun lt!456718 () Unit!33837)

(assert (=> b!1035014 (= lt!456718 lt!456707)))

(declare-fun lt!456708 () ListLongMap!13761)

(assert (=> b!1035014 (= lt!456708 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456709 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456709 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456710 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456710 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456714 () Unit!33837)

(declare-fun addApplyDifferent!481 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> b!1035014 (= lt!456714 (addApplyDifferent!481 lt!456708 lt!456709 (minValue!6062 thiss!1427) lt!456710))))

(assert (=> b!1035014 (= (apply!915 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456710) (apply!915 lt!456708 lt!456710))))

(declare-fun lt!456712 () Unit!33837)

(assert (=> b!1035014 (= lt!456712 lt!456714)))

(declare-fun lt!456704 () ListLongMap!13761)

(assert (=> b!1035014 (= lt!456704 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456701 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456698 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456698 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456697 () Unit!33837)

(assert (=> b!1035014 (= lt!456697 (addApplyDifferent!481 lt!456704 lt!456701 lt!456631 lt!456698))))

(assert (=> b!1035014 (= (apply!915 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)) lt!456698) (apply!915 lt!456704 lt!456698))))

(declare-fun lt!456713 () Unit!33837)

(assert (=> b!1035014 (= lt!456713 lt!456697)))

(declare-fun lt!456699 () ListLongMap!13761)

(assert (=> b!1035014 (= lt!456699 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456715 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456715 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456705 () (_ BitVec 64))

(assert (=> b!1035014 (= lt!456705 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035014 (= lt!456711 (addApplyDifferent!481 lt!456699 lt!456715 (minValue!6062 thiss!1427) lt!456705))))

(assert (=> b!1035014 (= (apply!915 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456705) (apply!915 lt!456699 lt!456705))))

(declare-fun bm!43729 () Bool)

(assert (=> bm!43729 (= call!43731 call!43726)))

(assert (= (and d!124281 c!104793) b!1035007))

(assert (= (and d!124281 (not c!104793)) b!1034995))

(assert (= (and b!1034995 c!104798) b!1035012))

(assert (= (and b!1034995 (not c!104798)) b!1035010))

(assert (= (and b!1035010 c!104794) b!1035001))

(assert (= (and b!1035010 (not c!104794)) b!1034996))

(assert (= (or b!1035001 b!1034996) bm!43729))

(assert (= (or b!1035012 bm!43729) bm!43726))

(assert (= (or b!1035012 b!1035001) bm!43725))

(assert (= (or b!1035007 bm!43726) bm!43727))

(assert (= (or b!1035007 bm!43725) bm!43728))

(assert (= (and d!124281 res!691144) b!1035006))

(assert (= (and d!124281 c!104796) b!1035014))

(assert (= (and d!124281 (not c!104796)) b!1035009))

(assert (= (and d!124281 res!691140) b!1035013))

(assert (= (and b!1035013 res!691137) b!1034998))

(assert (= (and b!1035013 (not res!691141)) b!1034994))

(assert (= (and b!1034994 res!691143) b!1035011))

(assert (= (and b!1035013 res!691142) b!1035008))

(assert (= (and b!1035008 c!104797) b!1034999))

(assert (= (and b!1035008 (not c!104797)) b!1035000))

(assert (= (and b!1034999 res!691145) b!1034997))

(assert (= (or b!1034999 b!1035000) bm!43724))

(assert (= (and b!1035008 res!691138) b!1035003))

(assert (= (and b!1035003 c!104795) b!1035002))

(assert (= (and b!1035003 (not c!104795)) b!1035005))

(assert (= (and b!1035002 res!691139) b!1035004))

(assert (= (or b!1035002 b!1035005) bm!43723))

(declare-fun b_lambda!16063 () Bool)

(assert (=> (not b_lambda!16063) (not b!1035011)))

(assert (=> b!1035011 t!31079))

(declare-fun b_and!33287 () Bool)

(assert (= b_and!33277 (and (=> t!31079 result!14375) b_and!33287)))

(declare-fun m!955031 () Bool)

(assert (=> bm!43728 m!955031))

(declare-fun m!955033 () Bool)

(assert (=> bm!43723 m!955033))

(declare-fun m!955035 () Bool)

(assert (=> b!1034998 m!955035))

(assert (=> b!1034998 m!955035))

(declare-fun m!955037 () Bool)

(assert (=> b!1034998 m!955037))

(declare-fun m!955039 () Bool)

(assert (=> b!1035011 m!955039))

(assert (=> b!1035011 m!954937))

(declare-fun m!955041 () Bool)

(assert (=> b!1035011 m!955041))

(assert (=> b!1035011 m!955039))

(assert (=> b!1035011 m!955035))

(declare-fun m!955043 () Bool)

(assert (=> b!1035011 m!955043))

(assert (=> b!1035011 m!954937))

(assert (=> b!1035011 m!955035))

(declare-fun m!955045 () Bool)

(assert (=> bm!43727 m!955045))

(declare-fun m!955047 () Bool)

(assert (=> d!124281 m!955047))

(declare-fun m!955049 () Bool)

(assert (=> b!1035007 m!955049))

(declare-fun m!955051 () Bool)

(assert (=> b!1035004 m!955051))

(declare-fun m!955053 () Bool)

(assert (=> bm!43724 m!955053))

(declare-fun m!955055 () Bool)

(assert (=> b!1034997 m!955055))

(assert (=> b!1035006 m!955035))

(assert (=> b!1035006 m!955035))

(assert (=> b!1035006 m!955037))

(assert (=> b!1034994 m!955035))

(assert (=> b!1034994 m!955035))

(declare-fun m!955057 () Bool)

(assert (=> b!1034994 m!955057))

(declare-fun m!955059 () Bool)

(assert (=> b!1035014 m!955059))

(declare-fun m!955061 () Bool)

(assert (=> b!1035014 m!955061))

(declare-fun m!955063 () Bool)

(assert (=> b!1035014 m!955063))

(declare-fun m!955065 () Bool)

(assert (=> b!1035014 m!955065))

(declare-fun m!955067 () Bool)

(assert (=> b!1035014 m!955067))

(declare-fun m!955069 () Bool)

(assert (=> b!1035014 m!955069))

(assert (=> b!1035014 m!955063))

(declare-fun m!955071 () Bool)

(assert (=> b!1035014 m!955071))

(assert (=> b!1035014 m!955059))

(declare-fun m!955073 () Bool)

(assert (=> b!1035014 m!955073))

(declare-fun m!955075 () Bool)

(assert (=> b!1035014 m!955075))

(declare-fun m!955077 () Bool)

(assert (=> b!1035014 m!955077))

(assert (=> b!1035014 m!955075))

(declare-fun m!955079 () Bool)

(assert (=> b!1035014 m!955079))

(declare-fun m!955081 () Bool)

(assert (=> b!1035014 m!955081))

(declare-fun m!955083 () Bool)

(assert (=> b!1035014 m!955083))

(declare-fun m!955085 () Bool)

(assert (=> b!1035014 m!955085))

(assert (=> b!1035014 m!955035))

(assert (=> b!1035014 m!955081))

(assert (=> b!1035014 m!955045))

(declare-fun m!955087 () Bool)

(assert (=> b!1035014 m!955087))

(assert (=> b!1034891 d!124281))

(declare-fun d!124283 () Bool)

(assert (=> d!124283 (= (-!519 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456721 () Unit!33837)

(declare-fun choose!1700 (array!65163 array!65165 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37563 V!37563 V!37563 Int) Unit!33837)

(assert (=> d!124283 (= lt!456721 (choose!1700 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!456631 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)))))

(assert (=> d!124283 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124283 (= (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!11 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!456631 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)) lt!456721)))

(declare-fun bs!30234 () Bool)

(assert (= bs!30234 d!124283))

(declare-fun m!955089 () Bool)

(assert (=> bs!30234 m!955089))

(assert (=> bs!30234 m!955047))

(assert (=> bs!30234 m!954939))

(assert (=> bs!30234 m!954941))

(assert (=> bs!30234 m!954935))

(assert (=> bs!30234 m!954939))

(assert (=> b!1034891 d!124283))

(declare-fun d!124285 () Bool)

(declare-fun lt!456722 () ListLongMap!13761)

(assert (=> d!124285 (not (contains!6037 lt!456722 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124285 (= lt!456722 (ListLongMap!13762 (removeStrictlySorted!55 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124285 (= (-!519 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456722)))

(declare-fun bs!30235 () Bool)

(assert (= bs!30235 d!124285))

(declare-fun m!955091 () Bool)

(assert (=> bs!30235 m!955091))

(declare-fun m!955093 () Bool)

(assert (=> bs!30235 m!955093))

(assert (=> b!1034891 d!124285))

(declare-fun b!1035015 () Bool)

(declare-fun e!585165 () Bool)

(declare-fun e!585160 () Bool)

(assert (=> b!1035015 (= e!585165 e!585160)))

(declare-fun res!691152 () Bool)

(assert (=> b!1035015 (=> (not res!691152) (not e!585160))))

(declare-fun lt!456742 () ListLongMap!13761)

(assert (=> b!1035015 (= res!691152 (contains!6037 lt!456742 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035015 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035016 () Bool)

(declare-fun e!585161 () ListLongMap!13761)

(declare-fun e!585157 () ListLongMap!13761)

(assert (=> b!1035016 (= e!585161 e!585157)))

(declare-fun c!104804 () Bool)

(assert (=> b!1035016 (= c!104804 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035017 () Bool)

(declare-fun e!585159 () ListLongMap!13761)

(declare-fun call!43738 () ListLongMap!13761)

(assert (=> b!1035017 (= e!585159 call!43738)))

(declare-fun b!1035018 () Bool)

(declare-fun e!585162 () Bool)

(assert (=> b!1035018 (= e!585162 (= (apply!915 lt!456742 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6062 thiss!1427)))))

(declare-fun b!1035019 () Bool)

(declare-fun e!585155 () Bool)

(assert (=> b!1035019 (= e!585155 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035020 () Bool)

(declare-fun e!585163 () Bool)

(assert (=> b!1035020 (= e!585163 e!585162)))

(declare-fun res!691154 () Bool)

(declare-fun call!43735 () Bool)

(assert (=> b!1035020 (= res!691154 call!43735)))

(assert (=> b!1035020 (=> (not res!691154) (not e!585162))))

(declare-fun bm!43730 () Bool)

(declare-fun call!43736 () Bool)

(assert (=> bm!43730 (= call!43736 (contains!6037 lt!456742 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43731 () Bool)

(assert (=> bm!43731 (= call!43735 (contains!6037 lt!456742 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035021 () Bool)

(assert (=> b!1035021 (= e!585163 (not call!43735))))

(declare-fun b!1035022 () Bool)

(declare-fun call!43737 () ListLongMap!13761)

(assert (=> b!1035022 (= e!585159 call!43737)))

(declare-fun b!1035023 () Bool)

(declare-fun e!585156 () Bool)

(declare-fun e!585153 () Bool)

(assert (=> b!1035023 (= e!585156 e!585153)))

(declare-fun res!691148 () Bool)

(assert (=> b!1035023 (= res!691148 call!43736)))

(assert (=> b!1035023 (=> (not res!691148) (not e!585153))))

(declare-fun d!124287 () Bool)

(declare-fun e!585154 () Bool)

(assert (=> d!124287 e!585154))

(declare-fun res!691149 () Bool)

(assert (=> d!124287 (=> (not res!691149) (not e!585154))))

(assert (=> d!124287 (= res!691149 (or (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))))

(declare-fun lt!456732 () ListLongMap!13761)

(assert (=> d!124287 (= lt!456742 lt!456732)))

(declare-fun lt!456728 () Unit!33837)

(declare-fun e!585158 () Unit!33837)

(assert (=> d!124287 (= lt!456728 e!585158)))

(declare-fun c!104802 () Bool)

(declare-fun e!585164 () Bool)

(assert (=> d!124287 (= c!104802 e!585164)))

(declare-fun res!691153 () Bool)

(assert (=> d!124287 (=> (not res!691153) (not e!585164))))

(assert (=> d!124287 (= res!691153 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124287 (= lt!456732 e!585161)))

(declare-fun c!104799 () Bool)

(assert (=> d!124287 (= c!104799 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124287 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124287 (= (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456742)))

(declare-fun bm!43732 () Bool)

(declare-fun call!43734 () ListLongMap!13761)

(assert (=> bm!43732 (= call!43737 call!43734)))

(declare-fun b!1035024 () Bool)

(assert (=> b!1035024 (= e!585154 e!585156)))

(declare-fun c!104801 () Bool)

(assert (=> b!1035024 (= c!104801 (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035025 () Bool)

(assert (=> b!1035025 (= e!585153 (= (apply!915 lt!456742 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 thiss!1427)))))

(declare-fun b!1035026 () Bool)

(assert (=> b!1035026 (= e!585156 (not call!43736))))

(declare-fun bm!43733 () Bool)

(declare-fun call!43733 () ListLongMap!13761)

(declare-fun call!43739 () ListLongMap!13761)

(assert (=> bm!43733 (= call!43733 call!43739)))

(declare-fun b!1035027 () Bool)

(assert (=> b!1035027 (= e!585164 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035028 () Bool)

(assert (=> b!1035028 (= e!585161 (+!3126 call!43734 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun bm!43734 () Bool)

(assert (=> bm!43734 (= call!43739 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun b!1035029 () Bool)

(declare-fun res!691147 () Bool)

(assert (=> b!1035029 (=> (not res!691147) (not e!585154))))

(assert (=> b!1035029 (= res!691147 e!585163)))

(declare-fun c!104803 () Bool)

(assert (=> b!1035029 (= c!104803 (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43735 () Bool)

(assert (=> bm!43735 (= call!43734 (+!3126 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035030 () Bool)

(declare-fun Unit!33840 () Unit!33837)

(assert (=> b!1035030 (= e!585158 Unit!33840)))

(declare-fun b!1035031 () Bool)

(declare-fun c!104800 () Bool)

(assert (=> b!1035031 (= c!104800 (and (not (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035031 (= e!585157 e!585159)))

(declare-fun b!1035032 () Bool)

(assert (=> b!1035032 (= e!585160 (= (apply!915 lt!456742 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 thiss!1427))))))

(assert (=> b!1035032 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035033 () Bool)

(assert (=> b!1035033 (= e!585157 call!43737)))

(declare-fun b!1035034 () Bool)

(declare-fun res!691151 () Bool)

(assert (=> b!1035034 (=> (not res!691151) (not e!585154))))

(assert (=> b!1035034 (= res!691151 e!585165)))

(declare-fun res!691150 () Bool)

(assert (=> b!1035034 (=> res!691150 e!585165)))

(assert (=> b!1035034 (= res!691150 (not e!585155))))

(declare-fun res!691146 () Bool)

(assert (=> b!1035034 (=> (not res!691146) (not e!585155))))

(assert (=> b!1035034 (= res!691146 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035035 () Bool)

(declare-fun lt!456737 () Unit!33837)

(assert (=> b!1035035 (= e!585158 lt!456737)))

(declare-fun lt!456726 () ListLongMap!13761)

(assert (=> b!1035035 (= lt!456726 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456743 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456743 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456729 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456729 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456733 () Unit!33837)

(assert (=> b!1035035 (= lt!456733 (addStillContains!625 lt!456726 lt!456743 (zeroValue!6062 thiss!1427) lt!456729))))

(assert (=> b!1035035 (contains!6037 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!456729)))

(declare-fun lt!456744 () Unit!33837)

(assert (=> b!1035035 (= lt!456744 lt!456733)))

(declare-fun lt!456734 () ListLongMap!13761)

(assert (=> b!1035035 (= lt!456734 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456735 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456735 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456736 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456736 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456740 () Unit!33837)

(assert (=> b!1035035 (= lt!456740 (addApplyDifferent!481 lt!456734 lt!456735 (minValue!6062 thiss!1427) lt!456736))))

(assert (=> b!1035035 (= (apply!915 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456736) (apply!915 lt!456734 lt!456736))))

(declare-fun lt!456738 () Unit!33837)

(assert (=> b!1035035 (= lt!456738 lt!456740)))

(declare-fun lt!456730 () ListLongMap!13761)

(assert (=> b!1035035 (= lt!456730 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456727 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456727 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456724 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456724 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456723 () Unit!33837)

(assert (=> b!1035035 (= lt!456723 (addApplyDifferent!481 lt!456730 lt!456727 (zeroValue!6062 thiss!1427) lt!456724))))

(assert (=> b!1035035 (= (apply!915 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!456724) (apply!915 lt!456730 lt!456724))))

(declare-fun lt!456739 () Unit!33837)

(assert (=> b!1035035 (= lt!456739 lt!456723)))

(declare-fun lt!456725 () ListLongMap!13761)

(assert (=> b!1035035 (= lt!456725 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(declare-fun lt!456741 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456741 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456731 () (_ BitVec 64))

(assert (=> b!1035035 (= lt!456731 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1035035 (= lt!456737 (addApplyDifferent!481 lt!456725 lt!456741 (minValue!6062 thiss!1427) lt!456731))))

(assert (=> b!1035035 (= (apply!915 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!456731) (apply!915 lt!456725 lt!456731))))

(declare-fun bm!43736 () Bool)

(assert (=> bm!43736 (= call!43738 call!43733)))

(assert (= (and d!124287 c!104799) b!1035028))

(assert (= (and d!124287 (not c!104799)) b!1035016))

(assert (= (and b!1035016 c!104804) b!1035033))

(assert (= (and b!1035016 (not c!104804)) b!1035031))

(assert (= (and b!1035031 c!104800) b!1035022))

(assert (= (and b!1035031 (not c!104800)) b!1035017))

(assert (= (or b!1035022 b!1035017) bm!43736))

(assert (= (or b!1035033 bm!43736) bm!43733))

(assert (= (or b!1035033 b!1035022) bm!43732))

(assert (= (or b!1035028 bm!43733) bm!43734))

(assert (= (or b!1035028 bm!43732) bm!43735))

(assert (= (and d!124287 res!691153) b!1035027))

(assert (= (and d!124287 c!104802) b!1035035))

(assert (= (and d!124287 (not c!104802)) b!1035030))

(assert (= (and d!124287 res!691149) b!1035034))

(assert (= (and b!1035034 res!691146) b!1035019))

(assert (= (and b!1035034 (not res!691150)) b!1035015))

(assert (= (and b!1035015 res!691152) b!1035032))

(assert (= (and b!1035034 res!691151) b!1035029))

(assert (= (and b!1035029 c!104803) b!1035020))

(assert (= (and b!1035029 (not c!104803)) b!1035021))

(assert (= (and b!1035020 res!691154) b!1035018))

(assert (= (or b!1035020 b!1035021) bm!43731))

(assert (= (and b!1035029 res!691147) b!1035024))

(assert (= (and b!1035024 c!104801) b!1035023))

(assert (= (and b!1035024 (not c!104801)) b!1035026))

(assert (= (and b!1035023 res!691148) b!1035025))

(assert (= (or b!1035023 b!1035026) bm!43730))

(declare-fun b_lambda!16065 () Bool)

(assert (=> (not b_lambda!16065) (not b!1035032)))

(assert (=> b!1035032 t!31079))

(declare-fun b_and!33289 () Bool)

(assert (= b_and!33287 (and (=> t!31079 result!14375) b_and!33289)))

(declare-fun m!955095 () Bool)

(assert (=> bm!43735 m!955095))

(declare-fun m!955097 () Bool)

(assert (=> bm!43730 m!955097))

(assert (=> b!1035019 m!955035))

(assert (=> b!1035019 m!955035))

(assert (=> b!1035019 m!955037))

(assert (=> b!1035032 m!955039))

(assert (=> b!1035032 m!954937))

(assert (=> b!1035032 m!955041))

(assert (=> b!1035032 m!955039))

(assert (=> b!1035032 m!955035))

(declare-fun m!955099 () Bool)

(assert (=> b!1035032 m!955099))

(assert (=> b!1035032 m!954937))

(assert (=> b!1035032 m!955035))

(declare-fun m!955101 () Bool)

(assert (=> bm!43734 m!955101))

(assert (=> d!124287 m!955047))

(declare-fun m!955103 () Bool)

(assert (=> b!1035028 m!955103))

(declare-fun m!955105 () Bool)

(assert (=> b!1035025 m!955105))

(declare-fun m!955107 () Bool)

(assert (=> bm!43731 m!955107))

(declare-fun m!955109 () Bool)

(assert (=> b!1035018 m!955109))

(assert (=> b!1035027 m!955035))

(assert (=> b!1035027 m!955035))

(assert (=> b!1035027 m!955037))

(assert (=> b!1035015 m!955035))

(assert (=> b!1035015 m!955035))

(declare-fun m!955111 () Bool)

(assert (=> b!1035015 m!955111))

(declare-fun m!955113 () Bool)

(assert (=> b!1035035 m!955113))

(declare-fun m!955115 () Bool)

(assert (=> b!1035035 m!955115))

(declare-fun m!955117 () Bool)

(assert (=> b!1035035 m!955117))

(declare-fun m!955119 () Bool)

(assert (=> b!1035035 m!955119))

(declare-fun m!955121 () Bool)

(assert (=> b!1035035 m!955121))

(declare-fun m!955123 () Bool)

(assert (=> b!1035035 m!955123))

(assert (=> b!1035035 m!955117))

(declare-fun m!955125 () Bool)

(assert (=> b!1035035 m!955125))

(assert (=> b!1035035 m!955113))

(declare-fun m!955127 () Bool)

(assert (=> b!1035035 m!955127))

(declare-fun m!955129 () Bool)

(assert (=> b!1035035 m!955129))

(declare-fun m!955131 () Bool)

(assert (=> b!1035035 m!955131))

(assert (=> b!1035035 m!955129))

(declare-fun m!955133 () Bool)

(assert (=> b!1035035 m!955133))

(declare-fun m!955135 () Bool)

(assert (=> b!1035035 m!955135))

(declare-fun m!955137 () Bool)

(assert (=> b!1035035 m!955137))

(declare-fun m!955139 () Bool)

(assert (=> b!1035035 m!955139))

(assert (=> b!1035035 m!955035))

(assert (=> b!1035035 m!955135))

(assert (=> b!1035035 m!955101))

(declare-fun m!955141 () Bool)

(assert (=> b!1035035 m!955141))

(assert (=> b!1034891 d!124287))

(declare-fun condMapEmpty!38267 () Bool)

(declare-fun mapDefault!38267 () ValueCell!11555)

(assert (=> mapNonEmpty!38258 (= condMapEmpty!38267 (= mapRest!38258 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38267)))))

(declare-fun e!585170 () Bool)

(declare-fun mapRes!38267 () Bool)

(assert (=> mapNonEmpty!38258 (= tp!73491 (and e!585170 mapRes!38267))))

(declare-fun mapIsEmpty!38267 () Bool)

(assert (=> mapIsEmpty!38267 mapRes!38267))

(declare-fun b!1035042 () Bool)

(declare-fun e!585171 () Bool)

(assert (=> b!1035042 (= e!585171 tp_is_empty!24517)))

(declare-fun b!1035043 () Bool)

(assert (=> b!1035043 (= e!585170 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38267 () Bool)

(declare-fun tp!73506 () Bool)

(assert (=> mapNonEmpty!38267 (= mapRes!38267 (and tp!73506 e!585171))))

(declare-fun mapKey!38267 () (_ BitVec 32))

(declare-fun mapRest!38267 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapValue!38267 () ValueCell!11555)

(assert (=> mapNonEmpty!38267 (= mapRest!38258 (store mapRest!38267 mapKey!38267 mapValue!38267))))

(assert (= (and mapNonEmpty!38258 condMapEmpty!38267) mapIsEmpty!38267))

(assert (= (and mapNonEmpty!38258 (not condMapEmpty!38267)) mapNonEmpty!38267))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11555) mapValue!38267)) b!1035042))

(assert (= (and mapNonEmpty!38258 ((_ is ValueCellFull!11555) mapDefault!38267)) b!1035043))

(declare-fun m!955143 () Bool)

(assert (=> mapNonEmpty!38267 m!955143))

(declare-fun b_lambda!16067 () Bool)

(assert (= b_lambda!16063 (or (and b!1034889 b_free!20797) b_lambda!16067)))

(declare-fun b_lambda!16069 () Bool)

(assert (= b_lambda!16065 (or (and b!1034889 b_free!20797) b_lambda!16069)))

(check-sat (not b!1035035) (not bm!43723) (not b!1034994) (not b!1035007) (not b!1034950) (not b!1035028) (not b!1034949) (not bm!43734) (not b_lambda!16061) (not b_next!20797) (not b!1035014) b_and!33289 (not d!124273) (not b!1035006) (not b!1035018) (not b!1034947) (not d!124267) (not d!124285) (not b!1034948) (not b!1035027) (not bm!43730) (not d!124275) (not d!124281) (not b!1034998) (not d!124277) (not bm!43731) (not b!1035025) (not b!1035015) (not d!124279) (not d!124287) (not b!1034946) (not d!124283) (not b!1034997) (not mapNonEmpty!38267) (not b!1035019) (not b!1035032) (not b_lambda!16069) (not bm!43724) (not bm!43735) (not b_lambda!16067) (not b!1035011) (not bm!43728) (not b!1034951) (not b!1035004) tp_is_empty!24517 (not bm!43727))
(check-sat b_and!33289 (not b_next!20797))
(get-model)

(declare-fun d!124289 () Bool)

(assert (=> d!124289 (= (apply!915 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456705) (apply!915 lt!456699 lt!456705))))

(declare-fun lt!456747 () Unit!33837)

(declare-fun choose!1701 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> d!124289 (= lt!456747 (choose!1701 lt!456699 lt!456715 (minValue!6062 thiss!1427) lt!456705))))

(declare-fun e!585174 () Bool)

(assert (=> d!124289 e!585174))

(declare-fun res!691157 () Bool)

(assert (=> d!124289 (=> (not res!691157) (not e!585174))))

(assert (=> d!124289 (= res!691157 (contains!6037 lt!456699 lt!456705))))

(assert (=> d!124289 (= (addApplyDifferent!481 lt!456699 lt!456715 (minValue!6062 thiss!1427) lt!456705) lt!456747)))

(declare-fun b!1035047 () Bool)

(assert (=> b!1035047 (= e!585174 (not (= lt!456705 lt!456715)))))

(assert (= (and d!124289 res!691157) b!1035047))

(declare-fun m!955145 () Bool)

(assert (=> d!124289 m!955145))

(assert (=> d!124289 m!955059))

(assert (=> d!124289 m!955073))

(assert (=> d!124289 m!955065))

(declare-fun m!955147 () Bool)

(assert (=> d!124289 m!955147))

(assert (=> d!124289 m!955059))

(assert (=> b!1035014 d!124289))

(declare-fun b!1035072 () Bool)

(declare-fun res!691168 () Bool)

(declare-fun e!585195 () Bool)

(assert (=> b!1035072 (=> (not res!691168) (not e!585195))))

(declare-fun lt!456767 () ListLongMap!13761)

(assert (=> b!1035072 (= res!691168 (not (contains!6037 lt!456767 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035073 () Bool)

(declare-fun e!585192 () Bool)

(declare-fun isEmpty!930 (ListLongMap!13761) Bool)

(assert (=> b!1035073 (= e!585192 (isEmpty!930 lt!456767))))

(declare-fun b!1035074 () Bool)

(assert (=> b!1035074 (= e!585192 (= lt!456767 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1035076 () Bool)

(declare-fun lt!456765 () Unit!33837)

(declare-fun lt!456763 () Unit!33837)

(assert (=> b!1035076 (= lt!456765 lt!456763)))

(declare-fun lt!456768 () ListLongMap!13761)

(declare-fun lt!456762 () (_ BitVec 64))

(declare-fun lt!456764 () (_ BitVec 64))

(declare-fun lt!456766 () V!37563)

(assert (=> b!1035076 (not (contains!6037 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766)) lt!456764))))

(declare-fun addStillNotContains!244 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> b!1035076 (= lt!456763 (addStillNotContains!244 lt!456768 lt!456762 lt!456766 lt!456764))))

(assert (=> b!1035076 (= lt!456764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035076 (= lt!456766 (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035076 (= lt!456762 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43742 () ListLongMap!13761)

(assert (=> b!1035076 (= lt!456768 call!43742)))

(declare-fun e!585193 () ListLongMap!13761)

(assert (=> b!1035076 (= e!585193 (+!3126 call!43742 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035077 () Bool)

(assert (=> b!1035077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> b!1035077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 thiss!1427))))))

(declare-fun e!585189 () Bool)

(assert (=> b!1035077 (= e!585189 (= (apply!915 lt!456767 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035078 () Bool)

(declare-fun e!585190 () Bool)

(assert (=> b!1035078 (= e!585190 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035078 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1035079 () Bool)

(declare-fun e!585194 () ListLongMap!13761)

(assert (=> b!1035079 (= e!585194 (ListLongMap!13762 Nil!21889))))

(declare-fun b!1035080 () Bool)

(declare-fun e!585191 () Bool)

(assert (=> b!1035080 (= e!585195 e!585191)))

(declare-fun c!104814 () Bool)

(assert (=> b!1035080 (= c!104814 e!585190)))

(declare-fun res!691167 () Bool)

(assert (=> b!1035080 (=> (not res!691167) (not e!585190))))

(assert (=> b!1035080 (= res!691167 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035081 () Bool)

(assert (=> b!1035081 (= e!585193 call!43742)))

(declare-fun b!1035082 () Bool)

(assert (=> b!1035082 (= e!585191 e!585189)))

(assert (=> b!1035082 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun res!691169 () Bool)

(assert (=> b!1035082 (= res!691169 (contains!6037 lt!456767 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035082 (=> (not res!691169) (not e!585189))))

(declare-fun b!1035075 () Bool)

(assert (=> b!1035075 (= e!585194 e!585193)))

(declare-fun c!104816 () Bool)

(assert (=> b!1035075 (= c!104816 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124291 () Bool)

(assert (=> d!124291 e!585195))

(declare-fun res!691166 () Bool)

(assert (=> d!124291 (=> (not res!691166) (not e!585195))))

(assert (=> d!124291 (= res!691166 (not (contains!6037 lt!456767 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124291 (= lt!456767 e!585194)))

(declare-fun c!104815 () Bool)

(assert (=> d!124291 (= c!104815 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124291 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124291 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456767)))

(declare-fun b!1035083 () Bool)

(assert (=> b!1035083 (= e!585191 e!585192)))

(declare-fun c!104813 () Bool)

(assert (=> b!1035083 (= c!104813 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun bm!43739 () Bool)

(assert (=> bm!43739 (= call!43742 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(assert (= (and d!124291 c!104815) b!1035079))

(assert (= (and d!124291 (not c!104815)) b!1035075))

(assert (= (and b!1035075 c!104816) b!1035076))

(assert (= (and b!1035075 (not c!104816)) b!1035081))

(assert (= (or b!1035076 b!1035081) bm!43739))

(assert (= (and d!124291 res!691166) b!1035072))

(assert (= (and b!1035072 res!691168) b!1035080))

(assert (= (and b!1035080 res!691167) b!1035078))

(assert (= (and b!1035080 c!104814) b!1035082))

(assert (= (and b!1035080 (not c!104814)) b!1035083))

(assert (= (and b!1035082 res!691169) b!1035077))

(assert (= (and b!1035083 c!104813) b!1035074))

(assert (= (and b!1035083 (not c!104813)) b!1035073))

(declare-fun b_lambda!16071 () Bool)

(assert (=> (not b_lambda!16071) (not b!1035076)))

(assert (=> b!1035076 t!31079))

(declare-fun b_and!33291 () Bool)

(assert (= b_and!33289 (and (=> t!31079 result!14375) b_and!33291)))

(declare-fun b_lambda!16073 () Bool)

(assert (=> (not b_lambda!16073) (not b!1035077)))

(assert (=> b!1035077 t!31079))

(declare-fun b_and!33293 () Bool)

(assert (= b_and!33291 (and (=> t!31079 result!14375) b_and!33293)))

(assert (=> b!1035077 m!955035))

(declare-fun m!955149 () Bool)

(assert (=> b!1035077 m!955149))

(assert (=> b!1035077 m!955039))

(assert (=> b!1035077 m!954937))

(assert (=> b!1035077 m!955041))

(assert (=> b!1035077 m!954937))

(assert (=> b!1035077 m!955039))

(assert (=> b!1035077 m!955035))

(declare-fun m!955151 () Bool)

(assert (=> b!1035076 m!955151))

(declare-fun m!955153 () Bool)

(assert (=> b!1035076 m!955153))

(declare-fun m!955155 () Bool)

(assert (=> b!1035076 m!955155))

(assert (=> b!1035076 m!955039))

(assert (=> b!1035076 m!954937))

(assert (=> b!1035076 m!955041))

(assert (=> b!1035076 m!954937))

(assert (=> b!1035076 m!955039))

(assert (=> b!1035076 m!955151))

(declare-fun m!955157 () Bool)

(assert (=> b!1035076 m!955157))

(assert (=> b!1035076 m!955035))

(declare-fun m!955159 () Bool)

(assert (=> bm!43739 m!955159))

(assert (=> b!1035075 m!955035))

(assert (=> b!1035075 m!955035))

(assert (=> b!1035075 m!955037))

(declare-fun m!955161 () Bool)

(assert (=> b!1035073 m!955161))

(assert (=> b!1035082 m!955035))

(assert (=> b!1035082 m!955035))

(declare-fun m!955163 () Bool)

(assert (=> b!1035082 m!955163))

(assert (=> b!1035074 m!955159))

(assert (=> b!1035078 m!955035))

(assert (=> b!1035078 m!955035))

(assert (=> b!1035078 m!955037))

(declare-fun m!955165 () Bool)

(assert (=> b!1035072 m!955165))

(declare-fun m!955167 () Bool)

(assert (=> d!124291 m!955167))

(assert (=> d!124291 m!955047))

(assert (=> b!1035014 d!124291))

(declare-fun d!124293 () Bool)

(assert (=> d!124293 (contains!6037 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)) lt!456703)))

(declare-fun lt!456771 () Unit!33837)

(declare-fun choose!1702 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> d!124293 (= lt!456771 (choose!1702 lt!456700 lt!456717 lt!456631 lt!456703))))

(assert (=> d!124293 (contains!6037 lt!456700 lt!456703)))

(assert (=> d!124293 (= (addStillContains!625 lt!456700 lt!456717 lt!456631 lt!456703) lt!456771)))

(declare-fun bs!30236 () Bool)

(assert (= bs!30236 d!124293))

(assert (=> bs!30236 m!955063))

(assert (=> bs!30236 m!955063))

(assert (=> bs!30236 m!955071))

(declare-fun m!955169 () Bool)

(assert (=> bs!30236 m!955169))

(declare-fun m!955171 () Bool)

(assert (=> bs!30236 m!955171))

(assert (=> b!1035014 d!124293))

(declare-fun d!124295 () Bool)

(declare-datatypes ((Option!635 0))(
  ( (Some!634 (v!14885 V!37563)) (None!633) )
))
(declare-fun get!16463 (Option!635) V!37563)

(declare-fun getValueByKey!584 (List!21892 (_ BitVec 64)) Option!635)

(assert (=> d!124295 (= (apply!915 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)) lt!456698) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))) lt!456698)))))

(declare-fun bs!30237 () Bool)

(assert (= bs!30237 d!124295))

(declare-fun m!955173 () Bool)

(assert (=> bs!30237 m!955173))

(assert (=> bs!30237 m!955173))

(declare-fun m!955175 () Bool)

(assert (=> bs!30237 m!955175))

(assert (=> b!1035014 d!124295))

(declare-fun d!124297 () Bool)

(assert (=> d!124297 (= (apply!915 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456710) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456710)))))

(declare-fun bs!30238 () Bool)

(assert (= bs!30238 d!124297))

(declare-fun m!955177 () Bool)

(assert (=> bs!30238 m!955177))

(assert (=> bs!30238 m!955177))

(declare-fun m!955179 () Bool)

(assert (=> bs!30238 m!955179))

(assert (=> b!1035014 d!124297))

(declare-fun d!124299 () Bool)

(declare-fun e!585198 () Bool)

(assert (=> d!124299 e!585198))

(declare-fun res!691174 () Bool)

(assert (=> d!124299 (=> (not res!691174) (not e!585198))))

(declare-fun lt!456781 () ListLongMap!13761)

(assert (=> d!124299 (= res!691174 (contains!6037 lt!456781 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456783 () List!21892)

(assert (=> d!124299 (= lt!456781 (ListLongMap!13762 lt!456783))))

(declare-fun lt!456782 () Unit!33837)

(declare-fun lt!456780 () Unit!33837)

(assert (=> d!124299 (= lt!456782 lt!456780)))

(assert (=> d!124299 (= (getValueByKey!584 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!280 (List!21892 (_ BitVec 64) V!37563) Unit!33837)

(assert (=> d!124299 (= lt!456780 (lemmaContainsTupThenGetReturnValue!280 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun insertStrictlySorted!373 (List!21892 (_ BitVec 64) V!37563) List!21892)

(assert (=> d!124299 (= lt!456783 (insertStrictlySorted!373 (toList!6896 lt!456699) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(assert (=> d!124299 (= (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456781)))

(declare-fun b!1035089 () Bool)

(declare-fun res!691175 () Bool)

(assert (=> b!1035089 (=> (not res!691175) (not e!585198))))

(assert (=> b!1035089 (= res!691175 (= (getValueByKey!584 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035090 () Bool)

(declare-fun contains!6038 (List!21892 tuple2!15726) Bool)

(assert (=> b!1035090 (= e!585198 (contains!6038 (toList!6896 lt!456781) (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))

(assert (= (and d!124299 res!691174) b!1035089))

(assert (= (and b!1035089 res!691175) b!1035090))

(declare-fun m!955181 () Bool)

(assert (=> d!124299 m!955181))

(declare-fun m!955183 () Bool)

(assert (=> d!124299 m!955183))

(declare-fun m!955185 () Bool)

(assert (=> d!124299 m!955185))

(declare-fun m!955187 () Bool)

(assert (=> d!124299 m!955187))

(declare-fun m!955189 () Bool)

(assert (=> b!1035089 m!955189))

(declare-fun m!955191 () Bool)

(assert (=> b!1035090 m!955191))

(assert (=> b!1035014 d!124299))

(declare-fun d!124301 () Bool)

(assert (=> d!124301 (= (apply!915 lt!456708 lt!456710) (get!16463 (getValueByKey!584 (toList!6896 lt!456708) lt!456710)))))

(declare-fun bs!30239 () Bool)

(assert (= bs!30239 d!124301))

(declare-fun m!955193 () Bool)

(assert (=> bs!30239 m!955193))

(assert (=> bs!30239 m!955193))

(declare-fun m!955195 () Bool)

(assert (=> bs!30239 m!955195))

(assert (=> b!1035014 d!124301))

(declare-fun d!124303 () Bool)

(declare-fun e!585199 () Bool)

(assert (=> d!124303 e!585199))

(declare-fun res!691176 () Bool)

(assert (=> d!124303 (=> (not res!691176) (not e!585199))))

(declare-fun lt!456785 () ListLongMap!13761)

(assert (=> d!124303 (= res!691176 (contains!6037 lt!456785 (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun lt!456787 () List!21892)

(assert (=> d!124303 (= lt!456785 (ListLongMap!13762 lt!456787))))

(declare-fun lt!456786 () Unit!33837)

(declare-fun lt!456784 () Unit!33837)

(assert (=> d!124303 (= lt!456786 lt!456784)))

(assert (=> d!124303 (= (getValueByKey!584 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(assert (=> d!124303 (= lt!456784 (lemmaContainsTupThenGetReturnValue!280 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(assert (=> d!124303 (= lt!456787 (insertStrictlySorted!373 (toList!6896 lt!456700) (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(assert (=> d!124303 (= (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)) lt!456785)))

(declare-fun b!1035091 () Bool)

(declare-fun res!691177 () Bool)

(assert (=> b!1035091 (=> (not res!691177) (not e!585199))))

(assert (=> b!1035091 (= res!691177 (= (getValueByKey!584 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(declare-fun b!1035092 () Bool)

(assert (=> b!1035092 (= e!585199 (contains!6038 (toList!6896 lt!456785) (tuple2!15727 lt!456717 lt!456631)))))

(assert (= (and d!124303 res!691176) b!1035091))

(assert (= (and b!1035091 res!691177) b!1035092))

(declare-fun m!955197 () Bool)

(assert (=> d!124303 m!955197))

(declare-fun m!955199 () Bool)

(assert (=> d!124303 m!955199))

(declare-fun m!955201 () Bool)

(assert (=> d!124303 m!955201))

(declare-fun m!955203 () Bool)

(assert (=> d!124303 m!955203))

(declare-fun m!955205 () Bool)

(assert (=> b!1035091 m!955205))

(declare-fun m!955207 () Bool)

(assert (=> b!1035092 m!955207))

(assert (=> b!1035014 d!124303))

(declare-fun d!124305 () Bool)

(declare-fun e!585205 () Bool)

(assert (=> d!124305 e!585205))

(declare-fun res!691180 () Bool)

(assert (=> d!124305 (=> res!691180 e!585205)))

(declare-fun lt!456797 () Bool)

(assert (=> d!124305 (= res!691180 (not lt!456797))))

(declare-fun lt!456796 () Bool)

(assert (=> d!124305 (= lt!456797 lt!456796)))

(declare-fun lt!456799 () Unit!33837)

(declare-fun e!585204 () Unit!33837)

(assert (=> d!124305 (= lt!456799 e!585204)))

(declare-fun c!104819 () Bool)

(assert (=> d!124305 (= c!104819 lt!456796)))

(declare-fun containsKey!565 (List!21892 (_ BitVec 64)) Bool)

(assert (=> d!124305 (= lt!456796 (containsKey!565 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(assert (=> d!124305 (= (contains!6037 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)) lt!456703) lt!456797)))

(declare-fun b!1035099 () Bool)

(declare-fun lt!456798 () Unit!33837)

(assert (=> b!1035099 (= e!585204 lt!456798)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!396 (List!21892 (_ BitVec 64)) Unit!33837)

(assert (=> b!1035099 (= lt!456798 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(declare-fun isDefined!434 (Option!635) Bool)

(assert (=> b!1035099 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(declare-fun b!1035100 () Bool)

(declare-fun Unit!33841 () Unit!33837)

(assert (=> b!1035100 (= e!585204 Unit!33841)))

(declare-fun b!1035101 () Bool)

(assert (=> b!1035101 (= e!585205 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703)))))

(assert (= (and d!124305 c!104819) b!1035099))

(assert (= (and d!124305 (not c!104819)) b!1035100))

(assert (= (and d!124305 (not res!691180)) b!1035101))

(declare-fun m!955209 () Bool)

(assert (=> d!124305 m!955209))

(declare-fun m!955211 () Bool)

(assert (=> b!1035099 m!955211))

(declare-fun m!955213 () Bool)

(assert (=> b!1035099 m!955213))

(assert (=> b!1035099 m!955213))

(declare-fun m!955215 () Bool)

(assert (=> b!1035099 m!955215))

(assert (=> b!1035101 m!955213))

(assert (=> b!1035101 m!955213))

(assert (=> b!1035101 m!955215))

(assert (=> b!1035014 d!124305))

(declare-fun d!124307 () Bool)

(declare-fun e!585206 () Bool)

(assert (=> d!124307 e!585206))

(declare-fun res!691181 () Bool)

(assert (=> d!124307 (=> (not res!691181) (not e!585206))))

(declare-fun lt!456801 () ListLongMap!13761)

(assert (=> d!124307 (= res!691181 (contains!6037 lt!456801 (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun lt!456803 () List!21892)

(assert (=> d!124307 (= lt!456801 (ListLongMap!13762 lt!456803))))

(declare-fun lt!456802 () Unit!33837)

(declare-fun lt!456800 () Unit!33837)

(assert (=> d!124307 (= lt!456802 lt!456800)))

(assert (=> d!124307 (= (getValueByKey!584 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(assert (=> d!124307 (= lt!456800 (lemmaContainsTupThenGetReturnValue!280 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(assert (=> d!124307 (= lt!456803 (insertStrictlySorted!373 (toList!6896 lt!456704) (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(assert (=> d!124307 (= (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)) lt!456801)))

(declare-fun b!1035102 () Bool)

(declare-fun res!691182 () Bool)

(assert (=> b!1035102 (=> (not res!691182) (not e!585206))))

(assert (=> b!1035102 (= res!691182 (= (getValueByKey!584 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(declare-fun b!1035103 () Bool)

(assert (=> b!1035103 (= e!585206 (contains!6038 (toList!6896 lt!456801) (tuple2!15727 lt!456701 lt!456631)))))

(assert (= (and d!124307 res!691181) b!1035102))

(assert (= (and b!1035102 res!691182) b!1035103))

(declare-fun m!955217 () Bool)

(assert (=> d!124307 m!955217))

(declare-fun m!955219 () Bool)

(assert (=> d!124307 m!955219))

(declare-fun m!955221 () Bool)

(assert (=> d!124307 m!955221))

(declare-fun m!955223 () Bool)

(assert (=> d!124307 m!955223))

(declare-fun m!955225 () Bool)

(assert (=> b!1035102 m!955225))

(declare-fun m!955227 () Bool)

(assert (=> b!1035103 m!955227))

(assert (=> b!1035014 d!124307))

(declare-fun d!124309 () Bool)

(assert (=> d!124309 (= (apply!915 lt!456704 lt!456698) (get!16463 (getValueByKey!584 (toList!6896 lt!456704) lt!456698)))))

(declare-fun bs!30240 () Bool)

(assert (= bs!30240 d!124309))

(declare-fun m!955229 () Bool)

(assert (=> bs!30240 m!955229))

(assert (=> bs!30240 m!955229))

(declare-fun m!955231 () Bool)

(assert (=> bs!30240 m!955231))

(assert (=> b!1035014 d!124309))

(declare-fun d!124311 () Bool)

(assert (=> d!124311 (= (apply!915 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)) lt!456698) (apply!915 lt!456704 lt!456698))))

(declare-fun lt!456804 () Unit!33837)

(assert (=> d!124311 (= lt!456804 (choose!1701 lt!456704 lt!456701 lt!456631 lt!456698))))

(declare-fun e!585207 () Bool)

(assert (=> d!124311 e!585207))

(declare-fun res!691183 () Bool)

(assert (=> d!124311 (=> (not res!691183) (not e!585207))))

(assert (=> d!124311 (= res!691183 (contains!6037 lt!456704 lt!456698))))

(assert (=> d!124311 (= (addApplyDifferent!481 lt!456704 lt!456701 lt!456631 lt!456698) lt!456804)))

(declare-fun b!1035104 () Bool)

(assert (=> b!1035104 (= e!585207 (not (= lt!456698 lt!456701)))))

(assert (= (and d!124311 res!691183) b!1035104))

(declare-fun m!955233 () Bool)

(assert (=> d!124311 m!955233))

(assert (=> d!124311 m!955081))

(assert (=> d!124311 m!955083))

(assert (=> d!124311 m!955067))

(declare-fun m!955235 () Bool)

(assert (=> d!124311 m!955235))

(assert (=> d!124311 m!955081))

(assert (=> b!1035014 d!124311))

(declare-fun d!124313 () Bool)

(assert (=> d!124313 (= (apply!915 lt!456699 lt!456705) (get!16463 (getValueByKey!584 (toList!6896 lt!456699) lt!456705)))))

(declare-fun bs!30241 () Bool)

(assert (= bs!30241 d!124313))

(declare-fun m!955237 () Bool)

(assert (=> bs!30241 m!955237))

(assert (=> bs!30241 m!955237))

(declare-fun m!955239 () Bool)

(assert (=> bs!30241 m!955239))

(assert (=> b!1035014 d!124313))

(declare-fun d!124315 () Bool)

(assert (=> d!124315 (= (apply!915 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456710) (apply!915 lt!456708 lt!456710))))

(declare-fun lt!456805 () Unit!33837)

(assert (=> d!124315 (= lt!456805 (choose!1701 lt!456708 lt!456709 (minValue!6062 thiss!1427) lt!456710))))

(declare-fun e!585208 () Bool)

(assert (=> d!124315 e!585208))

(declare-fun res!691184 () Bool)

(assert (=> d!124315 (=> (not res!691184) (not e!585208))))

(assert (=> d!124315 (= res!691184 (contains!6037 lt!456708 lt!456710))))

(assert (=> d!124315 (= (addApplyDifferent!481 lt!456708 lt!456709 (minValue!6062 thiss!1427) lt!456710) lt!456805)))

(declare-fun b!1035105 () Bool)

(assert (=> b!1035105 (= e!585208 (not (= lt!456710 lt!456709)))))

(assert (= (and d!124315 res!691184) b!1035105))

(declare-fun m!955241 () Bool)

(assert (=> d!124315 m!955241))

(assert (=> d!124315 m!955075))

(assert (=> d!124315 m!955079))

(assert (=> d!124315 m!955069))

(declare-fun m!955243 () Bool)

(assert (=> d!124315 m!955243))

(assert (=> d!124315 m!955075))

(assert (=> b!1035014 d!124315))

(declare-fun d!124317 () Bool)

(assert (=> d!124317 (= (apply!915 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456705) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!456705)))))

(declare-fun bs!30242 () Bool)

(assert (= bs!30242 d!124317))

(declare-fun m!955245 () Bool)

(assert (=> bs!30242 m!955245))

(assert (=> bs!30242 m!955245))

(declare-fun m!955247 () Bool)

(assert (=> bs!30242 m!955247))

(assert (=> b!1035014 d!124317))

(declare-fun d!124319 () Bool)

(declare-fun e!585209 () Bool)

(assert (=> d!124319 e!585209))

(declare-fun res!691185 () Bool)

(assert (=> d!124319 (=> (not res!691185) (not e!585209))))

(declare-fun lt!456807 () ListLongMap!13761)

(assert (=> d!124319 (= res!691185 (contains!6037 lt!456807 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456809 () List!21892)

(assert (=> d!124319 (= lt!456807 (ListLongMap!13762 lt!456809))))

(declare-fun lt!456808 () Unit!33837)

(declare-fun lt!456806 () Unit!33837)

(assert (=> d!124319 (= lt!456808 lt!456806)))

(assert (=> d!124319 (= (getValueByKey!584 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(assert (=> d!124319 (= lt!456806 (lemmaContainsTupThenGetReturnValue!280 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(assert (=> d!124319 (= lt!456809 (insertStrictlySorted!373 (toList!6896 lt!456708) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(assert (=> d!124319 (= (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456807)))

(declare-fun b!1035106 () Bool)

(declare-fun res!691186 () Bool)

(assert (=> b!1035106 (=> (not res!691186) (not e!585209))))

(assert (=> b!1035106 (= res!691186 (= (getValueByKey!584 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035107 () Bool)

(assert (=> b!1035107 (= e!585209 (contains!6038 (toList!6896 lt!456807) (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))

(assert (= (and d!124319 res!691185) b!1035106))

(assert (= (and b!1035106 res!691186) b!1035107))

(declare-fun m!955249 () Bool)

(assert (=> d!124319 m!955249))

(declare-fun m!955251 () Bool)

(assert (=> d!124319 m!955251))

(declare-fun m!955253 () Bool)

(assert (=> d!124319 m!955253))

(declare-fun m!955255 () Bool)

(assert (=> d!124319 m!955255))

(declare-fun m!955257 () Bool)

(assert (=> b!1035106 m!955257))

(declare-fun m!955259 () Bool)

(assert (=> b!1035107 m!955259))

(assert (=> b!1035014 d!124319))

(declare-fun d!124321 () Bool)

(declare-fun e!585210 () Bool)

(assert (=> d!124321 e!585210))

(declare-fun res!691187 () Bool)

(assert (=> d!124321 (=> (not res!691187) (not e!585210))))

(declare-fun lt!456811 () ListLongMap!13761)

(assert (=> d!124321 (= res!691187 (contains!6037 lt!456811 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456813 () List!21892)

(assert (=> d!124321 (= lt!456811 (ListLongMap!13762 lt!456813))))

(declare-fun lt!456812 () Unit!33837)

(declare-fun lt!456810 () Unit!33837)

(assert (=> d!124321 (= lt!456812 lt!456810)))

(assert (=> d!124321 (= (getValueByKey!584 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124321 (= lt!456810 (lemmaContainsTupThenGetReturnValue!280 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124321 (= lt!456813 (insertStrictlySorted!373 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124321 (= (+!3126 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456811)))

(declare-fun b!1035108 () Bool)

(declare-fun res!691188 () Bool)

(assert (=> b!1035108 (=> (not res!691188) (not e!585210))))

(assert (=> b!1035108 (= res!691188 (= (getValueByKey!584 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035109 () Bool)

(assert (=> b!1035109 (= e!585210 (contains!6038 (toList!6896 lt!456811) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!124321 res!691187) b!1035108))

(assert (= (and b!1035108 res!691188) b!1035109))

(declare-fun m!955261 () Bool)

(assert (=> d!124321 m!955261))

(declare-fun m!955263 () Bool)

(assert (=> d!124321 m!955263))

(declare-fun m!955265 () Bool)

(assert (=> d!124321 m!955265))

(declare-fun m!955267 () Bool)

(assert (=> d!124321 m!955267))

(declare-fun m!955269 () Bool)

(assert (=> b!1035108 m!955269))

(declare-fun m!955271 () Bool)

(assert (=> b!1035109 m!955271))

(assert (=> bm!43735 d!124321))

(declare-fun d!124323 () Bool)

(assert (=> d!124323 (= (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1034998 d!124323))

(declare-fun d!124325 () Bool)

(declare-fun e!585212 () Bool)

(assert (=> d!124325 e!585212))

(declare-fun res!691189 () Bool)

(assert (=> d!124325 (=> res!691189 e!585212)))

(declare-fun lt!456815 () Bool)

(assert (=> d!124325 (= res!691189 (not lt!456815))))

(declare-fun lt!456814 () Bool)

(assert (=> d!124325 (= lt!456815 lt!456814)))

(declare-fun lt!456817 () Unit!33837)

(declare-fun e!585211 () Unit!33837)

(assert (=> d!124325 (= lt!456817 e!585211)))

(declare-fun c!104820 () Bool)

(assert (=> d!124325 (= c!104820 lt!456814)))

(assert (=> d!124325 (= lt!456814 (containsKey!565 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124325 (= (contains!6037 lt!456722 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456815)))

(declare-fun b!1035110 () Bool)

(declare-fun lt!456816 () Unit!33837)

(assert (=> b!1035110 (= e!585211 lt!456816)))

(assert (=> b!1035110 (= lt!456816 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035110 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035111 () Bool)

(declare-fun Unit!33842 () Unit!33837)

(assert (=> b!1035111 (= e!585211 Unit!33842)))

(declare-fun b!1035112 () Bool)

(assert (=> b!1035112 (= e!585212 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124325 c!104820) b!1035110))

(assert (= (and d!124325 (not c!104820)) b!1035111))

(assert (= (and d!124325 (not res!691189)) b!1035112))

(declare-fun m!955273 () Bool)

(assert (=> d!124325 m!955273))

(declare-fun m!955275 () Bool)

(assert (=> b!1035110 m!955275))

(declare-fun m!955277 () Bool)

(assert (=> b!1035110 m!955277))

(assert (=> b!1035110 m!955277))

(declare-fun m!955279 () Bool)

(assert (=> b!1035110 m!955279))

(assert (=> b!1035112 m!955277))

(assert (=> b!1035112 m!955277))

(assert (=> b!1035112 m!955279))

(assert (=> d!124285 d!124325))

(declare-fun b!1035123 () Bool)

(declare-fun e!585219 () Bool)

(declare-fun lt!456820 () List!21892)

(assert (=> b!1035123 (= e!585219 (not (containsKey!565 lt!456820 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035124 () Bool)

(declare-fun e!585220 () List!21892)

(assert (=> b!1035124 (= e!585220 Nil!21889)))

(declare-fun b!1035125 () Bool)

(declare-fun $colon$colon!603 (List!21892 tuple2!15726) List!21892)

(assert (=> b!1035125 (= e!585220 ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(declare-fun b!1035126 () Bool)

(declare-fun e!585221 () List!21892)

(assert (=> b!1035126 (= e!585221 e!585220)))

(declare-fun c!104825 () Bool)

(assert (=> b!1035126 (= c!104825 (and ((_ is Cons!21888) (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (not (= (_1!7874 (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124327 () Bool)

(assert (=> d!124327 e!585219))

(declare-fun res!691192 () Bool)

(assert (=> d!124327 (=> (not res!691192) (not e!585219))))

(declare-fun isStrictlySorted!706 (List!21892) Bool)

(assert (=> d!124327 (= res!691192 (isStrictlySorted!706 lt!456820))))

(assert (=> d!124327 (= lt!456820 e!585221)))

(declare-fun c!104826 () Bool)

(assert (=> d!124327 (= c!104826 (and ((_ is Cons!21888) (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (= (_1!7874 (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124327 (isStrictlySorted!706 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))

(assert (=> d!124327 (= (removeStrictlySorted!55 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456820)))

(declare-fun b!1035127 () Bool)

(assert (=> b!1035127 (= e!585221 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))

(assert (= (and d!124327 c!104826) b!1035127))

(assert (= (and d!124327 (not c!104826)) b!1035126))

(assert (= (and b!1035126 c!104825) b!1035125))

(assert (= (and b!1035126 (not c!104825)) b!1035124))

(assert (= (and d!124327 res!691192) b!1035123))

(declare-fun m!955281 () Bool)

(assert (=> b!1035123 m!955281))

(declare-fun m!955283 () Bool)

(assert (=> b!1035125 m!955283))

(assert (=> b!1035125 m!955283))

(declare-fun m!955285 () Bool)

(assert (=> b!1035125 m!955285))

(declare-fun m!955287 () Bool)

(assert (=> d!124327 m!955287))

(declare-fun m!955289 () Bool)

(assert (=> d!124327 m!955289))

(assert (=> d!124285 d!124327))

(declare-fun d!124329 () Bool)

(assert (=> d!124329 (= (apply!915 lt!456716 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30243 () Bool)

(assert (= bs!30243 d!124329))

(declare-fun m!955291 () Bool)

(assert (=> bs!30243 m!955291))

(assert (=> bs!30243 m!955291))

(declare-fun m!955293 () Bool)

(assert (=> bs!30243 m!955293))

(assert (=> b!1034997 d!124329))

(declare-fun b!1035136 () Bool)

(declare-fun e!585230 () Bool)

(declare-fun call!43745 () Bool)

(assert (=> b!1035136 (= e!585230 call!43745)))

(declare-fun d!124331 () Bool)

(declare-fun res!691198 () Bool)

(declare-fun e!585229 () Bool)

(assert (=> d!124331 (=> res!691198 e!585229)))

(assert (=> d!124331 (= res!691198 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124331 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11444 lt!456630) (mask!30143 lt!456630)) e!585229)))

(declare-fun bm!43742 () Bool)

(assert (=> bm!43742 (= call!43745 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11444 lt!456630) (mask!30143 lt!456630)))))

(declare-fun b!1035137 () Bool)

(assert (=> b!1035137 (= e!585229 e!585230)))

(declare-fun c!104829 () Bool)

(assert (=> b!1035137 (= c!104829 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035138 () Bool)

(declare-fun e!585228 () Bool)

(assert (=> b!1035138 (= e!585228 call!43745)))

(declare-fun b!1035139 () Bool)

(assert (=> b!1035139 (= e!585230 e!585228)))

(declare-fun lt!456829 () (_ BitVec 64))

(assert (=> b!1035139 (= lt!456829 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(declare-fun lt!456828 () Unit!33837)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65163 (_ BitVec 64) (_ BitVec 32)) Unit!33837)

(assert (=> b!1035139 (= lt!456828 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1035139 (arrayContainsKey!0 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000)))

(declare-fun lt!456827 () Unit!33837)

(assert (=> b!1035139 (= lt!456827 lt!456828)))

(declare-fun res!691197 () Bool)

(declare-datatypes ((SeekEntryResult!9695 0))(
  ( (MissingZero!9695 (index!41151 (_ BitVec 32))) (Found!9695 (index!41152 (_ BitVec 32))) (Intermediate!9695 (undefined!10507 Bool) (index!41153 (_ BitVec 32)) (x!92204 (_ BitVec 32))) (Undefined!9695) (MissingVacant!9695 (index!41154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65163 (_ BitVec 32)) SeekEntryResult!9695)

(assert (=> b!1035139 (= res!691197 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (_keys!11444 lt!456630) (mask!30143 lt!456630)) (Found!9695 #b00000000000000000000000000000000)))))

(assert (=> b!1035139 (=> (not res!691197) (not e!585228))))

(assert (= (and d!124331 (not res!691198)) b!1035137))

(assert (= (and b!1035137 c!104829) b!1035139))

(assert (= (and b!1035137 (not c!104829)) b!1035136))

(assert (= (and b!1035139 res!691197) b!1035138))

(assert (= (or b!1035138 b!1035136) bm!43742))

(declare-fun m!955295 () Bool)

(assert (=> bm!43742 m!955295))

(declare-fun m!955297 () Bool)

(assert (=> b!1035137 m!955297))

(assert (=> b!1035137 m!955297))

(declare-fun m!955299 () Bool)

(assert (=> b!1035137 m!955299))

(assert (=> b!1035139 m!955297))

(declare-fun m!955301 () Bool)

(assert (=> b!1035139 m!955301))

(declare-fun m!955303 () Bool)

(assert (=> b!1035139 m!955303))

(assert (=> b!1035139 m!955297))

(declare-fun m!955305 () Bool)

(assert (=> b!1035139 m!955305))

(assert (=> b!1034950 d!124331))

(declare-fun d!124333 () Bool)

(assert (=> d!124333 (= (apply!915 lt!456742 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30244 () Bool)

(assert (= bs!30244 d!124333))

(assert (=> bs!30244 m!955035))

(declare-fun m!955307 () Bool)

(assert (=> bs!30244 m!955307))

(assert (=> bs!30244 m!955307))

(declare-fun m!955309 () Bool)

(assert (=> bs!30244 m!955309))

(assert (=> b!1035032 d!124333))

(declare-fun d!124335 () Bool)

(declare-fun c!104832 () Bool)

(assert (=> d!124335 (= c!104832 ((_ is ValueCellFull!11555) (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585233 () V!37563)

(assert (=> d!124335 (= (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!585233)))

(declare-fun b!1035144 () Bool)

(declare-fun get!16464 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1035144 (= e!585233 (get!16464 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035145 () Bool)

(declare-fun get!16465 (ValueCell!11555 V!37563) V!37563)

(assert (=> b!1035145 (= e!585233 (get!16465 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124335 c!104832) b!1035144))

(assert (= (and d!124335 (not c!104832)) b!1035145))

(assert (=> b!1035144 m!955039))

(assert (=> b!1035144 m!954937))

(declare-fun m!955311 () Bool)

(assert (=> b!1035144 m!955311))

(assert (=> b!1035145 m!955039))

(assert (=> b!1035145 m!954937))

(declare-fun m!955313 () Bool)

(assert (=> b!1035145 m!955313))

(assert (=> b!1035032 d!124335))

(declare-fun d!124337 () Bool)

(declare-fun e!585235 () Bool)

(assert (=> d!124337 e!585235))

(declare-fun res!691199 () Bool)

(assert (=> d!124337 (=> res!691199 e!585235)))

(declare-fun lt!456831 () Bool)

(assert (=> d!124337 (= res!691199 (not lt!456831))))

(declare-fun lt!456830 () Bool)

(assert (=> d!124337 (= lt!456831 lt!456830)))

(declare-fun lt!456833 () Unit!33837)

(declare-fun e!585234 () Unit!33837)

(assert (=> d!124337 (= lt!456833 e!585234)))

(declare-fun c!104833 () Bool)

(assert (=> d!124337 (= c!104833 lt!456830)))

(assert (=> d!124337 (= lt!456830 (containsKey!565 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124337 (= (contains!6037 lt!456716 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456831)))

(declare-fun b!1035146 () Bool)

(declare-fun lt!456832 () Unit!33837)

(assert (=> b!1035146 (= e!585234 lt!456832)))

(assert (=> b!1035146 (= lt!456832 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035146 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035147 () Bool)

(declare-fun Unit!33843 () Unit!33837)

(assert (=> b!1035147 (= e!585234 Unit!33843)))

(declare-fun b!1035148 () Bool)

(assert (=> b!1035148 (= e!585235 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124337 c!104833) b!1035146))

(assert (= (and d!124337 (not c!104833)) b!1035147))

(assert (= (and d!124337 (not res!691199)) b!1035148))

(declare-fun m!955315 () Bool)

(assert (=> d!124337 m!955315))

(declare-fun m!955317 () Bool)

(assert (=> b!1035146 m!955317))

(assert (=> b!1035146 m!955291))

(assert (=> b!1035146 m!955291))

(declare-fun m!955319 () Bool)

(assert (=> b!1035146 m!955319))

(assert (=> b!1035148 m!955291))

(assert (=> b!1035148 m!955291))

(assert (=> b!1035148 m!955319))

(assert (=> bm!43724 d!124337))

(declare-fun d!124339 () Bool)

(declare-fun e!585237 () Bool)

(assert (=> d!124339 e!585237))

(declare-fun res!691200 () Bool)

(assert (=> d!124339 (=> res!691200 e!585237)))

(declare-fun lt!456835 () Bool)

(assert (=> d!124339 (= res!691200 (not lt!456835))))

(declare-fun lt!456834 () Bool)

(assert (=> d!124339 (= lt!456835 lt!456834)))

(declare-fun lt!456837 () Unit!33837)

(declare-fun e!585236 () Unit!33837)

(assert (=> d!124339 (= lt!456837 e!585236)))

(declare-fun c!104834 () Bool)

(assert (=> d!124339 (= c!104834 lt!456834)))

(assert (=> d!124339 (= lt!456834 (containsKey!565 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124339 (= (contains!6037 lt!456716 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456835)))

(declare-fun b!1035149 () Bool)

(declare-fun lt!456836 () Unit!33837)

(assert (=> b!1035149 (= e!585236 lt!456836)))

(assert (=> b!1035149 (= lt!456836 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035149 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035150 () Bool)

(declare-fun Unit!33844 () Unit!33837)

(assert (=> b!1035150 (= e!585236 Unit!33844)))

(declare-fun b!1035151 () Bool)

(assert (=> b!1035151 (= e!585237 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124339 c!104834) b!1035149))

(assert (= (and d!124339 (not c!104834)) b!1035150))

(assert (= (and d!124339 (not res!691200)) b!1035151))

(declare-fun m!955321 () Bool)

(assert (=> d!124339 m!955321))

(declare-fun m!955323 () Bool)

(assert (=> b!1035149 m!955323))

(declare-fun m!955325 () Bool)

(assert (=> b!1035149 m!955325))

(assert (=> b!1035149 m!955325))

(declare-fun m!955327 () Bool)

(assert (=> b!1035149 m!955327))

(assert (=> b!1035151 m!955325))

(assert (=> b!1035151 m!955325))

(assert (=> b!1035151 m!955327))

(assert (=> bm!43723 d!124339))

(declare-fun b!1035160 () Bool)

(declare-fun e!585243 () (_ BitVec 32))

(declare-fun call!43748 () (_ BitVec 32))

(assert (=> b!1035160 (= e!585243 (bvadd #b00000000000000000000000000000001 call!43748))))

(declare-fun b!1035161 () Bool)

(declare-fun e!585242 () (_ BitVec 32))

(assert (=> b!1035161 (= e!585242 #b00000000000000000000000000000000)))

(declare-fun bm!43745 () Bool)

(assert (=> bm!43745 (= call!43748 (arrayCountValidKeys!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(declare-fun d!124341 () Bool)

(declare-fun lt!456840 () (_ BitVec 32))

(assert (=> d!124341 (and (bvsge lt!456840 #b00000000000000000000000000000000) (bvsle lt!456840 (bvsub (size!31892 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> d!124341 (= lt!456840 e!585242)))

(declare-fun c!104840 () Bool)

(assert (=> d!124341 (= c!104840 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124341 (and (bvsle #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31892 (_keys!11444 lt!456630)) (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124341 (= (arrayCountValidKeys!0 (_keys!11444 lt!456630) #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))) lt!456840)))

(declare-fun b!1035162 () Bool)

(assert (=> b!1035162 (= e!585243 call!43748)))

(declare-fun b!1035163 () Bool)

(assert (=> b!1035163 (= e!585242 e!585243)))

(declare-fun c!104839 () Bool)

(assert (=> b!1035163 (= c!104839 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (= (and d!124341 c!104840) b!1035161))

(assert (= (and d!124341 (not c!104840)) b!1035163))

(assert (= (and b!1035163 c!104839) b!1035160))

(assert (= (and b!1035163 (not c!104839)) b!1035162))

(assert (= (or b!1035160 b!1035162) bm!43745))

(declare-fun m!955329 () Bool)

(assert (=> bm!43745 m!955329))

(assert (=> b!1035163 m!955297))

(assert (=> b!1035163 m!955297))

(assert (=> b!1035163 m!955299))

(assert (=> b!1034949 d!124341))

(declare-fun d!124343 () Bool)

(declare-fun e!585245 () Bool)

(assert (=> d!124343 e!585245))

(declare-fun res!691201 () Bool)

(assert (=> d!124343 (=> res!691201 e!585245)))

(declare-fun lt!456842 () Bool)

(assert (=> d!124343 (= res!691201 (not lt!456842))))

(declare-fun lt!456841 () Bool)

(assert (=> d!124343 (= lt!456842 lt!456841)))

(declare-fun lt!456844 () Unit!33837)

(declare-fun e!585244 () Unit!33837)

(assert (=> d!124343 (= lt!456844 e!585244)))

(declare-fun c!104841 () Bool)

(assert (=> d!124343 (= c!104841 lt!456841)))

(assert (=> d!124343 (= lt!456841 (containsKey!565 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124343 (= (contains!6037 lt!456742 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!456842)))

(declare-fun b!1035164 () Bool)

(declare-fun lt!456843 () Unit!33837)

(assert (=> b!1035164 (= e!585244 lt!456843)))

(assert (=> b!1035164 (= lt!456843 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035164 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035165 () Bool)

(declare-fun Unit!33845 () Unit!33837)

(assert (=> b!1035165 (= e!585244 Unit!33845)))

(declare-fun b!1035166 () Bool)

(assert (=> b!1035166 (= e!585245 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124343 c!104841) b!1035164))

(assert (= (and d!124343 (not c!104841)) b!1035165))

(assert (= (and d!124343 (not res!691201)) b!1035166))

(assert (=> d!124343 m!955035))

(declare-fun m!955331 () Bool)

(assert (=> d!124343 m!955331))

(assert (=> b!1035164 m!955035))

(declare-fun m!955333 () Bool)

(assert (=> b!1035164 m!955333))

(assert (=> b!1035164 m!955035))

(assert (=> b!1035164 m!955307))

(assert (=> b!1035164 m!955307))

(declare-fun m!955335 () Bool)

(assert (=> b!1035164 m!955335))

(assert (=> b!1035166 m!955035))

(assert (=> b!1035166 m!955307))

(assert (=> b!1035166 m!955307))

(assert (=> b!1035166 m!955335))

(assert (=> b!1035015 d!124343))

(declare-fun d!124345 () Bool)

(declare-fun e!585247 () Bool)

(assert (=> d!124345 e!585247))

(declare-fun res!691202 () Bool)

(assert (=> d!124345 (=> res!691202 e!585247)))

(declare-fun lt!456846 () Bool)

(assert (=> d!124345 (= res!691202 (not lt!456846))))

(declare-fun lt!456845 () Bool)

(assert (=> d!124345 (= lt!456846 lt!456845)))

(declare-fun lt!456848 () Unit!33837)

(declare-fun e!585246 () Unit!33837)

(assert (=> d!124345 (= lt!456848 e!585246)))

(declare-fun c!104842 () Bool)

(assert (=> d!124345 (= c!104842 lt!456845)))

(assert (=> d!124345 (= lt!456845 (containsKey!565 (toList!6896 lt!456652) key!909))))

(assert (=> d!124345 (= (contains!6037 lt!456652 key!909) lt!456846)))

(declare-fun b!1035167 () Bool)

(declare-fun lt!456847 () Unit!33837)

(assert (=> b!1035167 (= e!585246 lt!456847)))

(assert (=> b!1035167 (= lt!456847 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456652) key!909))))

(assert (=> b!1035167 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456652) key!909))))

(declare-fun b!1035168 () Bool)

(declare-fun Unit!33846 () Unit!33837)

(assert (=> b!1035168 (= e!585246 Unit!33846)))

(declare-fun b!1035169 () Bool)

(assert (=> b!1035169 (= e!585247 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456652) key!909)))))

(assert (= (and d!124345 c!104842) b!1035167))

(assert (= (and d!124345 (not c!104842)) b!1035168))

(assert (= (and d!124345 (not res!691202)) b!1035169))

(declare-fun m!955337 () Bool)

(assert (=> d!124345 m!955337))

(declare-fun m!955339 () Bool)

(assert (=> b!1035167 m!955339))

(declare-fun m!955341 () Bool)

(assert (=> b!1035167 m!955341))

(assert (=> b!1035167 m!955341))

(declare-fun m!955343 () Bool)

(assert (=> b!1035167 m!955343))

(assert (=> b!1035169 m!955341))

(assert (=> b!1035169 m!955341))

(assert (=> b!1035169 m!955343))

(assert (=> d!124275 d!124345))

(declare-fun b!1035170 () Bool)

(declare-fun e!585248 () Bool)

(declare-fun lt!456849 () List!21892)

(assert (=> b!1035170 (= e!585248 (not (containsKey!565 lt!456849 key!909)))))

(declare-fun b!1035171 () Bool)

(declare-fun e!585249 () List!21892)

(assert (=> b!1035171 (= e!585249 Nil!21889)))

(declare-fun b!1035172 () Bool)

(assert (=> b!1035172 (= e!585249 ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (toList!6896 (map!14685 thiss!1427))) key!909) (h!23099 (toList!6896 (map!14685 thiss!1427)))))))

(declare-fun b!1035173 () Bool)

(declare-fun e!585250 () List!21892)

(assert (=> b!1035173 (= e!585250 e!585249)))

(declare-fun c!104843 () Bool)

(assert (=> b!1035173 (= c!104843 (and ((_ is Cons!21888) (toList!6896 (map!14685 thiss!1427))) (not (= (_1!7874 (h!23099 (toList!6896 (map!14685 thiss!1427)))) key!909))))))

(declare-fun d!124347 () Bool)

(assert (=> d!124347 e!585248))

(declare-fun res!691203 () Bool)

(assert (=> d!124347 (=> (not res!691203) (not e!585248))))

(assert (=> d!124347 (= res!691203 (isStrictlySorted!706 lt!456849))))

(assert (=> d!124347 (= lt!456849 e!585250)))

(declare-fun c!104844 () Bool)

(assert (=> d!124347 (= c!104844 (and ((_ is Cons!21888) (toList!6896 (map!14685 thiss!1427))) (= (_1!7874 (h!23099 (toList!6896 (map!14685 thiss!1427)))) key!909)))))

(assert (=> d!124347 (isStrictlySorted!706 (toList!6896 (map!14685 thiss!1427)))))

(assert (=> d!124347 (= (removeStrictlySorted!55 (toList!6896 (map!14685 thiss!1427)) key!909) lt!456849)))

(declare-fun b!1035174 () Bool)

(assert (=> b!1035174 (= e!585250 (t!31080 (toList!6896 (map!14685 thiss!1427))))))

(assert (= (and d!124347 c!104844) b!1035174))

(assert (= (and d!124347 (not c!104844)) b!1035173))

(assert (= (and b!1035173 c!104843) b!1035172))

(assert (= (and b!1035173 (not c!104843)) b!1035171))

(assert (= (and d!124347 res!691203) b!1035170))

(declare-fun m!955345 () Bool)

(assert (=> b!1035170 m!955345))

(declare-fun m!955347 () Bool)

(assert (=> b!1035172 m!955347))

(assert (=> b!1035172 m!955347))

(declare-fun m!955349 () Bool)

(assert (=> b!1035172 m!955349))

(declare-fun m!955351 () Bool)

(assert (=> d!124347 m!955351))

(declare-fun m!955353 () Bool)

(assert (=> d!124347 m!955353))

(assert (=> d!124275 d!124347))

(declare-fun d!124349 () Bool)

(assert (=> d!124349 (= (-!519 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))

(assert (=> d!124349 true))

(declare-fun _$11!31 () Unit!33837)

(assert (=> d!124349 (= (choose!1700 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6062 thiss!1427) lt!456631 (minValue!6062 thiss!1427) (defaultEntry!6226 thiss!1427)) _$11!31)))

(declare-fun bs!30245 () Bool)

(assert (= bs!30245 d!124349))

(assert (=> bs!30245 m!954939))

(assert (=> bs!30245 m!954939))

(assert (=> bs!30245 m!954941))

(assert (=> bs!30245 m!954935))

(assert (=> d!124283 d!124349))

(declare-fun d!124351 () Bool)

(assert (=> d!124351 (= (validMask!0 (mask!30143 thiss!1427)) (and (or (= (mask!30143 thiss!1427) #b00000000000000000000000000000111) (= (mask!30143 thiss!1427) #b00000000000000000000000000001111) (= (mask!30143 thiss!1427) #b00000000000000000000000000011111) (= (mask!30143 thiss!1427) #b00000000000000000000000000111111) (= (mask!30143 thiss!1427) #b00000000000000000000000001111111) (= (mask!30143 thiss!1427) #b00000000000000000000000011111111) (= (mask!30143 thiss!1427) #b00000000000000000000000111111111) (= (mask!30143 thiss!1427) #b00000000000000000000001111111111) (= (mask!30143 thiss!1427) #b00000000000000000000011111111111) (= (mask!30143 thiss!1427) #b00000000000000000000111111111111) (= (mask!30143 thiss!1427) #b00000000000000000001111111111111) (= (mask!30143 thiss!1427) #b00000000000000000011111111111111) (= (mask!30143 thiss!1427) #b00000000000000000111111111111111) (= (mask!30143 thiss!1427) #b00000000000000001111111111111111) (= (mask!30143 thiss!1427) #b00000000000000011111111111111111) (= (mask!30143 thiss!1427) #b00000000000000111111111111111111) (= (mask!30143 thiss!1427) #b00000000000001111111111111111111) (= (mask!30143 thiss!1427) #b00000000000011111111111111111111) (= (mask!30143 thiss!1427) #b00000000000111111111111111111111) (= (mask!30143 thiss!1427) #b00000000001111111111111111111111) (= (mask!30143 thiss!1427) #b00000000011111111111111111111111) (= (mask!30143 thiss!1427) #b00000000111111111111111111111111) (= (mask!30143 thiss!1427) #b00000001111111111111111111111111) (= (mask!30143 thiss!1427) #b00000011111111111111111111111111) (= (mask!30143 thiss!1427) #b00000111111111111111111111111111) (= (mask!30143 thiss!1427) #b00001111111111111111111111111111) (= (mask!30143 thiss!1427) #b00011111111111111111111111111111) (= (mask!30143 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30143 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!124283 d!124351))

(assert (=> d!124283 d!124281))

(assert (=> d!124283 d!124285))

(assert (=> d!124283 d!124287))

(declare-fun d!124353 () Bool)

(declare-fun e!585251 () Bool)

(assert (=> d!124353 e!585251))

(declare-fun res!691204 () Bool)

(assert (=> d!124353 (=> (not res!691204) (not e!585251))))

(declare-fun lt!456851 () ListLongMap!13761)

(assert (=> d!124353 (= res!691204 (contains!6037 lt!456851 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!456853 () List!21892)

(assert (=> d!124353 (= lt!456851 (ListLongMap!13762 lt!456853))))

(declare-fun lt!456852 () Unit!33837)

(declare-fun lt!456850 () Unit!33837)

(assert (=> d!124353 (= lt!456852 lt!456850)))

(assert (=> d!124353 (= (getValueByKey!584 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124353 (= lt!456850 (lemmaContainsTupThenGetReturnValue!280 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124353 (= lt!456853 (insertStrictlySorted!373 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124353 (= (+!3126 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456851)))

(declare-fun b!1035175 () Bool)

(declare-fun res!691205 () Bool)

(assert (=> b!1035175 (=> (not res!691205) (not e!585251))))

(assert (=> b!1035175 (= res!691205 (= (getValueByKey!584 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035176 () Bool)

(assert (=> b!1035176 (= e!585251 (contains!6038 (toList!6896 lt!456851) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!124353 res!691204) b!1035175))

(assert (= (and b!1035175 res!691205) b!1035176))

(declare-fun m!955355 () Bool)

(assert (=> d!124353 m!955355))

(declare-fun m!955357 () Bool)

(assert (=> d!124353 m!955357))

(declare-fun m!955359 () Bool)

(assert (=> d!124353 m!955359))

(declare-fun m!955361 () Bool)

(assert (=> d!124353 m!955361))

(declare-fun m!955363 () Bool)

(assert (=> b!1035175 m!955363))

(declare-fun m!955365 () Bool)

(assert (=> b!1035176 m!955365))

(assert (=> bm!43728 d!124353))

(declare-fun b!1035187 () Bool)

(declare-fun e!585263 () Bool)

(declare-fun contains!6039 (List!21893 (_ BitVec 64)) Bool)

(assert (=> b!1035187 (= e!585263 (contains!6039 Nil!21890 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035188 () Bool)

(declare-fun e!585261 () Bool)

(declare-fun call!43751 () Bool)

(assert (=> b!1035188 (= e!585261 call!43751)))

(declare-fun b!1035189 () Bool)

(declare-fun e!585260 () Bool)

(assert (=> b!1035189 (= e!585260 e!585261)))

(declare-fun c!104847 () Bool)

(assert (=> b!1035189 (= c!104847 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124355 () Bool)

(declare-fun res!691213 () Bool)

(declare-fun e!585262 () Bool)

(assert (=> d!124355 (=> res!691213 e!585262)))

(assert (=> d!124355 (= res!691213 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124355 (= (arrayNoDuplicates!0 (_keys!11444 thiss!1427) #b00000000000000000000000000000000 Nil!21890) e!585262)))

(declare-fun bm!43748 () Bool)

(assert (=> bm!43748 (= call!43751 (arrayNoDuplicates!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104847 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)))))

(declare-fun b!1035190 () Bool)

(assert (=> b!1035190 (= e!585262 e!585260)))

(declare-fun res!691212 () Bool)

(assert (=> b!1035190 (=> (not res!691212) (not e!585260))))

(assert (=> b!1035190 (= res!691212 (not e!585263))))

(declare-fun res!691214 () Bool)

(assert (=> b!1035190 (=> (not res!691214) (not e!585263))))

(assert (=> b!1035190 (= res!691214 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035191 () Bool)

(assert (=> b!1035191 (= e!585261 call!43751)))

(assert (= (and d!124355 (not res!691213)) b!1035190))

(assert (= (and b!1035190 res!691214) b!1035187))

(assert (= (and b!1035190 res!691212) b!1035189))

(assert (= (and b!1035189 c!104847) b!1035191))

(assert (= (and b!1035189 (not c!104847)) b!1035188))

(assert (= (or b!1035191 b!1035188) bm!43748))

(assert (=> b!1035187 m!955035))

(assert (=> b!1035187 m!955035))

(declare-fun m!955367 () Bool)

(assert (=> b!1035187 m!955367))

(assert (=> b!1035189 m!955035))

(assert (=> b!1035189 m!955035))

(assert (=> b!1035189 m!955037))

(assert (=> bm!43748 m!955035))

(declare-fun m!955369 () Bool)

(assert (=> bm!43748 m!955369))

(assert (=> b!1035190 m!955035))

(assert (=> b!1035190 m!955035))

(assert (=> b!1035190 m!955037))

(assert (=> b!1034948 d!124355))

(assert (=> d!124277 d!124287))

(declare-fun b!1035192 () Bool)

(declare-fun e!585266 () Bool)

(declare-fun call!43752 () Bool)

(assert (=> b!1035192 (= e!585266 call!43752)))

(declare-fun d!124357 () Bool)

(declare-fun res!691216 () Bool)

(declare-fun e!585265 () Bool)

(assert (=> d!124357 (=> res!691216 e!585265)))

(assert (=> d!124357 (= res!691216 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11444 thiss!1427) (mask!30143 thiss!1427)) e!585265)))

(declare-fun bm!43749 () Bool)

(assert (=> bm!43749 (= call!43752 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)))))

(declare-fun b!1035193 () Bool)

(assert (=> b!1035193 (= e!585265 e!585266)))

(declare-fun c!104848 () Bool)

(assert (=> b!1035193 (= c!104848 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035194 () Bool)

(declare-fun e!585264 () Bool)

(assert (=> b!1035194 (= e!585264 call!43752)))

(declare-fun b!1035195 () Bool)

(assert (=> b!1035195 (= e!585266 e!585264)))

(declare-fun lt!456856 () (_ BitVec 64))

(assert (=> b!1035195 (= lt!456856 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456855 () Unit!33837)

(assert (=> b!1035195 (= lt!456855 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000))))

(assert (=> b!1035195 (arrayContainsKey!0 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000)))

(declare-fun lt!456854 () Unit!33837)

(assert (=> b!1035195 (= lt!456854 lt!456855)))

(declare-fun res!691215 () Bool)

(assert (=> b!1035195 (= res!691215 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)) (Found!9695 #b00000000000000000000000000000000)))))

(assert (=> b!1035195 (=> (not res!691215) (not e!585264))))

(assert (= (and d!124357 (not res!691216)) b!1035193))

(assert (= (and b!1035193 c!104848) b!1035195))

(assert (= (and b!1035193 (not c!104848)) b!1035192))

(assert (= (and b!1035195 res!691215) b!1035194))

(assert (= (or b!1035194 b!1035192) bm!43749))

(declare-fun m!955371 () Bool)

(assert (=> bm!43749 m!955371))

(assert (=> b!1035193 m!955035))

(assert (=> b!1035193 m!955035))

(assert (=> b!1035193 m!955037))

(assert (=> b!1035195 m!955035))

(declare-fun m!955373 () Bool)

(assert (=> b!1035195 m!955373))

(declare-fun m!955375 () Bool)

(assert (=> b!1035195 m!955375))

(assert (=> b!1035195 m!955035))

(declare-fun m!955377 () Bool)

(assert (=> b!1035195 m!955377))

(assert (=> b!1034947 d!124357))

(declare-fun b!1035196 () Bool)

(declare-fun e!585279 () Bool)

(declare-fun e!585274 () Bool)

(assert (=> b!1035196 (= e!585279 e!585274)))

(declare-fun res!691223 () Bool)

(assert (=> b!1035196 (=> (not res!691223) (not e!585274))))

(declare-fun lt!456876 () ListLongMap!13761)

(assert (=> b!1035196 (= res!691223 (contains!6037 lt!456876 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> b!1035196 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun b!1035197 () Bool)

(declare-fun e!585275 () ListLongMap!13761)

(declare-fun e!585271 () ListLongMap!13761)

(assert (=> b!1035197 (= e!585275 e!585271)))

(declare-fun c!104854 () Bool)

(assert (=> b!1035197 (= c!104854 (and (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035198 () Bool)

(declare-fun e!585273 () ListLongMap!13761)

(declare-fun call!43758 () ListLongMap!13761)

(assert (=> b!1035198 (= e!585273 call!43758)))

(declare-fun b!1035199 () Bool)

(declare-fun e!585276 () Bool)

(assert (=> b!1035199 (= e!585276 (= (apply!915 lt!456876 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6062 lt!456630)))))

(declare-fun b!1035200 () Bool)

(declare-fun e!585269 () Bool)

(assert (=> b!1035200 (= e!585269 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035201 () Bool)

(declare-fun e!585277 () Bool)

(assert (=> b!1035201 (= e!585277 e!585276)))

(declare-fun res!691225 () Bool)

(declare-fun call!43755 () Bool)

(assert (=> b!1035201 (= res!691225 call!43755)))

(assert (=> b!1035201 (=> (not res!691225) (not e!585276))))

(declare-fun bm!43750 () Bool)

(declare-fun call!43756 () Bool)

(assert (=> bm!43750 (= call!43756 (contains!6037 lt!456876 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!43751 () Bool)

(assert (=> bm!43751 (= call!43755 (contains!6037 lt!456876 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035202 () Bool)

(assert (=> b!1035202 (= e!585277 (not call!43755))))

(declare-fun b!1035203 () Bool)

(declare-fun call!43757 () ListLongMap!13761)

(assert (=> b!1035203 (= e!585273 call!43757)))

(declare-fun b!1035204 () Bool)

(declare-fun e!585270 () Bool)

(declare-fun e!585267 () Bool)

(assert (=> b!1035204 (= e!585270 e!585267)))

(declare-fun res!691219 () Bool)

(assert (=> b!1035204 (= res!691219 call!43756)))

(assert (=> b!1035204 (=> (not res!691219) (not e!585267))))

(declare-fun d!124359 () Bool)

(declare-fun e!585268 () Bool)

(assert (=> d!124359 e!585268))

(declare-fun res!691220 () Bool)

(assert (=> d!124359 (=> (not res!691220) (not e!585268))))

(assert (=> d!124359 (= res!691220 (or (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))))

(declare-fun lt!456866 () ListLongMap!13761)

(assert (=> d!124359 (= lt!456876 lt!456866)))

(declare-fun lt!456862 () Unit!33837)

(declare-fun e!585272 () Unit!33837)

(assert (=> d!124359 (= lt!456862 e!585272)))

(declare-fun c!104852 () Bool)

(declare-fun e!585278 () Bool)

(assert (=> d!124359 (= c!104852 e!585278)))

(declare-fun res!691224 () Bool)

(assert (=> d!124359 (=> (not res!691224) (not e!585278))))

(assert (=> d!124359 (= res!691224 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124359 (= lt!456866 e!585275)))

(declare-fun c!104849 () Bool)

(assert (=> d!124359 (= c!104849 (and (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!124359 (validMask!0 (mask!30143 lt!456630))))

(assert (=> d!124359 (= (getCurrentListMap!3942 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)) lt!456876)))

(declare-fun bm!43752 () Bool)

(declare-fun call!43754 () ListLongMap!13761)

(assert (=> bm!43752 (= call!43757 call!43754)))

(declare-fun b!1035205 () Bool)

(assert (=> b!1035205 (= e!585268 e!585270)))

(declare-fun c!104851 () Bool)

(assert (=> b!1035205 (= c!104851 (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035206 () Bool)

(assert (=> b!1035206 (= e!585267 (= (apply!915 lt!456876 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6062 lt!456630)))))

(declare-fun b!1035207 () Bool)

(assert (=> b!1035207 (= e!585270 (not call!43756))))

(declare-fun bm!43753 () Bool)

(declare-fun call!43753 () ListLongMap!13761)

(declare-fun call!43759 () ListLongMap!13761)

(assert (=> bm!43753 (= call!43753 call!43759)))

(declare-fun b!1035208 () Bool)

(assert (=> b!1035208 (= e!585278 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035209 () Bool)

(assert (=> b!1035209 (= e!585275 (+!3126 call!43754 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))

(declare-fun bm!43754 () Bool)

(assert (=> bm!43754 (= call!43759 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun b!1035210 () Bool)

(declare-fun res!691218 () Bool)

(assert (=> b!1035210 (=> (not res!691218) (not e!585268))))

(assert (=> b!1035210 (= res!691218 e!585277)))

(declare-fun c!104853 () Bool)

(assert (=> b!1035210 (= c!104853 (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!43755 () Bool)

(assert (=> bm!43755 (= call!43754 (+!3126 (ite c!104849 call!43759 (ite c!104854 call!43753 call!43758)) (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(declare-fun b!1035211 () Bool)

(declare-fun Unit!33847 () Unit!33837)

(assert (=> b!1035211 (= e!585272 Unit!33847)))

(declare-fun b!1035212 () Bool)

(declare-fun c!104850 () Bool)

(assert (=> b!1035212 (= c!104850 (and (not (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1035212 (= e!585271 e!585273)))

(declare-fun b!1035213 () Bool)

(assert (=> b!1035213 (= e!585274 (= (apply!915 lt!456876 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 lt!456630))))))

(assert (=> b!1035213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun b!1035214 () Bool)

(assert (=> b!1035214 (= e!585271 call!43757)))

(declare-fun b!1035215 () Bool)

(declare-fun res!691222 () Bool)

(assert (=> b!1035215 (=> (not res!691222) (not e!585268))))

(assert (=> b!1035215 (= res!691222 e!585279)))

(declare-fun res!691221 () Bool)

(assert (=> b!1035215 (=> res!691221 e!585279)))

(assert (=> b!1035215 (= res!691221 (not e!585269))))

(declare-fun res!691217 () Bool)

(assert (=> b!1035215 (=> (not res!691217) (not e!585269))))

(assert (=> b!1035215 (= res!691217 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun b!1035216 () Bool)

(declare-fun lt!456871 () Unit!33837)

(assert (=> b!1035216 (= e!585272 lt!456871)))

(declare-fun lt!456860 () ListLongMap!13761)

(assert (=> b!1035216 (= lt!456860 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun lt!456877 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456877 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456863 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456863 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(declare-fun lt!456867 () Unit!33837)

(assert (=> b!1035216 (= lt!456867 (addStillContains!625 lt!456860 lt!456877 (zeroValue!6062 lt!456630) lt!456863))))

(assert (=> b!1035216 (contains!6037 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) lt!456863)))

(declare-fun lt!456878 () Unit!33837)

(assert (=> b!1035216 (= lt!456878 lt!456867)))

(declare-fun lt!456868 () ListLongMap!13761)

(assert (=> b!1035216 (= lt!456868 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun lt!456869 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456869 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456870 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456870 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(declare-fun lt!456874 () Unit!33837)

(assert (=> b!1035216 (= lt!456874 (addApplyDifferent!481 lt!456868 lt!456869 (minValue!6062 lt!456630) lt!456870))))

(assert (=> b!1035216 (= (apply!915 (+!3126 lt!456868 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) lt!456870) (apply!915 lt!456868 lt!456870))))

(declare-fun lt!456872 () Unit!33837)

(assert (=> b!1035216 (= lt!456872 lt!456874)))

(declare-fun lt!456864 () ListLongMap!13761)

(assert (=> b!1035216 (= lt!456864 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun lt!456861 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456861 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456858 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456858 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(declare-fun lt!456857 () Unit!33837)

(assert (=> b!1035216 (= lt!456857 (addApplyDifferent!481 lt!456864 lt!456861 (zeroValue!6062 lt!456630) lt!456858))))

(assert (=> b!1035216 (= (apply!915 (+!3126 lt!456864 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) lt!456858) (apply!915 lt!456864 lt!456858))))

(declare-fun lt!456873 () Unit!33837)

(assert (=> b!1035216 (= lt!456873 lt!456857)))

(declare-fun lt!456859 () ListLongMap!13761)

(assert (=> b!1035216 (= lt!456859 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)))))

(declare-fun lt!456875 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456865 () (_ BitVec 64))

(assert (=> b!1035216 (= lt!456865 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(assert (=> b!1035216 (= lt!456871 (addApplyDifferent!481 lt!456859 lt!456875 (minValue!6062 lt!456630) lt!456865))))

(assert (=> b!1035216 (= (apply!915 (+!3126 lt!456859 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) lt!456865) (apply!915 lt!456859 lt!456865))))

(declare-fun bm!43756 () Bool)

(assert (=> bm!43756 (= call!43758 call!43753)))

(assert (= (and d!124359 c!104849) b!1035209))

(assert (= (and d!124359 (not c!104849)) b!1035197))

(assert (= (and b!1035197 c!104854) b!1035214))

(assert (= (and b!1035197 (not c!104854)) b!1035212))

(assert (= (and b!1035212 c!104850) b!1035203))

(assert (= (and b!1035212 (not c!104850)) b!1035198))

(assert (= (or b!1035203 b!1035198) bm!43756))

(assert (= (or b!1035214 bm!43756) bm!43753))

(assert (= (or b!1035214 b!1035203) bm!43752))

(assert (= (or b!1035209 bm!43753) bm!43754))

(assert (= (or b!1035209 bm!43752) bm!43755))

(assert (= (and d!124359 res!691224) b!1035208))

(assert (= (and d!124359 c!104852) b!1035216))

(assert (= (and d!124359 (not c!104852)) b!1035211))

(assert (= (and d!124359 res!691220) b!1035215))

(assert (= (and b!1035215 res!691217) b!1035200))

(assert (= (and b!1035215 (not res!691221)) b!1035196))

(assert (= (and b!1035196 res!691223) b!1035213))

(assert (= (and b!1035215 res!691222) b!1035210))

(assert (= (and b!1035210 c!104853) b!1035201))

(assert (= (and b!1035210 (not c!104853)) b!1035202))

(assert (= (and b!1035201 res!691225) b!1035199))

(assert (= (or b!1035201 b!1035202) bm!43751))

(assert (= (and b!1035210 res!691218) b!1035205))

(assert (= (and b!1035205 c!104851) b!1035204))

(assert (= (and b!1035205 (not c!104851)) b!1035207))

(assert (= (and b!1035204 res!691219) b!1035206))

(assert (= (or b!1035204 b!1035207) bm!43750))

(declare-fun b_lambda!16075 () Bool)

(assert (=> (not b_lambda!16075) (not b!1035213)))

(declare-fun tb!7017 () Bool)

(declare-fun t!31087 () Bool)

(assert (=> (and b!1034889 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 lt!456630)) t!31087) tb!7017))

(declare-fun result!14389 () Bool)

(assert (=> tb!7017 (= result!14389 tp_is_empty!24517)))

(assert (=> b!1035213 t!31087))

(declare-fun b_and!33295 () Bool)

(assert (= b_and!33293 (and (=> t!31087 result!14389) b_and!33295)))

(declare-fun m!955379 () Bool)

(assert (=> bm!43755 m!955379))

(declare-fun m!955381 () Bool)

(assert (=> bm!43750 m!955381))

(assert (=> b!1035200 m!955297))

(assert (=> b!1035200 m!955297))

(assert (=> b!1035200 m!955299))

(declare-fun m!955383 () Bool)

(assert (=> b!1035213 m!955383))

(declare-fun m!955385 () Bool)

(assert (=> b!1035213 m!955385))

(declare-fun m!955387 () Bool)

(assert (=> b!1035213 m!955387))

(assert (=> b!1035213 m!955383))

(assert (=> b!1035213 m!955297))

(declare-fun m!955389 () Bool)

(assert (=> b!1035213 m!955389))

(assert (=> b!1035213 m!955385))

(assert (=> b!1035213 m!955297))

(declare-fun m!955391 () Bool)

(assert (=> bm!43754 m!955391))

(declare-fun m!955393 () Bool)

(assert (=> d!124359 m!955393))

(declare-fun m!955395 () Bool)

(assert (=> b!1035209 m!955395))

(declare-fun m!955397 () Bool)

(assert (=> b!1035206 m!955397))

(declare-fun m!955399 () Bool)

(assert (=> bm!43751 m!955399))

(declare-fun m!955401 () Bool)

(assert (=> b!1035199 m!955401))

(assert (=> b!1035208 m!955297))

(assert (=> b!1035208 m!955297))

(assert (=> b!1035208 m!955299))

(assert (=> b!1035196 m!955297))

(assert (=> b!1035196 m!955297))

(declare-fun m!955403 () Bool)

(assert (=> b!1035196 m!955403))

(declare-fun m!955405 () Bool)

(assert (=> b!1035216 m!955405))

(declare-fun m!955407 () Bool)

(assert (=> b!1035216 m!955407))

(declare-fun m!955409 () Bool)

(assert (=> b!1035216 m!955409))

(declare-fun m!955411 () Bool)

(assert (=> b!1035216 m!955411))

(declare-fun m!955413 () Bool)

(assert (=> b!1035216 m!955413))

(declare-fun m!955415 () Bool)

(assert (=> b!1035216 m!955415))

(assert (=> b!1035216 m!955409))

(declare-fun m!955417 () Bool)

(assert (=> b!1035216 m!955417))

(assert (=> b!1035216 m!955405))

(declare-fun m!955419 () Bool)

(assert (=> b!1035216 m!955419))

(declare-fun m!955421 () Bool)

(assert (=> b!1035216 m!955421))

(declare-fun m!955423 () Bool)

(assert (=> b!1035216 m!955423))

(assert (=> b!1035216 m!955421))

(declare-fun m!955425 () Bool)

(assert (=> b!1035216 m!955425))

(declare-fun m!955427 () Bool)

(assert (=> b!1035216 m!955427))

(declare-fun m!955429 () Bool)

(assert (=> b!1035216 m!955429))

(declare-fun m!955431 () Bool)

(assert (=> b!1035216 m!955431))

(assert (=> b!1035216 m!955297))

(assert (=> b!1035216 m!955427))

(assert (=> b!1035216 m!955391))

(declare-fun m!955433 () Bool)

(assert (=> b!1035216 m!955433))

(assert (=> d!124273 d!124359))

(declare-fun b!1035217 () Bool)

(declare-fun res!691228 () Bool)

(declare-fun e!585286 () Bool)

(assert (=> b!1035217 (=> (not res!691228) (not e!585286))))

(declare-fun lt!456884 () ListLongMap!13761)

(assert (=> b!1035217 (= res!691228 (not (contains!6037 lt!456884 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035218 () Bool)

(declare-fun e!585283 () Bool)

(assert (=> b!1035218 (= e!585283 (isEmpty!930 lt!456884))))

(declare-fun b!1035219 () Bool)

(assert (=> b!1035219 (= e!585283 (= lt!456884 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1035221 () Bool)

(declare-fun lt!456882 () Unit!33837)

(declare-fun lt!456880 () Unit!33837)

(assert (=> b!1035221 (= lt!456882 lt!456880)))

(declare-fun lt!456885 () ListLongMap!13761)

(declare-fun lt!456883 () V!37563)

(declare-fun lt!456881 () (_ BitVec 64))

(declare-fun lt!456879 () (_ BitVec 64))

(assert (=> b!1035221 (not (contains!6037 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883)) lt!456881))))

(assert (=> b!1035221 (= lt!456880 (addStillNotContains!244 lt!456885 lt!456879 lt!456883 lt!456881))))

(assert (=> b!1035221 (= lt!456881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035221 (= lt!456883 (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035221 (= lt!456879 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun call!43760 () ListLongMap!13761)

(assert (=> b!1035221 (= lt!456885 call!43760)))

(declare-fun e!585284 () ListLongMap!13761)

(assert (=> b!1035221 (= e!585284 (+!3126 call!43760 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035222 () Bool)

(assert (=> b!1035222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> b!1035222 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 thiss!1427))))))

(declare-fun e!585280 () Bool)

(assert (=> b!1035222 (= e!585280 (= (apply!915 lt!456884 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035223 () Bool)

(declare-fun e!585281 () Bool)

(assert (=> b!1035223 (= e!585281 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035223 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1035224 () Bool)

(declare-fun e!585285 () ListLongMap!13761)

(assert (=> b!1035224 (= e!585285 (ListLongMap!13762 Nil!21889))))

(declare-fun b!1035225 () Bool)

(declare-fun e!585282 () Bool)

(assert (=> b!1035225 (= e!585286 e!585282)))

(declare-fun c!104856 () Bool)

(assert (=> b!1035225 (= c!104856 e!585281)))

(declare-fun res!691227 () Bool)

(assert (=> b!1035225 (=> (not res!691227) (not e!585281))))

(assert (=> b!1035225 (= res!691227 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035226 () Bool)

(assert (=> b!1035226 (= e!585284 call!43760)))

(declare-fun b!1035227 () Bool)

(assert (=> b!1035227 (= e!585282 e!585280)))

(assert (=> b!1035227 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun res!691229 () Bool)

(assert (=> b!1035227 (= res!691229 (contains!6037 lt!456884 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035227 (=> (not res!691229) (not e!585280))))

(declare-fun b!1035220 () Bool)

(assert (=> b!1035220 (= e!585285 e!585284)))

(declare-fun c!104858 () Bool)

(assert (=> b!1035220 (= c!104858 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124361 () Bool)

(assert (=> d!124361 e!585286))

(declare-fun res!691226 () Bool)

(assert (=> d!124361 (=> (not res!691226) (not e!585286))))

(assert (=> d!124361 (= res!691226 (not (contains!6037 lt!456884 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124361 (= lt!456884 e!585285)))

(declare-fun c!104857 () Bool)

(assert (=> d!124361 (= c!104857 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124361 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124361 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)) lt!456884)))

(declare-fun b!1035228 () Bool)

(assert (=> b!1035228 (= e!585282 e!585283)))

(declare-fun c!104855 () Bool)

(assert (=> b!1035228 (= c!104855 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun bm!43757 () Bool)

(assert (=> bm!43757 (= call!43760 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(assert (= (and d!124361 c!104857) b!1035224))

(assert (= (and d!124361 (not c!104857)) b!1035220))

(assert (= (and b!1035220 c!104858) b!1035221))

(assert (= (and b!1035220 (not c!104858)) b!1035226))

(assert (= (or b!1035221 b!1035226) bm!43757))

(assert (= (and d!124361 res!691226) b!1035217))

(assert (= (and b!1035217 res!691228) b!1035225))

(assert (= (and b!1035225 res!691227) b!1035223))

(assert (= (and b!1035225 c!104856) b!1035227))

(assert (= (and b!1035225 (not c!104856)) b!1035228))

(assert (= (and b!1035227 res!691229) b!1035222))

(assert (= (and b!1035228 c!104855) b!1035219))

(assert (= (and b!1035228 (not c!104855)) b!1035218))

(declare-fun b_lambda!16077 () Bool)

(assert (=> (not b_lambda!16077) (not b!1035221)))

(assert (=> b!1035221 t!31079))

(declare-fun b_and!33297 () Bool)

(assert (= b_and!33295 (and (=> t!31079 result!14375) b_and!33297)))

(declare-fun b_lambda!16079 () Bool)

(assert (=> (not b_lambda!16079) (not b!1035222)))

(assert (=> b!1035222 t!31079))

(declare-fun b_and!33299 () Bool)

(assert (= b_and!33297 (and (=> t!31079 result!14375) b_and!33299)))

(assert (=> b!1035222 m!955035))

(declare-fun m!955435 () Bool)

(assert (=> b!1035222 m!955435))

(assert (=> b!1035222 m!955039))

(assert (=> b!1035222 m!954937))

(assert (=> b!1035222 m!955041))

(assert (=> b!1035222 m!954937))

(assert (=> b!1035222 m!955039))

(assert (=> b!1035222 m!955035))

(declare-fun m!955437 () Bool)

(assert (=> b!1035221 m!955437))

(declare-fun m!955439 () Bool)

(assert (=> b!1035221 m!955439))

(declare-fun m!955441 () Bool)

(assert (=> b!1035221 m!955441))

(assert (=> b!1035221 m!955039))

(assert (=> b!1035221 m!954937))

(assert (=> b!1035221 m!955041))

(assert (=> b!1035221 m!954937))

(assert (=> b!1035221 m!955039))

(assert (=> b!1035221 m!955437))

(declare-fun m!955443 () Bool)

(assert (=> b!1035221 m!955443))

(assert (=> b!1035221 m!955035))

(declare-fun m!955445 () Bool)

(assert (=> bm!43757 m!955445))

(assert (=> b!1035220 m!955035))

(assert (=> b!1035220 m!955035))

(assert (=> b!1035220 m!955037))

(declare-fun m!955447 () Bool)

(assert (=> b!1035218 m!955447))

(assert (=> b!1035227 m!955035))

(assert (=> b!1035227 m!955035))

(declare-fun m!955449 () Bool)

(assert (=> b!1035227 m!955449))

(assert (=> b!1035219 m!955445))

(assert (=> b!1035223 m!955035))

(assert (=> b!1035223 m!955035))

(assert (=> b!1035223 m!955037))

(declare-fun m!955451 () Bool)

(assert (=> b!1035217 m!955451))

(declare-fun m!955453 () Bool)

(assert (=> d!124361 m!955453))

(assert (=> d!124361 m!955047))

(assert (=> bm!43734 d!124361))

(declare-fun d!124363 () Bool)

(assert (=> d!124363 (= (apply!915 lt!456716 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30246 () Bool)

(assert (= bs!30246 d!124363))

(assert (=> bs!30246 m!955035))

(declare-fun m!955455 () Bool)

(assert (=> bs!30246 m!955455))

(assert (=> bs!30246 m!955455))

(declare-fun m!955457 () Bool)

(assert (=> bs!30246 m!955457))

(assert (=> b!1035011 d!124363))

(assert (=> b!1035011 d!124335))

(declare-fun b!1035238 () Bool)

(declare-fun res!691238 () Bool)

(declare-fun e!585289 () Bool)

(assert (=> b!1035238 (=> (not res!691238) (not e!585289))))

(declare-fun size!31898 (LongMapFixedSize!5704) (_ BitVec 32))

(assert (=> b!1035238 (= res!691238 (bvsge (size!31898 lt!456630) (_size!2907 lt!456630)))))

(declare-fun b!1035239 () Bool)

(declare-fun res!691241 () Bool)

(assert (=> b!1035239 (=> (not res!691241) (not e!585289))))

(assert (=> b!1035239 (= res!691241 (= (size!31898 lt!456630) (bvadd (_size!2907 lt!456630) (bvsdiv (bvadd (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124365 () Bool)

(declare-fun res!691240 () Bool)

(assert (=> d!124365 (=> (not res!691240) (not e!585289))))

(assert (=> d!124365 (= res!691240 (validMask!0 (mask!30143 lt!456630)))))

(assert (=> d!124365 (= (simpleValid!405 lt!456630) e!585289)))

(declare-fun b!1035240 () Bool)

(assert (=> b!1035240 (= e!585289 (and (bvsge (extraKeys!5958 lt!456630) #b00000000000000000000000000000000) (bvsle (extraKeys!5958 lt!456630) #b00000000000000000000000000000011) (bvsge (_vacant!2907 lt!456630) #b00000000000000000000000000000000)))))

(declare-fun b!1035237 () Bool)

(declare-fun res!691239 () Bool)

(assert (=> b!1035237 (=> (not res!691239) (not e!585289))))

(assert (=> b!1035237 (= res!691239 (and (= (size!31893 (_values!6249 lt!456630)) (bvadd (mask!30143 lt!456630) #b00000000000000000000000000000001)) (= (size!31892 (_keys!11444 lt!456630)) (size!31893 (_values!6249 lt!456630))) (bvsge (_size!2907 lt!456630) #b00000000000000000000000000000000) (bvsle (_size!2907 lt!456630) (bvadd (mask!30143 lt!456630) #b00000000000000000000000000000001))))))

(assert (= (and d!124365 res!691240) b!1035237))

(assert (= (and b!1035237 res!691239) b!1035238))

(assert (= (and b!1035238 res!691238) b!1035239))

(assert (= (and b!1035239 res!691241) b!1035240))

(declare-fun m!955459 () Bool)

(assert (=> b!1035238 m!955459))

(assert (=> b!1035239 m!955459))

(assert (=> d!124365 m!955393))

(assert (=> d!124279 d!124365))

(declare-fun d!124367 () Bool)

(declare-fun e!585290 () Bool)

(assert (=> d!124367 e!585290))

(declare-fun res!691242 () Bool)

(assert (=> d!124367 (=> (not res!691242) (not e!585290))))

(declare-fun lt!456887 () ListLongMap!13761)

(assert (=> d!124367 (= res!691242 (contains!6037 lt!456887 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456889 () List!21892)

(assert (=> d!124367 (= lt!456887 (ListLongMap!13762 lt!456889))))

(declare-fun lt!456888 () Unit!33837)

(declare-fun lt!456886 () Unit!33837)

(assert (=> d!124367 (= lt!456888 lt!456886)))

(assert (=> d!124367 (= (getValueByKey!584 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124367 (= lt!456886 (lemmaContainsTupThenGetReturnValue!280 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124367 (= lt!456889 (insertStrictlySorted!373 (toList!6896 call!43734) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124367 (= (+!3126 call!43734 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456887)))

(declare-fun b!1035241 () Bool)

(declare-fun res!691243 () Bool)

(assert (=> b!1035241 (=> (not res!691243) (not e!585290))))

(assert (=> b!1035241 (= res!691243 (= (getValueByKey!584 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035242 () Bool)

(assert (=> b!1035242 (= e!585290 (contains!6038 (toList!6896 lt!456887) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124367 res!691242) b!1035241))

(assert (= (and b!1035241 res!691243) b!1035242))

(declare-fun m!955461 () Bool)

(assert (=> d!124367 m!955461))

(declare-fun m!955463 () Bool)

(assert (=> d!124367 m!955463))

(declare-fun m!955465 () Bool)

(assert (=> d!124367 m!955465))

(declare-fun m!955467 () Bool)

(assert (=> d!124367 m!955467))

(declare-fun m!955469 () Bool)

(assert (=> b!1035241 m!955469))

(declare-fun m!955471 () Bool)

(assert (=> b!1035242 m!955471))

(assert (=> b!1035028 d!124367))

(assert (=> b!1035027 d!124323))

(declare-fun d!124369 () Bool)

(declare-fun e!585292 () Bool)

(assert (=> d!124369 e!585292))

(declare-fun res!691244 () Bool)

(assert (=> d!124369 (=> res!691244 e!585292)))

(declare-fun lt!456891 () Bool)

(assert (=> d!124369 (= res!691244 (not lt!456891))))

(declare-fun lt!456890 () Bool)

(assert (=> d!124369 (= lt!456891 lt!456890)))

(declare-fun lt!456893 () Unit!33837)

(declare-fun e!585291 () Unit!33837)

(assert (=> d!124369 (= lt!456893 e!585291)))

(declare-fun c!104859 () Bool)

(assert (=> d!124369 (= c!104859 lt!456890)))

(assert (=> d!124369 (= lt!456890 (containsKey!565 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124369 (= (contains!6037 lt!456716 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!456891)))

(declare-fun b!1035243 () Bool)

(declare-fun lt!456892 () Unit!33837)

(assert (=> b!1035243 (= e!585291 lt!456892)))

(assert (=> b!1035243 (= lt!456892 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035243 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035244 () Bool)

(declare-fun Unit!33848 () Unit!33837)

(assert (=> b!1035244 (= e!585291 Unit!33848)))

(declare-fun b!1035245 () Bool)

(assert (=> b!1035245 (= e!585292 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124369 c!104859) b!1035243))

(assert (= (and d!124369 (not c!104859)) b!1035244))

(assert (= (and d!124369 (not res!691244)) b!1035245))

(assert (=> d!124369 m!955035))

(declare-fun m!955473 () Bool)

(assert (=> d!124369 m!955473))

(assert (=> b!1035243 m!955035))

(declare-fun m!955475 () Bool)

(assert (=> b!1035243 m!955475))

(assert (=> b!1035243 m!955035))

(assert (=> b!1035243 m!955455))

(assert (=> b!1035243 m!955455))

(declare-fun m!955477 () Bool)

(assert (=> b!1035243 m!955477))

(assert (=> b!1035245 m!955035))

(assert (=> b!1035245 m!955455))

(assert (=> b!1035245 m!955455))

(assert (=> b!1035245 m!955477))

(assert (=> b!1034994 d!124369))

(assert (=> bm!43727 d!124291))

(assert (=> d!124281 d!124351))

(declare-fun b!1035246 () Bool)

(declare-fun e!585294 () (_ BitVec 32))

(declare-fun call!43761 () (_ BitVec 32))

(assert (=> b!1035246 (= e!585294 (bvadd #b00000000000000000000000000000001 call!43761))))

(declare-fun b!1035247 () Bool)

(declare-fun e!585293 () (_ BitVec 32))

(assert (=> b!1035247 (= e!585293 #b00000000000000000000000000000000)))

(declare-fun bm!43758 () Bool)

(assert (=> bm!43758 (= call!43761 (arrayCountValidKeys!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun d!124371 () Bool)

(declare-fun lt!456894 () (_ BitVec 32))

(assert (=> d!124371 (and (bvsge lt!456894 #b00000000000000000000000000000000) (bvsle lt!456894 (bvsub (size!31892 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124371 (= lt!456894 e!585293)))

(declare-fun c!104861 () Bool)

(assert (=> d!124371 (= c!104861 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124371 (and (bvsle #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31892 (_keys!11444 thiss!1427)) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124371 (= (arrayCountValidKeys!0 (_keys!11444 thiss!1427) #b00000000000000000000000000000000 (size!31892 (_keys!11444 thiss!1427))) lt!456894)))

(declare-fun b!1035248 () Bool)

(assert (=> b!1035248 (= e!585294 call!43761)))

(declare-fun b!1035249 () Bool)

(assert (=> b!1035249 (= e!585293 e!585294)))

(declare-fun c!104860 () Bool)

(assert (=> b!1035249 (= c!104860 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124371 c!104861) b!1035247))

(assert (= (and d!124371 (not c!104861)) b!1035249))

(assert (= (and b!1035249 c!104860) b!1035246))

(assert (= (and b!1035249 (not c!104860)) b!1035248))

(assert (= (or b!1035246 b!1035248) bm!43758))

(declare-fun m!955479 () Bool)

(assert (=> bm!43758 m!955479))

(assert (=> b!1035249 m!955035))

(assert (=> b!1035249 m!955035))

(assert (=> b!1035249 m!955037))

(assert (=> b!1034946 d!124371))

(declare-fun d!124373 () Bool)

(assert (=> d!124373 (= (apply!915 lt!456742 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30247 () Bool)

(assert (= bs!30247 d!124373))

(declare-fun m!955481 () Bool)

(assert (=> bs!30247 m!955481))

(assert (=> bs!30247 m!955481))

(declare-fun m!955483 () Bool)

(assert (=> bs!30247 m!955483))

(assert (=> b!1035025 d!124373))

(declare-fun b!1035251 () Bool)

(declare-fun res!691245 () Bool)

(declare-fun e!585295 () Bool)

(assert (=> b!1035251 (=> (not res!691245) (not e!585295))))

(assert (=> b!1035251 (= res!691245 (bvsge (size!31898 thiss!1427) (_size!2907 thiss!1427)))))

(declare-fun b!1035252 () Bool)

(declare-fun res!691248 () Bool)

(assert (=> b!1035252 (=> (not res!691248) (not e!585295))))

(assert (=> b!1035252 (= res!691248 (= (size!31898 thiss!1427) (bvadd (_size!2907 thiss!1427) (bvsdiv (bvadd (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124375 () Bool)

(declare-fun res!691247 () Bool)

(assert (=> d!124375 (=> (not res!691247) (not e!585295))))

(assert (=> d!124375 (= res!691247 (validMask!0 (mask!30143 thiss!1427)))))

(assert (=> d!124375 (= (simpleValid!405 thiss!1427) e!585295)))

(declare-fun b!1035253 () Bool)

(assert (=> b!1035253 (= e!585295 (and (bvsge (extraKeys!5958 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5958 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2907 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1035250 () Bool)

(declare-fun res!691246 () Bool)

(assert (=> b!1035250 (=> (not res!691246) (not e!585295))))

(assert (=> b!1035250 (= res!691246 (and (= (size!31893 (_values!6249 thiss!1427)) (bvadd (mask!30143 thiss!1427) #b00000000000000000000000000000001)) (= (size!31892 (_keys!11444 thiss!1427)) (size!31893 (_values!6249 thiss!1427))) (bvsge (_size!2907 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2907 thiss!1427) (bvadd (mask!30143 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124375 res!691247) b!1035250))

(assert (= (and b!1035250 res!691246) b!1035251))

(assert (= (and b!1035251 res!691245) b!1035252))

(assert (= (and b!1035252 res!691248) b!1035253))

(declare-fun m!955485 () Bool)

(assert (=> b!1035251 m!955485))

(assert (=> b!1035252 m!955485))

(assert (=> d!124375 m!955047))

(assert (=> d!124267 d!124375))

(declare-fun d!124377 () Bool)

(declare-fun e!585296 () Bool)

(assert (=> d!124377 e!585296))

(declare-fun res!691249 () Bool)

(assert (=> d!124377 (=> (not res!691249) (not e!585296))))

(declare-fun lt!456896 () ListLongMap!13761)

(assert (=> d!124377 (= res!691249 (contains!6037 lt!456896 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456898 () List!21892)

(assert (=> d!124377 (= lt!456896 (ListLongMap!13762 lt!456898))))

(declare-fun lt!456897 () Unit!33837)

(declare-fun lt!456895 () Unit!33837)

(assert (=> d!124377 (= lt!456897 lt!456895)))

(assert (=> d!124377 (= (getValueByKey!584 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124377 (= lt!456895 (lemmaContainsTupThenGetReturnValue!280 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124377 (= lt!456898 (insertStrictlySorted!373 (toList!6896 call!43727) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124377 (= (+!3126 call!43727 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!456896)))

(declare-fun b!1035254 () Bool)

(declare-fun res!691250 () Bool)

(assert (=> b!1035254 (=> (not res!691250) (not e!585296))))

(assert (=> b!1035254 (= res!691250 (= (getValueByKey!584 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035255 () Bool)

(assert (=> b!1035255 (= e!585296 (contains!6038 (toList!6896 lt!456896) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124377 res!691249) b!1035254))

(assert (= (and b!1035254 res!691250) b!1035255))

(declare-fun m!955487 () Bool)

(assert (=> d!124377 m!955487))

(declare-fun m!955489 () Bool)

(assert (=> d!124377 m!955489))

(declare-fun m!955491 () Bool)

(assert (=> d!124377 m!955491))

(declare-fun m!955493 () Bool)

(assert (=> d!124377 m!955493))

(declare-fun m!955495 () Bool)

(assert (=> b!1035254 m!955495))

(declare-fun m!955497 () Bool)

(assert (=> b!1035255 m!955497))

(assert (=> b!1035007 d!124377))

(assert (=> b!1035006 d!124323))

(declare-fun d!124379 () Bool)

(assert (=> d!124379 (= (apply!915 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!456731) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!456731)))))

(declare-fun bs!30248 () Bool)

(assert (= bs!30248 d!124379))

(declare-fun m!955499 () Bool)

(assert (=> bs!30248 m!955499))

(assert (=> bs!30248 m!955499))

(declare-fun m!955501 () Bool)

(assert (=> bs!30248 m!955501))

(assert (=> b!1035035 d!124379))

(declare-fun d!124381 () Bool)

(assert (=> d!124381 (contains!6037 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!456729)))

(declare-fun lt!456899 () Unit!33837)

(assert (=> d!124381 (= lt!456899 (choose!1702 lt!456726 lt!456743 (zeroValue!6062 thiss!1427) lt!456729))))

(assert (=> d!124381 (contains!6037 lt!456726 lt!456729)))

(assert (=> d!124381 (= (addStillContains!625 lt!456726 lt!456743 (zeroValue!6062 thiss!1427) lt!456729) lt!456899)))

(declare-fun bs!30249 () Bool)

(assert (= bs!30249 d!124381))

(assert (=> bs!30249 m!955117))

(assert (=> bs!30249 m!955117))

(assert (=> bs!30249 m!955125))

(declare-fun m!955503 () Bool)

(assert (=> bs!30249 m!955503))

(declare-fun m!955505 () Bool)

(assert (=> bs!30249 m!955505))

(assert (=> b!1035035 d!124381))

(declare-fun d!124383 () Bool)

(declare-fun e!585298 () Bool)

(assert (=> d!124383 e!585298))

(declare-fun res!691251 () Bool)

(assert (=> d!124383 (=> res!691251 e!585298)))

(declare-fun lt!456901 () Bool)

(assert (=> d!124383 (= res!691251 (not lt!456901))))

(declare-fun lt!456900 () Bool)

(assert (=> d!124383 (= lt!456901 lt!456900)))

(declare-fun lt!456903 () Unit!33837)

(declare-fun e!585297 () Unit!33837)

(assert (=> d!124383 (= lt!456903 e!585297)))

(declare-fun c!104862 () Bool)

(assert (=> d!124383 (= c!104862 lt!456900)))

(assert (=> d!124383 (= lt!456900 (containsKey!565 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(assert (=> d!124383 (= (contains!6037 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!456729) lt!456901)))

(declare-fun b!1035256 () Bool)

(declare-fun lt!456902 () Unit!33837)

(assert (=> b!1035256 (= e!585297 lt!456902)))

(assert (=> b!1035256 (= lt!456902 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(assert (=> b!1035256 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(declare-fun b!1035257 () Bool)

(declare-fun Unit!33849 () Unit!33837)

(assert (=> b!1035257 (= e!585297 Unit!33849)))

(declare-fun b!1035258 () Bool)

(assert (=> b!1035258 (= e!585298 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729)))))

(assert (= (and d!124383 c!104862) b!1035256))

(assert (= (and d!124383 (not c!104862)) b!1035257))

(assert (= (and d!124383 (not res!691251)) b!1035258))

(declare-fun m!955507 () Bool)

(assert (=> d!124383 m!955507))

(declare-fun m!955509 () Bool)

(assert (=> b!1035256 m!955509))

(declare-fun m!955511 () Bool)

(assert (=> b!1035256 m!955511))

(assert (=> b!1035256 m!955511))

(declare-fun m!955513 () Bool)

(assert (=> b!1035256 m!955513))

(assert (=> b!1035258 m!955511))

(assert (=> b!1035258 m!955511))

(assert (=> b!1035258 m!955513))

(assert (=> b!1035035 d!124383))

(declare-fun d!124385 () Bool)

(declare-fun e!585299 () Bool)

(assert (=> d!124385 e!585299))

(declare-fun res!691252 () Bool)

(assert (=> d!124385 (=> (not res!691252) (not e!585299))))

(declare-fun lt!456905 () ListLongMap!13761)

(assert (=> d!124385 (= res!691252 (contains!6037 lt!456905 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456907 () List!21892)

(assert (=> d!124385 (= lt!456905 (ListLongMap!13762 lt!456907))))

(declare-fun lt!456906 () Unit!33837)

(declare-fun lt!456904 () Unit!33837)

(assert (=> d!124385 (= lt!456906 lt!456904)))

(assert (=> d!124385 (= (getValueByKey!584 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(assert (=> d!124385 (= lt!456904 (lemmaContainsTupThenGetReturnValue!280 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(assert (=> d!124385 (= lt!456907 (insertStrictlySorted!373 (toList!6896 lt!456725) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(assert (=> d!124385 (= (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!456905)))

(declare-fun b!1035259 () Bool)

(declare-fun res!691253 () Bool)

(assert (=> b!1035259 (=> (not res!691253) (not e!585299))))

(assert (=> b!1035259 (= res!691253 (= (getValueByKey!584 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035260 () Bool)

(assert (=> b!1035260 (= e!585299 (contains!6038 (toList!6896 lt!456905) (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))

(assert (= (and d!124385 res!691252) b!1035259))

(assert (= (and b!1035259 res!691253) b!1035260))

(declare-fun m!955515 () Bool)

(assert (=> d!124385 m!955515))

(declare-fun m!955517 () Bool)

(assert (=> d!124385 m!955517))

(declare-fun m!955519 () Bool)

(assert (=> d!124385 m!955519))

(declare-fun m!955521 () Bool)

(assert (=> d!124385 m!955521))

(declare-fun m!955523 () Bool)

(assert (=> b!1035259 m!955523))

(declare-fun m!955525 () Bool)

(assert (=> b!1035260 m!955525))

(assert (=> b!1035035 d!124385))

(declare-fun d!124387 () Bool)

(declare-fun e!585300 () Bool)

(assert (=> d!124387 e!585300))

(declare-fun res!691254 () Bool)

(assert (=> d!124387 (=> (not res!691254) (not e!585300))))

(declare-fun lt!456909 () ListLongMap!13761)

(assert (=> d!124387 (= res!691254 (contains!6037 lt!456909 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456911 () List!21892)

(assert (=> d!124387 (= lt!456909 (ListLongMap!13762 lt!456911))))

(declare-fun lt!456910 () Unit!33837)

(declare-fun lt!456908 () Unit!33837)

(assert (=> d!124387 (= lt!456910 lt!456908)))

(assert (=> d!124387 (= (getValueByKey!584 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124387 (= lt!456908 (lemmaContainsTupThenGetReturnValue!280 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124387 (= lt!456911 (insertStrictlySorted!373 (toList!6896 lt!456726) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124387 (= (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!456909)))

(declare-fun b!1035261 () Bool)

(declare-fun res!691255 () Bool)

(assert (=> b!1035261 (=> (not res!691255) (not e!585300))))

(assert (=> b!1035261 (= res!691255 (= (getValueByKey!584 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1035262 () Bool)

(assert (=> b!1035262 (= e!585300 (contains!6038 (toList!6896 lt!456909) (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!124387 res!691254) b!1035261))

(assert (= (and b!1035261 res!691255) b!1035262))

(declare-fun m!955527 () Bool)

(assert (=> d!124387 m!955527))

(declare-fun m!955529 () Bool)

(assert (=> d!124387 m!955529))

(declare-fun m!955531 () Bool)

(assert (=> d!124387 m!955531))

(declare-fun m!955533 () Bool)

(assert (=> d!124387 m!955533))

(declare-fun m!955535 () Bool)

(assert (=> b!1035261 m!955535))

(declare-fun m!955537 () Bool)

(assert (=> b!1035262 m!955537))

(assert (=> b!1035035 d!124387))

(declare-fun d!124389 () Bool)

(assert (=> d!124389 (= (apply!915 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456736) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!456736)))))

(declare-fun bs!30250 () Bool)

(assert (= bs!30250 d!124389))

(declare-fun m!955539 () Bool)

(assert (=> bs!30250 m!955539))

(assert (=> bs!30250 m!955539))

(declare-fun m!955541 () Bool)

(assert (=> bs!30250 m!955541))

(assert (=> b!1035035 d!124389))

(declare-fun d!124391 () Bool)

(assert (=> d!124391 (= (apply!915 lt!456730 lt!456724) (get!16463 (getValueByKey!584 (toList!6896 lt!456730) lt!456724)))))

(declare-fun bs!30251 () Bool)

(assert (= bs!30251 d!124391))

(declare-fun m!955543 () Bool)

(assert (=> bs!30251 m!955543))

(assert (=> bs!30251 m!955543))

(declare-fun m!955545 () Bool)

(assert (=> bs!30251 m!955545))

(assert (=> b!1035035 d!124391))

(declare-fun d!124393 () Bool)

(declare-fun e!585301 () Bool)

(assert (=> d!124393 e!585301))

(declare-fun res!691256 () Bool)

(assert (=> d!124393 (=> (not res!691256) (not e!585301))))

(declare-fun lt!456913 () ListLongMap!13761)

(assert (=> d!124393 (= res!691256 (contains!6037 lt!456913 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456915 () List!21892)

(assert (=> d!124393 (= lt!456913 (ListLongMap!13762 lt!456915))))

(declare-fun lt!456914 () Unit!33837)

(declare-fun lt!456912 () Unit!33837)

(assert (=> d!124393 (= lt!456914 lt!456912)))

(assert (=> d!124393 (= (getValueByKey!584 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(assert (=> d!124393 (= lt!456912 (lemmaContainsTupThenGetReturnValue!280 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(assert (=> d!124393 (= lt!456915 (insertStrictlySorted!373 (toList!6896 lt!456734) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(assert (=> d!124393 (= (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456913)))

(declare-fun b!1035263 () Bool)

(declare-fun res!691257 () Bool)

(assert (=> b!1035263 (=> (not res!691257) (not e!585301))))

(assert (=> b!1035263 (= res!691257 (= (getValueByKey!584 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035264 () Bool)

(assert (=> b!1035264 (= e!585301 (contains!6038 (toList!6896 lt!456913) (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))

(assert (= (and d!124393 res!691256) b!1035263))

(assert (= (and b!1035263 res!691257) b!1035264))

(declare-fun m!955547 () Bool)

(assert (=> d!124393 m!955547))

(declare-fun m!955549 () Bool)

(assert (=> d!124393 m!955549))

(declare-fun m!955551 () Bool)

(assert (=> d!124393 m!955551))

(declare-fun m!955553 () Bool)

(assert (=> d!124393 m!955553))

(declare-fun m!955555 () Bool)

(assert (=> b!1035263 m!955555))

(declare-fun m!955557 () Bool)

(assert (=> b!1035264 m!955557))

(assert (=> b!1035035 d!124393))

(declare-fun d!124395 () Bool)

(assert (=> d!124395 (= (apply!915 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!456724) (apply!915 lt!456730 lt!456724))))

(declare-fun lt!456916 () Unit!33837)

(assert (=> d!124395 (= lt!456916 (choose!1701 lt!456730 lt!456727 (zeroValue!6062 thiss!1427) lt!456724))))

(declare-fun e!585302 () Bool)

(assert (=> d!124395 e!585302))

(declare-fun res!691258 () Bool)

(assert (=> d!124395 (=> (not res!691258) (not e!585302))))

(assert (=> d!124395 (= res!691258 (contains!6037 lt!456730 lt!456724))))

(assert (=> d!124395 (= (addApplyDifferent!481 lt!456730 lt!456727 (zeroValue!6062 thiss!1427) lt!456724) lt!456916)))

(declare-fun b!1035265 () Bool)

(assert (=> b!1035265 (= e!585302 (not (= lt!456724 lt!456727)))))

(assert (= (and d!124395 res!691258) b!1035265))

(declare-fun m!955559 () Bool)

(assert (=> d!124395 m!955559))

(assert (=> d!124395 m!955135))

(assert (=> d!124395 m!955137))

(assert (=> d!124395 m!955121))

(declare-fun m!955561 () Bool)

(assert (=> d!124395 m!955561))

(assert (=> d!124395 m!955135))

(assert (=> b!1035035 d!124395))

(assert (=> b!1035035 d!124361))

(declare-fun d!124397 () Bool)

(assert (=> d!124397 (= (apply!915 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!456724) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!456724)))))

(declare-fun bs!30252 () Bool)

(assert (= bs!30252 d!124397))

(declare-fun m!955563 () Bool)

(assert (=> bs!30252 m!955563))

(assert (=> bs!30252 m!955563))

(declare-fun m!955565 () Bool)

(assert (=> bs!30252 m!955565))

(assert (=> b!1035035 d!124397))

(declare-fun d!124399 () Bool)

(assert (=> d!124399 (= (apply!915 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!456731) (apply!915 lt!456725 lt!456731))))

(declare-fun lt!456917 () Unit!33837)

(assert (=> d!124399 (= lt!456917 (choose!1701 lt!456725 lt!456741 (minValue!6062 thiss!1427) lt!456731))))

(declare-fun e!585303 () Bool)

(assert (=> d!124399 e!585303))

(declare-fun res!691259 () Bool)

(assert (=> d!124399 (=> (not res!691259) (not e!585303))))

(assert (=> d!124399 (= res!691259 (contains!6037 lt!456725 lt!456731))))

(assert (=> d!124399 (= (addApplyDifferent!481 lt!456725 lt!456741 (minValue!6062 thiss!1427) lt!456731) lt!456917)))

(declare-fun b!1035266 () Bool)

(assert (=> b!1035266 (= e!585303 (not (= lt!456731 lt!456741)))))

(assert (= (and d!124399 res!691259) b!1035266))

(declare-fun m!955567 () Bool)

(assert (=> d!124399 m!955567))

(assert (=> d!124399 m!955113))

(assert (=> d!124399 m!955127))

(assert (=> d!124399 m!955119))

(declare-fun m!955569 () Bool)

(assert (=> d!124399 m!955569))

(assert (=> d!124399 m!955113))

(assert (=> b!1035035 d!124399))

(declare-fun d!124401 () Bool)

(assert (=> d!124401 (= (apply!915 lt!456725 lt!456731) (get!16463 (getValueByKey!584 (toList!6896 lt!456725) lt!456731)))))

(declare-fun bs!30253 () Bool)

(assert (= bs!30253 d!124401))

(declare-fun m!955571 () Bool)

(assert (=> bs!30253 m!955571))

(assert (=> bs!30253 m!955571))

(declare-fun m!955573 () Bool)

(assert (=> bs!30253 m!955573))

(assert (=> b!1035035 d!124401))

(declare-fun d!124403 () Bool)

(declare-fun e!585304 () Bool)

(assert (=> d!124403 e!585304))

(declare-fun res!691260 () Bool)

(assert (=> d!124403 (=> (not res!691260) (not e!585304))))

(declare-fun lt!456919 () ListLongMap!13761)

(assert (=> d!124403 (= res!691260 (contains!6037 lt!456919 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456921 () List!21892)

(assert (=> d!124403 (= lt!456919 (ListLongMap!13762 lt!456921))))

(declare-fun lt!456920 () Unit!33837)

(declare-fun lt!456918 () Unit!33837)

(assert (=> d!124403 (= lt!456920 lt!456918)))

(assert (=> d!124403 (= (getValueByKey!584 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124403 (= lt!456918 (lemmaContainsTupThenGetReturnValue!280 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124403 (= lt!456921 (insertStrictlySorted!373 (toList!6896 lt!456730) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124403 (= (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!456919)))

(declare-fun b!1035267 () Bool)

(declare-fun res!691261 () Bool)

(assert (=> b!1035267 (=> (not res!691261) (not e!585304))))

(assert (=> b!1035267 (= res!691261 (= (getValueByKey!584 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1035268 () Bool)

(assert (=> b!1035268 (= e!585304 (contains!6038 (toList!6896 lt!456919) (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!124403 res!691260) b!1035267))

(assert (= (and b!1035267 res!691261) b!1035268))

(declare-fun m!955575 () Bool)

(assert (=> d!124403 m!955575))

(declare-fun m!955577 () Bool)

(assert (=> d!124403 m!955577))

(declare-fun m!955579 () Bool)

(assert (=> d!124403 m!955579))

(declare-fun m!955581 () Bool)

(assert (=> d!124403 m!955581))

(declare-fun m!955583 () Bool)

(assert (=> b!1035267 m!955583))

(declare-fun m!955585 () Bool)

(assert (=> b!1035268 m!955585))

(assert (=> b!1035035 d!124403))

(declare-fun d!124405 () Bool)

(assert (=> d!124405 (= (apply!915 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456736) (apply!915 lt!456734 lt!456736))))

(declare-fun lt!456922 () Unit!33837)

(assert (=> d!124405 (= lt!456922 (choose!1701 lt!456734 lt!456735 (minValue!6062 thiss!1427) lt!456736))))

(declare-fun e!585305 () Bool)

(assert (=> d!124405 e!585305))

(declare-fun res!691262 () Bool)

(assert (=> d!124405 (=> (not res!691262) (not e!585305))))

(assert (=> d!124405 (= res!691262 (contains!6037 lt!456734 lt!456736))))

(assert (=> d!124405 (= (addApplyDifferent!481 lt!456734 lt!456735 (minValue!6062 thiss!1427) lt!456736) lt!456922)))

(declare-fun b!1035269 () Bool)

(assert (=> b!1035269 (= e!585305 (not (= lt!456736 lt!456735)))))

(assert (= (and d!124405 res!691262) b!1035269))

(declare-fun m!955587 () Bool)

(assert (=> d!124405 m!955587))

(assert (=> d!124405 m!955129))

(assert (=> d!124405 m!955133))

(assert (=> d!124405 m!955123))

(declare-fun m!955589 () Bool)

(assert (=> d!124405 m!955589))

(assert (=> d!124405 m!955129))

(assert (=> b!1035035 d!124405))

(declare-fun d!124407 () Bool)

(assert (=> d!124407 (= (apply!915 lt!456734 lt!456736) (get!16463 (getValueByKey!584 (toList!6896 lt!456734) lt!456736)))))

(declare-fun bs!30254 () Bool)

(assert (= bs!30254 d!124407))

(declare-fun m!955591 () Bool)

(assert (=> bs!30254 m!955591))

(assert (=> bs!30254 m!955591))

(declare-fun m!955593 () Bool)

(assert (=> bs!30254 m!955593))

(assert (=> b!1035035 d!124407))

(assert (=> b!1035019 d!124323))

(declare-fun b!1035270 () Bool)

(declare-fun e!585309 () Bool)

(assert (=> b!1035270 (= e!585309 (contains!6039 Nil!21890 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035271 () Bool)

(declare-fun e!585307 () Bool)

(declare-fun call!43762 () Bool)

(assert (=> b!1035271 (= e!585307 call!43762)))

(declare-fun b!1035272 () Bool)

(declare-fun e!585306 () Bool)

(assert (=> b!1035272 (= e!585306 e!585307)))

(declare-fun c!104863 () Bool)

(assert (=> b!1035272 (= c!104863 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun d!124409 () Bool)

(declare-fun res!691264 () Bool)

(declare-fun e!585308 () Bool)

(assert (=> d!124409 (=> res!691264 e!585308)))

(assert (=> d!124409 (= res!691264 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124409 (= (arrayNoDuplicates!0 (_keys!11444 lt!456630) #b00000000000000000000000000000000 Nil!21890) e!585308)))

(declare-fun bm!43759 () Bool)

(assert (=> bm!43759 (= call!43762 (arrayNoDuplicates!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104863 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)))))

(declare-fun b!1035273 () Bool)

(assert (=> b!1035273 (= e!585308 e!585306)))

(declare-fun res!691263 () Bool)

(assert (=> b!1035273 (=> (not res!691263) (not e!585306))))

(assert (=> b!1035273 (= res!691263 (not e!585309))))

(declare-fun res!691265 () Bool)

(assert (=> b!1035273 (=> (not res!691265) (not e!585309))))

(assert (=> b!1035273 (= res!691265 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035274 () Bool)

(assert (=> b!1035274 (= e!585307 call!43762)))

(assert (= (and d!124409 (not res!691264)) b!1035273))

(assert (= (and b!1035273 res!691265) b!1035270))

(assert (= (and b!1035273 res!691263) b!1035272))

(assert (= (and b!1035272 c!104863) b!1035274))

(assert (= (and b!1035272 (not c!104863)) b!1035271))

(assert (= (or b!1035274 b!1035271) bm!43759))

(assert (=> b!1035270 m!955297))

(assert (=> b!1035270 m!955297))

(declare-fun m!955595 () Bool)

(assert (=> b!1035270 m!955595))

(assert (=> b!1035272 m!955297))

(assert (=> b!1035272 m!955297))

(assert (=> b!1035272 m!955299))

(assert (=> bm!43759 m!955297))

(declare-fun m!955597 () Bool)

(assert (=> bm!43759 m!955597))

(assert (=> b!1035273 m!955297))

(assert (=> b!1035273 m!955297))

(assert (=> b!1035273 m!955299))

(assert (=> b!1034951 d!124409))

(declare-fun d!124411 () Bool)

(assert (=> d!124411 (= (apply!915 lt!456742 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30255 () Bool)

(assert (= bs!30255 d!124411))

(declare-fun m!955599 () Bool)

(assert (=> bs!30255 m!955599))

(assert (=> bs!30255 m!955599))

(declare-fun m!955601 () Bool)

(assert (=> bs!30255 m!955601))

(assert (=> b!1035018 d!124411))

(declare-fun d!124413 () Bool)

(assert (=> d!124413 (= (apply!915 lt!456716 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30256 () Bool)

(assert (= bs!30256 d!124413))

(assert (=> bs!30256 m!955325))

(assert (=> bs!30256 m!955325))

(declare-fun m!955603 () Bool)

(assert (=> bs!30256 m!955603))

(assert (=> b!1035004 d!124413))

(declare-fun d!124415 () Bool)

(declare-fun e!585311 () Bool)

(assert (=> d!124415 e!585311))

(declare-fun res!691266 () Bool)

(assert (=> d!124415 (=> res!691266 e!585311)))

(declare-fun lt!456924 () Bool)

(assert (=> d!124415 (= res!691266 (not lt!456924))))

(declare-fun lt!456923 () Bool)

(assert (=> d!124415 (= lt!456924 lt!456923)))

(declare-fun lt!456926 () Unit!33837)

(declare-fun e!585310 () Unit!33837)

(assert (=> d!124415 (= lt!456926 e!585310)))

(declare-fun c!104864 () Bool)

(assert (=> d!124415 (= c!104864 lt!456923)))

(assert (=> d!124415 (= lt!456923 (containsKey!565 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124415 (= (contains!6037 lt!456742 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456924)))

(declare-fun b!1035275 () Bool)

(declare-fun lt!456925 () Unit!33837)

(assert (=> b!1035275 (= e!585310 lt!456925)))

(assert (=> b!1035275 (= lt!456925 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035275 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035276 () Bool)

(declare-fun Unit!33850 () Unit!33837)

(assert (=> b!1035276 (= e!585310 Unit!33850)))

(declare-fun b!1035277 () Bool)

(assert (=> b!1035277 (= e!585311 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124415 c!104864) b!1035275))

(assert (= (and d!124415 (not c!104864)) b!1035276))

(assert (= (and d!124415 (not res!691266)) b!1035277))

(declare-fun m!955605 () Bool)

(assert (=> d!124415 m!955605))

(declare-fun m!955607 () Bool)

(assert (=> b!1035275 m!955607))

(assert (=> b!1035275 m!955599))

(assert (=> b!1035275 m!955599))

(declare-fun m!955609 () Bool)

(assert (=> b!1035275 m!955609))

(assert (=> b!1035277 m!955599))

(assert (=> b!1035277 m!955599))

(assert (=> b!1035277 m!955609))

(assert (=> bm!43731 d!124415))

(declare-fun d!124417 () Bool)

(declare-fun e!585313 () Bool)

(assert (=> d!124417 e!585313))

(declare-fun res!691267 () Bool)

(assert (=> d!124417 (=> res!691267 e!585313)))

(declare-fun lt!456928 () Bool)

(assert (=> d!124417 (= res!691267 (not lt!456928))))

(declare-fun lt!456927 () Bool)

(assert (=> d!124417 (= lt!456928 lt!456927)))

(declare-fun lt!456930 () Unit!33837)

(declare-fun e!585312 () Unit!33837)

(assert (=> d!124417 (= lt!456930 e!585312)))

(declare-fun c!104865 () Bool)

(assert (=> d!124417 (= c!104865 lt!456927)))

(assert (=> d!124417 (= lt!456927 (containsKey!565 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124417 (= (contains!6037 lt!456742 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456928)))

(declare-fun b!1035278 () Bool)

(declare-fun lt!456929 () Unit!33837)

(assert (=> b!1035278 (= e!585312 lt!456929)))

(assert (=> b!1035278 (= lt!456929 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035278 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035279 () Bool)

(declare-fun Unit!33851 () Unit!33837)

(assert (=> b!1035279 (= e!585312 Unit!33851)))

(declare-fun b!1035280 () Bool)

(assert (=> b!1035280 (= e!585313 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124417 c!104865) b!1035278))

(assert (= (and d!124417 (not c!104865)) b!1035279))

(assert (= (and d!124417 (not res!691267)) b!1035280))

(declare-fun m!955611 () Bool)

(assert (=> d!124417 m!955611))

(declare-fun m!955613 () Bool)

(assert (=> b!1035278 m!955613))

(assert (=> b!1035278 m!955481))

(assert (=> b!1035278 m!955481))

(declare-fun m!955615 () Bool)

(assert (=> b!1035278 m!955615))

(assert (=> b!1035280 m!955481))

(assert (=> b!1035280 m!955481))

(assert (=> b!1035280 m!955615))

(assert (=> bm!43730 d!124417))

(assert (=> d!124287 d!124351))

(declare-fun condMapEmpty!38268 () Bool)

(declare-fun mapDefault!38268 () ValueCell!11555)

(assert (=> mapNonEmpty!38267 (= condMapEmpty!38268 (= mapRest!38267 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38268)))))

(declare-fun e!585314 () Bool)

(declare-fun mapRes!38268 () Bool)

(assert (=> mapNonEmpty!38267 (= tp!73506 (and e!585314 mapRes!38268))))

(declare-fun mapIsEmpty!38268 () Bool)

(assert (=> mapIsEmpty!38268 mapRes!38268))

(declare-fun b!1035281 () Bool)

(declare-fun e!585315 () Bool)

(assert (=> b!1035281 (= e!585315 tp_is_empty!24517)))

(declare-fun b!1035282 () Bool)

(assert (=> b!1035282 (= e!585314 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38268 () Bool)

(declare-fun tp!73507 () Bool)

(assert (=> mapNonEmpty!38268 (= mapRes!38268 (and tp!73507 e!585315))))

(declare-fun mapRest!38268 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapKey!38268 () (_ BitVec 32))

(declare-fun mapValue!38268 () ValueCell!11555)

(assert (=> mapNonEmpty!38268 (= mapRest!38267 (store mapRest!38268 mapKey!38268 mapValue!38268))))

(assert (= (and mapNonEmpty!38267 condMapEmpty!38268) mapIsEmpty!38268))

(assert (= (and mapNonEmpty!38267 (not condMapEmpty!38268)) mapNonEmpty!38268))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11555) mapValue!38268)) b!1035281))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11555) mapDefault!38268)) b!1035282))

(declare-fun m!955617 () Bool)

(assert (=> mapNonEmpty!38268 m!955617))

(declare-fun b_lambda!16081 () Bool)

(assert (= b_lambda!16079 (or (and b!1034889 b_free!20797) b_lambda!16081)))

(declare-fun b_lambda!16083 () Bool)

(assert (= b_lambda!16071 (or (and b!1034889 b_free!20797) b_lambda!16083)))

(declare-fun b_lambda!16085 () Bool)

(assert (= b_lambda!16073 (or (and b!1034889 b_free!20797) b_lambda!16085)))

(declare-fun b_lambda!16087 () Bool)

(assert (= b_lambda!16077 (or (and b!1034889 b_free!20797) b_lambda!16087)))

(check-sat (not b!1035200) (not d!124405) (not b!1035258) (not b!1035243) (not d!124339) (not b!1035273) (not b!1035267) (not b!1035223) (not d!124337) (not d!124315) (not bm!43750) (not b!1035082) (not b!1035106) (not d!124299) (not d!124309) (not b!1035196) (not d!124349) (not d!124413) (not b!1035144) (not b!1035264) (not b!1035092) (not b!1035151) (not d!124321) (not b!1035195) (not b!1035108) (not b!1035077) (not d!124297) (not b!1035164) (not b!1035078) (not bm!43751) (not b!1035249) (not d!124383) (not d!124407) (not b!1035245) (not d!124415) (not d!124311) (not b!1035125) (not b!1035175) (not b!1035076) (not bm!43755) (not d!124295) (not b!1035206) b_and!33299 (not b!1035139) (not b!1035251) (not d!124395) (not b!1035272) (not b!1035220) (not d!124381) (not b!1035241) (not d!124345) (not b!1035193) (not d!124329) (not b!1035261) (not d!124373) (not d!124301) (not bm!43757) (not b!1035280) (not b!1035166) (not d!124369) (not b!1035277) (not b!1035208) (not d!124319) (not b!1035112) (not b!1035169) (not d!124289) (not b!1035219) (not b!1035216) (not b!1035213) (not d!124363) (not b!1035190) (not d!124393) (not b!1035268) (not b_lambda!16083) (not b!1035227) (not d!124353) (not b!1035221) (not b!1035260) (not b!1035137) (not b!1035254) (not b_lambda!16075) (not b!1035238) (not b!1035099) (not d!124343) (not b!1035107) (not b!1035187) (not b!1035102) (not b!1035259) (not bm!43749) (not d!124387) (not b!1035256) (not b_lambda!16061) (not b!1035222) (not b!1035199) (not bm!43739) (not d!124375) (not d!124333) (not b!1035172) (not d!124397) (not b!1035072) (not d!124377) (not b!1035239) (not d!124389) (not d!124347) (not b!1035073) (not b!1035209) (not d!124317) (not b!1035278) (not d!124327) (not d!124379) (not b!1035090) (not b_lambda!16087) (not mapNonEmpty!38268) (not d!124417) (not b!1035075) (not b!1035218) (not d!124291) (not d!124293) (not b!1035146) (not d!124305) (not b!1035242) (not b!1035252) (not b_next!20797) (not d!124385) (not b!1035101) (not b_lambda!16069) (not b!1035123) (not d!124361) (not bm!43759) (not b!1035089) (not b!1035109) (not b_lambda!16067) (not bm!43748) (not d!124365) (not b!1035149) (not d!124359) (not d!124325) (not b!1035217) (not d!124391) (not bm!43754) (not b!1035110) (not b!1035255) (not b!1035262) (not d!124313) (not d!124401) (not b!1035103) (not bm!43742) (not b!1035074) (not b_lambda!16085) (not b!1035189) (not b!1035275) (not b_lambda!16081) (not d!124399) (not bm!43758) (not b!1035176) (not bm!43745) (not b!1035091) (not b!1035170) (not b!1035163) (not b!1035148) (not d!124367) (not d!124411) tp_is_empty!24517 (not d!124307) (not d!124403) (not d!124303) (not b!1035145) (not b!1035270) (not b!1035263) (not b!1035167))
(check-sat b_and!33299 (not b_next!20797))
(get-model)

(declare-fun d!124419 () Bool)

(assert (=> d!124419 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456710)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456710)))))

(assert (=> d!124297 d!124419))

(declare-fun b!1035291 () Bool)

(declare-fun e!585320 () Option!635)

(assert (=> b!1035291 (= e!585320 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035292 () Bool)

(declare-fun e!585321 () Option!635)

(assert (=> b!1035292 (= e!585320 e!585321)))

(declare-fun c!104871 () Bool)

(assert (=> b!1035292 (= c!104871 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))) lt!456710))))))

(declare-fun b!1035294 () Bool)

(assert (=> b!1035294 (= e!585321 None!633)))

(declare-fun b!1035293 () Bool)

(assert (=> b!1035293 (= e!585321 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))) lt!456710))))

(declare-fun c!104870 () Bool)

(declare-fun d!124421 () Bool)

(assert (=> d!124421 (= c!104870 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))) lt!456710)))))

(assert (=> d!124421 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456710) e!585320)))

(assert (= (and d!124421 c!104870) b!1035291))

(assert (= (and d!124421 (not c!104870)) b!1035292))

(assert (= (and b!1035292 c!104871) b!1035293))

(assert (= (and b!1035292 (not c!104871)) b!1035294))

(declare-fun m!955619 () Bool)

(assert (=> b!1035293 m!955619))

(assert (=> d!124297 d!124421))

(declare-fun d!124423 () Bool)

(declare-fun e!585323 () Bool)

(assert (=> d!124423 e!585323))

(declare-fun res!691268 () Bool)

(assert (=> d!124423 (=> res!691268 e!585323)))

(declare-fun lt!456932 () Bool)

(assert (=> d!124423 (= res!691268 (not lt!456932))))

(declare-fun lt!456931 () Bool)

(assert (=> d!124423 (= lt!456932 lt!456931)))

(declare-fun lt!456934 () Unit!33837)

(declare-fun e!585322 () Unit!33837)

(assert (=> d!124423 (= lt!456934 e!585322)))

(declare-fun c!104872 () Bool)

(assert (=> d!124423 (= c!104872 lt!456931)))

(assert (=> d!124423 (= lt!456931 (containsKey!565 (toList!6896 lt!456876) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> d!124423 (= (contains!6037 lt!456876 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) lt!456932)))

(declare-fun b!1035295 () Bool)

(declare-fun lt!456933 () Unit!33837)

(assert (=> b!1035295 (= e!585322 lt!456933)))

(assert (=> b!1035295 (= lt!456933 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456876) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> b!1035295 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035296 () Bool)

(declare-fun Unit!33852 () Unit!33837)

(assert (=> b!1035296 (= e!585322 Unit!33852)))

(declare-fun b!1035297 () Bool)

(assert (=> b!1035297 (= e!585323 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))))

(assert (= (and d!124423 c!104872) b!1035295))

(assert (= (and d!124423 (not c!104872)) b!1035296))

(assert (= (and d!124423 (not res!691268)) b!1035297))

(assert (=> d!124423 m!955297))

(declare-fun m!955621 () Bool)

(assert (=> d!124423 m!955621))

(assert (=> b!1035295 m!955297))

(declare-fun m!955623 () Bool)

(assert (=> b!1035295 m!955623))

(assert (=> b!1035295 m!955297))

(declare-fun m!955625 () Bool)

(assert (=> b!1035295 m!955625))

(assert (=> b!1035295 m!955625))

(declare-fun m!955627 () Bool)

(assert (=> b!1035295 m!955627))

(assert (=> b!1035297 m!955297))

(assert (=> b!1035297 m!955625))

(assert (=> b!1035297 m!955625))

(assert (=> b!1035297 m!955627))

(assert (=> b!1035196 d!124423))

(declare-fun d!124425 () Bool)

(declare-fun e!585325 () Bool)

(assert (=> d!124425 e!585325))

(declare-fun res!691269 () Bool)

(assert (=> d!124425 (=> res!691269 e!585325)))

(declare-fun lt!456936 () Bool)

(assert (=> d!124425 (= res!691269 (not lt!456936))))

(declare-fun lt!456935 () Bool)

(assert (=> d!124425 (= lt!456936 lt!456935)))

(declare-fun lt!456938 () Unit!33837)

(declare-fun e!585324 () Unit!33837)

(assert (=> d!124425 (= lt!456938 e!585324)))

(declare-fun c!104873 () Bool)

(assert (=> d!124425 (= c!104873 lt!456935)))

(assert (=> d!124425 (= lt!456935 (containsKey!565 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124425 (= (contains!6037 lt!456909 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456936)))

(declare-fun b!1035298 () Bool)

(declare-fun lt!456937 () Unit!33837)

(assert (=> b!1035298 (= e!585324 lt!456937)))

(assert (=> b!1035298 (= lt!456937 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(assert (=> b!1035298 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035299 () Bool)

(declare-fun Unit!33853 () Unit!33837)

(assert (=> b!1035299 (= e!585324 Unit!33853)))

(declare-fun b!1035300 () Bool)

(assert (=> b!1035300 (= e!585325 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124425 c!104873) b!1035298))

(assert (= (and d!124425 (not c!104873)) b!1035299))

(assert (= (and d!124425 (not res!691269)) b!1035300))

(declare-fun m!955629 () Bool)

(assert (=> d!124425 m!955629))

(declare-fun m!955631 () Bool)

(assert (=> b!1035298 m!955631))

(assert (=> b!1035298 m!955535))

(assert (=> b!1035298 m!955535))

(declare-fun m!955633 () Bool)

(assert (=> b!1035298 m!955633))

(assert (=> b!1035300 m!955535))

(assert (=> b!1035300 m!955535))

(assert (=> b!1035300 m!955633))

(assert (=> d!124387 d!124425))

(declare-fun b!1035301 () Bool)

(declare-fun e!585326 () Option!635)

(assert (=> b!1035301 (= e!585326 (Some!634 (_2!7874 (h!23099 lt!456911))))))

(declare-fun b!1035302 () Bool)

(declare-fun e!585327 () Option!635)

(assert (=> b!1035302 (= e!585326 e!585327)))

(declare-fun c!104875 () Bool)

(assert (=> b!1035302 (= c!104875 (and ((_ is Cons!21888) lt!456911) (not (= (_1!7874 (h!23099 lt!456911)) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))))

(declare-fun b!1035304 () Bool)

(assert (=> b!1035304 (= e!585327 None!633)))

(declare-fun b!1035303 () Bool)

(assert (=> b!1035303 (= e!585327 (getValueByKey!584 (t!31080 lt!456911) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun c!104874 () Bool)

(declare-fun d!124427 () Bool)

(assert (=> d!124427 (= c!104874 (and ((_ is Cons!21888) lt!456911) (= (_1!7874 (h!23099 lt!456911)) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124427 (= (getValueByKey!584 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) e!585326)))

(assert (= (and d!124427 c!104874) b!1035301))

(assert (= (and d!124427 (not c!104874)) b!1035302))

(assert (= (and b!1035302 c!104875) b!1035303))

(assert (= (and b!1035302 (not c!104875)) b!1035304))

(declare-fun m!955635 () Bool)

(assert (=> b!1035303 m!955635))

(assert (=> d!124387 d!124427))

(declare-fun d!124429 () Bool)

(assert (=> d!124429 (= (getValueByKey!584 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!456941 () Unit!33837)

(declare-fun choose!1703 (List!21892 (_ BitVec 64) V!37563) Unit!33837)

(assert (=> d!124429 (= lt!456941 (choose!1703 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun e!585330 () Bool)

(assert (=> d!124429 e!585330))

(declare-fun res!691274 () Bool)

(assert (=> d!124429 (=> (not res!691274) (not e!585330))))

(assert (=> d!124429 (= res!691274 (isStrictlySorted!706 lt!456911))))

(assert (=> d!124429 (= (lemmaContainsTupThenGetReturnValue!280 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456941)))

(declare-fun b!1035309 () Bool)

(declare-fun res!691275 () Bool)

(assert (=> b!1035309 (=> (not res!691275) (not e!585330))))

(assert (=> b!1035309 (= res!691275 (containsKey!565 lt!456911 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035310 () Bool)

(assert (=> b!1035310 (= e!585330 (contains!6038 lt!456911 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124429 res!691274) b!1035309))

(assert (= (and b!1035309 res!691275) b!1035310))

(assert (=> d!124429 m!955529))

(declare-fun m!955637 () Bool)

(assert (=> d!124429 m!955637))

(declare-fun m!955639 () Bool)

(assert (=> d!124429 m!955639))

(declare-fun m!955641 () Bool)

(assert (=> b!1035309 m!955641))

(declare-fun m!955643 () Bool)

(assert (=> b!1035310 m!955643))

(assert (=> d!124387 d!124429))

(declare-fun b!1035331 () Bool)

(declare-fun e!585341 () Bool)

(declare-fun lt!456944 () List!21892)

(assert (=> b!1035331 (= e!585341 (contains!6038 lt!456944 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(declare-fun call!43771 () List!21892)

(declare-fun c!104885 () Bool)

(declare-fun bm!43766 () Bool)

(declare-fun e!585345 () List!21892)

(assert (=> bm!43766 (= call!43771 ($colon$colon!603 e!585345 (ite c!104885 (h!23099 (toList!6896 lt!456726)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))))

(declare-fun c!104887 () Bool)

(assert (=> bm!43766 (= c!104887 c!104885)))

(declare-fun bm!43767 () Bool)

(declare-fun call!43769 () List!21892)

(declare-fun call!43770 () List!21892)

(assert (=> bm!43767 (= call!43769 call!43770)))

(declare-fun c!104886 () Bool)

(declare-fun c!104884 () Bool)

(declare-fun b!1035332 () Bool)

(assert (=> b!1035332 (= e!585345 (ite c!104886 (t!31080 (toList!6896 lt!456726)) (ite c!104884 (Cons!21888 (h!23099 (toList!6896 lt!456726)) (t!31080 (toList!6896 lt!456726))) Nil!21889)))))

(declare-fun b!1035333 () Bool)

(declare-fun res!691281 () Bool)

(assert (=> b!1035333 (=> (not res!691281) (not e!585341))))

(assert (=> b!1035333 (= res!691281 (containsKey!565 lt!456944 (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035334 () Bool)

(declare-fun e!585343 () List!21892)

(declare-fun e!585342 () List!21892)

(assert (=> b!1035334 (= e!585343 e!585342)))

(assert (=> b!1035334 (= c!104886 (and ((_ is Cons!21888) (toList!6896 lt!456726)) (= (_1!7874 (h!23099 (toList!6896 lt!456726))) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1035335 () Bool)

(assert (=> b!1035335 (= c!104884 (and ((_ is Cons!21888) (toList!6896 lt!456726)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456726))) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(declare-fun e!585344 () List!21892)

(assert (=> b!1035335 (= e!585342 e!585344)))

(declare-fun b!1035336 () Bool)

(assert (=> b!1035336 (= e!585345 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456726)) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035337 () Bool)

(assert (=> b!1035337 (= e!585344 call!43769)))

(declare-fun b!1035338 () Bool)

(assert (=> b!1035338 (= e!585344 call!43769)))

(declare-fun bm!43768 () Bool)

(assert (=> bm!43768 (= call!43770 call!43771)))

(declare-fun b!1035339 () Bool)

(assert (=> b!1035339 (= e!585343 call!43771)))

(declare-fun b!1035340 () Bool)

(assert (=> b!1035340 (= e!585342 call!43770)))

(declare-fun d!124431 () Bool)

(assert (=> d!124431 e!585341))

(declare-fun res!691280 () Bool)

(assert (=> d!124431 (=> (not res!691280) (not e!585341))))

(assert (=> d!124431 (= res!691280 (isStrictlySorted!706 lt!456944))))

(assert (=> d!124431 (= lt!456944 e!585343)))

(assert (=> d!124431 (= c!104885 (and ((_ is Cons!21888) (toList!6896 lt!456726)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456726))) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124431 (isStrictlySorted!706 (toList!6896 lt!456726))))

(assert (=> d!124431 (= (insertStrictlySorted!373 (toList!6896 lt!456726) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456944)))

(assert (= (and d!124431 c!104885) b!1035339))

(assert (= (and d!124431 (not c!104885)) b!1035334))

(assert (= (and b!1035334 c!104886) b!1035340))

(assert (= (and b!1035334 (not c!104886)) b!1035335))

(assert (= (and b!1035335 c!104884) b!1035337))

(assert (= (and b!1035335 (not c!104884)) b!1035338))

(assert (= (or b!1035337 b!1035338) bm!43767))

(assert (= (or b!1035340 bm!43767) bm!43768))

(assert (= (or b!1035339 bm!43768) bm!43766))

(assert (= (and bm!43766 c!104887) b!1035336))

(assert (= (and bm!43766 (not c!104887)) b!1035332))

(assert (= (and d!124431 res!691280) b!1035333))

(assert (= (and b!1035333 res!691281) b!1035331))

(declare-fun m!955645 () Bool)

(assert (=> b!1035336 m!955645))

(declare-fun m!955647 () Bool)

(assert (=> b!1035331 m!955647))

(declare-fun m!955649 () Bool)

(assert (=> bm!43766 m!955649))

(declare-fun m!955651 () Bool)

(assert (=> d!124431 m!955651))

(declare-fun m!955653 () Bool)

(assert (=> d!124431 m!955653))

(declare-fun m!955655 () Bool)

(assert (=> b!1035333 m!955655))

(assert (=> d!124387 d!124431))

(declare-fun b!1035341 () Bool)

(declare-fun e!585346 () Option!635)

(assert (=> b!1035341 (= e!585346 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456785)))))))

(declare-fun b!1035342 () Bool)

(declare-fun e!585347 () Option!635)

(assert (=> b!1035342 (= e!585346 e!585347)))

(declare-fun c!104889 () Bool)

(assert (=> b!1035342 (= c!104889 (and ((_ is Cons!21888) (toList!6896 lt!456785)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456785))) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))))

(declare-fun b!1035344 () Bool)

(assert (=> b!1035344 (= e!585347 None!633)))

(declare-fun b!1035343 () Bool)

(assert (=> b!1035343 (= e!585347 (getValueByKey!584 (t!31080 (toList!6896 lt!456785)) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun d!124433 () Bool)

(declare-fun c!104888 () Bool)

(assert (=> d!124433 (= c!104888 (and ((_ is Cons!21888) (toList!6896 lt!456785)) (= (_1!7874 (h!23099 (toList!6896 lt!456785))) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (=> d!124433 (= (getValueByKey!584 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631))) e!585346)))

(assert (= (and d!124433 c!104888) b!1035341))

(assert (= (and d!124433 (not c!104888)) b!1035342))

(assert (= (and b!1035342 c!104889) b!1035343))

(assert (= (and b!1035342 (not c!104889)) b!1035344))

(declare-fun m!955657 () Bool)

(assert (=> b!1035343 m!955657))

(assert (=> b!1035091 d!124433))

(declare-fun lt!456947 () Bool)

(declare-fun d!124435 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!515 (List!21892) (InoxSet tuple2!15726))

(assert (=> d!124435 (= lt!456947 (select (content!515 (toList!6896 lt!456913)) (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))

(declare-fun e!585352 () Bool)

(assert (=> d!124435 (= lt!456947 e!585352)))

(declare-fun res!691286 () Bool)

(assert (=> d!124435 (=> (not res!691286) (not e!585352))))

(assert (=> d!124435 (= res!691286 ((_ is Cons!21888) (toList!6896 lt!456913)))))

(assert (=> d!124435 (= (contains!6038 (toList!6896 lt!456913) (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456947)))

(declare-fun b!1035349 () Bool)

(declare-fun e!585353 () Bool)

(assert (=> b!1035349 (= e!585352 e!585353)))

(declare-fun res!691287 () Bool)

(assert (=> b!1035349 (=> res!691287 e!585353)))

(assert (=> b!1035349 (= res!691287 (= (h!23099 (toList!6896 lt!456913)) (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))

(declare-fun b!1035350 () Bool)

(assert (=> b!1035350 (= e!585353 (contains!6038 (t!31080 (toList!6896 lt!456913)) (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))

(assert (= (and d!124435 res!691286) b!1035349))

(assert (= (and b!1035349 (not res!691287)) b!1035350))

(declare-fun m!955659 () Bool)

(assert (=> d!124435 m!955659))

(declare-fun m!955661 () Bool)

(assert (=> d!124435 m!955661))

(declare-fun m!955663 () Bool)

(assert (=> b!1035350 m!955663))

(assert (=> b!1035264 d!124435))

(declare-fun d!124437 () Bool)

(declare-fun isEmpty!931 (Option!635) Bool)

(assert (=> d!124437 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30257 () Bool)

(assert (= bs!30257 d!124437))

(assert (=> bs!30257 m!955291))

(declare-fun m!955665 () Bool)

(assert (=> bs!30257 m!955665))

(assert (=> b!1035148 d!124437))

(declare-fun b!1035351 () Bool)

(declare-fun e!585354 () Option!635)

(assert (=> b!1035351 (= e!585354 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456716)))))))

(declare-fun b!1035352 () Bool)

(declare-fun e!585355 () Option!635)

(assert (=> b!1035352 (= e!585354 e!585355)))

(declare-fun c!104891 () Bool)

(assert (=> b!1035352 (= c!104891 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035354 () Bool)

(assert (=> b!1035354 (= e!585355 None!633)))

(declare-fun b!1035353 () Bool)

(assert (=> b!1035353 (= e!585355 (getValueByKey!584 (t!31080 (toList!6896 lt!456716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124439 () Bool)

(declare-fun c!104890 () Bool)

(assert (=> d!124439 (= c!104890 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124439 (= (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000) e!585354)))

(assert (= (and d!124439 c!104890) b!1035351))

(assert (= (and d!124439 (not c!104890)) b!1035352))

(assert (= (and b!1035352 c!104891) b!1035353))

(assert (= (and b!1035352 (not c!104891)) b!1035354))

(declare-fun m!955667 () Bool)

(assert (=> b!1035353 m!955667))

(assert (=> b!1035148 d!124439))

(declare-fun d!124441 () Bool)

(declare-fun e!585357 () Bool)

(assert (=> d!124441 e!585357))

(declare-fun res!691288 () Bool)

(assert (=> d!124441 (=> res!691288 e!585357)))

(declare-fun lt!456949 () Bool)

(assert (=> d!124441 (= res!691288 (not lt!456949))))

(declare-fun lt!456948 () Bool)

(assert (=> d!124441 (= lt!456949 lt!456948)))

(declare-fun lt!456951 () Unit!33837)

(declare-fun e!585356 () Unit!33837)

(assert (=> d!124441 (= lt!456951 e!585356)))

(declare-fun c!104892 () Bool)

(assert (=> d!124441 (= c!104892 lt!456948)))

(assert (=> d!124441 (= lt!456948 (containsKey!565 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(assert (=> d!124441 (= (contains!6037 lt!456807 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456949)))

(declare-fun b!1035355 () Bool)

(declare-fun lt!456950 () Unit!33837)

(assert (=> b!1035355 (= e!585356 lt!456950)))

(assert (=> b!1035355 (= lt!456950 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035355 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035356 () Bool)

(declare-fun Unit!33854 () Unit!33837)

(assert (=> b!1035356 (= e!585356 Unit!33854)))

(declare-fun b!1035357 () Bool)

(assert (=> b!1035357 (= e!585357 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124441 c!104892) b!1035355))

(assert (= (and d!124441 (not c!104892)) b!1035356))

(assert (= (and d!124441 (not res!691288)) b!1035357))

(declare-fun m!955669 () Bool)

(assert (=> d!124441 m!955669))

(declare-fun m!955671 () Bool)

(assert (=> b!1035355 m!955671))

(assert (=> b!1035355 m!955257))

(assert (=> b!1035355 m!955257))

(declare-fun m!955673 () Bool)

(assert (=> b!1035355 m!955673))

(assert (=> b!1035357 m!955257))

(assert (=> b!1035357 m!955257))

(assert (=> b!1035357 m!955673))

(assert (=> d!124319 d!124441))

(declare-fun b!1035358 () Bool)

(declare-fun e!585358 () Option!635)

(assert (=> b!1035358 (= e!585358 (Some!634 (_2!7874 (h!23099 lt!456809))))))

(declare-fun b!1035359 () Bool)

(declare-fun e!585359 () Option!635)

(assert (=> b!1035359 (= e!585358 e!585359)))

(declare-fun c!104894 () Bool)

(assert (=> b!1035359 (= c!104894 (and ((_ is Cons!21888) lt!456809) (not (= (_1!7874 (h!23099 lt!456809)) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035361 () Bool)

(assert (=> b!1035361 (= e!585359 None!633)))

(declare-fun b!1035360 () Bool)

(assert (=> b!1035360 (= e!585359 (getValueByKey!584 (t!31080 lt!456809) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun d!124443 () Bool)

(declare-fun c!104893 () Bool)

(assert (=> d!124443 (= c!104893 (and ((_ is Cons!21888) lt!456809) (= (_1!7874 (h!23099 lt!456809)) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(assert (=> d!124443 (= (getValueByKey!584 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) e!585358)))

(assert (= (and d!124443 c!104893) b!1035358))

(assert (= (and d!124443 (not c!104893)) b!1035359))

(assert (= (and b!1035359 c!104894) b!1035360))

(assert (= (and b!1035359 (not c!104894)) b!1035361))

(declare-fun m!955675 () Bool)

(assert (=> b!1035360 m!955675))

(assert (=> d!124319 d!124443))

(declare-fun d!124445 () Bool)

(assert (=> d!124445 (= (getValueByKey!584 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456952 () Unit!33837)

(assert (=> d!124445 (= lt!456952 (choose!1703 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun e!585360 () Bool)

(assert (=> d!124445 e!585360))

(declare-fun res!691289 () Bool)

(assert (=> d!124445 (=> (not res!691289) (not e!585360))))

(assert (=> d!124445 (= res!691289 (isStrictlySorted!706 lt!456809))))

(assert (=> d!124445 (= (lemmaContainsTupThenGetReturnValue!280 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456952)))

(declare-fun b!1035362 () Bool)

(declare-fun res!691290 () Bool)

(assert (=> b!1035362 (=> (not res!691290) (not e!585360))))

(assert (=> b!1035362 (= res!691290 (containsKey!565 lt!456809 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035363 () Bool)

(assert (=> b!1035363 (= e!585360 (contains!6038 lt!456809 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124445 res!691289) b!1035362))

(assert (= (and b!1035362 res!691290) b!1035363))

(assert (=> d!124445 m!955251))

(declare-fun m!955677 () Bool)

(assert (=> d!124445 m!955677))

(declare-fun m!955679 () Bool)

(assert (=> d!124445 m!955679))

(declare-fun m!955681 () Bool)

(assert (=> b!1035362 m!955681))

(declare-fun m!955683 () Bool)

(assert (=> b!1035363 m!955683))

(assert (=> d!124319 d!124445))

(declare-fun lt!456953 () List!21892)

(declare-fun e!585361 () Bool)

(declare-fun b!1035364 () Bool)

(assert (=> b!1035364 (= e!585361 (contains!6038 lt!456953 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(declare-fun e!585365 () List!21892)

(declare-fun bm!43769 () Bool)

(declare-fun call!43774 () List!21892)

(declare-fun c!104896 () Bool)

(assert (=> bm!43769 (= call!43774 ($colon$colon!603 e!585365 (ite c!104896 (h!23099 (toList!6896 lt!456708)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104898 () Bool)

(assert (=> bm!43769 (= c!104898 c!104896)))

(declare-fun bm!43770 () Bool)

(declare-fun call!43772 () List!21892)

(declare-fun call!43773 () List!21892)

(assert (=> bm!43770 (= call!43772 call!43773)))

(declare-fun c!104895 () Bool)

(declare-fun c!104897 () Bool)

(declare-fun b!1035365 () Bool)

(assert (=> b!1035365 (= e!585365 (ite c!104897 (t!31080 (toList!6896 lt!456708)) (ite c!104895 (Cons!21888 (h!23099 (toList!6896 lt!456708)) (t!31080 (toList!6896 lt!456708))) Nil!21889)))))

(declare-fun b!1035366 () Bool)

(declare-fun res!691292 () Bool)

(assert (=> b!1035366 (=> (not res!691292) (not e!585361))))

(assert (=> b!1035366 (= res!691292 (containsKey!565 lt!456953 (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035367 () Bool)

(declare-fun e!585363 () List!21892)

(declare-fun e!585362 () List!21892)

(assert (=> b!1035367 (= e!585363 e!585362)))

(assert (=> b!1035367 (= c!104897 (and ((_ is Cons!21888) (toList!6896 lt!456708)) (= (_1!7874 (h!23099 (toList!6896 lt!456708))) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035368 () Bool)

(assert (=> b!1035368 (= c!104895 (and ((_ is Cons!21888) (toList!6896 lt!456708)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456708))) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(declare-fun e!585364 () List!21892)

(assert (=> b!1035368 (= e!585362 e!585364)))

(declare-fun b!1035369 () Bool)

(assert (=> b!1035369 (= e!585365 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456708)) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035370 () Bool)

(assert (=> b!1035370 (= e!585364 call!43772)))

(declare-fun b!1035371 () Bool)

(assert (=> b!1035371 (= e!585364 call!43772)))

(declare-fun bm!43771 () Bool)

(assert (=> bm!43771 (= call!43773 call!43774)))

(declare-fun b!1035372 () Bool)

(assert (=> b!1035372 (= e!585363 call!43774)))

(declare-fun b!1035373 () Bool)

(assert (=> b!1035373 (= e!585362 call!43773)))

(declare-fun d!124447 () Bool)

(assert (=> d!124447 e!585361))

(declare-fun res!691291 () Bool)

(assert (=> d!124447 (=> (not res!691291) (not e!585361))))

(assert (=> d!124447 (= res!691291 (isStrictlySorted!706 lt!456953))))

(assert (=> d!124447 (= lt!456953 e!585363)))

(assert (=> d!124447 (= c!104896 (and ((_ is Cons!21888) (toList!6896 lt!456708)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456708))) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(assert (=> d!124447 (isStrictlySorted!706 (toList!6896 lt!456708))))

(assert (=> d!124447 (= (insertStrictlySorted!373 (toList!6896 lt!456708) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) lt!456953)))

(assert (= (and d!124447 c!104896) b!1035372))

(assert (= (and d!124447 (not c!104896)) b!1035367))

(assert (= (and b!1035367 c!104897) b!1035373))

(assert (= (and b!1035367 (not c!104897)) b!1035368))

(assert (= (and b!1035368 c!104895) b!1035370))

(assert (= (and b!1035368 (not c!104895)) b!1035371))

(assert (= (or b!1035370 b!1035371) bm!43770))

(assert (= (or b!1035373 bm!43770) bm!43771))

(assert (= (or b!1035372 bm!43771) bm!43769))

(assert (= (and bm!43769 c!104898) b!1035369))

(assert (= (and bm!43769 (not c!104898)) b!1035365))

(assert (= (and d!124447 res!691291) b!1035366))

(assert (= (and b!1035366 res!691292) b!1035364))

(declare-fun m!955685 () Bool)

(assert (=> b!1035369 m!955685))

(declare-fun m!955687 () Bool)

(assert (=> b!1035364 m!955687))

(declare-fun m!955689 () Bool)

(assert (=> bm!43769 m!955689))

(declare-fun m!955691 () Bool)

(assert (=> d!124447 m!955691))

(declare-fun m!955693 () Bool)

(assert (=> d!124447 m!955693))

(declare-fun m!955695 () Bool)

(assert (=> b!1035366 m!955695))

(assert (=> d!124319 d!124447))

(assert (=> b!1035078 d!124323))

(declare-fun d!124449 () Bool)

(declare-fun e!585367 () Bool)

(assert (=> d!124449 e!585367))

(declare-fun res!691293 () Bool)

(assert (=> d!124449 (=> res!691293 e!585367)))

(declare-fun lt!456955 () Bool)

(assert (=> d!124449 (= res!691293 (not lt!456955))))

(declare-fun lt!456954 () Bool)

(assert (=> d!124449 (= lt!456955 lt!456954)))

(declare-fun lt!456957 () Unit!33837)

(declare-fun e!585366 () Unit!33837)

(assert (=> d!124449 (= lt!456957 e!585366)))

(declare-fun c!104899 () Bool)

(assert (=> d!124449 (= c!104899 lt!456954)))

(assert (=> d!124449 (= lt!456954 (containsKey!565 (toList!6896 lt!456767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124449 (= (contains!6037 lt!456767 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456955)))

(declare-fun b!1035374 () Bool)

(declare-fun lt!456956 () Unit!33837)

(assert (=> b!1035374 (= e!585366 lt!456956)))

(assert (=> b!1035374 (= lt!456956 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035374 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035375 () Bool)

(declare-fun Unit!33855 () Unit!33837)

(assert (=> b!1035375 (= e!585366 Unit!33855)))

(declare-fun b!1035376 () Bool)

(assert (=> b!1035376 (= e!585367 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124449 c!104899) b!1035374))

(assert (= (and d!124449 (not c!104899)) b!1035375))

(assert (= (and d!124449 (not res!691293)) b!1035376))

(declare-fun m!955697 () Bool)

(assert (=> d!124449 m!955697))

(declare-fun m!955699 () Bool)

(assert (=> b!1035374 m!955699))

(declare-fun m!955701 () Bool)

(assert (=> b!1035374 m!955701))

(assert (=> b!1035374 m!955701))

(declare-fun m!955703 () Bool)

(assert (=> b!1035374 m!955703))

(assert (=> b!1035376 m!955701))

(assert (=> b!1035376 m!955701))

(assert (=> b!1035376 m!955703))

(assert (=> d!124291 d!124449))

(assert (=> d!124291 d!124351))

(assert (=> b!1035220 d!124323))

(declare-fun d!124451 () Bool)

(declare-fun e!585369 () Bool)

(assert (=> d!124451 e!585369))

(declare-fun res!691294 () Bool)

(assert (=> d!124451 (=> res!691294 e!585369)))

(declare-fun lt!456959 () Bool)

(assert (=> d!124451 (= res!691294 (not lt!456959))))

(declare-fun lt!456958 () Bool)

(assert (=> d!124451 (= lt!456959 lt!456958)))

(declare-fun lt!456961 () Unit!33837)

(declare-fun e!585368 () Unit!33837)

(assert (=> d!124451 (= lt!456961 e!585368)))

(declare-fun c!104900 () Bool)

(assert (=> d!124451 (= c!104900 lt!456958)))

(assert (=> d!124451 (= lt!456958 (containsKey!565 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(assert (=> d!124451 (= (contains!6037 lt!456785 (_1!7874 (tuple2!15727 lt!456717 lt!456631))) lt!456959)))

(declare-fun b!1035377 () Bool)

(declare-fun lt!456960 () Unit!33837)

(assert (=> b!1035377 (= e!585368 lt!456960)))

(assert (=> b!1035377 (= lt!456960 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(assert (=> b!1035377 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun b!1035378 () Bool)

(declare-fun Unit!33856 () Unit!33837)

(assert (=> b!1035378 (= e!585368 Unit!33856)))

(declare-fun b!1035379 () Bool)

(assert (=> b!1035379 (= e!585369 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456785) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (= (and d!124451 c!104900) b!1035377))

(assert (= (and d!124451 (not c!104900)) b!1035378))

(assert (= (and d!124451 (not res!691294)) b!1035379))

(declare-fun m!955705 () Bool)

(assert (=> d!124451 m!955705))

(declare-fun m!955707 () Bool)

(assert (=> b!1035377 m!955707))

(assert (=> b!1035377 m!955205))

(assert (=> b!1035377 m!955205))

(declare-fun m!955709 () Bool)

(assert (=> b!1035377 m!955709))

(assert (=> b!1035379 m!955205))

(assert (=> b!1035379 m!955205))

(assert (=> b!1035379 m!955709))

(assert (=> d!124303 d!124451))

(declare-fun b!1035380 () Bool)

(declare-fun e!585370 () Option!635)

(assert (=> b!1035380 (= e!585370 (Some!634 (_2!7874 (h!23099 lt!456787))))))

(declare-fun b!1035381 () Bool)

(declare-fun e!585371 () Option!635)

(assert (=> b!1035381 (= e!585370 e!585371)))

(declare-fun c!104902 () Bool)

(assert (=> b!1035381 (= c!104902 (and ((_ is Cons!21888) lt!456787) (not (= (_1!7874 (h!23099 lt!456787)) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))))

(declare-fun b!1035383 () Bool)

(assert (=> b!1035383 (= e!585371 None!633)))

(declare-fun b!1035382 () Bool)

(assert (=> b!1035382 (= e!585371 (getValueByKey!584 (t!31080 lt!456787) (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun c!104901 () Bool)

(declare-fun d!124453 () Bool)

(assert (=> d!124453 (= c!104901 (and ((_ is Cons!21888) lt!456787) (= (_1!7874 (h!23099 lt!456787)) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (=> d!124453 (= (getValueByKey!584 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631))) e!585370)))

(assert (= (and d!124453 c!104901) b!1035380))

(assert (= (and d!124453 (not c!104901)) b!1035381))

(assert (= (and b!1035381 c!104902) b!1035382))

(assert (= (and b!1035381 (not c!104902)) b!1035383))

(declare-fun m!955711 () Bool)

(assert (=> b!1035382 m!955711))

(assert (=> d!124303 d!124453))

(declare-fun d!124455 () Bool)

(assert (=> d!124455 (= (getValueByKey!584 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun lt!456962 () Unit!33837)

(assert (=> d!124455 (= lt!456962 (choose!1703 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun e!585372 () Bool)

(assert (=> d!124455 e!585372))

(declare-fun res!691295 () Bool)

(assert (=> d!124455 (=> (not res!691295) (not e!585372))))

(assert (=> d!124455 (= res!691295 (isStrictlySorted!706 lt!456787))))

(assert (=> d!124455 (= (lemmaContainsTupThenGetReturnValue!280 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))) lt!456962)))

(declare-fun b!1035384 () Bool)

(declare-fun res!691296 () Bool)

(assert (=> b!1035384 (=> (not res!691296) (not e!585372))))

(assert (=> b!1035384 (= res!691296 (containsKey!565 lt!456787 (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun b!1035385 () Bool)

(assert (=> b!1035385 (= e!585372 (contains!6038 lt!456787 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (= (and d!124455 res!691295) b!1035384))

(assert (= (and b!1035384 res!691296) b!1035385))

(assert (=> d!124455 m!955199))

(declare-fun m!955713 () Bool)

(assert (=> d!124455 m!955713))

(declare-fun m!955715 () Bool)

(assert (=> d!124455 m!955715))

(declare-fun m!955717 () Bool)

(assert (=> b!1035384 m!955717))

(declare-fun m!955719 () Bool)

(assert (=> b!1035385 m!955719))

(assert (=> d!124303 d!124455))

(declare-fun lt!456963 () List!21892)

(declare-fun b!1035386 () Bool)

(declare-fun e!585373 () Bool)

(assert (=> b!1035386 (= e!585373 (contains!6038 lt!456963 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(declare-fun bm!43772 () Bool)

(declare-fun call!43777 () List!21892)

(declare-fun c!104904 () Bool)

(declare-fun e!585377 () List!21892)

(assert (=> bm!43772 (= call!43777 ($colon$colon!603 e!585377 (ite c!104904 (h!23099 (toList!6896 lt!456700)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))))

(declare-fun c!104906 () Bool)

(assert (=> bm!43772 (= c!104906 c!104904)))

(declare-fun bm!43773 () Bool)

(declare-fun call!43775 () List!21892)

(declare-fun call!43776 () List!21892)

(assert (=> bm!43773 (= call!43775 call!43776)))

(declare-fun c!104905 () Bool)

(declare-fun c!104903 () Bool)

(declare-fun b!1035387 () Bool)

(assert (=> b!1035387 (= e!585377 (ite c!104905 (t!31080 (toList!6896 lt!456700)) (ite c!104903 (Cons!21888 (h!23099 (toList!6896 lt!456700)) (t!31080 (toList!6896 lt!456700))) Nil!21889)))))

(declare-fun b!1035388 () Bool)

(declare-fun res!691298 () Bool)

(assert (=> b!1035388 (=> (not res!691298) (not e!585373))))

(assert (=> b!1035388 (= res!691298 (containsKey!565 lt!456963 (_1!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun b!1035389 () Bool)

(declare-fun e!585375 () List!21892)

(declare-fun e!585374 () List!21892)

(assert (=> b!1035389 (= e!585375 e!585374)))

(assert (=> b!1035389 (= c!104905 (and ((_ is Cons!21888) (toList!6896 lt!456700)) (= (_1!7874 (h!23099 (toList!6896 lt!456700))) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(declare-fun b!1035390 () Bool)

(assert (=> b!1035390 (= c!104903 (and ((_ is Cons!21888) (toList!6896 lt!456700)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456700))) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(declare-fun e!585376 () List!21892)

(assert (=> b!1035390 (= e!585374 e!585376)))

(declare-fun b!1035391 () Bool)

(assert (=> b!1035391 (= e!585377 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456700)) (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))))))

(declare-fun b!1035392 () Bool)

(assert (=> b!1035392 (= e!585376 call!43775)))

(declare-fun b!1035393 () Bool)

(assert (=> b!1035393 (= e!585376 call!43775)))

(declare-fun bm!43774 () Bool)

(assert (=> bm!43774 (= call!43776 call!43777)))

(declare-fun b!1035394 () Bool)

(assert (=> b!1035394 (= e!585375 call!43777)))

(declare-fun b!1035395 () Bool)

(assert (=> b!1035395 (= e!585374 call!43776)))

(declare-fun d!124457 () Bool)

(assert (=> d!124457 e!585373))

(declare-fun res!691297 () Bool)

(assert (=> d!124457 (=> (not res!691297) (not e!585373))))

(assert (=> d!124457 (= res!691297 (isStrictlySorted!706 lt!456963))))

(assert (=> d!124457 (= lt!456963 e!585375)))

(assert (=> d!124457 (= c!104904 (and ((_ is Cons!21888) (toList!6896 lt!456700)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456700))) (_1!7874 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (=> d!124457 (isStrictlySorted!706 (toList!6896 lt!456700))))

(assert (=> d!124457 (= (insertStrictlySorted!373 (toList!6896 lt!456700) (_1!7874 (tuple2!15727 lt!456717 lt!456631)) (_2!7874 (tuple2!15727 lt!456717 lt!456631))) lt!456963)))

(assert (= (and d!124457 c!104904) b!1035394))

(assert (= (and d!124457 (not c!104904)) b!1035389))

(assert (= (and b!1035389 c!104905) b!1035395))

(assert (= (and b!1035389 (not c!104905)) b!1035390))

(assert (= (and b!1035390 c!104903) b!1035392))

(assert (= (and b!1035390 (not c!104903)) b!1035393))

(assert (= (or b!1035392 b!1035393) bm!43773))

(assert (= (or b!1035395 bm!43773) bm!43774))

(assert (= (or b!1035394 bm!43774) bm!43772))

(assert (= (and bm!43772 c!104906) b!1035391))

(assert (= (and bm!43772 (not c!104906)) b!1035387))

(assert (= (and d!124457 res!691297) b!1035388))

(assert (= (and b!1035388 res!691298) b!1035386))

(declare-fun m!955721 () Bool)

(assert (=> b!1035391 m!955721))

(declare-fun m!955723 () Bool)

(assert (=> b!1035386 m!955723))

(declare-fun m!955725 () Bool)

(assert (=> bm!43772 m!955725))

(declare-fun m!955727 () Bool)

(assert (=> d!124457 m!955727))

(declare-fun m!955729 () Bool)

(assert (=> d!124457 m!955729))

(declare-fun m!955731 () Bool)

(assert (=> b!1035388 m!955731))

(assert (=> d!124303 d!124457))

(assert (=> b!1035189 d!124323))

(declare-fun b!1035396 () Bool)

(declare-fun e!585380 () Bool)

(declare-fun call!43778 () Bool)

(assert (=> b!1035396 (= e!585380 call!43778)))

(declare-fun d!124459 () Bool)

(declare-fun res!691300 () Bool)

(declare-fun e!585379 () Bool)

(assert (=> d!124459 (=> res!691300 e!585379)))

(assert (=> d!124459 (= res!691300 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124459 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)) e!585379)))

(declare-fun bm!43775 () Bool)

(assert (=> bm!43775 (= call!43778 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)))))

(declare-fun b!1035397 () Bool)

(assert (=> b!1035397 (= e!585379 e!585380)))

(declare-fun c!104907 () Bool)

(assert (=> b!1035397 (= c!104907 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035398 () Bool)

(declare-fun e!585378 () Bool)

(assert (=> b!1035398 (= e!585378 call!43778)))

(declare-fun b!1035399 () Bool)

(assert (=> b!1035399 (= e!585380 e!585378)))

(declare-fun lt!456966 () (_ BitVec 64))

(assert (=> b!1035399 (= lt!456966 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!456965 () Unit!33837)

(assert (=> b!1035399 (= lt!456965 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 thiss!1427) lt!456966 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1035399 (arrayContainsKey!0 (_keys!11444 thiss!1427) lt!456966 #b00000000000000000000000000000000)))

(declare-fun lt!456964 () Unit!33837)

(assert (=> b!1035399 (= lt!456964 lt!456965)))

(declare-fun res!691299 () Bool)

(assert (=> b!1035399 (= res!691299 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)) (Found!9695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035399 (=> (not res!691299) (not e!585378))))

(assert (= (and d!124459 (not res!691300)) b!1035397))

(assert (= (and b!1035397 c!104907) b!1035399))

(assert (= (and b!1035397 (not c!104907)) b!1035396))

(assert (= (and b!1035399 res!691299) b!1035398))

(assert (= (or b!1035398 b!1035396) bm!43775))

(declare-fun m!955733 () Bool)

(assert (=> bm!43775 m!955733))

(declare-fun m!955735 () Bool)

(assert (=> b!1035397 m!955735))

(assert (=> b!1035397 m!955735))

(declare-fun m!955737 () Bool)

(assert (=> b!1035397 m!955737))

(assert (=> b!1035399 m!955735))

(declare-fun m!955739 () Bool)

(assert (=> b!1035399 m!955739))

(declare-fun m!955741 () Bool)

(assert (=> b!1035399 m!955741))

(assert (=> b!1035399 m!955735))

(declare-fun m!955743 () Bool)

(assert (=> b!1035399 m!955743))

(assert (=> bm!43749 d!124459))

(declare-fun b!1035400 () Bool)

(declare-fun e!585381 () Option!635)

(assert (=> b!1035400 (= e!585381 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456887)))))))

(declare-fun b!1035401 () Bool)

(declare-fun e!585382 () Option!635)

(assert (=> b!1035401 (= e!585381 e!585382)))

(declare-fun c!104909 () Bool)

(assert (=> b!1035401 (= c!104909 (and ((_ is Cons!21888) (toList!6896 lt!456887)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456887))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035403 () Bool)

(assert (=> b!1035403 (= e!585382 None!633)))

(declare-fun b!1035402 () Bool)

(assert (=> b!1035402 (= e!585382 (getValueByKey!584 (t!31080 (toList!6896 lt!456887)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124461 () Bool)

(declare-fun c!104908 () Bool)

(assert (=> d!124461 (= c!104908 (and ((_ is Cons!21888) (toList!6896 lt!456887)) (= (_1!7874 (h!23099 (toList!6896 lt!456887))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124461 (= (getValueByKey!584 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!585381)))

(assert (= (and d!124461 c!104908) b!1035400))

(assert (= (and d!124461 (not c!104908)) b!1035401))

(assert (= (and b!1035401 c!104909) b!1035402))

(assert (= (and b!1035401 (not c!104909)) b!1035403))

(declare-fun m!955745 () Bool)

(assert (=> b!1035402 m!955745))

(assert (=> b!1035241 d!124461))

(declare-fun d!124463 () Bool)

(assert (=> d!124463 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456969 () Unit!33837)

(declare-fun choose!1704 (List!21892 (_ BitVec 64)) Unit!33837)

(assert (=> d!124463 (= lt!456969 (choose!1704 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!585385 () Bool)

(assert (=> d!124463 e!585385))

(declare-fun res!691303 () Bool)

(assert (=> d!124463 (=> (not res!691303) (not e!585385))))

(assert (=> d!124463 (= res!691303 (isStrictlySorted!706 (toList!6896 lt!456716)))))

(assert (=> d!124463 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456969)))

(declare-fun b!1035406 () Bool)

(assert (=> b!1035406 (= e!585385 (containsKey!565 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124463 res!691303) b!1035406))

(assert (=> d!124463 m!955325))

(assert (=> d!124463 m!955325))

(assert (=> d!124463 m!955327))

(declare-fun m!955747 () Bool)

(assert (=> d!124463 m!955747))

(declare-fun m!955749 () Bool)

(assert (=> d!124463 m!955749))

(assert (=> b!1035406 m!955321))

(assert (=> b!1035149 d!124463))

(declare-fun d!124465 () Bool)

(assert (=> d!124465 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30258 () Bool)

(assert (= bs!30258 d!124465))

(assert (=> bs!30258 m!955325))

(declare-fun m!955751 () Bool)

(assert (=> bs!30258 m!955751))

(assert (=> b!1035149 d!124465))

(declare-fun b!1035407 () Bool)

(declare-fun e!585386 () Option!635)

(assert (=> b!1035407 (= e!585386 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456716)))))))

(declare-fun b!1035408 () Bool)

(declare-fun e!585387 () Option!635)

(assert (=> b!1035408 (= e!585386 e!585387)))

(declare-fun c!104911 () Bool)

(assert (=> b!1035408 (= c!104911 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035410 () Bool)

(assert (=> b!1035410 (= e!585387 None!633)))

(declare-fun b!1035409 () Bool)

(assert (=> b!1035409 (= e!585387 (getValueByKey!584 (t!31080 (toList!6896 lt!456716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124467 () Bool)

(declare-fun c!104910 () Bool)

(assert (=> d!124467 (= c!104910 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124467 (= (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000) e!585386)))

(assert (= (and d!124467 c!104910) b!1035407))

(assert (= (and d!124467 (not c!104910)) b!1035408))

(assert (= (and b!1035408 c!104911) b!1035409))

(assert (= (and b!1035408 (not c!104911)) b!1035410))

(declare-fun m!955753 () Bool)

(assert (=> b!1035409 m!955753))

(assert (=> b!1035149 d!124467))

(declare-fun d!124469 () Bool)

(assert (=> d!124469 (= (validMask!0 (mask!30143 lt!456630)) (and (or (= (mask!30143 lt!456630) #b00000000000000000000000000000111) (= (mask!30143 lt!456630) #b00000000000000000000000000001111) (= (mask!30143 lt!456630) #b00000000000000000000000000011111) (= (mask!30143 lt!456630) #b00000000000000000000000000111111) (= (mask!30143 lt!456630) #b00000000000000000000000001111111) (= (mask!30143 lt!456630) #b00000000000000000000000011111111) (= (mask!30143 lt!456630) #b00000000000000000000000111111111) (= (mask!30143 lt!456630) #b00000000000000000000001111111111) (= (mask!30143 lt!456630) #b00000000000000000000011111111111) (= (mask!30143 lt!456630) #b00000000000000000000111111111111) (= (mask!30143 lt!456630) #b00000000000000000001111111111111) (= (mask!30143 lt!456630) #b00000000000000000011111111111111) (= (mask!30143 lt!456630) #b00000000000000000111111111111111) (= (mask!30143 lt!456630) #b00000000000000001111111111111111) (= (mask!30143 lt!456630) #b00000000000000011111111111111111) (= (mask!30143 lt!456630) #b00000000000000111111111111111111) (= (mask!30143 lt!456630) #b00000000000001111111111111111111) (= (mask!30143 lt!456630) #b00000000000011111111111111111111) (= (mask!30143 lt!456630) #b00000000000111111111111111111111) (= (mask!30143 lt!456630) #b00000000001111111111111111111111) (= (mask!30143 lt!456630) #b00000000011111111111111111111111) (= (mask!30143 lt!456630) #b00000000111111111111111111111111) (= (mask!30143 lt!456630) #b00000001111111111111111111111111) (= (mask!30143 lt!456630) #b00000011111111111111111111111111) (= (mask!30143 lt!456630) #b00000111111111111111111111111111) (= (mask!30143 lt!456630) #b00001111111111111111111111111111) (= (mask!30143 lt!456630) #b00011111111111111111111111111111) (= (mask!30143 lt!456630) #b00111111111111111111111111111111)) (bvsle (mask!30143 lt!456630) #b00111111111111111111111111111111)))))

(assert (=> d!124365 d!124469))

(declare-fun b!1035411 () Bool)

(declare-fun res!691306 () Bool)

(declare-fun e!585394 () Bool)

(assert (=> b!1035411 (=> (not res!691306) (not e!585394))))

(declare-fun lt!456975 () ListLongMap!13761)

(assert (=> b!1035411 (= res!691306 (not (contains!6037 lt!456975 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035412 () Bool)

(declare-fun e!585391 () Bool)

(assert (=> b!1035412 (= e!585391 (isEmpty!930 lt!456975))))

(declare-fun b!1035413 () Bool)

(assert (=> b!1035413 (= e!585391 (= lt!456975 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1035415 () Bool)

(declare-fun lt!456973 () Unit!33837)

(declare-fun lt!456971 () Unit!33837)

(assert (=> b!1035415 (= lt!456973 lt!456971)))

(declare-fun lt!456974 () V!37563)

(declare-fun lt!456970 () (_ BitVec 64))

(declare-fun lt!456976 () ListLongMap!13761)

(declare-fun lt!456972 () (_ BitVec 64))

(assert (=> b!1035415 (not (contains!6037 (+!3126 lt!456976 (tuple2!15727 lt!456970 lt!456974)) lt!456972))))

(assert (=> b!1035415 (= lt!456971 (addStillNotContains!244 lt!456976 lt!456970 lt!456974 lt!456972))))

(assert (=> b!1035415 (= lt!456972 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035415 (= lt!456974 (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035415 (= lt!456970 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!43779 () ListLongMap!13761)

(assert (=> b!1035415 (= lt!456976 call!43779)))

(declare-fun e!585392 () ListLongMap!13761)

(assert (=> b!1035415 (= e!585392 (+!3126 call!43779 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035416 () Bool)

(assert (=> b!1035416 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> b!1035416 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31893 (_values!6249 thiss!1427))))))

(declare-fun e!585388 () Bool)

(assert (=> b!1035416 (= e!585388 (= (apply!915 lt!456975 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035417 () Bool)

(declare-fun e!585389 () Bool)

(assert (=> b!1035417 (= e!585389 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035417 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1035418 () Bool)

(declare-fun e!585393 () ListLongMap!13761)

(assert (=> b!1035418 (= e!585393 (ListLongMap!13762 Nil!21889))))

(declare-fun b!1035419 () Bool)

(declare-fun e!585390 () Bool)

(assert (=> b!1035419 (= e!585394 e!585390)))

(declare-fun c!104913 () Bool)

(assert (=> b!1035419 (= c!104913 e!585389)))

(declare-fun res!691305 () Bool)

(assert (=> b!1035419 (=> (not res!691305) (not e!585389))))

(assert (=> b!1035419 (= res!691305 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035420 () Bool)

(assert (=> b!1035420 (= e!585392 call!43779)))

(declare-fun b!1035421 () Bool)

(assert (=> b!1035421 (= e!585390 e!585388)))

(assert (=> b!1035421 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun res!691307 () Bool)

(assert (=> b!1035421 (= res!691307 (contains!6037 lt!456975 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035421 (=> (not res!691307) (not e!585388))))

(declare-fun b!1035414 () Bool)

(assert (=> b!1035414 (= e!585393 e!585392)))

(declare-fun c!104915 () Bool)

(assert (=> b!1035414 (= c!104915 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124471 () Bool)

(assert (=> d!124471 e!585394))

(declare-fun res!691304 () Bool)

(assert (=> d!124471 (=> (not res!691304) (not e!585394))))

(assert (=> d!124471 (= res!691304 (not (contains!6037 lt!456975 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124471 (= lt!456975 e!585393)))

(declare-fun c!104914 () Bool)

(assert (=> d!124471 (= c!104914 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124471 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124471 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)) lt!456975)))

(declare-fun b!1035422 () Bool)

(assert (=> b!1035422 (= e!585390 e!585391)))

(declare-fun c!104912 () Bool)

(assert (=> b!1035422 (= c!104912 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun bm!43776 () Bool)

(assert (=> bm!43776 (= call!43779 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (bvand (extraKeys!5958 thiss!1427) #b00000000000000000000000000000010) lt!456631 (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(assert (= (and d!124471 c!104914) b!1035418))

(assert (= (and d!124471 (not c!104914)) b!1035414))

(assert (= (and b!1035414 c!104915) b!1035415))

(assert (= (and b!1035414 (not c!104915)) b!1035420))

(assert (= (or b!1035415 b!1035420) bm!43776))

(assert (= (and d!124471 res!691304) b!1035411))

(assert (= (and b!1035411 res!691306) b!1035419))

(assert (= (and b!1035419 res!691305) b!1035417))

(assert (= (and b!1035419 c!104913) b!1035421))

(assert (= (and b!1035419 (not c!104913)) b!1035422))

(assert (= (and b!1035421 res!691307) b!1035416))

(assert (= (and b!1035422 c!104912) b!1035413))

(assert (= (and b!1035422 (not c!104912)) b!1035412))

(declare-fun b_lambda!16089 () Bool)

(assert (=> (not b_lambda!16089) (not b!1035415)))

(assert (=> b!1035415 t!31079))

(declare-fun b_and!33301 () Bool)

(assert (= b_and!33299 (and (=> t!31079 result!14375) b_and!33301)))

(declare-fun b_lambda!16091 () Bool)

(assert (=> (not b_lambda!16091) (not b!1035416)))

(assert (=> b!1035416 t!31079))

(declare-fun b_and!33303 () Bool)

(assert (= b_and!33301 (and (=> t!31079 result!14375) b_and!33303)))

(assert (=> b!1035416 m!955735))

(declare-fun m!955755 () Bool)

(assert (=> b!1035416 m!955755))

(declare-fun m!955757 () Bool)

(assert (=> b!1035416 m!955757))

(assert (=> b!1035416 m!954937))

(declare-fun m!955759 () Bool)

(assert (=> b!1035416 m!955759))

(assert (=> b!1035416 m!954937))

(assert (=> b!1035416 m!955757))

(assert (=> b!1035416 m!955735))

(declare-fun m!955761 () Bool)

(assert (=> b!1035415 m!955761))

(declare-fun m!955763 () Bool)

(assert (=> b!1035415 m!955763))

(declare-fun m!955765 () Bool)

(assert (=> b!1035415 m!955765))

(assert (=> b!1035415 m!955757))

(assert (=> b!1035415 m!954937))

(assert (=> b!1035415 m!955759))

(assert (=> b!1035415 m!954937))

(assert (=> b!1035415 m!955757))

(assert (=> b!1035415 m!955761))

(declare-fun m!955767 () Bool)

(assert (=> b!1035415 m!955767))

(assert (=> b!1035415 m!955735))

(declare-fun m!955769 () Bool)

(assert (=> bm!43776 m!955769))

(assert (=> b!1035414 m!955735))

(assert (=> b!1035414 m!955735))

(assert (=> b!1035414 m!955737))

(declare-fun m!955771 () Bool)

(assert (=> b!1035412 m!955771))

(assert (=> b!1035421 m!955735))

(assert (=> b!1035421 m!955735))

(declare-fun m!955773 () Bool)

(assert (=> b!1035421 m!955773))

(assert (=> b!1035413 m!955769))

(assert (=> b!1035417 m!955735))

(assert (=> b!1035417 m!955735))

(assert (=> b!1035417 m!955737))

(declare-fun m!955775 () Bool)

(assert (=> b!1035411 m!955775))

(declare-fun m!955777 () Bool)

(assert (=> d!124471 m!955777))

(assert (=> d!124471 m!955047))

(assert (=> b!1035074 d!124471))

(declare-fun d!124473 () Bool)

(assert (=> d!124473 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456652) key!909)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456652) key!909))))))

(declare-fun bs!30259 () Bool)

(assert (= bs!30259 d!124473))

(assert (=> bs!30259 m!955341))

(declare-fun m!955779 () Bool)

(assert (=> bs!30259 m!955779))

(assert (=> b!1035169 d!124473))

(declare-fun b!1035423 () Bool)

(declare-fun e!585395 () Option!635)

(assert (=> b!1035423 (= e!585395 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456652)))))))

(declare-fun b!1035424 () Bool)

(declare-fun e!585396 () Option!635)

(assert (=> b!1035424 (= e!585395 e!585396)))

(declare-fun c!104917 () Bool)

(assert (=> b!1035424 (= c!104917 (and ((_ is Cons!21888) (toList!6896 lt!456652)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456652))) key!909))))))

(declare-fun b!1035426 () Bool)

(assert (=> b!1035426 (= e!585396 None!633)))

(declare-fun b!1035425 () Bool)

(assert (=> b!1035425 (= e!585396 (getValueByKey!584 (t!31080 (toList!6896 lt!456652)) key!909))))

(declare-fun d!124475 () Bool)

(declare-fun c!104916 () Bool)

(assert (=> d!124475 (= c!104916 (and ((_ is Cons!21888) (toList!6896 lt!456652)) (= (_1!7874 (h!23099 (toList!6896 lt!456652))) key!909)))))

(assert (=> d!124475 (= (getValueByKey!584 (toList!6896 lt!456652) key!909) e!585395)))

(assert (= (and d!124475 c!104916) b!1035423))

(assert (= (and d!124475 (not c!104916)) b!1035424))

(assert (= (and b!1035424 c!104917) b!1035425))

(assert (= (and b!1035424 (not c!104917)) b!1035426))

(declare-fun m!955781 () Bool)

(assert (=> b!1035425 m!955781))

(assert (=> b!1035169 d!124475))

(declare-fun lt!456977 () Bool)

(declare-fun d!124477 () Bool)

(assert (=> d!124477 (= lt!456977 (select (content!515 (toList!6896 lt!456781)) (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))

(declare-fun e!585397 () Bool)

(assert (=> d!124477 (= lt!456977 e!585397)))

(declare-fun res!691308 () Bool)

(assert (=> d!124477 (=> (not res!691308) (not e!585397))))

(assert (=> d!124477 (= res!691308 ((_ is Cons!21888) (toList!6896 lt!456781)))))

(assert (=> d!124477 (= (contains!6038 (toList!6896 lt!456781) (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456977)))

(declare-fun b!1035427 () Bool)

(declare-fun e!585398 () Bool)

(assert (=> b!1035427 (= e!585397 e!585398)))

(declare-fun res!691309 () Bool)

(assert (=> b!1035427 (=> res!691309 e!585398)))

(assert (=> b!1035427 (= res!691309 (= (h!23099 (toList!6896 lt!456781)) (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))

(declare-fun b!1035428 () Bool)

(assert (=> b!1035428 (= e!585398 (contains!6038 (t!31080 (toList!6896 lt!456781)) (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))

(assert (= (and d!124477 res!691308) b!1035427))

(assert (= (and b!1035427 (not res!691309)) b!1035428))

(declare-fun m!955783 () Bool)

(assert (=> d!124477 m!955783))

(declare-fun m!955785 () Bool)

(assert (=> d!124477 m!955785))

(declare-fun m!955787 () Bool)

(assert (=> b!1035428 m!955787))

(assert (=> b!1035090 d!124477))

(declare-fun b!1035429 () Bool)

(declare-fun e!585402 () Bool)

(assert (=> b!1035429 (= e!585402 (contains!6039 (ite c!104863 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) Nil!21890) Nil!21890) (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035430 () Bool)

(declare-fun e!585400 () Bool)

(declare-fun call!43780 () Bool)

(assert (=> b!1035430 (= e!585400 call!43780)))

(declare-fun b!1035431 () Bool)

(declare-fun e!585399 () Bool)

(assert (=> b!1035431 (= e!585399 e!585400)))

(declare-fun c!104918 () Bool)

(assert (=> b!1035431 (= c!104918 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124479 () Bool)

(declare-fun res!691311 () Bool)

(declare-fun e!585401 () Bool)

(assert (=> d!124479 (=> res!691311 e!585401)))

(assert (=> d!124479 (= res!691311 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124479 (= (arrayNoDuplicates!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104863 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)) e!585401)))

(declare-fun bm!43777 () Bool)

(assert (=> bm!43777 (= call!43780 (arrayNoDuplicates!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104918 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104863 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)) (ite c!104863 (Cons!21889 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) Nil!21890) Nil!21890))))))

(declare-fun b!1035432 () Bool)

(assert (=> b!1035432 (= e!585401 e!585399)))

(declare-fun res!691310 () Bool)

(assert (=> b!1035432 (=> (not res!691310) (not e!585399))))

(assert (=> b!1035432 (= res!691310 (not e!585402))))

(declare-fun res!691312 () Bool)

(assert (=> b!1035432 (=> (not res!691312) (not e!585402))))

(assert (=> b!1035432 (= res!691312 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035433 () Bool)

(assert (=> b!1035433 (= e!585400 call!43780)))

(assert (= (and d!124479 (not res!691311)) b!1035432))

(assert (= (and b!1035432 res!691312) b!1035429))

(assert (= (and b!1035432 res!691310) b!1035431))

(assert (= (and b!1035431 c!104918) b!1035433))

(assert (= (and b!1035431 (not c!104918)) b!1035430))

(assert (= (or b!1035433 b!1035430) bm!43777))

(declare-fun m!955789 () Bool)

(assert (=> b!1035429 m!955789))

(assert (=> b!1035429 m!955789))

(declare-fun m!955791 () Bool)

(assert (=> b!1035429 m!955791))

(assert (=> b!1035431 m!955789))

(assert (=> b!1035431 m!955789))

(declare-fun m!955793 () Bool)

(assert (=> b!1035431 m!955793))

(assert (=> bm!43777 m!955789))

(declare-fun m!955795 () Bool)

(assert (=> bm!43777 m!955795))

(assert (=> b!1035432 m!955789))

(assert (=> b!1035432 m!955789))

(assert (=> b!1035432 m!955793))

(assert (=> bm!43759 d!124479))

(declare-fun d!124481 () Bool)

(assert (=> d!124481 (= (size!31898 thiss!1427) (bvadd (_size!2907 thiss!1427) (bvsdiv (bvadd (extraKeys!5958 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1035251 d!124481))

(declare-fun d!124483 () Bool)

(declare-fun e!585403 () Bool)

(assert (=> d!124483 e!585403))

(declare-fun res!691313 () Bool)

(assert (=> d!124483 (=> (not res!691313) (not e!585403))))

(declare-fun lt!456979 () ListLongMap!13761)

(assert (=> d!124483 (= res!691313 (contains!6037 lt!456979 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(declare-fun lt!456981 () List!21892)

(assert (=> d!124483 (= lt!456979 (ListLongMap!13762 lt!456981))))

(declare-fun lt!456980 () Unit!33837)

(declare-fun lt!456978 () Unit!33837)

(assert (=> d!124483 (= lt!456980 lt!456978)))

(assert (=> d!124483 (= (getValueByKey!584 lt!456981 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(assert (=> d!124483 (= lt!456978 (lemmaContainsTupThenGetReturnValue!280 lt!456981 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(assert (=> d!124483 (= lt!456981 (insertStrictlySorted!373 (toList!6896 call!43754) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(assert (=> d!124483 (= (+!3126 call!43754 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))) lt!456979)))

(declare-fun b!1035434 () Bool)

(declare-fun res!691314 () Bool)

(assert (=> b!1035434 (=> (not res!691314) (not e!585403))))

(assert (=> b!1035434 (= res!691314 (= (getValueByKey!584 (toList!6896 lt!456979) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))))

(declare-fun b!1035435 () Bool)

(assert (=> b!1035435 (= e!585403 (contains!6038 (toList!6896 lt!456979) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))

(assert (= (and d!124483 res!691313) b!1035434))

(assert (= (and b!1035434 res!691314) b!1035435))

(declare-fun m!955797 () Bool)

(assert (=> d!124483 m!955797))

(declare-fun m!955799 () Bool)

(assert (=> d!124483 m!955799))

(declare-fun m!955801 () Bool)

(assert (=> d!124483 m!955801))

(declare-fun m!955803 () Bool)

(assert (=> d!124483 m!955803))

(declare-fun m!955805 () Bool)

(assert (=> b!1035434 m!955805))

(declare-fun m!955807 () Bool)

(assert (=> b!1035435 m!955807))

(assert (=> b!1035209 d!124483))

(declare-fun d!124485 () Bool)

(assert (=> d!124485 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456982 () Unit!33837)

(assert (=> d!124485 (= lt!456982 (choose!1704 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585404 () Bool)

(assert (=> d!124485 e!585404))

(declare-fun res!691315 () Bool)

(assert (=> d!124485 (=> (not res!691315) (not e!585404))))

(assert (=> d!124485 (= res!691315 (isStrictlySorted!706 (toList!6896 lt!456742)))))

(assert (=> d!124485 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!456982)))

(declare-fun b!1035436 () Bool)

(assert (=> b!1035436 (= e!585404 (containsKey!565 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124485 res!691315) b!1035436))

(assert (=> d!124485 m!955035))

(assert (=> d!124485 m!955307))

(assert (=> d!124485 m!955307))

(assert (=> d!124485 m!955335))

(assert (=> d!124485 m!955035))

(declare-fun m!955809 () Bool)

(assert (=> d!124485 m!955809))

(declare-fun m!955811 () Bool)

(assert (=> d!124485 m!955811))

(assert (=> b!1035436 m!955035))

(assert (=> b!1035436 m!955331))

(assert (=> b!1035164 d!124485))

(declare-fun d!124487 () Bool)

(assert (=> d!124487 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30260 () Bool)

(assert (= bs!30260 d!124487))

(assert (=> bs!30260 m!955307))

(declare-fun m!955813 () Bool)

(assert (=> bs!30260 m!955813))

(assert (=> b!1035164 d!124487))

(declare-fun b!1035437 () Bool)

(declare-fun e!585405 () Option!635)

(assert (=> b!1035437 (= e!585405 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456742)))))))

(declare-fun b!1035438 () Bool)

(declare-fun e!585406 () Option!635)

(assert (=> b!1035438 (= e!585405 e!585406)))

(declare-fun c!104920 () Bool)

(assert (=> b!1035438 (= c!104920 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456742))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1035440 () Bool)

(assert (=> b!1035440 (= e!585406 None!633)))

(declare-fun b!1035439 () Bool)

(assert (=> b!1035439 (= e!585406 (getValueByKey!584 (t!31080 (toList!6896 lt!456742)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124489 () Bool)

(declare-fun c!104919 () Bool)

(assert (=> d!124489 (= c!104919 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124489 (= (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) e!585405)))

(assert (= (and d!124489 c!104919) b!1035437))

(assert (= (and d!124489 (not c!104919)) b!1035438))

(assert (= (and b!1035438 c!104920) b!1035439))

(assert (= (and b!1035438 (not c!104920)) b!1035440))

(assert (=> b!1035439 m!955035))

(declare-fun m!955815 () Bool)

(assert (=> b!1035439 m!955815))

(assert (=> b!1035164 d!124489))

(declare-fun d!124491 () Bool)

(declare-fun e!585408 () Bool)

(assert (=> d!124491 e!585408))

(declare-fun res!691316 () Bool)

(assert (=> d!124491 (=> res!691316 e!585408)))

(declare-fun lt!456984 () Bool)

(assert (=> d!124491 (= res!691316 (not lt!456984))))

(declare-fun lt!456983 () Bool)

(assert (=> d!124491 (= lt!456984 lt!456983)))

(declare-fun lt!456986 () Unit!33837)

(declare-fun e!585407 () Unit!33837)

(assert (=> d!124491 (= lt!456986 e!585407)))

(declare-fun c!104921 () Bool)

(assert (=> d!124491 (= c!104921 lt!456983)))

(assert (=> d!124491 (= lt!456983 (containsKey!565 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124491 (= (contains!6037 lt!456887 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456984)))

(declare-fun b!1035441 () Bool)

(declare-fun lt!456985 () Unit!33837)

(assert (=> b!1035441 (= e!585407 lt!456985)))

(assert (=> b!1035441 (= lt!456985 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035441 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035442 () Bool)

(declare-fun Unit!33857 () Unit!33837)

(assert (=> b!1035442 (= e!585407 Unit!33857)))

(declare-fun b!1035443 () Bool)

(assert (=> b!1035443 (= e!585408 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456887) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124491 c!104921) b!1035441))

(assert (= (and d!124491 (not c!104921)) b!1035442))

(assert (= (and d!124491 (not res!691316)) b!1035443))

(declare-fun m!955817 () Bool)

(assert (=> d!124491 m!955817))

(declare-fun m!955819 () Bool)

(assert (=> b!1035441 m!955819))

(assert (=> b!1035441 m!955469))

(assert (=> b!1035441 m!955469))

(declare-fun m!955821 () Bool)

(assert (=> b!1035441 m!955821))

(assert (=> b!1035443 m!955469))

(assert (=> b!1035443 m!955469))

(assert (=> b!1035443 m!955821))

(assert (=> d!124367 d!124491))

(declare-fun b!1035444 () Bool)

(declare-fun e!585409 () Option!635)

(assert (=> b!1035444 (= e!585409 (Some!634 (_2!7874 (h!23099 lt!456889))))))

(declare-fun b!1035445 () Bool)

(declare-fun e!585410 () Option!635)

(assert (=> b!1035445 (= e!585409 e!585410)))

(declare-fun c!104923 () Bool)

(assert (=> b!1035445 (= c!104923 (and ((_ is Cons!21888) lt!456889) (not (= (_1!7874 (h!23099 lt!456889)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035447 () Bool)

(assert (=> b!1035447 (= e!585410 None!633)))

(declare-fun b!1035446 () Bool)

(assert (=> b!1035446 (= e!585410 (getValueByKey!584 (t!31080 lt!456889) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124493 () Bool)

(declare-fun c!104922 () Bool)

(assert (=> d!124493 (= c!104922 (and ((_ is Cons!21888) lt!456889) (= (_1!7874 (h!23099 lt!456889)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124493 (= (getValueByKey!584 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!585409)))

(assert (= (and d!124493 c!104922) b!1035444))

(assert (= (and d!124493 (not c!104922)) b!1035445))

(assert (= (and b!1035445 c!104923) b!1035446))

(assert (= (and b!1035445 (not c!104923)) b!1035447))

(declare-fun m!955823 () Bool)

(assert (=> b!1035446 m!955823))

(assert (=> d!124367 d!124493))

(declare-fun d!124495 () Bool)

(assert (=> d!124495 (= (getValueByKey!584 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!456987 () Unit!33837)

(assert (=> d!124495 (= lt!456987 (choose!1703 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!585411 () Bool)

(assert (=> d!124495 e!585411))

(declare-fun res!691317 () Bool)

(assert (=> d!124495 (=> (not res!691317) (not e!585411))))

(assert (=> d!124495 (= res!691317 (isStrictlySorted!706 lt!456889))))

(assert (=> d!124495 (= (lemmaContainsTupThenGetReturnValue!280 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456987)))

(declare-fun b!1035448 () Bool)

(declare-fun res!691318 () Bool)

(assert (=> b!1035448 (=> (not res!691318) (not e!585411))))

(assert (=> b!1035448 (= res!691318 (containsKey!565 lt!456889 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035449 () Bool)

(assert (=> b!1035449 (= e!585411 (contains!6038 lt!456889 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124495 res!691317) b!1035448))

(assert (= (and b!1035448 res!691318) b!1035449))

(assert (=> d!124495 m!955463))

(declare-fun m!955825 () Bool)

(assert (=> d!124495 m!955825))

(declare-fun m!955827 () Bool)

(assert (=> d!124495 m!955827))

(declare-fun m!955829 () Bool)

(assert (=> b!1035448 m!955829))

(declare-fun m!955831 () Bool)

(assert (=> b!1035449 m!955831))

(assert (=> d!124367 d!124495))

(declare-fun b!1035450 () Bool)

(declare-fun e!585412 () Bool)

(declare-fun lt!456988 () List!21892)

(assert (=> b!1035450 (= e!585412 (contains!6038 lt!456988 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!585416 () List!21892)

(declare-fun call!43783 () List!21892)

(declare-fun c!104925 () Bool)

(declare-fun bm!43778 () Bool)

(assert (=> bm!43778 (= call!43783 ($colon$colon!603 e!585416 (ite c!104925 (h!23099 (toList!6896 call!43734)) (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun c!104927 () Bool)

(assert (=> bm!43778 (= c!104927 c!104925)))

(declare-fun bm!43779 () Bool)

(declare-fun call!43781 () List!21892)

(declare-fun call!43782 () List!21892)

(assert (=> bm!43779 (= call!43781 call!43782)))

(declare-fun c!104926 () Bool)

(declare-fun c!104924 () Bool)

(declare-fun b!1035451 () Bool)

(assert (=> b!1035451 (= e!585416 (ite c!104926 (t!31080 (toList!6896 call!43734)) (ite c!104924 (Cons!21888 (h!23099 (toList!6896 call!43734)) (t!31080 (toList!6896 call!43734))) Nil!21889)))))

(declare-fun b!1035452 () Bool)

(declare-fun res!691320 () Bool)

(assert (=> b!1035452 (=> (not res!691320) (not e!585412))))

(assert (=> b!1035452 (= res!691320 (containsKey!565 lt!456988 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035453 () Bool)

(declare-fun e!585414 () List!21892)

(declare-fun e!585413 () List!21892)

(assert (=> b!1035453 (= e!585414 e!585413)))

(assert (=> b!1035453 (= c!104926 (and ((_ is Cons!21888) (toList!6896 call!43734)) (= (_1!7874 (h!23099 (toList!6896 call!43734))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035454 () Bool)

(assert (=> b!1035454 (= c!104924 (and ((_ is Cons!21888) (toList!6896 call!43734)) (bvsgt (_1!7874 (h!23099 (toList!6896 call!43734))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!585415 () List!21892)

(assert (=> b!1035454 (= e!585413 e!585415)))

(declare-fun b!1035455 () Bool)

(assert (=> b!1035455 (= e!585416 (insertStrictlySorted!373 (t!31080 (toList!6896 call!43734)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035456 () Bool)

(assert (=> b!1035456 (= e!585415 call!43781)))

(declare-fun b!1035457 () Bool)

(assert (=> b!1035457 (= e!585415 call!43781)))

(declare-fun bm!43780 () Bool)

(assert (=> bm!43780 (= call!43782 call!43783)))

(declare-fun b!1035458 () Bool)

(assert (=> b!1035458 (= e!585414 call!43783)))

(declare-fun b!1035459 () Bool)

(assert (=> b!1035459 (= e!585413 call!43782)))

(declare-fun d!124497 () Bool)

(assert (=> d!124497 e!585412))

(declare-fun res!691319 () Bool)

(assert (=> d!124497 (=> (not res!691319) (not e!585412))))

(assert (=> d!124497 (= res!691319 (isStrictlySorted!706 lt!456988))))

(assert (=> d!124497 (= lt!456988 e!585414)))

(assert (=> d!124497 (= c!104925 (and ((_ is Cons!21888) (toList!6896 call!43734)) (bvslt (_1!7874 (h!23099 (toList!6896 call!43734))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124497 (isStrictlySorted!706 (toList!6896 call!43734))))

(assert (=> d!124497 (= (insertStrictlySorted!373 (toList!6896 call!43734) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!456988)))

(assert (= (and d!124497 c!104925) b!1035458))

(assert (= (and d!124497 (not c!104925)) b!1035453))

(assert (= (and b!1035453 c!104926) b!1035459))

(assert (= (and b!1035453 (not c!104926)) b!1035454))

(assert (= (and b!1035454 c!104924) b!1035456))

(assert (= (and b!1035454 (not c!104924)) b!1035457))

(assert (= (or b!1035456 b!1035457) bm!43779))

(assert (= (or b!1035459 bm!43779) bm!43780))

(assert (= (or b!1035458 bm!43780) bm!43778))

(assert (= (and bm!43778 c!104927) b!1035455))

(assert (= (and bm!43778 (not c!104927)) b!1035451))

(assert (= (and d!124497 res!691319) b!1035452))

(assert (= (and b!1035452 res!691320) b!1035450))

(declare-fun m!955833 () Bool)

(assert (=> b!1035455 m!955833))

(declare-fun m!955835 () Bool)

(assert (=> b!1035450 m!955835))

(declare-fun m!955837 () Bool)

(assert (=> bm!43778 m!955837))

(declare-fun m!955839 () Bool)

(assert (=> d!124497 m!955839))

(declare-fun m!955841 () Bool)

(assert (=> d!124497 m!955841))

(declare-fun m!955843 () Bool)

(assert (=> b!1035452 m!955843))

(assert (=> d!124367 d!124497))

(declare-fun lt!456989 () Bool)

(declare-fun d!124499 () Bool)

(assert (=> d!124499 (= lt!456989 (select (content!515 (toList!6896 lt!456807)) (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))

(declare-fun e!585417 () Bool)

(assert (=> d!124499 (= lt!456989 e!585417)))

(declare-fun res!691321 () Bool)

(assert (=> d!124499 (=> (not res!691321) (not e!585417))))

(assert (=> d!124499 (= res!691321 ((_ is Cons!21888) (toList!6896 lt!456807)))))

(assert (=> d!124499 (= (contains!6038 (toList!6896 lt!456807) (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456989)))

(declare-fun b!1035460 () Bool)

(declare-fun e!585418 () Bool)

(assert (=> b!1035460 (= e!585417 e!585418)))

(declare-fun res!691322 () Bool)

(assert (=> b!1035460 (=> res!691322 e!585418)))

(assert (=> b!1035460 (= res!691322 (= (h!23099 (toList!6896 lt!456807)) (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))

(declare-fun b!1035461 () Bool)

(assert (=> b!1035461 (= e!585418 (contains!6038 (t!31080 (toList!6896 lt!456807)) (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))

(assert (= (and d!124499 res!691321) b!1035460))

(assert (= (and b!1035460 (not res!691322)) b!1035461))

(declare-fun m!955845 () Bool)

(assert (=> d!124499 m!955845))

(declare-fun m!955847 () Bool)

(assert (=> d!124499 m!955847))

(declare-fun m!955849 () Bool)

(assert (=> b!1035461 m!955849))

(assert (=> b!1035107 d!124499))

(declare-fun d!124501 () Bool)

(declare-fun res!691327 () Bool)

(declare-fun e!585423 () Bool)

(assert (=> d!124501 (=> res!691327 e!585423)))

(assert (=> d!124501 (= res!691327 (and ((_ is Cons!21888) (toList!6896 lt!456722)) (= (_1!7874 (h!23099 (toList!6896 lt!456722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124501 (= (containsKey!565 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000) e!585423)))

(declare-fun b!1035466 () Bool)

(declare-fun e!585424 () Bool)

(assert (=> b!1035466 (= e!585423 e!585424)))

(declare-fun res!691328 () Bool)

(assert (=> b!1035466 (=> (not res!691328) (not e!585424))))

(assert (=> b!1035466 (= res!691328 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456722))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456722))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) (toList!6896 lt!456722)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035467 () Bool)

(assert (=> b!1035467 (= e!585424 (containsKey!565 (t!31080 (toList!6896 lt!456722)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124501 (not res!691327)) b!1035466))

(assert (= (and b!1035466 res!691328) b!1035467))

(declare-fun m!955851 () Bool)

(assert (=> b!1035467 m!955851))

(assert (=> d!124325 d!124501))

(declare-fun d!124503 () Bool)

(declare-fun res!691333 () Bool)

(declare-fun e!585429 () Bool)

(assert (=> d!124503 (=> res!691333 e!585429)))

(assert (=> d!124503 (= res!691333 (or ((_ is Nil!21889) lt!456820) ((_ is Nil!21889) (t!31080 lt!456820))))))

(assert (=> d!124503 (= (isStrictlySorted!706 lt!456820) e!585429)))

(declare-fun b!1035472 () Bool)

(declare-fun e!585430 () Bool)

(assert (=> b!1035472 (= e!585429 e!585430)))

(declare-fun res!691334 () Bool)

(assert (=> b!1035472 (=> (not res!691334) (not e!585430))))

(assert (=> b!1035472 (= res!691334 (bvslt (_1!7874 (h!23099 lt!456820)) (_1!7874 (h!23099 (t!31080 lt!456820)))))))

(declare-fun b!1035473 () Bool)

(assert (=> b!1035473 (= e!585430 (isStrictlySorted!706 (t!31080 lt!456820)))))

(assert (= (and d!124503 (not res!691333)) b!1035472))

(assert (= (and b!1035472 res!691334) b!1035473))

(declare-fun m!955853 () Bool)

(assert (=> b!1035473 m!955853))

(assert (=> d!124327 d!124503))

(declare-fun d!124505 () Bool)

(declare-fun res!691335 () Bool)

(declare-fun e!585431 () Bool)

(assert (=> d!124505 (=> res!691335 e!585431)))

(assert (=> d!124505 (= res!691335 (or ((_ is Nil!21889) (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) ((_ is Nil!21889) (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))))

(assert (=> d!124505 (= (isStrictlySorted!706 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) e!585431)))

(declare-fun b!1035474 () Bool)

(declare-fun e!585432 () Bool)

(assert (=> b!1035474 (= e!585431 e!585432)))

(declare-fun res!691336 () Bool)

(assert (=> b!1035474 (=> (not res!691336) (not e!585432))))

(assert (=> b!1035474 (= res!691336 (bvslt (_1!7874 (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (_1!7874 (h!23099 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))))

(declare-fun b!1035475 () Bool)

(assert (=> b!1035475 (= e!585432 (isStrictlySorted!706 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(assert (= (and d!124505 (not res!691335)) b!1035474))

(assert (= (and b!1035474 res!691336) b!1035475))

(declare-fun m!955855 () Bool)

(assert (=> b!1035475 m!955855))

(assert (=> d!124327 d!124505))

(declare-fun d!124507 () Bool)

(assert (=> d!124507 (= (apply!915 lt!456876 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30261 () Bool)

(assert (= bs!30261 d!124507))

(declare-fun m!955857 () Bool)

(assert (=> bs!30261 m!955857))

(assert (=> bs!30261 m!955857))

(declare-fun m!955859 () Bool)

(assert (=> bs!30261 m!955859))

(assert (=> b!1035206 d!124507))

(declare-fun d!124509 () Bool)

(assert (=> d!124509 (arrayContainsKey!0 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000)))

(declare-fun lt!456992 () Unit!33837)

(declare-fun choose!13 (array!65163 (_ BitVec 64) (_ BitVec 32)) Unit!33837)

(assert (=> d!124509 (= lt!456992 (choose!13 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000))))

(assert (=> d!124509 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124509 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000) lt!456992)))

(declare-fun bs!30262 () Bool)

(assert (= bs!30262 d!124509))

(assert (=> bs!30262 m!955303))

(declare-fun m!955861 () Bool)

(assert (=> bs!30262 m!955861))

(assert (=> b!1035139 d!124509))

(declare-fun d!124511 () Bool)

(declare-fun res!691341 () Bool)

(declare-fun e!585437 () Bool)

(assert (=> d!124511 (=> res!691341 e!585437)))

(assert (=> d!124511 (= res!691341 (= (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) lt!456829))))

(assert (=> d!124511 (= (arrayContainsKey!0 (_keys!11444 lt!456630) lt!456829 #b00000000000000000000000000000000) e!585437)))

(declare-fun b!1035480 () Bool)

(declare-fun e!585438 () Bool)

(assert (=> b!1035480 (= e!585437 e!585438)))

(declare-fun res!691342 () Bool)

(assert (=> b!1035480 (=> (not res!691342) (not e!585438))))

(assert (=> b!1035480 (= res!691342 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(declare-fun b!1035481 () Bool)

(assert (=> b!1035481 (= e!585438 (arrayContainsKey!0 (_keys!11444 lt!456630) lt!456829 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124511 (not res!691341)) b!1035480))

(assert (= (and b!1035480 res!691342) b!1035481))

(assert (=> d!124511 m!955297))

(declare-fun m!955863 () Bool)

(assert (=> b!1035481 m!955863))

(assert (=> b!1035139 d!124511))

(declare-fun b!1035494 () Bool)

(declare-fun e!585446 () SeekEntryResult!9695)

(declare-fun lt!457001 () SeekEntryResult!9695)

(assert (=> b!1035494 (= e!585446 (Found!9695 (index!41153 lt!457001)))))

(declare-fun b!1035495 () Bool)

(declare-fun e!585447 () SeekEntryResult!9695)

(assert (=> b!1035495 (= e!585447 e!585446)))

(declare-fun lt!457000 () (_ BitVec 64))

(assert (=> b!1035495 (= lt!457000 (select (arr!31369 (_keys!11444 lt!456630)) (index!41153 lt!457001)))))

(declare-fun c!104935 () Bool)

(assert (=> b!1035495 (= c!104935 (= lt!457000 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035496 () Bool)

(assert (=> b!1035496 (= e!585447 Undefined!9695)))

(declare-fun b!1035497 () Bool)

(declare-fun e!585445 () SeekEntryResult!9695)

(assert (=> b!1035497 (= e!585445 (MissingZero!9695 (index!41153 lt!457001)))))

(declare-fun b!1035498 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65163 (_ BitVec 32)) SeekEntryResult!9695)

(assert (=> b!1035498 (= e!585445 (seekKeyOrZeroReturnVacant!0 (x!92204 lt!457001) (index!41153 lt!457001) (index!41153 lt!457001) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (_keys!11444 lt!456630) (mask!30143 lt!456630)))))

(declare-fun b!1035499 () Bool)

(declare-fun c!104936 () Bool)

(assert (=> b!1035499 (= c!104936 (= lt!457000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035499 (= e!585446 e!585445)))

(declare-fun d!124513 () Bool)

(declare-fun lt!456999 () SeekEntryResult!9695)

(assert (=> d!124513 (and (or ((_ is Undefined!9695) lt!456999) (not ((_ is Found!9695) lt!456999)) (and (bvsge (index!41152 lt!456999) #b00000000000000000000000000000000) (bvslt (index!41152 lt!456999) (size!31892 (_keys!11444 lt!456630))))) (or ((_ is Undefined!9695) lt!456999) ((_ is Found!9695) lt!456999) (not ((_ is MissingZero!9695) lt!456999)) (and (bvsge (index!41151 lt!456999) #b00000000000000000000000000000000) (bvslt (index!41151 lt!456999) (size!31892 (_keys!11444 lt!456630))))) (or ((_ is Undefined!9695) lt!456999) ((_ is Found!9695) lt!456999) ((_ is MissingZero!9695) lt!456999) (not ((_ is MissingVacant!9695) lt!456999)) (and (bvsge (index!41154 lt!456999) #b00000000000000000000000000000000) (bvslt (index!41154 lt!456999) (size!31892 (_keys!11444 lt!456630))))) (or ((_ is Undefined!9695) lt!456999) (ite ((_ is Found!9695) lt!456999) (= (select (arr!31369 (_keys!11444 lt!456630)) (index!41152 lt!456999)) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9695) lt!456999) (= (select (arr!31369 (_keys!11444 lt!456630)) (index!41151 lt!456999)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9695) lt!456999) (= (select (arr!31369 (_keys!11444 lt!456630)) (index!41154 lt!456999)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124513 (= lt!456999 e!585447)))

(declare-fun c!104934 () Bool)

(assert (=> d!124513 (= c!104934 (and ((_ is Intermediate!9695) lt!457001) (undefined!10507 lt!457001)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65163 (_ BitVec 32)) SeekEntryResult!9695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!124513 (= lt!457001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (mask!30143 lt!456630)) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (_keys!11444 lt!456630) (mask!30143 lt!456630)))))

(assert (=> d!124513 (validMask!0 (mask!30143 lt!456630))))

(assert (=> d!124513 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (_keys!11444 lt!456630) (mask!30143 lt!456630)) lt!456999)))

(assert (= (and d!124513 c!104934) b!1035496))

(assert (= (and d!124513 (not c!104934)) b!1035495))

(assert (= (and b!1035495 c!104935) b!1035494))

(assert (= (and b!1035495 (not c!104935)) b!1035499))

(assert (= (and b!1035499 c!104936) b!1035497))

(assert (= (and b!1035499 (not c!104936)) b!1035498))

(declare-fun m!955865 () Bool)

(assert (=> b!1035495 m!955865))

(assert (=> b!1035498 m!955297))

(declare-fun m!955867 () Bool)

(assert (=> b!1035498 m!955867))

(declare-fun m!955869 () Bool)

(assert (=> d!124513 m!955869))

(declare-fun m!955871 () Bool)

(assert (=> d!124513 m!955871))

(declare-fun m!955873 () Bool)

(assert (=> d!124513 m!955873))

(assert (=> d!124513 m!955297))

(declare-fun m!955875 () Bool)

(assert (=> d!124513 m!955875))

(assert (=> d!124513 m!955393))

(declare-fun m!955877 () Bool)

(assert (=> d!124513 m!955877))

(assert (=> d!124513 m!955297))

(assert (=> d!124513 m!955873))

(assert (=> b!1035139 d!124513))

(declare-fun d!124515 () Bool)

(declare-fun e!585449 () Bool)

(assert (=> d!124515 e!585449))

(declare-fun res!691343 () Bool)

(assert (=> d!124515 (=> res!691343 e!585449)))

(declare-fun lt!457003 () Bool)

(assert (=> d!124515 (= res!691343 (not lt!457003))))

(declare-fun lt!457002 () Bool)

(assert (=> d!124515 (= lt!457003 lt!457002)))

(declare-fun lt!457005 () Unit!33837)

(declare-fun e!585448 () Unit!33837)

(assert (=> d!124515 (= lt!457005 e!585448)))

(declare-fun c!104937 () Bool)

(assert (=> d!124515 (= c!104937 lt!457002)))

(assert (=> d!124515 (= lt!457002 (containsKey!565 (toList!6896 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) lt!456863))))

(assert (=> d!124515 (= (contains!6037 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) lt!456863) lt!457003)))

(declare-fun b!1035500 () Bool)

(declare-fun lt!457004 () Unit!33837)

(assert (=> b!1035500 (= e!585448 lt!457004)))

(assert (=> b!1035500 (= lt!457004 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) lt!456863))))

(assert (=> b!1035500 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) lt!456863))))

(declare-fun b!1035501 () Bool)

(declare-fun Unit!33858 () Unit!33837)

(assert (=> b!1035501 (= e!585448 Unit!33858)))

(declare-fun b!1035502 () Bool)

(assert (=> b!1035502 (= e!585449 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) lt!456863)))))

(assert (= (and d!124515 c!104937) b!1035500))

(assert (= (and d!124515 (not c!104937)) b!1035501))

(assert (= (and d!124515 (not res!691343)) b!1035502))

(declare-fun m!955879 () Bool)

(assert (=> d!124515 m!955879))

(declare-fun m!955881 () Bool)

(assert (=> b!1035500 m!955881))

(declare-fun m!955883 () Bool)

(assert (=> b!1035500 m!955883))

(assert (=> b!1035500 m!955883))

(declare-fun m!955885 () Bool)

(assert (=> b!1035500 m!955885))

(assert (=> b!1035502 m!955883))

(assert (=> b!1035502 m!955883))

(assert (=> b!1035502 m!955885))

(assert (=> b!1035216 d!124515))

(declare-fun d!124517 () Bool)

(declare-fun e!585450 () Bool)

(assert (=> d!124517 e!585450))

(declare-fun res!691344 () Bool)

(assert (=> d!124517 (=> (not res!691344) (not e!585450))))

(declare-fun lt!457007 () ListLongMap!13761)

(assert (=> d!124517 (= res!691344 (contains!6037 lt!457007 (_1!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))))))

(declare-fun lt!457009 () List!21892)

(assert (=> d!124517 (= lt!457007 (ListLongMap!13762 lt!457009))))

(declare-fun lt!457008 () Unit!33837)

(declare-fun lt!457006 () Unit!33837)

(assert (=> d!124517 (= lt!457008 lt!457006)))

(assert (=> d!124517 (= (getValueByKey!584 lt!457009 (_1!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))))))

(assert (=> d!124517 (= lt!457006 (lemmaContainsTupThenGetReturnValue!280 lt!457009 (_1!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))))))

(assert (=> d!124517 (= lt!457009 (insertStrictlySorted!373 (toList!6896 lt!456868) (_1!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))))))

(assert (=> d!124517 (= (+!3126 lt!456868 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) lt!457007)))

(declare-fun b!1035503 () Bool)

(declare-fun res!691345 () Bool)

(assert (=> b!1035503 (=> (not res!691345) (not e!585450))))

(assert (=> b!1035503 (= res!691345 (= (getValueByKey!584 (toList!6896 lt!457007) (_1!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))))))))

(declare-fun b!1035504 () Bool)

(assert (=> b!1035504 (= e!585450 (contains!6038 (toList!6896 lt!457007) (tuple2!15727 lt!456869 (minValue!6062 lt!456630))))))

(assert (= (and d!124517 res!691344) b!1035503))

(assert (= (and b!1035503 res!691345) b!1035504))

(declare-fun m!955887 () Bool)

(assert (=> d!124517 m!955887))

(declare-fun m!955889 () Bool)

(assert (=> d!124517 m!955889))

(declare-fun m!955891 () Bool)

(assert (=> d!124517 m!955891))

(declare-fun m!955893 () Bool)

(assert (=> d!124517 m!955893))

(declare-fun m!955895 () Bool)

(assert (=> b!1035503 m!955895))

(declare-fun m!955897 () Bool)

(assert (=> b!1035504 m!955897))

(assert (=> b!1035216 d!124517))

(declare-fun d!124519 () Bool)

(assert (=> d!124519 (contains!6037 (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) lt!456863)))

(declare-fun lt!457010 () Unit!33837)

(assert (=> d!124519 (= lt!457010 (choose!1702 lt!456860 lt!456877 (zeroValue!6062 lt!456630) lt!456863))))

(assert (=> d!124519 (contains!6037 lt!456860 lt!456863)))

(assert (=> d!124519 (= (addStillContains!625 lt!456860 lt!456877 (zeroValue!6062 lt!456630) lt!456863) lt!457010)))

(declare-fun bs!30263 () Bool)

(assert (= bs!30263 d!124519))

(assert (=> bs!30263 m!955409))

(assert (=> bs!30263 m!955409))

(assert (=> bs!30263 m!955417))

(declare-fun m!955899 () Bool)

(assert (=> bs!30263 m!955899))

(declare-fun m!955901 () Bool)

(assert (=> bs!30263 m!955901))

(assert (=> b!1035216 d!124519))

(declare-fun d!124521 () Bool)

(declare-fun e!585451 () Bool)

(assert (=> d!124521 e!585451))

(declare-fun res!691346 () Bool)

(assert (=> d!124521 (=> (not res!691346) (not e!585451))))

(declare-fun lt!457012 () ListLongMap!13761)

(assert (=> d!124521 (= res!691346 (contains!6037 lt!457012 (_1!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))))))

(declare-fun lt!457014 () List!21892)

(assert (=> d!124521 (= lt!457012 (ListLongMap!13762 lt!457014))))

(declare-fun lt!457013 () Unit!33837)

(declare-fun lt!457011 () Unit!33837)

(assert (=> d!124521 (= lt!457013 lt!457011)))

(assert (=> d!124521 (= (getValueByKey!584 lt!457014 (_1!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124521 (= lt!457011 (lemmaContainsTupThenGetReturnValue!280 lt!457014 (_1!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124521 (= lt!457014 (insertStrictlySorted!373 (toList!6896 lt!456864) (_1!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124521 (= (+!3126 lt!456864 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) lt!457012)))

(declare-fun b!1035505 () Bool)

(declare-fun res!691347 () Bool)

(assert (=> b!1035505 (=> (not res!691347) (not e!585451))))

(assert (=> b!1035505 (= res!691347 (= (getValueByKey!584 (toList!6896 lt!457012) (_1!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))))))))

(declare-fun b!1035506 () Bool)

(assert (=> b!1035506 (= e!585451 (contains!6038 (toList!6896 lt!457012) (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))))))

(assert (= (and d!124521 res!691346) b!1035505))

(assert (= (and b!1035505 res!691347) b!1035506))

(declare-fun m!955903 () Bool)

(assert (=> d!124521 m!955903))

(declare-fun m!955905 () Bool)

(assert (=> d!124521 m!955905))

(declare-fun m!955907 () Bool)

(assert (=> d!124521 m!955907))

(declare-fun m!955909 () Bool)

(assert (=> d!124521 m!955909))

(declare-fun m!955911 () Bool)

(assert (=> b!1035505 m!955911))

(declare-fun m!955913 () Bool)

(assert (=> b!1035506 m!955913))

(assert (=> b!1035216 d!124521))

(declare-fun d!124523 () Bool)

(assert (=> d!124523 (= (apply!915 (+!3126 lt!456864 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) lt!456858) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456864 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630)))) lt!456858)))))

(declare-fun bs!30264 () Bool)

(assert (= bs!30264 d!124523))

(declare-fun m!955915 () Bool)

(assert (=> bs!30264 m!955915))

(assert (=> bs!30264 m!955915))

(declare-fun m!955917 () Bool)

(assert (=> bs!30264 m!955917))

(assert (=> b!1035216 d!124523))

(declare-fun d!124525 () Bool)

(assert (=> d!124525 (= (apply!915 (+!3126 lt!456864 (tuple2!15727 lt!456861 (zeroValue!6062 lt!456630))) lt!456858) (apply!915 lt!456864 lt!456858))))

(declare-fun lt!457015 () Unit!33837)

(assert (=> d!124525 (= lt!457015 (choose!1701 lt!456864 lt!456861 (zeroValue!6062 lt!456630) lt!456858))))

(declare-fun e!585452 () Bool)

(assert (=> d!124525 e!585452))

(declare-fun res!691348 () Bool)

(assert (=> d!124525 (=> (not res!691348) (not e!585452))))

(assert (=> d!124525 (= res!691348 (contains!6037 lt!456864 lt!456858))))

(assert (=> d!124525 (= (addApplyDifferent!481 lt!456864 lt!456861 (zeroValue!6062 lt!456630) lt!456858) lt!457015)))

(declare-fun b!1035507 () Bool)

(assert (=> b!1035507 (= e!585452 (not (= lt!456858 lt!456861)))))

(assert (= (and d!124525 res!691348) b!1035507))

(declare-fun m!955919 () Bool)

(assert (=> d!124525 m!955919))

(assert (=> d!124525 m!955427))

(assert (=> d!124525 m!955429))

(assert (=> d!124525 m!955413))

(declare-fun m!955921 () Bool)

(assert (=> d!124525 m!955921))

(assert (=> d!124525 m!955427))

(assert (=> b!1035216 d!124525))

(declare-fun d!124527 () Bool)

(assert (=> d!124527 (= (apply!915 lt!456859 lt!456865) (get!16463 (getValueByKey!584 (toList!6896 lt!456859) lt!456865)))))

(declare-fun bs!30265 () Bool)

(assert (= bs!30265 d!124527))

(declare-fun m!955923 () Bool)

(assert (=> bs!30265 m!955923))

(assert (=> bs!30265 m!955923))

(declare-fun m!955925 () Bool)

(assert (=> bs!30265 m!955925))

(assert (=> b!1035216 d!124527))

(declare-fun d!124529 () Bool)

(assert (=> d!124529 (= (apply!915 (+!3126 lt!456868 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) lt!456870) (apply!915 lt!456868 lt!456870))))

(declare-fun lt!457016 () Unit!33837)

(assert (=> d!124529 (= lt!457016 (choose!1701 lt!456868 lt!456869 (minValue!6062 lt!456630) lt!456870))))

(declare-fun e!585453 () Bool)

(assert (=> d!124529 e!585453))

(declare-fun res!691349 () Bool)

(assert (=> d!124529 (=> (not res!691349) (not e!585453))))

(assert (=> d!124529 (= res!691349 (contains!6037 lt!456868 lt!456870))))

(assert (=> d!124529 (= (addApplyDifferent!481 lt!456868 lt!456869 (minValue!6062 lt!456630) lt!456870) lt!457016)))

(declare-fun b!1035508 () Bool)

(assert (=> b!1035508 (= e!585453 (not (= lt!456870 lt!456869)))))

(assert (= (and d!124529 res!691349) b!1035508))

(declare-fun m!955927 () Bool)

(assert (=> d!124529 m!955927))

(assert (=> d!124529 m!955421))

(assert (=> d!124529 m!955425))

(assert (=> d!124529 m!955415))

(declare-fun m!955929 () Bool)

(assert (=> d!124529 m!955929))

(assert (=> d!124529 m!955421))

(assert (=> b!1035216 d!124529))

(declare-fun d!124531 () Bool)

(assert (=> d!124531 (= (apply!915 lt!456868 lt!456870) (get!16463 (getValueByKey!584 (toList!6896 lt!456868) lt!456870)))))

(declare-fun bs!30266 () Bool)

(assert (= bs!30266 d!124531))

(declare-fun m!955931 () Bool)

(assert (=> bs!30266 m!955931))

(assert (=> bs!30266 m!955931))

(declare-fun m!955933 () Bool)

(assert (=> bs!30266 m!955933))

(assert (=> b!1035216 d!124531))

(declare-fun b!1035509 () Bool)

(declare-fun res!691352 () Bool)

(declare-fun e!585460 () Bool)

(assert (=> b!1035509 (=> (not res!691352) (not e!585460))))

(declare-fun lt!457022 () ListLongMap!13761)

(assert (=> b!1035509 (= res!691352 (not (contains!6037 lt!457022 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035510 () Bool)

(declare-fun e!585457 () Bool)

(assert (=> b!1035510 (= e!585457 (isEmpty!930 lt!457022))))

(declare-fun b!1035511 () Bool)

(assert (=> b!1035511 (= e!585457 (= lt!457022 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 lt!456630))))))

(declare-fun b!1035513 () Bool)

(declare-fun lt!457020 () Unit!33837)

(declare-fun lt!457018 () Unit!33837)

(assert (=> b!1035513 (= lt!457020 lt!457018)))

(declare-fun lt!457021 () V!37563)

(declare-fun lt!457019 () (_ BitVec 64))

(declare-fun lt!457017 () (_ BitVec 64))

(declare-fun lt!457023 () ListLongMap!13761)

(assert (=> b!1035513 (not (contains!6037 (+!3126 lt!457023 (tuple2!15727 lt!457017 lt!457021)) lt!457019))))

(assert (=> b!1035513 (= lt!457018 (addStillNotContains!244 lt!457023 lt!457017 lt!457021 lt!457019))))

(assert (=> b!1035513 (= lt!457019 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035513 (= lt!457021 (get!16462 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035513 (= lt!457017 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))

(declare-fun call!43784 () ListLongMap!13761)

(assert (=> b!1035513 (= lt!457023 call!43784)))

(declare-fun e!585458 () ListLongMap!13761)

(assert (=> b!1035513 (= e!585458 (+!3126 call!43784 (tuple2!15727 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035514 () Bool)

(assert (=> b!1035514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> b!1035514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31893 (_values!6249 lt!456630))))))

(declare-fun e!585454 () Bool)

(assert (=> b!1035514 (= e!585454 (= (apply!915 lt!457022 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) (get!16462 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035515 () Bool)

(declare-fun e!585455 () Bool)

(assert (=> b!1035515 (= e!585455 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> b!1035515 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1035516 () Bool)

(declare-fun e!585459 () ListLongMap!13761)

(assert (=> b!1035516 (= e!585459 (ListLongMap!13762 Nil!21889))))

(declare-fun b!1035517 () Bool)

(declare-fun e!585456 () Bool)

(assert (=> b!1035517 (= e!585460 e!585456)))

(declare-fun c!104939 () Bool)

(assert (=> b!1035517 (= c!104939 e!585455)))

(declare-fun res!691351 () Bool)

(assert (=> b!1035517 (=> (not res!691351) (not e!585455))))

(assert (=> b!1035517 (= res!691351 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun b!1035518 () Bool)

(assert (=> b!1035518 (= e!585458 call!43784)))

(declare-fun b!1035519 () Bool)

(assert (=> b!1035519 (= e!585456 e!585454)))

(assert (=> b!1035519 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun res!691353 () Bool)

(assert (=> b!1035519 (= res!691353 (contains!6037 lt!457022 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (=> b!1035519 (=> (not res!691353) (not e!585454))))

(declare-fun b!1035512 () Bool)

(assert (=> b!1035512 (= e!585459 e!585458)))

(declare-fun c!104941 () Bool)

(assert (=> b!1035512 (= c!104941 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun d!124533 () Bool)

(assert (=> d!124533 e!585460))

(declare-fun res!691350 () Bool)

(assert (=> d!124533 (=> (not res!691350) (not e!585460))))

(assert (=> d!124533 (= res!691350 (not (contains!6037 lt!457022 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124533 (= lt!457022 e!585459)))

(declare-fun c!104940 () Bool)

(assert (=> d!124533 (= c!104940 (bvsge #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124533 (validMask!0 (mask!30143 lt!456630))))

(assert (=> d!124533 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) #b00000000000000000000000000000000 (defaultEntry!6226 lt!456630)) lt!457022)))

(declare-fun b!1035520 () Bool)

(assert (=> b!1035520 (= e!585456 e!585457)))

(declare-fun c!104938 () Bool)

(assert (=> b!1035520 (= c!104938 (bvslt #b00000000000000000000000000000000 (size!31892 (_keys!11444 lt!456630))))))

(declare-fun bm!43781 () Bool)

(assert (=> bm!43781 (= call!43784 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 lt!456630) (_values!6249 lt!456630) (mask!30143 lt!456630) (extraKeys!5958 lt!456630) (zeroValue!6062 lt!456630) (minValue!6062 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 lt!456630)))))

(assert (= (and d!124533 c!104940) b!1035516))

(assert (= (and d!124533 (not c!104940)) b!1035512))

(assert (= (and b!1035512 c!104941) b!1035513))

(assert (= (and b!1035512 (not c!104941)) b!1035518))

(assert (= (or b!1035513 b!1035518) bm!43781))

(assert (= (and d!124533 res!691350) b!1035509))

(assert (= (and b!1035509 res!691352) b!1035517))

(assert (= (and b!1035517 res!691351) b!1035515))

(assert (= (and b!1035517 c!104939) b!1035519))

(assert (= (and b!1035517 (not c!104939)) b!1035520))

(assert (= (and b!1035519 res!691353) b!1035514))

(assert (= (and b!1035520 c!104938) b!1035511))

(assert (= (and b!1035520 (not c!104938)) b!1035510))

(declare-fun b_lambda!16093 () Bool)

(assert (=> (not b_lambda!16093) (not b!1035513)))

(assert (=> b!1035513 t!31087))

(declare-fun b_and!33305 () Bool)

(assert (= b_and!33303 (and (=> t!31087 result!14389) b_and!33305)))

(declare-fun b_lambda!16095 () Bool)

(assert (=> (not b_lambda!16095) (not b!1035514)))

(assert (=> b!1035514 t!31087))

(declare-fun b_and!33307 () Bool)

(assert (= b_and!33305 (and (=> t!31087 result!14389) b_and!33307)))

(assert (=> b!1035514 m!955297))

(declare-fun m!955935 () Bool)

(assert (=> b!1035514 m!955935))

(assert (=> b!1035514 m!955383))

(assert (=> b!1035514 m!955385))

(assert (=> b!1035514 m!955387))

(assert (=> b!1035514 m!955385))

(assert (=> b!1035514 m!955383))

(assert (=> b!1035514 m!955297))

(declare-fun m!955937 () Bool)

(assert (=> b!1035513 m!955937))

(declare-fun m!955939 () Bool)

(assert (=> b!1035513 m!955939))

(declare-fun m!955941 () Bool)

(assert (=> b!1035513 m!955941))

(assert (=> b!1035513 m!955383))

(assert (=> b!1035513 m!955385))

(assert (=> b!1035513 m!955387))

(assert (=> b!1035513 m!955385))

(assert (=> b!1035513 m!955383))

(assert (=> b!1035513 m!955937))

(declare-fun m!955943 () Bool)

(assert (=> b!1035513 m!955943))

(assert (=> b!1035513 m!955297))

(declare-fun m!955945 () Bool)

(assert (=> bm!43781 m!955945))

(assert (=> b!1035512 m!955297))

(assert (=> b!1035512 m!955297))

(assert (=> b!1035512 m!955299))

(declare-fun m!955947 () Bool)

(assert (=> b!1035510 m!955947))

(assert (=> b!1035519 m!955297))

(assert (=> b!1035519 m!955297))

(declare-fun m!955949 () Bool)

(assert (=> b!1035519 m!955949))

(assert (=> b!1035511 m!955945))

(assert (=> b!1035515 m!955297))

(assert (=> b!1035515 m!955297))

(assert (=> b!1035515 m!955299))

(declare-fun m!955951 () Bool)

(assert (=> b!1035509 m!955951))

(declare-fun m!955953 () Bool)

(assert (=> d!124533 m!955953))

(assert (=> d!124533 m!955393))

(assert (=> b!1035216 d!124533))

(declare-fun d!124535 () Bool)

(assert (=> d!124535 (= (apply!915 (+!3126 lt!456868 (tuple2!15727 lt!456869 (minValue!6062 lt!456630))) lt!456870) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456868 (tuple2!15727 lt!456869 (minValue!6062 lt!456630)))) lt!456870)))))

(declare-fun bs!30267 () Bool)

(assert (= bs!30267 d!124535))

(declare-fun m!955955 () Bool)

(assert (=> bs!30267 m!955955))

(assert (=> bs!30267 m!955955))

(declare-fun m!955957 () Bool)

(assert (=> bs!30267 m!955957))

(assert (=> b!1035216 d!124535))

(declare-fun d!124537 () Bool)

(assert (=> d!124537 (= (apply!915 (+!3126 lt!456859 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) lt!456865) (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456859 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))) lt!456865)))))

(declare-fun bs!30268 () Bool)

(assert (= bs!30268 d!124537))

(declare-fun m!955959 () Bool)

(assert (=> bs!30268 m!955959))

(assert (=> bs!30268 m!955959))

(declare-fun m!955961 () Bool)

(assert (=> bs!30268 m!955961))

(assert (=> b!1035216 d!124537))

(declare-fun d!124539 () Bool)

(assert (=> d!124539 (= (apply!915 (+!3126 lt!456859 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) lt!456865) (apply!915 lt!456859 lt!456865))))

(declare-fun lt!457024 () Unit!33837)

(assert (=> d!124539 (= lt!457024 (choose!1701 lt!456859 lt!456875 (minValue!6062 lt!456630) lt!456865))))

(declare-fun e!585461 () Bool)

(assert (=> d!124539 e!585461))

(declare-fun res!691354 () Bool)

(assert (=> d!124539 (=> (not res!691354) (not e!585461))))

(assert (=> d!124539 (= res!691354 (contains!6037 lt!456859 lt!456865))))

(assert (=> d!124539 (= (addApplyDifferent!481 lt!456859 lt!456875 (minValue!6062 lt!456630) lt!456865) lt!457024)))

(declare-fun b!1035521 () Bool)

(assert (=> b!1035521 (= e!585461 (not (= lt!456865 lt!456875)))))

(assert (= (and d!124539 res!691354) b!1035521))

(declare-fun m!955963 () Bool)

(assert (=> d!124539 m!955963))

(assert (=> d!124539 m!955405))

(assert (=> d!124539 m!955419))

(assert (=> d!124539 m!955411))

(declare-fun m!955965 () Bool)

(assert (=> d!124539 m!955965))

(assert (=> d!124539 m!955405))

(assert (=> b!1035216 d!124539))

(declare-fun d!124541 () Bool)

(assert (=> d!124541 (= (apply!915 lt!456864 lt!456858) (get!16463 (getValueByKey!584 (toList!6896 lt!456864) lt!456858)))))

(declare-fun bs!30269 () Bool)

(assert (= bs!30269 d!124541))

(declare-fun m!955967 () Bool)

(assert (=> bs!30269 m!955967))

(assert (=> bs!30269 m!955967))

(declare-fun m!955969 () Bool)

(assert (=> bs!30269 m!955969))

(assert (=> b!1035216 d!124541))

(declare-fun d!124543 () Bool)

(declare-fun e!585462 () Bool)

(assert (=> d!124543 e!585462))

(declare-fun res!691355 () Bool)

(assert (=> d!124543 (=> (not res!691355) (not e!585462))))

(declare-fun lt!457026 () ListLongMap!13761)

(assert (=> d!124543 (= res!691355 (contains!6037 lt!457026 (_1!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))))))

(declare-fun lt!457028 () List!21892)

(assert (=> d!124543 (= lt!457026 (ListLongMap!13762 lt!457028))))

(declare-fun lt!457027 () Unit!33837)

(declare-fun lt!457025 () Unit!33837)

(assert (=> d!124543 (= lt!457027 lt!457025)))

(assert (=> d!124543 (= (getValueByKey!584 lt!457028 (_1!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124543 (= lt!457025 (lemmaContainsTupThenGetReturnValue!280 lt!457028 (_1!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124543 (= lt!457028 (insertStrictlySorted!373 (toList!6896 lt!456860) (_1!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))))))

(assert (=> d!124543 (= (+!3126 lt!456860 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))) lt!457026)))

(declare-fun b!1035522 () Bool)

(declare-fun res!691356 () Bool)

(assert (=> b!1035522 (=> (not res!691356) (not e!585462))))

(assert (=> b!1035522 (= res!691356 (= (getValueByKey!584 (toList!6896 lt!457026) (_1!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))))))))

(declare-fun b!1035523 () Bool)

(assert (=> b!1035523 (= e!585462 (contains!6038 (toList!6896 lt!457026) (tuple2!15727 lt!456877 (zeroValue!6062 lt!456630))))))

(assert (= (and d!124543 res!691355) b!1035522))

(assert (= (and b!1035522 res!691356) b!1035523))

(declare-fun m!955971 () Bool)

(assert (=> d!124543 m!955971))

(declare-fun m!955973 () Bool)

(assert (=> d!124543 m!955973))

(declare-fun m!955975 () Bool)

(assert (=> d!124543 m!955975))

(declare-fun m!955977 () Bool)

(assert (=> d!124543 m!955977))

(declare-fun m!955979 () Bool)

(assert (=> b!1035522 m!955979))

(declare-fun m!955981 () Bool)

(assert (=> b!1035523 m!955981))

(assert (=> b!1035216 d!124543))

(declare-fun d!124545 () Bool)

(declare-fun e!585463 () Bool)

(assert (=> d!124545 e!585463))

(declare-fun res!691357 () Bool)

(assert (=> d!124545 (=> (not res!691357) (not e!585463))))

(declare-fun lt!457030 () ListLongMap!13761)

(assert (=> d!124545 (= res!691357 (contains!6037 lt!457030 (_1!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))))))

(declare-fun lt!457032 () List!21892)

(assert (=> d!124545 (= lt!457030 (ListLongMap!13762 lt!457032))))

(declare-fun lt!457031 () Unit!33837)

(declare-fun lt!457029 () Unit!33837)

(assert (=> d!124545 (= lt!457031 lt!457029)))

(assert (=> d!124545 (= (getValueByKey!584 lt!457032 (_1!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))))))

(assert (=> d!124545 (= lt!457029 (lemmaContainsTupThenGetReturnValue!280 lt!457032 (_1!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))))))

(assert (=> d!124545 (= lt!457032 (insertStrictlySorted!373 (toList!6896 lt!456859) (_1!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) (_2!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))))))

(assert (=> d!124545 (= (+!3126 lt!456859 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))) lt!457030)))

(declare-fun b!1035524 () Bool)

(declare-fun res!691358 () Bool)

(assert (=> b!1035524 (=> (not res!691358) (not e!585463))))

(assert (=> b!1035524 (= res!691358 (= (getValueByKey!584 (toList!6896 lt!457030) (_1!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630)))) (Some!634 (_2!7874 (tuple2!15727 lt!456875 (minValue!6062 lt!456630))))))))

(declare-fun b!1035525 () Bool)

(assert (=> b!1035525 (= e!585463 (contains!6038 (toList!6896 lt!457030) (tuple2!15727 lt!456875 (minValue!6062 lt!456630))))))

(assert (= (and d!124545 res!691357) b!1035524))

(assert (= (and b!1035524 res!691358) b!1035525))

(declare-fun m!955983 () Bool)

(assert (=> d!124545 m!955983))

(declare-fun m!955985 () Bool)

(assert (=> d!124545 m!955985))

(declare-fun m!955987 () Bool)

(assert (=> d!124545 m!955987))

(declare-fun m!955989 () Bool)

(assert (=> d!124545 m!955989))

(declare-fun m!955991 () Bool)

(assert (=> b!1035524 m!955991))

(declare-fun m!955993 () Bool)

(assert (=> b!1035525 m!955993))

(assert (=> b!1035216 d!124545))

(declare-fun d!124547 () Bool)

(declare-fun lt!457033 () Bool)

(assert (=> d!124547 (= lt!457033 (select (content!515 (toList!6896 lt!456785)) (tuple2!15727 lt!456717 lt!456631)))))

(declare-fun e!585464 () Bool)

(assert (=> d!124547 (= lt!457033 e!585464)))

(declare-fun res!691359 () Bool)

(assert (=> d!124547 (=> (not res!691359) (not e!585464))))

(assert (=> d!124547 (= res!691359 ((_ is Cons!21888) (toList!6896 lt!456785)))))

(assert (=> d!124547 (= (contains!6038 (toList!6896 lt!456785) (tuple2!15727 lt!456717 lt!456631)) lt!457033)))

(declare-fun b!1035526 () Bool)

(declare-fun e!585465 () Bool)

(assert (=> b!1035526 (= e!585464 e!585465)))

(declare-fun res!691360 () Bool)

(assert (=> b!1035526 (=> res!691360 e!585465)))

(assert (=> b!1035526 (= res!691360 (= (h!23099 (toList!6896 lt!456785)) (tuple2!15727 lt!456717 lt!456631)))))

(declare-fun b!1035527 () Bool)

(assert (=> b!1035527 (= e!585465 (contains!6038 (t!31080 (toList!6896 lt!456785)) (tuple2!15727 lt!456717 lt!456631)))))

(assert (= (and d!124547 res!691359) b!1035526))

(assert (= (and b!1035526 (not res!691360)) b!1035527))

(declare-fun m!955995 () Bool)

(assert (=> d!124547 m!955995))

(declare-fun m!955997 () Bool)

(assert (=> d!124547 m!955997))

(declare-fun m!955999 () Bool)

(assert (=> b!1035527 m!955999))

(assert (=> b!1035092 d!124547))

(declare-fun d!124549 () Bool)

(assert (=> d!124549 (= ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (Cons!21888 (h!23099 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) (removeStrictlySorted!55 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035125 d!124549))

(declare-fun b!1035528 () Bool)

(declare-fun e!585466 () Bool)

(declare-fun lt!457034 () List!21892)

(assert (=> b!1035528 (= e!585466 (not (containsKey!565 lt!457034 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035529 () Bool)

(declare-fun e!585467 () List!21892)

(assert (=> b!1035529 (= e!585467 Nil!21889)))

(declare-fun b!1035530 () Bool)

(assert (=> b!1035530 (= e!585467 ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23099 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))))

(declare-fun b!1035531 () Bool)

(declare-fun e!585468 () List!21892)

(assert (=> b!1035531 (= e!585468 e!585467)))

(declare-fun c!104942 () Bool)

(assert (=> b!1035531 (= c!104942 (and ((_ is Cons!21888) (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (not (= (_1!7874 (h!23099 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!124551 () Bool)

(assert (=> d!124551 e!585466))

(declare-fun res!691361 () Bool)

(assert (=> d!124551 (=> (not res!691361) (not e!585466))))

(assert (=> d!124551 (= res!691361 (isStrictlySorted!706 lt!457034))))

(assert (=> d!124551 (= lt!457034 e!585468)))

(declare-fun c!104943 () Bool)

(assert (=> d!124551 (= c!104943 (and ((_ is Cons!21888) (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))) (= (_1!7874 (h!23099 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124551 (isStrictlySorted!706 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))))))

(assert (=> d!124551 (= (removeStrictlySorted!55 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457034)))

(declare-fun b!1035532 () Bool)

(assert (=> b!1035532 (= e!585468 (t!31080 (t!31080 (toList!6896 (getCurrentListMap!3942 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6226 thiss!1427))))))))

(assert (= (and d!124551 c!104943) b!1035532))

(assert (= (and d!124551 (not c!104943)) b!1035531))

(assert (= (and b!1035531 c!104942) b!1035530))

(assert (= (and b!1035531 (not c!104942)) b!1035529))

(assert (= (and d!124551 res!691361) b!1035528))

(declare-fun m!956001 () Bool)

(assert (=> b!1035528 m!956001))

(declare-fun m!956003 () Bool)

(assert (=> b!1035530 m!956003))

(assert (=> b!1035530 m!956003))

(declare-fun m!956005 () Bool)

(assert (=> b!1035530 m!956005))

(declare-fun m!956007 () Bool)

(assert (=> d!124551 m!956007))

(assert (=> d!124551 m!955855))

(assert (=> b!1035125 d!124551))

(declare-fun b!1035533 () Bool)

(declare-fun res!691364 () Bool)

(declare-fun e!585475 () Bool)

(assert (=> b!1035533 (=> (not res!691364) (not e!585475))))

(declare-fun lt!457040 () ListLongMap!13761)

(assert (=> b!1035533 (= res!691364 (not (contains!6037 lt!457040 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035534 () Bool)

(declare-fun e!585472 () Bool)

(assert (=> b!1035534 (= e!585472 (isEmpty!930 lt!457040))))

(declare-fun b!1035535 () Bool)

(assert (=> b!1035535 (= e!585472 (= lt!457040 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427))))))

(declare-fun b!1035537 () Bool)

(declare-fun lt!457038 () Unit!33837)

(declare-fun lt!457036 () Unit!33837)

(assert (=> b!1035537 (= lt!457038 lt!457036)))

(declare-fun lt!457035 () (_ BitVec 64))

(declare-fun lt!457039 () V!37563)

(declare-fun lt!457041 () ListLongMap!13761)

(declare-fun lt!457037 () (_ BitVec 64))

(assert (=> b!1035537 (not (contains!6037 (+!3126 lt!457041 (tuple2!15727 lt!457035 lt!457039)) lt!457037))))

(assert (=> b!1035537 (= lt!457036 (addStillNotContains!244 lt!457041 lt!457035 lt!457039 lt!457037))))

(assert (=> b!1035537 (= lt!457037 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1035537 (= lt!457039 (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1035537 (= lt!457035 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun call!43785 () ListLongMap!13761)

(assert (=> b!1035537 (= lt!457041 call!43785)))

(declare-fun e!585473 () ListLongMap!13761)

(assert (=> b!1035537 (= e!585473 (+!3126 call!43785 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1035538 () Bool)

(assert (=> b!1035538 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> b!1035538 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31893 (_values!6249 thiss!1427))))))

(declare-fun e!585469 () Bool)

(assert (=> b!1035538 (= e!585469 (= (apply!915 lt!457040 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035539 () Bool)

(declare-fun e!585470 () Bool)

(assert (=> b!1035539 (= e!585470 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035539 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1035540 () Bool)

(declare-fun e!585474 () ListLongMap!13761)

(assert (=> b!1035540 (= e!585474 (ListLongMap!13762 Nil!21889))))

(declare-fun b!1035541 () Bool)

(declare-fun e!585471 () Bool)

(assert (=> b!1035541 (= e!585475 e!585471)))

(declare-fun c!104945 () Bool)

(assert (=> b!1035541 (= c!104945 e!585470)))

(declare-fun res!691363 () Bool)

(assert (=> b!1035541 (=> (not res!691363) (not e!585470))))

(assert (=> b!1035541 (= res!691363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035542 () Bool)

(assert (=> b!1035542 (= e!585473 call!43785)))

(declare-fun b!1035543 () Bool)

(assert (=> b!1035543 (= e!585471 e!585469)))

(assert (=> b!1035543 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun res!691365 () Bool)

(assert (=> b!1035543 (= res!691365 (contains!6037 lt!457040 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035543 (=> (not res!691365) (not e!585469))))

(declare-fun b!1035536 () Bool)

(assert (=> b!1035536 (= e!585474 e!585473)))

(declare-fun c!104947 () Bool)

(assert (=> b!1035536 (= c!104947 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124553 () Bool)

(assert (=> d!124553 e!585475))

(declare-fun res!691362 () Bool)

(assert (=> d!124553 (=> (not res!691362) (not e!585475))))

(assert (=> d!124553 (= res!691362 (not (contains!6037 lt!457040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124553 (= lt!457040 e!585474)))

(declare-fun c!104946 () Bool)

(assert (=> d!124553 (= c!104946 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124553 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124553 (= (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)) lt!457040)))

(declare-fun b!1035544 () Bool)

(assert (=> b!1035544 (= e!585471 e!585472)))

(declare-fun c!104944 () Bool)

(assert (=> b!1035544 (= c!104944 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun bm!43782 () Bool)

(assert (=> bm!43782 (= call!43785 (getCurrentListMapNoExtraKeys!3566 (_keys!11444 thiss!1427) (_values!6249 thiss!1427) (mask!30143 thiss!1427) (extraKeys!5958 thiss!1427) (zeroValue!6062 thiss!1427) (minValue!6062 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6226 thiss!1427)))))

(assert (= (and d!124553 c!104946) b!1035540))

(assert (= (and d!124553 (not c!104946)) b!1035536))

(assert (= (and b!1035536 c!104947) b!1035537))

(assert (= (and b!1035536 (not c!104947)) b!1035542))

(assert (= (or b!1035537 b!1035542) bm!43782))

(assert (= (and d!124553 res!691362) b!1035533))

(assert (= (and b!1035533 res!691364) b!1035541))

(assert (= (and b!1035541 res!691363) b!1035539))

(assert (= (and b!1035541 c!104945) b!1035543))

(assert (= (and b!1035541 (not c!104945)) b!1035544))

(assert (= (and b!1035543 res!691365) b!1035538))

(assert (= (and b!1035544 c!104944) b!1035535))

(assert (= (and b!1035544 (not c!104944)) b!1035534))

(declare-fun b_lambda!16097 () Bool)

(assert (=> (not b_lambda!16097) (not b!1035537)))

(assert (=> b!1035537 t!31079))

(declare-fun b_and!33309 () Bool)

(assert (= b_and!33307 (and (=> t!31079 result!14375) b_and!33309)))

(declare-fun b_lambda!16099 () Bool)

(assert (=> (not b_lambda!16099) (not b!1035538)))

(assert (=> b!1035538 t!31079))

(declare-fun b_and!33311 () Bool)

(assert (= b_and!33309 (and (=> t!31079 result!14375) b_and!33311)))

(assert (=> b!1035538 m!955735))

(declare-fun m!956009 () Bool)

(assert (=> b!1035538 m!956009))

(assert (=> b!1035538 m!955757))

(assert (=> b!1035538 m!954937))

(assert (=> b!1035538 m!955759))

(assert (=> b!1035538 m!954937))

(assert (=> b!1035538 m!955757))

(assert (=> b!1035538 m!955735))

(declare-fun m!956011 () Bool)

(assert (=> b!1035537 m!956011))

(declare-fun m!956013 () Bool)

(assert (=> b!1035537 m!956013))

(declare-fun m!956015 () Bool)

(assert (=> b!1035537 m!956015))

(assert (=> b!1035537 m!955757))

(assert (=> b!1035537 m!954937))

(assert (=> b!1035537 m!955759))

(assert (=> b!1035537 m!954937))

(assert (=> b!1035537 m!955757))

(assert (=> b!1035537 m!956011))

(declare-fun m!956017 () Bool)

(assert (=> b!1035537 m!956017))

(assert (=> b!1035537 m!955735))

(declare-fun m!956019 () Bool)

(assert (=> bm!43782 m!956019))

(assert (=> b!1035536 m!955735))

(assert (=> b!1035536 m!955735))

(assert (=> b!1035536 m!955737))

(declare-fun m!956021 () Bool)

(assert (=> b!1035534 m!956021))

(assert (=> b!1035543 m!955735))

(assert (=> b!1035543 m!955735))

(declare-fun m!956023 () Bool)

(assert (=> b!1035543 m!956023))

(assert (=> b!1035535 m!956019))

(assert (=> b!1035539 m!955735))

(assert (=> b!1035539 m!955735))

(assert (=> b!1035539 m!955737))

(declare-fun m!956025 () Bool)

(assert (=> b!1035533 m!956025))

(declare-fun m!956027 () Bool)

(assert (=> d!124553 m!956027))

(assert (=> d!124553 m!955047))

(assert (=> bm!43757 d!124553))

(declare-fun lt!457042 () Bool)

(declare-fun d!124555 () Bool)

(assert (=> d!124555 (= lt!457042 (select (content!515 (toList!6896 lt!456909)) (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))

(declare-fun e!585476 () Bool)

(assert (=> d!124555 (= lt!457042 e!585476)))

(declare-fun res!691366 () Bool)

(assert (=> d!124555 (=> (not res!691366) (not e!585476))))

(assert (=> d!124555 (= res!691366 ((_ is Cons!21888) (toList!6896 lt!456909)))))

(assert (=> d!124555 (= (contains!6038 (toList!6896 lt!456909) (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!457042)))

(declare-fun b!1035545 () Bool)

(declare-fun e!585477 () Bool)

(assert (=> b!1035545 (= e!585476 e!585477)))

(declare-fun res!691367 () Bool)

(assert (=> b!1035545 (=> res!691367 e!585477)))

(assert (=> b!1035545 (= res!691367 (= (h!23099 (toList!6896 lt!456909)) (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))

(declare-fun b!1035546 () Bool)

(assert (=> b!1035546 (= e!585477 (contains!6038 (t!31080 (toList!6896 lt!456909)) (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!124555 res!691366) b!1035545))

(assert (= (and b!1035545 (not res!691367)) b!1035546))

(declare-fun m!956029 () Bool)

(assert (=> d!124555 m!956029))

(declare-fun m!956031 () Bool)

(assert (=> d!124555 m!956031))

(declare-fun m!956033 () Bool)

(assert (=> b!1035546 m!956033))

(assert (=> b!1035262 d!124555))

(declare-fun d!124557 () Bool)

(assert (=> d!124557 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456730) lt!456724)) (v!14885 (getValueByKey!584 (toList!6896 lt!456730) lt!456724)))))

(assert (=> d!124391 d!124557))

(declare-fun b!1035547 () Bool)

(declare-fun e!585478 () Option!635)

(assert (=> b!1035547 (= e!585478 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456730)))))))

(declare-fun b!1035548 () Bool)

(declare-fun e!585479 () Option!635)

(assert (=> b!1035548 (= e!585478 e!585479)))

(declare-fun c!104949 () Bool)

(assert (=> b!1035548 (= c!104949 (and ((_ is Cons!21888) (toList!6896 lt!456730)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456730))) lt!456724))))))

(declare-fun b!1035550 () Bool)

(assert (=> b!1035550 (= e!585479 None!633)))

(declare-fun b!1035549 () Bool)

(assert (=> b!1035549 (= e!585479 (getValueByKey!584 (t!31080 (toList!6896 lt!456730)) lt!456724))))

(declare-fun d!124559 () Bool)

(declare-fun c!104948 () Bool)

(assert (=> d!124559 (= c!104948 (and ((_ is Cons!21888) (toList!6896 lt!456730)) (= (_1!7874 (h!23099 (toList!6896 lt!456730))) lt!456724)))))

(assert (=> d!124559 (= (getValueByKey!584 (toList!6896 lt!456730) lt!456724) e!585478)))

(assert (= (and d!124559 c!104948) b!1035547))

(assert (= (and d!124559 (not c!104948)) b!1035548))

(assert (= (and b!1035548 c!104949) b!1035549))

(assert (= (and b!1035548 (not c!104949)) b!1035550))

(declare-fun m!956035 () Bool)

(assert (=> b!1035549 m!956035))

(assert (=> d!124391 d!124559))

(declare-fun d!124561 () Bool)

(assert (=> d!124561 (= (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))))

(declare-fun bs!30270 () Bool)

(assert (= bs!30270 d!124561))

(assert (=> bs!30270 m!955511))

(declare-fun m!956037 () Bool)

(assert (=> bs!30270 m!956037))

(assert (=> b!1035258 d!124561))

(declare-fun b!1035551 () Bool)

(declare-fun e!585480 () Option!635)

(assert (=> b!1035551 (= e!585480 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))))

(declare-fun b!1035552 () Bool)

(declare-fun e!585481 () Option!635)

(assert (=> b!1035552 (= e!585480 e!585481)))

(declare-fun c!104951 () Bool)

(assert (=> b!1035552 (= c!104951 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) lt!456729))))))

(declare-fun b!1035554 () Bool)

(assert (=> b!1035554 (= e!585481 None!633)))

(declare-fun b!1035553 () Bool)

(assert (=> b!1035553 (= e!585481 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) lt!456729))))

(declare-fun c!104950 () Bool)

(declare-fun d!124563 () Bool)

(assert (=> d!124563 (= c!104950 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) lt!456729)))))

(assert (=> d!124563 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729) e!585480)))

(assert (= (and d!124563 c!104950) b!1035551))

(assert (= (and d!124563 (not c!104950)) b!1035552))

(assert (= (and b!1035552 c!104951) b!1035553))

(assert (= (and b!1035552 (not c!104951)) b!1035554))

(declare-fun m!956039 () Bool)

(assert (=> b!1035553 m!956039))

(assert (=> b!1035258 d!124563))

(assert (=> d!124349 d!124285))

(assert (=> d!124349 d!124287))

(assert (=> d!124349 d!124281))

(assert (=> d!124359 d!124469))

(declare-fun d!124565 () Bool)

(declare-fun lt!457043 () Bool)

(assert (=> d!124565 (= lt!457043 (select (content!515 (toList!6896 lt!456887)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun e!585482 () Bool)

(assert (=> d!124565 (= lt!457043 e!585482)))

(declare-fun res!691368 () Bool)

(assert (=> d!124565 (=> (not res!691368) (not e!585482))))

(assert (=> d!124565 (= res!691368 ((_ is Cons!21888) (toList!6896 lt!456887)))))

(assert (=> d!124565 (= (contains!6038 (toList!6896 lt!456887) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!457043)))

(declare-fun b!1035555 () Bool)

(declare-fun e!585483 () Bool)

(assert (=> b!1035555 (= e!585482 e!585483)))

(declare-fun res!691369 () Bool)

(assert (=> b!1035555 (=> res!691369 e!585483)))

(assert (=> b!1035555 (= res!691369 (= (h!23099 (toList!6896 lt!456887)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1035556 () Bool)

(assert (=> b!1035556 (= e!585483 (contains!6038 (t!31080 (toList!6896 lt!456887)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124565 res!691368) b!1035555))

(assert (= (and b!1035555 (not res!691369)) b!1035556))

(declare-fun m!956041 () Bool)

(assert (=> d!124565 m!956041))

(declare-fun m!956043 () Bool)

(assert (=> d!124565 m!956043))

(declare-fun m!956045 () Bool)

(assert (=> b!1035556 m!956045))

(assert (=> b!1035242 d!124565))

(assert (=> b!1035075 d!124323))

(declare-fun d!124567 () Bool)

(assert (=> d!124567 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456699) lt!456705)) (v!14885 (getValueByKey!584 (toList!6896 lt!456699) lt!456705)))))

(assert (=> d!124313 d!124567))

(declare-fun b!1035557 () Bool)

(declare-fun e!585484 () Option!635)

(assert (=> b!1035557 (= e!585484 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456699)))))))

(declare-fun b!1035558 () Bool)

(declare-fun e!585485 () Option!635)

(assert (=> b!1035558 (= e!585484 e!585485)))

(declare-fun c!104953 () Bool)

(assert (=> b!1035558 (= c!104953 (and ((_ is Cons!21888) (toList!6896 lt!456699)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456699))) lt!456705))))))

(declare-fun b!1035560 () Bool)

(assert (=> b!1035560 (= e!585485 None!633)))

(declare-fun b!1035559 () Bool)

(assert (=> b!1035559 (= e!585485 (getValueByKey!584 (t!31080 (toList!6896 lt!456699)) lt!456705))))

(declare-fun d!124569 () Bool)

(declare-fun c!104952 () Bool)

(assert (=> d!124569 (= c!104952 (and ((_ is Cons!21888) (toList!6896 lt!456699)) (= (_1!7874 (h!23099 (toList!6896 lt!456699))) lt!456705)))))

(assert (=> d!124569 (= (getValueByKey!584 (toList!6896 lt!456699) lt!456705) e!585484)))

(assert (= (and d!124569 c!104952) b!1035557))

(assert (= (and d!124569 (not c!104952)) b!1035558))

(assert (= (and b!1035558 c!104953) b!1035559))

(assert (= (and b!1035558 (not c!104953)) b!1035560))

(declare-fun m!956047 () Bool)

(assert (=> b!1035559 m!956047))

(assert (=> d!124313 d!124569))

(declare-fun d!124571 () Bool)

(assert (=> d!124571 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456704) lt!456698)) (v!14885 (getValueByKey!584 (toList!6896 lt!456704) lt!456698)))))

(assert (=> d!124309 d!124571))

(declare-fun b!1035561 () Bool)

(declare-fun e!585486 () Option!635)

(assert (=> b!1035561 (= e!585486 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456704)))))))

(declare-fun b!1035562 () Bool)

(declare-fun e!585487 () Option!635)

(assert (=> b!1035562 (= e!585486 e!585487)))

(declare-fun c!104955 () Bool)

(assert (=> b!1035562 (= c!104955 (and ((_ is Cons!21888) (toList!6896 lt!456704)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456704))) lt!456698))))))

(declare-fun b!1035564 () Bool)

(assert (=> b!1035564 (= e!585487 None!633)))

(declare-fun b!1035563 () Bool)

(assert (=> b!1035563 (= e!585487 (getValueByKey!584 (t!31080 (toList!6896 lt!456704)) lt!456698))))

(declare-fun d!124573 () Bool)

(declare-fun c!104954 () Bool)

(assert (=> d!124573 (= c!104954 (and ((_ is Cons!21888) (toList!6896 lt!456704)) (= (_1!7874 (h!23099 (toList!6896 lt!456704))) lt!456698)))))

(assert (=> d!124573 (= (getValueByKey!584 (toList!6896 lt!456704) lt!456698) e!585486)))

(assert (= (and d!124573 c!104954) b!1035561))

(assert (= (and d!124573 (not c!104954)) b!1035562))

(assert (= (and b!1035562 c!104955) b!1035563))

(assert (= (and b!1035562 (not c!104955)) b!1035564))

(declare-fun m!956049 () Bool)

(assert (=> b!1035563 m!956049))

(assert (=> d!124309 d!124573))

(declare-fun d!124575 () Bool)

(assert (=> d!124575 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30271 () Bool)

(assert (= bs!30271 d!124575))

(assert (=> bs!30271 m!955455))

(declare-fun m!956051 () Bool)

(assert (=> bs!30271 m!956051))

(assert (=> b!1035245 d!124575))

(declare-fun b!1035565 () Bool)

(declare-fun e!585488 () Option!635)

(assert (=> b!1035565 (= e!585488 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456716)))))))

(declare-fun b!1035566 () Bool)

(declare-fun e!585489 () Option!635)

(assert (=> b!1035566 (= e!585488 e!585489)))

(declare-fun c!104957 () Bool)

(assert (=> b!1035566 (= c!104957 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456716))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun b!1035568 () Bool)

(assert (=> b!1035568 (= e!585489 None!633)))

(declare-fun b!1035567 () Bool)

(assert (=> b!1035567 (= e!585489 (getValueByKey!584 (t!31080 (toList!6896 lt!456716)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124577 () Bool)

(declare-fun c!104956 () Bool)

(assert (=> d!124577 (= c!104956 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124577 (= (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) e!585488)))

(assert (= (and d!124577 c!104956) b!1035565))

(assert (= (and d!124577 (not c!104956)) b!1035566))

(assert (= (and b!1035566 c!104957) b!1035567))

(assert (= (and b!1035566 (not c!104957)) b!1035568))

(assert (=> b!1035567 m!955035))

(declare-fun m!956053 () Bool)

(assert (=> b!1035567 m!956053))

(assert (=> b!1035245 d!124577))

(assert (=> b!1035193 d!124323))

(declare-fun b!1035569 () Bool)

(declare-fun e!585490 () Option!635)

(assert (=> b!1035569 (= e!585490 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456919)))))))

(declare-fun b!1035570 () Bool)

(declare-fun e!585491 () Option!635)

(assert (=> b!1035570 (= e!585490 e!585491)))

(declare-fun c!104959 () Bool)

(assert (=> b!1035570 (= c!104959 (and ((_ is Cons!21888) (toList!6896 lt!456919)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456919))) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))))

(declare-fun b!1035572 () Bool)

(assert (=> b!1035572 (= e!585491 None!633)))

(declare-fun b!1035571 () Bool)

(assert (=> b!1035571 (= e!585491 (getValueByKey!584 (t!31080 (toList!6896 lt!456919)) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun c!104958 () Bool)

(declare-fun d!124579 () Bool)

(assert (=> d!124579 (= c!104958 (and ((_ is Cons!21888) (toList!6896 lt!456919)) (= (_1!7874 (h!23099 (toList!6896 lt!456919))) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124579 (= (getValueByKey!584 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) e!585490)))

(assert (= (and d!124579 c!104958) b!1035569))

(assert (= (and d!124579 (not c!104958)) b!1035570))

(assert (= (and b!1035570 c!104959) b!1035571))

(assert (= (and b!1035570 (not c!104959)) b!1035572))

(declare-fun m!956055 () Bool)

(assert (=> b!1035571 m!956055))

(assert (=> b!1035267 d!124579))

(declare-fun d!124581 () Bool)

(assert (=> d!124581 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!456705)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!456705)))))

(assert (=> d!124317 d!124581))

(declare-fun b!1035573 () Bool)

(declare-fun e!585492 () Option!635)

(assert (=> b!1035573 (= e!585492 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035574 () Bool)

(declare-fun e!585493 () Option!635)

(assert (=> b!1035574 (= e!585492 e!585493)))

(declare-fun c!104961 () Bool)

(assert (=> b!1035574 (= c!104961 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))) lt!456705))))))

(declare-fun b!1035576 () Bool)

(assert (=> b!1035576 (= e!585493 None!633)))

(declare-fun b!1035575 () Bool)

(assert (=> b!1035575 (= e!585493 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))) lt!456705))))

(declare-fun c!104960 () Bool)

(declare-fun d!124583 () Bool)

(assert (=> d!124583 (= c!104960 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))) lt!456705)))))

(assert (=> d!124583 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!456705) e!585492)))

(assert (= (and d!124583 c!104960) b!1035573))

(assert (= (and d!124583 (not c!104960)) b!1035574))

(assert (= (and b!1035574 c!104961) b!1035575))

(assert (= (and b!1035574 (not c!104961)) b!1035576))

(declare-fun m!956057 () Bool)

(assert (=> b!1035575 m!956057))

(assert (=> d!124317 d!124583))

(declare-fun d!124585 () Bool)

(declare-fun e!585495 () Bool)

(assert (=> d!124585 e!585495))

(declare-fun res!691370 () Bool)

(assert (=> d!124585 (=> res!691370 e!585495)))

(declare-fun lt!457045 () Bool)

(assert (=> d!124585 (= res!691370 (not lt!457045))))

(declare-fun lt!457044 () Bool)

(assert (=> d!124585 (= lt!457045 lt!457044)))

(declare-fun lt!457047 () Unit!33837)

(declare-fun e!585494 () Unit!33837)

(assert (=> d!124585 (= lt!457047 e!585494)))

(declare-fun c!104962 () Bool)

(assert (=> d!124585 (= c!104962 lt!457044)))

(assert (=> d!124585 (= lt!457044 (containsKey!565 (toList!6896 lt!456730) lt!456724))))

(assert (=> d!124585 (= (contains!6037 lt!456730 lt!456724) lt!457045)))

(declare-fun b!1035577 () Bool)

(declare-fun lt!457046 () Unit!33837)

(assert (=> b!1035577 (= e!585494 lt!457046)))

(assert (=> b!1035577 (= lt!457046 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456730) lt!456724))))

(assert (=> b!1035577 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456730) lt!456724))))

(declare-fun b!1035578 () Bool)

(declare-fun Unit!33859 () Unit!33837)

(assert (=> b!1035578 (= e!585494 Unit!33859)))

(declare-fun b!1035579 () Bool)

(assert (=> b!1035579 (= e!585495 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456730) lt!456724)))))

(assert (= (and d!124585 c!104962) b!1035577))

(assert (= (and d!124585 (not c!104962)) b!1035578))

(assert (= (and d!124585 (not res!691370)) b!1035579))

(declare-fun m!956059 () Bool)

(assert (=> d!124585 m!956059))

(declare-fun m!956061 () Bool)

(assert (=> b!1035577 m!956061))

(assert (=> b!1035577 m!955543))

(assert (=> b!1035577 m!955543))

(declare-fun m!956063 () Bool)

(assert (=> b!1035577 m!956063))

(assert (=> b!1035579 m!955543))

(assert (=> b!1035579 m!955543))

(assert (=> b!1035579 m!956063))

(assert (=> d!124395 d!124585))

(declare-fun d!124587 () Bool)

(assert (=> d!124587 (= (apply!915 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!456724) (apply!915 lt!456730 lt!456724))))

(assert (=> d!124587 true))

(declare-fun _$34!1164 () Unit!33837)

(assert (=> d!124587 (= (choose!1701 lt!456730 lt!456727 (zeroValue!6062 thiss!1427) lt!456724) _$34!1164)))

(declare-fun bs!30272 () Bool)

(assert (= bs!30272 d!124587))

(assert (=> bs!30272 m!955135))

(assert (=> bs!30272 m!955135))

(assert (=> bs!30272 m!955137))

(assert (=> bs!30272 m!955121))

(assert (=> d!124395 d!124587))

(assert (=> d!124395 d!124391))

(assert (=> d!124395 d!124397))

(assert (=> d!124395 d!124403))

(declare-fun b!1035581 () Bool)

(declare-fun e!585499 () Bool)

(assert (=> b!1035581 (= e!585499 (contains!6039 (ite c!104847 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) Nil!21890) Nil!21890) (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035582 () Bool)

(declare-fun e!585497 () Bool)

(declare-fun call!43786 () Bool)

(assert (=> b!1035582 (= e!585497 call!43786)))

(declare-fun b!1035583 () Bool)

(declare-fun e!585496 () Bool)

(assert (=> b!1035583 (= e!585496 e!585497)))

(declare-fun c!104963 () Bool)

(assert (=> b!1035583 (= c!104963 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124589 () Bool)

(declare-fun res!691372 () Bool)

(declare-fun e!585498 () Bool)

(assert (=> d!124589 (=> res!691372 e!585498)))

(assert (=> d!124589 (= res!691372 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124589 (= (arrayNoDuplicates!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104847 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)) e!585498)))

(declare-fun bm!43783 () Bool)

(assert (=> bm!43783 (= call!43786 (arrayNoDuplicates!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104963 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104847 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) Nil!21890) Nil!21890)) (ite c!104847 (Cons!21889 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) Nil!21890) Nil!21890))))))

(declare-fun b!1035584 () Bool)

(assert (=> b!1035584 (= e!585498 e!585496)))

(declare-fun res!691371 () Bool)

(assert (=> b!1035584 (=> (not res!691371) (not e!585496))))

(assert (=> b!1035584 (= res!691371 (not e!585499))))

(declare-fun res!691373 () Bool)

(assert (=> b!1035584 (=> (not res!691373) (not e!585499))))

(assert (=> b!1035584 (= res!691373 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035585 () Bool)

(assert (=> b!1035585 (= e!585497 call!43786)))

(assert (= (and d!124589 (not res!691372)) b!1035584))

(assert (= (and b!1035584 res!691373) b!1035581))

(assert (= (and b!1035584 res!691371) b!1035583))

(assert (= (and b!1035583 c!104963) b!1035585))

(assert (= (and b!1035583 (not c!104963)) b!1035582))

(assert (= (or b!1035585 b!1035582) bm!43783))

(assert (=> b!1035581 m!955735))

(assert (=> b!1035581 m!955735))

(declare-fun m!956065 () Bool)

(assert (=> b!1035581 m!956065))

(assert (=> b!1035583 m!955735))

(assert (=> b!1035583 m!955735))

(assert (=> b!1035583 m!955737))

(assert (=> bm!43783 m!955735))

(declare-fun m!956067 () Bool)

(assert (=> bm!43783 m!956067))

(assert (=> b!1035584 m!955735))

(assert (=> b!1035584 m!955735))

(assert (=> b!1035584 m!955737))

(assert (=> bm!43748 d!124589))

(declare-fun d!124591 () Bool)

(declare-fun res!691374 () Bool)

(declare-fun e!585500 () Bool)

(assert (=> d!124591 (=> res!691374 e!585500)))

(assert (=> d!124591 (= res!691374 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124591 (= (containsKey!565 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000) e!585500)))

(declare-fun b!1035586 () Bool)

(declare-fun e!585501 () Bool)

(assert (=> b!1035586 (= e!585500 e!585501)))

(declare-fun res!691375 () Bool)

(assert (=> b!1035586 (=> (not res!691375) (not e!585501))))

(assert (=> b!1035586 (= res!691375 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456742))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456742))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) (toList!6896 lt!456742)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456742))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035587 () Bool)

(assert (=> b!1035587 (= e!585501 (containsKey!565 (t!31080 (toList!6896 lt!456742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124591 (not res!691374)) b!1035586))

(assert (= (and b!1035586 res!691375) b!1035587))

(declare-fun m!956069 () Bool)

(assert (=> b!1035587 m!956069))

(assert (=> d!124417 d!124591))

(declare-fun d!124593 () Bool)

(declare-fun lt!457050 () Bool)

(declare-fun content!516 (List!21893) (InoxSet (_ BitVec 64)))

(assert (=> d!124593 (= lt!457050 (select (content!516 Nil!21890) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun e!585507 () Bool)

(assert (=> d!124593 (= lt!457050 e!585507)))

(declare-fun res!691381 () Bool)

(assert (=> d!124593 (=> (not res!691381) (not e!585507))))

(assert (=> d!124593 (= res!691381 ((_ is Cons!21889) Nil!21890))))

(assert (=> d!124593 (= (contains!6039 Nil!21890 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) lt!457050)))

(declare-fun b!1035592 () Bool)

(declare-fun e!585506 () Bool)

(assert (=> b!1035592 (= e!585507 e!585506)))

(declare-fun res!691380 () Bool)

(assert (=> b!1035592 (=> res!691380 e!585506)))

(assert (=> b!1035592 (= res!691380 (= (h!23100 Nil!21890) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun b!1035593 () Bool)

(assert (=> b!1035593 (= e!585506 (contains!6039 (t!31085 Nil!21890) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)))))

(assert (= (and d!124593 res!691381) b!1035592))

(assert (= (and b!1035592 (not res!691380)) b!1035593))

(declare-fun m!956071 () Bool)

(assert (=> d!124593 m!956071))

(assert (=> d!124593 m!955297))

(declare-fun m!956073 () Bool)

(assert (=> d!124593 m!956073))

(assert (=> b!1035593 m!955297))

(declare-fun m!956075 () Bool)

(assert (=> b!1035593 m!956075))

(assert (=> b!1035270 d!124593))

(assert (=> b!1035252 d!124481))

(assert (=> bm!43754 d!124533))

(declare-fun d!124595 () Bool)

(assert (=> d!124595 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456734) lt!456736)) (v!14885 (getValueByKey!584 (toList!6896 lt!456734) lt!456736)))))

(assert (=> d!124407 d!124595))

(declare-fun b!1035594 () Bool)

(declare-fun e!585508 () Option!635)

(assert (=> b!1035594 (= e!585508 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456734)))))))

(declare-fun b!1035595 () Bool)

(declare-fun e!585509 () Option!635)

(assert (=> b!1035595 (= e!585508 e!585509)))

(declare-fun c!104965 () Bool)

(assert (=> b!1035595 (= c!104965 (and ((_ is Cons!21888) (toList!6896 lt!456734)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456734))) lt!456736))))))

(declare-fun b!1035597 () Bool)

(assert (=> b!1035597 (= e!585509 None!633)))

(declare-fun b!1035596 () Bool)

(assert (=> b!1035596 (= e!585509 (getValueByKey!584 (t!31080 (toList!6896 lt!456734)) lt!456736))))

(declare-fun d!124597 () Bool)

(declare-fun c!104964 () Bool)

(assert (=> d!124597 (= c!104964 (and ((_ is Cons!21888) (toList!6896 lt!456734)) (= (_1!7874 (h!23099 (toList!6896 lt!456734))) lt!456736)))))

(assert (=> d!124597 (= (getValueByKey!584 (toList!6896 lt!456734) lt!456736) e!585508)))

(assert (= (and d!124597 c!104964) b!1035594))

(assert (= (and d!124597 (not c!104964)) b!1035595))

(assert (= (and b!1035595 c!104965) b!1035596))

(assert (= (and b!1035595 (not c!104965)) b!1035597))

(declare-fun m!956077 () Bool)

(assert (=> b!1035596 m!956077))

(assert (=> d!124407 d!124597))

(declare-fun d!124599 () Bool)

(assert (=> d!124599 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457051 () Unit!33837)

(assert (=> d!124599 (= lt!457051 (choose!1704 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!585510 () Bool)

(assert (=> d!124599 e!585510))

(declare-fun res!691382 () Bool)

(assert (=> d!124599 (=> (not res!691382) (not e!585510))))

(assert (=> d!124599 (= res!691382 (isStrictlySorted!706 (toList!6896 lt!456722)))))

(assert (=> d!124599 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457051)))

(declare-fun b!1035598 () Bool)

(assert (=> b!1035598 (= e!585510 (containsKey!565 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124599 res!691382) b!1035598))

(assert (=> d!124599 m!955277))

(assert (=> d!124599 m!955277))

(assert (=> d!124599 m!955279))

(declare-fun m!956079 () Bool)

(assert (=> d!124599 m!956079))

(declare-fun m!956081 () Bool)

(assert (=> d!124599 m!956081))

(assert (=> b!1035598 m!955273))

(assert (=> b!1035110 d!124599))

(declare-fun d!124601 () Bool)

(assert (=> d!124601 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30273 () Bool)

(assert (= bs!30273 d!124601))

(assert (=> bs!30273 m!955277))

(declare-fun m!956083 () Bool)

(assert (=> bs!30273 m!956083))

(assert (=> b!1035110 d!124601))

(declare-fun b!1035599 () Bool)

(declare-fun e!585511 () Option!635)

(assert (=> b!1035599 (= e!585511 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456722)))))))

(declare-fun b!1035600 () Bool)

(declare-fun e!585512 () Option!635)

(assert (=> b!1035600 (= e!585511 e!585512)))

(declare-fun c!104967 () Bool)

(assert (=> b!1035600 (= c!104967 (and ((_ is Cons!21888) (toList!6896 lt!456722)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456722))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035602 () Bool)

(assert (=> b!1035602 (= e!585512 None!633)))

(declare-fun b!1035601 () Bool)

(assert (=> b!1035601 (= e!585512 (getValueByKey!584 (t!31080 (toList!6896 lt!456722)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124603 () Bool)

(declare-fun c!104966 () Bool)

(assert (=> d!124603 (= c!104966 (and ((_ is Cons!21888) (toList!6896 lt!456722)) (= (_1!7874 (h!23099 (toList!6896 lt!456722))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124603 (= (getValueByKey!584 (toList!6896 lt!456722) #b0000000000000000000000000000000000000000000000000000000000000000) e!585511)))

(assert (= (and d!124603 c!104966) b!1035599))

(assert (= (and d!124603 (not c!104966)) b!1035600))

(assert (= (and b!1035600 c!104967) b!1035601))

(assert (= (and b!1035600 (not c!104967)) b!1035602))

(declare-fun m!956085 () Bool)

(assert (=> b!1035601 m!956085))

(assert (=> b!1035110 d!124603))

(declare-fun d!124605 () Bool)

(assert (=> d!124605 (= (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1035273 d!124605))

(declare-fun b!1035603 () Bool)

(declare-fun e!585514 () (_ BitVec 32))

(declare-fun call!43787 () (_ BitVec 32))

(assert (=> b!1035603 (= e!585514 (bvadd #b00000000000000000000000000000001 call!43787))))

(declare-fun b!1035604 () Bool)

(declare-fun e!585513 () (_ BitVec 32))

(assert (=> b!1035604 (= e!585513 #b00000000000000000000000000000000)))

(declare-fun bm!43784 () Bool)

(assert (=> bm!43784 (= call!43787 (arrayCountValidKeys!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun d!124607 () Bool)

(declare-fun lt!457052 () (_ BitVec 32))

(assert (=> d!124607 (and (bvsge lt!457052 #b00000000000000000000000000000000) (bvsle lt!457052 (bvsub (size!31892 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124607 (= lt!457052 e!585513)))

(declare-fun c!104969 () Bool)

(assert (=> d!124607 (= c!104969 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124607 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31892 (_keys!11444 thiss!1427)) (size!31892 (_keys!11444 thiss!1427))))))

(assert (=> d!124607 (= (arrayCountValidKeys!0 (_keys!11444 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))) lt!457052)))

(declare-fun b!1035605 () Bool)

(assert (=> b!1035605 (= e!585514 call!43787)))

(declare-fun b!1035606 () Bool)

(assert (=> b!1035606 (= e!585513 e!585514)))

(declare-fun c!104968 () Bool)

(assert (=> b!1035606 (= c!104968 (validKeyInArray!0 (select (arr!31369 (_keys!11444 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124607 c!104969) b!1035604))

(assert (= (and d!124607 (not c!104969)) b!1035606))

(assert (= (and b!1035606 c!104968) b!1035603))

(assert (= (and b!1035606 (not c!104968)) b!1035605))

(assert (= (or b!1035603 b!1035605) bm!43784))

(declare-fun m!956087 () Bool)

(assert (=> bm!43784 m!956087))

(assert (=> b!1035606 m!955735))

(assert (=> b!1035606 m!955735))

(assert (=> b!1035606 m!955737))

(assert (=> bm!43758 d!124607))

(declare-fun b!1035607 () Bool)

(declare-fun e!585515 () Option!635)

(assert (=> b!1035607 (= e!585515 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456851)))))))

(declare-fun b!1035608 () Bool)

(declare-fun e!585516 () Option!635)

(assert (=> b!1035608 (= e!585515 e!585516)))

(declare-fun c!104971 () Bool)

(assert (=> b!1035608 (= c!104971 (and ((_ is Cons!21888) (toList!6896 lt!456851)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456851))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035610 () Bool)

(assert (=> b!1035610 (= e!585516 None!633)))

(declare-fun b!1035609 () Bool)

(assert (=> b!1035609 (= e!585516 (getValueByKey!584 (t!31080 (toList!6896 lt!456851)) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!104970 () Bool)

(declare-fun d!124609 () Bool)

(assert (=> d!124609 (= c!104970 (and ((_ is Cons!21888) (toList!6896 lt!456851)) (= (_1!7874 (h!23099 (toList!6896 lt!456851))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124609 (= (getValueByKey!584 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!585515)))

(assert (= (and d!124609 c!104970) b!1035607))

(assert (= (and d!124609 (not c!104970)) b!1035608))

(assert (= (and b!1035608 c!104971) b!1035609))

(assert (= (and b!1035608 (not c!104971)) b!1035610))

(declare-fun m!956089 () Bool)

(assert (=> b!1035609 m!956089))

(assert (=> b!1035175 d!124609))

(declare-fun d!124611 () Bool)

(declare-fun e!585517 () Bool)

(assert (=> d!124611 e!585517))

(declare-fun res!691383 () Bool)

(assert (=> d!124611 (=> (not res!691383) (not e!585517))))

(declare-fun lt!457054 () ListLongMap!13761)

(assert (=> d!124611 (= res!691383 (contains!6037 lt!457054 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457056 () List!21892)

(assert (=> d!124611 (= lt!457054 (ListLongMap!13762 lt!457056))))

(declare-fun lt!457055 () Unit!33837)

(declare-fun lt!457053 () Unit!33837)

(assert (=> d!124611 (= lt!457055 lt!457053)))

(assert (=> d!124611 (= (getValueByKey!584 lt!457056 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!634 (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124611 (= lt!457053 (lemmaContainsTupThenGetReturnValue!280 lt!457056 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124611 (= lt!457056 (insertStrictlySorted!373 (toList!6896 call!43760) (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124611 (= (+!3126 call!43760 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457054)))

(declare-fun b!1035611 () Bool)

(declare-fun res!691384 () Bool)

(assert (=> b!1035611 (=> (not res!691384) (not e!585517))))

(assert (=> b!1035611 (= res!691384 (= (getValueByKey!584 (toList!6896 lt!457054) (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!634 (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1035612 () Bool)

(assert (=> b!1035612 (= e!585517 (contains!6038 (toList!6896 lt!457054) (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124611 res!691383) b!1035611))

(assert (= (and b!1035611 res!691384) b!1035612))

(declare-fun m!956091 () Bool)

(assert (=> d!124611 m!956091))

(declare-fun m!956093 () Bool)

(assert (=> d!124611 m!956093))

(declare-fun m!956095 () Bool)

(assert (=> d!124611 m!956095))

(declare-fun m!956097 () Bool)

(assert (=> d!124611 m!956097))

(declare-fun m!956099 () Bool)

(assert (=> b!1035611 m!956099))

(declare-fun m!956101 () Bool)

(assert (=> b!1035612 m!956101))

(assert (=> b!1035221 d!124611))

(assert (=> b!1035221 d!124335))

(declare-fun d!124613 () Bool)

(assert (=> d!124613 (not (contains!6037 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883)) lt!456881))))

(declare-fun lt!457059 () Unit!33837)

(declare-fun choose!1705 (ListLongMap!13761 (_ BitVec 64) V!37563 (_ BitVec 64)) Unit!33837)

(assert (=> d!124613 (= lt!457059 (choose!1705 lt!456885 lt!456879 lt!456883 lt!456881))))

(declare-fun e!585520 () Bool)

(assert (=> d!124613 e!585520))

(declare-fun res!691387 () Bool)

(assert (=> d!124613 (=> (not res!691387) (not e!585520))))

(assert (=> d!124613 (= res!691387 (not (contains!6037 lt!456885 lt!456881)))))

(assert (=> d!124613 (= (addStillNotContains!244 lt!456885 lt!456879 lt!456883 lt!456881) lt!457059)))

(declare-fun b!1035616 () Bool)

(assert (=> b!1035616 (= e!585520 (not (= lt!456879 lt!456881)))))

(assert (= (and d!124613 res!691387) b!1035616))

(assert (=> d!124613 m!955437))

(assert (=> d!124613 m!955437))

(assert (=> d!124613 m!955443))

(declare-fun m!956103 () Bool)

(assert (=> d!124613 m!956103))

(declare-fun m!956105 () Bool)

(assert (=> d!124613 m!956105))

(assert (=> b!1035221 d!124613))

(declare-fun d!124615 () Bool)

(declare-fun e!585522 () Bool)

(assert (=> d!124615 e!585522))

(declare-fun res!691388 () Bool)

(assert (=> d!124615 (=> res!691388 e!585522)))

(declare-fun lt!457061 () Bool)

(assert (=> d!124615 (= res!691388 (not lt!457061))))

(declare-fun lt!457060 () Bool)

(assert (=> d!124615 (= lt!457061 lt!457060)))

(declare-fun lt!457063 () Unit!33837)

(declare-fun e!585521 () Unit!33837)

(assert (=> d!124615 (= lt!457063 e!585521)))

(declare-fun c!104972 () Bool)

(assert (=> d!124615 (= c!104972 lt!457060)))

(assert (=> d!124615 (= lt!457060 (containsKey!565 (toList!6896 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883))) lt!456881))))

(assert (=> d!124615 (= (contains!6037 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883)) lt!456881) lt!457061)))

(declare-fun b!1035617 () Bool)

(declare-fun lt!457062 () Unit!33837)

(assert (=> b!1035617 (= e!585521 lt!457062)))

(assert (=> b!1035617 (= lt!457062 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883))) lt!456881))))

(assert (=> b!1035617 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883))) lt!456881))))

(declare-fun b!1035618 () Bool)

(declare-fun Unit!33860 () Unit!33837)

(assert (=> b!1035618 (= e!585521 Unit!33860)))

(declare-fun b!1035619 () Bool)

(assert (=> b!1035619 (= e!585522 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883))) lt!456881)))))

(assert (= (and d!124615 c!104972) b!1035617))

(assert (= (and d!124615 (not c!104972)) b!1035618))

(assert (= (and d!124615 (not res!691388)) b!1035619))

(declare-fun m!956107 () Bool)

(assert (=> d!124615 m!956107))

(declare-fun m!956109 () Bool)

(assert (=> b!1035617 m!956109))

(declare-fun m!956111 () Bool)

(assert (=> b!1035617 m!956111))

(assert (=> b!1035617 m!956111))

(declare-fun m!956113 () Bool)

(assert (=> b!1035617 m!956113))

(assert (=> b!1035619 m!956111))

(assert (=> b!1035619 m!956111))

(assert (=> b!1035619 m!956113))

(assert (=> b!1035221 d!124615))

(declare-fun d!124617 () Bool)

(declare-fun e!585523 () Bool)

(assert (=> d!124617 e!585523))

(declare-fun res!691389 () Bool)

(assert (=> d!124617 (=> (not res!691389) (not e!585523))))

(declare-fun lt!457065 () ListLongMap!13761)

(assert (=> d!124617 (= res!691389 (contains!6037 lt!457065 (_1!7874 (tuple2!15727 lt!456879 lt!456883))))))

(declare-fun lt!457067 () List!21892)

(assert (=> d!124617 (= lt!457065 (ListLongMap!13762 lt!457067))))

(declare-fun lt!457066 () Unit!33837)

(declare-fun lt!457064 () Unit!33837)

(assert (=> d!124617 (= lt!457066 lt!457064)))

(assert (=> d!124617 (= (getValueByKey!584 lt!457067 (_1!7874 (tuple2!15727 lt!456879 lt!456883))) (Some!634 (_2!7874 (tuple2!15727 lt!456879 lt!456883))))))

(assert (=> d!124617 (= lt!457064 (lemmaContainsTupThenGetReturnValue!280 lt!457067 (_1!7874 (tuple2!15727 lt!456879 lt!456883)) (_2!7874 (tuple2!15727 lt!456879 lt!456883))))))

(assert (=> d!124617 (= lt!457067 (insertStrictlySorted!373 (toList!6896 lt!456885) (_1!7874 (tuple2!15727 lt!456879 lt!456883)) (_2!7874 (tuple2!15727 lt!456879 lt!456883))))))

(assert (=> d!124617 (= (+!3126 lt!456885 (tuple2!15727 lt!456879 lt!456883)) lt!457065)))

(declare-fun b!1035620 () Bool)

(declare-fun res!691390 () Bool)

(assert (=> b!1035620 (=> (not res!691390) (not e!585523))))

(assert (=> b!1035620 (= res!691390 (= (getValueByKey!584 (toList!6896 lt!457065) (_1!7874 (tuple2!15727 lt!456879 lt!456883))) (Some!634 (_2!7874 (tuple2!15727 lt!456879 lt!456883)))))))

(declare-fun b!1035621 () Bool)

(assert (=> b!1035621 (= e!585523 (contains!6038 (toList!6896 lt!457065) (tuple2!15727 lt!456879 lt!456883)))))

(assert (= (and d!124617 res!691389) b!1035620))

(assert (= (and b!1035620 res!691390) b!1035621))

(declare-fun m!956115 () Bool)

(assert (=> d!124617 m!956115))

(declare-fun m!956117 () Bool)

(assert (=> d!124617 m!956117))

(declare-fun m!956119 () Bool)

(assert (=> d!124617 m!956119))

(declare-fun m!956121 () Bool)

(assert (=> d!124617 m!956121))

(declare-fun m!956123 () Bool)

(assert (=> b!1035620 m!956123))

(declare-fun m!956125 () Bool)

(assert (=> b!1035621 m!956125))

(assert (=> b!1035221 d!124617))

(declare-fun b!1035622 () Bool)

(declare-fun e!585524 () Option!635)

(assert (=> b!1035622 (= e!585524 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456811)))))))

(declare-fun b!1035623 () Bool)

(declare-fun e!585525 () Option!635)

(assert (=> b!1035623 (= e!585524 e!585525)))

(declare-fun c!104974 () Bool)

(assert (=> b!1035623 (= c!104974 (and ((_ is Cons!21888) (toList!6896 lt!456811)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456811))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035625 () Bool)

(assert (=> b!1035625 (= e!585525 None!633)))

(declare-fun b!1035624 () Bool)

(assert (=> b!1035624 (= e!585525 (getValueByKey!584 (t!31080 (toList!6896 lt!456811)) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun d!124619 () Bool)

(declare-fun c!104973 () Bool)

(assert (=> d!124619 (= c!104973 (and ((_ is Cons!21888) (toList!6896 lt!456811)) (= (_1!7874 (h!23099 (toList!6896 lt!456811))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124619 (= (getValueByKey!584 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!585524)))

(assert (= (and d!124619 c!104973) b!1035622))

(assert (= (and d!124619 (not c!104973)) b!1035623))

(assert (= (and b!1035623 c!104974) b!1035624))

(assert (= (and b!1035623 (not c!104974)) b!1035625))

(declare-fun m!956127 () Bool)

(assert (=> b!1035624 m!956127))

(assert (=> b!1035108 d!124619))

(assert (=> d!124375 d!124351))

(declare-fun b!1035626 () Bool)

(declare-fun e!585526 () Option!635)

(assert (=> b!1035626 (= e!585526 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456896)))))))

(declare-fun b!1035627 () Bool)

(declare-fun e!585527 () Option!635)

(assert (=> b!1035627 (= e!585526 e!585527)))

(declare-fun c!104976 () Bool)

(assert (=> b!1035627 (= c!104976 (and ((_ is Cons!21888) (toList!6896 lt!456896)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456896))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035629 () Bool)

(assert (=> b!1035629 (= e!585527 None!633)))

(declare-fun b!1035628 () Bool)

(assert (=> b!1035628 (= e!585527 (getValueByKey!584 (t!31080 (toList!6896 lt!456896)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124621 () Bool)

(declare-fun c!104975 () Bool)

(assert (=> d!124621 (= c!104975 (and ((_ is Cons!21888) (toList!6896 lt!456896)) (= (_1!7874 (h!23099 (toList!6896 lt!456896))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124621 (= (getValueByKey!584 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!585526)))

(assert (= (and d!124621 c!104975) b!1035626))

(assert (= (and d!124621 (not c!104975)) b!1035627))

(assert (= (and b!1035627 c!104976) b!1035628))

(assert (= (and b!1035627 (not c!104976)) b!1035629))

(declare-fun m!956129 () Bool)

(assert (=> b!1035628 m!956129))

(assert (=> b!1035254 d!124621))

(declare-fun d!124623 () Bool)

(assert (=> d!124623 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))) lt!456698)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))) lt!456698)))))

(assert (=> d!124295 d!124623))

(declare-fun e!585528 () Option!635)

(declare-fun b!1035630 () Bool)

(assert (=> b!1035630 (= e!585528 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)))))))))

(declare-fun b!1035631 () Bool)

(declare-fun e!585529 () Option!635)

(assert (=> b!1035631 (= e!585528 e!585529)))

(declare-fun c!104978 () Bool)

(assert (=> b!1035631 (= c!104978 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))))) lt!456698))))))

(declare-fun b!1035633 () Bool)

(assert (=> b!1035633 (= e!585529 None!633)))

(declare-fun b!1035632 () Bool)

(assert (=> b!1035632 (= e!585529 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)))) lt!456698))))

(declare-fun d!124625 () Bool)

(declare-fun c!104977 () Bool)

(assert (=> d!124625 (= c!104977 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))))) lt!456698)))))

(assert (=> d!124625 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631))) lt!456698) e!585528)))

(assert (= (and d!124625 c!104977) b!1035630))

(assert (= (and d!124625 (not c!104977)) b!1035631))

(assert (= (and b!1035631 c!104978) b!1035632))

(assert (= (and b!1035631 (not c!104978)) b!1035633))

(declare-fun m!956131 () Bool)

(assert (=> b!1035632 m!956131))

(assert (=> d!124295 d!124625))

(declare-fun d!124627 () Bool)

(assert (=> d!124627 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456708) lt!456710)) (v!14885 (getValueByKey!584 (toList!6896 lt!456708) lt!456710)))))

(assert (=> d!124301 d!124627))

(declare-fun b!1035634 () Bool)

(declare-fun e!585530 () Option!635)

(assert (=> b!1035634 (= e!585530 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456708)))))))

(declare-fun b!1035635 () Bool)

(declare-fun e!585531 () Option!635)

(assert (=> b!1035635 (= e!585530 e!585531)))

(declare-fun c!104980 () Bool)

(assert (=> b!1035635 (= c!104980 (and ((_ is Cons!21888) (toList!6896 lt!456708)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456708))) lt!456710))))))

(declare-fun b!1035637 () Bool)

(assert (=> b!1035637 (= e!585531 None!633)))

(declare-fun b!1035636 () Bool)

(assert (=> b!1035636 (= e!585531 (getValueByKey!584 (t!31080 (toList!6896 lt!456708)) lt!456710))))

(declare-fun d!124629 () Bool)

(declare-fun c!104979 () Bool)

(assert (=> d!124629 (= c!104979 (and ((_ is Cons!21888) (toList!6896 lt!456708)) (= (_1!7874 (h!23099 (toList!6896 lt!456708))) lt!456710)))))

(assert (=> d!124629 (= (getValueByKey!584 (toList!6896 lt!456708) lt!456710) e!585530)))

(assert (= (and d!124629 c!104979) b!1035634))

(assert (= (and d!124629 (not c!104979)) b!1035635))

(assert (= (and b!1035635 c!104980) b!1035636))

(assert (= (and b!1035635 (not c!104980)) b!1035637))

(declare-fun m!956133 () Bool)

(assert (=> b!1035636 m!956133))

(assert (=> d!124301 d!124629))

(declare-fun d!124631 () Bool)

(declare-fun e!585533 () Bool)

(assert (=> d!124631 e!585533))

(declare-fun res!691391 () Bool)

(assert (=> d!124631 (=> res!691391 e!585533)))

(declare-fun lt!457069 () Bool)

(assert (=> d!124631 (= res!691391 (not lt!457069))))

(declare-fun lt!457068 () Bool)

(assert (=> d!124631 (= lt!457069 lt!457068)))

(declare-fun lt!457071 () Unit!33837)

(declare-fun e!585532 () Unit!33837)

(assert (=> d!124631 (= lt!457071 e!585532)))

(declare-fun c!104981 () Bool)

(assert (=> d!124631 (= c!104981 lt!457068)))

(assert (=> d!124631 (= lt!457068 (containsKey!565 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124631 (= (contains!6037 lt!456851 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457069)))

(declare-fun b!1035638 () Bool)

(declare-fun lt!457070 () Unit!33837)

(assert (=> b!1035638 (= e!585532 lt!457070)))

(assert (=> b!1035638 (= lt!457070 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1035638 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035639 () Bool)

(declare-fun Unit!33861 () Unit!33837)

(assert (=> b!1035639 (= e!585532 Unit!33861)))

(declare-fun b!1035640 () Bool)

(assert (=> b!1035640 (= e!585533 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456851) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124631 c!104981) b!1035638))

(assert (= (and d!124631 (not c!104981)) b!1035639))

(assert (= (and d!124631 (not res!691391)) b!1035640))

(declare-fun m!956135 () Bool)

(assert (=> d!124631 m!956135))

(declare-fun m!956137 () Bool)

(assert (=> b!1035638 m!956137))

(assert (=> b!1035638 m!955363))

(assert (=> b!1035638 m!955363))

(declare-fun m!956139 () Bool)

(assert (=> b!1035638 m!956139))

(assert (=> b!1035640 m!955363))

(assert (=> b!1035640 m!955363))

(assert (=> b!1035640 m!956139))

(assert (=> d!124353 d!124631))

(declare-fun b!1035641 () Bool)

(declare-fun e!585534 () Option!635)

(assert (=> b!1035641 (= e!585534 (Some!634 (_2!7874 (h!23099 lt!456853))))))

(declare-fun b!1035642 () Bool)

(declare-fun e!585535 () Option!635)

(assert (=> b!1035642 (= e!585534 e!585535)))

(declare-fun c!104983 () Bool)

(assert (=> b!1035642 (= c!104983 (and ((_ is Cons!21888) lt!456853) (not (= (_1!7874 (h!23099 lt!456853)) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035644 () Bool)

(assert (=> b!1035644 (= e!585535 None!633)))

(declare-fun b!1035643 () Bool)

(assert (=> b!1035643 (= e!585535 (getValueByKey!584 (t!31080 lt!456853) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!104982 () Bool)

(declare-fun d!124633 () Bool)

(assert (=> d!124633 (= c!104982 (and ((_ is Cons!21888) lt!456853) (= (_1!7874 (h!23099 lt!456853)) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124633 (= (getValueByKey!584 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!585534)))

(assert (= (and d!124633 c!104982) b!1035641))

(assert (= (and d!124633 (not c!104982)) b!1035642))

(assert (= (and b!1035642 c!104983) b!1035643))

(assert (= (and b!1035642 (not c!104983)) b!1035644))

(declare-fun m!956141 () Bool)

(assert (=> b!1035643 m!956141))

(assert (=> d!124353 d!124633))

(declare-fun d!124635 () Bool)

(assert (=> d!124635 (= (getValueByKey!584 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!457072 () Unit!33837)

(assert (=> d!124635 (= lt!457072 (choose!1703 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!585536 () Bool)

(assert (=> d!124635 e!585536))

(declare-fun res!691392 () Bool)

(assert (=> d!124635 (=> (not res!691392) (not e!585536))))

(assert (=> d!124635 (= res!691392 (isStrictlySorted!706 lt!456853))))

(assert (=> d!124635 (= (lemmaContainsTupThenGetReturnValue!280 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457072)))

(declare-fun b!1035645 () Bool)

(declare-fun res!691393 () Bool)

(assert (=> b!1035645 (=> (not res!691393) (not e!585536))))

(assert (=> b!1035645 (= res!691393 (containsKey!565 lt!456853 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035646 () Bool)

(assert (=> b!1035646 (= e!585536 (contains!6038 lt!456853 (tuple2!15727 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124635 res!691392) b!1035645))

(assert (= (and b!1035645 res!691393) b!1035646))

(assert (=> d!124635 m!955357))

(declare-fun m!956143 () Bool)

(assert (=> d!124635 m!956143))

(declare-fun m!956145 () Bool)

(assert (=> d!124635 m!956145))

(declare-fun m!956147 () Bool)

(assert (=> b!1035645 m!956147))

(declare-fun m!956149 () Bool)

(assert (=> b!1035646 m!956149))

(assert (=> d!124353 d!124635))

(declare-fun lt!457073 () List!21892)

(declare-fun b!1035647 () Bool)

(declare-fun e!585537 () Bool)

(assert (=> b!1035647 (= e!585537 (contains!6038 lt!457073 (tuple2!15727 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun call!43790 () List!21892)

(declare-fun e!585541 () List!21892)

(declare-fun bm!43785 () Bool)

(declare-fun c!104985 () Bool)

(assert (=> bm!43785 (= call!43790 ($colon$colon!603 e!585541 (ite c!104985 (h!23099 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (tuple2!15727 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun c!104987 () Bool)

(assert (=> bm!43785 (= c!104987 c!104985)))

(declare-fun bm!43786 () Bool)

(declare-fun call!43788 () List!21892)

(declare-fun call!43789 () List!21892)

(assert (=> bm!43786 (= call!43788 call!43789)))

(declare-fun c!104984 () Bool)

(declare-fun b!1035648 () Bool)

(declare-fun c!104986 () Bool)

(assert (=> b!1035648 (= e!585541 (ite c!104986 (t!31080 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (ite c!104984 (Cons!21888 (h!23099 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (t!31080 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))))) Nil!21889)))))

(declare-fun b!1035649 () Bool)

(declare-fun res!691395 () Bool)

(assert (=> b!1035649 (=> (not res!691395) (not e!585537))))

(assert (=> b!1035649 (= res!691395 (containsKey!565 lt!457073 (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035650 () Bool)

(declare-fun e!585539 () List!21892)

(declare-fun e!585538 () List!21892)

(assert (=> b!1035650 (= e!585539 e!585538)))

(assert (=> b!1035650 (= c!104986 (and ((_ is Cons!21888) (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (= (_1!7874 (h!23099 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035651 () Bool)

(assert (=> b!1035651 (= c!104984 (and ((_ is Cons!21888) (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (bvsgt (_1!7874 (h!23099 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun e!585540 () List!21892)

(assert (=> b!1035651 (= e!585538 e!585540)))

(declare-fun b!1035652 () Bool)

(assert (=> b!1035652 (= e!585541 (insertStrictlySorted!373 (t!31080 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035653 () Bool)

(assert (=> b!1035653 (= e!585540 call!43788)))

(declare-fun b!1035654 () Bool)

(assert (=> b!1035654 (= e!585540 call!43788)))

(declare-fun bm!43787 () Bool)

(assert (=> bm!43787 (= call!43789 call!43790)))

(declare-fun b!1035655 () Bool)

(assert (=> b!1035655 (= e!585539 call!43790)))

(declare-fun b!1035656 () Bool)

(assert (=> b!1035656 (= e!585538 call!43789)))

(declare-fun d!124637 () Bool)

(assert (=> d!124637 e!585537))

(declare-fun res!691394 () Bool)

(assert (=> d!124637 (=> (not res!691394) (not e!585537))))

(assert (=> d!124637 (= res!691394 (isStrictlySorted!706 lt!457073))))

(assert (=> d!124637 (= lt!457073 e!585539)))

(assert (=> d!124637 (= c!104985 (and ((_ is Cons!21888) (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731)))) (bvslt (_1!7874 (h!23099 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124637 (isStrictlySorted!706 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))))))

(assert (=> d!124637 (= (insertStrictlySorted!373 (toList!6896 (ite c!104793 call!43732 (ite c!104798 call!43726 call!43731))) (_1!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457073)))

(assert (= (and d!124637 c!104985) b!1035655))

(assert (= (and d!124637 (not c!104985)) b!1035650))

(assert (= (and b!1035650 c!104986) b!1035656))

(assert (= (and b!1035650 (not c!104986)) b!1035651))

(assert (= (and b!1035651 c!104984) b!1035653))

(assert (= (and b!1035651 (not c!104984)) b!1035654))

(assert (= (or b!1035653 b!1035654) bm!43786))

(assert (= (or b!1035656 bm!43786) bm!43787))

(assert (= (or b!1035655 bm!43787) bm!43785))

(assert (= (and bm!43785 c!104987) b!1035652))

(assert (= (and bm!43785 (not c!104987)) b!1035648))

(assert (= (and d!124637 res!691394) b!1035649))

(assert (= (and b!1035649 res!691395) b!1035647))

(declare-fun m!956151 () Bool)

(assert (=> b!1035652 m!956151))

(declare-fun m!956153 () Bool)

(assert (=> b!1035647 m!956153))

(declare-fun m!956155 () Bool)

(assert (=> bm!43785 m!956155))

(declare-fun m!956157 () Bool)

(assert (=> d!124637 m!956157))

(declare-fun m!956159 () Bool)

(assert (=> d!124637 m!956159))

(declare-fun m!956161 () Bool)

(assert (=> b!1035649 m!956161))

(assert (=> d!124353 d!124637))

(assert (=> d!124289 d!124299))

(assert (=> d!124289 d!124317))

(declare-fun d!124639 () Bool)

(declare-fun e!585543 () Bool)

(assert (=> d!124639 e!585543))

(declare-fun res!691396 () Bool)

(assert (=> d!124639 (=> res!691396 e!585543)))

(declare-fun lt!457075 () Bool)

(assert (=> d!124639 (= res!691396 (not lt!457075))))

(declare-fun lt!457074 () Bool)

(assert (=> d!124639 (= lt!457075 lt!457074)))

(declare-fun lt!457077 () Unit!33837)

(declare-fun e!585542 () Unit!33837)

(assert (=> d!124639 (= lt!457077 e!585542)))

(declare-fun c!104988 () Bool)

(assert (=> d!124639 (= c!104988 lt!457074)))

(assert (=> d!124639 (= lt!457074 (containsKey!565 (toList!6896 lt!456699) lt!456705))))

(assert (=> d!124639 (= (contains!6037 lt!456699 lt!456705) lt!457075)))

(declare-fun b!1035657 () Bool)

(declare-fun lt!457076 () Unit!33837)

(assert (=> b!1035657 (= e!585542 lt!457076)))

(assert (=> b!1035657 (= lt!457076 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456699) lt!456705))))

(assert (=> b!1035657 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456699) lt!456705))))

(declare-fun b!1035658 () Bool)

(declare-fun Unit!33862 () Unit!33837)

(assert (=> b!1035658 (= e!585542 Unit!33862)))

(declare-fun b!1035659 () Bool)

(assert (=> b!1035659 (= e!585543 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456699) lt!456705)))))

(assert (= (and d!124639 c!104988) b!1035657))

(assert (= (and d!124639 (not c!104988)) b!1035658))

(assert (= (and d!124639 (not res!691396)) b!1035659))

(declare-fun m!956163 () Bool)

(assert (=> d!124639 m!956163))

(declare-fun m!956165 () Bool)

(assert (=> b!1035657 m!956165))

(assert (=> b!1035657 m!955237))

(assert (=> b!1035657 m!955237))

(declare-fun m!956167 () Bool)

(assert (=> b!1035657 m!956167))

(assert (=> b!1035659 m!955237))

(assert (=> b!1035659 m!955237))

(assert (=> b!1035659 m!956167))

(assert (=> d!124289 d!124639))

(assert (=> d!124289 d!124313))

(declare-fun d!124641 () Bool)

(assert (=> d!124641 (= (apply!915 (+!3126 lt!456699 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) lt!456705) (apply!915 lt!456699 lt!456705))))

(assert (=> d!124641 true))

(declare-fun _$34!1165 () Unit!33837)

(assert (=> d!124641 (= (choose!1701 lt!456699 lt!456715 (minValue!6062 thiss!1427) lt!456705) _$34!1165)))

(declare-fun bs!30274 () Bool)

(assert (= bs!30274 d!124641))

(assert (=> bs!30274 m!955059))

(assert (=> bs!30274 m!955059))

(assert (=> bs!30274 m!955073))

(assert (=> bs!30274 m!955065))

(assert (=> d!124289 d!124641))

(declare-fun d!124643 () Bool)

(declare-fun e!585545 () Bool)

(assert (=> d!124643 e!585545))

(declare-fun res!691397 () Bool)

(assert (=> d!124643 (=> res!691397 e!585545)))

(declare-fun lt!457079 () Bool)

(assert (=> d!124643 (= res!691397 (not lt!457079))))

(declare-fun lt!457078 () Bool)

(assert (=> d!124643 (= lt!457079 lt!457078)))

(declare-fun lt!457081 () Unit!33837)

(declare-fun e!585544 () Unit!33837)

(assert (=> d!124643 (= lt!457081 e!585544)))

(declare-fun c!104989 () Bool)

(assert (=> d!124643 (= c!104989 lt!457078)))

(assert (=> d!124643 (= lt!457078 (containsKey!565 (toList!6896 lt!456884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124643 (= (contains!6037 lt!456884 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457079)))

(declare-fun b!1035660 () Bool)

(declare-fun lt!457080 () Unit!33837)

(assert (=> b!1035660 (= e!585544 lt!457080)))

(assert (=> b!1035660 (= lt!457080 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035660 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035661 () Bool)

(declare-fun Unit!33863 () Unit!33837)

(assert (=> b!1035661 (= e!585544 Unit!33863)))

(declare-fun b!1035662 () Bool)

(assert (=> b!1035662 (= e!585545 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124643 c!104989) b!1035660))

(assert (= (and d!124643 (not c!104989)) b!1035661))

(assert (= (and d!124643 (not res!691397)) b!1035662))

(declare-fun m!956169 () Bool)

(assert (=> d!124643 m!956169))

(declare-fun m!956171 () Bool)

(assert (=> b!1035660 m!956171))

(declare-fun m!956173 () Bool)

(assert (=> b!1035660 m!956173))

(assert (=> b!1035660 m!956173))

(declare-fun m!956175 () Bool)

(assert (=> b!1035660 m!956175))

(assert (=> b!1035662 m!956173))

(assert (=> b!1035662 m!956173))

(assert (=> b!1035662 m!956175))

(assert (=> b!1035217 d!124643))

(declare-fun d!124645 () Bool)

(declare-fun res!691398 () Bool)

(declare-fun e!585546 () Bool)

(assert (=> d!124645 (=> res!691398 e!585546)))

(assert (=> d!124645 (= res!691398 (and ((_ is Cons!21888) lt!456849) (= (_1!7874 (h!23099 lt!456849)) key!909)))))

(assert (=> d!124645 (= (containsKey!565 lt!456849 key!909) e!585546)))

(declare-fun b!1035663 () Bool)

(declare-fun e!585547 () Bool)

(assert (=> b!1035663 (= e!585546 e!585547)))

(declare-fun res!691399 () Bool)

(assert (=> b!1035663 (=> (not res!691399) (not e!585547))))

(assert (=> b!1035663 (= res!691399 (and (or (not ((_ is Cons!21888) lt!456849)) (bvsle (_1!7874 (h!23099 lt!456849)) key!909)) ((_ is Cons!21888) lt!456849) (bvslt (_1!7874 (h!23099 lt!456849)) key!909)))))

(declare-fun b!1035664 () Bool)

(assert (=> b!1035664 (= e!585547 (containsKey!565 (t!31080 lt!456849) key!909))))

(assert (= (and d!124645 (not res!691398)) b!1035663))

(assert (= (and b!1035663 res!691399) b!1035664))

(declare-fun m!956177 () Bool)

(assert (=> b!1035664 m!956177))

(assert (=> b!1035170 d!124645))

(declare-fun d!124647 () Bool)

(assert (=> d!124647 (= (apply!915 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!456731) (apply!915 lt!456725 lt!456731))))

(assert (=> d!124647 true))

(declare-fun _$34!1166 () Unit!33837)

(assert (=> d!124647 (= (choose!1701 lt!456725 lt!456741 (minValue!6062 thiss!1427) lt!456731) _$34!1166)))

(declare-fun bs!30275 () Bool)

(assert (= bs!30275 d!124647))

(assert (=> bs!30275 m!955113))

(assert (=> bs!30275 m!955113))

(assert (=> bs!30275 m!955127))

(assert (=> bs!30275 m!955119))

(assert (=> d!124399 d!124647))

(assert (=> d!124399 d!124385))

(assert (=> d!124399 d!124401))

(assert (=> d!124399 d!124379))

(declare-fun d!124649 () Bool)

(declare-fun e!585549 () Bool)

(assert (=> d!124649 e!585549))

(declare-fun res!691400 () Bool)

(assert (=> d!124649 (=> res!691400 e!585549)))

(declare-fun lt!457083 () Bool)

(assert (=> d!124649 (= res!691400 (not lt!457083))))

(declare-fun lt!457082 () Bool)

(assert (=> d!124649 (= lt!457083 lt!457082)))

(declare-fun lt!457085 () Unit!33837)

(declare-fun e!585548 () Unit!33837)

(assert (=> d!124649 (= lt!457085 e!585548)))

(declare-fun c!104990 () Bool)

(assert (=> d!124649 (= c!104990 lt!457082)))

(assert (=> d!124649 (= lt!457082 (containsKey!565 (toList!6896 lt!456725) lt!456731))))

(assert (=> d!124649 (= (contains!6037 lt!456725 lt!456731) lt!457083)))

(declare-fun b!1035665 () Bool)

(declare-fun lt!457084 () Unit!33837)

(assert (=> b!1035665 (= e!585548 lt!457084)))

(assert (=> b!1035665 (= lt!457084 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456725) lt!456731))))

(assert (=> b!1035665 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456725) lt!456731))))

(declare-fun b!1035666 () Bool)

(declare-fun Unit!33864 () Unit!33837)

(assert (=> b!1035666 (= e!585548 Unit!33864)))

(declare-fun b!1035667 () Bool)

(assert (=> b!1035667 (= e!585549 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456725) lt!456731)))))

(assert (= (and d!124649 c!104990) b!1035665))

(assert (= (and d!124649 (not c!104990)) b!1035666))

(assert (= (and d!124649 (not res!691400)) b!1035667))

(declare-fun m!956179 () Bool)

(assert (=> d!124649 m!956179))

(declare-fun m!956181 () Bool)

(assert (=> b!1035665 m!956181))

(assert (=> b!1035665 m!955571))

(assert (=> b!1035665 m!955571))

(declare-fun m!956183 () Bool)

(assert (=> b!1035665 m!956183))

(assert (=> b!1035667 m!955571))

(assert (=> b!1035667 m!955571))

(assert (=> b!1035667 m!956183))

(assert (=> d!124399 d!124649))

(declare-fun d!124651 () Bool)

(assert (=> d!124651 (= (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))))

(declare-fun bs!30276 () Bool)

(assert (= bs!30276 d!124651))

(assert (=> bs!30276 m!955213))

(declare-fun m!956185 () Bool)

(assert (=> bs!30276 m!956185))

(assert (=> b!1035101 d!124651))

(declare-fun b!1035668 () Bool)

(declare-fun e!585550 () Option!635)

(assert (=> b!1035668 (= e!585550 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))))))))

(declare-fun b!1035669 () Bool)

(declare-fun e!585551 () Option!635)

(assert (=> b!1035669 (= e!585550 e!585551)))

(declare-fun c!104992 () Bool)

(assert (=> b!1035669 (= c!104992 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) lt!456703))))))

(declare-fun b!1035671 () Bool)

(assert (=> b!1035671 (= e!585551 None!633)))

(declare-fun b!1035670 () Bool)

(assert (=> b!1035670 (= e!585551 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) lt!456703))))

(declare-fun d!124653 () Bool)

(declare-fun c!104991 () Bool)

(assert (=> d!124653 (= c!104991 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) lt!456703)))))

(assert (=> d!124653 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703) e!585550)))

(assert (= (and d!124653 c!104991) b!1035668))

(assert (= (and d!124653 (not c!104991)) b!1035669))

(assert (= (and b!1035669 c!104992) b!1035670))

(assert (= (and b!1035669 (not c!104992)) b!1035671))

(declare-fun m!956187 () Bool)

(assert (=> b!1035670 m!956187))

(assert (=> b!1035101 d!124653))

(declare-fun d!124655 () Bool)

(declare-fun res!691401 () Bool)

(declare-fun e!585552 () Bool)

(assert (=> d!124655 (=> res!691401 e!585552)))

(assert (=> d!124655 (= res!691401 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124655 (= (containsKey!565 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000) e!585552)))

(declare-fun b!1035672 () Bool)

(declare-fun e!585553 () Bool)

(assert (=> b!1035672 (= e!585552 e!585553)))

(declare-fun res!691402 () Bool)

(assert (=> b!1035672 (=> (not res!691402) (not e!585553))))

(assert (=> b!1035672 (= res!691402 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456716))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456716))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) (toList!6896 lt!456716)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456716))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035673 () Bool)

(assert (=> b!1035673 (= e!585553 (containsKey!565 (t!31080 (toList!6896 lt!456716)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124655 (not res!691401)) b!1035672))

(assert (= (and b!1035672 res!691402) b!1035673))

(declare-fun m!956189 () Bool)

(assert (=> b!1035673 m!956189))

(assert (=> d!124337 d!124655))

(declare-fun d!124657 () Bool)

(assert (=> d!124657 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) (v!14885 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124363 d!124657))

(assert (=> d!124363 d!124577))

(declare-fun b!1035674 () Bool)

(declare-fun e!585554 () Option!635)

(assert (=> b!1035674 (= e!585554 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456905)))))))

(declare-fun b!1035675 () Bool)

(declare-fun e!585555 () Option!635)

(assert (=> b!1035675 (= e!585554 e!585555)))

(declare-fun c!104994 () Bool)

(assert (=> b!1035675 (= c!104994 (and ((_ is Cons!21888) (toList!6896 lt!456905)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456905))) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035677 () Bool)

(assert (=> b!1035677 (= e!585555 None!633)))

(declare-fun b!1035676 () Bool)

(assert (=> b!1035676 (= e!585555 (getValueByKey!584 (t!31080 (toList!6896 lt!456905)) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun c!104993 () Bool)

(declare-fun d!124659 () Bool)

(assert (=> d!124659 (= c!104993 (and ((_ is Cons!21888) (toList!6896 lt!456905)) (= (_1!7874 (h!23099 (toList!6896 lt!456905))) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(assert (=> d!124659 (= (getValueByKey!584 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) e!585554)))

(assert (= (and d!124659 c!104993) b!1035674))

(assert (= (and d!124659 (not c!104993)) b!1035675))

(assert (= (and b!1035675 c!104994) b!1035676))

(assert (= (and b!1035675 (not c!104994)) b!1035677))

(declare-fun m!956191 () Bool)

(assert (=> b!1035676 m!956191))

(assert (=> b!1035259 d!124659))

(declare-fun d!124661 () Bool)

(declare-fun res!691403 () Bool)

(declare-fun e!585556 () Bool)

(assert (=> d!124661 (=> res!691403 e!585556)))

(assert (=> d!124661 (= res!691403 (or ((_ is Nil!21889) lt!456849) ((_ is Nil!21889) (t!31080 lt!456849))))))

(assert (=> d!124661 (= (isStrictlySorted!706 lt!456849) e!585556)))

(declare-fun b!1035678 () Bool)

(declare-fun e!585557 () Bool)

(assert (=> b!1035678 (= e!585556 e!585557)))

(declare-fun res!691404 () Bool)

(assert (=> b!1035678 (=> (not res!691404) (not e!585557))))

(assert (=> b!1035678 (= res!691404 (bvslt (_1!7874 (h!23099 lt!456849)) (_1!7874 (h!23099 (t!31080 lt!456849)))))))

(declare-fun b!1035679 () Bool)

(assert (=> b!1035679 (= e!585557 (isStrictlySorted!706 (t!31080 lt!456849)))))

(assert (= (and d!124661 (not res!691403)) b!1035678))

(assert (= (and b!1035678 res!691404) b!1035679))

(declare-fun m!956193 () Bool)

(assert (=> b!1035679 m!956193))

(assert (=> d!124347 d!124661))

(declare-fun d!124663 () Bool)

(declare-fun res!691405 () Bool)

(declare-fun e!585558 () Bool)

(assert (=> d!124663 (=> res!691405 e!585558)))

(assert (=> d!124663 (= res!691405 (or ((_ is Nil!21889) (toList!6896 (map!14685 thiss!1427))) ((_ is Nil!21889) (t!31080 (toList!6896 (map!14685 thiss!1427))))))))

(assert (=> d!124663 (= (isStrictlySorted!706 (toList!6896 (map!14685 thiss!1427))) e!585558)))

(declare-fun b!1035680 () Bool)

(declare-fun e!585559 () Bool)

(assert (=> b!1035680 (= e!585558 e!585559)))

(declare-fun res!691406 () Bool)

(assert (=> b!1035680 (=> (not res!691406) (not e!585559))))

(assert (=> b!1035680 (= res!691406 (bvslt (_1!7874 (h!23099 (toList!6896 (map!14685 thiss!1427)))) (_1!7874 (h!23099 (t!31080 (toList!6896 (map!14685 thiss!1427)))))))))

(declare-fun b!1035681 () Bool)

(assert (=> b!1035681 (= e!585559 (isStrictlySorted!706 (t!31080 (toList!6896 (map!14685 thiss!1427)))))))

(assert (= (and d!124663 (not res!691405)) b!1035680))

(assert (= (and b!1035680 res!691406) b!1035681))

(declare-fun m!956195 () Bool)

(assert (=> b!1035681 m!956195))

(assert (=> d!124347 d!124663))

(declare-fun d!124665 () Bool)

(assert (=> d!124665 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) (v!14885 (getValueByKey!584 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124333 d!124665))

(assert (=> d!124333 d!124489))

(declare-fun b!1035682 () Bool)

(declare-fun e!585562 () Bool)

(declare-fun call!43791 () Bool)

(assert (=> b!1035682 (= e!585562 call!43791)))

(declare-fun d!124667 () Bool)

(declare-fun res!691408 () Bool)

(declare-fun e!585561 () Bool)

(assert (=> d!124667 (=> res!691408 e!585561)))

(assert (=> d!124667 (= res!691408 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124667 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11444 lt!456630) (mask!30143 lt!456630)) e!585561)))

(declare-fun bm!43788 () Bool)

(assert (=> bm!43788 (= call!43791 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11444 lt!456630) (mask!30143 lt!456630)))))

(declare-fun b!1035683 () Bool)

(assert (=> b!1035683 (= e!585561 e!585562)))

(declare-fun c!104995 () Bool)

(assert (=> b!1035683 (= c!104995 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1035684 () Bool)

(declare-fun e!585560 () Bool)

(assert (=> b!1035684 (= e!585560 call!43791)))

(declare-fun b!1035685 () Bool)

(assert (=> b!1035685 (= e!585562 e!585560)))

(declare-fun lt!457088 () (_ BitVec 64))

(assert (=> b!1035685 (= lt!457088 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!457087 () Unit!33837)

(assert (=> b!1035685 (= lt!457087 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 lt!456630) lt!457088 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1035685 (arrayContainsKey!0 (_keys!11444 lt!456630) lt!457088 #b00000000000000000000000000000000)))

(declare-fun lt!457086 () Unit!33837)

(assert (=> b!1035685 (= lt!457086 lt!457087)))

(declare-fun res!691407 () Bool)

(assert (=> b!1035685 (= res!691407 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11444 lt!456630) (mask!30143 lt!456630)) (Found!9695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1035685 (=> (not res!691407) (not e!585560))))

(assert (= (and d!124667 (not res!691408)) b!1035683))

(assert (= (and b!1035683 c!104995) b!1035685))

(assert (= (and b!1035683 (not c!104995)) b!1035682))

(assert (= (and b!1035685 res!691407) b!1035684))

(assert (= (or b!1035684 b!1035682) bm!43788))

(declare-fun m!956197 () Bool)

(assert (=> bm!43788 m!956197))

(assert (=> b!1035683 m!955789))

(assert (=> b!1035683 m!955789))

(assert (=> b!1035683 m!955793))

(assert (=> b!1035685 m!955789))

(declare-fun m!956199 () Bool)

(assert (=> b!1035685 m!956199))

(declare-fun m!956201 () Bool)

(assert (=> b!1035685 m!956201))

(assert (=> b!1035685 m!955789))

(declare-fun m!956203 () Bool)

(assert (=> b!1035685 m!956203))

(assert (=> bm!43742 d!124667))

(declare-fun d!124669 () Bool)

(declare-fun e!585564 () Bool)

(assert (=> d!124669 e!585564))

(declare-fun res!691409 () Bool)

(assert (=> d!124669 (=> res!691409 e!585564)))

(declare-fun lt!457090 () Bool)

(assert (=> d!124669 (= res!691409 (not lt!457090))))

(declare-fun lt!457089 () Bool)

(assert (=> d!124669 (= lt!457090 lt!457089)))

(declare-fun lt!457092 () Unit!33837)

(declare-fun e!585563 () Unit!33837)

(assert (=> d!124669 (= lt!457092 e!585563)))

(declare-fun c!104996 () Bool)

(assert (=> d!124669 (= c!104996 lt!457089)))

(assert (=> d!124669 (= lt!457089 (containsKey!565 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(assert (=> d!124669 (= (contains!6037 lt!456919 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!457090)))

(declare-fun b!1035686 () Bool)

(declare-fun lt!457091 () Unit!33837)

(assert (=> b!1035686 (= e!585563 lt!457091)))

(assert (=> b!1035686 (= lt!457091 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(assert (=> b!1035686 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035687 () Bool)

(declare-fun Unit!33865 () Unit!33837)

(assert (=> b!1035687 (= e!585563 Unit!33865)))

(declare-fun b!1035688 () Bool)

(assert (=> b!1035688 (= e!585564 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456919) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124669 c!104996) b!1035686))

(assert (= (and d!124669 (not c!104996)) b!1035687))

(assert (= (and d!124669 (not res!691409)) b!1035688))

(declare-fun m!956205 () Bool)

(assert (=> d!124669 m!956205))

(declare-fun m!956207 () Bool)

(assert (=> b!1035686 m!956207))

(assert (=> b!1035686 m!955583))

(assert (=> b!1035686 m!955583))

(declare-fun m!956209 () Bool)

(assert (=> b!1035686 m!956209))

(assert (=> b!1035688 m!955583))

(assert (=> b!1035688 m!955583))

(assert (=> b!1035688 m!956209))

(assert (=> d!124403 d!124669))

(declare-fun b!1035689 () Bool)

(declare-fun e!585565 () Option!635)

(assert (=> b!1035689 (= e!585565 (Some!634 (_2!7874 (h!23099 lt!456921))))))

(declare-fun b!1035690 () Bool)

(declare-fun e!585566 () Option!635)

(assert (=> b!1035690 (= e!585565 e!585566)))

(declare-fun c!104998 () Bool)

(assert (=> b!1035690 (= c!104998 (and ((_ is Cons!21888) lt!456921) (not (= (_1!7874 (h!23099 lt!456921)) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))))

(declare-fun b!1035692 () Bool)

(assert (=> b!1035692 (= e!585566 None!633)))

(declare-fun b!1035691 () Bool)

(assert (=> b!1035691 (= e!585566 (getValueByKey!584 (t!31080 lt!456921) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun d!124671 () Bool)

(declare-fun c!104997 () Bool)

(assert (=> d!124671 (= c!104997 (and ((_ is Cons!21888) lt!456921) (= (_1!7874 (h!23099 lt!456921)) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124671 (= (getValueByKey!584 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) e!585565)))

(assert (= (and d!124671 c!104997) b!1035689))

(assert (= (and d!124671 (not c!104997)) b!1035690))

(assert (= (and b!1035690 c!104998) b!1035691))

(assert (= (and b!1035690 (not c!104998)) b!1035692))

(declare-fun m!956211 () Bool)

(assert (=> b!1035691 m!956211))

(assert (=> d!124403 d!124671))

(declare-fun d!124673 () Bool)

(assert (=> d!124673 (= (getValueByKey!584 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun lt!457093 () Unit!33837)

(assert (=> d!124673 (= lt!457093 (choose!1703 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun e!585567 () Bool)

(assert (=> d!124673 e!585567))

(declare-fun res!691410 () Bool)

(assert (=> d!124673 (=> (not res!691410) (not e!585567))))

(assert (=> d!124673 (= res!691410 (isStrictlySorted!706 lt!456921))))

(assert (=> d!124673 (= (lemmaContainsTupThenGetReturnValue!280 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!457093)))

(declare-fun b!1035693 () Bool)

(declare-fun res!691411 () Bool)

(assert (=> b!1035693 (=> (not res!691411) (not e!585567))))

(assert (=> b!1035693 (= res!691411 (containsKey!565 lt!456921 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035694 () Bool)

(assert (=> b!1035694 (= e!585567 (contains!6038 lt!456921 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(assert (= (and d!124673 res!691410) b!1035693))

(assert (= (and b!1035693 res!691411) b!1035694))

(assert (=> d!124673 m!955577))

(declare-fun m!956213 () Bool)

(assert (=> d!124673 m!956213))

(declare-fun m!956215 () Bool)

(assert (=> d!124673 m!956215))

(declare-fun m!956217 () Bool)

(assert (=> b!1035693 m!956217))

(declare-fun m!956219 () Bool)

(assert (=> b!1035694 m!956219))

(assert (=> d!124403 d!124673))

(declare-fun b!1035695 () Bool)

(declare-fun lt!457094 () List!21892)

(declare-fun e!585568 () Bool)

(assert (=> b!1035695 (= e!585568 (contains!6038 lt!457094 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(declare-fun e!585572 () List!21892)

(declare-fun bm!43789 () Bool)

(declare-fun c!105000 () Bool)

(declare-fun call!43794 () List!21892)

(assert (=> bm!43789 (= call!43794 ($colon$colon!603 e!585572 (ite c!105000 (h!23099 (toList!6896 lt!456730)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))))

(declare-fun c!105002 () Bool)

(assert (=> bm!43789 (= c!105002 c!105000)))

(declare-fun bm!43790 () Bool)

(declare-fun call!43792 () List!21892)

(declare-fun call!43793 () List!21892)

(assert (=> bm!43790 (= call!43792 call!43793)))

(declare-fun c!105001 () Bool)

(declare-fun c!104999 () Bool)

(declare-fun b!1035696 () Bool)

(assert (=> b!1035696 (= e!585572 (ite c!105001 (t!31080 (toList!6896 lt!456730)) (ite c!104999 (Cons!21888 (h!23099 (toList!6896 lt!456730)) (t!31080 (toList!6896 lt!456730))) Nil!21889)))))

(declare-fun b!1035697 () Bool)

(declare-fun res!691413 () Bool)

(assert (=> b!1035697 (=> (not res!691413) (not e!585568))))

(assert (=> b!1035697 (= res!691413 (containsKey!565 lt!457094 (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035698 () Bool)

(declare-fun e!585570 () List!21892)

(declare-fun e!585569 () List!21892)

(assert (=> b!1035698 (= e!585570 e!585569)))

(assert (=> b!1035698 (= c!105001 (and ((_ is Cons!21888) (toList!6896 lt!456730)) (= (_1!7874 (h!23099 (toList!6896 lt!456730))) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(declare-fun b!1035699 () Bool)

(assert (=> b!1035699 (= c!104999 (and ((_ is Cons!21888) (toList!6896 lt!456730)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456730))) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(declare-fun e!585571 () List!21892)

(assert (=> b!1035699 (= e!585569 e!585571)))

(declare-fun b!1035700 () Bool)

(assert (=> b!1035700 (= e!585572 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456730)) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))))

(declare-fun b!1035701 () Bool)

(assert (=> b!1035701 (= e!585571 call!43792)))

(declare-fun b!1035702 () Bool)

(assert (=> b!1035702 (= e!585571 call!43792)))

(declare-fun bm!43791 () Bool)

(assert (=> bm!43791 (= call!43793 call!43794)))

(declare-fun b!1035703 () Bool)

(assert (=> b!1035703 (= e!585570 call!43794)))

(declare-fun b!1035704 () Bool)

(assert (=> b!1035704 (= e!585569 call!43793)))

(declare-fun d!124675 () Bool)

(assert (=> d!124675 e!585568))

(declare-fun res!691412 () Bool)

(assert (=> d!124675 (=> (not res!691412) (not e!585568))))

(assert (=> d!124675 (= res!691412 (isStrictlySorted!706 lt!457094))))

(assert (=> d!124675 (= lt!457094 e!585570)))

(assert (=> d!124675 (= c!105000 (and ((_ is Cons!21888) (toList!6896 lt!456730)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456730))) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124675 (isStrictlySorted!706 (toList!6896 lt!456730))))

(assert (=> d!124675 (= (insertStrictlySorted!373 (toList!6896 lt!456730) (_1!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!457094)))

(assert (= (and d!124675 c!105000) b!1035703))

(assert (= (and d!124675 (not c!105000)) b!1035698))

(assert (= (and b!1035698 c!105001) b!1035704))

(assert (= (and b!1035698 (not c!105001)) b!1035699))

(assert (= (and b!1035699 c!104999) b!1035701))

(assert (= (and b!1035699 (not c!104999)) b!1035702))

(assert (= (or b!1035701 b!1035702) bm!43790))

(assert (= (or b!1035704 bm!43790) bm!43791))

(assert (= (or b!1035703 bm!43791) bm!43789))

(assert (= (and bm!43789 c!105002) b!1035700))

(assert (= (and bm!43789 (not c!105002)) b!1035696))

(assert (= (and d!124675 res!691412) b!1035697))

(assert (= (and b!1035697 res!691413) b!1035695))

(declare-fun m!956221 () Bool)

(assert (=> b!1035700 m!956221))

(declare-fun m!956223 () Bool)

(assert (=> b!1035695 m!956223))

(declare-fun m!956225 () Bool)

(assert (=> bm!43789 m!956225))

(declare-fun m!956227 () Bool)

(assert (=> d!124675 m!956227))

(declare-fun m!956229 () Bool)

(assert (=> d!124675 m!956229))

(declare-fun m!956231 () Bool)

(assert (=> b!1035697 m!956231))

(assert (=> d!124403 d!124675))

(declare-fun d!124677 () Bool)

(declare-fun e!585574 () Bool)

(assert (=> d!124677 e!585574))

(declare-fun res!691414 () Bool)

(assert (=> d!124677 (=> res!691414 e!585574)))

(declare-fun lt!457096 () Bool)

(assert (=> d!124677 (= res!691414 (not lt!457096))))

(declare-fun lt!457095 () Bool)

(assert (=> d!124677 (= lt!457096 lt!457095)))

(declare-fun lt!457098 () Unit!33837)

(declare-fun e!585573 () Unit!33837)

(assert (=> d!124677 (= lt!457098 e!585573)))

(declare-fun c!105003 () Bool)

(assert (=> d!124677 (= c!105003 lt!457095)))

(assert (=> d!124677 (= lt!457095 (containsKey!565 (toList!6896 lt!456876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124677 (= (contains!6037 lt!456876 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457096)))

(declare-fun b!1035705 () Bool)

(declare-fun lt!457097 () Unit!33837)

(assert (=> b!1035705 (= e!585573 lt!457097)))

(assert (=> b!1035705 (= lt!457097 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035705 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035706 () Bool)

(declare-fun Unit!33866 () Unit!33837)

(assert (=> b!1035706 (= e!585573 Unit!33866)))

(declare-fun b!1035707 () Bool)

(assert (=> b!1035707 (= e!585574 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124677 c!105003) b!1035705))

(assert (= (and d!124677 (not c!105003)) b!1035706))

(assert (= (and d!124677 (not res!691414)) b!1035707))

(declare-fun m!956233 () Bool)

(assert (=> d!124677 m!956233))

(declare-fun m!956235 () Bool)

(assert (=> b!1035705 m!956235))

(assert (=> b!1035705 m!955857))

(assert (=> b!1035705 m!955857))

(declare-fun m!956237 () Bool)

(assert (=> b!1035705 m!956237))

(assert (=> b!1035707 m!955857))

(assert (=> b!1035707 m!955857))

(assert (=> b!1035707 m!956237))

(assert (=> bm!43750 d!124677))

(assert (=> bm!43739 d!124471))

(declare-fun d!124679 () Bool)

(assert (=> d!124679 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30277 () Bool)

(assert (= bs!30277 d!124679))

(assert (=> bs!30277 m!955599))

(declare-fun m!956239 () Bool)

(assert (=> bs!30277 m!956239))

(assert (=> b!1035277 d!124679))

(declare-fun b!1035708 () Bool)

(declare-fun e!585575 () Option!635)

(assert (=> b!1035708 (= e!585575 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456742)))))))

(declare-fun b!1035709 () Bool)

(declare-fun e!585576 () Option!635)

(assert (=> b!1035709 (= e!585575 e!585576)))

(declare-fun c!105005 () Bool)

(assert (=> b!1035709 (= c!105005 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035711 () Bool)

(assert (=> b!1035711 (= e!585576 None!633)))

(declare-fun b!1035710 () Bool)

(assert (=> b!1035710 (= e!585576 (getValueByKey!584 (t!31080 (toList!6896 lt!456742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124681 () Bool)

(declare-fun c!105004 () Bool)

(assert (=> d!124681 (= c!105004 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124681 (= (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000) e!585575)))

(assert (= (and d!124681 c!105004) b!1035708))

(assert (= (and d!124681 (not c!105004)) b!1035709))

(assert (= (and b!1035709 c!105005) b!1035710))

(assert (= (and b!1035709 (not c!105005)) b!1035711))

(declare-fun m!956241 () Bool)

(assert (=> b!1035710 m!956241))

(assert (=> b!1035277 d!124681))

(declare-fun d!124683 () Bool)

(declare-fun res!691415 () Bool)

(declare-fun e!585577 () Bool)

(assert (=> d!124683 (=> res!691415 e!585577)))

(assert (=> d!124683 (= res!691415 (and ((_ is Cons!21888) (toList!6896 lt!456652)) (= (_1!7874 (h!23099 (toList!6896 lt!456652))) key!909)))))

(assert (=> d!124683 (= (containsKey!565 (toList!6896 lt!456652) key!909) e!585577)))

(declare-fun b!1035712 () Bool)

(declare-fun e!585578 () Bool)

(assert (=> b!1035712 (= e!585577 e!585578)))

(declare-fun res!691416 () Bool)

(assert (=> b!1035712 (=> (not res!691416) (not e!585578))))

(assert (=> b!1035712 (= res!691416 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456652))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456652))) key!909)) ((_ is Cons!21888) (toList!6896 lt!456652)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456652))) key!909)))))

(declare-fun b!1035713 () Bool)

(assert (=> b!1035713 (= e!585578 (containsKey!565 (t!31080 (toList!6896 lt!456652)) key!909))))

(assert (= (and d!124683 (not res!691415)) b!1035712))

(assert (= (and b!1035712 res!691416) b!1035713))

(declare-fun m!956243 () Bool)

(assert (=> b!1035713 m!956243))

(assert (=> d!124345 d!124683))

(declare-fun d!124685 () Bool)

(assert (=> d!124685 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457099 () Unit!33837)

(assert (=> d!124685 (= lt!457099 (choose!1704 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!585579 () Bool)

(assert (=> d!124685 e!585579))

(declare-fun res!691417 () Bool)

(assert (=> d!124685 (=> (not res!691417) (not e!585579))))

(assert (=> d!124685 (= res!691417 (isStrictlySorted!706 (toList!6896 lt!456716)))))

(assert (=> d!124685 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457099)))

(declare-fun b!1035714 () Bool)

(assert (=> b!1035714 (= e!585579 (containsKey!565 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124685 res!691417) b!1035714))

(assert (=> d!124685 m!955291))

(assert (=> d!124685 m!955291))

(assert (=> d!124685 m!955319))

(declare-fun m!956245 () Bool)

(assert (=> d!124685 m!956245))

(assert (=> d!124685 m!955749))

(assert (=> b!1035714 m!955315))

(assert (=> b!1035146 d!124685))

(assert (=> b!1035146 d!124437))

(assert (=> b!1035146 d!124439))

(declare-fun d!124687 () Bool)

(assert (=> d!124687 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!456736)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!456736)))))

(assert (=> d!124389 d!124687))

(declare-fun e!585580 () Option!635)

(declare-fun b!1035715 () Bool)

(assert (=> b!1035715 (= e!585580 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035716 () Bool)

(declare-fun e!585581 () Option!635)

(assert (=> b!1035716 (= e!585580 e!585581)))

(declare-fun c!105007 () Bool)

(assert (=> b!1035716 (= c!105007 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))) lt!456736))))))

(declare-fun b!1035718 () Bool)

(assert (=> b!1035718 (= e!585581 None!633)))

(declare-fun b!1035717 () Bool)

(assert (=> b!1035717 (= e!585581 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))) lt!456736))))

(declare-fun c!105006 () Bool)

(declare-fun d!124689 () Bool)

(assert (=> d!124689 (= c!105006 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))) lt!456736)))))

(assert (=> d!124689 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!456736) e!585580)))

(assert (= (and d!124689 c!105006) b!1035715))

(assert (= (and d!124689 (not c!105006)) b!1035716))

(assert (= (and b!1035716 c!105007) b!1035717))

(assert (= (and b!1035716 (not c!105007)) b!1035718))

(declare-fun m!956247 () Bool)

(assert (=> b!1035717 m!956247))

(assert (=> d!124389 d!124689))

(declare-fun d!124691 () Bool)

(declare-fun e!585582 () Bool)

(assert (=> d!124691 e!585582))

(declare-fun res!691418 () Bool)

(assert (=> d!124691 (=> (not res!691418) (not e!585582))))

(declare-fun lt!457101 () ListLongMap!13761)

(assert (=> d!124691 (= res!691418 (contains!6037 lt!457101 (_1!7874 (tuple2!15727 lt!456762 lt!456766))))))

(declare-fun lt!457103 () List!21892)

(assert (=> d!124691 (= lt!457101 (ListLongMap!13762 lt!457103))))

(declare-fun lt!457102 () Unit!33837)

(declare-fun lt!457100 () Unit!33837)

(assert (=> d!124691 (= lt!457102 lt!457100)))

(assert (=> d!124691 (= (getValueByKey!584 lt!457103 (_1!7874 (tuple2!15727 lt!456762 lt!456766))) (Some!634 (_2!7874 (tuple2!15727 lt!456762 lt!456766))))))

(assert (=> d!124691 (= lt!457100 (lemmaContainsTupThenGetReturnValue!280 lt!457103 (_1!7874 (tuple2!15727 lt!456762 lt!456766)) (_2!7874 (tuple2!15727 lt!456762 lt!456766))))))

(assert (=> d!124691 (= lt!457103 (insertStrictlySorted!373 (toList!6896 lt!456768) (_1!7874 (tuple2!15727 lt!456762 lt!456766)) (_2!7874 (tuple2!15727 lt!456762 lt!456766))))))

(assert (=> d!124691 (= (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766)) lt!457101)))

(declare-fun b!1035719 () Bool)

(declare-fun res!691419 () Bool)

(assert (=> b!1035719 (=> (not res!691419) (not e!585582))))

(assert (=> b!1035719 (= res!691419 (= (getValueByKey!584 (toList!6896 lt!457101) (_1!7874 (tuple2!15727 lt!456762 lt!456766))) (Some!634 (_2!7874 (tuple2!15727 lt!456762 lt!456766)))))))

(declare-fun b!1035720 () Bool)

(assert (=> b!1035720 (= e!585582 (contains!6038 (toList!6896 lt!457101) (tuple2!15727 lt!456762 lt!456766)))))

(assert (= (and d!124691 res!691418) b!1035719))

(assert (= (and b!1035719 res!691419) b!1035720))

(declare-fun m!956249 () Bool)

(assert (=> d!124691 m!956249))

(declare-fun m!956251 () Bool)

(assert (=> d!124691 m!956251))

(declare-fun m!956253 () Bool)

(assert (=> d!124691 m!956253))

(declare-fun m!956255 () Bool)

(assert (=> d!124691 m!956255))

(declare-fun m!956257 () Bool)

(assert (=> b!1035719 m!956257))

(declare-fun m!956259 () Bool)

(assert (=> b!1035720 m!956259))

(assert (=> b!1035076 d!124691))

(assert (=> b!1035076 d!124335))

(declare-fun d!124693 () Bool)

(declare-fun e!585584 () Bool)

(assert (=> d!124693 e!585584))

(declare-fun res!691420 () Bool)

(assert (=> d!124693 (=> res!691420 e!585584)))

(declare-fun lt!457105 () Bool)

(assert (=> d!124693 (= res!691420 (not lt!457105))))

(declare-fun lt!457104 () Bool)

(assert (=> d!124693 (= lt!457105 lt!457104)))

(declare-fun lt!457107 () Unit!33837)

(declare-fun e!585583 () Unit!33837)

(assert (=> d!124693 (= lt!457107 e!585583)))

(declare-fun c!105008 () Bool)

(assert (=> d!124693 (= c!105008 lt!457104)))

(assert (=> d!124693 (= lt!457104 (containsKey!565 (toList!6896 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766))) lt!456764))))

(assert (=> d!124693 (= (contains!6037 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766)) lt!456764) lt!457105)))

(declare-fun b!1035721 () Bool)

(declare-fun lt!457106 () Unit!33837)

(assert (=> b!1035721 (= e!585583 lt!457106)))

(assert (=> b!1035721 (= lt!457106 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766))) lt!456764))))

(assert (=> b!1035721 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766))) lt!456764))))

(declare-fun b!1035722 () Bool)

(declare-fun Unit!33867 () Unit!33837)

(assert (=> b!1035722 (= e!585583 Unit!33867)))

(declare-fun b!1035723 () Bool)

(assert (=> b!1035723 (= e!585584 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766))) lt!456764)))))

(assert (= (and d!124693 c!105008) b!1035721))

(assert (= (and d!124693 (not c!105008)) b!1035722))

(assert (= (and d!124693 (not res!691420)) b!1035723))

(declare-fun m!956261 () Bool)

(assert (=> d!124693 m!956261))

(declare-fun m!956263 () Bool)

(assert (=> b!1035721 m!956263))

(declare-fun m!956265 () Bool)

(assert (=> b!1035721 m!956265))

(assert (=> b!1035721 m!956265))

(declare-fun m!956267 () Bool)

(assert (=> b!1035721 m!956267))

(assert (=> b!1035723 m!956265))

(assert (=> b!1035723 m!956265))

(assert (=> b!1035723 m!956267))

(assert (=> b!1035076 d!124693))

(declare-fun d!124695 () Bool)

(declare-fun e!585585 () Bool)

(assert (=> d!124695 e!585585))

(declare-fun res!691421 () Bool)

(assert (=> d!124695 (=> (not res!691421) (not e!585585))))

(declare-fun lt!457109 () ListLongMap!13761)

(assert (=> d!124695 (= res!691421 (contains!6037 lt!457109 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!457111 () List!21892)

(assert (=> d!124695 (= lt!457109 (ListLongMap!13762 lt!457111))))

(declare-fun lt!457110 () Unit!33837)

(declare-fun lt!457108 () Unit!33837)

(assert (=> d!124695 (= lt!457110 lt!457108)))

(assert (=> d!124695 (= (getValueByKey!584 lt!457111 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!634 (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124695 (= lt!457108 (lemmaContainsTupThenGetReturnValue!280 lt!457111 (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124695 (= lt!457111 (insertStrictlySorted!373 (toList!6896 call!43742) (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124695 (= (+!3126 call!43742 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!457109)))

(declare-fun b!1035724 () Bool)

(declare-fun res!691422 () Bool)

(assert (=> b!1035724 (=> (not res!691422) (not e!585585))))

(assert (=> b!1035724 (= res!691422 (= (getValueByKey!584 (toList!6896 lt!457109) (_1!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!634 (_2!7874 (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1035725 () Bool)

(assert (=> b!1035725 (= e!585585 (contains!6038 (toList!6896 lt!457109) (tuple2!15727 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (get!16462 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124695 res!691421) b!1035724))

(assert (= (and b!1035724 res!691422) b!1035725))

(declare-fun m!956269 () Bool)

(assert (=> d!124695 m!956269))

(declare-fun m!956271 () Bool)

(assert (=> d!124695 m!956271))

(declare-fun m!956273 () Bool)

(assert (=> d!124695 m!956273))

(declare-fun m!956275 () Bool)

(assert (=> d!124695 m!956275))

(declare-fun m!956277 () Bool)

(assert (=> b!1035724 m!956277))

(declare-fun m!956279 () Bool)

(assert (=> b!1035725 m!956279))

(assert (=> b!1035076 d!124695))

(declare-fun d!124697 () Bool)

(assert (=> d!124697 (not (contains!6037 (+!3126 lt!456768 (tuple2!15727 lt!456762 lt!456766)) lt!456764))))

(declare-fun lt!457112 () Unit!33837)

(assert (=> d!124697 (= lt!457112 (choose!1705 lt!456768 lt!456762 lt!456766 lt!456764))))

(declare-fun e!585586 () Bool)

(assert (=> d!124697 e!585586))

(declare-fun res!691423 () Bool)

(assert (=> d!124697 (=> (not res!691423) (not e!585586))))

(assert (=> d!124697 (= res!691423 (not (contains!6037 lt!456768 lt!456764)))))

(assert (=> d!124697 (= (addStillNotContains!244 lt!456768 lt!456762 lt!456766 lt!456764) lt!457112)))

(declare-fun b!1035726 () Bool)

(assert (=> b!1035726 (= e!585586 (not (= lt!456762 lt!456764)))))

(assert (= (and d!124697 res!691423) b!1035726))

(assert (=> d!124697 m!955151))

(assert (=> d!124697 m!955151))

(assert (=> d!124697 m!955157))

(declare-fun m!956281 () Bool)

(assert (=> d!124697 m!956281))

(declare-fun m!956283 () Bool)

(assert (=> d!124697 m!956283))

(assert (=> b!1035076 d!124697))

(assert (=> b!1035166 d!124487))

(assert (=> b!1035166 d!124489))

(assert (=> b!1035151 d!124465))

(assert (=> b!1035151 d!124467))

(declare-fun d!124699 () Bool)

(declare-fun e!585588 () Bool)

(assert (=> d!124699 e!585588))

(declare-fun res!691424 () Bool)

(assert (=> d!124699 (=> res!691424 e!585588)))

(declare-fun lt!457114 () Bool)

(assert (=> d!124699 (= res!691424 (not lt!457114))))

(declare-fun lt!457113 () Bool)

(assert (=> d!124699 (= lt!457114 lt!457113)))

(declare-fun lt!457116 () Unit!33837)

(declare-fun e!585587 () Unit!33837)

(assert (=> d!124699 (= lt!457116 e!585587)))

(declare-fun c!105009 () Bool)

(assert (=> d!124699 (= c!105009 lt!457113)))

(assert (=> d!124699 (= lt!457113 (containsKey!565 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124699 (= (contains!6037 lt!456811 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457114)))

(declare-fun b!1035727 () Bool)

(declare-fun lt!457115 () Unit!33837)

(assert (=> b!1035727 (= e!585587 lt!457115)))

(assert (=> b!1035727 (= lt!457115 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> b!1035727 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035728 () Bool)

(declare-fun Unit!33868 () Unit!33837)

(assert (=> b!1035728 (= e!585587 Unit!33868)))

(declare-fun b!1035729 () Bool)

(assert (=> b!1035729 (= e!585588 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456811) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124699 c!105009) b!1035727))

(assert (= (and d!124699 (not c!105009)) b!1035728))

(assert (= (and d!124699 (not res!691424)) b!1035729))

(declare-fun m!956285 () Bool)

(assert (=> d!124699 m!956285))

(declare-fun m!956287 () Bool)

(assert (=> b!1035727 m!956287))

(assert (=> b!1035727 m!955269))

(assert (=> b!1035727 m!955269))

(declare-fun m!956289 () Bool)

(assert (=> b!1035727 m!956289))

(assert (=> b!1035729 m!955269))

(assert (=> b!1035729 m!955269))

(assert (=> b!1035729 m!956289))

(assert (=> d!124321 d!124699))

(declare-fun b!1035730 () Bool)

(declare-fun e!585589 () Option!635)

(assert (=> b!1035730 (= e!585589 (Some!634 (_2!7874 (h!23099 lt!456813))))))

(declare-fun b!1035731 () Bool)

(declare-fun e!585590 () Option!635)

(assert (=> b!1035731 (= e!585589 e!585590)))

(declare-fun c!105011 () Bool)

(assert (=> b!1035731 (= c!105011 (and ((_ is Cons!21888) lt!456813) (not (= (_1!7874 (h!23099 lt!456813)) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035733 () Bool)

(assert (=> b!1035733 (= e!585590 None!633)))

(declare-fun b!1035732 () Bool)

(assert (=> b!1035732 (= e!585590 (getValueByKey!584 (t!31080 lt!456813) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun c!105010 () Bool)

(declare-fun d!124701 () Bool)

(assert (=> d!124701 (= c!105010 (and ((_ is Cons!21888) lt!456813) (= (_1!7874 (h!23099 lt!456813)) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124701 (= (getValueByKey!584 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) e!585589)))

(assert (= (and d!124701 c!105010) b!1035730))

(assert (= (and d!124701 (not c!105010)) b!1035731))

(assert (= (and b!1035731 c!105011) b!1035732))

(assert (= (and b!1035731 (not c!105011)) b!1035733))

(declare-fun m!956291 () Bool)

(assert (=> b!1035732 m!956291))

(assert (=> d!124321 d!124701))

(declare-fun d!124703 () Bool)

(assert (=> d!124703 (= (getValueByKey!584 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) (Some!634 (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun lt!457117 () Unit!33837)

(assert (=> d!124703 (= lt!457117 (choose!1703 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!585591 () Bool)

(assert (=> d!124703 e!585591))

(declare-fun res!691425 () Bool)

(assert (=> d!124703 (=> (not res!691425) (not e!585591))))

(assert (=> d!124703 (= res!691425 (isStrictlySorted!706 lt!456813))))

(assert (=> d!124703 (= (lemmaContainsTupThenGetReturnValue!280 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457117)))

(declare-fun b!1035734 () Bool)

(declare-fun res!691426 () Bool)

(assert (=> b!1035734 (=> (not res!691426) (not e!585591))))

(assert (=> b!1035734 (= res!691426 (containsKey!565 lt!456813 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035735 () Bool)

(assert (=> b!1035735 (= e!585591 (contains!6038 lt!456813 (tuple2!15727 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (= (and d!124703 res!691425) b!1035734))

(assert (= (and b!1035734 res!691426) b!1035735))

(assert (=> d!124703 m!955263))

(declare-fun m!956293 () Bool)

(assert (=> d!124703 m!956293))

(declare-fun m!956295 () Bool)

(assert (=> d!124703 m!956295))

(declare-fun m!956297 () Bool)

(assert (=> b!1035734 m!956297))

(declare-fun m!956299 () Bool)

(assert (=> b!1035735 m!956299))

(assert (=> d!124321 d!124703))

(declare-fun e!585592 () Bool)

(declare-fun b!1035736 () Bool)

(declare-fun lt!457118 () List!21892)

(assert (=> b!1035736 (= e!585592 (contains!6038 lt!457118 (tuple2!15727 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun e!585596 () List!21892)

(declare-fun c!105013 () Bool)

(declare-fun call!43797 () List!21892)

(declare-fun bm!43792 () Bool)

(assert (=> bm!43792 (= call!43797 ($colon$colon!603 e!585596 (ite c!105013 (h!23099 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (tuple2!15727 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))))

(declare-fun c!105015 () Bool)

(assert (=> bm!43792 (= c!105015 c!105013)))

(declare-fun bm!43793 () Bool)

(declare-fun call!43795 () List!21892)

(declare-fun call!43796 () List!21892)

(assert (=> bm!43793 (= call!43795 call!43796)))

(declare-fun c!105014 () Bool)

(declare-fun b!1035737 () Bool)

(declare-fun c!105012 () Bool)

(assert (=> b!1035737 (= e!585596 (ite c!105014 (t!31080 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (ite c!105012 (Cons!21888 (h!23099 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (t!31080 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))))) Nil!21889)))))

(declare-fun b!1035738 () Bool)

(declare-fun res!691428 () Bool)

(assert (=> b!1035738 (=> (not res!691428) (not e!585592))))

(assert (=> b!1035738 (= res!691428 (containsKey!565 lt!457118 (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035739 () Bool)

(declare-fun e!585594 () List!21892)

(declare-fun e!585593 () List!21892)

(assert (=> b!1035739 (= e!585594 e!585593)))

(assert (=> b!1035739 (= c!105014 (and ((_ is Cons!21888) (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (= (_1!7874 (h!23099 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035740 () Bool)

(assert (=> b!1035740 (= c!105012 (and ((_ is Cons!21888) (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (bvsgt (_1!7874 (h!23099 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun e!585595 () List!21892)

(assert (=> b!1035740 (= e!585593 e!585595)))

(declare-fun b!1035741 () Bool)

(assert (=> b!1035741 (= e!585596 (insertStrictlySorted!373 (t!31080 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035742 () Bool)

(assert (=> b!1035742 (= e!585595 call!43795)))

(declare-fun b!1035743 () Bool)

(assert (=> b!1035743 (= e!585595 call!43795)))

(declare-fun bm!43794 () Bool)

(assert (=> bm!43794 (= call!43796 call!43797)))

(declare-fun b!1035744 () Bool)

(assert (=> b!1035744 (= e!585594 call!43797)))

(declare-fun b!1035745 () Bool)

(assert (=> b!1035745 (= e!585593 call!43796)))

(declare-fun d!124705 () Bool)

(assert (=> d!124705 e!585592))

(declare-fun res!691427 () Bool)

(assert (=> d!124705 (=> (not res!691427) (not e!585592))))

(assert (=> d!124705 (= res!691427 (isStrictlySorted!706 lt!457118))))

(assert (=> d!124705 (= lt!457118 e!585594)))

(assert (=> d!124705 (= c!105013 (and ((_ is Cons!21888) (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738)))) (bvslt (_1!7874 (h!23099 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(assert (=> d!124705 (isStrictlySorted!706 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))))))

(assert (=> d!124705 (= (insertStrictlySorted!373 (toList!6896 (ite c!104799 call!43739 (ite c!104804 call!43733 call!43738))) (_1!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (_2!7874 (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))) lt!457118)))

(assert (= (and d!124705 c!105013) b!1035744))

(assert (= (and d!124705 (not c!105013)) b!1035739))

(assert (= (and b!1035739 c!105014) b!1035745))

(assert (= (and b!1035739 (not c!105014)) b!1035740))

(assert (= (and b!1035740 c!105012) b!1035742))

(assert (= (and b!1035740 (not c!105012)) b!1035743))

(assert (= (or b!1035742 b!1035743) bm!43793))

(assert (= (or b!1035745 bm!43793) bm!43794))

(assert (= (or b!1035744 bm!43794) bm!43792))

(assert (= (and bm!43792 c!105015) b!1035741))

(assert (= (and bm!43792 (not c!105015)) b!1035737))

(assert (= (and d!124705 res!691427) b!1035738))

(assert (= (and b!1035738 res!691428) b!1035736))

(declare-fun m!956301 () Bool)

(assert (=> b!1035741 m!956301))

(declare-fun m!956303 () Bool)

(assert (=> b!1035736 m!956303))

(declare-fun m!956305 () Bool)

(assert (=> bm!43792 m!956305))

(declare-fun m!956307 () Bool)

(assert (=> d!124705 m!956307))

(declare-fun m!956309 () Bool)

(assert (=> d!124705 m!956309))

(declare-fun m!956311 () Bool)

(assert (=> b!1035738 m!956311))

(assert (=> d!124321 d!124705))

(declare-fun b!1035746 () Bool)

(declare-fun e!585598 () (_ BitVec 32))

(declare-fun call!43798 () (_ BitVec 32))

(assert (=> b!1035746 (= e!585598 (bvadd #b00000000000000000000000000000001 call!43798))))

(declare-fun b!1035747 () Bool)

(declare-fun e!585597 () (_ BitVec 32))

(assert (=> b!1035747 (= e!585597 #b00000000000000000000000000000000)))

(declare-fun bm!43795 () Bool)

(assert (=> bm!43795 (= call!43798 (arrayCountValidKeys!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(declare-fun d!124707 () Bool)

(declare-fun lt!457119 () (_ BitVec 32))

(assert (=> d!124707 (and (bvsge lt!457119 #b00000000000000000000000000000000) (bvsle lt!457119 (bvsub (size!31892 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!124707 (= lt!457119 e!585597)))

(declare-fun c!105017 () Bool)

(assert (=> d!124707 (= c!105017 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124707 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31892 (_keys!11444 lt!456630)) (size!31892 (_keys!11444 lt!456630))))))

(assert (=> d!124707 (= (arrayCountValidKeys!0 (_keys!11444 lt!456630) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 lt!456630))) lt!457119)))

(declare-fun b!1035748 () Bool)

(assert (=> b!1035748 (= e!585598 call!43798)))

(declare-fun b!1035749 () Bool)

(assert (=> b!1035749 (= e!585597 e!585598)))

(declare-fun c!105016 () Bool)

(assert (=> b!1035749 (= c!105016 (validKeyInArray!0 (select (arr!31369 (_keys!11444 lt!456630)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124707 c!105017) b!1035747))

(assert (= (and d!124707 (not c!105017)) b!1035749))

(assert (= (and b!1035749 c!105016) b!1035746))

(assert (= (and b!1035749 (not c!105016)) b!1035748))

(assert (= (or b!1035746 b!1035748) bm!43795))

(declare-fun m!956313 () Bool)

(assert (=> bm!43795 m!956313))

(assert (=> b!1035749 m!955789))

(assert (=> b!1035749 m!955789))

(assert (=> b!1035749 m!955793))

(assert (=> bm!43745 d!124707))

(declare-fun d!124709 () Bool)

(declare-fun e!585600 () Bool)

(assert (=> d!124709 e!585600))

(declare-fun res!691429 () Bool)

(assert (=> d!124709 (=> res!691429 e!585600)))

(declare-fun lt!457121 () Bool)

(assert (=> d!124709 (= res!691429 (not lt!457121))))

(declare-fun lt!457120 () Bool)

(assert (=> d!124709 (= lt!457121 lt!457120)))

(declare-fun lt!457123 () Unit!33837)

(declare-fun e!585599 () Unit!33837)

(assert (=> d!124709 (= lt!457123 e!585599)))

(declare-fun c!105018 () Bool)

(assert (=> d!124709 (= c!105018 lt!457120)))

(assert (=> d!124709 (= lt!457120 (containsKey!565 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> d!124709 (= (contains!6037 lt!456896 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!457121)))

(declare-fun b!1035750 () Bool)

(declare-fun lt!457122 () Unit!33837)

(assert (=> b!1035750 (= e!585599 lt!457122)))

(assert (=> b!1035750 (= lt!457122 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035750 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035751 () Bool)

(declare-fun Unit!33869 () Unit!33837)

(assert (=> b!1035751 (= e!585599 Unit!33869)))

(declare-fun b!1035752 () Bool)

(assert (=> b!1035752 (= e!585600 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456896) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124709 c!105018) b!1035750))

(assert (= (and d!124709 (not c!105018)) b!1035751))

(assert (= (and d!124709 (not res!691429)) b!1035752))

(declare-fun m!956315 () Bool)

(assert (=> d!124709 m!956315))

(declare-fun m!956317 () Bool)

(assert (=> b!1035750 m!956317))

(assert (=> b!1035750 m!955495))

(assert (=> b!1035750 m!955495))

(declare-fun m!956319 () Bool)

(assert (=> b!1035750 m!956319))

(assert (=> b!1035752 m!955495))

(assert (=> b!1035752 m!955495))

(assert (=> b!1035752 m!956319))

(assert (=> d!124377 d!124709))

(declare-fun b!1035753 () Bool)

(declare-fun e!585601 () Option!635)

(assert (=> b!1035753 (= e!585601 (Some!634 (_2!7874 (h!23099 lt!456898))))))

(declare-fun b!1035754 () Bool)

(declare-fun e!585602 () Option!635)

(assert (=> b!1035754 (= e!585601 e!585602)))

(declare-fun c!105020 () Bool)

(assert (=> b!1035754 (= c!105020 (and ((_ is Cons!21888) lt!456898) (not (= (_1!7874 (h!23099 lt!456898)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035756 () Bool)

(assert (=> b!1035756 (= e!585602 None!633)))

(declare-fun b!1035755 () Bool)

(assert (=> b!1035755 (= e!585602 (getValueByKey!584 (t!31080 lt!456898) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun d!124711 () Bool)

(declare-fun c!105019 () Bool)

(assert (=> d!124711 (= c!105019 (and ((_ is Cons!21888) lt!456898) (= (_1!7874 (h!23099 lt!456898)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124711 (= (getValueByKey!584 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) e!585601)))

(assert (= (and d!124711 c!105019) b!1035753))

(assert (= (and d!124711 (not c!105019)) b!1035754))

(assert (= (and b!1035754 c!105020) b!1035755))

(assert (= (and b!1035754 (not c!105020)) b!1035756))

(declare-fun m!956321 () Bool)

(assert (=> b!1035755 m!956321))

(assert (=> d!124377 d!124711))

(declare-fun d!124713 () Bool)

(assert (=> d!124713 (= (getValueByKey!584 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun lt!457124 () Unit!33837)

(assert (=> d!124713 (= lt!457124 (choose!1703 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!585603 () Bool)

(assert (=> d!124713 e!585603))

(declare-fun res!691430 () Bool)

(assert (=> d!124713 (=> (not res!691430) (not e!585603))))

(assert (=> d!124713 (= res!691430 (isStrictlySorted!706 lt!456898))))

(assert (=> d!124713 (= (lemmaContainsTupThenGetReturnValue!280 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!457124)))

(declare-fun b!1035757 () Bool)

(declare-fun res!691431 () Bool)

(assert (=> b!1035757 (=> (not res!691431) (not e!585603))))

(assert (=> b!1035757 (= res!691431 (containsKey!565 lt!456898 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035758 () Bool)

(assert (=> b!1035758 (= e!585603 (contains!6038 lt!456898 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124713 res!691430) b!1035757))

(assert (= (and b!1035757 res!691431) b!1035758))

(assert (=> d!124713 m!955489))

(declare-fun m!956323 () Bool)

(assert (=> d!124713 m!956323))

(declare-fun m!956325 () Bool)

(assert (=> d!124713 m!956325))

(declare-fun m!956327 () Bool)

(assert (=> b!1035757 m!956327))

(declare-fun m!956329 () Bool)

(assert (=> b!1035758 m!956329))

(assert (=> d!124377 d!124713))

(declare-fun b!1035759 () Bool)

(declare-fun e!585604 () Bool)

(declare-fun lt!457125 () List!21892)

(assert (=> b!1035759 (= e!585604 (contains!6038 lt!457125 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun bm!43796 () Bool)

(declare-fun c!105022 () Bool)

(declare-fun call!43801 () List!21892)

(declare-fun e!585608 () List!21892)

(assert (=> bm!43796 (= call!43801 ($colon$colon!603 e!585608 (ite c!105022 (h!23099 (toList!6896 call!43727)) (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))))

(declare-fun c!105024 () Bool)

(assert (=> bm!43796 (= c!105024 c!105022)))

(declare-fun bm!43797 () Bool)

(declare-fun call!43799 () List!21892)

(declare-fun call!43800 () List!21892)

(assert (=> bm!43797 (= call!43799 call!43800)))

(declare-fun b!1035760 () Bool)

(declare-fun c!105021 () Bool)

(declare-fun c!105023 () Bool)

(assert (=> b!1035760 (= e!585608 (ite c!105023 (t!31080 (toList!6896 call!43727)) (ite c!105021 (Cons!21888 (h!23099 (toList!6896 call!43727)) (t!31080 (toList!6896 call!43727))) Nil!21889)))))

(declare-fun b!1035761 () Bool)

(declare-fun res!691433 () Bool)

(assert (=> b!1035761 (=> (not res!691433) (not e!585604))))

(assert (=> b!1035761 (= res!691433 (containsKey!565 lt!457125 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035762 () Bool)

(declare-fun e!585606 () List!21892)

(declare-fun e!585605 () List!21892)

(assert (=> b!1035762 (= e!585606 e!585605)))

(assert (=> b!1035762 (= c!105023 (and ((_ is Cons!21888) (toList!6896 call!43727)) (= (_1!7874 (h!23099 (toList!6896 call!43727))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035763 () Bool)

(assert (=> b!1035763 (= c!105021 (and ((_ is Cons!21888) (toList!6896 call!43727)) (bvsgt (_1!7874 (h!23099 (toList!6896 call!43727))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(declare-fun e!585607 () List!21892)

(assert (=> b!1035763 (= e!585605 e!585607)))

(declare-fun b!1035764 () Bool)

(assert (=> b!1035764 (= e!585608 (insertStrictlySorted!373 (t!31080 (toList!6896 call!43727)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035765 () Bool)

(assert (=> b!1035765 (= e!585607 call!43799)))

(declare-fun b!1035766 () Bool)

(assert (=> b!1035766 (= e!585607 call!43799)))

(declare-fun bm!43798 () Bool)

(assert (=> bm!43798 (= call!43800 call!43801)))

(declare-fun b!1035767 () Bool)

(assert (=> b!1035767 (= e!585606 call!43801)))

(declare-fun b!1035768 () Bool)

(assert (=> b!1035768 (= e!585605 call!43800)))

(declare-fun d!124715 () Bool)

(assert (=> d!124715 e!585604))

(declare-fun res!691432 () Bool)

(assert (=> d!124715 (=> (not res!691432) (not e!585604))))

(assert (=> d!124715 (= res!691432 (isStrictlySorted!706 lt!457125))))

(assert (=> d!124715 (= lt!457125 e!585606)))

(assert (=> d!124715 (= c!105022 (and ((_ is Cons!21888) (toList!6896 call!43727)) (bvslt (_1!7874 (h!23099 (toList!6896 call!43727))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))))

(assert (=> d!124715 (isStrictlySorted!706 (toList!6896 call!43727))))

(assert (=> d!124715 (= (insertStrictlySorted!373 (toList!6896 call!43727) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!457125)))

(assert (= (and d!124715 c!105022) b!1035767))

(assert (= (and d!124715 (not c!105022)) b!1035762))

(assert (= (and b!1035762 c!105023) b!1035768))

(assert (= (and b!1035762 (not c!105023)) b!1035763))

(assert (= (and b!1035763 c!105021) b!1035765))

(assert (= (and b!1035763 (not c!105021)) b!1035766))

(assert (= (or b!1035765 b!1035766) bm!43797))

(assert (= (or b!1035768 bm!43797) bm!43798))

(assert (= (or b!1035767 bm!43798) bm!43796))

(assert (= (and bm!43796 c!105024) b!1035764))

(assert (= (and bm!43796 (not c!105024)) b!1035760))

(assert (= (and d!124715 res!691432) b!1035761))

(assert (= (and b!1035761 res!691433) b!1035759))

(declare-fun m!956331 () Bool)

(assert (=> b!1035764 m!956331))

(declare-fun m!956333 () Bool)

(assert (=> b!1035759 m!956333))

(declare-fun m!956335 () Bool)

(assert (=> bm!43796 m!956335))

(declare-fun m!956337 () Bool)

(assert (=> d!124715 m!956337))

(declare-fun m!956339 () Bool)

(assert (=> d!124715 m!956339))

(declare-fun m!956341 () Bool)

(assert (=> b!1035761 m!956341))

(assert (=> d!124377 d!124715))

(declare-fun d!124717 () Bool)

(assert (=> d!124717 (= (apply!915 lt!456876 (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000)) (get!16463 (getValueByKey!584 (toList!6896 lt!456876) (select (arr!31369 (_keys!11444 lt!456630)) #b00000000000000000000000000000000))))))

(declare-fun bs!30278 () Bool)

(assert (= bs!30278 d!124717))

(assert (=> bs!30278 m!955297))

(assert (=> bs!30278 m!955625))

(assert (=> bs!30278 m!955625))

(declare-fun m!956343 () Bool)

(assert (=> bs!30278 m!956343))

(assert (=> b!1035213 d!124717))

(declare-fun d!124719 () Bool)

(declare-fun c!105025 () Bool)

(assert (=> d!124719 (= c!105025 ((_ is ValueCellFull!11555) (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000)))))

(declare-fun e!585609 () V!37563)

(assert (=> d!124719 (= (get!16462 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000)) e!585609)))

(declare-fun b!1035769 () Bool)

(assert (=> b!1035769 (= e!585609 (get!16464 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035770 () Bool)

(assert (=> b!1035770 (= e!585609 (get!16465 (select (arr!31370 (_values!6249 lt!456630)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 lt!456630) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124719 c!105025) b!1035769))

(assert (= (and d!124719 (not c!105025)) b!1035770))

(assert (=> b!1035769 m!955383))

(assert (=> b!1035769 m!955385))

(declare-fun m!956345 () Bool)

(assert (=> b!1035769 m!956345))

(assert (=> b!1035770 m!955383))

(assert (=> b!1035770 m!955385))

(declare-fun m!956347 () Bool)

(assert (=> b!1035770 m!956347))

(assert (=> b!1035213 d!124719))

(declare-fun d!124721 () Bool)

(assert (=> d!124721 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457126 () Unit!33837)

(assert (=> d!124721 (= lt!457126 (choose!1704 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!585610 () Bool)

(assert (=> d!124721 e!585610))

(declare-fun res!691434 () Bool)

(assert (=> d!124721 (=> (not res!691434) (not e!585610))))

(assert (=> d!124721 (= res!691434 (isStrictlySorted!706 (toList!6896 lt!456742)))))

(assert (=> d!124721 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000) lt!457126)))

(declare-fun b!1035771 () Bool)

(assert (=> b!1035771 (= e!585610 (containsKey!565 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124721 res!691434) b!1035771))

(assert (=> d!124721 m!955481))

(assert (=> d!124721 m!955481))

(assert (=> d!124721 m!955615))

(declare-fun m!956349 () Bool)

(assert (=> d!124721 m!956349))

(assert (=> d!124721 m!955811))

(assert (=> b!1035771 m!955611))

(assert (=> b!1035278 d!124721))

(declare-fun d!124723 () Bool)

(assert (=> d!124723 (= (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!931 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30279 () Bool)

(assert (= bs!30279 d!124723))

(assert (=> bs!30279 m!955481))

(declare-fun m!956351 () Bool)

(assert (=> bs!30279 m!956351))

(assert (=> b!1035278 d!124723))

(declare-fun b!1035772 () Bool)

(declare-fun e!585611 () Option!635)

(assert (=> b!1035772 (= e!585611 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456742)))))))

(declare-fun b!1035773 () Bool)

(declare-fun e!585612 () Option!635)

(assert (=> b!1035773 (= e!585611 e!585612)))

(declare-fun c!105027 () Bool)

(assert (=> b!1035773 (= c!105027 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035775 () Bool)

(assert (=> b!1035775 (= e!585612 None!633)))

(declare-fun b!1035774 () Bool)

(assert (=> b!1035774 (= e!585612 (getValueByKey!584 (t!31080 (toList!6896 lt!456742)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124725 () Bool)

(declare-fun c!105026 () Bool)

(assert (=> d!124725 (= c!105026 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124725 (= (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000) e!585611)))

(assert (= (and d!124725 c!105026) b!1035772))

(assert (= (and d!124725 (not c!105026)) b!1035773))

(assert (= (and b!1035773 c!105027) b!1035774))

(assert (= (and b!1035773 (not c!105027)) b!1035775))

(declare-fun m!956353 () Bool)

(assert (=> b!1035774 m!956353))

(assert (=> b!1035278 d!124725))

(declare-fun d!124727 () Bool)

(declare-fun e!585614 () Bool)

(assert (=> d!124727 e!585614))

(declare-fun res!691435 () Bool)

(assert (=> d!124727 (=> res!691435 e!585614)))

(declare-fun lt!457128 () Bool)

(assert (=> d!124727 (= res!691435 (not lt!457128))))

(declare-fun lt!457127 () Bool)

(assert (=> d!124727 (= lt!457128 lt!457127)))

(declare-fun lt!457130 () Unit!33837)

(declare-fun e!585613 () Unit!33837)

(assert (=> d!124727 (= lt!457130 e!585613)))

(declare-fun c!105028 () Bool)

(assert (=> d!124727 (= c!105028 lt!457127)))

(assert (=> d!124727 (= lt!457127 (containsKey!565 (toList!6896 lt!456767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124727 (= (contains!6037 lt!456767 #b1000000000000000000000000000000000000000000000000000000000000000) lt!457128)))

(declare-fun b!1035776 () Bool)

(declare-fun lt!457129 () Unit!33837)

(assert (=> b!1035776 (= e!585613 lt!457129)))

(assert (=> b!1035776 (= lt!457129 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035776 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035777 () Bool)

(declare-fun Unit!33870 () Unit!33837)

(assert (=> b!1035777 (= e!585613 Unit!33870)))

(declare-fun b!1035778 () Bool)

(assert (=> b!1035778 (= e!585614 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124727 c!105028) b!1035776))

(assert (= (and d!124727 (not c!105028)) b!1035777))

(assert (= (and d!124727 (not res!691435)) b!1035778))

(declare-fun m!956355 () Bool)

(assert (=> d!124727 m!956355))

(declare-fun m!956357 () Bool)

(assert (=> b!1035776 m!956357))

(declare-fun m!956359 () Bool)

(assert (=> b!1035776 m!956359))

(assert (=> b!1035776 m!956359))

(declare-fun m!956361 () Bool)

(assert (=> b!1035776 m!956361))

(assert (=> b!1035778 m!956359))

(assert (=> b!1035778 m!956359))

(assert (=> b!1035778 m!956361))

(assert (=> b!1035072 d!124727))

(declare-fun d!124729 () Bool)

(declare-fun lt!457131 () Bool)

(assert (=> d!124729 (= lt!457131 (select (content!515 (toList!6896 lt!456919)) (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))

(declare-fun e!585615 () Bool)

(assert (=> d!124729 (= lt!457131 e!585615)))

(declare-fun res!691436 () Bool)

(assert (=> d!124729 (=> (not res!691436) (not e!585615))))

(assert (=> d!124729 (= res!691436 ((_ is Cons!21888) (toList!6896 lt!456919)))))

(assert (=> d!124729 (= (contains!6038 (toList!6896 lt!456919) (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))) lt!457131)))

(declare-fun b!1035779 () Bool)

(declare-fun e!585616 () Bool)

(assert (=> b!1035779 (= e!585615 e!585616)))

(declare-fun res!691437 () Bool)

(assert (=> b!1035779 (=> res!691437 e!585616)))

(assert (=> b!1035779 (= res!691437 (= (h!23099 (toList!6896 lt!456919)) (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))

(declare-fun b!1035780 () Bool)

(assert (=> b!1035780 (= e!585616 (contains!6038 (t!31080 (toList!6896 lt!456919)) (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))

(assert (= (and d!124729 res!691436) b!1035779))

(assert (= (and b!1035779 (not res!691437)) b!1035780))

(declare-fun m!956363 () Bool)

(assert (=> d!124729 m!956363))

(declare-fun m!956365 () Bool)

(assert (=> d!124729 m!956365))

(declare-fun m!956367 () Bool)

(assert (=> b!1035780 m!956367))

(assert (=> b!1035268 d!124729))

(assert (=> d!124293 d!124305))

(assert (=> d!124293 d!124303))

(declare-fun d!124731 () Bool)

(assert (=> d!124731 (contains!6037 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)) lt!456703)))

(assert (=> d!124731 true))

(declare-fun _$35!438 () Unit!33837)

(assert (=> d!124731 (= (choose!1702 lt!456700 lt!456717 lt!456631 lt!456703) _$35!438)))

(declare-fun bs!30280 () Bool)

(assert (= bs!30280 d!124731))

(assert (=> bs!30280 m!955063))

(assert (=> bs!30280 m!955063))

(assert (=> bs!30280 m!955071))

(assert (=> d!124293 d!124731))

(declare-fun d!124733 () Bool)

(declare-fun e!585618 () Bool)

(assert (=> d!124733 e!585618))

(declare-fun res!691438 () Bool)

(assert (=> d!124733 (=> res!691438 e!585618)))

(declare-fun lt!457133 () Bool)

(assert (=> d!124733 (= res!691438 (not lt!457133))))

(declare-fun lt!457132 () Bool)

(assert (=> d!124733 (= lt!457133 lt!457132)))

(declare-fun lt!457135 () Unit!33837)

(declare-fun e!585617 () Unit!33837)

(assert (=> d!124733 (= lt!457135 e!585617)))

(declare-fun c!105029 () Bool)

(assert (=> d!124733 (= c!105029 lt!457132)))

(assert (=> d!124733 (= lt!457132 (containsKey!565 (toList!6896 lt!456700) lt!456703))))

(assert (=> d!124733 (= (contains!6037 lt!456700 lt!456703) lt!457133)))

(declare-fun b!1035782 () Bool)

(declare-fun lt!457134 () Unit!33837)

(assert (=> b!1035782 (= e!585617 lt!457134)))

(assert (=> b!1035782 (= lt!457134 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456700) lt!456703))))

(assert (=> b!1035782 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456700) lt!456703))))

(declare-fun b!1035783 () Bool)

(declare-fun Unit!33871 () Unit!33837)

(assert (=> b!1035783 (= e!585617 Unit!33871)))

(declare-fun b!1035784 () Bool)

(assert (=> b!1035784 (= e!585618 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456700) lt!456703)))))

(assert (= (and d!124733 c!105029) b!1035782))

(assert (= (and d!124733 (not c!105029)) b!1035783))

(assert (= (and d!124733 (not res!691438)) b!1035784))

(declare-fun m!956369 () Bool)

(assert (=> d!124733 m!956369))

(declare-fun m!956371 () Bool)

(assert (=> b!1035782 m!956371))

(declare-fun m!956373 () Bool)

(assert (=> b!1035782 m!956373))

(assert (=> b!1035782 m!956373))

(declare-fun m!956375 () Bool)

(assert (=> b!1035782 m!956375))

(assert (=> b!1035784 m!956373))

(assert (=> b!1035784 m!956373))

(assert (=> b!1035784 m!956375))

(assert (=> d!124293 d!124733))

(declare-fun d!124735 () Bool)

(assert (=> d!124735 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456652) key!909))))

(declare-fun lt!457136 () Unit!33837)

(assert (=> d!124735 (= lt!457136 (choose!1704 (toList!6896 lt!456652) key!909))))

(declare-fun e!585619 () Bool)

(assert (=> d!124735 e!585619))

(declare-fun res!691439 () Bool)

(assert (=> d!124735 (=> (not res!691439) (not e!585619))))

(assert (=> d!124735 (= res!691439 (isStrictlySorted!706 (toList!6896 lt!456652)))))

(assert (=> d!124735 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456652) key!909) lt!457136)))

(declare-fun b!1035785 () Bool)

(assert (=> b!1035785 (= e!585619 (containsKey!565 (toList!6896 lt!456652) key!909))))

(assert (= (and d!124735 res!691439) b!1035785))

(assert (=> d!124735 m!955341))

(assert (=> d!124735 m!955341))

(assert (=> d!124735 m!955343))

(declare-fun m!956377 () Bool)

(assert (=> d!124735 m!956377))

(declare-fun m!956379 () Bool)

(assert (=> d!124735 m!956379))

(assert (=> b!1035785 m!955337))

(assert (=> b!1035167 d!124735))

(assert (=> b!1035167 d!124473))

(assert (=> b!1035167 d!124475))

(declare-fun d!124737 () Bool)

(declare-fun e!585621 () Bool)

(assert (=> d!124737 e!585621))

(declare-fun res!691440 () Bool)

(assert (=> d!124737 (=> res!691440 e!585621)))

(declare-fun lt!457138 () Bool)

(assert (=> d!124737 (= res!691440 (not lt!457138))))

(declare-fun lt!457137 () Bool)

(assert (=> d!124737 (= lt!457138 lt!457137)))

(declare-fun lt!457140 () Unit!33837)

(declare-fun e!585620 () Unit!33837)

(assert (=> d!124737 (= lt!457140 e!585620)))

(declare-fun c!105030 () Bool)

(assert (=> d!124737 (= c!105030 lt!457137)))

(assert (=> d!124737 (= lt!457137 (containsKey!565 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(assert (=> d!124737 (= (contains!6037 lt!456905 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!457138)))

(declare-fun b!1035786 () Bool)

(declare-fun lt!457139 () Unit!33837)

(assert (=> b!1035786 (= e!585620 lt!457139)))

(assert (=> b!1035786 (= lt!457139 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035786 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035787 () Bool)

(declare-fun Unit!33872 () Unit!33837)

(assert (=> b!1035787 (= e!585620 Unit!33872)))

(declare-fun b!1035788 () Bool)

(assert (=> b!1035788 (= e!585621 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456905) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124737 c!105030) b!1035786))

(assert (= (and d!124737 (not c!105030)) b!1035787))

(assert (= (and d!124737 (not res!691440)) b!1035788))

(declare-fun m!956381 () Bool)

(assert (=> d!124737 m!956381))

(declare-fun m!956383 () Bool)

(assert (=> b!1035786 m!956383))

(assert (=> b!1035786 m!955523))

(assert (=> b!1035786 m!955523))

(declare-fun m!956385 () Bool)

(assert (=> b!1035786 m!956385))

(assert (=> b!1035788 m!955523))

(assert (=> b!1035788 m!955523))

(assert (=> b!1035788 m!956385))

(assert (=> d!124385 d!124737))

(declare-fun b!1035789 () Bool)

(declare-fun e!585622 () Option!635)

(assert (=> b!1035789 (= e!585622 (Some!634 (_2!7874 (h!23099 lt!456907))))))

(declare-fun b!1035790 () Bool)

(declare-fun e!585623 () Option!635)

(assert (=> b!1035790 (= e!585622 e!585623)))

(declare-fun c!105032 () Bool)

(assert (=> b!1035790 (= c!105032 (and ((_ is Cons!21888) lt!456907) (not (= (_1!7874 (h!23099 lt!456907)) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035792 () Bool)

(assert (=> b!1035792 (= e!585623 None!633)))

(declare-fun b!1035791 () Bool)

(assert (=> b!1035791 (= e!585623 (getValueByKey!584 (t!31080 lt!456907) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun c!105031 () Bool)

(declare-fun d!124739 () Bool)

(assert (=> d!124739 (= c!105031 (and ((_ is Cons!21888) lt!456907) (= (_1!7874 (h!23099 lt!456907)) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(assert (=> d!124739 (= (getValueByKey!584 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) e!585622)))

(assert (= (and d!124739 c!105031) b!1035789))

(assert (= (and d!124739 (not c!105031)) b!1035790))

(assert (= (and b!1035790 c!105032) b!1035791))

(assert (= (and b!1035790 (not c!105032)) b!1035792))

(declare-fun m!956387 () Bool)

(assert (=> b!1035791 m!956387))

(assert (=> d!124385 d!124739))

(declare-fun d!124741 () Bool)

(assert (=> d!124741 (= (getValueByKey!584 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun lt!457141 () Unit!33837)

(assert (=> d!124741 (= lt!457141 (choose!1703 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun e!585624 () Bool)

(assert (=> d!124741 e!585624))

(declare-fun res!691441 () Bool)

(assert (=> d!124741 (=> (not res!691441) (not e!585624))))

(assert (=> d!124741 (= res!691441 (isStrictlySorted!706 lt!456907))))

(assert (=> d!124741 (= (lemmaContainsTupThenGetReturnValue!280 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!457141)))

(declare-fun b!1035793 () Bool)

(declare-fun res!691442 () Bool)

(assert (=> b!1035793 (=> (not res!691442) (not e!585624))))

(assert (=> b!1035793 (= res!691442 (containsKey!565 lt!456907 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035794 () Bool)

(assert (=> b!1035794 (= e!585624 (contains!6038 lt!456907 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124741 res!691441) b!1035793))

(assert (= (and b!1035793 res!691442) b!1035794))

(assert (=> d!124741 m!955517))

(declare-fun m!956389 () Bool)

(assert (=> d!124741 m!956389))

(declare-fun m!956391 () Bool)

(assert (=> d!124741 m!956391))

(declare-fun m!956393 () Bool)

(assert (=> b!1035793 m!956393))

(declare-fun m!956395 () Bool)

(assert (=> b!1035794 m!956395))

(assert (=> d!124385 d!124741))

(declare-fun lt!457142 () List!21892)

(declare-fun b!1035795 () Bool)

(declare-fun e!585625 () Bool)

(assert (=> b!1035795 (= e!585625 (contains!6038 lt!457142 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(declare-fun e!585629 () List!21892)

(declare-fun bm!43799 () Bool)

(declare-fun c!105034 () Bool)

(declare-fun call!43804 () List!21892)

(assert (=> bm!43799 (= call!43804 ($colon$colon!603 e!585629 (ite c!105034 (h!23099 (toList!6896 lt!456725)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))))

(declare-fun c!105036 () Bool)

(assert (=> bm!43799 (= c!105036 c!105034)))

(declare-fun bm!43800 () Bool)

(declare-fun call!43802 () List!21892)

(declare-fun call!43803 () List!21892)

(assert (=> bm!43800 (= call!43802 call!43803)))

(declare-fun b!1035796 () Bool)

(declare-fun c!105035 () Bool)

(declare-fun c!105033 () Bool)

(assert (=> b!1035796 (= e!585629 (ite c!105035 (t!31080 (toList!6896 lt!456725)) (ite c!105033 (Cons!21888 (h!23099 (toList!6896 lt!456725)) (t!31080 (toList!6896 lt!456725))) Nil!21889)))))

(declare-fun b!1035797 () Bool)

(declare-fun res!691444 () Bool)

(assert (=> b!1035797 (=> (not res!691444) (not e!585625))))

(assert (=> b!1035797 (= res!691444 (containsKey!565 lt!457142 (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035798 () Bool)

(declare-fun e!585627 () List!21892)

(declare-fun e!585626 () List!21892)

(assert (=> b!1035798 (= e!585627 e!585626)))

(assert (=> b!1035798 (= c!105035 (and ((_ is Cons!21888) (toList!6896 lt!456725)) (= (_1!7874 (h!23099 (toList!6896 lt!456725))) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035799 () Bool)

(assert (=> b!1035799 (= c!105033 (and ((_ is Cons!21888) (toList!6896 lt!456725)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456725))) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(declare-fun e!585628 () List!21892)

(assert (=> b!1035799 (= e!585626 e!585628)))

(declare-fun b!1035800 () Bool)

(assert (=> b!1035800 (= e!585629 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456725)) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035801 () Bool)

(assert (=> b!1035801 (= e!585628 call!43802)))

(declare-fun b!1035802 () Bool)

(assert (=> b!1035802 (= e!585628 call!43802)))

(declare-fun bm!43801 () Bool)

(assert (=> bm!43801 (= call!43803 call!43804)))

(declare-fun b!1035803 () Bool)

(assert (=> b!1035803 (= e!585627 call!43804)))

(declare-fun b!1035804 () Bool)

(assert (=> b!1035804 (= e!585626 call!43803)))

(declare-fun d!124743 () Bool)

(assert (=> d!124743 e!585625))

(declare-fun res!691443 () Bool)

(assert (=> d!124743 (=> (not res!691443) (not e!585625))))

(assert (=> d!124743 (= res!691443 (isStrictlySorted!706 lt!457142))))

(assert (=> d!124743 (= lt!457142 e!585627)))

(assert (=> d!124743 (= c!105034 (and ((_ is Cons!21888) (toList!6896 lt!456725)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456725))) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))

(assert (=> d!124743 (isStrictlySorted!706 (toList!6896 lt!456725))))

(assert (=> d!124743 (= (insertStrictlySorted!373 (toList!6896 lt!456725) (_1!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!457142)))

(assert (= (and d!124743 c!105034) b!1035803))

(assert (= (and d!124743 (not c!105034)) b!1035798))

(assert (= (and b!1035798 c!105035) b!1035804))

(assert (= (and b!1035798 (not c!105035)) b!1035799))

(assert (= (and b!1035799 c!105033) b!1035801))

(assert (= (and b!1035799 (not c!105033)) b!1035802))

(assert (= (or b!1035801 b!1035802) bm!43800))

(assert (= (or b!1035804 bm!43800) bm!43801))

(assert (= (or b!1035803 bm!43801) bm!43799))

(assert (= (and bm!43799 c!105036) b!1035800))

(assert (= (and bm!43799 (not c!105036)) b!1035796))

(assert (= (and d!124743 res!691443) b!1035797))

(assert (= (and b!1035797 res!691444) b!1035795))

(declare-fun m!956397 () Bool)

(assert (=> b!1035800 m!956397))

(declare-fun m!956399 () Bool)

(assert (=> b!1035795 m!956399))

(declare-fun m!956401 () Bool)

(assert (=> bm!43799 m!956401))

(declare-fun m!956403 () Bool)

(assert (=> d!124743 m!956403))

(declare-fun m!956405 () Bool)

(assert (=> d!124743 m!956405))

(declare-fun m!956407 () Bool)

(assert (=> b!1035797 m!956407))

(assert (=> d!124385 d!124743))

(declare-fun lt!457143 () Bool)

(declare-fun d!124745 () Bool)

(assert (=> d!124745 (= lt!457143 (select (content!515 (toList!6896 lt!456851)) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!585630 () Bool)

(assert (=> d!124745 (= lt!457143 e!585630)))

(declare-fun res!691445 () Bool)

(assert (=> d!124745 (=> (not res!691445) (not e!585630))))

(assert (=> d!124745 (= res!691445 ((_ is Cons!21888) (toList!6896 lt!456851)))))

(assert (=> d!124745 (= (contains!6038 (toList!6896 lt!456851) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!457143)))

(declare-fun b!1035805 () Bool)

(declare-fun e!585631 () Bool)

(assert (=> b!1035805 (= e!585630 e!585631)))

(declare-fun res!691446 () Bool)

(assert (=> b!1035805 (=> res!691446 e!585631)))

(assert (=> b!1035805 (= res!691446 (= (h!23099 (toList!6896 lt!456851)) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035806 () Bool)

(assert (=> b!1035806 (= e!585631 (contains!6038 (t!31080 (toList!6896 lt!456851)) (ite (or c!104793 c!104798) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456631) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!124745 res!691445) b!1035805))

(assert (= (and b!1035805 (not res!691446)) b!1035806))

(declare-fun m!956409 () Bool)

(assert (=> d!124745 m!956409))

(declare-fun m!956411 () Bool)

(assert (=> d!124745 m!956411))

(declare-fun m!956413 () Bool)

(assert (=> b!1035806 m!956413))

(assert (=> b!1035176 d!124745))

(declare-fun d!124747 () Bool)

(declare-fun res!691447 () Bool)

(declare-fun e!585632 () Bool)

(assert (=> d!124747 (=> res!691447 e!585632)))

(assert (=> d!124747 (= res!691447 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) lt!456703)))))

(assert (=> d!124747 (= (containsKey!565 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703) e!585632)))

(declare-fun b!1035807 () Bool)

(declare-fun e!585633 () Bool)

(assert (=> b!1035807 (= e!585632 e!585633)))

(declare-fun res!691448 () Bool)

(assert (=> b!1035807 (=> (not res!691448) (not e!585633))))

(assert (=> b!1035807 (= res!691448 (and (or (not ((_ is Cons!21888) (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) (bvsle (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) lt!456703)) ((_ is Cons!21888) (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) (bvslt (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))))) lt!456703)))))

(declare-fun b!1035808 () Bool)

(assert (=> b!1035808 (= e!585633 (containsKey!565 (t!31080 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))) lt!456703))))

(assert (= (and d!124747 (not res!691447)) b!1035807))

(assert (= (and b!1035807 res!691448) b!1035808))

(declare-fun m!956415 () Bool)

(assert (=> b!1035808 m!956415))

(assert (=> d!124305 d!124747))

(declare-fun d!124749 () Bool)

(assert (=> d!124749 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14885 (getValueByKey!584 (toList!6896 lt!456716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124329 d!124749))

(assert (=> d!124329 d!124439))

(declare-fun d!124751 () Bool)

(declare-fun res!691449 () Bool)

(declare-fun e!585634 () Bool)

(assert (=> d!124751 (=> res!691449 e!585634)))

(assert (=> d!124751 (= res!691449 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) lt!456729)))))

(assert (=> d!124751 (= (containsKey!565 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729) e!585634)))

(declare-fun b!1035809 () Bool)

(declare-fun e!585635 () Bool)

(assert (=> b!1035809 (= e!585634 e!585635)))

(declare-fun res!691450 () Bool)

(assert (=> b!1035809 (=> (not res!691450) (not e!585635))))

(assert (=> b!1035809 (= res!691450 (and (or (not ((_ is Cons!21888) (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) (bvsle (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) lt!456729)) ((_ is Cons!21888) (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) (bvslt (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))) lt!456729)))))

(declare-fun b!1035810 () Bool)

(assert (=> b!1035810 (= e!585635 (containsKey!565 (t!31080 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))) lt!456729))))

(assert (= (and d!124751 (not res!691449)) b!1035809))

(assert (= (and b!1035809 res!691450) b!1035810))

(declare-fun m!956417 () Bool)

(assert (=> b!1035810 m!956417))

(assert (=> d!124383 d!124751))

(assert (=> b!1035190 d!124323))

(declare-fun d!124753 () Bool)

(assert (=> d!124753 (= (apply!915 lt!456884 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (getValueByKey!584 (toList!6896 lt!456884) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30281 () Bool)

(assert (= bs!30281 d!124753))

(assert (=> bs!30281 m!955035))

(declare-fun m!956419 () Bool)

(assert (=> bs!30281 m!956419))

(assert (=> bs!30281 m!956419))

(declare-fun m!956421 () Bool)

(assert (=> bs!30281 m!956421))

(assert (=> b!1035222 d!124753))

(assert (=> b!1035222 d!124335))

(declare-fun d!124755 () Bool)

(declare-fun e!585637 () Bool)

(assert (=> d!124755 e!585637))

(declare-fun res!691451 () Bool)

(assert (=> d!124755 (=> res!691451 e!585637)))

(declare-fun lt!457145 () Bool)

(assert (=> d!124755 (= res!691451 (not lt!457145))))

(declare-fun lt!457144 () Bool)

(assert (=> d!124755 (= lt!457145 lt!457144)))

(declare-fun lt!457147 () Unit!33837)

(declare-fun e!585636 () Unit!33837)

(assert (=> d!124755 (= lt!457147 e!585636)))

(declare-fun c!105037 () Bool)

(assert (=> d!124755 (= c!105037 lt!457144)))

(assert (=> d!124755 (= lt!457144 (containsKey!565 (toList!6896 lt!456884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124755 (= (contains!6037 lt!456884 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457145)))

(declare-fun b!1035811 () Bool)

(declare-fun lt!457146 () Unit!33837)

(assert (=> b!1035811 (= e!585636 lt!457146)))

(assert (=> b!1035811 (= lt!457146 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035811 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035812 () Bool)

(declare-fun Unit!33873 () Unit!33837)

(assert (=> b!1035812 (= e!585636 Unit!33873)))

(declare-fun b!1035813 () Bool)

(assert (=> b!1035813 (= e!585637 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124755 c!105037) b!1035811))

(assert (= (and d!124755 (not c!105037)) b!1035812))

(assert (= (and d!124755 (not res!691451)) b!1035813))

(declare-fun m!956423 () Bool)

(assert (=> d!124755 m!956423))

(declare-fun m!956425 () Bool)

(assert (=> b!1035811 m!956425))

(declare-fun m!956427 () Bool)

(assert (=> b!1035811 m!956427))

(assert (=> b!1035811 m!956427))

(declare-fun m!956429 () Bool)

(assert (=> b!1035811 m!956429))

(assert (=> b!1035813 m!956427))

(assert (=> b!1035813 m!956427))

(assert (=> b!1035813 m!956429))

(assert (=> d!124361 d!124755))

(assert (=> d!124361 d!124351))

(declare-fun d!124757 () Bool)

(declare-fun lt!457148 () Bool)

(assert (=> d!124757 (= lt!457148 (select (content!515 (toList!6896 lt!456896)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun e!585638 () Bool)

(assert (=> d!124757 (= lt!457148 e!585638)))

(declare-fun res!691452 () Bool)

(assert (=> d!124757 (=> (not res!691452) (not e!585638))))

(assert (=> d!124757 (= res!691452 ((_ is Cons!21888) (toList!6896 lt!456896)))))

(assert (=> d!124757 (= (contains!6038 (toList!6896 lt!456896) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))) lt!457148)))

(declare-fun b!1035814 () Bool)

(declare-fun e!585639 () Bool)

(assert (=> b!1035814 (= e!585638 e!585639)))

(declare-fun res!691453 () Bool)

(assert (=> b!1035814 (=> res!691453 e!585639)))

(assert (=> b!1035814 (= res!691453 (= (h!23099 (toList!6896 lt!456896)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(declare-fun b!1035815 () Bool)

(assert (=> b!1035815 (= e!585639 (contains!6038 (t!31080 (toList!6896 lt!456896)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427))))))

(assert (= (and d!124757 res!691452) b!1035814))

(assert (= (and b!1035814 (not res!691453)) b!1035815))

(declare-fun m!956431 () Bool)

(assert (=> d!124757 m!956431))

(declare-fun m!956433 () Bool)

(assert (=> d!124757 m!956433))

(declare-fun m!956435 () Bool)

(assert (=> b!1035815 m!956435))

(assert (=> b!1035255 d!124757))

(assert (=> d!124381 d!124383))

(assert (=> d!124381 d!124387))

(declare-fun d!124759 () Bool)

(assert (=> d!124759 (contains!6037 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))) lt!456729)))

(assert (=> d!124759 true))

(declare-fun _$35!439 () Unit!33837)

(assert (=> d!124759 (= (choose!1702 lt!456726 lt!456743 (zeroValue!6062 thiss!1427) lt!456729) _$35!439)))

(declare-fun bs!30282 () Bool)

(assert (= bs!30282 d!124759))

(assert (=> bs!30282 m!955117))

(assert (=> bs!30282 m!955117))

(assert (=> bs!30282 m!955125))

(assert (=> d!124381 d!124759))

(declare-fun d!124761 () Bool)

(declare-fun e!585641 () Bool)

(assert (=> d!124761 e!585641))

(declare-fun res!691454 () Bool)

(assert (=> d!124761 (=> res!691454 e!585641)))

(declare-fun lt!457150 () Bool)

(assert (=> d!124761 (= res!691454 (not lt!457150))))

(declare-fun lt!457149 () Bool)

(assert (=> d!124761 (= lt!457150 lt!457149)))

(declare-fun lt!457152 () Unit!33837)

(declare-fun e!585640 () Unit!33837)

(assert (=> d!124761 (= lt!457152 e!585640)))

(declare-fun c!105038 () Bool)

(assert (=> d!124761 (= c!105038 lt!457149)))

(assert (=> d!124761 (= lt!457149 (containsKey!565 (toList!6896 lt!456726) lt!456729))))

(assert (=> d!124761 (= (contains!6037 lt!456726 lt!456729) lt!457150)))

(declare-fun b!1035816 () Bool)

(declare-fun lt!457151 () Unit!33837)

(assert (=> b!1035816 (= e!585640 lt!457151)))

(assert (=> b!1035816 (= lt!457151 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456726) lt!456729))))

(assert (=> b!1035816 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456726) lt!456729))))

(declare-fun b!1035817 () Bool)

(declare-fun Unit!33874 () Unit!33837)

(assert (=> b!1035817 (= e!585640 Unit!33874)))

(declare-fun b!1035818 () Bool)

(assert (=> b!1035818 (= e!585641 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456726) lt!456729)))))

(assert (= (and d!124761 c!105038) b!1035816))

(assert (= (and d!124761 (not c!105038)) b!1035817))

(assert (= (and d!124761 (not res!691454)) b!1035818))

(declare-fun m!956437 () Bool)

(assert (=> d!124761 m!956437))

(declare-fun m!956439 () Bool)

(assert (=> b!1035816 m!956439))

(declare-fun m!956441 () Bool)

(assert (=> b!1035816 m!956441))

(assert (=> b!1035816 m!956441))

(declare-fun m!956443 () Bool)

(assert (=> b!1035816 m!956443))

(assert (=> b!1035818 m!956441))

(assert (=> b!1035818 m!956441))

(assert (=> b!1035818 m!956443))

(assert (=> d!124381 d!124761))

(assert (=> b!1035137 d!124605))

(declare-fun b!1035819 () Bool)

(declare-fun e!585642 () Option!635)

(assert (=> b!1035819 (= e!585642 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456801)))))))

(declare-fun b!1035820 () Bool)

(declare-fun e!585643 () Option!635)

(assert (=> b!1035820 (= e!585642 e!585643)))

(declare-fun c!105040 () Bool)

(assert (=> b!1035820 (= c!105040 (and ((_ is Cons!21888) (toList!6896 lt!456801)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456801))) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))))

(declare-fun b!1035822 () Bool)

(assert (=> b!1035822 (= e!585643 None!633)))

(declare-fun b!1035821 () Bool)

(assert (=> b!1035821 (= e!585643 (getValueByKey!584 (t!31080 (toList!6896 lt!456801)) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun c!105039 () Bool)

(declare-fun d!124763 () Bool)

(assert (=> d!124763 (= c!105039 (and ((_ is Cons!21888) (toList!6896 lt!456801)) (= (_1!7874 (h!23099 (toList!6896 lt!456801))) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(assert (=> d!124763 (= (getValueByKey!584 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631))) e!585642)))

(assert (= (and d!124763 c!105039) b!1035819))

(assert (= (and d!124763 (not c!105039)) b!1035820))

(assert (= (and b!1035820 c!105040) b!1035821))

(assert (= (and b!1035820 (not c!105040)) b!1035822))

(declare-fun m!956445 () Bool)

(assert (=> b!1035821 m!956445))

(assert (=> b!1035102 d!124763))

(declare-fun d!124765 () Bool)

(declare-fun lt!457153 () Bool)

(assert (=> d!124765 (= lt!457153 (select (content!516 Nil!21890) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585645 () Bool)

(assert (=> d!124765 (= lt!457153 e!585645)))

(declare-fun res!691456 () Bool)

(assert (=> d!124765 (=> (not res!691456) (not e!585645))))

(assert (=> d!124765 (= res!691456 ((_ is Cons!21889) Nil!21890))))

(assert (=> d!124765 (= (contains!6039 Nil!21890 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!457153)))

(declare-fun b!1035823 () Bool)

(declare-fun e!585644 () Bool)

(assert (=> b!1035823 (= e!585645 e!585644)))

(declare-fun res!691455 () Bool)

(assert (=> b!1035823 (=> res!691455 e!585644)))

(assert (=> b!1035823 (= res!691455 (= (h!23100 Nil!21890) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035824 () Bool)

(assert (=> b!1035824 (= e!585644 (contains!6039 (t!31085 Nil!21890) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124765 res!691456) b!1035823))

(assert (= (and b!1035823 (not res!691455)) b!1035824))

(assert (=> d!124765 m!956071))

(assert (=> d!124765 m!955035))

(declare-fun m!956447 () Bool)

(assert (=> d!124765 m!956447))

(assert (=> b!1035824 m!955035))

(declare-fun m!956449 () Bool)

(assert (=> b!1035824 m!956449))

(assert (=> b!1035187 d!124765))

(declare-fun d!124767 () Bool)

(declare-fun isEmpty!932 (List!21892) Bool)

(assert (=> d!124767 (= (isEmpty!930 lt!456884) (isEmpty!932 (toList!6896 lt!456884)))))

(declare-fun bs!30283 () Bool)

(assert (= bs!30283 d!124767))

(declare-fun m!956451 () Bool)

(assert (=> bs!30283 m!956451))

(assert (=> b!1035218 d!124767))

(declare-fun d!124769 () Bool)

(assert (=> d!124769 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14885 (getValueByKey!584 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124413 d!124769))

(assert (=> d!124413 d!124467))

(declare-fun lt!457154 () Bool)

(declare-fun d!124771 () Bool)

(assert (=> d!124771 (= lt!457154 (select (content!515 (toList!6896 lt!456811)) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun e!585646 () Bool)

(assert (=> d!124771 (= lt!457154 e!585646)))

(declare-fun res!691457 () Bool)

(assert (=> d!124771 (=> (not res!691457) (not e!585646))))

(assert (=> d!124771 (= res!691457 ((_ is Cons!21888) (toList!6896 lt!456811)))))

(assert (=> d!124771 (= (contains!6038 (toList!6896 lt!456811) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))) lt!457154)))

(declare-fun b!1035825 () Bool)

(declare-fun e!585647 () Bool)

(assert (=> b!1035825 (= e!585646 e!585647)))

(declare-fun res!691458 () Bool)

(assert (=> b!1035825 (=> res!691458 e!585647)))

(assert (=> b!1035825 (= res!691458 (= (h!23099 (toList!6896 lt!456811)) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035826 () Bool)

(assert (=> b!1035826 (= e!585647 (contains!6038 (t!31080 (toList!6896 lt!456811)) (ite (or c!104799 c!104804) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 thiss!1427)))))))

(assert (= (and d!124771 res!691457) b!1035825))

(assert (= (and b!1035825 (not res!691458)) b!1035826))

(declare-fun m!956453 () Bool)

(assert (=> d!124771 m!956453))

(declare-fun m!956455 () Bool)

(assert (=> d!124771 m!956455))

(declare-fun m!956457 () Bool)

(assert (=> b!1035826 m!956457))

(assert (=> b!1035109 d!124771))

(declare-fun d!124773 () Bool)

(declare-fun res!691459 () Bool)

(declare-fun e!585648 () Bool)

(assert (=> d!124773 (=> res!691459 e!585648)))

(assert (=> d!124773 (= res!691459 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124773 (= (containsKey!565 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) e!585648)))

(declare-fun b!1035827 () Bool)

(declare-fun e!585649 () Bool)

(assert (=> b!1035827 (= e!585648 e!585649)))

(declare-fun res!691460 () Bool)

(assert (=> b!1035827 (=> (not res!691460) (not e!585649))))

(assert (=> b!1035827 (= res!691460 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456716))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456716))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21888) (toList!6896 lt!456716)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456716))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1035828 () Bool)

(assert (=> b!1035828 (= e!585649 (containsKey!565 (t!31080 (toList!6896 lt!456716)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124773 (not res!691459)) b!1035827))

(assert (= (and b!1035827 res!691460) b!1035828))

(assert (=> b!1035828 m!955035))

(declare-fun m!956459 () Bool)

(assert (=> b!1035828 m!956459))

(assert (=> d!124369 d!124773))

(declare-fun d!124775 () Bool)

(assert (=> d!124775 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!456724)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!456724)))))

(assert (=> d!124397 d!124775))

(declare-fun e!585650 () Option!635)

(declare-fun b!1035829 () Bool)

(assert (=> b!1035829 (= e!585650 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))))))))

(declare-fun b!1035830 () Bool)

(declare-fun e!585651 () Option!635)

(assert (=> b!1035830 (= e!585650 e!585651)))

(declare-fun c!105042 () Bool)

(assert (=> b!1035830 (= c!105042 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))) lt!456724))))))

(declare-fun b!1035832 () Bool)

(assert (=> b!1035832 (= e!585651 None!633)))

(declare-fun b!1035831 () Bool)

(assert (=> b!1035831 (= e!585651 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))) lt!456724))))

(declare-fun c!105041 () Bool)

(declare-fun d!124777 () Bool)

(assert (=> d!124777 (= c!105041 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))))) lt!456724)))))

(assert (=> d!124777 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456730 (tuple2!15727 lt!456727 (zeroValue!6062 thiss!1427)))) lt!456724) e!585650)))

(assert (= (and d!124777 c!105041) b!1035829))

(assert (= (and d!124777 (not c!105041)) b!1035830))

(assert (= (and b!1035830 c!105042) b!1035831))

(assert (= (and b!1035830 (not c!105042)) b!1035832))

(declare-fun m!956461 () Bool)

(assert (=> b!1035831 m!956461))

(assert (=> d!124397 d!124777))

(declare-fun d!124779 () Bool)

(assert (=> d!124779 (= (get!16464 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14882 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035144 d!124779))

(declare-fun d!124781 () Bool)

(assert (=> d!124781 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14885 (getValueByKey!584 (toList!6896 lt!456742) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124373 d!124781))

(assert (=> d!124373 d!124725))

(declare-fun d!124783 () Bool)

(assert (=> d!124783 (= (apply!915 lt!456876 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16463 (getValueByKey!584 (toList!6896 lt!456876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30284 () Bool)

(assert (= bs!30284 d!124783))

(declare-fun m!956463 () Bool)

(assert (=> bs!30284 m!956463))

(assert (=> bs!30284 m!956463))

(declare-fun m!956465 () Bool)

(assert (=> bs!30284 m!956465))

(assert (=> b!1035199 d!124783))

(declare-fun d!124785 () Bool)

(assert (=> d!124785 (= (size!31898 lt!456630) (bvadd (_size!2907 lt!456630) (bvsdiv (bvadd (extraKeys!5958 lt!456630) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1035238 d!124785))

(declare-fun d!124787 () Bool)

(declare-fun e!585653 () Bool)

(assert (=> d!124787 e!585653))

(declare-fun res!691461 () Bool)

(assert (=> d!124787 (=> res!691461 e!585653)))

(declare-fun lt!457156 () Bool)

(assert (=> d!124787 (= res!691461 (not lt!457156))))

(declare-fun lt!457155 () Bool)

(assert (=> d!124787 (= lt!457156 lt!457155)))

(declare-fun lt!457158 () Unit!33837)

(declare-fun e!585652 () Unit!33837)

(assert (=> d!124787 (= lt!457158 e!585652)))

(declare-fun c!105043 () Bool)

(assert (=> d!124787 (= c!105043 lt!457155)))

(assert (=> d!124787 (= lt!457155 (containsKey!565 (toList!6896 lt!456876) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124787 (= (contains!6037 lt!456876 #b0000000000000000000000000000000000000000000000000000000000000000) lt!457156)))

(declare-fun b!1035833 () Bool)

(declare-fun lt!457157 () Unit!33837)

(assert (=> b!1035833 (= e!585652 lt!457157)))

(assert (=> b!1035833 (= lt!457157 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456876) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035833 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1035834 () Bool)

(declare-fun Unit!33875 () Unit!33837)

(assert (=> b!1035834 (= e!585652 Unit!33875)))

(declare-fun b!1035835 () Bool)

(assert (=> b!1035835 (= e!585653 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124787 c!105043) b!1035833))

(assert (= (and d!124787 (not c!105043)) b!1035834))

(assert (= (and d!124787 (not res!691461)) b!1035835))

(declare-fun m!956467 () Bool)

(assert (=> d!124787 m!956467))

(declare-fun m!956469 () Bool)

(assert (=> b!1035833 m!956469))

(assert (=> b!1035833 m!956463))

(assert (=> b!1035833 m!956463))

(declare-fun m!956471 () Bool)

(assert (=> b!1035833 m!956471))

(assert (=> b!1035835 m!956463))

(assert (=> b!1035835 m!956463))

(assert (=> b!1035835 m!956471))

(assert (=> bm!43751 d!124787))

(declare-fun d!124789 () Bool)

(assert (=> d!124789 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(declare-fun lt!457159 () Unit!33837)

(assert (=> d!124789 (= lt!457159 (choose!1704 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(declare-fun e!585654 () Bool)

(assert (=> d!124789 e!585654))

(declare-fun res!691462 () Bool)

(assert (=> d!124789 (=> (not res!691462) (not e!585654))))

(assert (=> d!124789 (= res!691462 (isStrictlySorted!706 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124789 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729) lt!457159)))

(declare-fun b!1035836 () Bool)

(assert (=> b!1035836 (= e!585654 (containsKey!565 (toList!6896 (+!3126 lt!456726 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) lt!456729))))

(assert (= (and d!124789 res!691462) b!1035836))

(assert (=> d!124789 m!955511))

(assert (=> d!124789 m!955511))

(assert (=> d!124789 m!955513))

(declare-fun m!956473 () Bool)

(assert (=> d!124789 m!956473))

(declare-fun m!956475 () Bool)

(assert (=> d!124789 m!956475))

(assert (=> b!1035836 m!955507))

(assert (=> b!1035256 d!124789))

(assert (=> b!1035256 d!124561))

(assert (=> b!1035256 d!124563))

(declare-fun d!124791 () Bool)

(declare-fun e!585656 () Bool)

(assert (=> d!124791 e!585656))

(declare-fun res!691463 () Bool)

(assert (=> d!124791 (=> res!691463 e!585656)))

(declare-fun lt!457161 () Bool)

(assert (=> d!124791 (= res!691463 (not lt!457161))))

(declare-fun lt!457160 () Bool)

(assert (=> d!124791 (= lt!457161 lt!457160)))

(declare-fun lt!457163 () Unit!33837)

(declare-fun e!585655 () Unit!33837)

(assert (=> d!124791 (= lt!457163 e!585655)))

(declare-fun c!105044 () Bool)

(assert (=> d!124791 (= c!105044 lt!457160)))

(assert (=> d!124791 (= lt!457160 (containsKey!565 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(assert (=> d!124791 (= (contains!6037 lt!456781 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!457161)))

(declare-fun b!1035837 () Bool)

(declare-fun lt!457162 () Unit!33837)

(assert (=> b!1035837 (= e!585655 lt!457162)))

(assert (=> b!1035837 (= lt!457162 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035837 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035838 () Bool)

(declare-fun Unit!33876 () Unit!33837)

(assert (=> b!1035838 (= e!585655 Unit!33876)))

(declare-fun b!1035839 () Bool)

(assert (=> b!1035839 (= e!585656 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124791 c!105044) b!1035837))

(assert (= (and d!124791 (not c!105044)) b!1035838))

(assert (= (and d!124791 (not res!691463)) b!1035839))

(declare-fun m!956477 () Bool)

(assert (=> d!124791 m!956477))

(declare-fun m!956479 () Bool)

(assert (=> b!1035837 m!956479))

(assert (=> b!1035837 m!955189))

(assert (=> b!1035837 m!955189))

(declare-fun m!956481 () Bool)

(assert (=> b!1035837 m!956481))

(assert (=> b!1035839 m!955189))

(assert (=> b!1035839 m!955189))

(assert (=> b!1035839 m!956481))

(assert (=> d!124299 d!124791))

(declare-fun b!1035840 () Bool)

(declare-fun e!585657 () Option!635)

(assert (=> b!1035840 (= e!585657 (Some!634 (_2!7874 (h!23099 lt!456783))))))

(declare-fun b!1035841 () Bool)

(declare-fun e!585658 () Option!635)

(assert (=> b!1035841 (= e!585657 e!585658)))

(declare-fun c!105046 () Bool)

(assert (=> b!1035841 (= c!105046 (and ((_ is Cons!21888) lt!456783) (not (= (_1!7874 (h!23099 lt!456783)) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035843 () Bool)

(assert (=> b!1035843 (= e!585658 None!633)))

(declare-fun b!1035842 () Bool)

(assert (=> b!1035842 (= e!585658 (getValueByKey!584 (t!31080 lt!456783) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun c!105045 () Bool)

(declare-fun d!124793 () Bool)

(assert (=> d!124793 (= c!105045 (and ((_ is Cons!21888) lt!456783) (= (_1!7874 (h!23099 lt!456783)) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(assert (=> d!124793 (= (getValueByKey!584 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) e!585657)))

(assert (= (and d!124793 c!105045) b!1035840))

(assert (= (and d!124793 (not c!105045)) b!1035841))

(assert (= (and b!1035841 c!105046) b!1035842))

(assert (= (and b!1035841 (not c!105046)) b!1035843))

(declare-fun m!956483 () Bool)

(assert (=> b!1035842 m!956483))

(assert (=> d!124299 d!124793))

(declare-fun d!124795 () Bool)

(assert (=> d!124795 (= (getValueByKey!584 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun lt!457164 () Unit!33837)

(assert (=> d!124795 (= lt!457164 (choose!1703 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun e!585659 () Bool)

(assert (=> d!124795 e!585659))

(declare-fun res!691464 () Bool)

(assert (=> d!124795 (=> (not res!691464) (not e!585659))))

(assert (=> d!124795 (= res!691464 (isStrictlySorted!706 lt!456783))))

(assert (=> d!124795 (= (lemmaContainsTupThenGetReturnValue!280 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!457164)))

(declare-fun b!1035844 () Bool)

(declare-fun res!691465 () Bool)

(assert (=> b!1035844 (=> (not res!691465) (not e!585659))))

(assert (=> b!1035844 (= res!691465 (containsKey!565 lt!456783 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035845 () Bool)

(assert (=> b!1035845 (= e!585659 (contains!6038 lt!456783 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124795 res!691464) b!1035844))

(assert (= (and b!1035844 res!691465) b!1035845))

(assert (=> d!124795 m!955183))

(declare-fun m!956485 () Bool)

(assert (=> d!124795 m!956485))

(declare-fun m!956487 () Bool)

(assert (=> d!124795 m!956487))

(declare-fun m!956489 () Bool)

(assert (=> b!1035844 m!956489))

(declare-fun m!956491 () Bool)

(assert (=> b!1035845 m!956491))

(assert (=> d!124299 d!124795))

(declare-fun b!1035846 () Bool)

(declare-fun e!585660 () Bool)

(declare-fun lt!457165 () List!21892)

(assert (=> b!1035846 (= e!585660 (contains!6038 lt!457165 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(declare-fun call!43807 () List!21892)

(declare-fun e!585664 () List!21892)

(declare-fun c!105048 () Bool)

(declare-fun bm!43802 () Bool)

(assert (=> bm!43802 (= call!43807 ($colon$colon!603 e!585664 (ite c!105048 (h!23099 (toList!6896 lt!456699)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))))

(declare-fun c!105050 () Bool)

(assert (=> bm!43802 (= c!105050 c!105048)))

(declare-fun bm!43803 () Bool)

(declare-fun call!43805 () List!21892)

(declare-fun call!43806 () List!21892)

(assert (=> bm!43803 (= call!43805 call!43806)))

(declare-fun b!1035847 () Bool)

(declare-fun c!105047 () Bool)

(declare-fun c!105049 () Bool)

(assert (=> b!1035847 (= e!585664 (ite c!105049 (t!31080 (toList!6896 lt!456699)) (ite c!105047 (Cons!21888 (h!23099 (toList!6896 lt!456699)) (t!31080 (toList!6896 lt!456699))) Nil!21889)))))

(declare-fun b!1035848 () Bool)

(declare-fun res!691467 () Bool)

(assert (=> b!1035848 (=> (not res!691467) (not e!585660))))

(assert (=> b!1035848 (= res!691467 (containsKey!565 lt!457165 (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035849 () Bool)

(declare-fun e!585662 () List!21892)

(declare-fun e!585661 () List!21892)

(assert (=> b!1035849 (= e!585662 e!585661)))

(assert (=> b!1035849 (= c!105049 (and ((_ is Cons!21888) (toList!6896 lt!456699)) (= (_1!7874 (h!23099 (toList!6896 lt!456699))) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035850 () Bool)

(assert (=> b!1035850 (= c!105047 (and ((_ is Cons!21888) (toList!6896 lt!456699)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456699))) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(declare-fun e!585663 () List!21892)

(assert (=> b!1035850 (= e!585661 e!585663)))

(declare-fun b!1035851 () Bool)

(assert (=> b!1035851 (= e!585664 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456699)) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035852 () Bool)

(assert (=> b!1035852 (= e!585663 call!43805)))

(declare-fun b!1035853 () Bool)

(assert (=> b!1035853 (= e!585663 call!43805)))

(declare-fun bm!43804 () Bool)

(assert (=> bm!43804 (= call!43806 call!43807)))

(declare-fun b!1035854 () Bool)

(assert (=> b!1035854 (= e!585662 call!43807)))

(declare-fun b!1035855 () Bool)

(assert (=> b!1035855 (= e!585661 call!43806)))

(declare-fun d!124797 () Bool)

(assert (=> d!124797 e!585660))

(declare-fun res!691466 () Bool)

(assert (=> d!124797 (=> (not res!691466) (not e!585660))))

(assert (=> d!124797 (= res!691466 (isStrictlySorted!706 lt!457165))))

(assert (=> d!124797 (= lt!457165 e!585662)))

(assert (=> d!124797 (= c!105048 (and ((_ is Cons!21888) (toList!6896 lt!456699)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456699))) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(assert (=> d!124797 (isStrictlySorted!706 (toList!6896 lt!456699))))

(assert (=> d!124797 (= (insertStrictlySorted!373 (toList!6896 lt!456699) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) lt!457165)))

(assert (= (and d!124797 c!105048) b!1035854))

(assert (= (and d!124797 (not c!105048)) b!1035849))

(assert (= (and b!1035849 c!105049) b!1035855))

(assert (= (and b!1035849 (not c!105049)) b!1035850))

(assert (= (and b!1035850 c!105047) b!1035852))

(assert (= (and b!1035850 (not c!105047)) b!1035853))

(assert (= (or b!1035852 b!1035853) bm!43803))

(assert (= (or b!1035855 bm!43803) bm!43804))

(assert (= (or b!1035854 bm!43804) bm!43802))

(assert (= (and bm!43802 c!105050) b!1035851))

(assert (= (and bm!43802 (not c!105050)) b!1035847))

(assert (= (and d!124797 res!691466) b!1035848))

(assert (= (and b!1035848 res!691467) b!1035846))

(declare-fun m!956493 () Bool)

(assert (=> b!1035851 m!956493))

(declare-fun m!956495 () Bool)

(assert (=> b!1035846 m!956495))

(declare-fun m!956497 () Bool)

(assert (=> bm!43802 m!956497))

(declare-fun m!956499 () Bool)

(assert (=> d!124797 m!956499))

(declare-fun m!956501 () Bool)

(assert (=> d!124797 m!956501))

(declare-fun m!956503 () Bool)

(assert (=> b!1035848 m!956503))

(assert (=> d!124299 d!124797))

(declare-fun lt!457166 () Bool)

(declare-fun d!124799 () Bool)

(assert (=> d!124799 (= lt!457166 (select (content!515 (toList!6896 lt!456905)) (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))

(declare-fun e!585665 () Bool)

(assert (=> d!124799 (= lt!457166 e!585665)))

(declare-fun res!691468 () Bool)

(assert (=> d!124799 (=> (not res!691468) (not e!585665))))

(assert (=> d!124799 (= res!691468 ((_ is Cons!21888) (toList!6896 lt!456905)))))

(assert (=> d!124799 (= (contains!6038 (toList!6896 lt!456905) (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))) lt!457166)))

(declare-fun b!1035856 () Bool)

(declare-fun e!585666 () Bool)

(assert (=> b!1035856 (= e!585665 e!585666)))

(declare-fun res!691469 () Bool)

(assert (=> b!1035856 (=> res!691469 e!585666)))

(assert (=> b!1035856 (= res!691469 (= (h!23099 (toList!6896 lt!456905)) (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))

(declare-fun b!1035857 () Bool)

(assert (=> b!1035857 (= e!585666 (contains!6038 (t!31080 (toList!6896 lt!456905)) (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))

(assert (= (and d!124799 res!691468) b!1035856))

(assert (= (and b!1035856 (not res!691469)) b!1035857))

(declare-fun m!956505 () Bool)

(assert (=> d!124799 m!956505))

(declare-fun m!956507 () Bool)

(assert (=> d!124799 m!956507))

(declare-fun m!956509 () Bool)

(assert (=> b!1035857 m!956509))

(assert (=> b!1035260 d!124799))

(declare-fun d!124801 () Bool)

(assert (=> d!124801 (= (apply!915 lt!456767 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (get!16463 (getValueByKey!584 (toList!6896 lt!456767) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30285 () Bool)

(assert (= bs!30285 d!124801))

(assert (=> bs!30285 m!955035))

(declare-fun m!956511 () Bool)

(assert (=> bs!30285 m!956511))

(assert (=> bs!30285 m!956511))

(declare-fun m!956513 () Bool)

(assert (=> bs!30285 m!956513))

(assert (=> b!1035077 d!124801))

(assert (=> b!1035077 d!124335))

(declare-fun d!124803 () Bool)

(assert (=> d!124803 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!457167 () Unit!33837)

(assert (=> d!124803 (= lt!457167 (choose!1704 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585667 () Bool)

(assert (=> d!124803 e!585667))

(declare-fun res!691470 () Bool)

(assert (=> d!124803 (=> (not res!691470) (not e!585667))))

(assert (=> d!124803 (= res!691470 (isStrictlySorted!706 (toList!6896 lt!456716)))))

(assert (=> d!124803 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!457167)))

(declare-fun b!1035858 () Bool)

(assert (=> b!1035858 (= e!585667 (containsKey!565 (toList!6896 lt!456716) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124803 res!691470) b!1035858))

(assert (=> d!124803 m!955035))

(assert (=> d!124803 m!955455))

(assert (=> d!124803 m!955455))

(assert (=> d!124803 m!955477))

(assert (=> d!124803 m!955035))

(declare-fun m!956515 () Bool)

(assert (=> d!124803 m!956515))

(assert (=> d!124803 m!955749))

(assert (=> b!1035858 m!955035))

(assert (=> b!1035858 m!955473))

(assert (=> b!1035243 d!124803))

(assert (=> b!1035243 d!124575))

(assert (=> b!1035243 d!124577))

(assert (=> b!1035249 d!124323))

(declare-fun d!124805 () Bool)

(assert (=> d!124805 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456725) lt!456731)) (v!14885 (getValueByKey!584 (toList!6896 lt!456725) lt!456731)))))

(assert (=> d!124401 d!124805))

(declare-fun b!1035859 () Bool)

(declare-fun e!585668 () Option!635)

(assert (=> b!1035859 (= e!585668 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456725)))))))

(declare-fun b!1035860 () Bool)

(declare-fun e!585669 () Option!635)

(assert (=> b!1035860 (= e!585668 e!585669)))

(declare-fun c!105052 () Bool)

(assert (=> b!1035860 (= c!105052 (and ((_ is Cons!21888) (toList!6896 lt!456725)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456725))) lt!456731))))))

(declare-fun b!1035862 () Bool)

(assert (=> b!1035862 (= e!585669 None!633)))

(declare-fun b!1035861 () Bool)

(assert (=> b!1035861 (= e!585669 (getValueByKey!584 (t!31080 (toList!6896 lt!456725)) lt!456731))))

(declare-fun d!124807 () Bool)

(declare-fun c!105051 () Bool)

(assert (=> d!124807 (= c!105051 (and ((_ is Cons!21888) (toList!6896 lt!456725)) (= (_1!7874 (h!23099 (toList!6896 lt!456725))) lt!456731)))))

(assert (=> d!124807 (= (getValueByKey!584 (toList!6896 lt!456725) lt!456731) e!585668)))

(assert (= (and d!124807 c!105051) b!1035859))

(assert (= (and d!124807 (not c!105051)) b!1035860))

(assert (= (and b!1035860 c!105052) b!1035861))

(assert (= (and b!1035860 (not c!105052)) b!1035862))

(declare-fun m!956517 () Bool)

(assert (=> b!1035861 m!956517))

(assert (=> d!124401 d!124807))

(assert (=> b!1035112 d!124601))

(assert (=> b!1035112 d!124603))

(declare-fun d!124809 () Bool)

(declare-fun e!585670 () Bool)

(assert (=> d!124809 e!585670))

(declare-fun res!691471 () Bool)

(assert (=> d!124809 (=> (not res!691471) (not e!585670))))

(declare-fun lt!457169 () ListLongMap!13761)

(assert (=> d!124809 (= res!691471 (contains!6037 lt!457169 (_1!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))))

(declare-fun lt!457171 () List!21892)

(assert (=> d!124809 (= lt!457169 (ListLongMap!13762 lt!457171))))

(declare-fun lt!457170 () Unit!33837)

(declare-fun lt!457168 () Unit!33837)

(assert (=> d!124809 (= lt!457170 lt!457168)))

(assert (=> d!124809 (= (getValueByKey!584 lt!457171 (_1!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))) (Some!634 (_2!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))))

(assert (=> d!124809 (= lt!457168 (lemmaContainsTupThenGetReturnValue!280 lt!457171 (_1!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))) (_2!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))))

(assert (=> d!124809 (= lt!457171 (insertStrictlySorted!373 (toList!6896 (ite c!104849 call!43759 (ite c!104854 call!43753 call!43758))) (_1!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))) (_2!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))))))

(assert (=> d!124809 (= (+!3126 (ite c!104849 call!43759 (ite c!104854 call!43753 call!43758)) (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))) lt!457169)))

(declare-fun b!1035863 () Bool)

(declare-fun res!691472 () Bool)

(assert (=> b!1035863 (=> (not res!691472) (not e!585670))))

(assert (=> b!1035863 (= res!691472 (= (getValueByKey!584 (toList!6896 lt!457169) (_1!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630))))) (Some!634 (_2!7874 (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))))

(declare-fun b!1035864 () Bool)

(assert (=> b!1035864 (= e!585670 (contains!6038 (toList!6896 lt!457169) (ite (or c!104849 c!104854) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6062 lt!456630)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6062 lt!456630)))))))

(assert (= (and d!124809 res!691471) b!1035863))

(assert (= (and b!1035863 res!691472) b!1035864))

(declare-fun m!956519 () Bool)

(assert (=> d!124809 m!956519))

(declare-fun m!956521 () Bool)

(assert (=> d!124809 m!956521))

(declare-fun m!956523 () Bool)

(assert (=> d!124809 m!956523))

(declare-fun m!956525 () Bool)

(assert (=> d!124809 m!956525))

(declare-fun m!956527 () Bool)

(assert (=> b!1035863 m!956527))

(declare-fun m!956529 () Bool)

(assert (=> b!1035864 m!956529))

(assert (=> bm!43755 d!124809))

(declare-fun d!124811 () Bool)

(declare-fun res!691473 () Bool)

(declare-fun e!585671 () Bool)

(assert (=> d!124811 (=> res!691473 e!585671)))

(assert (=> d!124811 (= res!691473 (and ((_ is Cons!21888) lt!456820) (= (_1!7874 (h!23099 lt!456820)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124811 (= (containsKey!565 lt!456820 #b0000000000000000000000000000000000000000000000000000000000000000) e!585671)))

(declare-fun b!1035865 () Bool)

(declare-fun e!585672 () Bool)

(assert (=> b!1035865 (= e!585671 e!585672)))

(declare-fun res!691474 () Bool)

(assert (=> b!1035865 (=> (not res!691474) (not e!585672))))

(assert (=> b!1035865 (= res!691474 (and (or (not ((_ is Cons!21888) lt!456820)) (bvsle (_1!7874 (h!23099 lt!456820)) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) lt!456820) (bvslt (_1!7874 (h!23099 lt!456820)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035866 () Bool)

(assert (=> b!1035866 (= e!585672 (containsKey!565 (t!31080 lt!456820) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124811 (not res!691473)) b!1035865))

(assert (= (and b!1035865 res!691474) b!1035866))

(declare-fun m!956531 () Bool)

(assert (=> b!1035866 m!956531))

(assert (=> b!1035123 d!124811))

(declare-fun b!1035867 () Bool)

(declare-fun e!585673 () Option!635)

(assert (=> b!1035867 (= e!585673 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456913)))))))

(declare-fun b!1035868 () Bool)

(declare-fun e!585674 () Option!635)

(assert (=> b!1035868 (= e!585673 e!585674)))

(declare-fun c!105054 () Bool)

(assert (=> b!1035868 (= c!105054 (and ((_ is Cons!21888) (toList!6896 lt!456913)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456913))) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035870 () Bool)

(assert (=> b!1035870 (= e!585674 None!633)))

(declare-fun b!1035869 () Bool)

(assert (=> b!1035869 (= e!585674 (getValueByKey!584 (t!31080 (toList!6896 lt!456913)) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun c!105053 () Bool)

(declare-fun d!124813 () Bool)

(assert (=> d!124813 (= c!105053 (and ((_ is Cons!21888) (toList!6896 lt!456913)) (= (_1!7874 (h!23099 (toList!6896 lt!456913))) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(assert (=> d!124813 (= (getValueByKey!584 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) e!585673)))

(assert (= (and d!124813 c!105053) b!1035867))

(assert (= (and d!124813 (not c!105053)) b!1035868))

(assert (= (and b!1035868 c!105054) b!1035869))

(assert (= (and b!1035868 (not c!105054)) b!1035870))

(declare-fun m!956533 () Bool)

(assert (=> b!1035869 m!956533))

(assert (=> b!1035263 d!124813))

(declare-fun d!124815 () Bool)

(declare-fun e!585676 () Bool)

(assert (=> d!124815 e!585676))

(declare-fun res!691475 () Bool)

(assert (=> d!124815 (=> res!691475 e!585676)))

(declare-fun lt!457173 () Bool)

(assert (=> d!124815 (= res!691475 (not lt!457173))))

(declare-fun lt!457172 () Bool)

(assert (=> d!124815 (= lt!457173 lt!457172)))

(declare-fun lt!457175 () Unit!33837)

(declare-fun e!585675 () Unit!33837)

(assert (=> d!124815 (= lt!457175 e!585675)))

(declare-fun c!105055 () Bool)

(assert (=> d!124815 (= c!105055 lt!457172)))

(assert (=> d!124815 (= lt!457172 (containsKey!565 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(assert (=> d!124815 (= (contains!6037 lt!456801 (_1!7874 (tuple2!15727 lt!456701 lt!456631))) lt!457173)))

(declare-fun b!1035871 () Bool)

(declare-fun lt!457174 () Unit!33837)

(assert (=> b!1035871 (= e!585675 lt!457174)))

(assert (=> b!1035871 (= lt!457174 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(assert (=> b!1035871 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun b!1035872 () Bool)

(declare-fun Unit!33877 () Unit!33837)

(assert (=> b!1035872 (= e!585675 Unit!33877)))

(declare-fun b!1035873 () Bool)

(assert (=> b!1035873 (= e!585676 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456801) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(assert (= (and d!124815 c!105055) b!1035871))

(assert (= (and d!124815 (not c!105055)) b!1035872))

(assert (= (and d!124815 (not res!691475)) b!1035873))

(declare-fun m!956535 () Bool)

(assert (=> d!124815 m!956535))

(declare-fun m!956537 () Bool)

(assert (=> b!1035871 m!956537))

(assert (=> b!1035871 m!955225))

(assert (=> b!1035871 m!955225))

(declare-fun m!956539 () Bool)

(assert (=> b!1035871 m!956539))

(assert (=> b!1035873 m!955225))

(assert (=> b!1035873 m!955225))

(assert (=> b!1035873 m!956539))

(assert (=> d!124307 d!124815))

(declare-fun b!1035874 () Bool)

(declare-fun e!585677 () Option!635)

(assert (=> b!1035874 (= e!585677 (Some!634 (_2!7874 (h!23099 lt!456803))))))

(declare-fun b!1035875 () Bool)

(declare-fun e!585678 () Option!635)

(assert (=> b!1035875 (= e!585677 e!585678)))

(declare-fun c!105057 () Bool)

(assert (=> b!1035875 (= c!105057 (and ((_ is Cons!21888) lt!456803) (not (= (_1!7874 (h!23099 lt!456803)) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))))

(declare-fun b!1035877 () Bool)

(assert (=> b!1035877 (= e!585678 None!633)))

(declare-fun b!1035876 () Bool)

(assert (=> b!1035876 (= e!585678 (getValueByKey!584 (t!31080 lt!456803) (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun c!105056 () Bool)

(declare-fun d!124817 () Bool)

(assert (=> d!124817 (= c!105056 (and ((_ is Cons!21888) lt!456803) (= (_1!7874 (h!23099 lt!456803)) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(assert (=> d!124817 (= (getValueByKey!584 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631))) e!585677)))

(assert (= (and d!124817 c!105056) b!1035874))

(assert (= (and d!124817 (not c!105056)) b!1035875))

(assert (= (and b!1035875 c!105057) b!1035876))

(assert (= (and b!1035875 (not c!105057)) b!1035877))

(declare-fun m!956541 () Bool)

(assert (=> b!1035876 m!956541))

(assert (=> d!124307 d!124817))

(declare-fun d!124819 () Bool)

(assert (=> d!124819 (= (getValueByKey!584 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631))) (Some!634 (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun lt!457176 () Unit!33837)

(assert (=> d!124819 (= lt!457176 (choose!1703 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun e!585679 () Bool)

(assert (=> d!124819 e!585679))

(declare-fun res!691476 () Bool)

(assert (=> d!124819 (=> (not res!691476) (not e!585679))))

(assert (=> d!124819 (= res!691476 (isStrictlySorted!706 lt!456803))))

(assert (=> d!124819 (= (lemmaContainsTupThenGetReturnValue!280 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))) lt!457176)))

(declare-fun b!1035878 () Bool)

(declare-fun res!691477 () Bool)

(assert (=> b!1035878 (=> (not res!691477) (not e!585679))))

(assert (=> b!1035878 (= res!691477 (containsKey!565 lt!456803 (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun b!1035879 () Bool)

(assert (=> b!1035879 (= e!585679 (contains!6038 lt!456803 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(assert (= (and d!124819 res!691476) b!1035878))

(assert (= (and b!1035878 res!691477) b!1035879))

(assert (=> d!124819 m!955219))

(declare-fun m!956543 () Bool)

(assert (=> d!124819 m!956543))

(declare-fun m!956545 () Bool)

(assert (=> d!124819 m!956545))

(declare-fun m!956547 () Bool)

(assert (=> b!1035878 m!956547))

(declare-fun m!956549 () Bool)

(assert (=> b!1035879 m!956549))

(assert (=> d!124307 d!124819))

(declare-fun b!1035880 () Bool)

(declare-fun e!585680 () Bool)

(declare-fun lt!457177 () List!21892)

(assert (=> b!1035880 (= e!585680 (contains!6038 lt!457177 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(declare-fun c!105059 () Bool)

(declare-fun e!585684 () List!21892)

(declare-fun call!43810 () List!21892)

(declare-fun bm!43805 () Bool)

(assert (=> bm!43805 (= call!43810 ($colon$colon!603 e!585684 (ite c!105059 (h!23099 (toList!6896 lt!456704)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))))

(declare-fun c!105061 () Bool)

(assert (=> bm!43805 (= c!105061 c!105059)))

(declare-fun bm!43806 () Bool)

(declare-fun call!43808 () List!21892)

(declare-fun call!43809 () List!21892)

(assert (=> bm!43806 (= call!43808 call!43809)))

(declare-fun c!105058 () Bool)

(declare-fun c!105060 () Bool)

(declare-fun b!1035881 () Bool)

(assert (=> b!1035881 (= e!585684 (ite c!105060 (t!31080 (toList!6896 lt!456704)) (ite c!105058 (Cons!21888 (h!23099 (toList!6896 lt!456704)) (t!31080 (toList!6896 lt!456704))) Nil!21889)))))

(declare-fun b!1035882 () Bool)

(declare-fun res!691479 () Bool)

(assert (=> b!1035882 (=> (not res!691479) (not e!585680))))

(assert (=> b!1035882 (= res!691479 (containsKey!565 lt!457177 (_1!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun b!1035883 () Bool)

(declare-fun e!585682 () List!21892)

(declare-fun e!585681 () List!21892)

(assert (=> b!1035883 (= e!585682 e!585681)))

(assert (=> b!1035883 (= c!105060 (and ((_ is Cons!21888) (toList!6896 lt!456704)) (= (_1!7874 (h!23099 (toList!6896 lt!456704))) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(declare-fun b!1035884 () Bool)

(assert (=> b!1035884 (= c!105058 (and ((_ is Cons!21888) (toList!6896 lt!456704)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456704))) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(declare-fun e!585683 () List!21892)

(assert (=> b!1035884 (= e!585681 e!585683)))

(declare-fun b!1035885 () Bool)

(assert (=> b!1035885 (= e!585684 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456704)) (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))))))

(declare-fun b!1035886 () Bool)

(assert (=> b!1035886 (= e!585683 call!43808)))

(declare-fun b!1035887 () Bool)

(assert (=> b!1035887 (= e!585683 call!43808)))

(declare-fun bm!43807 () Bool)

(assert (=> bm!43807 (= call!43809 call!43810)))

(declare-fun b!1035888 () Bool)

(assert (=> b!1035888 (= e!585682 call!43810)))

(declare-fun b!1035889 () Bool)

(assert (=> b!1035889 (= e!585681 call!43809)))

(declare-fun d!124821 () Bool)

(assert (=> d!124821 e!585680))

(declare-fun res!691478 () Bool)

(assert (=> d!124821 (=> (not res!691478) (not e!585680))))

(assert (=> d!124821 (= res!691478 (isStrictlySorted!706 lt!457177))))

(assert (=> d!124821 (= lt!457177 e!585682)))

(assert (=> d!124821 (= c!105059 (and ((_ is Cons!21888) (toList!6896 lt!456704)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456704))) (_1!7874 (tuple2!15727 lt!456701 lt!456631)))))))

(assert (=> d!124821 (isStrictlySorted!706 (toList!6896 lt!456704))))

(assert (=> d!124821 (= (insertStrictlySorted!373 (toList!6896 lt!456704) (_1!7874 (tuple2!15727 lt!456701 lt!456631)) (_2!7874 (tuple2!15727 lt!456701 lt!456631))) lt!457177)))

(assert (= (and d!124821 c!105059) b!1035888))

(assert (= (and d!124821 (not c!105059)) b!1035883))

(assert (= (and b!1035883 c!105060) b!1035889))

(assert (= (and b!1035883 (not c!105060)) b!1035884))

(assert (= (and b!1035884 c!105058) b!1035886))

(assert (= (and b!1035884 (not c!105058)) b!1035887))

(assert (= (or b!1035886 b!1035887) bm!43806))

(assert (= (or b!1035889 bm!43806) bm!43807))

(assert (= (or b!1035888 bm!43807) bm!43805))

(assert (= (and bm!43805 c!105061) b!1035885))

(assert (= (and bm!43805 (not c!105061)) b!1035881))

(assert (= (and d!124821 res!691478) b!1035882))

(assert (= (and b!1035882 res!691479) b!1035880))

(declare-fun m!956551 () Bool)

(assert (=> b!1035885 m!956551))

(declare-fun m!956553 () Bool)

(assert (=> b!1035880 m!956553))

(declare-fun m!956555 () Bool)

(assert (=> bm!43805 m!956555))

(declare-fun m!956557 () Bool)

(assert (=> d!124821 m!956557))

(declare-fun m!956559 () Bool)

(assert (=> d!124821 m!956559))

(declare-fun m!956561 () Bool)

(assert (=> b!1035882 m!956561))

(assert (=> d!124307 d!124821))

(declare-fun d!124823 () Bool)

(declare-fun e!585686 () Bool)

(assert (=> d!124823 e!585686))

(declare-fun res!691480 () Bool)

(assert (=> d!124823 (=> res!691480 e!585686)))

(declare-fun lt!457179 () Bool)

(assert (=> d!124823 (= res!691480 (not lt!457179))))

(declare-fun lt!457178 () Bool)

(assert (=> d!124823 (= lt!457179 lt!457178)))

(declare-fun lt!457181 () Unit!33837)

(declare-fun e!585685 () Unit!33837)

(assert (=> d!124823 (= lt!457181 e!585685)))

(declare-fun c!105062 () Bool)

(assert (=> d!124823 (= c!105062 lt!457178)))

(assert (=> d!124823 (= lt!457178 (containsKey!565 (toList!6896 lt!456884) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124823 (= (contains!6037 lt!456884 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!457179)))

(declare-fun b!1035890 () Bool)

(declare-fun lt!457180 () Unit!33837)

(assert (=> b!1035890 (= e!585685 lt!457180)))

(assert (=> b!1035890 (= lt!457180 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456884) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035890 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035891 () Bool)

(declare-fun Unit!33878 () Unit!33837)

(assert (=> b!1035891 (= e!585685 Unit!33878)))

(declare-fun b!1035892 () Bool)

(assert (=> b!1035892 (= e!585686 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456884) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124823 c!105062) b!1035890))

(assert (= (and d!124823 (not c!105062)) b!1035891))

(assert (= (and d!124823 (not res!691480)) b!1035892))

(assert (=> d!124823 m!955035))

(declare-fun m!956563 () Bool)

(assert (=> d!124823 m!956563))

(assert (=> b!1035890 m!955035))

(declare-fun m!956565 () Bool)

(assert (=> b!1035890 m!956565))

(assert (=> b!1035890 m!955035))

(assert (=> b!1035890 m!956419))

(assert (=> b!1035890 m!956419))

(declare-fun m!956567 () Bool)

(assert (=> b!1035890 m!956567))

(assert (=> b!1035892 m!955035))

(assert (=> b!1035892 m!956419))

(assert (=> b!1035892 m!956419))

(assert (=> b!1035892 m!956567))

(assert (=> b!1035227 d!124823))

(declare-fun d!124825 () Bool)

(assert (=> d!124825 (= ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (toList!6896 (map!14685 thiss!1427))) key!909) (h!23099 (toList!6896 (map!14685 thiss!1427)))) (Cons!21888 (h!23099 (toList!6896 (map!14685 thiss!1427))) (removeStrictlySorted!55 (t!31080 (toList!6896 (map!14685 thiss!1427))) key!909)))))

(assert (=> b!1035172 d!124825))

(declare-fun b!1035893 () Bool)

(declare-fun e!585687 () Bool)

(declare-fun lt!457182 () List!21892)

(assert (=> b!1035893 (= e!585687 (not (containsKey!565 lt!457182 key!909)))))

(declare-fun b!1035894 () Bool)

(declare-fun e!585688 () List!21892)

(assert (=> b!1035894 (= e!585688 Nil!21889)))

(declare-fun b!1035895 () Bool)

(assert (=> b!1035895 (= e!585688 ($colon$colon!603 (removeStrictlySorted!55 (t!31080 (t!31080 (toList!6896 (map!14685 thiss!1427)))) key!909) (h!23099 (t!31080 (toList!6896 (map!14685 thiss!1427))))))))

(declare-fun b!1035896 () Bool)

(declare-fun e!585689 () List!21892)

(assert (=> b!1035896 (= e!585689 e!585688)))

(declare-fun c!105063 () Bool)

(assert (=> b!1035896 (= c!105063 (and ((_ is Cons!21888) (t!31080 (toList!6896 (map!14685 thiss!1427)))) (not (= (_1!7874 (h!23099 (t!31080 (toList!6896 (map!14685 thiss!1427))))) key!909))))))

(declare-fun d!124827 () Bool)

(assert (=> d!124827 e!585687))

(declare-fun res!691481 () Bool)

(assert (=> d!124827 (=> (not res!691481) (not e!585687))))

(assert (=> d!124827 (= res!691481 (isStrictlySorted!706 lt!457182))))

(assert (=> d!124827 (= lt!457182 e!585689)))

(declare-fun c!105064 () Bool)

(assert (=> d!124827 (= c!105064 (and ((_ is Cons!21888) (t!31080 (toList!6896 (map!14685 thiss!1427)))) (= (_1!7874 (h!23099 (t!31080 (toList!6896 (map!14685 thiss!1427))))) key!909)))))

(assert (=> d!124827 (isStrictlySorted!706 (t!31080 (toList!6896 (map!14685 thiss!1427))))))

(assert (=> d!124827 (= (removeStrictlySorted!55 (t!31080 (toList!6896 (map!14685 thiss!1427))) key!909) lt!457182)))

(declare-fun b!1035897 () Bool)

(assert (=> b!1035897 (= e!585689 (t!31080 (t!31080 (toList!6896 (map!14685 thiss!1427)))))))

(assert (= (and d!124827 c!105064) b!1035897))

(assert (= (and d!124827 (not c!105064)) b!1035896))

(assert (= (and b!1035896 c!105063) b!1035895))

(assert (= (and b!1035896 (not c!105063)) b!1035894))

(assert (= (and d!124827 res!691481) b!1035893))

(declare-fun m!956569 () Bool)

(assert (=> b!1035893 m!956569))

(declare-fun m!956571 () Bool)

(assert (=> b!1035895 m!956571))

(assert (=> b!1035895 m!956571))

(declare-fun m!956573 () Bool)

(assert (=> b!1035895 m!956573))

(declare-fun m!956575 () Bool)

(assert (=> d!124827 m!956575))

(assert (=> d!124827 m!956195))

(assert (=> b!1035172 d!124827))

(declare-fun d!124829 () Bool)

(declare-fun res!691482 () Bool)

(declare-fun e!585690 () Bool)

(assert (=> d!124829 (=> res!691482 e!585690)))

(assert (=> d!124829 (= res!691482 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124829 (= (containsKey!565 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000) e!585690)))

(declare-fun b!1035898 () Bool)

(declare-fun e!585691 () Bool)

(assert (=> b!1035898 (= e!585690 e!585691)))

(declare-fun res!691483 () Bool)

(assert (=> b!1035898 (=> (not res!691483) (not e!585691))))

(assert (=> b!1035898 (= res!691483 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456742))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456742))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) (toList!6896 lt!456742)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456742))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035899 () Bool)

(assert (=> b!1035899 (= e!585691 (containsKey!565 (t!31080 (toList!6896 lt!456742)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124829 (not res!691482)) b!1035898))

(assert (= (and b!1035898 res!691483) b!1035899))

(declare-fun m!956577 () Bool)

(assert (=> b!1035899 m!956577))

(assert (=> d!124415 d!124829))

(assert (=> b!1035208 d!124605))

(declare-fun b!1035900 () Bool)

(declare-fun e!585692 () Option!635)

(assert (=> b!1035900 (= e!585692 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456781)))))))

(declare-fun b!1035901 () Bool)

(declare-fun e!585693 () Option!635)

(assert (=> b!1035901 (= e!585692 e!585693)))

(declare-fun c!105066 () Bool)

(assert (=> b!1035901 (= c!105066 (and ((_ is Cons!21888) (toList!6896 lt!456781)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456781))) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035903 () Bool)

(assert (=> b!1035903 (= e!585693 None!633)))

(declare-fun b!1035902 () Bool)

(assert (=> b!1035902 (= e!585693 (getValueByKey!584 (t!31080 (toList!6896 lt!456781)) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))))))

(declare-fun c!105065 () Bool)

(declare-fun d!124831 () Bool)

(assert (=> d!124831 (= c!105065 (and ((_ is Cons!21888) (toList!6896 lt!456781)) (= (_1!7874 (h!23099 (toList!6896 lt!456781))) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427))))))))

(assert (=> d!124831 (= (getValueByKey!584 (toList!6896 lt!456781) (_1!7874 (tuple2!15727 lt!456715 (minValue!6062 thiss!1427)))) e!585692)))

(assert (= (and d!124831 c!105065) b!1035900))

(assert (= (and d!124831 (not c!105065)) b!1035901))

(assert (= (and b!1035901 c!105066) b!1035902))

(assert (= (and b!1035901 (not c!105066)) b!1035903))

(declare-fun m!956579 () Bool)

(assert (=> b!1035902 m!956579))

(assert (=> b!1035089 d!124831))

(declare-fun d!124833 () Bool)

(declare-fun e!585695 () Bool)

(assert (=> d!124833 e!585695))

(declare-fun res!691484 () Bool)

(assert (=> d!124833 (=> res!691484 e!585695)))

(declare-fun lt!457184 () Bool)

(assert (=> d!124833 (= res!691484 (not lt!457184))))

(declare-fun lt!457183 () Bool)

(assert (=> d!124833 (= lt!457184 lt!457183)))

(declare-fun lt!457186 () Unit!33837)

(declare-fun e!585694 () Unit!33837)

(assert (=> d!124833 (= lt!457186 e!585694)))

(declare-fun c!105067 () Bool)

(assert (=> d!124833 (= c!105067 lt!457183)))

(assert (=> d!124833 (= lt!457183 (containsKey!565 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(assert (=> d!124833 (= (contains!6037 lt!456913 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!457184)))

(declare-fun b!1035904 () Bool)

(declare-fun lt!457185 () Unit!33837)

(assert (=> b!1035904 (= e!585694 lt!457185)))

(assert (=> b!1035904 (= lt!457185 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(assert (=> b!1035904 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035905 () Bool)

(declare-fun Unit!33879 () Unit!33837)

(assert (=> b!1035905 (= e!585694 Unit!33879)))

(declare-fun b!1035906 () Bool)

(assert (=> b!1035906 (= e!585695 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456913) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124833 c!105067) b!1035904))

(assert (= (and d!124833 (not c!105067)) b!1035905))

(assert (= (and d!124833 (not res!691484)) b!1035906))

(declare-fun m!956581 () Bool)

(assert (=> d!124833 m!956581))

(declare-fun m!956583 () Bool)

(assert (=> b!1035904 m!956583))

(assert (=> b!1035904 m!955555))

(assert (=> b!1035904 m!955555))

(declare-fun m!956585 () Bool)

(assert (=> b!1035904 m!956585))

(assert (=> b!1035906 m!955555))

(assert (=> b!1035906 m!955555))

(assert (=> b!1035906 m!956585))

(assert (=> d!124393 d!124833))

(declare-fun b!1035907 () Bool)

(declare-fun e!585696 () Option!635)

(assert (=> b!1035907 (= e!585696 (Some!634 (_2!7874 (h!23099 lt!456915))))))

(declare-fun b!1035908 () Bool)

(declare-fun e!585697 () Option!635)

(assert (=> b!1035908 (= e!585696 e!585697)))

(declare-fun c!105069 () Bool)

(assert (=> b!1035908 (= c!105069 (and ((_ is Cons!21888) lt!456915) (not (= (_1!7874 (h!23099 lt!456915)) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035910 () Bool)

(assert (=> b!1035910 (= e!585697 None!633)))

(declare-fun b!1035909 () Bool)

(assert (=> b!1035909 (= e!585697 (getValueByKey!584 (t!31080 lt!456915) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun c!105068 () Bool)

(declare-fun d!124835 () Bool)

(assert (=> d!124835 (= c!105068 (and ((_ is Cons!21888) lt!456915) (= (_1!7874 (h!23099 lt!456915)) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(assert (=> d!124835 (= (getValueByKey!584 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) e!585696)))

(assert (= (and d!124835 c!105068) b!1035907))

(assert (= (and d!124835 (not c!105068)) b!1035908))

(assert (= (and b!1035908 c!105069) b!1035909))

(assert (= (and b!1035908 (not c!105069)) b!1035910))

(declare-fun m!956587 () Bool)

(assert (=> b!1035909 m!956587))

(assert (=> d!124393 d!124835))

(declare-fun d!124837 () Bool)

(assert (=> d!124837 (= (getValueByKey!584 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) (Some!634 (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun lt!457187 () Unit!33837)

(assert (=> d!124837 (= lt!457187 (choose!1703 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun e!585698 () Bool)

(assert (=> d!124837 e!585698))

(declare-fun res!691485 () Bool)

(assert (=> d!124837 (=> (not res!691485) (not e!585698))))

(assert (=> d!124837 (= res!691485 (isStrictlySorted!706 lt!456915))))

(assert (=> d!124837 (= (lemmaContainsTupThenGetReturnValue!280 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!457187)))

(declare-fun b!1035911 () Bool)

(declare-fun res!691486 () Bool)

(assert (=> b!1035911 (=> (not res!691486) (not e!585698))))

(assert (=> b!1035911 (= res!691486 (containsKey!565 lt!456915 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035912 () Bool)

(assert (=> b!1035912 (= e!585698 (contains!6038 lt!456915 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(assert (= (and d!124837 res!691485) b!1035911))

(assert (= (and b!1035911 res!691486) b!1035912))

(assert (=> d!124837 m!955549))

(declare-fun m!956589 () Bool)

(assert (=> d!124837 m!956589))

(declare-fun m!956591 () Bool)

(assert (=> d!124837 m!956591))

(declare-fun m!956593 () Bool)

(assert (=> b!1035911 m!956593))

(declare-fun m!956595 () Bool)

(assert (=> b!1035912 m!956595))

(assert (=> d!124393 d!124837))

(declare-fun e!585699 () Bool)

(declare-fun b!1035913 () Bool)

(declare-fun lt!457188 () List!21892)

(assert (=> b!1035913 (= e!585699 (contains!6038 lt!457188 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(declare-fun c!105071 () Bool)

(declare-fun call!43813 () List!21892)

(declare-fun bm!43808 () Bool)

(declare-fun e!585703 () List!21892)

(assert (=> bm!43808 (= call!43813 ($colon$colon!603 e!585703 (ite c!105071 (h!23099 (toList!6896 lt!456734)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))))

(declare-fun c!105073 () Bool)

(assert (=> bm!43808 (= c!105073 c!105071)))

(declare-fun bm!43809 () Bool)

(declare-fun call!43811 () List!21892)

(declare-fun call!43812 () List!21892)

(assert (=> bm!43809 (= call!43811 call!43812)))

(declare-fun c!105072 () Bool)

(declare-fun c!105070 () Bool)

(declare-fun b!1035914 () Bool)

(assert (=> b!1035914 (= e!585703 (ite c!105072 (t!31080 (toList!6896 lt!456734)) (ite c!105070 (Cons!21888 (h!23099 (toList!6896 lt!456734)) (t!31080 (toList!6896 lt!456734))) Nil!21889)))))

(declare-fun b!1035915 () Bool)

(declare-fun res!691488 () Bool)

(assert (=> b!1035915 (=> (not res!691488) (not e!585699))))

(assert (=> b!1035915 (= res!691488 (containsKey!565 lt!457188 (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035916 () Bool)

(declare-fun e!585701 () List!21892)

(declare-fun e!585700 () List!21892)

(assert (=> b!1035916 (= e!585701 e!585700)))

(assert (=> b!1035916 (= c!105072 (and ((_ is Cons!21888) (toList!6896 lt!456734)) (= (_1!7874 (h!23099 (toList!6896 lt!456734))) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(declare-fun b!1035917 () Bool)

(assert (=> b!1035917 (= c!105070 (and ((_ is Cons!21888) (toList!6896 lt!456734)) (bvsgt (_1!7874 (h!23099 (toList!6896 lt!456734))) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(declare-fun e!585702 () List!21892)

(assert (=> b!1035917 (= e!585700 e!585702)))

(declare-fun b!1035918 () Bool)

(assert (=> b!1035918 (= e!585703 (insertStrictlySorted!373 (t!31080 (toList!6896 lt!456734)) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))))))

(declare-fun b!1035919 () Bool)

(assert (=> b!1035919 (= e!585702 call!43811)))

(declare-fun b!1035920 () Bool)

(assert (=> b!1035920 (= e!585702 call!43811)))

(declare-fun bm!43810 () Bool)

(assert (=> bm!43810 (= call!43812 call!43813)))

(declare-fun b!1035921 () Bool)

(assert (=> b!1035921 (= e!585701 call!43813)))

(declare-fun b!1035922 () Bool)

(assert (=> b!1035922 (= e!585700 call!43812)))

(declare-fun d!124839 () Bool)

(assert (=> d!124839 e!585699))

(declare-fun res!691487 () Bool)

(assert (=> d!124839 (=> (not res!691487) (not e!585699))))

(assert (=> d!124839 (= res!691487 (isStrictlySorted!706 lt!457188))))

(assert (=> d!124839 (= lt!457188 e!585701)))

(assert (=> d!124839 (= c!105071 (and ((_ is Cons!21888) (toList!6896 lt!456734)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456734))) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))))))))

(assert (=> d!124839 (isStrictlySorted!706 (toList!6896 lt!456734))))

(assert (=> d!124839 (= (insertStrictlySorted!373 (toList!6896 lt!456734) (_1!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) (_2!7874 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427)))) lt!457188)))

(assert (= (and d!124839 c!105071) b!1035921))

(assert (= (and d!124839 (not c!105071)) b!1035916))

(assert (= (and b!1035916 c!105072) b!1035922))

(assert (= (and b!1035916 (not c!105072)) b!1035917))

(assert (= (and b!1035917 c!105070) b!1035919))

(assert (= (and b!1035917 (not c!105070)) b!1035920))

(assert (= (or b!1035919 b!1035920) bm!43809))

(assert (= (or b!1035922 bm!43809) bm!43810))

(assert (= (or b!1035921 bm!43810) bm!43808))

(assert (= (and bm!43808 c!105073) b!1035918))

(assert (= (and bm!43808 (not c!105073)) b!1035914))

(assert (= (and d!124839 res!691487) b!1035915))

(assert (= (and b!1035915 res!691488) b!1035913))

(declare-fun m!956597 () Bool)

(assert (=> b!1035918 m!956597))

(declare-fun m!956599 () Bool)

(assert (=> b!1035913 m!956599))

(declare-fun m!956601 () Bool)

(assert (=> bm!43808 m!956601))

(declare-fun m!956603 () Bool)

(assert (=> d!124839 m!956603))

(declare-fun m!956605 () Bool)

(assert (=> d!124839 m!956605))

(declare-fun m!956607 () Bool)

(assert (=> b!1035915 m!956607))

(assert (=> d!124393 d!124839))

(assert (=> b!1035219 d!124553))

(assert (=> b!1035223 d!124323))

(declare-fun d!124841 () Bool)

(assert (=> d!124841 (= (isEmpty!930 lt!456767) (isEmpty!932 (toList!6896 lt!456767)))))

(declare-fun bs!30286 () Bool)

(assert (= bs!30286 d!124841))

(declare-fun m!956609 () Bool)

(assert (=> bs!30286 m!956609))

(assert (=> b!1035073 d!124841))

(assert (=> b!1035272 d!124605))

(declare-fun d!124843 () Bool)

(assert (=> d!124843 (arrayContainsKey!0 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000)))

(declare-fun lt!457189 () Unit!33837)

(assert (=> d!124843 (= lt!457189 (choose!13 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000))))

(assert (=> d!124843 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124843 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000) lt!457189)))

(declare-fun bs!30287 () Bool)

(assert (= bs!30287 d!124843))

(assert (=> bs!30287 m!955375))

(declare-fun m!956611 () Bool)

(assert (=> bs!30287 m!956611))

(assert (=> b!1035195 d!124843))

(declare-fun d!124845 () Bool)

(declare-fun res!691489 () Bool)

(declare-fun e!585704 () Bool)

(assert (=> d!124845 (=> res!691489 e!585704)))

(assert (=> d!124845 (= res!691489 (= (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) lt!456856))))

(assert (=> d!124845 (= (arrayContainsKey!0 (_keys!11444 thiss!1427) lt!456856 #b00000000000000000000000000000000) e!585704)))

(declare-fun b!1035923 () Bool)

(declare-fun e!585705 () Bool)

(assert (=> b!1035923 (= e!585704 e!585705)))

(declare-fun res!691490 () Bool)

(assert (=> b!1035923 (=> (not res!691490) (not e!585705))))

(assert (=> b!1035923 (= res!691490 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31892 (_keys!11444 thiss!1427))))))

(declare-fun b!1035924 () Bool)

(assert (=> b!1035924 (= e!585705 (arrayContainsKey!0 (_keys!11444 thiss!1427) lt!456856 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124845 (not res!691489)) b!1035923))

(assert (= (and b!1035923 res!691490) b!1035924))

(assert (=> d!124845 m!955035))

(declare-fun m!956613 () Bool)

(assert (=> b!1035924 m!956613))

(assert (=> b!1035195 d!124845))

(declare-fun b!1035925 () Bool)

(declare-fun e!585707 () SeekEntryResult!9695)

(declare-fun lt!457192 () SeekEntryResult!9695)

(assert (=> b!1035925 (= e!585707 (Found!9695 (index!41153 lt!457192)))))

(declare-fun b!1035926 () Bool)

(declare-fun e!585708 () SeekEntryResult!9695)

(assert (=> b!1035926 (= e!585708 e!585707)))

(declare-fun lt!457191 () (_ BitVec 64))

(assert (=> b!1035926 (= lt!457191 (select (arr!31369 (_keys!11444 thiss!1427)) (index!41153 lt!457192)))))

(declare-fun c!105075 () Bool)

(assert (=> b!1035926 (= c!105075 (= lt!457191 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035927 () Bool)

(assert (=> b!1035927 (= e!585708 Undefined!9695)))

(declare-fun b!1035928 () Bool)

(declare-fun e!585706 () SeekEntryResult!9695)

(assert (=> b!1035928 (= e!585706 (MissingZero!9695 (index!41153 lt!457192)))))

(declare-fun b!1035929 () Bool)

(assert (=> b!1035929 (= e!585706 (seekKeyOrZeroReturnVacant!0 (x!92204 lt!457192) (index!41153 lt!457192) (index!41153 lt!457192) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)))))

(declare-fun b!1035930 () Bool)

(declare-fun c!105076 () Bool)

(assert (=> b!1035930 (= c!105076 (= lt!457191 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035930 (= e!585707 e!585706)))

(declare-fun d!124847 () Bool)

(declare-fun lt!457190 () SeekEntryResult!9695)

(assert (=> d!124847 (and (or ((_ is Undefined!9695) lt!457190) (not ((_ is Found!9695) lt!457190)) (and (bvsge (index!41152 lt!457190) #b00000000000000000000000000000000) (bvslt (index!41152 lt!457190) (size!31892 (_keys!11444 thiss!1427))))) (or ((_ is Undefined!9695) lt!457190) ((_ is Found!9695) lt!457190) (not ((_ is MissingZero!9695) lt!457190)) (and (bvsge (index!41151 lt!457190) #b00000000000000000000000000000000) (bvslt (index!41151 lt!457190) (size!31892 (_keys!11444 thiss!1427))))) (or ((_ is Undefined!9695) lt!457190) ((_ is Found!9695) lt!457190) ((_ is MissingZero!9695) lt!457190) (not ((_ is MissingVacant!9695) lt!457190)) (and (bvsge (index!41154 lt!457190) #b00000000000000000000000000000000) (bvslt (index!41154 lt!457190) (size!31892 (_keys!11444 thiss!1427))))) (or ((_ is Undefined!9695) lt!457190) (ite ((_ is Found!9695) lt!457190) (= (select (arr!31369 (_keys!11444 thiss!1427)) (index!41152 lt!457190)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9695) lt!457190) (= (select (arr!31369 (_keys!11444 thiss!1427)) (index!41151 lt!457190)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9695) lt!457190) (= (select (arr!31369 (_keys!11444 thiss!1427)) (index!41154 lt!457190)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124847 (= lt!457190 e!585708)))

(declare-fun c!105074 () Bool)

(assert (=> d!124847 (= c!105074 (and ((_ is Intermediate!9695) lt!457192) (undefined!10507 lt!457192)))))

(assert (=> d!124847 (= lt!457192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (mask!30143 thiss!1427)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)))))

(assert (=> d!124847 (validMask!0 (mask!30143 thiss!1427))))

(assert (=> d!124847 (= (seekEntryOrOpen!0 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000) (_keys!11444 thiss!1427) (mask!30143 thiss!1427)) lt!457190)))

(assert (= (and d!124847 c!105074) b!1035927))

(assert (= (and d!124847 (not c!105074)) b!1035926))

(assert (= (and b!1035926 c!105075) b!1035925))

(assert (= (and b!1035926 (not c!105075)) b!1035930))

(assert (= (and b!1035930 c!105076) b!1035928))

(assert (= (and b!1035930 (not c!105076)) b!1035929))

(declare-fun m!956615 () Bool)

(assert (=> b!1035926 m!956615))

(assert (=> b!1035929 m!955035))

(declare-fun m!956617 () Bool)

(assert (=> b!1035929 m!956617))

(declare-fun m!956619 () Bool)

(assert (=> d!124847 m!956619))

(declare-fun m!956621 () Bool)

(assert (=> d!124847 m!956621))

(declare-fun m!956623 () Bool)

(assert (=> d!124847 m!956623))

(assert (=> d!124847 m!955035))

(declare-fun m!956625 () Bool)

(assert (=> d!124847 m!956625))

(assert (=> d!124847 m!955047))

(declare-fun m!956627 () Bool)

(assert (=> d!124847 m!956627))

(assert (=> d!124847 m!955035))

(assert (=> d!124847 m!956623))

(assert (=> b!1035195 d!124847))

(declare-fun lt!457193 () Bool)

(declare-fun d!124849 () Bool)

(assert (=> d!124849 (= lt!457193 (select (content!515 (toList!6896 lt!456801)) (tuple2!15727 lt!456701 lt!456631)))))

(declare-fun e!585709 () Bool)

(assert (=> d!124849 (= lt!457193 e!585709)))

(declare-fun res!691491 () Bool)

(assert (=> d!124849 (=> (not res!691491) (not e!585709))))

(assert (=> d!124849 (= res!691491 ((_ is Cons!21888) (toList!6896 lt!456801)))))

(assert (=> d!124849 (= (contains!6038 (toList!6896 lt!456801) (tuple2!15727 lt!456701 lt!456631)) lt!457193)))

(declare-fun b!1035931 () Bool)

(declare-fun e!585710 () Bool)

(assert (=> b!1035931 (= e!585709 e!585710)))

(declare-fun res!691492 () Bool)

(assert (=> b!1035931 (=> res!691492 e!585710)))

(assert (=> b!1035931 (= res!691492 (= (h!23099 (toList!6896 lt!456801)) (tuple2!15727 lt!456701 lt!456631)))))

(declare-fun b!1035932 () Bool)

(assert (=> b!1035932 (= e!585710 (contains!6038 (t!31080 (toList!6896 lt!456801)) (tuple2!15727 lt!456701 lt!456631)))))

(assert (= (and d!124849 res!691491) b!1035931))

(assert (= (and b!1035931 (not res!691492)) b!1035932))

(declare-fun m!956629 () Bool)

(assert (=> d!124849 m!956629))

(declare-fun m!956631 () Bool)

(assert (=> d!124849 m!956631))

(declare-fun m!956633 () Bool)

(assert (=> b!1035932 m!956633))

(assert (=> b!1035103 d!124849))

(declare-fun d!124851 () Bool)

(assert (=> d!124851 (isDefined!434 (getValueByKey!584 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(declare-fun lt!457194 () Unit!33837)

(assert (=> d!124851 (= lt!457194 (choose!1704 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(declare-fun e!585711 () Bool)

(assert (=> d!124851 e!585711))

(declare-fun res!691493 () Bool)

(assert (=> d!124851 (=> (not res!691493) (not e!585711))))

(assert (=> d!124851 (= res!691493 (isStrictlySorted!706 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631)))))))

(assert (=> d!124851 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703) lt!457194)))

(declare-fun b!1035933 () Bool)

(assert (=> b!1035933 (= e!585711 (containsKey!565 (toList!6896 (+!3126 lt!456700 (tuple2!15727 lt!456717 lt!456631))) lt!456703))))

(assert (= (and d!124851 res!691493) b!1035933))

(assert (=> d!124851 m!955213))

(assert (=> d!124851 m!955213))

(assert (=> d!124851 m!955215))

(declare-fun m!956635 () Bool)

(assert (=> d!124851 m!956635))

(declare-fun m!956637 () Bool)

(assert (=> d!124851 m!956637))

(assert (=> b!1035933 m!955209))

(assert (=> b!1035099 d!124851))

(assert (=> b!1035099 d!124651))

(assert (=> b!1035099 d!124653))

(declare-fun d!124853 () Bool)

(declare-fun res!691494 () Bool)

(declare-fun e!585712 () Bool)

(assert (=> d!124853 (=> res!691494 e!585712)))

(assert (=> d!124853 (= res!691494 (and ((_ is Cons!21888) (toList!6896 lt!456716)) (= (_1!7874 (h!23099 (toList!6896 lt!456716))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124853 (= (containsKey!565 (toList!6896 lt!456716) #b1000000000000000000000000000000000000000000000000000000000000000) e!585712)))

(declare-fun b!1035934 () Bool)

(declare-fun e!585713 () Bool)

(assert (=> b!1035934 (= e!585712 e!585713)))

(declare-fun res!691495 () Bool)

(assert (=> b!1035934 (=> (not res!691495) (not e!585713))))

(assert (=> b!1035934 (= res!691495 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456716))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456716))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21888) (toList!6896 lt!456716)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456716))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1035935 () Bool)

(assert (=> b!1035935 (= e!585713 (containsKey!565 (t!31080 (toList!6896 lt!456716)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124853 (not res!691494)) b!1035934))

(assert (= (and b!1035934 res!691495) b!1035935))

(declare-fun m!956639 () Bool)

(assert (=> b!1035935 m!956639))

(assert (=> d!124339 d!124853))

(declare-fun d!124855 () Bool)

(declare-fun e!585715 () Bool)

(assert (=> d!124855 e!585715))

(declare-fun res!691496 () Bool)

(assert (=> d!124855 (=> res!691496 e!585715)))

(declare-fun lt!457196 () Bool)

(assert (=> d!124855 (= res!691496 (not lt!457196))))

(declare-fun lt!457195 () Bool)

(assert (=> d!124855 (= lt!457196 lt!457195)))

(declare-fun lt!457198 () Unit!33837)

(declare-fun e!585714 () Unit!33837)

(assert (=> d!124855 (= lt!457198 e!585714)))

(declare-fun c!105077 () Bool)

(assert (=> d!124855 (= c!105077 lt!457195)))

(assert (=> d!124855 (= lt!457195 (containsKey!565 (toList!6896 lt!456734) lt!456736))))

(assert (=> d!124855 (= (contains!6037 lt!456734 lt!456736) lt!457196)))

(declare-fun b!1035936 () Bool)

(declare-fun lt!457197 () Unit!33837)

(assert (=> b!1035936 (= e!585714 lt!457197)))

(assert (=> b!1035936 (= lt!457197 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456734) lt!456736))))

(assert (=> b!1035936 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456734) lt!456736))))

(declare-fun b!1035937 () Bool)

(declare-fun Unit!33880 () Unit!33837)

(assert (=> b!1035937 (= e!585714 Unit!33880)))

(declare-fun b!1035938 () Bool)

(assert (=> b!1035938 (= e!585715 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456734) lt!456736)))))

(assert (= (and d!124855 c!105077) b!1035936))

(assert (= (and d!124855 (not c!105077)) b!1035937))

(assert (= (and d!124855 (not res!691496)) b!1035938))

(declare-fun m!956641 () Bool)

(assert (=> d!124855 m!956641))

(declare-fun m!956643 () Bool)

(assert (=> b!1035936 m!956643))

(assert (=> b!1035936 m!955591))

(assert (=> b!1035936 m!955591))

(declare-fun m!956645 () Bool)

(assert (=> b!1035936 m!956645))

(assert (=> b!1035938 m!955591))

(assert (=> b!1035938 m!955591))

(assert (=> b!1035938 m!956645))

(assert (=> d!124405 d!124855))

(declare-fun d!124857 () Bool)

(assert (=> d!124857 (= (apply!915 (+!3126 lt!456734 (tuple2!15727 lt!456735 (minValue!6062 thiss!1427))) lt!456736) (apply!915 lt!456734 lt!456736))))

(assert (=> d!124857 true))

(declare-fun _$34!1167 () Unit!33837)

(assert (=> d!124857 (= (choose!1701 lt!456734 lt!456735 (minValue!6062 thiss!1427) lt!456736) _$34!1167)))

(declare-fun bs!30288 () Bool)

(assert (= bs!30288 d!124857))

(assert (=> bs!30288 m!955129))

(assert (=> bs!30288 m!955129))

(assert (=> bs!30288 m!955133))

(assert (=> bs!30288 m!955123))

(assert (=> d!124405 d!124857))

(assert (=> d!124405 d!124389))

(assert (=> d!124405 d!124393))

(assert (=> d!124405 d!124407))

(declare-fun d!124859 () Bool)

(declare-fun e!585717 () Bool)

(assert (=> d!124859 e!585717))

(declare-fun res!691497 () Bool)

(assert (=> d!124859 (=> res!691497 e!585717)))

(declare-fun lt!457200 () Bool)

(assert (=> d!124859 (= res!691497 (not lt!457200))))

(declare-fun lt!457199 () Bool)

(assert (=> d!124859 (= lt!457200 lt!457199)))

(declare-fun lt!457202 () Unit!33837)

(declare-fun e!585716 () Unit!33837)

(assert (=> d!124859 (= lt!457202 e!585716)))

(declare-fun c!105078 () Bool)

(assert (=> d!124859 (= c!105078 lt!457199)))

(assert (=> d!124859 (= lt!457199 (containsKey!565 (toList!6896 lt!456704) lt!456698))))

(assert (=> d!124859 (= (contains!6037 lt!456704 lt!456698) lt!457200)))

(declare-fun b!1035939 () Bool)

(declare-fun lt!457201 () Unit!33837)

(assert (=> b!1035939 (= e!585716 lt!457201)))

(assert (=> b!1035939 (= lt!457201 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456704) lt!456698))))

(assert (=> b!1035939 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456704) lt!456698))))

(declare-fun b!1035940 () Bool)

(declare-fun Unit!33881 () Unit!33837)

(assert (=> b!1035940 (= e!585716 Unit!33881)))

(declare-fun b!1035941 () Bool)

(assert (=> b!1035941 (= e!585717 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456704) lt!456698)))))

(assert (= (and d!124859 c!105078) b!1035939))

(assert (= (and d!124859 (not c!105078)) b!1035940))

(assert (= (and d!124859 (not res!691497)) b!1035941))

(declare-fun m!956647 () Bool)

(assert (=> d!124859 m!956647))

(declare-fun m!956649 () Bool)

(assert (=> b!1035939 m!956649))

(assert (=> b!1035939 m!955229))

(assert (=> b!1035939 m!955229))

(declare-fun m!956651 () Bool)

(assert (=> b!1035939 m!956651))

(assert (=> b!1035941 m!955229))

(assert (=> b!1035941 m!955229))

(assert (=> b!1035941 m!956651))

(assert (=> d!124311 d!124859))

(assert (=> d!124311 d!124295))

(declare-fun d!124861 () Bool)

(assert (=> d!124861 (= (apply!915 (+!3126 lt!456704 (tuple2!15727 lt!456701 lt!456631)) lt!456698) (apply!915 lt!456704 lt!456698))))

(assert (=> d!124861 true))

(declare-fun _$34!1168 () Unit!33837)

(assert (=> d!124861 (= (choose!1701 lt!456704 lt!456701 lt!456631 lt!456698) _$34!1168)))

(declare-fun bs!30289 () Bool)

(assert (= bs!30289 d!124861))

(assert (=> bs!30289 m!955081))

(assert (=> bs!30289 m!955081))

(assert (=> bs!30289 m!955083))

(assert (=> bs!30289 m!955067))

(assert (=> d!124311 d!124861))

(assert (=> d!124311 d!124307))

(assert (=> d!124311 d!124309))

(declare-fun b!1035942 () Bool)

(declare-fun e!585718 () Option!635)

(assert (=> b!1035942 (= e!585718 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456807)))))))

(declare-fun b!1035943 () Bool)

(declare-fun e!585719 () Option!635)

(assert (=> b!1035943 (= e!585718 e!585719)))

(declare-fun c!105080 () Bool)

(assert (=> b!1035943 (= c!105080 (and ((_ is Cons!21888) (toList!6896 lt!456807)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456807))) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))))

(declare-fun b!1035945 () Bool)

(assert (=> b!1035945 (= e!585719 None!633)))

(declare-fun b!1035944 () Bool)

(assert (=> b!1035944 (= e!585719 (getValueByKey!584 (t!31080 (toList!6896 lt!456807)) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))))))

(declare-fun c!105079 () Bool)

(declare-fun d!124863 () Bool)

(assert (=> d!124863 (= c!105079 (and ((_ is Cons!21888) (toList!6896 lt!456807)) (= (_1!7874 (h!23099 (toList!6896 lt!456807))) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))))))))

(assert (=> d!124863 (= (getValueByKey!584 (toList!6896 lt!456807) (_1!7874 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427)))) e!585718)))

(assert (= (and d!124863 c!105079) b!1035942))

(assert (= (and d!124863 (not c!105079)) b!1035943))

(assert (= (and b!1035943 c!105080) b!1035944))

(assert (= (and b!1035943 (not c!105080)) b!1035945))

(declare-fun m!956653 () Bool)

(assert (=> b!1035944 m!956653))

(assert (=> b!1035106 d!124863))

(assert (=> d!124315 d!124301))

(assert (=> d!124315 d!124319))

(declare-fun d!124865 () Bool)

(assert (=> d!124865 (= (apply!915 (+!3126 lt!456708 (tuple2!15727 lt!456709 (minValue!6062 thiss!1427))) lt!456710) (apply!915 lt!456708 lt!456710))))

(assert (=> d!124865 true))

(declare-fun _$34!1169 () Unit!33837)

(assert (=> d!124865 (= (choose!1701 lt!456708 lt!456709 (minValue!6062 thiss!1427) lt!456710) _$34!1169)))

(declare-fun bs!30290 () Bool)

(assert (= bs!30290 d!124865))

(assert (=> bs!30290 m!955075))

(assert (=> bs!30290 m!955075))

(assert (=> bs!30290 m!955079))

(assert (=> bs!30290 m!955069))

(assert (=> d!124315 d!124865))

(assert (=> d!124315 d!124297))

(declare-fun d!124867 () Bool)

(declare-fun e!585721 () Bool)

(assert (=> d!124867 e!585721))

(declare-fun res!691498 () Bool)

(assert (=> d!124867 (=> res!691498 e!585721)))

(declare-fun lt!457204 () Bool)

(assert (=> d!124867 (= res!691498 (not lt!457204))))

(declare-fun lt!457203 () Bool)

(assert (=> d!124867 (= lt!457204 lt!457203)))

(declare-fun lt!457206 () Unit!33837)

(declare-fun e!585720 () Unit!33837)

(assert (=> d!124867 (= lt!457206 e!585720)))

(declare-fun c!105081 () Bool)

(assert (=> d!124867 (= c!105081 lt!457203)))

(assert (=> d!124867 (= lt!457203 (containsKey!565 (toList!6896 lt!456708) lt!456710))))

(assert (=> d!124867 (= (contains!6037 lt!456708 lt!456710) lt!457204)))

(declare-fun b!1035946 () Bool)

(declare-fun lt!457205 () Unit!33837)

(assert (=> b!1035946 (= e!585720 lt!457205)))

(assert (=> b!1035946 (= lt!457205 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456708) lt!456710))))

(assert (=> b!1035946 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456708) lt!456710))))

(declare-fun b!1035947 () Bool)

(declare-fun Unit!33882 () Unit!33837)

(assert (=> b!1035947 (= e!585720 Unit!33882)))

(declare-fun b!1035948 () Bool)

(assert (=> b!1035948 (= e!585721 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456708) lt!456710)))))

(assert (= (and d!124867 c!105081) b!1035946))

(assert (= (and d!124867 (not c!105081)) b!1035947))

(assert (= (and d!124867 (not res!691498)) b!1035948))

(declare-fun m!956655 () Bool)

(assert (=> d!124867 m!956655))

(declare-fun m!956657 () Bool)

(assert (=> b!1035946 m!956657))

(assert (=> b!1035946 m!955193))

(assert (=> b!1035946 m!955193))

(declare-fun m!956659 () Bool)

(assert (=> b!1035946 m!956659))

(assert (=> b!1035948 m!955193))

(assert (=> b!1035948 m!955193))

(assert (=> b!1035948 m!956659))

(assert (=> d!124315 d!124867))

(declare-fun d!124869 () Bool)

(assert (=> d!124869 (= (get!16465 (select (arr!31370 (_values!6249 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!2013 (defaultEntry!6226 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1035145 d!124869))

(declare-fun d!124871 () Bool)

(declare-fun e!585723 () Bool)

(assert (=> d!124871 e!585723))

(declare-fun res!691499 () Bool)

(assert (=> d!124871 (=> res!691499 e!585723)))

(declare-fun lt!457208 () Bool)

(assert (=> d!124871 (= res!691499 (not lt!457208))))

(declare-fun lt!457207 () Bool)

(assert (=> d!124871 (= lt!457208 lt!457207)))

(declare-fun lt!457210 () Unit!33837)

(declare-fun e!585722 () Unit!33837)

(assert (=> d!124871 (= lt!457210 e!585722)))

(declare-fun c!105082 () Bool)

(assert (=> d!124871 (= c!105082 lt!457207)))

(assert (=> d!124871 (= lt!457207 (containsKey!565 (toList!6896 lt!456767) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124871 (= (contains!6037 lt!456767 (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) lt!457208)))

(declare-fun b!1035949 () Bool)

(declare-fun lt!457209 () Unit!33837)

(assert (=> b!1035949 (= e!585722 lt!457209)))

(assert (=> b!1035949 (= lt!457209 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456767) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1035949 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1035950 () Bool)

(declare-fun Unit!33883 () Unit!33837)

(assert (=> b!1035950 (= e!585722 Unit!33883)))

(declare-fun b!1035951 () Bool)

(assert (=> b!1035951 (= e!585723 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456767) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124871 c!105082) b!1035949))

(assert (= (and d!124871 (not c!105082)) b!1035950))

(assert (= (and d!124871 (not res!691499)) b!1035951))

(assert (=> d!124871 m!955035))

(declare-fun m!956661 () Bool)

(assert (=> d!124871 m!956661))

(assert (=> b!1035949 m!955035))

(declare-fun m!956663 () Bool)

(assert (=> b!1035949 m!956663))

(assert (=> b!1035949 m!955035))

(assert (=> b!1035949 m!956511))

(assert (=> b!1035949 m!956511))

(declare-fun m!956665 () Bool)

(assert (=> b!1035949 m!956665))

(assert (=> b!1035951 m!955035))

(assert (=> b!1035951 m!956511))

(assert (=> b!1035951 m!956511))

(assert (=> b!1035951 m!956665))

(assert (=> b!1035082 d!124871))

(assert (=> b!1035239 d!124785))

(assert (=> b!1035280 d!124723))

(assert (=> b!1035280 d!124725))

(declare-fun d!124873 () Bool)

(assert (=> d!124873 (= (get!16463 (getValueByKey!584 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!456731)) (v!14885 (getValueByKey!584 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!456731)))))

(assert (=> d!124379 d!124873))

(declare-fun e!585724 () Option!635)

(declare-fun b!1035952 () Bool)

(assert (=> b!1035952 (= e!585724 (Some!634 (_2!7874 (h!23099 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))))))))

(declare-fun b!1035953 () Bool)

(declare-fun e!585725 () Option!635)

(assert (=> b!1035953 (= e!585724 e!585725)))

(declare-fun c!105084 () Bool)

(assert (=> b!1035953 (= c!105084 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))) (not (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))) lt!456731))))))

(declare-fun b!1035955 () Bool)

(assert (=> b!1035955 (= e!585725 None!633)))

(declare-fun b!1035954 () Bool)

(assert (=> b!1035954 (= e!585725 (getValueByKey!584 (t!31080 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))) lt!456731))))

(declare-fun c!105083 () Bool)

(declare-fun d!124875 () Bool)

(assert (=> d!124875 (= c!105083 (and ((_ is Cons!21888) (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427))))) (= (_1!7874 (h!23099 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))))) lt!456731)))))

(assert (=> d!124875 (= (getValueByKey!584 (toList!6896 (+!3126 lt!456725 (tuple2!15727 lt!456741 (minValue!6062 thiss!1427)))) lt!456731) e!585724)))

(assert (= (and d!124875 c!105083) b!1035952))

(assert (= (and d!124875 (not c!105083)) b!1035953))

(assert (= (and b!1035953 c!105084) b!1035954))

(assert (= (and b!1035953 (not c!105084)) b!1035955))

(declare-fun m!956667 () Bool)

(assert (=> b!1035954 m!956667))

(assert (=> d!124379 d!124875))

(declare-fun d!124877 () Bool)

(assert (=> d!124877 (= (get!16463 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14885 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124411 d!124877))

(assert (=> d!124411 d!124681))

(assert (=> b!1035200 d!124605))

(assert (=> b!1035163 d!124605))

(declare-fun d!124879 () Bool)

(assert (=> d!124879 (isDefined!434 (getValueByKey!584 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!457211 () Unit!33837)

(assert (=> d!124879 (= lt!457211 (choose!1704 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!585726 () Bool)

(assert (=> d!124879 e!585726))

(declare-fun res!691500 () Bool)

(assert (=> d!124879 (=> (not res!691500) (not e!585726))))

(assert (=> d!124879 (= res!691500 (isStrictlySorted!706 (toList!6896 lt!456742)))))

(assert (=> d!124879 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000) lt!457211)))

(declare-fun b!1035956 () Bool)

(assert (=> b!1035956 (= e!585726 (containsKey!565 (toList!6896 lt!456742) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124879 res!691500) b!1035956))

(assert (=> d!124879 m!955599))

(assert (=> d!124879 m!955599))

(assert (=> d!124879 m!955609))

(declare-fun m!956669 () Bool)

(assert (=> d!124879 m!956669))

(assert (=> d!124879 m!955811))

(assert (=> b!1035956 m!955605))

(assert (=> b!1035275 d!124879))

(assert (=> b!1035275 d!124679))

(assert (=> b!1035275 d!124681))

(declare-fun d!124881 () Bool)

(declare-fun res!691501 () Bool)

(declare-fun e!585727 () Bool)

(assert (=> d!124881 (=> res!691501 e!585727)))

(assert (=> d!124881 (= res!691501 (and ((_ is Cons!21888) (toList!6896 lt!456742)) (= (_1!7874 (h!23099 (toList!6896 lt!456742))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124881 (= (containsKey!565 (toList!6896 lt!456742) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)) e!585727)))

(declare-fun b!1035957 () Bool)

(declare-fun e!585728 () Bool)

(assert (=> b!1035957 (= e!585727 e!585728)))

(declare-fun res!691502 () Bool)

(assert (=> b!1035957 (=> (not res!691502) (not e!585728))))

(assert (=> b!1035957 (= res!691502 (and (or (not ((_ is Cons!21888) (toList!6896 lt!456742))) (bvsle (_1!7874 (h!23099 (toList!6896 lt!456742))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21888) (toList!6896 lt!456742)) (bvslt (_1!7874 (h!23099 (toList!6896 lt!456742))) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1035958 () Bool)

(assert (=> b!1035958 (= e!585728 (containsKey!565 (t!31080 (toList!6896 lt!456742)) (select (arr!31369 (_keys!11444 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124881 (not res!691501)) b!1035957))

(assert (= (and b!1035957 res!691502) b!1035958))

(assert (=> b!1035958 m!955035))

(declare-fun m!956671 () Bool)

(assert (=> b!1035958 m!956671))

(assert (=> d!124343 d!124881))

(declare-fun b!1035959 () Bool)

(declare-fun e!585729 () Option!635)

(assert (=> b!1035959 (= e!585729 (Some!634 (_2!7874 (h!23099 (toList!6896 lt!456909)))))))

(declare-fun b!1035960 () Bool)

(declare-fun e!585730 () Option!635)

(assert (=> b!1035960 (= e!585729 e!585730)))

(declare-fun c!105086 () Bool)

(assert (=> b!1035960 (= c!105086 (and ((_ is Cons!21888) (toList!6896 lt!456909)) (not (= (_1!7874 (h!23099 (toList!6896 lt!456909))) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))))

(declare-fun b!1035962 () Bool)

(assert (=> b!1035962 (= e!585730 None!633)))

(declare-fun b!1035961 () Bool)

(assert (=> b!1035961 (= e!585730 (getValueByKey!584 (t!31080 (toList!6896 lt!456909)) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))))))

(declare-fun d!124883 () Bool)

(declare-fun c!105085 () Bool)

(assert (=> d!124883 (= c!105085 (and ((_ is Cons!21888) (toList!6896 lt!456909)) (= (_1!7874 (h!23099 (toList!6896 lt!456909))) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427))))))))

(assert (=> d!124883 (= (getValueByKey!584 (toList!6896 lt!456909) (_1!7874 (tuple2!15727 lt!456743 (zeroValue!6062 thiss!1427)))) e!585729)))

(assert (= (and d!124883 c!105085) b!1035959))

(assert (= (and d!124883 (not c!105085)) b!1035960))

(assert (= (and b!1035960 c!105086) b!1035961))

(assert (= (and b!1035960 (not c!105086)) b!1035962))

(declare-fun m!956673 () Bool)

(assert (=> b!1035961 m!956673))

(assert (=> b!1035261 d!124883))

(declare-fun condMapEmpty!38269 () Bool)

(declare-fun mapDefault!38269 () ValueCell!11555)

(assert (=> mapNonEmpty!38268 (= condMapEmpty!38269 (= mapRest!38268 ((as const (Array (_ BitVec 32) ValueCell!11555)) mapDefault!38269)))))

(declare-fun e!585731 () Bool)

(declare-fun mapRes!38269 () Bool)

(assert (=> mapNonEmpty!38268 (= tp!73507 (and e!585731 mapRes!38269))))

(declare-fun mapIsEmpty!38269 () Bool)

(assert (=> mapIsEmpty!38269 mapRes!38269))

(declare-fun b!1035963 () Bool)

(declare-fun e!585732 () Bool)

(assert (=> b!1035963 (= e!585732 tp_is_empty!24517)))

(declare-fun b!1035964 () Bool)

(assert (=> b!1035964 (= e!585731 tp_is_empty!24517)))

(declare-fun mapNonEmpty!38269 () Bool)

(declare-fun tp!73508 () Bool)

(assert (=> mapNonEmpty!38269 (= mapRes!38269 (and tp!73508 e!585732))))

(declare-fun mapValue!38269 () ValueCell!11555)

(declare-fun mapRest!38269 () (Array (_ BitVec 32) ValueCell!11555))

(declare-fun mapKey!38269 () (_ BitVec 32))

(assert (=> mapNonEmpty!38269 (= mapRest!38268 (store mapRest!38269 mapKey!38269 mapValue!38269))))

(assert (= (and mapNonEmpty!38268 condMapEmpty!38269) mapIsEmpty!38269))

(assert (= (and mapNonEmpty!38268 (not condMapEmpty!38269)) mapNonEmpty!38269))

(assert (= (and mapNonEmpty!38269 ((_ is ValueCellFull!11555) mapValue!38269)) b!1035963))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11555) mapDefault!38269)) b!1035964))

(declare-fun m!956675 () Bool)

(assert (=> mapNonEmpty!38269 m!956675))

(declare-fun b_lambda!16101 () Bool)

(assert (= b_lambda!16091 (or (and b!1034889 b_free!20797) b_lambda!16101)))

(declare-fun b_lambda!16103 () Bool)

(assert (= b_lambda!16099 (or (and b!1034889 b_free!20797) b_lambda!16103)))

(declare-fun b_lambda!16105 () Bool)

(assert (= b_lambda!16075 (or (and b!1034889 b_free!20797 (= (defaultEntry!6226 thiss!1427) (defaultEntry!6226 lt!456630))) b_lambda!16105)))

(declare-fun b_lambda!16107 () Bool)

(assert (= b_lambda!16097 (or (and b!1034889 b_free!20797) b_lambda!16107)))

(declare-fun b_lambda!16109 () Bool)

(assert (= b_lambda!16089 (or (and b!1034889 b_free!20797) b_lambda!16109)))

(check-sat (not b!1035895) (not b!1035536) (not b!1035449) (not b!1035640) (not d!124735) (not b_lambda!16105) (not b!1035785) (not d!124555) (not b!1035581) (not d!124709) (not b!1035851) (not b!1035601) (not b!1035659) (not d!124601) (not b!1035824) (not b!1035683) (not d!124423) (not b!1035839) (not b!1035366) (not b!1035713) (not b!1035343) (not b_lambda!16101) (not d!124509) (not b!1035831) (not d!124457) (not b!1035504) (not bm!43783) (not d!124497) (not b!1035310) (not d!124783) (not d!124531) (not d!124639) (not d!124561) (not b!1035811) (not b!1035738) (not b!1035935) (not b!1035880) (not b!1035448) (not b!1035949) (not b!1035621) (not d!124519) (not b!1035385) (not d!124435) (not d!124795) (not b!1035727) (not b!1035697) (not b!1035436) (not d!124837) (not b!1035729) (not b!1035929) (not b!1035575) (not bm!43766) (not b!1035752) (not b!1035882) (not b!1035535) (not d!124551) (not b!1035638) (not d!124733) (not b!1035376) (not d!124815) (not b!1035667) (not b!1035369) (not b_lambda!16095) (not b!1035673) (not b!1035693) (not b!1035620) (not b!1035778) (not d!124669) (not bm!43796) (not b!1035749) (not bm!43795) (not b!1035409) (not b!1035725) (not b!1035861) (not d!124543) (not d!124753) (not d!124517) (not b!1035691) (not bm!43792) (not d!124643) (not b!1035425) (not b!1035431) (not b!1035406) (not d!124611) (not b!1035774) (not d!124755) (not d!124731) (not b!1035657) (not d!124797) (not d!124431) (not b!1035933) (not b!1035414) (not d!124759) (not b!1035665) (not b!1035948) (not b!1035360) (not b!1035300) (not b!1035714) (not b!1035331) (not d!124631) (not b!1035530) (not b!1035846) (not b!1035915) (not d!124859) (not b!1035624) (not b!1035533) (not b!1035750) (not bm!43776) (not b!1035577) (not b!1035539) (not b!1035757) (not b!1035918) (not b!1035660) (not d!124495) (not b!1035892) (not b!1035932) (not d!124827) (not b!1035734) (not b!1035797) (not b!1035670) (not b!1035297) (not d!124757) (not bm!43788) (not b!1035502) (not d!124871) (not d!124721) (not b!1035596) (not d!124767) (not d!124587) (not b!1035450) (not b!1035645) (not b!1035793) (not b!1035515) (not d!124801) (not b!1035397) (not b!1035885) (not d!124691) (not b!1035617) (not b!1035452) (not b!1035924) (not b!1035298) (not b!1035808) (not b!1035936) (not b!1035681) (not b!1035893) (not b!1035695) (not b!1035759) (not d!124515) (not b!1035412) (not b!1035546) (not b!1035416) (not d!124553) (not d!124717) (not mapNonEmpty!38269) (not b!1035336) (not b!1035500) (not b!1035873) (not d!124613) (not b!1035415) (not d!124675) (not b!1035303) (not b!1035782) (not b!1035902) (not b!1035741) (not bm!43781) (not d!124487) (not b!1035522) (not b!1035735) (not d!124499) (not b!1035649) (not b!1035800) (not d!124737) (not d!124861) (not b!1035391) (not b!1035941) (not b!1035871) (not b!1035413) (not b_lambda!16083) (not b!1035795) (not b!1035869) (not d!124729) (not d!124821) (not d!124789) (not b!1035553) (not d!124449) (not d!124865) (not d!124635) (not b!1035685) (not d!124803) (not b!1035498) (not b!1035951) (not b!1035543) (not bm!43775) (not bm!43799) (not d!124463) (not b!1035806) (not d!124819) (not b!1035563) (not b!1035662) (not b!1035791) (not b!1035386) (not bm!43778) (not b!1035439) (not b!1035434) (not b!1035643) (not d!124715) (not d!124693) (not b!1035513) (not b!1035866) (not b!1035719) (not d!124465) (not b!1035784) (not d!124765) (not b!1035858) (not b!1035384) (not b!1035509) (not b!1035514) (not b!1035842) (not b!1035845) (not b!1035612) (not d!124485) (not b!1035511) (not d!124727) (not b!1035428) (not b!1035510) (not bm!43784) (not b!1035512) (not b!1035710) (not b!1035764) (not b!1035721) (not d!124849) (not d!124771) (not b!1035527) (not b!1035912) (not b!1035524) (not d!124437) (not d!124703) (not d!124455) (not b!1035421) (not d!124585) (not b!1035429) (not d!124823) (not b_lambda!16061) (not b!1035878) (not b!1035402) (not d!124483) (not b!1035443) (not b!1035837) (not d!124507) (not bm!43782) (not b!1035628) (not b!1035938) (not b!1035333) (not b!1035587) (not b!1035374) (not d!124867) (not b!1035583) (not b!1035676) (not b!1035632) (not b!1035652) (not b!1035606) (not b!1035559) (not b!1035355) (not b!1035647) (not b!1035432) (not d!124471) (not b!1035362) (not d!124523) (not b!1035528) (not b!1035295) (not d!124787) (not d!124491) (not d!124525) (not d!124879) (not d!124761) (not b!1035890) (not bm!43772) (not d!124847) (not d!124477) (not b!1035944) (not b!1035705) (not d!124599) (not b!1035584) (not d!124839) (not d!124445) (not b!1035818) (not b!1035835) (not b!1035770) (not d!124593) (not d!124697) (not b!1035363) (not b!1035755) (not b!1035481) (not d!124447) (not d!124533) (not d!124677) (not b!1035786) (not b!1035556) (not d!124649) (not b!1035417) (not d!124545) (not d!124529) (not b!1035863) (not b!1035382) (not b_lambda!16109) (not d!124841) (not d!124695) (not b!1035309) (not b_lambda!16087) (not b!1035598) (not d!124441) (not d!124843) (not b!1035377) (not b!1035788) (not b!1035844) (not d!124743) (not b_lambda!16093) (not b_lambda!16103) (not b!1035724) (not b!1035876) (not d!124451) (not b!1035776) (not b!1035571) (not d!124791) (not bm!43769) (not d!124521) (not d!124565) (not b!1035506) (not b!1035664) (not b!1035461) (not b!1035954) (not b!1035769) (not d!124855) (not d!124425) b_and!33311 (not d!124637) (not b!1035446) (not d!124851) (not b!1035899) (not b!1035523) (not d!124537) (not d!124535) (not b!1035758) (not d!124547) (not b!1035379) (not d!124699) (not b!1035503) (not b!1035826) (not b!1035848) (not b_next!20797) (not b!1035780) (not b!1035904) (not b!1035293) (not d!124651) (not b!1035810) (not b_lambda!16107) (not b!1035761) (not b!1035794) (not b!1035700) (not d!124617) (not b!1035909) (not d!124741) (not bm!43777) (not bm!43808) (not b!1035913) (not d!124647) (not b!1035357) (not b_lambda!16069) (not d!124745) (not b!1035833) (not b_lambda!16067) (not b!1035611) (not b!1035435) (not d!124713) (not d!124673) (not b!1035694) (not b!1035353) (not b!1035505) (not d!124575) (not b!1035455) (not d!124539) (not b!1035467) (not b!1035538) (not b!1035720) (not d!124541) (not b!1035771) (not bm!43805) (not b!1035350) (not d!124429) (not b!1035567) (not d!124473) (not b!1035475) (not b!1035609) (not b!1035736) (not b!1035857) (not bm!43785) (not b!1035537) (not b!1035579) (not bm!43802) (not b!1035473) (not b!1035388) (not b!1035519) (not b!1035906) (not b!1035686) (not b_lambda!16085) (not b!1035821) (not b!1035828) (not b!1035813) (not bm!43789) (not b!1035399) (not d!124857) (not b!1035636) (not d!124799) (not d!124615) (not b_lambda!16081) (not d!124685) (not b!1035815) (not b!1035956) (not b!1035717) (not b!1035549) (not b!1035958) (not b!1035707) (not b!1035525) (not b!1035816) (not b!1035723) (not b!1035939) (not b!1035534) (not d!124705) (not d!124527) (not d!124641) (not b!1035911) (not b!1035864) (not b!1035961) (not b!1035619) (not b!1035732) (not d!124833) (not b!1035411) (not b!1035879) (not b!1035679) (not d!124809) (not b!1035946) tp_is_empty!24517 (not d!124513) (not d!124679) (not b!1035646) (not b!1035364) (not b!1035836) (not b!1035688) (not b!1035441) (not b!1035593) (not d!124723))
(check-sat b_and!33311 (not b_next!20797))
