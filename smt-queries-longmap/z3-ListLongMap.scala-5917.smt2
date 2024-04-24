; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76912 () Bool)

(assert start!76912)

(declare-fun b!898963 () Bool)

(declare-fun b_free!16003 () Bool)

(declare-fun b_next!16003 () Bool)

(assert (=> b!898963 (= b_free!16003 (not b_next!16003))))

(declare-fun tp!56072 () Bool)

(declare-fun b_and!26305 () Bool)

(assert (=> b!898963 (= tp!56072 b_and!26305)))

(declare-fun b!898962 () Bool)

(declare-fun e!502877 () Bool)

(declare-fun tp_is_empty!18331 () Bool)

(assert (=> b!898962 (= e!502877 tp_is_empty!18331)))

(declare-fun e!502879 () Bool)

(declare-datatypes ((array!52735 0))(
  ( (array!52736 (arr!25342 (Array (_ BitVec 32) (_ BitVec 64))) (size!25798 (_ BitVec 32))) )
))
(declare-datatypes ((V!29407 0))(
  ( (V!29408 (val!9216 Int)) )
))
(declare-datatypes ((ValueCell!8684 0))(
  ( (ValueCellFull!8684 (v!11703 V!29407)) (EmptyCell!8684) )
))
(declare-datatypes ((array!52737 0))(
  ( (array!52738 (arr!25343 (Array (_ BitVec 32) ValueCell!8684)) (size!25799 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4384 0))(
  ( (LongMapFixedSize!4385 (defaultEntry!5404 Int) (mask!26164 (_ BitVec 32)) (extraKeys!5118 (_ BitVec 32)) (zeroValue!5222 V!29407) (minValue!5222 V!29407) (_size!2247 (_ BitVec 32)) (_keys!10202 array!52735) (_values!5409 array!52737) (_vacant!2247 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4384)

(declare-fun e!502874 () Bool)

(declare-fun array_inv!19942 (array!52735) Bool)

(declare-fun array_inv!19943 (array!52737) Bool)

(assert (=> b!898963 (= e!502879 (and tp!56072 tp_is_empty!18331 (array_inv!19942 (_keys!10202 thiss!1181)) (array_inv!19943 (_values!5409 thiss!1181)) e!502874))))

(declare-fun b!898964 () Bool)

(declare-fun res!607300 () Bool)

(declare-fun e!502873 () Bool)

(assert (=> b!898964 (=> res!607300 e!502873)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52735 (_ BitVec 32)) Bool)

(assert (=> b!898964 (= res!607300 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10202 thiss!1181) (mask!26164 thiss!1181))))))

(declare-fun b!898965 () Bool)

(declare-fun e!502875 () Bool)

(declare-datatypes ((SeekEntryResult!8873 0))(
  ( (MissingZero!8873 (index!37863 (_ BitVec 32))) (Found!8873 (index!37864 (_ BitVec 32))) (Intermediate!8873 (undefined!9685 Bool) (index!37865 (_ BitVec 32)) (x!76500 (_ BitVec 32))) (Undefined!8873) (MissingVacant!8873 (index!37866 (_ BitVec 32))) )
))
(declare-fun lt!405756 () SeekEntryResult!8873)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898965 (= e!502875 (inRange!0 (index!37864 lt!405756) (mask!26164 thiss!1181)))))

(declare-fun b!898966 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898966 (= e!502873 (validKeyInArray!0 (select (arr!25342 (_keys!10202 thiss!1181)) (index!37864 lt!405756))))))

(declare-fun b!898967 () Bool)

(declare-fun res!607305 () Bool)

(declare-fun e!502876 () Bool)

(assert (=> b!898967 (=> (not res!607305) (not e!502876))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898967 (= res!607305 (not (= key!785 (bvneg key!785))))))

(declare-fun b!898968 () Bool)

(declare-fun res!607306 () Bool)

(assert (=> b!898968 (=> res!607306 e!502873)))

(declare-datatypes ((List!17784 0))(
  ( (Nil!17781) (Cons!17780 (h!18928 (_ BitVec 64)) (t!25115 List!17784)) )
))
(declare-fun arrayNoDuplicates!0 (array!52735 (_ BitVec 32) List!17784) Bool)

(assert (=> b!898968 (= res!607306 (not (arrayNoDuplicates!0 (_keys!10202 thiss!1181) #b00000000000000000000000000000000 Nil!17781)))))

(declare-fun b!898969 () Bool)

(declare-fun e!502878 () Bool)

(assert (=> b!898969 (= e!502876 (not e!502878))))

(declare-fun res!607307 () Bool)

(assert (=> b!898969 (=> res!607307 e!502878)))

(get-info :version)

(assert (=> b!898969 (= res!607307 (not ((_ is Found!8873) lt!405756)))))

(assert (=> b!898969 e!502875))

(declare-fun res!607301 () Bool)

(assert (=> b!898969 (=> res!607301 e!502875)))

(assert (=> b!898969 (= res!607301 (not ((_ is Found!8873) lt!405756)))))

(declare-datatypes ((Unit!30514 0))(
  ( (Unit!30515) )
))
(declare-fun lt!405758 () Unit!30514)

(declare-fun lemmaSeekEntryGivesInRangeIndex!94 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29407 V!29407 (_ BitVec 64)) Unit!30514)

(assert (=> b!898969 (= lt!405758 (lemmaSeekEntryGivesInRangeIndex!94 (_keys!10202 thiss!1181) (_values!5409 thiss!1181) (mask!26164 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!898969 (= lt!405756 (seekEntry!0 key!785 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(declare-fun b!898970 () Bool)

(declare-fun res!607299 () Bool)

(assert (=> b!898970 (=> res!607299 e!502873)))

(assert (=> b!898970 (= res!607299 (or (not (= (size!25799 (_values!5409 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26164 thiss!1181)))) (not (= (size!25798 (_keys!10202 thiss!1181)) (size!25799 (_values!5409 thiss!1181)))) (bvslt (mask!26164 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5118 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29145 () Bool)

(declare-fun mapRes!29145 () Bool)

(assert (=> mapIsEmpty!29145 mapRes!29145))

(declare-fun res!607302 () Bool)

(assert (=> start!76912 (=> (not res!607302) (not e!502876))))

(declare-fun valid!1697 (LongMapFixedSize!4384) Bool)

(assert (=> start!76912 (= res!607302 (valid!1697 thiss!1181))))

(assert (=> start!76912 e!502876))

(assert (=> start!76912 e!502879))

(assert (=> start!76912 true))

(declare-fun mapNonEmpty!29145 () Bool)

(declare-fun tp!56073 () Bool)

(assert (=> mapNonEmpty!29145 (= mapRes!29145 (and tp!56073 e!502877))))

(declare-fun mapValue!29145 () ValueCell!8684)

(declare-fun mapRest!29145 () (Array (_ BitVec 32) ValueCell!8684))

(declare-fun mapKey!29145 () (_ BitVec 32))

(assert (=> mapNonEmpty!29145 (= (arr!25343 (_values!5409 thiss!1181)) (store mapRest!29145 mapKey!29145 mapValue!29145))))

(declare-fun b!898971 () Bool)

(assert (=> b!898971 (= e!502878 e!502873)))

(declare-fun res!607303 () Bool)

(assert (=> b!898971 (=> res!607303 e!502873)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898971 (= res!607303 (not (validMask!0 (mask!26164 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898971 (arrayContainsKey!0 (_keys!10202 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405757 () Unit!30514)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52735 (_ BitVec 64) (_ BitVec 32)) Unit!30514)

(assert (=> b!898971 (= lt!405757 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10202 thiss!1181) key!785 (index!37864 lt!405756)))))

(declare-fun b!898972 () Bool)

(declare-fun e!502880 () Bool)

(assert (=> b!898972 (= e!502880 tp_is_empty!18331)))

(declare-fun b!898973 () Bool)

(assert (=> b!898973 (= e!502874 (and e!502880 mapRes!29145))))

(declare-fun condMapEmpty!29145 () Bool)

(declare-fun mapDefault!29145 () ValueCell!8684)

(assert (=> b!898973 (= condMapEmpty!29145 (= (arr!25343 (_values!5409 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8684)) mapDefault!29145)))))

(declare-fun b!898974 () Bool)

(declare-fun res!607304 () Bool)

(assert (=> b!898974 (=> res!607304 e!502873)))

(assert (=> b!898974 (= res!607304 (or (bvslt (index!37864 lt!405756) #b00000000000000000000000000000000) (bvsge (index!37864 lt!405756) (size!25798 (_keys!10202 thiss!1181)))))))

(assert (= (and start!76912 res!607302) b!898967))

(assert (= (and b!898967 res!607305) b!898969))

(assert (= (and b!898969 (not res!607301)) b!898965))

(assert (= (and b!898969 (not res!607307)) b!898971))

(assert (= (and b!898971 (not res!607303)) b!898970))

(assert (= (and b!898970 (not res!607299)) b!898964))

(assert (= (and b!898964 (not res!607300)) b!898968))

(assert (= (and b!898968 (not res!607306)) b!898974))

(assert (= (and b!898974 (not res!607304)) b!898966))

(assert (= (and b!898973 condMapEmpty!29145) mapIsEmpty!29145))

(assert (= (and b!898973 (not condMapEmpty!29145)) mapNonEmpty!29145))

(assert (= (and mapNonEmpty!29145 ((_ is ValueCellFull!8684) mapValue!29145)) b!898962))

(assert (= (and b!898973 ((_ is ValueCellFull!8684) mapDefault!29145)) b!898972))

(assert (= b!898963 b!898973))

(assert (= start!76912 b!898963))

(declare-fun m!835919 () Bool)

(assert (=> b!898971 m!835919))

(declare-fun m!835921 () Bool)

(assert (=> b!898971 m!835921))

(declare-fun m!835923 () Bool)

(assert (=> b!898971 m!835923))

(declare-fun m!835925 () Bool)

(assert (=> b!898969 m!835925))

(declare-fun m!835927 () Bool)

(assert (=> b!898969 m!835927))

(declare-fun m!835929 () Bool)

(assert (=> start!76912 m!835929))

(declare-fun m!835931 () Bool)

(assert (=> mapNonEmpty!29145 m!835931))

(declare-fun m!835933 () Bool)

(assert (=> b!898964 m!835933))

(declare-fun m!835935 () Bool)

(assert (=> b!898966 m!835935))

(assert (=> b!898966 m!835935))

(declare-fun m!835937 () Bool)

(assert (=> b!898966 m!835937))

(declare-fun m!835939 () Bool)

(assert (=> b!898965 m!835939))

(declare-fun m!835941 () Bool)

(assert (=> b!898963 m!835941))

(declare-fun m!835943 () Bool)

(assert (=> b!898963 m!835943))

(declare-fun m!835945 () Bool)

(assert (=> b!898968 m!835945))

(check-sat (not start!76912) (not b!898965) (not b!898963) b_and!26305 tp_is_empty!18331 (not b!898966) (not b!898969) (not b!898964) (not b_next!16003) (not mapNonEmpty!29145) (not b!898971) (not b!898968))
(check-sat b_and!26305 (not b_next!16003))
(get-model)

(declare-fun d!111509 () Bool)

(assert (=> d!111509 (= (inRange!0 (index!37864 lt!405756) (mask!26164 thiss!1181)) (and (bvsge (index!37864 lt!405756) #b00000000000000000000000000000000) (bvslt (index!37864 lt!405756) (bvadd (mask!26164 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898965 d!111509))

(declare-fun d!111511 () Bool)

(assert (=> d!111511 (= (validKeyInArray!0 (select (arr!25342 (_keys!10202 thiss!1181)) (index!37864 lt!405756))) (and (not (= (select (arr!25342 (_keys!10202 thiss!1181)) (index!37864 lt!405756)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25342 (_keys!10202 thiss!1181)) (index!37864 lt!405756)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!898966 d!111511))

(declare-fun d!111513 () Bool)

(declare-fun res!607368 () Bool)

(declare-fun e!502945 () Bool)

(assert (=> d!111513 (=> res!607368 e!502945)))

(assert (=> d!111513 (= res!607368 (bvsge #b00000000000000000000000000000000 (size!25798 (_keys!10202 thiss!1181))))))

(assert (=> d!111513 (= (arrayNoDuplicates!0 (_keys!10202 thiss!1181) #b00000000000000000000000000000000 Nil!17781) e!502945)))

(declare-fun b!899063 () Bool)

(declare-fun e!502946 () Bool)

(declare-fun e!502943 () Bool)

(assert (=> b!899063 (= e!502946 e!502943)))

(declare-fun c!95183 () Bool)

(assert (=> b!899063 (= c!95183 (validKeyInArray!0 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899064 () Bool)

(assert (=> b!899064 (= e!502945 e!502946)))

(declare-fun res!607369 () Bool)

(assert (=> b!899064 (=> (not res!607369) (not e!502946))))

(declare-fun e!502944 () Bool)

(assert (=> b!899064 (= res!607369 (not e!502944))))

(declare-fun res!607370 () Bool)

(assert (=> b!899064 (=> (not res!607370) (not e!502944))))

(assert (=> b!899064 (= res!607370 (validKeyInArray!0 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899065 () Bool)

(declare-fun call!39877 () Bool)

(assert (=> b!899065 (= e!502943 call!39877)))

(declare-fun bm!39874 () Bool)

(assert (=> bm!39874 (= call!39877 (arrayNoDuplicates!0 (_keys!10202 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95183 (Cons!17780 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000) Nil!17781) Nil!17781)))))

(declare-fun b!899066 () Bool)

(assert (=> b!899066 (= e!502943 call!39877)))

(declare-fun b!899067 () Bool)

(declare-fun contains!4378 (List!17784 (_ BitVec 64)) Bool)

(assert (=> b!899067 (= e!502944 (contains!4378 Nil!17781 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111513 (not res!607368)) b!899064))

(assert (= (and b!899064 res!607370) b!899067))

(assert (= (and b!899064 res!607369) b!899063))

(assert (= (and b!899063 c!95183) b!899066))

(assert (= (and b!899063 (not c!95183)) b!899065))

(assert (= (or b!899066 b!899065) bm!39874))

(declare-fun m!836003 () Bool)

(assert (=> b!899063 m!836003))

(assert (=> b!899063 m!836003))

(declare-fun m!836005 () Bool)

(assert (=> b!899063 m!836005))

(assert (=> b!899064 m!836003))

(assert (=> b!899064 m!836003))

(assert (=> b!899064 m!836005))

(assert (=> bm!39874 m!836003))

(declare-fun m!836007 () Bool)

(assert (=> bm!39874 m!836007))

(assert (=> b!899067 m!836003))

(assert (=> b!899067 m!836003))

(declare-fun m!836009 () Bool)

(assert (=> b!899067 m!836009))

(assert (=> b!898968 d!111513))

(declare-fun d!111515 () Bool)

(assert (=> d!111515 (= (validMask!0 (mask!26164 thiss!1181)) (and (or (= (mask!26164 thiss!1181) #b00000000000000000000000000000111) (= (mask!26164 thiss!1181) #b00000000000000000000000000001111) (= (mask!26164 thiss!1181) #b00000000000000000000000000011111) (= (mask!26164 thiss!1181) #b00000000000000000000000000111111) (= (mask!26164 thiss!1181) #b00000000000000000000000001111111) (= (mask!26164 thiss!1181) #b00000000000000000000000011111111) (= (mask!26164 thiss!1181) #b00000000000000000000000111111111) (= (mask!26164 thiss!1181) #b00000000000000000000001111111111) (= (mask!26164 thiss!1181) #b00000000000000000000011111111111) (= (mask!26164 thiss!1181) #b00000000000000000000111111111111) (= (mask!26164 thiss!1181) #b00000000000000000001111111111111) (= (mask!26164 thiss!1181) #b00000000000000000011111111111111) (= (mask!26164 thiss!1181) #b00000000000000000111111111111111) (= (mask!26164 thiss!1181) #b00000000000000001111111111111111) (= (mask!26164 thiss!1181) #b00000000000000011111111111111111) (= (mask!26164 thiss!1181) #b00000000000000111111111111111111) (= (mask!26164 thiss!1181) #b00000000000001111111111111111111) (= (mask!26164 thiss!1181) #b00000000000011111111111111111111) (= (mask!26164 thiss!1181) #b00000000000111111111111111111111) (= (mask!26164 thiss!1181) #b00000000001111111111111111111111) (= (mask!26164 thiss!1181) #b00000000011111111111111111111111) (= (mask!26164 thiss!1181) #b00000000111111111111111111111111) (= (mask!26164 thiss!1181) #b00000001111111111111111111111111) (= (mask!26164 thiss!1181) #b00000011111111111111111111111111) (= (mask!26164 thiss!1181) #b00000111111111111111111111111111) (= (mask!26164 thiss!1181) #b00001111111111111111111111111111) (= (mask!26164 thiss!1181) #b00011111111111111111111111111111) (= (mask!26164 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26164 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898971 d!111515))

(declare-fun d!111517 () Bool)

(declare-fun res!607375 () Bool)

(declare-fun e!502951 () Bool)

(assert (=> d!111517 (=> res!607375 e!502951)))

(assert (=> d!111517 (= res!607375 (= (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111517 (= (arrayContainsKey!0 (_keys!10202 thiss!1181) key!785 #b00000000000000000000000000000000) e!502951)))

(declare-fun b!899072 () Bool)

(declare-fun e!502952 () Bool)

(assert (=> b!899072 (= e!502951 e!502952)))

(declare-fun res!607376 () Bool)

(assert (=> b!899072 (=> (not res!607376) (not e!502952))))

(assert (=> b!899072 (= res!607376 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25798 (_keys!10202 thiss!1181))))))

(declare-fun b!899073 () Bool)

(assert (=> b!899073 (= e!502952 (arrayContainsKey!0 (_keys!10202 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111517 (not res!607375)) b!899072))

(assert (= (and b!899072 res!607376) b!899073))

(assert (=> d!111517 m!836003))

(declare-fun m!836011 () Bool)

(assert (=> b!899073 m!836011))

(assert (=> b!898971 d!111517))

(declare-fun d!111519 () Bool)

(assert (=> d!111519 (arrayContainsKey!0 (_keys!10202 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405779 () Unit!30514)

(declare-fun choose!13 (array!52735 (_ BitVec 64) (_ BitVec 32)) Unit!30514)

(assert (=> d!111519 (= lt!405779 (choose!13 (_keys!10202 thiss!1181) key!785 (index!37864 lt!405756)))))

(assert (=> d!111519 (bvsge (index!37864 lt!405756) #b00000000000000000000000000000000)))

(assert (=> d!111519 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10202 thiss!1181) key!785 (index!37864 lt!405756)) lt!405779)))

(declare-fun bs!25219 () Bool)

(assert (= bs!25219 d!111519))

(assert (=> bs!25219 m!835921))

(declare-fun m!836013 () Bool)

(assert (=> bs!25219 m!836013))

(assert (=> b!898971 d!111519))

(declare-fun d!111521 () Bool)

(assert (=> d!111521 (= (array_inv!19942 (_keys!10202 thiss!1181)) (bvsge (size!25798 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898963 d!111521))

(declare-fun d!111523 () Bool)

(assert (=> d!111523 (= (array_inv!19943 (_values!5409 thiss!1181)) (bvsge (size!25799 (_values!5409 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898963 d!111523))

(declare-fun b!899082 () Bool)

(declare-fun e!502961 () Bool)

(declare-fun call!39880 () Bool)

(assert (=> b!899082 (= e!502961 call!39880)))

(declare-fun d!111525 () Bool)

(declare-fun res!607382 () Bool)

(declare-fun e!502960 () Bool)

(assert (=> d!111525 (=> res!607382 e!502960)))

(assert (=> d!111525 (= res!607382 (bvsge #b00000000000000000000000000000000 (size!25798 (_keys!10202 thiss!1181))))))

(assert (=> d!111525 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)) e!502960)))

(declare-fun b!899083 () Bool)

(declare-fun e!502959 () Bool)

(assert (=> b!899083 (= e!502960 e!502959)))

(declare-fun c!95186 () Bool)

(assert (=> b!899083 (= c!95186 (validKeyInArray!0 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!899084 () Bool)

(assert (=> b!899084 (= e!502959 e!502961)))

(declare-fun lt!405788 () (_ BitVec 64))

(assert (=> b!899084 (= lt!405788 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405787 () Unit!30514)

(assert (=> b!899084 (= lt!405787 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10202 thiss!1181) lt!405788 #b00000000000000000000000000000000))))

(assert (=> b!899084 (arrayContainsKey!0 (_keys!10202 thiss!1181) lt!405788 #b00000000000000000000000000000000)))

(declare-fun lt!405786 () Unit!30514)

(assert (=> b!899084 (= lt!405786 lt!405787)))

(declare-fun res!607381 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!899084 (= res!607381 (= (seekEntryOrOpen!0 (select (arr!25342 (_keys!10202 thiss!1181)) #b00000000000000000000000000000000) (_keys!10202 thiss!1181) (mask!26164 thiss!1181)) (Found!8873 #b00000000000000000000000000000000)))))

(assert (=> b!899084 (=> (not res!607381) (not e!502961))))

(declare-fun b!899085 () Bool)

(assert (=> b!899085 (= e!502959 call!39880)))

(declare-fun bm!39877 () Bool)

(assert (=> bm!39877 (= call!39880 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(assert (= (and d!111525 (not res!607382)) b!899083))

(assert (= (and b!899083 c!95186) b!899084))

(assert (= (and b!899083 (not c!95186)) b!899085))

(assert (= (and b!899084 res!607381) b!899082))

(assert (= (or b!899082 b!899085) bm!39877))

(assert (=> b!899083 m!836003))

(assert (=> b!899083 m!836003))

(assert (=> b!899083 m!836005))

(assert (=> b!899084 m!836003))

(declare-fun m!836015 () Bool)

(assert (=> b!899084 m!836015))

(declare-fun m!836017 () Bool)

(assert (=> b!899084 m!836017))

(assert (=> b!899084 m!836003))

(declare-fun m!836019 () Bool)

(assert (=> b!899084 m!836019))

(declare-fun m!836021 () Bool)

(assert (=> bm!39877 m!836021))

(assert (=> b!898964 d!111525))

(declare-fun d!111527 () Bool)

(declare-fun e!502964 () Bool)

(assert (=> d!111527 e!502964))

(declare-fun res!607385 () Bool)

(assert (=> d!111527 (=> res!607385 e!502964)))

(declare-fun lt!405794 () SeekEntryResult!8873)

(assert (=> d!111527 (= res!607385 (not ((_ is Found!8873) lt!405794)))))

(assert (=> d!111527 (= lt!405794 (seekEntry!0 key!785 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(declare-fun lt!405793 () Unit!30514)

(declare-fun choose!1493 (array!52735 array!52737 (_ BitVec 32) (_ BitVec 32) V!29407 V!29407 (_ BitVec 64)) Unit!30514)

(assert (=> d!111527 (= lt!405793 (choose!1493 (_keys!10202 thiss!1181) (_values!5409 thiss!1181) (mask!26164 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785))))

(assert (=> d!111527 (validMask!0 (mask!26164 thiss!1181))))

(assert (=> d!111527 (= (lemmaSeekEntryGivesInRangeIndex!94 (_keys!10202 thiss!1181) (_values!5409 thiss!1181) (mask!26164 thiss!1181) (extraKeys!5118 thiss!1181) (zeroValue!5222 thiss!1181) (minValue!5222 thiss!1181) key!785) lt!405793)))

(declare-fun b!899088 () Bool)

(assert (=> b!899088 (= e!502964 (inRange!0 (index!37864 lt!405794) (mask!26164 thiss!1181)))))

(assert (= (and d!111527 (not res!607385)) b!899088))

(assert (=> d!111527 m!835927))

(declare-fun m!836023 () Bool)

(assert (=> d!111527 m!836023))

(assert (=> d!111527 m!835919))

(declare-fun m!836025 () Bool)

(assert (=> b!899088 m!836025))

(assert (=> b!898969 d!111527))

(declare-fun b!899101 () Bool)

(declare-fun c!95195 () Bool)

(declare-fun lt!405806 () (_ BitVec 64))

(assert (=> b!899101 (= c!95195 (= lt!405806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502972 () SeekEntryResult!8873)

(declare-fun e!502973 () SeekEntryResult!8873)

(assert (=> b!899101 (= e!502972 e!502973)))

(declare-fun b!899102 () Bool)

(declare-fun lt!405804 () SeekEntryResult!8873)

(assert (=> b!899102 (= e!502973 (ite ((_ is MissingVacant!8873) lt!405804) (MissingZero!8873 (index!37866 lt!405804)) lt!405804))))

(declare-fun lt!405805 () SeekEntryResult!8873)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8873)

(assert (=> b!899102 (= lt!405804 (seekKeyOrZeroReturnVacant!0 (x!76500 lt!405805) (index!37865 lt!405805) (index!37865 lt!405805) key!785 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(declare-fun d!111529 () Bool)

(declare-fun lt!405803 () SeekEntryResult!8873)

(assert (=> d!111529 (and (or ((_ is MissingVacant!8873) lt!405803) (not ((_ is Found!8873) lt!405803)) (and (bvsge (index!37864 lt!405803) #b00000000000000000000000000000000) (bvslt (index!37864 lt!405803) (size!25798 (_keys!10202 thiss!1181))))) (not ((_ is MissingVacant!8873) lt!405803)) (or (not ((_ is Found!8873) lt!405803)) (= (select (arr!25342 (_keys!10202 thiss!1181)) (index!37864 lt!405803)) key!785)))))

(declare-fun e!502971 () SeekEntryResult!8873)

(assert (=> d!111529 (= lt!405803 e!502971)))

(declare-fun c!95194 () Bool)

(assert (=> d!111529 (= c!95194 (and ((_ is Intermediate!8873) lt!405805) (undefined!9685 lt!405805)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52735 (_ BitVec 32)) SeekEntryResult!8873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111529 (= lt!405805 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26164 thiss!1181)) key!785 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(assert (=> d!111529 (validMask!0 (mask!26164 thiss!1181))))

(assert (=> d!111529 (= (seekEntry!0 key!785 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)) lt!405803)))

(declare-fun b!899103 () Bool)

(assert (=> b!899103 (= e!502971 e!502972)))

(assert (=> b!899103 (= lt!405806 (select (arr!25342 (_keys!10202 thiss!1181)) (index!37865 lt!405805)))))

(declare-fun c!95193 () Bool)

(assert (=> b!899103 (= c!95193 (= lt!405806 key!785))))

(declare-fun b!899104 () Bool)

(assert (=> b!899104 (= e!502973 (MissingZero!8873 (index!37865 lt!405805)))))

(declare-fun b!899105 () Bool)

(assert (=> b!899105 (= e!502971 Undefined!8873)))

(declare-fun b!899106 () Bool)

(assert (=> b!899106 (= e!502972 (Found!8873 (index!37865 lt!405805)))))

(assert (= (and d!111529 c!95194) b!899105))

(assert (= (and d!111529 (not c!95194)) b!899103))

(assert (= (and b!899103 c!95193) b!899106))

(assert (= (and b!899103 (not c!95193)) b!899101))

(assert (= (and b!899101 c!95195) b!899104))

(assert (= (and b!899101 (not c!95195)) b!899102))

(declare-fun m!836027 () Bool)

(assert (=> b!899102 m!836027))

(declare-fun m!836029 () Bool)

(assert (=> d!111529 m!836029))

(declare-fun m!836031 () Bool)

(assert (=> d!111529 m!836031))

(assert (=> d!111529 m!836031))

(declare-fun m!836033 () Bool)

(assert (=> d!111529 m!836033))

(assert (=> d!111529 m!835919))

(declare-fun m!836035 () Bool)

(assert (=> b!899103 m!836035))

(assert (=> b!898969 d!111529))

(declare-fun d!111531 () Bool)

(declare-fun res!607392 () Bool)

(declare-fun e!502976 () Bool)

(assert (=> d!111531 (=> (not res!607392) (not e!502976))))

(declare-fun simpleValid!322 (LongMapFixedSize!4384) Bool)

(assert (=> d!111531 (= res!607392 (simpleValid!322 thiss!1181))))

(assert (=> d!111531 (= (valid!1697 thiss!1181) e!502976)))

(declare-fun b!899113 () Bool)

(declare-fun res!607393 () Bool)

(assert (=> b!899113 (=> (not res!607393) (not e!502976))))

(declare-fun arrayCountValidKeys!0 (array!52735 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!899113 (= res!607393 (= (arrayCountValidKeys!0 (_keys!10202 thiss!1181) #b00000000000000000000000000000000 (size!25798 (_keys!10202 thiss!1181))) (_size!2247 thiss!1181)))))

(declare-fun b!899114 () Bool)

(declare-fun res!607394 () Bool)

(assert (=> b!899114 (=> (not res!607394) (not e!502976))))

(assert (=> b!899114 (= res!607394 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10202 thiss!1181) (mask!26164 thiss!1181)))))

(declare-fun b!899115 () Bool)

(assert (=> b!899115 (= e!502976 (arrayNoDuplicates!0 (_keys!10202 thiss!1181) #b00000000000000000000000000000000 Nil!17781))))

(assert (= (and d!111531 res!607392) b!899113))

(assert (= (and b!899113 res!607393) b!899114))

(assert (= (and b!899114 res!607394) b!899115))

(declare-fun m!836037 () Bool)

(assert (=> d!111531 m!836037))

(declare-fun m!836039 () Bool)

(assert (=> b!899113 m!836039))

(assert (=> b!899114 m!835933))

(assert (=> b!899115 m!835945))

(assert (=> start!76912 d!111531))

(declare-fun condMapEmpty!29154 () Bool)

(declare-fun mapDefault!29154 () ValueCell!8684)

(assert (=> mapNonEmpty!29145 (= condMapEmpty!29154 (= mapRest!29145 ((as const (Array (_ BitVec 32) ValueCell!8684)) mapDefault!29154)))))

(declare-fun e!502982 () Bool)

(declare-fun mapRes!29154 () Bool)

(assert (=> mapNonEmpty!29145 (= tp!56073 (and e!502982 mapRes!29154))))

(declare-fun mapIsEmpty!29154 () Bool)

(assert (=> mapIsEmpty!29154 mapRes!29154))

(declare-fun mapNonEmpty!29154 () Bool)

(declare-fun tp!56088 () Bool)

(declare-fun e!502981 () Bool)

(assert (=> mapNonEmpty!29154 (= mapRes!29154 (and tp!56088 e!502981))))

(declare-fun mapValue!29154 () ValueCell!8684)

(declare-fun mapKey!29154 () (_ BitVec 32))

(declare-fun mapRest!29154 () (Array (_ BitVec 32) ValueCell!8684))

(assert (=> mapNonEmpty!29154 (= mapRest!29145 (store mapRest!29154 mapKey!29154 mapValue!29154))))

(declare-fun b!899123 () Bool)

(assert (=> b!899123 (= e!502982 tp_is_empty!18331)))

(declare-fun b!899122 () Bool)

(assert (=> b!899122 (= e!502981 tp_is_empty!18331)))

(assert (= (and mapNonEmpty!29145 condMapEmpty!29154) mapIsEmpty!29154))

(assert (= (and mapNonEmpty!29145 (not condMapEmpty!29154)) mapNonEmpty!29154))

(assert (= (and mapNonEmpty!29154 ((_ is ValueCellFull!8684) mapValue!29154)) b!899122))

(assert (= (and mapNonEmpty!29145 ((_ is ValueCellFull!8684) mapDefault!29154)) b!899123))

(declare-fun m!836041 () Bool)

(assert (=> mapNonEmpty!29154 m!836041))

(check-sat (not b!899063) (not b_next!16003) (not b!899115) (not b!899083) (not d!111527) (not b!899064) (not bm!39877) (not b!899102) (not b!899084) (not bm!39874) b_and!26305 (not d!111529) (not b!899088) (not b!899113) (not mapNonEmpty!29154) (not b!899114) (not d!111531) (not b!899073) (not b!899067) (not d!111519) tp_is_empty!18331)
(check-sat b_and!26305 (not b_next!16003))
