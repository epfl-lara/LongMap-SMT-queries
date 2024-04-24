; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35218 () Bool)

(assert start!35218)

(declare-fun b_free!7807 () Bool)

(declare-fun b_next!7807 () Bool)

(assert (=> start!35218 (= b_free!7807 (not b_next!7807))))

(declare-fun tp!27014 () Bool)

(declare-fun b_and!15061 () Bool)

(assert (=> start!35218 (= tp!27014 b_and!15061)))

(declare-fun b!353178 () Bool)

(declare-fun res!195886 () Bool)

(declare-fun e!216250 () Bool)

(assert (=> b!353178 (=> (not res!195886) (not e!216250))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353178 (= res!195886 (validKeyInArray!0 k0!1348))))

(declare-fun b!353179 () Bool)

(declare-fun res!195882 () Bool)

(assert (=> b!353179 (=> (not res!195882) (not e!216250))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11323 0))(
  ( (V!11324 (val!3924 Int)) )
))
(declare-fun zeroValue!1467 () V!11323)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3536 0))(
  ( (ValueCellFull!3536 (v!6117 V!11323)) (EmptyCell!3536) )
))
(declare-datatypes ((array!19098 0))(
  ( (array!19099 (arr!9049 (Array (_ BitVec 32) ValueCell!3536)) (size!9401 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19098)

(declare-datatypes ((array!19100 0))(
  ( (array!19101 (arr!9050 (Array (_ BitVec 32) (_ BitVec 64))) (size!9402 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19100)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11323)

(declare-datatypes ((tuple2!5570 0))(
  ( (tuple2!5571 (_1!2796 (_ BitVec 64)) (_2!2796 V!11323)) )
))
(declare-datatypes ((List!5178 0))(
  ( (Nil!5175) (Cons!5174 (h!6030 tuple2!5570) (t!10318 List!5178)) )
))
(declare-datatypes ((ListLongMap!4485 0))(
  ( (ListLongMap!4486 (toList!2258 List!5178)) )
))
(declare-fun contains!2351 (ListLongMap!4485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1786 (array!19100 array!19098 (_ BitVec 32) (_ BitVec 32) V!11323 V!11323 (_ BitVec 32) Int) ListLongMap!4485)

(assert (=> b!353179 (= res!195882 (not (contains!2351 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!353180 () Bool)

(declare-fun res!195885 () Bool)

(assert (=> b!353180 (=> (not res!195885) (not e!216250))))

(declare-datatypes ((List!5179 0))(
  ( (Nil!5176) (Cons!5175 (h!6031 (_ BitVec 64)) (t!10319 List!5179)) )
))
(declare-fun arrayNoDuplicates!0 (array!19100 (_ BitVec 32) List!5179) Bool)

(assert (=> b!353180 (= res!195885 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5176))))

(declare-fun b!353181 () Bool)

(declare-fun e!216254 () Bool)

(declare-fun tp_is_empty!7759 () Bool)

(assert (=> b!353181 (= e!216254 tp_is_empty!7759)))

(declare-fun mapNonEmpty!13125 () Bool)

(declare-fun mapRes!13125 () Bool)

(declare-fun tp!27015 () Bool)

(declare-fun e!216251 () Bool)

(assert (=> mapNonEmpty!13125 (= mapRes!13125 (and tp!27015 e!216251))))

(declare-fun mapValue!13125 () ValueCell!3536)

(declare-fun mapKey!13125 () (_ BitVec 32))

(declare-fun mapRest!13125 () (Array (_ BitVec 32) ValueCell!3536))

(assert (=> mapNonEmpty!13125 (= (arr!9049 _values!1525) (store mapRest!13125 mapKey!13125 mapValue!13125))))

(declare-fun b!353182 () Bool)

(declare-datatypes ((SeekEntryResult!3433 0))(
  ( (MissingZero!3433 (index!15911 (_ BitVec 32))) (Found!3433 (index!15912 (_ BitVec 32))) (Intermediate!3433 (undefined!4245 Bool) (index!15913 (_ BitVec 32)) (x!35096 (_ BitVec 32))) (Undefined!3433) (MissingVacant!3433 (index!15914 (_ BitVec 32))) )
))
(declare-fun lt!165490 () SeekEntryResult!3433)

(get-info :version)

(assert (=> b!353182 (= e!216250 (and (not ((_ is Found!3433) lt!165490)) (not ((_ is MissingZero!3433) lt!165490)) (not ((_ is MissingVacant!3433) lt!165490)) (not ((_ is Undefined!3433) lt!165490))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19100 (_ BitVec 32)) SeekEntryResult!3433)

(assert (=> b!353182 (= lt!165490 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353183 () Bool)

(assert (=> b!353183 (= e!216251 tp_is_empty!7759)))

(declare-fun b!353184 () Bool)

(declare-fun res!195883 () Bool)

(assert (=> b!353184 (=> (not res!195883) (not e!216250))))

(assert (=> b!353184 (= res!195883 (and (= (size!9401 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9402 _keys!1895) (size!9401 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13125 () Bool)

(assert (=> mapIsEmpty!13125 mapRes!13125))

(declare-fun res!195887 () Bool)

(assert (=> start!35218 (=> (not res!195887) (not e!216250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35218 (= res!195887 (validMask!0 mask!2385))))

(assert (=> start!35218 e!216250))

(assert (=> start!35218 true))

(assert (=> start!35218 tp_is_empty!7759))

(assert (=> start!35218 tp!27014))

(declare-fun e!216252 () Bool)

(declare-fun array_inv!6682 (array!19098) Bool)

(assert (=> start!35218 (and (array_inv!6682 _values!1525) e!216252)))

(declare-fun array_inv!6683 (array!19100) Bool)

(assert (=> start!35218 (array_inv!6683 _keys!1895)))

(declare-fun b!353185 () Bool)

(assert (=> b!353185 (= e!216252 (and e!216254 mapRes!13125))))

(declare-fun condMapEmpty!13125 () Bool)

(declare-fun mapDefault!13125 () ValueCell!3536)

(assert (=> b!353185 (= condMapEmpty!13125 (= (arr!9049 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3536)) mapDefault!13125)))))

(declare-fun b!353186 () Bool)

(declare-fun res!195884 () Bool)

(assert (=> b!353186 (=> (not res!195884) (not e!216250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19100 (_ BitVec 32)) Bool)

(assert (=> b!353186 (= res!195884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!35218 res!195887) b!353184))

(assert (= (and b!353184 res!195883) b!353186))

(assert (= (and b!353186 res!195884) b!353180))

(assert (= (and b!353180 res!195885) b!353178))

(assert (= (and b!353178 res!195886) b!353179))

(assert (= (and b!353179 res!195882) b!353182))

(assert (= (and b!353185 condMapEmpty!13125) mapIsEmpty!13125))

(assert (= (and b!353185 (not condMapEmpty!13125)) mapNonEmpty!13125))

(assert (= (and mapNonEmpty!13125 ((_ is ValueCellFull!3536) mapValue!13125)) b!353183))

(assert (= (and b!353185 ((_ is ValueCellFull!3536) mapDefault!13125)) b!353181))

(assert (= start!35218 b!353185))

(declare-fun m!352885 () Bool)

(assert (=> start!35218 m!352885))

(declare-fun m!352887 () Bool)

(assert (=> start!35218 m!352887))

(declare-fun m!352889 () Bool)

(assert (=> start!35218 m!352889))

(declare-fun m!352891 () Bool)

(assert (=> mapNonEmpty!13125 m!352891))

(declare-fun m!352893 () Bool)

(assert (=> b!353179 m!352893))

(assert (=> b!353179 m!352893))

(declare-fun m!352895 () Bool)

(assert (=> b!353179 m!352895))

(declare-fun m!352897 () Bool)

(assert (=> b!353182 m!352897))

(declare-fun m!352899 () Bool)

(assert (=> b!353180 m!352899))

(declare-fun m!352901 () Bool)

(assert (=> b!353178 m!352901))

(declare-fun m!352903 () Bool)

(assert (=> b!353186 m!352903))

(check-sat (not start!35218) (not b!353186) (not b!353179) b_and!15061 tp_is_empty!7759 (not b_next!7807) (not b!353182) (not mapNonEmpty!13125) (not b!353178) (not b!353180))
(check-sat b_and!15061 (not b_next!7807))
(get-model)

(declare-fun d!71619 () Bool)

(assert (=> d!71619 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35218 d!71619))

(declare-fun d!71621 () Bool)

(assert (=> d!71621 (= (array_inv!6682 _values!1525) (bvsge (size!9401 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35218 d!71621))

(declare-fun d!71623 () Bool)

(assert (=> d!71623 (= (array_inv!6683 _keys!1895) (bvsge (size!9402 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35218 d!71623))

(declare-fun d!71625 () Bool)

(assert (=> d!71625 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353178 d!71625))

(declare-fun b!353253 () Bool)

(declare-fun e!216292 () SeekEntryResult!3433)

(declare-fun e!216291 () SeekEntryResult!3433)

(assert (=> b!353253 (= e!216292 e!216291)))

(declare-fun lt!165503 () (_ BitVec 64))

(declare-fun lt!165504 () SeekEntryResult!3433)

(assert (=> b!353253 (= lt!165503 (select (arr!9050 _keys!1895) (index!15913 lt!165504)))))

(declare-fun c!53639 () Bool)

(assert (=> b!353253 (= c!53639 (= lt!165503 k0!1348))))

(declare-fun e!216293 () SeekEntryResult!3433)

(declare-fun b!353254 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19100 (_ BitVec 32)) SeekEntryResult!3433)

(assert (=> b!353254 (= e!216293 (seekKeyOrZeroReturnVacant!0 (x!35096 lt!165504) (index!15913 lt!165504) (index!15913 lt!165504) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!71627 () Bool)

(declare-fun lt!165505 () SeekEntryResult!3433)

(assert (=> d!71627 (and (or ((_ is Undefined!3433) lt!165505) (not ((_ is Found!3433) lt!165505)) (and (bvsge (index!15912 lt!165505) #b00000000000000000000000000000000) (bvslt (index!15912 lt!165505) (size!9402 _keys!1895)))) (or ((_ is Undefined!3433) lt!165505) ((_ is Found!3433) lt!165505) (not ((_ is MissingZero!3433) lt!165505)) (and (bvsge (index!15911 lt!165505) #b00000000000000000000000000000000) (bvslt (index!15911 lt!165505) (size!9402 _keys!1895)))) (or ((_ is Undefined!3433) lt!165505) ((_ is Found!3433) lt!165505) ((_ is MissingZero!3433) lt!165505) (not ((_ is MissingVacant!3433) lt!165505)) (and (bvsge (index!15914 lt!165505) #b00000000000000000000000000000000) (bvslt (index!15914 lt!165505) (size!9402 _keys!1895)))) (or ((_ is Undefined!3433) lt!165505) (ite ((_ is Found!3433) lt!165505) (= (select (arr!9050 _keys!1895) (index!15912 lt!165505)) k0!1348) (ite ((_ is MissingZero!3433) lt!165505) (= (select (arr!9050 _keys!1895) (index!15911 lt!165505)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3433) lt!165505) (= (select (arr!9050 _keys!1895) (index!15914 lt!165505)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71627 (= lt!165505 e!216292)))

(declare-fun c!53637 () Bool)

(assert (=> d!71627 (= c!53637 (and ((_ is Intermediate!3433) lt!165504) (undefined!4245 lt!165504)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!19100 (_ BitVec 32)) SeekEntryResult!3433)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71627 (= lt!165504 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71627 (validMask!0 mask!2385)))

(assert (=> d!71627 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!165505)))

(declare-fun b!353255 () Bool)

(assert (=> b!353255 (= e!216291 (Found!3433 (index!15913 lt!165504)))))

(declare-fun b!353256 () Bool)

(assert (=> b!353256 (= e!216292 Undefined!3433)))

(declare-fun b!353257 () Bool)

(declare-fun c!53638 () Bool)

(assert (=> b!353257 (= c!53638 (= lt!165503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!353257 (= e!216291 e!216293)))

(declare-fun b!353258 () Bool)

(assert (=> b!353258 (= e!216293 (MissingZero!3433 (index!15913 lt!165504)))))

(assert (= (and d!71627 c!53637) b!353256))

(assert (= (and d!71627 (not c!53637)) b!353253))

(assert (= (and b!353253 c!53639) b!353255))

(assert (= (and b!353253 (not c!53639)) b!353257))

(assert (= (and b!353257 c!53638) b!353258))

(assert (= (and b!353257 (not c!53638)) b!353254))

(declare-fun m!352945 () Bool)

(assert (=> b!353253 m!352945))

(declare-fun m!352947 () Bool)

(assert (=> b!353254 m!352947))

(declare-fun m!352949 () Bool)

(assert (=> d!71627 m!352949))

(declare-fun m!352951 () Bool)

(assert (=> d!71627 m!352951))

(assert (=> d!71627 m!352949))

(declare-fun m!352953 () Bool)

(assert (=> d!71627 m!352953))

(declare-fun m!352955 () Bool)

(assert (=> d!71627 m!352955))

(assert (=> d!71627 m!352885))

(declare-fun m!352957 () Bool)

(assert (=> d!71627 m!352957))

(assert (=> b!353182 d!71627))

(declare-fun b!353267 () Bool)

(declare-fun e!216301 () Bool)

(declare-fun e!216300 () Bool)

(assert (=> b!353267 (= e!216301 e!216300)))

(declare-fun c!53642 () Bool)

(assert (=> b!353267 (= c!53642 (validKeyInArray!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71629 () Bool)

(declare-fun res!195929 () Bool)

(assert (=> d!71629 (=> res!195929 e!216301)))

(assert (=> d!71629 (= res!195929 (bvsge #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(assert (=> d!71629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!216301)))

(declare-fun b!353268 () Bool)

(declare-fun e!216302 () Bool)

(declare-fun call!27104 () Bool)

(assert (=> b!353268 (= e!216302 call!27104)))

(declare-fun b!353269 () Bool)

(assert (=> b!353269 (= e!216300 e!216302)))

(declare-fun lt!165514 () (_ BitVec 64))

(assert (=> b!353269 (= lt!165514 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10891 0))(
  ( (Unit!10892) )
))
(declare-fun lt!165513 () Unit!10891)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!19100 (_ BitVec 64) (_ BitVec 32)) Unit!10891)

(assert (=> b!353269 (= lt!165513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!165514 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!19100 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!353269 (arrayContainsKey!0 _keys!1895 lt!165514 #b00000000000000000000000000000000)))

(declare-fun lt!165512 () Unit!10891)

(assert (=> b!353269 (= lt!165512 lt!165513)))

(declare-fun res!195928 () Bool)

(assert (=> b!353269 (= res!195928 (= (seekEntryOrOpen!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3433 #b00000000000000000000000000000000)))))

(assert (=> b!353269 (=> (not res!195928) (not e!216302))))

(declare-fun b!353270 () Bool)

(assert (=> b!353270 (= e!216300 call!27104)))

(declare-fun bm!27101 () Bool)

(assert (=> bm!27101 (= call!27104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(assert (= (and d!71629 (not res!195929)) b!353267))

(assert (= (and b!353267 c!53642) b!353269))

(assert (= (and b!353267 (not c!53642)) b!353270))

(assert (= (and b!353269 res!195928) b!353268))

(assert (= (or b!353268 b!353270) bm!27101))

(declare-fun m!352959 () Bool)

(assert (=> b!353267 m!352959))

(assert (=> b!353267 m!352959))

(declare-fun m!352961 () Bool)

(assert (=> b!353267 m!352961))

(assert (=> b!353269 m!352959))

(declare-fun m!352963 () Bool)

(assert (=> b!353269 m!352963))

(declare-fun m!352965 () Bool)

(assert (=> b!353269 m!352965))

(assert (=> b!353269 m!352959))

(declare-fun m!352967 () Bool)

(assert (=> b!353269 m!352967))

(declare-fun m!352969 () Bool)

(assert (=> bm!27101 m!352969))

(assert (=> b!353186 d!71629))

(declare-fun d!71631 () Bool)

(declare-fun e!216308 () Bool)

(assert (=> d!71631 e!216308))

(declare-fun res!195932 () Bool)

(assert (=> d!71631 (=> res!195932 e!216308)))

(declare-fun lt!165524 () Bool)

(assert (=> d!71631 (= res!195932 (not lt!165524))))

(declare-fun lt!165526 () Bool)

(assert (=> d!71631 (= lt!165524 lt!165526)))

(declare-fun lt!165523 () Unit!10891)

(declare-fun e!216307 () Unit!10891)

(assert (=> d!71631 (= lt!165523 e!216307)))

(declare-fun c!53645 () Bool)

(assert (=> d!71631 (= c!53645 lt!165526)))

(declare-fun containsKey!346 (List!5178 (_ BitVec 64)) Bool)

(assert (=> d!71631 (= lt!165526 (containsKey!346 (toList!2258 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71631 (= (contains!2351 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!165524)))

(declare-fun b!353277 () Bool)

(declare-fun lt!165525 () Unit!10891)

(assert (=> b!353277 (= e!216307 lt!165525)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!294 (List!5178 (_ BitVec 64)) Unit!10891)

(assert (=> b!353277 (= lt!165525 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!2258 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!361 0))(
  ( (Some!360 (v!6120 V!11323)) (None!359) )
))
(declare-fun isDefined!295 (Option!361) Bool)

(declare-fun getValueByKey!355 (List!5178 (_ BitVec 64)) Option!361)

(assert (=> b!353277 (isDefined!295 (getValueByKey!355 (toList!2258 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!353278 () Bool)

(declare-fun Unit!10893 () Unit!10891)

(assert (=> b!353278 (= e!216307 Unit!10893)))

(declare-fun b!353279 () Bool)

(assert (=> b!353279 (= e!216308 (isDefined!295 (getValueByKey!355 (toList!2258 (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71631 c!53645) b!353277))

(assert (= (and d!71631 (not c!53645)) b!353278))

(assert (= (and d!71631 (not res!195932)) b!353279))

(declare-fun m!352971 () Bool)

(assert (=> d!71631 m!352971))

(declare-fun m!352973 () Bool)

(assert (=> b!353277 m!352973))

(declare-fun m!352975 () Bool)

(assert (=> b!353277 m!352975))

(assert (=> b!353277 m!352975))

(declare-fun m!352977 () Bool)

(assert (=> b!353277 m!352977))

(assert (=> b!353279 m!352975))

(assert (=> b!353279 m!352975))

(assert (=> b!353279 m!352977))

(assert (=> b!353179 d!71631))

(declare-fun b!353322 () Bool)

(declare-fun e!216346 () Unit!10891)

(declare-fun lt!165585 () Unit!10891)

(assert (=> b!353322 (= e!216346 lt!165585)))

(declare-fun lt!165579 () ListLongMap!4485)

(declare-fun getCurrentListMapNoExtraKeys!612 (array!19100 array!19098 (_ BitVec 32) (_ BitVec 32) V!11323 V!11323 (_ BitVec 32) Int) ListLongMap!4485)

(assert (=> b!353322 (= lt!165579 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165589 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165589 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165584 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165584 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165580 () Unit!10891)

(declare-fun addStillContains!272 (ListLongMap!4485 (_ BitVec 64) V!11323 (_ BitVec 64)) Unit!10891)

(assert (=> b!353322 (= lt!165580 (addStillContains!272 lt!165579 lt!165589 zeroValue!1467 lt!165584))))

(declare-fun +!747 (ListLongMap!4485 tuple2!5570) ListLongMap!4485)

(assert (=> b!353322 (contains!2351 (+!747 lt!165579 (tuple2!5571 lt!165589 zeroValue!1467)) lt!165584)))

(declare-fun lt!165588 () Unit!10891)

(assert (=> b!353322 (= lt!165588 lt!165580)))

(declare-fun lt!165575 () ListLongMap!4485)

(assert (=> b!353322 (= lt!165575 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165583 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165583 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165582 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165582 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165590 () Unit!10891)

(declare-fun addApplyDifferent!272 (ListLongMap!4485 (_ BitVec 64) V!11323 (_ BitVec 64)) Unit!10891)

(assert (=> b!353322 (= lt!165590 (addApplyDifferent!272 lt!165575 lt!165583 minValue!1467 lt!165582))))

(declare-fun apply!296 (ListLongMap!4485 (_ BitVec 64)) V!11323)

(assert (=> b!353322 (= (apply!296 (+!747 lt!165575 (tuple2!5571 lt!165583 minValue!1467)) lt!165582) (apply!296 lt!165575 lt!165582))))

(declare-fun lt!165572 () Unit!10891)

(assert (=> b!353322 (= lt!165572 lt!165590)))

(declare-fun lt!165571 () ListLongMap!4485)

(assert (=> b!353322 (= lt!165571 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165576 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165576 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165581 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165581 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!165586 () Unit!10891)

(assert (=> b!353322 (= lt!165586 (addApplyDifferent!272 lt!165571 lt!165576 zeroValue!1467 lt!165581))))

(assert (=> b!353322 (= (apply!296 (+!747 lt!165571 (tuple2!5571 lt!165576 zeroValue!1467)) lt!165581) (apply!296 lt!165571 lt!165581))))

(declare-fun lt!165591 () Unit!10891)

(assert (=> b!353322 (= lt!165591 lt!165586)))

(declare-fun lt!165592 () ListLongMap!4485)

(assert (=> b!353322 (= lt!165592 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!165587 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165587 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!165577 () (_ BitVec 64))

(assert (=> b!353322 (= lt!165577 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!353322 (= lt!165585 (addApplyDifferent!272 lt!165592 lt!165587 minValue!1467 lt!165577))))

(assert (=> b!353322 (= (apply!296 (+!747 lt!165592 (tuple2!5571 lt!165587 minValue!1467)) lt!165577) (apply!296 lt!165592 lt!165577))))

(declare-fun d!71633 () Bool)

(declare-fun e!216339 () Bool)

(assert (=> d!71633 e!216339))

(declare-fun res!195954 () Bool)

(assert (=> d!71633 (=> (not res!195954) (not e!216339))))

(assert (=> d!71633 (= res!195954 (or (bvsge #b00000000000000000000000000000000 (size!9402 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9402 _keys!1895)))))))

(declare-fun lt!165578 () ListLongMap!4485)

(declare-fun lt!165574 () ListLongMap!4485)

(assert (=> d!71633 (= lt!165578 lt!165574)))

(declare-fun lt!165573 () Unit!10891)

(assert (=> d!71633 (= lt!165573 e!216346)))

(declare-fun c!53662 () Bool)

(declare-fun e!216337 () Bool)

(assert (=> d!71633 (= c!53662 e!216337)))

(declare-fun res!195959 () Bool)

(assert (=> d!71633 (=> (not res!195959) (not e!216337))))

(assert (=> d!71633 (= res!195959 (bvslt #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(declare-fun e!216335 () ListLongMap!4485)

(assert (=> d!71633 (= lt!165574 e!216335)))

(declare-fun c!53658 () Bool)

(assert (=> d!71633 (= c!53658 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71633 (validMask!0 mask!2385)))

(assert (=> d!71633 (= (getCurrentListMap!1786 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!165578)))

(declare-fun b!353323 () Bool)

(assert (=> b!353323 (= e!216337 (validKeyInArray!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353324 () Bool)

(declare-fun res!195952 () Bool)

(assert (=> b!353324 (=> (not res!195952) (not e!216339))))

(declare-fun e!216345 () Bool)

(assert (=> b!353324 (= res!195952 e!216345)))

(declare-fun res!195955 () Bool)

(assert (=> b!353324 (=> res!195955 e!216345)))

(declare-fun e!216341 () Bool)

(assert (=> b!353324 (= res!195955 (not e!216341))))

(declare-fun res!195951 () Bool)

(assert (=> b!353324 (=> (not res!195951) (not e!216341))))

(assert (=> b!353324 (= res!195951 (bvslt #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(declare-fun b!353325 () Bool)

(declare-fun e!216343 () ListLongMap!4485)

(declare-fun call!27121 () ListLongMap!4485)

(assert (=> b!353325 (= e!216343 call!27121)))

(declare-fun bm!27116 () Bool)

(declare-fun call!27119 () Bool)

(assert (=> bm!27116 (= call!27119 (contains!2351 lt!165578 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27117 () Bool)

(declare-fun call!27122 () ListLongMap!4485)

(declare-fun call!27125 () ListLongMap!4485)

(assert (=> bm!27117 (= call!27122 call!27125)))

(declare-fun bm!27118 () Bool)

(declare-fun call!27123 () ListLongMap!4485)

(assert (=> bm!27118 (= call!27123 call!27122)))

(declare-fun b!353326 () Bool)

(declare-fun e!216336 () ListLongMap!4485)

(assert (=> b!353326 (= e!216336 call!27121)))

(declare-fun bm!27119 () Bool)

(declare-fun call!27120 () ListLongMap!4485)

(declare-fun c!53660 () Bool)

(assert (=> bm!27119 (= call!27120 (+!747 (ite c!53658 call!27125 (ite c!53660 call!27122 call!27123)) (ite (or c!53658 c!53660) (tuple2!5571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!353327 () Bool)

(declare-fun e!216340 () Bool)

(assert (=> b!353327 (= e!216340 (= (apply!296 lt!165578 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!353328 () Bool)

(declare-fun e!216338 () Bool)

(declare-fun call!27124 () Bool)

(assert (=> b!353328 (= e!216338 (not call!27124))))

(declare-fun b!353329 () Bool)

(assert (=> b!353329 (= e!216335 e!216343)))

(assert (=> b!353329 (= c!53660 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!353330 () Bool)

(assert (=> b!353330 (= e!216341 (validKeyInArray!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27120 () Bool)

(assert (=> bm!27120 (= call!27124 (contains!2351 lt!165578 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353331 () Bool)

(declare-fun e!216342 () Bool)

(assert (=> b!353331 (= e!216342 (= (apply!296 lt!165578 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!353332 () Bool)

(assert (=> b!353332 (= e!216335 (+!747 call!27120 (tuple2!5571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!353333 () Bool)

(declare-fun e!216344 () Bool)

(assert (=> b!353333 (= e!216345 e!216344)))

(declare-fun res!195953 () Bool)

(assert (=> b!353333 (=> (not res!195953) (not e!216344))))

(assert (=> b!353333 (= res!195953 (contains!2351 lt!165578 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!353333 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(declare-fun b!353334 () Bool)

(declare-fun c!53659 () Bool)

(assert (=> b!353334 (= c!53659 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!353334 (= e!216343 e!216336)))

(declare-fun b!353335 () Bool)

(assert (=> b!353335 (= e!216336 call!27123)))

(declare-fun bm!27121 () Bool)

(assert (=> bm!27121 (= call!27121 call!27120)))

(declare-fun b!353336 () Bool)

(declare-fun e!216347 () Bool)

(assert (=> b!353336 (= e!216347 e!216340)))

(declare-fun res!195958 () Bool)

(assert (=> b!353336 (= res!195958 call!27119)))

(assert (=> b!353336 (=> (not res!195958) (not e!216340))))

(declare-fun b!353337 () Bool)

(declare-fun res!195957 () Bool)

(assert (=> b!353337 (=> (not res!195957) (not e!216339))))

(assert (=> b!353337 (= res!195957 e!216347)))

(declare-fun c!53661 () Bool)

(assert (=> b!353337 (= c!53661 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!353338 () Bool)

(assert (=> b!353338 (= e!216338 e!216342)))

(declare-fun res!195956 () Bool)

(assert (=> b!353338 (= res!195956 call!27124)))

(assert (=> b!353338 (=> (not res!195956) (not e!216342))))

(declare-fun bm!27122 () Bool)

(assert (=> bm!27122 (= call!27125 (getCurrentListMapNoExtraKeys!612 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!353339 () Bool)

(declare-fun Unit!10894 () Unit!10891)

(assert (=> b!353339 (= e!216346 Unit!10894)))

(declare-fun b!353340 () Bool)

(assert (=> b!353340 (= e!216339 e!216338)))

(declare-fun c!53663 () Bool)

(assert (=> b!353340 (= c!53663 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!353341 () Bool)

(assert (=> b!353341 (= e!216347 (not call!27119))))

(declare-fun b!353342 () Bool)

(declare-fun get!4834 (ValueCell!3536 V!11323) V!11323)

(declare-fun dynLambda!639 (Int (_ BitVec 64)) V!11323)

(assert (=> b!353342 (= e!216344 (= (apply!296 lt!165578 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)) (get!4834 (select (arr!9049 _values!1525) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!353342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9401 _values!1525)))))

(assert (=> b!353342 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(assert (= (and d!71633 c!53658) b!353332))

(assert (= (and d!71633 (not c!53658)) b!353329))

(assert (= (and b!353329 c!53660) b!353325))

(assert (= (and b!353329 (not c!53660)) b!353334))

(assert (= (and b!353334 c!53659) b!353326))

(assert (= (and b!353334 (not c!53659)) b!353335))

(assert (= (or b!353326 b!353335) bm!27118))

(assert (= (or b!353325 bm!27118) bm!27117))

(assert (= (or b!353325 b!353326) bm!27121))

(assert (= (or b!353332 bm!27117) bm!27122))

(assert (= (or b!353332 bm!27121) bm!27119))

(assert (= (and d!71633 res!195959) b!353323))

(assert (= (and d!71633 c!53662) b!353322))

(assert (= (and d!71633 (not c!53662)) b!353339))

(assert (= (and d!71633 res!195954) b!353324))

(assert (= (and b!353324 res!195951) b!353330))

(assert (= (and b!353324 (not res!195955)) b!353333))

(assert (= (and b!353333 res!195953) b!353342))

(assert (= (and b!353324 res!195952) b!353337))

(assert (= (and b!353337 c!53661) b!353336))

(assert (= (and b!353337 (not c!53661)) b!353341))

(assert (= (and b!353336 res!195958) b!353327))

(assert (= (or b!353336 b!353341) bm!27116))

(assert (= (and b!353337 res!195957) b!353340))

(assert (= (and b!353340 c!53663) b!353338))

(assert (= (and b!353340 (not c!53663)) b!353328))

(assert (= (and b!353338 res!195956) b!353331))

(assert (= (or b!353338 b!353328) bm!27120))

(declare-fun b_lambda!8545 () Bool)

(assert (=> (not b_lambda!8545) (not b!353342)))

(declare-fun t!10323 () Bool)

(declare-fun tb!3099 () Bool)

(assert (=> (and start!35218 (= defaultEntry!1528 defaultEntry!1528) t!10323) tb!3099))

(declare-fun result!5643 () Bool)

(assert (=> tb!3099 (= result!5643 tp_is_empty!7759)))

(assert (=> b!353342 t!10323))

(declare-fun b_and!15067 () Bool)

(assert (= b_and!15061 (and (=> t!10323 result!5643) b_and!15067)))

(declare-fun m!352979 () Bool)

(assert (=> b!353327 m!352979))

(assert (=> b!353333 m!352959))

(assert (=> b!353333 m!352959))

(declare-fun m!352981 () Bool)

(assert (=> b!353333 m!352981))

(assert (=> b!353323 m!352959))

(assert (=> b!353323 m!352959))

(assert (=> b!353323 m!352961))

(assert (=> d!71633 m!352885))

(declare-fun m!352983 () Bool)

(assert (=> b!353322 m!352983))

(declare-fun m!352985 () Bool)

(assert (=> b!353322 m!352985))

(declare-fun m!352987 () Bool)

(assert (=> b!353322 m!352987))

(declare-fun m!352989 () Bool)

(assert (=> b!353322 m!352989))

(declare-fun m!352991 () Bool)

(assert (=> b!353322 m!352991))

(assert (=> b!353322 m!352989))

(declare-fun m!352993 () Bool)

(assert (=> b!353322 m!352993))

(declare-fun m!352995 () Bool)

(assert (=> b!353322 m!352995))

(assert (=> b!353322 m!352959))

(declare-fun m!352997 () Bool)

(assert (=> b!353322 m!352997))

(assert (=> b!353322 m!352985))

(declare-fun m!352999 () Bool)

(assert (=> b!353322 m!352999))

(declare-fun m!353001 () Bool)

(assert (=> b!353322 m!353001))

(declare-fun m!353003 () Bool)

(assert (=> b!353322 m!353003))

(declare-fun m!353005 () Bool)

(assert (=> b!353322 m!353005))

(assert (=> b!353322 m!353003))

(declare-fun m!353007 () Bool)

(assert (=> b!353322 m!353007))

(declare-fun m!353009 () Bool)

(assert (=> b!353322 m!353009))

(declare-fun m!353011 () Bool)

(assert (=> b!353322 m!353011))

(assert (=> b!353322 m!353009))

(declare-fun m!353013 () Bool)

(assert (=> b!353322 m!353013))

(declare-fun m!353015 () Bool)

(assert (=> b!353342 m!353015))

(declare-fun m!353017 () Bool)

(assert (=> b!353342 m!353017))

(assert (=> b!353342 m!353015))

(declare-fun m!353019 () Bool)

(assert (=> b!353342 m!353019))

(assert (=> b!353342 m!352959))

(assert (=> b!353342 m!352959))

(declare-fun m!353021 () Bool)

(assert (=> b!353342 m!353021))

(assert (=> b!353342 m!353017))

(assert (=> b!353330 m!352959))

(assert (=> b!353330 m!352959))

(assert (=> b!353330 m!352961))

(declare-fun m!353023 () Bool)

(assert (=> b!353331 m!353023))

(assert (=> bm!27122 m!352997))

(declare-fun m!353025 () Bool)

(assert (=> bm!27119 m!353025))

(declare-fun m!353027 () Bool)

(assert (=> b!353332 m!353027))

(declare-fun m!353029 () Bool)

(assert (=> bm!27120 m!353029))

(declare-fun m!353031 () Bool)

(assert (=> bm!27116 m!353031))

(assert (=> b!353179 d!71633))

(declare-fun b!353355 () Bool)

(declare-fun e!216356 () Bool)

(declare-fun contains!2353 (List!5179 (_ BitVec 64)) Bool)

(assert (=> b!353355 (= e!216356 (contains!2353 Nil!5176 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!27125 () Bool)

(declare-fun call!27128 () Bool)

(declare-fun c!53666 () Bool)

(assert (=> bm!27125 (= call!27128 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53666 (Cons!5175 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000) Nil!5176) Nil!5176)))))

(declare-fun b!353356 () Bool)

(declare-fun e!216358 () Bool)

(declare-fun e!216359 () Bool)

(assert (=> b!353356 (= e!216358 e!216359)))

(declare-fun res!195967 () Bool)

(assert (=> b!353356 (=> (not res!195967) (not e!216359))))

(assert (=> b!353356 (= res!195967 (not e!216356))))

(declare-fun res!195968 () Bool)

(assert (=> b!353356 (=> (not res!195968) (not e!216356))))

(assert (=> b!353356 (= res!195968 (validKeyInArray!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353357 () Bool)

(declare-fun e!216357 () Bool)

(assert (=> b!353357 (= e!216359 e!216357)))

(assert (=> b!353357 (= c!53666 (validKeyInArray!0 (select (arr!9050 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!353358 () Bool)

(assert (=> b!353358 (= e!216357 call!27128)))

(declare-fun d!71635 () Bool)

(declare-fun res!195966 () Bool)

(assert (=> d!71635 (=> res!195966 e!216358)))

(assert (=> d!71635 (= res!195966 (bvsge #b00000000000000000000000000000000 (size!9402 _keys!1895)))))

(assert (=> d!71635 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5176) e!216358)))

(declare-fun b!353359 () Bool)

(assert (=> b!353359 (= e!216357 call!27128)))

(assert (= (and d!71635 (not res!195966)) b!353356))

(assert (= (and b!353356 res!195968) b!353355))

(assert (= (and b!353356 res!195967) b!353357))

(assert (= (and b!353357 c!53666) b!353359))

(assert (= (and b!353357 (not c!53666)) b!353358))

(assert (= (or b!353359 b!353358) bm!27125))

(assert (=> b!353355 m!352959))

(assert (=> b!353355 m!352959))

(declare-fun m!353033 () Bool)

(assert (=> b!353355 m!353033))

(assert (=> bm!27125 m!352959))

(declare-fun m!353035 () Bool)

(assert (=> bm!27125 m!353035))

(assert (=> b!353356 m!352959))

(assert (=> b!353356 m!352959))

(assert (=> b!353356 m!352961))

(assert (=> b!353357 m!352959))

(assert (=> b!353357 m!352959))

(assert (=> b!353357 m!352961))

(assert (=> b!353180 d!71635))

(declare-fun mapIsEmpty!13134 () Bool)

(declare-fun mapRes!13134 () Bool)

(assert (=> mapIsEmpty!13134 mapRes!13134))

(declare-fun condMapEmpty!13134 () Bool)

(declare-fun mapDefault!13134 () ValueCell!3536)

(assert (=> mapNonEmpty!13125 (= condMapEmpty!13134 (= mapRest!13125 ((as const (Array (_ BitVec 32) ValueCell!3536)) mapDefault!13134)))))

(declare-fun e!216365 () Bool)

(assert (=> mapNonEmpty!13125 (= tp!27015 (and e!216365 mapRes!13134))))

(declare-fun b!353366 () Bool)

(declare-fun e!216364 () Bool)

(assert (=> b!353366 (= e!216364 tp_is_empty!7759)))

(declare-fun b!353367 () Bool)

(assert (=> b!353367 (= e!216365 tp_is_empty!7759)))

(declare-fun mapNonEmpty!13134 () Bool)

(declare-fun tp!27030 () Bool)

(assert (=> mapNonEmpty!13134 (= mapRes!13134 (and tp!27030 e!216364))))

(declare-fun mapValue!13134 () ValueCell!3536)

(declare-fun mapRest!13134 () (Array (_ BitVec 32) ValueCell!3536))

(declare-fun mapKey!13134 () (_ BitVec 32))

(assert (=> mapNonEmpty!13134 (= mapRest!13125 (store mapRest!13134 mapKey!13134 mapValue!13134))))

(assert (= (and mapNonEmpty!13125 condMapEmpty!13134) mapIsEmpty!13134))

(assert (= (and mapNonEmpty!13125 (not condMapEmpty!13134)) mapNonEmpty!13134))

(assert (= (and mapNonEmpty!13134 ((_ is ValueCellFull!3536) mapValue!13134)) b!353366))

(assert (= (and mapNonEmpty!13125 ((_ is ValueCellFull!3536) mapDefault!13134)) b!353367))

(declare-fun m!353037 () Bool)

(assert (=> mapNonEmpty!13134 m!353037))

(declare-fun b_lambda!8547 () Bool)

(assert (= b_lambda!8545 (or (and start!35218 b_free!7807) b_lambda!8547)))

(check-sat (not b!353330) (not b!353322) (not b!353357) (not b!353323) (not d!71627) (not b_lambda!8547) (not b!353254) (not bm!27119) (not b!353333) (not b!353356) (not bm!27125) (not b!353355) (not bm!27122) (not bm!27120) (not b!353331) (not d!71633) (not b!353332) (not mapNonEmpty!13134) (not b!353327) (not b!353277) (not bm!27101) (not b!353279) (not bm!27116) (not b!353267) (not b!353269) (not b!353342) (not d!71631) tp_is_empty!7759 (not b_next!7807) b_and!15067)
(check-sat b_and!15067 (not b_next!7807))
