; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90434 () Bool)

(assert start!90434)

(declare-fun b!1034775 () Bool)

(declare-fun b_free!20815 () Bool)

(declare-fun b_next!20815 () Bool)

(assert (=> b!1034775 (= b_free!20815 (not b_next!20815))))

(declare-fun tp!73558 () Bool)

(declare-fun b_and!33289 () Bool)

(assert (=> b!1034775 (= tp!73558 b_and!33289)))

(declare-fun mapNonEmpty!38298 () Bool)

(declare-fun mapRes!38298 () Bool)

(declare-fun tp!73557 () Bool)

(declare-fun e!585001 () Bool)

(assert (=> mapNonEmpty!38298 (= mapRes!38298 (and tp!73557 e!585001))))

(declare-datatypes ((V!37587 0))(
  ( (V!37588 (val!12318 Int)) )
))
(declare-datatypes ((ValueCell!11564 0))(
  ( (ValueCellFull!11564 (v!14897 V!37587)) (EmptyCell!11564) )
))
(declare-fun mapValue!38298 () ValueCell!11564)

(declare-fun mapRest!38298 () (Array (_ BitVec 32) ValueCell!11564))

(declare-datatypes ((array!65095 0))(
  ( (array!65096 (arr!31338 (Array (_ BitVec 32) (_ BitVec 64))) (size!31865 (_ BitVec 32))) )
))
(declare-datatypes ((array!65097 0))(
  ( (array!65098 (arr!31339 (Array (_ BitVec 32) ValueCell!11564)) (size!31866 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5722 0))(
  ( (LongMapFixedSize!5723 (defaultEntry!6239 Int) (mask!30104 (_ BitVec 32)) (extraKeys!5969 (_ BitVec 32)) (zeroValue!6073 V!37587) (minValue!6075 V!37587) (_size!2916 (_ BitVec 32)) (_keys!11419 array!65095) (_values!6262 array!65097) (_vacant!2916 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5722)

(declare-fun mapKey!38298 () (_ BitVec 32))

(assert (=> mapNonEmpty!38298 (= (arr!31339 (_values!6262 thiss!1427)) (store mapRest!38298 mapKey!38298 mapValue!38298))))

(declare-fun b!1034770 () Bool)

(declare-fun e!585006 () Bool)

(declare-fun tp_is_empty!24535 () Bool)

(assert (=> b!1034770 (= e!585006 tp_is_empty!24535)))

(declare-fun b!1034771 () Bool)

(declare-fun res!691051 () Bool)

(declare-fun e!585003 () Bool)

(assert (=> b!1034771 (=> (not res!691051) (not e!585003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034771 (= res!691051 (validMask!0 (mask!30104 thiss!1427)))))

(declare-fun b!1034772 () Bool)

(assert (=> b!1034772 (= e!585003 (and (= (size!31866 (_values!6262 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30104 thiss!1427))) (not (= (size!31865 (_keys!11419 thiss!1427)) (size!31866 (_values!6262 thiss!1427))))))))

(declare-fun mapIsEmpty!38298 () Bool)

(assert (=> mapIsEmpty!38298 mapRes!38298))

(declare-fun b!1034773 () Bool)

(assert (=> b!1034773 (= e!585001 tp_is_empty!24535)))

(declare-fun b!1034774 () Bool)

(declare-fun e!585002 () Bool)

(assert (=> b!1034774 (= e!585002 (and e!585006 mapRes!38298))))

(declare-fun condMapEmpty!38298 () Bool)

(declare-fun mapDefault!38298 () ValueCell!11564)

(assert (=> b!1034774 (= condMapEmpty!38298 (= (arr!31339 (_values!6262 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38298)))))

(declare-fun e!585005 () Bool)

(declare-fun array_inv!24243 (array!65095) Bool)

(declare-fun array_inv!24244 (array!65097) Bool)

(assert (=> b!1034775 (= e!585005 (and tp!73558 tp_is_empty!24535 (array_inv!24243 (_keys!11419 thiss!1427)) (array_inv!24244 (_values!6262 thiss!1427)) e!585002))))

(declare-fun b!1034776 () Bool)

(declare-fun res!691049 () Bool)

(assert (=> b!1034776 (=> (not res!691049) (not e!585003))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034776 (= res!691049 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!691050 () Bool)

(assert (=> start!90434 (=> (not res!691050) (not e!585003))))

(declare-fun valid!2150 (LongMapFixedSize!5722) Bool)

(assert (=> start!90434 (= res!691050 (valid!2150 thiss!1427))))

(assert (=> start!90434 e!585003))

(assert (=> start!90434 e!585005))

(assert (=> start!90434 true))

(assert (= (and start!90434 res!691050) b!1034776))

(assert (= (and b!1034776 res!691049) b!1034771))

(assert (= (and b!1034771 res!691051) b!1034772))

(assert (= (and b!1034774 condMapEmpty!38298) mapIsEmpty!38298))

(assert (= (and b!1034774 (not condMapEmpty!38298)) mapNonEmpty!38298))

(get-info :version)

(assert (= (and mapNonEmpty!38298 ((_ is ValueCellFull!11564) mapValue!38298)) b!1034773))

(assert (= (and b!1034774 ((_ is ValueCellFull!11564) mapDefault!38298)) b!1034770))

(assert (= b!1034775 b!1034774))

(assert (= start!90434 b!1034775))

(declare-fun m!954517 () Bool)

(assert (=> mapNonEmpty!38298 m!954517))

(declare-fun m!954519 () Bool)

(assert (=> b!1034771 m!954519))

(declare-fun m!954521 () Bool)

(assert (=> b!1034775 m!954521))

(declare-fun m!954523 () Bool)

(assert (=> b!1034775 m!954523))

(declare-fun m!954525 () Bool)

(assert (=> start!90434 m!954525))

(check-sat b_and!33289 (not start!90434) (not b_next!20815) tp_is_empty!24535 (not b!1034775) (not b!1034771) (not mapNonEmpty!38298))
(check-sat b_and!33289 (not b_next!20815))
(get-model)

(declare-fun d!124311 () Bool)

(declare-fun res!691076 () Bool)

(declare-fun e!585045 () Bool)

(assert (=> d!124311 (=> (not res!691076) (not e!585045))))

(declare-fun simpleValid!408 (LongMapFixedSize!5722) Bool)

(assert (=> d!124311 (= res!691076 (simpleValid!408 thiss!1427))))

(assert (=> d!124311 (= (valid!2150 thiss!1427) e!585045)))

(declare-fun b!1034825 () Bool)

(declare-fun res!691077 () Bool)

(assert (=> b!1034825 (=> (not res!691077) (not e!585045))))

(declare-fun arrayCountValidKeys!0 (array!65095 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1034825 (= res!691077 (= (arrayCountValidKeys!0 (_keys!11419 thiss!1427) #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))) (_size!2916 thiss!1427)))))

(declare-fun b!1034826 () Bool)

(declare-fun res!691078 () Bool)

(assert (=> b!1034826 (=> (not res!691078) (not e!585045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65095 (_ BitVec 32)) Bool)

(assert (=> b!1034826 (= res!691078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11419 thiss!1427) (mask!30104 thiss!1427)))))

(declare-fun b!1034827 () Bool)

(declare-datatypes ((List!21944 0))(
  ( (Nil!21941) (Cons!21940 (h!23142 (_ BitVec 64)) (t!31138 List!21944)) )
))
(declare-fun arrayNoDuplicates!0 (array!65095 (_ BitVec 32) List!21944) Bool)

(assert (=> b!1034827 (= e!585045 (arrayNoDuplicates!0 (_keys!11419 thiss!1427) #b00000000000000000000000000000000 Nil!21941))))

(assert (= (and d!124311 res!691076) b!1034825))

(assert (= (and b!1034825 res!691077) b!1034826))

(assert (= (and b!1034826 res!691078) b!1034827))

(declare-fun m!954547 () Bool)

(assert (=> d!124311 m!954547))

(declare-fun m!954549 () Bool)

(assert (=> b!1034825 m!954549))

(declare-fun m!954551 () Bool)

(assert (=> b!1034826 m!954551))

(declare-fun m!954553 () Bool)

(assert (=> b!1034827 m!954553))

(assert (=> start!90434 d!124311))

(declare-fun d!124313 () Bool)

(assert (=> d!124313 (= (array_inv!24243 (_keys!11419 thiss!1427)) (bvsge (size!31865 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034775 d!124313))

(declare-fun d!124315 () Bool)

(assert (=> d!124315 (= (array_inv!24244 (_values!6262 thiss!1427)) (bvsge (size!31866 (_values!6262 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1034775 d!124315))

(declare-fun d!124317 () Bool)

(assert (=> d!124317 (= (validMask!0 (mask!30104 thiss!1427)) (and (or (= (mask!30104 thiss!1427) #b00000000000000000000000000000111) (= (mask!30104 thiss!1427) #b00000000000000000000000000001111) (= (mask!30104 thiss!1427) #b00000000000000000000000000011111) (= (mask!30104 thiss!1427) #b00000000000000000000000000111111) (= (mask!30104 thiss!1427) #b00000000000000000000000001111111) (= (mask!30104 thiss!1427) #b00000000000000000000000011111111) (= (mask!30104 thiss!1427) #b00000000000000000000000111111111) (= (mask!30104 thiss!1427) #b00000000000000000000001111111111) (= (mask!30104 thiss!1427) #b00000000000000000000011111111111) (= (mask!30104 thiss!1427) #b00000000000000000000111111111111) (= (mask!30104 thiss!1427) #b00000000000000000001111111111111) (= (mask!30104 thiss!1427) #b00000000000000000011111111111111) (= (mask!30104 thiss!1427) #b00000000000000000111111111111111) (= (mask!30104 thiss!1427) #b00000000000000001111111111111111) (= (mask!30104 thiss!1427) #b00000000000000011111111111111111) (= (mask!30104 thiss!1427) #b00000000000000111111111111111111) (= (mask!30104 thiss!1427) #b00000000000001111111111111111111) (= (mask!30104 thiss!1427) #b00000000000011111111111111111111) (= (mask!30104 thiss!1427) #b00000000000111111111111111111111) (= (mask!30104 thiss!1427) #b00000000001111111111111111111111) (= (mask!30104 thiss!1427) #b00000000011111111111111111111111) (= (mask!30104 thiss!1427) #b00000000111111111111111111111111) (= (mask!30104 thiss!1427) #b00000001111111111111111111111111) (= (mask!30104 thiss!1427) #b00000011111111111111111111111111) (= (mask!30104 thiss!1427) #b00000111111111111111111111111111) (= (mask!30104 thiss!1427) #b00001111111111111111111111111111) (= (mask!30104 thiss!1427) #b00011111111111111111111111111111) (= (mask!30104 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30104 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1034771 d!124317))

(declare-fun b!1034834 () Bool)

(declare-fun e!585051 () Bool)

(assert (=> b!1034834 (= e!585051 tp_is_empty!24535)))

(declare-fun mapIsEmpty!38307 () Bool)

(declare-fun mapRes!38307 () Bool)

(assert (=> mapIsEmpty!38307 mapRes!38307))

(declare-fun mapNonEmpty!38307 () Bool)

(declare-fun tp!73573 () Bool)

(assert (=> mapNonEmpty!38307 (= mapRes!38307 (and tp!73573 e!585051))))

(declare-fun mapRest!38307 () (Array (_ BitVec 32) ValueCell!11564))

(declare-fun mapKey!38307 () (_ BitVec 32))

(declare-fun mapValue!38307 () ValueCell!11564)

(assert (=> mapNonEmpty!38307 (= mapRest!38298 (store mapRest!38307 mapKey!38307 mapValue!38307))))

(declare-fun b!1034835 () Bool)

(declare-fun e!585050 () Bool)

(assert (=> b!1034835 (= e!585050 tp_is_empty!24535)))

(declare-fun condMapEmpty!38307 () Bool)

(declare-fun mapDefault!38307 () ValueCell!11564)

(assert (=> mapNonEmpty!38298 (= condMapEmpty!38307 (= mapRest!38298 ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38307)))))

(assert (=> mapNonEmpty!38298 (= tp!73557 (and e!585050 mapRes!38307))))

(assert (= (and mapNonEmpty!38298 condMapEmpty!38307) mapIsEmpty!38307))

(assert (= (and mapNonEmpty!38298 (not condMapEmpty!38307)) mapNonEmpty!38307))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11564) mapValue!38307)) b!1034834))

(assert (= (and mapNonEmpty!38298 ((_ is ValueCellFull!11564) mapDefault!38307)) b!1034835))

(declare-fun m!954555 () Bool)

(assert (=> mapNonEmpty!38307 m!954555))

(check-sat (not b!1034826) b_and!33289 (not d!124311) (not b!1034825) tp_is_empty!24535 (not b!1034827) (not mapNonEmpty!38307) (not b_next!20815))
(check-sat b_and!33289 (not b_next!20815))
(get-model)

(declare-fun d!124319 () Bool)

(declare-fun lt!456523 () (_ BitVec 32))

(assert (=> d!124319 (and (bvsge lt!456523 #b00000000000000000000000000000000) (bvsle lt!456523 (bvsub (size!31865 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!585056 () (_ BitVec 32))

(assert (=> d!124319 (= lt!456523 e!585056)))

(declare-fun c!104667 () Bool)

(assert (=> d!124319 (= c!104667 (bvsge #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))))))

(assert (=> d!124319 (and (bvsle #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31865 (_keys!11419 thiss!1427)) (size!31865 (_keys!11419 thiss!1427))))))

(assert (=> d!124319 (= (arrayCountValidKeys!0 (_keys!11419 thiss!1427) #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))) lt!456523)))

(declare-fun b!1034844 () Bool)

(declare-fun e!585057 () (_ BitVec 32))

(assert (=> b!1034844 (= e!585056 e!585057)))

(declare-fun c!104666 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1034844 (= c!104666 (validKeyInArray!0 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43741 () Bool)

(declare-fun call!43744 () (_ BitVec 32))

(assert (=> bm!43741 (= call!43744 (arrayCountValidKeys!0 (_keys!11419 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31865 (_keys!11419 thiss!1427))))))

(declare-fun b!1034845 () Bool)

(assert (=> b!1034845 (= e!585057 (bvadd #b00000000000000000000000000000001 call!43744))))

(declare-fun b!1034846 () Bool)

(assert (=> b!1034846 (= e!585056 #b00000000000000000000000000000000)))

(declare-fun b!1034847 () Bool)

(assert (=> b!1034847 (= e!585057 call!43744)))

(assert (= (and d!124319 c!104667) b!1034846))

(assert (= (and d!124319 (not c!104667)) b!1034844))

(assert (= (and b!1034844 c!104666) b!1034845))

(assert (= (and b!1034844 (not c!104666)) b!1034847))

(assert (= (or b!1034845 b!1034847) bm!43741))

(declare-fun m!954557 () Bool)

(assert (=> b!1034844 m!954557))

(assert (=> b!1034844 m!954557))

(declare-fun m!954559 () Bool)

(assert (=> b!1034844 m!954559))

(declare-fun m!954561 () Bool)

(assert (=> bm!43741 m!954561))

(assert (=> b!1034825 d!124319))

(declare-fun b!1034858 () Bool)

(declare-fun res!691090 () Bool)

(declare-fun e!585060 () Bool)

(assert (=> b!1034858 (=> (not res!691090) (not e!585060))))

(declare-fun size!31871 (LongMapFixedSize!5722) (_ BitVec 32))

(assert (=> b!1034858 (= res!691090 (= (size!31871 thiss!1427) (bvadd (_size!2916 thiss!1427) (bvsdiv (bvadd (extraKeys!5969 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!124321 () Bool)

(declare-fun res!691087 () Bool)

(assert (=> d!124321 (=> (not res!691087) (not e!585060))))

(assert (=> d!124321 (= res!691087 (validMask!0 (mask!30104 thiss!1427)))))

(assert (=> d!124321 (= (simpleValid!408 thiss!1427) e!585060)))

(declare-fun b!1034857 () Bool)

(declare-fun res!691089 () Bool)

(assert (=> b!1034857 (=> (not res!691089) (not e!585060))))

(assert (=> b!1034857 (= res!691089 (bvsge (size!31871 thiss!1427) (_size!2916 thiss!1427)))))

(declare-fun b!1034856 () Bool)

(declare-fun res!691088 () Bool)

(assert (=> b!1034856 (=> (not res!691088) (not e!585060))))

(assert (=> b!1034856 (= res!691088 (and (= (size!31866 (_values!6262 thiss!1427)) (bvadd (mask!30104 thiss!1427) #b00000000000000000000000000000001)) (= (size!31865 (_keys!11419 thiss!1427)) (size!31866 (_values!6262 thiss!1427))) (bvsge (_size!2916 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2916 thiss!1427) (bvadd (mask!30104 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1034859 () Bool)

(assert (=> b!1034859 (= e!585060 (and (bvsge (extraKeys!5969 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5969 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2916 thiss!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!124321 res!691087) b!1034856))

(assert (= (and b!1034856 res!691088) b!1034857))

(assert (= (and b!1034857 res!691089) b!1034858))

(assert (= (and b!1034858 res!691090) b!1034859))

(declare-fun m!954563 () Bool)

(assert (=> b!1034858 m!954563))

(assert (=> d!124321 m!954519))

(assert (=> b!1034857 m!954563))

(assert (=> d!124311 d!124321))

(declare-fun b!1034870 () Bool)

(declare-fun e!585072 () Bool)

(declare-fun contains!5997 (List!21944 (_ BitVec 64)) Bool)

(assert (=> b!1034870 (= e!585072 (contains!5997 Nil!21941 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034871 () Bool)

(declare-fun e!585069 () Bool)

(declare-fun e!585071 () Bool)

(assert (=> b!1034871 (= e!585069 e!585071)))

(declare-fun c!104670 () Bool)

(assert (=> b!1034871 (= c!104670 (validKeyInArray!0 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124323 () Bool)

(declare-fun res!691097 () Bool)

(declare-fun e!585070 () Bool)

(assert (=> d!124323 (=> res!691097 e!585070)))

(assert (=> d!124323 (= res!691097 (bvsge #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))))))

(assert (=> d!124323 (= (arrayNoDuplicates!0 (_keys!11419 thiss!1427) #b00000000000000000000000000000000 Nil!21941) e!585070)))

(declare-fun bm!43744 () Bool)

(declare-fun call!43747 () Bool)

(assert (=> bm!43744 (= call!43747 (arrayNoDuplicates!0 (_keys!11419 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104670 (Cons!21940 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000) Nil!21941) Nil!21941)))))

(declare-fun b!1034872 () Bool)

(assert (=> b!1034872 (= e!585070 e!585069)))

(declare-fun res!691099 () Bool)

(assert (=> b!1034872 (=> (not res!691099) (not e!585069))))

(assert (=> b!1034872 (= res!691099 (not e!585072))))

(declare-fun res!691098 () Bool)

(assert (=> b!1034872 (=> (not res!691098) (not e!585072))))

(assert (=> b!1034872 (= res!691098 (validKeyInArray!0 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034873 () Bool)

(assert (=> b!1034873 (= e!585071 call!43747)))

(declare-fun b!1034874 () Bool)

(assert (=> b!1034874 (= e!585071 call!43747)))

(assert (= (and d!124323 (not res!691097)) b!1034872))

(assert (= (and b!1034872 res!691098) b!1034870))

(assert (= (and b!1034872 res!691099) b!1034871))

(assert (= (and b!1034871 c!104670) b!1034874))

(assert (= (and b!1034871 (not c!104670)) b!1034873))

(assert (= (or b!1034874 b!1034873) bm!43744))

(assert (=> b!1034870 m!954557))

(assert (=> b!1034870 m!954557))

(declare-fun m!954565 () Bool)

(assert (=> b!1034870 m!954565))

(assert (=> b!1034871 m!954557))

(assert (=> b!1034871 m!954557))

(assert (=> b!1034871 m!954559))

(assert (=> bm!43744 m!954557))

(declare-fun m!954567 () Bool)

(assert (=> bm!43744 m!954567))

(assert (=> b!1034872 m!954557))

(assert (=> b!1034872 m!954557))

(assert (=> b!1034872 m!954559))

(assert (=> b!1034827 d!124323))

(declare-fun bm!43747 () Bool)

(declare-fun call!43750 () Bool)

(assert (=> bm!43747 (= call!43750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11419 thiss!1427) (mask!30104 thiss!1427)))))

(declare-fun b!1034883 () Bool)

(declare-fun e!585081 () Bool)

(assert (=> b!1034883 (= e!585081 call!43750)))

(declare-fun d!124325 () Bool)

(declare-fun res!691104 () Bool)

(declare-fun e!585079 () Bool)

(assert (=> d!124325 (=> res!691104 e!585079)))

(assert (=> d!124325 (= res!691104 (bvsge #b00000000000000000000000000000000 (size!31865 (_keys!11419 thiss!1427))))))

(assert (=> d!124325 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11419 thiss!1427) (mask!30104 thiss!1427)) e!585079)))

(declare-fun b!1034884 () Bool)

(declare-fun e!585080 () Bool)

(assert (=> b!1034884 (= e!585080 call!43750)))

(declare-fun b!1034885 () Bool)

(assert (=> b!1034885 (= e!585081 e!585080)))

(declare-fun lt!456532 () (_ BitVec 64))

(assert (=> b!1034885 (= lt!456532 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33764 0))(
  ( (Unit!33765) )
))
(declare-fun lt!456531 () Unit!33764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65095 (_ BitVec 64) (_ BitVec 32)) Unit!33764)

(assert (=> b!1034885 (= lt!456531 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11419 thiss!1427) lt!456532 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1034885 (arrayContainsKey!0 (_keys!11419 thiss!1427) lt!456532 #b00000000000000000000000000000000)))

(declare-fun lt!456530 () Unit!33764)

(assert (=> b!1034885 (= lt!456530 lt!456531)))

(declare-fun res!691105 () Bool)

(declare-datatypes ((SeekEntryResult!9732 0))(
  ( (MissingZero!9732 (index!41299 (_ BitVec 32))) (Found!9732 (index!41300 (_ BitVec 32))) (Intermediate!9732 (undefined!10544 Bool) (index!41301 (_ BitVec 32)) (x!92290 (_ BitVec 32))) (Undefined!9732) (MissingVacant!9732 (index!41302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65095 (_ BitVec 32)) SeekEntryResult!9732)

(assert (=> b!1034885 (= res!691105 (= (seekEntryOrOpen!0 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000) (_keys!11419 thiss!1427) (mask!30104 thiss!1427)) (Found!9732 #b00000000000000000000000000000000)))))

(assert (=> b!1034885 (=> (not res!691105) (not e!585080))))

(declare-fun b!1034886 () Bool)

(assert (=> b!1034886 (= e!585079 e!585081)))

(declare-fun c!104673 () Bool)

(assert (=> b!1034886 (= c!104673 (validKeyInArray!0 (select (arr!31338 (_keys!11419 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124325 (not res!691104)) b!1034886))

(assert (= (and b!1034886 c!104673) b!1034885))

(assert (= (and b!1034886 (not c!104673)) b!1034883))

(assert (= (and b!1034885 res!691105) b!1034884))

(assert (= (or b!1034884 b!1034883) bm!43747))

(declare-fun m!954569 () Bool)

(assert (=> bm!43747 m!954569))

(assert (=> b!1034885 m!954557))

(declare-fun m!954571 () Bool)

(assert (=> b!1034885 m!954571))

(declare-fun m!954573 () Bool)

(assert (=> b!1034885 m!954573))

(assert (=> b!1034885 m!954557))

(declare-fun m!954575 () Bool)

(assert (=> b!1034885 m!954575))

(assert (=> b!1034886 m!954557))

(assert (=> b!1034886 m!954557))

(assert (=> b!1034886 m!954559))

(assert (=> b!1034826 d!124325))

(declare-fun b!1034887 () Bool)

(declare-fun e!585083 () Bool)

(assert (=> b!1034887 (= e!585083 tp_is_empty!24535)))

(declare-fun mapIsEmpty!38308 () Bool)

(declare-fun mapRes!38308 () Bool)

(assert (=> mapIsEmpty!38308 mapRes!38308))

(declare-fun mapNonEmpty!38308 () Bool)

(declare-fun tp!73574 () Bool)

(assert (=> mapNonEmpty!38308 (= mapRes!38308 (and tp!73574 e!585083))))

(declare-fun mapValue!38308 () ValueCell!11564)

(declare-fun mapRest!38308 () (Array (_ BitVec 32) ValueCell!11564))

(declare-fun mapKey!38308 () (_ BitVec 32))

(assert (=> mapNonEmpty!38308 (= mapRest!38307 (store mapRest!38308 mapKey!38308 mapValue!38308))))

(declare-fun b!1034888 () Bool)

(declare-fun e!585082 () Bool)

(assert (=> b!1034888 (= e!585082 tp_is_empty!24535)))

(declare-fun condMapEmpty!38308 () Bool)

(declare-fun mapDefault!38308 () ValueCell!11564)

(assert (=> mapNonEmpty!38307 (= condMapEmpty!38308 (= mapRest!38307 ((as const (Array (_ BitVec 32) ValueCell!11564)) mapDefault!38308)))))

(assert (=> mapNonEmpty!38307 (= tp!73573 (and e!585082 mapRes!38308))))

(assert (= (and mapNonEmpty!38307 condMapEmpty!38308) mapIsEmpty!38308))

(assert (= (and mapNonEmpty!38307 (not condMapEmpty!38308)) mapNonEmpty!38308))

(assert (= (and mapNonEmpty!38308 ((_ is ValueCellFull!11564) mapValue!38308)) b!1034887))

(assert (= (and mapNonEmpty!38307 ((_ is ValueCellFull!11564) mapDefault!38308)) b!1034888))

(declare-fun m!954577 () Bool)

(assert (=> mapNonEmpty!38308 m!954577))

(check-sat b_and!33289 (not b!1034885) (not b!1034871) (not b_next!20815) (not b!1034886) (not b!1034870) (not b!1034857) tp_is_empty!24535 (not bm!43747) (not mapNonEmpty!38308) (not bm!43741) (not b!1034844) (not d!124321) (not bm!43744) (not b!1034872) (not b!1034858))
(check-sat b_and!33289 (not b_next!20815))
