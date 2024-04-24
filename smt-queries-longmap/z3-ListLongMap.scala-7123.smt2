; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90516 () Bool)

(assert start!90516)

(declare-fun b!1034766 () Bool)

(declare-fun b_free!20791 () Bool)

(declare-fun b_next!20791 () Bool)

(assert (=> b!1034766 (= b_free!20791 (not b_next!20791))))

(declare-fun tp!73469 () Bool)

(declare-fun b_and!33269 () Bool)

(assert (=> b!1034766 (= tp!73469 b_and!33269)))

(declare-fun b!1034764 () Bool)

(declare-fun e!584978 () Bool)

(declare-fun tp_is_empty!24511 () Bool)

(assert (=> b!1034764 (= e!584978 tp_is_empty!24511)))

(declare-fun b!1034765 () Bool)

(declare-fun e!584980 () Bool)

(assert (=> b!1034765 (= e!584980 tp_is_empty!24511)))

(declare-fun e!584976 () Bool)

(declare-fun e!584975 () Bool)

(declare-datatypes ((V!37555 0))(
  ( (V!37556 (val!12306 Int)) )
))
(declare-datatypes ((ValueCell!11552 0))(
  ( (ValueCellFull!11552 (v!14879 V!37555)) (EmptyCell!11552) )
))
(declare-datatypes ((array!65149 0))(
  ( (array!65150 (arr!31363 (Array (_ BitVec 32) (_ BitVec 64))) (size!31886 (_ BitVec 32))) )
))
(declare-datatypes ((array!65151 0))(
  ( (array!65152 (arr!31364 (Array (_ BitVec 32) ValueCell!11552)) (size!31887 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5698 0))(
  ( (LongMapFixedSize!5699 (defaultEntry!6223 Int) (mask!30136 (_ BitVec 32)) (extraKeys!5955 (_ BitVec 32)) (zeroValue!6059 V!37555) (minValue!6059 V!37555) (_size!2904 (_ BitVec 32)) (_keys!11440 array!65149) (_values!6246 array!65151) (_vacant!2904 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5698)

(declare-fun array_inv!24273 (array!65149) Bool)

(declare-fun array_inv!24274 (array!65151) Bool)

(assert (=> b!1034766 (= e!584975 (and tp!73469 tp_is_empty!24511 (array_inv!24273 (_keys!11440 thiss!1427)) (array_inv!24274 (_values!6246 thiss!1427)) e!584976))))

(declare-fun res!691025 () Bool)

(declare-fun e!584977 () Bool)

(assert (=> start!90516 (=> (not res!691025) (not e!584977))))

(declare-fun valid!2160 (LongMapFixedSize!5698) Bool)

(assert (=> start!90516 (= res!691025 (valid!2160 thiss!1427))))

(assert (=> start!90516 e!584977))

(assert (=> start!90516 e!584975))

(assert (=> start!90516 true))

(declare-fun mapNonEmpty!38246 () Bool)

(declare-fun mapRes!38246 () Bool)

(declare-fun tp!73470 () Bool)

(assert (=> mapNonEmpty!38246 (= mapRes!38246 (and tp!73470 e!584978))))

(declare-fun mapRest!38246 () (Array (_ BitVec 32) ValueCell!11552))

(declare-fun mapValue!38246 () ValueCell!11552)

(declare-fun mapKey!38246 () (_ BitVec 32))

(assert (=> mapNonEmpty!38246 (= (arr!31364 (_values!6246 thiss!1427)) (store mapRest!38246 mapKey!38246 mapValue!38246))))

(declare-fun b!1034767 () Bool)

(declare-fun res!691021 () Bool)

(assert (=> b!1034767 (=> (not res!691021) (not e!584977))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65149 (_ BitVec 32)) Bool)

(assert (=> b!1034767 (= res!691021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11440 thiss!1427) (mask!30136 thiss!1427)))))

(declare-fun b!1034768 () Bool)

(declare-datatypes ((List!21889 0))(
  ( (Nil!21886) (Cons!21885 (h!23096 (_ BitVec 64)) (t!31075 List!21889)) )
))
(declare-fun arrayNoDuplicates!0 (array!65149 (_ BitVec 32) List!21889) Bool)

(assert (=> b!1034768 (= e!584977 (not (arrayNoDuplicates!0 (_keys!11440 thiss!1427) #b00000000000000000000000000000000 Nil!21886)))))

(declare-fun b!1034769 () Bool)

(assert (=> b!1034769 (= e!584976 (and e!584980 mapRes!38246))))

(declare-fun condMapEmpty!38246 () Bool)

(declare-fun mapDefault!38246 () ValueCell!11552)

(assert (=> b!1034769 (= condMapEmpty!38246 (= (arr!31364 (_values!6246 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11552)) mapDefault!38246)))))

(declare-fun b!1034770 () Bool)

(declare-fun res!691022 () Bool)

(assert (=> b!1034770 (=> (not res!691022) (not e!584977))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034770 (= res!691022 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!38246 () Bool)

(assert (=> mapIsEmpty!38246 mapRes!38246))

(declare-fun b!1034771 () Bool)

(declare-fun res!691024 () Bool)

(assert (=> b!1034771 (=> (not res!691024) (not e!584977))))

(assert (=> b!1034771 (= res!691024 (and (= (size!31887 (_values!6246 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30136 thiss!1427))) (= (size!31886 (_keys!11440 thiss!1427)) (size!31887 (_values!6246 thiss!1427))) (bvsge (mask!30136 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5955 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5955 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5955 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1034772 () Bool)

(declare-fun res!691023 () Bool)

(assert (=> b!1034772 (=> (not res!691023) (not e!584977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034772 (= res!691023 (validMask!0 (mask!30136 thiss!1427)))))

(assert (= (and start!90516 res!691025) b!1034770))

(assert (= (and b!1034770 res!691022) b!1034772))

(assert (= (and b!1034772 res!691023) b!1034771))

(assert (= (and b!1034771 res!691024) b!1034767))

(assert (= (and b!1034767 res!691021) b!1034768))

(assert (= (and b!1034769 condMapEmpty!38246) mapIsEmpty!38246))

(assert (= (and b!1034769 (not condMapEmpty!38246)) mapNonEmpty!38246))

(get-info :version)

(assert (= (and mapNonEmpty!38246 ((_ is ValueCellFull!11552) mapValue!38246)) b!1034764))

(assert (= (and b!1034769 ((_ is ValueCellFull!11552) mapDefault!38246)) b!1034765))

(assert (= b!1034766 b!1034769))

(assert (= start!90516 b!1034766))

(declare-fun m!954867 () Bool)

(assert (=> start!90516 m!954867))

(declare-fun m!954869 () Bool)

(assert (=> b!1034766 m!954869))

(declare-fun m!954871 () Bool)

(assert (=> b!1034766 m!954871))

(declare-fun m!954873 () Bool)

(assert (=> mapNonEmpty!38246 m!954873))

(declare-fun m!954875 () Bool)

(assert (=> b!1034772 m!954875))

(declare-fun m!954877 () Bool)

(assert (=> b!1034767 m!954877))

(declare-fun m!954879 () Bool)

(assert (=> b!1034768 m!954879))

(check-sat (not b!1034767) (not b!1034772) (not mapNonEmpty!38246) tp_is_empty!24511 (not b!1034768) b_and!33269 (not start!90516) (not b_next!20791) (not b!1034766))
(check-sat b_and!33269 (not b_next!20791))
(get-model)

(declare-fun b!1034835 () Bool)

(declare-fun e!585025 () Bool)

(declare-fun call!43708 () Bool)

(assert (=> b!1034835 (= e!585025 call!43708)))

(declare-fun d!124253 () Bool)

(declare-fun res!691061 () Bool)

(declare-fun e!585023 () Bool)

(assert (=> d!124253 (=> res!691061 e!585023)))

(assert (=> d!124253 (= res!691061 (bvsge #b00000000000000000000000000000000 (size!31886 (_keys!11440 thiss!1427))))))

(assert (=> d!124253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11440 thiss!1427) (mask!30136 thiss!1427)) e!585023)))

(declare-fun b!1034836 () Bool)

(assert (=> b!1034836 (= e!585023 e!585025)))

(declare-fun c!104777 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034836 (= c!104777 (validKeyInArray!0 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034837 () Bool)

(declare-fun e!585024 () Bool)

(assert (=> b!1034837 (= e!585025 e!585024)))

(declare-fun lt!456622 () (_ BitVec 64))

(assert (=> b!1034837 (= lt!456622 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33835 0))(
  ( (Unit!33836) )
))
(declare-fun lt!456620 () Unit!33835)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65149 (_ BitVec 64) (_ BitVec 32)) Unit!33835)

(assert (=> b!1034837 (= lt!456620 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11440 thiss!1427) lt!456622 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034837 (arrayContainsKey!0 (_keys!11440 thiss!1427) lt!456622 #b00000000000000000000000000000000)))

(declare-fun lt!456621 () Unit!33835)

(assert (=> b!1034837 (= lt!456621 lt!456620)))

(declare-fun res!691060 () Bool)

(declare-datatypes ((SeekEntryResult!9694 0))(
  ( (MissingZero!9694 (index!41147 (_ BitVec 32))) (Found!9694 (index!41148 (_ BitVec 32))) (Intermediate!9694 (undefined!10506 Bool) (index!41149 (_ BitVec 32)) (x!92162 (_ BitVec 32))) (Undefined!9694) (MissingVacant!9694 (index!41150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65149 (_ BitVec 32)) SeekEntryResult!9694)

(assert (=> b!1034837 (= res!691060 (= (seekEntryOrOpen!0 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000) (_keys!11440 thiss!1427) (mask!30136 thiss!1427)) (Found!9694 #b00000000000000000000000000000000)))))

(assert (=> b!1034837 (=> (not res!691060) (not e!585024))))

(declare-fun b!1034838 () Bool)

(assert (=> b!1034838 (= e!585024 call!43708)))

(declare-fun bm!43705 () Bool)

(assert (=> bm!43705 (= call!43708 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11440 thiss!1427) (mask!30136 thiss!1427)))))

(assert (= (and d!124253 (not res!691061)) b!1034836))

(assert (= (and b!1034836 c!104777) b!1034837))

(assert (= (and b!1034836 (not c!104777)) b!1034835))

(assert (= (and b!1034837 res!691060) b!1034838))

(assert (= (or b!1034838 b!1034835) bm!43705))

(declare-fun m!954909 () Bool)

(assert (=> b!1034836 m!954909))

(assert (=> b!1034836 m!954909))

(declare-fun m!954911 () Bool)

(assert (=> b!1034836 m!954911))

(assert (=> b!1034837 m!954909))

(declare-fun m!954913 () Bool)

(assert (=> b!1034837 m!954913))

(declare-fun m!954915 () Bool)

(assert (=> b!1034837 m!954915))

(assert (=> b!1034837 m!954909))

(declare-fun m!954917 () Bool)

(assert (=> b!1034837 m!954917))

(declare-fun m!954919 () Bool)

(assert (=> bm!43705 m!954919))

(assert (=> b!1034767 d!124253))

(declare-fun d!124255 () Bool)

(assert (=> d!124255 (= (validMask!0 (mask!30136 thiss!1427)) (and (or (= (mask!30136 thiss!1427) #b00000000000000000000000000000111) (= (mask!30136 thiss!1427) #b00000000000000000000000000001111) (= (mask!30136 thiss!1427) #b00000000000000000000000000011111) (= (mask!30136 thiss!1427) #b00000000000000000000000000111111) (= (mask!30136 thiss!1427) #b00000000000000000000000001111111) (= (mask!30136 thiss!1427) #b00000000000000000000000011111111) (= (mask!30136 thiss!1427) #b00000000000000000000000111111111) (= (mask!30136 thiss!1427) #b00000000000000000000001111111111) (= (mask!30136 thiss!1427) #b00000000000000000000011111111111) (= (mask!30136 thiss!1427) #b00000000000000000000111111111111) (= (mask!30136 thiss!1427) #b00000000000000000001111111111111) (= (mask!30136 thiss!1427) #b00000000000000000011111111111111) (= (mask!30136 thiss!1427) #b00000000000000000111111111111111) (= (mask!30136 thiss!1427) #b00000000000000001111111111111111) (= (mask!30136 thiss!1427) #b00000000000000011111111111111111) (= (mask!30136 thiss!1427) #b00000000000000111111111111111111) (= (mask!30136 thiss!1427) #b00000000000001111111111111111111) (= (mask!30136 thiss!1427) #b00000000000011111111111111111111) (= (mask!30136 thiss!1427) #b00000000000111111111111111111111) (= (mask!30136 thiss!1427) #b00000000001111111111111111111111) (= (mask!30136 thiss!1427) #b00000000011111111111111111111111) (= (mask!30136 thiss!1427) #b00000000111111111111111111111111) (= (mask!30136 thiss!1427) #b00000001111111111111111111111111) (= (mask!30136 thiss!1427) #b00000011111111111111111111111111) (= (mask!30136 thiss!1427) #b00000111111111111111111111111111) (= (mask!30136 thiss!1427) #b00001111111111111111111111111111) (= (mask!30136 thiss!1427) #b00011111111111111111111111111111) (= (mask!30136 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30136 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034772 d!124255))

(declare-fun b!1034849 () Bool)

(declare-fun e!585034 () Bool)

(declare-fun e!585036 () Bool)

(assert (=> b!1034849 (= e!585034 e!585036)))

(declare-fun c!104780 () Bool)

(assert (=> b!1034849 (= c!104780 (validKeyInArray!0 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034850 () Bool)

(declare-fun e!585037 () Bool)

(declare-fun contains!6036 (List!21889 (_ BitVec 64)) Bool)

(assert (=> b!1034850 (= e!585037 (contains!6036 Nil!21886 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43708 () Bool)

(declare-fun call!43711 () Bool)

(assert (=> bm!43708 (= call!43711 (arrayNoDuplicates!0 (_keys!11440 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104780 (Cons!21885 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000) Nil!21886) Nil!21886)))))

(declare-fun b!1034851 () Bool)

(assert (=> b!1034851 (= e!585036 call!43711)))

(declare-fun b!1034852 () Bool)

(declare-fun e!585035 () Bool)

(assert (=> b!1034852 (= e!585035 e!585034)))

(declare-fun res!691069 () Bool)

(assert (=> b!1034852 (=> (not res!691069) (not e!585034))))

(assert (=> b!1034852 (= res!691069 (not e!585037))))

(declare-fun res!691070 () Bool)

(assert (=> b!1034852 (=> (not res!691070) (not e!585037))))

(assert (=> b!1034852 (= res!691070 (validKeyInArray!0 (select (arr!31363 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124257 () Bool)

(declare-fun res!691068 () Bool)

(assert (=> d!124257 (=> res!691068 e!585035)))

(assert (=> d!124257 (= res!691068 (bvsge #b00000000000000000000000000000000 (size!31886 (_keys!11440 thiss!1427))))))

(assert (=> d!124257 (= (arrayNoDuplicates!0 (_keys!11440 thiss!1427) #b00000000000000000000000000000000 Nil!21886) e!585035)))

(declare-fun b!1034853 () Bool)

(assert (=> b!1034853 (= e!585036 call!43711)))

(assert (= (and d!124257 (not res!691068)) b!1034852))

(assert (= (and b!1034852 res!691070) b!1034850))

(assert (= (and b!1034852 res!691069) b!1034849))

(assert (= (and b!1034849 c!104780) b!1034853))

(assert (= (and b!1034849 (not c!104780)) b!1034851))

(assert (= (or b!1034853 b!1034851) bm!43708))

(assert (=> b!1034849 m!954909))

(assert (=> b!1034849 m!954909))

(assert (=> b!1034849 m!954911))

(assert (=> b!1034850 m!954909))

(assert (=> b!1034850 m!954909))

(declare-fun m!954921 () Bool)

(assert (=> b!1034850 m!954921))

(assert (=> bm!43708 m!954909))

(declare-fun m!954923 () Bool)

(assert (=> bm!43708 m!954923))

(assert (=> b!1034852 m!954909))

(assert (=> b!1034852 m!954909))

(assert (=> b!1034852 m!954911))

(assert (=> b!1034768 d!124257))

(declare-fun d!124259 () Bool)

(assert (=> d!124259 (= (array_inv!24273 (_keys!11440 thiss!1427)) (bvsge (size!31886 (_keys!11440 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034766 d!124259))

(declare-fun d!124261 () Bool)

(assert (=> d!124261 (= (array_inv!24274 (_values!6246 thiss!1427)) (bvsge (size!31887 (_values!6246 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034766 d!124261))

(declare-fun d!124263 () Bool)

(declare-fun res!691077 () Bool)

(declare-fun e!585040 () Bool)

(assert (=> d!124263 (=> (not res!691077) (not e!585040))))

(declare-fun simpleValid!404 (LongMapFixedSize!5698) Bool)

(assert (=> d!124263 (= res!691077 (simpleValid!404 thiss!1427))))

(assert (=> d!124263 (= (valid!2160 thiss!1427) e!585040)))

(declare-fun b!1034860 () Bool)

(declare-fun res!691078 () Bool)

(assert (=> b!1034860 (=> (not res!691078) (not e!585040))))

(declare-fun arrayCountValidKeys!0 (array!65149 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034860 (= res!691078 (= (arrayCountValidKeys!0 (_keys!11440 thiss!1427) #b00000000000000000000000000000000 (size!31886 (_keys!11440 thiss!1427))) (_size!2904 thiss!1427)))))

(declare-fun b!1034861 () Bool)

(declare-fun res!691079 () Bool)

(assert (=> b!1034861 (=> (not res!691079) (not e!585040))))

(assert (=> b!1034861 (= res!691079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11440 thiss!1427) (mask!30136 thiss!1427)))))

(declare-fun b!1034862 () Bool)

(assert (=> b!1034862 (= e!585040 (arrayNoDuplicates!0 (_keys!11440 thiss!1427) #b00000000000000000000000000000000 Nil!21886))))

(assert (= (and d!124263 res!691077) b!1034860))

(assert (= (and b!1034860 res!691078) b!1034861))

(assert (= (and b!1034861 res!691079) b!1034862))

(declare-fun m!954925 () Bool)

(assert (=> d!124263 m!954925))

(declare-fun m!954927 () Bool)

(assert (=> b!1034860 m!954927))

(assert (=> b!1034861 m!954877))

(assert (=> b!1034862 m!954879))

(assert (=> start!90516 d!124263))

(declare-fun b!1034870 () Bool)

(declare-fun e!585046 () Bool)

(assert (=> b!1034870 (= e!585046 tp_is_empty!24511)))

(declare-fun mapNonEmpty!38255 () Bool)

(declare-fun mapRes!38255 () Bool)

(declare-fun tp!73485 () Bool)

(declare-fun e!585045 () Bool)

(assert (=> mapNonEmpty!38255 (= mapRes!38255 (and tp!73485 e!585045))))

(declare-fun mapKey!38255 () (_ BitVec 32))

(declare-fun mapRest!38255 () (Array (_ BitVec 32) ValueCell!11552))

(declare-fun mapValue!38255 () ValueCell!11552)

(assert (=> mapNonEmpty!38255 (= mapRest!38246 (store mapRest!38255 mapKey!38255 mapValue!38255))))

(declare-fun b!1034869 () Bool)

(assert (=> b!1034869 (= e!585045 tp_is_empty!24511)))

(declare-fun condMapEmpty!38255 () Bool)

(declare-fun mapDefault!38255 () ValueCell!11552)

(assert (=> mapNonEmpty!38246 (= condMapEmpty!38255 (= mapRest!38246 ((as const (Array (_ BitVec 32) ValueCell!11552)) mapDefault!38255)))))

(assert (=> mapNonEmpty!38246 (= tp!73470 (and e!585046 mapRes!38255))))

(declare-fun mapIsEmpty!38255 () Bool)

(assert (=> mapIsEmpty!38255 mapRes!38255))

(assert (= (and mapNonEmpty!38246 condMapEmpty!38255) mapIsEmpty!38255))

(assert (= (and mapNonEmpty!38246 (not condMapEmpty!38255)) mapNonEmpty!38255))

(assert (= (and mapNonEmpty!38255 ((_ is ValueCellFull!11552) mapValue!38255)) b!1034869))

(assert (= (and mapNonEmpty!38246 ((_ is ValueCellFull!11552) mapDefault!38255)) b!1034870))

(declare-fun m!954929 () Bool)

(assert (=> mapNonEmpty!38255 m!954929))

(check-sat (not b!1034860) (not b!1034850) (not d!124263) (not mapNonEmpty!38255) (not b!1034837) (not b!1034862) (not b!1034861) (not b_next!20791) b_and!33269 (not bm!43705) tp_is_empty!24511 (not b!1034849) (not bm!43708) (not b!1034852) (not b!1034836))
(check-sat b_and!33269 (not b_next!20791))
