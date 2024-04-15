; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17270 () Bool)

(assert start!17270)

(declare-fun b!172996 () Bool)

(declare-fun b_free!4303 () Bool)

(declare-fun b_next!4303 () Bool)

(assert (=> b!172996 (= b_free!4303 (not b_next!4303))))

(declare-fun tp!15570 () Bool)

(declare-fun b_and!10717 () Bool)

(assert (=> b!172996 (= tp!15570 b_and!10717)))

(declare-fun b!172995 () Bool)

(declare-fun e!114264 () Bool)

(declare-fun tp_is_empty!4075 () Bool)

(assert (=> b!172995 (= e!114264 tp_is_empty!4075)))

(declare-fun e!114263 () Bool)

(declare-fun e!114265 () Bool)

(declare-datatypes ((V!5081 0))(
  ( (V!5082 (val!2082 Int)) )
))
(declare-datatypes ((ValueCell!1694 0))(
  ( (ValueCellFull!1694 (v!3944 V!5081)) (EmptyCell!1694) )
))
(declare-datatypes ((array!7259 0))(
  ( (array!7260 (arr!3448 (Array (_ BitVec 32) (_ BitVec 64))) (size!3748 (_ BitVec 32))) )
))
(declare-datatypes ((array!7261 0))(
  ( (array!7262 (arr!3449 (Array (_ BitVec 32) ValueCell!1694)) (size!3749 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2296 0))(
  ( (LongMapFixedSize!2297 (defaultEntry!3594 Int) (mask!8461 (_ BitVec 32)) (extraKeys!3333 (_ BitVec 32)) (zeroValue!3435 V!5081) (minValue!3437 V!5081) (_size!1197 (_ BitVec 32)) (_keys!5433 array!7259) (_values!3577 array!7261) (_vacant!1197 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2296)

(declare-fun array_inv!2223 (array!7259) Bool)

(declare-fun array_inv!2224 (array!7261) Bool)

(assert (=> b!172996 (= e!114265 (and tp!15570 tp_is_empty!4075 (array_inv!2223 (_keys!5433 thiss!1248)) (array_inv!2224 (_values!3577 thiss!1248)) e!114263))))

(declare-fun mapIsEmpty!6936 () Bool)

(declare-fun mapRes!6936 () Bool)

(assert (=> mapIsEmpty!6936 mapRes!6936))

(declare-fun b!172997 () Bool)

(declare-fun res!82112 () Bool)

(declare-fun e!114267 () Bool)

(assert (=> b!172997 (=> (not res!82112) (not e!114267))))

(assert (=> b!172997 (= res!82112 (and (= (size!3749 (_values!3577 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8461 thiss!1248))) (= (size!3748 (_keys!5433 thiss!1248)) (size!3749 (_values!3577 thiss!1248))) (bvsge (mask!8461 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3333 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3333 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!3333 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!3333 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!172998 () Bool)

(declare-fun res!82111 () Bool)

(assert (=> b!172998 (=> (not res!82111) (not e!114267))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172998 (= res!82111 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172999 () Bool)

(declare-fun res!82110 () Bool)

(assert (=> b!172999 (=> (not res!82110) (not e!114267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172999 (= res!82110 (validMask!0 (mask!8461 thiss!1248)))))

(declare-fun b!173001 () Bool)

(declare-fun e!114266 () Bool)

(assert (=> b!173001 (= e!114266 tp_is_empty!4075)))

(declare-fun b!173002 () Bool)

(assert (=> b!173002 (= e!114263 (and e!114264 mapRes!6936))))

(declare-fun condMapEmpty!6936 () Bool)

(declare-fun mapDefault!6936 () ValueCell!1694)

(assert (=> b!173002 (= condMapEmpty!6936 (= (arr!3449 (_values!3577 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1694)) mapDefault!6936)))))

(declare-fun mapNonEmpty!6936 () Bool)

(declare-fun tp!15569 () Bool)

(assert (=> mapNonEmpty!6936 (= mapRes!6936 (and tp!15569 e!114266))))

(declare-fun mapRest!6936 () (Array (_ BitVec 32) ValueCell!1694))

(declare-fun mapValue!6936 () ValueCell!1694)

(declare-fun mapKey!6936 () (_ BitVec 32))

(assert (=> mapNonEmpty!6936 (= (arr!3449 (_values!3577 thiss!1248)) (store mapRest!6936 mapKey!6936 mapValue!6936))))

(declare-fun b!173003 () Bool)

(declare-fun res!82114 () Bool)

(assert (=> b!173003 (=> (not res!82114) (not e!114267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7259 (_ BitVec 32)) Bool)

(assert (=> b!173003 (= res!82114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5433 thiss!1248) (mask!8461 thiss!1248)))))

(declare-fun res!82113 () Bool)

(assert (=> start!17270 (=> (not res!82113) (not e!114267))))

(declare-fun valid!988 (LongMapFixedSize!2296) Bool)

(assert (=> start!17270 (= res!82113 (valid!988 thiss!1248))))

(assert (=> start!17270 e!114267))

(assert (=> start!17270 e!114265))

(assert (=> start!17270 true))

(declare-fun b!173000 () Bool)

(declare-datatypes ((List!2213 0))(
  ( (Nil!2210) (Cons!2209 (h!2826 (_ BitVec 64)) (t!7011 List!2213)) )
))
(declare-fun arrayNoDuplicates!0 (array!7259 (_ BitVec 32) List!2213) Bool)

(assert (=> b!173000 (= e!114267 (not (arrayNoDuplicates!0 (_keys!5433 thiss!1248) #b00000000000000000000000000000000 Nil!2210)))))

(assert (= (and start!17270 res!82113) b!172998))

(assert (= (and b!172998 res!82111) b!172999))

(assert (= (and b!172999 res!82110) b!172997))

(assert (= (and b!172997 res!82112) b!173003))

(assert (= (and b!173003 res!82114) b!173000))

(assert (= (and b!173002 condMapEmpty!6936) mapIsEmpty!6936))

(assert (= (and b!173002 (not condMapEmpty!6936)) mapNonEmpty!6936))

(get-info :version)

(assert (= (and mapNonEmpty!6936 ((_ is ValueCellFull!1694) mapValue!6936)) b!173001))

(assert (= (and b!173002 ((_ is ValueCellFull!1694) mapDefault!6936)) b!172995))

(assert (= b!172996 b!173002))

(assert (= start!17270 b!172996))

(declare-fun m!200949 () Bool)

(assert (=> b!172999 m!200949))

(declare-fun m!200951 () Bool)

(assert (=> start!17270 m!200951))

(declare-fun m!200953 () Bool)

(assert (=> b!173000 m!200953))

(declare-fun m!200955 () Bool)

(assert (=> b!173003 m!200955))

(declare-fun m!200957 () Bool)

(assert (=> mapNonEmpty!6936 m!200957))

(declare-fun m!200959 () Bool)

(assert (=> b!172996 m!200959))

(declare-fun m!200961 () Bool)

(assert (=> b!172996 m!200961))

(check-sat (not b!173003) (not mapNonEmpty!6936) (not b!172999) (not b!173000) (not b_next!4303) (not start!17270) b_and!10717 tp_is_empty!4075 (not b!172996))
(check-sat b_and!10717 (not b_next!4303))
(get-model)

(declare-fun d!52427 () Bool)

(assert (=> d!52427 (= (array_inv!2223 (_keys!5433 thiss!1248)) (bvsge (size!3748 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172996 d!52427))

(declare-fun d!52429 () Bool)

(assert (=> d!52429 (= (array_inv!2224 (_values!3577 thiss!1248)) (bvsge (size!3749 (_values!3577 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!172996 d!52429))

(declare-fun bm!17527 () Bool)

(declare-fun call!17530 () Bool)

(declare-fun c!30867 () Bool)

(assert (=> bm!17527 (= call!17530 (arrayNoDuplicates!0 (_keys!5433 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30867 (Cons!2209 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000) Nil!2210) Nil!2210)))))

(declare-fun b!173068 () Bool)

(declare-fun e!114312 () Bool)

(declare-fun e!114315 () Bool)

(assert (=> b!173068 (= e!114312 e!114315)))

(declare-fun res!82151 () Bool)

(assert (=> b!173068 (=> (not res!82151) (not e!114315))))

(declare-fun e!114314 () Bool)

(assert (=> b!173068 (= res!82151 (not e!114314))))

(declare-fun res!82152 () Bool)

(assert (=> b!173068 (=> (not res!82152) (not e!114314))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173068 (= res!82152 (validKeyInArray!0 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173069 () Bool)

(declare-fun e!114313 () Bool)

(assert (=> b!173069 (= e!114313 call!17530)))

(declare-fun d!52431 () Bool)

(declare-fun res!82153 () Bool)

(assert (=> d!52431 (=> res!82153 e!114312)))

(assert (=> d!52431 (= res!82153 (bvsge #b00000000000000000000000000000000 (size!3748 (_keys!5433 thiss!1248))))))

(assert (=> d!52431 (= (arrayNoDuplicates!0 (_keys!5433 thiss!1248) #b00000000000000000000000000000000 Nil!2210) e!114312)))

(declare-fun b!173070 () Bool)

(declare-fun contains!1151 (List!2213 (_ BitVec 64)) Bool)

(assert (=> b!173070 (= e!114314 (contains!1151 Nil!2210 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173071 () Bool)

(assert (=> b!173071 (= e!114313 call!17530)))

(declare-fun b!173072 () Bool)

(assert (=> b!173072 (= e!114315 e!114313)))

(assert (=> b!173072 (= c!30867 (validKeyInArray!0 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52431 (not res!82153)) b!173068))

(assert (= (and b!173068 res!82152) b!173070))

(assert (= (and b!173068 res!82151) b!173072))

(assert (= (and b!173072 c!30867) b!173069))

(assert (= (and b!173072 (not c!30867)) b!173071))

(assert (= (or b!173069 b!173071) bm!17527))

(declare-fun m!200991 () Bool)

(assert (=> bm!17527 m!200991))

(declare-fun m!200993 () Bool)

(assert (=> bm!17527 m!200993))

(assert (=> b!173068 m!200991))

(assert (=> b!173068 m!200991))

(declare-fun m!200995 () Bool)

(assert (=> b!173068 m!200995))

(assert (=> b!173070 m!200991))

(assert (=> b!173070 m!200991))

(declare-fun m!200997 () Bool)

(assert (=> b!173070 m!200997))

(assert (=> b!173072 m!200991))

(assert (=> b!173072 m!200991))

(assert (=> b!173072 m!200995))

(assert (=> b!173000 d!52431))

(declare-fun d!52433 () Bool)

(declare-fun res!82160 () Bool)

(declare-fun e!114318 () Bool)

(assert (=> d!52433 (=> (not res!82160) (not e!114318))))

(declare-fun simpleValid!143 (LongMapFixedSize!2296) Bool)

(assert (=> d!52433 (= res!82160 (simpleValid!143 thiss!1248))))

(assert (=> d!52433 (= (valid!988 thiss!1248) e!114318)))

(declare-fun b!173079 () Bool)

(declare-fun res!82161 () Bool)

(assert (=> b!173079 (=> (not res!82161) (not e!114318))))

(declare-fun arrayCountValidKeys!0 (array!7259 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173079 (= res!82161 (= (arrayCountValidKeys!0 (_keys!5433 thiss!1248) #b00000000000000000000000000000000 (size!3748 (_keys!5433 thiss!1248))) (_size!1197 thiss!1248)))))

(declare-fun b!173080 () Bool)

(declare-fun res!82162 () Bool)

(assert (=> b!173080 (=> (not res!82162) (not e!114318))))

(assert (=> b!173080 (= res!82162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5433 thiss!1248) (mask!8461 thiss!1248)))))

(declare-fun b!173081 () Bool)

(assert (=> b!173081 (= e!114318 (arrayNoDuplicates!0 (_keys!5433 thiss!1248) #b00000000000000000000000000000000 Nil!2210))))

(assert (= (and d!52433 res!82160) b!173079))

(assert (= (and b!173079 res!82161) b!173080))

(assert (= (and b!173080 res!82162) b!173081))

(declare-fun m!200999 () Bool)

(assert (=> d!52433 m!200999))

(declare-fun m!201001 () Bool)

(assert (=> b!173079 m!201001))

(assert (=> b!173080 m!200955))

(assert (=> b!173081 m!200953))

(assert (=> start!17270 d!52433))

(declare-fun d!52435 () Bool)

(assert (=> d!52435 (= (validMask!0 (mask!8461 thiss!1248)) (and (or (= (mask!8461 thiss!1248) #b00000000000000000000000000000111) (= (mask!8461 thiss!1248) #b00000000000000000000000000001111) (= (mask!8461 thiss!1248) #b00000000000000000000000000011111) (= (mask!8461 thiss!1248) #b00000000000000000000000000111111) (= (mask!8461 thiss!1248) #b00000000000000000000000001111111) (= (mask!8461 thiss!1248) #b00000000000000000000000011111111) (= (mask!8461 thiss!1248) #b00000000000000000000000111111111) (= (mask!8461 thiss!1248) #b00000000000000000000001111111111) (= (mask!8461 thiss!1248) #b00000000000000000000011111111111) (= (mask!8461 thiss!1248) #b00000000000000000000111111111111) (= (mask!8461 thiss!1248) #b00000000000000000001111111111111) (= (mask!8461 thiss!1248) #b00000000000000000011111111111111) (= (mask!8461 thiss!1248) #b00000000000000000111111111111111) (= (mask!8461 thiss!1248) #b00000000000000001111111111111111) (= (mask!8461 thiss!1248) #b00000000000000011111111111111111) (= (mask!8461 thiss!1248) #b00000000000000111111111111111111) (= (mask!8461 thiss!1248) #b00000000000001111111111111111111) (= (mask!8461 thiss!1248) #b00000000000011111111111111111111) (= (mask!8461 thiss!1248) #b00000000000111111111111111111111) (= (mask!8461 thiss!1248) #b00000000001111111111111111111111) (= (mask!8461 thiss!1248) #b00000000011111111111111111111111) (= (mask!8461 thiss!1248) #b00000000111111111111111111111111) (= (mask!8461 thiss!1248) #b00000001111111111111111111111111) (= (mask!8461 thiss!1248) #b00000011111111111111111111111111) (= (mask!8461 thiss!1248) #b00000111111111111111111111111111) (= (mask!8461 thiss!1248) #b00001111111111111111111111111111) (= (mask!8461 thiss!1248) #b00011111111111111111111111111111) (= (mask!8461 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8461 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!172999 d!52435))

(declare-fun bm!17530 () Bool)

(declare-fun call!17533 () Bool)

(assert (=> bm!17530 (= call!17533 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5433 thiss!1248) (mask!8461 thiss!1248)))))

(declare-fun b!173090 () Bool)

(declare-fun e!114327 () Bool)

(declare-fun e!114326 () Bool)

(assert (=> b!173090 (= e!114327 e!114326)))

(declare-fun c!30870 () Bool)

(assert (=> b!173090 (= c!30870 (validKeyInArray!0 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173092 () Bool)

(declare-fun e!114325 () Bool)

(assert (=> b!173092 (= e!114326 e!114325)))

(declare-fun lt!85528 () (_ BitVec 64))

(assert (=> b!173092 (= lt!85528 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5289 0))(
  ( (Unit!5290) )
))
(declare-fun lt!85529 () Unit!5289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7259 (_ BitVec 64) (_ BitVec 32)) Unit!5289)

(assert (=> b!173092 (= lt!85529 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5433 thiss!1248) lt!85528 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173092 (arrayContainsKey!0 (_keys!5433 thiss!1248) lt!85528 #b00000000000000000000000000000000)))

(declare-fun lt!85530 () Unit!5289)

(assert (=> b!173092 (= lt!85530 lt!85529)))

(declare-fun res!82167 () Bool)

(declare-datatypes ((SeekEntryResult!552 0))(
  ( (MissingZero!552 (index!4376 (_ BitVec 32))) (Found!552 (index!4377 (_ BitVec 32))) (Intermediate!552 (undefined!1364 Bool) (index!4378 (_ BitVec 32)) (x!19174 (_ BitVec 32))) (Undefined!552) (MissingVacant!552 (index!4379 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7259 (_ BitVec 32)) SeekEntryResult!552)

(assert (=> b!173092 (= res!82167 (= (seekEntryOrOpen!0 (select (arr!3448 (_keys!5433 thiss!1248)) #b00000000000000000000000000000000) (_keys!5433 thiss!1248) (mask!8461 thiss!1248)) (Found!552 #b00000000000000000000000000000000)))))

(assert (=> b!173092 (=> (not res!82167) (not e!114325))))

(declare-fun b!173093 () Bool)

(assert (=> b!173093 (= e!114326 call!17533)))

(declare-fun d!52437 () Bool)

(declare-fun res!82168 () Bool)

(assert (=> d!52437 (=> res!82168 e!114327)))

(assert (=> d!52437 (= res!82168 (bvsge #b00000000000000000000000000000000 (size!3748 (_keys!5433 thiss!1248))))))

(assert (=> d!52437 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5433 thiss!1248) (mask!8461 thiss!1248)) e!114327)))

(declare-fun b!173091 () Bool)

(assert (=> b!173091 (= e!114325 call!17533)))

(assert (= (and d!52437 (not res!82168)) b!173090))

(assert (= (and b!173090 c!30870) b!173092))

(assert (= (and b!173090 (not c!30870)) b!173093))

(assert (= (and b!173092 res!82167) b!173091))

(assert (= (or b!173091 b!173093) bm!17530))

(declare-fun m!201003 () Bool)

(assert (=> bm!17530 m!201003))

(assert (=> b!173090 m!200991))

(assert (=> b!173090 m!200991))

(assert (=> b!173090 m!200995))

(assert (=> b!173092 m!200991))

(declare-fun m!201005 () Bool)

(assert (=> b!173092 m!201005))

(declare-fun m!201007 () Bool)

(assert (=> b!173092 m!201007))

(assert (=> b!173092 m!200991))

(declare-fun m!201009 () Bool)

(assert (=> b!173092 m!201009))

(assert (=> b!173003 d!52437))

(declare-fun mapIsEmpty!6945 () Bool)

(declare-fun mapRes!6945 () Bool)

(assert (=> mapIsEmpty!6945 mapRes!6945))

(declare-fun mapNonEmpty!6945 () Bool)

(declare-fun tp!15585 () Bool)

(declare-fun e!114333 () Bool)

(assert (=> mapNonEmpty!6945 (= mapRes!6945 (and tp!15585 e!114333))))

(declare-fun mapValue!6945 () ValueCell!1694)

(declare-fun mapRest!6945 () (Array (_ BitVec 32) ValueCell!1694))

(declare-fun mapKey!6945 () (_ BitVec 32))

(assert (=> mapNonEmpty!6945 (= mapRest!6936 (store mapRest!6945 mapKey!6945 mapValue!6945))))

(declare-fun condMapEmpty!6945 () Bool)

(declare-fun mapDefault!6945 () ValueCell!1694)

(assert (=> mapNonEmpty!6936 (= condMapEmpty!6945 (= mapRest!6936 ((as const (Array (_ BitVec 32) ValueCell!1694)) mapDefault!6945)))))

(declare-fun e!114332 () Bool)

(assert (=> mapNonEmpty!6936 (= tp!15569 (and e!114332 mapRes!6945))))

(declare-fun b!173100 () Bool)

(assert (=> b!173100 (= e!114333 tp_is_empty!4075)))

(declare-fun b!173101 () Bool)

(assert (=> b!173101 (= e!114332 tp_is_empty!4075)))

(assert (= (and mapNonEmpty!6936 condMapEmpty!6945) mapIsEmpty!6945))

(assert (= (and mapNonEmpty!6936 (not condMapEmpty!6945)) mapNonEmpty!6945))

(assert (= (and mapNonEmpty!6945 ((_ is ValueCellFull!1694) mapValue!6945)) b!173100))

(assert (= (and mapNonEmpty!6936 ((_ is ValueCellFull!1694) mapDefault!6945)) b!173101))

(declare-fun m!201011 () Bool)

(assert (=> mapNonEmpty!6945 m!201011))

(check-sat (not bm!17527) (not b!173090) (not b!173070) (not b!173068) (not b!173080) (not d!52433) (not b!173092) (not b_next!4303) (not b!173079) (not bm!17530) b_and!10717 (not b!173081) tp_is_empty!4075 (not b!173072) (not mapNonEmpty!6945))
(check-sat b_and!10717 (not b_next!4303))
