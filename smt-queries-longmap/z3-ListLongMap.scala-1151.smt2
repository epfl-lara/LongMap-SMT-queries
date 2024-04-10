; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24182 () Bool)

(assert start!24182)

(declare-fun b!252900 () Bool)

(declare-fun b_free!6657 () Bool)

(declare-fun b_next!6657 () Bool)

(assert (=> b!252900 (= b_free!6657 (not b_next!6657))))

(declare-fun tp!23252 () Bool)

(declare-fun b_and!13695 () Bool)

(assert (=> b!252900 (= tp!23252 b_and!13695)))

(declare-fun bm!23835 () Bool)

(declare-datatypes ((V!8339 0))(
  ( (V!8340 (val!3304 Int)) )
))
(declare-datatypes ((ValueCell!2916 0))(
  ( (ValueCellFull!2916 (v!5376 V!8339)) (EmptyCell!2916) )
))
(declare-datatypes ((array!12365 0))(
  ( (array!12366 (arr!5860 (Array (_ BitVec 32) ValueCell!2916)) (size!6207 (_ BitVec 32))) )
))
(declare-datatypes ((array!12367 0))(
  ( (array!12368 (arr!5861 (Array (_ BitVec 32) (_ BitVec 64))) (size!6208 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3732 0))(
  ( (LongMapFixedSize!3733 (defaultEntry!4671 Int) (mask!10897 (_ BitVec 32)) (extraKeys!4408 (_ BitVec 32)) (zeroValue!4512 V!8339) (minValue!4512 V!8339) (_size!1915 (_ BitVec 32)) (_keys!6821 array!12367) (_values!4654 array!12365) (_vacant!1915 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3732)

(declare-fun c!42629 () Bool)

(declare-datatypes ((SeekEntryResult!1136 0))(
  ( (MissingZero!1136 (index!6714 (_ BitVec 32))) (Found!1136 (index!6715 (_ BitVec 32))) (Intermediate!1136 (undefined!1948 Bool) (index!6716 (_ BitVec 32)) (x!24792 (_ BitVec 32))) (Undefined!1136) (MissingVacant!1136 (index!6717 (_ BitVec 32))) )
))
(declare-fun lt!126762 () SeekEntryResult!1136)

(declare-fun call!23839 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23835 (= call!23839 (inRange!0 (ite c!42629 (index!6714 lt!126762) (index!6717 lt!126762)) (mask!10897 thiss!1504)))))

(declare-fun b!252891 () Bool)

(declare-fun res!123793 () Bool)

(declare-fun e!163986 () Bool)

(assert (=> b!252891 (=> res!123793 e!163986)))

(declare-datatypes ((List!3748 0))(
  ( (Nil!3745) (Cons!3744 (h!4406 (_ BitVec 64)) (t!8791 List!3748)) )
))
(declare-fun arrayNoDuplicates!0 (array!12367 (_ BitVec 32) List!3748) Bool)

(assert (=> b!252891 (= res!123793 (not (arrayNoDuplicates!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 Nil!3745)))))

(declare-fun b!252892 () Bool)

(declare-datatypes ((Unit!7830 0))(
  ( (Unit!7831) )
))
(declare-fun e!163991 () Unit!7830)

(declare-fun Unit!7832 () Unit!7830)

(assert (=> b!252892 (= e!163991 Unit!7832)))

(declare-fun lt!126770 () Unit!7830)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) Int) Unit!7830)

(assert (=> b!252892 (= lt!126770 (lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)))))

(assert (=> b!252892 false))

(declare-fun b!252893 () Bool)

(declare-fun res!123790 () Bool)

(declare-fun e!163992 () Bool)

(assert (=> b!252893 (=> (not res!123790) (not e!163992))))

(assert (=> b!252893 (= res!123790 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!252894 () Bool)

(declare-fun e!163989 () Bool)

(assert (=> b!252894 (= e!163989 (not e!163986))))

(declare-fun res!123788 () Bool)

(assert (=> b!252894 (=> res!123788 e!163986)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!252894 (= res!123788 (not (validMask!0 (mask!10897 thiss!1504))))))

(declare-fun lt!126767 () array!12367)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12367 (_ BitVec 32)) Bool)

(assert (=> b!252894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126767 (mask!10897 thiss!1504))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun lt!126765 () Unit!7830)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!12367 (_ BitVec 32) (_ BitVec 32)) Unit!7830)

(assert (=> b!252894 (= lt!126765 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) index!297 (mask!10897 thiss!1504)))))

(declare-fun arrayCountValidKeys!0 (array!12367 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!252894 (= (arrayCountValidKeys!0 lt!126767 #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504)))))))

(declare-fun lt!126766 () Unit!7830)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!12367 (_ BitVec 32) (_ BitVec 64)) Unit!7830)

(assert (=> b!252894 (= lt!126766 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6821 thiss!1504) index!297 key!932))))

(assert (=> b!252894 (arrayNoDuplicates!0 lt!126767 #b00000000000000000000000000000000 Nil!3745)))

(assert (=> b!252894 (= lt!126767 (array!12368 (store (arr!5861 (_keys!6821 thiss!1504)) index!297 key!932) (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun lt!126768 () Unit!7830)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3748) Unit!7830)

(assert (=> b!252894 (= lt!126768 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6821 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3745))))

(declare-fun lt!126764 () Unit!7830)

(declare-fun e!163993 () Unit!7830)

(assert (=> b!252894 (= lt!126764 e!163993)))

(declare-fun c!42630 () Bool)

(declare-fun arrayContainsKey!0 (array!12367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!252894 (= c!42630 (arrayContainsKey!0 (_keys!6821 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252896 () Bool)

(declare-fun e!163981 () Bool)

(declare-fun call!23838 () Bool)

(assert (=> b!252896 (= e!163981 (not call!23838))))

(declare-fun b!252897 () Bool)

(declare-fun res!123789 () Bool)

(declare-fun e!163982 () Bool)

(assert (=> b!252897 (=> (not res!123789) (not e!163982))))

(assert (=> b!252897 (= res!123789 call!23839)))

(declare-fun e!163987 () Bool)

(assert (=> b!252897 (= e!163987 e!163982)))

(declare-fun b!252898 () Bool)

(declare-fun res!123785 () Bool)

(assert (=> b!252898 (= res!123785 (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6717 lt!126762)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!252898 (=> (not res!123785) (not e!163981))))

(declare-fun b!252899 () Bool)

(declare-fun e!163983 () Bool)

(assert (=> b!252899 (= e!163992 e!163983)))

(declare-fun res!123791 () Bool)

(assert (=> b!252899 (=> (not res!123791) (not e!163983))))

(assert (=> b!252899 (= res!123791 (or (= lt!126762 (MissingZero!1136 index!297)) (= lt!126762 (MissingVacant!1136 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12367 (_ BitVec 32)) SeekEntryResult!1136)

(assert (=> b!252899 (= lt!126762 (seekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(declare-fun e!163980 () Bool)

(declare-fun tp_is_empty!6519 () Bool)

(declare-fun e!163985 () Bool)

(declare-fun array_inv!3875 (array!12367) Bool)

(declare-fun array_inv!3876 (array!12365) Bool)

(assert (=> b!252900 (= e!163985 (and tp!23252 tp_is_empty!6519 (array_inv!3875 (_keys!6821 thiss!1504)) (array_inv!3876 (_values!4654 thiss!1504)) e!163980))))

(declare-fun mapIsEmpty!11088 () Bool)

(declare-fun mapRes!11088 () Bool)

(assert (=> mapIsEmpty!11088 mapRes!11088))

(declare-fun mapNonEmpty!11088 () Bool)

(declare-fun tp!23253 () Bool)

(declare-fun e!163979 () Bool)

(assert (=> mapNonEmpty!11088 (= mapRes!11088 (and tp!23253 e!163979))))

(declare-fun mapRest!11088 () (Array (_ BitVec 32) ValueCell!2916))

(declare-fun mapValue!11088 () ValueCell!2916)

(declare-fun mapKey!11088 () (_ BitVec 32))

(assert (=> mapNonEmpty!11088 (= (arr!5860 (_values!4654 thiss!1504)) (store mapRest!11088 mapKey!11088 mapValue!11088))))

(declare-fun b!252901 () Bool)

(declare-fun res!123783 () Bool)

(assert (=> b!252901 (=> (not res!123783) (not e!163982))))

(assert (=> b!252901 (= res!123783 (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6714 lt!126762)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!252902 () Bool)

(declare-fun e!163988 () Bool)

(assert (=> b!252902 (= e!163988 tp_is_empty!6519)))

(declare-fun b!252903 () Bool)

(assert (=> b!252903 (= e!163986 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6821 thiss!1504)))))))

(declare-fun b!252904 () Bool)

(declare-fun e!163984 () Bool)

(get-info :version)

(assert (=> b!252904 (= e!163984 ((_ is Undefined!1136) lt!126762))))

(declare-fun b!252905 () Bool)

(declare-fun Unit!7833 () Unit!7830)

(assert (=> b!252905 (= e!163993 Unit!7833)))

(declare-fun b!252906 () Bool)

(assert (=> b!252906 (= e!163982 (not call!23838))))

(declare-fun b!252907 () Bool)

(declare-fun lt!126769 () Unit!7830)

(assert (=> b!252907 (= e!163991 lt!126769)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) Int) Unit!7830)

(assert (=> b!252907 (= lt!126769 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)))))

(assert (=> b!252907 (= c!42629 ((_ is MissingZero!1136) lt!126762))))

(assert (=> b!252907 e!163987))

(declare-fun b!252908 () Bool)

(assert (=> b!252908 (= e!163983 e!163989)))

(declare-fun res!123784 () Bool)

(assert (=> b!252908 (=> (not res!123784) (not e!163989))))

(assert (=> b!252908 (= res!123784 (inRange!0 index!297 (mask!10897 thiss!1504)))))

(declare-fun lt!126763 () Unit!7830)

(assert (=> b!252908 (= lt!126763 e!163991)))

(declare-fun c!42627 () Bool)

(declare-datatypes ((tuple2!4868 0))(
  ( (tuple2!4869 (_1!2445 (_ BitVec 64)) (_2!2445 V!8339)) )
))
(declare-datatypes ((List!3749 0))(
  ( (Nil!3746) (Cons!3745 (h!4407 tuple2!4868) (t!8792 List!3749)) )
))
(declare-datatypes ((ListLongMap!3781 0))(
  ( (ListLongMap!3782 (toList!1906 List!3749)) )
))
(declare-fun contains!1834 (ListLongMap!3781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1434 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 32) Int) ListLongMap!3781)

(assert (=> b!252908 (= c!42627 (contains!1834 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)) key!932))))

(declare-fun b!252909 () Bool)

(declare-fun res!123792 () Bool)

(assert (=> b!252909 (=> res!123792 e!163986)))

(assert (=> b!252909 (= res!123792 (or (not (= (size!6207 (_values!4654 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10897 thiss!1504)))) (not (= (size!6208 (_keys!6821 thiss!1504)) (size!6207 (_values!4654 thiss!1504)))) (bvslt (mask!10897 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4408 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4408 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!252910 () Bool)

(declare-fun c!42628 () Bool)

(assert (=> b!252910 (= c!42628 ((_ is MissingVacant!1136) lt!126762))))

(assert (=> b!252910 (= e!163987 e!163984)))

(declare-fun b!252911 () Bool)

(assert (=> b!252911 (= e!163984 e!163981)))

(declare-fun res!123794 () Bool)

(assert (=> b!252911 (= res!123794 call!23839)))

(assert (=> b!252911 (=> (not res!123794) (not e!163981))))

(declare-fun b!252895 () Bool)

(declare-fun res!123786 () Bool)

(assert (=> b!252895 (=> res!123786 e!163986)))

(assert (=> b!252895 (= res!123786 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6821 thiss!1504) (mask!10897 thiss!1504))))))

(declare-fun res!123787 () Bool)

(assert (=> start!24182 (=> (not res!123787) (not e!163992))))

(declare-fun valid!1461 (LongMapFixedSize!3732) Bool)

(assert (=> start!24182 (= res!123787 (valid!1461 thiss!1504))))

(assert (=> start!24182 e!163992))

(assert (=> start!24182 e!163985))

(assert (=> start!24182 true))

(declare-fun b!252912 () Bool)

(assert (=> b!252912 (= e!163980 (and e!163988 mapRes!11088))))

(declare-fun condMapEmpty!11088 () Bool)

(declare-fun mapDefault!11088 () ValueCell!2916)

(assert (=> b!252912 (= condMapEmpty!11088 (= (arr!5860 (_values!4654 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2916)) mapDefault!11088)))))

(declare-fun bm!23836 () Bool)

(assert (=> bm!23836 (= call!23838 (arrayContainsKey!0 (_keys!6821 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!252913 () Bool)

(assert (=> b!252913 (= e!163979 tp_is_empty!6519)))

(declare-fun b!252914 () Bool)

(declare-fun Unit!7834 () Unit!7830)

(assert (=> b!252914 (= e!163993 Unit!7834)))

(declare-fun lt!126771 () Unit!7830)

(declare-fun lemmaArrayContainsKeyThenInListMap!213 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) (_ BitVec 32) Int) Unit!7830)

(assert (=> b!252914 (= lt!126771 (lemmaArrayContainsKeyThenInListMap!213 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(assert (=> b!252914 false))

(assert (= (and start!24182 res!123787) b!252893))

(assert (= (and b!252893 res!123790) b!252899))

(assert (= (and b!252899 res!123791) b!252908))

(assert (= (and b!252908 c!42627) b!252892))

(assert (= (and b!252908 (not c!42627)) b!252907))

(assert (= (and b!252907 c!42629) b!252897))

(assert (= (and b!252907 (not c!42629)) b!252910))

(assert (= (and b!252897 res!123789) b!252901))

(assert (= (and b!252901 res!123783) b!252906))

(assert (= (and b!252910 c!42628) b!252911))

(assert (= (and b!252910 (not c!42628)) b!252904))

(assert (= (and b!252911 res!123794) b!252898))

(assert (= (and b!252898 res!123785) b!252896))

(assert (= (or b!252897 b!252911) bm!23835))

(assert (= (or b!252906 b!252896) bm!23836))

(assert (= (and b!252908 res!123784) b!252894))

(assert (= (and b!252894 c!42630) b!252914))

(assert (= (and b!252894 (not c!42630)) b!252905))

(assert (= (and b!252894 (not res!123788)) b!252909))

(assert (= (and b!252909 (not res!123792)) b!252895))

(assert (= (and b!252895 (not res!123786)) b!252891))

(assert (= (and b!252891 (not res!123793)) b!252903))

(assert (= (and b!252912 condMapEmpty!11088) mapIsEmpty!11088))

(assert (= (and b!252912 (not condMapEmpty!11088)) mapNonEmpty!11088))

(assert (= (and mapNonEmpty!11088 ((_ is ValueCellFull!2916) mapValue!11088)) b!252913))

(assert (= (and b!252912 ((_ is ValueCellFull!2916) mapDefault!11088)) b!252902))

(assert (= b!252900 b!252912))

(assert (= start!24182 b!252900))

(declare-fun m!268889 () Bool)

(assert (=> b!252898 m!268889))

(declare-fun m!268891 () Bool)

(assert (=> b!252895 m!268891))

(declare-fun m!268893 () Bool)

(assert (=> b!252907 m!268893))

(declare-fun m!268895 () Bool)

(assert (=> b!252894 m!268895))

(declare-fun m!268897 () Bool)

(assert (=> b!252894 m!268897))

(declare-fun m!268899 () Bool)

(assert (=> b!252894 m!268899))

(declare-fun m!268901 () Bool)

(assert (=> b!252894 m!268901))

(declare-fun m!268903 () Bool)

(assert (=> b!252894 m!268903))

(declare-fun m!268905 () Bool)

(assert (=> b!252894 m!268905))

(declare-fun m!268907 () Bool)

(assert (=> b!252894 m!268907))

(declare-fun m!268909 () Bool)

(assert (=> b!252894 m!268909))

(declare-fun m!268911 () Bool)

(assert (=> b!252894 m!268911))

(declare-fun m!268913 () Bool)

(assert (=> b!252894 m!268913))

(declare-fun m!268915 () Bool)

(assert (=> b!252891 m!268915))

(declare-fun m!268917 () Bool)

(assert (=> b!252892 m!268917))

(declare-fun m!268919 () Bool)

(assert (=> mapNonEmpty!11088 m!268919))

(declare-fun m!268921 () Bool)

(assert (=> b!252900 m!268921))

(declare-fun m!268923 () Bool)

(assert (=> b!252900 m!268923))

(declare-fun m!268925 () Bool)

(assert (=> b!252914 m!268925))

(declare-fun m!268927 () Bool)

(assert (=> b!252901 m!268927))

(declare-fun m!268929 () Bool)

(assert (=> bm!23835 m!268929))

(declare-fun m!268931 () Bool)

(assert (=> b!252908 m!268931))

(declare-fun m!268933 () Bool)

(assert (=> b!252908 m!268933))

(assert (=> b!252908 m!268933))

(declare-fun m!268935 () Bool)

(assert (=> b!252908 m!268935))

(declare-fun m!268937 () Bool)

(assert (=> b!252899 m!268937))

(assert (=> bm!23836 m!268897))

(declare-fun m!268939 () Bool)

(assert (=> start!24182 m!268939))

(check-sat (not start!24182) (not bm!23836) (not b!252891) (not b!252907) (not b!252895) (not b!252899) (not b!252894) (not b!252914) (not b!252900) (not b_next!6657) b_and!13695 (not bm!23835) (not mapNonEmpty!11088) (not b!252892) (not b!252908) tp_is_empty!6519)
(check-sat b_and!13695 (not b_next!6657))
(get-model)

(declare-fun d!61383 () Bool)

(assert (=> d!61383 (= (array_inv!3875 (_keys!6821 thiss!1504)) (bvsge (size!6208 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252900 d!61383))

(declare-fun d!61385 () Bool)

(assert (=> d!61385 (= (array_inv!3876 (_values!4654 thiss!1504)) (bvsge (size!6207 (_values!4654 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!252900 d!61385))

(declare-fun d!61387 () Bool)

(assert (=> d!61387 (= (inRange!0 (ite c!42629 (index!6714 lt!126762) (index!6717 lt!126762)) (mask!10897 thiss!1504)) (and (bvsge (ite c!42629 (index!6714 lt!126762) (index!6717 lt!126762)) #b00000000000000000000000000000000) (bvslt (ite c!42629 (index!6714 lt!126762) (index!6717 lt!126762)) (bvadd (mask!10897 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!23835 d!61387))

(declare-fun d!61389 () Bool)

(declare-fun res!123837 () Bool)

(declare-fun e!164041 () Bool)

(assert (=> d!61389 (=> (not res!123837) (not e!164041))))

(declare-fun simpleValid!268 (LongMapFixedSize!3732) Bool)

(assert (=> d!61389 (= res!123837 (simpleValid!268 thiss!1504))))

(assert (=> d!61389 (= (valid!1461 thiss!1504) e!164041)))

(declare-fun b!252993 () Bool)

(declare-fun res!123838 () Bool)

(assert (=> b!252993 (=> (not res!123838) (not e!164041))))

(assert (=> b!252993 (= res!123838 (= (arrayCountValidKeys!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (_size!1915 thiss!1504)))))

(declare-fun b!252994 () Bool)

(declare-fun res!123839 () Bool)

(assert (=> b!252994 (=> (not res!123839) (not e!164041))))

(assert (=> b!252994 (= res!123839 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(declare-fun b!252995 () Bool)

(assert (=> b!252995 (= e!164041 (arrayNoDuplicates!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 Nil!3745))))

(assert (= (and d!61389 res!123837) b!252993))

(assert (= (and b!252993 res!123838) b!252994))

(assert (= (and b!252994 res!123839) b!252995))

(declare-fun m!268993 () Bool)

(assert (=> d!61389 m!268993))

(assert (=> b!252993 m!268909))

(assert (=> b!252994 m!268891))

(assert (=> b!252995 m!268915))

(assert (=> start!24182 d!61389))

(declare-fun b!253006 () Bool)

(declare-fun e!164051 () Bool)

(declare-fun e!164050 () Bool)

(assert (=> b!253006 (= e!164051 e!164050)))

(declare-fun res!123847 () Bool)

(assert (=> b!253006 (=> (not res!123847) (not e!164050))))

(declare-fun e!164053 () Bool)

(assert (=> b!253006 (= res!123847 (not e!164053))))

(declare-fun res!123848 () Bool)

(assert (=> b!253006 (=> (not res!123848) (not e!164053))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!253006 (= res!123848 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61391 () Bool)

(declare-fun res!123846 () Bool)

(assert (=> d!61391 (=> res!123846 e!164051)))

(assert (=> d!61391 (= res!123846 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(assert (=> d!61391 (= (arrayNoDuplicates!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 Nil!3745) e!164051)))

(declare-fun b!253007 () Bool)

(declare-fun e!164052 () Bool)

(declare-fun call!23848 () Bool)

(assert (=> b!253007 (= e!164052 call!23848)))

(declare-fun b!253008 () Bool)

(declare-fun contains!1835 (List!3748 (_ BitVec 64)) Bool)

(assert (=> b!253008 (= e!164053 (contains!1835 Nil!3745 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253009 () Bool)

(assert (=> b!253009 (= e!164050 e!164052)))

(declare-fun c!42645 () Bool)

(assert (=> b!253009 (= c!42645 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253010 () Bool)

(assert (=> b!253010 (= e!164052 call!23848)))

(declare-fun bm!23845 () Bool)

(assert (=> bm!23845 (= call!23848 (arrayNoDuplicates!0 (_keys!6821 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42645 (Cons!3744 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000) Nil!3745) Nil!3745)))))

(assert (= (and d!61391 (not res!123846)) b!253006))

(assert (= (and b!253006 res!123848) b!253008))

(assert (= (and b!253006 res!123847) b!253009))

(assert (= (and b!253009 c!42645) b!253010))

(assert (= (and b!253009 (not c!42645)) b!253007))

(assert (= (or b!253010 b!253007) bm!23845))

(declare-fun m!268995 () Bool)

(assert (=> b!253006 m!268995))

(assert (=> b!253006 m!268995))

(declare-fun m!268997 () Bool)

(assert (=> b!253006 m!268997))

(assert (=> b!253008 m!268995))

(assert (=> b!253008 m!268995))

(declare-fun m!268999 () Bool)

(assert (=> b!253008 m!268999))

(assert (=> b!253009 m!268995))

(assert (=> b!253009 m!268995))

(assert (=> b!253009 m!268997))

(assert (=> bm!23845 m!268995))

(declare-fun m!269001 () Bool)

(assert (=> bm!23845 m!269001))

(assert (=> b!252891 d!61391))

(declare-fun b!253027 () Bool)

(declare-fun res!123860 () Bool)

(declare-fun e!164065 () Bool)

(assert (=> b!253027 (=> (not res!123860) (not e!164065))))

(declare-fun call!23853 () Bool)

(assert (=> b!253027 (= res!123860 call!23853)))

(declare-fun e!164063 () Bool)

(assert (=> b!253027 (= e!164063 e!164065)))

(declare-fun lt!126807 () SeekEntryResult!1136)

(declare-fun bm!23850 () Bool)

(declare-fun c!42650 () Bool)

(assert (=> bm!23850 (= call!23853 (inRange!0 (ite c!42650 (index!6714 lt!126807) (index!6717 lt!126807)) (mask!10897 thiss!1504)))))

(declare-fun b!253028 () Bool)

(assert (=> b!253028 (= e!164063 ((_ is Undefined!1136) lt!126807))))

(declare-fun b!253029 () Bool)

(declare-fun call!23854 () Bool)

(assert (=> b!253029 (= e!164065 (not call!23854))))

(declare-fun b!253030 () Bool)

(declare-fun e!164064 () Bool)

(assert (=> b!253030 (= e!164064 e!164063)))

(declare-fun c!42651 () Bool)

(assert (=> b!253030 (= c!42651 ((_ is MissingVacant!1136) lt!126807))))

(declare-fun b!253031 () Bool)

(declare-fun e!164062 () Bool)

(assert (=> b!253031 (= e!164062 (not call!23854))))

(declare-fun b!253032 () Bool)

(assert (=> b!253032 (and (bvsge (index!6714 lt!126807) #b00000000000000000000000000000000) (bvslt (index!6714 lt!126807) (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun res!123858 () Bool)

(assert (=> b!253032 (= res!123858 (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6714 lt!126807)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253032 (=> (not res!123858) (not e!164062))))

(declare-fun bm!23851 () Bool)

(assert (=> bm!23851 (= call!23854 (arrayContainsKey!0 (_keys!6821 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun d!61393 () Bool)

(assert (=> d!61393 e!164064))

(assert (=> d!61393 (= c!42650 ((_ is MissingZero!1136) lt!126807))))

(assert (=> d!61393 (= lt!126807 (seekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(declare-fun lt!126806 () Unit!7830)

(declare-fun choose!1206 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) Int) Unit!7830)

(assert (=> d!61393 (= lt!126806 (choose!1206 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)))))

(assert (=> d!61393 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61393 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!412 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)) lt!126806)))

(declare-fun b!253033 () Bool)

(assert (=> b!253033 (= e!164064 e!164062)))

(declare-fun res!123857 () Bool)

(assert (=> b!253033 (= res!123857 call!23853)))

(assert (=> b!253033 (=> (not res!123857) (not e!164062))))

(declare-fun b!253034 () Bool)

(declare-fun res!123859 () Bool)

(assert (=> b!253034 (=> (not res!123859) (not e!164065))))

(assert (=> b!253034 (= res!123859 (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6717 lt!126807)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253034 (and (bvsge (index!6717 lt!126807) #b00000000000000000000000000000000) (bvslt (index!6717 lt!126807) (size!6208 (_keys!6821 thiss!1504))))))

(assert (= (and d!61393 c!42650) b!253033))

(assert (= (and d!61393 (not c!42650)) b!253030))

(assert (= (and b!253033 res!123857) b!253032))

(assert (= (and b!253032 res!123858) b!253031))

(assert (= (and b!253030 c!42651) b!253027))

(assert (= (and b!253030 (not c!42651)) b!253028))

(assert (= (and b!253027 res!123860) b!253034))

(assert (= (and b!253034 res!123859) b!253029))

(assert (= (or b!253033 b!253027) bm!23850))

(assert (= (or b!253031 b!253029) bm!23851))

(assert (=> d!61393 m!268937))

(declare-fun m!269003 () Bool)

(assert (=> d!61393 m!269003))

(assert (=> d!61393 m!268895))

(declare-fun m!269005 () Bool)

(assert (=> b!253032 m!269005))

(declare-fun m!269007 () Bool)

(assert (=> b!253034 m!269007))

(assert (=> bm!23851 m!268897))

(declare-fun m!269009 () Bool)

(assert (=> bm!23850 m!269009))

(assert (=> b!252907 d!61393))

(declare-fun d!61395 () Bool)

(assert (=> d!61395 (= (inRange!0 index!297 (mask!10897 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10897 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!252908 d!61395))

(declare-fun d!61397 () Bool)

(declare-fun e!164070 () Bool)

(assert (=> d!61397 e!164070))

(declare-fun res!123863 () Bool)

(assert (=> d!61397 (=> res!123863 e!164070)))

(declare-fun lt!126816 () Bool)

(assert (=> d!61397 (= res!123863 (not lt!126816))))

(declare-fun lt!126819 () Bool)

(assert (=> d!61397 (= lt!126816 lt!126819)))

(declare-fun lt!126818 () Unit!7830)

(declare-fun e!164071 () Unit!7830)

(assert (=> d!61397 (= lt!126818 e!164071)))

(declare-fun c!42654 () Bool)

(assert (=> d!61397 (= c!42654 lt!126819)))

(declare-fun containsKey!295 (List!3749 (_ BitVec 64)) Bool)

(assert (=> d!61397 (= lt!126819 (containsKey!295 (toList!1906 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504))) key!932))))

(assert (=> d!61397 (= (contains!1834 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)) key!932) lt!126816)))

(declare-fun b!253041 () Bool)

(declare-fun lt!126817 () Unit!7830)

(assert (=> b!253041 (= e!164071 lt!126817)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!243 (List!3749 (_ BitVec 64)) Unit!7830)

(assert (=> b!253041 (= lt!126817 (lemmaContainsKeyImpliesGetValueByKeyDefined!243 (toList!1906 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504))) key!932))))

(declare-datatypes ((Option!309 0))(
  ( (Some!308 (v!5378 V!8339)) (None!307) )
))
(declare-fun isDefined!244 (Option!309) Bool)

(declare-fun getValueByKey!303 (List!3749 (_ BitVec 64)) Option!309)

(assert (=> b!253041 (isDefined!244 (getValueByKey!303 (toList!1906 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504))) key!932))))

(declare-fun b!253042 () Bool)

(declare-fun Unit!7839 () Unit!7830)

(assert (=> b!253042 (= e!164071 Unit!7839)))

(declare-fun b!253043 () Bool)

(assert (=> b!253043 (= e!164070 (isDefined!244 (getValueByKey!303 (toList!1906 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504))) key!932)))))

(assert (= (and d!61397 c!42654) b!253041))

(assert (= (and d!61397 (not c!42654)) b!253042))

(assert (= (and d!61397 (not res!123863)) b!253043))

(declare-fun m!269011 () Bool)

(assert (=> d!61397 m!269011))

(declare-fun m!269013 () Bool)

(assert (=> b!253041 m!269013))

(declare-fun m!269015 () Bool)

(assert (=> b!253041 m!269015))

(assert (=> b!253041 m!269015))

(declare-fun m!269017 () Bool)

(assert (=> b!253041 m!269017))

(assert (=> b!253043 m!269015))

(assert (=> b!253043 m!269015))

(assert (=> b!253043 m!269017))

(assert (=> b!252908 d!61397))

(declare-fun b!253086 () Bool)

(declare-fun res!123887 () Bool)

(declare-fun e!164104 () Bool)

(assert (=> b!253086 (=> (not res!123887) (not e!164104))))

(declare-fun e!164108 () Bool)

(assert (=> b!253086 (= res!123887 e!164108)))

(declare-fun res!123886 () Bool)

(assert (=> b!253086 (=> res!123886 e!164108)))

(declare-fun e!164106 () Bool)

(assert (=> b!253086 (= res!123886 (not e!164106))))

(declare-fun res!123882 () Bool)

(assert (=> b!253086 (=> (not res!123882) (not e!164106))))

(assert (=> b!253086 (= res!123882 (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253087 () Bool)

(assert (=> b!253087 (= e!164106 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!61399 () Bool)

(assert (=> d!61399 e!164104))

(declare-fun res!123885 () Bool)

(assert (=> d!61399 (=> (not res!123885) (not e!164104))))

(assert (=> d!61399 (= res!123885 (or (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))))

(declare-fun lt!126882 () ListLongMap!3781)

(declare-fun lt!126876 () ListLongMap!3781)

(assert (=> d!61399 (= lt!126882 lt!126876)))

(declare-fun lt!126866 () Unit!7830)

(declare-fun e!164103 () Unit!7830)

(assert (=> d!61399 (= lt!126866 e!164103)))

(declare-fun c!42672 () Bool)

(declare-fun e!164101 () Bool)

(assert (=> d!61399 (= c!42672 e!164101)))

(declare-fun res!123889 () Bool)

(assert (=> d!61399 (=> (not res!123889) (not e!164101))))

(assert (=> d!61399 (= res!123889 (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun e!164099 () ListLongMap!3781)

(assert (=> d!61399 (= lt!126876 e!164099)))

(declare-fun c!42669 () Bool)

(assert (=> d!61399 (= c!42669 (and (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!61399 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61399 (= (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)) lt!126882)))

(declare-fun b!253088 () Bool)

(declare-fun c!42667 () Bool)

(assert (=> b!253088 (= c!42667 (and (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!164098 () ListLongMap!3781)

(declare-fun e!164109 () ListLongMap!3781)

(assert (=> b!253088 (= e!164098 e!164109)))

(declare-fun b!253089 () Bool)

(declare-fun e!164110 () Bool)

(assert (=> b!253089 (= e!164108 e!164110)))

(declare-fun res!123883 () Bool)

(assert (=> b!253089 (=> (not res!123883) (not e!164110))))

(assert (=> b!253089 (= res!123883 (contains!1834 lt!126882 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!253089 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253090 () Bool)

(declare-fun e!164107 () Bool)

(declare-fun call!23870 () Bool)

(assert (=> b!253090 (= e!164107 (not call!23870))))

(declare-fun b!253091 () Bool)

(declare-fun e!164105 () Bool)

(declare-fun e!164102 () Bool)

(assert (=> b!253091 (= e!164105 e!164102)))

(declare-fun res!123888 () Bool)

(declare-fun call!23874 () Bool)

(assert (=> b!253091 (= res!123888 call!23874)))

(assert (=> b!253091 (=> (not res!123888) (not e!164102))))

(declare-fun b!253092 () Bool)

(assert (=> b!253092 (= e!164101 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!253093 () Bool)

(assert (=> b!253093 (= e!164104 e!164107)))

(declare-fun c!42671 () Bool)

(assert (=> b!253093 (= c!42671 (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!253094 () Bool)

(declare-fun lt!126879 () Unit!7830)

(assert (=> b!253094 (= e!164103 lt!126879)))

(declare-fun lt!126885 () ListLongMap!3781)

(declare-fun getCurrentListMapNoExtraKeys!567 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 32) Int) ListLongMap!3781)

(assert (=> b!253094 (= lt!126885 (getCurrentListMapNoExtraKeys!567 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(declare-fun lt!126881 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126865 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126865 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126867 () Unit!7830)

(declare-fun addStillContains!221 (ListLongMap!3781 (_ BitVec 64) V!8339 (_ BitVec 64)) Unit!7830)

(assert (=> b!253094 (= lt!126867 (addStillContains!221 lt!126885 lt!126881 (zeroValue!4512 thiss!1504) lt!126865))))

(declare-fun +!672 (ListLongMap!3781 tuple2!4868) ListLongMap!3781)

(assert (=> b!253094 (contains!1834 (+!672 lt!126885 (tuple2!4869 lt!126881 (zeroValue!4512 thiss!1504))) lt!126865)))

(declare-fun lt!126878 () Unit!7830)

(assert (=> b!253094 (= lt!126878 lt!126867)))

(declare-fun lt!126864 () ListLongMap!3781)

(assert (=> b!253094 (= lt!126864 (getCurrentListMapNoExtraKeys!567 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(declare-fun lt!126872 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126872 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126868 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126868 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126873 () Unit!7830)

(declare-fun addApplyDifferent!221 (ListLongMap!3781 (_ BitVec 64) V!8339 (_ BitVec 64)) Unit!7830)

(assert (=> b!253094 (= lt!126873 (addApplyDifferent!221 lt!126864 lt!126872 (minValue!4512 thiss!1504) lt!126868))))

(declare-fun apply!245 (ListLongMap!3781 (_ BitVec 64)) V!8339)

(assert (=> b!253094 (= (apply!245 (+!672 lt!126864 (tuple2!4869 lt!126872 (minValue!4512 thiss!1504))) lt!126868) (apply!245 lt!126864 lt!126868))))

(declare-fun lt!126871 () Unit!7830)

(assert (=> b!253094 (= lt!126871 lt!126873)))

(declare-fun lt!126874 () ListLongMap!3781)

(assert (=> b!253094 (= lt!126874 (getCurrentListMapNoExtraKeys!567 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(declare-fun lt!126880 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126880 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126870 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126870 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126875 () Unit!7830)

(assert (=> b!253094 (= lt!126875 (addApplyDifferent!221 lt!126874 lt!126880 (zeroValue!4512 thiss!1504) lt!126870))))

(assert (=> b!253094 (= (apply!245 (+!672 lt!126874 (tuple2!4869 lt!126880 (zeroValue!4512 thiss!1504))) lt!126870) (apply!245 lt!126874 lt!126870))))

(declare-fun lt!126869 () Unit!7830)

(assert (=> b!253094 (= lt!126869 lt!126875)))

(declare-fun lt!126877 () ListLongMap!3781)

(assert (=> b!253094 (= lt!126877 (getCurrentListMapNoExtraKeys!567 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(declare-fun lt!126883 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126883 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!126884 () (_ BitVec 64))

(assert (=> b!253094 (= lt!126884 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!253094 (= lt!126879 (addApplyDifferent!221 lt!126877 lt!126883 (minValue!4512 thiss!1504) lt!126884))))

(assert (=> b!253094 (= (apply!245 (+!672 lt!126877 (tuple2!4869 lt!126883 (minValue!4512 thiss!1504))) lt!126884) (apply!245 lt!126877 lt!126884))))

(declare-fun b!253095 () Bool)

(declare-fun get!3018 (ValueCell!2916 V!8339) V!8339)

(declare-fun dynLambda!588 (Int (_ BitVec 64)) V!8339)

(assert (=> b!253095 (= e!164110 (= (apply!245 lt!126882 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)) (get!3018 (select (arr!5860 (_values!4654 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!588 (defaultEntry!4671 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!253095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6207 (_values!4654 thiss!1504))))))

(assert (=> b!253095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253096 () Bool)

(assert (=> b!253096 (= e!164105 (not call!23874))))

(declare-fun bm!23866 () Bool)

(assert (=> bm!23866 (= call!23870 (contains!1834 lt!126882 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253097 () Bool)

(declare-fun e!164100 () Bool)

(assert (=> b!253097 (= e!164107 e!164100)))

(declare-fun res!123884 () Bool)

(assert (=> b!253097 (= res!123884 call!23870)))

(assert (=> b!253097 (=> (not res!123884) (not e!164100))))

(declare-fun b!253098 () Bool)

(declare-fun call!23871 () ListLongMap!3781)

(assert (=> b!253098 (= e!164109 call!23871)))

(declare-fun bm!23867 () Bool)

(declare-fun call!23872 () ListLongMap!3781)

(declare-fun call!23875 () ListLongMap!3781)

(assert (=> bm!23867 (= call!23872 call!23875)))

(declare-fun b!253099 () Bool)

(assert (=> b!253099 (= e!164102 (= (apply!245 lt!126882 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4512 thiss!1504)))))

(declare-fun b!253100 () Bool)

(assert (=> b!253100 (= e!164109 call!23872)))

(declare-fun bm!23868 () Bool)

(declare-fun call!23869 () ListLongMap!3781)

(assert (=> bm!23868 (= call!23869 (getCurrentListMapNoExtraKeys!567 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(declare-fun b!253101 () Bool)

(assert (=> b!253101 (= e!164099 e!164098)))

(declare-fun c!42670 () Bool)

(assert (=> b!253101 (= c!42670 (and (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!23869 () Bool)

(assert (=> bm!23869 (= call!23874 (contains!1834 lt!126882 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!253102 () Bool)

(declare-fun Unit!7840 () Unit!7830)

(assert (=> b!253102 (= e!164103 Unit!7840)))

(declare-fun bm!23870 () Bool)

(declare-fun call!23873 () ListLongMap!3781)

(assert (=> bm!23870 (= call!23875 (+!672 (ite c!42669 call!23869 (ite c!42670 call!23873 call!23871)) (ite (or c!42669 c!42670) (tuple2!4869 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4512 thiss!1504)) (tuple2!4869 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4512 thiss!1504)))))))

(declare-fun b!253103 () Bool)

(assert (=> b!253103 (= e!164099 (+!672 call!23875 (tuple2!4869 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4512 thiss!1504))))))

(declare-fun bm!23871 () Bool)

(assert (=> bm!23871 (= call!23871 call!23873)))

(declare-fun b!253104 () Bool)

(assert (=> b!253104 (= e!164098 call!23872)))

(declare-fun b!253105 () Bool)

(assert (=> b!253105 (= e!164100 (= (apply!245 lt!126882 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4512 thiss!1504)))))

(declare-fun b!253106 () Bool)

(declare-fun res!123890 () Bool)

(assert (=> b!253106 (=> (not res!123890) (not e!164104))))

(assert (=> b!253106 (= res!123890 e!164105)))

(declare-fun c!42668 () Bool)

(assert (=> b!253106 (= c!42668 (not (= (bvand (extraKeys!4408 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!23872 () Bool)

(assert (=> bm!23872 (= call!23873 call!23869)))

(assert (= (and d!61399 c!42669) b!253103))

(assert (= (and d!61399 (not c!42669)) b!253101))

(assert (= (and b!253101 c!42670) b!253104))

(assert (= (and b!253101 (not c!42670)) b!253088))

(assert (= (and b!253088 c!42667) b!253100))

(assert (= (and b!253088 (not c!42667)) b!253098))

(assert (= (or b!253100 b!253098) bm!23871))

(assert (= (or b!253104 bm!23871) bm!23872))

(assert (= (or b!253104 b!253100) bm!23867))

(assert (= (or b!253103 bm!23872) bm!23868))

(assert (= (or b!253103 bm!23867) bm!23870))

(assert (= (and d!61399 res!123889) b!253092))

(assert (= (and d!61399 c!42672) b!253094))

(assert (= (and d!61399 (not c!42672)) b!253102))

(assert (= (and d!61399 res!123885) b!253086))

(assert (= (and b!253086 res!123882) b!253087))

(assert (= (and b!253086 (not res!123886)) b!253089))

(assert (= (and b!253089 res!123883) b!253095))

(assert (= (and b!253086 res!123887) b!253106))

(assert (= (and b!253106 c!42668) b!253091))

(assert (= (and b!253106 (not c!42668)) b!253096))

(assert (= (and b!253091 res!123888) b!253099))

(assert (= (or b!253091 b!253096) bm!23869))

(assert (= (and b!253106 res!123890) b!253093))

(assert (= (and b!253093 c!42671) b!253097))

(assert (= (and b!253093 (not c!42671)) b!253090))

(assert (= (and b!253097 res!123884) b!253105))

(assert (= (or b!253097 b!253090) bm!23866))

(declare-fun b_lambda!8123 () Bool)

(assert (=> (not b_lambda!8123) (not b!253095)))

(declare-fun t!8794 () Bool)

(declare-fun tb!3003 () Bool)

(assert (=> (and b!252900 (= (defaultEntry!4671 thiss!1504) (defaultEntry!4671 thiss!1504)) t!8794) tb!3003))

(declare-fun result!5331 () Bool)

(assert (=> tb!3003 (= result!5331 tp_is_empty!6519)))

(assert (=> b!253095 t!8794))

(declare-fun b_and!13699 () Bool)

(assert (= b_and!13695 (and (=> t!8794 result!5331) b_and!13699)))

(assert (=> d!61399 m!268895))

(declare-fun m!269019 () Bool)

(assert (=> b!253103 m!269019))

(assert (=> b!253095 m!268995))

(declare-fun m!269021 () Bool)

(assert (=> b!253095 m!269021))

(declare-fun m!269023 () Bool)

(assert (=> b!253095 m!269023))

(declare-fun m!269025 () Bool)

(assert (=> b!253095 m!269025))

(assert (=> b!253095 m!269025))

(assert (=> b!253095 m!269023))

(declare-fun m!269027 () Bool)

(assert (=> b!253095 m!269027))

(assert (=> b!253095 m!268995))

(assert (=> b!253092 m!268995))

(assert (=> b!253092 m!268995))

(assert (=> b!253092 m!268997))

(declare-fun m!269029 () Bool)

(assert (=> b!253105 m!269029))

(declare-fun m!269031 () Bool)

(assert (=> bm!23869 m!269031))

(assert (=> b!253089 m!268995))

(assert (=> b!253089 m!268995))

(declare-fun m!269033 () Bool)

(assert (=> b!253089 m!269033))

(declare-fun m!269035 () Bool)

(assert (=> bm!23866 m!269035))

(declare-fun m!269037 () Bool)

(assert (=> b!253094 m!269037))

(declare-fun m!269039 () Bool)

(assert (=> b!253094 m!269039))

(assert (=> b!253094 m!268995))

(declare-fun m!269041 () Bool)

(assert (=> b!253094 m!269041))

(declare-fun m!269043 () Bool)

(assert (=> b!253094 m!269043))

(declare-fun m!269045 () Bool)

(assert (=> b!253094 m!269045))

(declare-fun m!269047 () Bool)

(assert (=> b!253094 m!269047))

(declare-fun m!269049 () Bool)

(assert (=> b!253094 m!269049))

(declare-fun m!269051 () Bool)

(assert (=> b!253094 m!269051))

(declare-fun m!269053 () Bool)

(assert (=> b!253094 m!269053))

(declare-fun m!269055 () Bool)

(assert (=> b!253094 m!269055))

(declare-fun m!269057 () Bool)

(assert (=> b!253094 m!269057))

(declare-fun m!269059 () Bool)

(assert (=> b!253094 m!269059))

(assert (=> b!253094 m!269057))

(assert (=> b!253094 m!269051))

(assert (=> b!253094 m!269039))

(declare-fun m!269061 () Bool)

(assert (=> b!253094 m!269061))

(declare-fun m!269063 () Bool)

(assert (=> b!253094 m!269063))

(assert (=> b!253094 m!269063))

(declare-fun m!269065 () Bool)

(assert (=> b!253094 m!269065))

(declare-fun m!269067 () Bool)

(assert (=> b!253094 m!269067))

(assert (=> bm!23868 m!269049))

(assert (=> b!253087 m!268995))

(assert (=> b!253087 m!268995))

(assert (=> b!253087 m!268997))

(declare-fun m!269069 () Bool)

(assert (=> b!253099 m!269069))

(declare-fun m!269071 () Bool)

(assert (=> bm!23870 m!269071))

(assert (=> b!252908 d!61399))

(declare-fun b!253121 () Bool)

(declare-fun e!164119 () SeekEntryResult!1136)

(declare-fun lt!126894 () SeekEntryResult!1136)

(assert (=> b!253121 (= e!164119 (MissingZero!1136 (index!6716 lt!126894)))))

(declare-fun b!253122 () Bool)

(declare-fun e!164118 () SeekEntryResult!1136)

(assert (=> b!253122 (= e!164118 (Found!1136 (index!6716 lt!126894)))))

(declare-fun b!253123 () Bool)

(declare-fun e!164117 () SeekEntryResult!1136)

(assert (=> b!253123 (= e!164117 e!164118)))

(declare-fun lt!126893 () (_ BitVec 64))

(assert (=> b!253123 (= lt!126893 (select (arr!5861 (_keys!6821 thiss!1504)) (index!6716 lt!126894)))))

(declare-fun c!42679 () Bool)

(assert (=> b!253123 (= c!42679 (= lt!126893 key!932))))

(declare-fun b!253124 () Bool)

(declare-fun c!42681 () Bool)

(assert (=> b!253124 (= c!42681 (= lt!126893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253124 (= e!164118 e!164119)))

(declare-fun d!61401 () Bool)

(declare-fun lt!126892 () SeekEntryResult!1136)

(assert (=> d!61401 (and (or ((_ is Undefined!1136) lt!126892) (not ((_ is Found!1136) lt!126892)) (and (bvsge (index!6715 lt!126892) #b00000000000000000000000000000000) (bvslt (index!6715 lt!126892) (size!6208 (_keys!6821 thiss!1504))))) (or ((_ is Undefined!1136) lt!126892) ((_ is Found!1136) lt!126892) (not ((_ is MissingZero!1136) lt!126892)) (and (bvsge (index!6714 lt!126892) #b00000000000000000000000000000000) (bvslt (index!6714 lt!126892) (size!6208 (_keys!6821 thiss!1504))))) (or ((_ is Undefined!1136) lt!126892) ((_ is Found!1136) lt!126892) ((_ is MissingZero!1136) lt!126892) (not ((_ is MissingVacant!1136) lt!126892)) (and (bvsge (index!6717 lt!126892) #b00000000000000000000000000000000) (bvslt (index!6717 lt!126892) (size!6208 (_keys!6821 thiss!1504))))) (or ((_ is Undefined!1136) lt!126892) (ite ((_ is Found!1136) lt!126892) (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6715 lt!126892)) key!932) (ite ((_ is MissingZero!1136) lt!126892) (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6714 lt!126892)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1136) lt!126892) (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6717 lt!126892)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!61401 (= lt!126892 e!164117)))

(declare-fun c!42680 () Bool)

(assert (=> d!61401 (= c!42680 (and ((_ is Intermediate!1136) lt!126894) (undefined!1948 lt!126894)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12367 (_ BitVec 32)) SeekEntryResult!1136)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!61401 (= lt!126894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10897 thiss!1504)) key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(assert (=> d!61401 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61401 (= (seekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)) lt!126892)))

(declare-fun b!253125 () Bool)

(assert (=> b!253125 (= e!164117 Undefined!1136)))

(declare-fun b!253126 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12367 (_ BitVec 32)) SeekEntryResult!1136)

(assert (=> b!253126 (= e!164119 (seekKeyOrZeroReturnVacant!0 (x!24792 lt!126894) (index!6716 lt!126894) (index!6716 lt!126894) key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(assert (= (and d!61401 c!42680) b!253125))

(assert (= (and d!61401 (not c!42680)) b!253123))

(assert (= (and b!253123 c!42679) b!253122))

(assert (= (and b!253123 (not c!42679)) b!253124))

(assert (= (and b!253124 c!42681) b!253121))

(assert (= (and b!253124 (not c!42681)) b!253126))

(declare-fun m!269073 () Bool)

(assert (=> b!253123 m!269073))

(declare-fun m!269075 () Bool)

(assert (=> d!61401 m!269075))

(declare-fun m!269077 () Bool)

(assert (=> d!61401 m!269077))

(declare-fun m!269079 () Bool)

(assert (=> d!61401 m!269079))

(declare-fun m!269081 () Bool)

(assert (=> d!61401 m!269081))

(assert (=> d!61401 m!268895))

(assert (=> d!61401 m!269075))

(declare-fun m!269083 () Bool)

(assert (=> d!61401 m!269083))

(declare-fun m!269085 () Bool)

(assert (=> b!253126 m!269085))

(assert (=> b!252899 d!61401))

(declare-fun bm!23875 () Bool)

(declare-fun call!23878 () Bool)

(assert (=> bm!23875 (= call!23878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(declare-fun b!253136 () Bool)

(declare-fun e!164128 () Bool)

(declare-fun e!164127 () Bool)

(assert (=> b!253136 (= e!164128 e!164127)))

(declare-fun lt!126901 () (_ BitVec 64))

(assert (=> b!253136 (= lt!126901 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!126903 () Unit!7830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12367 (_ BitVec 64) (_ BitVec 32)) Unit!7830)

(assert (=> b!253136 (= lt!126903 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6821 thiss!1504) lt!126901 #b00000000000000000000000000000000))))

(assert (=> b!253136 (arrayContainsKey!0 (_keys!6821 thiss!1504) lt!126901 #b00000000000000000000000000000000)))

(declare-fun lt!126902 () Unit!7830)

(assert (=> b!253136 (= lt!126902 lt!126903)))

(declare-fun res!123895 () Bool)

(assert (=> b!253136 (= res!123895 (= (seekEntryOrOpen!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000) (_keys!6821 thiss!1504) (mask!10897 thiss!1504)) (Found!1136 #b00000000000000000000000000000000)))))

(assert (=> b!253136 (=> (not res!123895) (not e!164127))))

(declare-fun b!253137 () Bool)

(assert (=> b!253137 (= e!164128 call!23878)))

(declare-fun b!253138 () Bool)

(assert (=> b!253138 (= e!164127 call!23878)))

(declare-fun d!61403 () Bool)

(declare-fun res!123896 () Bool)

(declare-fun e!164126 () Bool)

(assert (=> d!61403 (=> res!123896 e!164126)))

(assert (=> d!61403 (= res!123896 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(assert (=> d!61403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)) e!164126)))

(declare-fun b!253135 () Bool)

(assert (=> b!253135 (= e!164126 e!164128)))

(declare-fun c!42684 () Bool)

(assert (=> b!253135 (= c!42684 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61403 (not res!123896)) b!253135))

(assert (= (and b!253135 c!42684) b!253136))

(assert (= (and b!253135 (not c!42684)) b!253137))

(assert (= (and b!253136 res!123895) b!253138))

(assert (= (or b!253138 b!253137) bm!23875))

(declare-fun m!269087 () Bool)

(assert (=> bm!23875 m!269087))

(assert (=> b!253136 m!268995))

(declare-fun m!269089 () Bool)

(assert (=> b!253136 m!269089))

(declare-fun m!269091 () Bool)

(assert (=> b!253136 m!269091))

(assert (=> b!253136 m!268995))

(declare-fun m!269093 () Bool)

(assert (=> b!253136 m!269093))

(assert (=> b!253135 m!268995))

(assert (=> b!253135 m!268995))

(assert (=> b!253135 m!268997))

(assert (=> b!252895 d!61403))

(declare-fun d!61405 () Bool)

(assert (=> d!61405 (contains!1834 (getCurrentListMap!1434 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)) key!932)))

(declare-fun lt!126906 () Unit!7830)

(declare-fun choose!1207 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) (_ BitVec 32) Int) Unit!7830)

(assert (=> d!61405 (= lt!126906 (choose!1207 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)))))

(assert (=> d!61405 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61405 (= (lemmaArrayContainsKeyThenInListMap!213 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4671 thiss!1504)) lt!126906)))

(declare-fun bs!9035 () Bool)

(assert (= bs!9035 d!61405))

(assert (=> bs!9035 m!268933))

(assert (=> bs!9035 m!268933))

(assert (=> bs!9035 m!268935))

(declare-fun m!269095 () Bool)

(assert (=> bs!9035 m!269095))

(assert (=> bs!9035 m!268895))

(assert (=> b!252914 d!61405))

(declare-fun d!61407 () Bool)

(declare-fun e!164131 () Bool)

(assert (=> d!61407 e!164131))

(declare-fun res!123901 () Bool)

(assert (=> d!61407 (=> (not res!123901) (not e!164131))))

(declare-fun lt!126912 () SeekEntryResult!1136)

(assert (=> d!61407 (= res!123901 ((_ is Found!1136) lt!126912))))

(assert (=> d!61407 (= lt!126912 (seekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) (mask!10897 thiss!1504)))))

(declare-fun lt!126911 () Unit!7830)

(declare-fun choose!1208 (array!12367 array!12365 (_ BitVec 32) (_ BitVec 32) V!8339 V!8339 (_ BitVec 64) Int) Unit!7830)

(assert (=> d!61407 (= lt!126911 (choose!1208 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)))))

(assert (=> d!61407 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61407 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!408 (_keys!6821 thiss!1504) (_values!4654 thiss!1504) (mask!10897 thiss!1504) (extraKeys!4408 thiss!1504) (zeroValue!4512 thiss!1504) (minValue!4512 thiss!1504) key!932 (defaultEntry!4671 thiss!1504)) lt!126911)))

(declare-fun b!253143 () Bool)

(declare-fun res!123902 () Bool)

(assert (=> b!253143 (=> (not res!123902) (not e!164131))))

(assert (=> b!253143 (= res!123902 (inRange!0 (index!6715 lt!126912) (mask!10897 thiss!1504)))))

(declare-fun b!253144 () Bool)

(assert (=> b!253144 (= e!164131 (= (select (arr!5861 (_keys!6821 thiss!1504)) (index!6715 lt!126912)) key!932))))

(assert (=> b!253144 (and (bvsge (index!6715 lt!126912) #b00000000000000000000000000000000) (bvslt (index!6715 lt!126912) (size!6208 (_keys!6821 thiss!1504))))))

(assert (= (and d!61407 res!123901) b!253143))

(assert (= (and b!253143 res!123902) b!253144))

(assert (=> d!61407 m!268937))

(declare-fun m!269097 () Bool)

(assert (=> d!61407 m!269097))

(assert (=> d!61407 m!268895))

(declare-fun m!269099 () Bool)

(assert (=> b!253143 m!269099))

(declare-fun m!269101 () Bool)

(assert (=> b!253144 m!269101))

(assert (=> b!252892 d!61407))

(declare-fun d!61409 () Bool)

(declare-fun e!164137 () Bool)

(assert (=> d!61409 e!164137))

(declare-fun res!123914 () Bool)

(assert (=> d!61409 (=> (not res!123914) (not e!164137))))

(assert (=> d!61409 (= res!123914 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6821 thiss!1504)))))))

(declare-fun lt!126915 () Unit!7830)

(declare-fun choose!1 (array!12367 (_ BitVec 32) (_ BitVec 64)) Unit!7830)

(assert (=> d!61409 (= lt!126915 (choose!1 (_keys!6821 thiss!1504) index!297 key!932))))

(declare-fun e!164136 () Bool)

(assert (=> d!61409 e!164136))

(declare-fun res!123913 () Bool)

(assert (=> d!61409 (=> (not res!123913) (not e!164136))))

(assert (=> d!61409 (= res!123913 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6821 thiss!1504)))))))

(assert (=> d!61409 (= (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6821 thiss!1504) index!297 key!932) lt!126915)))

(declare-fun b!253153 () Bool)

(declare-fun res!123912 () Bool)

(assert (=> b!253153 (=> (not res!123912) (not e!164136))))

(assert (=> b!253153 (= res!123912 (not (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) index!297))))))

(declare-fun b!253154 () Bool)

(declare-fun res!123911 () Bool)

(assert (=> b!253154 (=> (not res!123911) (not e!164136))))

(assert (=> b!253154 (= res!123911 (validKeyInArray!0 key!932))))

(declare-fun b!253155 () Bool)

(assert (=> b!253155 (= e!164136 (bvslt (size!6208 (_keys!6821 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!253156 () Bool)

(assert (=> b!253156 (= e!164137 (= (arrayCountValidKeys!0 (array!12368 (store (arr!5861 (_keys!6821 thiss!1504)) index!297 key!932) (size!6208 (_keys!6821 thiss!1504))) #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (bvadd (arrayCountValidKeys!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) #b00000000000000000000000000000001)))))

(assert (= (and d!61409 res!123913) b!253153))

(assert (= (and b!253153 res!123912) b!253154))

(assert (= (and b!253154 res!123911) b!253155))

(assert (= (and d!61409 res!123914) b!253156))

(declare-fun m!269103 () Bool)

(assert (=> d!61409 m!269103))

(declare-fun m!269105 () Bool)

(assert (=> b!253153 m!269105))

(assert (=> b!253153 m!269105))

(declare-fun m!269107 () Bool)

(assert (=> b!253153 m!269107))

(declare-fun m!269109 () Bool)

(assert (=> b!253154 m!269109))

(assert (=> b!253156 m!268907))

(declare-fun m!269111 () Bool)

(assert (=> b!253156 m!269111))

(assert (=> b!253156 m!268909))

(assert (=> b!252894 d!61409))

(declare-fun d!61411 () Bool)

(declare-fun lt!126918 () (_ BitVec 32))

(assert (=> d!61411 (and (bvsge lt!126918 #b00000000000000000000000000000000) (bvsle lt!126918 (bvsub (size!6208 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!164142 () (_ BitVec 32))

(assert (=> d!61411 (= lt!126918 e!164142)))

(declare-fun c!42690 () Bool)

(assert (=> d!61411 (= c!42690 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(assert (=> d!61411 (and (bvsle #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6208 (_keys!6821 thiss!1504)) (size!6208 (_keys!6821 thiss!1504))))))

(assert (=> d!61411 (= (arrayCountValidKeys!0 (_keys!6821 thiss!1504) #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) lt!126918)))

(declare-fun bm!23878 () Bool)

(declare-fun call!23881 () (_ BitVec 32))

(assert (=> bm!23878 (= call!23881 (arrayCountValidKeys!0 (_keys!6821 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253165 () Bool)

(assert (=> b!253165 (= e!164142 #b00000000000000000000000000000000)))

(declare-fun b!253166 () Bool)

(declare-fun e!164143 () (_ BitVec 32))

(assert (=> b!253166 (= e!164143 (bvadd #b00000000000000000000000000000001 call!23881))))

(declare-fun b!253167 () Bool)

(assert (=> b!253167 (= e!164143 call!23881)))

(declare-fun b!253168 () Bool)

(assert (=> b!253168 (= e!164142 e!164143)))

(declare-fun c!42689 () Bool)

(assert (=> b!253168 (= c!42689 (validKeyInArray!0 (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!61411 c!42690) b!253165))

(assert (= (and d!61411 (not c!42690)) b!253168))

(assert (= (and b!253168 c!42689) b!253166))

(assert (= (and b!253168 (not c!42689)) b!253167))

(assert (= (or b!253166 b!253167) bm!23878))

(declare-fun m!269113 () Bool)

(assert (=> bm!23878 m!269113))

(assert (=> b!253168 m!268995))

(assert (=> b!253168 m!268995))

(assert (=> b!253168 m!268997))

(assert (=> b!252894 d!61411))

(declare-fun bm!23879 () Bool)

(declare-fun call!23882 () Bool)

(assert (=> bm!23879 (= call!23882 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!126767 (mask!10897 thiss!1504)))))

(declare-fun b!253170 () Bool)

(declare-fun e!164146 () Bool)

(declare-fun e!164145 () Bool)

(assert (=> b!253170 (= e!164146 e!164145)))

(declare-fun lt!126919 () (_ BitVec 64))

(assert (=> b!253170 (= lt!126919 (select (arr!5861 lt!126767) #b00000000000000000000000000000000))))

(declare-fun lt!126921 () Unit!7830)

(assert (=> b!253170 (= lt!126921 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!126767 lt!126919 #b00000000000000000000000000000000))))

(assert (=> b!253170 (arrayContainsKey!0 lt!126767 lt!126919 #b00000000000000000000000000000000)))

(declare-fun lt!126920 () Unit!7830)

(assert (=> b!253170 (= lt!126920 lt!126921)))

(declare-fun res!123915 () Bool)

(assert (=> b!253170 (= res!123915 (= (seekEntryOrOpen!0 (select (arr!5861 lt!126767) #b00000000000000000000000000000000) lt!126767 (mask!10897 thiss!1504)) (Found!1136 #b00000000000000000000000000000000)))))

(assert (=> b!253170 (=> (not res!123915) (not e!164145))))

(declare-fun b!253171 () Bool)

(assert (=> b!253171 (= e!164146 call!23882)))

(declare-fun b!253172 () Bool)

(assert (=> b!253172 (= e!164145 call!23882)))

(declare-fun d!61413 () Bool)

(declare-fun res!123916 () Bool)

(declare-fun e!164144 () Bool)

(assert (=> d!61413 (=> res!123916 e!164144)))

(assert (=> d!61413 (= res!123916 (bvsge #b00000000000000000000000000000000 (size!6208 lt!126767)))))

(assert (=> d!61413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!126767 (mask!10897 thiss!1504)) e!164144)))

(declare-fun b!253169 () Bool)

(assert (=> b!253169 (= e!164144 e!164146)))

(declare-fun c!42691 () Bool)

(assert (=> b!253169 (= c!42691 (validKeyInArray!0 (select (arr!5861 lt!126767) #b00000000000000000000000000000000)))))

(assert (= (and d!61413 (not res!123916)) b!253169))

(assert (= (and b!253169 c!42691) b!253170))

(assert (= (and b!253169 (not c!42691)) b!253171))

(assert (= (and b!253170 res!123915) b!253172))

(assert (= (or b!253172 b!253171) bm!23879))

(declare-fun m!269115 () Bool)

(assert (=> bm!23879 m!269115))

(declare-fun m!269117 () Bool)

(assert (=> b!253170 m!269117))

(declare-fun m!269119 () Bool)

(assert (=> b!253170 m!269119))

(declare-fun m!269121 () Bool)

(assert (=> b!253170 m!269121))

(assert (=> b!253170 m!269117))

(declare-fun m!269123 () Bool)

(assert (=> b!253170 m!269123))

(assert (=> b!253169 m!269117))

(assert (=> b!253169 m!269117))

(declare-fun m!269125 () Bool)

(assert (=> b!253169 m!269125))

(assert (=> b!252894 d!61413))

(declare-fun d!61415 () Bool)

(declare-fun e!164149 () Bool)

(assert (=> d!61415 e!164149))

(declare-fun res!123919 () Bool)

(assert (=> d!61415 (=> (not res!123919) (not e!164149))))

(assert (=> d!61415 (= res!123919 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6821 thiss!1504)))))))

(declare-fun lt!126924 () Unit!7830)

(declare-fun choose!41 (array!12367 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3748) Unit!7830)

(assert (=> d!61415 (= lt!126924 (choose!41 (_keys!6821 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3745))))

(assert (=> d!61415 (bvslt (size!6208 (_keys!6821 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!61415 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6821 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3745) lt!126924)))

(declare-fun b!253175 () Bool)

(assert (=> b!253175 (= e!164149 (arrayNoDuplicates!0 (array!12368 (store (arr!5861 (_keys!6821 thiss!1504)) index!297 key!932) (size!6208 (_keys!6821 thiss!1504))) #b00000000000000000000000000000000 Nil!3745))))

(assert (= (and d!61415 res!123919) b!253175))

(declare-fun m!269127 () Bool)

(assert (=> d!61415 m!269127))

(assert (=> b!253175 m!268907))

(declare-fun m!269129 () Bool)

(assert (=> b!253175 m!269129))

(assert (=> b!252894 d!61415))

(declare-fun d!61417 () Bool)

(declare-fun res!123924 () Bool)

(declare-fun e!164154 () Bool)

(assert (=> d!61417 (=> res!123924 e!164154)))

(assert (=> d!61417 (= res!123924 (= (select (arr!5861 (_keys!6821 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!61417 (= (arrayContainsKey!0 (_keys!6821 thiss!1504) key!932 #b00000000000000000000000000000000) e!164154)))

(declare-fun b!253180 () Bool)

(declare-fun e!164155 () Bool)

(assert (=> b!253180 (= e!164154 e!164155)))

(declare-fun res!123925 () Bool)

(assert (=> b!253180 (=> (not res!123925) (not e!164155))))

(assert (=> b!253180 (= res!123925 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253181 () Bool)

(assert (=> b!253181 (= e!164155 (arrayContainsKey!0 (_keys!6821 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!61417 (not res!123924)) b!253180))

(assert (= (and b!253180 res!123925) b!253181))

(assert (=> d!61417 m!268995))

(declare-fun m!269131 () Bool)

(assert (=> b!253181 m!269131))

(assert (=> b!252894 d!61417))

(declare-fun d!61419 () Bool)

(declare-fun e!164158 () Bool)

(assert (=> d!61419 e!164158))

(declare-fun res!123928 () Bool)

(assert (=> d!61419 (=> (not res!123928) (not e!164158))))

(assert (=> d!61419 (= res!123928 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6208 (_keys!6821 thiss!1504)))))))

(declare-fun lt!126927 () Unit!7830)

(declare-fun choose!102 ((_ BitVec 64) array!12367 (_ BitVec 32) (_ BitVec 32)) Unit!7830)

(assert (=> d!61419 (= lt!126927 (choose!102 key!932 (_keys!6821 thiss!1504) index!297 (mask!10897 thiss!1504)))))

(assert (=> d!61419 (validMask!0 (mask!10897 thiss!1504))))

(assert (=> d!61419 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!932 (_keys!6821 thiss!1504) index!297 (mask!10897 thiss!1504)) lt!126927)))

(declare-fun b!253184 () Bool)

(assert (=> b!253184 (= e!164158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12368 (store (arr!5861 (_keys!6821 thiss!1504)) index!297 key!932) (size!6208 (_keys!6821 thiss!1504))) (mask!10897 thiss!1504)))))

(assert (= (and d!61419 res!123928) b!253184))

(declare-fun m!269133 () Bool)

(assert (=> d!61419 m!269133))

(assert (=> d!61419 m!268895))

(assert (=> b!253184 m!268907))

(declare-fun m!269135 () Bool)

(assert (=> b!253184 m!269135))

(assert (=> b!252894 d!61419))

(declare-fun d!61421 () Bool)

(declare-fun lt!126928 () (_ BitVec 32))

(assert (=> d!61421 (and (bvsge lt!126928 #b00000000000000000000000000000000) (bvsle lt!126928 (bvsub (size!6208 lt!126767) #b00000000000000000000000000000000)))))

(declare-fun e!164159 () (_ BitVec 32))

(assert (=> d!61421 (= lt!126928 e!164159)))

(declare-fun c!42693 () Bool)

(assert (=> d!61421 (= c!42693 (bvsge #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))))))

(assert (=> d!61421 (and (bvsle #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!6208 (_keys!6821 thiss!1504)) (size!6208 lt!126767)))))

(assert (=> d!61421 (= (arrayCountValidKeys!0 lt!126767 #b00000000000000000000000000000000 (size!6208 (_keys!6821 thiss!1504))) lt!126928)))

(declare-fun bm!23880 () Bool)

(declare-fun call!23883 () (_ BitVec 32))

(assert (=> bm!23880 (= call!23883 (arrayCountValidKeys!0 lt!126767 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6208 (_keys!6821 thiss!1504))))))

(declare-fun b!253185 () Bool)

(assert (=> b!253185 (= e!164159 #b00000000000000000000000000000000)))

(declare-fun b!253186 () Bool)

(declare-fun e!164160 () (_ BitVec 32))

(assert (=> b!253186 (= e!164160 (bvadd #b00000000000000000000000000000001 call!23883))))

(declare-fun b!253187 () Bool)

(assert (=> b!253187 (= e!164160 call!23883)))

(declare-fun b!253188 () Bool)

(assert (=> b!253188 (= e!164159 e!164160)))

(declare-fun c!42692 () Bool)

(assert (=> b!253188 (= c!42692 (validKeyInArray!0 (select (arr!5861 lt!126767) #b00000000000000000000000000000000)))))

(assert (= (and d!61421 c!42693) b!253185))

(assert (= (and d!61421 (not c!42693)) b!253188))

(assert (= (and b!253188 c!42692) b!253186))

(assert (= (and b!253188 (not c!42692)) b!253187))

(assert (= (or b!253186 b!253187) bm!23880))

(declare-fun m!269137 () Bool)

(assert (=> bm!23880 m!269137))

(assert (=> b!253188 m!269117))

(assert (=> b!253188 m!269117))

(assert (=> b!253188 m!269125))

(assert (=> b!252894 d!61421))

(declare-fun b!253189 () Bool)

(declare-fun e!164162 () Bool)

(declare-fun e!164161 () Bool)

(assert (=> b!253189 (= e!164162 e!164161)))

(declare-fun res!123930 () Bool)

(assert (=> b!253189 (=> (not res!123930) (not e!164161))))

(declare-fun e!164164 () Bool)

(assert (=> b!253189 (= res!123930 (not e!164164))))

(declare-fun res!123931 () Bool)

(assert (=> b!253189 (=> (not res!123931) (not e!164164))))

(assert (=> b!253189 (= res!123931 (validKeyInArray!0 (select (arr!5861 lt!126767) #b00000000000000000000000000000000)))))

(declare-fun d!61423 () Bool)

(declare-fun res!123929 () Bool)

(assert (=> d!61423 (=> res!123929 e!164162)))

(assert (=> d!61423 (= res!123929 (bvsge #b00000000000000000000000000000000 (size!6208 lt!126767)))))

(assert (=> d!61423 (= (arrayNoDuplicates!0 lt!126767 #b00000000000000000000000000000000 Nil!3745) e!164162)))

(declare-fun b!253190 () Bool)

(declare-fun e!164163 () Bool)

(declare-fun call!23884 () Bool)

(assert (=> b!253190 (= e!164163 call!23884)))

(declare-fun b!253191 () Bool)

(assert (=> b!253191 (= e!164164 (contains!1835 Nil!3745 (select (arr!5861 lt!126767) #b00000000000000000000000000000000)))))

(declare-fun b!253192 () Bool)

(assert (=> b!253192 (= e!164161 e!164163)))

(declare-fun c!42694 () Bool)

(assert (=> b!253192 (= c!42694 (validKeyInArray!0 (select (arr!5861 lt!126767) #b00000000000000000000000000000000)))))

(declare-fun b!253193 () Bool)

(assert (=> b!253193 (= e!164163 call!23884)))

(declare-fun bm!23881 () Bool)

(assert (=> bm!23881 (= call!23884 (arrayNoDuplicates!0 lt!126767 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!42694 (Cons!3744 (select (arr!5861 lt!126767) #b00000000000000000000000000000000) Nil!3745) Nil!3745)))))

(assert (= (and d!61423 (not res!123929)) b!253189))

(assert (= (and b!253189 res!123931) b!253191))

(assert (= (and b!253189 res!123930) b!253192))

(assert (= (and b!253192 c!42694) b!253193))

(assert (= (and b!253192 (not c!42694)) b!253190))

(assert (= (or b!253193 b!253190) bm!23881))

(assert (=> b!253189 m!269117))

(assert (=> b!253189 m!269117))

(assert (=> b!253189 m!269125))

(assert (=> b!253191 m!269117))

(assert (=> b!253191 m!269117))

(declare-fun m!269139 () Bool)

(assert (=> b!253191 m!269139))

(assert (=> b!253192 m!269117))

(assert (=> b!253192 m!269117))

(assert (=> b!253192 m!269125))

(assert (=> bm!23881 m!269117))

(declare-fun m!269141 () Bool)

(assert (=> bm!23881 m!269141))

(assert (=> b!252894 d!61423))

(declare-fun d!61425 () Bool)

(assert (=> d!61425 (= (validMask!0 (mask!10897 thiss!1504)) (and (or (= (mask!10897 thiss!1504) #b00000000000000000000000000000111) (= (mask!10897 thiss!1504) #b00000000000000000000000000001111) (= (mask!10897 thiss!1504) #b00000000000000000000000000011111) (= (mask!10897 thiss!1504) #b00000000000000000000000000111111) (= (mask!10897 thiss!1504) #b00000000000000000000000001111111) (= (mask!10897 thiss!1504) #b00000000000000000000000011111111) (= (mask!10897 thiss!1504) #b00000000000000000000000111111111) (= (mask!10897 thiss!1504) #b00000000000000000000001111111111) (= (mask!10897 thiss!1504) #b00000000000000000000011111111111) (= (mask!10897 thiss!1504) #b00000000000000000000111111111111) (= (mask!10897 thiss!1504) #b00000000000000000001111111111111) (= (mask!10897 thiss!1504) #b00000000000000000011111111111111) (= (mask!10897 thiss!1504) #b00000000000000000111111111111111) (= (mask!10897 thiss!1504) #b00000000000000001111111111111111) (= (mask!10897 thiss!1504) #b00000000000000011111111111111111) (= (mask!10897 thiss!1504) #b00000000000000111111111111111111) (= (mask!10897 thiss!1504) #b00000000000001111111111111111111) (= (mask!10897 thiss!1504) #b00000000000011111111111111111111) (= (mask!10897 thiss!1504) #b00000000000111111111111111111111) (= (mask!10897 thiss!1504) #b00000000001111111111111111111111) (= (mask!10897 thiss!1504) #b00000000011111111111111111111111) (= (mask!10897 thiss!1504) #b00000000111111111111111111111111) (= (mask!10897 thiss!1504) #b00000001111111111111111111111111) (= (mask!10897 thiss!1504) #b00000011111111111111111111111111) (= (mask!10897 thiss!1504) #b00000111111111111111111111111111) (= (mask!10897 thiss!1504) #b00001111111111111111111111111111) (= (mask!10897 thiss!1504) #b00011111111111111111111111111111) (= (mask!10897 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10897 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!252894 d!61425))

(assert (=> bm!23836 d!61417))

(declare-fun mapNonEmpty!11094 () Bool)

(declare-fun mapRes!11094 () Bool)

(declare-fun tp!23262 () Bool)

(declare-fun e!164170 () Bool)

(assert (=> mapNonEmpty!11094 (= mapRes!11094 (and tp!23262 e!164170))))

(declare-fun mapKey!11094 () (_ BitVec 32))

(declare-fun mapValue!11094 () ValueCell!2916)

(declare-fun mapRest!11094 () (Array (_ BitVec 32) ValueCell!2916))

(assert (=> mapNonEmpty!11094 (= mapRest!11088 (store mapRest!11094 mapKey!11094 mapValue!11094))))

(declare-fun mapIsEmpty!11094 () Bool)

(assert (=> mapIsEmpty!11094 mapRes!11094))

(declare-fun b!253200 () Bool)

(assert (=> b!253200 (= e!164170 tp_is_empty!6519)))

(declare-fun b!253201 () Bool)

(declare-fun e!164169 () Bool)

(assert (=> b!253201 (= e!164169 tp_is_empty!6519)))

(declare-fun condMapEmpty!11094 () Bool)

(declare-fun mapDefault!11094 () ValueCell!2916)

(assert (=> mapNonEmpty!11088 (= condMapEmpty!11094 (= mapRest!11088 ((as const (Array (_ BitVec 32) ValueCell!2916)) mapDefault!11094)))))

(assert (=> mapNonEmpty!11088 (= tp!23253 (and e!164169 mapRes!11094))))

(assert (= (and mapNonEmpty!11088 condMapEmpty!11094) mapIsEmpty!11094))

(assert (= (and mapNonEmpty!11088 (not condMapEmpty!11094)) mapNonEmpty!11094))

(assert (= (and mapNonEmpty!11094 ((_ is ValueCellFull!2916) mapValue!11094)) b!253200))

(assert (= (and mapNonEmpty!11088 ((_ is ValueCellFull!2916) mapDefault!11094)) b!253201))

(declare-fun m!269143 () Bool)

(assert (=> mapNonEmpty!11094 m!269143))

(declare-fun b_lambda!8125 () Bool)

(assert (= b_lambda!8123 (or (and b!252900 b_free!6657) b_lambda!8125)))

(check-sat (not bm!23878) (not b!253103) (not d!61407) (not b!253188) (not b!253041) (not d!61409) (not b!253184) (not b!253169) (not b!253154) b_and!13699 (not bm!23875) (not b_next!6657) (not b!253095) (not mapNonEmpty!11094) (not bm!23845) (not b!253089) (not b!252995) (not d!61401) (not b!253009) (not b!253143) (not b!252993) (not d!61397) (not b!253153) (not d!61393) (not bm!23870) (not bm!23850) (not b!253099) (not b!253105) (not d!61389) (not b!253175) (not b!253087) (not b!253189) (not b!253135) (not b!253043) (not d!61415) (not bm!23851) (not b!253192) (not b!252994) (not d!61405) (not b!253008) (not b!253006) (not b!253168) tp_is_empty!6519 (not d!61419) (not b!253170) (not bm!23881) (not b!253191) (not bm!23869) (not b_lambda!8125) (not bm!23866) (not bm!23879) (not b!253136) (not b!253126) (not b!253156) (not bm!23880) (not b!253181) (not b!253092) (not d!61399) (not b!253094) (not bm!23868))
(check-sat b_and!13699 (not b_next!6657))
