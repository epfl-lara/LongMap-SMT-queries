; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76718 () Bool)

(assert start!76718)

(declare-fun b!897925 () Bool)

(declare-fun b_free!15999 () Bool)

(declare-fun b_next!15999 () Bool)

(assert (=> b!897925 (= b_free!15999 (not b_next!15999))))

(declare-fun tp!56057 () Bool)

(declare-fun b_and!26291 () Bool)

(assert (=> b!897925 (= tp!56057 b_and!26291)))

(declare-fun mapIsEmpty!29136 () Bool)

(declare-fun mapRes!29136 () Bool)

(assert (=> mapIsEmpty!29136 mapRes!29136))

(declare-fun res!606875 () Bool)

(declare-fun e!502189 () Bool)

(assert (=> start!76718 (=> (not res!606875) (not e!502189))))

(declare-datatypes ((array!52686 0))(
  ( (array!52687 (arr!25323 (Array (_ BitVec 32) (_ BitVec 64))) (size!25778 (_ BitVec 32))) )
))
(declare-datatypes ((V!29401 0))(
  ( (V!29402 (val!9214 Int)) )
))
(declare-datatypes ((ValueCell!8682 0))(
  ( (ValueCellFull!8682 (v!11704 V!29401)) (EmptyCell!8682) )
))
(declare-datatypes ((array!52688 0))(
  ( (array!52689 (arr!25324 (Array (_ BitVec 32) ValueCell!8682)) (size!25779 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4380 0))(
  ( (LongMapFixedSize!4381 (defaultEntry!5402 Int) (mask!26112 (_ BitVec 32)) (extraKeys!5115 (_ BitVec 32)) (zeroValue!5219 V!29401) (minValue!5219 V!29401) (_size!2245 (_ BitVec 32)) (_keys!10169 array!52686) (_values!5406 array!52688) (_vacant!2245 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4380)

(declare-fun valid!1687 (LongMapFixedSize!4380) Bool)

(assert (=> start!76718 (= res!606875 (valid!1687 thiss!1181))))

(assert (=> start!76718 e!502189))

(declare-fun e!502193 () Bool)

(assert (=> start!76718 e!502193))

(assert (=> start!76718 true))

(declare-fun b!897914 () Bool)

(declare-fun res!606878 () Bool)

(declare-fun e!502196 () Bool)

(assert (=> b!897914 (=> res!606878 e!502196)))

(declare-datatypes ((List!17833 0))(
  ( (Nil!17830) (Cons!17829 (h!18971 (_ BitVec 64)) (t!25172 List!17833)) )
))
(declare-fun arrayNoDuplicates!0 (array!52686 (_ BitVec 32) List!17833) Bool)

(assert (=> b!897914 (= res!606878 (not (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17830)))))

(declare-fun b!897915 () Bool)

(declare-fun e!502188 () Bool)

(declare-fun e!502192 () Bool)

(assert (=> b!897915 (= e!502188 (and e!502192 mapRes!29136))))

(declare-fun condMapEmpty!29136 () Bool)

(declare-fun mapDefault!29136 () ValueCell!8682)

(assert (=> b!897915 (= condMapEmpty!29136 (= (arr!25324 (_values!5406 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8682)) mapDefault!29136)))))

(declare-fun b!897916 () Bool)

(declare-fun e!502194 () Bool)

(assert (=> b!897916 (= e!502194 e!502196)))

(declare-fun res!606876 () Bool)

(assert (=> b!897916 (=> res!606876 e!502196)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897916 (= res!606876 (not (validMask!0 (mask!26112 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52686 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897916 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30524 0))(
  ( (Unit!30525) )
))
(declare-fun lt!405347 () Unit!30524)

(declare-datatypes ((SeekEntryResult!8917 0))(
  ( (MissingZero!8917 (index!38039 (_ BitVec 32))) (Found!8917 (index!38040 (_ BitVec 32))) (Intermediate!8917 (undefined!9729 Bool) (index!38041 (_ BitVec 32)) (x!76514 (_ BitVec 32))) (Undefined!8917) (MissingVacant!8917 (index!38042 (_ BitVec 32))) )
))
(declare-fun lt!405349 () SeekEntryResult!8917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52686 (_ BitVec 64) (_ BitVec 32)) Unit!30524)

(assert (=> b!897916 (= lt!405347 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) key!785 (index!38040 lt!405349)))))

(declare-fun b!897917 () Bool)

(declare-fun e!502195 () Bool)

(declare-fun tp_is_empty!18327 () Bool)

(assert (=> b!897917 (= e!502195 tp_is_empty!18327)))

(declare-fun b!897918 () Bool)

(assert (=> b!897918 (= e!502192 tp_is_empty!18327)))

(declare-fun b!897919 () Bool)

(declare-fun e!502191 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897919 (= e!502191 (inRange!0 (index!38040 lt!405349) (mask!26112 thiss!1181)))))

(declare-fun b!897920 () Bool)

(declare-fun res!606873 () Bool)

(assert (=> b!897920 (=> res!606873 e!502196)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52686 (_ BitVec 32)) Bool)

(assert (=> b!897920 (= res!606873 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26112 thiss!1181))))))

(declare-fun b!897921 () Bool)

(declare-fun res!606872 () Bool)

(assert (=> b!897921 (=> res!606872 e!502196)))

(assert (=> b!897921 (= res!606872 (or (not (= (size!25779 (_values!5406 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26112 thiss!1181)))) (not (= (size!25778 (_keys!10169 thiss!1181)) (size!25779 (_values!5406 thiss!1181)))) (bvslt (mask!26112 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5115 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5115 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!897922 () Bool)

(assert (=> b!897922 (= e!502189 (not e!502194))))

(declare-fun res!606874 () Bool)

(assert (=> b!897922 (=> res!606874 e!502194)))

(get-info :version)

(assert (=> b!897922 (= res!606874 (not ((_ is Found!8917) lt!405349)))))

(assert (=> b!897922 e!502191))

(declare-fun res!606879 () Bool)

(assert (=> b!897922 (=> res!606879 e!502191)))

(assert (=> b!897922 (= res!606879 (not ((_ is Found!8917) lt!405349)))))

(declare-fun lt!405348 () Unit!30524)

(declare-fun lemmaSeekEntryGivesInRangeIndex!87 (array!52686 array!52688 (_ BitVec 32) (_ BitVec 32) V!29401 V!29401 (_ BitVec 64)) Unit!30524)

(assert (=> b!897922 (= lt!405348 (lemmaSeekEntryGivesInRangeIndex!87 (_keys!10169 thiss!1181) (_values!5406 thiss!1181) (mask!26112 thiss!1181) (extraKeys!5115 thiss!1181) (zeroValue!5219 thiss!1181) (minValue!5219 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52686 (_ BitVec 32)) SeekEntryResult!8917)

(assert (=> b!897922 (= lt!405349 (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(declare-fun b!897923 () Bool)

(declare-fun res!606877 () Bool)

(assert (=> b!897923 (=> (not res!606877) (not e!502189))))

(assert (=> b!897923 (= res!606877 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897924 () Bool)

(assert (=> b!897924 (= e!502196 (and (bvsge (index!38040 lt!405349) #b00000000000000000000000000000000) (bvslt (index!38040 lt!405349) (size!25778 (_keys!10169 thiss!1181)))))))

(declare-fun array_inv!19876 (array!52686) Bool)

(declare-fun array_inv!19877 (array!52688) Bool)

(assert (=> b!897925 (= e!502193 (and tp!56057 tp_is_empty!18327 (array_inv!19876 (_keys!10169 thiss!1181)) (array_inv!19877 (_values!5406 thiss!1181)) e!502188))))

(declare-fun mapNonEmpty!29136 () Bool)

(declare-fun tp!56056 () Bool)

(assert (=> mapNonEmpty!29136 (= mapRes!29136 (and tp!56056 e!502195))))

(declare-fun mapValue!29136 () ValueCell!8682)

(declare-fun mapKey!29136 () (_ BitVec 32))

(declare-fun mapRest!29136 () (Array (_ BitVec 32) ValueCell!8682))

(assert (=> mapNonEmpty!29136 (= (arr!25324 (_values!5406 thiss!1181)) (store mapRest!29136 mapKey!29136 mapValue!29136))))

(assert (= (and start!76718 res!606875) b!897923))

(assert (= (and b!897923 res!606877) b!897922))

(assert (= (and b!897922 (not res!606879)) b!897919))

(assert (= (and b!897922 (not res!606874)) b!897916))

(assert (= (and b!897916 (not res!606876)) b!897921))

(assert (= (and b!897921 (not res!606872)) b!897920))

(assert (= (and b!897920 (not res!606873)) b!897914))

(assert (= (and b!897914 (not res!606878)) b!897924))

(assert (= (and b!897915 condMapEmpty!29136) mapIsEmpty!29136))

(assert (= (and b!897915 (not condMapEmpty!29136)) mapNonEmpty!29136))

(assert (= (and mapNonEmpty!29136 ((_ is ValueCellFull!8682) mapValue!29136)) b!897917))

(assert (= (and b!897915 ((_ is ValueCellFull!8682) mapDefault!29136)) b!897918))

(assert (= b!897925 b!897915))

(assert (= start!76718 b!897925))

(declare-fun m!834537 () Bool)

(assert (=> b!897925 m!834537))

(declare-fun m!834539 () Bool)

(assert (=> b!897925 m!834539))

(declare-fun m!834541 () Bool)

(assert (=> b!897922 m!834541))

(declare-fun m!834543 () Bool)

(assert (=> b!897922 m!834543))

(declare-fun m!834545 () Bool)

(assert (=> b!897916 m!834545))

(declare-fun m!834547 () Bool)

(assert (=> b!897916 m!834547))

(declare-fun m!834549 () Bool)

(assert (=> b!897916 m!834549))

(declare-fun m!834551 () Bool)

(assert (=> mapNonEmpty!29136 m!834551))

(declare-fun m!834553 () Bool)

(assert (=> b!897919 m!834553))

(declare-fun m!834555 () Bool)

(assert (=> b!897920 m!834555))

(declare-fun m!834557 () Bool)

(assert (=> start!76718 m!834557))

(declare-fun m!834559 () Bool)

(assert (=> b!897914 m!834559))

(check-sat b_and!26291 tp_is_empty!18327 (not b!897916) (not b!897914) (not b_next!15999) (not b!897920) (not mapNonEmpty!29136) (not b!897925) (not b!897919) (not b!897922) (not start!76718))
(check-sat b_and!26291 (not b_next!15999))
(get-model)

(declare-fun d!111163 () Bool)

(assert (=> d!111163 (= (array_inv!19876 (_keys!10169 thiss!1181)) (bvsge (size!25778 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897925 d!111163))

(declare-fun d!111165 () Bool)

(assert (=> d!111165 (= (array_inv!19877 (_values!5406 thiss!1181)) (bvsge (size!25779 (_values!5406 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897925 d!111165))

(declare-fun b!897972 () Bool)

(declare-fun e!502233 () Bool)

(declare-fun e!502235 () Bool)

(assert (=> b!897972 (= e!502233 e!502235)))

(declare-fun res!606911 () Bool)

(assert (=> b!897972 (=> (not res!606911) (not e!502235))))

(declare-fun e!502232 () Bool)

(assert (=> b!897972 (= res!606911 (not e!502232))))

(declare-fun res!606912 () Bool)

(assert (=> b!897972 (=> (not res!606912) (not e!502232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897972 (= res!606912 (validKeyInArray!0 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111167 () Bool)

(declare-fun res!606910 () Bool)

(assert (=> d!111167 (=> res!606910 e!502233)))

(assert (=> d!111167 (= res!606910 (bvsge #b00000000000000000000000000000000 (size!25778 (_keys!10169 thiss!1181))))))

(assert (=> d!111167 (= (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17830) e!502233)))

(declare-fun b!897973 () Bool)

(declare-fun e!502234 () Bool)

(declare-fun call!39826 () Bool)

(assert (=> b!897973 (= e!502234 call!39826)))

(declare-fun b!897974 () Bool)

(assert (=> b!897974 (= e!502234 call!39826)))

(declare-fun b!897975 () Bool)

(declare-fun contains!4406 (List!17833 (_ BitVec 64)) Bool)

(assert (=> b!897975 (= e!502232 (contains!4406 Nil!17830 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39823 () Bool)

(declare-fun c!94886 () Bool)

(assert (=> bm!39823 (= call!39826 (arrayNoDuplicates!0 (_keys!10169 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94886 (Cons!17829 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) Nil!17830) Nil!17830)))))

(declare-fun b!897976 () Bool)

(assert (=> b!897976 (= e!502235 e!502234)))

(assert (=> b!897976 (= c!94886 (validKeyInArray!0 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111167 (not res!606910)) b!897972))

(assert (= (and b!897972 res!606912) b!897975))

(assert (= (and b!897972 res!606911) b!897976))

(assert (= (and b!897976 c!94886) b!897973))

(assert (= (and b!897976 (not c!94886)) b!897974))

(assert (= (or b!897973 b!897974) bm!39823))

(declare-fun m!834585 () Bool)

(assert (=> b!897972 m!834585))

(assert (=> b!897972 m!834585))

(declare-fun m!834587 () Bool)

(assert (=> b!897972 m!834587))

(assert (=> b!897975 m!834585))

(assert (=> b!897975 m!834585))

(declare-fun m!834589 () Bool)

(assert (=> b!897975 m!834589))

(assert (=> bm!39823 m!834585))

(declare-fun m!834591 () Bool)

(assert (=> bm!39823 m!834591))

(assert (=> b!897976 m!834585))

(assert (=> b!897976 m!834585))

(assert (=> b!897976 m!834587))

(assert (=> b!897914 d!111167))

(declare-fun b!897985 () Bool)

(declare-fun e!502244 () Bool)

(declare-fun call!39829 () Bool)

(assert (=> b!897985 (= e!502244 call!39829)))

(declare-fun b!897986 () Bool)

(declare-fun e!502242 () Bool)

(assert (=> b!897986 (= e!502242 e!502244)))

(declare-fun c!94889 () Bool)

(assert (=> b!897986 (= c!94889 (validKeyInArray!0 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111169 () Bool)

(declare-fun res!606917 () Bool)

(assert (=> d!111169 (=> res!606917 e!502242)))

(assert (=> d!111169 (= res!606917 (bvsge #b00000000000000000000000000000000 (size!25778 (_keys!10169 thiss!1181))))))

(assert (=> d!111169 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)) e!502242)))

(declare-fun bm!39826 () Bool)

(assert (=> bm!39826 (= call!39829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(declare-fun b!897987 () Bool)

(declare-fun e!502243 () Bool)

(assert (=> b!897987 (= e!502243 call!39829)))

(declare-fun b!897988 () Bool)

(assert (=> b!897988 (= e!502244 e!502243)))

(declare-fun lt!405366 () (_ BitVec 64))

(assert (=> b!897988 (= lt!405366 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405365 () Unit!30524)

(assert (=> b!897988 (= lt!405365 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) lt!405366 #b00000000000000000000000000000000))))

(assert (=> b!897988 (arrayContainsKey!0 (_keys!10169 thiss!1181) lt!405366 #b00000000000000000000000000000000)))

(declare-fun lt!405367 () Unit!30524)

(assert (=> b!897988 (= lt!405367 lt!405365)))

(declare-fun res!606918 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52686 (_ BitVec 32)) SeekEntryResult!8917)

(assert (=> b!897988 (= res!606918 (= (seekEntryOrOpen!0 (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) (_keys!10169 thiss!1181) (mask!26112 thiss!1181)) (Found!8917 #b00000000000000000000000000000000)))))

(assert (=> b!897988 (=> (not res!606918) (not e!502243))))

(assert (= (and d!111169 (not res!606917)) b!897986))

(assert (= (and b!897986 c!94889) b!897988))

(assert (= (and b!897986 (not c!94889)) b!897985))

(assert (= (and b!897988 res!606918) b!897987))

(assert (= (or b!897987 b!897985) bm!39826))

(assert (=> b!897986 m!834585))

(assert (=> b!897986 m!834585))

(assert (=> b!897986 m!834587))

(declare-fun m!834593 () Bool)

(assert (=> bm!39826 m!834593))

(assert (=> b!897988 m!834585))

(declare-fun m!834595 () Bool)

(assert (=> b!897988 m!834595))

(declare-fun m!834597 () Bool)

(assert (=> b!897988 m!834597))

(assert (=> b!897988 m!834585))

(declare-fun m!834599 () Bool)

(assert (=> b!897988 m!834599))

(assert (=> b!897920 d!111169))

(declare-fun d!111171 () Bool)

(assert (=> d!111171 (= (inRange!0 (index!38040 lt!405349) (mask!26112 thiss!1181)) (and (bvsge (index!38040 lt!405349) #b00000000000000000000000000000000) (bvslt (index!38040 lt!405349) (bvadd (mask!26112 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897919 d!111171))

(declare-fun d!111173 () Bool)

(declare-fun e!502247 () Bool)

(assert (=> d!111173 e!502247))

(declare-fun res!606921 () Bool)

(assert (=> d!111173 (=> res!606921 e!502247)))

(declare-fun lt!405373 () SeekEntryResult!8917)

(assert (=> d!111173 (= res!606921 (not ((_ is Found!8917) lt!405373)))))

(assert (=> d!111173 (= lt!405373 (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(declare-fun lt!405372 () Unit!30524)

(declare-fun choose!1486 (array!52686 array!52688 (_ BitVec 32) (_ BitVec 32) V!29401 V!29401 (_ BitVec 64)) Unit!30524)

(assert (=> d!111173 (= lt!405372 (choose!1486 (_keys!10169 thiss!1181) (_values!5406 thiss!1181) (mask!26112 thiss!1181) (extraKeys!5115 thiss!1181) (zeroValue!5219 thiss!1181) (minValue!5219 thiss!1181) key!785))))

(assert (=> d!111173 (validMask!0 (mask!26112 thiss!1181))))

(assert (=> d!111173 (= (lemmaSeekEntryGivesInRangeIndex!87 (_keys!10169 thiss!1181) (_values!5406 thiss!1181) (mask!26112 thiss!1181) (extraKeys!5115 thiss!1181) (zeroValue!5219 thiss!1181) (minValue!5219 thiss!1181) key!785) lt!405372)))

(declare-fun b!897991 () Bool)

(assert (=> b!897991 (= e!502247 (inRange!0 (index!38040 lt!405373) (mask!26112 thiss!1181)))))

(assert (= (and d!111173 (not res!606921)) b!897991))

(assert (=> d!111173 m!834543))

(declare-fun m!834601 () Bool)

(assert (=> d!111173 m!834601))

(assert (=> d!111173 m!834545))

(declare-fun m!834603 () Bool)

(assert (=> b!897991 m!834603))

(assert (=> b!897922 d!111173))

(declare-fun b!898004 () Bool)

(declare-fun e!502254 () SeekEntryResult!8917)

(declare-fun lt!405385 () SeekEntryResult!8917)

(assert (=> b!898004 (= e!502254 (MissingZero!8917 (index!38041 lt!405385)))))

(declare-fun d!111175 () Bool)

(declare-fun lt!405382 () SeekEntryResult!8917)

(assert (=> d!111175 (and (or ((_ is MissingVacant!8917) lt!405382) (not ((_ is Found!8917) lt!405382)) (and (bvsge (index!38040 lt!405382) #b00000000000000000000000000000000) (bvslt (index!38040 lt!405382) (size!25778 (_keys!10169 thiss!1181))))) (not ((_ is MissingVacant!8917) lt!405382)) (or (not ((_ is Found!8917) lt!405382)) (= (select (arr!25323 (_keys!10169 thiss!1181)) (index!38040 lt!405382)) key!785)))))

(declare-fun e!502255 () SeekEntryResult!8917)

(assert (=> d!111175 (= lt!405382 e!502255)))

(declare-fun c!94898 () Bool)

(assert (=> d!111175 (= c!94898 (and ((_ is Intermediate!8917) lt!405385) (undefined!9729 lt!405385)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52686 (_ BitVec 32)) SeekEntryResult!8917)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111175 (= lt!405385 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26112 thiss!1181)) key!785 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(assert (=> d!111175 (validMask!0 (mask!26112 thiss!1181))))

(assert (=> d!111175 (= (seekEntry!0 key!785 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)) lt!405382)))

(declare-fun b!898005 () Bool)

(assert (=> b!898005 (= e!502255 Undefined!8917)))

(declare-fun b!898006 () Bool)

(declare-fun e!502256 () SeekEntryResult!8917)

(assert (=> b!898006 (= e!502255 e!502256)))

(declare-fun lt!405383 () (_ BitVec 64))

(assert (=> b!898006 (= lt!405383 (select (arr!25323 (_keys!10169 thiss!1181)) (index!38041 lt!405385)))))

(declare-fun c!94897 () Bool)

(assert (=> b!898006 (= c!94897 (= lt!405383 key!785))))

(declare-fun b!898007 () Bool)

(declare-fun c!94896 () Bool)

(assert (=> b!898007 (= c!94896 (= lt!405383 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898007 (= e!502256 e!502254)))

(declare-fun b!898008 () Bool)

(declare-fun lt!405384 () SeekEntryResult!8917)

(assert (=> b!898008 (= e!502254 (ite ((_ is MissingVacant!8917) lt!405384) (MissingZero!8917 (index!38042 lt!405384)) lt!405384))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52686 (_ BitVec 32)) SeekEntryResult!8917)

(assert (=> b!898008 (= lt!405384 (seekKeyOrZeroReturnVacant!0 (x!76514 lt!405385) (index!38041 lt!405385) (index!38041 lt!405385) key!785 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(declare-fun b!898009 () Bool)

(assert (=> b!898009 (= e!502256 (Found!8917 (index!38041 lt!405385)))))

(assert (= (and d!111175 c!94898) b!898005))

(assert (= (and d!111175 (not c!94898)) b!898006))

(assert (= (and b!898006 c!94897) b!898009))

(assert (= (and b!898006 (not c!94897)) b!898007))

(assert (= (and b!898007 c!94896) b!898004))

(assert (= (and b!898007 (not c!94896)) b!898008))

(declare-fun m!834605 () Bool)

(assert (=> d!111175 m!834605))

(declare-fun m!834607 () Bool)

(assert (=> d!111175 m!834607))

(assert (=> d!111175 m!834607))

(declare-fun m!834609 () Bool)

(assert (=> d!111175 m!834609))

(assert (=> d!111175 m!834545))

(declare-fun m!834611 () Bool)

(assert (=> b!898006 m!834611))

(declare-fun m!834613 () Bool)

(assert (=> b!898008 m!834613))

(assert (=> b!897922 d!111175))

(declare-fun d!111177 () Bool)

(declare-fun res!606928 () Bool)

(declare-fun e!502259 () Bool)

(assert (=> d!111177 (=> (not res!606928) (not e!502259))))

(declare-fun simpleValid!321 (LongMapFixedSize!4380) Bool)

(assert (=> d!111177 (= res!606928 (simpleValid!321 thiss!1181))))

(assert (=> d!111177 (= (valid!1687 thiss!1181) e!502259)))

(declare-fun b!898016 () Bool)

(declare-fun res!606929 () Bool)

(assert (=> b!898016 (=> (not res!606929) (not e!502259))))

(declare-fun arrayCountValidKeys!0 (array!52686 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898016 (= res!606929 (= (arrayCountValidKeys!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 (size!25778 (_keys!10169 thiss!1181))) (_size!2245 thiss!1181)))))

(declare-fun b!898017 () Bool)

(declare-fun res!606930 () Bool)

(assert (=> b!898017 (=> (not res!606930) (not e!502259))))

(assert (=> b!898017 (= res!606930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10169 thiss!1181) (mask!26112 thiss!1181)))))

(declare-fun b!898018 () Bool)

(assert (=> b!898018 (= e!502259 (arrayNoDuplicates!0 (_keys!10169 thiss!1181) #b00000000000000000000000000000000 Nil!17830))))

(assert (= (and d!111177 res!606928) b!898016))

(assert (= (and b!898016 res!606929) b!898017))

(assert (= (and b!898017 res!606930) b!898018))

(declare-fun m!834615 () Bool)

(assert (=> d!111177 m!834615))

(declare-fun m!834617 () Bool)

(assert (=> b!898016 m!834617))

(assert (=> b!898017 m!834555))

(assert (=> b!898018 m!834559))

(assert (=> start!76718 d!111177))

(declare-fun d!111179 () Bool)

(assert (=> d!111179 (= (validMask!0 (mask!26112 thiss!1181)) (and (or (= (mask!26112 thiss!1181) #b00000000000000000000000000000111) (= (mask!26112 thiss!1181) #b00000000000000000000000000001111) (= (mask!26112 thiss!1181) #b00000000000000000000000000011111) (= (mask!26112 thiss!1181) #b00000000000000000000000000111111) (= (mask!26112 thiss!1181) #b00000000000000000000000001111111) (= (mask!26112 thiss!1181) #b00000000000000000000000011111111) (= (mask!26112 thiss!1181) #b00000000000000000000000111111111) (= (mask!26112 thiss!1181) #b00000000000000000000001111111111) (= (mask!26112 thiss!1181) #b00000000000000000000011111111111) (= (mask!26112 thiss!1181) #b00000000000000000000111111111111) (= (mask!26112 thiss!1181) #b00000000000000000001111111111111) (= (mask!26112 thiss!1181) #b00000000000000000011111111111111) (= (mask!26112 thiss!1181) #b00000000000000000111111111111111) (= (mask!26112 thiss!1181) #b00000000000000001111111111111111) (= (mask!26112 thiss!1181) #b00000000000000011111111111111111) (= (mask!26112 thiss!1181) #b00000000000000111111111111111111) (= (mask!26112 thiss!1181) #b00000000000001111111111111111111) (= (mask!26112 thiss!1181) #b00000000000011111111111111111111) (= (mask!26112 thiss!1181) #b00000000000111111111111111111111) (= (mask!26112 thiss!1181) #b00000000001111111111111111111111) (= (mask!26112 thiss!1181) #b00000000011111111111111111111111) (= (mask!26112 thiss!1181) #b00000000111111111111111111111111) (= (mask!26112 thiss!1181) #b00000001111111111111111111111111) (= (mask!26112 thiss!1181) #b00000011111111111111111111111111) (= (mask!26112 thiss!1181) #b00000111111111111111111111111111) (= (mask!26112 thiss!1181) #b00001111111111111111111111111111) (= (mask!26112 thiss!1181) #b00011111111111111111111111111111) (= (mask!26112 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26112 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897916 d!111179))

(declare-fun d!111181 () Bool)

(declare-fun res!606935 () Bool)

(declare-fun e!502264 () Bool)

(assert (=> d!111181 (=> res!606935 e!502264)))

(assert (=> d!111181 (= res!606935 (= (select (arr!25323 (_keys!10169 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111181 (= (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000) e!502264)))

(declare-fun b!898023 () Bool)

(declare-fun e!502265 () Bool)

(assert (=> b!898023 (= e!502264 e!502265)))

(declare-fun res!606936 () Bool)

(assert (=> b!898023 (=> (not res!606936) (not e!502265))))

(assert (=> b!898023 (= res!606936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25778 (_keys!10169 thiss!1181))))))

(declare-fun b!898024 () Bool)

(assert (=> b!898024 (= e!502265 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111181 (not res!606935)) b!898023))

(assert (= (and b!898023 res!606936) b!898024))

(assert (=> d!111181 m!834585))

(declare-fun m!834619 () Bool)

(assert (=> b!898024 m!834619))

(assert (=> b!897916 d!111181))

(declare-fun d!111183 () Bool)

(assert (=> d!111183 (arrayContainsKey!0 (_keys!10169 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405388 () Unit!30524)

(declare-fun choose!13 (array!52686 (_ BitVec 64) (_ BitVec 32)) Unit!30524)

(assert (=> d!111183 (= lt!405388 (choose!13 (_keys!10169 thiss!1181) key!785 (index!38040 lt!405349)))))

(assert (=> d!111183 (bvsge (index!38040 lt!405349) #b00000000000000000000000000000000)))

(assert (=> d!111183 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10169 thiss!1181) key!785 (index!38040 lt!405349)) lt!405388)))

(declare-fun bs!25202 () Bool)

(assert (= bs!25202 d!111183))

(assert (=> bs!25202 m!834547))

(declare-fun m!834621 () Bool)

(assert (=> bs!25202 m!834621))

(assert (=> b!897916 d!111183))

(declare-fun mapNonEmpty!29142 () Bool)

(declare-fun mapRes!29142 () Bool)

(declare-fun tp!56066 () Bool)

(declare-fun e!502270 () Bool)

(assert (=> mapNonEmpty!29142 (= mapRes!29142 (and tp!56066 e!502270))))

(declare-fun mapKey!29142 () (_ BitVec 32))

(declare-fun mapRest!29142 () (Array (_ BitVec 32) ValueCell!8682))

(declare-fun mapValue!29142 () ValueCell!8682)

(assert (=> mapNonEmpty!29142 (= mapRest!29136 (store mapRest!29142 mapKey!29142 mapValue!29142))))

(declare-fun b!898032 () Bool)

(declare-fun e!502271 () Bool)

(assert (=> b!898032 (= e!502271 tp_is_empty!18327)))

(declare-fun b!898031 () Bool)

(assert (=> b!898031 (= e!502270 tp_is_empty!18327)))

(declare-fun mapIsEmpty!29142 () Bool)

(assert (=> mapIsEmpty!29142 mapRes!29142))

(declare-fun condMapEmpty!29142 () Bool)

(declare-fun mapDefault!29142 () ValueCell!8682)

(assert (=> mapNonEmpty!29136 (= condMapEmpty!29142 (= mapRest!29136 ((as const (Array (_ BitVec 32) ValueCell!8682)) mapDefault!29142)))))

(assert (=> mapNonEmpty!29136 (= tp!56056 (and e!502271 mapRes!29142))))

(assert (= (and mapNonEmpty!29136 condMapEmpty!29142) mapIsEmpty!29142))

(assert (= (and mapNonEmpty!29136 (not condMapEmpty!29142)) mapNonEmpty!29142))

(assert (= (and mapNonEmpty!29142 ((_ is ValueCellFull!8682) mapValue!29142)) b!898031))

(assert (= (and mapNonEmpty!29136 ((_ is ValueCellFull!8682) mapDefault!29142)) b!898032))

(declare-fun m!834623 () Bool)

(assert (=> mapNonEmpty!29142 m!834623))

(check-sat (not b!897986) (not b!897972) (not b!897975) (not bm!39826) (not d!111177) (not b!897988) (not b_next!15999) (not b!897991) b_and!26291 (not b!898024) (not d!111173) (not b!898008) (not mapNonEmpty!29142) tp_is_empty!18327 (not bm!39823) (not b!898018) (not b!898017) (not b!897976) (not b!898016) (not d!111183) (not d!111175))
(check-sat b_and!26291 (not b_next!15999))
