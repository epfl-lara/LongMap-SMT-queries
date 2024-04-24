; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107614 () Bool)

(assert start!107614)

(declare-fun b!1273774 () Bool)

(declare-fun b_free!27667 () Bool)

(declare-fun b_next!27667 () Bool)

(assert (=> b!1273774 (= b_free!27667 (not b_next!27667))))

(declare-fun tp!97516 () Bool)

(declare-fun b_and!45725 () Bool)

(assert (=> b!1273774 (= tp!97516 b_and!45725)))

(declare-fun b!1273769 () Bool)

(declare-fun e!726635 () Bool)

(declare-fun e!726633 () Bool)

(declare-fun mapRes!51146 () Bool)

(assert (=> b!1273769 (= e!726635 (and e!726633 mapRes!51146))))

(declare-fun condMapEmpty!51146 () Bool)

(declare-datatypes ((V!49243 0))(
  ( (V!49244 (val!16593 Int)) )
))
(declare-datatypes ((ValueCell!15665 0))(
  ( (ValueCellFull!15665 (v!19225 V!49243)) (EmptyCell!15665) )
))
(declare-datatypes ((array!83345 0))(
  ( (array!83346 (arr!40202 (Array (_ BitVec 32) ValueCell!15665)) (size!40740 (_ BitVec 32))) )
))
(declare-datatypes ((array!83347 0))(
  ( (array!83348 (arr!40203 (Array (_ BitVec 32) (_ BitVec 64))) (size!40741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6094 0))(
  ( (LongMapFixedSize!6095 (defaultEntry!6693 Int) (mask!34501 (_ BitVec 32)) (extraKeys!6372 (_ BitVec 32)) (zeroValue!6478 V!49243) (minValue!6478 V!49243) (_size!3102 (_ BitVec 32)) (_keys!12138 array!83347) (_values!6716 array!83345) (_vacant!3102 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6094)

(declare-fun mapDefault!51146 () ValueCell!15665)

(assert (=> b!1273769 (= condMapEmpty!51146 (= (arr!40202 (_values!6716 thiss!1559)) ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51146)))))

(declare-fun b!1273770 () Bool)

(declare-fun res!846931 () Bool)

(declare-fun e!726632 () Bool)

(assert (=> b!1273770 (=> (not res!846931) (not e!726632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1273770 (= res!846931 (validMask!0 (mask!34501 thiss!1559)))))

(declare-fun b!1273771 () Bool)

(assert (=> b!1273771 (= e!726632 (not (= (size!40740 (_values!6716 thiss!1559)) (bvadd #b00000000000000000000000000000001 (mask!34501 thiss!1559)))))))

(declare-fun mapNonEmpty!51146 () Bool)

(declare-fun tp!97517 () Bool)

(declare-fun e!726636 () Bool)

(assert (=> mapNonEmpty!51146 (= mapRes!51146 (and tp!97517 e!726636))))

(declare-fun mapRest!51146 () (Array (_ BitVec 32) ValueCell!15665))

(declare-fun mapKey!51146 () (_ BitVec 32))

(declare-fun mapValue!51146 () ValueCell!15665)

(assert (=> mapNonEmpty!51146 (= (arr!40202 (_values!6716 thiss!1559)) (store mapRest!51146 mapKey!51146 mapValue!51146))))

(declare-fun mapIsEmpty!51146 () Bool)

(assert (=> mapIsEmpty!51146 mapRes!51146))

(declare-fun b!1273772 () Bool)

(declare-fun tp_is_empty!33037 () Bool)

(assert (=> b!1273772 (= e!726636 tp_is_empty!33037)))

(declare-fun res!846930 () Bool)

(assert (=> start!107614 (=> (not res!846930) (not e!726632))))

(declare-fun valid!2290 (LongMapFixedSize!6094) Bool)

(assert (=> start!107614 (= res!846930 (valid!2290 thiss!1559))))

(assert (=> start!107614 e!726632))

(declare-fun e!726637 () Bool)

(assert (=> start!107614 e!726637))

(declare-fun b!1273773 () Bool)

(assert (=> b!1273773 (= e!726633 tp_is_empty!33037)))

(declare-fun array_inv!30741 (array!83347) Bool)

(declare-fun array_inv!30742 (array!83345) Bool)

(assert (=> b!1273774 (= e!726637 (and tp!97516 tp_is_empty!33037 (array_inv!30741 (_keys!12138 thiss!1559)) (array_inv!30742 (_values!6716 thiss!1559)) e!726635))))

(assert (= (and start!107614 res!846930) b!1273770))

(assert (= (and b!1273770 res!846931) b!1273771))

(assert (= (and b!1273769 condMapEmpty!51146) mapIsEmpty!51146))

(assert (= (and b!1273769 (not condMapEmpty!51146)) mapNonEmpty!51146))

(get-info :version)

(assert (= (and mapNonEmpty!51146 ((_ is ValueCellFull!15665) mapValue!51146)) b!1273772))

(assert (= (and b!1273769 ((_ is ValueCellFull!15665) mapDefault!51146)) b!1273773))

(assert (= b!1273774 b!1273769))

(assert (= start!107614 b!1273774))

(declare-fun m!1171733 () Bool)

(assert (=> b!1273770 m!1171733))

(declare-fun m!1171735 () Bool)

(assert (=> mapNonEmpty!51146 m!1171735))

(declare-fun m!1171737 () Bool)

(assert (=> start!107614 m!1171737))

(declare-fun m!1171739 () Bool)

(assert (=> b!1273774 m!1171739))

(declare-fun m!1171741 () Bool)

(assert (=> b!1273774 m!1171741))

(check-sat (not b!1273774) (not mapNonEmpty!51146) b_and!45725 (not b_next!27667) tp_is_empty!33037 (not start!107614) (not b!1273770))
(check-sat b_and!45725 (not b_next!27667))
(get-model)

(declare-fun d!140311 () Bool)

(assert (=> d!140311 (= (validMask!0 (mask!34501 thiss!1559)) (and (or (= (mask!34501 thiss!1559) #b00000000000000000000000000000111) (= (mask!34501 thiss!1559) #b00000000000000000000000000001111) (= (mask!34501 thiss!1559) #b00000000000000000000000000011111) (= (mask!34501 thiss!1559) #b00000000000000000000000000111111) (= (mask!34501 thiss!1559) #b00000000000000000000000001111111) (= (mask!34501 thiss!1559) #b00000000000000000000000011111111) (= (mask!34501 thiss!1559) #b00000000000000000000000111111111) (= (mask!34501 thiss!1559) #b00000000000000000000001111111111) (= (mask!34501 thiss!1559) #b00000000000000000000011111111111) (= (mask!34501 thiss!1559) #b00000000000000000000111111111111) (= (mask!34501 thiss!1559) #b00000000000000000001111111111111) (= (mask!34501 thiss!1559) #b00000000000000000011111111111111) (= (mask!34501 thiss!1559) #b00000000000000000111111111111111) (= (mask!34501 thiss!1559) #b00000000000000001111111111111111) (= (mask!34501 thiss!1559) #b00000000000000011111111111111111) (= (mask!34501 thiss!1559) #b00000000000000111111111111111111) (= (mask!34501 thiss!1559) #b00000000000001111111111111111111) (= (mask!34501 thiss!1559) #b00000000000011111111111111111111) (= (mask!34501 thiss!1559) #b00000000000111111111111111111111) (= (mask!34501 thiss!1559) #b00000000001111111111111111111111) (= (mask!34501 thiss!1559) #b00000000011111111111111111111111) (= (mask!34501 thiss!1559) #b00000000111111111111111111111111) (= (mask!34501 thiss!1559) #b00000001111111111111111111111111) (= (mask!34501 thiss!1559) #b00000011111111111111111111111111) (= (mask!34501 thiss!1559) #b00000111111111111111111111111111) (= (mask!34501 thiss!1559) #b00001111111111111111111111111111) (= (mask!34501 thiss!1559) #b00011111111111111111111111111111) (= (mask!34501 thiss!1559) #b00111111111111111111111111111111)) (bvsle (mask!34501 thiss!1559) #b00111111111111111111111111111111)))))

(assert (=> b!1273770 d!140311))

(declare-fun d!140313 () Bool)

(declare-fun res!846950 () Bool)

(declare-fun e!726676 () Bool)

(assert (=> d!140313 (=> (not res!846950) (not e!726676))))

(declare-fun simpleValid!456 (LongMapFixedSize!6094) Bool)

(assert (=> d!140313 (= res!846950 (simpleValid!456 thiss!1559))))

(assert (=> d!140313 (= (valid!2290 thiss!1559) e!726676)))

(declare-fun b!1273817 () Bool)

(declare-fun res!846951 () Bool)

(assert (=> b!1273817 (=> (not res!846951) (not e!726676))))

(declare-fun arrayCountValidKeys!0 (array!83347 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1273817 (= res!846951 (= (arrayCountValidKeys!0 (_keys!12138 thiss!1559) #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))) (_size!3102 thiss!1559)))))

(declare-fun b!1273818 () Bool)

(declare-fun res!846952 () Bool)

(assert (=> b!1273818 (=> (not res!846952) (not e!726676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83347 (_ BitVec 32)) Bool)

(assert (=> b!1273818 (= res!846952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12138 thiss!1559) (mask!34501 thiss!1559)))))

(declare-fun b!1273819 () Bool)

(declare-datatypes ((List!28585 0))(
  ( (Nil!28582) (Cons!28581 (h!29799 (_ BitVec 64)) (t!42110 List!28585)) )
))
(declare-fun arrayNoDuplicates!0 (array!83347 (_ BitVec 32) List!28585) Bool)

(assert (=> b!1273819 (= e!726676 (arrayNoDuplicates!0 (_keys!12138 thiss!1559) #b00000000000000000000000000000000 Nil!28582))))

(assert (= (and d!140313 res!846950) b!1273817))

(assert (= (and b!1273817 res!846951) b!1273818))

(assert (= (and b!1273818 res!846952) b!1273819))

(declare-fun m!1171763 () Bool)

(assert (=> d!140313 m!1171763))

(declare-fun m!1171765 () Bool)

(assert (=> b!1273817 m!1171765))

(declare-fun m!1171767 () Bool)

(assert (=> b!1273818 m!1171767))

(declare-fun m!1171769 () Bool)

(assert (=> b!1273819 m!1171769))

(assert (=> start!107614 d!140313))

(declare-fun d!140315 () Bool)

(assert (=> d!140315 (= (array_inv!30741 (_keys!12138 thiss!1559)) (bvsge (size!40741 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273774 d!140315))

(declare-fun d!140317 () Bool)

(assert (=> d!140317 (= (array_inv!30742 (_values!6716 thiss!1559)) (bvsge (size!40740 (_values!6716 thiss!1559)) #b00000000000000000000000000000000))))

(assert (=> b!1273774 d!140317))

(declare-fun mapNonEmpty!51155 () Bool)

(declare-fun mapRes!51155 () Bool)

(declare-fun tp!97532 () Bool)

(declare-fun e!726682 () Bool)

(assert (=> mapNonEmpty!51155 (= mapRes!51155 (and tp!97532 e!726682))))

(declare-fun mapKey!51155 () (_ BitVec 32))

(declare-fun mapRest!51155 () (Array (_ BitVec 32) ValueCell!15665))

(declare-fun mapValue!51155 () ValueCell!15665)

(assert (=> mapNonEmpty!51155 (= mapRest!51146 (store mapRest!51155 mapKey!51155 mapValue!51155))))

(declare-fun b!1273827 () Bool)

(declare-fun e!726681 () Bool)

(assert (=> b!1273827 (= e!726681 tp_is_empty!33037)))

(declare-fun b!1273826 () Bool)

(assert (=> b!1273826 (= e!726682 tp_is_empty!33037)))

(declare-fun condMapEmpty!51155 () Bool)

(declare-fun mapDefault!51155 () ValueCell!15665)

(assert (=> mapNonEmpty!51146 (= condMapEmpty!51155 (= mapRest!51146 ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51155)))))

(assert (=> mapNonEmpty!51146 (= tp!97517 (and e!726681 mapRes!51155))))

(declare-fun mapIsEmpty!51155 () Bool)

(assert (=> mapIsEmpty!51155 mapRes!51155))

(assert (= (and mapNonEmpty!51146 condMapEmpty!51155) mapIsEmpty!51155))

(assert (= (and mapNonEmpty!51146 (not condMapEmpty!51155)) mapNonEmpty!51155))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15665) mapValue!51155)) b!1273826))

(assert (= (and mapNonEmpty!51146 ((_ is ValueCellFull!15665) mapDefault!51155)) b!1273827))

(declare-fun m!1171771 () Bool)

(assert (=> mapNonEmpty!51155 m!1171771))

(check-sat tp_is_empty!33037 (not d!140313) (not mapNonEmpty!51155) (not b!1273817) b_and!45725 (not b!1273819) (not b_next!27667) (not b!1273818))
(check-sat b_and!45725 (not b_next!27667))
(get-model)

(declare-fun b!1273836 () Bool)

(declare-fun e!726691 () Bool)

(declare-fun e!726689 () Bool)

(assert (=> b!1273836 (= e!726691 e!726689)))

(declare-fun lt!575548 () (_ BitVec 64))

(assert (=> b!1273836 (= lt!575548 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42291 0))(
  ( (Unit!42292) )
))
(declare-fun lt!575547 () Unit!42291)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83347 (_ BitVec 64) (_ BitVec 32)) Unit!42291)

(assert (=> b!1273836 (= lt!575547 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!12138 thiss!1559) lt!575548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1273836 (arrayContainsKey!0 (_keys!12138 thiss!1559) lt!575548 #b00000000000000000000000000000000)))

(declare-fun lt!575549 () Unit!42291)

(assert (=> b!1273836 (= lt!575549 lt!575547)))

(declare-fun res!846958 () Bool)

(declare-datatypes ((SeekEntryResult!9946 0))(
  ( (MissingZero!9946 (index!42155 (_ BitVec 32))) (Found!9946 (index!42156 (_ BitVec 32))) (Intermediate!9946 (undefined!10758 Bool) (index!42157 (_ BitVec 32)) (x!112411 (_ BitVec 32))) (Undefined!9946) (MissingVacant!9946 (index!42158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83347 (_ BitVec 32)) SeekEntryResult!9946)

(assert (=> b!1273836 (= res!846958 (= (seekEntryOrOpen!0 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000) (_keys!12138 thiss!1559) (mask!34501 thiss!1559)) (Found!9946 #b00000000000000000000000000000000)))))

(assert (=> b!1273836 (=> (not res!846958) (not e!726689))))

(declare-fun b!1273837 () Bool)

(declare-fun e!726690 () Bool)

(assert (=> b!1273837 (= e!726690 e!726691)))

(declare-fun c!124099 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1273837 (= c!124099 (validKeyInArray!0 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62611 () Bool)

(declare-fun call!62614 () Bool)

(assert (=> bm!62611 (= call!62614 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!12138 thiss!1559) (mask!34501 thiss!1559)))))

(declare-fun b!1273839 () Bool)

(assert (=> b!1273839 (= e!726691 call!62614)))

(declare-fun b!1273838 () Bool)

(assert (=> b!1273838 (= e!726689 call!62614)))

(declare-fun d!140319 () Bool)

(declare-fun res!846957 () Bool)

(assert (=> d!140319 (=> res!846957 e!726690)))

(assert (=> d!140319 (= res!846957 (bvsge #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))))))

(assert (=> d!140319 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!12138 thiss!1559) (mask!34501 thiss!1559)) e!726690)))

(assert (= (and d!140319 (not res!846957)) b!1273837))

(assert (= (and b!1273837 c!124099) b!1273836))

(assert (= (and b!1273837 (not c!124099)) b!1273839))

(assert (= (and b!1273836 res!846958) b!1273838))

(assert (= (or b!1273838 b!1273839) bm!62611))

(declare-fun m!1171773 () Bool)

(assert (=> b!1273836 m!1171773))

(declare-fun m!1171775 () Bool)

(assert (=> b!1273836 m!1171775))

(declare-fun m!1171777 () Bool)

(assert (=> b!1273836 m!1171777))

(assert (=> b!1273836 m!1171773))

(declare-fun m!1171779 () Bool)

(assert (=> b!1273836 m!1171779))

(assert (=> b!1273837 m!1171773))

(assert (=> b!1273837 m!1171773))

(declare-fun m!1171781 () Bool)

(assert (=> b!1273837 m!1171781))

(declare-fun m!1171783 () Bool)

(assert (=> bm!62611 m!1171783))

(assert (=> b!1273818 d!140319))

(declare-fun b!1273851 () Bool)

(declare-fun e!726694 () Bool)

(assert (=> b!1273851 (= e!726694 (and (bvsge (extraKeys!6372 thiss!1559) #b00000000000000000000000000000000) (bvsle (extraKeys!6372 thiss!1559) #b00000000000000000000000000000011) (bvsge (_vacant!3102 thiss!1559) #b00000000000000000000000000000000)))))

(declare-fun d!140321 () Bool)

(declare-fun res!846968 () Bool)

(assert (=> d!140321 (=> (not res!846968) (not e!726694))))

(assert (=> d!140321 (= res!846968 (validMask!0 (mask!34501 thiss!1559)))))

(assert (=> d!140321 (= (simpleValid!456 thiss!1559) e!726694)))

(declare-fun b!1273850 () Bool)

(declare-fun res!846970 () Bool)

(assert (=> b!1273850 (=> (not res!846970) (not e!726694))))

(declare-fun size!40746 (LongMapFixedSize!6094) (_ BitVec 32))

(assert (=> b!1273850 (= res!846970 (= (size!40746 thiss!1559) (bvadd (_size!3102 thiss!1559) (bvsdiv (bvadd (extraKeys!6372 thiss!1559) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!1273849 () Bool)

(declare-fun res!846967 () Bool)

(assert (=> b!1273849 (=> (not res!846967) (not e!726694))))

(assert (=> b!1273849 (= res!846967 (bvsge (size!40746 thiss!1559) (_size!3102 thiss!1559)))))

(declare-fun b!1273848 () Bool)

(declare-fun res!846969 () Bool)

(assert (=> b!1273848 (=> (not res!846969) (not e!726694))))

(assert (=> b!1273848 (= res!846969 (and (= (size!40740 (_values!6716 thiss!1559)) (bvadd (mask!34501 thiss!1559) #b00000000000000000000000000000001)) (= (size!40741 (_keys!12138 thiss!1559)) (size!40740 (_values!6716 thiss!1559))) (bvsge (_size!3102 thiss!1559) #b00000000000000000000000000000000) (bvsle (_size!3102 thiss!1559) (bvadd (mask!34501 thiss!1559) #b00000000000000000000000000000001))))))

(assert (= (and d!140321 res!846968) b!1273848))

(assert (= (and b!1273848 res!846969) b!1273849))

(assert (= (and b!1273849 res!846967) b!1273850))

(assert (= (and b!1273850 res!846970) b!1273851))

(assert (=> d!140321 m!1171733))

(declare-fun m!1171785 () Bool)

(assert (=> b!1273850 m!1171785))

(assert (=> b!1273849 m!1171785))

(assert (=> d!140313 d!140321))

(declare-fun d!140323 () Bool)

(declare-fun lt!575552 () (_ BitVec 32))

(assert (=> d!140323 (and (bvsge lt!575552 #b00000000000000000000000000000000) (bvsle lt!575552 (bvsub (size!40741 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun e!726700 () (_ BitVec 32))

(assert (=> d!140323 (= lt!575552 e!726700)))

(declare-fun c!124105 () Bool)

(assert (=> d!140323 (= c!124105 (bvsge #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))))))

(assert (=> d!140323 (and (bvsle #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!40741 (_keys!12138 thiss!1559)) (size!40741 (_keys!12138 thiss!1559))))))

(assert (=> d!140323 (= (arrayCountValidKeys!0 (_keys!12138 thiss!1559) #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))) lt!575552)))

(declare-fun b!1273860 () Bool)

(declare-fun e!726699 () (_ BitVec 32))

(declare-fun call!62617 () (_ BitVec 32))

(assert (=> b!1273860 (= e!726699 (bvadd #b00000000000000000000000000000001 call!62617))))

(declare-fun b!1273861 () Bool)

(assert (=> b!1273861 (= e!726699 call!62617)))

(declare-fun bm!62614 () Bool)

(assert (=> bm!62614 (= call!62617 (arrayCountValidKeys!0 (_keys!12138 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!40741 (_keys!12138 thiss!1559))))))

(declare-fun b!1273862 () Bool)

(assert (=> b!1273862 (= e!726700 e!726699)))

(declare-fun c!124104 () Bool)

(assert (=> b!1273862 (= c!124104 (validKeyInArray!0 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273863 () Bool)

(assert (=> b!1273863 (= e!726700 #b00000000000000000000000000000000)))

(assert (= (and d!140323 c!124105) b!1273863))

(assert (= (and d!140323 (not c!124105)) b!1273862))

(assert (= (and b!1273862 c!124104) b!1273860))

(assert (= (and b!1273862 (not c!124104)) b!1273861))

(assert (= (or b!1273860 b!1273861) bm!62614))

(declare-fun m!1171787 () Bool)

(assert (=> bm!62614 m!1171787))

(assert (=> b!1273862 m!1171773))

(assert (=> b!1273862 m!1171773))

(assert (=> b!1273862 m!1171781))

(assert (=> b!1273817 d!140323))

(declare-fun b!1273874 () Bool)

(declare-fun e!726709 () Bool)

(declare-fun call!62620 () Bool)

(assert (=> b!1273874 (= e!726709 call!62620)))

(declare-fun d!140325 () Bool)

(declare-fun res!846978 () Bool)

(declare-fun e!726711 () Bool)

(assert (=> d!140325 (=> res!846978 e!726711)))

(assert (=> d!140325 (= res!846978 (bvsge #b00000000000000000000000000000000 (size!40741 (_keys!12138 thiss!1559))))))

(assert (=> d!140325 (= (arrayNoDuplicates!0 (_keys!12138 thiss!1559) #b00000000000000000000000000000000 Nil!28582) e!726711)))

(declare-fun b!1273875 () Bool)

(assert (=> b!1273875 (= e!726709 call!62620)))

(declare-fun b!1273876 () Bool)

(declare-fun e!726712 () Bool)

(assert (=> b!1273876 (= e!726711 e!726712)))

(declare-fun res!846979 () Bool)

(assert (=> b!1273876 (=> (not res!846979) (not e!726712))))

(declare-fun e!726710 () Bool)

(assert (=> b!1273876 (= res!846979 (not e!726710))))

(declare-fun res!846977 () Bool)

(assert (=> b!1273876 (=> (not res!846977) (not e!726710))))

(assert (=> b!1273876 (= res!846977 (validKeyInArray!0 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273877 () Bool)

(declare-fun contains!7693 (List!28585 (_ BitVec 64)) Bool)

(assert (=> b!1273877 (= e!726710 (contains!7693 Nil!28582 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun b!1273878 () Bool)

(assert (=> b!1273878 (= e!726712 e!726709)))

(declare-fun c!124108 () Bool)

(assert (=> b!1273878 (= c!124108 (validKeyInArray!0 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000)))))

(declare-fun bm!62617 () Bool)

(assert (=> bm!62617 (= call!62620 (arrayNoDuplicates!0 (_keys!12138 thiss!1559) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124108 (Cons!28581 (select (arr!40203 (_keys!12138 thiss!1559)) #b00000000000000000000000000000000) Nil!28582) Nil!28582)))))

(assert (= (and d!140325 (not res!846978)) b!1273876))

(assert (= (and b!1273876 res!846977) b!1273877))

(assert (= (and b!1273876 res!846979) b!1273878))

(assert (= (and b!1273878 c!124108) b!1273874))

(assert (= (and b!1273878 (not c!124108)) b!1273875))

(assert (= (or b!1273874 b!1273875) bm!62617))

(assert (=> b!1273876 m!1171773))

(assert (=> b!1273876 m!1171773))

(assert (=> b!1273876 m!1171781))

(assert (=> b!1273877 m!1171773))

(assert (=> b!1273877 m!1171773))

(declare-fun m!1171789 () Bool)

(assert (=> b!1273877 m!1171789))

(assert (=> b!1273878 m!1171773))

(assert (=> b!1273878 m!1171773))

(assert (=> b!1273878 m!1171781))

(assert (=> bm!62617 m!1171773))

(declare-fun m!1171791 () Bool)

(assert (=> bm!62617 m!1171791))

(assert (=> b!1273819 d!140325))

(declare-fun mapNonEmpty!51156 () Bool)

(declare-fun mapRes!51156 () Bool)

(declare-fun tp!97533 () Bool)

(declare-fun e!726714 () Bool)

(assert (=> mapNonEmpty!51156 (= mapRes!51156 (and tp!97533 e!726714))))

(declare-fun mapValue!51156 () ValueCell!15665)

(declare-fun mapRest!51156 () (Array (_ BitVec 32) ValueCell!15665))

(declare-fun mapKey!51156 () (_ BitVec 32))

(assert (=> mapNonEmpty!51156 (= mapRest!51155 (store mapRest!51156 mapKey!51156 mapValue!51156))))

(declare-fun b!1273880 () Bool)

(declare-fun e!726713 () Bool)

(assert (=> b!1273880 (= e!726713 tp_is_empty!33037)))

(declare-fun b!1273879 () Bool)

(assert (=> b!1273879 (= e!726714 tp_is_empty!33037)))

(declare-fun condMapEmpty!51156 () Bool)

(declare-fun mapDefault!51156 () ValueCell!15665)

(assert (=> mapNonEmpty!51155 (= condMapEmpty!51156 (= mapRest!51155 ((as const (Array (_ BitVec 32) ValueCell!15665)) mapDefault!51156)))))

(assert (=> mapNonEmpty!51155 (= tp!97532 (and e!726713 mapRes!51156))))

(declare-fun mapIsEmpty!51156 () Bool)

(assert (=> mapIsEmpty!51156 mapRes!51156))

(assert (= (and mapNonEmpty!51155 condMapEmpty!51156) mapIsEmpty!51156))

(assert (= (and mapNonEmpty!51155 (not condMapEmpty!51156)) mapNonEmpty!51156))

(assert (= (and mapNonEmpty!51156 ((_ is ValueCellFull!15665) mapValue!51156)) b!1273879))

(assert (= (and mapNonEmpty!51155 ((_ is ValueCellFull!15665) mapDefault!51156)) b!1273880))

(declare-fun m!1171793 () Bool)

(assert (=> mapNonEmpty!51156 m!1171793))

(check-sat (not bm!62614) (not bm!62611) (not b!1273849) (not d!140321) (not bm!62617) b_and!45725 (not b!1273877) tp_is_empty!33037 (not b_next!27667) (not b!1273850) (not b!1273876) (not b!1273837) (not b!1273836) (not mapNonEmpty!51156) (not b!1273878) (not b!1273862))
(check-sat b_and!45725 (not b_next!27667))
