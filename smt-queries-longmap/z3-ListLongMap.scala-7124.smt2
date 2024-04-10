; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90302 () Bool)

(assert start!90302)

(declare-fun b!1033597 () Bool)

(declare-fun b_free!20799 () Bool)

(declare-fun b_next!20799 () Bool)

(assert (=> b!1033597 (= b_free!20799 (not b_next!20799))))

(declare-fun tp!73497 () Bool)

(declare-fun b_and!33269 () Bool)

(assert (=> b!1033597 (= tp!73497 b_and!33269)))

(declare-fun mapNonEmpty!38261 () Bool)

(declare-fun mapRes!38261 () Bool)

(declare-fun tp!73496 () Bool)

(declare-fun e!584240 () Bool)

(assert (=> mapNonEmpty!38261 (= mapRes!38261 (and tp!73496 e!584240))))

(declare-datatypes ((V!37565 0))(
  ( (V!37566 (val!12310 Int)) )
))
(declare-datatypes ((ValueCell!11556 0))(
  ( (ValueCellFull!11556 (v!14887 V!37565)) (EmptyCell!11556) )
))
(declare-fun mapValue!38261 () ValueCell!11556)

(declare-fun mapKey!38261 () (_ BitVec 32))

(declare-fun mapRest!38261 () (Array (_ BitVec 32) ValueCell!11556))

(declare-datatypes ((array!65118 0))(
  ( (array!65119 (arr!31353 (Array (_ BitVec 32) (_ BitVec 64))) (size!31875 (_ BitVec 32))) )
))
(declare-datatypes ((array!65120 0))(
  ( (array!65121 (arr!31354 (Array (_ BitVec 32) ValueCell!11556)) (size!31876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5706 0))(
  ( (LongMapFixedSize!5707 (defaultEntry!6227 Int) (mask!30084 (_ BitVec 32)) (extraKeys!5959 (_ BitVec 32)) (zeroValue!6063 V!37565) (minValue!6063 V!37565) (_size!2908 (_ BitVec 32)) (_keys!11407 array!65118) (_values!6250 array!65120) (_vacant!2908 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5706)

(assert (=> mapNonEmpty!38261 (= (arr!31354 (_values!6250 thiss!1427)) (store mapRest!38261 mapKey!38261 mapValue!38261))))

(declare-fun mapIsEmpty!38261 () Bool)

(assert (=> mapIsEmpty!38261 mapRes!38261))

(declare-fun b!1033593 () Bool)

(declare-fun res!690587 () Bool)

(declare-fun e!584239 () Bool)

(assert (=> b!1033593 (=> (not res!690587) (not e!584239))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033593 (= res!690587 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!690585 () Bool)

(assert (=> start!90302 (=> (not res!690585) (not e!584239))))

(declare-fun valid!2156 (LongMapFixedSize!5706) Bool)

(assert (=> start!90302 (= res!690585 (valid!2156 thiss!1427))))

(assert (=> start!90302 e!584239))

(declare-fun e!584241 () Bool)

(assert (=> start!90302 e!584241))

(assert (=> start!90302 true))

(declare-fun e!584243 () Bool)

(declare-fun b!1033594 () Bool)

(declare-fun lt!456124 () LongMapFixedSize!5706)

(declare-datatypes ((tuple2!15726 0))(
  ( (tuple2!15727 (_1!7874 (_ BitVec 64)) (_2!7874 V!37565)) )
))
(declare-datatypes ((List!21905 0))(
  ( (Nil!21902) (Cons!21901 (h!23103 tuple2!15726) (t!31103 List!21905)) )
))
(declare-datatypes ((ListLongMap!13755 0))(
  ( (ListLongMap!13756 (toList!6893 List!21905)) )
))
(declare-fun map!14701 (LongMapFixedSize!5706) ListLongMap!13755)

(declare-fun -!520 (ListLongMap!13755 (_ BitVec 64)) ListLongMap!13755)

(assert (=> b!1033594 (= e!584243 (= (map!14701 lt!456124) (-!520 (map!14701 thiss!1427) key!909)))))

(declare-fun b!1033595 () Bool)

(assert (=> b!1033595 (= e!584239 (not e!584243))))

(declare-fun res!690586 () Bool)

(assert (=> b!1033595 (=> (not res!690586) (not e!584243))))

(assert (=> b!1033595 (= res!690586 (valid!2156 lt!456124))))

(declare-fun lt!456123 () V!37565)

(assert (=> b!1033595 (= lt!456124 (LongMapFixedSize!5707 (defaultEntry!6227 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (_size!2908 thiss!1427) (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (_vacant!2908 thiss!1427)))))

(declare-fun getCurrentListMap!3941 (array!65118 array!65120 (_ BitVec 32) (_ BitVec 32) V!37565 V!37565 (_ BitVec 32) Int) ListLongMap!13755)

(assert (=> b!1033595 (= (-!520 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-datatypes ((Unit!33831 0))(
  ( (Unit!33832) )
))
(declare-fun lt!456125 () Unit!33831)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!12 (array!65118 array!65120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37565 V!37565 V!37565 Int) Unit!33831)

(assert (=> b!1033595 (= lt!456125 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!12 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6063 thiss!1427) lt!456123 (minValue!6063 thiss!1427) (defaultEntry!6227 thiss!1427)))))

(declare-fun dynLambda!1990 (Int (_ BitVec 64)) V!37565)

(assert (=> b!1033595 (= lt!456123 (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033596 () Bool)

(declare-fun tp_is_empty!24519 () Bool)

(assert (=> b!1033596 (= e!584240 tp_is_empty!24519)))

(declare-fun e!584244 () Bool)

(declare-fun array_inv!24255 (array!65118) Bool)

(declare-fun array_inv!24256 (array!65120) Bool)

(assert (=> b!1033597 (= e!584241 (and tp!73497 tp_is_empty!24519 (array_inv!24255 (_keys!11407 thiss!1427)) (array_inv!24256 (_values!6250 thiss!1427)) e!584244))))

(declare-fun b!1033598 () Bool)

(declare-fun e!584242 () Bool)

(assert (=> b!1033598 (= e!584242 tp_is_empty!24519)))

(declare-fun b!1033599 () Bool)

(assert (=> b!1033599 (= e!584244 (and e!584242 mapRes!38261))))

(declare-fun condMapEmpty!38261 () Bool)

(declare-fun mapDefault!38261 () ValueCell!11556)

(assert (=> b!1033599 (= condMapEmpty!38261 (= (arr!31354 (_values!6250 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11556)) mapDefault!38261)))))

(assert (= (and start!90302 res!690585) b!1033593))

(assert (= (and b!1033593 res!690587) b!1033595))

(assert (= (and b!1033595 res!690586) b!1033594))

(assert (= (and b!1033599 condMapEmpty!38261) mapIsEmpty!38261))

(assert (= (and b!1033599 (not condMapEmpty!38261)) mapNonEmpty!38261))

(get-info :version)

(assert (= (and mapNonEmpty!38261 ((_ is ValueCellFull!11556) mapValue!38261)) b!1033596))

(assert (= (and b!1033599 ((_ is ValueCellFull!11556) mapDefault!38261)) b!1033598))

(assert (= b!1033597 b!1033599))

(assert (= start!90302 b!1033597))

(declare-fun b_lambda!16047 () Bool)

(assert (=> (not b_lambda!16047) (not b!1033595)))

(declare-fun t!31102 () Bool)

(declare-fun tb!7021 () Bool)

(assert (=> (and b!1033597 (= (defaultEntry!6227 thiss!1427) (defaultEntry!6227 thiss!1427)) t!31102) tb!7021))

(declare-fun result!14387 () Bool)

(assert (=> tb!7021 (= result!14387 tp_is_empty!24519)))

(assert (=> b!1033595 t!31102))

(declare-fun b_and!33271 () Bool)

(assert (= b_and!33269 (and (=> t!31102 result!14387) b_and!33271)))

(declare-fun m!953293 () Bool)

(assert (=> b!1033597 m!953293))

(declare-fun m!953295 () Bool)

(assert (=> b!1033597 m!953295))

(declare-fun m!953297 () Bool)

(assert (=> b!1033594 m!953297))

(declare-fun m!953299 () Bool)

(assert (=> b!1033594 m!953299))

(assert (=> b!1033594 m!953299))

(declare-fun m!953301 () Bool)

(assert (=> b!1033594 m!953301))

(declare-fun m!953303 () Bool)

(assert (=> mapNonEmpty!38261 m!953303))

(declare-fun m!953305 () Bool)

(assert (=> start!90302 m!953305))

(declare-fun m!953307 () Bool)

(assert (=> b!1033595 m!953307))

(declare-fun m!953309 () Bool)

(assert (=> b!1033595 m!953309))

(declare-fun m!953311 () Bool)

(assert (=> b!1033595 m!953311))

(declare-fun m!953313 () Bool)

(assert (=> b!1033595 m!953313))

(declare-fun m!953315 () Bool)

(assert (=> b!1033595 m!953315))

(declare-fun m!953317 () Bool)

(assert (=> b!1033595 m!953317))

(assert (=> b!1033595 m!953315))

(check-sat (not b!1033597) (not start!90302) (not b!1033594) tp_is_empty!24519 (not mapNonEmpty!38261) (not b!1033595) b_and!33271 (not b_next!20799) (not b_lambda!16047))
(check-sat b_and!33271 (not b_next!20799))
(get-model)

(declare-fun b_lambda!16051 () Bool)

(assert (= b_lambda!16047 (or (and b!1033597 b_free!20799) b_lambda!16051)))

(check-sat (not b!1033597) (not start!90302) (not b!1033594) tp_is_empty!24519 (not mapNonEmpty!38261) (not b!1033595) b_and!33271 (not b_next!20799) (not b_lambda!16051))
(check-sat b_and!33271 (not b_next!20799))
(get-model)

(declare-fun d!123805 () Bool)

(declare-fun res!690603 () Bool)

(declare-fun e!584269 () Bool)

(assert (=> d!123805 (=> (not res!690603) (not e!584269))))

(declare-fun simpleValid!405 (LongMapFixedSize!5706) Bool)

(assert (=> d!123805 (= res!690603 (simpleValid!405 thiss!1427))))

(assert (=> d!123805 (= (valid!2156 thiss!1427) e!584269)))

(declare-fun b!1033631 () Bool)

(declare-fun res!690604 () Bool)

(assert (=> b!1033631 (=> (not res!690604) (not e!584269))))

(declare-fun arrayCountValidKeys!0 (array!65118 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1033631 (= res!690604 (= (arrayCountValidKeys!0 (_keys!11407 thiss!1427) #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))) (_size!2908 thiss!1427)))))

(declare-fun b!1033632 () Bool)

(declare-fun res!690605 () Bool)

(assert (=> b!1033632 (=> (not res!690605) (not e!584269))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65118 (_ BitVec 32)) Bool)

(assert (=> b!1033632 (= res!690605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11407 thiss!1427) (mask!30084 thiss!1427)))))

(declare-fun b!1033633 () Bool)

(declare-datatypes ((List!21907 0))(
  ( (Nil!21904) (Cons!21903 (h!23105 (_ BitVec 64)) (t!31107 List!21907)) )
))
(declare-fun arrayNoDuplicates!0 (array!65118 (_ BitVec 32) List!21907) Bool)

(assert (=> b!1033633 (= e!584269 (arrayNoDuplicates!0 (_keys!11407 thiss!1427) #b00000000000000000000000000000000 Nil!21904))))

(assert (= (and d!123805 res!690603) b!1033631))

(assert (= (and b!1033631 res!690604) b!1033632))

(assert (= (and b!1033632 res!690605) b!1033633))

(declare-fun m!953345 () Bool)

(assert (=> d!123805 m!953345))

(declare-fun m!953347 () Bool)

(assert (=> b!1033631 m!953347))

(declare-fun m!953349 () Bool)

(assert (=> b!1033632 m!953349))

(declare-fun m!953351 () Bool)

(assert (=> b!1033633 m!953351))

(assert (=> start!90302 d!123805))

(declare-fun d!123807 () Bool)

(assert (=> d!123807 (= (array_inv!24255 (_keys!11407 thiss!1427)) (bvsge (size!31875 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033597 d!123807))

(declare-fun d!123809 () Bool)

(assert (=> d!123809 (= (array_inv!24256 (_values!6250 thiss!1427)) (bvsge (size!31876 (_values!6250 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033597 d!123809))

(declare-fun d!123811 () Bool)

(assert (=> d!123811 (= (-!520 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456137 () Unit!33831)

(declare-fun choose!1696 (array!65118 array!65120 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!37565 V!37565 V!37565 Int) Unit!33831)

(assert (=> d!123811 (= lt!456137 (choose!1696 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6063 thiss!1427) lt!456123 (minValue!6063 thiss!1427) (defaultEntry!6227 thiss!1427)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!123811 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123811 (= (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!12 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6063 thiss!1427) lt!456123 (minValue!6063 thiss!1427) (defaultEntry!6227 thiss!1427)) lt!456137)))

(declare-fun bs!30211 () Bool)

(assert (= bs!30211 d!123811))

(declare-fun m!953353 () Bool)

(assert (=> bs!30211 m!953353))

(assert (=> bs!30211 m!953315))

(assert (=> bs!30211 m!953317))

(declare-fun m!953355 () Bool)

(assert (=> bs!30211 m!953355))

(assert (=> bs!30211 m!953311))

(assert (=> bs!30211 m!953315))

(assert (=> b!1033595 d!123811))

(declare-fun bm!43656 () Bool)

(declare-fun call!43660 () Bool)

(declare-fun lt!456196 () ListLongMap!13755)

(declare-fun contains!6012 (ListLongMap!13755 (_ BitVec 64)) Bool)

(assert (=> bm!43656 (= call!43660 (contains!6012 lt!456196 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033676 () Bool)

(declare-fun e!584308 () ListLongMap!13755)

(declare-fun call!43663 () ListLongMap!13755)

(declare-fun +!3104 (ListLongMap!13755 tuple2!15726) ListLongMap!13755)

(assert (=> b!1033676 (= e!584308 (+!3104 call!43663 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun b!1033677 () Bool)

(declare-fun e!584299 () Bool)

(declare-fun apply!906 (ListLongMap!13755 (_ BitVec 64)) V!37565)

(assert (=> b!1033677 (= e!584299 (= (apply!906 lt!456196 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6063 thiss!1427)))))

(declare-fun bm!43657 () Bool)

(declare-fun call!43664 () ListLongMap!13755)

(assert (=> bm!43657 (= call!43664 call!43663)))

(declare-fun bm!43658 () Bool)

(declare-fun call!43661 () Bool)

(assert (=> bm!43658 (= call!43661 (contains!6012 lt!456196 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033679 () Bool)

(declare-fun e!584304 () Unit!33831)

(declare-fun lt!456201 () Unit!33831)

(assert (=> b!1033679 (= e!584304 lt!456201)))

(declare-fun lt!456203 () ListLongMap!13755)

(declare-fun getCurrentListMapNoExtraKeys!3520 (array!65118 array!65120 (_ BitVec 32) (_ BitVec 32) V!37565 V!37565 (_ BitVec 32) Int) ListLongMap!13755)

(assert (=> b!1033679 (= lt!456203 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456189 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456188 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456188 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456198 () Unit!33831)

(declare-fun addStillContains!625 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> b!1033679 (= lt!456198 (addStillContains!625 lt!456203 lt!456189 lt!456123 lt!456188))))

(assert (=> b!1033679 (contains!6012 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)) lt!456188)))

(declare-fun lt!456192 () Unit!33831)

(assert (=> b!1033679 (= lt!456192 lt!456198)))

(declare-fun lt!456193 () ListLongMap!13755)

(assert (=> b!1033679 (= lt!456193 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456202 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456202 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456187 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456187 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456191 () Unit!33831)

(declare-fun addApplyDifferent!485 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> b!1033679 (= lt!456191 (addApplyDifferent!485 lt!456193 lt!456202 (minValue!6063 thiss!1427) lt!456187))))

(assert (=> b!1033679 (= (apply!906 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456187) (apply!906 lt!456193 lt!456187))))

(declare-fun lt!456183 () Unit!33831)

(assert (=> b!1033679 (= lt!456183 lt!456191)))

(declare-fun lt!456182 () ListLongMap!13755)

(assert (=> b!1033679 (= lt!456182 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456200 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456195 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456195 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456199 () Unit!33831)

(assert (=> b!1033679 (= lt!456199 (addApplyDifferent!485 lt!456182 lt!456200 lt!456123 lt!456195))))

(assert (=> b!1033679 (= (apply!906 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)) lt!456195) (apply!906 lt!456182 lt!456195))))

(declare-fun lt!456194 () Unit!33831)

(assert (=> b!1033679 (= lt!456194 lt!456199)))

(declare-fun lt!456186 () ListLongMap!13755)

(assert (=> b!1033679 (= lt!456186 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456197 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456197 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456185 () (_ BitVec 64))

(assert (=> b!1033679 (= lt!456185 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033679 (= lt!456201 (addApplyDifferent!485 lt!456186 lt!456197 (minValue!6063 thiss!1427) lt!456185))))

(assert (=> b!1033679 (= (apply!906 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456185) (apply!906 lt!456186 lt!456185))))

(declare-fun b!1033680 () Bool)

(declare-fun e!584303 () Bool)

(declare-fun e!584300 () Bool)

(assert (=> b!1033680 (= e!584303 e!584300)))

(declare-fun res!690630 () Bool)

(assert (=> b!1033680 (=> (not res!690630) (not e!584300))))

(assert (=> b!1033680 (= res!690630 (contains!6012 lt!456196 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033680 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033681 () Bool)

(declare-fun e!584302 () Bool)

(declare-fun e!584296 () Bool)

(assert (=> b!1033681 (= e!584302 e!584296)))

(declare-fun c!104387 () Bool)

(assert (=> b!1033681 (= c!104387 (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033682 () Bool)

(declare-fun e!584307 () ListLongMap!13755)

(declare-fun call!43659 () ListLongMap!13755)

(assert (=> b!1033682 (= e!584307 call!43659)))

(declare-fun b!1033683 () Bool)

(declare-fun res!690632 () Bool)

(assert (=> b!1033683 (=> (not res!690632) (not e!584302))))

(assert (=> b!1033683 (= res!690632 e!584303)))

(declare-fun res!690626 () Bool)

(assert (=> b!1033683 (=> res!690626 e!584303)))

(declare-fun e!584305 () Bool)

(assert (=> b!1033683 (= res!690626 (not e!584305))))

(declare-fun res!690629 () Bool)

(assert (=> b!1033683 (=> (not res!690629) (not e!584305))))

(assert (=> b!1033683 (= res!690629 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033684 () Bool)

(assert (=> b!1033684 (= e!584296 (not call!43660))))

(declare-fun b!1033685 () Bool)

(declare-fun e!584298 () Bool)

(declare-fun e!584306 () Bool)

(assert (=> b!1033685 (= e!584298 e!584306)))

(declare-fun res!690631 () Bool)

(assert (=> b!1033685 (= res!690631 call!43661)))

(assert (=> b!1033685 (=> (not res!690631) (not e!584306))))

(declare-fun b!1033686 () Bool)

(declare-fun c!104384 () Bool)

(assert (=> b!1033686 (= c!104384 (and (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!584297 () ListLongMap!13755)

(assert (=> b!1033686 (= e!584297 e!584307)))

(declare-fun b!1033687 () Bool)

(assert (=> b!1033687 (= e!584308 e!584297)))

(declare-fun c!104388 () Bool)

(assert (=> b!1033687 (= c!104388 (and (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033688 () Bool)

(declare-fun res!690627 () Bool)

(assert (=> b!1033688 (=> (not res!690627) (not e!584302))))

(assert (=> b!1033688 (= res!690627 e!584298)))

(declare-fun c!104385 () Bool)

(assert (=> b!1033688 (= c!104385 (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033689 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1033689 (= e!584305 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43659 () Bool)

(declare-fun call!43665 () ListLongMap!13755)

(declare-fun call!43662 () ListLongMap!13755)

(assert (=> bm!43659 (= call!43665 call!43662)))

(declare-fun b!1033690 () Bool)

(assert (=> b!1033690 (= e!584297 call!43664)))

(declare-fun c!104383 () Bool)

(declare-fun bm!43660 () Bool)

(assert (=> bm!43660 (= call!43663 (+!3104 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun bm!43661 () Bool)

(assert (=> bm!43661 (= call!43662 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1033691 () Bool)

(assert (=> b!1033691 (= e!584298 (not call!43661))))

(declare-fun b!1033692 () Bool)

(assert (=> b!1033692 (= e!584307 call!43664)))

(declare-fun bm!43662 () Bool)

(assert (=> bm!43662 (= call!43659 call!43665)))

(declare-fun b!1033693 () Bool)

(declare-fun e!584301 () Bool)

(assert (=> b!1033693 (= e!584301 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033694 () Bool)

(declare-fun Unit!33835 () Unit!33831)

(assert (=> b!1033694 (= e!584304 Unit!33835)))

(declare-fun b!1033695 () Bool)

(assert (=> b!1033695 (= e!584306 (= (apply!906 lt!456196 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456123))))

(declare-fun b!1033696 () Bool)

(declare-fun get!16433 (ValueCell!11556 V!37565) V!37565)

(assert (=> b!1033696 (= e!584300 (= (apply!906 lt!456196 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1033696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033678 () Bool)

(assert (=> b!1033678 (= e!584296 e!584299)))

(declare-fun res!690628 () Bool)

(assert (=> b!1033678 (= res!690628 call!43660)))

(assert (=> b!1033678 (=> (not res!690628) (not e!584299))))

(declare-fun d!123813 () Bool)

(assert (=> d!123813 e!584302))

(declare-fun res!690625 () Bool)

(assert (=> d!123813 (=> (not res!690625) (not e!584302))))

(assert (=> d!123813 (= res!690625 (or (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))))

(declare-fun lt!456184 () ListLongMap!13755)

(assert (=> d!123813 (= lt!456196 lt!456184)))

(declare-fun lt!456190 () Unit!33831)

(assert (=> d!123813 (= lt!456190 e!584304)))

(declare-fun c!104386 () Bool)

(assert (=> d!123813 (= c!104386 e!584301)))

(declare-fun res!690624 () Bool)

(assert (=> d!123813 (=> (not res!690624) (not e!584301))))

(assert (=> d!123813 (= res!690624 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123813 (= lt!456184 e!584308)))

(assert (=> d!123813 (= c!104383 (and (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123813 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123813 (= (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) lt!456196)))

(assert (= (and d!123813 c!104383) b!1033676))

(assert (= (and d!123813 (not c!104383)) b!1033687))

(assert (= (and b!1033687 c!104388) b!1033690))

(assert (= (and b!1033687 (not c!104388)) b!1033686))

(assert (= (and b!1033686 c!104384) b!1033692))

(assert (= (and b!1033686 (not c!104384)) b!1033682))

(assert (= (or b!1033692 b!1033682) bm!43662))

(assert (= (or b!1033690 bm!43662) bm!43659))

(assert (= (or b!1033690 b!1033692) bm!43657))

(assert (= (or b!1033676 bm!43659) bm!43661))

(assert (= (or b!1033676 bm!43657) bm!43660))

(assert (= (and d!123813 res!690624) b!1033693))

(assert (= (and d!123813 c!104386) b!1033679))

(assert (= (and d!123813 (not c!104386)) b!1033694))

(assert (= (and d!123813 res!690625) b!1033683))

(assert (= (and b!1033683 res!690629) b!1033689))

(assert (= (and b!1033683 (not res!690626)) b!1033680))

(assert (= (and b!1033680 res!690630) b!1033696))

(assert (= (and b!1033683 res!690632) b!1033688))

(assert (= (and b!1033688 c!104385) b!1033685))

(assert (= (and b!1033688 (not c!104385)) b!1033691))

(assert (= (and b!1033685 res!690631) b!1033695))

(assert (= (or b!1033685 b!1033691) bm!43658))

(assert (= (and b!1033688 res!690627) b!1033681))

(assert (= (and b!1033681 c!104387) b!1033678))

(assert (= (and b!1033681 (not c!104387)) b!1033684))

(assert (= (and b!1033678 res!690628) b!1033677))

(assert (= (or b!1033678 b!1033684) bm!43656))

(declare-fun b_lambda!16053 () Bool)

(assert (=> (not b_lambda!16053) (not b!1033696)))

(assert (=> b!1033696 t!31102))

(declare-fun b_and!33277 () Bool)

(assert (= b_and!33271 (and (=> t!31102 result!14387) b_and!33277)))

(declare-fun m!953357 () Bool)

(assert (=> bm!43661 m!953357))

(declare-fun m!953359 () Bool)

(assert (=> b!1033696 m!953359))

(assert (=> b!1033696 m!953309))

(declare-fun m!953361 () Bool)

(assert (=> b!1033696 m!953361))

(declare-fun m!953363 () Bool)

(assert (=> b!1033696 m!953363))

(assert (=> b!1033696 m!953359))

(assert (=> b!1033696 m!953309))

(declare-fun m!953365 () Bool)

(assert (=> b!1033696 m!953365))

(assert (=> b!1033696 m!953361))

(declare-fun m!953367 () Bool)

(assert (=> bm!43658 m!953367))

(declare-fun m!953369 () Bool)

(assert (=> bm!43656 m!953369))

(assert (=> b!1033689 m!953361))

(assert (=> b!1033689 m!953361))

(declare-fun m!953371 () Bool)

(assert (=> b!1033689 m!953371))

(declare-fun m!953373 () Bool)

(assert (=> b!1033695 m!953373))

(declare-fun m!953375 () Bool)

(assert (=> b!1033679 m!953375))

(declare-fun m!953377 () Bool)

(assert (=> b!1033679 m!953377))

(assert (=> b!1033679 m!953375))

(declare-fun m!953379 () Bool)

(assert (=> b!1033679 m!953379))

(declare-fun m!953381 () Bool)

(assert (=> b!1033679 m!953381))

(declare-fun m!953383 () Bool)

(assert (=> b!1033679 m!953383))

(declare-fun m!953385 () Bool)

(assert (=> b!1033679 m!953385))

(declare-fun m!953387 () Bool)

(assert (=> b!1033679 m!953387))

(assert (=> b!1033679 m!953387))

(declare-fun m!953389 () Bool)

(assert (=> b!1033679 m!953389))

(assert (=> b!1033679 m!953357))

(declare-fun m!953391 () Bool)

(assert (=> b!1033679 m!953391))

(declare-fun m!953393 () Bool)

(assert (=> b!1033679 m!953393))

(assert (=> b!1033679 m!953361))

(declare-fun m!953395 () Bool)

(assert (=> b!1033679 m!953395))

(declare-fun m!953397 () Bool)

(assert (=> b!1033679 m!953397))

(assert (=> b!1033679 m!953381))

(declare-fun m!953399 () Bool)

(assert (=> b!1033679 m!953399))

(declare-fun m!953401 () Bool)

(assert (=> b!1033679 m!953401))

(declare-fun m!953403 () Bool)

(assert (=> b!1033679 m!953403))

(assert (=> b!1033679 m!953399))

(assert (=> b!1033680 m!953361))

(assert (=> b!1033680 m!953361))

(declare-fun m!953405 () Bool)

(assert (=> b!1033680 m!953405))

(assert (=> b!1033693 m!953361))

(assert (=> b!1033693 m!953361))

(assert (=> b!1033693 m!953371))

(declare-fun m!953407 () Bool)

(assert (=> b!1033676 m!953407))

(declare-fun m!953409 () Bool)

(assert (=> b!1033677 m!953409))

(assert (=> d!123813 m!953355))

(declare-fun m!953411 () Bool)

(assert (=> bm!43660 m!953411))

(assert (=> b!1033595 d!123813))

(declare-fun d!123815 () Bool)

(declare-fun res!690633 () Bool)

(declare-fun e!584309 () Bool)

(assert (=> d!123815 (=> (not res!690633) (not e!584309))))

(assert (=> d!123815 (= res!690633 (simpleValid!405 lt!456124))))

(assert (=> d!123815 (= (valid!2156 lt!456124) e!584309)))

(declare-fun b!1033697 () Bool)

(declare-fun res!690634 () Bool)

(assert (=> b!1033697 (=> (not res!690634) (not e!584309))))

(assert (=> b!1033697 (= res!690634 (= (arrayCountValidKeys!0 (_keys!11407 lt!456124) #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))) (_size!2908 lt!456124)))))

(declare-fun b!1033698 () Bool)

(declare-fun res!690635 () Bool)

(assert (=> b!1033698 (=> (not res!690635) (not e!584309))))

(assert (=> b!1033698 (= res!690635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11407 lt!456124) (mask!30084 lt!456124)))))

(declare-fun b!1033699 () Bool)

(assert (=> b!1033699 (= e!584309 (arrayNoDuplicates!0 (_keys!11407 lt!456124) #b00000000000000000000000000000000 Nil!21904))))

(assert (= (and d!123815 res!690633) b!1033697))

(assert (= (and b!1033697 res!690634) b!1033698))

(assert (= (and b!1033698 res!690635) b!1033699))

(declare-fun m!953413 () Bool)

(assert (=> d!123815 m!953413))

(declare-fun m!953415 () Bool)

(assert (=> b!1033697 m!953415))

(declare-fun m!953417 () Bool)

(assert (=> b!1033698 m!953417))

(declare-fun m!953419 () Bool)

(assert (=> b!1033699 m!953419))

(assert (=> b!1033595 d!123815))

(declare-fun d!123817 () Bool)

(declare-fun lt!456206 () ListLongMap!13755)

(assert (=> d!123817 (not (contains!6012 lt!456206 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!56 (List!21905 (_ BitVec 64)) List!21905)

(assert (=> d!123817 (= lt!456206 (ListLongMap!13756 (removeStrictlySorted!56 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123817 (= (-!520 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456206)))

(declare-fun bs!30212 () Bool)

(assert (= bs!30212 d!123817))

(declare-fun m!953421 () Bool)

(assert (=> bs!30212 m!953421))

(declare-fun m!953423 () Bool)

(assert (=> bs!30212 m!953423))

(assert (=> b!1033595 d!123817))

(declare-fun bm!43663 () Bool)

(declare-fun call!43667 () Bool)

(declare-fun lt!456221 () ListLongMap!13755)

(assert (=> bm!43663 (= call!43667 (contains!6012 lt!456221 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033700 () Bool)

(declare-fun e!584322 () ListLongMap!13755)

(declare-fun call!43670 () ListLongMap!13755)

(assert (=> b!1033700 (= e!584322 (+!3104 call!43670 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun b!1033701 () Bool)

(declare-fun e!584313 () Bool)

(assert (=> b!1033701 (= e!584313 (= (apply!906 lt!456221 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6063 thiss!1427)))))

(declare-fun bm!43664 () Bool)

(declare-fun call!43671 () ListLongMap!13755)

(assert (=> bm!43664 (= call!43671 call!43670)))

(declare-fun bm!43665 () Bool)

(declare-fun call!43668 () Bool)

(assert (=> bm!43665 (= call!43668 (contains!6012 lt!456221 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033703 () Bool)

(declare-fun e!584318 () Unit!33831)

(declare-fun lt!456226 () Unit!33831)

(assert (=> b!1033703 (= e!584318 lt!456226)))

(declare-fun lt!456228 () ListLongMap!13755)

(assert (=> b!1033703 (= lt!456228 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456214 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456214 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456213 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456213 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456223 () Unit!33831)

(assert (=> b!1033703 (= lt!456223 (addStillContains!625 lt!456228 lt!456214 (zeroValue!6063 thiss!1427) lt!456213))))

(assert (=> b!1033703 (contains!6012 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456213)))

(declare-fun lt!456217 () Unit!33831)

(assert (=> b!1033703 (= lt!456217 lt!456223)))

(declare-fun lt!456218 () ListLongMap!13755)

(assert (=> b!1033703 (= lt!456218 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456227 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456227 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456212 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456212 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456216 () Unit!33831)

(assert (=> b!1033703 (= lt!456216 (addApplyDifferent!485 lt!456218 lt!456227 (minValue!6063 thiss!1427) lt!456212))))

(assert (=> b!1033703 (= (apply!906 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456212) (apply!906 lt!456218 lt!456212))))

(declare-fun lt!456208 () Unit!33831)

(assert (=> b!1033703 (= lt!456208 lt!456216)))

(declare-fun lt!456207 () ListLongMap!13755)

(assert (=> b!1033703 (= lt!456207 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456225 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456225 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456220 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456220 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456224 () Unit!33831)

(assert (=> b!1033703 (= lt!456224 (addApplyDifferent!485 lt!456207 lt!456225 (zeroValue!6063 thiss!1427) lt!456220))))

(assert (=> b!1033703 (= (apply!906 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456220) (apply!906 lt!456207 lt!456220))))

(declare-fun lt!456219 () Unit!33831)

(assert (=> b!1033703 (= lt!456219 lt!456224)))

(declare-fun lt!456211 () ListLongMap!13755)

(assert (=> b!1033703 (= lt!456211 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun lt!456222 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456222 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456210 () (_ BitVec 64))

(assert (=> b!1033703 (= lt!456210 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033703 (= lt!456226 (addApplyDifferent!485 lt!456211 lt!456222 (minValue!6063 thiss!1427) lt!456210))))

(assert (=> b!1033703 (= (apply!906 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456210) (apply!906 lt!456211 lt!456210))))

(declare-fun b!1033704 () Bool)

(declare-fun e!584317 () Bool)

(declare-fun e!584314 () Bool)

(assert (=> b!1033704 (= e!584317 e!584314)))

(declare-fun res!690642 () Bool)

(assert (=> b!1033704 (=> (not res!690642) (not e!584314))))

(assert (=> b!1033704 (= res!690642 (contains!6012 lt!456221 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033705 () Bool)

(declare-fun e!584316 () Bool)

(declare-fun e!584310 () Bool)

(assert (=> b!1033705 (= e!584316 e!584310)))

(declare-fun c!104393 () Bool)

(assert (=> b!1033705 (= c!104393 (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033706 () Bool)

(declare-fun e!584321 () ListLongMap!13755)

(declare-fun call!43666 () ListLongMap!13755)

(assert (=> b!1033706 (= e!584321 call!43666)))

(declare-fun b!1033707 () Bool)

(declare-fun res!690644 () Bool)

(assert (=> b!1033707 (=> (not res!690644) (not e!584316))))

(assert (=> b!1033707 (= res!690644 e!584317)))

(declare-fun res!690638 () Bool)

(assert (=> b!1033707 (=> res!690638 e!584317)))

(declare-fun e!584319 () Bool)

(assert (=> b!1033707 (= res!690638 (not e!584319))))

(declare-fun res!690641 () Bool)

(assert (=> b!1033707 (=> (not res!690641) (not e!584319))))

(assert (=> b!1033707 (= res!690641 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033708 () Bool)

(assert (=> b!1033708 (= e!584310 (not call!43667))))

(declare-fun b!1033709 () Bool)

(declare-fun e!584312 () Bool)

(declare-fun e!584320 () Bool)

(assert (=> b!1033709 (= e!584312 e!584320)))

(declare-fun res!690643 () Bool)

(assert (=> b!1033709 (= res!690643 call!43668)))

(assert (=> b!1033709 (=> (not res!690643) (not e!584320))))

(declare-fun b!1033710 () Bool)

(declare-fun c!104390 () Bool)

(assert (=> b!1033710 (= c!104390 (and (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!584311 () ListLongMap!13755)

(assert (=> b!1033710 (= e!584311 e!584321)))

(declare-fun b!1033711 () Bool)

(assert (=> b!1033711 (= e!584322 e!584311)))

(declare-fun c!104394 () Bool)

(assert (=> b!1033711 (= c!104394 (and (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033712 () Bool)

(declare-fun res!690639 () Bool)

(assert (=> b!1033712 (=> (not res!690639) (not e!584316))))

(assert (=> b!1033712 (= res!690639 e!584312)))

(declare-fun c!104391 () Bool)

(assert (=> b!1033712 (= c!104391 (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033713 () Bool)

(assert (=> b!1033713 (= e!584319 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun bm!43666 () Bool)

(declare-fun call!43672 () ListLongMap!13755)

(declare-fun call!43669 () ListLongMap!13755)

(assert (=> bm!43666 (= call!43672 call!43669)))

(declare-fun b!1033714 () Bool)

(assert (=> b!1033714 (= e!584311 call!43671)))

(declare-fun bm!43667 () Bool)

(declare-fun c!104389 () Bool)

(assert (=> bm!43667 (= call!43670 (+!3104 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun bm!43668 () Bool)

(assert (=> bm!43668 (= call!43669 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1033715 () Bool)

(assert (=> b!1033715 (= e!584312 (not call!43668))))

(declare-fun b!1033716 () Bool)

(assert (=> b!1033716 (= e!584321 call!43671)))

(declare-fun bm!43669 () Bool)

(assert (=> bm!43669 (= call!43666 call!43672)))

(declare-fun b!1033717 () Bool)

(declare-fun e!584315 () Bool)

(assert (=> b!1033717 (= e!584315 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033718 () Bool)

(declare-fun Unit!33836 () Unit!33831)

(assert (=> b!1033718 (= e!584318 Unit!33836)))

(declare-fun b!1033719 () Bool)

(assert (=> b!1033719 (= e!584320 (= (apply!906 lt!456221 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6063 thiss!1427)))))

(declare-fun b!1033720 () Bool)

(assert (=> b!1033720 (= e!584314 (= (apply!906 lt!456221 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1033720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033702 () Bool)

(assert (=> b!1033702 (= e!584310 e!584313)))

(declare-fun res!690640 () Bool)

(assert (=> b!1033702 (= res!690640 call!43667)))

(assert (=> b!1033702 (=> (not res!690640) (not e!584313))))

(declare-fun d!123819 () Bool)

(assert (=> d!123819 e!584316))

(declare-fun res!690637 () Bool)

(assert (=> d!123819 (=> (not res!690637) (not e!584316))))

(assert (=> d!123819 (= res!690637 (or (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))))

(declare-fun lt!456209 () ListLongMap!13755)

(assert (=> d!123819 (= lt!456221 lt!456209)))

(declare-fun lt!456215 () Unit!33831)

(assert (=> d!123819 (= lt!456215 e!584318)))

(declare-fun c!104392 () Bool)

(assert (=> d!123819 (= c!104392 e!584315)))

(declare-fun res!690636 () Bool)

(assert (=> d!123819 (=> (not res!690636) (not e!584315))))

(assert (=> d!123819 (= res!690636 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123819 (= lt!456209 e!584322)))

(assert (=> d!123819 (= c!104389 (and (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123819 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123819 (= (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) lt!456221)))

(assert (= (and d!123819 c!104389) b!1033700))

(assert (= (and d!123819 (not c!104389)) b!1033711))

(assert (= (and b!1033711 c!104394) b!1033714))

(assert (= (and b!1033711 (not c!104394)) b!1033710))

(assert (= (and b!1033710 c!104390) b!1033716))

(assert (= (and b!1033710 (not c!104390)) b!1033706))

(assert (= (or b!1033716 b!1033706) bm!43669))

(assert (= (or b!1033714 bm!43669) bm!43666))

(assert (= (or b!1033714 b!1033716) bm!43664))

(assert (= (or b!1033700 bm!43666) bm!43668))

(assert (= (or b!1033700 bm!43664) bm!43667))

(assert (= (and d!123819 res!690636) b!1033717))

(assert (= (and d!123819 c!104392) b!1033703))

(assert (= (and d!123819 (not c!104392)) b!1033718))

(assert (= (and d!123819 res!690637) b!1033707))

(assert (= (and b!1033707 res!690641) b!1033713))

(assert (= (and b!1033707 (not res!690638)) b!1033704))

(assert (= (and b!1033704 res!690642) b!1033720))

(assert (= (and b!1033707 res!690644) b!1033712))

(assert (= (and b!1033712 c!104391) b!1033709))

(assert (= (and b!1033712 (not c!104391)) b!1033715))

(assert (= (and b!1033709 res!690643) b!1033719))

(assert (= (or b!1033709 b!1033715) bm!43665))

(assert (= (and b!1033712 res!690639) b!1033705))

(assert (= (and b!1033705 c!104393) b!1033702))

(assert (= (and b!1033705 (not c!104393)) b!1033708))

(assert (= (and b!1033702 res!690640) b!1033701))

(assert (= (or b!1033702 b!1033708) bm!43663))

(declare-fun b_lambda!16055 () Bool)

(assert (=> (not b_lambda!16055) (not b!1033720)))

(assert (=> b!1033720 t!31102))

(declare-fun b_and!33279 () Bool)

(assert (= b_and!33277 (and (=> t!31102 result!14387) b_and!33279)))

(declare-fun m!953425 () Bool)

(assert (=> bm!43668 m!953425))

(assert (=> b!1033720 m!953359))

(assert (=> b!1033720 m!953309))

(assert (=> b!1033720 m!953361))

(declare-fun m!953427 () Bool)

(assert (=> b!1033720 m!953427))

(assert (=> b!1033720 m!953359))

(assert (=> b!1033720 m!953309))

(assert (=> b!1033720 m!953365))

(assert (=> b!1033720 m!953361))

(declare-fun m!953429 () Bool)

(assert (=> bm!43665 m!953429))

(declare-fun m!953431 () Bool)

(assert (=> bm!43663 m!953431))

(assert (=> b!1033713 m!953361))

(assert (=> b!1033713 m!953361))

(assert (=> b!1033713 m!953371))

(declare-fun m!953433 () Bool)

(assert (=> b!1033719 m!953433))

(declare-fun m!953435 () Bool)

(assert (=> b!1033703 m!953435))

(declare-fun m!953437 () Bool)

(assert (=> b!1033703 m!953437))

(assert (=> b!1033703 m!953435))

(declare-fun m!953439 () Bool)

(assert (=> b!1033703 m!953439))

(declare-fun m!953441 () Bool)

(assert (=> b!1033703 m!953441))

(declare-fun m!953443 () Bool)

(assert (=> b!1033703 m!953443))

(declare-fun m!953445 () Bool)

(assert (=> b!1033703 m!953445))

(declare-fun m!953447 () Bool)

(assert (=> b!1033703 m!953447))

(assert (=> b!1033703 m!953447))

(declare-fun m!953449 () Bool)

(assert (=> b!1033703 m!953449))

(assert (=> b!1033703 m!953425))

(declare-fun m!953451 () Bool)

(assert (=> b!1033703 m!953451))

(declare-fun m!953453 () Bool)

(assert (=> b!1033703 m!953453))

(assert (=> b!1033703 m!953361))

(declare-fun m!953455 () Bool)

(assert (=> b!1033703 m!953455))

(declare-fun m!953457 () Bool)

(assert (=> b!1033703 m!953457))

(assert (=> b!1033703 m!953441))

(declare-fun m!953459 () Bool)

(assert (=> b!1033703 m!953459))

(declare-fun m!953461 () Bool)

(assert (=> b!1033703 m!953461))

(declare-fun m!953463 () Bool)

(assert (=> b!1033703 m!953463))

(assert (=> b!1033703 m!953459))

(assert (=> b!1033704 m!953361))

(assert (=> b!1033704 m!953361))

(declare-fun m!953465 () Bool)

(assert (=> b!1033704 m!953465))

(assert (=> b!1033717 m!953361))

(assert (=> b!1033717 m!953361))

(assert (=> b!1033717 m!953371))

(declare-fun m!953467 () Bool)

(assert (=> b!1033700 m!953467))

(declare-fun m!953469 () Bool)

(assert (=> b!1033701 m!953469))

(assert (=> d!123819 m!953355))

(declare-fun m!953471 () Bool)

(assert (=> bm!43667 m!953471))

(assert (=> b!1033595 d!123819))

(declare-fun d!123821 () Bool)

(assert (=> d!123821 (= (map!14701 lt!456124) (getCurrentListMap!3941 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun bs!30213 () Bool)

(assert (= bs!30213 d!123821))

(declare-fun m!953473 () Bool)

(assert (=> bs!30213 m!953473))

(assert (=> b!1033594 d!123821))

(declare-fun d!123823 () Bool)

(declare-fun lt!456229 () ListLongMap!13755)

(assert (=> d!123823 (not (contains!6012 lt!456229 key!909))))

(assert (=> d!123823 (= lt!456229 (ListLongMap!13756 (removeStrictlySorted!56 (toList!6893 (map!14701 thiss!1427)) key!909)))))

(assert (=> d!123823 (= (-!520 (map!14701 thiss!1427) key!909) lt!456229)))

(declare-fun bs!30214 () Bool)

(assert (= bs!30214 d!123823))

(declare-fun m!953475 () Bool)

(assert (=> bs!30214 m!953475))

(declare-fun m!953477 () Bool)

(assert (=> bs!30214 m!953477))

(assert (=> b!1033594 d!123823))

(declare-fun d!123825 () Bool)

(assert (=> d!123825 (= (map!14701 thiss!1427) (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(declare-fun bs!30215 () Bool)

(assert (= bs!30215 d!123825))

(assert (=> bs!30215 m!953315))

(assert (=> b!1033594 d!123825))

(declare-fun condMapEmpty!38267 () Bool)

(declare-fun mapDefault!38267 () ValueCell!11556)

(assert (=> mapNonEmpty!38261 (= condMapEmpty!38267 (= mapRest!38261 ((as const (Array (_ BitVec 32) ValueCell!11556)) mapDefault!38267)))))

(declare-fun e!584328 () Bool)

(declare-fun mapRes!38267 () Bool)

(assert (=> mapNonEmpty!38261 (= tp!73496 (and e!584328 mapRes!38267))))

(declare-fun mapNonEmpty!38267 () Bool)

(declare-fun tp!73506 () Bool)

(declare-fun e!584327 () Bool)

(assert (=> mapNonEmpty!38267 (= mapRes!38267 (and tp!73506 e!584327))))

(declare-fun mapKey!38267 () (_ BitVec 32))

(declare-fun mapValue!38267 () ValueCell!11556)

(declare-fun mapRest!38267 () (Array (_ BitVec 32) ValueCell!11556))

(assert (=> mapNonEmpty!38267 (= mapRest!38261 (store mapRest!38267 mapKey!38267 mapValue!38267))))

(declare-fun b!1033727 () Bool)

(assert (=> b!1033727 (= e!584327 tp_is_empty!24519)))

(declare-fun b!1033728 () Bool)

(assert (=> b!1033728 (= e!584328 tp_is_empty!24519)))

(declare-fun mapIsEmpty!38267 () Bool)

(assert (=> mapIsEmpty!38267 mapRes!38267))

(assert (= (and mapNonEmpty!38261 condMapEmpty!38267) mapIsEmpty!38267))

(assert (= (and mapNonEmpty!38261 (not condMapEmpty!38267)) mapNonEmpty!38267))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11556) mapValue!38267)) b!1033727))

(assert (= (and mapNonEmpty!38261 ((_ is ValueCellFull!11556) mapDefault!38267)) b!1033728))

(declare-fun m!953479 () Bool)

(assert (=> mapNonEmpty!38267 m!953479))

(declare-fun b_lambda!16057 () Bool)

(assert (= b_lambda!16055 (or (and b!1033597 b_free!20799) b_lambda!16057)))

(declare-fun b_lambda!16059 () Bool)

(assert (= b_lambda!16053 (or (and b!1033597 b_free!20799) b_lambda!16059)))

(check-sat (not bm!43667) (not bm!43660) (not b!1033713) (not b!1033633) (not d!123815) (not b!1033701) (not d!123823) (not b!1033703) (not b!1033676) (not d!123821) (not b!1033693) (not bm!43656) (not b!1033695) (not b!1033719) (not bm!43663) (not d!123825) (not d!123817) (not bm!43661) (not b_lambda!16057) (not d!123811) (not b!1033689) (not b!1033704) (not d!123805) (not d!123813) (not b!1033696) tp_is_empty!24519 (not bm!43658) (not b!1033697) (not b!1033631) (not mapNonEmpty!38267) (not d!123819) (not b!1033699) (not b!1033700) (not b!1033679) b_and!33279 (not b_next!20799) (not b!1033632) (not b!1033677) (not b_lambda!16051) (not bm!43668) (not b!1033698) (not b!1033717) (not bm!43665) (not b!1033680) (not b_lambda!16059) (not b!1033720))
(check-sat b_and!33279 (not b_next!20799))
(get-model)

(declare-fun d!123827 () Bool)

(declare-datatypes ((Option!639 0))(
  ( (Some!638 (v!14889 V!37565)) (None!637) )
))
(declare-fun get!16434 (Option!639) V!37565)

(declare-fun getValueByKey!588 (List!21905 (_ BitVec 64)) Option!639)

(assert (=> d!123827 (= (apply!906 lt!456221 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30216 () Bool)

(assert (= bs!30216 d!123827))

(declare-fun m!953481 () Bool)

(assert (=> bs!30216 m!953481))

(assert (=> bs!30216 m!953481))

(declare-fun m!953483 () Bool)

(assert (=> bs!30216 m!953483))

(assert (=> b!1033701 d!123827))

(declare-fun b!1033737 () Bool)

(declare-fun e!584335 () Bool)

(declare-fun e!584337 () Bool)

(assert (=> b!1033737 (= e!584335 e!584337)))

(declare-fun lt!456237 () (_ BitVec 64))

(assert (=> b!1033737 (= lt!456237 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(declare-fun lt!456236 () Unit!33831)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!65118 (_ BitVec 64) (_ BitVec 32)) Unit!33831)

(assert (=> b!1033737 (= lt!456236 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!65118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1033737 (arrayContainsKey!0 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000)))

(declare-fun lt!456238 () Unit!33831)

(assert (=> b!1033737 (= lt!456238 lt!456236)))

(declare-fun res!690649 () Bool)

(declare-datatypes ((SeekEntryResult!9738 0))(
  ( (MissingZero!9738 (index!41323 (_ BitVec 32))) (Found!9738 (index!41324 (_ BitVec 32))) (Intermediate!9738 (undefined!10550 Bool) (index!41325 (_ BitVec 32)) (x!92225 (_ BitVec 32))) (Undefined!9738) (MissingVacant!9738 (index!41326 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!65118 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1033737 (= res!690649 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (_keys!11407 lt!456124) (mask!30084 lt!456124)) (Found!9738 #b00000000000000000000000000000000)))))

(assert (=> b!1033737 (=> (not res!690649) (not e!584337))))

(declare-fun b!1033738 () Bool)

(declare-fun call!43675 () Bool)

(assert (=> b!1033738 (= e!584337 call!43675)))

(declare-fun d!123829 () Bool)

(declare-fun res!690650 () Bool)

(declare-fun e!584336 () Bool)

(assert (=> d!123829 (=> res!690650 e!584336)))

(assert (=> d!123829 (= res!690650 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!123829 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11407 lt!456124) (mask!30084 lt!456124)) e!584336)))

(declare-fun b!1033739 () Bool)

(assert (=> b!1033739 (= e!584336 e!584335)))

(declare-fun c!104397 () Bool)

(assert (=> b!1033739 (= c!104397 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1033740 () Bool)

(assert (=> b!1033740 (= e!584335 call!43675)))

(declare-fun bm!43672 () Bool)

(assert (=> bm!43672 (= call!43675 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11407 lt!456124) (mask!30084 lt!456124)))))

(assert (= (and d!123829 (not res!690650)) b!1033739))

(assert (= (and b!1033739 c!104397) b!1033737))

(assert (= (and b!1033739 (not c!104397)) b!1033740))

(assert (= (and b!1033737 res!690649) b!1033738))

(assert (= (or b!1033738 b!1033740) bm!43672))

(declare-fun m!953485 () Bool)

(assert (=> b!1033737 m!953485))

(declare-fun m!953487 () Bool)

(assert (=> b!1033737 m!953487))

(declare-fun m!953489 () Bool)

(assert (=> b!1033737 m!953489))

(assert (=> b!1033737 m!953485))

(declare-fun m!953491 () Bool)

(assert (=> b!1033737 m!953491))

(assert (=> b!1033739 m!953485))

(assert (=> b!1033739 m!953485))

(declare-fun m!953493 () Bool)

(assert (=> b!1033739 m!953493))

(declare-fun m!953495 () Bool)

(assert (=> bm!43672 m!953495))

(assert (=> b!1033698 d!123829))

(declare-fun d!123831 () Bool)

(assert (=> d!123831 (= (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033717 d!123831))

(declare-fun d!123833 () Bool)

(declare-fun e!584340 () Bool)

(assert (=> d!123833 e!584340))

(declare-fun res!690655 () Bool)

(assert (=> d!123833 (=> (not res!690655) (not e!584340))))

(declare-fun lt!456247 () ListLongMap!13755)

(assert (=> d!123833 (= res!690655 (contains!6012 lt!456247 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456250 () List!21905)

(assert (=> d!123833 (= lt!456247 (ListLongMap!13756 lt!456250))))

(declare-fun lt!456249 () Unit!33831)

(declare-fun lt!456248 () Unit!33831)

(assert (=> d!123833 (= lt!456249 lt!456248)))

(assert (=> d!123833 (= (getValueByKey!588 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!279 (List!21905 (_ BitVec 64) V!37565) Unit!33831)

(assert (=> d!123833 (= lt!456248 (lemmaContainsTupThenGetReturnValue!279 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun insertStrictlySorted!372 (List!21905 (_ BitVec 64) V!37565) List!21905)

(assert (=> d!123833 (= lt!456250 (insertStrictlySorted!372 (toList!6893 call!43670) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!123833 (= (+!3104 call!43670 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) lt!456247)))

(declare-fun b!1033745 () Bool)

(declare-fun res!690656 () Bool)

(assert (=> b!1033745 (=> (not res!690656) (not e!584340))))

(assert (=> b!1033745 (= res!690656 (= (getValueByKey!588 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033746 () Bool)

(declare-fun contains!6013 (List!21905 tuple2!15726) Bool)

(assert (=> b!1033746 (= e!584340 (contains!6013 (toList!6893 lt!456247) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(assert (= (and d!123833 res!690655) b!1033745))

(assert (= (and b!1033745 res!690656) b!1033746))

(declare-fun m!953497 () Bool)

(assert (=> d!123833 m!953497))

(declare-fun m!953499 () Bool)

(assert (=> d!123833 m!953499))

(declare-fun m!953501 () Bool)

(assert (=> d!123833 m!953501))

(declare-fun m!953503 () Bool)

(assert (=> d!123833 m!953503))

(declare-fun m!953505 () Bool)

(assert (=> b!1033745 m!953505))

(declare-fun m!953507 () Bool)

(assert (=> b!1033746 m!953507))

(assert (=> b!1033700 d!123833))

(declare-fun d!123835 () Bool)

(declare-fun lt!456253 () (_ BitVec 32))

(assert (=> d!123835 (and (bvsge lt!456253 #b00000000000000000000000000000000) (bvsle lt!456253 (bvsub (size!31875 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun e!584345 () (_ BitVec 32))

(assert (=> d!123835 (= lt!456253 e!584345)))

(declare-fun c!104402 () Bool)

(assert (=> d!123835 (= c!104402 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!123835 (and (bvsle #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31875 (_keys!11407 lt!456124)) (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!123835 (= (arrayCountValidKeys!0 (_keys!11407 lt!456124) #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))) lt!456253)))

(declare-fun b!1033755 () Bool)

(declare-fun e!584346 () (_ BitVec 32))

(declare-fun call!43678 () (_ BitVec 32))

(assert (=> b!1033755 (= e!584346 (bvadd #b00000000000000000000000000000001 call!43678))))

(declare-fun b!1033756 () Bool)

(assert (=> b!1033756 (= e!584345 e!584346)))

(declare-fun c!104403 () Bool)

(assert (=> b!1033756 (= c!104403 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1033757 () Bool)

(assert (=> b!1033757 (= e!584345 #b00000000000000000000000000000000)))

(declare-fun bm!43675 () Bool)

(assert (=> bm!43675 (= call!43678 (arrayCountValidKeys!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1033758 () Bool)

(assert (=> b!1033758 (= e!584346 call!43678)))

(assert (= (and d!123835 c!104402) b!1033757))

(assert (= (and d!123835 (not c!104402)) b!1033756))

(assert (= (and b!1033756 c!104403) b!1033755))

(assert (= (and b!1033756 (not c!104403)) b!1033758))

(assert (= (or b!1033755 b!1033758) bm!43675))

(assert (=> b!1033756 m!953485))

(assert (=> b!1033756 m!953485))

(assert (=> b!1033756 m!953493))

(declare-fun m!953509 () Bool)

(assert (=> bm!43675 m!953509))

(assert (=> b!1033697 d!123835))

(declare-fun d!123837 () Bool)

(declare-fun e!584351 () Bool)

(assert (=> d!123837 e!584351))

(declare-fun res!690659 () Bool)

(assert (=> d!123837 (=> res!690659 e!584351)))

(declare-fun lt!456265 () Bool)

(assert (=> d!123837 (= res!690659 (not lt!456265))))

(declare-fun lt!456263 () Bool)

(assert (=> d!123837 (= lt!456265 lt!456263)))

(declare-fun lt!456262 () Unit!33831)

(declare-fun e!584352 () Unit!33831)

(assert (=> d!123837 (= lt!456262 e!584352)))

(declare-fun c!104406 () Bool)

(assert (=> d!123837 (= c!104406 lt!456263)))

(declare-fun containsKey!563 (List!21905 (_ BitVec 64)) Bool)

(assert (=> d!123837 (= lt!456263 (containsKey!563 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123837 (= (contains!6012 lt!456196 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456265)))

(declare-fun b!1033765 () Bool)

(declare-fun lt!456264 () Unit!33831)

(assert (=> b!1033765 (= e!584352 lt!456264)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!396 (List!21905 (_ BitVec 64)) Unit!33831)

(assert (=> b!1033765 (= lt!456264 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun isDefined!435 (Option!639) Bool)

(assert (=> b!1033765 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033766 () Bool)

(declare-fun Unit!33837 () Unit!33831)

(assert (=> b!1033766 (= e!584352 Unit!33837)))

(declare-fun b!1033767 () Bool)

(assert (=> b!1033767 (= e!584351 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123837 c!104406) b!1033765))

(assert (= (and d!123837 (not c!104406)) b!1033766))

(assert (= (and d!123837 (not res!690659)) b!1033767))

(assert (=> d!123837 m!953361))

(declare-fun m!953511 () Bool)

(assert (=> d!123837 m!953511))

(assert (=> b!1033765 m!953361))

(declare-fun m!953513 () Bool)

(assert (=> b!1033765 m!953513))

(assert (=> b!1033765 m!953361))

(declare-fun m!953515 () Bool)

(assert (=> b!1033765 m!953515))

(assert (=> b!1033765 m!953515))

(declare-fun m!953517 () Bool)

(assert (=> b!1033765 m!953517))

(assert (=> b!1033767 m!953361))

(assert (=> b!1033767 m!953515))

(assert (=> b!1033767 m!953515))

(assert (=> b!1033767 m!953517))

(assert (=> b!1033680 d!123837))

(declare-fun d!123839 () Bool)

(declare-fun e!584353 () Bool)

(assert (=> d!123839 e!584353))

(declare-fun res!690660 () Bool)

(assert (=> d!123839 (=> res!690660 e!584353)))

(declare-fun lt!456269 () Bool)

(assert (=> d!123839 (= res!690660 (not lt!456269))))

(declare-fun lt!456267 () Bool)

(assert (=> d!123839 (= lt!456269 lt!456267)))

(declare-fun lt!456266 () Unit!33831)

(declare-fun e!584354 () Unit!33831)

(assert (=> d!123839 (= lt!456266 e!584354)))

(declare-fun c!104407 () Bool)

(assert (=> d!123839 (= c!104407 lt!456267)))

(assert (=> d!123839 (= lt!456267 (containsKey!563 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123839 (= (contains!6012 lt!456221 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456269)))

(declare-fun b!1033768 () Bool)

(declare-fun lt!456268 () Unit!33831)

(assert (=> b!1033768 (= e!584354 lt!456268)))

(assert (=> b!1033768 (= lt!456268 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033768 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033769 () Bool)

(declare-fun Unit!33838 () Unit!33831)

(assert (=> b!1033769 (= e!584354 Unit!33838)))

(declare-fun b!1033770 () Bool)

(assert (=> b!1033770 (= e!584353 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123839 c!104407) b!1033768))

(assert (= (and d!123839 (not c!104407)) b!1033769))

(assert (= (and d!123839 (not res!690660)) b!1033770))

(declare-fun m!953519 () Bool)

(assert (=> d!123839 m!953519))

(declare-fun m!953521 () Bool)

(assert (=> b!1033768 m!953521))

(assert (=> b!1033768 m!953481))

(assert (=> b!1033768 m!953481))

(declare-fun m!953523 () Bool)

(assert (=> b!1033768 m!953523))

(assert (=> b!1033770 m!953481))

(assert (=> b!1033770 m!953481))

(assert (=> b!1033770 m!953523))

(assert (=> bm!43663 d!123839))

(declare-fun d!123841 () Bool)

(declare-fun e!584355 () Bool)

(assert (=> d!123841 e!584355))

(declare-fun res!690661 () Bool)

(assert (=> d!123841 (=> (not res!690661) (not e!584355))))

(declare-fun lt!456270 () ListLongMap!13755)

(assert (=> d!123841 (= res!690661 (contains!6012 lt!456270 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun lt!456273 () List!21905)

(assert (=> d!123841 (= lt!456270 (ListLongMap!13756 lt!456273))))

(declare-fun lt!456272 () Unit!33831)

(declare-fun lt!456271 () Unit!33831)

(assert (=> d!123841 (= lt!456272 lt!456271)))

(assert (=> d!123841 (= (getValueByKey!588 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123841 (= lt!456271 (lemmaContainsTupThenGetReturnValue!279 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123841 (= lt!456273 (insertStrictlySorted!372 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123841 (= (+!3104 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456270)))

(declare-fun b!1033771 () Bool)

(declare-fun res!690662 () Bool)

(assert (=> b!1033771 (=> (not res!690662) (not e!584355))))

(assert (=> b!1033771 (= res!690662 (= (getValueByKey!588 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1033772 () Bool)

(assert (=> b!1033772 (= e!584355 (contains!6013 (toList!6893 lt!456270) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (= (and d!123841 res!690661) b!1033771))

(assert (= (and b!1033771 res!690662) b!1033772))

(declare-fun m!953525 () Bool)

(assert (=> d!123841 m!953525))

(declare-fun m!953527 () Bool)

(assert (=> d!123841 m!953527))

(declare-fun m!953529 () Bool)

(assert (=> d!123841 m!953529))

(declare-fun m!953531 () Bool)

(assert (=> d!123841 m!953531))

(declare-fun m!953533 () Bool)

(assert (=> b!1033771 m!953533))

(declare-fun m!953535 () Bool)

(assert (=> b!1033772 m!953535))

(assert (=> bm!43667 d!123841))

(declare-fun d!123843 () Bool)

(declare-fun e!584356 () Bool)

(assert (=> d!123843 e!584356))

(declare-fun res!690663 () Bool)

(assert (=> d!123843 (=> res!690663 e!584356)))

(declare-fun lt!456277 () Bool)

(assert (=> d!123843 (= res!690663 (not lt!456277))))

(declare-fun lt!456275 () Bool)

(assert (=> d!123843 (= lt!456277 lt!456275)))

(declare-fun lt!456274 () Unit!33831)

(declare-fun e!584357 () Unit!33831)

(assert (=> d!123843 (= lt!456274 e!584357)))

(declare-fun c!104408 () Bool)

(assert (=> d!123843 (= c!104408 lt!456275)))

(assert (=> d!123843 (= lt!456275 (containsKey!563 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123843 (= (contains!6012 lt!456196 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456277)))

(declare-fun b!1033773 () Bool)

(declare-fun lt!456276 () Unit!33831)

(assert (=> b!1033773 (= e!584357 lt!456276)))

(assert (=> b!1033773 (= lt!456276 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033773 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033774 () Bool)

(declare-fun Unit!33839 () Unit!33831)

(assert (=> b!1033774 (= e!584357 Unit!33839)))

(declare-fun b!1033775 () Bool)

(assert (=> b!1033775 (= e!584356 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123843 c!104408) b!1033773))

(assert (= (and d!123843 (not c!104408)) b!1033774))

(assert (= (and d!123843 (not res!690663)) b!1033775))

(declare-fun m!953537 () Bool)

(assert (=> d!123843 m!953537))

(declare-fun m!953539 () Bool)

(assert (=> b!1033773 m!953539))

(declare-fun m!953541 () Bool)

(assert (=> b!1033773 m!953541))

(assert (=> b!1033773 m!953541))

(declare-fun m!953543 () Bool)

(assert (=> b!1033773 m!953543))

(assert (=> b!1033775 m!953541))

(assert (=> b!1033775 m!953541))

(assert (=> b!1033775 m!953543))

(assert (=> bm!43658 d!123843))

(declare-fun d!123845 () Bool)

(assert (=> d!123845 (= (apply!906 lt!456196 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16434 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30217 () Bool)

(assert (= bs!30217 d!123845))

(assert (=> bs!30217 m!953361))

(assert (=> bs!30217 m!953515))

(assert (=> bs!30217 m!953515))

(declare-fun m!953545 () Bool)

(assert (=> bs!30217 m!953545))

(assert (=> b!1033696 d!123845))

(declare-fun d!123847 () Bool)

(declare-fun c!104411 () Bool)

(assert (=> d!123847 (= c!104411 ((_ is ValueCellFull!11556) (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584360 () V!37565)

(assert (=> d!123847 (= (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) e!584360)))

(declare-fun b!1033780 () Bool)

(declare-fun get!16435 (ValueCell!11556 V!37565) V!37565)

(assert (=> b!1033780 (= e!584360 (get!16435 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033781 () Bool)

(declare-fun get!16436 (ValueCell!11556 V!37565) V!37565)

(assert (=> b!1033781 (= e!584360 (get!16436 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123847 c!104411) b!1033780))

(assert (= (and d!123847 (not c!104411)) b!1033781))

(assert (=> b!1033780 m!953359))

(assert (=> b!1033780 m!953309))

(declare-fun m!953547 () Bool)

(assert (=> b!1033780 m!953547))

(assert (=> b!1033781 m!953359))

(assert (=> b!1033781 m!953309))

(declare-fun m!953549 () Bool)

(assert (=> b!1033781 m!953549))

(assert (=> b!1033696 d!123847))

(declare-fun b!1033806 () Bool)

(declare-fun e!584377 () Bool)

(assert (=> b!1033806 (= e!584377 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033806 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!123849 () Bool)

(declare-fun e!584376 () Bool)

(assert (=> d!123849 e!584376))

(declare-fun res!690675 () Bool)

(assert (=> d!123849 (=> (not res!690675) (not e!584376))))

(declare-fun lt!456298 () ListLongMap!13755)

(assert (=> d!123849 (= res!690675 (not (contains!6012 lt!456298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584378 () ListLongMap!13755)

(assert (=> d!123849 (= lt!456298 e!584378)))

(declare-fun c!104420 () Bool)

(assert (=> d!123849 (= c!104420 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123849 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123849 (= (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) lt!456298)))

(declare-fun bm!43678 () Bool)

(declare-fun call!43681 () ListLongMap!13755)

(assert (=> bm!43678 (= call!43681 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1033807 () Bool)

(declare-fun e!584379 () ListLongMap!13755)

(assert (=> b!1033807 (= e!584378 e!584379)))

(declare-fun c!104423 () Bool)

(assert (=> b!1033807 (= c!104423 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033808 () Bool)

(declare-fun e!584381 () Bool)

(declare-fun e!584375 () Bool)

(assert (=> b!1033808 (= e!584381 e!584375)))

(declare-fun c!104422 () Bool)

(assert (=> b!1033808 (= c!104422 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033809 () Bool)

(assert (=> b!1033809 (= e!584375 (= lt!456298 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427))))))

(declare-fun b!1033810 () Bool)

(assert (=> b!1033810 (= e!584379 call!43681)))

(declare-fun b!1033811 () Bool)

(declare-fun lt!456294 () Unit!33831)

(declare-fun lt!456292 () Unit!33831)

(assert (=> b!1033811 (= lt!456294 lt!456292)))

(declare-fun lt!456297 () (_ BitVec 64))

(declare-fun lt!456295 () ListLongMap!13755)

(declare-fun lt!456293 () (_ BitVec 64))

(declare-fun lt!456296 () V!37565)

(assert (=> b!1033811 (not (contains!6012 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296)) lt!456297))))

(declare-fun addStillNotContains!242 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> b!1033811 (= lt!456292 (addStillNotContains!242 lt!456295 lt!456293 lt!456296 lt!456297))))

(assert (=> b!1033811 (= lt!456297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1033811 (= lt!456296 (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033811 (= lt!456293 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033811 (= lt!456295 call!43681)))

(assert (=> b!1033811 (= e!584379 (+!3104 call!43681 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1033812 () Bool)

(assert (=> b!1033812 (= e!584376 e!584381)))

(declare-fun c!104421 () Bool)

(assert (=> b!1033812 (= c!104421 e!584377)))

(declare-fun res!690672 () Bool)

(assert (=> b!1033812 (=> (not res!690672) (not e!584377))))

(assert (=> b!1033812 (= res!690672 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033813 () Bool)

(declare-fun res!690673 () Bool)

(assert (=> b!1033813 (=> (not res!690673) (not e!584376))))

(assert (=> b!1033813 (= res!690673 (not (contains!6012 lt!456298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033814 () Bool)

(declare-fun e!584380 () Bool)

(assert (=> b!1033814 (= e!584381 e!584380)))

(assert (=> b!1033814 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun res!690674 () Bool)

(assert (=> b!1033814 (= res!690674 (contains!6012 lt!456298 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033814 (=> (not res!690674) (not e!584380))))

(declare-fun b!1033815 () Bool)

(assert (=> b!1033815 (= e!584378 (ListLongMap!13756 Nil!21902))))

(declare-fun b!1033816 () Bool)

(assert (=> b!1033816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> b!1033816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1033816 (= e!584380 (= (apply!906 lt!456298 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033817 () Bool)

(declare-fun isEmpty!926 (ListLongMap!13755) Bool)

(assert (=> b!1033817 (= e!584375 (isEmpty!926 lt!456298))))

(assert (= (and d!123849 c!104420) b!1033815))

(assert (= (and d!123849 (not c!104420)) b!1033807))

(assert (= (and b!1033807 c!104423) b!1033811))

(assert (= (and b!1033807 (not c!104423)) b!1033810))

(assert (= (or b!1033811 b!1033810) bm!43678))

(assert (= (and d!123849 res!690675) b!1033813))

(assert (= (and b!1033813 res!690673) b!1033812))

(assert (= (and b!1033812 res!690672) b!1033806))

(assert (= (and b!1033812 c!104421) b!1033814))

(assert (= (and b!1033812 (not c!104421)) b!1033808))

(assert (= (and b!1033814 res!690674) b!1033816))

(assert (= (and b!1033808 c!104422) b!1033809))

(assert (= (and b!1033808 (not c!104422)) b!1033817))

(declare-fun b_lambda!16061 () Bool)

(assert (=> (not b_lambda!16061) (not b!1033811)))

(assert (=> b!1033811 t!31102))

(declare-fun b_and!33281 () Bool)

(assert (= b_and!33279 (and (=> t!31102 result!14387) b_and!33281)))

(declare-fun b_lambda!16063 () Bool)

(assert (=> (not b_lambda!16063) (not b!1033816)))

(assert (=> b!1033816 t!31102))

(declare-fun b_and!33283 () Bool)

(assert (= b_and!33281 (and (=> t!31102 result!14387) b_and!33283)))

(declare-fun m!953551 () Bool)

(assert (=> b!1033811 m!953551))

(assert (=> b!1033811 m!953359))

(assert (=> b!1033811 m!953359))

(assert (=> b!1033811 m!953309))

(assert (=> b!1033811 m!953365))

(assert (=> b!1033811 m!953361))

(declare-fun m!953553 () Bool)

(assert (=> b!1033811 m!953553))

(declare-fun m!953555 () Bool)

(assert (=> b!1033811 m!953555))

(assert (=> b!1033811 m!953555))

(declare-fun m!953557 () Bool)

(assert (=> b!1033811 m!953557))

(assert (=> b!1033811 m!953309))

(declare-fun m!953559 () Bool)

(assert (=> b!1033813 m!953559))

(declare-fun m!953561 () Bool)

(assert (=> b!1033817 m!953561))

(declare-fun m!953563 () Bool)

(assert (=> d!123849 m!953563))

(assert (=> d!123849 m!953355))

(assert (=> b!1033807 m!953361))

(assert (=> b!1033807 m!953361))

(assert (=> b!1033807 m!953371))

(assert (=> b!1033814 m!953361))

(assert (=> b!1033814 m!953361))

(declare-fun m!953565 () Bool)

(assert (=> b!1033814 m!953565))

(declare-fun m!953567 () Bool)

(assert (=> b!1033809 m!953567))

(assert (=> bm!43678 m!953567))

(assert (=> b!1033806 m!953361))

(assert (=> b!1033806 m!953361))

(assert (=> b!1033806 m!953371))

(assert (=> b!1033816 m!953361))

(declare-fun m!953569 () Bool)

(assert (=> b!1033816 m!953569))

(assert (=> b!1033816 m!953359))

(assert (=> b!1033816 m!953359))

(assert (=> b!1033816 m!953309))

(assert (=> b!1033816 m!953365))

(assert (=> b!1033816 m!953361))

(assert (=> b!1033816 m!953309))

(assert (=> bm!43668 d!123849))

(declare-fun d!123851 () Bool)

(declare-fun e!584382 () Bool)

(assert (=> d!123851 e!584382))

(declare-fun res!690676 () Bool)

(assert (=> d!123851 (=> (not res!690676) (not e!584382))))

(declare-fun lt!456299 () ListLongMap!13755)

(assert (=> d!123851 (= res!690676 (contains!6012 lt!456299 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456302 () List!21905)

(assert (=> d!123851 (= lt!456299 (ListLongMap!13756 lt!456302))))

(declare-fun lt!456301 () Unit!33831)

(declare-fun lt!456300 () Unit!33831)

(assert (=> d!123851 (= lt!456301 lt!456300)))

(assert (=> d!123851 (= (getValueByKey!588 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(assert (=> d!123851 (= lt!456300 (lemmaContainsTupThenGetReturnValue!279 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(assert (=> d!123851 (= lt!456302 (insertStrictlySorted!372 (toList!6893 lt!456186) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(assert (=> d!123851 (= (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456299)))

(declare-fun b!1033818 () Bool)

(declare-fun res!690677 () Bool)

(assert (=> b!1033818 (=> (not res!690677) (not e!584382))))

(assert (=> b!1033818 (= res!690677 (= (getValueByKey!588 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033819 () Bool)

(assert (=> b!1033819 (= e!584382 (contains!6013 (toList!6893 lt!456299) (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))

(assert (= (and d!123851 res!690676) b!1033818))

(assert (= (and b!1033818 res!690677) b!1033819))

(declare-fun m!953571 () Bool)

(assert (=> d!123851 m!953571))

(declare-fun m!953573 () Bool)

(assert (=> d!123851 m!953573))

(declare-fun m!953575 () Bool)

(assert (=> d!123851 m!953575))

(declare-fun m!953577 () Bool)

(assert (=> d!123851 m!953577))

(declare-fun m!953579 () Bool)

(assert (=> b!1033818 m!953579))

(declare-fun m!953581 () Bool)

(assert (=> b!1033819 m!953581))

(assert (=> b!1033679 d!123851))

(declare-fun d!123853 () Bool)

(declare-fun e!584383 () Bool)

(assert (=> d!123853 e!584383))

(declare-fun res!690678 () Bool)

(assert (=> d!123853 (=> (not res!690678) (not e!584383))))

(declare-fun lt!456303 () ListLongMap!13755)

(assert (=> d!123853 (= res!690678 (contains!6012 lt!456303 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456306 () List!21905)

(assert (=> d!123853 (= lt!456303 (ListLongMap!13756 lt!456306))))

(declare-fun lt!456305 () Unit!33831)

(declare-fun lt!456304 () Unit!33831)

(assert (=> d!123853 (= lt!456305 lt!456304)))

(assert (=> d!123853 (= (getValueByKey!588 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(assert (=> d!123853 (= lt!456304 (lemmaContainsTupThenGetReturnValue!279 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(assert (=> d!123853 (= lt!456306 (insertStrictlySorted!372 (toList!6893 lt!456193) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(assert (=> d!123853 (= (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456303)))

(declare-fun b!1033820 () Bool)

(declare-fun res!690679 () Bool)

(assert (=> b!1033820 (=> (not res!690679) (not e!584383))))

(assert (=> b!1033820 (= res!690679 (= (getValueByKey!588 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033821 () Bool)

(assert (=> b!1033821 (= e!584383 (contains!6013 (toList!6893 lt!456303) (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))

(assert (= (and d!123853 res!690678) b!1033820))

(assert (= (and b!1033820 res!690679) b!1033821))

(declare-fun m!953583 () Bool)

(assert (=> d!123853 m!953583))

(declare-fun m!953585 () Bool)

(assert (=> d!123853 m!953585))

(declare-fun m!953587 () Bool)

(assert (=> d!123853 m!953587))

(declare-fun m!953589 () Bool)

(assert (=> d!123853 m!953589))

(declare-fun m!953591 () Bool)

(assert (=> b!1033820 m!953591))

(declare-fun m!953593 () Bool)

(assert (=> b!1033821 m!953593))

(assert (=> b!1033679 d!123853))

(declare-fun d!123855 () Bool)

(declare-fun e!584384 () Bool)

(assert (=> d!123855 e!584384))

(declare-fun res!690680 () Bool)

(assert (=> d!123855 (=> (not res!690680) (not e!584384))))

(declare-fun lt!456307 () ListLongMap!13755)

(assert (=> d!123855 (= res!690680 (contains!6012 lt!456307 (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun lt!456310 () List!21905)

(assert (=> d!123855 (= lt!456307 (ListLongMap!13756 lt!456310))))

(declare-fun lt!456309 () Unit!33831)

(declare-fun lt!456308 () Unit!33831)

(assert (=> d!123855 (= lt!456309 lt!456308)))

(assert (=> d!123855 (= (getValueByKey!588 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(assert (=> d!123855 (= lt!456308 (lemmaContainsTupThenGetReturnValue!279 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(assert (=> d!123855 (= lt!456310 (insertStrictlySorted!372 (toList!6893 lt!456182) (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(assert (=> d!123855 (= (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)) lt!456307)))

(declare-fun b!1033822 () Bool)

(declare-fun res!690681 () Bool)

(assert (=> b!1033822 (=> (not res!690681) (not e!584384))))

(assert (=> b!1033822 (= res!690681 (= (getValueByKey!588 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(declare-fun b!1033823 () Bool)

(assert (=> b!1033823 (= e!584384 (contains!6013 (toList!6893 lt!456307) (tuple2!15727 lt!456200 lt!456123)))))

(assert (= (and d!123855 res!690680) b!1033822))

(assert (= (and b!1033822 res!690681) b!1033823))

(declare-fun m!953595 () Bool)

(assert (=> d!123855 m!953595))

(declare-fun m!953597 () Bool)

(assert (=> d!123855 m!953597))

(declare-fun m!953599 () Bool)

(assert (=> d!123855 m!953599))

(declare-fun m!953601 () Bool)

(assert (=> d!123855 m!953601))

(declare-fun m!953603 () Bool)

(assert (=> b!1033822 m!953603))

(declare-fun m!953605 () Bool)

(assert (=> b!1033823 m!953605))

(assert (=> b!1033679 d!123855))

(declare-fun d!123857 () Bool)

(assert (=> d!123857 (= (apply!906 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456187) (apply!906 lt!456193 lt!456187))))

(declare-fun lt!456313 () Unit!33831)

(declare-fun choose!1697 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> d!123857 (= lt!456313 (choose!1697 lt!456193 lt!456202 (minValue!6063 thiss!1427) lt!456187))))

(declare-fun e!584387 () Bool)

(assert (=> d!123857 e!584387))

(declare-fun res!690684 () Bool)

(assert (=> d!123857 (=> (not res!690684) (not e!584387))))

(assert (=> d!123857 (= res!690684 (contains!6012 lt!456193 lt!456187))))

(assert (=> d!123857 (= (addApplyDifferent!485 lt!456193 lt!456202 (minValue!6063 thiss!1427) lt!456187) lt!456313)))

(declare-fun b!1033827 () Bool)

(assert (=> b!1033827 (= e!584387 (not (= lt!456187 lt!456202)))))

(assert (= (and d!123857 res!690684) b!1033827))

(declare-fun m!953607 () Bool)

(assert (=> d!123857 m!953607))

(assert (=> d!123857 m!953381))

(assert (=> d!123857 m!953383))

(declare-fun m!953609 () Bool)

(assert (=> d!123857 m!953609))

(assert (=> d!123857 m!953381))

(assert (=> d!123857 m!953393))

(assert (=> b!1033679 d!123857))

(declare-fun d!123859 () Bool)

(assert (=> d!123859 (= (apply!906 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456187) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456187)))))

(declare-fun bs!30218 () Bool)

(assert (= bs!30218 d!123859))

(declare-fun m!953611 () Bool)

(assert (=> bs!30218 m!953611))

(assert (=> bs!30218 m!953611))

(declare-fun m!953613 () Bool)

(assert (=> bs!30218 m!953613))

(assert (=> b!1033679 d!123859))

(declare-fun b!1033828 () Bool)

(declare-fun e!584390 () Bool)

(assert (=> b!1033828 (= e!584390 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033828 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!123861 () Bool)

(declare-fun e!584389 () Bool)

(assert (=> d!123861 e!584389))

(declare-fun res!690688 () Bool)

(assert (=> d!123861 (=> (not res!690688) (not e!584389))))

(declare-fun lt!456320 () ListLongMap!13755)

(assert (=> d!123861 (= res!690688 (not (contains!6012 lt!456320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584391 () ListLongMap!13755)

(assert (=> d!123861 (= lt!456320 e!584391)))

(declare-fun c!104424 () Bool)

(assert (=> d!123861 (= c!104424 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123861 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123861 (= (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) lt!456320)))

(declare-fun bm!43679 () Bool)

(declare-fun call!43682 () ListLongMap!13755)

(assert (=> bm!43679 (= call!43682 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1033829 () Bool)

(declare-fun e!584392 () ListLongMap!13755)

(assert (=> b!1033829 (= e!584391 e!584392)))

(declare-fun c!104427 () Bool)

(assert (=> b!1033829 (= c!104427 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033830 () Bool)

(declare-fun e!584394 () Bool)

(declare-fun e!584388 () Bool)

(assert (=> b!1033830 (= e!584394 e!584388)))

(declare-fun c!104426 () Bool)

(assert (=> b!1033830 (= c!104426 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033831 () Bool)

(assert (=> b!1033831 (= e!584388 (= lt!456320 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427))))))

(declare-fun b!1033832 () Bool)

(assert (=> b!1033832 (= e!584392 call!43682)))

(declare-fun b!1033833 () Bool)

(declare-fun lt!456316 () Unit!33831)

(declare-fun lt!456314 () Unit!33831)

(assert (=> b!1033833 (= lt!456316 lt!456314)))

(declare-fun lt!456317 () ListLongMap!13755)

(declare-fun lt!456319 () (_ BitVec 64))

(declare-fun lt!456318 () V!37565)

(declare-fun lt!456315 () (_ BitVec 64))

(assert (=> b!1033833 (not (contains!6012 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318)) lt!456319))))

(assert (=> b!1033833 (= lt!456314 (addStillNotContains!242 lt!456317 lt!456315 lt!456318 lt!456319))))

(assert (=> b!1033833 (= lt!456319 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1033833 (= lt!456318 (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033833 (= lt!456315 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1033833 (= lt!456317 call!43682)))

(assert (=> b!1033833 (= e!584392 (+!3104 call!43682 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1033834 () Bool)

(assert (=> b!1033834 (= e!584389 e!584394)))

(declare-fun c!104425 () Bool)

(assert (=> b!1033834 (= c!104425 e!584390)))

(declare-fun res!690685 () Bool)

(assert (=> b!1033834 (=> (not res!690685) (not e!584390))))

(assert (=> b!1033834 (= res!690685 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033835 () Bool)

(declare-fun res!690686 () Bool)

(assert (=> b!1033835 (=> (not res!690686) (not e!584389))))

(assert (=> b!1033835 (= res!690686 (not (contains!6012 lt!456320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033836 () Bool)

(declare-fun e!584393 () Bool)

(assert (=> b!1033836 (= e!584394 e!584393)))

(assert (=> b!1033836 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun res!690687 () Bool)

(assert (=> b!1033836 (= res!690687 (contains!6012 lt!456320 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033836 (=> (not res!690687) (not e!584393))))

(declare-fun b!1033837 () Bool)

(assert (=> b!1033837 (= e!584391 (ListLongMap!13756 Nil!21902))))

(declare-fun b!1033838 () Bool)

(assert (=> b!1033838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> b!1033838 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1033838 (= e!584393 (= (apply!906 lt!456320 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033839 () Bool)

(assert (=> b!1033839 (= e!584388 (isEmpty!926 lt!456320))))

(assert (= (and d!123861 c!104424) b!1033837))

(assert (= (and d!123861 (not c!104424)) b!1033829))

(assert (= (and b!1033829 c!104427) b!1033833))

(assert (= (and b!1033829 (not c!104427)) b!1033832))

(assert (= (or b!1033833 b!1033832) bm!43679))

(assert (= (and d!123861 res!690688) b!1033835))

(assert (= (and b!1033835 res!690686) b!1033834))

(assert (= (and b!1033834 res!690685) b!1033828))

(assert (= (and b!1033834 c!104425) b!1033836))

(assert (= (and b!1033834 (not c!104425)) b!1033830))

(assert (= (and b!1033836 res!690687) b!1033838))

(assert (= (and b!1033830 c!104426) b!1033831))

(assert (= (and b!1033830 (not c!104426)) b!1033839))

(declare-fun b_lambda!16065 () Bool)

(assert (=> (not b_lambda!16065) (not b!1033833)))

(assert (=> b!1033833 t!31102))

(declare-fun b_and!33285 () Bool)

(assert (= b_and!33283 (and (=> t!31102 result!14387) b_and!33285)))

(declare-fun b_lambda!16067 () Bool)

(assert (=> (not b_lambda!16067) (not b!1033838)))

(assert (=> b!1033838 t!31102))

(declare-fun b_and!33287 () Bool)

(assert (= b_and!33285 (and (=> t!31102 result!14387) b_and!33287)))

(declare-fun m!953615 () Bool)

(assert (=> b!1033833 m!953615))

(assert (=> b!1033833 m!953359))

(assert (=> b!1033833 m!953359))

(assert (=> b!1033833 m!953309))

(assert (=> b!1033833 m!953365))

(assert (=> b!1033833 m!953361))

(declare-fun m!953617 () Bool)

(assert (=> b!1033833 m!953617))

(declare-fun m!953619 () Bool)

(assert (=> b!1033833 m!953619))

(assert (=> b!1033833 m!953619))

(declare-fun m!953621 () Bool)

(assert (=> b!1033833 m!953621))

(assert (=> b!1033833 m!953309))

(declare-fun m!953623 () Bool)

(assert (=> b!1033835 m!953623))

(declare-fun m!953625 () Bool)

(assert (=> b!1033839 m!953625))

(declare-fun m!953627 () Bool)

(assert (=> d!123861 m!953627))

(assert (=> d!123861 m!953355))

(assert (=> b!1033829 m!953361))

(assert (=> b!1033829 m!953361))

(assert (=> b!1033829 m!953371))

(assert (=> b!1033836 m!953361))

(assert (=> b!1033836 m!953361))

(declare-fun m!953629 () Bool)

(assert (=> b!1033836 m!953629))

(declare-fun m!953631 () Bool)

(assert (=> b!1033831 m!953631))

(assert (=> bm!43679 m!953631))

(assert (=> b!1033828 m!953361))

(assert (=> b!1033828 m!953361))

(assert (=> b!1033828 m!953371))

(assert (=> b!1033838 m!953361))

(declare-fun m!953633 () Bool)

(assert (=> b!1033838 m!953633))

(assert (=> b!1033838 m!953359))

(assert (=> b!1033838 m!953359))

(assert (=> b!1033838 m!953309))

(assert (=> b!1033838 m!953365))

(assert (=> b!1033838 m!953361))

(assert (=> b!1033838 m!953309))

(assert (=> b!1033679 d!123861))

(declare-fun d!123863 () Bool)

(assert (=> d!123863 (= (apply!906 lt!456182 lt!456195) (get!16434 (getValueByKey!588 (toList!6893 lt!456182) lt!456195)))))

(declare-fun bs!30219 () Bool)

(assert (= bs!30219 d!123863))

(declare-fun m!953635 () Bool)

(assert (=> bs!30219 m!953635))

(assert (=> bs!30219 m!953635))

(declare-fun m!953637 () Bool)

(assert (=> bs!30219 m!953637))

(assert (=> b!1033679 d!123863))

(declare-fun d!123865 () Bool)

(assert (=> d!123865 (= (apply!906 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456185) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456185)))))

(declare-fun bs!30220 () Bool)

(assert (= bs!30220 d!123865))

(declare-fun m!953639 () Bool)

(assert (=> bs!30220 m!953639))

(assert (=> bs!30220 m!953639))

(declare-fun m!953641 () Bool)

(assert (=> bs!30220 m!953641))

(assert (=> b!1033679 d!123865))

(declare-fun d!123867 () Bool)

(assert (=> d!123867 (= (apply!906 lt!456193 lt!456187) (get!16434 (getValueByKey!588 (toList!6893 lt!456193) lt!456187)))))

(declare-fun bs!30221 () Bool)

(assert (= bs!30221 d!123867))

(declare-fun m!953643 () Bool)

(assert (=> bs!30221 m!953643))

(assert (=> bs!30221 m!953643))

(declare-fun m!953645 () Bool)

(assert (=> bs!30221 m!953645))

(assert (=> b!1033679 d!123867))

(declare-fun d!123869 () Bool)

(assert (=> d!123869 (contains!6012 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)) lt!456188)))

(declare-fun lt!456323 () Unit!33831)

(declare-fun choose!1698 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> d!123869 (= lt!456323 (choose!1698 lt!456203 lt!456189 lt!456123 lt!456188))))

(assert (=> d!123869 (contains!6012 lt!456203 lt!456188)))

(assert (=> d!123869 (= (addStillContains!625 lt!456203 lt!456189 lt!456123 lt!456188) lt!456323)))

(declare-fun bs!30222 () Bool)

(assert (= bs!30222 d!123869))

(assert (=> bs!30222 m!953387))

(assert (=> bs!30222 m!953387))

(assert (=> bs!30222 m!953389))

(declare-fun m!953647 () Bool)

(assert (=> bs!30222 m!953647))

(declare-fun m!953649 () Bool)

(assert (=> bs!30222 m!953649))

(assert (=> b!1033679 d!123869))

(declare-fun d!123871 () Bool)

(assert (=> d!123871 (= (apply!906 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)) lt!456195) (apply!906 lt!456182 lt!456195))))

(declare-fun lt!456324 () Unit!33831)

(assert (=> d!123871 (= lt!456324 (choose!1697 lt!456182 lt!456200 lt!456123 lt!456195))))

(declare-fun e!584395 () Bool)

(assert (=> d!123871 e!584395))

(declare-fun res!690689 () Bool)

(assert (=> d!123871 (=> (not res!690689) (not e!584395))))

(assert (=> d!123871 (= res!690689 (contains!6012 lt!456182 lt!456195))))

(assert (=> d!123871 (= (addApplyDifferent!485 lt!456182 lt!456200 lt!456123 lt!456195) lt!456324)))

(declare-fun b!1033841 () Bool)

(assert (=> b!1033841 (= e!584395 (not (= lt!456195 lt!456200)))))

(assert (= (and d!123871 res!690689) b!1033841))

(declare-fun m!953651 () Bool)

(assert (=> d!123871 m!953651))

(assert (=> d!123871 m!953375))

(assert (=> d!123871 m!953377))

(declare-fun m!953653 () Bool)

(assert (=> d!123871 m!953653))

(assert (=> d!123871 m!953375))

(assert (=> d!123871 m!953391))

(assert (=> b!1033679 d!123871))

(declare-fun d!123873 () Bool)

(assert (=> d!123873 (= (apply!906 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456185) (apply!906 lt!456186 lt!456185))))

(declare-fun lt!456325 () Unit!33831)

(assert (=> d!123873 (= lt!456325 (choose!1697 lt!456186 lt!456197 (minValue!6063 thiss!1427) lt!456185))))

(declare-fun e!584396 () Bool)

(assert (=> d!123873 e!584396))

(declare-fun res!690690 () Bool)

(assert (=> d!123873 (=> (not res!690690) (not e!584396))))

(assert (=> d!123873 (= res!690690 (contains!6012 lt!456186 lt!456185))))

(assert (=> d!123873 (= (addApplyDifferent!485 lt!456186 lt!456197 (minValue!6063 thiss!1427) lt!456185) lt!456325)))

(declare-fun b!1033842 () Bool)

(assert (=> b!1033842 (= e!584396 (not (= lt!456185 lt!456197)))))

(assert (= (and d!123873 res!690690) b!1033842))

(declare-fun m!953655 () Bool)

(assert (=> d!123873 m!953655))

(assert (=> d!123873 m!953399))

(assert (=> d!123873 m!953401))

(declare-fun m!953657 () Bool)

(assert (=> d!123873 m!953657))

(assert (=> d!123873 m!953399))

(assert (=> d!123873 m!953403))

(assert (=> b!1033679 d!123873))

(declare-fun d!123875 () Bool)

(assert (=> d!123875 (= (apply!906 lt!456186 lt!456185) (get!16434 (getValueByKey!588 (toList!6893 lt!456186) lt!456185)))))

(declare-fun bs!30223 () Bool)

(assert (= bs!30223 d!123875))

(declare-fun m!953659 () Bool)

(assert (=> bs!30223 m!953659))

(assert (=> bs!30223 m!953659))

(declare-fun m!953661 () Bool)

(assert (=> bs!30223 m!953661))

(assert (=> b!1033679 d!123875))

(declare-fun d!123877 () Bool)

(declare-fun e!584397 () Bool)

(assert (=> d!123877 e!584397))

(declare-fun res!690691 () Bool)

(assert (=> d!123877 (=> res!690691 e!584397)))

(declare-fun lt!456329 () Bool)

(assert (=> d!123877 (= res!690691 (not lt!456329))))

(declare-fun lt!456327 () Bool)

(assert (=> d!123877 (= lt!456329 lt!456327)))

(declare-fun lt!456326 () Unit!33831)

(declare-fun e!584398 () Unit!33831)

(assert (=> d!123877 (= lt!456326 e!584398)))

(declare-fun c!104428 () Bool)

(assert (=> d!123877 (= c!104428 lt!456327)))

(assert (=> d!123877 (= lt!456327 (containsKey!563 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(assert (=> d!123877 (= (contains!6012 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)) lt!456188) lt!456329)))

(declare-fun b!1033843 () Bool)

(declare-fun lt!456328 () Unit!33831)

(assert (=> b!1033843 (= e!584398 lt!456328)))

(assert (=> b!1033843 (= lt!456328 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(assert (=> b!1033843 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(declare-fun b!1033844 () Bool)

(declare-fun Unit!33840 () Unit!33831)

(assert (=> b!1033844 (= e!584398 Unit!33840)))

(declare-fun b!1033845 () Bool)

(assert (=> b!1033845 (= e!584397 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188)))))

(assert (= (and d!123877 c!104428) b!1033843))

(assert (= (and d!123877 (not c!104428)) b!1033844))

(assert (= (and d!123877 (not res!690691)) b!1033845))

(declare-fun m!953663 () Bool)

(assert (=> d!123877 m!953663))

(declare-fun m!953665 () Bool)

(assert (=> b!1033843 m!953665))

(declare-fun m!953667 () Bool)

(assert (=> b!1033843 m!953667))

(assert (=> b!1033843 m!953667))

(declare-fun m!953669 () Bool)

(assert (=> b!1033843 m!953669))

(assert (=> b!1033845 m!953667))

(assert (=> b!1033845 m!953667))

(assert (=> b!1033845 m!953669))

(assert (=> b!1033679 d!123877))

(declare-fun d!123879 () Bool)

(assert (=> d!123879 (= (apply!906 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)) lt!456195) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))) lt!456195)))))

(declare-fun bs!30224 () Bool)

(assert (= bs!30224 d!123879))

(declare-fun m!953671 () Bool)

(assert (=> bs!30224 m!953671))

(assert (=> bs!30224 m!953671))

(declare-fun m!953673 () Bool)

(assert (=> bs!30224 m!953673))

(assert (=> b!1033679 d!123879))

(declare-fun d!123881 () Bool)

(declare-fun e!584399 () Bool)

(assert (=> d!123881 e!584399))

(declare-fun res!690692 () Bool)

(assert (=> d!123881 (=> (not res!690692) (not e!584399))))

(declare-fun lt!456330 () ListLongMap!13755)

(assert (=> d!123881 (= res!690692 (contains!6012 lt!456330 (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun lt!456333 () List!21905)

(assert (=> d!123881 (= lt!456330 (ListLongMap!13756 lt!456333))))

(declare-fun lt!456332 () Unit!33831)

(declare-fun lt!456331 () Unit!33831)

(assert (=> d!123881 (= lt!456332 lt!456331)))

(assert (=> d!123881 (= (getValueByKey!588 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(assert (=> d!123881 (= lt!456331 (lemmaContainsTupThenGetReturnValue!279 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(assert (=> d!123881 (= lt!456333 (insertStrictlySorted!372 (toList!6893 lt!456203) (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(assert (=> d!123881 (= (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)) lt!456330)))

(declare-fun b!1033846 () Bool)

(declare-fun res!690693 () Bool)

(assert (=> b!1033846 (=> (not res!690693) (not e!584399))))

(assert (=> b!1033846 (= res!690693 (= (getValueByKey!588 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(declare-fun b!1033847 () Bool)

(assert (=> b!1033847 (= e!584399 (contains!6013 (toList!6893 lt!456330) (tuple2!15727 lt!456189 lt!456123)))))

(assert (= (and d!123881 res!690692) b!1033846))

(assert (= (and b!1033846 res!690693) b!1033847))

(declare-fun m!953675 () Bool)

(assert (=> d!123881 m!953675))

(declare-fun m!953677 () Bool)

(assert (=> d!123881 m!953677))

(declare-fun m!953679 () Bool)

(assert (=> d!123881 m!953679))

(declare-fun m!953681 () Bool)

(assert (=> d!123881 m!953681))

(declare-fun m!953683 () Bool)

(assert (=> b!1033846 m!953683))

(declare-fun m!953685 () Bool)

(assert (=> b!1033847 m!953685))

(assert (=> b!1033679 d!123881))

(declare-fun d!123883 () Bool)

(declare-fun res!690705 () Bool)

(declare-fun e!584402 () Bool)

(assert (=> d!123883 (=> (not res!690705) (not e!584402))))

(assert (=> d!123883 (= res!690705 (validMask!0 (mask!30084 lt!456124)))))

(assert (=> d!123883 (= (simpleValid!405 lt!456124) e!584402)))

(declare-fun b!1033857 () Bool)

(declare-fun res!690703 () Bool)

(assert (=> b!1033857 (=> (not res!690703) (not e!584402))))

(declare-fun size!31879 (LongMapFixedSize!5706) (_ BitVec 32))

(assert (=> b!1033857 (= res!690703 (bvsge (size!31879 lt!456124) (_size!2908 lt!456124)))))

(declare-fun b!1033859 () Bool)

(assert (=> b!1033859 (= e!584402 (and (bvsge (extraKeys!5959 lt!456124) #b00000000000000000000000000000000) (bvsle (extraKeys!5959 lt!456124) #b00000000000000000000000000000011) (bvsge (_vacant!2908 lt!456124) #b00000000000000000000000000000000)))))

(declare-fun b!1033856 () Bool)

(declare-fun res!690704 () Bool)

(assert (=> b!1033856 (=> (not res!690704) (not e!584402))))

(assert (=> b!1033856 (= res!690704 (and (= (size!31876 (_values!6250 lt!456124)) (bvadd (mask!30084 lt!456124) #b00000000000000000000000000000001)) (= (size!31875 (_keys!11407 lt!456124)) (size!31876 (_values!6250 lt!456124))) (bvsge (_size!2908 lt!456124) #b00000000000000000000000000000000) (bvsle (_size!2908 lt!456124) (bvadd (mask!30084 lt!456124) #b00000000000000000000000000000001))))))

(declare-fun b!1033858 () Bool)

(declare-fun res!690702 () Bool)

(assert (=> b!1033858 (=> (not res!690702) (not e!584402))))

(assert (=> b!1033858 (= res!690702 (= (size!31879 lt!456124) (bvadd (_size!2908 lt!456124) (bvsdiv (bvadd (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123883 res!690705) b!1033856))

(assert (= (and b!1033856 res!690704) b!1033857))

(assert (= (and b!1033857 res!690703) b!1033858))

(assert (= (and b!1033858 res!690702) b!1033859))

(declare-fun m!953687 () Bool)

(assert (=> d!123883 m!953687))

(declare-fun m!953689 () Bool)

(assert (=> b!1033857 m!953689))

(assert (=> b!1033858 m!953689))

(assert (=> d!123815 d!123883))

(declare-fun d!123885 () Bool)

(assert (=> d!123885 (= (apply!906 lt!456196 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30225 () Bool)

(assert (= bs!30225 d!123885))

(assert (=> bs!30225 m!953541))

(assert (=> bs!30225 m!953541))

(declare-fun m!953691 () Bool)

(assert (=> bs!30225 m!953691))

(assert (=> b!1033695 d!123885))

(assert (=> b!1033693 d!123831))

(declare-fun bm!43680 () Bool)

(declare-fun call!43684 () Bool)

(declare-fun lt!456348 () ListLongMap!13755)

(assert (=> bm!43680 (= call!43684 (contains!6012 lt!456348 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033860 () Bool)

(declare-fun e!584415 () ListLongMap!13755)

(declare-fun call!43687 () ListLongMap!13755)

(assert (=> b!1033860 (= e!584415 (+!3104 call!43687 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))

(declare-fun b!1033861 () Bool)

(declare-fun e!584406 () Bool)

(assert (=> b!1033861 (= e!584406 (= (apply!906 lt!456348 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!6063 lt!456124)))))

(declare-fun bm!43681 () Bool)

(declare-fun call!43688 () ListLongMap!13755)

(assert (=> bm!43681 (= call!43688 call!43687)))

(declare-fun bm!43682 () Bool)

(declare-fun call!43685 () Bool)

(assert (=> bm!43682 (= call!43685 (contains!6012 lt!456348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033863 () Bool)

(declare-fun e!584411 () Unit!33831)

(declare-fun lt!456353 () Unit!33831)

(assert (=> b!1033863 (= e!584411 lt!456353)))

(declare-fun lt!456355 () ListLongMap!13755)

(assert (=> b!1033863 (= lt!456355 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun lt!456341 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456341 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456340 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456340 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(declare-fun lt!456350 () Unit!33831)

(assert (=> b!1033863 (= lt!456350 (addStillContains!625 lt!456355 lt!456341 (zeroValue!6063 lt!456124) lt!456340))))

(assert (=> b!1033863 (contains!6012 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) lt!456340)))

(declare-fun lt!456344 () Unit!33831)

(assert (=> b!1033863 (= lt!456344 lt!456350)))

(declare-fun lt!456345 () ListLongMap!13755)

(assert (=> b!1033863 (= lt!456345 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun lt!456354 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456354 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456339 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456339 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(declare-fun lt!456343 () Unit!33831)

(assert (=> b!1033863 (= lt!456343 (addApplyDifferent!485 lt!456345 lt!456354 (minValue!6063 lt!456124) lt!456339))))

(assert (=> b!1033863 (= (apply!906 (+!3104 lt!456345 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) lt!456339) (apply!906 lt!456345 lt!456339))))

(declare-fun lt!456335 () Unit!33831)

(assert (=> b!1033863 (= lt!456335 lt!456343)))

(declare-fun lt!456334 () ListLongMap!13755)

(assert (=> b!1033863 (= lt!456334 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun lt!456352 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456347 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456347 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(declare-fun lt!456351 () Unit!33831)

(assert (=> b!1033863 (= lt!456351 (addApplyDifferent!485 lt!456334 lt!456352 (zeroValue!6063 lt!456124) lt!456347))))

(assert (=> b!1033863 (= (apply!906 (+!3104 lt!456334 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) lt!456347) (apply!906 lt!456334 lt!456347))))

(declare-fun lt!456346 () Unit!33831)

(assert (=> b!1033863 (= lt!456346 lt!456351)))

(declare-fun lt!456338 () ListLongMap!13755)

(assert (=> b!1033863 (= lt!456338 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun lt!456349 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456349 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!456337 () (_ BitVec 64))

(assert (=> b!1033863 (= lt!456337 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(assert (=> b!1033863 (= lt!456353 (addApplyDifferent!485 lt!456338 lt!456349 (minValue!6063 lt!456124) lt!456337))))

(assert (=> b!1033863 (= (apply!906 (+!3104 lt!456338 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) lt!456337) (apply!906 lt!456338 lt!456337))))

(declare-fun b!1033864 () Bool)

(declare-fun e!584410 () Bool)

(declare-fun e!584407 () Bool)

(assert (=> b!1033864 (= e!584410 e!584407)))

(declare-fun res!690712 () Bool)

(assert (=> b!1033864 (=> (not res!690712) (not e!584407))))

(assert (=> b!1033864 (= res!690712 (contains!6012 lt!456348 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (=> b!1033864 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1033865 () Bool)

(declare-fun e!584409 () Bool)

(declare-fun e!584403 () Bool)

(assert (=> b!1033865 (= e!584409 e!584403)))

(declare-fun c!104433 () Bool)

(assert (=> b!1033865 (= c!104433 (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033866 () Bool)

(declare-fun e!584414 () ListLongMap!13755)

(declare-fun call!43683 () ListLongMap!13755)

(assert (=> b!1033866 (= e!584414 call!43683)))

(declare-fun b!1033867 () Bool)

(declare-fun res!690714 () Bool)

(assert (=> b!1033867 (=> (not res!690714) (not e!584409))))

(assert (=> b!1033867 (= res!690714 e!584410)))

(declare-fun res!690708 () Bool)

(assert (=> b!1033867 (=> res!690708 e!584410)))

(declare-fun e!584412 () Bool)

(assert (=> b!1033867 (= res!690708 (not e!584412))))

(declare-fun res!690711 () Bool)

(assert (=> b!1033867 (=> (not res!690711) (not e!584412))))

(assert (=> b!1033867 (= res!690711 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1033868 () Bool)

(assert (=> b!1033868 (= e!584403 (not call!43684))))

(declare-fun b!1033869 () Bool)

(declare-fun e!584405 () Bool)

(declare-fun e!584413 () Bool)

(assert (=> b!1033869 (= e!584405 e!584413)))

(declare-fun res!690713 () Bool)

(assert (=> b!1033869 (= res!690713 call!43685)))

(assert (=> b!1033869 (=> (not res!690713) (not e!584413))))

(declare-fun b!1033870 () Bool)

(declare-fun c!104430 () Bool)

(assert (=> b!1033870 (= c!104430 (and (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!584404 () ListLongMap!13755)

(assert (=> b!1033870 (= e!584404 e!584414)))

(declare-fun b!1033871 () Bool)

(assert (=> b!1033871 (= e!584415 e!584404)))

(declare-fun c!104434 () Bool)

(assert (=> b!1033871 (= c!104434 (and (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1033872 () Bool)

(declare-fun res!690709 () Bool)

(assert (=> b!1033872 (=> (not res!690709) (not e!584409))))

(assert (=> b!1033872 (= res!690709 e!584405)))

(declare-fun c!104431 () Bool)

(assert (=> b!1033872 (= c!104431 (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1033873 () Bool)

(assert (=> b!1033873 (= e!584412 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun bm!43683 () Bool)

(declare-fun call!43689 () ListLongMap!13755)

(declare-fun call!43686 () ListLongMap!13755)

(assert (=> bm!43683 (= call!43689 call!43686)))

(declare-fun b!1033874 () Bool)

(assert (=> b!1033874 (= e!584404 call!43688)))

(declare-fun bm!43684 () Bool)

(declare-fun c!104429 () Bool)

(assert (=> bm!43684 (= call!43687 (+!3104 (ite c!104429 call!43686 (ite c!104434 call!43689 call!43683)) (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(declare-fun bm!43685 () Bool)

(assert (=> bm!43685 (= call!43686 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)))))

(declare-fun b!1033875 () Bool)

(assert (=> b!1033875 (= e!584405 (not call!43685))))

(declare-fun b!1033876 () Bool)

(assert (=> b!1033876 (= e!584414 call!43688)))

(declare-fun bm!43686 () Bool)

(assert (=> bm!43686 (= call!43683 call!43689)))

(declare-fun b!1033877 () Bool)

(declare-fun e!584408 () Bool)

(assert (=> b!1033877 (= e!584408 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1033878 () Bool)

(declare-fun Unit!33841 () Unit!33831)

(assert (=> b!1033878 (= e!584411 Unit!33841)))

(declare-fun b!1033879 () Bool)

(assert (=> b!1033879 (= e!584413 (= (apply!906 lt!456348 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!6063 lt!456124)))))

(declare-fun b!1033880 () Bool)

(assert (=> b!1033880 (= e!584407 (= (apply!906 lt!456348 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 lt!456124))))))

(assert (=> b!1033880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1033862 () Bool)

(assert (=> b!1033862 (= e!584403 e!584406)))

(declare-fun res!690710 () Bool)

(assert (=> b!1033862 (= res!690710 call!43684)))

(assert (=> b!1033862 (=> (not res!690710) (not e!584406))))

(declare-fun d!123887 () Bool)

(assert (=> d!123887 e!584409))

(declare-fun res!690707 () Bool)

(assert (=> d!123887 (=> (not res!690707) (not e!584409))))

(assert (=> d!123887 (= res!690707 (or (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))))

(declare-fun lt!456336 () ListLongMap!13755)

(assert (=> d!123887 (= lt!456348 lt!456336)))

(declare-fun lt!456342 () Unit!33831)

(assert (=> d!123887 (= lt!456342 e!584411)))

(declare-fun c!104432 () Bool)

(assert (=> d!123887 (= c!104432 e!584408)))

(declare-fun res!690706 () Bool)

(assert (=> d!123887 (=> (not res!690706) (not e!584408))))

(assert (=> d!123887 (= res!690706 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!123887 (= lt!456336 e!584415)))

(assert (=> d!123887 (= c!104429 (and (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5959 lt!456124) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!123887 (validMask!0 (mask!30084 lt!456124))))

(assert (=> d!123887 (= (getCurrentListMap!3941 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)) lt!456348)))

(assert (= (and d!123887 c!104429) b!1033860))

(assert (= (and d!123887 (not c!104429)) b!1033871))

(assert (= (and b!1033871 c!104434) b!1033874))

(assert (= (and b!1033871 (not c!104434)) b!1033870))

(assert (= (and b!1033870 c!104430) b!1033876))

(assert (= (and b!1033870 (not c!104430)) b!1033866))

(assert (= (or b!1033876 b!1033866) bm!43686))

(assert (= (or b!1033874 bm!43686) bm!43683))

(assert (= (or b!1033874 b!1033876) bm!43681))

(assert (= (or b!1033860 bm!43683) bm!43685))

(assert (= (or b!1033860 bm!43681) bm!43684))

(assert (= (and d!123887 res!690706) b!1033877))

(assert (= (and d!123887 c!104432) b!1033863))

(assert (= (and d!123887 (not c!104432)) b!1033878))

(assert (= (and d!123887 res!690707) b!1033867))

(assert (= (and b!1033867 res!690711) b!1033873))

(assert (= (and b!1033867 (not res!690708)) b!1033864))

(assert (= (and b!1033864 res!690712) b!1033880))

(assert (= (and b!1033867 res!690714) b!1033872))

(assert (= (and b!1033872 c!104431) b!1033869))

(assert (= (and b!1033872 (not c!104431)) b!1033875))

(assert (= (and b!1033869 res!690713) b!1033879))

(assert (= (or b!1033869 b!1033875) bm!43682))

(assert (= (and b!1033872 res!690709) b!1033865))

(assert (= (and b!1033865 c!104433) b!1033862))

(assert (= (and b!1033865 (not c!104433)) b!1033868))

(assert (= (and b!1033862 res!690710) b!1033861))

(assert (= (or b!1033862 b!1033868) bm!43680))

(declare-fun b_lambda!16069 () Bool)

(assert (=> (not b_lambda!16069) (not b!1033880)))

(declare-fun tb!7025 () Bool)

(declare-fun t!31109 () Bool)

(assert (=> (and b!1033597 (= (defaultEntry!6227 thiss!1427) (defaultEntry!6227 lt!456124)) t!31109) tb!7025))

(declare-fun result!14397 () Bool)

(assert (=> tb!7025 (= result!14397 tp_is_empty!24519)))

(assert (=> b!1033880 t!31109))

(declare-fun b_and!33289 () Bool)

(assert (= b_and!33287 (and (=> t!31109 result!14397) b_and!33289)))

(declare-fun m!953693 () Bool)

(assert (=> bm!43685 m!953693))

(declare-fun m!953695 () Bool)

(assert (=> b!1033880 m!953695))

(declare-fun m!953697 () Bool)

(assert (=> b!1033880 m!953697))

(assert (=> b!1033880 m!953485))

(declare-fun m!953699 () Bool)

(assert (=> b!1033880 m!953699))

(assert (=> b!1033880 m!953695))

(assert (=> b!1033880 m!953697))

(declare-fun m!953701 () Bool)

(assert (=> b!1033880 m!953701))

(assert (=> b!1033880 m!953485))

(declare-fun m!953703 () Bool)

(assert (=> bm!43682 m!953703))

(declare-fun m!953705 () Bool)

(assert (=> bm!43680 m!953705))

(assert (=> b!1033873 m!953485))

(assert (=> b!1033873 m!953485))

(assert (=> b!1033873 m!953493))

(declare-fun m!953707 () Bool)

(assert (=> b!1033879 m!953707))

(declare-fun m!953709 () Bool)

(assert (=> b!1033863 m!953709))

(declare-fun m!953711 () Bool)

(assert (=> b!1033863 m!953711))

(assert (=> b!1033863 m!953709))

(declare-fun m!953713 () Bool)

(assert (=> b!1033863 m!953713))

(declare-fun m!953715 () Bool)

(assert (=> b!1033863 m!953715))

(declare-fun m!953717 () Bool)

(assert (=> b!1033863 m!953717))

(declare-fun m!953719 () Bool)

(assert (=> b!1033863 m!953719))

(declare-fun m!953721 () Bool)

(assert (=> b!1033863 m!953721))

(assert (=> b!1033863 m!953721))

(declare-fun m!953723 () Bool)

(assert (=> b!1033863 m!953723))

(assert (=> b!1033863 m!953693))

(declare-fun m!953725 () Bool)

(assert (=> b!1033863 m!953725))

(declare-fun m!953727 () Bool)

(assert (=> b!1033863 m!953727))

(assert (=> b!1033863 m!953485))

(declare-fun m!953729 () Bool)

(assert (=> b!1033863 m!953729))

(declare-fun m!953731 () Bool)

(assert (=> b!1033863 m!953731))

(assert (=> b!1033863 m!953715))

(declare-fun m!953733 () Bool)

(assert (=> b!1033863 m!953733))

(declare-fun m!953735 () Bool)

(assert (=> b!1033863 m!953735))

(declare-fun m!953737 () Bool)

(assert (=> b!1033863 m!953737))

(assert (=> b!1033863 m!953733))

(assert (=> b!1033864 m!953485))

(assert (=> b!1033864 m!953485))

(declare-fun m!953739 () Bool)

(assert (=> b!1033864 m!953739))

(assert (=> b!1033877 m!953485))

(assert (=> b!1033877 m!953485))

(assert (=> b!1033877 m!953493))

(declare-fun m!953741 () Bool)

(assert (=> b!1033860 m!953741))

(declare-fun m!953743 () Bool)

(assert (=> b!1033861 m!953743))

(assert (=> d!123887 m!953687))

(declare-fun m!953745 () Bool)

(assert (=> bm!43684 m!953745))

(assert (=> d!123821 d!123887))

(declare-fun d!123889 () Bool)

(declare-fun e!584416 () Bool)

(assert (=> d!123889 e!584416))

(declare-fun res!690715 () Bool)

(assert (=> d!123889 (=> (not res!690715) (not e!584416))))

(declare-fun lt!456356 () ListLongMap!13755)

(assert (=> d!123889 (= res!690715 (contains!6012 lt!456356 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456359 () List!21905)

(assert (=> d!123889 (= lt!456356 (ListLongMap!13756 lt!456359))))

(declare-fun lt!456358 () Unit!33831)

(declare-fun lt!456357 () Unit!33831)

(assert (=> d!123889 (= lt!456358 lt!456357)))

(assert (=> d!123889 (= (getValueByKey!588 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!123889 (= lt!456357 (lemmaContainsTupThenGetReturnValue!279 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!123889 (= lt!456359 (insertStrictlySorted!372 (toList!6893 call!43663) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!123889 (= (+!3104 call!43663 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) lt!456356)))

(declare-fun b!1033881 () Bool)

(declare-fun res!690716 () Bool)

(assert (=> b!1033881 (=> (not res!690716) (not e!584416))))

(assert (=> b!1033881 (= res!690716 (= (getValueByKey!588 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033882 () Bool)

(assert (=> b!1033882 (= e!584416 (contains!6013 (toList!6893 lt!456356) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(assert (= (and d!123889 res!690715) b!1033881))

(assert (= (and b!1033881 res!690716) b!1033882))

(declare-fun m!953747 () Bool)

(assert (=> d!123889 m!953747))

(declare-fun m!953749 () Bool)

(assert (=> d!123889 m!953749))

(declare-fun m!953751 () Bool)

(assert (=> d!123889 m!953751))

(declare-fun m!953753 () Bool)

(assert (=> d!123889 m!953753))

(declare-fun m!953755 () Bool)

(assert (=> b!1033881 m!953755))

(declare-fun m!953757 () Bool)

(assert (=> b!1033882 m!953757))

(assert (=> b!1033676 d!123889))

(assert (=> b!1033713 d!123831))

(declare-fun d!123891 () Bool)

(assert (=> d!123891 (= (apply!906 lt!456196 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30226 () Bool)

(assert (= bs!30226 d!123891))

(declare-fun m!953759 () Bool)

(assert (=> bs!30226 m!953759))

(assert (=> bs!30226 m!953759))

(declare-fun m!953761 () Bool)

(assert (=> bs!30226 m!953761))

(assert (=> b!1033677 d!123891))

(declare-fun d!123893 () Bool)

(declare-fun e!584417 () Bool)

(assert (=> d!123893 e!584417))

(declare-fun res!690717 () Bool)

(assert (=> d!123893 (=> res!690717 e!584417)))

(declare-fun lt!456363 () Bool)

(assert (=> d!123893 (= res!690717 (not lt!456363))))

(declare-fun lt!456361 () Bool)

(assert (=> d!123893 (= lt!456363 lt!456361)))

(declare-fun lt!456360 () Unit!33831)

(declare-fun e!584418 () Unit!33831)

(assert (=> d!123893 (= lt!456360 e!584418)))

(declare-fun c!104435 () Bool)

(assert (=> d!123893 (= c!104435 lt!456361)))

(assert (=> d!123893 (= lt!456361 (containsKey!563 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123893 (= (contains!6012 lt!456196 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456363)))

(declare-fun b!1033883 () Bool)

(declare-fun lt!456362 () Unit!33831)

(assert (=> b!1033883 (= e!584418 lt!456362)))

(assert (=> b!1033883 (= lt!456362 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033883 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033884 () Bool)

(declare-fun Unit!33842 () Unit!33831)

(assert (=> b!1033884 (= e!584418 Unit!33842)))

(declare-fun b!1033885 () Bool)

(assert (=> b!1033885 (= e!584417 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123893 c!104435) b!1033883))

(assert (= (and d!123893 (not c!104435)) b!1033884))

(assert (= (and d!123893 (not res!690717)) b!1033885))

(declare-fun m!953763 () Bool)

(assert (=> d!123893 m!953763))

(declare-fun m!953765 () Bool)

(assert (=> b!1033883 m!953765))

(assert (=> b!1033883 m!953759))

(assert (=> b!1033883 m!953759))

(declare-fun m!953767 () Bool)

(assert (=> b!1033883 m!953767))

(assert (=> b!1033885 m!953759))

(assert (=> b!1033885 m!953759))

(assert (=> b!1033885 m!953767))

(assert (=> bm!43656 d!123893))

(declare-fun b!1033896 () Bool)

(declare-fun e!584429 () Bool)

(declare-fun call!43692 () Bool)

(assert (=> b!1033896 (= e!584429 call!43692)))

(declare-fun bm!43689 () Bool)

(declare-fun c!104438 () Bool)

(assert (=> bm!43689 (= call!43692 (arrayNoDuplicates!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104438 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)))))

(declare-fun b!1033897 () Bool)

(assert (=> b!1033897 (= e!584429 call!43692)))

(declare-fun b!1033898 () Bool)

(declare-fun e!584430 () Bool)

(declare-fun e!584428 () Bool)

(assert (=> b!1033898 (= e!584430 e!584428)))

(declare-fun res!690726 () Bool)

(assert (=> b!1033898 (=> (not res!690726) (not e!584428))))

(declare-fun e!584427 () Bool)

(assert (=> b!1033898 (= res!690726 (not e!584427))))

(declare-fun res!690724 () Bool)

(assert (=> b!1033898 (=> (not res!690724) (not e!584427))))

(assert (=> b!1033898 (= res!690724 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123895 () Bool)

(declare-fun res!690725 () Bool)

(assert (=> d!123895 (=> res!690725 e!584430)))

(assert (=> d!123895 (= res!690725 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123895 (= (arrayNoDuplicates!0 (_keys!11407 thiss!1427) #b00000000000000000000000000000000 Nil!21904) e!584430)))

(declare-fun b!1033899 () Bool)

(assert (=> b!1033899 (= e!584428 e!584429)))

(assert (=> b!1033899 (= c!104438 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033900 () Bool)

(declare-fun contains!6014 (List!21907 (_ BitVec 64)) Bool)

(assert (=> b!1033900 (= e!584427 (contains!6014 Nil!21904 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123895 (not res!690725)) b!1033898))

(assert (= (and b!1033898 res!690724) b!1033900))

(assert (= (and b!1033898 res!690726) b!1033899))

(assert (= (and b!1033899 c!104438) b!1033897))

(assert (= (and b!1033899 (not c!104438)) b!1033896))

(assert (= (or b!1033897 b!1033896) bm!43689))

(assert (=> bm!43689 m!953361))

(declare-fun m!953769 () Bool)

(assert (=> bm!43689 m!953769))

(assert (=> b!1033898 m!953361))

(assert (=> b!1033898 m!953361))

(assert (=> b!1033898 m!953371))

(assert (=> b!1033899 m!953361))

(assert (=> b!1033899 m!953361))

(assert (=> b!1033899 m!953371))

(assert (=> b!1033900 m!953361))

(assert (=> b!1033900 m!953361))

(declare-fun m!953771 () Bool)

(assert (=> b!1033900 m!953771))

(assert (=> b!1033633 d!123895))

(assert (=> bm!43661 d!123861))

(declare-fun d!123897 () Bool)

(declare-fun e!584431 () Bool)

(assert (=> d!123897 e!584431))

(declare-fun res!690727 () Bool)

(assert (=> d!123897 (=> res!690727 e!584431)))

(declare-fun lt!456367 () Bool)

(assert (=> d!123897 (= res!690727 (not lt!456367))))

(declare-fun lt!456365 () Bool)

(assert (=> d!123897 (= lt!456367 lt!456365)))

(declare-fun lt!456364 () Unit!33831)

(declare-fun e!584432 () Unit!33831)

(assert (=> d!123897 (= lt!456364 e!584432)))

(declare-fun c!104439 () Bool)

(assert (=> d!123897 (= c!104439 lt!456365)))

(assert (=> d!123897 (= lt!456365 (containsKey!563 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123897 (= (contains!6012 lt!456206 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456367)))

(declare-fun b!1033901 () Bool)

(declare-fun lt!456366 () Unit!33831)

(assert (=> b!1033901 (= e!584432 lt!456366)))

(assert (=> b!1033901 (= lt!456366 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033901 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033902 () Bool)

(declare-fun Unit!33843 () Unit!33831)

(assert (=> b!1033902 (= e!584432 Unit!33843)))

(declare-fun b!1033903 () Bool)

(assert (=> b!1033903 (= e!584431 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123897 c!104439) b!1033901))

(assert (= (and d!123897 (not c!104439)) b!1033902))

(assert (= (and d!123897 (not res!690727)) b!1033903))

(declare-fun m!953773 () Bool)

(assert (=> d!123897 m!953773))

(declare-fun m!953775 () Bool)

(assert (=> b!1033901 m!953775))

(declare-fun m!953777 () Bool)

(assert (=> b!1033901 m!953777))

(assert (=> b!1033901 m!953777))

(declare-fun m!953779 () Bool)

(assert (=> b!1033901 m!953779))

(assert (=> b!1033903 m!953777))

(assert (=> b!1033903 m!953777))

(assert (=> b!1033903 m!953779))

(assert (=> d!123817 d!123897))

(declare-fun d!123899 () Bool)

(declare-fun e!584439 () Bool)

(assert (=> d!123899 e!584439))

(declare-fun res!690730 () Bool)

(assert (=> d!123899 (=> (not res!690730) (not e!584439))))

(declare-fun lt!456370 () List!21905)

(declare-fun isStrictlySorted!718 (List!21905) Bool)

(assert (=> d!123899 (= res!690730 (isStrictlySorted!718 lt!456370))))

(declare-fun e!584440 () List!21905)

(assert (=> d!123899 (= lt!456370 e!584440)))

(declare-fun c!104444 () Bool)

(assert (=> d!123899 (= c!104444 (and ((_ is Cons!21901) (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) (= (_1!7874 (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123899 (isStrictlySorted!718 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))))

(assert (=> d!123899 (= (removeStrictlySorted!56 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456370)))

(declare-fun b!1033914 () Bool)

(assert (=> b!1033914 (= e!584440 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))))

(declare-fun b!1033915 () Bool)

(declare-fun e!584441 () List!21905)

(assert (=> b!1033915 (= e!584441 Nil!21902)))

(declare-fun b!1033916 () Bool)

(declare-fun $colon$colon!602 (List!21905 tuple2!15726) List!21905)

(assert (=> b!1033916 (= e!584441 ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))))))

(declare-fun b!1033917 () Bool)

(assert (=> b!1033917 (= e!584440 e!584441)))

(declare-fun c!104445 () Bool)

(assert (=> b!1033917 (= c!104445 (and ((_ is Cons!21901) (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) (not (= (_1!7874 (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1033918 () Bool)

(assert (=> b!1033918 (= e!584439 (not (containsKey!563 lt!456370 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123899 c!104444) b!1033914))

(assert (= (and d!123899 (not c!104444)) b!1033917))

(assert (= (and b!1033917 c!104445) b!1033916))

(assert (= (and b!1033917 (not c!104445)) b!1033915))

(assert (= (and d!123899 res!690730) b!1033918))

(declare-fun m!953781 () Bool)

(assert (=> d!123899 m!953781))

(declare-fun m!953783 () Bool)

(assert (=> d!123899 m!953783))

(declare-fun m!953785 () Bool)

(assert (=> b!1033916 m!953785))

(assert (=> b!1033916 m!953785))

(declare-fun m!953787 () Bool)

(assert (=> b!1033916 m!953787))

(declare-fun m!953789 () Bool)

(assert (=> b!1033918 m!953789))

(assert (=> d!123817 d!123899))

(declare-fun d!123901 () Bool)

(assert (=> d!123901 (= (-!520 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))

(assert (=> d!123901 true))

(declare-fun _$11!31 () Unit!33831)

(assert (=> d!123901 (= (choose!1696 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) (zeroValue!6063 thiss!1427) lt!456123 (minValue!6063 thiss!1427) (defaultEntry!6227 thiss!1427)) _$11!31)))

(declare-fun bs!30227 () Bool)

(assert (= bs!30227 d!123901))

(assert (=> bs!30227 m!953315))

(assert (=> bs!30227 m!953315))

(assert (=> bs!30227 m!953317))

(assert (=> bs!30227 m!953311))

(assert (=> d!123811 d!123901))

(assert (=> d!123811 d!123813))

(declare-fun d!123903 () Bool)

(assert (=> d!123903 (= (validMask!0 (mask!30084 thiss!1427)) (and (or (= (mask!30084 thiss!1427) #b00000000000000000000000000000111) (= (mask!30084 thiss!1427) #b00000000000000000000000000001111) (= (mask!30084 thiss!1427) #b00000000000000000000000000011111) (= (mask!30084 thiss!1427) #b00000000000000000000000000111111) (= (mask!30084 thiss!1427) #b00000000000000000000000001111111) (= (mask!30084 thiss!1427) #b00000000000000000000000011111111) (= (mask!30084 thiss!1427) #b00000000000000000000000111111111) (= (mask!30084 thiss!1427) #b00000000000000000000001111111111) (= (mask!30084 thiss!1427) #b00000000000000000000011111111111) (= (mask!30084 thiss!1427) #b00000000000000000000111111111111) (= (mask!30084 thiss!1427) #b00000000000000000001111111111111) (= (mask!30084 thiss!1427) #b00000000000000000011111111111111) (= (mask!30084 thiss!1427) #b00000000000000000111111111111111) (= (mask!30084 thiss!1427) #b00000000000000001111111111111111) (= (mask!30084 thiss!1427) #b00000000000000011111111111111111) (= (mask!30084 thiss!1427) #b00000000000000111111111111111111) (= (mask!30084 thiss!1427) #b00000000000001111111111111111111) (= (mask!30084 thiss!1427) #b00000000000011111111111111111111) (= (mask!30084 thiss!1427) #b00000000000111111111111111111111) (= (mask!30084 thiss!1427) #b00000000001111111111111111111111) (= (mask!30084 thiss!1427) #b00000000011111111111111111111111) (= (mask!30084 thiss!1427) #b00000000111111111111111111111111) (= (mask!30084 thiss!1427) #b00000001111111111111111111111111) (= (mask!30084 thiss!1427) #b00000011111111111111111111111111) (= (mask!30084 thiss!1427) #b00000111111111111111111111111111) (= (mask!30084 thiss!1427) #b00001111111111111111111111111111) (= (mask!30084 thiss!1427) #b00011111111111111111111111111111) (= (mask!30084 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!30084 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> d!123811 d!123903))

(assert (=> d!123811 d!123817))

(assert (=> d!123811 d!123819))

(declare-fun b!1033919 () Bool)

(declare-fun e!584442 () Bool)

(declare-fun e!584444 () Bool)

(assert (=> b!1033919 (= e!584442 e!584444)))

(declare-fun lt!456372 () (_ BitVec 64))

(assert (=> b!1033919 (= lt!456372 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))

(declare-fun lt!456371 () Unit!33831)

(assert (=> b!1033919 (= lt!456371 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000))))

(assert (=> b!1033919 (arrayContainsKey!0 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000)))

(declare-fun lt!456373 () Unit!33831)

(assert (=> b!1033919 (= lt!456373 lt!456371)))

(declare-fun res!690731 () Bool)

(assert (=> b!1033919 (= res!690731 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)) (Found!9738 #b00000000000000000000000000000000)))))

(assert (=> b!1033919 (=> (not res!690731) (not e!584444))))

(declare-fun b!1033920 () Bool)

(declare-fun call!43693 () Bool)

(assert (=> b!1033920 (= e!584444 call!43693)))

(declare-fun d!123905 () Bool)

(declare-fun res!690732 () Bool)

(declare-fun e!584443 () Bool)

(assert (=> d!123905 (=> res!690732 e!584443)))

(assert (=> d!123905 (= res!690732 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123905 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11407 thiss!1427) (mask!30084 thiss!1427)) e!584443)))

(declare-fun b!1033921 () Bool)

(assert (=> b!1033921 (= e!584443 e!584442)))

(declare-fun c!104446 () Bool)

(assert (=> b!1033921 (= c!104446 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033922 () Bool)

(assert (=> b!1033922 (= e!584442 call!43693)))

(declare-fun bm!43690 () Bool)

(assert (=> bm!43690 (= call!43693 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)))))

(assert (= (and d!123905 (not res!690732)) b!1033921))

(assert (= (and b!1033921 c!104446) b!1033919))

(assert (= (and b!1033921 (not c!104446)) b!1033922))

(assert (= (and b!1033919 res!690731) b!1033920))

(assert (= (or b!1033920 b!1033922) bm!43690))

(assert (=> b!1033919 m!953361))

(declare-fun m!953791 () Bool)

(assert (=> b!1033919 m!953791))

(declare-fun m!953793 () Bool)

(assert (=> b!1033919 m!953793))

(assert (=> b!1033919 m!953361))

(declare-fun m!953795 () Bool)

(assert (=> b!1033919 m!953795))

(assert (=> b!1033921 m!953361))

(assert (=> b!1033921 m!953361))

(assert (=> b!1033921 m!953371))

(declare-fun m!953797 () Bool)

(assert (=> bm!43690 m!953797))

(assert (=> b!1033632 d!123905))

(assert (=> d!123825 d!123819))

(declare-fun d!123907 () Bool)

(declare-fun e!584445 () Bool)

(assert (=> d!123907 e!584445))

(declare-fun res!690733 () Bool)

(assert (=> d!123907 (=> (not res!690733) (not e!584445))))

(declare-fun lt!456374 () ListLongMap!13755)

(assert (=> d!123907 (= res!690733 (contains!6012 lt!456374 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun lt!456377 () List!21905)

(assert (=> d!123907 (= lt!456374 (ListLongMap!13756 lt!456377))))

(declare-fun lt!456376 () Unit!33831)

(declare-fun lt!456375 () Unit!33831)

(assert (=> d!123907 (= lt!456376 lt!456375)))

(assert (=> d!123907 (= (getValueByKey!588 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123907 (= lt!456375 (lemmaContainsTupThenGetReturnValue!279 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123907 (= lt!456377 (insertStrictlySorted!372 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!123907 (= (+!3104 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456374)))

(declare-fun b!1033923 () Bool)

(declare-fun res!690734 () Bool)

(assert (=> b!1033923 (=> (not res!690734) (not e!584445))))

(assert (=> b!1033923 (= res!690734 (= (getValueByKey!588 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1033924 () Bool)

(assert (=> b!1033924 (= e!584445 (contains!6013 (toList!6893 lt!456374) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (= (and d!123907 res!690733) b!1033923))

(assert (= (and b!1033923 res!690734) b!1033924))

(declare-fun m!953799 () Bool)

(assert (=> d!123907 m!953799))

(declare-fun m!953801 () Bool)

(assert (=> d!123907 m!953801))

(declare-fun m!953803 () Bool)

(assert (=> d!123907 m!953803))

(declare-fun m!953805 () Bool)

(assert (=> d!123907 m!953805))

(declare-fun m!953807 () Bool)

(assert (=> b!1033923 m!953807))

(declare-fun m!953809 () Bool)

(assert (=> b!1033924 m!953809))

(assert (=> bm!43660 d!123907))

(declare-fun d!123909 () Bool)

(declare-fun res!690738 () Bool)

(declare-fun e!584446 () Bool)

(assert (=> d!123909 (=> (not res!690738) (not e!584446))))

(assert (=> d!123909 (= res!690738 (validMask!0 (mask!30084 thiss!1427)))))

(assert (=> d!123909 (= (simpleValid!405 thiss!1427) e!584446)))

(declare-fun b!1033926 () Bool)

(declare-fun res!690736 () Bool)

(assert (=> b!1033926 (=> (not res!690736) (not e!584446))))

(assert (=> b!1033926 (= res!690736 (bvsge (size!31879 thiss!1427) (_size!2908 thiss!1427)))))

(declare-fun b!1033928 () Bool)

(assert (=> b!1033928 (= e!584446 (and (bvsge (extraKeys!5959 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5959 thiss!1427) #b00000000000000000000000000000011) (bvsge (_vacant!2908 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1033925 () Bool)

(declare-fun res!690737 () Bool)

(assert (=> b!1033925 (=> (not res!690737) (not e!584446))))

(assert (=> b!1033925 (= res!690737 (and (= (size!31876 (_values!6250 thiss!1427)) (bvadd (mask!30084 thiss!1427) #b00000000000000000000000000000001)) (= (size!31875 (_keys!11407 thiss!1427)) (size!31876 (_values!6250 thiss!1427))) (bvsge (_size!2908 thiss!1427) #b00000000000000000000000000000000) (bvsle (_size!2908 thiss!1427) (bvadd (mask!30084 thiss!1427) #b00000000000000000000000000000001))))))

(declare-fun b!1033927 () Bool)

(declare-fun res!690735 () Bool)

(assert (=> b!1033927 (=> (not res!690735) (not e!584446))))

(assert (=> b!1033927 (= res!690735 (= (size!31879 thiss!1427) (bvadd (_size!2908 thiss!1427) (bvsdiv (bvadd (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!123909 res!690738) b!1033925))

(assert (= (and b!1033925 res!690737) b!1033926))

(assert (= (and b!1033926 res!690736) b!1033927))

(assert (= (and b!1033927 res!690735) b!1033928))

(assert (=> d!123909 m!953355))

(declare-fun m!953811 () Bool)

(assert (=> b!1033926 m!953811))

(assert (=> b!1033927 m!953811))

(assert (=> d!123805 d!123909))

(declare-fun d!123911 () Bool)

(declare-fun lt!456378 () (_ BitVec 32))

(assert (=> d!123911 (and (bvsge lt!456378 #b00000000000000000000000000000000) (bvsle lt!456378 (bvsub (size!31875 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584447 () (_ BitVec 32))

(assert (=> d!123911 (= lt!456378 e!584447)))

(declare-fun c!104447 () Bool)

(assert (=> d!123911 (= c!104447 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123911 (and (bvsle #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!31875 (_keys!11407 thiss!1427)) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123911 (= (arrayCountValidKeys!0 (_keys!11407 thiss!1427) #b00000000000000000000000000000000 (size!31875 (_keys!11407 thiss!1427))) lt!456378)))

(declare-fun b!1033929 () Bool)

(declare-fun e!584448 () (_ BitVec 32))

(declare-fun call!43694 () (_ BitVec 32))

(assert (=> b!1033929 (= e!584448 (bvadd #b00000000000000000000000000000001 call!43694))))

(declare-fun b!1033930 () Bool)

(assert (=> b!1033930 (= e!584447 e!584448)))

(declare-fun c!104448 () Bool)

(assert (=> b!1033930 (= c!104448 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033931 () Bool)

(assert (=> b!1033931 (= e!584447 #b00000000000000000000000000000000)))

(declare-fun bm!43691 () Bool)

(assert (=> bm!43691 (= call!43694 (arrayCountValidKeys!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1033932 () Bool)

(assert (=> b!1033932 (= e!584448 call!43694)))

(assert (= (and d!123911 c!104447) b!1033931))

(assert (= (and d!123911 (not c!104447)) b!1033930))

(assert (= (and b!1033930 c!104448) b!1033929))

(assert (= (and b!1033930 (not c!104448)) b!1033932))

(assert (= (or b!1033929 b!1033932) bm!43691))

(assert (=> b!1033930 m!953361))

(assert (=> b!1033930 m!953361))

(assert (=> b!1033930 m!953371))

(declare-fun m!953813 () Bool)

(assert (=> bm!43691 m!953813))

(assert (=> b!1033631 d!123911))

(assert (=> d!123813 d!123903))

(assert (=> b!1033689 d!123831))

(declare-fun d!123913 () Bool)

(declare-fun e!584449 () Bool)

(assert (=> d!123913 e!584449))

(declare-fun res!690739 () Bool)

(assert (=> d!123913 (=> res!690739 e!584449)))

(declare-fun lt!456382 () Bool)

(assert (=> d!123913 (= res!690739 (not lt!456382))))

(declare-fun lt!456380 () Bool)

(assert (=> d!123913 (= lt!456382 lt!456380)))

(declare-fun lt!456379 () Unit!33831)

(declare-fun e!584450 () Unit!33831)

(assert (=> d!123913 (= lt!456379 e!584450)))

(declare-fun c!104449 () Bool)

(assert (=> d!123913 (= c!104449 lt!456380)))

(assert (=> d!123913 (= lt!456380 (containsKey!563 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!123913 (= (contains!6012 lt!456221 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456382)))

(declare-fun b!1033933 () Bool)

(declare-fun lt!456381 () Unit!33831)

(assert (=> b!1033933 (= e!584450 lt!456381)))

(assert (=> b!1033933 (= lt!456381 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033933 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1033934 () Bool)

(declare-fun Unit!33844 () Unit!33831)

(assert (=> b!1033934 (= e!584450 Unit!33844)))

(declare-fun b!1033935 () Bool)

(assert (=> b!1033935 (= e!584449 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!123913 c!104449) b!1033933))

(assert (= (and d!123913 (not c!104449)) b!1033934))

(assert (= (and d!123913 (not res!690739)) b!1033935))

(assert (=> d!123913 m!953361))

(declare-fun m!953815 () Bool)

(assert (=> d!123913 m!953815))

(assert (=> b!1033933 m!953361))

(declare-fun m!953817 () Bool)

(assert (=> b!1033933 m!953817))

(assert (=> b!1033933 m!953361))

(declare-fun m!953819 () Bool)

(assert (=> b!1033933 m!953819))

(assert (=> b!1033933 m!953819))

(declare-fun m!953821 () Bool)

(assert (=> b!1033933 m!953821))

(assert (=> b!1033935 m!953361))

(assert (=> b!1033935 m!953819))

(assert (=> b!1033935 m!953819))

(assert (=> b!1033935 m!953821))

(assert (=> b!1033704 d!123913))

(declare-fun d!123915 () Bool)

(assert (=> d!123915 (= (apply!906 lt!456221 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16434 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30228 () Bool)

(assert (= bs!30228 d!123915))

(assert (=> bs!30228 m!953361))

(assert (=> bs!30228 m!953819))

(assert (=> bs!30228 m!953819))

(declare-fun m!953823 () Bool)

(assert (=> bs!30228 m!953823))

(assert (=> b!1033720 d!123915))

(assert (=> b!1033720 d!123847))

(declare-fun d!123917 () Bool)

(declare-fun e!584451 () Bool)

(assert (=> d!123917 e!584451))

(declare-fun res!690740 () Bool)

(assert (=> d!123917 (=> (not res!690740) (not e!584451))))

(declare-fun lt!456383 () ListLongMap!13755)

(assert (=> d!123917 (= res!690740 (contains!6012 lt!456383 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456386 () List!21905)

(assert (=> d!123917 (= lt!456383 (ListLongMap!13756 lt!456386))))

(declare-fun lt!456385 () Unit!33831)

(declare-fun lt!456384 () Unit!33831)

(assert (=> d!123917 (= lt!456385 lt!456384)))

(assert (=> d!123917 (= (getValueByKey!588 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(assert (=> d!123917 (= lt!456384 (lemmaContainsTupThenGetReturnValue!279 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(assert (=> d!123917 (= lt!456386 (insertStrictlySorted!372 (toList!6893 lt!456211) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(assert (=> d!123917 (= (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456383)))

(declare-fun b!1033936 () Bool)

(declare-fun res!690741 () Bool)

(assert (=> b!1033936 (=> (not res!690741) (not e!584451))))

(assert (=> b!1033936 (= res!690741 (= (getValueByKey!588 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033937 () Bool)

(assert (=> b!1033937 (= e!584451 (contains!6013 (toList!6893 lt!456383) (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))

(assert (= (and d!123917 res!690740) b!1033936))

(assert (= (and b!1033936 res!690741) b!1033937))

(declare-fun m!953825 () Bool)

(assert (=> d!123917 m!953825))

(declare-fun m!953827 () Bool)

(assert (=> d!123917 m!953827))

(declare-fun m!953829 () Bool)

(assert (=> d!123917 m!953829))

(declare-fun m!953831 () Bool)

(assert (=> d!123917 m!953831))

(declare-fun m!953833 () Bool)

(assert (=> b!1033936 m!953833))

(declare-fun m!953835 () Bool)

(assert (=> b!1033937 m!953835))

(assert (=> b!1033703 d!123917))

(declare-fun d!123919 () Bool)

(assert (=> d!123919 (= (apply!906 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456220) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456220)))))

(declare-fun bs!30229 () Bool)

(assert (= bs!30229 d!123919))

(declare-fun m!953837 () Bool)

(assert (=> bs!30229 m!953837))

(assert (=> bs!30229 m!953837))

(declare-fun m!953839 () Bool)

(assert (=> bs!30229 m!953839))

(assert (=> b!1033703 d!123919))

(declare-fun d!123921 () Bool)

(assert (=> d!123921 (= (apply!906 lt!456207 lt!456220) (get!16434 (getValueByKey!588 (toList!6893 lt!456207) lt!456220)))))

(declare-fun bs!30230 () Bool)

(assert (= bs!30230 d!123921))

(declare-fun m!953841 () Bool)

(assert (=> bs!30230 m!953841))

(assert (=> bs!30230 m!953841))

(declare-fun m!953843 () Bool)

(assert (=> bs!30230 m!953843))

(assert (=> b!1033703 d!123921))

(declare-fun d!123923 () Bool)

(assert (=> d!123923 (contains!6012 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456213)))

(declare-fun lt!456387 () Unit!33831)

(assert (=> d!123923 (= lt!456387 (choose!1698 lt!456228 lt!456214 (zeroValue!6063 thiss!1427) lt!456213))))

(assert (=> d!123923 (contains!6012 lt!456228 lt!456213)))

(assert (=> d!123923 (= (addStillContains!625 lt!456228 lt!456214 (zeroValue!6063 thiss!1427) lt!456213) lt!456387)))

(declare-fun bs!30231 () Bool)

(assert (= bs!30231 d!123923))

(assert (=> bs!30231 m!953447))

(assert (=> bs!30231 m!953447))

(assert (=> bs!30231 m!953449))

(declare-fun m!953845 () Bool)

(assert (=> bs!30231 m!953845))

(declare-fun m!953847 () Bool)

(assert (=> bs!30231 m!953847))

(assert (=> b!1033703 d!123923))

(declare-fun d!123925 () Bool)

(declare-fun e!584452 () Bool)

(assert (=> d!123925 e!584452))

(declare-fun res!690742 () Bool)

(assert (=> d!123925 (=> (not res!690742) (not e!584452))))

(declare-fun lt!456388 () ListLongMap!13755)

(assert (=> d!123925 (= res!690742 (contains!6012 lt!456388 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun lt!456391 () List!21905)

(assert (=> d!123925 (= lt!456388 (ListLongMap!13756 lt!456391))))

(declare-fun lt!456390 () Unit!33831)

(declare-fun lt!456389 () Unit!33831)

(assert (=> d!123925 (= lt!456390 lt!456389)))

(assert (=> d!123925 (= (getValueByKey!588 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123925 (= lt!456389 (lemmaContainsTupThenGetReturnValue!279 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123925 (= lt!456391 (insertStrictlySorted!372 (toList!6893 lt!456228) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123925 (= (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456388)))

(declare-fun b!1033938 () Bool)

(declare-fun res!690743 () Bool)

(assert (=> b!1033938 (=> (not res!690743) (not e!584452))))

(assert (=> b!1033938 (= res!690743 (= (getValueByKey!588 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1033939 () Bool)

(assert (=> b!1033939 (= e!584452 (contains!6013 (toList!6893 lt!456388) (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))

(assert (= (and d!123925 res!690742) b!1033938))

(assert (= (and b!1033938 res!690743) b!1033939))

(declare-fun m!953849 () Bool)

(assert (=> d!123925 m!953849))

(declare-fun m!953851 () Bool)

(assert (=> d!123925 m!953851))

(declare-fun m!953853 () Bool)

(assert (=> d!123925 m!953853))

(declare-fun m!953855 () Bool)

(assert (=> d!123925 m!953855))

(declare-fun m!953857 () Bool)

(assert (=> b!1033938 m!953857))

(declare-fun m!953859 () Bool)

(assert (=> b!1033939 m!953859))

(assert (=> b!1033703 d!123925))

(declare-fun d!123927 () Bool)

(assert (=> d!123927 (= (apply!906 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456210) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456210)))))

(declare-fun bs!30232 () Bool)

(assert (= bs!30232 d!123927))

(declare-fun m!953861 () Bool)

(assert (=> bs!30232 m!953861))

(assert (=> bs!30232 m!953861))

(declare-fun m!953863 () Bool)

(assert (=> bs!30232 m!953863))

(assert (=> b!1033703 d!123927))

(declare-fun d!123929 () Bool)

(declare-fun e!584453 () Bool)

(assert (=> d!123929 e!584453))

(declare-fun res!690744 () Bool)

(assert (=> d!123929 (=> res!690744 e!584453)))

(declare-fun lt!456395 () Bool)

(assert (=> d!123929 (= res!690744 (not lt!456395))))

(declare-fun lt!456393 () Bool)

(assert (=> d!123929 (= lt!456395 lt!456393)))

(declare-fun lt!456392 () Unit!33831)

(declare-fun e!584454 () Unit!33831)

(assert (=> d!123929 (= lt!456392 e!584454)))

(declare-fun c!104450 () Bool)

(assert (=> d!123929 (= c!104450 lt!456393)))

(assert (=> d!123929 (= lt!456393 (containsKey!563 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(assert (=> d!123929 (= (contains!6012 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456213) lt!456395)))

(declare-fun b!1033940 () Bool)

(declare-fun lt!456394 () Unit!33831)

(assert (=> b!1033940 (= e!584454 lt!456394)))

(assert (=> b!1033940 (= lt!456394 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(assert (=> b!1033940 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(declare-fun b!1033941 () Bool)

(declare-fun Unit!33845 () Unit!33831)

(assert (=> b!1033941 (= e!584454 Unit!33845)))

(declare-fun b!1033942 () Bool)

(assert (=> b!1033942 (= e!584453 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213)))))

(assert (= (and d!123929 c!104450) b!1033940))

(assert (= (and d!123929 (not c!104450)) b!1033941))

(assert (= (and d!123929 (not res!690744)) b!1033942))

(declare-fun m!953865 () Bool)

(assert (=> d!123929 m!953865))

(declare-fun m!953867 () Bool)

(assert (=> b!1033940 m!953867))

(declare-fun m!953869 () Bool)

(assert (=> b!1033940 m!953869))

(assert (=> b!1033940 m!953869))

(declare-fun m!953871 () Bool)

(assert (=> b!1033940 m!953871))

(assert (=> b!1033942 m!953869))

(assert (=> b!1033942 m!953869))

(assert (=> b!1033942 m!953871))

(assert (=> b!1033703 d!123929))

(assert (=> b!1033703 d!123849))

(declare-fun d!123931 () Bool)

(assert (=> d!123931 (= (apply!906 lt!456211 lt!456210) (get!16434 (getValueByKey!588 (toList!6893 lt!456211) lt!456210)))))

(declare-fun bs!30233 () Bool)

(assert (= bs!30233 d!123931))

(declare-fun m!953873 () Bool)

(assert (=> bs!30233 m!953873))

(assert (=> bs!30233 m!953873))

(declare-fun m!953875 () Bool)

(assert (=> bs!30233 m!953875))

(assert (=> b!1033703 d!123931))

(declare-fun d!123933 () Bool)

(declare-fun e!584455 () Bool)

(assert (=> d!123933 e!584455))

(declare-fun res!690745 () Bool)

(assert (=> d!123933 (=> (not res!690745) (not e!584455))))

(declare-fun lt!456396 () ListLongMap!13755)

(assert (=> d!123933 (= res!690745 (contains!6012 lt!456396 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun lt!456399 () List!21905)

(assert (=> d!123933 (= lt!456396 (ListLongMap!13756 lt!456399))))

(declare-fun lt!456398 () Unit!33831)

(declare-fun lt!456397 () Unit!33831)

(assert (=> d!123933 (= lt!456398 lt!456397)))

(assert (=> d!123933 (= (getValueByKey!588 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123933 (= lt!456397 (lemmaContainsTupThenGetReturnValue!279 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123933 (= lt!456399 (insertStrictlySorted!372 (toList!6893 lt!456207) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123933 (= (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456396)))

(declare-fun b!1033943 () Bool)

(declare-fun res!690746 () Bool)

(assert (=> b!1033943 (=> (not res!690746) (not e!584455))))

(assert (=> b!1033943 (= res!690746 (= (getValueByKey!588 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1033944 () Bool)

(assert (=> b!1033944 (= e!584455 (contains!6013 (toList!6893 lt!456396) (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))

(assert (= (and d!123933 res!690745) b!1033943))

(assert (= (and b!1033943 res!690746) b!1033944))

(declare-fun m!953877 () Bool)

(assert (=> d!123933 m!953877))

(declare-fun m!953879 () Bool)

(assert (=> d!123933 m!953879))

(declare-fun m!953881 () Bool)

(assert (=> d!123933 m!953881))

(declare-fun m!953883 () Bool)

(assert (=> d!123933 m!953883))

(declare-fun m!953885 () Bool)

(assert (=> b!1033943 m!953885))

(declare-fun m!953887 () Bool)

(assert (=> b!1033944 m!953887))

(assert (=> b!1033703 d!123933))

(declare-fun d!123935 () Bool)

(assert (=> d!123935 (= (apply!906 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456212) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456212)))))

(declare-fun bs!30234 () Bool)

(assert (= bs!30234 d!123935))

(declare-fun m!953889 () Bool)

(assert (=> bs!30234 m!953889))

(assert (=> bs!30234 m!953889))

(declare-fun m!953891 () Bool)

(assert (=> bs!30234 m!953891))

(assert (=> b!1033703 d!123935))

(declare-fun d!123937 () Bool)

(declare-fun e!584456 () Bool)

(assert (=> d!123937 e!584456))

(declare-fun res!690747 () Bool)

(assert (=> d!123937 (=> (not res!690747) (not e!584456))))

(declare-fun lt!456400 () ListLongMap!13755)

(assert (=> d!123937 (= res!690747 (contains!6012 lt!456400 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456403 () List!21905)

(assert (=> d!123937 (= lt!456400 (ListLongMap!13756 lt!456403))))

(declare-fun lt!456402 () Unit!33831)

(declare-fun lt!456401 () Unit!33831)

(assert (=> d!123937 (= lt!456402 lt!456401)))

(assert (=> d!123937 (= (getValueByKey!588 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(assert (=> d!123937 (= lt!456401 (lemmaContainsTupThenGetReturnValue!279 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(assert (=> d!123937 (= lt!456403 (insertStrictlySorted!372 (toList!6893 lt!456218) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(assert (=> d!123937 (= (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456400)))

(declare-fun b!1033945 () Bool)

(declare-fun res!690748 () Bool)

(assert (=> b!1033945 (=> (not res!690748) (not e!584456))))

(assert (=> b!1033945 (= res!690748 (= (getValueByKey!588 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(declare-fun b!1033946 () Bool)

(assert (=> b!1033946 (= e!584456 (contains!6013 (toList!6893 lt!456400) (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))

(assert (= (and d!123937 res!690747) b!1033945))

(assert (= (and b!1033945 res!690748) b!1033946))

(declare-fun m!953893 () Bool)

(assert (=> d!123937 m!953893))

(declare-fun m!953895 () Bool)

(assert (=> d!123937 m!953895))

(declare-fun m!953897 () Bool)

(assert (=> d!123937 m!953897))

(declare-fun m!953899 () Bool)

(assert (=> d!123937 m!953899))

(declare-fun m!953901 () Bool)

(assert (=> b!1033945 m!953901))

(declare-fun m!953903 () Bool)

(assert (=> b!1033946 m!953903))

(assert (=> b!1033703 d!123937))

(declare-fun d!123939 () Bool)

(assert (=> d!123939 (= (apply!906 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456210) (apply!906 lt!456211 lt!456210))))

(declare-fun lt!456404 () Unit!33831)

(assert (=> d!123939 (= lt!456404 (choose!1697 lt!456211 lt!456222 (minValue!6063 thiss!1427) lt!456210))))

(declare-fun e!584457 () Bool)

(assert (=> d!123939 e!584457))

(declare-fun res!690749 () Bool)

(assert (=> d!123939 (=> (not res!690749) (not e!584457))))

(assert (=> d!123939 (= res!690749 (contains!6012 lt!456211 lt!456210))))

(assert (=> d!123939 (= (addApplyDifferent!485 lt!456211 lt!456222 (minValue!6063 thiss!1427) lt!456210) lt!456404)))

(declare-fun b!1033947 () Bool)

(assert (=> b!1033947 (= e!584457 (not (= lt!456210 lt!456222)))))

(assert (= (and d!123939 res!690749) b!1033947))

(declare-fun m!953905 () Bool)

(assert (=> d!123939 m!953905))

(assert (=> d!123939 m!953459))

(assert (=> d!123939 m!953461))

(declare-fun m!953907 () Bool)

(assert (=> d!123939 m!953907))

(assert (=> d!123939 m!953459))

(assert (=> d!123939 m!953463))

(assert (=> b!1033703 d!123939))

(declare-fun d!123941 () Bool)

(assert (=> d!123941 (= (apply!906 lt!456218 lt!456212) (get!16434 (getValueByKey!588 (toList!6893 lt!456218) lt!456212)))))

(declare-fun bs!30235 () Bool)

(assert (= bs!30235 d!123941))

(declare-fun m!953909 () Bool)

(assert (=> bs!30235 m!953909))

(assert (=> bs!30235 m!953909))

(declare-fun m!953911 () Bool)

(assert (=> bs!30235 m!953911))

(assert (=> b!1033703 d!123941))

(declare-fun d!123943 () Bool)

(assert (=> d!123943 (= (apply!906 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456220) (apply!906 lt!456207 lt!456220))))

(declare-fun lt!456405 () Unit!33831)

(assert (=> d!123943 (= lt!456405 (choose!1697 lt!456207 lt!456225 (zeroValue!6063 thiss!1427) lt!456220))))

(declare-fun e!584458 () Bool)

(assert (=> d!123943 e!584458))

(declare-fun res!690750 () Bool)

(assert (=> d!123943 (=> (not res!690750) (not e!584458))))

(assert (=> d!123943 (= res!690750 (contains!6012 lt!456207 lt!456220))))

(assert (=> d!123943 (= (addApplyDifferent!485 lt!456207 lt!456225 (zeroValue!6063 thiss!1427) lt!456220) lt!456405)))

(declare-fun b!1033948 () Bool)

(assert (=> b!1033948 (= e!584458 (not (= lt!456220 lt!456225)))))

(assert (= (and d!123943 res!690750) b!1033948))

(declare-fun m!953913 () Bool)

(assert (=> d!123943 m!953913))

(assert (=> d!123943 m!953435))

(assert (=> d!123943 m!953437))

(declare-fun m!953915 () Bool)

(assert (=> d!123943 m!953915))

(assert (=> d!123943 m!953435))

(assert (=> d!123943 m!953451))

(assert (=> b!1033703 d!123943))

(declare-fun d!123945 () Bool)

(assert (=> d!123945 (= (apply!906 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456212) (apply!906 lt!456218 lt!456212))))

(declare-fun lt!456406 () Unit!33831)

(assert (=> d!123945 (= lt!456406 (choose!1697 lt!456218 lt!456227 (minValue!6063 thiss!1427) lt!456212))))

(declare-fun e!584459 () Bool)

(assert (=> d!123945 e!584459))

(declare-fun res!690751 () Bool)

(assert (=> d!123945 (=> (not res!690751) (not e!584459))))

(assert (=> d!123945 (= res!690751 (contains!6012 lt!456218 lt!456212))))

(assert (=> d!123945 (= (addApplyDifferent!485 lt!456218 lt!456227 (minValue!6063 thiss!1427) lt!456212) lt!456406)))

(declare-fun b!1033949 () Bool)

(assert (=> b!1033949 (= e!584459 (not (= lt!456212 lt!456227)))))

(assert (= (and d!123945 res!690751) b!1033949))

(declare-fun m!953917 () Bool)

(assert (=> d!123945 m!953917))

(assert (=> d!123945 m!953441))

(assert (=> d!123945 m!953443))

(declare-fun m!953919 () Bool)

(assert (=> d!123945 m!953919))

(assert (=> d!123945 m!953441))

(assert (=> d!123945 m!953453))

(assert (=> b!1033703 d!123945))

(assert (=> d!123819 d!123903))

(declare-fun d!123947 () Bool)

(assert (=> d!123947 (= (apply!906 lt!456221 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30236 () Bool)

(assert (= bs!30236 d!123947))

(declare-fun m!953921 () Bool)

(assert (=> bs!30236 m!953921))

(assert (=> bs!30236 m!953921))

(declare-fun m!953923 () Bool)

(assert (=> bs!30236 m!953923))

(assert (=> b!1033719 d!123947))

(declare-fun d!123949 () Bool)

(declare-fun e!584460 () Bool)

(assert (=> d!123949 e!584460))

(declare-fun res!690752 () Bool)

(assert (=> d!123949 (=> res!690752 e!584460)))

(declare-fun lt!456410 () Bool)

(assert (=> d!123949 (= res!690752 (not lt!456410))))

(declare-fun lt!456408 () Bool)

(assert (=> d!123949 (= lt!456410 lt!456408)))

(declare-fun lt!456407 () Unit!33831)

(declare-fun e!584461 () Unit!33831)

(assert (=> d!123949 (= lt!456407 e!584461)))

(declare-fun c!104451 () Bool)

(assert (=> d!123949 (= c!104451 lt!456408)))

(assert (=> d!123949 (= lt!456408 (containsKey!563 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!123949 (= (contains!6012 lt!456221 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456410)))

(declare-fun b!1033950 () Bool)

(declare-fun lt!456409 () Unit!33831)

(assert (=> b!1033950 (= e!584461 lt!456409)))

(assert (=> b!1033950 (= lt!456409 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033950 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1033951 () Bool)

(declare-fun Unit!33846 () Unit!33831)

(assert (=> b!1033951 (= e!584461 Unit!33846)))

(declare-fun b!1033952 () Bool)

(assert (=> b!1033952 (= e!584460 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!123949 c!104451) b!1033950))

(assert (= (and d!123949 (not c!104451)) b!1033951))

(assert (= (and d!123949 (not res!690752)) b!1033952))

(declare-fun m!953925 () Bool)

(assert (=> d!123949 m!953925))

(declare-fun m!953927 () Bool)

(assert (=> b!1033950 m!953927))

(assert (=> b!1033950 m!953921))

(assert (=> b!1033950 m!953921))

(declare-fun m!953929 () Bool)

(assert (=> b!1033950 m!953929))

(assert (=> b!1033952 m!953921))

(assert (=> b!1033952 m!953921))

(assert (=> b!1033952 m!953929))

(assert (=> bm!43665 d!123949))

(declare-fun b!1033953 () Bool)

(declare-fun e!584464 () Bool)

(declare-fun call!43695 () Bool)

(assert (=> b!1033953 (= e!584464 call!43695)))

(declare-fun bm!43692 () Bool)

(declare-fun c!104452 () Bool)

(assert (=> bm!43692 (= call!43695 (arrayNoDuplicates!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104452 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)))))

(declare-fun b!1033954 () Bool)

(assert (=> b!1033954 (= e!584464 call!43695)))

(declare-fun b!1033955 () Bool)

(declare-fun e!584465 () Bool)

(declare-fun e!584463 () Bool)

(assert (=> b!1033955 (= e!584465 e!584463)))

(declare-fun res!690755 () Bool)

(assert (=> b!1033955 (=> (not res!690755) (not e!584463))))

(declare-fun e!584462 () Bool)

(assert (=> b!1033955 (= res!690755 (not e!584462))))

(declare-fun res!690753 () Bool)

(assert (=> b!1033955 (=> (not res!690753) (not e!584462))))

(assert (=> b!1033955 (= res!690753 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun d!123951 () Bool)

(declare-fun res!690754 () Bool)

(assert (=> d!123951 (=> res!690754 e!584465)))

(assert (=> d!123951 (= res!690754 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!123951 (= (arrayNoDuplicates!0 (_keys!11407 lt!456124) #b00000000000000000000000000000000 Nil!21904) e!584465)))

(declare-fun b!1033956 () Bool)

(assert (=> b!1033956 (= e!584463 e!584464)))

(assert (=> b!1033956 (= c!104452 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1033957 () Bool)

(assert (=> b!1033957 (= e!584462 (contains!6014 Nil!21904 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (= (and d!123951 (not res!690754)) b!1033955))

(assert (= (and b!1033955 res!690753) b!1033957))

(assert (= (and b!1033955 res!690755) b!1033956))

(assert (= (and b!1033956 c!104452) b!1033954))

(assert (= (and b!1033956 (not c!104452)) b!1033953))

(assert (= (or b!1033954 b!1033953) bm!43692))

(assert (=> bm!43692 m!953485))

(declare-fun m!953931 () Bool)

(assert (=> bm!43692 m!953931))

(assert (=> b!1033955 m!953485))

(assert (=> b!1033955 m!953485))

(assert (=> b!1033955 m!953493))

(assert (=> b!1033956 m!953485))

(assert (=> b!1033956 m!953485))

(assert (=> b!1033956 m!953493))

(assert (=> b!1033957 m!953485))

(assert (=> b!1033957 m!953485))

(declare-fun m!953933 () Bool)

(assert (=> b!1033957 m!953933))

(assert (=> b!1033699 d!123951))

(declare-fun d!123953 () Bool)

(declare-fun e!584466 () Bool)

(assert (=> d!123953 e!584466))

(declare-fun res!690756 () Bool)

(assert (=> d!123953 (=> res!690756 e!584466)))

(declare-fun lt!456414 () Bool)

(assert (=> d!123953 (= res!690756 (not lt!456414))))

(declare-fun lt!456412 () Bool)

(assert (=> d!123953 (= lt!456414 lt!456412)))

(declare-fun lt!456411 () Unit!33831)

(declare-fun e!584467 () Unit!33831)

(assert (=> d!123953 (= lt!456411 e!584467)))

(declare-fun c!104453 () Bool)

(assert (=> d!123953 (= c!104453 lt!456412)))

(assert (=> d!123953 (= lt!456412 (containsKey!563 (toList!6893 lt!456229) key!909))))

(assert (=> d!123953 (= (contains!6012 lt!456229 key!909) lt!456414)))

(declare-fun b!1033958 () Bool)

(declare-fun lt!456413 () Unit!33831)

(assert (=> b!1033958 (= e!584467 lt!456413)))

(assert (=> b!1033958 (= lt!456413 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456229) key!909))))

(assert (=> b!1033958 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456229) key!909))))

(declare-fun b!1033959 () Bool)

(declare-fun Unit!33847 () Unit!33831)

(assert (=> b!1033959 (= e!584467 Unit!33847)))

(declare-fun b!1033960 () Bool)

(assert (=> b!1033960 (= e!584466 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456229) key!909)))))

(assert (= (and d!123953 c!104453) b!1033958))

(assert (= (and d!123953 (not c!104453)) b!1033959))

(assert (= (and d!123953 (not res!690756)) b!1033960))

(declare-fun m!953935 () Bool)

(assert (=> d!123953 m!953935))

(declare-fun m!953937 () Bool)

(assert (=> b!1033958 m!953937))

(declare-fun m!953939 () Bool)

(assert (=> b!1033958 m!953939))

(assert (=> b!1033958 m!953939))

(declare-fun m!953941 () Bool)

(assert (=> b!1033958 m!953941))

(assert (=> b!1033960 m!953939))

(assert (=> b!1033960 m!953939))

(assert (=> b!1033960 m!953941))

(assert (=> d!123823 d!123953))

(declare-fun d!123955 () Bool)

(declare-fun e!584468 () Bool)

(assert (=> d!123955 e!584468))

(declare-fun res!690757 () Bool)

(assert (=> d!123955 (=> (not res!690757) (not e!584468))))

(declare-fun lt!456415 () List!21905)

(assert (=> d!123955 (= res!690757 (isStrictlySorted!718 lt!456415))))

(declare-fun e!584469 () List!21905)

(assert (=> d!123955 (= lt!456415 e!584469)))

(declare-fun c!104454 () Bool)

(assert (=> d!123955 (= c!104454 (and ((_ is Cons!21901) (toList!6893 (map!14701 thiss!1427))) (= (_1!7874 (h!23103 (toList!6893 (map!14701 thiss!1427)))) key!909)))))

(assert (=> d!123955 (isStrictlySorted!718 (toList!6893 (map!14701 thiss!1427)))))

(assert (=> d!123955 (= (removeStrictlySorted!56 (toList!6893 (map!14701 thiss!1427)) key!909) lt!456415)))

(declare-fun b!1033961 () Bool)

(assert (=> b!1033961 (= e!584469 (t!31103 (toList!6893 (map!14701 thiss!1427))))))

(declare-fun b!1033962 () Bool)

(declare-fun e!584470 () List!21905)

(assert (=> b!1033962 (= e!584470 Nil!21902)))

(declare-fun b!1033963 () Bool)

(assert (=> b!1033963 (= e!584470 ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (toList!6893 (map!14701 thiss!1427))) key!909) (h!23103 (toList!6893 (map!14701 thiss!1427)))))))

(declare-fun b!1033964 () Bool)

(assert (=> b!1033964 (= e!584469 e!584470)))

(declare-fun c!104455 () Bool)

(assert (=> b!1033964 (= c!104455 (and ((_ is Cons!21901) (toList!6893 (map!14701 thiss!1427))) (not (= (_1!7874 (h!23103 (toList!6893 (map!14701 thiss!1427)))) key!909))))))

(declare-fun b!1033965 () Bool)

(assert (=> b!1033965 (= e!584468 (not (containsKey!563 lt!456415 key!909)))))

(assert (= (and d!123955 c!104454) b!1033961))

(assert (= (and d!123955 (not c!104454)) b!1033964))

(assert (= (and b!1033964 c!104455) b!1033963))

(assert (= (and b!1033964 (not c!104455)) b!1033962))

(assert (= (and d!123955 res!690757) b!1033965))

(declare-fun m!953943 () Bool)

(assert (=> d!123955 m!953943))

(declare-fun m!953945 () Bool)

(assert (=> d!123955 m!953945))

(declare-fun m!953947 () Bool)

(assert (=> b!1033963 m!953947))

(assert (=> b!1033963 m!953947))

(declare-fun m!953949 () Bool)

(assert (=> b!1033963 m!953949))

(declare-fun m!953951 () Bool)

(assert (=> b!1033965 m!953951))

(assert (=> d!123823 d!123955))

(declare-fun condMapEmpty!38268 () Bool)

(declare-fun mapDefault!38268 () ValueCell!11556)

(assert (=> mapNonEmpty!38267 (= condMapEmpty!38268 (= mapRest!38267 ((as const (Array (_ BitVec 32) ValueCell!11556)) mapDefault!38268)))))

(declare-fun e!584472 () Bool)

(declare-fun mapRes!38268 () Bool)

(assert (=> mapNonEmpty!38267 (= tp!73506 (and e!584472 mapRes!38268))))

(declare-fun mapNonEmpty!38268 () Bool)

(declare-fun tp!73507 () Bool)

(declare-fun e!584471 () Bool)

(assert (=> mapNonEmpty!38268 (= mapRes!38268 (and tp!73507 e!584471))))

(declare-fun mapKey!38268 () (_ BitVec 32))

(declare-fun mapRest!38268 () (Array (_ BitVec 32) ValueCell!11556))

(declare-fun mapValue!38268 () ValueCell!11556)

(assert (=> mapNonEmpty!38268 (= mapRest!38267 (store mapRest!38268 mapKey!38268 mapValue!38268))))

(declare-fun b!1033966 () Bool)

(assert (=> b!1033966 (= e!584471 tp_is_empty!24519)))

(declare-fun b!1033967 () Bool)

(assert (=> b!1033967 (= e!584472 tp_is_empty!24519)))

(declare-fun mapIsEmpty!38268 () Bool)

(assert (=> mapIsEmpty!38268 mapRes!38268))

(assert (= (and mapNonEmpty!38267 condMapEmpty!38268) mapIsEmpty!38268))

(assert (= (and mapNonEmpty!38267 (not condMapEmpty!38268)) mapNonEmpty!38268))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11556) mapValue!38268)) b!1033966))

(assert (= (and mapNonEmpty!38267 ((_ is ValueCellFull!11556) mapDefault!38268)) b!1033967))

(declare-fun m!953953 () Bool)

(assert (=> mapNonEmpty!38268 m!953953))

(declare-fun b_lambda!16071 () Bool)

(assert (= b_lambda!16065 (or (and b!1033597 b_free!20799) b_lambda!16071)))

(declare-fun b_lambda!16073 () Bool)

(assert (= b_lambda!16063 (or (and b!1033597 b_free!20799) b_lambda!16073)))

(declare-fun b_lambda!16075 () Bool)

(assert (= b_lambda!16067 (or (and b!1033597 b_free!20799) b_lambda!16075)))

(declare-fun b_lambda!16077 () Bool)

(assert (= b_lambda!16061 (or (and b!1033597 b_free!20799) b_lambda!16077)))

(check-sat (not b!1033770) (not b!1033933) (not mapNonEmpty!38268) (not bm!43679) (not b!1033883) (not b!1033927) (not b!1033821) (not d!123949) (not b!1033807) (not b!1033765) (not b!1033771) (not b!1033882) (not bm!43692) (not d!123827) (not bm!43680) (not b!1033737) (not d!123891) (not b!1033937) (not d!123933) (not b!1033819) (not b_lambda!16057) (not b!1033811) (not b!1033775) (not b!1033858) (not d!123879) (not d!123875) (not b!1033899) (not d!123913) (not d!123837) (not b!1033940) (not b!1033845) (not d!123907) (not d!123919) (not d!123859) (not d!123871) (not b!1033938) (not b!1033847) (not d!123929) (not d!123935) (not d!123845) (not bm!43678) (not d!123937) (not d!123909) (not d!123853) (not d!123885) (not b!1033813) (not d!123917) (not b!1033857) (not d!123843) (not bm!43682) (not bm!43689) (not d!123921) (not d!123945) (not d!123955) (not b!1033918) (not b!1033843) tp_is_empty!24519 (not b!1033958) (not b!1033903) (not b!1033923) (not b!1033960) (not b!1033822) (not b!1033939) (not b!1033745) (not b!1033885) (not b!1033861) (not b!1033942) (not b_lambda!16073) (not b!1033901) (not b!1033946) (not d!123931) (not d!123953) (not b!1033919) (not d!123915) (not b!1033772) (not bm!43690) (not b!1033952) (not d!123865) (not bm!43684) (not d!123873) (not b_lambda!16077) (not b!1033956) (not b!1033846) (not b!1033780) (not b!1033950) (not d!123899) (not d!123869) (not b!1033820) (not b!1033863) (not b!1033864) (not b!1033839) (not d!123927) (not b!1033963) (not b!1033881) (not b!1033877) b_and!33289 (not b_lambda!16069) (not d!123863) (not d!123849) (not b!1033756) (not b!1033926) (not b!1033829) (not d!123855) (not b!1033935) (not b!1033879) (not b!1033831) (not bm!43691) (not b_next!20799) (not b!1033823) (not d!123851) (not b!1033809) (not b!1033924) (not b!1033898) (not b!1033873) (not b!1033768) (not d!123833) (not d!123889) (not b!1033900) (not b!1033916) (not b!1033965) (not bm!43672) (not d!123897) (not d!123943) (not b!1033836) (not b!1033781) (not b!1033806) (not b!1033955) (not b!1033828) (not d!123839) (not b!1033957) (not d!123857) (not b!1033739) (not d!123867) (not b!1033930) (not b!1033838) (not b_lambda!16051) (not d!123861) (not b!1033936) (not b!1033746) (not b!1033921) (not b!1033767) (not d!123877) (not b_lambda!16071) (not d!123881) (not b!1033945) (not b!1033835) (not b_lambda!16075) (not d!123925) (not d!123883) (not d!123887) (not b!1033860) (not b!1033943) (not d!123947) (not d!123901) (not b!1033818) (not b!1033816) (not d!123893) (not d!123841) (not bm!43685) (not b_lambda!16059) (not b!1033817) (not d!123923) (not b!1033944) (not b!1033814) (not d!123941) (not b!1033833) (not b!1033880) (not d!123939) (not b!1033773) (not bm!43675))
(check-sat b_and!33289 (not b_next!20799))
(get-model)

(declare-fun d!123957 () Bool)

(assert (=> d!123957 (= (apply!906 lt!456320 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16434 (getValueByKey!588 (toList!6893 lt!456320) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30237 () Bool)

(assert (= bs!30237 d!123957))

(assert (=> bs!30237 m!953361))

(declare-fun m!953955 () Bool)

(assert (=> bs!30237 m!953955))

(assert (=> bs!30237 m!953955))

(declare-fun m!953957 () Bool)

(assert (=> bs!30237 m!953957))

(assert (=> b!1033838 d!123957))

(assert (=> b!1033838 d!123847))

(declare-fun d!123959 () Bool)

(assert (=> d!123959 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456220)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456220)))))

(assert (=> d!123919 d!123959))

(declare-fun b!1033979 () Bool)

(declare-fun e!584478 () Option!639)

(assert (=> b!1033979 (= e!584478 None!637)))

(declare-fun e!584477 () Option!639)

(declare-fun b!1033976 () Bool)

(assert (=> b!1033976 (= e!584477 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))))

(declare-fun b!1033978 () Bool)

(assert (=> b!1033978 (= e!584478 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))) lt!456220))))

(declare-fun d!123961 () Bool)

(declare-fun c!104460 () Bool)

(assert (=> d!123961 (= c!104460 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))) lt!456220)))))

(assert (=> d!123961 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456220) e!584477)))

(declare-fun b!1033977 () Bool)

(assert (=> b!1033977 (= e!584477 e!584478)))

(declare-fun c!104461 () Bool)

(assert (=> b!1033977 (= c!104461 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))) lt!456220))))))

(assert (= (and d!123961 c!104460) b!1033976))

(assert (= (and d!123961 (not c!104460)) b!1033977))

(assert (= (and b!1033977 c!104461) b!1033978))

(assert (= (and b!1033977 (not c!104461)) b!1033979))

(declare-fun m!953959 () Bool)

(assert (=> b!1033978 m!953959))

(assert (=> d!123919 d!123961))

(declare-fun d!123963 () Bool)

(declare-fun isEmpty!927 (Option!639) Bool)

(assert (=> d!123963 (= (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))))

(declare-fun bs!30238 () Bool)

(assert (= bs!30238 d!123963))

(assert (=> bs!30238 m!953869))

(declare-fun m!953961 () Bool)

(assert (=> bs!30238 m!953961))

(assert (=> b!1033942 d!123963))

(declare-fun b!1033983 () Bool)

(declare-fun e!584480 () Option!639)

(assert (=> b!1033983 (= e!584480 None!637)))

(declare-fun e!584479 () Option!639)

(declare-fun b!1033980 () Bool)

(assert (=> b!1033980 (= e!584479 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))))

(declare-fun b!1033982 () Bool)

(assert (=> b!1033982 (= e!584480 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) lt!456213))))

(declare-fun d!123965 () Bool)

(declare-fun c!104462 () Bool)

(assert (=> d!123965 (= c!104462 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) lt!456213)))))

(assert (=> d!123965 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213) e!584479)))

(declare-fun b!1033981 () Bool)

(assert (=> b!1033981 (= e!584479 e!584480)))

(declare-fun c!104463 () Bool)

(assert (=> b!1033981 (= c!104463 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) lt!456213))))))

(assert (= (and d!123965 c!104462) b!1033980))

(assert (= (and d!123965 (not c!104462)) b!1033981))

(assert (= (and b!1033981 c!104463) b!1033982))

(assert (= (and b!1033981 (not c!104463)) b!1033983))

(declare-fun m!953963 () Bool)

(assert (=> b!1033982 m!953963))

(assert (=> b!1033942 d!123965))

(declare-fun d!123967 () Bool)

(assert (=> d!123967 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456187)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456187)))))

(assert (=> d!123859 d!123967))

(declare-fun b!1033987 () Bool)

(declare-fun e!584482 () Option!639)

(assert (=> b!1033987 (= e!584482 None!637)))

(declare-fun e!584481 () Option!639)

(declare-fun b!1033984 () Bool)

(assert (=> b!1033984 (= e!584481 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))))

(declare-fun b!1033986 () Bool)

(assert (=> b!1033986 (= e!584482 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))) lt!456187))))

(declare-fun c!104464 () Bool)

(declare-fun d!123969 () Bool)

(assert (=> d!123969 (= c!104464 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))) lt!456187)))))

(assert (=> d!123969 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456187) e!584481)))

(declare-fun b!1033985 () Bool)

(assert (=> b!1033985 (= e!584481 e!584482)))

(declare-fun c!104465 () Bool)

(assert (=> b!1033985 (= c!104465 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))) lt!456187))))))

(assert (= (and d!123969 c!104464) b!1033984))

(assert (= (and d!123969 (not c!104464)) b!1033985))

(assert (= (and b!1033985 c!104465) b!1033986))

(assert (= (and b!1033985 (not c!104465)) b!1033987))

(declare-fun m!953965 () Bool)

(assert (=> b!1033986 m!953965))

(assert (=> d!123859 d!123969))

(declare-fun d!123971 () Bool)

(assert (=> d!123971 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456418 () Unit!33831)

(declare-fun choose!1699 (List!21905 (_ BitVec 64)) Unit!33831)

(assert (=> d!123971 (= lt!456418 (choose!1699 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584485 () Bool)

(assert (=> d!123971 e!584485))

(declare-fun res!690760 () Bool)

(assert (=> d!123971 (=> (not res!690760) (not e!584485))))

(assert (=> d!123971 (= res!690760 (isStrictlySorted!718 (toList!6893 lt!456196)))))

(assert (=> d!123971 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456418)))

(declare-fun b!1033990 () Bool)

(assert (=> b!1033990 (= e!584485 (containsKey!563 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!123971 res!690760) b!1033990))

(assert (=> d!123971 m!953361))

(assert (=> d!123971 m!953515))

(assert (=> d!123971 m!953515))

(assert (=> d!123971 m!953517))

(assert (=> d!123971 m!953361))

(declare-fun m!953967 () Bool)

(assert (=> d!123971 m!953967))

(declare-fun m!953969 () Bool)

(assert (=> d!123971 m!953969))

(assert (=> b!1033990 m!953361))

(assert (=> b!1033990 m!953511))

(assert (=> b!1033765 d!123971))

(declare-fun d!123973 () Bool)

(assert (=> d!123973 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30239 () Bool)

(assert (= bs!30239 d!123973))

(assert (=> bs!30239 m!953515))

(declare-fun m!953971 () Bool)

(assert (=> bs!30239 m!953971))

(assert (=> b!1033765 d!123973))

(declare-fun b!1033994 () Bool)

(declare-fun e!584487 () Option!639)

(assert (=> b!1033994 (= e!584487 None!637)))

(declare-fun b!1033991 () Bool)

(declare-fun e!584486 () Option!639)

(assert (=> b!1033991 (= e!584486 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456196)))))))

(declare-fun b!1033993 () Bool)

(assert (=> b!1033993 (= e!584487 (getValueByKey!588 (t!31103 (toList!6893 lt!456196)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!123975 () Bool)

(declare-fun c!104466 () Bool)

(assert (=> d!123975 (= c!104466 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123975 (= (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) e!584486)))

(declare-fun b!1033992 () Bool)

(assert (=> b!1033992 (= e!584486 e!584487)))

(declare-fun c!104467 () Bool)

(assert (=> b!1033992 (= c!104467 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456196))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))))

(assert (= (and d!123975 c!104466) b!1033991))

(assert (= (and d!123975 (not c!104466)) b!1033992))

(assert (= (and b!1033992 c!104467) b!1033993))

(assert (= (and b!1033992 (not c!104467)) b!1033994))

(assert (=> b!1033993 m!953361))

(declare-fun m!953973 () Bool)

(assert (=> b!1033993 m!953973))

(assert (=> b!1033765 d!123975))

(declare-fun d!123977 () Bool)

(assert (=> d!123977 (= (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) (and (not (= (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1033756 d!123977))

(declare-fun d!123979 () Bool)

(assert (=> d!123979 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456419 () Unit!33831)

(assert (=> d!123979 (= lt!456419 (choose!1699 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584488 () Bool)

(assert (=> d!123979 e!584488))

(declare-fun res!690761 () Bool)

(assert (=> d!123979 (=> (not res!690761) (not e!584488))))

(assert (=> d!123979 (= res!690761 (isStrictlySorted!718 (toList!6893 lt!456196)))))

(assert (=> d!123979 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456419)))

(declare-fun b!1033995 () Bool)

(assert (=> b!1033995 (= e!584488 (containsKey!563 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123979 res!690761) b!1033995))

(assert (=> d!123979 m!953541))

(assert (=> d!123979 m!953541))

(assert (=> d!123979 m!953543))

(declare-fun m!953975 () Bool)

(assert (=> d!123979 m!953975))

(assert (=> d!123979 m!953969))

(assert (=> b!1033995 m!953537))

(assert (=> b!1033773 d!123979))

(declare-fun d!123981 () Bool)

(assert (=> d!123981 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30240 () Bool)

(assert (= bs!30240 d!123981))

(assert (=> bs!30240 m!953541))

(declare-fun m!953977 () Bool)

(assert (=> bs!30240 m!953977))

(assert (=> b!1033773 d!123981))

(declare-fun b!1033999 () Bool)

(declare-fun e!584490 () Option!639)

(assert (=> b!1033999 (= e!584490 None!637)))

(declare-fun b!1033996 () Bool)

(declare-fun e!584489 () Option!639)

(assert (=> b!1033996 (= e!584489 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456196)))))))

(declare-fun b!1033998 () Bool)

(assert (=> b!1033998 (= e!584490 (getValueByKey!588 (t!31103 (toList!6893 lt!456196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123983 () Bool)

(declare-fun c!104468 () Bool)

(assert (=> d!123983 (= c!104468 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123983 (= (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000) e!584489)))

(declare-fun b!1033997 () Bool)

(assert (=> b!1033997 (= e!584489 e!584490)))

(declare-fun c!104469 () Bool)

(assert (=> b!1033997 (= c!104469 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123983 c!104468) b!1033996))

(assert (= (and d!123983 (not c!104468)) b!1033997))

(assert (= (and b!1033997 c!104469) b!1033998))

(assert (= (and b!1033997 (not c!104469)) b!1033999))

(declare-fun m!953979 () Bool)

(assert (=> b!1033998 m!953979))

(assert (=> b!1033773 d!123983))

(declare-fun d!123985 () Bool)

(assert (=> d!123985 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14889 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123891 d!123985))

(declare-fun b!1034003 () Bool)

(declare-fun e!584492 () Option!639)

(assert (=> b!1034003 (= e!584492 None!637)))

(declare-fun b!1034000 () Bool)

(declare-fun e!584491 () Option!639)

(assert (=> b!1034000 (= e!584491 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456196)))))))

(declare-fun b!1034002 () Bool)

(assert (=> b!1034002 (= e!584492 (getValueByKey!588 (t!31103 (toList!6893 lt!456196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123987 () Bool)

(declare-fun c!104470 () Bool)

(assert (=> d!123987 (= c!104470 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123987 (= (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000) e!584491)))

(declare-fun b!1034001 () Bool)

(assert (=> b!1034001 (= e!584491 e!584492)))

(declare-fun c!104471 () Bool)

(assert (=> b!1034001 (= c!104471 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123987 c!104470) b!1034000))

(assert (= (and d!123987 (not c!104470)) b!1034001))

(assert (= (and b!1034001 c!104471) b!1034002))

(assert (= (and b!1034001 (not c!104471)) b!1034003))

(declare-fun m!953981 () Bool)

(assert (=> b!1034002 m!953981))

(assert (=> d!123891 d!123987))

(declare-fun d!123989 () Bool)

(assert (=> d!123989 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456420 () Unit!33831)

(assert (=> d!123989 (= lt!456420 (choose!1699 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584493 () Bool)

(assert (=> d!123989 e!584493))

(declare-fun res!690762 () Bool)

(assert (=> d!123989 (=> (not res!690762) (not e!584493))))

(assert (=> d!123989 (= res!690762 (isStrictlySorted!718 (toList!6893 lt!456221)))))

(assert (=> d!123989 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456420)))

(declare-fun b!1034004 () Bool)

(assert (=> b!1034004 (= e!584493 (containsKey!563 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!123989 res!690762) b!1034004))

(assert (=> d!123989 m!953481))

(assert (=> d!123989 m!953481))

(assert (=> d!123989 m!953523))

(declare-fun m!953983 () Bool)

(assert (=> d!123989 m!953983))

(declare-fun m!953985 () Bool)

(assert (=> d!123989 m!953985))

(assert (=> b!1034004 m!953519))

(assert (=> b!1033768 d!123989))

(declare-fun d!123991 () Bool)

(assert (=> d!123991 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30241 () Bool)

(assert (= bs!30241 d!123991))

(assert (=> bs!30241 m!953481))

(declare-fun m!953987 () Bool)

(assert (=> bs!30241 m!953987))

(assert (=> b!1033768 d!123991))

(declare-fun b!1034008 () Bool)

(declare-fun e!584495 () Option!639)

(assert (=> b!1034008 (= e!584495 None!637)))

(declare-fun b!1034005 () Bool)

(declare-fun e!584494 () Option!639)

(assert (=> b!1034005 (= e!584494 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456221)))))))

(declare-fun b!1034007 () Bool)

(assert (=> b!1034007 (= e!584495 (getValueByKey!588 (t!31103 (toList!6893 lt!456221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!123993 () Bool)

(declare-fun c!104472 () Bool)

(assert (=> d!123993 (= c!104472 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123993 (= (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000) e!584494)))

(declare-fun b!1034006 () Bool)

(assert (=> b!1034006 (= e!584494 e!584495)))

(declare-fun c!104473 () Bool)

(assert (=> b!1034006 (= c!104473 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!123993 c!104472) b!1034005))

(assert (= (and d!123993 (not c!104472)) b!1034006))

(assert (= (and b!1034006 c!104473) b!1034007))

(assert (= (and b!1034006 (not c!104473)) b!1034008))

(declare-fun m!953989 () Bool)

(assert (=> b!1034007 m!953989))

(assert (=> b!1033768 d!123993))

(assert (=> b!1033956 d!123977))

(declare-fun b!1034012 () Bool)

(declare-fun e!584497 () Option!639)

(assert (=> b!1034012 (= e!584497 None!637)))

(declare-fun b!1034009 () Bool)

(declare-fun e!584496 () Option!639)

(assert (=> b!1034009 (= e!584496 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456374)))))))

(declare-fun b!1034011 () Bool)

(assert (=> b!1034011 (= e!584497 (getValueByKey!588 (t!31103 (toList!6893 lt!456374)) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun c!104474 () Bool)

(declare-fun d!123995 () Bool)

(assert (=> d!123995 (= c!104474 (and ((_ is Cons!21901) (toList!6893 lt!456374)) (= (_1!7874 (h!23103 (toList!6893 lt!456374))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!123995 (= (getValueByKey!588 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) e!584496)))

(declare-fun b!1034010 () Bool)

(assert (=> b!1034010 (= e!584496 e!584497)))

(declare-fun c!104475 () Bool)

(assert (=> b!1034010 (= c!104475 (and ((_ is Cons!21901) (toList!6893 lt!456374)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456374))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(assert (= (and d!123995 c!104474) b!1034009))

(assert (= (and d!123995 (not c!104474)) b!1034010))

(assert (= (and b!1034010 c!104475) b!1034011))

(assert (= (and b!1034010 (not c!104475)) b!1034012))

(declare-fun m!953991 () Bool)

(assert (=> b!1034011 m!953991))

(assert (=> b!1033923 d!123995))

(declare-fun b!1034013 () Bool)

(declare-fun e!584500 () Bool)

(assert (=> b!1034013 (= e!584500 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034013 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!123997 () Bool)

(declare-fun e!584499 () Bool)

(assert (=> d!123997 e!584499))

(declare-fun res!690766 () Bool)

(assert (=> d!123997 (=> (not res!690766) (not e!584499))))

(declare-fun lt!456427 () ListLongMap!13755)

(assert (=> d!123997 (= res!690766 (not (contains!6012 lt!456427 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584501 () ListLongMap!13755)

(assert (=> d!123997 (= lt!456427 e!584501)))

(declare-fun c!104476 () Bool)

(assert (=> d!123997 (= c!104476 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!123997 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!123997 (= (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)) lt!456427)))

(declare-fun bm!43693 () Bool)

(declare-fun call!43696 () ListLongMap!13755)

(assert (=> bm!43693 (= call!43696 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1034014 () Bool)

(declare-fun e!584502 () ListLongMap!13755)

(assert (=> b!1034014 (= e!584501 e!584502)))

(declare-fun c!104479 () Bool)

(assert (=> b!1034014 (= c!104479 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034015 () Bool)

(declare-fun e!584504 () Bool)

(declare-fun e!584498 () Bool)

(assert (=> b!1034015 (= e!584504 e!584498)))

(declare-fun c!104478 () Bool)

(assert (=> b!1034015 (= c!104478 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034016 () Bool)

(assert (=> b!1034016 (= e!584498 (= lt!456427 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427))))))

(declare-fun b!1034017 () Bool)

(assert (=> b!1034017 (= e!584502 call!43696)))

(declare-fun b!1034018 () Bool)

(declare-fun lt!456423 () Unit!33831)

(declare-fun lt!456421 () Unit!33831)

(assert (=> b!1034018 (= lt!456423 lt!456421)))

(declare-fun lt!456422 () (_ BitVec 64))

(declare-fun lt!456425 () V!37565)

(declare-fun lt!456426 () (_ BitVec 64))

(declare-fun lt!456424 () ListLongMap!13755)

(assert (=> b!1034018 (not (contains!6012 (+!3104 lt!456424 (tuple2!15727 lt!456422 lt!456425)) lt!456426))))

(assert (=> b!1034018 (= lt!456421 (addStillNotContains!242 lt!456424 lt!456422 lt!456425 lt!456426))))

(assert (=> b!1034018 (= lt!456426 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034018 (= lt!456425 (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034018 (= lt!456422 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034018 (= lt!456424 call!43696)))

(assert (=> b!1034018 (= e!584502 (+!3104 call!43696 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034019 () Bool)

(assert (=> b!1034019 (= e!584499 e!584504)))

(declare-fun c!104477 () Bool)

(assert (=> b!1034019 (= c!104477 e!584500)))

(declare-fun res!690763 () Bool)

(assert (=> b!1034019 (=> (not res!690763) (not e!584500))))

(assert (=> b!1034019 (= res!690763 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034020 () Bool)

(declare-fun res!690764 () Bool)

(assert (=> b!1034020 (=> (not res!690764) (not e!584499))))

(assert (=> b!1034020 (= res!690764 (not (contains!6012 lt!456427 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034021 () Bool)

(declare-fun e!584503 () Bool)

(assert (=> b!1034021 (= e!584504 e!584503)))

(assert (=> b!1034021 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun res!690765 () Bool)

(assert (=> b!1034021 (= res!690765 (contains!6012 lt!456427 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034021 (=> (not res!690765) (not e!584503))))

(declare-fun b!1034022 () Bool)

(assert (=> b!1034022 (= e!584501 (ListLongMap!13756 Nil!21902))))

(declare-fun b!1034023 () Bool)

(assert (=> b!1034023 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> b!1034023 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1034023 (= e!584503 (= (apply!906 lt!456427 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034024 () Bool)

(assert (=> b!1034024 (= e!584498 (isEmpty!926 lt!456427))))

(assert (= (and d!123997 c!104476) b!1034022))

(assert (= (and d!123997 (not c!104476)) b!1034014))

(assert (= (and b!1034014 c!104479) b!1034018))

(assert (= (and b!1034014 (not c!104479)) b!1034017))

(assert (= (or b!1034018 b!1034017) bm!43693))

(assert (= (and d!123997 res!690766) b!1034020))

(assert (= (and b!1034020 res!690764) b!1034019))

(assert (= (and b!1034019 res!690763) b!1034013))

(assert (= (and b!1034019 c!104477) b!1034021))

(assert (= (and b!1034019 (not c!104477)) b!1034015))

(assert (= (and b!1034021 res!690765) b!1034023))

(assert (= (and b!1034015 c!104478) b!1034016))

(assert (= (and b!1034015 (not c!104478)) b!1034024))

(declare-fun b_lambda!16079 () Bool)

(assert (=> (not b_lambda!16079) (not b!1034018)))

(assert (=> b!1034018 t!31102))

(declare-fun b_and!33291 () Bool)

(assert (= b_and!33289 (and (=> t!31102 result!14387) b_and!33291)))

(declare-fun b_lambda!16081 () Bool)

(assert (=> (not b_lambda!16081) (not b!1034023)))

(assert (=> b!1034023 t!31102))

(declare-fun b_and!33293 () Bool)

(assert (= b_and!33291 (and (=> t!31102 result!14387) b_and!33293)))

(declare-fun m!953993 () Bool)

(assert (=> b!1034018 m!953993))

(declare-fun m!953995 () Bool)

(assert (=> b!1034018 m!953995))

(assert (=> b!1034018 m!953995))

(assert (=> b!1034018 m!953309))

(declare-fun m!953997 () Bool)

(assert (=> b!1034018 m!953997))

(declare-fun m!953999 () Bool)

(assert (=> b!1034018 m!953999))

(declare-fun m!954001 () Bool)

(assert (=> b!1034018 m!954001))

(declare-fun m!954003 () Bool)

(assert (=> b!1034018 m!954003))

(assert (=> b!1034018 m!954003))

(declare-fun m!954005 () Bool)

(assert (=> b!1034018 m!954005))

(assert (=> b!1034018 m!953309))

(declare-fun m!954007 () Bool)

(assert (=> b!1034020 m!954007))

(declare-fun m!954009 () Bool)

(assert (=> b!1034024 m!954009))

(declare-fun m!954011 () Bool)

(assert (=> d!123997 m!954011))

(assert (=> d!123997 m!953355))

(assert (=> b!1034014 m!953999))

(assert (=> b!1034014 m!953999))

(declare-fun m!954013 () Bool)

(assert (=> b!1034014 m!954013))

(assert (=> b!1034021 m!953999))

(assert (=> b!1034021 m!953999))

(declare-fun m!954015 () Bool)

(assert (=> b!1034021 m!954015))

(declare-fun m!954017 () Bool)

(assert (=> b!1034016 m!954017))

(assert (=> bm!43693 m!954017))

(assert (=> b!1034013 m!953999))

(assert (=> b!1034013 m!953999))

(assert (=> b!1034013 m!954013))

(assert (=> b!1034023 m!953999))

(declare-fun m!954019 () Bool)

(assert (=> b!1034023 m!954019))

(assert (=> b!1034023 m!953995))

(assert (=> b!1034023 m!953995))

(assert (=> b!1034023 m!953309))

(assert (=> b!1034023 m!953997))

(assert (=> b!1034023 m!953999))

(assert (=> b!1034023 m!953309))

(assert (=> bm!43678 d!123997))

(declare-fun d!123999 () Bool)

(declare-fun e!584505 () Bool)

(assert (=> d!123999 e!584505))

(declare-fun res!690767 () Bool)

(assert (=> d!123999 (=> res!690767 e!584505)))

(declare-fun lt!456431 () Bool)

(assert (=> d!123999 (= res!690767 (not lt!456431))))

(declare-fun lt!456429 () Bool)

(assert (=> d!123999 (= lt!456431 lt!456429)))

(declare-fun lt!456428 () Unit!33831)

(declare-fun e!584506 () Unit!33831)

(assert (=> d!123999 (= lt!456428 e!584506)))

(declare-fun c!104480 () Bool)

(assert (=> d!123999 (= c!104480 lt!456429)))

(assert (=> d!123999 (= lt!456429 (containsKey!563 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!123999 (= (contains!6012 lt!456396 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456431)))

(declare-fun b!1034025 () Bool)

(declare-fun lt!456430 () Unit!33831)

(assert (=> b!1034025 (= e!584506 lt!456430)))

(assert (=> b!1034025 (= lt!456430 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(assert (=> b!1034025 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034026 () Bool)

(declare-fun Unit!33848 () Unit!33831)

(assert (=> b!1034026 (= e!584506 Unit!33848)))

(declare-fun b!1034027 () Bool)

(assert (=> b!1034027 (= e!584505 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(assert (= (and d!123999 c!104480) b!1034025))

(assert (= (and d!123999 (not c!104480)) b!1034026))

(assert (= (and d!123999 (not res!690767)) b!1034027))

(declare-fun m!954021 () Bool)

(assert (=> d!123999 m!954021))

(declare-fun m!954023 () Bool)

(assert (=> b!1034025 m!954023))

(assert (=> b!1034025 m!953885))

(assert (=> b!1034025 m!953885))

(declare-fun m!954025 () Bool)

(assert (=> b!1034025 m!954025))

(assert (=> b!1034027 m!953885))

(assert (=> b!1034027 m!953885))

(assert (=> b!1034027 m!954025))

(assert (=> d!123933 d!123999))

(declare-fun b!1034031 () Bool)

(declare-fun e!584508 () Option!639)

(assert (=> b!1034031 (= e!584508 None!637)))

(declare-fun b!1034028 () Bool)

(declare-fun e!584507 () Option!639)

(assert (=> b!1034028 (= e!584507 (Some!638 (_2!7874 (h!23103 lt!456399))))))

(declare-fun b!1034030 () Bool)

(assert (=> b!1034030 (= e!584508 (getValueByKey!588 (t!31103 lt!456399) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun d!124001 () Bool)

(declare-fun c!104481 () Bool)

(assert (=> d!124001 (= c!104481 (and ((_ is Cons!21901) lt!456399) (= (_1!7874 (h!23103 lt!456399)) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124001 (= (getValueByKey!588 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) e!584507)))

(declare-fun b!1034029 () Bool)

(assert (=> b!1034029 (= e!584507 e!584508)))

(declare-fun c!104482 () Bool)

(assert (=> b!1034029 (= c!104482 (and ((_ is Cons!21901) lt!456399) (not (= (_1!7874 (h!23103 lt!456399)) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))))

(assert (= (and d!124001 c!104481) b!1034028))

(assert (= (and d!124001 (not c!104481)) b!1034029))

(assert (= (and b!1034029 c!104482) b!1034030))

(assert (= (and b!1034029 (not c!104482)) b!1034031))

(declare-fun m!954027 () Bool)

(assert (=> b!1034030 m!954027))

(assert (=> d!123933 d!124001))

(declare-fun d!124003 () Bool)

(assert (=> d!124003 (= (getValueByKey!588 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun lt!456434 () Unit!33831)

(declare-fun choose!1700 (List!21905 (_ BitVec 64) V!37565) Unit!33831)

(assert (=> d!124003 (= lt!456434 (choose!1700 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun e!584511 () Bool)

(assert (=> d!124003 e!584511))

(declare-fun res!690772 () Bool)

(assert (=> d!124003 (=> (not res!690772) (not e!584511))))

(assert (=> d!124003 (= res!690772 (isStrictlySorted!718 lt!456399))))

(assert (=> d!124003 (= (lemmaContainsTupThenGetReturnValue!279 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456434)))

(declare-fun b!1034036 () Bool)

(declare-fun res!690773 () Bool)

(assert (=> b!1034036 (=> (not res!690773) (not e!584511))))

(assert (=> b!1034036 (= res!690773 (containsKey!563 lt!456399 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034037 () Bool)

(assert (=> b!1034037 (= e!584511 (contains!6013 lt!456399 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(assert (= (and d!124003 res!690772) b!1034036))

(assert (= (and b!1034036 res!690773) b!1034037))

(assert (=> d!124003 m!953879))

(declare-fun m!954029 () Bool)

(assert (=> d!124003 m!954029))

(declare-fun m!954031 () Bool)

(assert (=> d!124003 m!954031))

(declare-fun m!954033 () Bool)

(assert (=> b!1034036 m!954033))

(declare-fun m!954035 () Bool)

(assert (=> b!1034037 m!954035))

(assert (=> d!123933 d!124003))

(declare-fun bm!43700 () Bool)

(declare-fun call!43705 () List!21905)

(declare-fun call!43703 () List!21905)

(assert (=> bm!43700 (= call!43705 call!43703)))

(declare-fun d!124005 () Bool)

(declare-fun e!584522 () Bool)

(assert (=> d!124005 e!584522))

(declare-fun res!690779 () Bool)

(assert (=> d!124005 (=> (not res!690779) (not e!584522))))

(declare-fun lt!456437 () List!21905)

(assert (=> d!124005 (= res!690779 (isStrictlySorted!718 lt!456437))))

(declare-fun e!584523 () List!21905)

(assert (=> d!124005 (= lt!456437 e!584523)))

(declare-fun c!104494 () Bool)

(assert (=> d!124005 (= c!104494 (and ((_ is Cons!21901) (toList!6893 lt!456207)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456207))) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124005 (isStrictlySorted!718 (toList!6893 lt!456207))))

(assert (=> d!124005 (= (insertStrictlySorted!372 (toList!6893 lt!456207) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) lt!456437)))

(declare-fun b!1034058 () Bool)

(declare-fun e!584525 () List!21905)

(declare-fun call!43704 () List!21905)

(assert (=> b!1034058 (= e!584525 call!43704)))

(declare-fun c!104491 () Bool)

(declare-fun b!1034059 () Bool)

(assert (=> b!1034059 (= c!104491 (and ((_ is Cons!21901) (toList!6893 lt!456207)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456207))) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(declare-fun e!584526 () List!21905)

(assert (=> b!1034059 (= e!584526 e!584525)))

(declare-fun b!1034060 () Bool)

(assert (=> b!1034060 (= e!584523 call!43703)))

(declare-fun bm!43701 () Bool)

(assert (=> bm!43701 (= call!43704 call!43705)))

(declare-fun b!1034061 () Bool)

(assert (=> b!1034061 (= e!584523 e!584526)))

(declare-fun c!104492 () Bool)

(assert (=> b!1034061 (= c!104492 (and ((_ is Cons!21901) (toList!6893 lt!456207)) (= (_1!7874 (h!23103 (toList!6893 lt!456207))) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1034062 () Bool)

(declare-fun res!690778 () Bool)

(assert (=> b!1034062 (=> (not res!690778) (not e!584522))))

(assert (=> b!1034062 (= res!690778 (containsKey!563 lt!456437 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034063 () Bool)

(assert (=> b!1034063 (= e!584526 call!43705)))

(declare-fun e!584524 () List!21905)

(declare-fun bm!43702 () Bool)

(assert (=> bm!43702 (= call!43703 ($colon$colon!602 e!584524 (ite c!104494 (h!23103 (toList!6893 lt!456207)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))))

(declare-fun c!104493 () Bool)

(assert (=> bm!43702 (= c!104493 c!104494)))

(declare-fun b!1034064 () Bool)

(assert (=> b!1034064 (= e!584522 (contains!6013 lt!456437 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1034065 () Bool)

(assert (=> b!1034065 (= e!584525 call!43704)))

(declare-fun b!1034066 () Bool)

(assert (=> b!1034066 (= e!584524 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456207)) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034067 () Bool)

(assert (=> b!1034067 (= e!584524 (ite c!104492 (t!31103 (toList!6893 lt!456207)) (ite c!104491 (Cons!21901 (h!23103 (toList!6893 lt!456207)) (t!31103 (toList!6893 lt!456207))) Nil!21902)))))

(assert (= (and d!124005 c!104494) b!1034060))

(assert (= (and d!124005 (not c!104494)) b!1034061))

(assert (= (and b!1034061 c!104492) b!1034063))

(assert (= (and b!1034061 (not c!104492)) b!1034059))

(assert (= (and b!1034059 c!104491) b!1034065))

(assert (= (and b!1034059 (not c!104491)) b!1034058))

(assert (= (or b!1034065 b!1034058) bm!43701))

(assert (= (or b!1034063 bm!43701) bm!43700))

(assert (= (or b!1034060 bm!43700) bm!43702))

(assert (= (and bm!43702 c!104493) b!1034066))

(assert (= (and bm!43702 (not c!104493)) b!1034067))

(assert (= (and d!124005 res!690779) b!1034062))

(assert (= (and b!1034062 res!690778) b!1034064))

(declare-fun m!954037 () Bool)

(assert (=> d!124005 m!954037))

(declare-fun m!954039 () Bool)

(assert (=> d!124005 m!954039))

(declare-fun m!954041 () Bool)

(assert (=> b!1034062 m!954041))

(declare-fun m!954043 () Bool)

(assert (=> b!1034066 m!954043))

(declare-fun m!954045 () Bool)

(assert (=> b!1034064 m!954045))

(declare-fun m!954047 () Bool)

(assert (=> bm!43702 m!954047))

(assert (=> d!123933 d!124005))

(declare-fun d!124007 () Bool)

(declare-fun e!584527 () Bool)

(assert (=> d!124007 e!584527))

(declare-fun res!690780 () Bool)

(assert (=> d!124007 (=> res!690780 e!584527)))

(declare-fun lt!456441 () Bool)

(assert (=> d!124007 (= res!690780 (not lt!456441))))

(declare-fun lt!456439 () Bool)

(assert (=> d!124007 (= lt!456441 lt!456439)))

(declare-fun lt!456438 () Unit!33831)

(declare-fun e!584528 () Unit!33831)

(assert (=> d!124007 (= lt!456438 e!584528)))

(declare-fun c!104495 () Bool)

(assert (=> d!124007 (= c!104495 lt!456439)))

(assert (=> d!124007 (= lt!456439 (containsKey!563 (toList!6893 lt!456348) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (=> d!124007 (= (contains!6012 lt!456348 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) lt!456441)))

(declare-fun b!1034068 () Bool)

(declare-fun lt!456440 () Unit!33831)

(assert (=> b!1034068 (= e!584528 lt!456440)))

(assert (=> b!1034068 (= lt!456440 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456348) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (=> b!1034068 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1034069 () Bool)

(declare-fun Unit!33849 () Unit!33831)

(assert (=> b!1034069 (= e!584528 Unit!33849)))

(declare-fun b!1034070 () Bool)

(assert (=> b!1034070 (= e!584527 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))))

(assert (= (and d!124007 c!104495) b!1034068))

(assert (= (and d!124007 (not c!104495)) b!1034069))

(assert (= (and d!124007 (not res!690780)) b!1034070))

(assert (=> d!124007 m!953485))

(declare-fun m!954049 () Bool)

(assert (=> d!124007 m!954049))

(assert (=> b!1034068 m!953485))

(declare-fun m!954051 () Bool)

(assert (=> b!1034068 m!954051))

(assert (=> b!1034068 m!953485))

(declare-fun m!954053 () Bool)

(assert (=> b!1034068 m!954053))

(assert (=> b!1034068 m!954053))

(declare-fun m!954055 () Bool)

(assert (=> b!1034068 m!954055))

(assert (=> b!1034070 m!953485))

(assert (=> b!1034070 m!954053))

(assert (=> b!1034070 m!954053))

(assert (=> b!1034070 m!954055))

(assert (=> b!1033864 d!124007))

(declare-fun d!124009 () Bool)

(assert (=> d!124009 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456218) lt!456212)) (v!14889 (getValueByKey!588 (toList!6893 lt!456218) lt!456212)))))

(assert (=> d!123941 d!124009))

(declare-fun b!1034074 () Bool)

(declare-fun e!584530 () Option!639)

(assert (=> b!1034074 (= e!584530 None!637)))

(declare-fun b!1034071 () Bool)

(declare-fun e!584529 () Option!639)

(assert (=> b!1034071 (= e!584529 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456218)))))))

(declare-fun b!1034073 () Bool)

(assert (=> b!1034073 (= e!584530 (getValueByKey!588 (t!31103 (toList!6893 lt!456218)) lt!456212))))

(declare-fun d!124011 () Bool)

(declare-fun c!104496 () Bool)

(assert (=> d!124011 (= c!104496 (and ((_ is Cons!21901) (toList!6893 lt!456218)) (= (_1!7874 (h!23103 (toList!6893 lt!456218))) lt!456212)))))

(assert (=> d!124011 (= (getValueByKey!588 (toList!6893 lt!456218) lt!456212) e!584529)))

(declare-fun b!1034072 () Bool)

(assert (=> b!1034072 (= e!584529 e!584530)))

(declare-fun c!104497 () Bool)

(assert (=> b!1034072 (= c!104497 (and ((_ is Cons!21901) (toList!6893 lt!456218)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456218))) lt!456212))))))

(assert (= (and d!124011 c!104496) b!1034071))

(assert (= (and d!124011 (not c!104496)) b!1034072))

(assert (= (and b!1034072 c!104497) b!1034073))

(assert (= (and b!1034072 (not c!104497)) b!1034074))

(declare-fun m!954057 () Bool)

(assert (=> b!1034073 m!954057))

(assert (=> d!123941 d!124011))

(declare-fun d!124013 () Bool)

(assert (=> d!124013 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456185)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456185)))))

(assert (=> d!123865 d!124013))

(declare-fun b!1034078 () Bool)

(declare-fun e!584532 () Option!639)

(assert (=> b!1034078 (= e!584532 None!637)))

(declare-fun b!1034075 () Bool)

(declare-fun e!584531 () Option!639)

(assert (=> b!1034075 (= e!584531 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))))

(declare-fun b!1034077 () Bool)

(assert (=> b!1034077 (= e!584532 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))) lt!456185))))

(declare-fun d!124015 () Bool)

(declare-fun c!104498 () Bool)

(assert (=> d!124015 (= c!104498 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))) lt!456185)))))

(assert (=> d!124015 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456185) e!584531)))

(declare-fun b!1034076 () Bool)

(assert (=> b!1034076 (= e!584531 e!584532)))

(declare-fun c!104499 () Bool)

(assert (=> b!1034076 (= c!104499 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))) lt!456185))))))

(assert (= (and d!124015 c!104498) b!1034075))

(assert (= (and d!124015 (not c!104498)) b!1034076))

(assert (= (and b!1034076 c!104499) b!1034077))

(assert (= (and b!1034076 (not c!104499)) b!1034078))

(declare-fun m!954059 () Bool)

(assert (=> b!1034077 m!954059))

(assert (=> d!123865 d!124015))

(declare-fun d!124017 () Bool)

(declare-fun res!690785 () Bool)

(declare-fun e!584537 () Bool)

(assert (=> d!124017 (=> res!690785 e!584537)))

(assert (=> d!124017 (= res!690785 (and ((_ is Cons!21901) lt!456370) (= (_1!7874 (h!23103 lt!456370)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124017 (= (containsKey!563 lt!456370 #b0000000000000000000000000000000000000000000000000000000000000000) e!584537)))

(declare-fun b!1034083 () Bool)

(declare-fun e!584538 () Bool)

(assert (=> b!1034083 (= e!584537 e!584538)))

(declare-fun res!690786 () Bool)

(assert (=> b!1034083 (=> (not res!690786) (not e!584538))))

(assert (=> b!1034083 (= res!690786 (and (or (not ((_ is Cons!21901) lt!456370)) (bvsle (_1!7874 (h!23103 lt!456370)) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) lt!456370) (bvslt (_1!7874 (h!23103 lt!456370)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034084 () Bool)

(assert (=> b!1034084 (= e!584538 (containsKey!563 (t!31103 lt!456370) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124017 (not res!690785)) b!1034083))

(assert (= (and b!1034083 res!690786) b!1034084))

(declare-fun m!954061 () Bool)

(assert (=> b!1034084 m!954061))

(assert (=> b!1033918 d!124017))

(declare-fun b!1034088 () Bool)

(declare-fun e!584540 () Option!639)

(assert (=> b!1034088 (= e!584540 None!637)))

(declare-fun b!1034085 () Bool)

(declare-fun e!584539 () Option!639)

(assert (=> b!1034085 (= e!584539 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456400)))))))

(declare-fun b!1034087 () Bool)

(assert (=> b!1034087 (= e!584540 (getValueByKey!588 (t!31103 (toList!6893 lt!456400)) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun d!124019 () Bool)

(declare-fun c!104500 () Bool)

(assert (=> d!124019 (= c!104500 (and ((_ is Cons!21901) (toList!6893 lt!456400)) (= (_1!7874 (h!23103 (toList!6893 lt!456400))) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(assert (=> d!124019 (= (getValueByKey!588 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) e!584539)))

(declare-fun b!1034086 () Bool)

(assert (=> b!1034086 (= e!584539 e!584540)))

(declare-fun c!104501 () Bool)

(assert (=> b!1034086 (= c!104501 (and ((_ is Cons!21901) (toList!6893 lt!456400)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456400))) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124019 c!104500) b!1034085))

(assert (= (and d!124019 (not c!104500)) b!1034086))

(assert (= (and b!1034086 c!104501) b!1034087))

(assert (= (and b!1034086 (not c!104501)) b!1034088))

(declare-fun m!954063 () Bool)

(assert (=> b!1034087 m!954063))

(assert (=> b!1033945 d!124019))

(assert (=> b!1033877 d!123977))

(declare-fun b!1034092 () Bool)

(declare-fun e!584542 () Option!639)

(assert (=> b!1034092 (= e!584542 None!637)))

(declare-fun b!1034089 () Bool)

(declare-fun e!584541 () Option!639)

(assert (=> b!1034089 (= e!584541 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456247)))))))

(declare-fun b!1034091 () Bool)

(assert (=> b!1034091 (= e!584542 (getValueByKey!588 (t!31103 (toList!6893 lt!456247)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun d!124021 () Bool)

(declare-fun c!104502 () Bool)

(assert (=> d!124021 (= c!104502 (and ((_ is Cons!21901) (toList!6893 lt!456247)) (= (_1!7874 (h!23103 (toList!6893 lt!456247))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124021 (= (getValueByKey!588 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) e!584541)))

(declare-fun b!1034090 () Bool)

(assert (=> b!1034090 (= e!584541 e!584542)))

(declare-fun c!104503 () Bool)

(assert (=> b!1034090 (= c!104503 (and ((_ is Cons!21901) (toList!6893 lt!456247)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456247))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124021 c!104502) b!1034089))

(assert (= (and d!124021 (not c!104502)) b!1034090))

(assert (= (and b!1034090 c!104503) b!1034091))

(assert (= (and b!1034090 (not c!104503)) b!1034092))

(declare-fun m!954065 () Bool)

(assert (=> b!1034091 m!954065))

(assert (=> b!1033745 d!124021))

(declare-fun d!124023 () Bool)

(assert (=> d!124023 (= ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (toList!6893 (map!14701 thiss!1427))) key!909) (h!23103 (toList!6893 (map!14701 thiss!1427)))) (Cons!21901 (h!23103 (toList!6893 (map!14701 thiss!1427))) (removeStrictlySorted!56 (t!31103 (toList!6893 (map!14701 thiss!1427))) key!909)))))

(assert (=> b!1033963 d!124023))

(declare-fun d!124025 () Bool)

(declare-fun e!584543 () Bool)

(assert (=> d!124025 e!584543))

(declare-fun res!690787 () Bool)

(assert (=> d!124025 (=> (not res!690787) (not e!584543))))

(declare-fun lt!456442 () List!21905)

(assert (=> d!124025 (= res!690787 (isStrictlySorted!718 lt!456442))))

(declare-fun e!584544 () List!21905)

(assert (=> d!124025 (= lt!456442 e!584544)))

(declare-fun c!104504 () Bool)

(assert (=> d!124025 (= c!104504 (and ((_ is Cons!21901) (t!31103 (toList!6893 (map!14701 thiss!1427)))) (= (_1!7874 (h!23103 (t!31103 (toList!6893 (map!14701 thiss!1427))))) key!909)))))

(assert (=> d!124025 (isStrictlySorted!718 (t!31103 (toList!6893 (map!14701 thiss!1427))))))

(assert (=> d!124025 (= (removeStrictlySorted!56 (t!31103 (toList!6893 (map!14701 thiss!1427))) key!909) lt!456442)))

(declare-fun b!1034093 () Bool)

(assert (=> b!1034093 (= e!584544 (t!31103 (t!31103 (toList!6893 (map!14701 thiss!1427)))))))

(declare-fun b!1034094 () Bool)

(declare-fun e!584545 () List!21905)

(assert (=> b!1034094 (= e!584545 Nil!21902)))

(declare-fun b!1034095 () Bool)

(assert (=> b!1034095 (= e!584545 ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (t!31103 (toList!6893 (map!14701 thiss!1427)))) key!909) (h!23103 (t!31103 (toList!6893 (map!14701 thiss!1427))))))))

(declare-fun b!1034096 () Bool)

(assert (=> b!1034096 (= e!584544 e!584545)))

(declare-fun c!104505 () Bool)

(assert (=> b!1034096 (= c!104505 (and ((_ is Cons!21901) (t!31103 (toList!6893 (map!14701 thiss!1427)))) (not (= (_1!7874 (h!23103 (t!31103 (toList!6893 (map!14701 thiss!1427))))) key!909))))))

(declare-fun b!1034097 () Bool)

(assert (=> b!1034097 (= e!584543 (not (containsKey!563 lt!456442 key!909)))))

(assert (= (and d!124025 c!104504) b!1034093))

(assert (= (and d!124025 (not c!104504)) b!1034096))

(assert (= (and b!1034096 c!104505) b!1034095))

(assert (= (and b!1034096 (not c!104505)) b!1034094))

(assert (= (and d!124025 res!690787) b!1034097))

(declare-fun m!954067 () Bool)

(assert (=> d!124025 m!954067))

(declare-fun m!954069 () Bool)

(assert (=> d!124025 m!954069))

(declare-fun m!954071 () Bool)

(assert (=> b!1034095 m!954071))

(assert (=> b!1034095 m!954071))

(declare-fun m!954073 () Bool)

(assert (=> b!1034095 m!954073))

(declare-fun m!954075 () Bool)

(assert (=> b!1034097 m!954075))

(assert (=> b!1033963 d!124025))

(declare-fun b!1034101 () Bool)

(declare-fun e!584547 () Option!639)

(assert (=> b!1034101 (= e!584547 None!637)))

(declare-fun b!1034098 () Bool)

(declare-fun e!584546 () Option!639)

(assert (=> b!1034098 (= e!584546 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456388)))))))

(declare-fun b!1034100 () Bool)

(assert (=> b!1034100 (= e!584547 (getValueByKey!588 (t!31103 (toList!6893 lt!456388)) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun c!104506 () Bool)

(declare-fun d!124027 () Bool)

(assert (=> d!124027 (= c!104506 (and ((_ is Cons!21901) (toList!6893 lt!456388)) (= (_1!7874 (h!23103 (toList!6893 lt!456388))) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124027 (= (getValueByKey!588 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) e!584546)))

(declare-fun b!1034099 () Bool)

(assert (=> b!1034099 (= e!584546 e!584547)))

(declare-fun c!104507 () Bool)

(assert (=> b!1034099 (= c!104507 (and ((_ is Cons!21901) (toList!6893 lt!456388)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456388))) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))))

(assert (= (and d!124027 c!104506) b!1034098))

(assert (= (and d!124027 (not c!104506)) b!1034099))

(assert (= (and b!1034099 c!104507) b!1034100))

(assert (= (and b!1034099 (not c!104507)) b!1034101))

(declare-fun m!954077 () Bool)

(assert (=> b!1034100 m!954077))

(assert (=> b!1033938 d!124027))

(declare-fun d!124029 () Bool)

(declare-fun lt!456445 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!512 (List!21907) (InoxSet (_ BitVec 64)))

(assert (=> d!124029 (= lt!456445 (select (content!512 Nil!21904) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584552 () Bool)

(assert (=> d!124029 (= lt!456445 e!584552)))

(declare-fun res!690793 () Bool)

(assert (=> d!124029 (=> (not res!690793) (not e!584552))))

(assert (=> d!124029 (= res!690793 ((_ is Cons!21903) Nil!21904))))

(assert (=> d!124029 (= (contains!6014 Nil!21904 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456445)))

(declare-fun b!1034106 () Bool)

(declare-fun e!584553 () Bool)

(assert (=> b!1034106 (= e!584552 e!584553)))

(declare-fun res!690792 () Bool)

(assert (=> b!1034106 (=> res!690792 e!584553)))

(assert (=> b!1034106 (= res!690792 (= (h!23105 Nil!21904) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034107 () Bool)

(assert (=> b!1034107 (= e!584553 (contains!6014 (t!31107 Nil!21904) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124029 res!690793) b!1034106))

(assert (= (and b!1034106 (not res!690792)) b!1034107))

(declare-fun m!954079 () Bool)

(assert (=> d!124029 m!954079))

(assert (=> d!124029 m!953361))

(declare-fun m!954081 () Bool)

(assert (=> d!124029 m!954081))

(assert (=> b!1034107 m!953361))

(declare-fun m!954083 () Bool)

(assert (=> b!1034107 m!954083))

(assert (=> b!1033900 d!124029))

(declare-fun d!124031 () Bool)

(assert (=> d!124031 (= (apply!906 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456212) (apply!906 lt!456218 lt!456212))))

(assert (=> d!124031 true))

(declare-fun _$34!1164 () Unit!33831)

(assert (=> d!124031 (= (choose!1697 lt!456218 lt!456227 (minValue!6063 thiss!1427) lt!456212) _$34!1164)))

(declare-fun bs!30242 () Bool)

(assert (= bs!30242 d!124031))

(assert (=> bs!30242 m!953441))

(assert (=> bs!30242 m!953441))

(assert (=> bs!30242 m!953443))

(assert (=> bs!30242 m!953453))

(assert (=> d!123945 d!124031))

(declare-fun d!124033 () Bool)

(declare-fun e!584554 () Bool)

(assert (=> d!124033 e!584554))

(declare-fun res!690794 () Bool)

(assert (=> d!124033 (=> res!690794 e!584554)))

(declare-fun lt!456449 () Bool)

(assert (=> d!124033 (= res!690794 (not lt!456449))))

(declare-fun lt!456447 () Bool)

(assert (=> d!124033 (= lt!456449 lt!456447)))

(declare-fun lt!456446 () Unit!33831)

(declare-fun e!584555 () Unit!33831)

(assert (=> d!124033 (= lt!456446 e!584555)))

(declare-fun c!104508 () Bool)

(assert (=> d!124033 (= c!104508 lt!456447)))

(assert (=> d!124033 (= lt!456447 (containsKey!563 (toList!6893 lt!456218) lt!456212))))

(assert (=> d!124033 (= (contains!6012 lt!456218 lt!456212) lt!456449)))

(declare-fun b!1034109 () Bool)

(declare-fun lt!456448 () Unit!33831)

(assert (=> b!1034109 (= e!584555 lt!456448)))

(assert (=> b!1034109 (= lt!456448 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456218) lt!456212))))

(assert (=> b!1034109 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456218) lt!456212))))

(declare-fun b!1034110 () Bool)

(declare-fun Unit!33850 () Unit!33831)

(assert (=> b!1034110 (= e!584555 Unit!33850)))

(declare-fun b!1034111 () Bool)

(assert (=> b!1034111 (= e!584554 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456218) lt!456212)))))

(assert (= (and d!124033 c!104508) b!1034109))

(assert (= (and d!124033 (not c!104508)) b!1034110))

(assert (= (and d!124033 (not res!690794)) b!1034111))

(declare-fun m!954085 () Bool)

(assert (=> d!124033 m!954085))

(declare-fun m!954087 () Bool)

(assert (=> b!1034109 m!954087))

(assert (=> b!1034109 m!953909))

(assert (=> b!1034109 m!953909))

(declare-fun m!954089 () Bool)

(assert (=> b!1034109 m!954089))

(assert (=> b!1034111 m!953909))

(assert (=> b!1034111 m!953909))

(assert (=> b!1034111 m!954089))

(assert (=> d!123945 d!124033))

(assert (=> d!123945 d!123935))

(assert (=> d!123945 d!123937))

(assert (=> d!123945 d!123941))

(declare-fun d!124035 () Bool)

(declare-fun lt!456450 () (_ BitVec 32))

(assert (=> d!124035 (and (bvsge lt!456450 #b00000000000000000000000000000000) (bvsle lt!456450 (bvsub (size!31875 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!584556 () (_ BitVec 32))

(assert (=> d!124035 (= lt!456450 e!584556)))

(declare-fun c!104509 () Bool)

(assert (=> d!124035 (= c!104509 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!124035 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31875 (_keys!11407 thiss!1427)) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!124035 (= (arrayCountValidKeys!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))) lt!456450)))

(declare-fun b!1034112 () Bool)

(declare-fun e!584557 () (_ BitVec 32))

(declare-fun call!43706 () (_ BitVec 32))

(assert (=> b!1034112 (= e!584557 (bvadd #b00000000000000000000000000000001 call!43706))))

(declare-fun b!1034113 () Bool)

(assert (=> b!1034113 (= e!584556 e!584557)))

(declare-fun c!104510 () Bool)

(assert (=> b!1034113 (= c!104510 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034114 () Bool)

(assert (=> b!1034114 (= e!584556 #b00000000000000000000000000000000)))

(declare-fun bm!43703 () Bool)

(assert (=> bm!43703 (= call!43706 (arrayCountValidKeys!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034115 () Bool)

(assert (=> b!1034115 (= e!584557 call!43706)))

(assert (= (and d!124035 c!104509) b!1034114))

(assert (= (and d!124035 (not c!104509)) b!1034113))

(assert (= (and b!1034113 c!104510) b!1034112))

(assert (= (and b!1034113 (not c!104510)) b!1034115))

(assert (= (or b!1034112 b!1034115) bm!43703))

(assert (=> b!1034113 m!953999))

(assert (=> b!1034113 m!953999))

(assert (=> b!1034113 m!954013))

(declare-fun m!954091 () Bool)

(assert (=> bm!43703 m!954091))

(assert (=> bm!43691 d!124035))

(declare-fun d!124037 () Bool)

(declare-fun e!584558 () Bool)

(assert (=> d!124037 e!584558))

(declare-fun res!690795 () Bool)

(assert (=> d!124037 (=> res!690795 e!584558)))

(declare-fun lt!456454 () Bool)

(assert (=> d!124037 (= res!690795 (not lt!456454))))

(declare-fun lt!456452 () Bool)

(assert (=> d!124037 (= lt!456454 lt!456452)))

(declare-fun lt!456451 () Unit!33831)

(declare-fun e!584559 () Unit!33831)

(assert (=> d!124037 (= lt!456451 e!584559)))

(declare-fun c!104511 () Bool)

(assert (=> d!124037 (= c!104511 lt!456452)))

(assert (=> d!124037 (= lt!456452 (containsKey!563 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124037 (= (contains!6012 lt!456374 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456454)))

(declare-fun b!1034116 () Bool)

(declare-fun lt!456453 () Unit!33831)

(assert (=> b!1034116 (= e!584559 lt!456453)))

(assert (=> b!1034116 (= lt!456453 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> b!1034116 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034117 () Bool)

(declare-fun Unit!33851 () Unit!33831)

(assert (=> b!1034117 (= e!584559 Unit!33851)))

(declare-fun b!1034118 () Bool)

(assert (=> b!1034118 (= e!584558 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456374) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124037 c!104511) b!1034116))

(assert (= (and d!124037 (not c!104511)) b!1034117))

(assert (= (and d!124037 (not res!690795)) b!1034118))

(declare-fun m!954093 () Bool)

(assert (=> d!124037 m!954093))

(declare-fun m!954095 () Bool)

(assert (=> b!1034116 m!954095))

(assert (=> b!1034116 m!953807))

(assert (=> b!1034116 m!953807))

(declare-fun m!954097 () Bool)

(assert (=> b!1034116 m!954097))

(assert (=> b!1034118 m!953807))

(assert (=> b!1034118 m!953807))

(assert (=> b!1034118 m!954097))

(assert (=> d!123907 d!124037))

(declare-fun b!1034122 () Bool)

(declare-fun e!584561 () Option!639)

(assert (=> b!1034122 (= e!584561 None!637)))

(declare-fun b!1034119 () Bool)

(declare-fun e!584560 () Option!639)

(assert (=> b!1034119 (= e!584560 (Some!638 (_2!7874 (h!23103 lt!456377))))))

(declare-fun b!1034121 () Bool)

(assert (=> b!1034121 (= e!584561 (getValueByKey!588 (t!31103 lt!456377) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun c!104512 () Bool)

(declare-fun d!124039 () Bool)

(assert (=> d!124039 (= c!104512 (and ((_ is Cons!21901) lt!456377) (= (_1!7874 (h!23103 lt!456377)) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!124039 (= (getValueByKey!588 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) e!584560)))

(declare-fun b!1034120 () Bool)

(assert (=> b!1034120 (= e!584560 e!584561)))

(declare-fun c!104513 () Bool)

(assert (=> b!1034120 (= c!104513 (and ((_ is Cons!21901) lt!456377) (not (= (_1!7874 (h!23103 lt!456377)) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(assert (= (and d!124039 c!104512) b!1034119))

(assert (= (and d!124039 (not c!104512)) b!1034120))

(assert (= (and b!1034120 c!104513) b!1034121))

(assert (= (and b!1034120 (not c!104513)) b!1034122))

(declare-fun m!954099 () Bool)

(assert (=> b!1034121 m!954099))

(assert (=> d!123907 d!124039))

(declare-fun d!124041 () Bool)

(assert (=> d!124041 (= (getValueByKey!588 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun lt!456455 () Unit!33831)

(assert (=> d!124041 (= lt!456455 (choose!1700 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun e!584562 () Bool)

(assert (=> d!124041 e!584562))

(declare-fun res!690796 () Bool)

(assert (=> d!124041 (=> (not res!690796) (not e!584562))))

(assert (=> d!124041 (= res!690796 (isStrictlySorted!718 lt!456377))))

(assert (=> d!124041 (= (lemmaContainsTupThenGetReturnValue!279 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456455)))

(declare-fun b!1034123 () Bool)

(declare-fun res!690797 () Bool)

(assert (=> b!1034123 (=> (not res!690797) (not e!584562))))

(assert (=> b!1034123 (= res!690797 (containsKey!563 lt!456377 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034124 () Bool)

(assert (=> b!1034124 (= e!584562 (contains!6013 lt!456377 (tuple2!15727 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124041 res!690796) b!1034123))

(assert (= (and b!1034123 res!690797) b!1034124))

(assert (=> d!124041 m!953801))

(declare-fun m!954101 () Bool)

(assert (=> d!124041 m!954101))

(declare-fun m!954103 () Bool)

(assert (=> d!124041 m!954103))

(declare-fun m!954105 () Bool)

(assert (=> b!1034123 m!954105))

(declare-fun m!954107 () Bool)

(assert (=> b!1034124 m!954107))

(assert (=> d!123907 d!124041))

(declare-fun bm!43704 () Bool)

(declare-fun call!43709 () List!21905)

(declare-fun call!43707 () List!21905)

(assert (=> bm!43704 (= call!43709 call!43707)))

(declare-fun d!124043 () Bool)

(declare-fun e!584563 () Bool)

(assert (=> d!124043 e!584563))

(declare-fun res!690799 () Bool)

(assert (=> d!124043 (=> (not res!690799) (not e!584563))))

(declare-fun lt!456456 () List!21905)

(assert (=> d!124043 (= res!690799 (isStrictlySorted!718 lt!456456))))

(declare-fun e!584564 () List!21905)

(assert (=> d!124043 (= lt!456456 e!584564)))

(declare-fun c!104517 () Bool)

(assert (=> d!124043 (= c!104517 (and ((_ is Cons!21901) (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (bvslt (_1!7874 (h!23103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!124043 (isStrictlySorted!718 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))))))

(assert (=> d!124043 (= (insertStrictlySorted!372 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456456)))

(declare-fun b!1034125 () Bool)

(declare-fun e!584566 () List!21905)

(declare-fun call!43708 () List!21905)

(assert (=> b!1034125 (= e!584566 call!43708)))

(declare-fun b!1034126 () Bool)

(declare-fun c!104514 () Bool)

(assert (=> b!1034126 (= c!104514 (and ((_ is Cons!21901) (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (bvsgt (_1!7874 (h!23103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun e!584567 () List!21905)

(assert (=> b!1034126 (= e!584567 e!584566)))

(declare-fun b!1034127 () Bool)

(assert (=> b!1034127 (= e!584564 call!43707)))

(declare-fun bm!43705 () Bool)

(assert (=> bm!43705 (= call!43708 call!43709)))

(declare-fun b!1034128 () Bool)

(assert (=> b!1034128 (= e!584564 e!584567)))

(declare-fun c!104515 () Bool)

(assert (=> b!1034128 (= c!104515 (and ((_ is Cons!21901) (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (= (_1!7874 (h!23103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1034129 () Bool)

(declare-fun res!690798 () Bool)

(assert (=> b!1034129 (=> (not res!690798) (not e!584563))))

(assert (=> b!1034129 (= res!690798 (containsKey!563 lt!456456 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034130 () Bool)

(assert (=> b!1034130 (= e!584567 call!43709)))

(declare-fun e!584565 () List!21905)

(declare-fun bm!43706 () Bool)

(assert (=> bm!43706 (= call!43707 ($colon$colon!602 e!584565 (ite c!104517 (h!23103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (tuple2!15727 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(declare-fun c!104516 () Bool)

(assert (=> bm!43706 (= c!104516 c!104517)))

(declare-fun b!1034131 () Bool)

(assert (=> b!1034131 (= e!584563 (contains!6013 lt!456456 (tuple2!15727 (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1034132 () Bool)

(assert (=> b!1034132 (= e!584566 call!43708)))

(declare-fun b!1034133 () Bool)

(assert (=> b!1034133 (= e!584565 (insertStrictlySorted!372 (t!31103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (_1!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034134 () Bool)

(assert (=> b!1034134 (= e!584565 (ite c!104515 (t!31103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (ite c!104514 (Cons!21901 (h!23103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659)))) (t!31103 (toList!6893 (ite c!104383 call!43662 (ite c!104388 call!43665 call!43659))))) Nil!21902)))))

(assert (= (and d!124043 c!104517) b!1034127))

(assert (= (and d!124043 (not c!104517)) b!1034128))

(assert (= (and b!1034128 c!104515) b!1034130))

(assert (= (and b!1034128 (not c!104515)) b!1034126))

(assert (= (and b!1034126 c!104514) b!1034132))

(assert (= (and b!1034126 (not c!104514)) b!1034125))

(assert (= (or b!1034132 b!1034125) bm!43705))

(assert (= (or b!1034130 bm!43705) bm!43704))

(assert (= (or b!1034127 bm!43704) bm!43706))

(assert (= (and bm!43706 c!104516) b!1034133))

(assert (= (and bm!43706 (not c!104516)) b!1034134))

(assert (= (and d!124043 res!690799) b!1034129))

(assert (= (and b!1034129 res!690798) b!1034131))

(declare-fun m!954109 () Bool)

(assert (=> d!124043 m!954109))

(declare-fun m!954111 () Bool)

(assert (=> d!124043 m!954111))

(declare-fun m!954113 () Bool)

(assert (=> b!1034129 m!954113))

(declare-fun m!954115 () Bool)

(assert (=> b!1034133 m!954115))

(declare-fun m!954117 () Bool)

(assert (=> b!1034131 m!954117))

(declare-fun m!954119 () Bool)

(assert (=> bm!43706 m!954119))

(assert (=> d!123907 d!124043))

(declare-fun d!124045 () Bool)

(declare-fun res!690800 () Bool)

(declare-fun e!584568 () Bool)

(assert (=> d!124045 (=> res!690800 e!584568)))

(assert (=> d!124045 (= res!690800 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124045 (= (containsKey!563 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000) e!584568)))

(declare-fun b!1034135 () Bool)

(declare-fun e!584569 () Bool)

(assert (=> b!1034135 (= e!584568 e!584569)))

(declare-fun res!690801 () Bool)

(assert (=> b!1034135 (=> (not res!690801) (not e!584569))))

(assert (=> b!1034135 (= res!690801 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456221))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456221))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) (toList!6893 lt!456221)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456221))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034136 () Bool)

(assert (=> b!1034136 (= e!584569 (containsKey!563 (t!31103 (toList!6893 lt!456221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124045 (not res!690800)) b!1034135))

(assert (= (and b!1034135 res!690801) b!1034136))

(declare-fun m!954121 () Bool)

(assert (=> b!1034136 m!954121))

(assert (=> d!123949 d!124045))

(declare-fun b!1034137 () Bool)

(declare-fun e!584572 () Bool)

(assert (=> b!1034137 (= e!584572 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (=> b!1034137 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!124047 () Bool)

(declare-fun e!584571 () Bool)

(assert (=> d!124047 e!584571))

(declare-fun res!690805 () Bool)

(assert (=> d!124047 (=> (not res!690805) (not e!584571))))

(declare-fun lt!456463 () ListLongMap!13755)

(assert (=> d!124047 (= res!690805 (not (contains!6012 lt!456463 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584573 () ListLongMap!13755)

(assert (=> d!124047 (= lt!456463 e!584573)))

(declare-fun c!104518 () Bool)

(assert (=> d!124047 (= c!104518 (bvsge #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!124047 (validMask!0 (mask!30084 lt!456124))))

(assert (=> d!124047 (= (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) #b00000000000000000000000000000000 (defaultEntry!6227 lt!456124)) lt!456463)))

(declare-fun bm!43707 () Bool)

(declare-fun call!43710 () ListLongMap!13755)

(assert (=> bm!43707 (= call!43710 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 lt!456124)))))

(declare-fun b!1034138 () Bool)

(declare-fun e!584574 () ListLongMap!13755)

(assert (=> b!1034138 (= e!584573 e!584574)))

(declare-fun c!104521 () Bool)

(assert (=> b!1034138 (= c!104521 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1034139 () Bool)

(declare-fun e!584576 () Bool)

(declare-fun e!584570 () Bool)

(assert (=> b!1034139 (= e!584576 e!584570)))

(declare-fun c!104520 () Bool)

(assert (=> b!1034139 (= c!104520 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1034140 () Bool)

(assert (=> b!1034140 (= e!584570 (= lt!456463 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 lt!456124) (_values!6250 lt!456124) (mask!30084 lt!456124) (extraKeys!5959 lt!456124) (zeroValue!6063 lt!456124) (minValue!6063 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 lt!456124))))))

(declare-fun b!1034141 () Bool)

(assert (=> b!1034141 (= e!584574 call!43710)))

(declare-fun b!1034142 () Bool)

(declare-fun lt!456459 () Unit!33831)

(declare-fun lt!456457 () Unit!33831)

(assert (=> b!1034142 (= lt!456459 lt!456457)))

(declare-fun lt!456461 () V!37565)

(declare-fun lt!456462 () (_ BitVec 64))

(declare-fun lt!456458 () (_ BitVec 64))

(declare-fun lt!456460 () ListLongMap!13755)

(assert (=> b!1034142 (not (contains!6012 (+!3104 lt!456460 (tuple2!15727 lt!456458 lt!456461)) lt!456462))))

(assert (=> b!1034142 (= lt!456457 (addStillNotContains!242 lt!456460 lt!456458 lt!456461 lt!456462))))

(assert (=> b!1034142 (= lt!456462 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034142 (= lt!456461 (get!16433 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034142 (= lt!456458 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))

(assert (=> b!1034142 (= lt!456460 call!43710)))

(assert (=> b!1034142 (= e!584574 (+!3104 call!43710 (tuple2!15727 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034143 () Bool)

(assert (=> b!1034143 (= e!584571 e!584576)))

(declare-fun c!104519 () Bool)

(assert (=> b!1034143 (= c!104519 e!584572)))

(declare-fun res!690802 () Bool)

(assert (=> b!1034143 (=> (not res!690802) (not e!584572))))

(assert (=> b!1034143 (= res!690802 (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1034144 () Bool)

(declare-fun res!690803 () Bool)

(assert (=> b!1034144 (=> (not res!690803) (not e!584571))))

(assert (=> b!1034144 (= res!690803 (not (contains!6012 lt!456463 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034145 () Bool)

(declare-fun e!584575 () Bool)

(assert (=> b!1034145 (= e!584576 e!584575)))

(assert (=> b!1034145 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(declare-fun res!690804 () Bool)

(assert (=> b!1034145 (= res!690804 (contains!6012 lt!456463 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (=> b!1034145 (=> (not res!690804) (not e!584575))))

(declare-fun b!1034146 () Bool)

(assert (=> b!1034146 (= e!584573 (ListLongMap!13756 Nil!21902))))

(declare-fun b!1034147 () Bool)

(assert (=> b!1034147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31875 (_keys!11407 lt!456124))))))

(assert (=> b!1034147 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!31876 (_values!6250 lt!456124))))))

(assert (=> b!1034147 (= e!584575 (= (apply!906 lt!456463 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) (get!16433 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034148 () Bool)

(assert (=> b!1034148 (= e!584570 (isEmpty!926 lt!456463))))

(assert (= (and d!124047 c!104518) b!1034146))

(assert (= (and d!124047 (not c!104518)) b!1034138))

(assert (= (and b!1034138 c!104521) b!1034142))

(assert (= (and b!1034138 (not c!104521)) b!1034141))

(assert (= (or b!1034142 b!1034141) bm!43707))

(assert (= (and d!124047 res!690805) b!1034144))

(assert (= (and b!1034144 res!690803) b!1034143))

(assert (= (and b!1034143 res!690802) b!1034137))

(assert (= (and b!1034143 c!104519) b!1034145))

(assert (= (and b!1034143 (not c!104519)) b!1034139))

(assert (= (and b!1034145 res!690804) b!1034147))

(assert (= (and b!1034139 c!104520) b!1034140))

(assert (= (and b!1034139 (not c!104520)) b!1034148))

(declare-fun b_lambda!16083 () Bool)

(assert (=> (not b_lambda!16083) (not b!1034142)))

(assert (=> b!1034142 t!31109))

(declare-fun b_and!33295 () Bool)

(assert (= b_and!33293 (and (=> t!31109 result!14397) b_and!33295)))

(declare-fun b_lambda!16085 () Bool)

(assert (=> (not b_lambda!16085) (not b!1034147)))

(assert (=> b!1034147 t!31109))

(declare-fun b_and!33297 () Bool)

(assert (= b_and!33295 (and (=> t!31109 result!14397) b_and!33297)))

(declare-fun m!954123 () Bool)

(assert (=> b!1034142 m!954123))

(assert (=> b!1034142 m!953695))

(assert (=> b!1034142 m!953695))

(assert (=> b!1034142 m!953697))

(assert (=> b!1034142 m!953701))

(assert (=> b!1034142 m!953485))

(declare-fun m!954125 () Bool)

(assert (=> b!1034142 m!954125))

(declare-fun m!954127 () Bool)

(assert (=> b!1034142 m!954127))

(assert (=> b!1034142 m!954127))

(declare-fun m!954129 () Bool)

(assert (=> b!1034142 m!954129))

(assert (=> b!1034142 m!953697))

(declare-fun m!954131 () Bool)

(assert (=> b!1034144 m!954131))

(declare-fun m!954133 () Bool)

(assert (=> b!1034148 m!954133))

(declare-fun m!954135 () Bool)

(assert (=> d!124047 m!954135))

(assert (=> d!124047 m!953687))

(assert (=> b!1034138 m!953485))

(assert (=> b!1034138 m!953485))

(assert (=> b!1034138 m!953493))

(assert (=> b!1034145 m!953485))

(assert (=> b!1034145 m!953485))

(declare-fun m!954137 () Bool)

(assert (=> b!1034145 m!954137))

(declare-fun m!954139 () Bool)

(assert (=> b!1034140 m!954139))

(assert (=> bm!43707 m!954139))

(assert (=> b!1034137 m!953485))

(assert (=> b!1034137 m!953485))

(assert (=> b!1034137 m!953493))

(assert (=> b!1034147 m!953485))

(declare-fun m!954141 () Bool)

(assert (=> b!1034147 m!954141))

(assert (=> b!1034147 m!953695))

(assert (=> b!1034147 m!953695))

(assert (=> b!1034147 m!953697))

(assert (=> b!1034147 m!953701))

(assert (=> b!1034147 m!953485))

(assert (=> b!1034147 m!953697))

(assert (=> bm!43685 d!124047))

(declare-fun d!124049 () Bool)

(declare-fun lt!456466 () Bool)

(declare-fun content!513 (List!21905) (InoxSet tuple2!15726))

(assert (=> d!124049 (= lt!456466 (select (content!513 (toList!6893 lt!456396)) (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))

(declare-fun e!584582 () Bool)

(assert (=> d!124049 (= lt!456466 e!584582)))

(declare-fun res!690810 () Bool)

(assert (=> d!124049 (=> (not res!690810) (not e!584582))))

(assert (=> d!124049 (= res!690810 ((_ is Cons!21901) (toList!6893 lt!456396)))))

(assert (=> d!124049 (= (contains!6013 (toList!6893 lt!456396) (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456466)))

(declare-fun b!1034153 () Bool)

(declare-fun e!584581 () Bool)

(assert (=> b!1034153 (= e!584582 e!584581)))

(declare-fun res!690811 () Bool)

(assert (=> b!1034153 (=> res!690811 e!584581)))

(assert (=> b!1034153 (= res!690811 (= (h!23103 (toList!6893 lt!456396)) (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))

(declare-fun b!1034154 () Bool)

(assert (=> b!1034154 (= e!584581 (contains!6013 (t!31103 (toList!6893 lt!456396)) (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))

(assert (= (and d!124049 res!690810) b!1034153))

(assert (= (and b!1034153 (not res!690811)) b!1034154))

(declare-fun m!954143 () Bool)

(assert (=> d!124049 m!954143))

(declare-fun m!954145 () Bool)

(assert (=> d!124049 m!954145))

(declare-fun m!954147 () Bool)

(assert (=> b!1034154 m!954147))

(assert (=> b!1033944 d!124049))

(declare-fun d!124051 () Bool)

(declare-fun e!584583 () Bool)

(assert (=> d!124051 e!584583))

(declare-fun res!690812 () Bool)

(assert (=> d!124051 (=> res!690812 e!584583)))

(declare-fun lt!456470 () Bool)

(assert (=> d!124051 (= res!690812 (not lt!456470))))

(declare-fun lt!456468 () Bool)

(assert (=> d!124051 (= lt!456470 lt!456468)))

(declare-fun lt!456467 () Unit!33831)

(declare-fun e!584584 () Unit!33831)

(assert (=> d!124051 (= lt!456467 e!584584)))

(declare-fun c!104522 () Bool)

(assert (=> d!124051 (= c!104522 lt!456468)))

(assert (=> d!124051 (= lt!456468 (containsKey!563 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(assert (=> d!124051 (= (contains!6012 lt!456400 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456470)))

(declare-fun b!1034155 () Bool)

(declare-fun lt!456469 () Unit!33831)

(assert (=> b!1034155 (= e!584584 lt!456469)))

(assert (=> b!1034155 (= lt!456469 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034155 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034156 () Bool)

(declare-fun Unit!33852 () Unit!33831)

(assert (=> b!1034156 (= e!584584 Unit!33852)))

(declare-fun b!1034157 () Bool)

(assert (=> b!1034157 (= e!584583 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456400) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124051 c!104522) b!1034155))

(assert (= (and d!124051 (not c!104522)) b!1034156))

(assert (= (and d!124051 (not res!690812)) b!1034157))

(declare-fun m!954149 () Bool)

(assert (=> d!124051 m!954149))

(declare-fun m!954151 () Bool)

(assert (=> b!1034155 m!954151))

(assert (=> b!1034155 m!953901))

(assert (=> b!1034155 m!953901))

(declare-fun m!954153 () Bool)

(assert (=> b!1034155 m!954153))

(assert (=> b!1034157 m!953901))

(assert (=> b!1034157 m!953901))

(assert (=> b!1034157 m!954153))

(assert (=> d!123937 d!124051))

(declare-fun b!1034161 () Bool)

(declare-fun e!584586 () Option!639)

(assert (=> b!1034161 (= e!584586 None!637)))

(declare-fun b!1034158 () Bool)

(declare-fun e!584585 () Option!639)

(assert (=> b!1034158 (= e!584585 (Some!638 (_2!7874 (h!23103 lt!456403))))))

(declare-fun b!1034160 () Bool)

(assert (=> b!1034160 (= e!584586 (getValueByKey!588 (t!31103 lt!456403) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun d!124053 () Bool)

(declare-fun c!104523 () Bool)

(assert (=> d!124053 (= c!104523 (and ((_ is Cons!21901) lt!456403) (= (_1!7874 (h!23103 lt!456403)) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(assert (=> d!124053 (= (getValueByKey!588 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) e!584585)))

(declare-fun b!1034159 () Bool)

(assert (=> b!1034159 (= e!584585 e!584586)))

(declare-fun c!104524 () Bool)

(assert (=> b!1034159 (= c!104524 (and ((_ is Cons!21901) lt!456403) (not (= (_1!7874 (h!23103 lt!456403)) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124053 c!104523) b!1034158))

(assert (= (and d!124053 (not c!104523)) b!1034159))

(assert (= (and b!1034159 c!104524) b!1034160))

(assert (= (and b!1034159 (not c!104524)) b!1034161))

(declare-fun m!954155 () Bool)

(assert (=> b!1034160 m!954155))

(assert (=> d!123937 d!124053))

(declare-fun d!124055 () Bool)

(assert (=> d!124055 (= (getValueByKey!588 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456471 () Unit!33831)

(assert (=> d!124055 (= lt!456471 (choose!1700 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun e!584587 () Bool)

(assert (=> d!124055 e!584587))

(declare-fun res!690813 () Bool)

(assert (=> d!124055 (=> (not res!690813) (not e!584587))))

(assert (=> d!124055 (= res!690813 (isStrictlySorted!718 lt!456403))))

(assert (=> d!124055 (= (lemmaContainsTupThenGetReturnValue!279 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456471)))

(declare-fun b!1034162 () Bool)

(declare-fun res!690814 () Bool)

(assert (=> b!1034162 (=> (not res!690814) (not e!584587))))

(assert (=> b!1034162 (= res!690814 (containsKey!563 lt!456403 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034163 () Bool)

(assert (=> b!1034163 (= e!584587 (contains!6013 lt!456403 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124055 res!690813) b!1034162))

(assert (= (and b!1034162 res!690814) b!1034163))

(assert (=> d!124055 m!953895))

(declare-fun m!954157 () Bool)

(assert (=> d!124055 m!954157))

(declare-fun m!954159 () Bool)

(assert (=> d!124055 m!954159))

(declare-fun m!954161 () Bool)

(assert (=> b!1034162 m!954161))

(declare-fun m!954163 () Bool)

(assert (=> b!1034163 m!954163))

(assert (=> d!123937 d!124055))

(declare-fun bm!43708 () Bool)

(declare-fun call!43713 () List!21905)

(declare-fun call!43711 () List!21905)

(assert (=> bm!43708 (= call!43713 call!43711)))

(declare-fun d!124057 () Bool)

(declare-fun e!584588 () Bool)

(assert (=> d!124057 e!584588))

(declare-fun res!690816 () Bool)

(assert (=> d!124057 (=> (not res!690816) (not e!584588))))

(declare-fun lt!456472 () List!21905)

(assert (=> d!124057 (= res!690816 (isStrictlySorted!718 lt!456472))))

(declare-fun e!584589 () List!21905)

(assert (=> d!124057 (= lt!456472 e!584589)))

(declare-fun c!104528 () Bool)

(assert (=> d!124057 (= c!104528 (and ((_ is Cons!21901) (toList!6893 lt!456218)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456218))) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(assert (=> d!124057 (isStrictlySorted!718 (toList!6893 lt!456218))))

(assert (=> d!124057 (= (insertStrictlySorted!372 (toList!6893 lt!456218) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456472)))

(declare-fun b!1034164 () Bool)

(declare-fun e!584591 () List!21905)

(declare-fun call!43712 () List!21905)

(assert (=> b!1034164 (= e!584591 call!43712)))

(declare-fun b!1034165 () Bool)

(declare-fun c!104525 () Bool)

(assert (=> b!1034165 (= c!104525 (and ((_ is Cons!21901) (toList!6893 lt!456218)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456218))) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(declare-fun e!584592 () List!21905)

(assert (=> b!1034165 (= e!584592 e!584591)))

(declare-fun b!1034166 () Bool)

(assert (=> b!1034166 (= e!584589 call!43711)))

(declare-fun bm!43709 () Bool)

(assert (=> bm!43709 (= call!43712 call!43713)))

(declare-fun b!1034167 () Bool)

(assert (=> b!1034167 (= e!584589 e!584592)))

(declare-fun c!104526 () Bool)

(assert (=> b!1034167 (= c!104526 (and ((_ is Cons!21901) (toList!6893 lt!456218)) (= (_1!7874 (h!23103 (toList!6893 lt!456218))) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034168 () Bool)

(declare-fun res!690815 () Bool)

(assert (=> b!1034168 (=> (not res!690815) (not e!584588))))

(assert (=> b!1034168 (= res!690815 (containsKey!563 lt!456472 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034169 () Bool)

(assert (=> b!1034169 (= e!584592 call!43713)))

(declare-fun e!584590 () List!21905)

(declare-fun bm!43710 () Bool)

(assert (=> bm!43710 (= call!43711 ($colon$colon!602 e!584590 (ite c!104528 (h!23103 (toList!6893 lt!456218)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104527 () Bool)

(assert (=> bm!43710 (= c!104527 c!104528)))

(declare-fun b!1034170 () Bool)

(assert (=> b!1034170 (= e!584588 (contains!6013 lt!456472 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034171 () Bool)

(assert (=> b!1034171 (= e!584591 call!43712)))

(declare-fun b!1034172 () Bool)

(assert (=> b!1034172 (= e!584590 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456218)) (_1!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034173 () Bool)

(assert (=> b!1034173 (= e!584590 (ite c!104526 (t!31103 (toList!6893 lt!456218)) (ite c!104525 (Cons!21901 (h!23103 (toList!6893 lt!456218)) (t!31103 (toList!6893 lt!456218))) Nil!21902)))))

(assert (= (and d!124057 c!104528) b!1034166))

(assert (= (and d!124057 (not c!104528)) b!1034167))

(assert (= (and b!1034167 c!104526) b!1034169))

(assert (= (and b!1034167 (not c!104526)) b!1034165))

(assert (= (and b!1034165 c!104525) b!1034171))

(assert (= (and b!1034165 (not c!104525)) b!1034164))

(assert (= (or b!1034171 b!1034164) bm!43709))

(assert (= (or b!1034169 bm!43709) bm!43708))

(assert (= (or b!1034166 bm!43708) bm!43710))

(assert (= (and bm!43710 c!104527) b!1034172))

(assert (= (and bm!43710 (not c!104527)) b!1034173))

(assert (= (and d!124057 res!690816) b!1034168))

(assert (= (and b!1034168 res!690815) b!1034170))

(declare-fun m!954165 () Bool)

(assert (=> d!124057 m!954165))

(declare-fun m!954167 () Bool)

(assert (=> d!124057 m!954167))

(declare-fun m!954169 () Bool)

(assert (=> b!1034168 m!954169))

(declare-fun m!954171 () Bool)

(assert (=> b!1034172 m!954171))

(declare-fun m!954173 () Bool)

(assert (=> b!1034170 m!954173))

(declare-fun m!954175 () Bool)

(assert (=> bm!43710 m!954175))

(assert (=> d!123937 d!124057))

(assert (=> b!1033873 d!123977))

(declare-fun b!1034174 () Bool)

(declare-fun e!584595 () Bool)

(declare-fun call!43714 () Bool)

(assert (=> b!1034174 (= e!584595 call!43714)))

(declare-fun bm!43711 () Bool)

(declare-fun c!104529 () Bool)

(assert (=> bm!43711 (= call!43714 (arrayNoDuplicates!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104529 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104438 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)) (ite c!104438 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) Nil!21904) Nil!21904))))))

(declare-fun b!1034175 () Bool)

(assert (=> b!1034175 (= e!584595 call!43714)))

(declare-fun b!1034176 () Bool)

(declare-fun e!584596 () Bool)

(declare-fun e!584594 () Bool)

(assert (=> b!1034176 (= e!584596 e!584594)))

(declare-fun res!690819 () Bool)

(assert (=> b!1034176 (=> (not res!690819) (not e!584594))))

(declare-fun e!584593 () Bool)

(assert (=> b!1034176 (= res!690819 (not e!584593))))

(declare-fun res!690817 () Bool)

(assert (=> b!1034176 (=> (not res!690817) (not e!584593))))

(assert (=> b!1034176 (= res!690817 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124059 () Bool)

(declare-fun res!690818 () Bool)

(assert (=> d!124059 (=> res!690818 e!584596)))

(assert (=> d!124059 (= res!690818 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!124059 (= (arrayNoDuplicates!0 (_keys!11407 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104438 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)) e!584596)))

(declare-fun b!1034177 () Bool)

(assert (=> b!1034177 (= e!584594 e!584595)))

(assert (=> b!1034177 (= c!104529 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034178 () Bool)

(assert (=> b!1034178 (= e!584593 (contains!6014 (ite c!104438 (Cons!21903 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) Nil!21904) Nil!21904) (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124059 (not res!690818)) b!1034176))

(assert (= (and b!1034176 res!690817) b!1034178))

(assert (= (and b!1034176 res!690819) b!1034177))

(assert (= (and b!1034177 c!104529) b!1034175))

(assert (= (and b!1034177 (not c!104529)) b!1034174))

(assert (= (or b!1034175 b!1034174) bm!43711))

(assert (=> bm!43711 m!953999))

(declare-fun m!954177 () Bool)

(assert (=> bm!43711 m!954177))

(assert (=> b!1034176 m!953999))

(assert (=> b!1034176 m!953999))

(assert (=> b!1034176 m!954013))

(assert (=> b!1034177 m!953999))

(assert (=> b!1034177 m!953999))

(assert (=> b!1034177 m!954013))

(assert (=> b!1034178 m!953999))

(assert (=> b!1034178 m!953999))

(declare-fun m!954179 () Bool)

(assert (=> b!1034178 m!954179))

(assert (=> bm!43689 d!124059))

(declare-fun d!124061 () Bool)

(assert (=> d!124061 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30243 () Bool)

(assert (= bs!30243 d!124061))

(assert (=> bs!30243 m!953777))

(declare-fun m!954181 () Bool)

(assert (=> bs!30243 m!954181))

(assert (=> b!1033903 d!124061))

(declare-fun b!1034182 () Bool)

(declare-fun e!584598 () Option!639)

(assert (=> b!1034182 (= e!584598 None!637)))

(declare-fun b!1034179 () Bool)

(declare-fun e!584597 () Option!639)

(assert (=> b!1034179 (= e!584597 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456206)))))))

(declare-fun b!1034181 () Bool)

(assert (=> b!1034181 (= e!584598 (getValueByKey!588 (t!31103 (toList!6893 lt!456206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124063 () Bool)

(declare-fun c!104530 () Bool)

(assert (=> d!124063 (= c!104530 (and ((_ is Cons!21901) (toList!6893 lt!456206)) (= (_1!7874 (h!23103 (toList!6893 lt!456206))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124063 (= (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000) e!584597)))

(declare-fun b!1034180 () Bool)

(assert (=> b!1034180 (= e!584597 e!584598)))

(declare-fun c!104531 () Bool)

(assert (=> b!1034180 (= c!104531 (and ((_ is Cons!21901) (toList!6893 lt!456206)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456206))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!124063 c!104530) b!1034179))

(assert (= (and d!124063 (not c!104530)) b!1034180))

(assert (= (and b!1034180 c!104531) b!1034181))

(assert (= (and b!1034180 (not c!104531)) b!1034182))

(declare-fun m!954183 () Bool)

(assert (=> b!1034181 m!954183))

(assert (=> b!1033903 d!124063))

(declare-fun b!1034186 () Bool)

(declare-fun e!584600 () Option!639)

(assert (=> b!1034186 (= e!584600 None!637)))

(declare-fun b!1034183 () Bool)

(declare-fun e!584599 () Option!639)

(assert (=> b!1034183 (= e!584599 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456330)))))))

(declare-fun b!1034185 () Bool)

(assert (=> b!1034185 (= e!584600 (getValueByKey!588 (t!31103 (toList!6893 lt!456330)) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun d!124065 () Bool)

(declare-fun c!104532 () Bool)

(assert (=> d!124065 (= c!104532 (and ((_ is Cons!21901) (toList!6893 lt!456330)) (= (_1!7874 (h!23103 (toList!6893 lt!456330))) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (=> d!124065 (= (getValueByKey!588 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123))) e!584599)))

(declare-fun b!1034184 () Bool)

(assert (=> b!1034184 (= e!584599 e!584600)))

(declare-fun c!104533 () Bool)

(assert (=> b!1034184 (= c!104533 (and ((_ is Cons!21901) (toList!6893 lt!456330)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456330))) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))))

(assert (= (and d!124065 c!104532) b!1034183))

(assert (= (and d!124065 (not c!104532)) b!1034184))

(assert (= (and b!1034184 c!104533) b!1034185))

(assert (= (and b!1034184 (not c!104533)) b!1034186))

(declare-fun m!954185 () Bool)

(assert (=> b!1034185 m!954185))

(assert (=> b!1033846 d!124065))

(declare-fun b!1034190 () Bool)

(declare-fun e!584602 () Option!639)

(assert (=> b!1034190 (= e!584602 None!637)))

(declare-fun b!1034187 () Bool)

(declare-fun e!584601 () Option!639)

(assert (=> b!1034187 (= e!584601 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456303)))))))

(declare-fun b!1034189 () Bool)

(assert (=> b!1034189 (= e!584602 (getValueByKey!588 (t!31103 (toList!6893 lt!456303)) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun d!124067 () Bool)

(declare-fun c!104534 () Bool)

(assert (=> d!124067 (= c!104534 (and ((_ is Cons!21901) (toList!6893 lt!456303)) (= (_1!7874 (h!23103 (toList!6893 lt!456303))) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(assert (=> d!124067 (= (getValueByKey!588 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) e!584601)))

(declare-fun b!1034188 () Bool)

(assert (=> b!1034188 (= e!584601 e!584602)))

(declare-fun c!104535 () Bool)

(assert (=> b!1034188 (= c!104535 (and ((_ is Cons!21901) (toList!6893 lt!456303)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456303))) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124067 c!104534) b!1034187))

(assert (= (and d!124067 (not c!104534)) b!1034188))

(assert (= (and b!1034188 c!104535) b!1034189))

(assert (= (and b!1034188 (not c!104535)) b!1034190))

(declare-fun m!954187 () Bool)

(assert (=> b!1034189 m!954187))

(assert (=> b!1033820 d!124067))

(declare-fun d!124069 () Bool)

(declare-fun e!584603 () Bool)

(assert (=> d!124069 e!584603))

(declare-fun res!690820 () Bool)

(assert (=> d!124069 (=> res!690820 e!584603)))

(declare-fun lt!456476 () Bool)

(assert (=> d!124069 (= res!690820 (not lt!456476))))

(declare-fun lt!456474 () Bool)

(assert (=> d!124069 (= lt!456476 lt!456474)))

(declare-fun lt!456473 () Unit!33831)

(declare-fun e!584604 () Unit!33831)

(assert (=> d!124069 (= lt!456473 e!584604)))

(declare-fun c!104536 () Bool)

(assert (=> d!124069 (= c!104536 lt!456474)))

(assert (=> d!124069 (= lt!456474 (containsKey!563 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(assert (=> d!124069 (= (contains!6012 lt!456388 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456476)))

(declare-fun b!1034191 () Bool)

(declare-fun lt!456475 () Unit!33831)

(assert (=> b!1034191 (= e!584604 lt!456475)))

(assert (=> b!1034191 (= lt!456475 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(assert (=> b!1034191 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034192 () Bool)

(declare-fun Unit!33853 () Unit!33831)

(assert (=> b!1034192 (= e!584604 Unit!33853)))

(declare-fun b!1034193 () Bool)

(assert (=> b!1034193 (= e!584603 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456388) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (= (and d!124069 c!104536) b!1034191))

(assert (= (and d!124069 (not c!104536)) b!1034192))

(assert (= (and d!124069 (not res!690820)) b!1034193))

(declare-fun m!954189 () Bool)

(assert (=> d!124069 m!954189))

(declare-fun m!954191 () Bool)

(assert (=> b!1034191 m!954191))

(assert (=> b!1034191 m!953857))

(assert (=> b!1034191 m!953857))

(declare-fun m!954193 () Bool)

(assert (=> b!1034191 m!954193))

(assert (=> b!1034193 m!953857))

(assert (=> b!1034193 m!953857))

(assert (=> b!1034193 m!954193))

(assert (=> d!123925 d!124069))

(declare-fun b!1034197 () Bool)

(declare-fun e!584606 () Option!639)

(assert (=> b!1034197 (= e!584606 None!637)))

(declare-fun b!1034194 () Bool)

(declare-fun e!584605 () Option!639)

(assert (=> b!1034194 (= e!584605 (Some!638 (_2!7874 (h!23103 lt!456391))))))

(declare-fun b!1034196 () Bool)

(assert (=> b!1034196 (= e!584606 (getValueByKey!588 (t!31103 lt!456391) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun d!124071 () Bool)

(declare-fun c!104537 () Bool)

(assert (=> d!124071 (= c!104537 (and ((_ is Cons!21901) lt!456391) (= (_1!7874 (h!23103 lt!456391)) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124071 (= (getValueByKey!588 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) e!584605)))

(declare-fun b!1034195 () Bool)

(assert (=> b!1034195 (= e!584605 e!584606)))

(declare-fun c!104538 () Bool)

(assert (=> b!1034195 (= c!104538 (and ((_ is Cons!21901) lt!456391) (not (= (_1!7874 (h!23103 lt!456391)) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))))

(assert (= (and d!124071 c!104537) b!1034194))

(assert (= (and d!124071 (not c!104537)) b!1034195))

(assert (= (and b!1034195 c!104538) b!1034196))

(assert (= (and b!1034195 (not c!104538)) b!1034197))

(declare-fun m!954195 () Bool)

(assert (=> b!1034196 m!954195))

(assert (=> d!123925 d!124071))

(declare-fun d!124073 () Bool)

(assert (=> d!124073 (= (getValueByKey!588 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun lt!456477 () Unit!33831)

(assert (=> d!124073 (= lt!456477 (choose!1700 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun e!584607 () Bool)

(assert (=> d!124073 e!584607))

(declare-fun res!690821 () Bool)

(assert (=> d!124073 (=> (not res!690821) (not e!584607))))

(assert (=> d!124073 (= res!690821 (isStrictlySorted!718 lt!456391))))

(assert (=> d!124073 (= (lemmaContainsTupThenGetReturnValue!279 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456477)))

(declare-fun b!1034198 () Bool)

(declare-fun res!690822 () Bool)

(assert (=> b!1034198 (=> (not res!690822) (not e!584607))))

(assert (=> b!1034198 (= res!690822 (containsKey!563 lt!456391 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034199 () Bool)

(assert (=> b!1034199 (= e!584607 (contains!6013 lt!456391 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (= (and d!124073 res!690821) b!1034198))

(assert (= (and b!1034198 res!690822) b!1034199))

(assert (=> d!124073 m!953851))

(declare-fun m!954197 () Bool)

(assert (=> d!124073 m!954197))

(declare-fun m!954199 () Bool)

(assert (=> d!124073 m!954199))

(declare-fun m!954201 () Bool)

(assert (=> b!1034198 m!954201))

(declare-fun m!954203 () Bool)

(assert (=> b!1034199 m!954203))

(assert (=> d!123925 d!124073))

(declare-fun bm!43712 () Bool)

(declare-fun call!43717 () List!21905)

(declare-fun call!43715 () List!21905)

(assert (=> bm!43712 (= call!43717 call!43715)))

(declare-fun d!124075 () Bool)

(declare-fun e!584608 () Bool)

(assert (=> d!124075 e!584608))

(declare-fun res!690824 () Bool)

(assert (=> d!124075 (=> (not res!690824) (not e!584608))))

(declare-fun lt!456478 () List!21905)

(assert (=> d!124075 (= res!690824 (isStrictlySorted!718 lt!456478))))

(declare-fun e!584609 () List!21905)

(assert (=> d!124075 (= lt!456478 e!584609)))

(declare-fun c!104542 () Bool)

(assert (=> d!124075 (= c!104542 (and ((_ is Cons!21901) (toList!6893 lt!456228)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456228))) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124075 (isStrictlySorted!718 (toList!6893 lt!456228))))

(assert (=> d!124075 (= (insertStrictlySorted!372 (toList!6893 lt!456228) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456478)))

(declare-fun b!1034200 () Bool)

(declare-fun e!584611 () List!21905)

(declare-fun call!43716 () List!21905)

(assert (=> b!1034200 (= e!584611 call!43716)))

(declare-fun b!1034201 () Bool)

(declare-fun c!104539 () Bool)

(assert (=> b!1034201 (= c!104539 (and ((_ is Cons!21901) (toList!6893 lt!456228)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456228))) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(declare-fun e!584612 () List!21905)

(assert (=> b!1034201 (= e!584612 e!584611)))

(declare-fun b!1034202 () Bool)

(assert (=> b!1034202 (= e!584609 call!43715)))

(declare-fun bm!43713 () Bool)

(assert (=> bm!43713 (= call!43716 call!43717)))

(declare-fun b!1034203 () Bool)

(assert (=> b!1034203 (= e!584609 e!584612)))

(declare-fun c!104540 () Bool)

(assert (=> b!1034203 (= c!104540 (and ((_ is Cons!21901) (toList!6893 lt!456228)) (= (_1!7874 (h!23103 (toList!6893 lt!456228))) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1034204 () Bool)

(declare-fun res!690823 () Bool)

(assert (=> b!1034204 (=> (not res!690823) (not e!584608))))

(assert (=> b!1034204 (= res!690823 (containsKey!563 lt!456478 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034205 () Bool)

(assert (=> b!1034205 (= e!584612 call!43717)))

(declare-fun e!584610 () List!21905)

(declare-fun bm!43714 () Bool)

(assert (=> bm!43714 (= call!43715 ($colon$colon!602 e!584610 (ite c!104542 (h!23103 (toList!6893 lt!456228)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))))

(declare-fun c!104541 () Bool)

(assert (=> bm!43714 (= c!104541 c!104542)))

(declare-fun b!1034206 () Bool)

(assert (=> b!1034206 (= e!584608 (contains!6013 lt!456478 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(declare-fun b!1034207 () Bool)

(assert (=> b!1034207 (= e!584611 call!43716)))

(declare-fun b!1034208 () Bool)

(assert (=> b!1034208 (= e!584610 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456228)) (_1!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))))

(declare-fun b!1034209 () Bool)

(assert (=> b!1034209 (= e!584610 (ite c!104540 (t!31103 (toList!6893 lt!456228)) (ite c!104539 (Cons!21901 (h!23103 (toList!6893 lt!456228)) (t!31103 (toList!6893 lt!456228))) Nil!21902)))))

(assert (= (and d!124075 c!104542) b!1034202))

(assert (= (and d!124075 (not c!104542)) b!1034203))

(assert (= (and b!1034203 c!104540) b!1034205))

(assert (= (and b!1034203 (not c!104540)) b!1034201))

(assert (= (and b!1034201 c!104539) b!1034207))

(assert (= (and b!1034201 (not c!104539)) b!1034200))

(assert (= (or b!1034207 b!1034200) bm!43713))

(assert (= (or b!1034205 bm!43713) bm!43712))

(assert (= (or b!1034202 bm!43712) bm!43714))

(assert (= (and bm!43714 c!104541) b!1034208))

(assert (= (and bm!43714 (not c!104541)) b!1034209))

(assert (= (and d!124075 res!690824) b!1034204))

(assert (= (and b!1034204 res!690823) b!1034206))

(declare-fun m!954205 () Bool)

(assert (=> d!124075 m!954205))

(declare-fun m!954207 () Bool)

(assert (=> d!124075 m!954207))

(declare-fun m!954209 () Bool)

(assert (=> b!1034204 m!954209))

(declare-fun m!954211 () Bool)

(assert (=> b!1034208 m!954211))

(declare-fun m!954213 () Bool)

(assert (=> b!1034206 m!954213))

(declare-fun m!954215 () Bool)

(assert (=> bm!43714 m!954215))

(assert (=> d!123925 d!124075))

(assert (=> d!123871 d!123855))

(declare-fun d!124077 () Bool)

(assert (=> d!124077 (= (apply!906 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)) lt!456195) (apply!906 lt!456182 lt!456195))))

(assert (=> d!124077 true))

(declare-fun _$34!1165 () Unit!33831)

(assert (=> d!124077 (= (choose!1697 lt!456182 lt!456200 lt!456123 lt!456195) _$34!1165)))

(declare-fun bs!30244 () Bool)

(assert (= bs!30244 d!124077))

(assert (=> bs!30244 m!953375))

(assert (=> bs!30244 m!953375))

(assert (=> bs!30244 m!953377))

(assert (=> bs!30244 m!953391))

(assert (=> d!123871 d!124077))

(assert (=> d!123871 d!123863))

(assert (=> d!123871 d!123879))

(declare-fun d!124079 () Bool)

(declare-fun e!584613 () Bool)

(assert (=> d!124079 e!584613))

(declare-fun res!690825 () Bool)

(assert (=> d!124079 (=> res!690825 e!584613)))

(declare-fun lt!456482 () Bool)

(assert (=> d!124079 (= res!690825 (not lt!456482))))

(declare-fun lt!456480 () Bool)

(assert (=> d!124079 (= lt!456482 lt!456480)))

(declare-fun lt!456479 () Unit!33831)

(declare-fun e!584614 () Unit!33831)

(assert (=> d!124079 (= lt!456479 e!584614)))

(declare-fun c!104543 () Bool)

(assert (=> d!124079 (= c!104543 lt!456480)))

(assert (=> d!124079 (= lt!456480 (containsKey!563 (toList!6893 lt!456182) lt!456195))))

(assert (=> d!124079 (= (contains!6012 lt!456182 lt!456195) lt!456482)))

(declare-fun b!1034210 () Bool)

(declare-fun lt!456481 () Unit!33831)

(assert (=> b!1034210 (= e!584614 lt!456481)))

(assert (=> b!1034210 (= lt!456481 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456182) lt!456195))))

(assert (=> b!1034210 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456182) lt!456195))))

(declare-fun b!1034211 () Bool)

(declare-fun Unit!33854 () Unit!33831)

(assert (=> b!1034211 (= e!584614 Unit!33854)))

(declare-fun b!1034212 () Bool)

(assert (=> b!1034212 (= e!584613 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456182) lt!456195)))))

(assert (= (and d!124079 c!104543) b!1034210))

(assert (= (and d!124079 (not c!104543)) b!1034211))

(assert (= (and d!124079 (not res!690825)) b!1034212))

(declare-fun m!954217 () Bool)

(assert (=> d!124079 m!954217))

(declare-fun m!954219 () Bool)

(assert (=> b!1034210 m!954219))

(assert (=> b!1034210 m!953635))

(assert (=> b!1034210 m!953635))

(declare-fun m!954221 () Bool)

(assert (=> b!1034210 m!954221))

(assert (=> b!1034212 m!953635))

(assert (=> b!1034212 m!953635))

(assert (=> b!1034212 m!954221))

(assert (=> d!123871 d!124079))

(declare-fun d!124081 () Bool)

(declare-fun e!584615 () Bool)

(assert (=> d!124081 e!584615))

(declare-fun res!690826 () Bool)

(assert (=> d!124081 (=> (not res!690826) (not e!584615))))

(declare-fun lt!456483 () ListLongMap!13755)

(assert (=> d!124081 (= res!690826 (contains!6012 lt!456483 (_1!7874 (tuple2!15727 lt!456293 lt!456296))))))

(declare-fun lt!456486 () List!21905)

(assert (=> d!124081 (= lt!456483 (ListLongMap!13756 lt!456486))))

(declare-fun lt!456485 () Unit!33831)

(declare-fun lt!456484 () Unit!33831)

(assert (=> d!124081 (= lt!456485 lt!456484)))

(assert (=> d!124081 (= (getValueByKey!588 lt!456486 (_1!7874 (tuple2!15727 lt!456293 lt!456296))) (Some!638 (_2!7874 (tuple2!15727 lt!456293 lt!456296))))))

(assert (=> d!124081 (= lt!456484 (lemmaContainsTupThenGetReturnValue!279 lt!456486 (_1!7874 (tuple2!15727 lt!456293 lt!456296)) (_2!7874 (tuple2!15727 lt!456293 lt!456296))))))

(assert (=> d!124081 (= lt!456486 (insertStrictlySorted!372 (toList!6893 lt!456295) (_1!7874 (tuple2!15727 lt!456293 lt!456296)) (_2!7874 (tuple2!15727 lt!456293 lt!456296))))))

(assert (=> d!124081 (= (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296)) lt!456483)))

(declare-fun b!1034213 () Bool)

(declare-fun res!690827 () Bool)

(assert (=> b!1034213 (=> (not res!690827) (not e!584615))))

(assert (=> b!1034213 (= res!690827 (= (getValueByKey!588 (toList!6893 lt!456483) (_1!7874 (tuple2!15727 lt!456293 lt!456296))) (Some!638 (_2!7874 (tuple2!15727 lt!456293 lt!456296)))))))

(declare-fun b!1034214 () Bool)

(assert (=> b!1034214 (= e!584615 (contains!6013 (toList!6893 lt!456483) (tuple2!15727 lt!456293 lt!456296)))))

(assert (= (and d!124081 res!690826) b!1034213))

(assert (= (and b!1034213 res!690827) b!1034214))

(declare-fun m!954223 () Bool)

(assert (=> d!124081 m!954223))

(declare-fun m!954225 () Bool)

(assert (=> d!124081 m!954225))

(declare-fun m!954227 () Bool)

(assert (=> d!124081 m!954227))

(declare-fun m!954229 () Bool)

(assert (=> d!124081 m!954229))

(declare-fun m!954231 () Bool)

(assert (=> b!1034213 m!954231))

(declare-fun m!954233 () Bool)

(assert (=> b!1034214 m!954233))

(assert (=> b!1033811 d!124081))

(declare-fun d!124083 () Bool)

(declare-fun e!584616 () Bool)

(assert (=> d!124083 e!584616))

(declare-fun res!690828 () Bool)

(assert (=> d!124083 (=> res!690828 e!584616)))

(declare-fun lt!456490 () Bool)

(assert (=> d!124083 (= res!690828 (not lt!456490))))

(declare-fun lt!456488 () Bool)

(assert (=> d!124083 (= lt!456490 lt!456488)))

(declare-fun lt!456487 () Unit!33831)

(declare-fun e!584617 () Unit!33831)

(assert (=> d!124083 (= lt!456487 e!584617)))

(declare-fun c!104544 () Bool)

(assert (=> d!124083 (= c!104544 lt!456488)))

(assert (=> d!124083 (= lt!456488 (containsKey!563 (toList!6893 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296))) lt!456297))))

(assert (=> d!124083 (= (contains!6012 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296)) lt!456297) lt!456490)))

(declare-fun b!1034215 () Bool)

(declare-fun lt!456489 () Unit!33831)

(assert (=> b!1034215 (= e!584617 lt!456489)))

(assert (=> b!1034215 (= lt!456489 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296))) lt!456297))))

(assert (=> b!1034215 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296))) lt!456297))))

(declare-fun b!1034216 () Bool)

(declare-fun Unit!33855 () Unit!33831)

(assert (=> b!1034216 (= e!584617 Unit!33855)))

(declare-fun b!1034217 () Bool)

(assert (=> b!1034217 (= e!584616 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296))) lt!456297)))))

(assert (= (and d!124083 c!104544) b!1034215))

(assert (= (and d!124083 (not c!104544)) b!1034216))

(assert (= (and d!124083 (not res!690828)) b!1034217))

(declare-fun m!954235 () Bool)

(assert (=> d!124083 m!954235))

(declare-fun m!954237 () Bool)

(assert (=> b!1034215 m!954237))

(declare-fun m!954239 () Bool)

(assert (=> b!1034215 m!954239))

(assert (=> b!1034215 m!954239))

(declare-fun m!954241 () Bool)

(assert (=> b!1034215 m!954241))

(assert (=> b!1034217 m!954239))

(assert (=> b!1034217 m!954239))

(assert (=> b!1034217 m!954241))

(assert (=> b!1033811 d!124083))

(declare-fun d!124085 () Bool)

(assert (=> d!124085 (not (contains!6012 (+!3104 lt!456295 (tuple2!15727 lt!456293 lt!456296)) lt!456297))))

(declare-fun lt!456493 () Unit!33831)

(declare-fun choose!1701 (ListLongMap!13755 (_ BitVec 64) V!37565 (_ BitVec 64)) Unit!33831)

(assert (=> d!124085 (= lt!456493 (choose!1701 lt!456295 lt!456293 lt!456296 lt!456297))))

(declare-fun e!584620 () Bool)

(assert (=> d!124085 e!584620))

(declare-fun res!690831 () Bool)

(assert (=> d!124085 (=> (not res!690831) (not e!584620))))

(assert (=> d!124085 (= res!690831 (not (contains!6012 lt!456295 lt!456297)))))

(assert (=> d!124085 (= (addStillNotContains!242 lt!456295 lt!456293 lt!456296 lt!456297) lt!456493)))

(declare-fun b!1034221 () Bool)

(assert (=> b!1034221 (= e!584620 (not (= lt!456293 lt!456297)))))

(assert (= (and d!124085 res!690831) b!1034221))

(assert (=> d!124085 m!953555))

(assert (=> d!124085 m!953555))

(assert (=> d!124085 m!953557))

(declare-fun m!954243 () Bool)

(assert (=> d!124085 m!954243))

(declare-fun m!954245 () Bool)

(assert (=> d!124085 m!954245))

(assert (=> b!1033811 d!124085))

(assert (=> b!1033811 d!123847))

(declare-fun d!124087 () Bool)

(declare-fun e!584621 () Bool)

(assert (=> d!124087 e!584621))

(declare-fun res!690832 () Bool)

(assert (=> d!124087 (=> (not res!690832) (not e!584621))))

(declare-fun lt!456494 () ListLongMap!13755)

(assert (=> d!124087 (= res!690832 (contains!6012 lt!456494 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456497 () List!21905)

(assert (=> d!124087 (= lt!456494 (ListLongMap!13756 lt!456497))))

(declare-fun lt!456496 () Unit!33831)

(declare-fun lt!456495 () Unit!33831)

(assert (=> d!124087 (= lt!456496 lt!456495)))

(assert (=> d!124087 (= (getValueByKey!588 lt!456497 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!638 (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124087 (= lt!456495 (lemmaContainsTupThenGetReturnValue!279 lt!456497 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124087 (= lt!456497 (insertStrictlySorted!372 (toList!6893 call!43681) (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124087 (= (+!3104 call!43681 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456494)))

(declare-fun b!1034222 () Bool)

(declare-fun res!690833 () Bool)

(assert (=> b!1034222 (=> (not res!690833) (not e!584621))))

(assert (=> b!1034222 (= res!690833 (= (getValueByKey!588 (toList!6893 lt!456494) (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!638 (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1034223 () Bool)

(assert (=> b!1034223 (= e!584621 (contains!6013 (toList!6893 lt!456494) (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124087 res!690832) b!1034222))

(assert (= (and b!1034222 res!690833) b!1034223))

(declare-fun m!954247 () Bool)

(assert (=> d!124087 m!954247))

(declare-fun m!954249 () Bool)

(assert (=> d!124087 m!954249))

(declare-fun m!954251 () Bool)

(assert (=> d!124087 m!954251))

(declare-fun m!954253 () Bool)

(assert (=> d!124087 m!954253))

(declare-fun m!954255 () Bool)

(assert (=> b!1034222 m!954255))

(declare-fun m!954257 () Bool)

(assert (=> b!1034223 m!954257))

(assert (=> b!1033811 d!124087))

(declare-fun d!124089 () Bool)

(declare-fun lt!456498 () Bool)

(assert (=> d!124089 (= lt!456498 (select (content!512 Nil!21904) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun e!584622 () Bool)

(assert (=> d!124089 (= lt!456498 e!584622)))

(declare-fun res!690835 () Bool)

(assert (=> d!124089 (=> (not res!690835) (not e!584622))))

(assert (=> d!124089 (= res!690835 ((_ is Cons!21903) Nil!21904))))

(assert (=> d!124089 (= (contains!6014 Nil!21904 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) lt!456498)))

(declare-fun b!1034224 () Bool)

(declare-fun e!584623 () Bool)

(assert (=> b!1034224 (= e!584622 e!584623)))

(declare-fun res!690834 () Bool)

(assert (=> b!1034224 (=> res!690834 e!584623)))

(assert (=> b!1034224 (= res!690834 (= (h!23105 Nil!21904) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1034225 () Bool)

(assert (=> b!1034225 (= e!584623 (contains!6014 (t!31107 Nil!21904) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(assert (= (and d!124089 res!690835) b!1034224))

(assert (= (and b!1034224 (not res!690834)) b!1034225))

(assert (=> d!124089 m!954079))

(assert (=> d!124089 m!953485))

(declare-fun m!954259 () Bool)

(assert (=> d!124089 m!954259))

(assert (=> b!1034225 m!953485))

(declare-fun m!954261 () Bool)

(assert (=> b!1034225 m!954261))

(assert (=> b!1033957 d!124089))

(declare-fun d!124091 () Bool)

(assert (=> d!124091 (= (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))))

(declare-fun bs!30245 () Bool)

(assert (= bs!30245 d!124091))

(assert (=> bs!30245 m!953667))

(declare-fun m!954263 () Bool)

(assert (=> bs!30245 m!954263))

(assert (=> b!1033845 d!124091))

(declare-fun b!1034229 () Bool)

(declare-fun e!584625 () Option!639)

(assert (=> b!1034229 (= e!584625 None!637)))

(declare-fun b!1034226 () Bool)

(declare-fun e!584624 () Option!639)

(assert (=> b!1034226 (= e!584624 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))))))))

(declare-fun b!1034228 () Bool)

(assert (=> b!1034228 (= e!584625 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) lt!456188))))

(declare-fun c!104545 () Bool)

(declare-fun d!124093 () Bool)

(assert (=> d!124093 (= c!104545 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) lt!456188)))))

(assert (=> d!124093 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188) e!584624)))

(declare-fun b!1034227 () Bool)

(assert (=> b!1034227 (= e!584624 e!584625)))

(declare-fun c!104546 () Bool)

(assert (=> b!1034227 (= c!104546 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) lt!456188))))))

(assert (= (and d!124093 c!104545) b!1034226))

(assert (= (and d!124093 (not c!104545)) b!1034227))

(assert (= (and b!1034227 c!104546) b!1034228))

(assert (= (and b!1034227 (not c!104546)) b!1034229))

(declare-fun m!954265 () Bool)

(assert (=> b!1034228 m!954265))

(assert (=> b!1033845 d!124093))

(declare-fun d!124095 () Bool)

(declare-fun isEmpty!928 (List!21905) Bool)

(assert (=> d!124095 (= (isEmpty!926 lt!456320) (isEmpty!928 (toList!6893 lt!456320)))))

(declare-fun bs!30246 () Bool)

(assert (= bs!30246 d!124095))

(declare-fun m!954267 () Bool)

(assert (=> bs!30246 m!954267))

(assert (=> b!1033839 d!124095))

(declare-fun d!124097 () Bool)

(declare-fun e!584626 () Bool)

(assert (=> d!124097 e!584626))

(declare-fun res!690836 () Bool)

(assert (=> d!124097 (=> res!690836 e!584626)))

(declare-fun lt!456502 () Bool)

(assert (=> d!124097 (= res!690836 (not lt!456502))))

(declare-fun lt!456500 () Bool)

(assert (=> d!124097 (= lt!456502 lt!456500)))

(declare-fun lt!456499 () Unit!33831)

(declare-fun e!584627 () Unit!33831)

(assert (=> d!124097 (= lt!456499 e!584627)))

(declare-fun c!104547 () Bool)

(assert (=> d!124097 (= c!104547 lt!456500)))

(assert (=> d!124097 (= lt!456500 (containsKey!563 (toList!6893 lt!456320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124097 (= (contains!6012 lt!456320 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456502)))

(declare-fun b!1034230 () Bool)

(declare-fun lt!456501 () Unit!33831)

(assert (=> b!1034230 (= e!584627 lt!456501)))

(assert (=> b!1034230 (= lt!456501 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034230 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034231 () Bool)

(declare-fun Unit!33856 () Unit!33831)

(assert (=> b!1034231 (= e!584627 Unit!33856)))

(declare-fun b!1034232 () Bool)

(assert (=> b!1034232 (= e!584626 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124097 c!104547) b!1034230))

(assert (= (and d!124097 (not c!104547)) b!1034231))

(assert (= (and d!124097 (not res!690836)) b!1034232))

(declare-fun m!954269 () Bool)

(assert (=> d!124097 m!954269))

(declare-fun m!954271 () Bool)

(assert (=> b!1034230 m!954271))

(declare-fun m!954273 () Bool)

(assert (=> b!1034230 m!954273))

(assert (=> b!1034230 m!954273))

(declare-fun m!954275 () Bool)

(assert (=> b!1034230 m!954275))

(assert (=> b!1034232 m!954273))

(assert (=> b!1034232 m!954273))

(assert (=> b!1034232 m!954275))

(assert (=> b!1033835 d!124097))

(assert (=> d!123857 d!123853))

(declare-fun d!124099 () Bool)

(assert (=> d!124099 (= (apply!906 (+!3104 lt!456193 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456187) (apply!906 lt!456193 lt!456187))))

(assert (=> d!124099 true))

(declare-fun _$34!1166 () Unit!33831)

(assert (=> d!124099 (= (choose!1697 lt!456193 lt!456202 (minValue!6063 thiss!1427) lt!456187) _$34!1166)))

(declare-fun bs!30247 () Bool)

(assert (= bs!30247 d!124099))

(assert (=> bs!30247 m!953381))

(assert (=> bs!30247 m!953381))

(assert (=> bs!30247 m!953383))

(assert (=> bs!30247 m!953393))

(assert (=> d!123857 d!124099))

(assert (=> d!123857 d!123867))

(declare-fun d!124101 () Bool)

(declare-fun e!584628 () Bool)

(assert (=> d!124101 e!584628))

(declare-fun res!690837 () Bool)

(assert (=> d!124101 (=> res!690837 e!584628)))

(declare-fun lt!456506 () Bool)

(assert (=> d!124101 (= res!690837 (not lt!456506))))

(declare-fun lt!456504 () Bool)

(assert (=> d!124101 (= lt!456506 lt!456504)))

(declare-fun lt!456503 () Unit!33831)

(declare-fun e!584629 () Unit!33831)

(assert (=> d!124101 (= lt!456503 e!584629)))

(declare-fun c!104548 () Bool)

(assert (=> d!124101 (= c!104548 lt!456504)))

(assert (=> d!124101 (= lt!456504 (containsKey!563 (toList!6893 lt!456193) lt!456187))))

(assert (=> d!124101 (= (contains!6012 lt!456193 lt!456187) lt!456506)))

(declare-fun b!1034233 () Bool)

(declare-fun lt!456505 () Unit!33831)

(assert (=> b!1034233 (= e!584629 lt!456505)))

(assert (=> b!1034233 (= lt!456505 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456193) lt!456187))))

(assert (=> b!1034233 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456193) lt!456187))))

(declare-fun b!1034234 () Bool)

(declare-fun Unit!33857 () Unit!33831)

(assert (=> b!1034234 (= e!584629 Unit!33857)))

(declare-fun b!1034235 () Bool)

(assert (=> b!1034235 (= e!584628 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456193) lt!456187)))))

(assert (= (and d!124101 c!104548) b!1034233))

(assert (= (and d!124101 (not c!104548)) b!1034234))

(assert (= (and d!124101 (not res!690837)) b!1034235))

(declare-fun m!954277 () Bool)

(assert (=> d!124101 m!954277))

(declare-fun m!954279 () Bool)

(assert (=> b!1034233 m!954279))

(assert (=> b!1034233 m!953643))

(assert (=> b!1034233 m!953643))

(declare-fun m!954281 () Bool)

(assert (=> b!1034233 m!954281))

(assert (=> b!1034235 m!953643))

(assert (=> b!1034235 m!953643))

(assert (=> b!1034235 m!954281))

(assert (=> d!123857 d!124101))

(assert (=> d!123857 d!123859))

(declare-fun d!124103 () Bool)

(assert (=> d!124103 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) (v!14889 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123915 d!124103))

(declare-fun b!1034239 () Bool)

(declare-fun e!584631 () Option!639)

(assert (=> b!1034239 (= e!584631 None!637)))

(declare-fun b!1034236 () Bool)

(declare-fun e!584630 () Option!639)

(assert (=> b!1034236 (= e!584630 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456221)))))))

(declare-fun b!1034238 () Bool)

(assert (=> b!1034238 (= e!584631 (getValueByKey!588 (t!31103 (toList!6893 lt!456221)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun d!124105 () Bool)

(declare-fun c!104549 () Bool)

(assert (=> d!124105 (= c!104549 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124105 (= (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) e!584630)))

(declare-fun b!1034237 () Bool)

(assert (=> b!1034237 (= e!584630 e!584631)))

(declare-fun c!104550 () Bool)

(assert (=> b!1034237 (= c!104550 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456221))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))))

(assert (= (and d!124105 c!104549) b!1034236))

(assert (= (and d!124105 (not c!104549)) b!1034237))

(assert (= (and b!1034237 c!104550) b!1034238))

(assert (= (and b!1034237 (not c!104550)) b!1034239))

(assert (=> b!1034238 m!953361))

(declare-fun m!954283 () Bool)

(assert (=> b!1034238 m!954283))

(assert (=> d!123915 d!124105))

(declare-fun d!124107 () Bool)

(assert (=> d!124107 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30248 () Bool)

(assert (= bs!30248 d!124107))

(assert (=> bs!30248 m!953759))

(declare-fun m!954285 () Bool)

(assert (=> bs!30248 m!954285))

(assert (=> b!1033885 d!124107))

(assert (=> b!1033885 d!123987))

(declare-fun d!124109 () Bool)

(declare-fun e!584632 () Bool)

(assert (=> d!124109 e!584632))

(declare-fun res!690838 () Bool)

(assert (=> d!124109 (=> res!690838 e!584632)))

(declare-fun lt!456510 () Bool)

(assert (=> d!124109 (= res!690838 (not lt!456510))))

(declare-fun lt!456508 () Bool)

(assert (=> d!124109 (= lt!456510 lt!456508)))

(declare-fun lt!456507 () Unit!33831)

(declare-fun e!584633 () Unit!33831)

(assert (=> d!124109 (= lt!456507 e!584633)))

(declare-fun c!104551 () Bool)

(assert (=> d!124109 (= c!104551 lt!456508)))

(assert (=> d!124109 (= lt!456508 (containsKey!563 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(assert (=> d!124109 (= (contains!6012 lt!456330 (_1!7874 (tuple2!15727 lt!456189 lt!456123))) lt!456510)))

(declare-fun b!1034240 () Bool)

(declare-fun lt!456509 () Unit!33831)

(assert (=> b!1034240 (= e!584633 lt!456509)))

(assert (=> b!1034240 (= lt!456509 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(assert (=> b!1034240 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun b!1034241 () Bool)

(declare-fun Unit!33858 () Unit!33831)

(assert (=> b!1034241 (= e!584633 Unit!33858)))

(declare-fun b!1034242 () Bool)

(assert (=> b!1034242 (= e!584632 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456330) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (= (and d!124109 c!104551) b!1034240))

(assert (= (and d!124109 (not c!104551)) b!1034241))

(assert (= (and d!124109 (not res!690838)) b!1034242))

(declare-fun m!954287 () Bool)

(assert (=> d!124109 m!954287))

(declare-fun m!954289 () Bool)

(assert (=> b!1034240 m!954289))

(assert (=> b!1034240 m!953683))

(assert (=> b!1034240 m!953683))

(declare-fun m!954291 () Bool)

(assert (=> b!1034240 m!954291))

(assert (=> b!1034242 m!953683))

(assert (=> b!1034242 m!953683))

(assert (=> b!1034242 m!954291))

(assert (=> d!123881 d!124109))

(declare-fun b!1034246 () Bool)

(declare-fun e!584635 () Option!639)

(assert (=> b!1034246 (= e!584635 None!637)))

(declare-fun b!1034243 () Bool)

(declare-fun e!584634 () Option!639)

(assert (=> b!1034243 (= e!584634 (Some!638 (_2!7874 (h!23103 lt!456333))))))

(declare-fun b!1034245 () Bool)

(assert (=> b!1034245 (= e!584635 (getValueByKey!588 (t!31103 lt!456333) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun c!104552 () Bool)

(declare-fun d!124111 () Bool)

(assert (=> d!124111 (= c!104552 (and ((_ is Cons!21901) lt!456333) (= (_1!7874 (h!23103 lt!456333)) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (=> d!124111 (= (getValueByKey!588 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123))) e!584634)))

(declare-fun b!1034244 () Bool)

(assert (=> b!1034244 (= e!584634 e!584635)))

(declare-fun c!104553 () Bool)

(assert (=> b!1034244 (= c!104553 (and ((_ is Cons!21901) lt!456333) (not (= (_1!7874 (h!23103 lt!456333)) (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))))

(assert (= (and d!124111 c!104552) b!1034243))

(assert (= (and d!124111 (not c!104552)) b!1034244))

(assert (= (and b!1034244 c!104553) b!1034245))

(assert (= (and b!1034244 (not c!104553)) b!1034246))

(declare-fun m!954293 () Bool)

(assert (=> b!1034245 m!954293))

(assert (=> d!123881 d!124111))

(declare-fun d!124113 () Bool)

(assert (=> d!124113 (= (getValueByKey!588 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun lt!456511 () Unit!33831)

(assert (=> d!124113 (= lt!456511 (choose!1700 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun e!584636 () Bool)

(assert (=> d!124113 e!584636))

(declare-fun res!690839 () Bool)

(assert (=> d!124113 (=> (not res!690839) (not e!584636))))

(assert (=> d!124113 (= res!690839 (isStrictlySorted!718 lt!456333))))

(assert (=> d!124113 (= (lemmaContainsTupThenGetReturnValue!279 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))) lt!456511)))

(declare-fun b!1034247 () Bool)

(declare-fun res!690840 () Bool)

(assert (=> b!1034247 (=> (not res!690840) (not e!584636))))

(assert (=> b!1034247 (= res!690840 (containsKey!563 lt!456333 (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun b!1034248 () Bool)

(assert (=> b!1034248 (= e!584636 (contains!6013 lt!456333 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (= (and d!124113 res!690839) b!1034247))

(assert (= (and b!1034247 res!690840) b!1034248))

(assert (=> d!124113 m!953677))

(declare-fun m!954295 () Bool)

(assert (=> d!124113 m!954295))

(declare-fun m!954297 () Bool)

(assert (=> d!124113 m!954297))

(declare-fun m!954299 () Bool)

(assert (=> b!1034247 m!954299))

(declare-fun m!954301 () Bool)

(assert (=> b!1034248 m!954301))

(assert (=> d!123881 d!124113))

(declare-fun bm!43715 () Bool)

(declare-fun call!43720 () List!21905)

(declare-fun call!43718 () List!21905)

(assert (=> bm!43715 (= call!43720 call!43718)))

(declare-fun d!124115 () Bool)

(declare-fun e!584637 () Bool)

(assert (=> d!124115 e!584637))

(declare-fun res!690842 () Bool)

(assert (=> d!124115 (=> (not res!690842) (not e!584637))))

(declare-fun lt!456512 () List!21905)

(assert (=> d!124115 (= res!690842 (isStrictlySorted!718 lt!456512))))

(declare-fun e!584638 () List!21905)

(assert (=> d!124115 (= lt!456512 e!584638)))

(declare-fun c!104557 () Bool)

(assert (=> d!124115 (= c!104557 (and ((_ is Cons!21901) (toList!6893 lt!456203)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456203))) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (=> d!124115 (isStrictlySorted!718 (toList!6893 lt!456203))))

(assert (=> d!124115 (= (insertStrictlySorted!372 (toList!6893 lt!456203) (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))) lt!456512)))

(declare-fun b!1034249 () Bool)

(declare-fun e!584640 () List!21905)

(declare-fun call!43719 () List!21905)

(assert (=> b!1034249 (= e!584640 call!43719)))

(declare-fun b!1034250 () Bool)

(declare-fun c!104554 () Bool)

(assert (=> b!1034250 (= c!104554 (and ((_ is Cons!21901) (toList!6893 lt!456203)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456203))) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(declare-fun e!584641 () List!21905)

(assert (=> b!1034250 (= e!584641 e!584640)))

(declare-fun b!1034251 () Bool)

(assert (=> b!1034251 (= e!584638 call!43718)))

(declare-fun bm!43716 () Bool)

(assert (=> bm!43716 (= call!43719 call!43720)))

(declare-fun b!1034252 () Bool)

(assert (=> b!1034252 (= e!584638 e!584641)))

(declare-fun c!104555 () Bool)

(assert (=> b!1034252 (= c!104555 (and ((_ is Cons!21901) (toList!6893 lt!456203)) (= (_1!7874 (h!23103 (toList!6893 lt!456203))) (_1!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(declare-fun b!1034253 () Bool)

(declare-fun res!690841 () Bool)

(assert (=> b!1034253 (=> (not res!690841) (not e!584637))))

(assert (=> b!1034253 (= res!690841 (containsKey!563 lt!456512 (_1!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun b!1034254 () Bool)

(assert (=> b!1034254 (= e!584641 call!43720)))

(declare-fun e!584639 () List!21905)

(declare-fun bm!43717 () Bool)

(assert (=> bm!43717 (= call!43718 ($colon$colon!602 e!584639 (ite c!104557 (h!23103 (toList!6893 lt!456203)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))))

(declare-fun c!104556 () Bool)

(assert (=> bm!43717 (= c!104556 c!104557)))

(declare-fun b!1034255 () Bool)

(assert (=> b!1034255 (= e!584637 (contains!6013 lt!456512 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123)))))))

(declare-fun b!1034256 () Bool)

(assert (=> b!1034256 (= e!584640 call!43719)))

(declare-fun b!1034257 () Bool)

(assert (=> b!1034257 (= e!584639 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456203)) (_1!7874 (tuple2!15727 lt!456189 lt!456123)) (_2!7874 (tuple2!15727 lt!456189 lt!456123))))))

(declare-fun b!1034258 () Bool)

(assert (=> b!1034258 (= e!584639 (ite c!104555 (t!31103 (toList!6893 lt!456203)) (ite c!104554 (Cons!21901 (h!23103 (toList!6893 lt!456203)) (t!31103 (toList!6893 lt!456203))) Nil!21902)))))

(assert (= (and d!124115 c!104557) b!1034251))

(assert (= (and d!124115 (not c!104557)) b!1034252))

(assert (= (and b!1034252 c!104555) b!1034254))

(assert (= (and b!1034252 (not c!104555)) b!1034250))

(assert (= (and b!1034250 c!104554) b!1034256))

(assert (= (and b!1034250 (not c!104554)) b!1034249))

(assert (= (or b!1034256 b!1034249) bm!43716))

(assert (= (or b!1034254 bm!43716) bm!43715))

(assert (= (or b!1034251 bm!43715) bm!43717))

(assert (= (and bm!43717 c!104556) b!1034257))

(assert (= (and bm!43717 (not c!104556)) b!1034258))

(assert (= (and d!124115 res!690842) b!1034253))

(assert (= (and b!1034253 res!690841) b!1034255))

(declare-fun m!954303 () Bool)

(assert (=> d!124115 m!954303))

(declare-fun m!954305 () Bool)

(assert (=> d!124115 m!954305))

(declare-fun m!954307 () Bool)

(assert (=> b!1034253 m!954307))

(declare-fun m!954309 () Bool)

(assert (=> b!1034257 m!954309))

(declare-fun m!954311 () Bool)

(assert (=> b!1034255 m!954311))

(declare-fun m!954313 () Bool)

(assert (=> bm!43717 m!954313))

(assert (=> d!123881 d!124115))

(declare-fun d!124117 () Bool)

(declare-fun e!584642 () Bool)

(assert (=> d!124117 e!584642))

(declare-fun res!690843 () Bool)

(assert (=> d!124117 (=> res!690843 e!584642)))

(declare-fun lt!456516 () Bool)

(assert (=> d!124117 (= res!690843 (not lt!456516))))

(declare-fun lt!456514 () Bool)

(assert (=> d!124117 (= lt!456516 lt!456514)))

(declare-fun lt!456513 () Unit!33831)

(declare-fun e!584643 () Unit!33831)

(assert (=> d!124117 (= lt!456513 e!584643)))

(declare-fun c!104558 () Bool)

(assert (=> d!124117 (= c!104558 lt!456514)))

(assert (=> d!124117 (= lt!456514 (containsKey!563 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(assert (=> d!124117 (= (contains!6012 lt!456303 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456516)))

(declare-fun b!1034259 () Bool)

(declare-fun lt!456515 () Unit!33831)

(assert (=> b!1034259 (= e!584643 lt!456515)))

(assert (=> b!1034259 (= lt!456515 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034259 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034260 () Bool)

(declare-fun Unit!33859 () Unit!33831)

(assert (=> b!1034260 (= e!584643 Unit!33859)))

(declare-fun b!1034261 () Bool)

(assert (=> b!1034261 (= e!584642 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456303) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124117 c!104558) b!1034259))

(assert (= (and d!124117 (not c!104558)) b!1034260))

(assert (= (and d!124117 (not res!690843)) b!1034261))

(declare-fun m!954315 () Bool)

(assert (=> d!124117 m!954315))

(declare-fun m!954317 () Bool)

(assert (=> b!1034259 m!954317))

(assert (=> b!1034259 m!953591))

(assert (=> b!1034259 m!953591))

(declare-fun m!954319 () Bool)

(assert (=> b!1034259 m!954319))

(assert (=> b!1034261 m!953591))

(assert (=> b!1034261 m!953591))

(assert (=> b!1034261 m!954319))

(assert (=> d!123853 d!124117))

(declare-fun b!1034265 () Bool)

(declare-fun e!584645 () Option!639)

(assert (=> b!1034265 (= e!584645 None!637)))

(declare-fun b!1034262 () Bool)

(declare-fun e!584644 () Option!639)

(assert (=> b!1034262 (= e!584644 (Some!638 (_2!7874 (h!23103 lt!456306))))))

(declare-fun b!1034264 () Bool)

(assert (=> b!1034264 (= e!584645 (getValueByKey!588 (t!31103 lt!456306) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun d!124119 () Bool)

(declare-fun c!104559 () Bool)

(assert (=> d!124119 (= c!104559 (and ((_ is Cons!21901) lt!456306) (= (_1!7874 (h!23103 lt!456306)) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(assert (=> d!124119 (= (getValueByKey!588 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) e!584644)))

(declare-fun b!1034263 () Bool)

(assert (=> b!1034263 (= e!584644 e!584645)))

(declare-fun c!104560 () Bool)

(assert (=> b!1034263 (= c!104560 (and ((_ is Cons!21901) lt!456306) (not (= (_1!7874 (h!23103 lt!456306)) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124119 c!104559) b!1034262))

(assert (= (and d!124119 (not c!104559)) b!1034263))

(assert (= (and b!1034263 c!104560) b!1034264))

(assert (= (and b!1034263 (not c!104560)) b!1034265))

(declare-fun m!954321 () Bool)

(assert (=> b!1034264 m!954321))

(assert (=> d!123853 d!124119))

(declare-fun d!124121 () Bool)

(assert (=> d!124121 (= (getValueByKey!588 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456517 () Unit!33831)

(assert (=> d!124121 (= lt!456517 (choose!1700 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun e!584646 () Bool)

(assert (=> d!124121 e!584646))

(declare-fun res!690844 () Bool)

(assert (=> d!124121 (=> (not res!690844) (not e!584646))))

(assert (=> d!124121 (= res!690844 (isStrictlySorted!718 lt!456306))))

(assert (=> d!124121 (= (lemmaContainsTupThenGetReturnValue!279 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456517)))

(declare-fun b!1034266 () Bool)

(declare-fun res!690845 () Bool)

(assert (=> b!1034266 (=> (not res!690845) (not e!584646))))

(assert (=> b!1034266 (= res!690845 (containsKey!563 lt!456306 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034267 () Bool)

(assert (=> b!1034267 (= e!584646 (contains!6013 lt!456306 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124121 res!690844) b!1034266))

(assert (= (and b!1034266 res!690845) b!1034267))

(assert (=> d!124121 m!953585))

(declare-fun m!954323 () Bool)

(assert (=> d!124121 m!954323))

(declare-fun m!954325 () Bool)

(assert (=> d!124121 m!954325))

(declare-fun m!954327 () Bool)

(assert (=> b!1034266 m!954327))

(declare-fun m!954329 () Bool)

(assert (=> b!1034267 m!954329))

(assert (=> d!123853 d!124121))

(declare-fun bm!43718 () Bool)

(declare-fun call!43723 () List!21905)

(declare-fun call!43721 () List!21905)

(assert (=> bm!43718 (= call!43723 call!43721)))

(declare-fun d!124123 () Bool)

(declare-fun e!584647 () Bool)

(assert (=> d!124123 e!584647))

(declare-fun res!690847 () Bool)

(assert (=> d!124123 (=> (not res!690847) (not e!584647))))

(declare-fun lt!456518 () List!21905)

(assert (=> d!124123 (= res!690847 (isStrictlySorted!718 lt!456518))))

(declare-fun e!584648 () List!21905)

(assert (=> d!124123 (= lt!456518 e!584648)))

(declare-fun c!104564 () Bool)

(assert (=> d!124123 (= c!104564 (and ((_ is Cons!21901) (toList!6893 lt!456193)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456193))) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(assert (=> d!124123 (isStrictlySorted!718 (toList!6893 lt!456193))))

(assert (=> d!124123 (= (insertStrictlySorted!372 (toList!6893 lt!456193) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))) lt!456518)))

(declare-fun b!1034268 () Bool)

(declare-fun e!584650 () List!21905)

(declare-fun call!43722 () List!21905)

(assert (=> b!1034268 (= e!584650 call!43722)))

(declare-fun c!104561 () Bool)

(declare-fun b!1034269 () Bool)

(assert (=> b!1034269 (= c!104561 (and ((_ is Cons!21901) (toList!6893 lt!456193)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456193))) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(declare-fun e!584651 () List!21905)

(assert (=> b!1034269 (= e!584651 e!584650)))

(declare-fun b!1034270 () Bool)

(assert (=> b!1034270 (= e!584648 call!43721)))

(declare-fun bm!43719 () Bool)

(assert (=> bm!43719 (= call!43722 call!43723)))

(declare-fun b!1034271 () Bool)

(assert (=> b!1034271 (= e!584648 e!584651)))

(declare-fun c!104562 () Bool)

(assert (=> b!1034271 (= c!104562 (and ((_ is Cons!21901) (toList!6893 lt!456193)) (= (_1!7874 (h!23103 (toList!6893 lt!456193))) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034272 () Bool)

(declare-fun res!690846 () Bool)

(assert (=> b!1034272 (=> (not res!690846) (not e!584647))))

(assert (=> b!1034272 (= res!690846 (containsKey!563 lt!456518 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034273 () Bool)

(assert (=> b!1034273 (= e!584651 call!43723)))

(declare-fun e!584649 () List!21905)

(declare-fun bm!43720 () Bool)

(assert (=> bm!43720 (= call!43721 ($colon$colon!602 e!584649 (ite c!104564 (h!23103 (toList!6893 lt!456193)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104563 () Bool)

(assert (=> bm!43720 (= c!104563 c!104564)))

(declare-fun b!1034274 () Bool)

(assert (=> b!1034274 (= e!584647 (contains!6013 lt!456518 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034275 () Bool)

(assert (=> b!1034275 (= e!584650 call!43722)))

(declare-fun b!1034276 () Bool)

(assert (=> b!1034276 (= e!584649 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456193)) (_1!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456202 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034277 () Bool)

(assert (=> b!1034277 (= e!584649 (ite c!104562 (t!31103 (toList!6893 lt!456193)) (ite c!104561 (Cons!21901 (h!23103 (toList!6893 lt!456193)) (t!31103 (toList!6893 lt!456193))) Nil!21902)))))

(assert (= (and d!124123 c!104564) b!1034270))

(assert (= (and d!124123 (not c!104564)) b!1034271))

(assert (= (and b!1034271 c!104562) b!1034273))

(assert (= (and b!1034271 (not c!104562)) b!1034269))

(assert (= (and b!1034269 c!104561) b!1034275))

(assert (= (and b!1034269 (not c!104561)) b!1034268))

(assert (= (or b!1034275 b!1034268) bm!43719))

(assert (= (or b!1034273 bm!43719) bm!43718))

(assert (= (or b!1034270 bm!43718) bm!43720))

(assert (= (and bm!43720 c!104563) b!1034276))

(assert (= (and bm!43720 (not c!104563)) b!1034277))

(assert (= (and d!124123 res!690847) b!1034272))

(assert (= (and b!1034272 res!690846) b!1034274))

(declare-fun m!954331 () Bool)

(assert (=> d!124123 m!954331))

(declare-fun m!954333 () Bool)

(assert (=> d!124123 m!954333))

(declare-fun m!954335 () Bool)

(assert (=> b!1034272 m!954335))

(declare-fun m!954337 () Bool)

(assert (=> b!1034276 m!954337))

(declare-fun m!954339 () Bool)

(assert (=> b!1034274 m!954339))

(declare-fun m!954341 () Bool)

(assert (=> bm!43720 m!954341))

(assert (=> d!123853 d!124123))

(declare-fun d!124125 () Bool)

(assert (=> d!124125 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456229) key!909)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456229) key!909))))))

(declare-fun bs!30249 () Bool)

(assert (= bs!30249 d!124125))

(assert (=> bs!30249 m!953939))

(declare-fun m!954343 () Bool)

(assert (=> bs!30249 m!954343))

(assert (=> b!1033960 d!124125))

(declare-fun b!1034281 () Bool)

(declare-fun e!584653 () Option!639)

(assert (=> b!1034281 (= e!584653 None!637)))

(declare-fun b!1034278 () Bool)

(declare-fun e!584652 () Option!639)

(assert (=> b!1034278 (= e!584652 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456229)))))))

(declare-fun b!1034280 () Bool)

(assert (=> b!1034280 (= e!584653 (getValueByKey!588 (t!31103 (toList!6893 lt!456229)) key!909))))

(declare-fun d!124127 () Bool)

(declare-fun c!104565 () Bool)

(assert (=> d!124127 (= c!104565 (and ((_ is Cons!21901) (toList!6893 lt!456229)) (= (_1!7874 (h!23103 (toList!6893 lt!456229))) key!909)))))

(assert (=> d!124127 (= (getValueByKey!588 (toList!6893 lt!456229) key!909) e!584652)))

(declare-fun b!1034279 () Bool)

(assert (=> b!1034279 (= e!584652 e!584653)))

(declare-fun c!104566 () Bool)

(assert (=> b!1034279 (= c!104566 (and ((_ is Cons!21901) (toList!6893 lt!456229)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456229))) key!909))))))

(assert (= (and d!124127 c!104565) b!1034278))

(assert (= (and d!124127 (not c!104565)) b!1034279))

(assert (= (and b!1034279 c!104566) b!1034280))

(assert (= (and b!1034279 (not c!104566)) b!1034281))

(declare-fun m!954345 () Bool)

(assert (=> b!1034280 m!954345))

(assert (=> b!1033960 d!124127))

(assert (=> d!123923 d!123929))

(assert (=> d!123923 d!123925))

(declare-fun d!124129 () Bool)

(assert (=> d!124129 (contains!6012 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456213)))

(assert (=> d!124129 true))

(declare-fun _$35!438 () Unit!33831)

(assert (=> d!124129 (= (choose!1698 lt!456228 lt!456214 (zeroValue!6063 thiss!1427) lt!456213) _$35!438)))

(declare-fun bs!30250 () Bool)

(assert (= bs!30250 d!124129))

(assert (=> bs!30250 m!953447))

(assert (=> bs!30250 m!953447))

(assert (=> bs!30250 m!953449))

(assert (=> d!123923 d!124129))

(declare-fun d!124131 () Bool)

(declare-fun e!584654 () Bool)

(assert (=> d!124131 e!584654))

(declare-fun res!690848 () Bool)

(assert (=> d!124131 (=> res!690848 e!584654)))

(declare-fun lt!456522 () Bool)

(assert (=> d!124131 (= res!690848 (not lt!456522))))

(declare-fun lt!456520 () Bool)

(assert (=> d!124131 (= lt!456522 lt!456520)))

(declare-fun lt!456519 () Unit!33831)

(declare-fun e!584655 () Unit!33831)

(assert (=> d!124131 (= lt!456519 e!584655)))

(declare-fun c!104567 () Bool)

(assert (=> d!124131 (= c!104567 lt!456520)))

(assert (=> d!124131 (= lt!456520 (containsKey!563 (toList!6893 lt!456228) lt!456213))))

(assert (=> d!124131 (= (contains!6012 lt!456228 lt!456213) lt!456522)))

(declare-fun b!1034283 () Bool)

(declare-fun lt!456521 () Unit!33831)

(assert (=> b!1034283 (= e!584655 lt!456521)))

(assert (=> b!1034283 (= lt!456521 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456228) lt!456213))))

(assert (=> b!1034283 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456228) lt!456213))))

(declare-fun b!1034284 () Bool)

(declare-fun Unit!33860 () Unit!33831)

(assert (=> b!1034284 (= e!584655 Unit!33860)))

(declare-fun b!1034285 () Bool)

(assert (=> b!1034285 (= e!584654 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456228) lt!456213)))))

(assert (= (and d!124131 c!104567) b!1034283))

(assert (= (and d!124131 (not c!104567)) b!1034284))

(assert (= (and d!124131 (not res!690848)) b!1034285))

(declare-fun m!954347 () Bool)

(assert (=> d!124131 m!954347))

(declare-fun m!954349 () Bool)

(assert (=> b!1034283 m!954349))

(declare-fun m!954351 () Bool)

(assert (=> b!1034283 m!954351))

(assert (=> b!1034283 m!954351))

(declare-fun m!954353 () Bool)

(assert (=> b!1034283 m!954353))

(assert (=> b!1034285 m!954351))

(assert (=> b!1034285 m!954351))

(assert (=> b!1034285 m!954353))

(assert (=> d!123923 d!124131))

(assert (=> b!1033921 d!123831))

(declare-fun b!1034289 () Bool)

(declare-fun e!584657 () Option!639)

(assert (=> b!1034289 (= e!584657 None!637)))

(declare-fun b!1034286 () Bool)

(declare-fun e!584656 () Option!639)

(assert (=> b!1034286 (= e!584656 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456270)))))))

(declare-fun b!1034288 () Bool)

(assert (=> b!1034288 (= e!584657 (getValueByKey!588 (t!31103 (toList!6893 lt!456270)) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun d!124133 () Bool)

(declare-fun c!104568 () Bool)

(assert (=> d!124133 (= c!104568 (and ((_ is Cons!21901) (toList!6893 lt!456270)) (= (_1!7874 (h!23103 (toList!6893 lt!456270))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!124133 (= (getValueByKey!588 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) e!584656)))

(declare-fun b!1034287 () Bool)

(assert (=> b!1034287 (= e!584656 e!584657)))

(declare-fun c!104569 () Bool)

(assert (=> b!1034287 (= c!104569 (and ((_ is Cons!21901) (toList!6893 lt!456270)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456270))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(assert (= (and d!124133 c!104568) b!1034286))

(assert (= (and d!124133 (not c!104568)) b!1034287))

(assert (= (and b!1034287 c!104569) b!1034288))

(assert (= (and b!1034287 (not c!104569)) b!1034289))

(declare-fun m!954355 () Bool)

(assert (=> b!1034288 m!954355))

(assert (=> b!1033771 d!124133))

(declare-fun lt!456523 () Bool)

(declare-fun d!124135 () Bool)

(assert (=> d!124135 (= lt!456523 (select (content!513 (toList!6893 lt!456374)) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun e!584659 () Bool)

(assert (=> d!124135 (= lt!456523 e!584659)))

(declare-fun res!690849 () Bool)

(assert (=> d!124135 (=> (not res!690849) (not e!584659))))

(assert (=> d!124135 (= res!690849 ((_ is Cons!21901) (toList!6893 lt!456374)))))

(assert (=> d!124135 (= (contains!6013 (toList!6893 lt!456374) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456523)))

(declare-fun b!1034290 () Bool)

(declare-fun e!584658 () Bool)

(assert (=> b!1034290 (= e!584659 e!584658)))

(declare-fun res!690850 () Bool)

(assert (=> b!1034290 (=> res!690850 e!584658)))

(assert (=> b!1034290 (= res!690850 (= (h!23103 (toList!6893 lt!456374)) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034291 () Bool)

(assert (=> b!1034291 (= e!584658 (contains!6013 (t!31103 (toList!6893 lt!456374)) (ite (or c!104383 c!104388) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 lt!456123) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (= (and d!124135 res!690849) b!1034290))

(assert (= (and b!1034290 (not res!690850)) b!1034291))

(declare-fun m!954357 () Bool)

(assert (=> d!124135 m!954357))

(declare-fun m!954359 () Bool)

(assert (=> d!124135 m!954359))

(declare-fun m!954361 () Bool)

(assert (=> b!1034291 m!954361))

(assert (=> b!1033924 d!124135))

(declare-fun d!124137 () Bool)

(assert (=> d!124137 (= (size!31879 thiss!1427) (bvadd (_size!2908 thiss!1427) (bvsdiv (bvadd (extraKeys!5959 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1033926 d!124137))

(assert (=> b!1033807 d!123831))

(declare-fun b!1034292 () Bool)

(declare-fun e!584662 () Bool)

(declare-fun call!43724 () Bool)

(assert (=> b!1034292 (= e!584662 call!43724)))

(declare-fun c!104570 () Bool)

(declare-fun bm!43721 () Bool)

(assert (=> bm!43721 (= call!43724 (arrayNoDuplicates!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!104570 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!104452 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)) (ite c!104452 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) Nil!21904) Nil!21904))))))

(declare-fun b!1034293 () Bool)

(assert (=> b!1034293 (= e!584662 call!43724)))

(declare-fun b!1034294 () Bool)

(declare-fun e!584663 () Bool)

(declare-fun e!584661 () Bool)

(assert (=> b!1034294 (= e!584663 e!584661)))

(declare-fun res!690853 () Bool)

(assert (=> b!1034294 (=> (not res!690853) (not e!584661))))

(declare-fun e!584660 () Bool)

(assert (=> b!1034294 (= res!690853 (not e!584660))))

(declare-fun res!690851 () Bool)

(assert (=> b!1034294 (=> (not res!690851) (not e!584660))))

(assert (=> b!1034294 (= res!690851 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!124139 () Bool)

(declare-fun res!690852 () Bool)

(assert (=> d!124139 (=> res!690852 e!584663)))

(assert (=> d!124139 (= res!690852 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!124139 (= (arrayNoDuplicates!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!104452 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) Nil!21904) Nil!21904)) e!584663)))

(declare-fun b!1034295 () Bool)

(assert (=> b!1034295 (= e!584661 e!584662)))

(assert (=> b!1034295 (= c!104570 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034296 () Bool)

(assert (=> b!1034296 (= e!584660 (contains!6014 (ite c!104452 (Cons!21903 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) Nil!21904) Nil!21904) (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!124139 (not res!690852)) b!1034294))

(assert (= (and b!1034294 res!690851) b!1034296))

(assert (= (and b!1034294 res!690853) b!1034295))

(assert (= (and b!1034295 c!104570) b!1034293))

(assert (= (and b!1034295 (not c!104570)) b!1034292))

(assert (= (or b!1034293 b!1034292) bm!43721))

(declare-fun m!954363 () Bool)

(assert (=> bm!43721 m!954363))

(declare-fun m!954365 () Bool)

(assert (=> bm!43721 m!954365))

(assert (=> b!1034294 m!954363))

(assert (=> b!1034294 m!954363))

(declare-fun m!954367 () Bool)

(assert (=> b!1034294 m!954367))

(assert (=> b!1034295 m!954363))

(assert (=> b!1034295 m!954363))

(assert (=> b!1034295 m!954367))

(assert (=> b!1034296 m!954363))

(assert (=> b!1034296 m!954363))

(declare-fun m!954369 () Bool)

(assert (=> b!1034296 m!954369))

(assert (=> bm!43692 d!124139))

(declare-fun d!124141 () Bool)

(declare-fun res!690854 () Bool)

(declare-fun e!584664 () Bool)

(assert (=> d!124141 (=> res!690854 e!584664)))

(assert (=> d!124141 (= res!690854 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124141 (= (containsKey!563 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) e!584664)))

(declare-fun b!1034297 () Bool)

(declare-fun e!584665 () Bool)

(assert (=> b!1034297 (= e!584664 e!584665)))

(declare-fun res!690855 () Bool)

(assert (=> b!1034297 (=> (not res!690855) (not e!584665))))

(assert (=> b!1034297 (= res!690855 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456221))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456221))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21901) (toList!6893 lt!456221)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456221))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1034298 () Bool)

(assert (=> b!1034298 (= e!584665 (containsKey!563 (t!31103 (toList!6893 lt!456221)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124141 (not res!690854)) b!1034297))

(assert (= (and b!1034297 res!690855) b!1034298))

(assert (=> b!1034298 m!953361))

(declare-fun m!954371 () Bool)

(assert (=> b!1034298 m!954371))

(assert (=> d!123913 d!124141))

(declare-fun d!124143 () Bool)

(assert (=> d!124143 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456524 () Unit!33831)

(assert (=> d!124143 (= lt!456524 (choose!1699 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584666 () Bool)

(assert (=> d!124143 e!584666))

(declare-fun res!690856 () Bool)

(assert (=> d!124143 (=> (not res!690856) (not e!584666))))

(assert (=> d!124143 (= res!690856 (isStrictlySorted!718 (toList!6893 lt!456221)))))

(assert (=> d!124143 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456524)))

(declare-fun b!1034299 () Bool)

(assert (=> b!1034299 (= e!584666 (containsKey!563 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124143 res!690856) b!1034299))

(assert (=> d!124143 m!953921))

(assert (=> d!124143 m!953921))

(assert (=> d!124143 m!953929))

(declare-fun m!954373 () Bool)

(assert (=> d!124143 m!954373))

(assert (=> d!124143 m!953985))

(assert (=> b!1034299 m!953925))

(assert (=> b!1033950 d!124143))

(declare-fun d!124145 () Bool)

(assert (=> d!124145 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!30251 () Bool)

(assert (= bs!30251 d!124145))

(assert (=> bs!30251 m!953921))

(declare-fun m!954375 () Bool)

(assert (=> bs!30251 m!954375))

(assert (=> b!1033950 d!124145))

(declare-fun b!1034303 () Bool)

(declare-fun e!584668 () Option!639)

(assert (=> b!1034303 (= e!584668 None!637)))

(declare-fun b!1034300 () Bool)

(declare-fun e!584667 () Option!639)

(assert (=> b!1034300 (= e!584667 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456221)))))))

(declare-fun b!1034302 () Bool)

(assert (=> b!1034302 (= e!584668 (getValueByKey!588 (t!31103 (toList!6893 lt!456221)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!124147 () Bool)

(declare-fun c!104571 () Bool)

(assert (=> d!124147 (= c!104571 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124147 (= (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000) e!584667)))

(declare-fun b!1034301 () Bool)

(assert (=> b!1034301 (= e!584667 e!584668)))

(declare-fun c!104572 () Bool)

(assert (=> b!1034301 (= c!104572 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!124147 c!104571) b!1034300))

(assert (= (and d!124147 (not c!104571)) b!1034301))

(assert (= (and b!1034301 c!104572) b!1034302))

(assert (= (and b!1034301 (not c!104572)) b!1034303))

(declare-fun m!954377 () Bool)

(assert (=> b!1034302 m!954377))

(assert (=> b!1033950 d!124147))

(declare-fun d!124149 () Bool)

(declare-fun e!584669 () Bool)

(assert (=> d!124149 e!584669))

(declare-fun res!690857 () Bool)

(assert (=> d!124149 (=> res!690857 e!584669)))

(declare-fun lt!456528 () Bool)

(assert (=> d!124149 (= res!690857 (not lt!456528))))

(declare-fun lt!456526 () Bool)

(assert (=> d!124149 (= lt!456528 lt!456526)))

(declare-fun lt!456525 () Unit!33831)

(declare-fun e!584670 () Unit!33831)

(assert (=> d!124149 (= lt!456525 e!584670)))

(declare-fun c!104573 () Bool)

(assert (=> d!124149 (= c!104573 lt!456526)))

(assert (=> d!124149 (= lt!456526 (containsKey!563 (toList!6893 lt!456298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124149 (= (contains!6012 lt!456298 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456528)))

(declare-fun b!1034304 () Bool)

(declare-fun lt!456527 () Unit!33831)

(assert (=> b!1034304 (= e!584670 lt!456527)))

(assert (=> b!1034304 (= lt!456527 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034304 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034305 () Bool)

(declare-fun Unit!33861 () Unit!33831)

(assert (=> b!1034305 (= e!584670 Unit!33861)))

(declare-fun b!1034306 () Bool)

(assert (=> b!1034306 (= e!584669 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124149 c!104573) b!1034304))

(assert (= (and d!124149 (not c!104573)) b!1034305))

(assert (= (and d!124149 (not res!690857)) b!1034306))

(declare-fun m!954379 () Bool)

(assert (=> d!124149 m!954379))

(declare-fun m!954381 () Bool)

(assert (=> b!1034304 m!954381))

(declare-fun m!954383 () Bool)

(assert (=> b!1034304 m!954383))

(assert (=> b!1034304 m!954383))

(declare-fun m!954385 () Bool)

(assert (=> b!1034304 m!954385))

(assert (=> b!1034306 m!954383))

(assert (=> b!1034306 m!954383))

(assert (=> b!1034306 m!954385))

(assert (=> d!123849 d!124149))

(assert (=> d!123849 d!123903))

(declare-fun b!1034307 () Bool)

(declare-fun e!584673 () Bool)

(assert (=> b!1034307 (= e!584673 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034307 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!124151 () Bool)

(declare-fun e!584672 () Bool)

(assert (=> d!124151 e!584672))

(declare-fun res!690861 () Bool)

(assert (=> d!124151 (=> (not res!690861) (not e!584672))))

(declare-fun lt!456535 () ListLongMap!13755)

(assert (=> d!124151 (= res!690861 (not (contains!6012 lt!456535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!584674 () ListLongMap!13755)

(assert (=> d!124151 (= lt!456535 e!584674)))

(declare-fun c!104574 () Bool)

(assert (=> d!124151 (= c!104574 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!124151 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!124151 (= (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)) lt!456535)))

(declare-fun bm!43722 () Bool)

(declare-fun call!43725 () ListLongMap!13755)

(assert (=> bm!43722 (= call!43725 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427)))))

(declare-fun b!1034308 () Bool)

(declare-fun e!584675 () ListLongMap!13755)

(assert (=> b!1034308 (= e!584674 e!584675)))

(declare-fun c!104577 () Bool)

(assert (=> b!1034308 (= c!104577 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034309 () Bool)

(declare-fun e!584677 () Bool)

(declare-fun e!584671 () Bool)

(assert (=> b!1034309 (= e!584677 e!584671)))

(declare-fun c!104576 () Bool)

(assert (=> b!1034309 (= c!104576 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034310 () Bool)

(assert (=> b!1034310 (= e!584671 (= lt!456535 (getCurrentListMapNoExtraKeys!3520 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (bvand (extraKeys!5959 thiss!1427) #b00000000000000000000000000000010) lt!456123 (minValue!6063 thiss!1427) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!6227 thiss!1427))))))

(declare-fun b!1034311 () Bool)

(assert (=> b!1034311 (= e!584675 call!43725)))

(declare-fun b!1034312 () Bool)

(declare-fun lt!456531 () Unit!33831)

(declare-fun lt!456529 () Unit!33831)

(assert (=> b!1034312 (= lt!456531 lt!456529)))

(declare-fun lt!456530 () (_ BitVec 64))

(declare-fun lt!456532 () ListLongMap!13755)

(declare-fun lt!456534 () (_ BitVec 64))

(declare-fun lt!456533 () V!37565)

(assert (=> b!1034312 (not (contains!6012 (+!3104 lt!456532 (tuple2!15727 lt!456530 lt!456533)) lt!456534))))

(assert (=> b!1034312 (= lt!456529 (addStillNotContains!242 lt!456532 lt!456530 lt!456533 lt!456534))))

(assert (=> b!1034312 (= lt!456534 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1034312 (= lt!456533 (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1034312 (= lt!456530 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034312 (= lt!456532 call!43725)))

(assert (=> b!1034312 (= e!584675 (+!3104 call!43725 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1034313 () Bool)

(assert (=> b!1034313 (= e!584672 e!584677)))

(declare-fun c!104575 () Bool)

(assert (=> b!1034313 (= c!104575 e!584673)))

(declare-fun res!690858 () Bool)

(assert (=> b!1034313 (=> (not res!690858) (not e!584673))))

(assert (=> b!1034313 (= res!690858 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034314 () Bool)

(declare-fun res!690859 () Bool)

(assert (=> b!1034314 (=> (not res!690859) (not e!584672))))

(assert (=> b!1034314 (= res!690859 (not (contains!6012 lt!456535 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034315 () Bool)

(declare-fun e!584676 () Bool)

(assert (=> b!1034315 (= e!584677 e!584676)))

(assert (=> b!1034315 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun res!690860 () Bool)

(assert (=> b!1034315 (= res!690860 (contains!6012 lt!456535 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034315 (=> (not res!690860) (not e!584676))))

(declare-fun b!1034316 () Bool)

(assert (=> b!1034316 (= e!584674 (ListLongMap!13756 Nil!21902))))

(declare-fun b!1034317 () Bool)

(assert (=> b!1034317 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> b!1034317 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31876 (_values!6250 thiss!1427))))))

(assert (=> b!1034317 (= e!584676 (= (apply!906 lt!456535 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034318 () Bool)

(assert (=> b!1034318 (= e!584671 (isEmpty!926 lt!456535))))

(assert (= (and d!124151 c!104574) b!1034316))

(assert (= (and d!124151 (not c!104574)) b!1034308))

(assert (= (and b!1034308 c!104577) b!1034312))

(assert (= (and b!1034308 (not c!104577)) b!1034311))

(assert (= (or b!1034312 b!1034311) bm!43722))

(assert (= (and d!124151 res!690861) b!1034314))

(assert (= (and b!1034314 res!690859) b!1034313))

(assert (= (and b!1034313 res!690858) b!1034307))

(assert (= (and b!1034313 c!104575) b!1034315))

(assert (= (and b!1034313 (not c!104575)) b!1034309))

(assert (= (and b!1034315 res!690860) b!1034317))

(assert (= (and b!1034309 c!104576) b!1034310))

(assert (= (and b!1034309 (not c!104576)) b!1034318))

(declare-fun b_lambda!16087 () Bool)

(assert (=> (not b_lambda!16087) (not b!1034312)))

(assert (=> b!1034312 t!31102))

(declare-fun b_and!33299 () Bool)

(assert (= b_and!33297 (and (=> t!31102 result!14387) b_and!33299)))

(declare-fun b_lambda!16089 () Bool)

(assert (=> (not b_lambda!16089) (not b!1034317)))

(assert (=> b!1034317 t!31102))

(declare-fun b_and!33301 () Bool)

(assert (= b_and!33299 (and (=> t!31102 result!14387) b_and!33301)))

(declare-fun m!954387 () Bool)

(assert (=> b!1034312 m!954387))

(assert (=> b!1034312 m!953995))

(assert (=> b!1034312 m!953995))

(assert (=> b!1034312 m!953309))

(assert (=> b!1034312 m!953997))

(assert (=> b!1034312 m!953999))

(declare-fun m!954389 () Bool)

(assert (=> b!1034312 m!954389))

(declare-fun m!954391 () Bool)

(assert (=> b!1034312 m!954391))

(assert (=> b!1034312 m!954391))

(declare-fun m!954393 () Bool)

(assert (=> b!1034312 m!954393))

(assert (=> b!1034312 m!953309))

(declare-fun m!954395 () Bool)

(assert (=> b!1034314 m!954395))

(declare-fun m!954397 () Bool)

(assert (=> b!1034318 m!954397))

(declare-fun m!954399 () Bool)

(assert (=> d!124151 m!954399))

(assert (=> d!124151 m!953355))

(assert (=> b!1034308 m!953999))

(assert (=> b!1034308 m!953999))

(assert (=> b!1034308 m!954013))

(assert (=> b!1034315 m!953999))

(assert (=> b!1034315 m!953999))

(declare-fun m!954401 () Bool)

(assert (=> b!1034315 m!954401))

(declare-fun m!954403 () Bool)

(assert (=> b!1034310 m!954403))

(assert (=> bm!43722 m!954403))

(assert (=> b!1034307 m!953999))

(assert (=> b!1034307 m!953999))

(assert (=> b!1034307 m!954013))

(assert (=> b!1034317 m!953999))

(declare-fun m!954405 () Bool)

(assert (=> b!1034317 m!954405))

(assert (=> b!1034317 m!953995))

(assert (=> b!1034317 m!953995))

(assert (=> b!1034317 m!953309))

(assert (=> b!1034317 m!953997))

(assert (=> b!1034317 m!953999))

(assert (=> b!1034317 m!953309))

(assert (=> b!1033831 d!124151))

(declare-fun d!124153 () Bool)

(declare-fun lt!456536 () Bool)

(assert (=> d!124153 (= lt!456536 (select (content!513 (toList!6893 lt!456247)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun e!584679 () Bool)

(assert (=> d!124153 (= lt!456536 e!584679)))

(declare-fun res!690862 () Bool)

(assert (=> d!124153 (=> (not res!690862) (not e!584679))))

(assert (=> d!124153 (= res!690862 ((_ is Cons!21901) (toList!6893 lt!456247)))))

(assert (=> d!124153 (= (contains!6013 (toList!6893 lt!456247) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) lt!456536)))

(declare-fun b!1034319 () Bool)

(declare-fun e!584678 () Bool)

(assert (=> b!1034319 (= e!584679 e!584678)))

(declare-fun res!690863 () Bool)

(assert (=> b!1034319 (=> res!690863 e!584678)))

(assert (=> b!1034319 (= res!690863 (= (h!23103 (toList!6893 lt!456247)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun b!1034320 () Bool)

(assert (=> b!1034320 (= e!584678 (contains!6013 (t!31103 (toList!6893 lt!456247)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(assert (= (and d!124153 res!690862) b!1034319))

(assert (= (and b!1034319 (not res!690863)) b!1034320))

(declare-fun m!954407 () Bool)

(assert (=> d!124153 m!954407))

(declare-fun m!954409 () Bool)

(assert (=> d!124153 m!954409))

(declare-fun m!954411 () Bool)

(assert (=> b!1034320 m!954411))

(assert (=> b!1033746 d!124153))

(declare-fun lt!456537 () Bool)

(declare-fun d!124155 () Bool)

(assert (=> d!124155 (= lt!456537 (select (content!513 (toList!6893 lt!456400)) (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))

(declare-fun e!584681 () Bool)

(assert (=> d!124155 (= lt!456537 e!584681)))

(declare-fun res!690864 () Bool)

(assert (=> d!124155 (=> (not res!690864) (not e!584681))))

(assert (=> d!124155 (= res!690864 ((_ is Cons!21901) (toList!6893 lt!456400)))))

(assert (=> d!124155 (= (contains!6013 (toList!6893 lt!456400) (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))) lt!456537)))

(declare-fun b!1034321 () Bool)

(declare-fun e!584680 () Bool)

(assert (=> b!1034321 (= e!584681 e!584680)))

(declare-fun res!690865 () Bool)

(assert (=> b!1034321 (=> res!690865 e!584680)))

(assert (=> b!1034321 (= res!690865 (= (h!23103 (toList!6893 lt!456400)) (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))

(declare-fun b!1034322 () Bool)

(assert (=> b!1034322 (= e!584680 (contains!6013 (t!31103 (toList!6893 lt!456400)) (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))

(assert (= (and d!124155 res!690864) b!1034321))

(assert (= (and b!1034321 (not res!690865)) b!1034322))

(declare-fun m!954413 () Bool)

(assert (=> d!124155 m!954413))

(declare-fun m!954415 () Bool)

(assert (=> d!124155 m!954415))

(declare-fun m!954417 () Bool)

(assert (=> b!1034322 m!954417))

(assert (=> b!1033946 d!124155))

(declare-fun d!124157 () Bool)

(declare-fun res!690866 () Bool)

(declare-fun e!584682 () Bool)

(assert (=> d!124157 (=> res!690866 e!584682)))

(assert (=> d!124157 (= res!690866 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) lt!456213)))))

(assert (=> d!124157 (= (containsKey!563 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213) e!584682)))

(declare-fun b!1034323 () Bool)

(declare-fun e!584683 () Bool)

(assert (=> b!1034323 (= e!584682 e!584683)))

(declare-fun res!690867 () Bool)

(assert (=> b!1034323 (=> (not res!690867) (not e!584683))))

(assert (=> b!1034323 (= res!690867 (and (or (not ((_ is Cons!21901) (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) (bvsle (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) lt!456213)) ((_ is Cons!21901) (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) (bvslt (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))))) lt!456213)))))

(declare-fun b!1034324 () Bool)

(assert (=> b!1034324 (= e!584683 (containsKey!563 (t!31103 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))) lt!456213))))

(assert (= (and d!124157 (not res!690866)) b!1034323))

(assert (= (and b!1034323 res!690867) b!1034324))

(declare-fun m!954419 () Bool)

(assert (=> b!1034324 m!954419))

(assert (=> d!123929 d!124157))

(declare-fun d!124159 () Bool)

(assert (=> d!124159 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456211) lt!456210)) (v!14889 (getValueByKey!588 (toList!6893 lt!456211) lt!456210)))))

(assert (=> d!123931 d!124159))

(declare-fun b!1034328 () Bool)

(declare-fun e!584685 () Option!639)

(assert (=> b!1034328 (= e!584685 None!637)))

(declare-fun b!1034325 () Bool)

(declare-fun e!584684 () Option!639)

(assert (=> b!1034325 (= e!584684 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456211)))))))

(declare-fun b!1034327 () Bool)

(assert (=> b!1034327 (= e!584685 (getValueByKey!588 (t!31103 (toList!6893 lt!456211)) lt!456210))))

(declare-fun d!124161 () Bool)

(declare-fun c!104578 () Bool)

(assert (=> d!124161 (= c!104578 (and ((_ is Cons!21901) (toList!6893 lt!456211)) (= (_1!7874 (h!23103 (toList!6893 lt!456211))) lt!456210)))))

(assert (=> d!124161 (= (getValueByKey!588 (toList!6893 lt!456211) lt!456210) e!584684)))

(declare-fun b!1034326 () Bool)

(assert (=> b!1034326 (= e!584684 e!584685)))

(declare-fun c!104579 () Bool)

(assert (=> b!1034326 (= c!104579 (and ((_ is Cons!21901) (toList!6893 lt!456211)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456211))) lt!456210))))))

(assert (= (and d!124161 c!104578) b!1034325))

(assert (= (and d!124161 (not c!104578)) b!1034326))

(assert (= (and b!1034326 c!104579) b!1034327))

(assert (= (and b!1034326 (not c!104579)) b!1034328))

(declare-fun m!954421 () Bool)

(assert (=> b!1034327 m!954421))

(assert (=> d!123931 d!124161))

(declare-fun d!124163 () Bool)

(declare-fun e!584686 () Bool)

(assert (=> d!124163 e!584686))

(declare-fun res!690868 () Bool)

(assert (=> d!124163 (=> res!690868 e!584686)))

(declare-fun lt!456541 () Bool)

(assert (=> d!124163 (= res!690868 (not lt!456541))))

(declare-fun lt!456539 () Bool)

(assert (=> d!124163 (= lt!456541 lt!456539)))

(declare-fun lt!456538 () Unit!33831)

(declare-fun e!584687 () Unit!33831)

(assert (=> d!124163 (= lt!456538 e!584687)))

(declare-fun c!104580 () Bool)

(assert (=> d!124163 (= c!104580 lt!456539)))

(assert (=> d!124163 (= lt!456539 (containsKey!563 (toList!6893 lt!456348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124163 (= (contains!6012 lt!456348 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456541)))

(declare-fun b!1034329 () Bool)

(declare-fun lt!456540 () Unit!33831)

(assert (=> b!1034329 (= e!584687 lt!456540)))

(assert (=> b!1034329 (= lt!456540 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034329 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034330 () Bool)

(declare-fun Unit!33862 () Unit!33831)

(assert (=> b!1034330 (= e!584687 Unit!33862)))

(declare-fun b!1034331 () Bool)

(assert (=> b!1034331 (= e!584686 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124163 c!104580) b!1034329))

(assert (= (and d!124163 (not c!104580)) b!1034330))

(assert (= (and d!124163 (not res!690868)) b!1034331))

(declare-fun m!954423 () Bool)

(assert (=> d!124163 m!954423))

(declare-fun m!954425 () Bool)

(assert (=> b!1034329 m!954425))

(declare-fun m!954427 () Bool)

(assert (=> b!1034329 m!954427))

(assert (=> b!1034329 m!954427))

(declare-fun m!954429 () Bool)

(assert (=> b!1034329 m!954429))

(assert (=> b!1034331 m!954427))

(assert (=> b!1034331 m!954427))

(assert (=> b!1034331 m!954429))

(assert (=> bm!43680 d!124163))

(assert (=> b!1033828 d!123831))

(declare-fun d!124165 () Bool)

(declare-fun lt!456542 () Bool)

(assert (=> d!124165 (= lt!456542 (select (content!513 (toList!6893 lt!456388)) (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))

(declare-fun e!584689 () Bool)

(assert (=> d!124165 (= lt!456542 e!584689)))

(declare-fun res!690869 () Bool)

(assert (=> d!124165 (=> (not res!690869) (not e!584689))))

(assert (=> d!124165 (= res!690869 ((_ is Cons!21901) (toList!6893 lt!456388)))))

(assert (=> d!124165 (= (contains!6013 (toList!6893 lt!456388) (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))) lt!456542)))

(declare-fun b!1034332 () Bool)

(declare-fun e!584688 () Bool)

(assert (=> b!1034332 (= e!584689 e!584688)))

(declare-fun res!690870 () Bool)

(assert (=> b!1034332 (=> res!690870 e!584688)))

(assert (=> b!1034332 (= res!690870 (= (h!23103 (toList!6893 lt!456388)) (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))

(declare-fun b!1034333 () Bool)

(assert (=> b!1034333 (= e!584688 (contains!6013 (t!31103 (toList!6893 lt!456388)) (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))

(assert (= (and d!124165 res!690869) b!1034332))

(assert (= (and b!1034332 (not res!690870)) b!1034333))

(declare-fun m!954431 () Bool)

(assert (=> d!124165 m!954431))

(declare-fun m!954433 () Bool)

(assert (=> d!124165 m!954433))

(declare-fun m!954435 () Bool)

(assert (=> b!1034333 m!954435))

(assert (=> b!1033939 d!124165))

(declare-fun d!124167 () Bool)

(assert (=> d!124167 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14889 (getValueByKey!588 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123885 d!124167))

(assert (=> d!123885 d!123983))

(declare-fun b!1034337 () Bool)

(declare-fun e!584691 () Option!639)

(assert (=> b!1034337 (= e!584691 None!637)))

(declare-fun b!1034334 () Bool)

(declare-fun e!584690 () Option!639)

(assert (=> b!1034334 (= e!584690 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456383)))))))

(declare-fun b!1034336 () Bool)

(assert (=> b!1034336 (= e!584691 (getValueByKey!588 (t!31103 (toList!6893 lt!456383)) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun c!104581 () Bool)

(declare-fun d!124169 () Bool)

(assert (=> d!124169 (= c!104581 (and ((_ is Cons!21901) (toList!6893 lt!456383)) (= (_1!7874 (h!23103 (toList!6893 lt!456383))) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(assert (=> d!124169 (= (getValueByKey!588 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) e!584690)))

(declare-fun b!1034335 () Bool)

(assert (=> b!1034335 (= e!584690 e!584691)))

(declare-fun c!104582 () Bool)

(assert (=> b!1034335 (= c!104582 (and ((_ is Cons!21901) (toList!6893 lt!456383)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456383))) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124169 c!104581) b!1034334))

(assert (= (and d!124169 (not c!104581)) b!1034335))

(assert (= (and b!1034335 c!104582) b!1034336))

(assert (= (and b!1034335 (not c!104582)) b!1034337))

(declare-fun m!954437 () Bool)

(assert (=> b!1034336 m!954437))

(assert (=> b!1033936 d!124169))

(declare-fun d!124171 () Bool)

(assert (=> d!124171 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456182) lt!456195)) (v!14889 (getValueByKey!588 (toList!6893 lt!456182) lt!456195)))))

(assert (=> d!123863 d!124171))

(declare-fun b!1034341 () Bool)

(declare-fun e!584693 () Option!639)

(assert (=> b!1034341 (= e!584693 None!637)))

(declare-fun b!1034338 () Bool)

(declare-fun e!584692 () Option!639)

(assert (=> b!1034338 (= e!584692 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456182)))))))

(declare-fun b!1034340 () Bool)

(assert (=> b!1034340 (= e!584693 (getValueByKey!588 (t!31103 (toList!6893 lt!456182)) lt!456195))))

(declare-fun d!124173 () Bool)

(declare-fun c!104583 () Bool)

(assert (=> d!124173 (= c!104583 (and ((_ is Cons!21901) (toList!6893 lt!456182)) (= (_1!7874 (h!23103 (toList!6893 lt!456182))) lt!456195)))))

(assert (=> d!124173 (= (getValueByKey!588 (toList!6893 lt!456182) lt!456195) e!584692)))

(declare-fun b!1034339 () Bool)

(assert (=> b!1034339 (= e!584692 e!584693)))

(declare-fun c!104584 () Bool)

(assert (=> b!1034339 (= c!104584 (and ((_ is Cons!21901) (toList!6893 lt!456182)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456182))) lt!456195))))))

(assert (= (and d!124173 c!104583) b!1034338))

(assert (= (and d!124173 (not c!104583)) b!1034339))

(assert (= (and b!1034339 c!104584) b!1034340))

(assert (= (and b!1034339 (not c!104584)) b!1034341))

(declare-fun m!954439 () Bool)

(assert (=> b!1034340 m!954439))

(assert (=> d!123863 d!124173))

(declare-fun d!124175 () Bool)

(declare-fun e!584694 () Bool)

(assert (=> d!124175 e!584694))

(declare-fun res!690871 () Bool)

(assert (=> d!124175 (=> res!690871 e!584694)))

(declare-fun lt!456546 () Bool)

(assert (=> d!124175 (= res!690871 (not lt!456546))))

(declare-fun lt!456544 () Bool)

(assert (=> d!124175 (= lt!456546 lt!456544)))

(declare-fun lt!456543 () Unit!33831)

(declare-fun e!584695 () Unit!33831)

(assert (=> d!124175 (= lt!456543 e!584695)))

(declare-fun c!104585 () Bool)

(assert (=> d!124175 (= c!104585 lt!456544)))

(assert (=> d!124175 (= lt!456544 (containsKey!563 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124175 (= (contains!6012 lt!456270 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456546)))

(declare-fun b!1034342 () Bool)

(declare-fun lt!456545 () Unit!33831)

(assert (=> b!1034342 (= e!584695 lt!456545)))

(assert (=> b!1034342 (= lt!456545 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> b!1034342 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034343 () Bool)

(declare-fun Unit!33863 () Unit!33831)

(assert (=> b!1034343 (= e!584695 Unit!33863)))

(declare-fun b!1034344 () Bool)

(assert (=> b!1034344 (= e!584694 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456270) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124175 c!104585) b!1034342))

(assert (= (and d!124175 (not c!104585)) b!1034343))

(assert (= (and d!124175 (not res!690871)) b!1034344))

(declare-fun m!954441 () Bool)

(assert (=> d!124175 m!954441))

(declare-fun m!954443 () Bool)

(assert (=> b!1034342 m!954443))

(assert (=> b!1034342 m!953533))

(assert (=> b!1034342 m!953533))

(declare-fun m!954445 () Bool)

(assert (=> b!1034342 m!954445))

(assert (=> b!1034344 m!953533))

(assert (=> b!1034344 m!953533))

(assert (=> b!1034344 m!954445))

(assert (=> d!123841 d!124175))

(declare-fun b!1034348 () Bool)

(declare-fun e!584697 () Option!639)

(assert (=> b!1034348 (= e!584697 None!637)))

(declare-fun b!1034345 () Bool)

(declare-fun e!584696 () Option!639)

(assert (=> b!1034345 (= e!584696 (Some!638 (_2!7874 (h!23103 lt!456273))))))

(declare-fun b!1034347 () Bool)

(assert (=> b!1034347 (= e!584697 (getValueByKey!588 (t!31103 lt!456273) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun d!124177 () Bool)

(declare-fun c!104586 () Bool)

(assert (=> d!124177 (= c!104586 (and ((_ is Cons!21901) lt!456273) (= (_1!7874 (h!23103 lt!456273)) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!124177 (= (getValueByKey!588 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) e!584696)))

(declare-fun b!1034346 () Bool)

(assert (=> b!1034346 (= e!584696 e!584697)))

(declare-fun c!104587 () Bool)

(assert (=> b!1034346 (= c!104587 (and ((_ is Cons!21901) lt!456273) (not (= (_1!7874 (h!23103 lt!456273)) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(assert (= (and d!124177 c!104586) b!1034345))

(assert (= (and d!124177 (not c!104586)) b!1034346))

(assert (= (and b!1034346 c!104587) b!1034347))

(assert (= (and b!1034346 (not c!104587)) b!1034348))

(declare-fun m!954447 () Bool)

(assert (=> b!1034347 m!954447))

(assert (=> d!123841 d!124177))

(declare-fun d!124179 () Bool)

(assert (=> d!124179 (= (getValueByKey!588 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) (Some!638 (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun lt!456547 () Unit!33831)

(assert (=> d!124179 (= lt!456547 (choose!1700 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun e!584698 () Bool)

(assert (=> d!124179 e!584698))

(declare-fun res!690872 () Bool)

(assert (=> d!124179 (=> (not res!690872) (not e!584698))))

(assert (=> d!124179 (= res!690872 (isStrictlySorted!718 lt!456273))))

(assert (=> d!124179 (= (lemmaContainsTupThenGetReturnValue!279 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456547)))

(declare-fun b!1034349 () Bool)

(declare-fun res!690873 () Bool)

(assert (=> b!1034349 (=> (not res!690873) (not e!584698))))

(assert (=> b!1034349 (= res!690873 (containsKey!563 lt!456273 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034350 () Bool)

(assert (=> b!1034350 (= e!584698 (contains!6013 lt!456273 (tuple2!15727 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124179 res!690872) b!1034349))

(assert (= (and b!1034349 res!690873) b!1034350))

(assert (=> d!124179 m!953527))

(declare-fun m!954449 () Bool)

(assert (=> d!124179 m!954449))

(declare-fun m!954451 () Bool)

(assert (=> d!124179 m!954451))

(declare-fun m!954453 () Bool)

(assert (=> b!1034349 m!954453))

(declare-fun m!954455 () Bool)

(assert (=> b!1034350 m!954455))

(assert (=> d!123841 d!124179))

(declare-fun bm!43723 () Bool)

(declare-fun call!43728 () List!21905)

(declare-fun call!43726 () List!21905)

(assert (=> bm!43723 (= call!43728 call!43726)))

(declare-fun d!124181 () Bool)

(declare-fun e!584699 () Bool)

(assert (=> d!124181 e!584699))

(declare-fun res!690875 () Bool)

(assert (=> d!124181 (=> (not res!690875) (not e!584699))))

(declare-fun lt!456548 () List!21905)

(assert (=> d!124181 (= res!690875 (isStrictlySorted!718 lt!456548))))

(declare-fun e!584700 () List!21905)

(assert (=> d!124181 (= lt!456548 e!584700)))

(declare-fun c!104591 () Bool)

(assert (=> d!124181 (= c!104591 (and ((_ is Cons!21901) (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (bvslt (_1!7874 (h!23103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (=> d!124181 (isStrictlySorted!718 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))))))

(assert (=> d!124181 (= (insertStrictlySorted!372 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))) lt!456548)))

(declare-fun b!1034351 () Bool)

(declare-fun e!584702 () List!21905)

(declare-fun call!43727 () List!21905)

(assert (=> b!1034351 (= e!584702 call!43727)))

(declare-fun b!1034352 () Bool)

(declare-fun c!104588 () Bool)

(assert (=> b!1034352 (= c!104588 (and ((_ is Cons!21901) (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (bvsgt (_1!7874 (h!23103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun e!584703 () List!21905)

(assert (=> b!1034352 (= e!584703 e!584702)))

(declare-fun b!1034353 () Bool)

(assert (=> b!1034353 (= e!584700 call!43726)))

(declare-fun bm!43724 () Bool)

(assert (=> bm!43724 (= call!43727 call!43728)))

(declare-fun b!1034354 () Bool)

(assert (=> b!1034354 (= e!584700 e!584703)))

(declare-fun c!104589 () Bool)

(assert (=> b!1034354 (= c!104589 (and ((_ is Cons!21901) (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (= (_1!7874 (h!23103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1034355 () Bool)

(declare-fun res!690874 () Bool)

(assert (=> b!1034355 (=> (not res!690874) (not e!584699))))

(assert (=> b!1034355 (= res!690874 (containsKey!563 lt!456548 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034356 () Bool)

(assert (=> b!1034356 (= e!584703 call!43728)))

(declare-fun bm!43725 () Bool)

(declare-fun e!584701 () List!21905)

(assert (=> bm!43725 (= call!43726 ($colon$colon!602 e!584701 (ite c!104591 (h!23103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (tuple2!15727 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))))

(declare-fun c!104590 () Bool)

(assert (=> bm!43725 (= c!104590 c!104591)))

(declare-fun b!1034357 () Bool)

(assert (=> b!1034357 (= e!584699 (contains!6013 lt!456548 (tuple2!15727 (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun b!1034358 () Bool)

(assert (=> b!1034358 (= e!584702 call!43727)))

(declare-fun b!1034359 () Bool)

(assert (=> b!1034359 (= e!584701 (insertStrictlySorted!372 (t!31103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (_1!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (_2!7874 (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034360 () Bool)

(assert (=> b!1034360 (= e!584701 (ite c!104589 (t!31103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (ite c!104588 (Cons!21901 (h!23103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666)))) (t!31103 (toList!6893 (ite c!104389 call!43669 (ite c!104394 call!43672 call!43666))))) Nil!21902)))))

(assert (= (and d!124181 c!104591) b!1034353))

(assert (= (and d!124181 (not c!104591)) b!1034354))

(assert (= (and b!1034354 c!104589) b!1034356))

(assert (= (and b!1034354 (not c!104589)) b!1034352))

(assert (= (and b!1034352 c!104588) b!1034358))

(assert (= (and b!1034352 (not c!104588)) b!1034351))

(assert (= (or b!1034358 b!1034351) bm!43724))

(assert (= (or b!1034356 bm!43724) bm!43723))

(assert (= (or b!1034353 bm!43723) bm!43725))

(assert (= (and bm!43725 c!104590) b!1034359))

(assert (= (and bm!43725 (not c!104590)) b!1034360))

(assert (= (and d!124181 res!690875) b!1034355))

(assert (= (and b!1034355 res!690874) b!1034357))

(declare-fun m!954457 () Bool)

(assert (=> d!124181 m!954457))

(declare-fun m!954459 () Bool)

(assert (=> d!124181 m!954459))

(declare-fun m!954461 () Bool)

(assert (=> b!1034355 m!954461))

(declare-fun m!954463 () Bool)

(assert (=> b!1034359 m!954463))

(declare-fun m!954465 () Bool)

(assert (=> b!1034357 m!954465))

(declare-fun m!954467 () Bool)

(assert (=> bm!43725 m!954467))

(assert (=> d!123841 d!124181))

(assert (=> d!123869 d!123877))

(assert (=> d!123869 d!123881))

(declare-fun d!124183 () Bool)

(assert (=> d!124183 (contains!6012 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)) lt!456188)))

(assert (=> d!124183 true))

(declare-fun _$35!439 () Unit!33831)

(assert (=> d!124183 (= (choose!1698 lt!456203 lt!456189 lt!456123 lt!456188) _$35!439)))

(declare-fun bs!30252 () Bool)

(assert (= bs!30252 d!124183))

(assert (=> bs!30252 m!953387))

(assert (=> bs!30252 m!953387))

(assert (=> bs!30252 m!953389))

(assert (=> d!123869 d!124183))

(declare-fun d!124185 () Bool)

(declare-fun e!584704 () Bool)

(assert (=> d!124185 e!584704))

(declare-fun res!690876 () Bool)

(assert (=> d!124185 (=> res!690876 e!584704)))

(declare-fun lt!456552 () Bool)

(assert (=> d!124185 (= res!690876 (not lt!456552))))

(declare-fun lt!456550 () Bool)

(assert (=> d!124185 (= lt!456552 lt!456550)))

(declare-fun lt!456549 () Unit!33831)

(declare-fun e!584705 () Unit!33831)

(assert (=> d!124185 (= lt!456549 e!584705)))

(declare-fun c!104592 () Bool)

(assert (=> d!124185 (= c!104592 lt!456550)))

(assert (=> d!124185 (= lt!456550 (containsKey!563 (toList!6893 lt!456203) lt!456188))))

(assert (=> d!124185 (= (contains!6012 lt!456203 lt!456188) lt!456552)))

(declare-fun b!1034361 () Bool)

(declare-fun lt!456551 () Unit!33831)

(assert (=> b!1034361 (= e!584705 lt!456551)))

(assert (=> b!1034361 (= lt!456551 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456203) lt!456188))))

(assert (=> b!1034361 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456203) lt!456188))))

(declare-fun b!1034362 () Bool)

(declare-fun Unit!33864 () Unit!33831)

(assert (=> b!1034362 (= e!584705 Unit!33864)))

(declare-fun b!1034363 () Bool)

(assert (=> b!1034363 (= e!584704 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456203) lt!456188)))))

(assert (= (and d!124185 c!104592) b!1034361))

(assert (= (and d!124185 (not c!104592)) b!1034362))

(assert (= (and d!124185 (not res!690876)) b!1034363))

(declare-fun m!954469 () Bool)

(assert (=> d!124185 m!954469))

(declare-fun m!954471 () Bool)

(assert (=> b!1034361 m!954471))

(declare-fun m!954473 () Bool)

(assert (=> b!1034361 m!954473))

(assert (=> b!1034361 m!954473))

(declare-fun m!954475 () Bool)

(assert (=> b!1034361 m!954475))

(assert (=> b!1034363 m!954473))

(assert (=> b!1034363 m!954473))

(assert (=> b!1034363 m!954475))

(assert (=> d!123869 d!124185))

(declare-fun b!1034364 () Bool)

(declare-fun e!584706 () Bool)

(declare-fun e!584708 () Bool)

(assert (=> b!1034364 (= e!584706 e!584708)))

(declare-fun lt!456554 () (_ BitVec 64))

(assert (=> b!1034364 (= lt!456554 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!456553 () Unit!33831)

(assert (=> b!1034364 (= lt!456553 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 lt!456124) lt!456554 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034364 (arrayContainsKey!0 (_keys!11407 lt!456124) lt!456554 #b00000000000000000000000000000000)))

(declare-fun lt!456555 () Unit!33831)

(assert (=> b!1034364 (= lt!456555 lt!456553)))

(declare-fun res!690877 () Bool)

(assert (=> b!1034364 (= res!690877 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11407 lt!456124) (mask!30084 lt!456124)) (Found!9738 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034364 (=> (not res!690877) (not e!584708))))

(declare-fun b!1034365 () Bool)

(declare-fun call!43729 () Bool)

(assert (=> b!1034365 (= e!584708 call!43729)))

(declare-fun d!124187 () Bool)

(declare-fun res!690878 () Bool)

(declare-fun e!584707 () Bool)

(assert (=> d!124187 (=> res!690878 e!584707)))

(assert (=> d!124187 (= res!690878 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!124187 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11407 lt!456124) (mask!30084 lt!456124)) e!584707)))

(declare-fun b!1034366 () Bool)

(assert (=> b!1034366 (= e!584707 e!584706)))

(declare-fun c!104593 () Bool)

(assert (=> b!1034366 (= c!104593 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034367 () Bool)

(assert (=> b!1034367 (= e!584706 call!43729)))

(declare-fun bm!43726 () Bool)

(assert (=> bm!43726 (= call!43729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11407 lt!456124) (mask!30084 lt!456124)))))

(assert (= (and d!124187 (not res!690878)) b!1034366))

(assert (= (and b!1034366 c!104593) b!1034364))

(assert (= (and b!1034366 (not c!104593)) b!1034367))

(assert (= (and b!1034364 res!690877) b!1034365))

(assert (= (or b!1034365 b!1034367) bm!43726))

(assert (=> b!1034364 m!954363))

(declare-fun m!954477 () Bool)

(assert (=> b!1034364 m!954477))

(declare-fun m!954479 () Bool)

(assert (=> b!1034364 m!954479))

(assert (=> b!1034364 m!954363))

(declare-fun m!954481 () Bool)

(assert (=> b!1034364 m!954481))

(assert (=> b!1034366 m!954363))

(assert (=> b!1034366 m!954363))

(assert (=> b!1034366 m!954367))

(declare-fun m!954483 () Bool)

(assert (=> bm!43726 m!954483))

(assert (=> bm!43672 d!124187))

(declare-fun b!1034371 () Bool)

(declare-fun e!584710 () Option!639)

(assert (=> b!1034371 (= e!584710 None!637)))

(declare-fun b!1034368 () Bool)

(declare-fun e!584709 () Option!639)

(assert (=> b!1034368 (= e!584709 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456356)))))))

(declare-fun b!1034370 () Bool)

(assert (=> b!1034370 (= e!584710 (getValueByKey!588 (t!31103 (toList!6893 lt!456356)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun d!124189 () Bool)

(declare-fun c!104594 () Bool)

(assert (=> d!124189 (= c!104594 (and ((_ is Cons!21901) (toList!6893 lt!456356)) (= (_1!7874 (h!23103 (toList!6893 lt!456356))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124189 (= (getValueByKey!588 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) e!584709)))

(declare-fun b!1034369 () Bool)

(assert (=> b!1034369 (= e!584709 e!584710)))

(declare-fun c!104595 () Bool)

(assert (=> b!1034369 (= c!104595 (and ((_ is Cons!21901) (toList!6893 lt!456356)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456356))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124189 c!104594) b!1034368))

(assert (= (and d!124189 (not c!104594)) b!1034369))

(assert (= (and b!1034369 c!104595) b!1034370))

(assert (= (and b!1034369 (not c!104595)) b!1034371))

(declare-fun m!954485 () Bool)

(assert (=> b!1034370 m!954485))

(assert (=> b!1033881 d!124189))

(declare-fun d!124191 () Bool)

(assert (=> d!124191 (= (apply!906 lt!456298 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (get!16434 (getValueByKey!588 (toList!6893 lt!456298) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun bs!30253 () Bool)

(assert (= bs!30253 d!124191))

(assert (=> bs!30253 m!953361))

(declare-fun m!954487 () Bool)

(assert (=> bs!30253 m!954487))

(assert (=> bs!30253 m!954487))

(declare-fun m!954489 () Bool)

(assert (=> bs!30253 m!954489))

(assert (=> b!1033816 d!124191))

(assert (=> b!1033816 d!123847))

(declare-fun d!124193 () Bool)

(assert (=> d!124193 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun lt!456556 () Unit!33831)

(assert (=> d!124193 (= lt!456556 (choose!1699 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun e!584711 () Bool)

(assert (=> d!124193 e!584711))

(declare-fun res!690879 () Bool)

(assert (=> d!124193 (=> (not res!690879) (not e!584711))))

(assert (=> d!124193 (= res!690879 (isStrictlySorted!718 (toList!6893 lt!456221)))))

(assert (=> d!124193 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456556)))

(declare-fun b!1034372 () Bool)

(assert (=> b!1034372 (= e!584711 (containsKey!563 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124193 res!690879) b!1034372))

(assert (=> d!124193 m!953361))

(assert (=> d!124193 m!953819))

(assert (=> d!124193 m!953819))

(assert (=> d!124193 m!953821))

(assert (=> d!124193 m!953361))

(declare-fun m!954491 () Bool)

(assert (=> d!124193 m!954491))

(assert (=> d!124193 m!953985))

(assert (=> b!1034372 m!953361))

(assert (=> b!1034372 m!953815))

(assert (=> b!1033933 d!124193))

(declare-fun d!124195 () Bool)

(assert (=> d!124195 (= (isDefined!435 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) (not (isEmpty!927 (getValueByKey!588 (toList!6893 lt!456221) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))))

(declare-fun bs!30254 () Bool)

(assert (= bs!30254 d!124195))

(assert (=> bs!30254 m!953819))

(declare-fun m!954493 () Bool)

(assert (=> bs!30254 m!954493))

(assert (=> b!1033933 d!124195))

(assert (=> b!1033933 d!124105))

(declare-fun d!124197 () Bool)

(assert (=> d!124197 (arrayContainsKey!0 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000)))

(declare-fun lt!456559 () Unit!33831)

(declare-fun choose!13 (array!65118 (_ BitVec 64) (_ BitVec 32)) Unit!33831)

(assert (=> d!124197 (= lt!456559 (choose!13 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000))))

(assert (=> d!124197 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124197 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000) lt!456559)))

(declare-fun bs!30255 () Bool)

(assert (= bs!30255 d!124197))

(assert (=> bs!30255 m!953489))

(declare-fun m!954495 () Bool)

(assert (=> bs!30255 m!954495))

(assert (=> b!1033737 d!124197))

(declare-fun d!124199 () Bool)

(declare-fun res!690884 () Bool)

(declare-fun e!584716 () Bool)

(assert (=> d!124199 (=> res!690884 e!584716)))

(assert (=> d!124199 (= res!690884 (= (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) lt!456237))))

(assert (=> d!124199 (= (arrayContainsKey!0 (_keys!11407 lt!456124) lt!456237 #b00000000000000000000000000000000) e!584716)))

(declare-fun b!1034377 () Bool)

(declare-fun e!584717 () Bool)

(assert (=> b!1034377 (= e!584716 e!584717)))

(declare-fun res!690885 () Bool)

(assert (=> b!1034377 (=> (not res!690885) (not e!584717))))

(assert (=> b!1034377 (= res!690885 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1034378 () Bool)

(assert (=> b!1034378 (= e!584717 (arrayContainsKey!0 (_keys!11407 lt!456124) lt!456237 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124199 (not res!690884)) b!1034377))

(assert (= (and b!1034377 res!690885) b!1034378))

(assert (=> d!124199 m!953485))

(declare-fun m!954497 () Bool)

(assert (=> b!1034378 m!954497))

(assert (=> b!1033737 d!124199))

(declare-fun d!124201 () Bool)

(declare-fun lt!456568 () SeekEntryResult!9738)

(assert (=> d!124201 (and (or ((_ is Undefined!9738) lt!456568) (not ((_ is Found!9738) lt!456568)) (and (bvsge (index!41324 lt!456568) #b00000000000000000000000000000000) (bvslt (index!41324 lt!456568) (size!31875 (_keys!11407 lt!456124))))) (or ((_ is Undefined!9738) lt!456568) ((_ is Found!9738) lt!456568) (not ((_ is MissingZero!9738) lt!456568)) (and (bvsge (index!41323 lt!456568) #b00000000000000000000000000000000) (bvslt (index!41323 lt!456568) (size!31875 (_keys!11407 lt!456124))))) (or ((_ is Undefined!9738) lt!456568) ((_ is Found!9738) lt!456568) ((_ is MissingZero!9738) lt!456568) (not ((_ is MissingVacant!9738) lt!456568)) (and (bvsge (index!41326 lt!456568) #b00000000000000000000000000000000) (bvslt (index!41326 lt!456568) (size!31875 (_keys!11407 lt!456124))))) (or ((_ is Undefined!9738) lt!456568) (ite ((_ is Found!9738) lt!456568) (= (select (arr!31353 (_keys!11407 lt!456124)) (index!41324 lt!456568)) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9738) lt!456568) (= (select (arr!31353 (_keys!11407 lt!456124)) (index!41323 lt!456568)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9738) lt!456568) (= (select (arr!31353 (_keys!11407 lt!456124)) (index!41326 lt!456568)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!584725 () SeekEntryResult!9738)

(assert (=> d!124201 (= lt!456568 e!584725)))

(declare-fun c!104603 () Bool)

(declare-fun lt!456566 () SeekEntryResult!9738)

(assert (=> d!124201 (= c!104603 (and ((_ is Intermediate!9738) lt!456566) (undefined!10550 lt!456566)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65118 (_ BitVec 32)) SeekEntryResult!9738)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!124201 (= lt!456566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (mask!30084 lt!456124)) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (_keys!11407 lt!456124) (mask!30084 lt!456124)))))

(assert (=> d!124201 (validMask!0 (mask!30084 lt!456124))))

(assert (=> d!124201 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (_keys!11407 lt!456124) (mask!30084 lt!456124)) lt!456568)))

(declare-fun b!1034391 () Bool)

(declare-fun e!584724 () SeekEntryResult!9738)

(assert (=> b!1034391 (= e!584725 e!584724)))

(declare-fun lt!456567 () (_ BitVec 64))

(assert (=> b!1034391 (= lt!456567 (select (arr!31353 (_keys!11407 lt!456124)) (index!41325 lt!456566)))))

(declare-fun c!104604 () Bool)

(assert (=> b!1034391 (= c!104604 (= lt!456567 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun b!1034392 () Bool)

(declare-fun e!584726 () SeekEntryResult!9738)

(assert (=> b!1034392 (= e!584726 (MissingZero!9738 (index!41325 lt!456566)))))

(declare-fun b!1034393 () Bool)

(assert (=> b!1034393 (= e!584724 (Found!9738 (index!41325 lt!456566)))))

(declare-fun b!1034394 () Bool)

(assert (=> b!1034394 (= e!584725 Undefined!9738)))

(declare-fun b!1034395 () Bool)

(declare-fun c!104602 () Bool)

(assert (=> b!1034395 (= c!104602 (= lt!456567 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034395 (= e!584724 e!584726)))

(declare-fun b!1034396 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!65118 (_ BitVec 32)) SeekEntryResult!9738)

(assert (=> b!1034396 (= e!584726 (seekKeyOrZeroReturnVacant!0 (x!92225 lt!456566) (index!41325 lt!456566) (index!41325 lt!456566) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000) (_keys!11407 lt!456124) (mask!30084 lt!456124)))))

(assert (= (and d!124201 c!104603) b!1034394))

(assert (= (and d!124201 (not c!104603)) b!1034391))

(assert (= (and b!1034391 c!104604) b!1034393))

(assert (= (and b!1034391 (not c!104604)) b!1034395))

(assert (= (and b!1034395 c!104602) b!1034392))

(assert (= (and b!1034395 (not c!104602)) b!1034396))

(assert (=> d!124201 m!953687))

(assert (=> d!124201 m!953485))

(declare-fun m!954499 () Bool)

(assert (=> d!124201 m!954499))

(assert (=> d!124201 m!954499))

(assert (=> d!124201 m!953485))

(declare-fun m!954501 () Bool)

(assert (=> d!124201 m!954501))

(declare-fun m!954503 () Bool)

(assert (=> d!124201 m!954503))

(declare-fun m!954505 () Bool)

(assert (=> d!124201 m!954505))

(declare-fun m!954507 () Bool)

(assert (=> d!124201 m!954507))

(declare-fun m!954509 () Bool)

(assert (=> b!1034391 m!954509))

(assert (=> b!1034396 m!953485))

(declare-fun m!954511 () Bool)

(assert (=> b!1034396 m!954511))

(assert (=> b!1033737 d!124201))

(declare-fun d!124203 () Bool)

(declare-fun lt!456569 () Bool)

(assert (=> d!124203 (= lt!456569 (select (content!513 (toList!6893 lt!456330)) (tuple2!15727 lt!456189 lt!456123)))))

(declare-fun e!584728 () Bool)

(assert (=> d!124203 (= lt!456569 e!584728)))

(declare-fun res!690886 () Bool)

(assert (=> d!124203 (=> (not res!690886) (not e!584728))))

(assert (=> d!124203 (= res!690886 ((_ is Cons!21901) (toList!6893 lt!456330)))))

(assert (=> d!124203 (= (contains!6013 (toList!6893 lt!456330) (tuple2!15727 lt!456189 lt!456123)) lt!456569)))

(declare-fun b!1034397 () Bool)

(declare-fun e!584727 () Bool)

(assert (=> b!1034397 (= e!584728 e!584727)))

(declare-fun res!690887 () Bool)

(assert (=> b!1034397 (=> res!690887 e!584727)))

(assert (=> b!1034397 (= res!690887 (= (h!23103 (toList!6893 lt!456330)) (tuple2!15727 lt!456189 lt!456123)))))

(declare-fun b!1034398 () Bool)

(assert (=> b!1034398 (= e!584727 (contains!6013 (t!31103 (toList!6893 lt!456330)) (tuple2!15727 lt!456189 lt!456123)))))

(assert (= (and d!124203 res!690886) b!1034397))

(assert (= (and b!1034397 (not res!690887)) b!1034398))

(declare-fun m!954513 () Bool)

(assert (=> d!124203 m!954513))

(declare-fun m!954515 () Bool)

(assert (=> d!124203 m!954515))

(declare-fun m!954517 () Bool)

(assert (=> b!1034398 m!954517))

(assert (=> b!1033847 d!124203))

(declare-fun d!124205 () Bool)

(declare-fun lt!456570 () Bool)

(assert (=> d!124205 (= lt!456570 (select (content!513 (toList!6893 lt!456303)) (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))

(declare-fun e!584730 () Bool)

(assert (=> d!124205 (= lt!456570 e!584730)))

(declare-fun res!690888 () Bool)

(assert (=> d!124205 (=> (not res!690888) (not e!584730))))

(assert (=> d!124205 (= res!690888 ((_ is Cons!21901) (toList!6893 lt!456303)))))

(assert (=> d!124205 (= (contains!6013 (toList!6893 lt!456303) (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))) lt!456570)))

(declare-fun b!1034399 () Bool)

(declare-fun e!584729 () Bool)

(assert (=> b!1034399 (= e!584730 e!584729)))

(declare-fun res!690889 () Bool)

(assert (=> b!1034399 (=> res!690889 e!584729)))

(assert (=> b!1034399 (= res!690889 (= (h!23103 (toList!6893 lt!456303)) (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))

(declare-fun b!1034400 () Bool)

(assert (=> b!1034400 (= e!584729 (contains!6013 (t!31103 (toList!6893 lt!456303)) (tuple2!15727 lt!456202 (minValue!6063 thiss!1427))))))

(assert (= (and d!124205 res!690888) b!1034399))

(assert (= (and b!1034399 (not res!690889)) b!1034400))

(declare-fun m!954519 () Bool)

(assert (=> d!124205 m!954519))

(declare-fun m!954521 () Bool)

(assert (=> d!124205 m!954521))

(declare-fun m!954523 () Bool)

(assert (=> b!1034400 m!954523))

(assert (=> b!1033821 d!124205))

(declare-fun d!124207 () Bool)

(assert (=> d!124207 (= (size!31879 lt!456124) (bvadd (_size!2908 lt!456124) (bvsdiv (bvadd (extraKeys!5959 lt!456124) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!1033857 d!124207))

(declare-fun d!124209 () Bool)

(declare-fun lt!456571 () (_ BitVec 32))

(assert (=> d!124209 (and (bvsge lt!456571 #b00000000000000000000000000000000) (bvsle lt!456571 (bvsub (size!31875 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!584731 () (_ BitVec 32))

(assert (=> d!124209 (= lt!456571 e!584731)))

(declare-fun c!104605 () Bool)

(assert (=> d!124209 (= c!104605 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!124209 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!31875 (_keys!11407 lt!456124)) (size!31875 (_keys!11407 lt!456124))))))

(assert (=> d!124209 (= (arrayCountValidKeys!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))) lt!456571)))

(declare-fun b!1034401 () Bool)

(declare-fun e!584732 () (_ BitVec 32))

(declare-fun call!43730 () (_ BitVec 32))

(assert (=> b!1034401 (= e!584732 (bvadd #b00000000000000000000000000000001 call!43730))))

(declare-fun b!1034402 () Bool)

(assert (=> b!1034402 (= e!584731 e!584732)))

(declare-fun c!104606 () Bool)

(assert (=> b!1034402 (= c!104606 (validKeyInArray!0 (select (arr!31353 (_keys!11407 lt!456124)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034403 () Bool)

(assert (=> b!1034403 (= e!584731 #b00000000000000000000000000000000)))

(declare-fun bm!43727 () Bool)

(assert (=> bm!43727 (= call!43730 (arrayCountValidKeys!0 (_keys!11407 lt!456124) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!31875 (_keys!11407 lt!456124))))))

(declare-fun b!1034404 () Bool)

(assert (=> b!1034404 (= e!584732 call!43730)))

(assert (= (and d!124209 c!104605) b!1034403))

(assert (= (and d!124209 (not c!104605)) b!1034402))

(assert (= (and b!1034402 c!104606) b!1034401))

(assert (= (and b!1034402 (not c!104606)) b!1034404))

(assert (= (or b!1034401 b!1034404) bm!43727))

(assert (=> b!1034402 m!954363))

(assert (=> b!1034402 m!954363))

(assert (=> b!1034402 m!954367))

(declare-fun m!954525 () Bool)

(assert (=> bm!43727 m!954525))

(assert (=> bm!43675 d!124209))

(declare-fun d!124211 () Bool)

(declare-fun e!584733 () Bool)

(assert (=> d!124211 e!584733))

(declare-fun res!690890 () Bool)

(assert (=> d!124211 (=> res!690890 e!584733)))

(declare-fun lt!456575 () Bool)

(assert (=> d!124211 (= res!690890 (not lt!456575))))

(declare-fun lt!456573 () Bool)

(assert (=> d!124211 (= lt!456575 lt!456573)))

(declare-fun lt!456572 () Unit!33831)

(declare-fun e!584734 () Unit!33831)

(assert (=> d!124211 (= lt!456572 e!584734)))

(declare-fun c!104607 () Bool)

(assert (=> d!124211 (= c!104607 lt!456573)))

(assert (=> d!124211 (= lt!456573 (containsKey!563 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(assert (=> d!124211 (= (contains!6012 lt!456383 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456575)))

(declare-fun b!1034405 () Bool)

(declare-fun lt!456574 () Unit!33831)

(assert (=> b!1034405 (= e!584734 lt!456574)))

(assert (=> b!1034405 (= lt!456574 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034405 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034406 () Bool)

(declare-fun Unit!33865 () Unit!33831)

(assert (=> b!1034406 (= e!584734 Unit!33865)))

(declare-fun b!1034407 () Bool)

(assert (=> b!1034407 (= e!584733 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456383) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124211 c!104607) b!1034405))

(assert (= (and d!124211 (not c!104607)) b!1034406))

(assert (= (and d!124211 (not res!690890)) b!1034407))

(declare-fun m!954527 () Bool)

(assert (=> d!124211 m!954527))

(declare-fun m!954529 () Bool)

(assert (=> b!1034405 m!954529))

(assert (=> b!1034405 m!953833))

(assert (=> b!1034405 m!953833))

(declare-fun m!954531 () Bool)

(assert (=> b!1034405 m!954531))

(assert (=> b!1034407 m!953833))

(assert (=> b!1034407 m!953833))

(assert (=> b!1034407 m!954531))

(assert (=> d!123917 d!124211))

(declare-fun b!1034411 () Bool)

(declare-fun e!584736 () Option!639)

(assert (=> b!1034411 (= e!584736 None!637)))

(declare-fun b!1034408 () Bool)

(declare-fun e!584735 () Option!639)

(assert (=> b!1034408 (= e!584735 (Some!638 (_2!7874 (h!23103 lt!456386))))))

(declare-fun b!1034410 () Bool)

(assert (=> b!1034410 (= e!584736 (getValueByKey!588 (t!31103 lt!456386) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun d!124213 () Bool)

(declare-fun c!104608 () Bool)

(assert (=> d!124213 (= c!104608 (and ((_ is Cons!21901) lt!456386) (= (_1!7874 (h!23103 lt!456386)) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(assert (=> d!124213 (= (getValueByKey!588 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) e!584735)))

(declare-fun b!1034409 () Bool)

(assert (=> b!1034409 (= e!584735 e!584736)))

(declare-fun c!104609 () Bool)

(assert (=> b!1034409 (= c!104609 (and ((_ is Cons!21901) lt!456386) (not (= (_1!7874 (h!23103 lt!456386)) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124213 c!104608) b!1034408))

(assert (= (and d!124213 (not c!104608)) b!1034409))

(assert (= (and b!1034409 c!104609) b!1034410))

(assert (= (and b!1034409 (not c!104609)) b!1034411))

(declare-fun m!954533 () Bool)

(assert (=> b!1034410 m!954533))

(assert (=> d!123917 d!124213))

(declare-fun d!124215 () Bool)

(assert (=> d!124215 (= (getValueByKey!588 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456576 () Unit!33831)

(assert (=> d!124215 (= lt!456576 (choose!1700 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun e!584737 () Bool)

(assert (=> d!124215 e!584737))

(declare-fun res!690891 () Bool)

(assert (=> d!124215 (=> (not res!690891) (not e!584737))))

(assert (=> d!124215 (= res!690891 (isStrictlySorted!718 lt!456386))))

(assert (=> d!124215 (= (lemmaContainsTupThenGetReturnValue!279 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456576)))

(declare-fun b!1034412 () Bool)

(declare-fun res!690892 () Bool)

(assert (=> b!1034412 (=> (not res!690892) (not e!584737))))

(assert (=> b!1034412 (= res!690892 (containsKey!563 lt!456386 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034413 () Bool)

(assert (=> b!1034413 (= e!584737 (contains!6013 lt!456386 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124215 res!690891) b!1034412))

(assert (= (and b!1034412 res!690892) b!1034413))

(assert (=> d!124215 m!953827))

(declare-fun m!954535 () Bool)

(assert (=> d!124215 m!954535))

(declare-fun m!954537 () Bool)

(assert (=> d!124215 m!954537))

(declare-fun m!954539 () Bool)

(assert (=> b!1034412 m!954539))

(declare-fun m!954541 () Bool)

(assert (=> b!1034413 m!954541))

(assert (=> d!123917 d!124215))

(declare-fun bm!43728 () Bool)

(declare-fun call!43733 () List!21905)

(declare-fun call!43731 () List!21905)

(assert (=> bm!43728 (= call!43733 call!43731)))

(declare-fun d!124217 () Bool)

(declare-fun e!584738 () Bool)

(assert (=> d!124217 e!584738))

(declare-fun res!690894 () Bool)

(assert (=> d!124217 (=> (not res!690894) (not e!584738))))

(declare-fun lt!456577 () List!21905)

(assert (=> d!124217 (= res!690894 (isStrictlySorted!718 lt!456577))))

(declare-fun e!584739 () List!21905)

(assert (=> d!124217 (= lt!456577 e!584739)))

(declare-fun c!104613 () Bool)

(assert (=> d!124217 (= c!104613 (and ((_ is Cons!21901) (toList!6893 lt!456211)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456211))) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(assert (=> d!124217 (isStrictlySorted!718 (toList!6893 lt!456211))))

(assert (=> d!124217 (= (insertStrictlySorted!372 (toList!6893 lt!456211) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456577)))

(declare-fun b!1034414 () Bool)

(declare-fun e!584741 () List!21905)

(declare-fun call!43732 () List!21905)

(assert (=> b!1034414 (= e!584741 call!43732)))

(declare-fun b!1034415 () Bool)

(declare-fun c!104610 () Bool)

(assert (=> b!1034415 (= c!104610 (and ((_ is Cons!21901) (toList!6893 lt!456211)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456211))) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(declare-fun e!584742 () List!21905)

(assert (=> b!1034415 (= e!584742 e!584741)))

(declare-fun b!1034416 () Bool)

(assert (=> b!1034416 (= e!584739 call!43731)))

(declare-fun bm!43729 () Bool)

(assert (=> bm!43729 (= call!43732 call!43733)))

(declare-fun b!1034417 () Bool)

(assert (=> b!1034417 (= e!584739 e!584742)))

(declare-fun c!104611 () Bool)

(assert (=> b!1034417 (= c!104611 (and ((_ is Cons!21901) (toList!6893 lt!456211)) (= (_1!7874 (h!23103 (toList!6893 lt!456211))) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034418 () Bool)

(declare-fun res!690893 () Bool)

(assert (=> b!1034418 (=> (not res!690893) (not e!584738))))

(assert (=> b!1034418 (= res!690893 (containsKey!563 lt!456577 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034419 () Bool)

(assert (=> b!1034419 (= e!584742 call!43733)))

(declare-fun bm!43730 () Bool)

(declare-fun e!584740 () List!21905)

(assert (=> bm!43730 (= call!43731 ($colon$colon!602 e!584740 (ite c!104613 (h!23103 (toList!6893 lt!456211)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104612 () Bool)

(assert (=> bm!43730 (= c!104612 c!104613)))

(declare-fun b!1034420 () Bool)

(assert (=> b!1034420 (= e!584738 (contains!6013 lt!456577 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034421 () Bool)

(assert (=> b!1034421 (= e!584741 call!43732)))

(declare-fun b!1034422 () Bool)

(assert (=> b!1034422 (= e!584740 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456211)) (_1!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034423 () Bool)

(assert (=> b!1034423 (= e!584740 (ite c!104611 (t!31103 (toList!6893 lt!456211)) (ite c!104610 (Cons!21901 (h!23103 (toList!6893 lt!456211)) (t!31103 (toList!6893 lt!456211))) Nil!21902)))))

(assert (= (and d!124217 c!104613) b!1034416))

(assert (= (and d!124217 (not c!104613)) b!1034417))

(assert (= (and b!1034417 c!104611) b!1034419))

(assert (= (and b!1034417 (not c!104611)) b!1034415))

(assert (= (and b!1034415 c!104610) b!1034421))

(assert (= (and b!1034415 (not c!104610)) b!1034414))

(assert (= (or b!1034421 b!1034414) bm!43729))

(assert (= (or b!1034419 bm!43729) bm!43728))

(assert (= (or b!1034416 bm!43728) bm!43730))

(assert (= (and bm!43730 c!104612) b!1034422))

(assert (= (and bm!43730 (not c!104612)) b!1034423))

(assert (= (and d!124217 res!690894) b!1034418))

(assert (= (and b!1034418 res!690893) b!1034420))

(declare-fun m!954543 () Bool)

(assert (=> d!124217 m!954543))

(declare-fun m!954545 () Bool)

(assert (=> d!124217 m!954545))

(declare-fun m!954547 () Bool)

(assert (=> b!1034418 m!954547))

(declare-fun m!954549 () Bool)

(assert (=> b!1034422 m!954549))

(declare-fun m!954551 () Bool)

(assert (=> b!1034420 m!954551))

(declare-fun m!954553 () Bool)

(assert (=> bm!43730 m!954553))

(assert (=> d!123917 d!124217))

(assert (=> b!1033770 d!123991))

(assert (=> b!1033770 d!123993))

(assert (=> b!1033767 d!123973))

(assert (=> b!1033767 d!123975))

(declare-fun d!124219 () Bool)

(assert (=> d!124219 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14889 (getValueByKey!588 (toList!6893 lt!456221) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123947 d!124219))

(assert (=> d!123947 d!124147))

(assert (=> b!1033775 d!123981))

(assert (=> b!1033775 d!123983))

(assert (=> b!1033927 d!124137))

(declare-fun d!124221 () Bool)

(declare-fun e!584743 () Bool)

(assert (=> d!124221 e!584743))

(declare-fun res!690895 () Bool)

(assert (=> d!124221 (=> res!690895 e!584743)))

(declare-fun lt!456581 () Bool)

(assert (=> d!124221 (= res!690895 (not lt!456581))))

(declare-fun lt!456579 () Bool)

(assert (=> d!124221 (= lt!456581 lt!456579)))

(declare-fun lt!456578 () Unit!33831)

(declare-fun e!584744 () Unit!33831)

(assert (=> d!124221 (= lt!456578 e!584744)))

(declare-fun c!104614 () Bool)

(assert (=> d!124221 (= c!104614 lt!456579)))

(assert (=> d!124221 (= lt!456579 (containsKey!563 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!124221 (= (contains!6012 lt!456356 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456581)))

(declare-fun b!1034424 () Bool)

(declare-fun lt!456580 () Unit!33831)

(assert (=> b!1034424 (= e!584744 lt!456580)))

(assert (=> b!1034424 (= lt!456580 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034424 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034425 () Bool)

(declare-fun Unit!33866 () Unit!33831)

(assert (=> b!1034425 (= e!584744 Unit!33866)))

(declare-fun b!1034426 () Bool)

(assert (=> b!1034426 (= e!584743 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456356) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124221 c!104614) b!1034424))

(assert (= (and d!124221 (not c!104614)) b!1034425))

(assert (= (and d!124221 (not res!690895)) b!1034426))

(declare-fun m!954555 () Bool)

(assert (=> d!124221 m!954555))

(declare-fun m!954557 () Bool)

(assert (=> b!1034424 m!954557))

(assert (=> b!1034424 m!953755))

(assert (=> b!1034424 m!953755))

(declare-fun m!954559 () Bool)

(assert (=> b!1034424 m!954559))

(assert (=> b!1034426 m!953755))

(assert (=> b!1034426 m!953755))

(assert (=> b!1034426 m!954559))

(assert (=> d!123889 d!124221))

(declare-fun b!1034430 () Bool)

(declare-fun e!584746 () Option!639)

(assert (=> b!1034430 (= e!584746 None!637)))

(declare-fun b!1034427 () Bool)

(declare-fun e!584745 () Option!639)

(assert (=> b!1034427 (= e!584745 (Some!638 (_2!7874 (h!23103 lt!456359))))))

(declare-fun b!1034429 () Bool)

(assert (=> b!1034429 (= e!584746 (getValueByKey!588 (t!31103 lt!456359) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun d!124223 () Bool)

(declare-fun c!104615 () Bool)

(assert (=> d!124223 (= c!104615 (and ((_ is Cons!21901) lt!456359) (= (_1!7874 (h!23103 lt!456359)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124223 (= (getValueByKey!588 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) e!584745)))

(declare-fun b!1034428 () Bool)

(assert (=> b!1034428 (= e!584745 e!584746)))

(declare-fun c!104616 () Bool)

(assert (=> b!1034428 (= c!104616 (and ((_ is Cons!21901) lt!456359) (not (= (_1!7874 (h!23103 lt!456359)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124223 c!104615) b!1034427))

(assert (= (and d!124223 (not c!104615)) b!1034428))

(assert (= (and b!1034428 c!104616) b!1034429))

(assert (= (and b!1034428 (not c!104616)) b!1034430))

(declare-fun m!954561 () Bool)

(assert (=> b!1034429 m!954561))

(assert (=> d!123889 d!124223))

(declare-fun d!124225 () Bool)

(assert (=> d!124225 (= (getValueByKey!588 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456582 () Unit!33831)

(assert (=> d!124225 (= lt!456582 (choose!1700 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun e!584747 () Bool)

(assert (=> d!124225 e!584747))

(declare-fun res!690896 () Bool)

(assert (=> d!124225 (=> (not res!690896) (not e!584747))))

(assert (=> d!124225 (= res!690896 (isStrictlySorted!718 lt!456359))))

(assert (=> d!124225 (= (lemmaContainsTupThenGetReturnValue!279 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456582)))

(declare-fun b!1034431 () Bool)

(declare-fun res!690897 () Bool)

(assert (=> b!1034431 (=> (not res!690897) (not e!584747))))

(assert (=> b!1034431 (= res!690897 (containsKey!563 lt!456359 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034432 () Bool)

(assert (=> b!1034432 (= e!584747 (contains!6013 lt!456359 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124225 res!690896) b!1034431))

(assert (= (and b!1034431 res!690897) b!1034432))

(assert (=> d!124225 m!953749))

(declare-fun m!954563 () Bool)

(assert (=> d!124225 m!954563))

(declare-fun m!954565 () Bool)

(assert (=> d!124225 m!954565))

(declare-fun m!954567 () Bool)

(assert (=> b!1034431 m!954567))

(declare-fun m!954569 () Bool)

(assert (=> b!1034432 m!954569))

(assert (=> d!123889 d!124225))

(declare-fun bm!43731 () Bool)

(declare-fun call!43736 () List!21905)

(declare-fun call!43734 () List!21905)

(assert (=> bm!43731 (= call!43736 call!43734)))

(declare-fun d!124227 () Bool)

(declare-fun e!584748 () Bool)

(assert (=> d!124227 e!584748))

(declare-fun res!690899 () Bool)

(assert (=> d!124227 (=> (not res!690899) (not e!584748))))

(declare-fun lt!456583 () List!21905)

(assert (=> d!124227 (= res!690899 (isStrictlySorted!718 lt!456583))))

(declare-fun e!584749 () List!21905)

(assert (=> d!124227 (= lt!456583 e!584749)))

(declare-fun c!104620 () Bool)

(assert (=> d!124227 (= c!104620 (and ((_ is Cons!21901) (toList!6893 call!43663)) (bvslt (_1!7874 (h!23103 (toList!6893 call!43663))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124227 (isStrictlySorted!718 (toList!6893 call!43663))))

(assert (=> d!124227 (= (insertStrictlySorted!372 (toList!6893 call!43663) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456583)))

(declare-fun b!1034433 () Bool)

(declare-fun e!584751 () List!21905)

(declare-fun call!43735 () List!21905)

(assert (=> b!1034433 (= e!584751 call!43735)))

(declare-fun b!1034434 () Bool)

(declare-fun c!104617 () Bool)

(assert (=> b!1034434 (= c!104617 (and ((_ is Cons!21901) (toList!6893 call!43663)) (bvsgt (_1!7874 (h!23103 (toList!6893 call!43663))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun e!584752 () List!21905)

(assert (=> b!1034434 (= e!584752 e!584751)))

(declare-fun b!1034435 () Bool)

(assert (=> b!1034435 (= e!584749 call!43734)))

(declare-fun bm!43732 () Bool)

(assert (=> bm!43732 (= call!43735 call!43736)))

(declare-fun b!1034436 () Bool)

(assert (=> b!1034436 (= e!584749 e!584752)))

(declare-fun c!104618 () Bool)

(assert (=> b!1034436 (= c!104618 (and ((_ is Cons!21901) (toList!6893 call!43663)) (= (_1!7874 (h!23103 (toList!6893 call!43663))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034437 () Bool)

(declare-fun res!690898 () Bool)

(assert (=> b!1034437 (=> (not res!690898) (not e!584748))))

(assert (=> b!1034437 (= res!690898 (containsKey!563 lt!456583 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034438 () Bool)

(assert (=> b!1034438 (= e!584752 call!43736)))

(declare-fun bm!43733 () Bool)

(declare-fun e!584750 () List!21905)

(assert (=> bm!43733 (= call!43734 ($colon$colon!602 e!584750 (ite c!104620 (h!23103 (toList!6893 call!43663)) (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104619 () Bool)

(assert (=> bm!43733 (= c!104619 c!104620)))

(declare-fun b!1034439 () Bool)

(assert (=> b!1034439 (= e!584748 (contains!6013 lt!456583 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034440 () Bool)

(assert (=> b!1034440 (= e!584751 call!43735)))

(declare-fun b!1034441 () Bool)

(assert (=> b!1034441 (= e!584750 (insertStrictlySorted!372 (t!31103 (toList!6893 call!43663)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034442 () Bool)

(assert (=> b!1034442 (= e!584750 (ite c!104618 (t!31103 (toList!6893 call!43663)) (ite c!104617 (Cons!21901 (h!23103 (toList!6893 call!43663)) (t!31103 (toList!6893 call!43663))) Nil!21902)))))

(assert (= (and d!124227 c!104620) b!1034435))

(assert (= (and d!124227 (not c!104620)) b!1034436))

(assert (= (and b!1034436 c!104618) b!1034438))

(assert (= (and b!1034436 (not c!104618)) b!1034434))

(assert (= (and b!1034434 c!104617) b!1034440))

(assert (= (and b!1034434 (not c!104617)) b!1034433))

(assert (= (or b!1034440 b!1034433) bm!43732))

(assert (= (or b!1034438 bm!43732) bm!43731))

(assert (= (or b!1034435 bm!43731) bm!43733))

(assert (= (and bm!43733 c!104619) b!1034441))

(assert (= (and bm!43733 (not c!104619)) b!1034442))

(assert (= (and d!124227 res!690899) b!1034437))

(assert (= (and b!1034437 res!690898) b!1034439))

(declare-fun m!954571 () Bool)

(assert (=> d!124227 m!954571))

(declare-fun m!954573 () Bool)

(assert (=> d!124227 m!954573))

(declare-fun m!954575 () Bool)

(assert (=> b!1034437 m!954575))

(declare-fun m!954577 () Bool)

(assert (=> b!1034441 m!954577))

(declare-fun m!954579 () Bool)

(assert (=> b!1034439 m!954579))

(declare-fun m!954581 () Bool)

(assert (=> bm!43733 m!954581))

(assert (=> d!123889 d!124227))

(declare-fun d!124229 () Bool)

(assert (=> d!124229 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(declare-fun lt!456584 () Unit!33831)

(assert (=> d!124229 (= lt!456584 (choose!1699 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(declare-fun e!584753 () Bool)

(assert (=> d!124229 e!584753))

(declare-fun res!690900 () Bool)

(assert (=> d!124229 (=> (not res!690900) (not e!584753))))

(assert (=> d!124229 (= res!690900 (isStrictlySorted!718 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124229 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213) lt!456584)))

(declare-fun b!1034443 () Bool)

(assert (=> b!1034443 (= e!584753 (containsKey!563 (toList!6893 (+!3104 lt!456228 (tuple2!15727 lt!456214 (zeroValue!6063 thiss!1427)))) lt!456213))))

(assert (= (and d!124229 res!690900) b!1034443))

(assert (=> d!124229 m!953869))

(assert (=> d!124229 m!953869))

(assert (=> d!124229 m!953871))

(declare-fun m!954583 () Bool)

(assert (=> d!124229 m!954583))

(declare-fun m!954585 () Bool)

(assert (=> d!124229 m!954585))

(assert (=> b!1034443 m!953865))

(assert (=> b!1033940 d!124229))

(assert (=> b!1033940 d!123963))

(assert (=> b!1033940 d!123965))

(declare-fun d!124231 () Bool)

(assert (=> d!124231 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456212)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456212)))))

(assert (=> d!123935 d!124231))

(declare-fun b!1034447 () Bool)

(declare-fun e!584755 () Option!639)

(assert (=> b!1034447 (= e!584755 None!637)))

(declare-fun b!1034444 () Bool)

(declare-fun e!584754 () Option!639)

(assert (=> b!1034444 (= e!584754 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))))))))

(declare-fun b!1034446 () Bool)

(assert (=> b!1034446 (= e!584755 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))) lt!456212))))

(declare-fun d!124233 () Bool)

(declare-fun c!104621 () Bool)

(assert (=> d!124233 (= c!104621 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))) lt!456212)))))

(assert (=> d!124233 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))) lt!456212) e!584754)))

(declare-fun b!1034445 () Bool)

(assert (=> b!1034445 (= e!584754 e!584755)))

(declare-fun c!104622 () Bool)

(assert (=> b!1034445 (= c!104622 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456218 (tuple2!15727 lt!456227 (minValue!6063 thiss!1427)))))) lt!456212))))))

(assert (= (and d!124233 c!104621) b!1034444))

(assert (= (and d!124233 (not c!104621)) b!1034445))

(assert (= (and b!1034445 c!104622) b!1034446))

(assert (= (and b!1034445 (not c!104622)) b!1034447))

(declare-fun m!954587 () Bool)

(assert (=> b!1034446 m!954587))

(assert (=> d!123935 d!124233))

(declare-fun d!124235 () Bool)

(declare-fun e!584756 () Bool)

(assert (=> d!124235 e!584756))

(declare-fun res!690901 () Bool)

(assert (=> d!124235 (=> res!690901 e!584756)))

(declare-fun lt!456588 () Bool)

(assert (=> d!124235 (= res!690901 (not lt!456588))))

(declare-fun lt!456586 () Bool)

(assert (=> d!124235 (= lt!456588 lt!456586)))

(declare-fun lt!456585 () Unit!33831)

(declare-fun e!584757 () Unit!33831)

(assert (=> d!124235 (= lt!456585 e!584757)))

(declare-fun c!104623 () Bool)

(assert (=> d!124235 (= c!104623 lt!456586)))

(assert (=> d!124235 (= lt!456586 (containsKey!563 (toList!6893 lt!456320) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124235 (= (contains!6012 lt!456320 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456588)))

(declare-fun b!1034448 () Bool)

(declare-fun lt!456587 () Unit!33831)

(assert (=> b!1034448 (= e!584757 lt!456587)))

(assert (=> b!1034448 (= lt!456587 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456320) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1034448 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034449 () Bool)

(declare-fun Unit!33867 () Unit!33831)

(assert (=> b!1034449 (= e!584757 Unit!33867)))

(declare-fun b!1034450 () Bool)

(assert (=> b!1034450 (= e!584756 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124235 c!104623) b!1034448))

(assert (= (and d!124235 (not c!104623)) b!1034449))

(assert (= (and d!124235 (not res!690901)) b!1034450))

(assert (=> d!124235 m!953361))

(declare-fun m!954589 () Bool)

(assert (=> d!124235 m!954589))

(assert (=> b!1034448 m!953361))

(declare-fun m!954591 () Bool)

(assert (=> b!1034448 m!954591))

(assert (=> b!1034448 m!953361))

(assert (=> b!1034448 m!953955))

(assert (=> b!1034448 m!953955))

(declare-fun m!954593 () Bool)

(assert (=> b!1034448 m!954593))

(assert (=> b!1034450 m!953361))

(assert (=> b!1034450 m!953955))

(assert (=> b!1034450 m!953955))

(assert (=> b!1034450 m!954593))

(assert (=> b!1033836 d!124235))

(declare-fun d!124237 () Bool)

(declare-fun lt!456589 () Bool)

(assert (=> d!124237 (= lt!456589 (select (content!513 (toList!6893 lt!456270)) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun e!584759 () Bool)

(assert (=> d!124237 (= lt!456589 e!584759)))

(declare-fun res!690902 () Bool)

(assert (=> d!124237 (=> (not res!690902) (not e!584759))))

(assert (=> d!124237 (= res!690902 ((_ is Cons!21901) (toList!6893 lt!456270)))))

(assert (=> d!124237 (= (contains!6013 (toList!6893 lt!456270) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456589)))

(declare-fun b!1034451 () Bool)

(declare-fun e!584758 () Bool)

(assert (=> b!1034451 (= e!584759 e!584758)))

(declare-fun res!690903 () Bool)

(assert (=> b!1034451 (=> res!690903 e!584758)))

(assert (=> b!1034451 (= res!690903 (= (h!23103 (toList!6893 lt!456270)) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034452 () Bool)

(assert (=> b!1034452 (= e!584758 (contains!6013 (t!31103 (toList!6893 lt!456270)) (ite (or c!104389 c!104394) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 thiss!1427)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (= (and d!124237 res!690902) b!1034451))

(assert (= (and b!1034451 (not res!690903)) b!1034452))

(declare-fun m!954595 () Bool)

(assert (=> d!124237 m!954595))

(declare-fun m!954597 () Bool)

(assert (=> d!124237 m!954597))

(declare-fun m!954599 () Bool)

(assert (=> b!1034452 m!954599))

(assert (=> b!1033772 d!124237))

(declare-fun d!124239 () Bool)

(declare-fun res!690904 () Bool)

(declare-fun e!584760 () Bool)

(assert (=> d!124239 (=> res!690904 e!584760)))

(assert (=> d!124239 (= res!690904 (and ((_ is Cons!21901) (toList!6893 lt!456206)) (= (_1!7874 (h!23103 (toList!6893 lt!456206))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124239 (= (containsKey!563 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000) e!584760)))

(declare-fun b!1034453 () Bool)

(declare-fun e!584761 () Bool)

(assert (=> b!1034453 (= e!584760 e!584761)))

(declare-fun res!690905 () Bool)

(assert (=> b!1034453 (=> (not res!690905) (not e!584761))))

(assert (=> b!1034453 (= res!690905 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456206))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456206))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) (toList!6893 lt!456206)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456206))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034454 () Bool)

(assert (=> b!1034454 (= e!584761 (containsKey!563 (t!31103 (toList!6893 lt!456206)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124239 (not res!690904)) b!1034453))

(assert (= (and b!1034453 res!690905) b!1034454))

(declare-fun m!954601 () Bool)

(assert (=> b!1034454 m!954601))

(assert (=> d!123897 d!124239))

(declare-fun d!124241 () Bool)

(assert (=> d!124241 (= (validMask!0 (mask!30084 lt!456124)) (and (or (= (mask!30084 lt!456124) #b00000000000000000000000000000111) (= (mask!30084 lt!456124) #b00000000000000000000000000001111) (= (mask!30084 lt!456124) #b00000000000000000000000000011111) (= (mask!30084 lt!456124) #b00000000000000000000000000111111) (= (mask!30084 lt!456124) #b00000000000000000000000001111111) (= (mask!30084 lt!456124) #b00000000000000000000000011111111) (= (mask!30084 lt!456124) #b00000000000000000000000111111111) (= (mask!30084 lt!456124) #b00000000000000000000001111111111) (= (mask!30084 lt!456124) #b00000000000000000000011111111111) (= (mask!30084 lt!456124) #b00000000000000000000111111111111) (= (mask!30084 lt!456124) #b00000000000000000001111111111111) (= (mask!30084 lt!456124) #b00000000000000000011111111111111) (= (mask!30084 lt!456124) #b00000000000000000111111111111111) (= (mask!30084 lt!456124) #b00000000000000001111111111111111) (= (mask!30084 lt!456124) #b00000000000000011111111111111111) (= (mask!30084 lt!456124) #b00000000000000111111111111111111) (= (mask!30084 lt!456124) #b00000000000001111111111111111111) (= (mask!30084 lt!456124) #b00000000000011111111111111111111) (= (mask!30084 lt!456124) #b00000000000111111111111111111111) (= (mask!30084 lt!456124) #b00000000001111111111111111111111) (= (mask!30084 lt!456124) #b00000000011111111111111111111111) (= (mask!30084 lt!456124) #b00000000111111111111111111111111) (= (mask!30084 lt!456124) #b00000001111111111111111111111111) (= (mask!30084 lt!456124) #b00000011111111111111111111111111) (= (mask!30084 lt!456124) #b00000111111111111111111111111111) (= (mask!30084 lt!456124) #b00001111111111111111111111111111) (= (mask!30084 lt!456124) #b00011111111111111111111111111111) (= (mask!30084 lt!456124) #b00111111111111111111111111111111)) (bvsle (mask!30084 lt!456124) #b00111111111111111111111111111111)))))

(assert (=> d!123887 d!124241))

(declare-fun d!124243 () Bool)

(declare-fun res!690910 () Bool)

(declare-fun e!584766 () Bool)

(assert (=> d!124243 (=> res!690910 e!584766)))

(assert (=> d!124243 (= res!690910 (or ((_ is Nil!21902) lt!456370) ((_ is Nil!21902) (t!31103 lt!456370))))))

(assert (=> d!124243 (= (isStrictlySorted!718 lt!456370) e!584766)))

(declare-fun b!1034459 () Bool)

(declare-fun e!584767 () Bool)

(assert (=> b!1034459 (= e!584766 e!584767)))

(declare-fun res!690911 () Bool)

(assert (=> b!1034459 (=> (not res!690911) (not e!584767))))

(assert (=> b!1034459 (= res!690911 (bvslt (_1!7874 (h!23103 lt!456370)) (_1!7874 (h!23103 (t!31103 lt!456370)))))))

(declare-fun b!1034460 () Bool)

(assert (=> b!1034460 (= e!584767 (isStrictlySorted!718 (t!31103 lt!456370)))))

(assert (= (and d!124243 (not res!690910)) b!1034459))

(assert (= (and b!1034459 res!690911) b!1034460))

(declare-fun m!954603 () Bool)

(assert (=> b!1034460 m!954603))

(assert (=> d!123899 d!124243))

(declare-fun d!124245 () Bool)

(declare-fun res!690912 () Bool)

(declare-fun e!584768 () Bool)

(assert (=> d!124245 (=> res!690912 e!584768)))

(assert (=> d!124245 (= res!690912 (or ((_ is Nil!21902) (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) ((_ is Nil!21902) (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))))))

(assert (=> d!124245 (= (isStrictlySorted!718 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) e!584768)))

(declare-fun b!1034461 () Bool)

(declare-fun e!584769 () Bool)

(assert (=> b!1034461 (= e!584768 e!584769)))

(declare-fun res!690913 () Bool)

(assert (=> b!1034461 (=> (not res!690913) (not e!584769))))

(assert (=> b!1034461 (= res!690913 (bvslt (_1!7874 (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) (_1!7874 (h!23103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))))))))

(declare-fun b!1034462 () Bool)

(assert (=> b!1034462 (= e!584769 (isStrictlySorted!718 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))))))

(assert (= (and d!124245 (not res!690912)) b!1034461))

(assert (= (and b!1034461 res!690913) b!1034462))

(declare-fun m!954605 () Bool)

(assert (=> b!1034462 m!954605))

(assert (=> d!123899 d!124245))

(declare-fun d!124247 () Bool)

(declare-fun e!584770 () Bool)

(assert (=> d!124247 e!584770))

(declare-fun res!690914 () Bool)

(assert (=> d!124247 (=> res!690914 e!584770)))

(declare-fun lt!456593 () Bool)

(assert (=> d!124247 (= res!690914 (not lt!456593))))

(declare-fun lt!456591 () Bool)

(assert (=> d!124247 (= lt!456593 lt!456591)))

(declare-fun lt!456590 () Unit!33831)

(declare-fun e!584771 () Unit!33831)

(assert (=> d!124247 (= lt!456590 e!584771)))

(declare-fun c!104624 () Bool)

(assert (=> d!124247 (= c!104624 lt!456591)))

(assert (=> d!124247 (= lt!456591 (containsKey!563 (toList!6893 lt!456348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124247 (= (contains!6012 lt!456348 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456593)))

(declare-fun b!1034463 () Bool)

(declare-fun lt!456592 () Unit!33831)

(assert (=> b!1034463 (= e!584771 lt!456592)))

(assert (=> b!1034463 (= lt!456592 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034463 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034464 () Bool)

(declare-fun Unit!33868 () Unit!33831)

(assert (=> b!1034464 (= e!584771 Unit!33868)))

(declare-fun b!1034465 () Bool)

(assert (=> b!1034465 (= e!584770 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124247 c!104624) b!1034463))

(assert (= (and d!124247 (not c!104624)) b!1034464))

(assert (= (and d!124247 (not res!690914)) b!1034465))

(declare-fun m!954607 () Bool)

(assert (=> d!124247 m!954607))

(declare-fun m!954609 () Bool)

(assert (=> b!1034463 m!954609))

(declare-fun m!954611 () Bool)

(assert (=> b!1034463 m!954611))

(assert (=> b!1034463 m!954611))

(declare-fun m!954613 () Bool)

(assert (=> b!1034463 m!954613))

(assert (=> b!1034465 m!954611))

(assert (=> b!1034465 m!954611))

(assert (=> b!1034465 m!954613))

(assert (=> bm!43682 d!124247))

(declare-fun d!124249 () Bool)

(declare-fun res!690915 () Bool)

(declare-fun e!584772 () Bool)

(assert (=> d!124249 (=> res!690915 e!584772)))

(assert (=> d!124249 (= res!690915 (and ((_ is Cons!21901) lt!456415) (= (_1!7874 (h!23103 lt!456415)) key!909)))))

(assert (=> d!124249 (= (containsKey!563 lt!456415 key!909) e!584772)))

(declare-fun b!1034466 () Bool)

(declare-fun e!584773 () Bool)

(assert (=> b!1034466 (= e!584772 e!584773)))

(declare-fun res!690916 () Bool)

(assert (=> b!1034466 (=> (not res!690916) (not e!584773))))

(assert (=> b!1034466 (= res!690916 (and (or (not ((_ is Cons!21901) lt!456415)) (bvsle (_1!7874 (h!23103 lt!456415)) key!909)) ((_ is Cons!21901) lt!456415) (bvslt (_1!7874 (h!23103 lt!456415)) key!909)))))

(declare-fun b!1034467 () Bool)

(assert (=> b!1034467 (= e!584773 (containsKey!563 (t!31103 lt!456415) key!909))))

(assert (= (and d!124249 (not res!690915)) b!1034466))

(assert (= (and b!1034466 res!690916) b!1034467))

(declare-fun m!954615 () Bool)

(assert (=> b!1034467 m!954615))

(assert (=> b!1033965 d!124249))

(declare-fun d!124251 () Bool)

(assert (=> d!124251 (= (apply!906 lt!456348 #b0000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456348) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30256 () Bool)

(assert (= bs!30256 d!124251))

(assert (=> bs!30256 m!954611))

(assert (=> bs!30256 m!954611))

(declare-fun m!954617 () Bool)

(assert (=> bs!30256 m!954617))

(assert (=> b!1033879 d!124251))

(assert (=> d!123873 d!123851))

(assert (=> d!123873 d!123875))

(assert (=> d!123873 d!123865))

(declare-fun d!124253 () Bool)

(declare-fun e!584774 () Bool)

(assert (=> d!124253 e!584774))

(declare-fun res!690917 () Bool)

(assert (=> d!124253 (=> res!690917 e!584774)))

(declare-fun lt!456597 () Bool)

(assert (=> d!124253 (= res!690917 (not lt!456597))))

(declare-fun lt!456595 () Bool)

(assert (=> d!124253 (= lt!456597 lt!456595)))

(declare-fun lt!456594 () Unit!33831)

(declare-fun e!584775 () Unit!33831)

(assert (=> d!124253 (= lt!456594 e!584775)))

(declare-fun c!104625 () Bool)

(assert (=> d!124253 (= c!104625 lt!456595)))

(assert (=> d!124253 (= lt!456595 (containsKey!563 (toList!6893 lt!456186) lt!456185))))

(assert (=> d!124253 (= (contains!6012 lt!456186 lt!456185) lt!456597)))

(declare-fun b!1034468 () Bool)

(declare-fun lt!456596 () Unit!33831)

(assert (=> b!1034468 (= e!584775 lt!456596)))

(assert (=> b!1034468 (= lt!456596 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456186) lt!456185))))

(assert (=> b!1034468 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456186) lt!456185))))

(declare-fun b!1034469 () Bool)

(declare-fun Unit!33869 () Unit!33831)

(assert (=> b!1034469 (= e!584775 Unit!33869)))

(declare-fun b!1034470 () Bool)

(assert (=> b!1034470 (= e!584774 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456186) lt!456185)))))

(assert (= (and d!124253 c!104625) b!1034468))

(assert (= (and d!124253 (not c!104625)) b!1034469))

(assert (= (and d!124253 (not res!690917)) b!1034470))

(declare-fun m!954619 () Bool)

(assert (=> d!124253 m!954619))

(declare-fun m!954621 () Bool)

(assert (=> b!1034468 m!954621))

(assert (=> b!1034468 m!953659))

(assert (=> b!1034468 m!953659))

(declare-fun m!954623 () Bool)

(assert (=> b!1034468 m!954623))

(assert (=> b!1034470 m!953659))

(assert (=> b!1034470 m!953659))

(assert (=> b!1034470 m!954623))

(assert (=> d!123873 d!124253))

(declare-fun d!124255 () Bool)

(assert (=> d!124255 (= (apply!906 (+!3104 lt!456186 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456185) (apply!906 lt!456186 lt!456185))))

(assert (=> d!124255 true))

(declare-fun _$34!1167 () Unit!33831)

(assert (=> d!124255 (= (choose!1697 lt!456186 lt!456197 (minValue!6063 thiss!1427) lt!456185) _$34!1167)))

(declare-fun bs!30257 () Bool)

(assert (= bs!30257 d!124255))

(assert (=> bs!30257 m!953399))

(assert (=> bs!30257 m!953399))

(assert (=> bs!30257 m!953401))

(assert (=> bs!30257 m!953403))

(assert (=> d!123873 d!124255))

(assert (=> d!123909 d!123903))

(declare-fun d!124257 () Bool)

(assert (=> d!124257 (= ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) (Cons!21901 (h!23103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) (removeStrictlySorted!56 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1033916 d!124257))

(declare-fun d!124259 () Bool)

(declare-fun e!584776 () Bool)

(assert (=> d!124259 e!584776))

(declare-fun res!690918 () Bool)

(assert (=> d!124259 (=> (not res!690918) (not e!584776))))

(declare-fun lt!456598 () List!21905)

(assert (=> d!124259 (= res!690918 (isStrictlySorted!718 lt!456598))))

(declare-fun e!584777 () List!21905)

(assert (=> d!124259 (= lt!456598 e!584777)))

(declare-fun c!104626 () Bool)

(assert (=> d!124259 (= c!104626 (and ((_ is Cons!21901) (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) (= (_1!7874 (h!23103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124259 (isStrictlySorted!718 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))))

(assert (=> d!124259 (= (removeStrictlySorted!56 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456598)))

(declare-fun b!1034471 () Bool)

(assert (=> b!1034471 (= e!584777 (t!31103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))))))

(declare-fun b!1034472 () Bool)

(declare-fun e!584778 () List!21905)

(assert (=> b!1034472 (= e!584778 Nil!21902)))

(declare-fun b!1034473 () Bool)

(assert (=> b!1034473 (= e!584778 ($colon$colon!602 (removeStrictlySorted!56 (t!31103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) #b0000000000000000000000000000000000000000000000000000000000000000) (h!23103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))))))

(declare-fun b!1034474 () Bool)

(assert (=> b!1034474 (= e!584777 e!584778)))

(declare-fun c!104627 () Bool)

(assert (=> b!1034474 (= c!104627 (and ((_ is Cons!21901) (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427))))) (not (= (_1!7874 (h!23103 (t!31103 (toList!6893 (getCurrentListMap!3941 (_keys!11407 thiss!1427) (_values!6250 thiss!1427) (mask!30084 thiss!1427) (extraKeys!5959 thiss!1427) (zeroValue!6063 thiss!1427) (minValue!6063 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!6227 thiss!1427)))))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1034475 () Bool)

(assert (=> b!1034475 (= e!584776 (not (containsKey!563 lt!456598 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124259 c!104626) b!1034471))

(assert (= (and d!124259 (not c!104626)) b!1034474))

(assert (= (and b!1034474 c!104627) b!1034473))

(assert (= (and b!1034474 (not c!104627)) b!1034472))

(assert (= (and d!124259 res!690918) b!1034475))

(declare-fun m!954625 () Bool)

(assert (=> d!124259 m!954625))

(assert (=> d!124259 m!954605))

(declare-fun m!954627 () Bool)

(assert (=> b!1034473 m!954627))

(assert (=> b!1034473 m!954627))

(declare-fun m!954629 () Bool)

(assert (=> b!1034473 m!954629))

(declare-fun m!954631 () Bool)

(assert (=> b!1034475 m!954631))

(assert (=> b!1033916 d!124259))

(declare-fun d!124261 () Bool)

(declare-fun e!584779 () Bool)

(assert (=> d!124261 e!584779))

(declare-fun res!690919 () Bool)

(assert (=> d!124261 (=> (not res!690919) (not e!584779))))

(declare-fun lt!456599 () ListLongMap!13755)

(assert (=> d!124261 (= res!690919 (contains!6012 lt!456599 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(declare-fun lt!456602 () List!21905)

(assert (=> d!124261 (= lt!456599 (ListLongMap!13756 lt!456602))))

(declare-fun lt!456601 () Unit!33831)

(declare-fun lt!456600 () Unit!33831)

(assert (=> d!124261 (= lt!456601 lt!456600)))

(assert (=> d!124261 (= (getValueByKey!588 lt!456602 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(assert (=> d!124261 (= lt!456600 (lemmaContainsTupThenGetReturnValue!279 lt!456602 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(assert (=> d!124261 (= lt!456602 (insertStrictlySorted!372 (toList!6893 call!43687) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(assert (=> d!124261 (= (+!3104 call!43687 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))) lt!456599)))

(declare-fun b!1034476 () Bool)

(declare-fun res!690920 () Bool)

(assert (=> b!1034476 (=> (not res!690920) (not e!584779))))

(assert (=> b!1034476 (= res!690920 (= (getValueByKey!588 (toList!6893 lt!456599) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))))

(declare-fun b!1034477 () Bool)

(assert (=> b!1034477 (= e!584779 (contains!6013 (toList!6893 lt!456599) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))

(assert (= (and d!124261 res!690919) b!1034476))

(assert (= (and b!1034476 res!690920) b!1034477))

(declare-fun m!954633 () Bool)

(assert (=> d!124261 m!954633))

(declare-fun m!954635 () Bool)

(assert (=> d!124261 m!954635))

(declare-fun m!954637 () Bool)

(assert (=> d!124261 m!954637))

(declare-fun m!954639 () Bool)

(assert (=> d!124261 m!954639))

(declare-fun m!954641 () Bool)

(assert (=> b!1034476 m!954641))

(declare-fun m!954643 () Bool)

(assert (=> b!1034477 m!954643))

(assert (=> b!1033860 d!124261))

(assert (=> bm!43679 d!124151))

(assert (=> b!1033898 d!123831))

(declare-fun d!124263 () Bool)

(declare-fun e!584780 () Bool)

(assert (=> d!124263 e!584780))

(declare-fun res!690921 () Bool)

(assert (=> d!124263 (=> res!690921 e!584780)))

(declare-fun lt!456606 () Bool)

(assert (=> d!124263 (= res!690921 (not lt!456606))))

(declare-fun lt!456604 () Bool)

(assert (=> d!124263 (= lt!456606 lt!456604)))

(declare-fun lt!456603 () Unit!33831)

(declare-fun e!584781 () Unit!33831)

(assert (=> d!124263 (= lt!456603 e!584781)))

(declare-fun c!104628 () Bool)

(assert (=> d!124263 (= c!104628 lt!456604)))

(assert (=> d!124263 (= lt!456604 (containsKey!563 (toList!6893 lt!456320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124263 (= (contains!6012 lt!456320 #b0000000000000000000000000000000000000000000000000000000000000000) lt!456606)))

(declare-fun b!1034478 () Bool)

(declare-fun lt!456605 () Unit!33831)

(assert (=> b!1034478 (= e!584781 lt!456605)))

(assert (=> b!1034478 (= lt!456605 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034478 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034479 () Bool)

(declare-fun Unit!33870 () Unit!33831)

(assert (=> b!1034479 (= e!584781 Unit!33870)))

(declare-fun b!1034480 () Bool)

(assert (=> b!1034480 (= e!584780 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456320) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124263 c!104628) b!1034478))

(assert (= (and d!124263 (not c!104628)) b!1034479))

(assert (= (and d!124263 (not res!690921)) b!1034480))

(declare-fun m!954645 () Bool)

(assert (=> d!124263 m!954645))

(declare-fun m!954647 () Bool)

(assert (=> b!1034478 m!954647))

(declare-fun m!954649 () Bool)

(assert (=> b!1034478 m!954649))

(assert (=> b!1034478 m!954649))

(declare-fun m!954651 () Bool)

(assert (=> b!1034478 m!954651))

(assert (=> b!1034480 m!954649))

(assert (=> b!1034480 m!954649))

(assert (=> b!1034480 m!954651))

(assert (=> d!123861 d!124263))

(assert (=> d!123861 d!123903))

(assert (=> b!1033930 d!123831))

(declare-fun d!124265 () Bool)

(declare-fun res!690922 () Bool)

(declare-fun e!584782 () Bool)

(assert (=> d!124265 (=> res!690922 e!584782)))

(assert (=> d!124265 (= res!690922 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) lt!456188)))))

(assert (=> d!124265 (= (containsKey!563 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188) e!584782)))

(declare-fun b!1034481 () Bool)

(declare-fun e!584783 () Bool)

(assert (=> b!1034481 (= e!584782 e!584783)))

(declare-fun res!690923 () Bool)

(assert (=> b!1034481 (=> (not res!690923) (not e!584783))))

(assert (=> b!1034481 (= res!690923 (and (or (not ((_ is Cons!21901) (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) (bvsle (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) lt!456188)) ((_ is Cons!21901) (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) (bvslt (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))))) lt!456188)))))

(declare-fun b!1034482 () Bool)

(assert (=> b!1034482 (= e!584783 (containsKey!563 (t!31103 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))) lt!456188))))

(assert (= (and d!124265 (not res!690922)) b!1034481))

(assert (= (and b!1034481 res!690923) b!1034482))

(declare-fun m!954653 () Bool)

(assert (=> b!1034482 m!954653))

(assert (=> d!123877 d!124265))

(declare-fun d!124267 () Bool)

(assert (=> d!124267 (= (get!16435 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!14887 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1033780 d!124267))

(declare-fun d!124269 () Bool)

(assert (=> d!124269 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))) lt!456195)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))) lt!456195)))))

(assert (=> d!123879 d!124269))

(declare-fun b!1034486 () Bool)

(declare-fun e!584785 () Option!639)

(assert (=> b!1034486 (= e!584785 None!637)))

(declare-fun e!584784 () Option!639)

(declare-fun b!1034483 () Bool)

(assert (=> b!1034483 (= e!584784 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)))))))))

(declare-fun b!1034485 () Bool)

(assert (=> b!1034485 (= e!584785 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)))) lt!456195))))

(declare-fun c!104629 () Bool)

(declare-fun d!124271 () Bool)

(assert (=> d!124271 (= c!104629 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))))) lt!456195)))))

(assert (=> d!124271 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))) lt!456195) e!584784)))

(declare-fun b!1034484 () Bool)

(assert (=> b!1034484 (= e!584784 e!584785)))

(declare-fun c!104630 () Bool)

(assert (=> b!1034484 (= c!104630 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123)))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456182 (tuple2!15727 lt!456200 lt!456123))))) lt!456195))))))

(assert (= (and d!124271 c!104629) b!1034483))

(assert (= (and d!124271 (not c!104629)) b!1034484))

(assert (= (and b!1034484 c!104630) b!1034485))

(assert (= (and b!1034484 (not c!104630)) b!1034486))

(declare-fun m!954655 () Bool)

(assert (=> b!1034485 m!954655))

(assert (=> d!123879 d!124271))

(declare-fun lt!456607 () Bool)

(declare-fun d!124273 () Bool)

(assert (=> d!124273 (= lt!456607 (select (content!513 (toList!6893 lt!456383)) (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))

(declare-fun e!584787 () Bool)

(assert (=> d!124273 (= lt!456607 e!584787)))

(declare-fun res!690924 () Bool)

(assert (=> d!124273 (=> (not res!690924) (not e!584787))))

(assert (=> d!124273 (= res!690924 ((_ is Cons!21901) (toList!6893 lt!456383)))))

(assert (=> d!124273 (= (contains!6013 (toList!6893 lt!456383) (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456607)))

(declare-fun b!1034487 () Bool)

(declare-fun e!584786 () Bool)

(assert (=> b!1034487 (= e!584787 e!584786)))

(declare-fun res!690925 () Bool)

(assert (=> b!1034487 (=> res!690925 e!584786)))

(assert (=> b!1034487 (= res!690925 (= (h!23103 (toList!6893 lt!456383)) (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))

(declare-fun b!1034488 () Bool)

(assert (=> b!1034488 (= e!584786 (contains!6013 (t!31103 (toList!6893 lt!456383)) (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))

(assert (= (and d!124273 res!690924) b!1034487))

(assert (= (and b!1034487 (not res!690925)) b!1034488))

(declare-fun m!954657 () Bool)

(assert (=> d!124273 m!954657))

(declare-fun m!954659 () Bool)

(assert (=> d!124273 m!954659))

(declare-fun m!954661 () Bool)

(assert (=> b!1034488 m!954661))

(assert (=> b!1033937 d!124273))

(declare-fun d!124275 () Bool)

(assert (=> d!124275 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456207) lt!456220)) (v!14889 (getValueByKey!588 (toList!6893 lt!456207) lt!456220)))))

(assert (=> d!123921 d!124275))

(declare-fun b!1034492 () Bool)

(declare-fun e!584789 () Option!639)

(assert (=> b!1034492 (= e!584789 None!637)))

(declare-fun b!1034489 () Bool)

(declare-fun e!584788 () Option!639)

(assert (=> b!1034489 (= e!584788 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456207)))))))

(declare-fun b!1034491 () Bool)

(assert (=> b!1034491 (= e!584789 (getValueByKey!588 (t!31103 (toList!6893 lt!456207)) lt!456220))))

(declare-fun d!124277 () Bool)

(declare-fun c!104631 () Bool)

(assert (=> d!124277 (= c!104631 (and ((_ is Cons!21901) (toList!6893 lt!456207)) (= (_1!7874 (h!23103 (toList!6893 lt!456207))) lt!456220)))))

(assert (=> d!124277 (= (getValueByKey!588 (toList!6893 lt!456207) lt!456220) e!584788)))

(declare-fun b!1034490 () Bool)

(assert (=> b!1034490 (= e!584788 e!584789)))

(declare-fun c!104632 () Bool)

(assert (=> b!1034490 (= c!104632 (and ((_ is Cons!21901) (toList!6893 lt!456207)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456207))) lt!456220))))))

(assert (= (and d!124277 c!104631) b!1034489))

(assert (= (and d!124277 (not c!104631)) b!1034490))

(assert (= (and b!1034490 c!104632) b!1034491))

(assert (= (and b!1034490 (not c!104632)) b!1034492))

(declare-fun m!954663 () Bool)

(assert (=> b!1034491 m!954663))

(assert (=> d!123921 d!124277))

(declare-fun d!124279 () Bool)

(declare-fun lt!456608 () Bool)

(assert (=> d!124279 (= lt!456608 (select (content!513 (toList!6893 lt!456356)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun e!584791 () Bool)

(assert (=> d!124279 (= lt!456608 e!584791)))

(declare-fun res!690926 () Bool)

(assert (=> d!124279 (=> (not res!690926) (not e!584791))))

(assert (=> d!124279 (= res!690926 ((_ is Cons!21901) (toList!6893 lt!456356)))))

(assert (=> d!124279 (= (contains!6013 (toList!6893 lt!456356) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) lt!456608)))

(declare-fun b!1034493 () Bool)

(declare-fun e!584790 () Bool)

(assert (=> b!1034493 (= e!584791 e!584790)))

(declare-fun res!690927 () Bool)

(assert (=> b!1034493 (=> res!690927 e!584790)))

(assert (=> b!1034493 (= res!690927 (= (h!23103 (toList!6893 lt!456356)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(declare-fun b!1034494 () Bool)

(assert (=> b!1034494 (= e!584790 (contains!6013 (t!31103 (toList!6893 lt!456356)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))

(assert (= (and d!124279 res!690926) b!1034493))

(assert (= (and b!1034493 (not res!690927)) b!1034494))

(declare-fun m!954665 () Bool)

(assert (=> d!124279 m!954665))

(declare-fun m!954667 () Bool)

(assert (=> d!124279 m!954667))

(declare-fun m!954669 () Bool)

(assert (=> b!1034494 m!954669))

(assert (=> b!1033882 d!124279))

(declare-fun d!124281 () Bool)

(assert (=> d!124281 (= (isEmpty!926 lt!456298) (isEmpty!928 (toList!6893 lt!456298)))))

(declare-fun bs!30258 () Bool)

(assert (= bs!30258 d!124281))

(declare-fun m!954671 () Bool)

(assert (=> bs!30258 m!954671))

(assert (=> b!1033817 d!124281))

(declare-fun d!124283 () Bool)

(declare-fun res!690928 () Bool)

(declare-fun e!584792 () Bool)

(assert (=> d!124283 (=> res!690928 e!584792)))

(assert (=> d!124283 (= res!690928 (and ((_ is Cons!21901) (toList!6893 lt!456229)) (= (_1!7874 (h!23103 (toList!6893 lt!456229))) key!909)))))

(assert (=> d!124283 (= (containsKey!563 (toList!6893 lt!456229) key!909) e!584792)))

(declare-fun b!1034495 () Bool)

(declare-fun e!584793 () Bool)

(assert (=> b!1034495 (= e!584792 e!584793)))

(declare-fun res!690929 () Bool)

(assert (=> b!1034495 (=> (not res!690929) (not e!584793))))

(assert (=> b!1034495 (= res!690929 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456229))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456229))) key!909)) ((_ is Cons!21901) (toList!6893 lt!456229)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456229))) key!909)))))

(declare-fun b!1034496 () Bool)

(assert (=> b!1034496 (= e!584793 (containsKey!563 (t!31103 (toList!6893 lt!456229)) key!909))))

(assert (= (and d!124283 (not res!690928)) b!1034495))

(assert (= (and b!1034495 res!690929) b!1034496))

(declare-fun m!954673 () Bool)

(assert (=> b!1034496 m!954673))

(assert (=> d!123953 d!124283))

(declare-fun d!124285 () Bool)

(declare-fun res!690930 () Bool)

(declare-fun e!584794 () Bool)

(assert (=> d!124285 (=> res!690930 e!584794)))

(assert (=> d!124285 (= res!690930 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124285 (= (containsKey!563 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000) e!584794)))

(declare-fun b!1034497 () Bool)

(declare-fun e!584795 () Bool)

(assert (=> b!1034497 (= e!584794 e!584795)))

(declare-fun res!690931 () Bool)

(assert (=> b!1034497 (=> (not res!690931) (not e!584795))))

(assert (=> b!1034497 (= res!690931 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456196))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456196))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) (toList!6893 lt!456196)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456196))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034498 () Bool)

(assert (=> b!1034498 (= e!584795 (containsKey!563 (t!31103 (toList!6893 lt!456196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124285 (not res!690930)) b!1034497))

(assert (= (and b!1034497 res!690931) b!1034498))

(declare-fun m!954675 () Bool)

(assert (=> b!1034498 m!954675))

(assert (=> d!123893 d!124285))

(declare-fun d!124287 () Bool)

(declare-fun res!690932 () Bool)

(declare-fun e!584796 () Bool)

(assert (=> d!124287 (=> res!690932 e!584796)))

(assert (=> d!124287 (= res!690932 (or ((_ is Nil!21902) lt!456415) ((_ is Nil!21902) (t!31103 lt!456415))))))

(assert (=> d!124287 (= (isStrictlySorted!718 lt!456415) e!584796)))

(declare-fun b!1034499 () Bool)

(declare-fun e!584797 () Bool)

(assert (=> b!1034499 (= e!584796 e!584797)))

(declare-fun res!690933 () Bool)

(assert (=> b!1034499 (=> (not res!690933) (not e!584797))))

(assert (=> b!1034499 (= res!690933 (bvslt (_1!7874 (h!23103 lt!456415)) (_1!7874 (h!23103 (t!31103 lt!456415)))))))

(declare-fun b!1034500 () Bool)

(assert (=> b!1034500 (= e!584797 (isStrictlySorted!718 (t!31103 lt!456415)))))

(assert (= (and d!124287 (not res!690932)) b!1034499))

(assert (= (and b!1034499 res!690933) b!1034500))

(declare-fun m!954677 () Bool)

(assert (=> b!1034500 m!954677))

(assert (=> d!123955 d!124287))

(declare-fun d!124289 () Bool)

(declare-fun res!690934 () Bool)

(declare-fun e!584798 () Bool)

(assert (=> d!124289 (=> res!690934 e!584798)))

(assert (=> d!124289 (= res!690934 (or ((_ is Nil!21902) (toList!6893 (map!14701 thiss!1427))) ((_ is Nil!21902) (t!31103 (toList!6893 (map!14701 thiss!1427))))))))

(assert (=> d!124289 (= (isStrictlySorted!718 (toList!6893 (map!14701 thiss!1427))) e!584798)))

(declare-fun b!1034501 () Bool)

(declare-fun e!584799 () Bool)

(assert (=> b!1034501 (= e!584798 e!584799)))

(declare-fun res!690935 () Bool)

(assert (=> b!1034501 (=> (not res!690935) (not e!584799))))

(assert (=> b!1034501 (= res!690935 (bvslt (_1!7874 (h!23103 (toList!6893 (map!14701 thiss!1427)))) (_1!7874 (h!23103 (t!31103 (toList!6893 (map!14701 thiss!1427)))))))))

(declare-fun b!1034502 () Bool)

(assert (=> b!1034502 (= e!584799 (isStrictlySorted!718 (t!31103 (toList!6893 (map!14701 thiss!1427)))))))

(assert (= (and d!124289 (not res!690934)) b!1034501))

(assert (= (and b!1034501 res!690935) b!1034502))

(assert (=> b!1034502 m!954069))

(assert (=> d!123955 d!124289))

(assert (=> d!123939 d!123917))

(assert (=> d!123939 d!123931))

(declare-fun d!124291 () Bool)

(declare-fun e!584800 () Bool)

(assert (=> d!124291 e!584800))

(declare-fun res!690936 () Bool)

(assert (=> d!124291 (=> res!690936 e!584800)))

(declare-fun lt!456612 () Bool)

(assert (=> d!124291 (= res!690936 (not lt!456612))))

(declare-fun lt!456610 () Bool)

(assert (=> d!124291 (= lt!456612 lt!456610)))

(declare-fun lt!456609 () Unit!33831)

(declare-fun e!584801 () Unit!33831)

(assert (=> d!124291 (= lt!456609 e!584801)))

(declare-fun c!104633 () Bool)

(assert (=> d!124291 (= c!104633 lt!456610)))

(assert (=> d!124291 (= lt!456610 (containsKey!563 (toList!6893 lt!456211) lt!456210))))

(assert (=> d!124291 (= (contains!6012 lt!456211 lt!456210) lt!456612)))

(declare-fun b!1034503 () Bool)

(declare-fun lt!456611 () Unit!33831)

(assert (=> b!1034503 (= e!584801 lt!456611)))

(assert (=> b!1034503 (= lt!456611 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456211) lt!456210))))

(assert (=> b!1034503 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456211) lt!456210))))

(declare-fun b!1034504 () Bool)

(declare-fun Unit!33871 () Unit!33831)

(assert (=> b!1034504 (= e!584801 Unit!33871)))

(declare-fun b!1034505 () Bool)

(assert (=> b!1034505 (= e!584800 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456211) lt!456210)))))

(assert (= (and d!124291 c!104633) b!1034503))

(assert (= (and d!124291 (not c!104633)) b!1034504))

(assert (= (and d!124291 (not res!690936)) b!1034505))

(declare-fun m!954679 () Bool)

(assert (=> d!124291 m!954679))

(declare-fun m!954681 () Bool)

(assert (=> b!1034503 m!954681))

(assert (=> b!1034503 m!953873))

(assert (=> b!1034503 m!953873))

(declare-fun m!954683 () Bool)

(assert (=> b!1034503 m!954683))

(assert (=> b!1034505 m!953873))

(assert (=> b!1034505 m!953873))

(assert (=> b!1034505 m!954683))

(assert (=> d!123939 d!124291))

(declare-fun d!124293 () Bool)

(assert (=> d!124293 (= (apply!906 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))) lt!456210) (apply!906 lt!456211 lt!456210))))

(assert (=> d!124293 true))

(declare-fun _$34!1168 () Unit!33831)

(assert (=> d!124293 (= (choose!1697 lt!456211 lt!456222 (minValue!6063 thiss!1427) lt!456210) _$34!1168)))

(declare-fun bs!30259 () Bool)

(assert (= bs!30259 d!124293))

(assert (=> bs!30259 m!953459))

(assert (=> bs!30259 m!953459))

(assert (=> bs!30259 m!953461))

(assert (=> bs!30259 m!953463))

(assert (=> d!123939 d!124293))

(assert (=> d!123939 d!123927))

(declare-fun d!124295 () Bool)

(declare-fun res!690937 () Bool)

(declare-fun e!584802 () Bool)

(assert (=> d!124295 (=> res!690937 e!584802)))

(assert (=> d!124295 (= res!690937 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!124295 (= (containsKey!563 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) e!584802)))

(declare-fun b!1034506 () Bool)

(declare-fun e!584803 () Bool)

(assert (=> b!1034506 (= e!584802 e!584803)))

(declare-fun res!690938 () Bool)

(assert (=> b!1034506 (=> (not res!690938) (not e!584803))))

(assert (=> b!1034506 (= res!690938 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456196))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456196))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) ((_ is Cons!21901) (toList!6893 lt!456196)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456196))) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(declare-fun b!1034507 () Bool)

(assert (=> b!1034507 (= e!584803 (containsKey!563 (t!31103 (toList!6893 lt!456196)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (= (and d!124295 (not res!690937)) b!1034506))

(assert (= (and b!1034506 res!690938) b!1034507))

(assert (=> b!1034507 m!953361))

(declare-fun m!954685 () Bool)

(assert (=> b!1034507 m!954685))

(assert (=> d!123837 d!124295))

(declare-fun d!124297 () Bool)

(assert (=> d!124297 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456193) lt!456187)) (v!14889 (getValueByKey!588 (toList!6893 lt!456193) lt!456187)))))

(assert (=> d!123867 d!124297))

(declare-fun b!1034511 () Bool)

(declare-fun e!584805 () Option!639)

(assert (=> b!1034511 (= e!584805 None!637)))

(declare-fun b!1034508 () Bool)

(declare-fun e!584804 () Option!639)

(assert (=> b!1034508 (= e!584804 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456193)))))))

(declare-fun b!1034510 () Bool)

(assert (=> b!1034510 (= e!584805 (getValueByKey!588 (t!31103 (toList!6893 lt!456193)) lt!456187))))

(declare-fun d!124299 () Bool)

(declare-fun c!104634 () Bool)

(assert (=> d!124299 (= c!104634 (and ((_ is Cons!21901) (toList!6893 lt!456193)) (= (_1!7874 (h!23103 (toList!6893 lt!456193))) lt!456187)))))

(assert (=> d!124299 (= (getValueByKey!588 (toList!6893 lt!456193) lt!456187) e!584804)))

(declare-fun b!1034509 () Bool)

(assert (=> b!1034509 (= e!584804 e!584805)))

(declare-fun c!104635 () Bool)

(assert (=> b!1034509 (= c!104635 (and ((_ is Cons!21901) (toList!6893 lt!456193)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456193))) lt!456187))))))

(assert (= (and d!124299 c!104634) b!1034508))

(assert (= (and d!124299 (not c!104634)) b!1034509))

(assert (= (and b!1034509 c!104635) b!1034510))

(assert (= (and b!1034509 (not c!104635)) b!1034511))

(declare-fun m!954687 () Bool)

(assert (=> b!1034510 m!954687))

(assert (=> d!123867 d!124299))

(declare-fun d!124301 () Bool)

(declare-fun e!584806 () Bool)

(assert (=> d!124301 e!584806))

(declare-fun res!690939 () Bool)

(assert (=> d!124301 (=> res!690939 e!584806)))

(declare-fun lt!456616 () Bool)

(assert (=> d!124301 (= res!690939 (not lt!456616))))

(declare-fun lt!456614 () Bool)

(assert (=> d!124301 (= lt!456616 lt!456614)))

(declare-fun lt!456613 () Unit!33831)

(declare-fun e!584807 () Unit!33831)

(assert (=> d!124301 (= lt!456613 e!584807)))

(declare-fun c!104636 () Bool)

(assert (=> d!124301 (= c!104636 lt!456614)))

(assert (=> d!124301 (= lt!456614 (containsKey!563 (toList!6893 lt!456207) lt!456220))))

(assert (=> d!124301 (= (contains!6012 lt!456207 lt!456220) lt!456616)))

(declare-fun b!1034512 () Bool)

(declare-fun lt!456615 () Unit!33831)

(assert (=> b!1034512 (= e!584807 lt!456615)))

(assert (=> b!1034512 (= lt!456615 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456207) lt!456220))))

(assert (=> b!1034512 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456207) lt!456220))))

(declare-fun b!1034513 () Bool)

(declare-fun Unit!33872 () Unit!33831)

(assert (=> b!1034513 (= e!584807 Unit!33872)))

(declare-fun b!1034514 () Bool)

(assert (=> b!1034514 (= e!584806 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456207) lt!456220)))))

(assert (= (and d!124301 c!104636) b!1034512))

(assert (= (and d!124301 (not c!104636)) b!1034513))

(assert (= (and d!124301 (not res!690939)) b!1034514))

(declare-fun m!954689 () Bool)

(assert (=> d!124301 m!954689))

(declare-fun m!954691 () Bool)

(assert (=> b!1034512 m!954691))

(assert (=> b!1034512 m!953841))

(assert (=> b!1034512 m!953841))

(declare-fun m!954693 () Bool)

(assert (=> b!1034512 m!954693))

(assert (=> b!1034514 m!953841))

(assert (=> b!1034514 m!953841))

(assert (=> b!1034514 m!954693))

(assert (=> d!123943 d!124301))

(assert (=> d!123943 d!123919))

(declare-fun d!124303 () Bool)

(assert (=> d!124303 (= (apply!906 (+!3104 lt!456207 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))) lt!456220) (apply!906 lt!456207 lt!456220))))

(assert (=> d!124303 true))

(declare-fun _$34!1169 () Unit!33831)

(assert (=> d!124303 (= (choose!1697 lt!456207 lt!456225 (zeroValue!6063 thiss!1427) lt!456220) _$34!1169)))

(declare-fun bs!30260 () Bool)

(assert (= bs!30260 d!124303))

(assert (=> bs!30260 m!953435))

(assert (=> bs!30260 m!953435))

(assert (=> bs!30260 m!953437))

(assert (=> bs!30260 m!953451))

(assert (=> d!123943 d!124303))

(assert (=> d!123943 d!123933))

(assert (=> d!123943 d!123921))

(assert (=> b!1033858 d!124207))

(declare-fun b!1034518 () Bool)

(declare-fun e!584809 () Option!639)

(assert (=> b!1034518 (= e!584809 None!637)))

(declare-fun b!1034515 () Bool)

(declare-fun e!584808 () Option!639)

(assert (=> b!1034515 (= e!584808 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456307)))))))

(declare-fun b!1034517 () Bool)

(assert (=> b!1034517 (= e!584809 (getValueByKey!588 (t!31103 (toList!6893 lt!456307)) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun d!124305 () Bool)

(declare-fun c!104637 () Bool)

(assert (=> d!124305 (= c!104637 (and ((_ is Cons!21901) (toList!6893 lt!456307)) (= (_1!7874 (h!23103 (toList!6893 lt!456307))) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(assert (=> d!124305 (= (getValueByKey!588 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123))) e!584808)))

(declare-fun b!1034516 () Bool)

(assert (=> b!1034516 (= e!584808 e!584809)))

(declare-fun c!104638 () Bool)

(assert (=> b!1034516 (= c!104638 (and ((_ is Cons!21901) (toList!6893 lt!456307)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456307))) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))))

(assert (= (and d!124305 c!104637) b!1034515))

(assert (= (and d!124305 (not c!104637)) b!1034516))

(assert (= (and b!1034516 c!104638) b!1034517))

(assert (= (and b!1034516 (not c!104638)) b!1034518))

(declare-fun m!954695 () Bool)

(assert (=> b!1034517 m!954695))

(assert (=> b!1033822 d!124305))

(declare-fun d!124307 () Bool)

(assert (=> d!124307 (= (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456210)) (v!14889 (getValueByKey!588 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456210)))))

(assert (=> d!123927 d!124307))

(declare-fun b!1034522 () Bool)

(declare-fun e!584811 () Option!639)

(assert (=> b!1034522 (= e!584811 None!637)))

(declare-fun b!1034519 () Bool)

(declare-fun e!584810 () Option!639)

(assert (=> b!1034519 (= e!584810 (Some!638 (_2!7874 (h!23103 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))))))))

(declare-fun b!1034521 () Bool)

(assert (=> b!1034521 (= e!584811 (getValueByKey!588 (t!31103 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))) lt!456210))))

(declare-fun c!104639 () Bool)

(declare-fun d!124309 () Bool)

(assert (=> d!124309 (= c!104639 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))) (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))) lt!456210)))))

(assert (=> d!124309 (= (getValueByKey!588 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))) lt!456210) e!584810)))

(declare-fun b!1034520 () Bool)

(assert (=> b!1034520 (= e!584810 e!584811)))

(declare-fun c!104640 () Bool)

(assert (=> b!1034520 (= c!104640 (and ((_ is Cons!21901) (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427))))) (not (= (_1!7874 (h!23103 (toList!6893 (+!3104 lt!456211 (tuple2!15727 lt!456222 (minValue!6063 thiss!1427)))))) lt!456210))))))

(assert (= (and d!124309 c!104639) b!1034519))

(assert (= (and d!124309 (not c!104639)) b!1034520))

(assert (= (and b!1034520 c!104640) b!1034521))

(assert (= (and b!1034520 (not c!104640)) b!1034522))

(declare-fun m!954697 () Bool)

(assert (=> b!1034521 m!954697))

(assert (=> d!123927 d!124309))

(declare-fun d!124311 () Bool)

(assert (=> d!124311 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456617 () Unit!33831)

(assert (=> d!124311 (= lt!456617 (choose!1699 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584812 () Bool)

(assert (=> d!124311 e!584812))

(declare-fun res!690940 () Bool)

(assert (=> d!124311 (=> (not res!690940) (not e!584812))))

(assert (=> d!124311 (= res!690940 (isStrictlySorted!718 (toList!6893 lt!456206)))))

(assert (=> d!124311 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000) lt!456617)))

(declare-fun b!1034523 () Bool)

(assert (=> b!1034523 (= e!584812 (containsKey!563 (toList!6893 lt!456206) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124311 res!690940) b!1034523))

(assert (=> d!124311 m!953777))

(assert (=> d!124311 m!953777))

(assert (=> d!124311 m!953779))

(declare-fun m!954699 () Bool)

(assert (=> d!124311 m!954699))

(declare-fun m!954701 () Bool)

(assert (=> d!124311 m!954701))

(assert (=> b!1034523 m!953773))

(assert (=> b!1033901 d!124311))

(assert (=> b!1033901 d!124061))

(assert (=> b!1033901 d!124063))

(declare-fun d!124313 () Bool)

(declare-fun e!584813 () Bool)

(assert (=> d!124313 e!584813))

(declare-fun res!690941 () Bool)

(assert (=> d!124313 (=> res!690941 e!584813)))

(declare-fun lt!456621 () Bool)

(assert (=> d!124313 (= res!690941 (not lt!456621))))

(declare-fun lt!456619 () Bool)

(assert (=> d!124313 (= lt!456621 lt!456619)))

(declare-fun lt!456618 () Unit!33831)

(declare-fun e!584814 () Unit!33831)

(assert (=> d!124313 (= lt!456618 e!584814)))

(declare-fun c!104641 () Bool)

(assert (=> d!124313 (= c!104641 lt!456619)))

(assert (=> d!124313 (= lt!456619 (containsKey!563 (toList!6893 lt!456298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!124313 (= (contains!6012 lt!456298 #b1000000000000000000000000000000000000000000000000000000000000000) lt!456621)))

(declare-fun b!1034524 () Bool)

(declare-fun lt!456620 () Unit!33831)

(assert (=> b!1034524 (= e!584814 lt!456620)))

(assert (=> b!1034524 (= lt!456620 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034524 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1034525 () Bool)

(declare-fun Unit!33873 () Unit!33831)

(assert (=> b!1034525 (= e!584814 Unit!33873)))

(declare-fun b!1034526 () Bool)

(assert (=> b!1034526 (= e!584813 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124313 c!104641) b!1034524))

(assert (= (and d!124313 (not c!104641)) b!1034525))

(assert (= (and d!124313 (not res!690941)) b!1034526))

(declare-fun m!954703 () Bool)

(assert (=> d!124313 m!954703))

(declare-fun m!954705 () Bool)

(assert (=> b!1034524 m!954705))

(declare-fun m!954707 () Bool)

(assert (=> b!1034524 m!954707))

(assert (=> b!1034524 m!954707))

(declare-fun m!954709 () Bool)

(assert (=> b!1034524 m!954709))

(assert (=> b!1034526 m!954707))

(assert (=> b!1034526 m!954707))

(assert (=> b!1034526 m!954709))

(assert (=> b!1033813 d!124313))

(declare-fun b!1034530 () Bool)

(declare-fun e!584816 () Option!639)

(assert (=> b!1034530 (= e!584816 None!637)))

(declare-fun b!1034527 () Bool)

(declare-fun e!584815 () Option!639)

(assert (=> b!1034527 (= e!584815 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456299)))))))

(declare-fun b!1034529 () Bool)

(assert (=> b!1034529 (= e!584816 (getValueByKey!588 (t!31103 (toList!6893 lt!456299)) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun c!104642 () Bool)

(declare-fun d!124315 () Bool)

(assert (=> d!124315 (= c!104642 (and ((_ is Cons!21901) (toList!6893 lt!456299)) (= (_1!7874 (h!23103 (toList!6893 lt!456299))) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(assert (=> d!124315 (= (getValueByKey!588 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) e!584815)))

(declare-fun b!1034528 () Bool)

(assert (=> b!1034528 (= e!584815 e!584816)))

(declare-fun c!104643 () Bool)

(assert (=> b!1034528 (= c!104643 (and ((_ is Cons!21901) (toList!6893 lt!456299)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456299))) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124315 c!104642) b!1034527))

(assert (= (and d!124315 (not c!104642)) b!1034528))

(assert (= (and b!1034528 c!104643) b!1034529))

(assert (= (and b!1034528 (not c!104643)) b!1034530))

(declare-fun m!954711 () Bool)

(assert (=> b!1034529 m!954711))

(assert (=> b!1033818 d!124315))

(assert (=> b!1033809 d!123997))

(assert (=> b!1033955 d!123977))

(declare-fun d!124317 () Bool)

(assert (=> d!124317 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(declare-fun lt!456622 () Unit!33831)

(assert (=> d!124317 (= lt!456622 (choose!1699 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(declare-fun e!584817 () Bool)

(assert (=> d!124317 e!584817))

(declare-fun res!690942 () Bool)

(assert (=> d!124317 (=> (not res!690942) (not e!584817))))

(assert (=> d!124317 (= res!690942 (isStrictlySorted!718 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123)))))))

(assert (=> d!124317 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188) lt!456622)))

(declare-fun b!1034531 () Bool)

(assert (=> b!1034531 (= e!584817 (containsKey!563 (toList!6893 (+!3104 lt!456203 (tuple2!15727 lt!456189 lt!456123))) lt!456188))))

(assert (= (and d!124317 res!690942) b!1034531))

(assert (=> d!124317 m!953667))

(assert (=> d!124317 m!953667))

(assert (=> d!124317 m!953669))

(declare-fun m!954713 () Bool)

(assert (=> d!124317 m!954713))

(declare-fun m!954715 () Bool)

(assert (=> d!124317 m!954715))

(assert (=> b!1034531 m!953663))

(assert (=> b!1033843 d!124317))

(assert (=> b!1033843 d!124091))

(assert (=> b!1033843 d!124093))

(assert (=> b!1033952 d!124145))

(assert (=> b!1033952 d!124147))

(assert (=> d!123883 d!124241))

(declare-fun b!1034532 () Bool)

(declare-fun e!584818 () Bool)

(declare-fun e!584820 () Bool)

(assert (=> b!1034532 (= e!584818 e!584820)))

(declare-fun lt!456624 () (_ BitVec 64))

(assert (=> b!1034532 (= lt!456624 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!456623 () Unit!33831)

(assert (=> b!1034532 (= lt!456623 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 thiss!1427) lt!456624 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1034532 (arrayContainsKey!0 (_keys!11407 thiss!1427) lt!456624 #b00000000000000000000000000000000)))

(declare-fun lt!456625 () Unit!33831)

(assert (=> b!1034532 (= lt!456625 lt!456623)))

(declare-fun res!690943 () Bool)

(assert (=> b!1034532 (= res!690943 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)) (Found!9738 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1034532 (=> (not res!690943) (not e!584820))))

(declare-fun b!1034533 () Bool)

(declare-fun call!43737 () Bool)

(assert (=> b!1034533 (= e!584820 call!43737)))

(declare-fun d!124319 () Bool)

(declare-fun res!690944 () Bool)

(declare-fun e!584819 () Bool)

(assert (=> d!124319 (=> res!690944 e!584819)))

(assert (=> d!124319 (= res!690944 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(assert (=> d!124319 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)) e!584819)))

(declare-fun b!1034534 () Bool)

(assert (=> b!1034534 (= e!584819 e!584818)))

(declare-fun c!104644 () Bool)

(assert (=> b!1034534 (= c!104644 (validKeyInArray!0 (select (arr!31353 (_keys!11407 thiss!1427)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1034535 () Bool)

(assert (=> b!1034535 (= e!584818 call!43737)))

(declare-fun bm!43734 () Bool)

(assert (=> bm!43734 (= call!43737 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)))))

(assert (= (and d!124319 (not res!690944)) b!1034534))

(assert (= (and b!1034534 c!104644) b!1034532))

(assert (= (and b!1034534 (not c!104644)) b!1034535))

(assert (= (and b!1034532 res!690943) b!1034533))

(assert (= (or b!1034533 b!1034535) bm!43734))

(assert (=> b!1034532 m!953999))

(declare-fun m!954717 () Bool)

(assert (=> b!1034532 m!954717))

(declare-fun m!954719 () Bool)

(assert (=> b!1034532 m!954719))

(assert (=> b!1034532 m!953999))

(declare-fun m!954721 () Bool)

(assert (=> b!1034532 m!954721))

(assert (=> b!1034534 m!953999))

(assert (=> b!1034534 m!953999))

(assert (=> b!1034534 m!954013))

(declare-fun m!954723 () Bool)

(assert (=> bm!43734 m!954723))

(assert (=> bm!43690 d!124319))

(declare-fun d!124321 () Bool)

(assert (=> d!124321 (contains!6012 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) lt!456340)))

(declare-fun lt!456626 () Unit!33831)

(assert (=> d!124321 (= lt!456626 (choose!1698 lt!456355 lt!456341 (zeroValue!6063 lt!456124) lt!456340))))

(assert (=> d!124321 (contains!6012 lt!456355 lt!456340)))

(assert (=> d!124321 (= (addStillContains!625 lt!456355 lt!456341 (zeroValue!6063 lt!456124) lt!456340) lt!456626)))

(declare-fun bs!30261 () Bool)

(assert (= bs!30261 d!124321))

(assert (=> bs!30261 m!953721))

(assert (=> bs!30261 m!953721))

(assert (=> bs!30261 m!953723))

(declare-fun m!954725 () Bool)

(assert (=> bs!30261 m!954725))

(declare-fun m!954727 () Bool)

(assert (=> bs!30261 m!954727))

(assert (=> b!1033863 d!124321))

(assert (=> b!1033863 d!124047))

(declare-fun d!124323 () Bool)

(assert (=> d!124323 (= (apply!906 (+!3104 lt!456345 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) lt!456339) (apply!906 lt!456345 lt!456339))))

(declare-fun lt!456627 () Unit!33831)

(assert (=> d!124323 (= lt!456627 (choose!1697 lt!456345 lt!456354 (minValue!6063 lt!456124) lt!456339))))

(declare-fun e!584821 () Bool)

(assert (=> d!124323 e!584821))

(declare-fun res!690945 () Bool)

(assert (=> d!124323 (=> (not res!690945) (not e!584821))))

(assert (=> d!124323 (= res!690945 (contains!6012 lt!456345 lt!456339))))

(assert (=> d!124323 (= (addApplyDifferent!485 lt!456345 lt!456354 (minValue!6063 lt!456124) lt!456339) lt!456627)))

(declare-fun b!1034536 () Bool)

(assert (=> b!1034536 (= e!584821 (not (= lt!456339 lt!456354)))))

(assert (= (and d!124323 res!690945) b!1034536))

(declare-fun m!954729 () Bool)

(assert (=> d!124323 m!954729))

(assert (=> d!124323 m!953715))

(assert (=> d!124323 m!953717))

(declare-fun m!954731 () Bool)

(assert (=> d!124323 m!954731))

(assert (=> d!124323 m!953715))

(assert (=> d!124323 m!953727))

(assert (=> b!1033863 d!124323))

(declare-fun d!124325 () Bool)

(declare-fun e!584822 () Bool)

(assert (=> d!124325 e!584822))

(declare-fun res!690946 () Bool)

(assert (=> d!124325 (=> (not res!690946) (not e!584822))))

(declare-fun lt!456628 () ListLongMap!13755)

(assert (=> d!124325 (= res!690946 (contains!6012 lt!456628 (_1!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))))))

(declare-fun lt!456631 () List!21905)

(assert (=> d!124325 (= lt!456628 (ListLongMap!13756 lt!456631))))

(declare-fun lt!456630 () Unit!33831)

(declare-fun lt!456629 () Unit!33831)

(assert (=> d!124325 (= lt!456630 lt!456629)))

(assert (=> d!124325 (= (getValueByKey!588 lt!456631 (_1!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))))))

(assert (=> d!124325 (= lt!456629 (lemmaContainsTupThenGetReturnValue!279 lt!456631 (_1!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))))))

(assert (=> d!124325 (= lt!456631 (insertStrictlySorted!372 (toList!6893 lt!456338) (_1!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))))))

(assert (=> d!124325 (= (+!3104 lt!456338 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) lt!456628)))

(declare-fun b!1034537 () Bool)

(declare-fun res!690947 () Bool)

(assert (=> b!1034537 (=> (not res!690947) (not e!584822))))

(assert (=> b!1034537 (= res!690947 (= (getValueByKey!588 (toList!6893 lt!456628) (_1!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))))))))

(declare-fun b!1034538 () Bool)

(assert (=> b!1034538 (= e!584822 (contains!6013 (toList!6893 lt!456628) (tuple2!15727 lt!456349 (minValue!6063 lt!456124))))))

(assert (= (and d!124325 res!690946) b!1034537))

(assert (= (and b!1034537 res!690947) b!1034538))

(declare-fun m!954733 () Bool)

(assert (=> d!124325 m!954733))

(declare-fun m!954735 () Bool)

(assert (=> d!124325 m!954735))

(declare-fun m!954737 () Bool)

(assert (=> d!124325 m!954737))

(declare-fun m!954739 () Bool)

(assert (=> d!124325 m!954739))

(declare-fun m!954741 () Bool)

(assert (=> b!1034537 m!954741))

(declare-fun m!954743 () Bool)

(assert (=> b!1034538 m!954743))

(assert (=> b!1033863 d!124325))

(declare-fun d!124327 () Bool)

(assert (=> d!124327 (= (apply!906 lt!456345 lt!456339) (get!16434 (getValueByKey!588 (toList!6893 lt!456345) lt!456339)))))

(declare-fun bs!30262 () Bool)

(assert (= bs!30262 d!124327))

(declare-fun m!954745 () Bool)

(assert (=> bs!30262 m!954745))

(assert (=> bs!30262 m!954745))

(declare-fun m!954747 () Bool)

(assert (=> bs!30262 m!954747))

(assert (=> b!1033863 d!124327))

(declare-fun d!124329 () Bool)

(assert (=> d!124329 (= (apply!906 lt!456338 lt!456337) (get!16434 (getValueByKey!588 (toList!6893 lt!456338) lt!456337)))))

(declare-fun bs!30263 () Bool)

(assert (= bs!30263 d!124329))

(declare-fun m!954749 () Bool)

(assert (=> bs!30263 m!954749))

(assert (=> bs!30263 m!954749))

(declare-fun m!954751 () Bool)

(assert (=> bs!30263 m!954751))

(assert (=> b!1033863 d!124329))

(declare-fun d!124331 () Bool)

(assert (=> d!124331 (= (apply!906 (+!3104 lt!456334 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) lt!456347) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456334 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))) lt!456347)))))

(declare-fun bs!30264 () Bool)

(assert (= bs!30264 d!124331))

(declare-fun m!954753 () Bool)

(assert (=> bs!30264 m!954753))

(assert (=> bs!30264 m!954753))

(declare-fun m!954755 () Bool)

(assert (=> bs!30264 m!954755))

(assert (=> b!1033863 d!124331))

(declare-fun d!124333 () Bool)

(assert (=> d!124333 (= (apply!906 (+!3104 lt!456338 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) lt!456337) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456338 (tuple2!15727 lt!456349 (minValue!6063 lt!456124)))) lt!456337)))))

(declare-fun bs!30265 () Bool)

(assert (= bs!30265 d!124333))

(declare-fun m!954757 () Bool)

(assert (=> bs!30265 m!954757))

(assert (=> bs!30265 m!954757))

(declare-fun m!954759 () Bool)

(assert (=> bs!30265 m!954759))

(assert (=> b!1033863 d!124333))

(declare-fun d!124335 () Bool)

(assert (=> d!124335 (= (apply!906 (+!3104 lt!456334 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) lt!456347) (apply!906 lt!456334 lt!456347))))

(declare-fun lt!456632 () Unit!33831)

(assert (=> d!124335 (= lt!456632 (choose!1697 lt!456334 lt!456352 (zeroValue!6063 lt!456124) lt!456347))))

(declare-fun e!584823 () Bool)

(assert (=> d!124335 e!584823))

(declare-fun res!690948 () Bool)

(assert (=> d!124335 (=> (not res!690948) (not e!584823))))

(assert (=> d!124335 (= res!690948 (contains!6012 lt!456334 lt!456347))))

(assert (=> d!124335 (= (addApplyDifferent!485 lt!456334 lt!456352 (zeroValue!6063 lt!456124) lt!456347) lt!456632)))

(declare-fun b!1034539 () Bool)

(assert (=> b!1034539 (= e!584823 (not (= lt!456347 lt!456352)))))

(assert (= (and d!124335 res!690948) b!1034539))

(declare-fun m!954761 () Bool)

(assert (=> d!124335 m!954761))

(assert (=> d!124335 m!953709))

(assert (=> d!124335 m!953711))

(declare-fun m!954763 () Bool)

(assert (=> d!124335 m!954763))

(assert (=> d!124335 m!953709))

(assert (=> d!124335 m!953725))

(assert (=> b!1033863 d!124335))

(declare-fun d!124337 () Bool)

(assert (=> d!124337 (= (apply!906 lt!456334 lt!456347) (get!16434 (getValueByKey!588 (toList!6893 lt!456334) lt!456347)))))

(declare-fun bs!30266 () Bool)

(assert (= bs!30266 d!124337))

(declare-fun m!954765 () Bool)

(assert (=> bs!30266 m!954765))

(assert (=> bs!30266 m!954765))

(declare-fun m!954767 () Bool)

(assert (=> bs!30266 m!954767))

(assert (=> b!1033863 d!124337))

(declare-fun d!124339 () Bool)

(declare-fun e!584824 () Bool)

(assert (=> d!124339 e!584824))

(declare-fun res!690949 () Bool)

(assert (=> d!124339 (=> res!690949 e!584824)))

(declare-fun lt!456636 () Bool)

(assert (=> d!124339 (= res!690949 (not lt!456636))))

(declare-fun lt!456634 () Bool)

(assert (=> d!124339 (= lt!456636 lt!456634)))

(declare-fun lt!456633 () Unit!33831)

(declare-fun e!584825 () Unit!33831)

(assert (=> d!124339 (= lt!456633 e!584825)))

(declare-fun c!104645 () Bool)

(assert (=> d!124339 (= c!104645 lt!456634)))

(assert (=> d!124339 (= lt!456634 (containsKey!563 (toList!6893 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) lt!456340))))

(assert (=> d!124339 (= (contains!6012 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) lt!456340) lt!456636)))

(declare-fun b!1034540 () Bool)

(declare-fun lt!456635 () Unit!33831)

(assert (=> b!1034540 (= e!584825 lt!456635)))

(assert (=> b!1034540 (= lt!456635 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) lt!456340))))

(assert (=> b!1034540 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) lt!456340))))

(declare-fun b!1034541 () Bool)

(declare-fun Unit!33874 () Unit!33831)

(assert (=> b!1034541 (= e!584825 Unit!33874)))

(declare-fun b!1034542 () Bool)

(assert (=> b!1034542 (= e!584824 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) lt!456340)))))

(assert (= (and d!124339 c!104645) b!1034540))

(assert (= (and d!124339 (not c!104645)) b!1034541))

(assert (= (and d!124339 (not res!690949)) b!1034542))

(declare-fun m!954769 () Bool)

(assert (=> d!124339 m!954769))

(declare-fun m!954771 () Bool)

(assert (=> b!1034540 m!954771))

(declare-fun m!954773 () Bool)

(assert (=> b!1034540 m!954773))

(assert (=> b!1034540 m!954773))

(declare-fun m!954775 () Bool)

(assert (=> b!1034540 m!954775))

(assert (=> b!1034542 m!954773))

(assert (=> b!1034542 m!954773))

(assert (=> b!1034542 m!954775))

(assert (=> b!1033863 d!124339))

(declare-fun d!124341 () Bool)

(assert (=> d!124341 (= (apply!906 (+!3104 lt!456338 (tuple2!15727 lt!456349 (minValue!6063 lt!456124))) lt!456337) (apply!906 lt!456338 lt!456337))))

(declare-fun lt!456637 () Unit!33831)

(assert (=> d!124341 (= lt!456637 (choose!1697 lt!456338 lt!456349 (minValue!6063 lt!456124) lt!456337))))

(declare-fun e!584826 () Bool)

(assert (=> d!124341 e!584826))

(declare-fun res!690950 () Bool)

(assert (=> d!124341 (=> (not res!690950) (not e!584826))))

(assert (=> d!124341 (= res!690950 (contains!6012 lt!456338 lt!456337))))

(assert (=> d!124341 (= (addApplyDifferent!485 lt!456338 lt!456349 (minValue!6063 lt!456124) lt!456337) lt!456637)))

(declare-fun b!1034543 () Bool)

(assert (=> b!1034543 (= e!584826 (not (= lt!456337 lt!456349)))))

(assert (= (and d!124341 res!690950) b!1034543))

(declare-fun m!954777 () Bool)

(assert (=> d!124341 m!954777))

(assert (=> d!124341 m!953733))

(assert (=> d!124341 m!953735))

(declare-fun m!954779 () Bool)

(assert (=> d!124341 m!954779))

(assert (=> d!124341 m!953733))

(assert (=> d!124341 m!953737))

(assert (=> b!1033863 d!124341))

(declare-fun d!124343 () Bool)

(declare-fun e!584827 () Bool)

(assert (=> d!124343 e!584827))

(declare-fun res!690951 () Bool)

(assert (=> d!124343 (=> (not res!690951) (not e!584827))))

(declare-fun lt!456638 () ListLongMap!13755)

(assert (=> d!124343 (= res!690951 (contains!6012 lt!456638 (_1!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))))))

(declare-fun lt!456641 () List!21905)

(assert (=> d!124343 (= lt!456638 (ListLongMap!13756 lt!456641))))

(declare-fun lt!456640 () Unit!33831)

(declare-fun lt!456639 () Unit!33831)

(assert (=> d!124343 (= lt!456640 lt!456639)))

(assert (=> d!124343 (= (getValueByKey!588 lt!456641 (_1!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))))))

(assert (=> d!124343 (= lt!456639 (lemmaContainsTupThenGetReturnValue!279 lt!456641 (_1!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))))))

(assert (=> d!124343 (= lt!456641 (insertStrictlySorted!372 (toList!6893 lt!456345) (_1!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))))))

(assert (=> d!124343 (= (+!3104 lt!456345 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) lt!456638)))

(declare-fun b!1034544 () Bool)

(declare-fun res!690952 () Bool)

(assert (=> b!1034544 (=> (not res!690952) (not e!584827))))

(assert (=> b!1034544 (= res!690952 (= (getValueByKey!588 (toList!6893 lt!456638) (_1!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))))))))

(declare-fun b!1034545 () Bool)

(assert (=> b!1034545 (= e!584827 (contains!6013 (toList!6893 lt!456638) (tuple2!15727 lt!456354 (minValue!6063 lt!456124))))))

(assert (= (and d!124343 res!690951) b!1034544))

(assert (= (and b!1034544 res!690952) b!1034545))

(declare-fun m!954781 () Bool)

(assert (=> d!124343 m!954781))

(declare-fun m!954783 () Bool)

(assert (=> d!124343 m!954783))

(declare-fun m!954785 () Bool)

(assert (=> d!124343 m!954785))

(declare-fun m!954787 () Bool)

(assert (=> d!124343 m!954787))

(declare-fun m!954789 () Bool)

(assert (=> b!1034544 m!954789))

(declare-fun m!954791 () Bool)

(assert (=> b!1034545 m!954791))

(assert (=> b!1033863 d!124343))

(declare-fun d!124345 () Bool)

(declare-fun e!584828 () Bool)

(assert (=> d!124345 e!584828))

(declare-fun res!690953 () Bool)

(assert (=> d!124345 (=> (not res!690953) (not e!584828))))

(declare-fun lt!456642 () ListLongMap!13755)

(assert (=> d!124345 (= res!690953 (contains!6012 lt!456642 (_1!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))))))

(declare-fun lt!456645 () List!21905)

(assert (=> d!124345 (= lt!456642 (ListLongMap!13756 lt!456645))))

(declare-fun lt!456644 () Unit!33831)

(declare-fun lt!456643 () Unit!33831)

(assert (=> d!124345 (= lt!456644 lt!456643)))

(assert (=> d!124345 (= (getValueByKey!588 lt!456645 (_1!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124345 (= lt!456643 (lemmaContainsTupThenGetReturnValue!279 lt!456645 (_1!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124345 (= lt!456645 (insertStrictlySorted!372 (toList!6893 lt!456334) (_1!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124345 (= (+!3104 lt!456334 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))) lt!456642)))

(declare-fun b!1034546 () Bool)

(declare-fun res!690954 () Bool)

(assert (=> b!1034546 (=> (not res!690954) (not e!584828))))

(assert (=> b!1034546 (= res!690954 (= (getValueByKey!588 (toList!6893 lt!456642) (_1!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))))))))

(declare-fun b!1034547 () Bool)

(assert (=> b!1034547 (= e!584828 (contains!6013 (toList!6893 lt!456642) (tuple2!15727 lt!456352 (zeroValue!6063 lt!456124))))))

(assert (= (and d!124345 res!690953) b!1034546))

(assert (= (and b!1034546 res!690954) b!1034547))

(declare-fun m!954793 () Bool)

(assert (=> d!124345 m!954793))

(declare-fun m!954795 () Bool)

(assert (=> d!124345 m!954795))

(declare-fun m!954797 () Bool)

(assert (=> d!124345 m!954797))

(declare-fun m!954799 () Bool)

(assert (=> d!124345 m!954799))

(declare-fun m!954801 () Bool)

(assert (=> b!1034546 m!954801))

(declare-fun m!954803 () Bool)

(assert (=> b!1034547 m!954803))

(assert (=> b!1033863 d!124345))

(declare-fun d!124347 () Bool)

(assert (=> d!124347 (= (apply!906 (+!3104 lt!456345 (tuple2!15727 lt!456354 (minValue!6063 lt!456124))) lt!456339) (get!16434 (getValueByKey!588 (toList!6893 (+!3104 lt!456345 (tuple2!15727 lt!456354 (minValue!6063 lt!456124)))) lt!456339)))))

(declare-fun bs!30267 () Bool)

(assert (= bs!30267 d!124347))

(declare-fun m!954805 () Bool)

(assert (=> bs!30267 m!954805))

(assert (=> bs!30267 m!954805))

(declare-fun m!954807 () Bool)

(assert (=> bs!30267 m!954807))

(assert (=> b!1033863 d!124347))

(declare-fun d!124349 () Bool)

(declare-fun e!584829 () Bool)

(assert (=> d!124349 e!584829))

(declare-fun res!690955 () Bool)

(assert (=> d!124349 (=> (not res!690955) (not e!584829))))

(declare-fun lt!456646 () ListLongMap!13755)

(assert (=> d!124349 (= res!690955 (contains!6012 lt!456646 (_1!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))))))

(declare-fun lt!456649 () List!21905)

(assert (=> d!124349 (= lt!456646 (ListLongMap!13756 lt!456649))))

(declare-fun lt!456648 () Unit!33831)

(declare-fun lt!456647 () Unit!33831)

(assert (=> d!124349 (= lt!456648 lt!456647)))

(assert (=> d!124349 (= (getValueByKey!588 lt!456649 (_1!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124349 (= lt!456647 (lemmaContainsTupThenGetReturnValue!279 lt!456649 (_1!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124349 (= lt!456649 (insertStrictlySorted!372 (toList!6893 lt!456355) (_1!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) (_2!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))))))

(assert (=> d!124349 (= (+!3104 lt!456355 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))) lt!456646)))

(declare-fun b!1034548 () Bool)

(declare-fun res!690956 () Bool)

(assert (=> b!1034548 (=> (not res!690956) (not e!584829))))

(assert (=> b!1034548 (= res!690956 (= (getValueByKey!588 (toList!6893 lt!456646) (_1!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124)))) (Some!638 (_2!7874 (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))))))))

(declare-fun b!1034549 () Bool)

(assert (=> b!1034549 (= e!584829 (contains!6013 (toList!6893 lt!456646) (tuple2!15727 lt!456341 (zeroValue!6063 lt!456124))))))

(assert (= (and d!124349 res!690955) b!1034548))

(assert (= (and b!1034548 res!690956) b!1034549))

(declare-fun m!954809 () Bool)

(assert (=> d!124349 m!954809))

(declare-fun m!954811 () Bool)

(assert (=> d!124349 m!954811))

(declare-fun m!954813 () Bool)

(assert (=> d!124349 m!954813))

(declare-fun m!954815 () Bool)

(assert (=> d!124349 m!954815))

(declare-fun m!954817 () Bool)

(assert (=> b!1034548 m!954817))

(declare-fun m!954819 () Bool)

(assert (=> b!1034549 m!954819))

(assert (=> b!1033863 d!124349))

(declare-fun d!124351 () Bool)

(declare-fun e!584830 () Bool)

(assert (=> d!124351 e!584830))

(declare-fun res!690957 () Bool)

(assert (=> d!124351 (=> (not res!690957) (not e!584830))))

(declare-fun lt!456650 () ListLongMap!13755)

(assert (=> d!124351 (= res!690957 (contains!6012 lt!456650 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!456653 () List!21905)

(assert (=> d!124351 (= lt!456650 (ListLongMap!13756 lt!456653))))

(declare-fun lt!456652 () Unit!33831)

(declare-fun lt!456651 () Unit!33831)

(assert (=> d!124351 (= lt!456652 lt!456651)))

(assert (=> d!124351 (= (getValueByKey!588 lt!456653 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!638 (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124351 (= lt!456651 (lemmaContainsTupThenGetReturnValue!279 lt!456653 (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124351 (= lt!456653 (insertStrictlySorted!372 (toList!6893 call!43682) (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!124351 (= (+!3104 call!43682 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!456650)))

(declare-fun b!1034550 () Bool)

(declare-fun res!690958 () Bool)

(assert (=> b!1034550 (=> (not res!690958) (not e!584830))))

(assert (=> b!1034550 (= res!690958 (= (getValueByKey!588 (toList!6893 lt!456650) (_1!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!638 (_2!7874 (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1034551 () Bool)

(assert (=> b!1034551 (= e!584830 (contains!6013 (toList!6893 lt!456650) (tuple2!15727 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (get!16433 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!124351 res!690957) b!1034550))

(assert (= (and b!1034550 res!690958) b!1034551))

(declare-fun m!954821 () Bool)

(assert (=> d!124351 m!954821))

(declare-fun m!954823 () Bool)

(assert (=> d!124351 m!954823))

(declare-fun m!954825 () Bool)

(assert (=> d!124351 m!954825))

(declare-fun m!954827 () Bool)

(assert (=> d!124351 m!954827))

(declare-fun m!954829 () Bool)

(assert (=> b!1034550 m!954829))

(declare-fun m!954831 () Bool)

(assert (=> b!1034551 m!954831))

(assert (=> b!1033833 d!124351))

(declare-fun d!124353 () Bool)

(assert (=> d!124353 (not (contains!6012 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318)) lt!456319))))

(declare-fun lt!456654 () Unit!33831)

(assert (=> d!124353 (= lt!456654 (choose!1701 lt!456317 lt!456315 lt!456318 lt!456319))))

(declare-fun e!584831 () Bool)

(assert (=> d!124353 e!584831))

(declare-fun res!690959 () Bool)

(assert (=> d!124353 (=> (not res!690959) (not e!584831))))

(assert (=> d!124353 (= res!690959 (not (contains!6012 lt!456317 lt!456319)))))

(assert (=> d!124353 (= (addStillNotContains!242 lt!456317 lt!456315 lt!456318 lt!456319) lt!456654)))

(declare-fun b!1034552 () Bool)

(assert (=> b!1034552 (= e!584831 (not (= lt!456315 lt!456319)))))

(assert (= (and d!124353 res!690959) b!1034552))

(assert (=> d!124353 m!953619))

(assert (=> d!124353 m!953619))

(assert (=> d!124353 m!953621))

(declare-fun m!954833 () Bool)

(assert (=> d!124353 m!954833))

(declare-fun m!954835 () Bool)

(assert (=> d!124353 m!954835))

(assert (=> b!1033833 d!124353))

(assert (=> b!1033833 d!123847))

(declare-fun d!124355 () Bool)

(declare-fun e!584832 () Bool)

(assert (=> d!124355 e!584832))

(declare-fun res!690960 () Bool)

(assert (=> d!124355 (=> (not res!690960) (not e!584832))))

(declare-fun lt!456655 () ListLongMap!13755)

(assert (=> d!124355 (= res!690960 (contains!6012 lt!456655 (_1!7874 (tuple2!15727 lt!456315 lt!456318))))))

(declare-fun lt!456658 () List!21905)

(assert (=> d!124355 (= lt!456655 (ListLongMap!13756 lt!456658))))

(declare-fun lt!456657 () Unit!33831)

(declare-fun lt!456656 () Unit!33831)

(assert (=> d!124355 (= lt!456657 lt!456656)))

(assert (=> d!124355 (= (getValueByKey!588 lt!456658 (_1!7874 (tuple2!15727 lt!456315 lt!456318))) (Some!638 (_2!7874 (tuple2!15727 lt!456315 lt!456318))))))

(assert (=> d!124355 (= lt!456656 (lemmaContainsTupThenGetReturnValue!279 lt!456658 (_1!7874 (tuple2!15727 lt!456315 lt!456318)) (_2!7874 (tuple2!15727 lt!456315 lt!456318))))))

(assert (=> d!124355 (= lt!456658 (insertStrictlySorted!372 (toList!6893 lt!456317) (_1!7874 (tuple2!15727 lt!456315 lt!456318)) (_2!7874 (tuple2!15727 lt!456315 lt!456318))))))

(assert (=> d!124355 (= (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318)) lt!456655)))

(declare-fun b!1034553 () Bool)

(declare-fun res!690961 () Bool)

(assert (=> b!1034553 (=> (not res!690961) (not e!584832))))

(assert (=> b!1034553 (= res!690961 (= (getValueByKey!588 (toList!6893 lt!456655) (_1!7874 (tuple2!15727 lt!456315 lt!456318))) (Some!638 (_2!7874 (tuple2!15727 lt!456315 lt!456318)))))))

(declare-fun b!1034554 () Bool)

(assert (=> b!1034554 (= e!584832 (contains!6013 (toList!6893 lt!456655) (tuple2!15727 lt!456315 lt!456318)))))

(assert (= (and d!124355 res!690960) b!1034553))

(assert (= (and b!1034553 res!690961) b!1034554))

(declare-fun m!954837 () Bool)

(assert (=> d!124355 m!954837))

(declare-fun m!954839 () Bool)

(assert (=> d!124355 m!954839))

(declare-fun m!954841 () Bool)

(assert (=> d!124355 m!954841))

(declare-fun m!954843 () Bool)

(assert (=> d!124355 m!954843))

(declare-fun m!954845 () Bool)

(assert (=> b!1034553 m!954845))

(declare-fun m!954847 () Bool)

(assert (=> b!1034554 m!954847))

(assert (=> b!1033833 d!124355))

(declare-fun d!124357 () Bool)

(declare-fun e!584833 () Bool)

(assert (=> d!124357 e!584833))

(declare-fun res!690962 () Bool)

(assert (=> d!124357 (=> res!690962 e!584833)))

(declare-fun lt!456662 () Bool)

(assert (=> d!124357 (= res!690962 (not lt!456662))))

(declare-fun lt!456660 () Bool)

(assert (=> d!124357 (= lt!456662 lt!456660)))

(declare-fun lt!456659 () Unit!33831)

(declare-fun e!584834 () Unit!33831)

(assert (=> d!124357 (= lt!456659 e!584834)))

(declare-fun c!104646 () Bool)

(assert (=> d!124357 (= c!104646 lt!456660)))

(assert (=> d!124357 (= lt!456660 (containsKey!563 (toList!6893 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318))) lt!456319))))

(assert (=> d!124357 (= (contains!6012 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318)) lt!456319) lt!456662)))

(declare-fun b!1034555 () Bool)

(declare-fun lt!456661 () Unit!33831)

(assert (=> b!1034555 (= e!584834 lt!456661)))

(assert (=> b!1034555 (= lt!456661 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318))) lt!456319))))

(assert (=> b!1034555 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318))) lt!456319))))

(declare-fun b!1034556 () Bool)

(declare-fun Unit!33875 () Unit!33831)

(assert (=> b!1034556 (= e!584834 Unit!33875)))

(declare-fun b!1034557 () Bool)

(assert (=> b!1034557 (= e!584833 (isDefined!435 (getValueByKey!588 (toList!6893 (+!3104 lt!456317 (tuple2!15727 lt!456315 lt!456318))) lt!456319)))))

(assert (= (and d!124357 c!104646) b!1034555))

(assert (= (and d!124357 (not c!104646)) b!1034556))

(assert (= (and d!124357 (not res!690962)) b!1034557))

(declare-fun m!954849 () Bool)

(assert (=> d!124357 m!954849))

(declare-fun m!954851 () Bool)

(assert (=> b!1034555 m!954851))

(declare-fun m!954853 () Bool)

(assert (=> b!1034555 m!954853))

(assert (=> b!1034555 m!954853))

(declare-fun m!954855 () Bool)

(assert (=> b!1034555 m!954855))

(assert (=> b!1034557 m!954853))

(assert (=> b!1034557 m!954853))

(assert (=> b!1034557 m!954855))

(assert (=> b!1033833 d!124357))

(declare-fun d!124359 () Bool)

(assert (=> d!124359 (= (apply!906 lt!456348 (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000)) (get!16434 (getValueByKey!588 (toList!6893 lt!456348) (select (arr!31353 (_keys!11407 lt!456124)) #b00000000000000000000000000000000))))))

(declare-fun bs!30268 () Bool)

(assert (= bs!30268 d!124359))

(assert (=> bs!30268 m!953485))

(assert (=> bs!30268 m!954053))

(assert (=> bs!30268 m!954053))

(declare-fun m!954857 () Bool)

(assert (=> bs!30268 m!954857))

(assert (=> b!1033880 d!124359))

(declare-fun d!124361 () Bool)

(declare-fun c!104647 () Bool)

(assert (=> d!124361 (= c!104647 ((_ is ValueCellFull!11556) (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000)))))

(declare-fun e!584835 () V!37565)

(assert (=> d!124361 (= (get!16433 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000)) e!584835)))

(declare-fun b!1034558 () Bool)

(assert (=> b!1034558 (= e!584835 (get!16435 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034559 () Bool)

(assert (=> b!1034559 (= e!584835 (get!16436 (select (arr!31354 (_values!6250 lt!456124)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 lt!456124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!124361 c!104647) b!1034558))

(assert (= (and d!124361 (not c!104647)) b!1034559))

(assert (=> b!1034558 m!953695))

(assert (=> b!1034558 m!953697))

(declare-fun m!954859 () Bool)

(assert (=> b!1034558 m!954859))

(assert (=> b!1034559 m!953695))

(assert (=> b!1034559 m!953697))

(declare-fun m!954861 () Bool)

(assert (=> b!1034559 m!954861))

(assert (=> b!1033880 d!124361))

(declare-fun d!124363 () Bool)

(assert (=> d!124363 (arrayContainsKey!0 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000)))

(declare-fun lt!456663 () Unit!33831)

(assert (=> d!124363 (= lt!456663 (choose!13 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000))))

(assert (=> d!124363 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!124363 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000) lt!456663)))

(declare-fun bs!30269 () Bool)

(assert (= bs!30269 d!124363))

(assert (=> bs!30269 m!953793))

(declare-fun m!954863 () Bool)

(assert (=> bs!30269 m!954863))

(assert (=> b!1033919 d!124363))

(declare-fun d!124365 () Bool)

(declare-fun res!690963 () Bool)

(declare-fun e!584836 () Bool)

(assert (=> d!124365 (=> res!690963 e!584836)))

(assert (=> d!124365 (= res!690963 (= (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) lt!456372))))

(assert (=> d!124365 (= (arrayContainsKey!0 (_keys!11407 thiss!1427) lt!456372 #b00000000000000000000000000000000) e!584836)))

(declare-fun b!1034560 () Bool)

(declare-fun e!584837 () Bool)

(assert (=> b!1034560 (= e!584836 e!584837)))

(declare-fun res!690964 () Bool)

(assert (=> b!1034560 (=> (not res!690964) (not e!584837))))

(assert (=> b!1034560 (= res!690964 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31875 (_keys!11407 thiss!1427))))))

(declare-fun b!1034561 () Bool)

(assert (=> b!1034561 (= e!584837 (arrayContainsKey!0 (_keys!11407 thiss!1427) lt!456372 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!124365 (not res!690963)) b!1034560))

(assert (= (and b!1034560 res!690964) b!1034561))

(assert (=> d!124365 m!953361))

(declare-fun m!954865 () Bool)

(assert (=> b!1034561 m!954865))

(assert (=> b!1033919 d!124365))

(declare-fun d!124367 () Bool)

(declare-fun lt!456666 () SeekEntryResult!9738)

(assert (=> d!124367 (and (or ((_ is Undefined!9738) lt!456666) (not ((_ is Found!9738) lt!456666)) (and (bvsge (index!41324 lt!456666) #b00000000000000000000000000000000) (bvslt (index!41324 lt!456666) (size!31875 (_keys!11407 thiss!1427))))) (or ((_ is Undefined!9738) lt!456666) ((_ is Found!9738) lt!456666) (not ((_ is MissingZero!9738) lt!456666)) (and (bvsge (index!41323 lt!456666) #b00000000000000000000000000000000) (bvslt (index!41323 lt!456666) (size!31875 (_keys!11407 thiss!1427))))) (or ((_ is Undefined!9738) lt!456666) ((_ is Found!9738) lt!456666) ((_ is MissingZero!9738) lt!456666) (not ((_ is MissingVacant!9738) lt!456666)) (and (bvsge (index!41326 lt!456666) #b00000000000000000000000000000000) (bvslt (index!41326 lt!456666) (size!31875 (_keys!11407 thiss!1427))))) (or ((_ is Undefined!9738) lt!456666) (ite ((_ is Found!9738) lt!456666) (= (select (arr!31353 (_keys!11407 thiss!1427)) (index!41324 lt!456666)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9738) lt!456666) (= (select (arr!31353 (_keys!11407 thiss!1427)) (index!41323 lt!456666)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9738) lt!456666) (= (select (arr!31353 (_keys!11407 thiss!1427)) (index!41326 lt!456666)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!584839 () SeekEntryResult!9738)

(assert (=> d!124367 (= lt!456666 e!584839)))

(declare-fun c!104649 () Bool)

(declare-fun lt!456664 () SeekEntryResult!9738)

(assert (=> d!124367 (= c!104649 (and ((_ is Intermediate!9738) lt!456664) (undefined!10550 lt!456664)))))

(assert (=> d!124367 (= lt!456664 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (mask!30084 thiss!1427)) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)))))

(assert (=> d!124367 (validMask!0 (mask!30084 thiss!1427))))

(assert (=> d!124367 (= (seekEntryOrOpen!0 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)) lt!456666)))

(declare-fun b!1034562 () Bool)

(declare-fun e!584838 () SeekEntryResult!9738)

(assert (=> b!1034562 (= e!584839 e!584838)))

(declare-fun lt!456665 () (_ BitVec 64))

(assert (=> b!1034562 (= lt!456665 (select (arr!31353 (_keys!11407 thiss!1427)) (index!41325 lt!456664)))))

(declare-fun c!104650 () Bool)

(assert (=> b!1034562 (= c!104650 (= lt!456665 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034563 () Bool)

(declare-fun e!584840 () SeekEntryResult!9738)

(assert (=> b!1034563 (= e!584840 (MissingZero!9738 (index!41325 lt!456664)))))

(declare-fun b!1034564 () Bool)

(assert (=> b!1034564 (= e!584838 (Found!9738 (index!41325 lt!456664)))))

(declare-fun b!1034565 () Bool)

(assert (=> b!1034565 (= e!584839 Undefined!9738)))

(declare-fun b!1034566 () Bool)

(declare-fun c!104648 () Bool)

(assert (=> b!1034566 (= c!104648 (= lt!456665 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1034566 (= e!584838 e!584840)))

(declare-fun b!1034567 () Bool)

(assert (=> b!1034567 (= e!584840 (seekKeyOrZeroReturnVacant!0 (x!92225 lt!456664) (index!41325 lt!456664) (index!41325 lt!456664) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000) (_keys!11407 thiss!1427) (mask!30084 thiss!1427)))))

(assert (= (and d!124367 c!104649) b!1034565))

(assert (= (and d!124367 (not c!104649)) b!1034562))

(assert (= (and b!1034562 c!104650) b!1034564))

(assert (= (and b!1034562 (not c!104650)) b!1034566))

(assert (= (and b!1034566 c!104648) b!1034563))

(assert (= (and b!1034566 (not c!104648)) b!1034567))

(assert (=> d!124367 m!953355))

(assert (=> d!124367 m!953361))

(declare-fun m!954867 () Bool)

(assert (=> d!124367 m!954867))

(assert (=> d!124367 m!954867))

(assert (=> d!124367 m!953361))

(declare-fun m!954869 () Bool)

(assert (=> d!124367 m!954869))

(declare-fun m!954871 () Bool)

(assert (=> d!124367 m!954871))

(declare-fun m!954873 () Bool)

(assert (=> d!124367 m!954873))

(declare-fun m!954875 () Bool)

(assert (=> d!124367 m!954875))

(declare-fun m!954877 () Bool)

(assert (=> b!1034562 m!954877))

(assert (=> b!1034567 m!953361))

(declare-fun m!954879 () Bool)

(assert (=> b!1034567 m!954879))

(assert (=> b!1033919 d!124367))

(declare-fun d!124369 () Bool)

(declare-fun e!584841 () Bool)

(assert (=> d!124369 e!584841))

(declare-fun res!690965 () Bool)

(assert (=> d!124369 (=> res!690965 e!584841)))

(declare-fun lt!456670 () Bool)

(assert (=> d!124369 (= res!690965 (not lt!456670))))

(declare-fun lt!456668 () Bool)

(assert (=> d!124369 (= lt!456670 lt!456668)))

(declare-fun lt!456667 () Unit!33831)

(declare-fun e!584842 () Unit!33831)

(assert (=> d!124369 (= lt!456667 e!584842)))

(declare-fun c!104651 () Bool)

(assert (=> d!124369 (= c!104651 lt!456668)))

(assert (=> d!124369 (= lt!456668 (containsKey!563 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(assert (=> d!124369 (= (contains!6012 lt!456307 (_1!7874 (tuple2!15727 lt!456200 lt!456123))) lt!456670)))

(declare-fun b!1034568 () Bool)

(declare-fun lt!456669 () Unit!33831)

(assert (=> b!1034568 (= e!584842 lt!456669)))

(assert (=> b!1034568 (= lt!456669 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(assert (=> b!1034568 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun b!1034569 () Bool)

(declare-fun Unit!33876 () Unit!33831)

(assert (=> b!1034569 (= e!584842 Unit!33876)))

(declare-fun b!1034570 () Bool)

(assert (=> b!1034570 (= e!584841 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456307) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(assert (= (and d!124369 c!104651) b!1034568))

(assert (= (and d!124369 (not c!104651)) b!1034569))

(assert (= (and d!124369 (not res!690965)) b!1034570))

(declare-fun m!954881 () Bool)

(assert (=> d!124369 m!954881))

(declare-fun m!954883 () Bool)

(assert (=> b!1034568 m!954883))

(assert (=> b!1034568 m!953603))

(assert (=> b!1034568 m!953603))

(declare-fun m!954885 () Bool)

(assert (=> b!1034568 m!954885))

(assert (=> b!1034570 m!953603))

(assert (=> b!1034570 m!953603))

(assert (=> b!1034570 m!954885))

(assert (=> d!123855 d!124369))

(declare-fun b!1034574 () Bool)

(declare-fun e!584844 () Option!639)

(assert (=> b!1034574 (= e!584844 None!637)))

(declare-fun b!1034571 () Bool)

(declare-fun e!584843 () Option!639)

(assert (=> b!1034571 (= e!584843 (Some!638 (_2!7874 (h!23103 lt!456310))))))

(declare-fun b!1034573 () Bool)

(assert (=> b!1034573 (= e!584844 (getValueByKey!588 (t!31103 lt!456310) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun d!124371 () Bool)

(declare-fun c!104652 () Bool)

(assert (=> d!124371 (= c!104652 (and ((_ is Cons!21901) lt!456310) (= (_1!7874 (h!23103 lt!456310)) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(assert (=> d!124371 (= (getValueByKey!588 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123))) e!584843)))

(declare-fun b!1034572 () Bool)

(assert (=> b!1034572 (= e!584843 e!584844)))

(declare-fun c!104653 () Bool)

(assert (=> b!1034572 (= c!104653 (and ((_ is Cons!21901) lt!456310) (not (= (_1!7874 (h!23103 lt!456310)) (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))))

(assert (= (and d!124371 c!104652) b!1034571))

(assert (= (and d!124371 (not c!104652)) b!1034572))

(assert (= (and b!1034572 c!104653) b!1034573))

(assert (= (and b!1034572 (not c!104653)) b!1034574))

(declare-fun m!954887 () Bool)

(assert (=> b!1034573 m!954887))

(assert (=> d!123855 d!124371))

(declare-fun d!124373 () Bool)

(assert (=> d!124373 (= (getValueByKey!588 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123))) (Some!638 (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun lt!456671 () Unit!33831)

(assert (=> d!124373 (= lt!456671 (choose!1700 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun e!584845 () Bool)

(assert (=> d!124373 e!584845))

(declare-fun res!690966 () Bool)

(assert (=> d!124373 (=> (not res!690966) (not e!584845))))

(assert (=> d!124373 (= res!690966 (isStrictlySorted!718 lt!456310))))

(assert (=> d!124373 (= (lemmaContainsTupThenGetReturnValue!279 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))) lt!456671)))

(declare-fun b!1034575 () Bool)

(declare-fun res!690967 () Bool)

(assert (=> b!1034575 (=> (not res!690967) (not e!584845))))

(assert (=> b!1034575 (= res!690967 (containsKey!563 lt!456310 (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun b!1034576 () Bool)

(assert (=> b!1034576 (= e!584845 (contains!6013 lt!456310 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(assert (= (and d!124373 res!690966) b!1034575))

(assert (= (and b!1034575 res!690967) b!1034576))

(assert (=> d!124373 m!953597))

(declare-fun m!954889 () Bool)

(assert (=> d!124373 m!954889))

(declare-fun m!954891 () Bool)

(assert (=> d!124373 m!954891))

(declare-fun m!954893 () Bool)

(assert (=> b!1034575 m!954893))

(declare-fun m!954895 () Bool)

(assert (=> b!1034576 m!954895))

(assert (=> d!123855 d!124373))

(declare-fun bm!43735 () Bool)

(declare-fun call!43740 () List!21905)

(declare-fun call!43738 () List!21905)

(assert (=> bm!43735 (= call!43740 call!43738)))

(declare-fun d!124375 () Bool)

(declare-fun e!584846 () Bool)

(assert (=> d!124375 e!584846))

(declare-fun res!690969 () Bool)

(assert (=> d!124375 (=> (not res!690969) (not e!584846))))

(declare-fun lt!456672 () List!21905)

(assert (=> d!124375 (= res!690969 (isStrictlySorted!718 lt!456672))))

(declare-fun e!584847 () List!21905)

(assert (=> d!124375 (= lt!456672 e!584847)))

(declare-fun c!104657 () Bool)

(assert (=> d!124375 (= c!104657 (and ((_ is Cons!21901) (toList!6893 lt!456182)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456182))) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(assert (=> d!124375 (isStrictlySorted!718 (toList!6893 lt!456182))))

(assert (=> d!124375 (= (insertStrictlySorted!372 (toList!6893 lt!456182) (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))) lt!456672)))

(declare-fun b!1034577 () Bool)

(declare-fun e!584849 () List!21905)

(declare-fun call!43739 () List!21905)

(assert (=> b!1034577 (= e!584849 call!43739)))

(declare-fun c!104654 () Bool)

(declare-fun b!1034578 () Bool)

(assert (=> b!1034578 (= c!104654 (and ((_ is Cons!21901) (toList!6893 lt!456182)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456182))) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(declare-fun e!584850 () List!21905)

(assert (=> b!1034578 (= e!584850 e!584849)))

(declare-fun b!1034579 () Bool)

(assert (=> b!1034579 (= e!584847 call!43738)))

(declare-fun bm!43736 () Bool)

(assert (=> bm!43736 (= call!43739 call!43740)))

(declare-fun b!1034580 () Bool)

(assert (=> b!1034580 (= e!584847 e!584850)))

(declare-fun c!104655 () Bool)

(assert (=> b!1034580 (= c!104655 (and ((_ is Cons!21901) (toList!6893 lt!456182)) (= (_1!7874 (h!23103 (toList!6893 lt!456182))) (_1!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(declare-fun b!1034581 () Bool)

(declare-fun res!690968 () Bool)

(assert (=> b!1034581 (=> (not res!690968) (not e!584846))))

(assert (=> b!1034581 (= res!690968 (containsKey!563 lt!456672 (_1!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun b!1034582 () Bool)

(assert (=> b!1034582 (= e!584850 call!43740)))

(declare-fun e!584848 () List!21905)

(declare-fun bm!43737 () Bool)

(assert (=> bm!43737 (= call!43738 ($colon$colon!602 e!584848 (ite c!104657 (h!23103 (toList!6893 lt!456182)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))))

(declare-fun c!104656 () Bool)

(assert (=> bm!43737 (= c!104656 c!104657)))

(declare-fun b!1034583 () Bool)

(assert (=> b!1034583 (= e!584846 (contains!6013 lt!456672 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123)))))))

(declare-fun b!1034584 () Bool)

(assert (=> b!1034584 (= e!584849 call!43739)))

(declare-fun b!1034585 () Bool)

(assert (=> b!1034585 (= e!584848 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456182)) (_1!7874 (tuple2!15727 lt!456200 lt!456123)) (_2!7874 (tuple2!15727 lt!456200 lt!456123))))))

(declare-fun b!1034586 () Bool)

(assert (=> b!1034586 (= e!584848 (ite c!104655 (t!31103 (toList!6893 lt!456182)) (ite c!104654 (Cons!21901 (h!23103 (toList!6893 lt!456182)) (t!31103 (toList!6893 lt!456182))) Nil!21902)))))

(assert (= (and d!124375 c!104657) b!1034579))

(assert (= (and d!124375 (not c!104657)) b!1034580))

(assert (= (and b!1034580 c!104655) b!1034582))

(assert (= (and b!1034580 (not c!104655)) b!1034578))

(assert (= (and b!1034578 c!104654) b!1034584))

(assert (= (and b!1034578 (not c!104654)) b!1034577))

(assert (= (or b!1034584 b!1034577) bm!43736))

(assert (= (or b!1034582 bm!43736) bm!43735))

(assert (= (or b!1034579 bm!43735) bm!43737))

(assert (= (and bm!43737 c!104656) b!1034585))

(assert (= (and bm!43737 (not c!104656)) b!1034586))

(assert (= (and d!124375 res!690969) b!1034581))

(assert (= (and b!1034581 res!690968) b!1034583))

(declare-fun m!954897 () Bool)

(assert (=> d!124375 m!954897))

(declare-fun m!954899 () Bool)

(assert (=> d!124375 m!954899))

(declare-fun m!954901 () Bool)

(assert (=> b!1034581 m!954901))

(declare-fun m!954903 () Bool)

(assert (=> b!1034585 m!954903))

(declare-fun m!954905 () Bool)

(assert (=> b!1034583 m!954905))

(declare-fun m!954907 () Bool)

(assert (=> bm!43737 m!954907))

(assert (=> d!123855 d!124375))

(assert (=> b!1033806 d!123831))

(declare-fun d!124377 () Bool)

(assert (=> d!124377 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!456673 () Unit!33831)

(assert (=> d!124377 (= lt!456673 (choose!1699 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!584851 () Bool)

(assert (=> d!124377 e!584851))

(declare-fun res!690970 () Bool)

(assert (=> d!124377 (=> (not res!690970) (not e!584851))))

(assert (=> d!124377 (= res!690970 (isStrictlySorted!718 (toList!6893 lt!456196)))))

(assert (=> d!124377 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000) lt!456673)))

(declare-fun b!1034587 () Bool)

(assert (=> b!1034587 (= e!584851 (containsKey!563 (toList!6893 lt!456196) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124377 res!690970) b!1034587))

(assert (=> d!124377 m!953759))

(assert (=> d!124377 m!953759))

(assert (=> d!124377 m!953767))

(declare-fun m!954909 () Bool)

(assert (=> d!124377 m!954909))

(assert (=> d!124377 m!953969))

(assert (=> b!1034587 m!953763))

(assert (=> b!1033883 d!124377))

(assert (=> b!1033883 d!124107))

(assert (=> b!1033883 d!123987))

(declare-fun d!124379 () Bool)

(declare-fun e!584852 () Bool)

(assert (=> d!124379 e!584852))

(declare-fun res!690971 () Bool)

(assert (=> d!124379 (=> res!690971 e!584852)))

(declare-fun lt!456677 () Bool)

(assert (=> d!124379 (= res!690971 (not lt!456677))))

(declare-fun lt!456675 () Bool)

(assert (=> d!124379 (= lt!456677 lt!456675)))

(declare-fun lt!456674 () Unit!33831)

(declare-fun e!584853 () Unit!33831)

(assert (=> d!124379 (= lt!456674 e!584853)))

(declare-fun c!104658 () Bool)

(assert (=> d!124379 (= c!104658 lt!456675)))

(assert (=> d!124379 (= lt!456675 (containsKey!563 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(assert (=> d!124379 (= (contains!6012 lt!456299 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456677)))

(declare-fun b!1034588 () Bool)

(declare-fun lt!456676 () Unit!33831)

(assert (=> b!1034588 (= e!584853 lt!456676)))

(assert (=> b!1034588 (= lt!456676 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034588 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034589 () Bool)

(declare-fun Unit!33877 () Unit!33831)

(assert (=> b!1034589 (= e!584853 Unit!33877)))

(declare-fun b!1034590 () Bool)

(assert (=> b!1034590 (= e!584852 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456299) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124379 c!104658) b!1034588))

(assert (= (and d!124379 (not c!104658)) b!1034589))

(assert (= (and d!124379 (not res!690971)) b!1034590))

(declare-fun m!954911 () Bool)

(assert (=> d!124379 m!954911))

(declare-fun m!954913 () Bool)

(assert (=> b!1034588 m!954913))

(assert (=> b!1034588 m!953579))

(assert (=> b!1034588 m!953579))

(declare-fun m!954915 () Bool)

(assert (=> b!1034588 m!954915))

(assert (=> b!1034590 m!953579))

(assert (=> b!1034590 m!953579))

(assert (=> b!1034590 m!954915))

(assert (=> d!123851 d!124379))

(declare-fun b!1034594 () Bool)

(declare-fun e!584855 () Option!639)

(assert (=> b!1034594 (= e!584855 None!637)))

(declare-fun b!1034591 () Bool)

(declare-fun e!584854 () Option!639)

(assert (=> b!1034591 (= e!584854 (Some!638 (_2!7874 (h!23103 lt!456302))))))

(declare-fun b!1034593 () Bool)

(assert (=> b!1034593 (= e!584855 (getValueByKey!588 (t!31103 lt!456302) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun d!124381 () Bool)

(declare-fun c!104659 () Bool)

(assert (=> d!124381 (= c!104659 (and ((_ is Cons!21901) lt!456302) (= (_1!7874 (h!23103 lt!456302)) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(assert (=> d!124381 (= (getValueByKey!588 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) e!584854)))

(declare-fun b!1034592 () Bool)

(assert (=> b!1034592 (= e!584854 e!584855)))

(declare-fun c!104660 () Bool)

(assert (=> b!1034592 (= c!104660 (and ((_ is Cons!21901) lt!456302) (not (= (_1!7874 (h!23103 lt!456302)) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124381 c!104659) b!1034591))

(assert (= (and d!124381 (not c!104659)) b!1034592))

(assert (= (and b!1034592 c!104660) b!1034593))

(assert (= (and b!1034592 (not c!104660)) b!1034594))

(declare-fun m!954917 () Bool)

(assert (=> b!1034593 m!954917))

(assert (=> d!123851 d!124381))

(declare-fun d!124383 () Bool)

(assert (=> d!124383 (= (getValueByKey!588 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456678 () Unit!33831)

(assert (=> d!124383 (= lt!456678 (choose!1700 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun e!584856 () Bool)

(assert (=> d!124383 e!584856))

(declare-fun res!690972 () Bool)

(assert (=> d!124383 (=> (not res!690972) (not e!584856))))

(assert (=> d!124383 (= res!690972 (isStrictlySorted!718 lt!456302))))

(assert (=> d!124383 (= (lemmaContainsTupThenGetReturnValue!279 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456678)))

(declare-fun b!1034595 () Bool)

(declare-fun res!690973 () Bool)

(assert (=> b!1034595 (=> (not res!690973) (not e!584856))))

(assert (=> b!1034595 (= res!690973 (containsKey!563 lt!456302 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034596 () Bool)

(assert (=> b!1034596 (= e!584856 (contains!6013 lt!456302 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124383 res!690972) b!1034595))

(assert (= (and b!1034595 res!690973) b!1034596))

(assert (=> d!124383 m!953573))

(declare-fun m!954919 () Bool)

(assert (=> d!124383 m!954919))

(declare-fun m!954921 () Bool)

(assert (=> d!124383 m!954921))

(declare-fun m!954923 () Bool)

(assert (=> b!1034595 m!954923))

(declare-fun m!954925 () Bool)

(assert (=> b!1034596 m!954925))

(assert (=> d!123851 d!124383))

(declare-fun bm!43738 () Bool)

(declare-fun call!43743 () List!21905)

(declare-fun call!43741 () List!21905)

(assert (=> bm!43738 (= call!43743 call!43741)))

(declare-fun d!124385 () Bool)

(declare-fun e!584857 () Bool)

(assert (=> d!124385 e!584857))

(declare-fun res!690975 () Bool)

(assert (=> d!124385 (=> (not res!690975) (not e!584857))))

(declare-fun lt!456679 () List!21905)

(assert (=> d!124385 (= res!690975 (isStrictlySorted!718 lt!456679))))

(declare-fun e!584858 () List!21905)

(assert (=> d!124385 (= lt!456679 e!584858)))

(declare-fun c!104664 () Bool)

(assert (=> d!124385 (= c!104664 (and ((_ is Cons!21901) (toList!6893 lt!456186)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456186))) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(assert (=> d!124385 (isStrictlySorted!718 (toList!6893 lt!456186))))

(assert (=> d!124385 (= (insertStrictlySorted!372 (toList!6893 lt!456186) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))) lt!456679)))

(declare-fun b!1034597 () Bool)

(declare-fun e!584860 () List!21905)

(declare-fun call!43742 () List!21905)

(assert (=> b!1034597 (= e!584860 call!43742)))

(declare-fun c!104661 () Bool)

(declare-fun b!1034598 () Bool)

(assert (=> b!1034598 (= c!104661 (and ((_ is Cons!21901) (toList!6893 lt!456186)) (bvsgt (_1!7874 (h!23103 (toList!6893 lt!456186))) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(declare-fun e!584861 () List!21905)

(assert (=> b!1034598 (= e!584861 e!584860)))

(declare-fun b!1034599 () Bool)

(assert (=> b!1034599 (= e!584858 call!43741)))

(declare-fun bm!43739 () Bool)

(assert (=> bm!43739 (= call!43742 call!43743)))

(declare-fun b!1034600 () Bool)

(assert (=> b!1034600 (= e!584858 e!584861)))

(declare-fun c!104662 () Bool)

(assert (=> b!1034600 (= c!104662 (and ((_ is Cons!21901) (toList!6893 lt!456186)) (= (_1!7874 (h!23103 (toList!6893 lt!456186))) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034601 () Bool)

(declare-fun res!690974 () Bool)

(assert (=> b!1034601 (=> (not res!690974) (not e!584857))))

(assert (=> b!1034601 (= res!690974 (containsKey!563 lt!456679 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034602 () Bool)

(assert (=> b!1034602 (= e!584861 call!43743)))

(declare-fun e!584859 () List!21905)

(declare-fun bm!43740 () Bool)

(assert (=> bm!43740 (= call!43741 ($colon$colon!602 e!584859 (ite c!104664 (h!23103 (toList!6893 lt!456186)) (tuple2!15727 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104663 () Bool)

(assert (=> bm!43740 (= c!104663 c!104664)))

(declare-fun b!1034603 () Bool)

(assert (=> b!1034603 (= e!584857 (contains!6013 lt!456679 (tuple2!15727 (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034604 () Bool)

(assert (=> b!1034604 (= e!584860 call!43742)))

(declare-fun b!1034605 () Bool)

(assert (=> b!1034605 (= e!584859 (insertStrictlySorted!372 (t!31103 (toList!6893 lt!456186)) (_1!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 lt!456197 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034606 () Bool)

(assert (=> b!1034606 (= e!584859 (ite c!104662 (t!31103 (toList!6893 lt!456186)) (ite c!104661 (Cons!21901 (h!23103 (toList!6893 lt!456186)) (t!31103 (toList!6893 lt!456186))) Nil!21902)))))

(assert (= (and d!124385 c!104664) b!1034599))

(assert (= (and d!124385 (not c!104664)) b!1034600))

(assert (= (and b!1034600 c!104662) b!1034602))

(assert (= (and b!1034600 (not c!104662)) b!1034598))

(assert (= (and b!1034598 c!104661) b!1034604))

(assert (= (and b!1034598 (not c!104661)) b!1034597))

(assert (= (or b!1034604 b!1034597) bm!43739))

(assert (= (or b!1034602 bm!43739) bm!43738))

(assert (= (or b!1034599 bm!43738) bm!43740))

(assert (= (and bm!43740 c!104663) b!1034605))

(assert (= (and bm!43740 (not c!104663)) b!1034606))

(assert (= (and d!124385 res!690975) b!1034601))

(assert (= (and b!1034601 res!690974) b!1034603))

(declare-fun m!954927 () Bool)

(assert (=> d!124385 m!954927))

(declare-fun m!954929 () Bool)

(assert (=> d!124385 m!954929))

(declare-fun m!954931 () Bool)

(assert (=> b!1034601 m!954931))

(declare-fun m!954933 () Bool)

(assert (=> b!1034605 m!954933))

(declare-fun m!954935 () Bool)

(assert (=> b!1034603 m!954935))

(declare-fun m!954937 () Bool)

(assert (=> bm!43740 m!954937))

(assert (=> d!123851 d!124385))

(declare-fun d!124387 () Bool)

(assert (=> d!124387 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456229) key!909))))

(declare-fun lt!456680 () Unit!33831)

(assert (=> d!124387 (= lt!456680 (choose!1699 (toList!6893 lt!456229) key!909))))

(declare-fun e!584862 () Bool)

(assert (=> d!124387 e!584862))

(declare-fun res!690976 () Bool)

(assert (=> d!124387 (=> (not res!690976) (not e!584862))))

(assert (=> d!124387 (= res!690976 (isStrictlySorted!718 (toList!6893 lt!456229)))))

(assert (=> d!124387 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456229) key!909) lt!456680)))

(declare-fun b!1034607 () Bool)

(assert (=> b!1034607 (= e!584862 (containsKey!563 (toList!6893 lt!456229) key!909))))

(assert (= (and d!124387 res!690976) b!1034607))

(assert (=> d!124387 m!953939))

(assert (=> d!124387 m!953939))

(assert (=> d!124387 m!953941))

(declare-fun m!954939 () Bool)

(assert (=> d!124387 m!954939))

(declare-fun m!954941 () Bool)

(assert (=> d!124387 m!954941))

(assert (=> b!1034607 m!953935))

(assert (=> b!1033958 d!124387))

(assert (=> b!1033958 d!124125))

(assert (=> b!1033958 d!124127))

(declare-fun d!124389 () Bool)

(declare-fun res!690977 () Bool)

(declare-fun e!584863 () Bool)

(assert (=> d!124389 (=> res!690977 e!584863)))

(assert (=> d!124389 (= res!690977 (and ((_ is Cons!21901) (toList!6893 lt!456221)) (= (_1!7874 (h!23103 (toList!6893 lt!456221))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124389 (= (containsKey!563 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000) e!584863)))

(declare-fun b!1034608 () Bool)

(declare-fun e!584864 () Bool)

(assert (=> b!1034608 (= e!584863 e!584864)))

(declare-fun res!690978 () Bool)

(assert (=> b!1034608 (=> (not res!690978) (not e!584864))))

(assert (=> b!1034608 (= res!690978 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456221))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456221))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) (toList!6893 lt!456221)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456221))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034609 () Bool)

(assert (=> b!1034609 (= e!584864 (containsKey!563 (t!31103 (toList!6893 lt!456221)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124389 (not res!690977)) b!1034608))

(assert (= (and b!1034608 res!690978) b!1034609))

(declare-fun m!954943 () Bool)

(assert (=> b!1034609 m!954943))

(assert (=> d!123839 d!124389))

(declare-fun d!124391 () Bool)

(assert (=> d!124391 (= (apply!906 lt!456348 #b1000000000000000000000000000000000000000000000000000000000000000) (get!16434 (getValueByKey!588 (toList!6893 lt!456348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!30270 () Bool)

(assert (= bs!30270 d!124391))

(assert (=> bs!30270 m!954427))

(assert (=> bs!30270 m!954427))

(declare-fun m!954945 () Bool)

(assert (=> bs!30270 m!954945))

(assert (=> b!1033861 d!124391))

(assert (=> b!1033829 d!123831))

(declare-fun d!124393 () Bool)

(assert (=> d!124393 (= (get!16436 (select (arr!31354 (_values!6250 thiss!1427)) #b00000000000000000000000000000000) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!1990 (defaultEntry!6227 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1033781 d!124393))

(declare-fun d!124395 () Bool)

(assert (=> d!124395 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))) (v!14889 (getValueByKey!588 (toList!6893 lt!456196) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (=> d!123845 d!124395))

(assert (=> d!123845 d!123975))

(declare-fun d!124397 () Bool)

(declare-fun e!584865 () Bool)

(assert (=> d!124397 e!584865))

(declare-fun res!690979 () Bool)

(assert (=> d!124397 (=> (not res!690979) (not e!584865))))

(declare-fun lt!456681 () ListLongMap!13755)

(assert (=> d!124397 (= res!690979 (contains!6012 lt!456681 (_1!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))))

(declare-fun lt!456684 () List!21905)

(assert (=> d!124397 (= lt!456681 (ListLongMap!13756 lt!456684))))

(declare-fun lt!456683 () Unit!33831)

(declare-fun lt!456682 () Unit!33831)

(assert (=> d!124397 (= lt!456683 lt!456682)))

(assert (=> d!124397 (= (getValueByKey!588 lt!456684 (_1!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))) (Some!638 (_2!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))))

(assert (=> d!124397 (= lt!456682 (lemmaContainsTupThenGetReturnValue!279 lt!456684 (_1!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))) (_2!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))))

(assert (=> d!124397 (= lt!456684 (insertStrictlySorted!372 (toList!6893 (ite c!104429 call!43686 (ite c!104434 call!43689 call!43683))) (_1!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))) (_2!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))))))

(assert (=> d!124397 (= (+!3104 (ite c!104429 call!43686 (ite c!104434 call!43689 call!43683)) (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))) lt!456681)))

(declare-fun b!1034610 () Bool)

(declare-fun res!690980 () Bool)

(assert (=> b!1034610 (=> (not res!690980) (not e!584865))))

(assert (=> b!1034610 (= res!690980 (= (getValueByKey!588 (toList!6893 lt!456681) (_1!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124))))) (Some!638 (_2!7874 (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))))

(declare-fun b!1034611 () Bool)

(assert (=> b!1034611 (= e!584865 (contains!6013 (toList!6893 lt!456681) (ite (or c!104429 c!104434) (tuple2!15727 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!6063 lt!456124)) (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 lt!456124)))))))

(assert (= (and d!124397 res!690979) b!1034610))

(assert (= (and b!1034610 res!690980) b!1034611))

(declare-fun m!954947 () Bool)

(assert (=> d!124397 m!954947))

(declare-fun m!954949 () Bool)

(assert (=> d!124397 m!954949))

(declare-fun m!954951 () Bool)

(assert (=> d!124397 m!954951))

(declare-fun m!954953 () Bool)

(assert (=> d!124397 m!954953))

(declare-fun m!954955 () Bool)

(assert (=> b!1034610 m!954955))

(declare-fun m!954957 () Bool)

(assert (=> b!1034611 m!954957))

(assert (=> bm!43684 d!124397))

(declare-fun d!124399 () Bool)

(declare-fun res!690981 () Bool)

(declare-fun e!584866 () Bool)

(assert (=> d!124399 (=> res!690981 e!584866)))

(assert (=> d!124399 (= res!690981 (and ((_ is Cons!21901) (toList!6893 lt!456196)) (= (_1!7874 (h!23103 (toList!6893 lt!456196))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!124399 (= (containsKey!563 (toList!6893 lt!456196) #b0000000000000000000000000000000000000000000000000000000000000000) e!584866)))

(declare-fun b!1034612 () Bool)

(declare-fun e!584867 () Bool)

(assert (=> b!1034612 (= e!584866 e!584867)))

(declare-fun res!690982 () Bool)

(assert (=> b!1034612 (=> (not res!690982) (not e!584867))))

(assert (=> b!1034612 (= res!690982 (and (or (not ((_ is Cons!21901) (toList!6893 lt!456196))) (bvsle (_1!7874 (h!23103 (toList!6893 lt!456196))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!21901) (toList!6893 lt!456196)) (bvslt (_1!7874 (h!23103 (toList!6893 lt!456196))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034613 () Bool)

(assert (=> b!1034613 (= e!584867 (containsKey!563 (t!31103 (toList!6893 lt!456196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!124399 (not res!690981)) b!1034612))

(assert (= (and b!1034612 res!690982) b!1034613))

(declare-fun m!954959 () Bool)

(assert (=> b!1034613 m!954959))

(assert (=> d!123843 d!124399))

(declare-fun d!124401 () Bool)

(assert (=> d!124401 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!14889 (getValueByKey!588 (toList!6893 lt!456221) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!123827 d!124401))

(assert (=> d!123827 d!123993))

(assert (=> b!1033899 d!123831))

(declare-fun lt!456685 () Bool)

(declare-fun d!124403 () Bool)

(assert (=> d!124403 (= lt!456685 (select (content!513 (toList!6893 lt!456307)) (tuple2!15727 lt!456200 lt!456123)))))

(declare-fun e!584869 () Bool)

(assert (=> d!124403 (= lt!456685 e!584869)))

(declare-fun res!690983 () Bool)

(assert (=> d!124403 (=> (not res!690983) (not e!584869))))

(assert (=> d!124403 (= res!690983 ((_ is Cons!21901) (toList!6893 lt!456307)))))

(assert (=> d!124403 (= (contains!6013 (toList!6893 lt!456307) (tuple2!15727 lt!456200 lt!456123)) lt!456685)))

(declare-fun b!1034614 () Bool)

(declare-fun e!584868 () Bool)

(assert (=> b!1034614 (= e!584869 e!584868)))

(declare-fun res!690984 () Bool)

(assert (=> b!1034614 (=> res!690984 e!584868)))

(assert (=> b!1034614 (= res!690984 (= (h!23103 (toList!6893 lt!456307)) (tuple2!15727 lt!456200 lt!456123)))))

(declare-fun b!1034615 () Bool)

(assert (=> b!1034615 (= e!584868 (contains!6013 (t!31103 (toList!6893 lt!456307)) (tuple2!15727 lt!456200 lt!456123)))))

(assert (= (and d!124403 res!690983) b!1034614))

(assert (= (and b!1034614 (not res!690984)) b!1034615))

(declare-fun m!954961 () Bool)

(assert (=> d!124403 m!954961))

(declare-fun m!954963 () Bool)

(assert (=> d!124403 m!954963))

(declare-fun m!954965 () Bool)

(assert (=> b!1034615 m!954965))

(assert (=> b!1033823 d!124403))

(assert (=> b!1033935 d!124195))

(assert (=> b!1033935 d!124105))

(declare-fun d!124405 () Bool)

(assert (=> d!124405 (= (get!16434 (getValueByKey!588 (toList!6893 lt!456186) lt!456185)) (v!14889 (getValueByKey!588 (toList!6893 lt!456186) lt!456185)))))

(assert (=> d!123875 d!124405))

(declare-fun b!1034619 () Bool)

(declare-fun e!584871 () Option!639)

(assert (=> b!1034619 (= e!584871 None!637)))

(declare-fun b!1034616 () Bool)

(declare-fun e!584870 () Option!639)

(assert (=> b!1034616 (= e!584870 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456186)))))))

(declare-fun b!1034618 () Bool)

(assert (=> b!1034618 (= e!584871 (getValueByKey!588 (t!31103 (toList!6893 lt!456186)) lt!456185))))

(declare-fun d!124407 () Bool)

(declare-fun c!104665 () Bool)

(assert (=> d!124407 (= c!104665 (and ((_ is Cons!21901) (toList!6893 lt!456186)) (= (_1!7874 (h!23103 (toList!6893 lt!456186))) lt!456185)))))

(assert (=> d!124407 (= (getValueByKey!588 (toList!6893 lt!456186) lt!456185) e!584870)))

(declare-fun b!1034617 () Bool)

(assert (=> b!1034617 (= e!584870 e!584871)))

(declare-fun c!104666 () Bool)

(assert (=> b!1034617 (= c!104666 (and ((_ is Cons!21901) (toList!6893 lt!456186)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456186))) lt!456185))))))

(assert (= (and d!124407 c!104665) b!1034616))

(assert (= (and d!124407 (not c!104665)) b!1034617))

(assert (= (and b!1034617 c!104666) b!1034618))

(assert (= (and b!1034617 (not c!104666)) b!1034619))

(declare-fun m!954967 () Bool)

(assert (=> b!1034618 m!954967))

(assert (=> d!123875 d!124407))

(declare-fun d!124409 () Bool)

(declare-fun e!584872 () Bool)

(assert (=> d!124409 e!584872))

(declare-fun res!690985 () Bool)

(assert (=> d!124409 (=> res!690985 e!584872)))

(declare-fun lt!456689 () Bool)

(assert (=> d!124409 (= res!690985 (not lt!456689))))

(declare-fun lt!456687 () Bool)

(assert (=> d!124409 (= lt!456689 lt!456687)))

(declare-fun lt!456686 () Unit!33831)

(declare-fun e!584873 () Unit!33831)

(assert (=> d!124409 (= lt!456686 e!584873)))

(declare-fun c!104667 () Bool)

(assert (=> d!124409 (= c!104667 lt!456687)))

(assert (=> d!124409 (= lt!456687 (containsKey!563 (toList!6893 lt!456298) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> d!124409 (= (contains!6012 lt!456298 (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)) lt!456689)))

(declare-fun b!1034620 () Bool)

(declare-fun lt!456688 () Unit!33831)

(assert (=> b!1034620 (= e!584873 lt!456688)))

(assert (=> b!1034620 (= lt!456688 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456298) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(assert (=> b!1034620 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000)))))

(declare-fun b!1034621 () Bool)

(declare-fun Unit!33878 () Unit!33831)

(assert (=> b!1034621 (= e!584873 Unit!33878)))

(declare-fun b!1034622 () Bool)

(assert (=> b!1034622 (= e!584872 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456298) (select (arr!31353 (_keys!11407 thiss!1427)) #b00000000000000000000000000000000))))))

(assert (= (and d!124409 c!104667) b!1034620))

(assert (= (and d!124409 (not c!104667)) b!1034621))

(assert (= (and d!124409 (not res!690985)) b!1034622))

(assert (=> d!124409 m!953361))

(declare-fun m!954969 () Bool)

(assert (=> d!124409 m!954969))

(assert (=> b!1034620 m!953361))

(declare-fun m!954971 () Bool)

(assert (=> b!1034620 m!954971))

(assert (=> b!1034620 m!953361))

(assert (=> b!1034620 m!954487))

(assert (=> b!1034620 m!954487))

(declare-fun m!954973 () Bool)

(assert (=> b!1034620 m!954973))

(assert (=> b!1034622 m!953361))

(assert (=> b!1034622 m!954487))

(assert (=> b!1034622 m!954487))

(assert (=> b!1034622 m!954973))

(assert (=> b!1033814 d!124409))

(declare-fun d!124411 () Bool)

(declare-fun e!584874 () Bool)

(assert (=> d!124411 e!584874))

(declare-fun res!690986 () Bool)

(assert (=> d!124411 (=> res!690986 e!584874)))

(declare-fun lt!456693 () Bool)

(assert (=> d!124411 (= res!690986 (not lt!456693))))

(declare-fun lt!456691 () Bool)

(assert (=> d!124411 (= lt!456693 lt!456691)))

(declare-fun lt!456690 () Unit!33831)

(declare-fun e!584875 () Unit!33831)

(assert (=> d!124411 (= lt!456690 e!584875)))

(declare-fun c!104668 () Bool)

(assert (=> d!124411 (= c!104668 lt!456691)))

(assert (=> d!124411 (= lt!456691 (containsKey!563 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> d!124411 (= (contains!6012 lt!456247 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456693)))

(declare-fun b!1034623 () Bool)

(declare-fun lt!456692 () Unit!33831)

(assert (=> b!1034623 (= e!584875 lt!456692)))

(assert (=> b!1034623 (= lt!456692 (lemmaContainsKeyImpliesGetValueByKeyDefined!396 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(assert (=> b!1034623 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034624 () Bool)

(declare-fun Unit!33879 () Unit!33831)

(assert (=> b!1034624 (= e!584875 Unit!33879)))

(declare-fun b!1034625 () Bool)

(assert (=> b!1034625 (= e!584874 (isDefined!435 (getValueByKey!588 (toList!6893 lt!456247) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124411 c!104668) b!1034623))

(assert (= (and d!124411 (not c!104668)) b!1034624))

(assert (= (and d!124411 (not res!690986)) b!1034625))

(declare-fun m!954975 () Bool)

(assert (=> d!124411 m!954975))

(declare-fun m!954977 () Bool)

(assert (=> b!1034623 m!954977))

(assert (=> b!1034623 m!953505))

(assert (=> b!1034623 m!953505))

(declare-fun m!954979 () Bool)

(assert (=> b!1034623 m!954979))

(assert (=> b!1034625 m!953505))

(assert (=> b!1034625 m!953505))

(assert (=> b!1034625 m!954979))

(assert (=> d!123833 d!124411))

(declare-fun b!1034629 () Bool)

(declare-fun e!584877 () Option!639)

(assert (=> b!1034629 (= e!584877 None!637)))

(declare-fun b!1034626 () Bool)

(declare-fun e!584876 () Option!639)

(assert (=> b!1034626 (= e!584876 (Some!638 (_2!7874 (h!23103 lt!456250))))))

(declare-fun b!1034628 () Bool)

(assert (=> b!1034628 (= e!584877 (getValueByKey!588 (t!31103 lt!456250) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun d!124413 () Bool)

(declare-fun c!104669 () Bool)

(assert (=> d!124413 (= c!104669 (and ((_ is Cons!21901) lt!456250) (= (_1!7874 (h!23103 lt!456250)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124413 (= (getValueByKey!588 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) e!584876)))

(declare-fun b!1034627 () Bool)

(assert (=> b!1034627 (= e!584876 e!584877)))

(declare-fun c!104670 () Bool)

(assert (=> b!1034627 (= c!104670 (and ((_ is Cons!21901) lt!456250) (not (= (_1!7874 (h!23103 lt!456250)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(assert (= (and d!124413 c!104669) b!1034626))

(assert (= (and d!124413 (not c!104669)) b!1034627))

(assert (= (and b!1034627 c!104670) b!1034628))

(assert (= (and b!1034627 (not c!104670)) b!1034629))

(declare-fun m!954981 () Bool)

(assert (=> b!1034628 m!954981))

(assert (=> d!123833 d!124413))

(declare-fun d!124415 () Bool)

(assert (=> d!124415 (= (getValueByKey!588 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) (Some!638 (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun lt!456694 () Unit!33831)

(assert (=> d!124415 (= lt!456694 (choose!1700 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun e!584878 () Bool)

(assert (=> d!124415 e!584878))

(declare-fun res!690987 () Bool)

(assert (=> d!124415 (=> (not res!690987) (not e!584878))))

(assert (=> d!124415 (= res!690987 (isStrictlySorted!718 lt!456250))))

(assert (=> d!124415 (= (lemmaContainsTupThenGetReturnValue!279 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456694)))

(declare-fun b!1034630 () Bool)

(declare-fun res!690988 () Bool)

(assert (=> b!1034630 (=> (not res!690988) (not e!584878))))

(assert (=> b!1034630 (= res!690988 (containsKey!563 lt!456250 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034631 () Bool)

(assert (=> b!1034631 (= e!584878 (contains!6013 lt!456250 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (= (and d!124415 res!690987) b!1034630))

(assert (= (and b!1034630 res!690988) b!1034631))

(assert (=> d!124415 m!953499))

(declare-fun m!954983 () Bool)

(assert (=> d!124415 m!954983))

(declare-fun m!954985 () Bool)

(assert (=> d!124415 m!954985))

(declare-fun m!954987 () Bool)

(assert (=> b!1034630 m!954987))

(declare-fun m!954989 () Bool)

(assert (=> b!1034631 m!954989))

(assert (=> d!123833 d!124415))

(declare-fun bm!43741 () Bool)

(declare-fun call!43746 () List!21905)

(declare-fun call!43744 () List!21905)

(assert (=> bm!43741 (= call!43746 call!43744)))

(declare-fun d!124417 () Bool)

(declare-fun e!584879 () Bool)

(assert (=> d!124417 e!584879))

(declare-fun res!690990 () Bool)

(assert (=> d!124417 (=> (not res!690990) (not e!584879))))

(declare-fun lt!456695 () List!21905)

(assert (=> d!124417 (= res!690990 (isStrictlySorted!718 lt!456695))))

(declare-fun e!584880 () List!21905)

(assert (=> d!124417 (= lt!456695 e!584880)))

(declare-fun c!104674 () Bool)

(assert (=> d!124417 (= c!104674 (and ((_ is Cons!21901) (toList!6893 call!43670)) (bvslt (_1!7874 (h!23103 (toList!6893 call!43670))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(assert (=> d!124417 (isStrictlySorted!718 (toList!6893 call!43670))))

(assert (=> d!124417 (= (insertStrictlySorted!372 (toList!6893 call!43670) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))) lt!456695)))

(declare-fun b!1034632 () Bool)

(declare-fun e!584882 () List!21905)

(declare-fun call!43745 () List!21905)

(assert (=> b!1034632 (= e!584882 call!43745)))

(declare-fun b!1034633 () Bool)

(declare-fun c!104671 () Bool)

(assert (=> b!1034633 (= c!104671 (and ((_ is Cons!21901) (toList!6893 call!43670)) (bvsgt (_1!7874 (h!23103 (toList!6893 call!43670))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun e!584883 () List!21905)

(assert (=> b!1034633 (= e!584883 e!584882)))

(declare-fun b!1034634 () Bool)

(assert (=> b!1034634 (= e!584880 call!43744)))

(declare-fun bm!43742 () Bool)

(assert (=> bm!43742 (= call!43745 call!43746)))

(declare-fun b!1034635 () Bool)

(assert (=> b!1034635 (= e!584880 e!584883)))

(declare-fun c!104672 () Bool)

(assert (=> b!1034635 (= c!104672 (and ((_ is Cons!21901) (toList!6893 call!43670)) (= (_1!7874 (h!23103 (toList!6893 call!43670))) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034636 () Bool)

(declare-fun res!690989 () Bool)

(assert (=> b!1034636 (=> (not res!690989) (not e!584879))))

(assert (=> b!1034636 (= res!690989 (containsKey!563 lt!456695 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034637 () Bool)

(assert (=> b!1034637 (= e!584883 call!43746)))

(declare-fun bm!43743 () Bool)

(declare-fun e!584881 () List!21905)

(assert (=> bm!43743 (= call!43744 ($colon$colon!602 e!584881 (ite c!104674 (h!23103 (toList!6893 call!43670)) (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))))

(declare-fun c!104673 () Bool)

(assert (=> bm!43743 (= c!104673 c!104674)))

(declare-fun b!1034638 () Bool)

(assert (=> b!1034638 (= e!584879 (contains!6013 lt!456695 (tuple2!15727 (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))))))))

(declare-fun b!1034639 () Bool)

(assert (=> b!1034639 (= e!584882 call!43745)))

(declare-fun b!1034640 () Bool)

(assert (=> b!1034640 (= e!584881 (insertStrictlySorted!372 (t!31103 (toList!6893 call!43670)) (_1!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427))) (_2!7874 (tuple2!15727 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!6063 thiss!1427)))))))

(declare-fun b!1034641 () Bool)

(assert (=> b!1034641 (= e!584881 (ite c!104672 (t!31103 (toList!6893 call!43670)) (ite c!104671 (Cons!21901 (h!23103 (toList!6893 call!43670)) (t!31103 (toList!6893 call!43670))) Nil!21902)))))

(assert (= (and d!124417 c!104674) b!1034634))

(assert (= (and d!124417 (not c!104674)) b!1034635))

(assert (= (and b!1034635 c!104672) b!1034637))

(assert (= (and b!1034635 (not c!104672)) b!1034633))

(assert (= (and b!1034633 c!104671) b!1034639))

(assert (= (and b!1034633 (not c!104671)) b!1034632))

(assert (= (or b!1034639 b!1034632) bm!43742))

(assert (= (or b!1034637 bm!43742) bm!43741))

(assert (= (or b!1034634 bm!43741) bm!43743))

(assert (= (and bm!43743 c!104673) b!1034640))

(assert (= (and bm!43743 (not c!104673)) b!1034641))

(assert (= (and d!124417 res!690990) b!1034636))

(assert (= (and b!1034636 res!690989) b!1034638))

(declare-fun m!954991 () Bool)

(assert (=> d!124417 m!954991))

(declare-fun m!954993 () Bool)

(assert (=> d!124417 m!954993))

(declare-fun m!954995 () Bool)

(assert (=> b!1034636 m!954995))

(declare-fun m!954997 () Bool)

(assert (=> b!1034640 m!954997))

(declare-fun m!954999 () Bool)

(assert (=> b!1034638 m!954999))

(declare-fun m!955001 () Bool)

(assert (=> bm!43743 m!955001))

(assert (=> d!123833 d!124417))

(assert (=> b!1033739 d!123977))

(declare-fun d!124419 () Bool)

(declare-fun lt!456696 () Bool)

(assert (=> d!124419 (= lt!456696 (select (content!513 (toList!6893 lt!456299)) (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))

(declare-fun e!584885 () Bool)

(assert (=> d!124419 (= lt!456696 e!584885)))

(declare-fun res!690991 () Bool)

(assert (=> d!124419 (=> (not res!690991) (not e!584885))))

(assert (=> d!124419 (= res!690991 ((_ is Cons!21901) (toList!6893 lt!456299)))))

(assert (=> d!124419 (= (contains!6013 (toList!6893 lt!456299) (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))) lt!456696)))

(declare-fun b!1034642 () Bool)

(declare-fun e!584884 () Bool)

(assert (=> b!1034642 (= e!584885 e!584884)))

(declare-fun res!690992 () Bool)

(assert (=> b!1034642 (=> res!690992 e!584884)))

(assert (=> b!1034642 (= res!690992 (= (h!23103 (toList!6893 lt!456299)) (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))

(declare-fun b!1034643 () Bool)

(assert (=> b!1034643 (= e!584884 (contains!6013 (t!31103 (toList!6893 lt!456299)) (tuple2!15727 lt!456197 (minValue!6063 thiss!1427))))))

(assert (= (and d!124419 res!690991) b!1034642))

(assert (= (and b!1034642 (not res!690992)) b!1034643))

(declare-fun m!955003 () Bool)

(assert (=> d!124419 m!955003))

(declare-fun m!955005 () Bool)

(assert (=> d!124419 m!955005))

(declare-fun m!955007 () Bool)

(assert (=> b!1034643 m!955007))

(assert (=> b!1033819 d!124419))

(declare-fun b!1034647 () Bool)

(declare-fun e!584887 () Option!639)

(assert (=> b!1034647 (= e!584887 None!637)))

(declare-fun b!1034644 () Bool)

(declare-fun e!584886 () Option!639)

(assert (=> b!1034644 (= e!584886 (Some!638 (_2!7874 (h!23103 (toList!6893 lt!456396)))))))

(declare-fun b!1034646 () Bool)

(assert (=> b!1034646 (= e!584887 (getValueByKey!588 (t!31103 (toList!6893 lt!456396)) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))

(declare-fun c!104675 () Bool)

(declare-fun d!124421 () Bool)

(assert (=> d!124421 (= c!104675 (and ((_ is Cons!21901) (toList!6893 lt!456396)) (= (_1!7874 (h!23103 (toList!6893 lt!456396))) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427))))))))

(assert (=> d!124421 (= (getValueByKey!588 (toList!6893 lt!456396) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))) e!584886)))

(declare-fun b!1034645 () Bool)

(assert (=> b!1034645 (= e!584886 e!584887)))

(declare-fun c!104676 () Bool)

(assert (=> b!1034645 (= c!104676 (and ((_ is Cons!21901) (toList!6893 lt!456396)) (not (= (_1!7874 (h!23103 (toList!6893 lt!456396))) (_1!7874 (tuple2!15727 lt!456225 (zeroValue!6063 thiss!1427)))))))))

(assert (= (and d!124421 c!104675) b!1034644))

(assert (= (and d!124421 (not c!104675)) b!1034645))

(assert (= (and b!1034645 c!104676) b!1034646))

(assert (= (and b!1034645 (not c!104676)) b!1034647))

(declare-fun m!955009 () Bool)

(assert (=> b!1034646 m!955009))

(assert (=> b!1033943 d!124421))

(assert (=> d!123901 d!123817))

(assert (=> d!123901 d!123819))

(assert (=> d!123901 d!123813))

(declare-fun condMapEmpty!38269 () Bool)

(declare-fun mapDefault!38269 () ValueCell!11556)

(assert (=> mapNonEmpty!38268 (= condMapEmpty!38269 (= mapRest!38268 ((as const (Array (_ BitVec 32) ValueCell!11556)) mapDefault!38269)))))

(declare-fun e!584889 () Bool)

(declare-fun mapRes!38269 () Bool)

(assert (=> mapNonEmpty!38268 (= tp!73507 (and e!584889 mapRes!38269))))

(declare-fun mapNonEmpty!38269 () Bool)

(declare-fun tp!73508 () Bool)

(declare-fun e!584888 () Bool)

(assert (=> mapNonEmpty!38269 (= mapRes!38269 (and tp!73508 e!584888))))

(declare-fun mapRest!38269 () (Array (_ BitVec 32) ValueCell!11556))

(declare-fun mapKey!38269 () (_ BitVec 32))

(declare-fun mapValue!38269 () ValueCell!11556)

(assert (=> mapNonEmpty!38269 (= mapRest!38268 (store mapRest!38269 mapKey!38269 mapValue!38269))))

(declare-fun b!1034648 () Bool)

(assert (=> b!1034648 (= e!584888 tp_is_empty!24519)))

(declare-fun b!1034649 () Bool)

(assert (=> b!1034649 (= e!584889 tp_is_empty!24519)))

(declare-fun mapIsEmpty!38269 () Bool)

(assert (=> mapIsEmpty!38269 mapRes!38269))

(assert (= (and mapNonEmpty!38268 condMapEmpty!38269) mapIsEmpty!38269))

(assert (= (and mapNonEmpty!38268 (not condMapEmpty!38269)) mapNonEmpty!38269))

(assert (= (and mapNonEmpty!38269 ((_ is ValueCellFull!11556) mapValue!38269)) b!1034648))

(assert (= (and mapNonEmpty!38268 ((_ is ValueCellFull!11556) mapDefault!38269)) b!1034649))

(declare-fun m!955011 () Bool)

(assert (=> mapNonEmpty!38269 m!955011))

(declare-fun b_lambda!16091 () Bool)

(assert (= b_lambda!16079 (or (and b!1033597 b_free!20799) b_lambda!16091)))

(declare-fun b_lambda!16093 () Bool)

(assert (= b_lambda!16087 (or (and b!1033597 b_free!20799) b_lambda!16093)))

(declare-fun b_lambda!16095 () Bool)

(assert (= b_lambda!16081 (or (and b!1033597 b_free!20799) b_lambda!16095)))

(declare-fun b_lambda!16097 () Bool)

(assert (= b_lambda!16069 (or (and b!1033597 b_free!20799 (= (defaultEntry!6227 thiss!1427) (defaultEntry!6227 lt!456124))) b_lambda!16097)))

(declare-fun b_lambda!16099 () Bool)

(assert (= b_lambda!16089 (or (and b!1033597 b_free!20799) b_lambda!16099)))

(check-sat (not d!124087) (not b!1034439) (not bm!43714) (not b!1034590) (not b!1034355) (not b!1034462) (not b!1034232) (not b!1034350) (not b!1034123) (not b!1034526) (not b!1034460) (not b!1034583) (not b!1034318) (not b!1034551) (not b!1034131) (not b!1034142) (not b!1034595) (not b!1034545) (not b!1034478) (not b!1034317) (not b!1034491) (not d!124055) (not d!124057) (not b!1034646) (not b!1034537) (not b!1034448) (not d!124143) (not d!124041) (not b!1034295) (not b!1034554) (not bm!43743) (not b!1034630) (not d!124075) (not b!1034559) (not b_lambda!16091) (not b_lambda!16083) (not d!124175) (not b!1034011) (not d!124327) (not b!1034454) (not d!124387) (not d!124345) (not b!1034640) (not d!123973) (not d!124079) (not b!1034064) (not d!124029) (not b!1034214) (not d!124253) (not d!124383) (not b!1034077) (not b!1034625) (not b!1034538) (not bm!43734) (not b!1034280) (not b!1034212) (not d!124151) (not b!1034242) (not b!1034215) (not d!124369) (not b_lambda!16057) (not d!124089) (not b!1034396) (not b!1034206) (not b!1034066) (not b!1034446) (not d!124107) (not b!1034320) (not b!1034402) (not b!1034558) (not d!123971) (not b!1034357) (not b!1034529) (not d!124397) (not b!1034363) (not d!124323) (not b!1034253) (not b!1034628) (not b_lambda!16095) (not b!1034510) (not b!1034261) (not d!124123) (not b!1034068) (not b!1033993) (not b!1034549) (not d!124201) (not bm!43721) (not b!1034308) (not bm!43726) (not b!1034517) (not b!1034609) (not b!1034306) (not b!1034581) (not d!124225) (not b!1034322) (not d!124185) (not bm!43725) (not d!124293) (not b!1034476) (not b!1034213) (not d!124221) (not d!124191) (not b!1034521) (not d!124007) (not b!1034576) (not b!1034136) (not d!124077) (not d!124259) (not b!1034235) (not b_lambda!16093) (not b!1034610) (not b!1034172) (not d!124291) (not bm!43737) (not d!124061) (not b!1034342) (not b!1034129) (not d!124081) (not b!1034302) (not d!124411) (not b!1034603) (not b!1034546) (not b!1034587) (not d!124069) (not b!1034531) (not b!1034138) (not d!124183) (not b!1034344) (not b!1034450) (not b!1034248) (not b!1034631) (not d!124339) (not b!1034170) (not b!1034465) (not b!1034349) (not b!1034314) b_and!33301 (not b!1034024) (not d!123979) (not b!1034502) (not b!1034398) (not b!1034542) (not d!124377) (not b!1034157) (not d!124149) (not b!1034573) (not b!1034601) (not b!1034121) (not d!124343) (not d!124197) (not b!1034222) (not b!1034613) tp_is_empty!24519 (not b!1034204) (not d!124303) (not b!1034643) (not d!123989) (not b!1034340) (not b!1034505) (not b!1034255) (not d!123957) (not b!1034185) (not b!1034410) (not b!1034018) (not b!1034181) (not d!124273) (not b!1034555) (not b!1034407) (not b!1034162) (not d!124051) (not b!1034004) (not d!124331) (not b!1034588) (not b!1034420) (not b!1034014) (not b!1034007) (not d!124163) (not b!1034593) (not b!1034107) (not d!124281) (not d!124203) (not b_lambda!16073) (not b!1034304) (not b!1034133) (not d!124117) (not d!124351) (not b!1034233) (not b!1034062) (not b!1034298) (not b!1034073) (not mapNonEmpty!38269) (not b!1034191) (not d!124179) (not b!1034405) (not d!124083) (not b!1034512) (not bm!43707) (not b!1034567) (not b!1034084) (not b!1034240) (not b!1034091) (not d!124073) (not b!1034307) (not b!1034607) (not d!124415) (not b!1034418) (not b!1034611) (not b!1034124) (not b!1034347) (not b!1034283) (not b!1034482) (not bm!43706) (not b!1034473) (not d!124155) (not b!1034432) (not d!124211) (not d!124195) (not b!1034113) (not b!1034225) (not bm!43730) (not b!1034429) (not d!124145) (not b!1034544) (not b_lambda!16077) (not b!1034615) (not b!1034480) (not b!1034422) (not b!1034070) (not b!1034463) (not d!124121) (not b!1034025) (not b!1034359) (not b!1033978) (not d!124217) (not b!1034030) (not d!124115) (not b!1034118) (not d!124025) (not d!124337) (not d!124373) (not b!1034441) (not b!1034336) (not b!1034596) (not d!124349) (not b!1034210) (not d!124403) (not d!124101) (not d!124229) (not b!1034208) (not d!124031) (not b!1034561) (not b!1034424) (not b!1034620) (not d!124165) (not b!1034329) (not b!1034087) (not d!124095) (not b!1034154) (not b!1034196) (not b!1034431) (not b!1034285) (not d!124131) (not d!124417) (not b!1034443) (not b!1034618) (not b!1034310) (not b!1034623) (not d!124193) (not d!124329) (not b!1034245) (not b!1034095) (not d!124003) (not d!124375) (not b!1034498) (not b!1034257) (not d!124005) (not b!1034223) (not d!124135) (not bm!43740) (not b_next!20799) (not d!124251) (not b!1034109) (not b!1034557) (not d!124335) (not b!1034144) (not b_lambda!16097) (not b!1034570) (not b!1034532) (not d!124313) (not b!1034299) (not d!124355) (not b!1034267) (not b!1034247) (not b!1034230) (not b!1034324) (not b!1034274) (not b!1034217) (not b!1034199) (not b!1034524) (not b!1034636) (not b!1034264) (not d!124099) (not b!1034288) (not d!124181) (not d!124113) (not bm!43727) (not b!1034021) (not b!1034027) (not b!1034547) (not b!1034412) (not b!1034155) (not b!1034145) (not d!124311) (not d!123981) (not d!123999) (not b!1034452) (not b!1034100) (not b!1034523) (not b!1034036) (not d!124227) (not d!124237) (not b!1034177) (not bm!43717) (not b!1034023) (not b!1034238) (not b!1033990) (not b!1034002) (not b!1034496) (not d!124367) (not d!124205) (not b!1034178) (not b!1034016) (not d!124247) (not b!1034168) (not b!1034333) (not b!1034147) (not d!124043) (not b!1034176) (not b!1034111) (not b!1034193) (not b!1034331) (not b!1034467) (not bm!43702) (not b!1034160) (not b!1033986) (not b!1033995) (not d!124363) (not b!1034228) (not b!1034488) (not b!1034370) (not d!124255) (not d!124385) (not d!123997) (not b!1034140) (not b!1034364) (not d!124333) (not d!124391) (not b!1034315) (not b!1034259) (not b!1034477) (not b!1034272) (not b!1034553) (not bm!43710) (not b_lambda!16051) (not b!1034568) (not b!1034163) (not bm!43703) (not b!1034413) (not b!1034276) (not d!124215) (not b_lambda!16071) (not b!1034378) (not d!124153) (not b!1034575) (not b!1034148) (not b!1034189) (not d!124359) (not d!124347) (not d!124317) (not b!1034266) (not b!1034494) (not d!124325) (not b!1034550) (not b!1033998) (not d!124129) (not d!124279) (not b!1034198) (not d!124263) (not d!124097) (not b!1034312) (not b_lambda!16075) (not b!1034585) (not bm!43693) (not b!1034137) (not d!124353) (not b!1034605) (not d!124409) (not b!1034503) (not b!1034500) (not b!1034470) (not b_lambda!16085) (not b!1033982) (not d!124419) (not b!1034507) (not b!1034514) (not b!1034361) (not d!124091) (not b!1034540) (not b!1034013) (not d!124261) (not b!1034437) (not d!124037) (not d!124033) (not d!124049) (not bm!43722) (not b!1034020) (not d!124379) (not d!124301) (not b!1034638) (not b!1034468) (not d!124047) (not b!1034366) (not b!1034296) (not d!123963) (not d!124125) (not d!124341) (not b!1034116) (not b!1034327) (not b!1034037) (not b!1034372) (not d!124357) (not b_lambda!16059) (not b!1034548) (not b!1034475) (not b!1034097) (not b!1034294) (not b_lambda!16099) (not b!1034534) (not d!124235) (not bm!43720) (not bm!43733) (not b!1034426) (not b!1034291) (not d!124085) (not d!123991) (not d!124321) (not bm!43711) (not b!1034485) (not d!124109) (not b!1034400) (not b!1034622))
(check-sat b_and!33301 (not b_next!20799))
