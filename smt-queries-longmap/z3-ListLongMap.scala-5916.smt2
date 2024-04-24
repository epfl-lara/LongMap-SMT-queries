; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76884 () Bool)

(assert start!76884)

(declare-fun b!898783 () Bool)

(declare-fun b_free!15997 () Bool)

(declare-fun b_next!15997 () Bool)

(assert (=> b!898783 (= b_free!15997 (not b_next!15997))))

(declare-fun tp!56051 () Bool)

(declare-fun b_and!26299 () Bool)

(assert (=> b!898783 (= tp!56051 b_and!26299)))

(declare-fun res!607195 () Bool)

(declare-fun e!502746 () Bool)

(assert (=> start!76884 (=> (not res!607195) (not e!502746))))

(declare-datatypes ((array!52721 0))(
  ( (array!52722 (arr!25336 (Array (_ BitVec 32) (_ BitVec 64))) (size!25792 (_ BitVec 32))) )
))
(declare-datatypes ((V!29399 0))(
  ( (V!29400 (val!9213 Int)) )
))
(declare-datatypes ((ValueCell!8681 0))(
  ( (ValueCellFull!8681 (v!11700 V!29399)) (EmptyCell!8681) )
))
(declare-datatypes ((array!52723 0))(
  ( (array!52724 (arr!25337 (Array (_ BitVec 32) ValueCell!8681)) (size!25793 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4378 0))(
  ( (LongMapFixedSize!4379 (defaultEntry!5401 Int) (mask!26154 (_ BitVec 32)) (extraKeys!5114 (_ BitVec 32)) (zeroValue!5218 V!29399) (minValue!5218 V!29399) (_size!2244 (_ BitVec 32)) (_keys!10196 array!52721) (_values!5405 array!52723) (_vacant!2244 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4378)

(declare-fun valid!1694 (LongMapFixedSize!4378) Bool)

(assert (=> start!76884 (= res!607195 (valid!1694 thiss!1181))))

(assert (=> start!76884 e!502746))

(declare-fun e!502751 () Bool)

(assert (=> start!76884 e!502751))

(assert (=> start!76884 true))

(declare-fun b!898781 () Bool)

(declare-fun e!502747 () Bool)

(assert (=> b!898781 (= e!502746 (not e!502747))))

(declare-fun res!607198 () Bool)

(assert (=> b!898781 (=> res!607198 e!502747)))

(declare-datatypes ((SeekEntryResult!8870 0))(
  ( (MissingZero!8870 (index!37851 (_ BitVec 32))) (Found!8870 (index!37852 (_ BitVec 32))) (Intermediate!8870 (undefined!9682 Bool) (index!37853 (_ BitVec 32)) (x!76481 (_ BitVec 32))) (Undefined!8870) (MissingVacant!8870 (index!37854 (_ BitVec 32))) )
))
(declare-fun lt!405699 () SeekEntryResult!8870)

(get-info :version)

(assert (=> b!898781 (= res!607198 (not ((_ is Found!8870) lt!405699)))))

(declare-fun e!502748 () Bool)

(assert (=> b!898781 e!502748))

(declare-fun res!607194 () Bool)

(assert (=> b!898781 (=> res!607194 e!502748)))

(assert (=> b!898781 (= res!607194 (not ((_ is Found!8870) lt!405699)))))

(declare-datatypes ((Unit!30508 0))(
  ( (Unit!30509) )
))
(declare-fun lt!405701 () Unit!30508)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!91 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29399 V!29399 (_ BitVec 64)) Unit!30508)

(assert (=> b!898781 (= lt!405701 (lemmaSeekEntryGivesInRangeIndex!91 (_keys!10196 thiss!1181) (_values!5405 thiss!1181) (mask!26154 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!898781 (= lt!405699 (seekEntry!0 key!785 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(declare-fun b!898782 () Bool)

(declare-fun res!607197 () Bool)

(declare-fun e!502744 () Bool)

(assert (=> b!898782 (=> res!607197 e!502744)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52721 (_ BitVec 32)) Bool)

(assert (=> b!898782 (= res!607197 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10196 thiss!1181) (mask!26154 thiss!1181))))))

(declare-fun e!502749 () Bool)

(declare-fun tp_is_empty!18325 () Bool)

(declare-fun array_inv!19940 (array!52721) Bool)

(declare-fun array_inv!19941 (array!52723) Bool)

(assert (=> b!898783 (= e!502751 (and tp!56051 tp_is_empty!18325 (array_inv!19940 (_keys!10196 thiss!1181)) (array_inv!19941 (_values!5405 thiss!1181)) e!502749))))

(declare-fun b!898784 () Bool)

(assert (=> b!898784 (= e!502744 (and (bvsge (index!37852 lt!405699) #b00000000000000000000000000000000) (bvslt (index!37852 lt!405699) (size!25792 (_keys!10196 thiss!1181)))))))

(declare-fun b!898785 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898785 (= e!502748 (inRange!0 (index!37852 lt!405699) (mask!26154 thiss!1181)))))

(declare-fun b!898786 () Bool)

(declare-fun e!502743 () Bool)

(declare-fun mapRes!29133 () Bool)

(assert (=> b!898786 (= e!502749 (and e!502743 mapRes!29133))))

(declare-fun condMapEmpty!29133 () Bool)

(declare-fun mapDefault!29133 () ValueCell!8681)

(assert (=> b!898786 (= condMapEmpty!29133 (= (arr!25337 (_values!5405 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8681)) mapDefault!29133)))))

(declare-fun b!898787 () Bool)

(declare-fun res!607193 () Bool)

(assert (=> b!898787 (=> res!607193 e!502744)))

(assert (=> b!898787 (= res!607193 (or (not (= (size!25793 (_values!5405 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26154 thiss!1181)))) (not (= (size!25792 (_keys!10196 thiss!1181)) (size!25793 (_values!5405 thiss!1181)))) (bvslt (mask!26154 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5114 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5114 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29133 () Bool)

(assert (=> mapIsEmpty!29133 mapRes!29133))

(declare-fun b!898788 () Bool)

(declare-fun res!607196 () Bool)

(assert (=> b!898788 (=> res!607196 e!502744)))

(declare-datatypes ((List!17781 0))(
  ( (Nil!17778) (Cons!17777 (h!18925 (_ BitVec 64)) (t!25112 List!17781)) )
))
(declare-fun arrayNoDuplicates!0 (array!52721 (_ BitVec 32) List!17781) Bool)

(assert (=> b!898788 (= res!607196 (not (arrayNoDuplicates!0 (_keys!10196 thiss!1181) #b00000000000000000000000000000000 Nil!17778)))))

(declare-fun b!898789 () Bool)

(assert (=> b!898789 (= e!502743 tp_is_empty!18325)))

(declare-fun b!898790 () Bool)

(assert (=> b!898790 (= e!502747 e!502744)))

(declare-fun res!607199 () Bool)

(assert (=> b!898790 (=> res!607199 e!502744)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898790 (= res!607199 (not (validMask!0 (mask!26154 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898790 (arrayContainsKey!0 (_keys!10196 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405700 () Unit!30508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52721 (_ BitVec 64) (_ BitVec 32)) Unit!30508)

(assert (=> b!898790 (= lt!405700 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10196 thiss!1181) key!785 (index!37852 lt!405699)))))

(declare-fun mapNonEmpty!29133 () Bool)

(declare-fun tp!56052 () Bool)

(declare-fun e!502745 () Bool)

(assert (=> mapNonEmpty!29133 (= mapRes!29133 (and tp!56052 e!502745))))

(declare-fun mapValue!29133 () ValueCell!8681)

(declare-fun mapKey!29133 () (_ BitVec 32))

(declare-fun mapRest!29133 () (Array (_ BitVec 32) ValueCell!8681))

(assert (=> mapNonEmpty!29133 (= (arr!25337 (_values!5405 thiss!1181)) (store mapRest!29133 mapKey!29133 mapValue!29133))))

(declare-fun b!898791 () Bool)

(assert (=> b!898791 (= e!502745 tp_is_empty!18325)))

(declare-fun b!898792 () Bool)

(declare-fun res!607192 () Bool)

(assert (=> b!898792 (=> (not res!607192) (not e!502746))))

(assert (=> b!898792 (= res!607192 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76884 res!607195) b!898792))

(assert (= (and b!898792 res!607192) b!898781))

(assert (= (and b!898781 (not res!607194)) b!898785))

(assert (= (and b!898781 (not res!607198)) b!898790))

(assert (= (and b!898790 (not res!607199)) b!898787))

(assert (= (and b!898787 (not res!607193)) b!898782))

(assert (= (and b!898782 (not res!607197)) b!898788))

(assert (= (and b!898788 (not res!607196)) b!898784))

(assert (= (and b!898786 condMapEmpty!29133) mapIsEmpty!29133))

(assert (= (and b!898786 (not condMapEmpty!29133)) mapNonEmpty!29133))

(assert (= (and mapNonEmpty!29133 ((_ is ValueCellFull!8681) mapValue!29133)) b!898791))

(assert (= (and b!898786 ((_ is ValueCellFull!8681) mapDefault!29133)) b!898789))

(assert (= b!898783 b!898786))

(assert (= start!76884 b!898783))

(declare-fun m!835807 () Bool)

(assert (=> b!898782 m!835807))

(declare-fun m!835809 () Bool)

(assert (=> mapNonEmpty!29133 m!835809))

(declare-fun m!835811 () Bool)

(assert (=> start!76884 m!835811))

(declare-fun m!835813 () Bool)

(assert (=> b!898790 m!835813))

(declare-fun m!835815 () Bool)

(assert (=> b!898790 m!835815))

(declare-fun m!835817 () Bool)

(assert (=> b!898790 m!835817))

(declare-fun m!835819 () Bool)

(assert (=> b!898781 m!835819))

(declare-fun m!835821 () Bool)

(assert (=> b!898781 m!835821))

(declare-fun m!835823 () Bool)

(assert (=> b!898785 m!835823))

(declare-fun m!835825 () Bool)

(assert (=> b!898788 m!835825))

(declare-fun m!835827 () Bool)

(assert (=> b!898783 m!835827))

(declare-fun m!835829 () Bool)

(assert (=> b!898783 m!835829))

(check-sat (not b!898785) (not b!898782) (not mapNonEmpty!29133) tp_is_empty!18325 (not start!76884) (not b!898788) (not b!898783) (not b!898790) (not b!898781) (not b_next!15997) b_and!26299)
(check-sat b_and!26299 (not b_next!15997))
(get-model)

(declare-fun d!111485 () Bool)

(declare-fun e!502808 () Bool)

(assert (=> d!111485 e!502808))

(declare-fun res!607250 () Bool)

(assert (=> d!111485 (=> res!607250 e!502808)))

(declare-fun lt!405725 () SeekEntryResult!8870)

(assert (=> d!111485 (= res!607250 (not ((_ is Found!8870) lt!405725)))))

(assert (=> d!111485 (= lt!405725 (seekEntry!0 key!785 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(declare-fun lt!405724 () Unit!30508)

(declare-fun choose!1492 (array!52721 array!52723 (_ BitVec 32) (_ BitVec 32) V!29399 V!29399 (_ BitVec 64)) Unit!30508)

(assert (=> d!111485 (= lt!405724 (choose!1492 (_keys!10196 thiss!1181) (_values!5405 thiss!1181) (mask!26154 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785))))

(assert (=> d!111485 (validMask!0 (mask!26154 thiss!1181))))

(assert (=> d!111485 (= (lemmaSeekEntryGivesInRangeIndex!91 (_keys!10196 thiss!1181) (_values!5405 thiss!1181) (mask!26154 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785) lt!405724)))

(declare-fun b!898867 () Bool)

(assert (=> b!898867 (= e!502808 (inRange!0 (index!37852 lt!405725) (mask!26154 thiss!1181)))))

(assert (= (and d!111485 (not res!607250)) b!898867))

(assert (=> d!111485 m!835821))

(declare-fun m!835879 () Bool)

(assert (=> d!111485 m!835879))

(assert (=> d!111485 m!835813))

(declare-fun m!835881 () Bool)

(assert (=> b!898867 m!835881))

(assert (=> b!898781 d!111485))

(declare-fun b!898880 () Bool)

(declare-fun e!502816 () SeekEntryResult!8870)

(assert (=> b!898880 (= e!502816 Undefined!8870)))

(declare-fun b!898881 () Bool)

(declare-fun e!502815 () SeekEntryResult!8870)

(declare-fun lt!405735 () SeekEntryResult!8870)

(assert (=> b!898881 (= e!502815 (ite ((_ is MissingVacant!8870) lt!405735) (MissingZero!8870 (index!37854 lt!405735)) lt!405735))))

(declare-fun lt!405737 () SeekEntryResult!8870)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!898881 (= lt!405735 (seekKeyOrZeroReturnVacant!0 (x!76481 lt!405737) (index!37853 lt!405737) (index!37853 lt!405737) key!785 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(declare-fun d!111487 () Bool)

(declare-fun lt!405734 () SeekEntryResult!8870)

(assert (=> d!111487 (and (or ((_ is MissingVacant!8870) lt!405734) (not ((_ is Found!8870) lt!405734)) (and (bvsge (index!37852 lt!405734) #b00000000000000000000000000000000) (bvslt (index!37852 lt!405734) (size!25792 (_keys!10196 thiss!1181))))) (not ((_ is MissingVacant!8870) lt!405734)) (or (not ((_ is Found!8870) lt!405734)) (= (select (arr!25336 (_keys!10196 thiss!1181)) (index!37852 lt!405734)) key!785)))))

(assert (=> d!111487 (= lt!405734 e!502816)))

(declare-fun c!95174 () Bool)

(assert (=> d!111487 (= c!95174 (and ((_ is Intermediate!8870) lt!405737) (undefined!9682 lt!405737)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111487 (= lt!405737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26154 thiss!1181)) key!785 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(assert (=> d!111487 (validMask!0 (mask!26154 thiss!1181))))

(assert (=> d!111487 (= (seekEntry!0 key!785 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)) lt!405734)))

(declare-fun b!898882 () Bool)

(declare-fun c!95173 () Bool)

(declare-fun lt!405736 () (_ BitVec 64))

(assert (=> b!898882 (= c!95173 (= lt!405736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502817 () SeekEntryResult!8870)

(assert (=> b!898882 (= e!502817 e!502815)))

(declare-fun b!898883 () Bool)

(assert (=> b!898883 (= e!502817 (Found!8870 (index!37853 lt!405737)))))

(declare-fun b!898884 () Bool)

(assert (=> b!898884 (= e!502816 e!502817)))

(assert (=> b!898884 (= lt!405736 (select (arr!25336 (_keys!10196 thiss!1181)) (index!37853 lt!405737)))))

(declare-fun c!95172 () Bool)

(assert (=> b!898884 (= c!95172 (= lt!405736 key!785))))

(declare-fun b!898885 () Bool)

(assert (=> b!898885 (= e!502815 (MissingZero!8870 (index!37853 lt!405737)))))

(assert (= (and d!111487 c!95174) b!898880))

(assert (= (and d!111487 (not c!95174)) b!898884))

(assert (= (and b!898884 c!95172) b!898883))

(assert (= (and b!898884 (not c!95172)) b!898882))

(assert (= (and b!898882 c!95173) b!898885))

(assert (= (and b!898882 (not c!95173)) b!898881))

(declare-fun m!835883 () Bool)

(assert (=> b!898881 m!835883))

(declare-fun m!835885 () Bool)

(assert (=> d!111487 m!835885))

(declare-fun m!835887 () Bool)

(assert (=> d!111487 m!835887))

(assert (=> d!111487 m!835887))

(declare-fun m!835889 () Bool)

(assert (=> d!111487 m!835889))

(assert (=> d!111487 m!835813))

(declare-fun m!835891 () Bool)

(assert (=> b!898884 m!835891))

(assert (=> b!898781 d!111487))

(declare-fun d!111489 () Bool)

(assert (=> d!111489 (= (array_inv!19940 (_keys!10196 thiss!1181)) (bvsge (size!25792 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898783 d!111489))

(declare-fun d!111491 () Bool)

(assert (=> d!111491 (= (array_inv!19941 (_values!5405 thiss!1181)) (bvsge (size!25793 (_values!5405 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898783 d!111491))

(declare-fun b!898894 () Bool)

(declare-fun e!502826 () Bool)

(declare-fun e!502825 () Bool)

(assert (=> b!898894 (= e!502826 e!502825)))

(declare-fun lt!405745 () (_ BitVec 64))

(assert (=> b!898894 (= lt!405745 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405744 () Unit!30508)

(assert (=> b!898894 (= lt!405744 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10196 thiss!1181) lt!405745 #b00000000000000000000000000000000))))

(assert (=> b!898894 (arrayContainsKey!0 (_keys!10196 thiss!1181) lt!405745 #b00000000000000000000000000000000)))

(declare-fun lt!405746 () Unit!30508)

(assert (=> b!898894 (= lt!405746 lt!405744)))

(declare-fun res!607255 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52721 (_ BitVec 32)) SeekEntryResult!8870)

(assert (=> b!898894 (= res!607255 (= (seekEntryOrOpen!0 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000) (_keys!10196 thiss!1181) (mask!26154 thiss!1181)) (Found!8870 #b00000000000000000000000000000000)))))

(assert (=> b!898894 (=> (not res!607255) (not e!502825))))

(declare-fun d!111493 () Bool)

(declare-fun res!607256 () Bool)

(declare-fun e!502824 () Bool)

(assert (=> d!111493 (=> res!607256 e!502824)))

(assert (=> d!111493 (= res!607256 (bvsge #b00000000000000000000000000000000 (size!25792 (_keys!10196 thiss!1181))))))

(assert (=> d!111493 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)) e!502824)))

(declare-fun b!898895 () Bool)

(declare-fun call!39871 () Bool)

(assert (=> b!898895 (= e!502826 call!39871)))

(declare-fun b!898896 () Bool)

(assert (=> b!898896 (= e!502824 e!502826)))

(declare-fun c!95177 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898896 (= c!95177 (validKeyInArray!0 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898897 () Bool)

(assert (=> b!898897 (= e!502825 call!39871)))

(declare-fun bm!39868 () Bool)

(assert (=> bm!39868 (= call!39871 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(assert (= (and d!111493 (not res!607256)) b!898896))

(assert (= (and b!898896 c!95177) b!898894))

(assert (= (and b!898896 (not c!95177)) b!898895))

(assert (= (and b!898894 res!607255) b!898897))

(assert (= (or b!898897 b!898895) bm!39868))

(declare-fun m!835893 () Bool)

(assert (=> b!898894 m!835893))

(declare-fun m!835895 () Bool)

(assert (=> b!898894 m!835895))

(declare-fun m!835897 () Bool)

(assert (=> b!898894 m!835897))

(assert (=> b!898894 m!835893))

(declare-fun m!835899 () Bool)

(assert (=> b!898894 m!835899))

(assert (=> b!898896 m!835893))

(assert (=> b!898896 m!835893))

(declare-fun m!835901 () Bool)

(assert (=> b!898896 m!835901))

(declare-fun m!835903 () Bool)

(assert (=> bm!39868 m!835903))

(assert (=> b!898782 d!111493))

(declare-fun d!111495 () Bool)

(declare-fun res!607263 () Bool)

(declare-fun e!502829 () Bool)

(assert (=> d!111495 (=> (not res!607263) (not e!502829))))

(declare-fun simpleValid!321 (LongMapFixedSize!4378) Bool)

(assert (=> d!111495 (= res!607263 (simpleValid!321 thiss!1181))))

(assert (=> d!111495 (= (valid!1694 thiss!1181) e!502829)))

(declare-fun b!898904 () Bool)

(declare-fun res!607264 () Bool)

(assert (=> b!898904 (=> (not res!607264) (not e!502829))))

(declare-fun arrayCountValidKeys!0 (array!52721 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898904 (= res!607264 (= (arrayCountValidKeys!0 (_keys!10196 thiss!1181) #b00000000000000000000000000000000 (size!25792 (_keys!10196 thiss!1181))) (_size!2244 thiss!1181)))))

(declare-fun b!898905 () Bool)

(declare-fun res!607265 () Bool)

(assert (=> b!898905 (=> (not res!607265) (not e!502829))))

(assert (=> b!898905 (= res!607265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10196 thiss!1181) (mask!26154 thiss!1181)))))

(declare-fun b!898906 () Bool)

(assert (=> b!898906 (= e!502829 (arrayNoDuplicates!0 (_keys!10196 thiss!1181) #b00000000000000000000000000000000 Nil!17778))))

(assert (= (and d!111495 res!607263) b!898904))

(assert (= (and b!898904 res!607264) b!898905))

(assert (= (and b!898905 res!607265) b!898906))

(declare-fun m!835905 () Bool)

(assert (=> d!111495 m!835905))

(declare-fun m!835907 () Bool)

(assert (=> b!898904 m!835907))

(assert (=> b!898905 m!835807))

(assert (=> b!898906 m!835825))

(assert (=> start!76884 d!111495))

(declare-fun b!898917 () Bool)

(declare-fun e!502838 () Bool)

(declare-fun contains!4377 (List!17781 (_ BitVec 64)) Bool)

(assert (=> b!898917 (= e!502838 (contains!4377 Nil!17778 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898918 () Bool)

(declare-fun e!502839 () Bool)

(declare-fun call!39874 () Bool)

(assert (=> b!898918 (= e!502839 call!39874)))

(declare-fun bm!39871 () Bool)

(declare-fun c!95180 () Bool)

(assert (=> bm!39871 (= call!39874 (arrayNoDuplicates!0 (_keys!10196 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95180 (Cons!17777 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000) Nil!17778) Nil!17778)))))

(declare-fun b!898919 () Bool)

(assert (=> b!898919 (= e!502839 call!39874)))

(declare-fun b!898920 () Bool)

(declare-fun e!502841 () Bool)

(assert (=> b!898920 (= e!502841 e!502839)))

(assert (=> b!898920 (= c!95180 (validKeyInArray!0 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898921 () Bool)

(declare-fun e!502840 () Bool)

(assert (=> b!898921 (= e!502840 e!502841)))

(declare-fun res!607272 () Bool)

(assert (=> b!898921 (=> (not res!607272) (not e!502841))))

(assert (=> b!898921 (= res!607272 (not e!502838))))

(declare-fun res!607274 () Bool)

(assert (=> b!898921 (=> (not res!607274) (not e!502838))))

(assert (=> b!898921 (= res!607274 (validKeyInArray!0 (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111497 () Bool)

(declare-fun res!607273 () Bool)

(assert (=> d!111497 (=> res!607273 e!502840)))

(assert (=> d!111497 (= res!607273 (bvsge #b00000000000000000000000000000000 (size!25792 (_keys!10196 thiss!1181))))))

(assert (=> d!111497 (= (arrayNoDuplicates!0 (_keys!10196 thiss!1181) #b00000000000000000000000000000000 Nil!17778) e!502840)))

(assert (= (and d!111497 (not res!607273)) b!898921))

(assert (= (and b!898921 res!607274) b!898917))

(assert (= (and b!898921 res!607272) b!898920))

(assert (= (and b!898920 c!95180) b!898918))

(assert (= (and b!898920 (not c!95180)) b!898919))

(assert (= (or b!898918 b!898919) bm!39871))

(assert (=> b!898917 m!835893))

(assert (=> b!898917 m!835893))

(declare-fun m!835909 () Bool)

(assert (=> b!898917 m!835909))

(assert (=> bm!39871 m!835893))

(declare-fun m!835911 () Bool)

(assert (=> bm!39871 m!835911))

(assert (=> b!898920 m!835893))

(assert (=> b!898920 m!835893))

(assert (=> b!898920 m!835901))

(assert (=> b!898921 m!835893))

(assert (=> b!898921 m!835893))

(assert (=> b!898921 m!835901))

(assert (=> b!898788 d!111497))

(declare-fun d!111499 () Bool)

(assert (=> d!111499 (= (validMask!0 (mask!26154 thiss!1181)) (and (or (= (mask!26154 thiss!1181) #b00000000000000000000000000000111) (= (mask!26154 thiss!1181) #b00000000000000000000000000001111) (= (mask!26154 thiss!1181) #b00000000000000000000000000011111) (= (mask!26154 thiss!1181) #b00000000000000000000000000111111) (= (mask!26154 thiss!1181) #b00000000000000000000000001111111) (= (mask!26154 thiss!1181) #b00000000000000000000000011111111) (= (mask!26154 thiss!1181) #b00000000000000000000000111111111) (= (mask!26154 thiss!1181) #b00000000000000000000001111111111) (= (mask!26154 thiss!1181) #b00000000000000000000011111111111) (= (mask!26154 thiss!1181) #b00000000000000000000111111111111) (= (mask!26154 thiss!1181) #b00000000000000000001111111111111) (= (mask!26154 thiss!1181) #b00000000000000000011111111111111) (= (mask!26154 thiss!1181) #b00000000000000000111111111111111) (= (mask!26154 thiss!1181) #b00000000000000001111111111111111) (= (mask!26154 thiss!1181) #b00000000000000011111111111111111) (= (mask!26154 thiss!1181) #b00000000000000111111111111111111) (= (mask!26154 thiss!1181) #b00000000000001111111111111111111) (= (mask!26154 thiss!1181) #b00000000000011111111111111111111) (= (mask!26154 thiss!1181) #b00000000000111111111111111111111) (= (mask!26154 thiss!1181) #b00000000001111111111111111111111) (= (mask!26154 thiss!1181) #b00000000011111111111111111111111) (= (mask!26154 thiss!1181) #b00000000111111111111111111111111) (= (mask!26154 thiss!1181) #b00000001111111111111111111111111) (= (mask!26154 thiss!1181) #b00000011111111111111111111111111) (= (mask!26154 thiss!1181) #b00000111111111111111111111111111) (= (mask!26154 thiss!1181) #b00001111111111111111111111111111) (= (mask!26154 thiss!1181) #b00011111111111111111111111111111) (= (mask!26154 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26154 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898790 d!111499))

(declare-fun d!111501 () Bool)

(declare-fun res!607279 () Bool)

(declare-fun e!502846 () Bool)

(assert (=> d!111501 (=> res!607279 e!502846)))

(assert (=> d!111501 (= res!607279 (= (select (arr!25336 (_keys!10196 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111501 (= (arrayContainsKey!0 (_keys!10196 thiss!1181) key!785 #b00000000000000000000000000000000) e!502846)))

(declare-fun b!898926 () Bool)

(declare-fun e!502847 () Bool)

(assert (=> b!898926 (= e!502846 e!502847)))

(declare-fun res!607280 () Bool)

(assert (=> b!898926 (=> (not res!607280) (not e!502847))))

(assert (=> b!898926 (= res!607280 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25792 (_keys!10196 thiss!1181))))))

(declare-fun b!898927 () Bool)

(assert (=> b!898927 (= e!502847 (arrayContainsKey!0 (_keys!10196 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111501 (not res!607279)) b!898926))

(assert (= (and b!898926 res!607280) b!898927))

(assert (=> d!111501 m!835893))

(declare-fun m!835913 () Bool)

(assert (=> b!898927 m!835913))

(assert (=> b!898790 d!111501))

(declare-fun d!111503 () Bool)

(assert (=> d!111503 (arrayContainsKey!0 (_keys!10196 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405749 () Unit!30508)

(declare-fun choose!13 (array!52721 (_ BitVec 64) (_ BitVec 32)) Unit!30508)

(assert (=> d!111503 (= lt!405749 (choose!13 (_keys!10196 thiss!1181) key!785 (index!37852 lt!405699)))))

(assert (=> d!111503 (bvsge (index!37852 lt!405699) #b00000000000000000000000000000000)))

(assert (=> d!111503 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10196 thiss!1181) key!785 (index!37852 lt!405699)) lt!405749)))

(declare-fun bs!25215 () Bool)

(assert (= bs!25215 d!111503))

(assert (=> bs!25215 m!835815))

(declare-fun m!835915 () Bool)

(assert (=> bs!25215 m!835915))

(assert (=> b!898790 d!111503))

(declare-fun d!111505 () Bool)

(assert (=> d!111505 (= (inRange!0 (index!37852 lt!405699) (mask!26154 thiss!1181)) (and (bvsge (index!37852 lt!405699) #b00000000000000000000000000000000) (bvslt (index!37852 lt!405699) (bvadd (mask!26154 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898785 d!111505))

(declare-fun b!898934 () Bool)

(declare-fun e!502853 () Bool)

(assert (=> b!898934 (= e!502853 tp_is_empty!18325)))

(declare-fun mapNonEmpty!29142 () Bool)

(declare-fun mapRes!29142 () Bool)

(declare-fun tp!56067 () Bool)

(assert (=> mapNonEmpty!29142 (= mapRes!29142 (and tp!56067 e!502853))))

(declare-fun mapKey!29142 () (_ BitVec 32))

(declare-fun mapRest!29142 () (Array (_ BitVec 32) ValueCell!8681))

(declare-fun mapValue!29142 () ValueCell!8681)

(assert (=> mapNonEmpty!29142 (= mapRest!29133 (store mapRest!29142 mapKey!29142 mapValue!29142))))

(declare-fun b!898935 () Bool)

(declare-fun e!502852 () Bool)

(assert (=> b!898935 (= e!502852 tp_is_empty!18325)))

(declare-fun mapIsEmpty!29142 () Bool)

(assert (=> mapIsEmpty!29142 mapRes!29142))

(declare-fun condMapEmpty!29142 () Bool)

(declare-fun mapDefault!29142 () ValueCell!8681)

(assert (=> mapNonEmpty!29133 (= condMapEmpty!29142 (= mapRest!29133 ((as const (Array (_ BitVec 32) ValueCell!8681)) mapDefault!29142)))))

(assert (=> mapNonEmpty!29133 (= tp!56052 (and e!502852 mapRes!29142))))

(assert (= (and mapNonEmpty!29133 condMapEmpty!29142) mapIsEmpty!29142))

(assert (= (and mapNonEmpty!29133 (not condMapEmpty!29142)) mapNonEmpty!29142))

(assert (= (and mapNonEmpty!29142 ((_ is ValueCellFull!8681) mapValue!29142)) b!898934))

(assert (= (and mapNonEmpty!29133 ((_ is ValueCellFull!8681) mapDefault!29142)) b!898935))

(declare-fun m!835917 () Bool)

(assert (=> mapNonEmpty!29142 m!835917))

(check-sat (not b!898881) (not d!111485) (not b!898904) (not b!898894) (not bm!39868) (not b!898896) (not b!898867) (not bm!39871) tp_is_empty!18325 (not b!898906) (not mapNonEmpty!29142) (not d!111495) (not b!898921) (not b!898920) (not b!898905) (not d!111503) (not d!111487) (not b!898917) (not b_next!15997) (not b!898927) b_and!26299)
(check-sat b_and!26299 (not b_next!15997))
