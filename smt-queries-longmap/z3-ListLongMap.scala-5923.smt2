; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77218 () Bool)

(assert start!77218)

(declare-fun b!900754 () Bool)

(declare-fun b_free!16039 () Bool)

(declare-fun b_next!16039 () Bool)

(assert (=> b!900754 (= b_free!16039 (not b_next!16039))))

(declare-fun tp!56201 () Bool)

(declare-fun b_and!26363 () Bool)

(assert (=> b!900754 (= tp!56201 b_and!26363)))

(declare-fun b!900746 () Bool)

(declare-fun e!504136 () Bool)

(declare-fun e!504140 () Bool)

(declare-fun mapRes!29220 () Bool)

(assert (=> b!900746 (= e!504136 (and e!504140 mapRes!29220))))

(declare-fun condMapEmpty!29220 () Bool)

(declare-datatypes ((array!52819 0))(
  ( (array!52820 (arr!25378 (Array (_ BitVec 32) (_ BitVec 64))) (size!25837 (_ BitVec 32))) )
))
(declare-datatypes ((V!29455 0))(
  ( (V!29456 (val!9234 Int)) )
))
(declare-datatypes ((ValueCell!8702 0))(
  ( (ValueCellFull!8702 (v!11726 V!29455)) (EmptyCell!8702) )
))
(declare-datatypes ((array!52821 0))(
  ( (array!52822 (arr!25379 (Array (_ BitVec 32) ValueCell!8702)) (size!25838 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4420 0))(
  ( (LongMapFixedSize!4421 (defaultEntry!5438 Int) (mask!26250 (_ BitVec 32)) (extraKeys!5161 (_ BitVec 32)) (zeroValue!5265 V!29455) (minValue!5265 V!29455) (_size!2265 (_ BitVec 32)) (_keys!10261 array!52819) (_values!5452 array!52821) (_vacant!2265 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4420)

(declare-fun mapDefault!29220 () ValueCell!8702)

(assert (=> b!900746 (= condMapEmpty!29220 (= (arr!25379 (_values!5452 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29220)))))

(declare-fun mapNonEmpty!29220 () Bool)

(declare-fun tp!56202 () Bool)

(declare-fun e!504142 () Bool)

(assert (=> mapNonEmpty!29220 (= mapRes!29220 (and tp!56202 e!504142))))

(declare-fun mapKey!29220 () (_ BitVec 32))

(declare-fun mapValue!29220 () ValueCell!8702)

(declare-fun mapRest!29220 () (Array (_ BitVec 32) ValueCell!8702))

(assert (=> mapNonEmpty!29220 (= (arr!25379 (_values!5452 thiss!1181)) (store mapRest!29220 mapKey!29220 mapValue!29220))))

(declare-fun b!900748 () Bool)

(declare-fun e!504138 () Bool)

(assert (=> b!900748 (= e!504138 (or (not (= (size!25838 (_values!5452 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26250 thiss!1181)))) (not (= (size!25837 (_keys!10261 thiss!1181)) (size!25838 (_values!5452 thiss!1181)))) (bvslt (mask!26250 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5161 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5161 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!900749 () Bool)

(declare-fun tp_is_empty!18367 () Bool)

(assert (=> b!900749 (= e!504142 tp_is_empty!18367)))

(declare-fun b!900750 () Bool)

(declare-fun e!504137 () Bool)

(assert (=> b!900750 (= e!504137 e!504138)))

(declare-fun res!608144 () Bool)

(assert (=> b!900750 (=> res!608144 e!504138)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!900750 (= res!608144 (not (validMask!0 (mask!26250 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8889 0))(
  ( (MissingZero!8889 (index!37927 (_ BitVec 32))) (Found!8889 (index!37928 (_ BitVec 32))) (Intermediate!8889 (undefined!9701 Bool) (index!37929 (_ BitVec 32)) (x!76646 (_ BitVec 32))) (Undefined!8889) (MissingVacant!8889 (index!37930 (_ BitVec 32))) )
))
(declare-fun lt!406846 () SeekEntryResult!8889)

(declare-datatypes ((tuple2!11968 0))(
  ( (tuple2!11969 (_1!5995 (_ BitVec 64)) (_2!5995 V!29455)) )
))
(declare-datatypes ((List!17803 0))(
  ( (Nil!17800) (Cons!17799 (h!18950 tuple2!11968) (t!25144 List!17803)) )
))
(declare-datatypes ((ListLongMap!10667 0))(
  ( (ListLongMap!10668 (toList!5349 List!17803)) )
))
(declare-fun contains!4396 (ListLongMap!10667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2621 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) ListLongMap!10667)

(assert (=> b!900750 (contains!4396 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))

(declare-datatypes ((Unit!30568 0))(
  ( (Unit!30569) )
))
(declare-fun lt!406845 () Unit!30568)

(declare-fun lemmaValidKeyInArrayIsInListMap!251 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) Unit!30568)

(assert (=> b!900750 (= lt!406845 (lemmaValidKeyInArrayIsInListMap!251 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!37928 lt!406846) (defaultEntry!5438 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52819 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!900750 (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406844 () Unit!30568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52819 (_ BitVec 64) (_ BitVec 32)) Unit!30568)

(assert (=> b!900750 (= lt!406844 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10261 thiss!1181) key!785 (index!37928 lt!406846)))))

(declare-fun b!900751 () Bool)

(assert (=> b!900751 (= e!504140 tp_is_empty!18367)))

(declare-fun b!900752 () Bool)

(declare-fun res!608141 () Bool)

(declare-fun e!504139 () Bool)

(assert (=> b!900752 (=> (not res!608141) (not e!504139))))

(assert (=> b!900752 (= res!608141 (not (= key!785 (bvneg key!785))))))

(declare-fun b!900753 () Bool)

(assert (=> b!900753 (= e!504139 (not e!504137))))

(declare-fun res!608143 () Bool)

(assert (=> b!900753 (=> res!608143 e!504137)))

(get-info :version)

(assert (=> b!900753 (= res!608143 (not ((_ is Found!8889) lt!406846)))))

(declare-fun e!504143 () Bool)

(assert (=> b!900753 e!504143))

(declare-fun res!608140 () Bool)

(assert (=> b!900753 (=> res!608140 e!504143)))

(assert (=> b!900753 (= res!608140 (not ((_ is Found!8889) lt!406846)))))

(declare-fun lt!406847 () Unit!30568)

(declare-fun lemmaSeekEntryGivesInRangeIndex!109 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> b!900753 (= lt!406847 (lemmaSeekEntryGivesInRangeIndex!109 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52819 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!900753 (= lt!406846 (seekEntry!0 key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun e!504141 () Bool)

(declare-fun array_inv!19966 (array!52819) Bool)

(declare-fun array_inv!19967 (array!52821) Bool)

(assert (=> b!900754 (= e!504141 (and tp!56201 tp_is_empty!18367 (array_inv!19966 (_keys!10261 thiss!1181)) (array_inv!19967 (_values!5452 thiss!1181)) e!504136))))

(declare-fun mapIsEmpty!29220 () Bool)

(assert (=> mapIsEmpty!29220 mapRes!29220))

(declare-fun b!900747 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!900747 (= e!504143 (inRange!0 (index!37928 lt!406846) (mask!26250 thiss!1181)))))

(declare-fun res!608142 () Bool)

(assert (=> start!77218 (=> (not res!608142) (not e!504139))))

(declare-fun valid!1710 (LongMapFixedSize!4420) Bool)

(assert (=> start!77218 (= res!608142 (valid!1710 thiss!1181))))

(assert (=> start!77218 e!504139))

(assert (=> start!77218 e!504141))

(assert (=> start!77218 true))

(assert (= (and start!77218 res!608142) b!900752))

(assert (= (and b!900752 res!608141) b!900753))

(assert (= (and b!900753 (not res!608140)) b!900747))

(assert (= (and b!900753 (not res!608143)) b!900750))

(assert (= (and b!900750 (not res!608144)) b!900748))

(assert (= (and b!900746 condMapEmpty!29220) mapIsEmpty!29220))

(assert (= (and b!900746 (not condMapEmpty!29220)) mapNonEmpty!29220))

(assert (= (and mapNonEmpty!29220 ((_ is ValueCellFull!8702) mapValue!29220)) b!900749))

(assert (= (and b!900746 ((_ is ValueCellFull!8702) mapDefault!29220)) b!900751))

(assert (= b!900754 b!900746))

(assert (= start!77218 b!900754))

(declare-fun m!837615 () Bool)

(assert (=> b!900750 m!837615))

(declare-fun m!837617 () Bool)

(assert (=> b!900750 m!837617))

(declare-fun m!837619 () Bool)

(assert (=> b!900750 m!837619))

(declare-fun m!837621 () Bool)

(assert (=> b!900750 m!837621))

(declare-fun m!837623 () Bool)

(assert (=> b!900750 m!837623))

(declare-fun m!837625 () Bool)

(assert (=> b!900750 m!837625))

(assert (=> b!900750 m!837623))

(assert (=> b!900750 m!837625))

(declare-fun m!837627 () Bool)

(assert (=> b!900750 m!837627))

(declare-fun m!837629 () Bool)

(assert (=> mapNonEmpty!29220 m!837629))

(declare-fun m!837631 () Bool)

(assert (=> b!900754 m!837631))

(declare-fun m!837633 () Bool)

(assert (=> b!900754 m!837633))

(declare-fun m!837635 () Bool)

(assert (=> start!77218 m!837635))

(declare-fun m!837637 () Bool)

(assert (=> b!900753 m!837637))

(declare-fun m!837639 () Bool)

(assert (=> b!900753 m!837639))

(declare-fun m!837641 () Bool)

(assert (=> b!900747 m!837641))

(check-sat (not b_next!16039) (not start!77218) (not mapNonEmpty!29220) tp_is_empty!18367 (not b!900747) (not b!900753) (not b!900754) b_and!26363 (not b!900750))
(check-sat b_and!26363 (not b_next!16039))
(get-model)

(declare-fun d!111917 () Bool)

(declare-fun e!504200 () Bool)

(assert (=> d!111917 e!504200))

(declare-fun res!608177 () Bool)

(assert (=> d!111917 (=> res!608177 e!504200)))

(declare-fun lt!406877 () SeekEntryResult!8889)

(assert (=> d!111917 (= res!608177 (not ((_ is Found!8889) lt!406877)))))

(assert (=> d!111917 (= lt!406877 (seekEntry!0 key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun lt!406876 () Unit!30568)

(declare-fun choose!1513 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> d!111917 (= lt!406876 (choose!1513 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785))))

(assert (=> d!111917 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111917 (= (lemmaSeekEntryGivesInRangeIndex!109 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785) lt!406876)))

(declare-fun b!900811 () Bool)

(assert (=> b!900811 (= e!504200 (inRange!0 (index!37928 lt!406877) (mask!26250 thiss!1181)))))

(assert (= (and d!111917 (not res!608177)) b!900811))

(assert (=> d!111917 m!837639))

(declare-fun m!837699 () Bool)

(assert (=> d!111917 m!837699))

(assert (=> d!111917 m!837621))

(declare-fun m!837701 () Bool)

(assert (=> b!900811 m!837701))

(assert (=> b!900753 d!111917))

(declare-fun b!900824 () Bool)

(declare-fun e!504207 () SeekEntryResult!8889)

(declare-fun lt!406889 () SeekEntryResult!8889)

(assert (=> b!900824 (= e!504207 (Found!8889 (index!37929 lt!406889)))))

(declare-fun b!900825 () Bool)

(declare-fun e!504209 () SeekEntryResult!8889)

(assert (=> b!900825 (= e!504209 (MissingZero!8889 (index!37929 lt!406889)))))

(declare-fun d!111919 () Bool)

(declare-fun lt!406888 () SeekEntryResult!8889)

(assert (=> d!111919 (and (or ((_ is MissingVacant!8889) lt!406888) (not ((_ is Found!8889) lt!406888)) (and (bvsge (index!37928 lt!406888) #b00000000000000000000000000000000) (bvslt (index!37928 lt!406888) (size!25837 (_keys!10261 thiss!1181))))) (not ((_ is MissingVacant!8889) lt!406888)) (or (not ((_ is Found!8889) lt!406888)) (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406888)) key!785)))))

(declare-fun e!504208 () SeekEntryResult!8889)

(assert (=> d!111919 (= lt!406888 e!504208)))

(declare-fun c!95517 () Bool)

(assert (=> d!111919 (= c!95517 (and ((_ is Intermediate!8889) lt!406889) (undefined!9701 lt!406889)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52819 (_ BitVec 32)) SeekEntryResult!8889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111919 (= lt!406889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26250 thiss!1181)) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(assert (=> d!111919 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111919 (= (seekEntry!0 key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)) lt!406888)))

(declare-fun b!900826 () Bool)

(assert (=> b!900826 (= e!504208 Undefined!8889)))

(declare-fun b!900827 () Bool)

(declare-fun lt!406886 () SeekEntryResult!8889)

(assert (=> b!900827 (= e!504209 (ite ((_ is MissingVacant!8889) lt!406886) (MissingZero!8889 (index!37930 lt!406886)) lt!406886))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52819 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!900827 (= lt!406886 (seekKeyOrZeroReturnVacant!0 (x!76646 lt!406889) (index!37929 lt!406889) (index!37929 lt!406889) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900828 () Bool)

(assert (=> b!900828 (= e!504208 e!504207)))

(declare-fun lt!406887 () (_ BitVec 64))

(assert (=> b!900828 (= lt!406887 (select (arr!25378 (_keys!10261 thiss!1181)) (index!37929 lt!406889)))))

(declare-fun c!95518 () Bool)

(assert (=> b!900828 (= c!95518 (= lt!406887 key!785))))

(declare-fun b!900829 () Bool)

(declare-fun c!95519 () Bool)

(assert (=> b!900829 (= c!95519 (= lt!406887 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900829 (= e!504207 e!504209)))

(assert (= (and d!111919 c!95517) b!900826))

(assert (= (and d!111919 (not c!95517)) b!900828))

(assert (= (and b!900828 c!95518) b!900824))

(assert (= (and b!900828 (not c!95518)) b!900829))

(assert (= (and b!900829 c!95519) b!900825))

(assert (= (and b!900829 (not c!95519)) b!900827))

(declare-fun m!837703 () Bool)

(assert (=> d!111919 m!837703))

(declare-fun m!837705 () Bool)

(assert (=> d!111919 m!837705))

(assert (=> d!111919 m!837705))

(declare-fun m!837707 () Bool)

(assert (=> d!111919 m!837707))

(assert (=> d!111919 m!837621))

(declare-fun m!837709 () Bool)

(assert (=> b!900827 m!837709))

(declare-fun m!837711 () Bool)

(assert (=> b!900828 m!837711))

(assert (=> b!900753 d!111919))

(declare-fun d!111921 () Bool)

(assert (=> d!111921 (= (inRange!0 (index!37928 lt!406846) (mask!26250 thiss!1181)) (and (bvsge (index!37928 lt!406846) #b00000000000000000000000000000000) (bvslt (index!37928 lt!406846) (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900747 d!111921))

(declare-fun d!111923 () Bool)

(assert (=> d!111923 (= (validMask!0 (mask!26250 thiss!1181)) (and (or (= (mask!26250 thiss!1181) #b00000000000000000000000000000111) (= (mask!26250 thiss!1181) #b00000000000000000000000000001111) (= (mask!26250 thiss!1181) #b00000000000000000000000000011111) (= (mask!26250 thiss!1181) #b00000000000000000000000000111111) (= (mask!26250 thiss!1181) #b00000000000000000000000001111111) (= (mask!26250 thiss!1181) #b00000000000000000000000011111111) (= (mask!26250 thiss!1181) #b00000000000000000000000111111111) (= (mask!26250 thiss!1181) #b00000000000000000000001111111111) (= (mask!26250 thiss!1181) #b00000000000000000000011111111111) (= (mask!26250 thiss!1181) #b00000000000000000000111111111111) (= (mask!26250 thiss!1181) #b00000000000000000001111111111111) (= (mask!26250 thiss!1181) #b00000000000000000011111111111111) (= (mask!26250 thiss!1181) #b00000000000000000111111111111111) (= (mask!26250 thiss!1181) #b00000000000000001111111111111111) (= (mask!26250 thiss!1181) #b00000000000000011111111111111111) (= (mask!26250 thiss!1181) #b00000000000000111111111111111111) (= (mask!26250 thiss!1181) #b00000000000001111111111111111111) (= (mask!26250 thiss!1181) #b00000000000011111111111111111111) (= (mask!26250 thiss!1181) #b00000000000111111111111111111111) (= (mask!26250 thiss!1181) #b00000000001111111111111111111111) (= (mask!26250 thiss!1181) #b00000000011111111111111111111111) (= (mask!26250 thiss!1181) #b00000000111111111111111111111111) (= (mask!26250 thiss!1181) #b00000001111111111111111111111111) (= (mask!26250 thiss!1181) #b00000011111111111111111111111111) (= (mask!26250 thiss!1181) #b00000111111111111111111111111111) (= (mask!26250 thiss!1181) #b00001111111111111111111111111111) (= (mask!26250 thiss!1181) #b00011111111111111111111111111111) (= (mask!26250 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26250 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!900750 d!111923))

(declare-fun d!111925 () Bool)

(declare-fun e!504212 () Bool)

(assert (=> d!111925 e!504212))

(declare-fun res!608180 () Bool)

(assert (=> d!111925 (=> (not res!608180) (not e!504212))))

(assert (=> d!111925 (= res!608180 (and (bvsge (index!37928 lt!406846) #b00000000000000000000000000000000) (bvslt (index!37928 lt!406846) (size!25837 (_keys!10261 thiss!1181)))))))

(declare-fun lt!406892 () Unit!30568)

(declare-fun choose!1514 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) Unit!30568)

(assert (=> d!111925 (= lt!406892 (choose!1514 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!37928 lt!406846) (defaultEntry!5438 thiss!1181)))))

(assert (=> d!111925 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111925 (= (lemmaValidKeyInArrayIsInListMap!251 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!37928 lt!406846) (defaultEntry!5438 thiss!1181)) lt!406892)))

(declare-fun b!900832 () Bool)

(assert (=> b!900832 (= e!504212 (contains!4396 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(assert (= (and d!111925 res!608180) b!900832))

(declare-fun m!837713 () Bool)

(assert (=> d!111925 m!837713))

(assert (=> d!111925 m!837621))

(assert (=> b!900832 m!837623))

(assert (=> b!900832 m!837625))

(assert (=> b!900832 m!837623))

(assert (=> b!900832 m!837625))

(assert (=> b!900832 m!837627))

(assert (=> b!900750 d!111925))

(declare-fun d!111927 () Bool)

(declare-fun e!504217 () Bool)

(assert (=> d!111927 e!504217))

(declare-fun res!608183 () Bool)

(assert (=> d!111927 (=> res!608183 e!504217)))

(declare-fun lt!406903 () Bool)

(assert (=> d!111927 (= res!608183 (not lt!406903))))

(declare-fun lt!406904 () Bool)

(assert (=> d!111927 (= lt!406903 lt!406904)))

(declare-fun lt!406902 () Unit!30568)

(declare-fun e!504218 () Unit!30568)

(assert (=> d!111927 (= lt!406902 e!504218)))

(declare-fun c!95522 () Bool)

(assert (=> d!111927 (= c!95522 lt!406904)))

(declare-fun containsKey!431 (List!17803 (_ BitVec 64)) Bool)

(assert (=> d!111927 (= lt!406904 (containsKey!431 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(assert (=> d!111927 (= (contains!4396 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))) lt!406903)))

(declare-fun b!900839 () Bool)

(declare-fun lt!406901 () Unit!30568)

(assert (=> b!900839 (= e!504218 lt!406901)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!325 (List!17803 (_ BitVec 64)) Unit!30568)

(assert (=> b!900839 (= lt!406901 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(declare-datatypes ((Option!464 0))(
  ( (Some!463 (v!11729 V!29455)) (None!462) )
))
(declare-fun isDefined!333 (Option!464) Bool)

(declare-fun getValueByKey!458 (List!17803 (_ BitVec 64)) Option!464)

(assert (=> b!900839 (isDefined!333 (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(declare-fun b!900840 () Bool)

(declare-fun Unit!30574 () Unit!30568)

(assert (=> b!900840 (= e!504218 Unit!30574)))

(declare-fun b!900841 () Bool)

(assert (=> b!900841 (= e!504217 (isDefined!333 (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))))

(assert (= (and d!111927 c!95522) b!900839))

(assert (= (and d!111927 (not c!95522)) b!900840))

(assert (= (and d!111927 (not res!608183)) b!900841))

(assert (=> d!111927 m!837625))

(declare-fun m!837715 () Bool)

(assert (=> d!111927 m!837715))

(assert (=> b!900839 m!837625))

(declare-fun m!837717 () Bool)

(assert (=> b!900839 m!837717))

(assert (=> b!900839 m!837625))

(declare-fun m!837719 () Bool)

(assert (=> b!900839 m!837719))

(assert (=> b!900839 m!837719))

(declare-fun m!837721 () Bool)

(assert (=> b!900839 m!837721))

(assert (=> b!900841 m!837625))

(assert (=> b!900841 m!837719))

(assert (=> b!900841 m!837719))

(assert (=> b!900841 m!837721))

(assert (=> b!900750 d!111927))

(declare-fun d!111929 () Bool)

(assert (=> d!111929 (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!406907 () Unit!30568)

(declare-fun choose!13 (array!52819 (_ BitVec 64) (_ BitVec 32)) Unit!30568)

(assert (=> d!111929 (= lt!406907 (choose!13 (_keys!10261 thiss!1181) key!785 (index!37928 lt!406846)))))

(assert (=> d!111929 (bvsge (index!37928 lt!406846) #b00000000000000000000000000000000)))

(assert (=> d!111929 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10261 thiss!1181) key!785 (index!37928 lt!406846)) lt!406907)))

(declare-fun bs!25282 () Bool)

(assert (= bs!25282 d!111929))

(assert (=> bs!25282 m!837617))

(declare-fun m!837723 () Bool)

(assert (=> bs!25282 m!837723))

(assert (=> b!900750 d!111929))

(declare-fun d!111931 () Bool)

(declare-fun res!608188 () Bool)

(declare-fun e!504223 () Bool)

(assert (=> d!111931 (=> res!608188 e!504223)))

(assert (=> d!111931 (= res!608188 (= (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111931 (= (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 #b00000000000000000000000000000000) e!504223)))

(declare-fun b!900846 () Bool)

(declare-fun e!504224 () Bool)

(assert (=> b!900846 (= e!504223 e!504224)))

(declare-fun res!608189 () Bool)

(assert (=> b!900846 (=> (not res!608189) (not e!504224))))

(assert (=> b!900846 (= res!608189 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun b!900847 () Bool)

(assert (=> b!900847 (= e!504224 (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111931 (not res!608188)) b!900846))

(assert (= (and b!900846 res!608189) b!900847))

(declare-fun m!837725 () Bool)

(assert (=> d!111931 m!837725))

(declare-fun m!837727 () Bool)

(assert (=> b!900847 m!837727))

(assert (=> b!900750 d!111931))

(declare-fun b!900890 () Bool)

(declare-fun res!608215 () Bool)

(declare-fun e!504254 () Bool)

(assert (=> b!900890 (=> (not res!608215) (not e!504254))))

(declare-fun e!504252 () Bool)

(assert (=> b!900890 (= res!608215 e!504252)))

(declare-fun c!95539 () Bool)

(assert (=> b!900890 (= c!95539 (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!900891 () Bool)

(declare-fun call!40037 () Bool)

(assert (=> b!900891 (= e!504252 (not call!40037))))

(declare-fun b!900892 () Bool)

(declare-fun e!504251 () Bool)

(declare-fun e!504260 () Bool)

(assert (=> b!900892 (= e!504251 e!504260)))

(declare-fun res!608213 () Bool)

(assert (=> b!900892 (=> (not res!608213) (not e!504260))))

(declare-fun lt!406969 () ListLongMap!10667)

(assert (=> b!900892 (= res!608213 (contains!4396 lt!406969 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!900892 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun b!900893 () Bool)

(declare-fun e!504259 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!900893 (= e!504259 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900894 () Bool)

(declare-fun e!504256 () Bool)

(assert (=> b!900894 (= e!504256 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900895 () Bool)

(declare-fun e!504263 () ListLongMap!10667)

(declare-fun call!40036 () ListLongMap!10667)

(assert (=> b!900895 (= e!504263 call!40036)))

(declare-fun b!900896 () Bool)

(declare-fun apply!410 (ListLongMap!10667 (_ BitVec 64)) V!29455)

(declare-fun get!13364 (ValueCell!8702 V!29455) V!29455)

(declare-fun dynLambda!1325 (Int (_ BitVec 64)) V!29455)

(assert (=> b!900896 (= e!504260 (= (apply!410 lt!406969 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)) (get!13364 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25838 (_values!5452 thiss!1181))))))

(assert (=> b!900896 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun b!900897 () Bool)

(declare-fun res!608209 () Bool)

(assert (=> b!900897 (=> (not res!608209) (not e!504254))))

(assert (=> b!900897 (= res!608209 e!504251)))

(declare-fun res!608216 () Bool)

(assert (=> b!900897 (=> res!608216 e!504251)))

(assert (=> b!900897 (= res!608216 (not e!504259))))

(declare-fun res!608214 () Bool)

(assert (=> b!900897 (=> (not res!608214) (not e!504259))))

(assert (=> b!900897 (= res!608214 (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun bm!40033 () Bool)

(declare-fun call!40039 () ListLongMap!10667)

(assert (=> bm!40033 (= call!40036 call!40039)))

(declare-fun b!900898 () Bool)

(declare-fun e!504255 () Unit!30568)

(declare-fun lt!406957 () Unit!30568)

(assert (=> b!900898 (= e!504255 lt!406957)))

(declare-fun lt!406958 () ListLongMap!10667)

(declare-fun getCurrentListMapNoExtraKeys!3326 (array!52819 array!52821 (_ BitVec 32) (_ BitVec 32) V!29455 V!29455 (_ BitVec 32) Int) ListLongMap!10667)

(assert (=> b!900898 (= lt!406958 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406963 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406963 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406955 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406955 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406965 () Unit!30568)

(declare-fun addStillContains!336 (ListLongMap!10667 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> b!900898 (= lt!406965 (addStillContains!336 lt!406958 lt!406963 (zeroValue!5265 thiss!1181) lt!406955))))

(declare-fun +!2605 (ListLongMap!10667 tuple2!11968) ListLongMap!10667)

(assert (=> b!900898 (contains!4396 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) lt!406955)))

(declare-fun lt!406961 () Unit!30568)

(assert (=> b!900898 (= lt!406961 lt!406965)))

(declare-fun lt!406959 () ListLongMap!10667)

(assert (=> b!900898 (= lt!406959 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406964 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406973 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406973 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406962 () Unit!30568)

(declare-fun addApplyDifferent!336 (ListLongMap!10667 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> b!900898 (= lt!406962 (addApplyDifferent!336 lt!406959 lt!406964 (minValue!5265 thiss!1181) lt!406973))))

(assert (=> b!900898 (= (apply!410 (+!2605 lt!406959 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) lt!406973) (apply!410 lt!406959 lt!406973))))

(declare-fun lt!406968 () Unit!30568)

(assert (=> b!900898 (= lt!406968 lt!406962)))

(declare-fun lt!406952 () ListLongMap!10667)

(assert (=> b!900898 (= lt!406952 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406970 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406956 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406956 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!406966 () Unit!30568)

(assert (=> b!900898 (= lt!406966 (addApplyDifferent!336 lt!406952 lt!406970 (zeroValue!5265 thiss!1181) lt!406956))))

(assert (=> b!900898 (= (apply!410 (+!2605 lt!406952 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) lt!406956) (apply!410 lt!406952 lt!406956))))

(declare-fun lt!406954 () Unit!30568)

(assert (=> b!900898 (= lt!406954 lt!406966)))

(declare-fun lt!406972 () ListLongMap!10667)

(assert (=> b!900898 (= lt!406972 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun lt!406971 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406971 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!406960 () (_ BitVec 64))

(assert (=> b!900898 (= lt!406960 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900898 (= lt!406957 (addApplyDifferent!336 lt!406972 lt!406971 (minValue!5265 thiss!1181) lt!406960))))

(assert (=> b!900898 (= (apply!410 (+!2605 lt!406972 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) lt!406960) (apply!410 lt!406972 lt!406960))))

(declare-fun b!900899 () Bool)

(declare-fun e!504261 () ListLongMap!10667)

(assert (=> b!900899 (= e!504261 call!40036)))

(declare-fun b!900900 () Bool)

(declare-fun call!40040 () ListLongMap!10667)

(assert (=> b!900900 (= e!504261 call!40040)))

(declare-fun bm!40034 () Bool)

(assert (=> bm!40034 (= call!40037 (contains!4396 lt!406969 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun c!95536 () Bool)

(declare-fun c!95540 () Bool)

(declare-fun bm!40035 () Bool)

(declare-fun call!40042 () ListLongMap!10667)

(declare-fun call!40041 () ListLongMap!10667)

(assert (=> bm!40035 (= call!40039 (+!2605 (ite c!95536 call!40041 (ite c!95540 call!40042 call!40040)) (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(declare-fun bm!40036 () Bool)

(assert (=> bm!40036 (= call!40040 call!40042)))

(declare-fun d!111933 () Bool)

(assert (=> d!111933 e!504254))

(declare-fun res!608210 () Bool)

(assert (=> d!111933 (=> (not res!608210) (not e!504254))))

(assert (=> d!111933 (= res!608210 (or (bvsge #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))))

(declare-fun lt!406967 () ListLongMap!10667)

(assert (=> d!111933 (= lt!406969 lt!406967)))

(declare-fun lt!406953 () Unit!30568)

(assert (=> d!111933 (= lt!406953 e!504255)))

(declare-fun c!95535 () Bool)

(assert (=> d!111933 (= c!95535 e!504256)))

(declare-fun res!608208 () Bool)

(assert (=> d!111933 (=> (not res!608208) (not e!504256))))

(assert (=> d!111933 (= res!608208 (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun e!504262 () ListLongMap!10667)

(assert (=> d!111933 (= lt!406967 e!504262)))

(assert (=> d!111933 (= c!95536 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!111933 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111933 (= (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) lt!406969)))

(declare-fun b!900901 () Bool)

(declare-fun c!95538 () Bool)

(assert (=> b!900901 (= c!95538 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!900901 (= e!504263 e!504261)))

(declare-fun b!900902 () Bool)

(assert (=> b!900902 (= e!504262 (+!2605 call!40039 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))

(declare-fun b!900903 () Bool)

(declare-fun e!504253 () Bool)

(assert (=> b!900903 (= e!504253 (= (apply!410 lt!406969 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5265 thiss!1181)))))

(declare-fun bm!40037 () Bool)

(assert (=> bm!40037 (= call!40042 call!40041)))

(declare-fun b!900904 () Bool)

(assert (=> b!900904 (= e!504262 e!504263)))

(assert (=> b!900904 (= c!95540 (and (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900905 () Bool)

(declare-fun e!504258 () Bool)

(assert (=> b!900905 (= e!504254 e!504258)))

(declare-fun c!95537 () Bool)

(assert (=> b!900905 (= c!95537 (not (= (bvand (extraKeys!5161 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!900906 () Bool)

(declare-fun Unit!30575 () Unit!30568)

(assert (=> b!900906 (= e!504255 Unit!30575)))

(declare-fun b!900907 () Bool)

(declare-fun call!40038 () Bool)

(assert (=> b!900907 (= e!504258 (not call!40038))))

(declare-fun b!900908 () Bool)

(assert (=> b!900908 (= e!504258 e!504253)))

(declare-fun res!608212 () Bool)

(assert (=> b!900908 (= res!608212 call!40038)))

(assert (=> b!900908 (=> (not res!608212) (not e!504253))))

(declare-fun bm!40038 () Bool)

(assert (=> bm!40038 (= call!40041 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))

(declare-fun b!900909 () Bool)

(declare-fun e!504257 () Bool)

(assert (=> b!900909 (= e!504257 (= (apply!410 lt!406969 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5265 thiss!1181)))))

(declare-fun b!900910 () Bool)

(assert (=> b!900910 (= e!504252 e!504257)))

(declare-fun res!608211 () Bool)

(assert (=> b!900910 (= res!608211 call!40037)))

(assert (=> b!900910 (=> (not res!608211) (not e!504257))))

(declare-fun bm!40039 () Bool)

(assert (=> bm!40039 (= call!40038 (contains!4396 lt!406969 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111933 c!95536) b!900902))

(assert (= (and d!111933 (not c!95536)) b!900904))

(assert (= (and b!900904 c!95540) b!900895))

(assert (= (and b!900904 (not c!95540)) b!900901))

(assert (= (and b!900901 c!95538) b!900899))

(assert (= (and b!900901 (not c!95538)) b!900900))

(assert (= (or b!900899 b!900900) bm!40036))

(assert (= (or b!900895 bm!40036) bm!40037))

(assert (= (or b!900895 b!900899) bm!40033))

(assert (= (or b!900902 bm!40037) bm!40038))

(assert (= (or b!900902 bm!40033) bm!40035))

(assert (= (and d!111933 res!608208) b!900894))

(assert (= (and d!111933 c!95535) b!900898))

(assert (= (and d!111933 (not c!95535)) b!900906))

(assert (= (and d!111933 res!608210) b!900897))

(assert (= (and b!900897 res!608214) b!900893))

(assert (= (and b!900897 (not res!608216)) b!900892))

(assert (= (and b!900892 res!608213) b!900896))

(assert (= (and b!900897 res!608209) b!900890))

(assert (= (and b!900890 c!95539) b!900910))

(assert (= (and b!900890 (not c!95539)) b!900891))

(assert (= (and b!900910 res!608211) b!900909))

(assert (= (or b!900910 b!900891) bm!40034))

(assert (= (and b!900890 res!608215) b!900905))

(assert (= (and b!900905 c!95537) b!900908))

(assert (= (and b!900905 (not c!95537)) b!900907))

(assert (= (and b!900908 res!608212) b!900903))

(assert (= (or b!900908 b!900907) bm!40039))

(declare-fun b_lambda!13017 () Bool)

(assert (=> (not b_lambda!13017) (not b!900896)))

(declare-fun t!25148 () Bool)

(declare-fun tb!5193 () Bool)

(assert (=> (and b!900754 (= (defaultEntry!5438 thiss!1181) (defaultEntry!5438 thiss!1181)) t!25148) tb!5193))

(declare-fun result!10167 () Bool)

(assert (=> tb!5193 (= result!10167 tp_is_empty!18367)))

(assert (=> b!900896 t!25148))

(declare-fun b_and!26369 () Bool)

(assert (= b_and!26363 (and (=> t!25148 result!10167) b_and!26369)))

(declare-fun m!837729 () Bool)

(assert (=> b!900903 m!837729))

(declare-fun m!837731 () Bool)

(assert (=> bm!40034 m!837731))

(declare-fun m!837733 () Bool)

(assert (=> bm!40039 m!837733))

(assert (=> d!111933 m!837621))

(declare-fun m!837735 () Bool)

(assert (=> bm!40038 m!837735))

(declare-fun m!837737 () Bool)

(assert (=> b!900896 m!837737))

(declare-fun m!837739 () Bool)

(assert (=> b!900896 m!837739))

(declare-fun m!837741 () Bool)

(assert (=> b!900896 m!837741))

(assert (=> b!900896 m!837737))

(assert (=> b!900896 m!837725))

(assert (=> b!900896 m!837739))

(assert (=> b!900896 m!837725))

(declare-fun m!837743 () Bool)

(assert (=> b!900896 m!837743))

(declare-fun m!837745 () Bool)

(assert (=> b!900909 m!837745))

(assert (=> b!900893 m!837725))

(assert (=> b!900893 m!837725))

(declare-fun m!837747 () Bool)

(assert (=> b!900893 m!837747))

(declare-fun m!837749 () Bool)

(assert (=> bm!40035 m!837749))

(assert (=> b!900894 m!837725))

(assert (=> b!900894 m!837725))

(assert (=> b!900894 m!837747))

(declare-fun m!837751 () Bool)

(assert (=> b!900902 m!837751))

(declare-fun m!837753 () Bool)

(assert (=> b!900898 m!837753))

(declare-fun m!837755 () Bool)

(assert (=> b!900898 m!837755))

(declare-fun m!837757 () Bool)

(assert (=> b!900898 m!837757))

(declare-fun m!837759 () Bool)

(assert (=> b!900898 m!837759))

(declare-fun m!837761 () Bool)

(assert (=> b!900898 m!837761))

(declare-fun m!837763 () Bool)

(assert (=> b!900898 m!837763))

(declare-fun m!837765 () Bool)

(assert (=> b!900898 m!837765))

(declare-fun m!837767 () Bool)

(assert (=> b!900898 m!837767))

(assert (=> b!900898 m!837725))

(declare-fun m!837769 () Bool)

(assert (=> b!900898 m!837769))

(assert (=> b!900898 m!837761))

(assert (=> b!900898 m!837765))

(declare-fun m!837771 () Bool)

(assert (=> b!900898 m!837771))

(assert (=> b!900898 m!837755))

(declare-fun m!837773 () Bool)

(assert (=> b!900898 m!837773))

(declare-fun m!837775 () Bool)

(assert (=> b!900898 m!837775))

(assert (=> b!900898 m!837735))

(declare-fun m!837777 () Bool)

(assert (=> b!900898 m!837777))

(declare-fun m!837779 () Bool)

(assert (=> b!900898 m!837779))

(assert (=> b!900898 m!837777))

(declare-fun m!837781 () Bool)

(assert (=> b!900898 m!837781))

(assert (=> b!900892 m!837725))

(assert (=> b!900892 m!837725))

(declare-fun m!837783 () Bool)

(assert (=> b!900892 m!837783))

(assert (=> b!900750 d!111933))

(declare-fun d!111935 () Bool)

(assert (=> d!111935 (= (array_inv!19966 (_keys!10261 thiss!1181)) (bvsge (size!25837 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900754 d!111935))

(declare-fun d!111937 () Bool)

(assert (=> d!111937 (= (array_inv!19967 (_values!5452 thiss!1181)) (bvsge (size!25838 (_values!5452 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!900754 d!111937))

(declare-fun d!111939 () Bool)

(declare-fun res!608223 () Bool)

(declare-fun e!504266 () Bool)

(assert (=> d!111939 (=> (not res!608223) (not e!504266))))

(declare-fun simpleValid!328 (LongMapFixedSize!4420) Bool)

(assert (=> d!111939 (= res!608223 (simpleValid!328 thiss!1181))))

(assert (=> d!111939 (= (valid!1710 thiss!1181) e!504266)))

(declare-fun b!900919 () Bool)

(declare-fun res!608224 () Bool)

(assert (=> b!900919 (=> (not res!608224) (not e!504266))))

(declare-fun arrayCountValidKeys!0 (array!52819 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900919 (= res!608224 (= (arrayCountValidKeys!0 (_keys!10261 thiss!1181) #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))) (_size!2265 thiss!1181)))))

(declare-fun b!900920 () Bool)

(declare-fun res!608225 () Bool)

(assert (=> b!900920 (=> (not res!608225) (not e!504266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52819 (_ BitVec 32)) Bool)

(assert (=> b!900920 (= res!608225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900921 () Bool)

(declare-datatypes ((List!17806 0))(
  ( (Nil!17803) (Cons!17802 (h!18953 (_ BitVec 64)) (t!25149 List!17806)) )
))
(declare-fun arrayNoDuplicates!0 (array!52819 (_ BitVec 32) List!17806) Bool)

(assert (=> b!900921 (= e!504266 (arrayNoDuplicates!0 (_keys!10261 thiss!1181) #b00000000000000000000000000000000 Nil!17803))))

(assert (= (and d!111939 res!608223) b!900919))

(assert (= (and b!900919 res!608224) b!900920))

(assert (= (and b!900920 res!608225) b!900921))

(declare-fun m!837785 () Bool)

(assert (=> d!111939 m!837785))

(declare-fun m!837787 () Bool)

(assert (=> b!900919 m!837787))

(declare-fun m!837789 () Bool)

(assert (=> b!900920 m!837789))

(declare-fun m!837791 () Bool)

(assert (=> b!900921 m!837791))

(assert (=> start!77218 d!111939))

(declare-fun condMapEmpty!29229 () Bool)

(declare-fun mapDefault!29229 () ValueCell!8702)

(assert (=> mapNonEmpty!29220 (= condMapEmpty!29229 (= mapRest!29220 ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29229)))))

(declare-fun e!504272 () Bool)

(declare-fun mapRes!29229 () Bool)

(assert (=> mapNonEmpty!29220 (= tp!56202 (and e!504272 mapRes!29229))))

(declare-fun mapNonEmpty!29229 () Bool)

(declare-fun tp!56217 () Bool)

(declare-fun e!504271 () Bool)

(assert (=> mapNonEmpty!29229 (= mapRes!29229 (and tp!56217 e!504271))))

(declare-fun mapValue!29229 () ValueCell!8702)

(declare-fun mapKey!29229 () (_ BitVec 32))

(declare-fun mapRest!29229 () (Array (_ BitVec 32) ValueCell!8702))

(assert (=> mapNonEmpty!29229 (= mapRest!29220 (store mapRest!29229 mapKey!29229 mapValue!29229))))

(declare-fun b!900928 () Bool)

(assert (=> b!900928 (= e!504271 tp_is_empty!18367)))

(declare-fun mapIsEmpty!29229 () Bool)

(assert (=> mapIsEmpty!29229 mapRes!29229))

(declare-fun b!900929 () Bool)

(assert (=> b!900929 (= e!504272 tp_is_empty!18367)))

(assert (= (and mapNonEmpty!29220 condMapEmpty!29229) mapIsEmpty!29229))

(assert (= (and mapNonEmpty!29220 (not condMapEmpty!29229)) mapNonEmpty!29229))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8702) mapValue!29229)) b!900928))

(assert (= (and mapNonEmpty!29220 ((_ is ValueCellFull!8702) mapDefault!29229)) b!900929))

(declare-fun m!837793 () Bool)

(assert (=> mapNonEmpty!29229 m!837793))

(declare-fun b_lambda!13019 () Bool)

(assert (= b_lambda!13017 (or (and b!900754 b_free!16039) b_lambda!13019)))

(check-sat (not d!111929) (not b!900892) (not b!900893) (not b!900847) (not b!900909) (not b!900903) (not mapNonEmpty!29229) (not d!111919) (not b!900839) (not b!900811) (not b!900898) (not bm!40035) (not d!111939) (not d!111933) (not b!900921) (not b!900827) (not b_next!16039) (not bm!40038) (not b!900841) (not d!111917) (not b!900919) b_and!26369 (not b!900920) (not bm!40039) (not d!111927) (not b!900896) (not b!900902) tp_is_empty!18367 (not b!900832) (not b!900894) (not d!111925) (not b_lambda!13019) (not bm!40034))
(check-sat b_and!26369 (not b_next!16039))
(get-model)

(declare-fun d!111941 () Bool)

(declare-fun e!504275 () Bool)

(assert (=> d!111941 e!504275))

(declare-fun res!608231 () Bool)

(assert (=> d!111941 (=> (not res!608231) (not e!504275))))

(declare-fun lt!406982 () ListLongMap!10667)

(assert (=> d!111941 (= res!608231 (contains!4396 lt!406982 (_1!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun lt!406983 () List!17803)

(assert (=> d!111941 (= lt!406982 (ListLongMap!10668 lt!406983))))

(declare-fun lt!406985 () Unit!30568)

(declare-fun lt!406984 () Unit!30568)

(assert (=> d!111941 (= lt!406985 lt!406984)))

(assert (=> d!111941 (= (getValueByKey!458 lt!406983 (_1!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))) (Some!463 (_2!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!252 (List!17803 (_ BitVec 64) V!29455) Unit!30568)

(assert (=> d!111941 (= lt!406984 (lemmaContainsTupThenGetReturnValue!252 lt!406983 (_1!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (_2!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun insertStrictlySorted!309 (List!17803 (_ BitVec 64) V!29455) List!17803)

(assert (=> d!111941 (= lt!406983 (insertStrictlySorted!309 (toList!5349 (ite c!95536 call!40041 (ite c!95540 call!40042 call!40040))) (_1!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (_2!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(assert (=> d!111941 (= (+!2605 (ite c!95536 call!40041 (ite c!95540 call!40042 call!40040)) (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) lt!406982)))

(declare-fun b!900934 () Bool)

(declare-fun res!608230 () Bool)

(assert (=> b!900934 (=> (not res!608230) (not e!504275))))

(assert (=> b!900934 (= res!608230 (= (getValueByKey!458 (toList!5349 lt!406982) (_1!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))) (Some!463 (_2!5995 (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))))

(declare-fun b!900935 () Bool)

(declare-fun contains!4399 (List!17803 tuple2!11968) Bool)

(assert (=> b!900935 (= e!504275 (contains!4399 (toList!5349 lt!406982) (ite (or c!95536 c!95540) (tuple2!11969 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5265 thiss!1181)) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (= (and d!111941 res!608231) b!900934))

(assert (= (and b!900934 res!608230) b!900935))

(declare-fun m!837795 () Bool)

(assert (=> d!111941 m!837795))

(declare-fun m!837797 () Bool)

(assert (=> d!111941 m!837797))

(declare-fun m!837799 () Bool)

(assert (=> d!111941 m!837799))

(declare-fun m!837801 () Bool)

(assert (=> d!111941 m!837801))

(declare-fun m!837803 () Bool)

(assert (=> b!900934 m!837803))

(declare-fun m!837805 () Bool)

(assert (=> b!900935 m!837805))

(assert (=> bm!40035 d!111941))

(declare-fun d!111943 () Bool)

(declare-fun e!504276 () Bool)

(assert (=> d!111943 e!504276))

(declare-fun res!608232 () Bool)

(assert (=> d!111943 (=> res!608232 e!504276)))

(declare-fun lt!406988 () Bool)

(assert (=> d!111943 (= res!608232 (not lt!406988))))

(declare-fun lt!406989 () Bool)

(assert (=> d!111943 (= lt!406988 lt!406989)))

(declare-fun lt!406987 () Unit!30568)

(declare-fun e!504277 () Unit!30568)

(assert (=> d!111943 (= lt!406987 e!504277)))

(declare-fun c!95541 () Bool)

(assert (=> d!111943 (= c!95541 lt!406989)))

(assert (=> d!111943 (= lt!406989 (containsKey!431 (toList!5349 lt!406969) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111943 (= (contains!4396 lt!406969 #b0000000000000000000000000000000000000000000000000000000000000000) lt!406988)))

(declare-fun b!900936 () Bool)

(declare-fun lt!406986 () Unit!30568)

(assert (=> b!900936 (= e!504277 lt!406986)))

(assert (=> b!900936 (= lt!406986 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 lt!406969) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!900936 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!900937 () Bool)

(declare-fun Unit!30576 () Unit!30568)

(assert (=> b!900937 (= e!504277 Unit!30576)))

(declare-fun b!900938 () Bool)

(assert (=> b!900938 (= e!504276 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111943 c!95541) b!900936))

(assert (= (and d!111943 (not c!95541)) b!900937))

(assert (= (and d!111943 (not res!608232)) b!900938))

(declare-fun m!837807 () Bool)

(assert (=> d!111943 m!837807))

(declare-fun m!837809 () Bool)

(assert (=> b!900936 m!837809))

(declare-fun m!837811 () Bool)

(assert (=> b!900936 m!837811))

(assert (=> b!900936 m!837811))

(declare-fun m!837813 () Bool)

(assert (=> b!900936 m!837813))

(assert (=> b!900938 m!837811))

(assert (=> b!900938 m!837811))

(assert (=> b!900938 m!837813))

(assert (=> bm!40034 d!111943))

(declare-fun d!111945 () Bool)

(declare-fun res!608233 () Bool)

(declare-fun e!504278 () Bool)

(assert (=> d!111945 (=> res!608233 e!504278)))

(assert (=> d!111945 (= res!608233 (= (select (arr!25378 (_keys!10261 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111945 (= (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!504278)))

(declare-fun b!900939 () Bool)

(declare-fun e!504279 () Bool)

(assert (=> b!900939 (= e!504278 e!504279)))

(declare-fun res!608234 () Bool)

(assert (=> b!900939 (=> (not res!608234) (not e!504279))))

(assert (=> b!900939 (= res!608234 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun b!900940 () Bool)

(assert (=> b!900940 (= e!504279 (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111945 (not res!608233)) b!900939))

(assert (= (and b!900939 res!608234) b!900940))

(declare-fun m!837815 () Bool)

(assert (=> d!111945 m!837815))

(declare-fun m!837817 () Bool)

(assert (=> b!900940 m!837817))

(assert (=> b!900847 d!111945))

(declare-fun d!111947 () Bool)

(assert (=> d!111947 (= (inRange!0 (index!37928 lt!406877) (mask!26250 thiss!1181)) (and (bvsge (index!37928 lt!406877) #b00000000000000000000000000000000) (bvslt (index!37928 lt!406877) (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!900811 d!111947))

(declare-fun d!111949 () Bool)

(declare-fun e!504280 () Bool)

(assert (=> d!111949 e!504280))

(declare-fun res!608236 () Bool)

(assert (=> d!111949 (=> (not res!608236) (not e!504280))))

(declare-fun lt!406990 () ListLongMap!10667)

(assert (=> d!111949 (= res!608236 (contains!4396 lt!406990 (_1!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(declare-fun lt!406991 () List!17803)

(assert (=> d!111949 (= lt!406990 (ListLongMap!10668 lt!406991))))

(declare-fun lt!406993 () Unit!30568)

(declare-fun lt!406992 () Unit!30568)

(assert (=> d!111949 (= lt!406993 lt!406992)))

(assert (=> d!111949 (= (getValueByKey!458 lt!406991 (_1!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111949 (= lt!406992 (lemmaContainsTupThenGetReturnValue!252 lt!406991 (_1!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111949 (= lt!406991 (insertStrictlySorted!309 (toList!5349 call!40039) (_1!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))))))

(assert (=> d!111949 (= (+!2605 call!40039 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))) lt!406990)))

(declare-fun b!900941 () Bool)

(declare-fun res!608235 () Bool)

(assert (=> b!900941 (=> (not res!608235) (not e!504280))))

(assert (=> b!900941 (= res!608235 (= (getValueByKey!458 (toList!5349 lt!406990) (_1!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))))

(declare-fun b!900942 () Bool)

(assert (=> b!900942 (= e!504280 (contains!4399 (toList!5349 lt!406990) (tuple2!11969 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5265 thiss!1181))))))

(assert (= (and d!111949 res!608236) b!900941))

(assert (= (and b!900941 res!608235) b!900942))

(declare-fun m!837819 () Bool)

(assert (=> d!111949 m!837819))

(declare-fun m!837821 () Bool)

(assert (=> d!111949 m!837821))

(declare-fun m!837823 () Bool)

(assert (=> d!111949 m!837823))

(declare-fun m!837825 () Bool)

(assert (=> d!111949 m!837825))

(declare-fun m!837827 () Bool)

(assert (=> b!900941 m!837827))

(declare-fun m!837829 () Bool)

(assert (=> b!900942 m!837829))

(assert (=> b!900902 d!111949))

(declare-fun d!111951 () Bool)

(declare-fun res!608241 () Bool)

(declare-fun e!504285 () Bool)

(assert (=> d!111951 (=> res!608241 e!504285)))

(assert (=> d!111951 (= res!608241 (and ((_ is Cons!17799) (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (= (_1!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))))

(assert (=> d!111951 (= (containsKey!431 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))) e!504285)))

(declare-fun b!900947 () Bool)

(declare-fun e!504286 () Bool)

(assert (=> b!900947 (= e!504285 e!504286)))

(declare-fun res!608242 () Bool)

(assert (=> b!900947 (=> (not res!608242) (not e!504286))))

(assert (=> b!900947 (= res!608242 (and (or (not ((_ is Cons!17799) (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (bvsle (_1!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))) ((_ is Cons!17799) (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (bvslt (_1!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))))

(declare-fun b!900948 () Bool)

(assert (=> b!900948 (= e!504286 (containsKey!431 (t!25144 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(assert (= (and d!111951 (not res!608241)) b!900947))

(assert (= (and b!900947 res!608242) b!900948))

(assert (=> b!900948 m!837625))

(declare-fun m!837831 () Bool)

(assert (=> b!900948 m!837831))

(assert (=> d!111927 d!111951))

(declare-fun b!900959 () Bool)

(declare-fun e!504295 () Bool)

(declare-fun e!504297 () Bool)

(assert (=> b!900959 (= e!504295 e!504297)))

(declare-fun c!95544 () Bool)

(assert (=> b!900959 (= c!95544 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900960 () Bool)

(declare-fun call!40045 () Bool)

(assert (=> b!900960 (= e!504297 call!40045)))

(declare-fun d!111953 () Bool)

(declare-fun res!608250 () Bool)

(declare-fun e!504296 () Bool)

(assert (=> d!111953 (=> res!608250 e!504296)))

(assert (=> d!111953 (= res!608250 (bvsge #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> d!111953 (= (arrayNoDuplicates!0 (_keys!10261 thiss!1181) #b00000000000000000000000000000000 Nil!17803) e!504296)))

(declare-fun b!900961 () Bool)

(assert (=> b!900961 (= e!504297 call!40045)))

(declare-fun b!900962 () Bool)

(declare-fun e!504298 () Bool)

(declare-fun contains!4400 (List!17806 (_ BitVec 64)) Bool)

(assert (=> b!900962 (= e!504298 (contains!4400 Nil!17803 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40042 () Bool)

(assert (=> bm!40042 (= call!40045 (arrayNoDuplicates!0 (_keys!10261 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95544 (Cons!17802 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) Nil!17803) Nil!17803)))))

(declare-fun b!900963 () Bool)

(assert (=> b!900963 (= e!504296 e!504295)))

(declare-fun res!608251 () Bool)

(assert (=> b!900963 (=> (not res!608251) (not e!504295))))

(assert (=> b!900963 (= res!608251 (not e!504298))))

(declare-fun res!608249 () Bool)

(assert (=> b!900963 (=> (not res!608249) (not e!504298))))

(assert (=> b!900963 (= res!608249 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111953 (not res!608250)) b!900963))

(assert (= (and b!900963 res!608249) b!900962))

(assert (= (and b!900963 res!608251) b!900959))

(assert (= (and b!900959 c!95544) b!900961))

(assert (= (and b!900959 (not c!95544)) b!900960))

(assert (= (or b!900961 b!900960) bm!40042))

(assert (=> b!900959 m!837725))

(assert (=> b!900959 m!837725))

(assert (=> b!900959 m!837747))

(assert (=> b!900962 m!837725))

(assert (=> b!900962 m!837725))

(declare-fun m!837833 () Bool)

(assert (=> b!900962 m!837833))

(assert (=> bm!40042 m!837725))

(declare-fun m!837835 () Bool)

(assert (=> bm!40042 m!837835))

(assert (=> b!900963 m!837725))

(assert (=> b!900963 m!837725))

(assert (=> b!900963 m!837747))

(assert (=> b!900921 d!111953))

(declare-fun b!900972 () Bool)

(declare-fun e!504305 () Bool)

(declare-fun call!40048 () Bool)

(assert (=> b!900972 (= e!504305 call!40048)))

(declare-fun b!900973 () Bool)

(declare-fun e!504306 () Bool)

(assert (=> b!900973 (= e!504306 e!504305)))

(declare-fun lt!407001 () (_ BitVec 64))

(assert (=> b!900973 (= lt!407001 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407000 () Unit!30568)

(assert (=> b!900973 (= lt!407000 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10261 thiss!1181) lt!407001 #b00000000000000000000000000000000))))

(assert (=> b!900973 (arrayContainsKey!0 (_keys!10261 thiss!1181) lt!407001 #b00000000000000000000000000000000)))

(declare-fun lt!407002 () Unit!30568)

(assert (=> b!900973 (= lt!407002 lt!407000)))

(declare-fun res!608257 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52819 (_ BitVec 32)) SeekEntryResult!8889)

(assert (=> b!900973 (= res!608257 (= (seekEntryOrOpen!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) (_keys!10261 thiss!1181) (mask!26250 thiss!1181)) (Found!8889 #b00000000000000000000000000000000)))))

(assert (=> b!900973 (=> (not res!608257) (not e!504305))))

(declare-fun bm!40045 () Bool)

(assert (=> bm!40045 (= call!40048 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun d!111955 () Bool)

(declare-fun res!608256 () Bool)

(declare-fun e!504307 () Bool)

(assert (=> d!111955 (=> res!608256 e!504307)))

(assert (=> d!111955 (= res!608256 (bvsge #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> d!111955 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)) e!504307)))

(declare-fun b!900974 () Bool)

(assert (=> b!900974 (= e!504307 e!504306)))

(declare-fun c!95547 () Bool)

(assert (=> b!900974 (= c!95547 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!900975 () Bool)

(assert (=> b!900975 (= e!504306 call!40048)))

(assert (= (and d!111955 (not res!608256)) b!900974))

(assert (= (and b!900974 c!95547) b!900973))

(assert (= (and b!900974 (not c!95547)) b!900975))

(assert (= (and b!900973 res!608257) b!900972))

(assert (= (or b!900972 b!900975) bm!40045))

(assert (=> b!900973 m!837725))

(declare-fun m!837837 () Bool)

(assert (=> b!900973 m!837837))

(declare-fun m!837839 () Bool)

(assert (=> b!900973 m!837839))

(assert (=> b!900973 m!837725))

(declare-fun m!837841 () Bool)

(assert (=> b!900973 m!837841))

(declare-fun m!837843 () Bool)

(assert (=> bm!40045 m!837843))

(assert (=> b!900974 m!837725))

(assert (=> b!900974 m!837725))

(assert (=> b!900974 m!837747))

(assert (=> b!900920 d!111955))

(declare-fun d!111957 () Bool)

(declare-fun get!13365 (Option!464) V!29455)

(assert (=> d!111957 (= (apply!410 lt!406969 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)) (get!13365 (getValueByKey!458 (toList!5349 lt!406969) (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25283 () Bool)

(assert (= bs!25283 d!111957))

(assert (=> bs!25283 m!837725))

(declare-fun m!837845 () Bool)

(assert (=> bs!25283 m!837845))

(assert (=> bs!25283 m!837845))

(declare-fun m!837847 () Bool)

(assert (=> bs!25283 m!837847))

(assert (=> b!900896 d!111957))

(declare-fun d!111959 () Bool)

(declare-fun c!95550 () Bool)

(assert (=> d!111959 (= c!95550 ((_ is ValueCellFull!8702) (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!504310 () V!29455)

(assert (=> d!111959 (= (get!13364 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!504310)))

(declare-fun b!900980 () Bool)

(declare-fun get!13366 (ValueCell!8702 V!29455) V!29455)

(assert (=> b!900980 (= e!504310 (get!13366 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!900981 () Bool)

(declare-fun get!13367 (ValueCell!8702 V!29455) V!29455)

(assert (=> b!900981 (= e!504310 (get!13367 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111959 c!95550) b!900980))

(assert (= (and d!111959 (not c!95550)) b!900981))

(assert (=> b!900980 m!837737))

(assert (=> b!900980 m!837739))

(declare-fun m!837849 () Bool)

(assert (=> b!900980 m!837849))

(assert (=> b!900981 m!837737))

(assert (=> b!900981 m!837739))

(declare-fun m!837851 () Bool)

(assert (=> b!900981 m!837851))

(assert (=> b!900896 d!111959))

(declare-fun b!900994 () Bool)

(declare-fun e!504317 () SeekEntryResult!8889)

(assert (=> b!900994 (= e!504317 Undefined!8889)))

(declare-fun b!900995 () Bool)

(declare-fun e!504318 () SeekEntryResult!8889)

(assert (=> b!900995 (= e!504318 (Found!8889 (index!37929 lt!406889)))))

(declare-fun b!900996 () Bool)

(declare-fun c!95558 () Bool)

(declare-fun lt!407008 () (_ BitVec 64))

(assert (=> b!900996 (= c!95558 (= lt!407008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504319 () SeekEntryResult!8889)

(assert (=> b!900996 (= e!504318 e!504319)))

(declare-fun b!900997 () Bool)

(assert (=> b!900997 (= e!504317 e!504318)))

(declare-fun c!95557 () Bool)

(assert (=> b!900997 (= c!95557 (= lt!407008 key!785))))

(declare-fun b!900998 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!900998 (= e!504319 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76646 lt!406889) #b00000000000000000000000000000001) (nextIndex!0 (index!37929 lt!406889) (bvadd (x!76646 lt!406889) #b00000000000000000000000000000001) (mask!26250 thiss!1181)) (index!37929 lt!406889) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(declare-fun b!900999 () Bool)

(assert (=> b!900999 (= e!504319 (MissingVacant!8889 (index!37929 lt!406889)))))

(declare-fun d!111961 () Bool)

(declare-fun lt!407007 () SeekEntryResult!8889)

(assert (=> d!111961 (and (or ((_ is Undefined!8889) lt!407007) (not ((_ is Found!8889) lt!407007)) (and (bvsge (index!37928 lt!407007) #b00000000000000000000000000000000) (bvslt (index!37928 lt!407007) (size!25837 (_keys!10261 thiss!1181))))) (or ((_ is Undefined!8889) lt!407007) ((_ is Found!8889) lt!407007) (not ((_ is MissingVacant!8889) lt!407007)) (not (= (index!37930 lt!407007) (index!37929 lt!406889))) (and (bvsge (index!37930 lt!407007) #b00000000000000000000000000000000) (bvslt (index!37930 lt!407007) (size!25837 (_keys!10261 thiss!1181))))) (or ((_ is Undefined!8889) lt!407007) (ite ((_ is Found!8889) lt!407007) (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!407007)) key!785) (and ((_ is MissingVacant!8889) lt!407007) (= (index!37930 lt!407007) (index!37929 lt!406889)) (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37930 lt!407007)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111961 (= lt!407007 e!504317)))

(declare-fun c!95559 () Bool)

(assert (=> d!111961 (= c!95559 (bvsge (x!76646 lt!406889) #b01111111111111111111111111111110))))

(assert (=> d!111961 (= lt!407008 (select (arr!25378 (_keys!10261 thiss!1181)) (index!37929 lt!406889)))))

(assert (=> d!111961 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111961 (= (seekKeyOrZeroReturnVacant!0 (x!76646 lt!406889) (index!37929 lt!406889) (index!37929 lt!406889) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)) lt!407007)))

(assert (= (and d!111961 c!95559) b!900994))

(assert (= (and d!111961 (not c!95559)) b!900997))

(assert (= (and b!900997 c!95557) b!900995))

(assert (= (and b!900997 (not c!95557)) b!900996))

(assert (= (and b!900996 c!95558) b!900999))

(assert (= (and b!900996 (not c!95558)) b!900998))

(declare-fun m!837853 () Bool)

(assert (=> b!900998 m!837853))

(assert (=> b!900998 m!837853))

(declare-fun m!837855 () Bool)

(assert (=> b!900998 m!837855))

(declare-fun m!837857 () Bool)

(assert (=> d!111961 m!837857))

(declare-fun m!837859 () Bool)

(assert (=> d!111961 m!837859))

(assert (=> d!111961 m!837711))

(assert (=> d!111961 m!837621))

(assert (=> b!900827 d!111961))

(declare-fun d!111963 () Bool)

(declare-fun e!504320 () Bool)

(assert (=> d!111963 e!504320))

(declare-fun res!608258 () Bool)

(assert (=> d!111963 (=> res!608258 e!504320)))

(declare-fun lt!407011 () Bool)

(assert (=> d!111963 (= res!608258 (not lt!407011))))

(declare-fun lt!407012 () Bool)

(assert (=> d!111963 (= lt!407011 lt!407012)))

(declare-fun lt!407010 () Unit!30568)

(declare-fun e!504321 () Unit!30568)

(assert (=> d!111963 (= lt!407010 e!504321)))

(declare-fun c!95560 () Bool)

(assert (=> d!111963 (= c!95560 lt!407012)))

(assert (=> d!111963 (= lt!407012 (containsKey!431 (toList!5349 lt!406969) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!111963 (= (contains!4396 lt!406969 #b1000000000000000000000000000000000000000000000000000000000000000) lt!407011)))

(declare-fun b!901000 () Bool)

(declare-fun lt!407009 () Unit!30568)

(assert (=> b!901000 (= e!504321 lt!407009)))

(assert (=> b!901000 (= lt!407009 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 lt!406969) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!901000 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901001 () Bool)

(declare-fun Unit!30577 () Unit!30568)

(assert (=> b!901001 (= e!504321 Unit!30577)))

(declare-fun b!901002 () Bool)

(assert (=> b!901002 (= e!504320 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!111963 c!95560) b!901000))

(assert (= (and d!111963 (not c!95560)) b!901001))

(assert (= (and d!111963 (not res!608258)) b!901002))

(declare-fun m!837861 () Bool)

(assert (=> d!111963 m!837861))

(declare-fun m!837863 () Bool)

(assert (=> b!901000 m!837863))

(declare-fun m!837865 () Bool)

(assert (=> b!901000 m!837865))

(assert (=> b!901000 m!837865))

(declare-fun m!837867 () Bool)

(assert (=> b!901000 m!837867))

(assert (=> b!901002 m!837865))

(assert (=> b!901002 m!837865))

(assert (=> b!901002 m!837867))

(assert (=> bm!40039 d!111963))

(declare-fun d!111965 () Bool)

(assert (=> d!111965 (isDefined!333 (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(declare-fun lt!407015 () Unit!30568)

(declare-fun choose!1515 (List!17803 (_ BitVec 64)) Unit!30568)

(assert (=> d!111965 (= lt!407015 (choose!1515 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(declare-fun e!504324 () Bool)

(assert (=> d!111965 e!504324))

(declare-fun res!608261 () Bool)

(assert (=> d!111965 (=> (not res!608261) (not e!504324))))

(declare-fun isStrictlySorted!488 (List!17803) Bool)

(assert (=> d!111965 (= res!608261 (isStrictlySorted!488 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))))

(assert (=> d!111965 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))) lt!407015)))

(declare-fun b!901005 () Bool)

(assert (=> b!901005 (= e!504324 (containsKey!431 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(assert (= (and d!111965 res!608261) b!901005))

(assert (=> d!111965 m!837625))

(assert (=> d!111965 m!837719))

(assert (=> d!111965 m!837719))

(assert (=> d!111965 m!837721))

(assert (=> d!111965 m!837625))

(declare-fun m!837869 () Bool)

(assert (=> d!111965 m!837869))

(declare-fun m!837871 () Bool)

(assert (=> d!111965 m!837871))

(assert (=> b!901005 m!837625))

(assert (=> b!901005 m!837715))

(assert (=> b!900839 d!111965))

(declare-fun d!111967 () Bool)

(declare-fun isEmpty!696 (Option!464) Bool)

(assert (=> d!111967 (= (isDefined!333 (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))) (not (isEmpty!696 (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))))

(declare-fun bs!25284 () Bool)

(assert (= bs!25284 d!111967))

(assert (=> bs!25284 m!837719))

(declare-fun m!837873 () Bool)

(assert (=> bs!25284 m!837873))

(assert (=> b!900839 d!111967))

(declare-fun b!901014 () Bool)

(declare-fun e!504329 () Option!464)

(assert (=> b!901014 (= e!504329 (Some!463 (_2!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))))))))

(declare-fun b!901016 () Bool)

(declare-fun e!504330 () Option!464)

(assert (=> b!901016 (= e!504330 (getValueByKey!458 (t!25144 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))

(declare-fun b!901015 () Bool)

(assert (=> b!901015 (= e!504329 e!504330)))

(declare-fun c!95566 () Bool)

(assert (=> b!901015 (= c!95566 (and ((_ is Cons!17799) (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (not (= (_1!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))))))))

(declare-fun d!111969 () Bool)

(declare-fun c!95565 () Bool)

(assert (=> d!111969 (= c!95565 (and ((_ is Cons!17799) (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)))) (= (_1!5995 (h!18950 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))))

(assert (=> d!111969 (= (getValueByKey!458 (toList!5349 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181))) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846))) e!504329)))

(declare-fun b!901017 () Bool)

(assert (=> b!901017 (= e!504330 None!462)))

(assert (= (and d!111969 c!95565) b!901014))

(assert (= (and d!111969 (not c!95565)) b!901015))

(assert (= (and b!901015 c!95566) b!901016))

(assert (= (and b!901015 (not c!95566)) b!901017))

(assert (=> b!901016 m!837625))

(declare-fun m!837875 () Bool)

(assert (=> b!901016 m!837875))

(assert (=> b!900839 d!111969))

(declare-fun d!111971 () Bool)

(assert (=> d!111971 (contains!4396 (getCurrentListMap!2621 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) (select (arr!25378 (_keys!10261 thiss!1181)) (index!37928 lt!406846)))))

(assert (=> d!111971 true))

(declare-fun _$16!187 () Unit!30568)

(assert (=> d!111971 (= (choose!1514 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (index!37928 lt!406846) (defaultEntry!5438 thiss!1181)) _$16!187)))

(declare-fun bs!25285 () Bool)

(assert (= bs!25285 d!111971))

(assert (=> bs!25285 m!837623))

(assert (=> bs!25285 m!837625))

(assert (=> bs!25285 m!837623))

(assert (=> bs!25285 m!837625))

(assert (=> bs!25285 m!837627))

(assert (=> d!111925 d!111971))

(assert (=> d!111925 d!111923))

(assert (=> b!900832 d!111927))

(assert (=> b!900832 d!111933))

(assert (=> b!900841 d!111967))

(assert (=> b!900841 d!111969))

(assert (=> d!111917 d!111919))

(declare-fun d!111973 () Bool)

(declare-fun e!504333 () Bool)

(assert (=> d!111973 e!504333))

(declare-fun res!608264 () Bool)

(assert (=> d!111973 (=> res!608264 e!504333)))

(declare-fun lt!407018 () SeekEntryResult!8889)

(assert (=> d!111973 (= res!608264 (not ((_ is Found!8889) lt!407018)))))

(assert (=> d!111973 (= lt!407018 (seekEntry!0 key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(assert (=> d!111973 true))

(declare-fun _$36!375 () Unit!30568)

(assert (=> d!111973 (= (choose!1513 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) key!785) _$36!375)))

(declare-fun b!901020 () Bool)

(assert (=> b!901020 (= e!504333 (inRange!0 (index!37928 lt!407018) (mask!26250 thiss!1181)))))

(assert (= (and d!111973 (not res!608264)) b!901020))

(assert (=> d!111973 m!837639))

(declare-fun m!837877 () Bool)

(assert (=> b!901020 m!837877))

(assert (=> d!111917 d!111973))

(assert (=> d!111917 d!111923))

(declare-fun d!111975 () Bool)

(declare-fun e!504334 () Bool)

(assert (=> d!111975 e!504334))

(declare-fun res!608266 () Bool)

(assert (=> d!111975 (=> (not res!608266) (not e!504334))))

(declare-fun lt!407019 () ListLongMap!10667)

(assert (=> d!111975 (= res!608266 (contains!4396 lt!407019 (_1!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))))))

(declare-fun lt!407020 () List!17803)

(assert (=> d!111975 (= lt!407019 (ListLongMap!10668 lt!407020))))

(declare-fun lt!407022 () Unit!30568)

(declare-fun lt!407021 () Unit!30568)

(assert (=> d!111975 (= lt!407022 lt!407021)))

(assert (=> d!111975 (= (getValueByKey!458 lt!407020 (_1!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))))))

(assert (=> d!111975 (= lt!407021 (lemmaContainsTupThenGetReturnValue!252 lt!407020 (_1!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))))))

(assert (=> d!111975 (= lt!407020 (insertStrictlySorted!309 (toList!5349 lt!406972) (_1!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))))))

(assert (=> d!111975 (= (+!2605 lt!406972 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) lt!407019)))

(declare-fun b!901021 () Bool)

(declare-fun res!608265 () Bool)

(assert (=> b!901021 (=> (not res!608265) (not e!504334))))

(assert (=> b!901021 (= res!608265 (= (getValueByKey!458 (toList!5349 lt!407019) (_1!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))))))))

(declare-fun b!901022 () Bool)

(assert (=> b!901022 (= e!504334 (contains!4399 (toList!5349 lt!407019) (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))))))

(assert (= (and d!111975 res!608266) b!901021))

(assert (= (and b!901021 res!608265) b!901022))

(declare-fun m!837879 () Bool)

(assert (=> d!111975 m!837879))

(declare-fun m!837881 () Bool)

(assert (=> d!111975 m!837881))

(declare-fun m!837883 () Bool)

(assert (=> d!111975 m!837883))

(declare-fun m!837885 () Bool)

(assert (=> d!111975 m!837885))

(declare-fun m!837887 () Bool)

(assert (=> b!901021 m!837887))

(declare-fun m!837889 () Bool)

(assert (=> b!901022 m!837889))

(assert (=> b!900898 d!111975))

(declare-fun d!111977 () Bool)

(assert (=> d!111977 (= (apply!410 lt!406952 lt!406956) (get!13365 (getValueByKey!458 (toList!5349 lt!406952) lt!406956)))))

(declare-fun bs!25286 () Bool)

(assert (= bs!25286 d!111977))

(declare-fun m!837891 () Bool)

(assert (=> bs!25286 m!837891))

(assert (=> bs!25286 m!837891))

(declare-fun m!837893 () Bool)

(assert (=> bs!25286 m!837893))

(assert (=> b!900898 d!111977))

(declare-fun d!111979 () Bool)

(declare-fun e!504335 () Bool)

(assert (=> d!111979 e!504335))

(declare-fun res!608268 () Bool)

(assert (=> d!111979 (=> (not res!608268) (not e!504335))))

(declare-fun lt!407023 () ListLongMap!10667)

(assert (=> d!111979 (= res!608268 (contains!4396 lt!407023 (_1!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))))))

(declare-fun lt!407024 () List!17803)

(assert (=> d!111979 (= lt!407023 (ListLongMap!10668 lt!407024))))

(declare-fun lt!407026 () Unit!30568)

(declare-fun lt!407025 () Unit!30568)

(assert (=> d!111979 (= lt!407026 lt!407025)))

(assert (=> d!111979 (= (getValueByKey!458 lt!407024 (_1!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))))))

(assert (=> d!111979 (= lt!407025 (lemmaContainsTupThenGetReturnValue!252 lt!407024 (_1!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))))))

(assert (=> d!111979 (= lt!407024 (insertStrictlySorted!309 (toList!5349 lt!406959) (_1!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))))))

(assert (=> d!111979 (= (+!2605 lt!406959 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) lt!407023)))

(declare-fun b!901023 () Bool)

(declare-fun res!608267 () Bool)

(assert (=> b!901023 (=> (not res!608267) (not e!504335))))

(assert (=> b!901023 (= res!608267 (= (getValueByKey!458 (toList!5349 lt!407023) (_1!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))))))))

(declare-fun b!901024 () Bool)

(assert (=> b!901024 (= e!504335 (contains!4399 (toList!5349 lt!407023) (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))))))

(assert (= (and d!111979 res!608268) b!901023))

(assert (= (and b!901023 res!608267) b!901024))

(declare-fun m!837895 () Bool)

(assert (=> d!111979 m!837895))

(declare-fun m!837897 () Bool)

(assert (=> d!111979 m!837897))

(declare-fun m!837899 () Bool)

(assert (=> d!111979 m!837899))

(declare-fun m!837901 () Bool)

(assert (=> d!111979 m!837901))

(declare-fun m!837903 () Bool)

(assert (=> b!901023 m!837903))

(declare-fun m!837905 () Bool)

(assert (=> b!901024 m!837905))

(assert (=> b!900898 d!111979))

(declare-fun d!111981 () Bool)

(assert (=> d!111981 (= (apply!410 lt!406959 lt!406973) (get!13365 (getValueByKey!458 (toList!5349 lt!406959) lt!406973)))))

(declare-fun bs!25287 () Bool)

(assert (= bs!25287 d!111981))

(declare-fun m!837907 () Bool)

(assert (=> bs!25287 m!837907))

(assert (=> bs!25287 m!837907))

(declare-fun m!837909 () Bool)

(assert (=> bs!25287 m!837909))

(assert (=> b!900898 d!111981))

(declare-fun d!111983 () Bool)

(declare-fun e!504336 () Bool)

(assert (=> d!111983 e!504336))

(declare-fun res!608270 () Bool)

(assert (=> d!111983 (=> (not res!608270) (not e!504336))))

(declare-fun lt!407027 () ListLongMap!10667)

(assert (=> d!111983 (= res!608270 (contains!4396 lt!407027 (_1!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))))))

(declare-fun lt!407028 () List!17803)

(assert (=> d!111983 (= lt!407027 (ListLongMap!10668 lt!407028))))

(declare-fun lt!407030 () Unit!30568)

(declare-fun lt!407029 () Unit!30568)

(assert (=> d!111983 (= lt!407030 lt!407029)))

(assert (=> d!111983 (= (getValueByKey!458 lt!407028 (_1!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111983 (= lt!407029 (lemmaContainsTupThenGetReturnValue!252 lt!407028 (_1!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111983 (= lt!407028 (insertStrictlySorted!309 (toList!5349 lt!406952) (_1!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111983 (= (+!2605 lt!406952 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) lt!407027)))

(declare-fun b!901025 () Bool)

(declare-fun res!608269 () Bool)

(assert (=> b!901025 (=> (not res!608269) (not e!504336))))

(assert (=> b!901025 (= res!608269 (= (getValueByKey!458 (toList!5349 lt!407027) (_1!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))))))))

(declare-fun b!901026 () Bool)

(assert (=> b!901026 (= e!504336 (contains!4399 (toList!5349 lt!407027) (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))))))

(assert (= (and d!111983 res!608270) b!901025))

(assert (= (and b!901025 res!608269) b!901026))

(declare-fun m!837911 () Bool)

(assert (=> d!111983 m!837911))

(declare-fun m!837913 () Bool)

(assert (=> d!111983 m!837913))

(declare-fun m!837915 () Bool)

(assert (=> d!111983 m!837915))

(declare-fun m!837917 () Bool)

(assert (=> d!111983 m!837917))

(declare-fun m!837919 () Bool)

(assert (=> b!901025 m!837919))

(declare-fun m!837921 () Bool)

(assert (=> b!901026 m!837921))

(assert (=> b!900898 d!111983))

(declare-fun d!111985 () Bool)

(assert (=> d!111985 (= (apply!410 (+!2605 lt!406952 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) lt!406956) (get!13365 (getValueByKey!458 (toList!5349 (+!2605 lt!406952 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181)))) lt!406956)))))

(declare-fun bs!25288 () Bool)

(assert (= bs!25288 d!111985))

(declare-fun m!837923 () Bool)

(assert (=> bs!25288 m!837923))

(assert (=> bs!25288 m!837923))

(declare-fun m!837925 () Bool)

(assert (=> bs!25288 m!837925))

(assert (=> b!900898 d!111985))

(declare-fun b!901051 () Bool)

(declare-fun e!504354 () ListLongMap!10667)

(declare-fun e!504356 () ListLongMap!10667)

(assert (=> b!901051 (= e!504354 e!504356)))

(declare-fun c!95578 () Bool)

(assert (=> b!901051 (= c!95578 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901052 () Bool)

(declare-fun e!504353 () Bool)

(assert (=> b!901052 (= e!504353 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901052 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!111987 () Bool)

(declare-fun e!504357 () Bool)

(assert (=> d!111987 e!504357))

(declare-fun res!608279 () Bool)

(assert (=> d!111987 (=> (not res!608279) (not e!504357))))

(declare-fun lt!407045 () ListLongMap!10667)

(assert (=> d!111987 (= res!608279 (not (contains!4396 lt!407045 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!111987 (= lt!407045 e!504354)))

(declare-fun c!95577 () Bool)

(assert (=> d!111987 (= c!95577 (bvsge #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> d!111987 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!111987 (= (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5438 thiss!1181)) lt!407045)))

(declare-fun b!901053 () Bool)

(declare-fun e!504352 () Bool)

(assert (=> b!901053 (= e!504352 (= lt!407045 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5438 thiss!1181))))))

(declare-fun b!901054 () Bool)

(declare-fun e!504351 () Bool)

(assert (=> b!901054 (= e!504357 e!504351)))

(declare-fun c!95576 () Bool)

(assert (=> b!901054 (= c!95576 e!504353)))

(declare-fun res!608282 () Bool)

(assert (=> b!901054 (=> (not res!608282) (not e!504353))))

(assert (=> b!901054 (= res!608282 (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun bm!40048 () Bool)

(declare-fun call!40051 () ListLongMap!10667)

(assert (=> bm!40048 (= call!40051 (getCurrentListMapNoExtraKeys!3326 (_keys!10261 thiss!1181) (_values!5452 thiss!1181) (mask!26250 thiss!1181) (extraKeys!5161 thiss!1181) (zeroValue!5265 thiss!1181) (minValue!5265 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5438 thiss!1181)))))

(declare-fun b!901055 () Bool)

(assert (=> b!901055 (= e!504356 call!40051)))

(declare-fun b!901056 () Bool)

(assert (=> b!901056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> b!901056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25838 (_values!5452 thiss!1181))))))

(declare-fun e!504355 () Bool)

(assert (=> b!901056 (= e!504355 (= (apply!410 lt!407045 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)) (get!13364 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!901057 () Bool)

(declare-fun res!608280 () Bool)

(assert (=> b!901057 (=> (not res!608280) (not e!504357))))

(assert (=> b!901057 (= res!608280 (not (contains!4396 lt!407045 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901058 () Bool)

(declare-fun isEmpty!697 (ListLongMap!10667) Bool)

(assert (=> b!901058 (= e!504352 (isEmpty!697 lt!407045))))

(declare-fun b!901059 () Bool)

(assert (=> b!901059 (= e!504351 e!504355)))

(assert (=> b!901059 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun res!608281 () Bool)

(assert (=> b!901059 (= res!608281 (contains!4396 lt!407045 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901059 (=> (not res!608281) (not e!504355))))

(declare-fun b!901060 () Bool)

(assert (=> b!901060 (= e!504351 e!504352)))

(declare-fun c!95575 () Bool)

(assert (=> b!901060 (= c!95575 (bvslt #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun b!901061 () Bool)

(assert (=> b!901061 (= e!504354 (ListLongMap!10668 Nil!17800))))

(declare-fun b!901062 () Bool)

(declare-fun lt!407048 () Unit!30568)

(declare-fun lt!407047 () Unit!30568)

(assert (=> b!901062 (= lt!407048 lt!407047)))

(declare-fun lt!407046 () (_ BitVec 64))

(declare-fun lt!407051 () V!29455)

(declare-fun lt!407050 () ListLongMap!10667)

(declare-fun lt!407049 () (_ BitVec 64))

(assert (=> b!901062 (not (contains!4396 (+!2605 lt!407050 (tuple2!11969 lt!407046 lt!407051)) lt!407049))))

(declare-fun addStillNotContains!219 (ListLongMap!10667 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> b!901062 (= lt!407047 (addStillNotContains!219 lt!407050 lt!407046 lt!407051 lt!407049))))

(assert (=> b!901062 (= lt!407049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!901062 (= lt!407051 (get!13364 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!901062 (= lt!407046 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901062 (= lt!407050 call!40051)))

(assert (=> b!901062 (= e!504356 (+!2605 call!40051 (tuple2!11969 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) (get!13364 (select (arr!25379 (_values!5452 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1325 (defaultEntry!5438 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!111987 c!95577) b!901061))

(assert (= (and d!111987 (not c!95577)) b!901051))

(assert (= (and b!901051 c!95578) b!901062))

(assert (= (and b!901051 (not c!95578)) b!901055))

(assert (= (or b!901062 b!901055) bm!40048))

(assert (= (and d!111987 res!608279) b!901057))

(assert (= (and b!901057 res!608280) b!901054))

(assert (= (and b!901054 res!608282) b!901052))

(assert (= (and b!901054 c!95576) b!901059))

(assert (= (and b!901054 (not c!95576)) b!901060))

(assert (= (and b!901059 res!608281) b!901056))

(assert (= (and b!901060 c!95575) b!901053))

(assert (= (and b!901060 (not c!95575)) b!901058))

(declare-fun b_lambda!13021 () Bool)

(assert (=> (not b_lambda!13021) (not b!901056)))

(assert (=> b!901056 t!25148))

(declare-fun b_and!26371 () Bool)

(assert (= b_and!26369 (and (=> t!25148 result!10167) b_and!26371)))

(declare-fun b_lambda!13023 () Bool)

(assert (=> (not b_lambda!13023) (not b!901062)))

(assert (=> b!901062 t!25148))

(declare-fun b_and!26373 () Bool)

(assert (= b_and!26371 (and (=> t!25148 result!10167) b_and!26373)))

(assert (=> b!901056 m!837725))

(declare-fun m!837927 () Bool)

(assert (=> b!901056 m!837927))

(assert (=> b!901056 m!837739))

(assert (=> b!901056 m!837737))

(assert (=> b!901056 m!837739))

(assert (=> b!901056 m!837741))

(assert (=> b!901056 m!837725))

(assert (=> b!901056 m!837737))

(assert (=> b!901062 m!837739))

(assert (=> b!901062 m!837737))

(assert (=> b!901062 m!837739))

(assert (=> b!901062 m!837741))

(assert (=> b!901062 m!837725))

(assert (=> b!901062 m!837737))

(declare-fun m!837929 () Bool)

(assert (=> b!901062 m!837929))

(declare-fun m!837931 () Bool)

(assert (=> b!901062 m!837931))

(declare-fun m!837933 () Bool)

(assert (=> b!901062 m!837933))

(declare-fun m!837935 () Bool)

(assert (=> b!901062 m!837935))

(assert (=> b!901062 m!837931))

(declare-fun m!837937 () Bool)

(assert (=> bm!40048 m!837937))

(assert (=> b!901059 m!837725))

(assert (=> b!901059 m!837725))

(declare-fun m!837939 () Bool)

(assert (=> b!901059 m!837939))

(assert (=> b!901052 m!837725))

(assert (=> b!901052 m!837725))

(assert (=> b!901052 m!837747))

(declare-fun m!837941 () Bool)

(assert (=> b!901057 m!837941))

(assert (=> b!901051 m!837725))

(assert (=> b!901051 m!837725))

(assert (=> b!901051 m!837747))

(assert (=> b!901053 m!837937))

(declare-fun m!837943 () Bool)

(assert (=> b!901058 m!837943))

(declare-fun m!837945 () Bool)

(assert (=> d!111987 m!837945))

(assert (=> d!111987 m!837621))

(assert (=> b!900898 d!111987))

(declare-fun d!111989 () Bool)

(assert (=> d!111989 (= (apply!410 (+!2605 lt!406959 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) lt!406973) (get!13365 (getValueByKey!458 (toList!5349 (+!2605 lt!406959 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181)))) lt!406973)))))

(declare-fun bs!25289 () Bool)

(assert (= bs!25289 d!111989))

(declare-fun m!837947 () Bool)

(assert (=> bs!25289 m!837947))

(assert (=> bs!25289 m!837947))

(declare-fun m!837949 () Bool)

(assert (=> bs!25289 m!837949))

(assert (=> b!900898 d!111989))

(declare-fun d!111991 () Bool)

(assert (=> d!111991 (= (apply!410 (+!2605 lt!406972 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) lt!406960) (apply!410 lt!406972 lt!406960))))

(declare-fun lt!407054 () Unit!30568)

(declare-fun choose!1516 (ListLongMap!10667 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> d!111991 (= lt!407054 (choose!1516 lt!406972 lt!406971 (minValue!5265 thiss!1181) lt!406960))))

(declare-fun e!504360 () Bool)

(assert (=> d!111991 e!504360))

(declare-fun res!608285 () Bool)

(assert (=> d!111991 (=> (not res!608285) (not e!504360))))

(assert (=> d!111991 (= res!608285 (contains!4396 lt!406972 lt!406960))))

(assert (=> d!111991 (= (addApplyDifferent!336 lt!406972 lt!406971 (minValue!5265 thiss!1181) lt!406960) lt!407054)))

(declare-fun b!901066 () Bool)

(assert (=> b!901066 (= e!504360 (not (= lt!406960 lt!406971)))))

(assert (= (and d!111991 res!608285) b!901066))

(assert (=> d!111991 m!837755))

(assert (=> d!111991 m!837773))

(declare-fun m!837951 () Bool)

(assert (=> d!111991 m!837951))

(declare-fun m!837953 () Bool)

(assert (=> d!111991 m!837953))

(assert (=> d!111991 m!837759))

(assert (=> d!111991 m!837755))

(assert (=> b!900898 d!111991))

(declare-fun d!111993 () Bool)

(assert (=> d!111993 (= (apply!410 (+!2605 lt!406959 (tuple2!11969 lt!406964 (minValue!5265 thiss!1181))) lt!406973) (apply!410 lt!406959 lt!406973))))

(declare-fun lt!407055 () Unit!30568)

(assert (=> d!111993 (= lt!407055 (choose!1516 lt!406959 lt!406964 (minValue!5265 thiss!1181) lt!406973))))

(declare-fun e!504361 () Bool)

(assert (=> d!111993 e!504361))

(declare-fun res!608286 () Bool)

(assert (=> d!111993 (=> (not res!608286) (not e!504361))))

(assert (=> d!111993 (= res!608286 (contains!4396 lt!406959 lt!406973))))

(assert (=> d!111993 (= (addApplyDifferent!336 lt!406959 lt!406964 (minValue!5265 thiss!1181) lt!406973) lt!407055)))

(declare-fun b!901067 () Bool)

(assert (=> b!901067 (= e!504361 (not (= lt!406973 lt!406964)))))

(assert (= (and d!111993 res!608286) b!901067))

(assert (=> d!111993 m!837777))

(assert (=> d!111993 m!837779))

(declare-fun m!837955 () Bool)

(assert (=> d!111993 m!837955))

(declare-fun m!837957 () Bool)

(assert (=> d!111993 m!837957))

(assert (=> d!111993 m!837781))

(assert (=> d!111993 m!837777))

(assert (=> b!900898 d!111993))

(declare-fun d!111995 () Bool)

(assert (=> d!111995 (= (apply!410 lt!406972 lt!406960) (get!13365 (getValueByKey!458 (toList!5349 lt!406972) lt!406960)))))

(declare-fun bs!25290 () Bool)

(assert (= bs!25290 d!111995))

(declare-fun m!837959 () Bool)

(assert (=> bs!25290 m!837959))

(assert (=> bs!25290 m!837959))

(declare-fun m!837961 () Bool)

(assert (=> bs!25290 m!837961))

(assert (=> b!900898 d!111995))

(declare-fun d!111997 () Bool)

(declare-fun e!504362 () Bool)

(assert (=> d!111997 e!504362))

(declare-fun res!608287 () Bool)

(assert (=> d!111997 (=> res!608287 e!504362)))

(declare-fun lt!407058 () Bool)

(assert (=> d!111997 (= res!608287 (not lt!407058))))

(declare-fun lt!407059 () Bool)

(assert (=> d!111997 (= lt!407058 lt!407059)))

(declare-fun lt!407057 () Unit!30568)

(declare-fun e!504363 () Unit!30568)

(assert (=> d!111997 (= lt!407057 e!504363)))

(declare-fun c!95579 () Bool)

(assert (=> d!111997 (= c!95579 lt!407059)))

(assert (=> d!111997 (= lt!407059 (containsKey!431 (toList!5349 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) lt!406955))))

(assert (=> d!111997 (= (contains!4396 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) lt!406955) lt!407058)))

(declare-fun b!901068 () Bool)

(declare-fun lt!407056 () Unit!30568)

(assert (=> b!901068 (= e!504363 lt!407056)))

(assert (=> b!901068 (= lt!407056 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) lt!406955))))

(assert (=> b!901068 (isDefined!333 (getValueByKey!458 (toList!5349 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) lt!406955))))

(declare-fun b!901069 () Bool)

(declare-fun Unit!30578 () Unit!30568)

(assert (=> b!901069 (= e!504363 Unit!30578)))

(declare-fun b!901070 () Bool)

(assert (=> b!901070 (= e!504362 (isDefined!333 (getValueByKey!458 (toList!5349 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) lt!406955)))))

(assert (= (and d!111997 c!95579) b!901068))

(assert (= (and d!111997 (not c!95579)) b!901069))

(assert (= (and d!111997 (not res!608287)) b!901070))

(declare-fun m!837963 () Bool)

(assert (=> d!111997 m!837963))

(declare-fun m!837965 () Bool)

(assert (=> b!901068 m!837965))

(declare-fun m!837967 () Bool)

(assert (=> b!901068 m!837967))

(assert (=> b!901068 m!837967))

(declare-fun m!837969 () Bool)

(assert (=> b!901068 m!837969))

(assert (=> b!901070 m!837967))

(assert (=> b!901070 m!837967))

(assert (=> b!901070 m!837969))

(assert (=> b!900898 d!111997))

(declare-fun d!111999 () Bool)

(declare-fun e!504364 () Bool)

(assert (=> d!111999 e!504364))

(declare-fun res!608289 () Bool)

(assert (=> d!111999 (=> (not res!608289) (not e!504364))))

(declare-fun lt!407060 () ListLongMap!10667)

(assert (=> d!111999 (= res!608289 (contains!4396 lt!407060 (_1!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))))))

(declare-fun lt!407061 () List!17803)

(assert (=> d!111999 (= lt!407060 (ListLongMap!10668 lt!407061))))

(declare-fun lt!407063 () Unit!30568)

(declare-fun lt!407062 () Unit!30568)

(assert (=> d!111999 (= lt!407063 lt!407062)))

(assert (=> d!111999 (= (getValueByKey!458 lt!407061 (_1!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111999 (= lt!407062 (lemmaContainsTupThenGetReturnValue!252 lt!407061 (_1!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111999 (= lt!407061 (insertStrictlySorted!309 (toList!5349 lt!406958) (_1!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) (_2!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))))))

(assert (=> d!111999 (= (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) lt!407060)))

(declare-fun b!901071 () Bool)

(declare-fun res!608288 () Bool)

(assert (=> b!901071 (=> (not res!608288) (not e!504364))))

(assert (=> b!901071 (= res!608288 (= (getValueByKey!458 (toList!5349 lt!407060) (_1!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181)))) (Some!463 (_2!5995 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))))))))

(declare-fun b!901072 () Bool)

(assert (=> b!901072 (= e!504364 (contains!4399 (toList!5349 lt!407060) (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))))))

(assert (= (and d!111999 res!608289) b!901071))

(assert (= (and b!901071 res!608288) b!901072))

(declare-fun m!837971 () Bool)

(assert (=> d!111999 m!837971))

(declare-fun m!837973 () Bool)

(assert (=> d!111999 m!837973))

(declare-fun m!837975 () Bool)

(assert (=> d!111999 m!837975))

(declare-fun m!837977 () Bool)

(assert (=> d!111999 m!837977))

(declare-fun m!837979 () Bool)

(assert (=> b!901071 m!837979))

(declare-fun m!837981 () Bool)

(assert (=> b!901072 m!837981))

(assert (=> b!900898 d!111999))

(declare-fun d!112001 () Bool)

(assert (=> d!112001 (= (apply!410 (+!2605 lt!406952 (tuple2!11969 lt!406970 (zeroValue!5265 thiss!1181))) lt!406956) (apply!410 lt!406952 lt!406956))))

(declare-fun lt!407064 () Unit!30568)

(assert (=> d!112001 (= lt!407064 (choose!1516 lt!406952 lt!406970 (zeroValue!5265 thiss!1181) lt!406956))))

(declare-fun e!504365 () Bool)

(assert (=> d!112001 e!504365))

(declare-fun res!608290 () Bool)

(assert (=> d!112001 (=> (not res!608290) (not e!504365))))

(assert (=> d!112001 (= res!608290 (contains!4396 lt!406952 lt!406956))))

(assert (=> d!112001 (= (addApplyDifferent!336 lt!406952 lt!406970 (zeroValue!5265 thiss!1181) lt!406956) lt!407064)))

(declare-fun b!901073 () Bool)

(assert (=> b!901073 (= e!504365 (not (= lt!406956 lt!406970)))))

(assert (= (and d!112001 res!608290) b!901073))

(assert (=> d!112001 m!837765))

(assert (=> d!112001 m!837767))

(declare-fun m!837983 () Bool)

(assert (=> d!112001 m!837983))

(declare-fun m!837985 () Bool)

(assert (=> d!112001 m!837985))

(assert (=> d!112001 m!837771))

(assert (=> d!112001 m!837765))

(assert (=> b!900898 d!112001))

(declare-fun d!112003 () Bool)

(assert (=> d!112003 (contains!4396 (+!2605 lt!406958 (tuple2!11969 lt!406963 (zeroValue!5265 thiss!1181))) lt!406955)))

(declare-fun lt!407067 () Unit!30568)

(declare-fun choose!1517 (ListLongMap!10667 (_ BitVec 64) V!29455 (_ BitVec 64)) Unit!30568)

(assert (=> d!112003 (= lt!407067 (choose!1517 lt!406958 lt!406963 (zeroValue!5265 thiss!1181) lt!406955))))

(assert (=> d!112003 (contains!4396 lt!406958 lt!406955)))

(assert (=> d!112003 (= (addStillContains!336 lt!406958 lt!406963 (zeroValue!5265 thiss!1181) lt!406955) lt!407067)))

(declare-fun bs!25291 () Bool)

(assert (= bs!25291 d!112003))

(assert (=> bs!25291 m!837761))

(assert (=> bs!25291 m!837761))

(assert (=> bs!25291 m!837763))

(declare-fun m!837987 () Bool)

(assert (=> bs!25291 m!837987))

(declare-fun m!837989 () Bool)

(assert (=> bs!25291 m!837989))

(assert (=> b!900898 d!112003))

(declare-fun d!112005 () Bool)

(assert (=> d!112005 (= (apply!410 (+!2605 lt!406972 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181))) lt!406960) (get!13365 (getValueByKey!458 (toList!5349 (+!2605 lt!406972 (tuple2!11969 lt!406971 (minValue!5265 thiss!1181)))) lt!406960)))))

(declare-fun bs!25292 () Bool)

(assert (= bs!25292 d!112005))

(declare-fun m!837991 () Bool)

(assert (=> bs!25292 m!837991))

(assert (=> bs!25292 m!837991))

(declare-fun m!837993 () Bool)

(assert (=> bs!25292 m!837993))

(assert (=> b!900898 d!112005))

(declare-fun d!112007 () Bool)

(declare-fun e!504366 () Bool)

(assert (=> d!112007 e!504366))

(declare-fun res!608291 () Bool)

(assert (=> d!112007 (=> res!608291 e!504366)))

(declare-fun lt!407070 () Bool)

(assert (=> d!112007 (= res!608291 (not lt!407070))))

(declare-fun lt!407071 () Bool)

(assert (=> d!112007 (= lt!407070 lt!407071)))

(declare-fun lt!407069 () Unit!30568)

(declare-fun e!504367 () Unit!30568)

(assert (=> d!112007 (= lt!407069 e!504367)))

(declare-fun c!95580 () Bool)

(assert (=> d!112007 (= c!95580 lt!407071)))

(assert (=> d!112007 (= lt!407071 (containsKey!431 (toList!5349 lt!406969) (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!112007 (= (contains!4396 lt!406969 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)) lt!407070)))

(declare-fun b!901075 () Bool)

(declare-fun lt!407068 () Unit!30568)

(assert (=> b!901075 (= e!504367 lt!407068)))

(assert (=> b!901075 (= lt!407068 (lemmaContainsKeyImpliesGetValueByKeyDefined!325 (toList!5349 lt!406969) (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901075 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901076 () Bool)

(declare-fun Unit!30579 () Unit!30568)

(assert (=> b!901076 (= e!504367 Unit!30579)))

(declare-fun b!901077 () Bool)

(assert (=> b!901077 (= e!504366 (isDefined!333 (getValueByKey!458 (toList!5349 lt!406969) (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!112007 c!95580) b!901075))

(assert (= (and d!112007 (not c!95580)) b!901076))

(assert (= (and d!112007 (not res!608291)) b!901077))

(assert (=> d!112007 m!837725))

(declare-fun m!837995 () Bool)

(assert (=> d!112007 m!837995))

(assert (=> b!901075 m!837725))

(declare-fun m!837997 () Bool)

(assert (=> b!901075 m!837997))

(assert (=> b!901075 m!837725))

(assert (=> b!901075 m!837845))

(assert (=> b!901075 m!837845))

(declare-fun m!837999 () Bool)

(assert (=> b!901075 m!837999))

(assert (=> b!901077 m!837725))

(assert (=> b!901077 m!837845))

(assert (=> b!901077 m!837845))

(assert (=> b!901077 m!837999))

(assert (=> b!900892 d!112007))

(assert (=> bm!40038 d!111987))

(declare-fun b!901088 () Bool)

(declare-fun res!608300 () Bool)

(declare-fun e!504370 () Bool)

(assert (=> b!901088 (=> (not res!608300) (not e!504370))))

(declare-fun size!25843 (LongMapFixedSize!4420) (_ BitVec 32))

(assert (=> b!901088 (= res!608300 (= (size!25843 thiss!1181) (bvadd (_size!2265 thiss!1181) (bvsdiv (bvadd (extraKeys!5161 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!901087 () Bool)

(declare-fun res!608303 () Bool)

(assert (=> b!901087 (=> (not res!608303) (not e!504370))))

(assert (=> b!901087 (= res!608303 (bvsge (size!25843 thiss!1181) (_size!2265 thiss!1181)))))

(declare-fun d!112009 () Bool)

(declare-fun res!608302 () Bool)

(assert (=> d!112009 (=> (not res!608302) (not e!504370))))

(assert (=> d!112009 (= res!608302 (validMask!0 (mask!26250 thiss!1181)))))

(assert (=> d!112009 (= (simpleValid!328 thiss!1181) e!504370)))

(declare-fun b!901086 () Bool)

(declare-fun res!608301 () Bool)

(assert (=> b!901086 (=> (not res!608301) (not e!504370))))

(assert (=> b!901086 (= res!608301 (and (= (size!25838 (_values!5452 thiss!1181)) (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001)) (= (size!25837 (_keys!10261 thiss!1181)) (size!25838 (_values!5452 thiss!1181))) (bvsge (_size!2265 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2265 thiss!1181) (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!901089 () Bool)

(assert (=> b!901089 (= e!504370 (and (bvsge (extraKeys!5161 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5161 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2265 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!112009 res!608302) b!901086))

(assert (= (and b!901086 res!608301) b!901087))

(assert (= (and b!901087 res!608303) b!901088))

(assert (= (and b!901088 res!608300) b!901089))

(declare-fun m!838001 () Bool)

(assert (=> b!901088 m!838001))

(assert (=> b!901087 m!838001))

(assert (=> d!112009 m!837621))

(assert (=> d!111939 d!112009))

(declare-fun bm!40051 () Bool)

(declare-fun call!40054 () (_ BitVec 32))

(assert (=> bm!40051 (= call!40054 (arrayCountValidKeys!0 (_keys!10261 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun d!112011 () Bool)

(declare-fun lt!407074 () (_ BitVec 32))

(assert (=> d!112011 (and (bvsge lt!407074 #b00000000000000000000000000000000) (bvsle lt!407074 (bvsub (size!25837 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!504375 () (_ BitVec 32))

(assert (=> d!112011 (= lt!407074 e!504375)))

(declare-fun c!95585 () Bool)

(assert (=> d!112011 (= c!95585 (bvsge #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> d!112011 (and (bvsle #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25837 (_keys!10261 thiss!1181)) (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> d!112011 (= (arrayCountValidKeys!0 (_keys!10261 thiss!1181) #b00000000000000000000000000000000 (size!25837 (_keys!10261 thiss!1181))) lt!407074)))

(declare-fun b!901098 () Bool)

(declare-fun e!504376 () (_ BitVec 32))

(assert (=> b!901098 (= e!504376 call!40054)))

(declare-fun b!901099 () Bool)

(assert (=> b!901099 (= e!504376 (bvadd #b00000000000000000000000000000001 call!40054))))

(declare-fun b!901100 () Bool)

(assert (=> b!901100 (= e!504375 #b00000000000000000000000000000000)))

(declare-fun b!901101 () Bool)

(assert (=> b!901101 (= e!504375 e!504376)))

(declare-fun c!95586 () Bool)

(assert (=> b!901101 (= c!95586 (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!112011 c!95585) b!901100))

(assert (= (and d!112011 (not c!95585)) b!901101))

(assert (= (and b!901101 c!95586) b!901099))

(assert (= (and b!901101 (not c!95586)) b!901098))

(assert (= (or b!901099 b!901098) bm!40051))

(declare-fun m!838003 () Bool)

(assert (=> bm!40051 m!838003))

(assert (=> b!901101 m!837725))

(assert (=> b!901101 m!837725))

(assert (=> b!901101 m!837747))

(assert (=> b!900919 d!112011))

(declare-fun d!112013 () Bool)

(assert (=> d!112013 (= (validKeyInArray!0 (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25378 (_keys!10261 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!900893 d!112013))

(assert (=> b!900894 d!112013))

(declare-fun d!112015 () Bool)

(assert (=> d!112015 (= (apply!410 lt!406969 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13365 (getValueByKey!458 (toList!5349 lt!406969) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25293 () Bool)

(assert (= bs!25293 d!112015))

(assert (=> bs!25293 m!837811))

(assert (=> bs!25293 m!837811))

(declare-fun m!838005 () Bool)

(assert (=> bs!25293 m!838005))

(assert (=> b!900909 d!112015))

(assert (=> d!111933 d!111923))

(declare-fun d!112017 () Bool)

(declare-fun e!504391 () Bool)

(assert (=> d!112017 e!504391))

(declare-fun c!95593 () Bool)

(declare-fun lt!407079 () SeekEntryResult!8889)

(assert (=> d!112017 (= c!95593 (and ((_ is Intermediate!8889) lt!407079) (undefined!9701 lt!407079)))))

(declare-fun e!504388 () SeekEntryResult!8889)

(assert (=> d!112017 (= lt!407079 e!504388)))

(declare-fun c!95594 () Bool)

(assert (=> d!112017 (= c!95594 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!407080 () (_ BitVec 64))

(assert (=> d!112017 (= lt!407080 (select (arr!25378 (_keys!10261 thiss!1181)) (toIndex!0 key!785 (mask!26250 thiss!1181))))))

(assert (=> d!112017 (validMask!0 (mask!26250 thiss!1181))))

(assert (=> d!112017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26250 thiss!1181)) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)) lt!407079)))

(declare-fun b!901120 () Bool)

(declare-fun e!504390 () Bool)

(assert (=> b!901120 (= e!504391 e!504390)))

(declare-fun res!608310 () Bool)

(assert (=> b!901120 (= res!608310 (and ((_ is Intermediate!8889) lt!407079) (not (undefined!9701 lt!407079)) (bvslt (x!76646 lt!407079) #b01111111111111111111111111111110) (bvsge (x!76646 lt!407079) #b00000000000000000000000000000000) (bvsge (x!76646 lt!407079) #b00000000000000000000000000000000)))))

(assert (=> b!901120 (=> (not res!608310) (not e!504390))))

(declare-fun b!901121 () Bool)

(assert (=> b!901121 (and (bvsge (index!37929 lt!407079) #b00000000000000000000000000000000) (bvslt (index!37929 lt!407079) (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun res!608311 () Bool)

(assert (=> b!901121 (= res!608311 (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37929 lt!407079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504389 () Bool)

(assert (=> b!901121 (=> res!608311 e!504389)))

(declare-fun b!901122 () Bool)

(assert (=> b!901122 (= e!504388 (Intermediate!8889 true (toIndex!0 key!785 (mask!26250 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!901123 () Bool)

(declare-fun e!504387 () SeekEntryResult!8889)

(assert (=> b!901123 (= e!504387 (Intermediate!8889 false (toIndex!0 key!785 (mask!26250 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!901124 () Bool)

(assert (=> b!901124 (= e!504388 e!504387)))

(declare-fun c!95595 () Bool)

(assert (=> b!901124 (= c!95595 (or (= lt!407080 key!785) (= (bvadd lt!407080 lt!407080) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!901125 () Bool)

(assert (=> b!901125 (= e!504391 (bvsge (x!76646 lt!407079) #b01111111111111111111111111111110))))

(declare-fun b!901126 () Bool)

(assert (=> b!901126 (and (bvsge (index!37929 lt!407079) #b00000000000000000000000000000000) (bvslt (index!37929 lt!407079) (size!25837 (_keys!10261 thiss!1181))))))

(declare-fun res!608312 () Bool)

(assert (=> b!901126 (= res!608312 (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37929 lt!407079)) key!785))))

(assert (=> b!901126 (=> res!608312 e!504389)))

(assert (=> b!901126 (= e!504390 e!504389)))

(declare-fun b!901127 () Bool)

(assert (=> b!901127 (and (bvsge (index!37929 lt!407079) #b00000000000000000000000000000000) (bvslt (index!37929 lt!407079) (size!25837 (_keys!10261 thiss!1181))))))

(assert (=> b!901127 (= e!504389 (= (select (arr!25378 (_keys!10261 thiss!1181)) (index!37929 lt!407079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901128 () Bool)

(assert (=> b!901128 (= e!504387 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26250 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26250 thiss!1181)) key!785 (_keys!10261 thiss!1181) (mask!26250 thiss!1181)))))

(assert (= (and d!112017 c!95594) b!901122))

(assert (= (and d!112017 (not c!95594)) b!901124))

(assert (= (and b!901124 c!95595) b!901123))

(assert (= (and b!901124 (not c!95595)) b!901128))

(assert (= (and d!112017 c!95593) b!901125))

(assert (= (and d!112017 (not c!95593)) b!901120))

(assert (= (and b!901120 res!608310) b!901126))

(assert (= (and b!901126 (not res!608312)) b!901121))

(assert (= (and b!901121 (not res!608311)) b!901127))

(assert (=> d!112017 m!837705))

(declare-fun m!838007 () Bool)

(assert (=> d!112017 m!838007))

(assert (=> d!112017 m!837621))

(declare-fun m!838009 () Bool)

(assert (=> b!901121 m!838009))

(assert (=> b!901127 m!838009))

(assert (=> b!901128 m!837705))

(declare-fun m!838011 () Bool)

(assert (=> b!901128 m!838011))

(assert (=> b!901128 m!838011))

(declare-fun m!838013 () Bool)

(assert (=> b!901128 m!838013))

(assert (=> b!901126 m!838009))

(assert (=> d!111919 d!112017))

(declare-fun d!112019 () Bool)

(declare-fun lt!407086 () (_ BitVec 32))

(declare-fun lt!407085 () (_ BitVec 32))

(assert (=> d!112019 (= lt!407086 (bvmul (bvxor lt!407085 (bvlshr lt!407085 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!112019 (= lt!407085 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!112019 (and (bvsge (mask!26250 thiss!1181) #b00000000000000000000000000000000) (let ((res!608313 (let ((h!18954 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76666 (bvmul (bvxor h!18954 (bvlshr h!18954 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76666 (bvlshr x!76666 #b00000000000000000000000000001101)) (mask!26250 thiss!1181)))))) (and (bvslt res!608313 (bvadd (mask!26250 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!608313 #b00000000000000000000000000000000))))))

(assert (=> d!112019 (= (toIndex!0 key!785 (mask!26250 thiss!1181)) (bvand (bvxor lt!407086 (bvlshr lt!407086 #b00000000000000000000000000001101)) (mask!26250 thiss!1181)))))

(assert (=> d!111919 d!112019))

(assert (=> d!111919 d!111923))

(assert (=> d!111929 d!111931))

(declare-fun d!112021 () Bool)

(assert (=> d!112021 (arrayContainsKey!0 (_keys!10261 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!112021 true))

(declare-fun _$60!427 () Unit!30568)

(assert (=> d!112021 (= (choose!13 (_keys!10261 thiss!1181) key!785 (index!37928 lt!406846)) _$60!427)))

(declare-fun bs!25294 () Bool)

(assert (= bs!25294 d!112021))

(assert (=> bs!25294 m!837617))

(assert (=> d!111929 d!112021))

(declare-fun d!112023 () Bool)

(assert (=> d!112023 (= (apply!410 lt!406969 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13365 (getValueByKey!458 (toList!5349 lt!406969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25295 () Bool)

(assert (= bs!25295 d!112023))

(assert (=> bs!25295 m!837865))

(assert (=> bs!25295 m!837865))

(declare-fun m!838015 () Bool)

(assert (=> bs!25295 m!838015))

(assert (=> b!900903 d!112023))

(declare-fun condMapEmpty!29230 () Bool)

(declare-fun mapDefault!29230 () ValueCell!8702)

(assert (=> mapNonEmpty!29229 (= condMapEmpty!29230 (= mapRest!29229 ((as const (Array (_ BitVec 32) ValueCell!8702)) mapDefault!29230)))))

(declare-fun e!504393 () Bool)

(declare-fun mapRes!29230 () Bool)

(assert (=> mapNonEmpty!29229 (= tp!56217 (and e!504393 mapRes!29230))))

(declare-fun mapNonEmpty!29230 () Bool)

(declare-fun tp!56218 () Bool)

(declare-fun e!504392 () Bool)

(assert (=> mapNonEmpty!29230 (= mapRes!29230 (and tp!56218 e!504392))))

(declare-fun mapValue!29230 () ValueCell!8702)

(declare-fun mapRest!29230 () (Array (_ BitVec 32) ValueCell!8702))

(declare-fun mapKey!29230 () (_ BitVec 32))

(assert (=> mapNonEmpty!29230 (= mapRest!29229 (store mapRest!29230 mapKey!29230 mapValue!29230))))

(declare-fun b!901129 () Bool)

(assert (=> b!901129 (= e!504392 tp_is_empty!18367)))

(declare-fun mapIsEmpty!29230 () Bool)

(assert (=> mapIsEmpty!29230 mapRes!29230))

(declare-fun b!901130 () Bool)

(assert (=> b!901130 (= e!504393 tp_is_empty!18367)))

(assert (= (and mapNonEmpty!29229 condMapEmpty!29230) mapIsEmpty!29230))

(assert (= (and mapNonEmpty!29229 (not condMapEmpty!29230)) mapNonEmpty!29230))

(assert (= (and mapNonEmpty!29230 ((_ is ValueCellFull!8702) mapValue!29230)) b!901129))

(assert (= (and mapNonEmpty!29229 ((_ is ValueCellFull!8702) mapDefault!29230)) b!901130))

(declare-fun m!838017 () Bool)

(assert (=> mapNonEmpty!29230 m!838017))

(declare-fun b_lambda!13025 () Bool)

(assert (= b_lambda!13023 (or (and b!900754 b_free!16039) b_lambda!13025)))

(declare-fun b_lambda!13027 () Bool)

(assert (= b_lambda!13021 (or (and b!900754 b_free!16039) b_lambda!13027)))

(check-sat (not b!900959) (not b!901062) (not b_lambda!13025) (not b!900934) (not d!111993) (not b!901016) (not d!111999) (not d!111949) (not b!901026) (not d!112007) (not b!901057) (not b!901071) (not bm!40048) (not b!900941) (not b!901072) (not b_lambda!13027) (not b!901068) (not b!901058) (not d!112001) b_and!26373 (not b_next!16039) (not b!901002) (not d!111983) (not b!900998) (not b!900940) (not d!112009) (not b!900942) (not b!901088) (not d!111957) (not b!901052) (not d!111943) (not d!112023) (not d!111991) (not d!111981) (not b!901070) (not b!900936) (not b!900981) (not b!901053) (not d!112021) (not d!112003) (not d!111997) (not b!900948) (not b!901075) (not d!111963) (not d!111965) (not b!901059) (not b!900973) (not bm!40042) (not b!901021) (not b!900974) (not d!111961) (not b!901000) (not d!111979) (not d!112015) (not b!901087) (not d!112017) (not b!901101) (not bm!40051) (not b!901020) (not b!900938) (not b!900963) (not b!900962) (not b!901005) (not b!900935) tp_is_empty!18367 (not d!111977) (not d!111941) (not b!901024) (not d!111973) (not d!111971) (not d!111995) (not d!111989) (not d!111975) (not b!900980) (not d!111985) (not b!901128) (not bm!40045) (not b!901025) (not b!901023) (not d!111987) (not b!901051) (not b!901077) (not d!111967) (not b_lambda!13019) (not mapNonEmpty!29230) (not b!901056) (not b!901022) (not d!112005))
(check-sat b_and!26373 (not b_next!16039))
