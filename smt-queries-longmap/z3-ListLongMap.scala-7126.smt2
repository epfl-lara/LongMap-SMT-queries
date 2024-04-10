; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90416 () Bool)

(assert start!90416)

(declare-fun b!1034814 () Bool)

(declare-fun b_free!20811 () Bool)

(declare-fun b_next!20811 () Bool)

(assert (=> b!1034814 (= b_free!20811 (not b_next!20811))))

(declare-fun tp!73541 () Bool)

(declare-fun b_and!33311 () Bool)

(assert (=> b!1034814 (= tp!73541 b_and!33311)))

(declare-fun mapNonEmpty!38288 () Bool)

(declare-fun mapRes!38288 () Bool)

(declare-fun tp!73542 () Bool)

(declare-fun e!585020 () Bool)

(assert (=> mapNonEmpty!38288 (= mapRes!38288 (and tp!73542 e!585020))))

(declare-fun mapKey!38288 () (_ BitVec 32))

(declare-datatypes ((V!37581 0))(
  ( (V!37582 (val!12316 Int)) )
))
(declare-datatypes ((ValueCell!11562 0))(
  ( (ValueCellFull!11562 (v!14896 V!37581)) (EmptyCell!11562) )
))
(declare-fun mapRest!38288 () (Array (_ BitVec 32) ValueCell!11562))

(declare-datatypes ((array!65146 0))(
  ( (array!65147 (arr!31365 (Array (_ BitVec 32) (_ BitVec 64))) (size!31889 (_ BitVec 32))) )
))
(declare-datatypes ((array!65148 0))(
  ( (array!65149 (arr!31366 (Array (_ BitVec 32) ValueCell!11562)) (size!31890 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5718 0))(
  ( (LongMapFixedSize!5719 (defaultEntry!6237 Int) (mask!30103 (_ BitVec 32)) (extraKeys!5967 (_ BitVec 32)) (zeroValue!6071 V!37581) (minValue!6073 V!37581) (_size!2914 (_ BitVec 32)) (_keys!11420 array!65146) (_values!6260 array!65148) (_vacant!2914 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5718)

(declare-fun mapValue!38288 () ValueCell!11562)

(assert (=> mapNonEmpty!38288 (= (arr!31366 (_values!6260 thiss!1427)) (store mapRest!38288 mapKey!38288 mapValue!38288))))

(declare-fun mapIsEmpty!38288 () Bool)

(assert (=> mapIsEmpty!38288 mapRes!38288))

(declare-fun b!1034809 () Bool)

(declare-fun e!585019 () Bool)

(declare-fun tp_is_empty!24531 () Bool)

(assert (=> b!1034809 (= e!585019 tp_is_empty!24531)))

(declare-fun b!1034810 () Bool)

(declare-fun res!691062 () Bool)

(declare-fun e!585017 () Bool)

(assert (=> b!1034810 (=> (not res!691062) (not e!585017))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034810 (= res!691062 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034812 () Bool)

(assert (=> b!1034812 (= e!585020 tp_is_empty!24531)))

(declare-fun b!1034813 () Bool)

(declare-fun res!691064 () Bool)

(assert (=> b!1034813 (=> (not res!691064) (not e!585017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034813 (= res!691064 (validMask!0 (mask!30103 thiss!1427)))))

(declare-fun e!585018 () Bool)

(declare-fun e!585016 () Bool)

(declare-fun array_inv!24261 (array!65146) Bool)

(declare-fun array_inv!24262 (array!65148) Bool)

(assert (=> b!1034814 (= e!585018 (and tp!73541 tp_is_empty!24531 (array_inv!24261 (_keys!11420 thiss!1427)) (array_inv!24262 (_values!6260 thiss!1427)) e!585016))))

(declare-fun b!1034815 () Bool)

(assert (=> b!1034815 (= e!585017 (not (= (size!31890 (_values!6260 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30103 thiss!1427)))))))

(declare-fun res!691063 () Bool)

(assert (=> start!90416 (=> (not res!691063) (not e!585017))))

(declare-fun valid!2160 (LongMapFixedSize!5718) Bool)

(assert (=> start!90416 (= res!691063 (valid!2160 thiss!1427))))

(assert (=> start!90416 e!585017))

(assert (=> start!90416 e!585018))

(assert (=> start!90416 true))

(declare-fun b!1034811 () Bool)

(assert (=> b!1034811 (= e!585016 (and e!585019 mapRes!38288))))

(declare-fun condMapEmpty!38288 () Bool)

(declare-fun mapDefault!38288 () ValueCell!11562)

(assert (=> b!1034811 (= condMapEmpty!38288 (= (arr!31366 (_values!6260 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11562)) mapDefault!38288)))))

(assert (= (and start!90416 res!691063) b!1034810))

(assert (= (and b!1034810 res!691062) b!1034813))

(assert (= (and b!1034813 res!691064) b!1034815))

(assert (= (and b!1034811 condMapEmpty!38288) mapIsEmpty!38288))

(assert (= (and b!1034811 (not condMapEmpty!38288)) mapNonEmpty!38288))

(get-info :version)

(assert (= (and mapNonEmpty!38288 ((_ is ValueCellFull!11562) mapValue!38288)) b!1034812))

(assert (= (and b!1034811 ((_ is ValueCellFull!11562) mapDefault!38288)) b!1034809))

(assert (= b!1034814 b!1034811))

(assert (= start!90416 b!1034814))

(declare-fun m!955085 () Bool)

(assert (=> mapNonEmpty!38288 m!955085))

(declare-fun m!955087 () Bool)

(assert (=> b!1034813 m!955087))

(declare-fun m!955089 () Bool)

(assert (=> b!1034814 m!955089))

(declare-fun m!955091 () Bool)

(assert (=> b!1034814 m!955091))

(declare-fun m!955093 () Bool)

(assert (=> start!90416 m!955093))

(check-sat (not b!1034814) (not mapNonEmpty!38288) b_and!33311 (not b!1034813) (not start!90416) tp_is_empty!24531 (not b_next!20811))
(check-sat b_and!33311 (not b_next!20811))
(get-model)

(declare-fun d!124443 () Bool)

(declare-fun res!691080 () Bool)

(declare-fun e!585041 () Bool)

(assert (=> d!124443 (=> (not res!691080) (not e!585041))))

(declare-fun simpleValid!407 (LongMapFixedSize!5718) Bool)

(assert (=> d!124443 (= res!691080 (simpleValid!407 thiss!1427))))

(assert (=> d!124443 (= (valid!2160 thiss!1427) e!585041)))

(declare-fun b!1034843 () Bool)

(declare-fun res!691081 () Bool)

(assert (=> b!1034843 (=> (not res!691081) (not e!585041))))

(declare-fun arrayCountValidKeys!0 (array!65146 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034843 (= res!691081 (= (arrayCountValidKeys!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))) (_size!2914 thiss!1427)))))

(declare-fun b!1034844 () Bool)

(declare-fun res!691082 () Bool)

(assert (=> b!1034844 (=> (not res!691082) (not e!585041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65146 (_ BitVec 32)) Bool)

(assert (=> b!1034844 (= res!691082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11420 thiss!1427) (mask!30103 thiss!1427)))))

(declare-fun b!1034845 () Bool)

(declare-datatypes ((List!21909 0))(
  ( (Nil!21906) (Cons!21905 (h!23107 (_ BitVec 64)) (t!31112 List!21909)) )
))
(declare-fun arrayNoDuplicates!0 (array!65146 (_ BitVec 32) List!21909) Bool)

(assert (=> b!1034845 (= e!585041 (arrayNoDuplicates!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 Nil!21906))))

(assert (= (and d!124443 res!691080) b!1034843))

(assert (= (and b!1034843 res!691081) b!1034844))

(assert (= (and b!1034844 res!691082) b!1034845))

(declare-fun m!955105 () Bool)

(assert (=> d!124443 m!955105))

(declare-fun m!955107 () Bool)

(assert (=> b!1034843 m!955107))

(declare-fun m!955109 () Bool)

(assert (=> b!1034844 m!955109))

(declare-fun m!955111 () Bool)

(assert (=> b!1034845 m!955111))

(assert (=> start!90416 d!124443))

(declare-fun d!124445 () Bool)

(assert (=> d!124445 (= (array_inv!24261 (_keys!11420 thiss!1427)) (bvsge (size!31889 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034814 d!124445))

(declare-fun d!124447 () Bool)

(assert (=> d!124447 (= (array_inv!24262 (_values!6260 thiss!1427)) (bvsge (size!31890 (_values!6260 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034814 d!124447))

(declare-fun d!124449 () Bool)

(assert (=> d!124449 (= (validMask!0 (mask!30103 thiss!1427)) (and (or (= (mask!30103 thiss!1427) #b00000000000000000000000000000111) (= (mask!30103 thiss!1427) #b00000000000000000000000000001111) (= (mask!30103 thiss!1427) #b00000000000000000000000000011111) (= (mask!30103 thiss!1427) #b00000000000000000000000000111111) (= (mask!30103 thiss!1427) #b00000000000000000000000001111111) (= (mask!30103 thiss!1427) #b00000000000000000000000011111111) (= (mask!30103 thiss!1427) #b00000000000000000000000111111111) (= (mask!30103 thiss!1427) #b00000000000000000000001111111111) (= (mask!30103 thiss!1427) #b00000000000000000000011111111111) (= (mask!30103 thiss!1427) #b00000000000000000000111111111111) (= (mask!30103 thiss!1427) #b00000000000000000001111111111111) (= (mask!30103 thiss!1427) #b00000000000000000011111111111111) (= (mask!30103 thiss!1427) #b00000000000000000111111111111111) (= (mask!30103 thiss!1427) #b00000000000000001111111111111111) (= (mask!30103 thiss!1427) #b00000000000000011111111111111111) (= (mask!30103 thiss!1427) #b00000000000000111111111111111111) (= (mask!30103 thiss!1427) #b00000000000001111111111111111111) (= (mask!30103 thiss!1427) #b00000000000011111111111111111111) (= (mask!30103 thiss!1427) #b00000000000111111111111111111111) (= (mask!30103 thiss!1427) #b00000000001111111111111111111111) (= (mask!30103 thiss!1427) #b00000000011111111111111111111111) (= (mask!30103 thiss!1427) #b00000000111111111111111111111111) (= (mask!30103 thiss!1427) #b00000001111111111111111111111111) (= (mask!30103 thiss!1427) #b00000011111111111111111111111111) (= (mask!30103 thiss!1427) #b00000111111111111111111111111111) (= (mask!30103 thiss!1427) #b00001111111111111111111111111111) (= (mask!30103 thiss!1427) #b00011111111111111111111111111111) (= (mask!30103 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30103 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034813 d!124449))

(declare-fun condMapEmpty!38294 () Bool)

(declare-fun mapDefault!38294 () ValueCell!11562)

(assert (=> mapNonEmpty!38288 (= condMapEmpty!38294 (= mapRest!38288 ((as const (Array (_ BitVec 32) ValueCell!11562)) mapDefault!38294)))))

(declare-fun e!585046 () Bool)

(declare-fun mapRes!38294 () Bool)

(assert (=> mapNonEmpty!38288 (= tp!73542 (and e!585046 mapRes!38294))))

(declare-fun mapIsEmpty!38294 () Bool)

(assert (=> mapIsEmpty!38294 mapRes!38294))

(declare-fun mapNonEmpty!38294 () Bool)

(declare-fun tp!73551 () Bool)

(declare-fun e!585047 () Bool)

(assert (=> mapNonEmpty!38294 (= mapRes!38294 (and tp!73551 e!585047))))

(declare-fun mapValue!38294 () ValueCell!11562)

(declare-fun mapKey!38294 () (_ BitVec 32))

(declare-fun mapRest!38294 () (Array (_ BitVec 32) ValueCell!11562))

(assert (=> mapNonEmpty!38294 (= mapRest!38288 (store mapRest!38294 mapKey!38294 mapValue!38294))))

(declare-fun b!1034852 () Bool)

(assert (=> b!1034852 (= e!585047 tp_is_empty!24531)))

(declare-fun b!1034853 () Bool)

(assert (=> b!1034853 (= e!585046 tp_is_empty!24531)))

(assert (= (and mapNonEmpty!38288 condMapEmpty!38294) mapIsEmpty!38294))

(assert (= (and mapNonEmpty!38288 (not condMapEmpty!38294)) mapNonEmpty!38294))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11562) mapValue!38294)) b!1034852))

(assert (= (and mapNonEmpty!38288 ((_ is ValueCellFull!11562) mapDefault!38294)) b!1034853))

(declare-fun m!955113 () Bool)

(assert (=> mapNonEmpty!38294 m!955113))

(check-sat (not b!1034844) (not mapNonEmpty!38294) (not b!1034843) b_and!33311 (not b!1034845) tp_is_empty!24531 (not d!124443) (not b_next!20811))
(check-sat b_and!33311 (not b_next!20811))
(get-model)

(declare-fun bm!43755 () Bool)

(declare-fun call!43758 () Bool)

(assert (=> bm!43755 (= call!43758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11420 thiss!1427) (mask!30103 thiss!1427)))))

(declare-fun d!124451 () Bool)

(declare-fun res!691088 () Bool)

(declare-fun e!585054 () Bool)

(assert (=> d!124451 (=> res!691088 e!585054)))

(assert (=> d!124451 (= res!691088 (bvsge #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))))))

(assert (=> d!124451 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11420 thiss!1427) (mask!30103 thiss!1427)) e!585054)))

(declare-fun b!1034862 () Bool)

(declare-fun e!585056 () Bool)

(assert (=> b!1034862 (= e!585056 call!43758)))

(declare-fun b!1034863 () Bool)

(declare-fun e!585055 () Bool)

(assert (=> b!1034863 (= e!585055 call!43758)))

(declare-fun b!1034864 () Bool)

(assert (=> b!1034864 (= e!585054 e!585056)))

(declare-fun c!104691 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034864 (= c!104691 (validKeyInArray!0 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034865 () Bool)

(assert (=> b!1034865 (= e!585056 e!585055)))

(declare-fun lt!456716 () (_ BitVec 64))

(assert (=> b!1034865 (= lt!456716 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33882 0))(
  ( (Unit!33883) )
))
(declare-fun lt!456715 () Unit!33882)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65146 (_ BitVec 64) (_ BitVec 32)) Unit!33882)

(assert (=> b!1034865 (= lt!456715 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11420 thiss!1427) lt!456716 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65146 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034865 (arrayContainsKey!0 (_keys!11420 thiss!1427) lt!456716 #b00000000000000000000000000000000)))

(declare-fun lt!456717 () Unit!33882)

(assert (=> b!1034865 (= lt!456717 lt!456715)))

(declare-fun res!691087 () Bool)

(declare-datatypes ((SeekEntryResult!9740 0))(
  ( (MissingZero!9740 (index!41331 (_ BitVec 32))) (Found!9740 (index!41332 (_ BitVec 32))) (Intermediate!9740 (undefined!10552 Bool) (index!41333 (_ BitVec 32)) (x!92279 (_ BitVec 32))) (Undefined!9740) (MissingVacant!9740 (index!41334 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65146 (_ BitVec 32)) SeekEntryResult!9740)

(assert (=> b!1034865 (= res!691087 (= (seekEntryOrOpen!0 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000) (_keys!11420 thiss!1427) (mask!30103 thiss!1427)) (Found!9740 #b00000000000000000000000000000000)))))

(assert (=> b!1034865 (=> (not res!691087) (not e!585055))))

(assert (= (and d!124451 (not res!691088)) b!1034864))

(assert (= (and b!1034864 c!104691) b!1034865))

(assert (= (and b!1034864 (not c!104691)) b!1034862))

(assert (= (and b!1034865 res!691087) b!1034863))

(assert (= (or b!1034863 b!1034862) bm!43755))

(declare-fun m!955115 () Bool)

(assert (=> bm!43755 m!955115))

(declare-fun m!955117 () Bool)

(assert (=> b!1034864 m!955117))

(assert (=> b!1034864 m!955117))

(declare-fun m!955119 () Bool)

(assert (=> b!1034864 m!955119))

(assert (=> b!1034865 m!955117))

(declare-fun m!955121 () Bool)

(assert (=> b!1034865 m!955121))

(declare-fun m!955123 () Bool)

(assert (=> b!1034865 m!955123))

(assert (=> b!1034865 m!955117))

(declare-fun m!955125 () Bool)

(assert (=> b!1034865 m!955125))

(assert (=> b!1034844 d!124451))

(declare-fun bm!43758 () Bool)

(declare-fun call!43761 () (_ BitVec 32))

(assert (=> bm!43758 (= call!43761 (arrayCountValidKeys!0 (_keys!11420 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31889 (_keys!11420 thiss!1427))))))

(declare-fun b!1034874 () Bool)

(declare-fun e!585062 () (_ BitVec 32))

(assert (=> b!1034874 (= e!585062 call!43761)))

(declare-fun d!124453 () Bool)

(declare-fun lt!456720 () (_ BitVec 32))

(assert (=> d!124453 (and (bvsge lt!456720 #b00000000000000000000000000000000) (bvsle lt!456720 (bvsub (size!31889 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585061 () (_ BitVec 32))

(assert (=> d!124453 (= lt!456720 e!585061)))

(declare-fun c!104696 () Bool)

(assert (=> d!124453 (= c!104696 (bvsge #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))))))

(assert (=> d!124453 (and (bvsle #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31889 (_keys!11420 thiss!1427)) (size!31889 (_keys!11420 thiss!1427))))))

(assert (=> d!124453 (= (arrayCountValidKeys!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))) lt!456720)))

(declare-fun b!1034875 () Bool)

(assert (=> b!1034875 (= e!585062 (bvadd #b00000000000000000000000000000001 call!43761))))

(declare-fun b!1034876 () Bool)

(assert (=> b!1034876 (= e!585061 #b00000000000000000000000000000000)))

(declare-fun b!1034877 () Bool)

(assert (=> b!1034877 (= e!585061 e!585062)))

(declare-fun c!104697 () Bool)

(assert (=> b!1034877 (= c!104697 (validKeyInArray!0 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124453 c!104696) b!1034876))

(assert (= (and d!124453 (not c!104696)) b!1034877))

(assert (= (and b!1034877 c!104697) b!1034875))

(assert (= (and b!1034877 (not c!104697)) b!1034874))

(assert (= (or b!1034875 b!1034874) bm!43758))

(declare-fun m!955127 () Bool)

(assert (=> bm!43758 m!955127))

(assert (=> b!1034877 m!955117))

(assert (=> b!1034877 m!955117))

(assert (=> b!1034877 m!955119))

(assert (=> b!1034843 d!124453))

(declare-fun d!124455 () Bool)

(declare-fun res!691100 () Bool)

(declare-fun e!585065 () Bool)

(assert (=> d!124455 (=> (not res!691100) (not e!585065))))

(assert (=> d!124455 (= res!691100 (validMask!0 (mask!30103 thiss!1427)))))

(assert (=> d!124455 (= (simpleValid!407 thiss!1427) e!585065)))

(declare-fun b!1034887 () Bool)

(declare-fun res!691098 () Bool)

(assert (=> b!1034887 (=> (not res!691098) (not e!585065))))

(declare-fun size!31893 (LongMapFixedSize!5718) (_ BitVec 32))

(assert (=> b!1034887 (= res!691098 (bvsge (size!31893 thiss!1427) (_size!2914 thiss!1427)))))

(declare-fun b!1034888 () Bool)

(declare-fun res!691099 () Bool)

(assert (=> b!1034888 (=> (not res!691099) (not e!585065))))

(assert (=> b!1034888 (= res!691099 (= (size!31893 thiss!1427) (bvadd (_size!2914 thiss!1427) (bvsdiv (bvadd (extraKeys!5967 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1034889 () Bool)

(assert (=> b!1034889 (= e!585065 (and (bvsge (extraKeys!5967 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5967 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2914 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1034886 () Bool)

(declare-fun res!691097 () Bool)

(assert (=> b!1034886 (=> (not res!691097) (not e!585065))))

(assert (=> b!1034886 (= res!691097 (and (= (size!31890 (_values!6260 thiss!1427)) (bvadd (mask!30103 thiss!1427) #b00000000000000000000000000000001)) (= (size!31889 (_keys!11420 thiss!1427)) (size!31890 (_values!6260 thiss!1427))) (bvsge (_size!2914 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2914 thiss!1427) (bvadd (mask!30103 thiss!1427) #b00000000000000000000000000000001))))))

(assert (= (and d!124455 res!691100) b!1034886))

(assert (= (and b!1034886 res!691097) b!1034887))

(assert (= (and b!1034887 res!691098) b!1034888))

(assert (= (and b!1034888 res!691099) b!1034889))

(assert (=> d!124455 m!955087))

(declare-fun m!955129 () Bool)

(assert (=> b!1034887 m!955129))

(assert (=> b!1034888 m!955129))

(assert (=> d!124443 d!124455))

(declare-fun b!1034900 () Bool)

(declare-fun e!585075 () Bool)

(declare-fun e!585074 () Bool)

(assert (=> b!1034900 (= e!585075 e!585074)))

(declare-fun res!691109 () Bool)

(assert (=> b!1034900 (=> (not res!691109) (not e!585074))))

(declare-fun e!585077 () Bool)

(assert (=> b!1034900 (= res!691109 (not e!585077))))

(declare-fun res!691108 () Bool)

(assert (=> b!1034900 (=> (not res!691108) (not e!585077))))

(assert (=> b!1034900 (= res!691108 (validKeyInArray!0 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124457 () Bool)

(declare-fun res!691107 () Bool)

(assert (=> d!124457 (=> res!691107 e!585075)))

(assert (=> d!124457 (= res!691107 (bvsge #b00000000000000000000000000000000 (size!31889 (_keys!11420 thiss!1427))))))

(assert (=> d!124457 (= (arrayNoDuplicates!0 (_keys!11420 thiss!1427) #b00000000000000000000000000000000 Nil!21906) e!585075)))

(declare-fun b!1034901 () Bool)

(declare-fun e!585076 () Bool)

(declare-fun call!43764 () Bool)

(assert (=> b!1034901 (= e!585076 call!43764)))

(declare-fun b!1034902 () Bool)

(assert (=> b!1034902 (= e!585076 call!43764)))

(declare-fun bm!43761 () Bool)

(declare-fun c!104700 () Bool)

(assert (=> bm!43761 (= call!43764 (arrayNoDuplicates!0 (_keys!11420 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104700 (Cons!21905 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000) Nil!21906) Nil!21906)))))

(declare-fun b!1034903 () Bool)

(declare-fun contains!6016 (List!21909 (_ BitVec 64)) Bool)

(assert (=> b!1034903 (= e!585077 (contains!6016 Nil!21906 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034904 () Bool)

(assert (=> b!1034904 (= e!585074 e!585076)))

(assert (=> b!1034904 (= c!104700 (validKeyInArray!0 (select (arr!31365 (_keys!11420 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124457 (not res!691107)) b!1034900))

(assert (= (and b!1034900 res!691108) b!1034903))

(assert (= (and b!1034900 res!691109) b!1034904))

(assert (= (and b!1034904 c!104700) b!1034901))

(assert (= (and b!1034904 (not c!104700)) b!1034902))

(assert (= (or b!1034901 b!1034902) bm!43761))

(assert (=> b!1034900 m!955117))

(assert (=> b!1034900 m!955117))

(assert (=> b!1034900 m!955119))

(assert (=> bm!43761 m!955117))

(declare-fun m!955131 () Bool)

(assert (=> bm!43761 m!955131))

(assert (=> b!1034903 m!955117))

(assert (=> b!1034903 m!955117))

(declare-fun m!955133 () Bool)

(assert (=> b!1034903 m!955133))

(assert (=> b!1034904 m!955117))

(assert (=> b!1034904 m!955117))

(assert (=> b!1034904 m!955119))

(assert (=> b!1034845 d!124457))

(declare-fun condMapEmpty!38295 () Bool)

(declare-fun mapDefault!38295 () ValueCell!11562)

(assert (=> mapNonEmpty!38294 (= condMapEmpty!38295 (= mapRest!38294 ((as const (Array (_ BitVec 32) ValueCell!11562)) mapDefault!38295)))))

(declare-fun e!585078 () Bool)

(declare-fun mapRes!38295 () Bool)

(assert (=> mapNonEmpty!38294 (= tp!73551 (and e!585078 mapRes!38295))))

(declare-fun mapIsEmpty!38295 () Bool)

(assert (=> mapIsEmpty!38295 mapRes!38295))

(declare-fun mapNonEmpty!38295 () Bool)

(declare-fun tp!73552 () Bool)

(declare-fun e!585079 () Bool)

(assert (=> mapNonEmpty!38295 (= mapRes!38295 (and tp!73552 e!585079))))

(declare-fun mapKey!38295 () (_ BitVec 32))

(declare-fun mapRest!38295 () (Array (_ BitVec 32) ValueCell!11562))

(declare-fun mapValue!38295 () ValueCell!11562)

(assert (=> mapNonEmpty!38295 (= mapRest!38294 (store mapRest!38295 mapKey!38295 mapValue!38295))))

(declare-fun b!1034905 () Bool)

(assert (=> b!1034905 (= e!585079 tp_is_empty!24531)))

(declare-fun b!1034906 () Bool)

(assert (=> b!1034906 (= e!585078 tp_is_empty!24531)))

(assert (= (and mapNonEmpty!38294 condMapEmpty!38295) mapIsEmpty!38295))

(assert (= (and mapNonEmpty!38294 (not condMapEmpty!38295)) mapNonEmpty!38295))

(assert (= (and mapNonEmpty!38295 ((_ is ValueCellFull!11562) mapValue!38295)) b!1034905))

(assert (= (and mapNonEmpty!38294 ((_ is ValueCellFull!11562) mapDefault!38295)) b!1034906))

(declare-fun m!955135 () Bool)

(assert (=> mapNonEmpty!38295 m!955135))

(check-sat (not b!1034903) b_and!33311 (not b!1034865) (not b!1034887) (not b!1034888) (not bm!43758) tp_is_empty!24531 (not b!1034904) (not bm!43761) (not d!124455) (not bm!43755) (not b!1034900) (not mapNonEmpty!38295) (not b!1034877) (not b_next!20811) (not b!1034864))
(check-sat b_and!33311 (not b_next!20811))
