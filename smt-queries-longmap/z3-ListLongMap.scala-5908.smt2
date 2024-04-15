; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76428 () Bool)

(assert start!76428)

(declare-fun b!896168 () Bool)

(declare-fun b_free!15949 () Bool)

(declare-fun b_next!15949 () Bool)

(assert (=> b!896168 (= b_free!15949 (not b_next!15949))))

(declare-fun tp!55879 () Bool)

(declare-fun b_and!26215 () Bool)

(assert (=> b!896168 (= tp!55879 b_and!26215)))

(declare-fun mapIsEmpty!29033 () Bool)

(declare-fun mapRes!29033 () Bool)

(assert (=> mapIsEmpty!29033 mapRes!29033))

(declare-fun b!896162 () Bool)

(declare-fun e!500887 () Bool)

(declare-datatypes ((array!52553 0))(
  ( (array!52554 (arr!25265 (Array (_ BitVec 32) (_ BitVec 64))) (size!25718 (_ BitVec 32))) )
))
(declare-datatypes ((V!29335 0))(
  ( (V!29336 (val!9189 Int)) )
))
(declare-datatypes ((ValueCell!8657 0))(
  ( (ValueCellFull!8657 (v!11676 V!29335)) (EmptyCell!8657) )
))
(declare-datatypes ((array!52555 0))(
  ( (array!52556 (arr!25266 (Array (_ BitVec 32) ValueCell!8657)) (size!25719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4330 0))(
  ( (LongMapFixedSize!4331 (defaultEntry!5377 Int) (mask!26010 (_ BitVec 32)) (extraKeys!5078 (_ BitVec 32)) (zeroValue!5182 V!29335) (minValue!5182 V!29335) (_size!2220 (_ BitVec 32)) (_keys!10105 array!52553) (_values!5369 array!52555) (_vacant!2220 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4330)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!896162 (= e!500887 (validMask!0 (mask!26010 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!896162 (arrayContainsKey!0 (_keys!10105 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30426 0))(
  ( (Unit!30427) )
))
(declare-fun lt!404570 () Unit!30426)

(declare-datatypes ((SeekEntryResult!8901 0))(
  ( (MissingZero!8901 (index!37975 (_ BitVec 32))) (Found!8901 (index!37976 (_ BitVec 32))) (Intermediate!8901 (undefined!9713 Bool) (index!37977 (_ BitVec 32)) (x!76329 (_ BitVec 32))) (Undefined!8901) (MissingVacant!8901 (index!37978 (_ BitVec 32))) )
))
(declare-fun lt!404569 () SeekEntryResult!8901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52553 (_ BitVec 64) (_ BitVec 32)) Unit!30426)

(assert (=> b!896162 (= lt!404570 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10105 thiss!1181) key!785 (index!37976 lt!404569)))))

(declare-fun res!606019 () Bool)

(declare-fun e!500885 () Bool)

(assert (=> start!76428 (=> (not res!606019) (not e!500885))))

(declare-fun valid!1676 (LongMapFixedSize!4330) Bool)

(assert (=> start!76428 (= res!606019 (valid!1676 thiss!1181))))

(assert (=> start!76428 e!500885))

(declare-fun e!500883 () Bool)

(assert (=> start!76428 e!500883))

(assert (=> start!76428 true))

(declare-fun mapNonEmpty!29033 () Bool)

(declare-fun tp!55880 () Bool)

(declare-fun e!500884 () Bool)

(assert (=> mapNonEmpty!29033 (= mapRes!29033 (and tp!55880 e!500884))))

(declare-fun mapValue!29033 () ValueCell!8657)

(declare-fun mapKey!29033 () (_ BitVec 32))

(declare-fun mapRest!29033 () (Array (_ BitVec 32) ValueCell!8657))

(assert (=> mapNonEmpty!29033 (= (arr!25266 (_values!5369 thiss!1181)) (store mapRest!29033 mapKey!29033 mapValue!29033))))

(declare-fun b!896163 () Bool)

(declare-fun e!500888 () Bool)

(declare-fun tp_is_empty!18277 () Bool)

(assert (=> b!896163 (= e!500888 tp_is_empty!18277)))

(declare-fun b!896164 () Bool)

(declare-fun e!500882 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896164 (= e!500882 (inRange!0 (index!37976 lt!404569) (mask!26010 thiss!1181)))))

(declare-fun b!896165 () Bool)

(assert (=> b!896165 (= e!500884 tp_is_empty!18277)))

(declare-fun b!896166 () Bool)

(assert (=> b!896166 (= e!500885 (not e!500887))))

(declare-fun res!606022 () Bool)

(assert (=> b!896166 (=> res!606022 e!500887)))

(get-info :version)

(assert (=> b!896166 (= res!606022 (not ((_ is Found!8901) lt!404569)))))

(assert (=> b!896166 e!500882))

(declare-fun res!606020 () Bool)

(assert (=> b!896166 (=> res!606020 e!500882)))

(assert (=> b!896166 (= res!606020 (not ((_ is Found!8901) lt!404569)))))

(declare-fun lt!404568 () Unit!30426)

(declare-fun lemmaSeekEntryGivesInRangeIndex!72 (array!52553 array!52555 (_ BitVec 32) (_ BitVec 32) V!29335 V!29335 (_ BitVec 64)) Unit!30426)

(assert (=> b!896166 (= lt!404568 (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10105 thiss!1181) (_values!5369 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8901)

(assert (=> b!896166 (= lt!404569 (seekEntry!0 key!785 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun b!896167 () Bool)

(declare-fun e!500889 () Bool)

(assert (=> b!896167 (= e!500889 (and e!500888 mapRes!29033))))

(declare-fun condMapEmpty!29033 () Bool)

(declare-fun mapDefault!29033 () ValueCell!8657)

(assert (=> b!896167 (= condMapEmpty!29033 (= (arr!25266 (_values!5369 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8657)) mapDefault!29033)))))

(declare-fun array_inv!19886 (array!52553) Bool)

(declare-fun array_inv!19887 (array!52555) Bool)

(assert (=> b!896168 (= e!500883 (and tp!55879 tp_is_empty!18277 (array_inv!19886 (_keys!10105 thiss!1181)) (array_inv!19887 (_values!5369 thiss!1181)) e!500889))))

(declare-fun b!896169 () Bool)

(declare-fun res!606021 () Bool)

(assert (=> b!896169 (=> (not res!606021) (not e!500885))))

(assert (=> b!896169 (= res!606021 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76428 res!606019) b!896169))

(assert (= (and b!896169 res!606021) b!896166))

(assert (= (and b!896166 (not res!606020)) b!896164))

(assert (= (and b!896166 (not res!606022)) b!896162))

(assert (= (and b!896167 condMapEmpty!29033) mapIsEmpty!29033))

(assert (= (and b!896167 (not condMapEmpty!29033)) mapNonEmpty!29033))

(assert (= (and mapNonEmpty!29033 ((_ is ValueCellFull!8657) mapValue!29033)) b!896165))

(assert (= (and b!896167 ((_ is ValueCellFull!8657) mapDefault!29033)) b!896163))

(assert (= b!896168 b!896167))

(assert (= start!76428 b!896168))

(declare-fun m!832831 () Bool)

(assert (=> b!896168 m!832831))

(declare-fun m!832833 () Bool)

(assert (=> b!896168 m!832833))

(declare-fun m!832835 () Bool)

(assert (=> start!76428 m!832835))

(declare-fun m!832837 () Bool)

(assert (=> b!896162 m!832837))

(declare-fun m!832839 () Bool)

(assert (=> b!896162 m!832839))

(declare-fun m!832841 () Bool)

(assert (=> b!896162 m!832841))

(declare-fun m!832843 () Bool)

(assert (=> b!896164 m!832843))

(declare-fun m!832845 () Bool)

(assert (=> b!896166 m!832845))

(declare-fun m!832847 () Bool)

(assert (=> b!896166 m!832847))

(declare-fun m!832849 () Bool)

(assert (=> mapNonEmpty!29033 m!832849))

(check-sat tp_is_empty!18277 b_and!26215 (not b!896162) (not b_next!15949) (not start!76428) (not mapNonEmpty!29033) (not b!896164) (not b!896168) (not b!896166))
(check-sat b_and!26215 (not b_next!15949))
(get-model)

(declare-fun d!110711 () Bool)

(assert (=> d!110711 (= (inRange!0 (index!37976 lt!404569) (mask!26010 thiss!1181)) (and (bvsge (index!37976 lt!404569) #b00000000000000000000000000000000) (bvslt (index!37976 lt!404569) (bvadd (mask!26010 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896164 d!110711))

(declare-fun d!110713 () Bool)

(declare-fun res!606053 () Bool)

(declare-fun e!500940 () Bool)

(assert (=> d!110713 (=> (not res!606053) (not e!500940))))

(declare-fun simpleValid!313 (LongMapFixedSize!4330) Bool)

(assert (=> d!110713 (= res!606053 (simpleValid!313 thiss!1181))))

(assert (=> d!110713 (= (valid!1676 thiss!1181) e!500940)))

(declare-fun b!896224 () Bool)

(declare-fun res!606054 () Bool)

(assert (=> b!896224 (=> (not res!606054) (not e!500940))))

(declare-fun arrayCountValidKeys!0 (array!52553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896224 (= res!606054 (= (arrayCountValidKeys!0 (_keys!10105 thiss!1181) #b00000000000000000000000000000000 (size!25718 (_keys!10105 thiss!1181))) (_size!2220 thiss!1181)))))

(declare-fun b!896225 () Bool)

(declare-fun res!606055 () Bool)

(assert (=> b!896225 (=> (not res!606055) (not e!500940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52553 (_ BitVec 32)) Bool)

(assert (=> b!896225 (= res!606055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun b!896226 () Bool)

(declare-datatypes ((List!17831 0))(
  ( (Nil!17828) (Cons!17827 (h!18965 (_ BitVec 64)) (t!25161 List!17831)) )
))
(declare-fun arrayNoDuplicates!0 (array!52553 (_ BitVec 32) List!17831) Bool)

(assert (=> b!896226 (= e!500940 (arrayNoDuplicates!0 (_keys!10105 thiss!1181) #b00000000000000000000000000000000 Nil!17828))))

(assert (= (and d!110713 res!606053) b!896224))

(assert (= (and b!896224 res!606054) b!896225))

(assert (= (and b!896225 res!606055) b!896226))

(declare-fun m!832891 () Bool)

(assert (=> d!110713 m!832891))

(declare-fun m!832893 () Bool)

(assert (=> b!896224 m!832893))

(declare-fun m!832895 () Bool)

(assert (=> b!896225 m!832895))

(declare-fun m!832897 () Bool)

(assert (=> b!896226 m!832897))

(assert (=> start!76428 d!110713))

(declare-fun d!110715 () Bool)

(declare-fun e!500943 () Bool)

(assert (=> d!110715 e!500943))

(declare-fun res!606058 () Bool)

(assert (=> d!110715 (=> res!606058 e!500943)))

(declare-fun lt!404594 () SeekEntryResult!8901)

(assert (=> d!110715 (= res!606058 (not ((_ is Found!8901) lt!404594)))))

(assert (=> d!110715 (= lt!404594 (seekEntry!0 key!785 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun lt!404593 () Unit!30426)

(declare-fun choose!1487 (array!52553 array!52555 (_ BitVec 32) (_ BitVec 32) V!29335 V!29335 (_ BitVec 64)) Unit!30426)

(assert (=> d!110715 (= lt!404593 (choose!1487 (_keys!10105 thiss!1181) (_values!5369 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785))))

(assert (=> d!110715 (validMask!0 (mask!26010 thiss!1181))))

(assert (=> d!110715 (= (lemmaSeekEntryGivesInRangeIndex!72 (_keys!10105 thiss!1181) (_values!5369 thiss!1181) (mask!26010 thiss!1181) (extraKeys!5078 thiss!1181) (zeroValue!5182 thiss!1181) (minValue!5182 thiss!1181) key!785) lt!404593)))

(declare-fun b!896229 () Bool)

(assert (=> b!896229 (= e!500943 (inRange!0 (index!37976 lt!404594) (mask!26010 thiss!1181)))))

(assert (= (and d!110715 (not res!606058)) b!896229))

(assert (=> d!110715 m!832847))

(declare-fun m!832899 () Bool)

(assert (=> d!110715 m!832899))

(assert (=> d!110715 m!832837))

(declare-fun m!832901 () Bool)

(assert (=> b!896229 m!832901))

(assert (=> b!896166 d!110715))

(declare-fun b!896242 () Bool)

(declare-fun e!500951 () SeekEntryResult!8901)

(declare-fun lt!404604 () SeekEntryResult!8901)

(assert (=> b!896242 (= e!500951 (Found!8901 (index!37977 lt!404604)))))

(declare-fun b!896243 () Bool)

(declare-fun e!500950 () SeekEntryResult!8901)

(declare-fun lt!404606 () SeekEntryResult!8901)

(assert (=> b!896243 (= e!500950 (ite ((_ is MissingVacant!8901) lt!404606) (MissingZero!8901 (index!37978 lt!404606)) lt!404606))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8901)

(assert (=> b!896243 (= lt!404606 (seekKeyOrZeroReturnVacant!0 (x!76329 lt!404604) (index!37977 lt!404604) (index!37977 lt!404604) key!785 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)))))

(declare-fun d!110717 () Bool)

(declare-fun lt!404603 () SeekEntryResult!8901)

(assert (=> d!110717 (and (or ((_ is MissingVacant!8901) lt!404603) (not ((_ is Found!8901) lt!404603)) (and (bvsge (index!37976 lt!404603) #b00000000000000000000000000000000) (bvslt (index!37976 lt!404603) (size!25718 (_keys!10105 thiss!1181))))) (not ((_ is MissingVacant!8901) lt!404603)) (or (not ((_ is Found!8901) lt!404603)) (= (select (arr!25265 (_keys!10105 thiss!1181)) (index!37976 lt!404603)) key!785)))))

(declare-fun e!500952 () SeekEntryResult!8901)

(assert (=> d!110717 (= lt!404603 e!500952)))

(declare-fun c!94624 () Bool)

(assert (=> d!110717 (= c!94624 (and ((_ is Intermediate!8901) lt!404604) (undefined!9713 lt!404604)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52553 (_ BitVec 32)) SeekEntryResult!8901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110717 (= lt!404604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26010 thiss!1181)) key!785 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)))))

(assert (=> d!110717 (validMask!0 (mask!26010 thiss!1181))))

(assert (=> d!110717 (= (seekEntry!0 key!785 (_keys!10105 thiss!1181) (mask!26010 thiss!1181)) lt!404603)))

(declare-fun b!896244 () Bool)

(assert (=> b!896244 (= e!500952 Undefined!8901)))

(declare-fun b!896245 () Bool)

(assert (=> b!896245 (= e!500952 e!500951)))

(declare-fun lt!404605 () (_ BitVec 64))

(assert (=> b!896245 (= lt!404605 (select (arr!25265 (_keys!10105 thiss!1181)) (index!37977 lt!404604)))))

(declare-fun c!94626 () Bool)

(assert (=> b!896245 (= c!94626 (= lt!404605 key!785))))

(declare-fun b!896246 () Bool)

(declare-fun c!94625 () Bool)

(assert (=> b!896246 (= c!94625 (= lt!404605 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896246 (= e!500951 e!500950)))

(declare-fun b!896247 () Bool)

(assert (=> b!896247 (= e!500950 (MissingZero!8901 (index!37977 lt!404604)))))

(assert (= (and d!110717 c!94624) b!896244))

(assert (= (and d!110717 (not c!94624)) b!896245))

(assert (= (and b!896245 c!94626) b!896242))

(assert (= (and b!896245 (not c!94626)) b!896246))

(assert (= (and b!896246 c!94625) b!896247))

(assert (= (and b!896246 (not c!94625)) b!896243))

(declare-fun m!832903 () Bool)

(assert (=> b!896243 m!832903))

(declare-fun m!832905 () Bool)

(assert (=> d!110717 m!832905))

(declare-fun m!832907 () Bool)

(assert (=> d!110717 m!832907))

(assert (=> d!110717 m!832907))

(declare-fun m!832909 () Bool)

(assert (=> d!110717 m!832909))

(assert (=> d!110717 m!832837))

(declare-fun m!832911 () Bool)

(assert (=> b!896245 m!832911))

(assert (=> b!896166 d!110717))

(declare-fun d!110719 () Bool)

(assert (=> d!110719 (= (validMask!0 (mask!26010 thiss!1181)) (and (or (= (mask!26010 thiss!1181) #b00000000000000000000000000000111) (= (mask!26010 thiss!1181) #b00000000000000000000000000001111) (= (mask!26010 thiss!1181) #b00000000000000000000000000011111) (= (mask!26010 thiss!1181) #b00000000000000000000000000111111) (= (mask!26010 thiss!1181) #b00000000000000000000000001111111) (= (mask!26010 thiss!1181) #b00000000000000000000000011111111) (= (mask!26010 thiss!1181) #b00000000000000000000000111111111) (= (mask!26010 thiss!1181) #b00000000000000000000001111111111) (= (mask!26010 thiss!1181) #b00000000000000000000011111111111) (= (mask!26010 thiss!1181) #b00000000000000000000111111111111) (= (mask!26010 thiss!1181) #b00000000000000000001111111111111) (= (mask!26010 thiss!1181) #b00000000000000000011111111111111) (= (mask!26010 thiss!1181) #b00000000000000000111111111111111) (= (mask!26010 thiss!1181) #b00000000000000001111111111111111) (= (mask!26010 thiss!1181) #b00000000000000011111111111111111) (= (mask!26010 thiss!1181) #b00000000000000111111111111111111) (= (mask!26010 thiss!1181) #b00000000000001111111111111111111) (= (mask!26010 thiss!1181) #b00000000000011111111111111111111) (= (mask!26010 thiss!1181) #b00000000000111111111111111111111) (= (mask!26010 thiss!1181) #b00000000001111111111111111111111) (= (mask!26010 thiss!1181) #b00000000011111111111111111111111) (= (mask!26010 thiss!1181) #b00000000111111111111111111111111) (= (mask!26010 thiss!1181) #b00000001111111111111111111111111) (= (mask!26010 thiss!1181) #b00000011111111111111111111111111) (= (mask!26010 thiss!1181) #b00000111111111111111111111111111) (= (mask!26010 thiss!1181) #b00001111111111111111111111111111) (= (mask!26010 thiss!1181) #b00011111111111111111111111111111) (= (mask!26010 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26010 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!896162 d!110719))

(declare-fun d!110721 () Bool)

(declare-fun res!606063 () Bool)

(declare-fun e!500957 () Bool)

(assert (=> d!110721 (=> res!606063 e!500957)))

(assert (=> d!110721 (= res!606063 (= (select (arr!25265 (_keys!10105 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110721 (= (arrayContainsKey!0 (_keys!10105 thiss!1181) key!785 #b00000000000000000000000000000000) e!500957)))

(declare-fun b!896252 () Bool)

(declare-fun e!500958 () Bool)

(assert (=> b!896252 (= e!500957 e!500958)))

(declare-fun res!606064 () Bool)

(assert (=> b!896252 (=> (not res!606064) (not e!500958))))

(assert (=> b!896252 (= res!606064 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25718 (_keys!10105 thiss!1181))))))

(declare-fun b!896253 () Bool)

(assert (=> b!896253 (= e!500958 (arrayContainsKey!0 (_keys!10105 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110721 (not res!606063)) b!896252))

(assert (= (and b!896252 res!606064) b!896253))

(declare-fun m!832913 () Bool)

(assert (=> d!110721 m!832913))

(declare-fun m!832915 () Bool)

(assert (=> b!896253 m!832915))

(assert (=> b!896162 d!110721))

(declare-fun d!110723 () Bool)

(assert (=> d!110723 (arrayContainsKey!0 (_keys!10105 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!404609 () Unit!30426)

(declare-fun choose!13 (array!52553 (_ BitVec 64) (_ BitVec 32)) Unit!30426)

(assert (=> d!110723 (= lt!404609 (choose!13 (_keys!10105 thiss!1181) key!785 (index!37976 lt!404569)))))

(assert (=> d!110723 (bvsge (index!37976 lt!404569) #b00000000000000000000000000000000)))

(assert (=> d!110723 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10105 thiss!1181) key!785 (index!37976 lt!404569)) lt!404609)))

(declare-fun bs!25133 () Bool)

(assert (= bs!25133 d!110723))

(assert (=> bs!25133 m!832839))

(declare-fun m!832917 () Bool)

(assert (=> bs!25133 m!832917))

(assert (=> b!896162 d!110723))

(declare-fun d!110725 () Bool)

(assert (=> d!110725 (= (array_inv!19886 (_keys!10105 thiss!1181)) (bvsge (size!25718 (_keys!10105 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896168 d!110725))

(declare-fun d!110727 () Bool)

(assert (=> d!110727 (= (array_inv!19887 (_values!5369 thiss!1181)) (bvsge (size!25719 (_values!5369 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896168 d!110727))

(declare-fun mapIsEmpty!29042 () Bool)

(declare-fun mapRes!29042 () Bool)

(assert (=> mapIsEmpty!29042 mapRes!29042))

(declare-fun mapNonEmpty!29042 () Bool)

(declare-fun tp!55895 () Bool)

(declare-fun e!500964 () Bool)

(assert (=> mapNonEmpty!29042 (= mapRes!29042 (and tp!55895 e!500964))))

(declare-fun mapKey!29042 () (_ BitVec 32))

(declare-fun mapValue!29042 () ValueCell!8657)

(declare-fun mapRest!29042 () (Array (_ BitVec 32) ValueCell!8657))

(assert (=> mapNonEmpty!29042 (= mapRest!29033 (store mapRest!29042 mapKey!29042 mapValue!29042))))

(declare-fun b!896261 () Bool)

(declare-fun e!500963 () Bool)

(assert (=> b!896261 (= e!500963 tp_is_empty!18277)))

(declare-fun condMapEmpty!29042 () Bool)

(declare-fun mapDefault!29042 () ValueCell!8657)

(assert (=> mapNonEmpty!29033 (= condMapEmpty!29042 (= mapRest!29033 ((as const (Array (_ BitVec 32) ValueCell!8657)) mapDefault!29042)))))

(assert (=> mapNonEmpty!29033 (= tp!55880 (and e!500963 mapRes!29042))))

(declare-fun b!896260 () Bool)

(assert (=> b!896260 (= e!500964 tp_is_empty!18277)))

(assert (= (and mapNonEmpty!29033 condMapEmpty!29042) mapIsEmpty!29042))

(assert (= (and mapNonEmpty!29033 (not condMapEmpty!29042)) mapNonEmpty!29042))

(assert (= (and mapNonEmpty!29042 ((_ is ValueCellFull!8657) mapValue!29042)) b!896260))

(assert (= (and mapNonEmpty!29033 ((_ is ValueCellFull!8657) mapDefault!29042)) b!896261))

(declare-fun m!832919 () Bool)

(assert (=> mapNonEmpty!29042 m!832919))

(check-sat (not b!896225) tp_is_empty!18277 (not d!110717) (not b!896243) (not b!896229) (not b_next!15949) (not mapNonEmpty!29042) (not d!110723) (not b!896226) b_and!26215 (not d!110715) (not b!896224) (not b!896253) (not d!110713))
(check-sat b_and!26215 (not b_next!15949))
