; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81190 () Bool)

(assert start!81190)

(declare-fun b!949689 () Bool)

(declare-fun b_free!18205 () Bool)

(declare-fun b_next!18205 () Bool)

(assert (=> b!949689 (= b_free!18205 (not b_next!18205))))

(declare-fun tp!63195 () Bool)

(declare-fun b_and!29653 () Bool)

(assert (=> b!949689 (= tp!63195 b_and!29653)))

(declare-fun b!949685 () Bool)

(declare-fun res!636793 () Bool)

(declare-fun e!534694 () Bool)

(assert (=> b!949685 (=> (not res!636793) (not e!534694))))

(declare-datatypes ((V!32583 0))(
  ( (V!32584 (val!10407 Int)) )
))
(declare-datatypes ((ValueCell!9875 0))(
  ( (ValueCellFull!9875 (v!12942 V!32583)) (EmptyCell!9875) )
))
(declare-datatypes ((array!57485 0))(
  ( (array!57486 (arr!27643 (Array (_ BitVec 32) ValueCell!9875)) (size!28119 (_ BitVec 32))) )
))
(declare-datatypes ((array!57487 0))(
  ( (array!57488 (arr!27644 (Array (_ BitVec 32) (_ BitVec 64))) (size!28120 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4900 0))(
  ( (LongMapFixedSize!4901 (defaultEntry!5754 Int) (mask!27565 (_ BitVec 32)) (extraKeys!5486 (_ BitVec 32)) (zeroValue!5590 V!32583) (minValue!5590 V!32583) (_size!2505 (_ BitVec 32)) (_keys!10705 array!57487) (_values!5777 array!57485) (_vacant!2505 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4900)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949685 (= res!636793 (validMask!0 (mask!27565 thiss!1141)))))

(declare-fun b!949686 () Bool)

(assert (=> b!949686 (= e!534694 (and (= (size!28119 (_values!5777 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27565 thiss!1141))) (= (size!28120 (_keys!10705 thiss!1141)) (size!28119 (_values!5777 thiss!1141))) (bvslt (mask!27565 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!949687 () Bool)

(declare-fun res!636794 () Bool)

(assert (=> b!949687 (=> (not res!636794) (not e!534694))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13510 0))(
  ( (tuple2!13511 (_1!6766 (_ BitVec 64)) (_2!6766 V!32583)) )
))
(declare-datatypes ((List!19308 0))(
  ( (Nil!19305) (Cons!19304 (h!20468 tuple2!13510) (t!27629 List!19308)) )
))
(declare-datatypes ((ListLongMap!12209 0))(
  ( (ListLongMap!12210 (toList!6120 List!19308)) )
))
(declare-fun contains!5217 (ListLongMap!12209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3353 (array!57487 array!57485 (_ BitVec 32) (_ BitVec 32) V!32583 V!32583 (_ BitVec 32) Int) ListLongMap!12209)

(assert (=> b!949687 (= res!636794 (contains!5217 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32964 () Bool)

(declare-fun mapRes!32964 () Bool)

(declare-fun tp!63194 () Bool)

(declare-fun e!534695 () Bool)

(assert (=> mapNonEmpty!32964 (= mapRes!32964 (and tp!63194 e!534695))))

(declare-fun mapRest!32964 () (Array (_ BitVec 32) ValueCell!9875))

(declare-fun mapKey!32964 () (_ BitVec 32))

(declare-fun mapValue!32964 () ValueCell!9875)

(assert (=> mapNonEmpty!32964 (= (arr!27643 (_values!5777 thiss!1141)) (store mapRest!32964 mapKey!32964 mapValue!32964))))

(declare-fun mapIsEmpty!32964 () Bool)

(assert (=> mapIsEmpty!32964 mapRes!32964))

(declare-fun b!949688 () Bool)

(declare-fun e!534696 () Bool)

(declare-fun tp_is_empty!20713 () Bool)

(assert (=> b!949688 (= e!534696 tp_is_empty!20713)))

(declare-fun e!534698 () Bool)

(declare-fun e!534697 () Bool)

(declare-fun array_inv!21542 (array!57487) Bool)

(declare-fun array_inv!21543 (array!57485) Bool)

(assert (=> b!949689 (= e!534698 (and tp!63195 tp_is_empty!20713 (array_inv!21542 (_keys!10705 thiss!1141)) (array_inv!21543 (_values!5777 thiss!1141)) e!534697))))

(declare-fun res!636792 () Bool)

(assert (=> start!81190 (=> (not res!636792) (not e!534694))))

(declare-fun valid!1879 (LongMapFixedSize!4900) Bool)

(assert (=> start!81190 (= res!636792 (valid!1879 thiss!1141))))

(assert (=> start!81190 e!534694))

(assert (=> start!81190 e!534698))

(assert (=> start!81190 true))

(declare-fun b!949690 () Bool)

(declare-fun res!636790 () Bool)

(assert (=> b!949690 (=> (not res!636790) (not e!534694))))

(assert (=> b!949690 (= res!636790 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!949691 () Bool)

(assert (=> b!949691 (= e!534695 tp_is_empty!20713)))

(declare-fun b!949692 () Bool)

(assert (=> b!949692 (= e!534697 (and e!534696 mapRes!32964))))

(declare-fun condMapEmpty!32964 () Bool)

(declare-fun mapDefault!32964 () ValueCell!9875)

(assert (=> b!949692 (= condMapEmpty!32964 (= (arr!27643 (_values!5777 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9875)) mapDefault!32964)))))

(declare-fun b!949693 () Bool)

(declare-fun res!636791 () Bool)

(assert (=> b!949693 (=> (not res!636791) (not e!534694))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9090 0))(
  ( (MissingZero!9090 (index!38731 (_ BitVec 32))) (Found!9090 (index!38732 (_ BitVec 32))) (Intermediate!9090 (undefined!9902 Bool) (index!38733 (_ BitVec 32)) (x!81608 (_ BitVec 32))) (Undefined!9090) (MissingVacant!9090 (index!38734 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57487 (_ BitVec 32)) SeekEntryResult!9090)

(assert (=> b!949693 (= res!636791 (not ((_ is Found!9090) (seekEntry!0 key!756 (_keys!10705 thiss!1141) (mask!27565 thiss!1141)))))))

(assert (= (and start!81190 res!636792) b!949690))

(assert (= (and b!949690 res!636790) b!949693))

(assert (= (and b!949693 res!636791) b!949687))

(assert (= (and b!949687 res!636794) b!949685))

(assert (= (and b!949685 res!636793) b!949686))

(assert (= (and b!949692 condMapEmpty!32964) mapIsEmpty!32964))

(assert (= (and b!949692 (not condMapEmpty!32964)) mapNonEmpty!32964))

(assert (= (and mapNonEmpty!32964 ((_ is ValueCellFull!9875) mapValue!32964)) b!949691))

(assert (= (and b!949692 ((_ is ValueCellFull!9875) mapDefault!32964)) b!949688))

(assert (= b!949689 b!949692))

(assert (= start!81190 b!949689))

(declare-fun m!882827 () Bool)

(assert (=> b!949685 m!882827))

(declare-fun m!882829 () Bool)

(assert (=> b!949687 m!882829))

(assert (=> b!949687 m!882829))

(declare-fun m!882831 () Bool)

(assert (=> b!949687 m!882831))

(declare-fun m!882833 () Bool)

(assert (=> b!949689 m!882833))

(declare-fun m!882835 () Bool)

(assert (=> b!949689 m!882835))

(declare-fun m!882837 () Bool)

(assert (=> b!949693 m!882837))

(declare-fun m!882839 () Bool)

(assert (=> mapNonEmpty!32964 m!882839))

(declare-fun m!882841 () Bool)

(assert (=> start!81190 m!882841))

(check-sat (not b!949693) b_and!29653 (not b_next!18205) tp_is_empty!20713 (not b!949685) (not mapNonEmpty!32964) (not b!949687) (not start!81190) (not b!949689))
(check-sat b_and!29653 (not b_next!18205))
(get-model)

(declare-fun d!115253 () Bool)

(assert (=> d!115253 (= (array_inv!21542 (_keys!10705 thiss!1141)) (bvsge (size!28120 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949689 d!115253))

(declare-fun d!115255 () Bool)

(assert (=> d!115255 (= (array_inv!21543 (_values!5777 thiss!1141)) (bvsge (size!28119 (_values!5777 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949689 d!115255))

(declare-fun d!115257 () Bool)

(assert (=> d!115257 (= (validMask!0 (mask!27565 thiss!1141)) (and (or (= (mask!27565 thiss!1141) #b00000000000000000000000000000111) (= (mask!27565 thiss!1141) #b00000000000000000000000000001111) (= (mask!27565 thiss!1141) #b00000000000000000000000000011111) (= (mask!27565 thiss!1141) #b00000000000000000000000000111111) (= (mask!27565 thiss!1141) #b00000000000000000000000001111111) (= (mask!27565 thiss!1141) #b00000000000000000000000011111111) (= (mask!27565 thiss!1141) #b00000000000000000000000111111111) (= (mask!27565 thiss!1141) #b00000000000000000000001111111111) (= (mask!27565 thiss!1141) #b00000000000000000000011111111111) (= (mask!27565 thiss!1141) #b00000000000000000000111111111111) (= (mask!27565 thiss!1141) #b00000000000000000001111111111111) (= (mask!27565 thiss!1141) #b00000000000000000011111111111111) (= (mask!27565 thiss!1141) #b00000000000000000111111111111111) (= (mask!27565 thiss!1141) #b00000000000000001111111111111111) (= (mask!27565 thiss!1141) #b00000000000000011111111111111111) (= (mask!27565 thiss!1141) #b00000000000000111111111111111111) (= (mask!27565 thiss!1141) #b00000000000001111111111111111111) (= (mask!27565 thiss!1141) #b00000000000011111111111111111111) (= (mask!27565 thiss!1141) #b00000000000111111111111111111111) (= (mask!27565 thiss!1141) #b00000000001111111111111111111111) (= (mask!27565 thiss!1141) #b00000000011111111111111111111111) (= (mask!27565 thiss!1141) #b00000000111111111111111111111111) (= (mask!27565 thiss!1141) #b00000001111111111111111111111111) (= (mask!27565 thiss!1141) #b00000011111111111111111111111111) (= (mask!27565 thiss!1141) #b00000111111111111111111111111111) (= (mask!27565 thiss!1141) #b00001111111111111111111111111111) (= (mask!27565 thiss!1141) #b00011111111111111111111111111111) (= (mask!27565 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27565 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!949685 d!115257))

(declare-fun b!949760 () Bool)

(declare-fun e!534743 () SeekEntryResult!9090)

(declare-fun lt!427614 () SeekEntryResult!9090)

(assert (=> b!949760 (= e!534743 (ite ((_ is MissingVacant!9090) lt!427614) (MissingZero!9090 (index!38734 lt!427614)) lt!427614))))

(declare-fun lt!427612 () SeekEntryResult!9090)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57487 (_ BitVec 32)) SeekEntryResult!9090)

(assert (=> b!949760 (= lt!427614 (seekKeyOrZeroReturnVacant!0 (x!81608 lt!427612) (index!38733 lt!427612) (index!38733 lt!427612) key!756 (_keys!10705 thiss!1141) (mask!27565 thiss!1141)))))

(declare-fun d!115259 () Bool)

(declare-fun lt!427613 () SeekEntryResult!9090)

(assert (=> d!115259 (and (or ((_ is MissingVacant!9090) lt!427613) (not ((_ is Found!9090) lt!427613)) (and (bvsge (index!38732 lt!427613) #b00000000000000000000000000000000) (bvslt (index!38732 lt!427613) (size!28120 (_keys!10705 thiss!1141))))) (not ((_ is MissingVacant!9090) lt!427613)) (or (not ((_ is Found!9090) lt!427613)) (= (select (arr!27644 (_keys!10705 thiss!1141)) (index!38732 lt!427613)) key!756)))))

(declare-fun e!534741 () SeekEntryResult!9090)

(assert (=> d!115259 (= lt!427613 e!534741)))

(declare-fun c!99237 () Bool)

(assert (=> d!115259 (= c!99237 (and ((_ is Intermediate!9090) lt!427612) (undefined!9902 lt!427612)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57487 (_ BitVec 32)) SeekEntryResult!9090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115259 (= lt!427612 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27565 thiss!1141)) key!756 (_keys!10705 thiss!1141) (mask!27565 thiss!1141)))))

(assert (=> d!115259 (validMask!0 (mask!27565 thiss!1141))))

(assert (=> d!115259 (= (seekEntry!0 key!756 (_keys!10705 thiss!1141) (mask!27565 thiss!1141)) lt!427613)))

(declare-fun b!949761 () Bool)

(declare-fun c!99238 () Bool)

(declare-fun lt!427611 () (_ BitVec 64))

(assert (=> b!949761 (= c!99238 (= lt!427611 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534742 () SeekEntryResult!9090)

(assert (=> b!949761 (= e!534742 e!534743)))

(declare-fun b!949762 () Bool)

(assert (=> b!949762 (= e!534742 (Found!9090 (index!38733 lt!427612)))))

(declare-fun b!949763 () Bool)

(assert (=> b!949763 (= e!534741 e!534742)))

(assert (=> b!949763 (= lt!427611 (select (arr!27644 (_keys!10705 thiss!1141)) (index!38733 lt!427612)))))

(declare-fun c!99239 () Bool)

(assert (=> b!949763 (= c!99239 (= lt!427611 key!756))))

(declare-fun b!949764 () Bool)

(assert (=> b!949764 (= e!534741 Undefined!9090)))

(declare-fun b!949765 () Bool)

(assert (=> b!949765 (= e!534743 (MissingZero!9090 (index!38733 lt!427612)))))

(assert (= (and d!115259 c!99237) b!949764))

(assert (= (and d!115259 (not c!99237)) b!949763))

(assert (= (and b!949763 c!99239) b!949762))

(assert (= (and b!949763 (not c!99239)) b!949761))

(assert (= (and b!949761 c!99238) b!949765))

(assert (= (and b!949761 (not c!99238)) b!949760))

(declare-fun m!882875 () Bool)

(assert (=> b!949760 m!882875))

(declare-fun m!882877 () Bool)

(assert (=> d!115259 m!882877))

(declare-fun m!882879 () Bool)

(assert (=> d!115259 m!882879))

(assert (=> d!115259 m!882879))

(declare-fun m!882881 () Bool)

(assert (=> d!115259 m!882881))

(assert (=> d!115259 m!882827))

(declare-fun m!882883 () Bool)

(assert (=> b!949763 m!882883))

(assert (=> b!949693 d!115259))

(declare-fun d!115261 () Bool)

(declare-fun res!636831 () Bool)

(declare-fun e!534746 () Bool)

(assert (=> d!115261 (=> (not res!636831) (not e!534746))))

(declare-fun simpleValid!369 (LongMapFixedSize!4900) Bool)

(assert (=> d!115261 (= res!636831 (simpleValid!369 thiss!1141))))

(assert (=> d!115261 (= (valid!1879 thiss!1141) e!534746)))

(declare-fun b!949772 () Bool)

(declare-fun res!636832 () Bool)

(assert (=> b!949772 (=> (not res!636832) (not e!534746))))

(declare-fun arrayCountValidKeys!0 (array!57487 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!949772 (= res!636832 (= (arrayCountValidKeys!0 (_keys!10705 thiss!1141) #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))) (_size!2505 thiss!1141)))))

(declare-fun b!949773 () Bool)

(declare-fun res!636833 () Bool)

(assert (=> b!949773 (=> (not res!636833) (not e!534746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57487 (_ BitVec 32)) Bool)

(assert (=> b!949773 (= res!636833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10705 thiss!1141) (mask!27565 thiss!1141)))))

(declare-fun b!949774 () Bool)

(declare-datatypes ((List!19310 0))(
  ( (Nil!19307) (Cons!19306 (h!20470 (_ BitVec 64)) (t!27633 List!19310)) )
))
(declare-fun arrayNoDuplicates!0 (array!57487 (_ BitVec 32) List!19310) Bool)

(assert (=> b!949774 (= e!534746 (arrayNoDuplicates!0 (_keys!10705 thiss!1141) #b00000000000000000000000000000000 Nil!19307))))

(assert (= (and d!115261 res!636831) b!949772))

(assert (= (and b!949772 res!636832) b!949773))

(assert (= (and b!949773 res!636833) b!949774))

(declare-fun m!882885 () Bool)

(assert (=> d!115261 m!882885))

(declare-fun m!882887 () Bool)

(assert (=> b!949772 m!882887))

(declare-fun m!882889 () Bool)

(assert (=> b!949773 m!882889))

(declare-fun m!882891 () Bool)

(assert (=> b!949774 m!882891))

(assert (=> start!81190 d!115261))

(declare-fun d!115263 () Bool)

(declare-fun e!534752 () Bool)

(assert (=> d!115263 e!534752))

(declare-fun res!636836 () Bool)

(assert (=> d!115263 (=> res!636836 e!534752)))

(declare-fun lt!427626 () Bool)

(assert (=> d!115263 (= res!636836 (not lt!427626))))

(declare-fun lt!427625 () Bool)

(assert (=> d!115263 (= lt!427626 lt!427625)))

(declare-datatypes ((Unit!31942 0))(
  ( (Unit!31943) )
))
(declare-fun lt!427623 () Unit!31942)

(declare-fun e!534751 () Unit!31942)

(assert (=> d!115263 (= lt!427623 e!534751)))

(declare-fun c!99242 () Bool)

(assert (=> d!115263 (= c!99242 lt!427625)))

(declare-fun containsKey!461 (List!19308 (_ BitVec 64)) Bool)

(assert (=> d!115263 (= lt!427625 (containsKey!461 (toList!6120 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(assert (=> d!115263 (= (contains!5217 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) key!756) lt!427626)))

(declare-fun b!949781 () Bool)

(declare-fun lt!427624 () Unit!31942)

(assert (=> b!949781 (= e!534751 lt!427624)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!355 (List!19308 (_ BitVec 64)) Unit!31942)

(assert (=> b!949781 (= lt!427624 (lemmaContainsKeyImpliesGetValueByKeyDefined!355 (toList!6120 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(declare-datatypes ((Option!496 0))(
  ( (Some!495 (v!12945 V!32583)) (None!494) )
))
(declare-fun isDefined!363 (Option!496) Bool)

(declare-fun getValueByKey!490 (List!19308 (_ BitVec 64)) Option!496)

(assert (=> b!949781 (isDefined!363 (getValueByKey!490 (toList!6120 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756))))

(declare-fun b!949782 () Bool)

(declare-fun Unit!31944 () Unit!31942)

(assert (=> b!949782 (= e!534751 Unit!31944)))

(declare-fun b!949783 () Bool)

(assert (=> b!949783 (= e!534752 (isDefined!363 (getValueByKey!490 (toList!6120 (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141))) key!756)))))

(assert (= (and d!115263 c!99242) b!949781))

(assert (= (and d!115263 (not c!99242)) b!949782))

(assert (= (and d!115263 (not res!636836)) b!949783))

(declare-fun m!882893 () Bool)

(assert (=> d!115263 m!882893))

(declare-fun m!882895 () Bool)

(assert (=> b!949781 m!882895))

(declare-fun m!882897 () Bool)

(assert (=> b!949781 m!882897))

(assert (=> b!949781 m!882897))

(declare-fun m!882899 () Bool)

(assert (=> b!949781 m!882899))

(assert (=> b!949783 m!882897))

(assert (=> b!949783 m!882897))

(assert (=> b!949783 m!882899))

(assert (=> b!949687 d!115263))

(declare-fun bm!41289 () Bool)

(declare-fun call!41298 () ListLongMap!12209)

(declare-fun call!41296 () ListLongMap!12209)

(assert (=> bm!41289 (= call!41298 call!41296)))

(declare-fun b!949826 () Bool)

(declare-fun e!534789 () Bool)

(declare-fun e!534791 () Bool)

(assert (=> b!949826 (= e!534789 e!534791)))

(declare-fun res!636856 () Bool)

(assert (=> b!949826 (=> (not res!636856) (not e!534791))))

(declare-fun lt!427688 () ListLongMap!12209)

(assert (=> b!949826 (= res!636856 (contains!5217 lt!427688 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!949826 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))))))

(declare-fun d!115265 () Bool)

(declare-fun e!534779 () Bool)

(assert (=> d!115265 e!534779))

(declare-fun res!636860 () Bool)

(assert (=> d!115265 (=> (not res!636860) (not e!534779))))

(assert (=> d!115265 (= res!636860 (or (bvsge #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))))))))

(declare-fun lt!427672 () ListLongMap!12209)

(assert (=> d!115265 (= lt!427688 lt!427672)))

(declare-fun lt!427683 () Unit!31942)

(declare-fun e!534786 () Unit!31942)

(assert (=> d!115265 (= lt!427683 e!534786)))

(declare-fun c!99258 () Bool)

(declare-fun e!534784 () Bool)

(assert (=> d!115265 (= c!99258 e!534784)))

(declare-fun res!636857 () Bool)

(assert (=> d!115265 (=> (not res!636857) (not e!534784))))

(assert (=> d!115265 (= res!636857 (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))))))

(declare-fun e!534787 () ListLongMap!12209)

(assert (=> d!115265 (= lt!427672 e!534787)))

(declare-fun c!99256 () Bool)

(assert (=> d!115265 (= c!99256 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115265 (validMask!0 (mask!27565 thiss!1141))))

(assert (=> d!115265 (= (getCurrentListMap!3353 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)) lt!427688)))

(declare-fun bm!41290 () Bool)

(declare-fun call!41293 () ListLongMap!12209)

(declare-fun getCurrentListMapNoExtraKeys!3356 (array!57487 array!57485 (_ BitVec 32) (_ BitVec 32) V!32583 V!32583 (_ BitVec 32) Int) ListLongMap!12209)

(assert (=> bm!41290 (= call!41293 (getCurrentListMapNoExtraKeys!3356 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun b!949827 () Bool)

(declare-fun e!534782 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!949827 (= e!534782 (validKeyInArray!0 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949828 () Bool)

(declare-fun e!534790 () ListLongMap!12209)

(assert (=> b!949828 (= e!534787 e!534790)))

(declare-fun c!99255 () Bool)

(assert (=> b!949828 (= c!99255 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949829 () Bool)

(declare-fun res!636861 () Bool)

(assert (=> b!949829 (=> (not res!636861) (not e!534779))))

(declare-fun e!534781 () Bool)

(assert (=> b!949829 (= res!636861 e!534781)))

(declare-fun c!99257 () Bool)

(assert (=> b!949829 (= c!99257 (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!949830 () Bool)

(declare-fun e!534783 () ListLongMap!12209)

(declare-fun call!41294 () ListLongMap!12209)

(assert (=> b!949830 (= e!534783 call!41294)))

(declare-fun bm!41291 () Bool)

(declare-fun call!41297 () Bool)

(assert (=> bm!41291 (= call!41297 (contains!5217 lt!427688 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949831 () Bool)

(assert (=> b!949831 (= e!534790 call!41298)))

(declare-fun b!949832 () Bool)

(assert (=> b!949832 (= e!534784 (validKeyInArray!0 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!949833 () Bool)

(declare-fun apply!882 (ListLongMap!12209 (_ BitVec 64)) V!32583)

(declare-fun get!14535 (ValueCell!9875 V!32583) V!32583)

(declare-fun dynLambda!1665 (Int (_ BitVec 64)) V!32583)

(assert (=> b!949833 (= e!534791 (= (apply!882 lt!427688 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000)) (get!14535 (select (arr!27643 (_values!5777 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1665 (defaultEntry!5754 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!949833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28119 (_values!5777 thiss!1141))))))

(assert (=> b!949833 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))))))

(declare-fun bm!41292 () Bool)

(declare-fun call!41292 () ListLongMap!12209)

(assert (=> bm!41292 (= call!41294 call!41292)))

(declare-fun b!949834 () Bool)

(declare-fun Unit!31945 () Unit!31942)

(assert (=> b!949834 (= e!534786 Unit!31945)))

(declare-fun b!949835 () Bool)

(declare-fun call!41295 () Bool)

(assert (=> b!949835 (= e!534781 (not call!41295))))

(declare-fun b!949836 () Bool)

(declare-fun e!534788 () Bool)

(assert (=> b!949836 (= e!534788 (not call!41297))))

(declare-fun b!949837 () Bool)

(declare-fun lt!427687 () Unit!31942)

(assert (=> b!949837 (= e!534786 lt!427687)))

(declare-fun lt!427685 () ListLongMap!12209)

(assert (=> b!949837 (= lt!427685 (getCurrentListMapNoExtraKeys!3356 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427680 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427680 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427689 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427689 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427671 () Unit!31942)

(declare-fun addStillContains!571 (ListLongMap!12209 (_ BitVec 64) V!32583 (_ BitVec 64)) Unit!31942)

(assert (=> b!949837 (= lt!427671 (addStillContains!571 lt!427685 lt!427680 (zeroValue!5590 thiss!1141) lt!427689))))

(declare-fun +!2868 (ListLongMap!12209 tuple2!13510) ListLongMap!12209)

(assert (=> b!949837 (contains!5217 (+!2868 lt!427685 (tuple2!13511 lt!427680 (zeroValue!5590 thiss!1141))) lt!427689)))

(declare-fun lt!427679 () Unit!31942)

(assert (=> b!949837 (= lt!427679 lt!427671)))

(declare-fun lt!427686 () ListLongMap!12209)

(assert (=> b!949837 (= lt!427686 (getCurrentListMapNoExtraKeys!3356 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427675 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427675 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427677 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427677 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427691 () Unit!31942)

(declare-fun addApplyDifferent!452 (ListLongMap!12209 (_ BitVec 64) V!32583 (_ BitVec 64)) Unit!31942)

(assert (=> b!949837 (= lt!427691 (addApplyDifferent!452 lt!427686 lt!427675 (minValue!5590 thiss!1141) lt!427677))))

(assert (=> b!949837 (= (apply!882 (+!2868 lt!427686 (tuple2!13511 lt!427675 (minValue!5590 thiss!1141))) lt!427677) (apply!882 lt!427686 lt!427677))))

(declare-fun lt!427690 () Unit!31942)

(assert (=> b!949837 (= lt!427690 lt!427691)))

(declare-fun lt!427684 () ListLongMap!12209)

(assert (=> b!949837 (= lt!427684 (getCurrentListMapNoExtraKeys!3356 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427676 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427674 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427674 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427681 () Unit!31942)

(assert (=> b!949837 (= lt!427681 (addApplyDifferent!452 lt!427684 lt!427676 (zeroValue!5590 thiss!1141) lt!427674))))

(assert (=> b!949837 (= (apply!882 (+!2868 lt!427684 (tuple2!13511 lt!427676 (zeroValue!5590 thiss!1141))) lt!427674) (apply!882 lt!427684 lt!427674))))

(declare-fun lt!427682 () Unit!31942)

(assert (=> b!949837 (= lt!427682 lt!427681)))

(declare-fun lt!427692 () ListLongMap!12209)

(assert (=> b!949837 (= lt!427692 (getCurrentListMapNoExtraKeys!3356 (_keys!10705 thiss!1141) (_values!5777 thiss!1141) (mask!27565 thiss!1141) (extraKeys!5486 thiss!1141) (zeroValue!5590 thiss!1141) (minValue!5590 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5754 thiss!1141)))))

(declare-fun lt!427678 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427678 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427673 () (_ BitVec 64))

(assert (=> b!949837 (= lt!427673 (select (arr!27644 (_keys!10705 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!949837 (= lt!427687 (addApplyDifferent!452 lt!427692 lt!427678 (minValue!5590 thiss!1141) lt!427673))))

(assert (=> b!949837 (= (apply!882 (+!2868 lt!427692 (tuple2!13511 lt!427678 (minValue!5590 thiss!1141))) lt!427673) (apply!882 lt!427692 lt!427673))))

(declare-fun b!949838 () Bool)

(declare-fun res!636863 () Bool)

(assert (=> b!949838 (=> (not res!636863) (not e!534779))))

(assert (=> b!949838 (= res!636863 e!534789)))

(declare-fun res!636855 () Bool)

(assert (=> b!949838 (=> res!636855 e!534789)))

(assert (=> b!949838 (= res!636855 (not e!534782))))

(declare-fun res!636858 () Bool)

(assert (=> b!949838 (=> (not res!636858) (not e!534782))))

(assert (=> b!949838 (= res!636858 (bvslt #b00000000000000000000000000000000 (size!28120 (_keys!10705 thiss!1141))))))

(declare-fun b!949839 () Bool)

(declare-fun c!99259 () Bool)

(assert (=> b!949839 (= c!99259 (and (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!949839 (= e!534790 e!534783)))

(declare-fun b!949840 () Bool)

(declare-fun e!534780 () Bool)

(assert (=> b!949840 (= e!534788 e!534780)))

(declare-fun res!636859 () Bool)

(assert (=> b!949840 (= res!636859 call!41297)))

(assert (=> b!949840 (=> (not res!636859) (not e!534780))))

(declare-fun b!949841 () Bool)

(declare-fun e!534785 () Bool)

(assert (=> b!949841 (= e!534785 (= (apply!882 lt!427688 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5590 thiss!1141)))))

(declare-fun bm!41293 () Bool)

(assert (=> bm!41293 (= call!41292 call!41293)))

(declare-fun b!949842 () Bool)

(assert (=> b!949842 (= e!534787 (+!2868 call!41296 (tuple2!13511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5590 thiss!1141))))))

(declare-fun bm!41294 () Bool)

(assert (=> bm!41294 (= call!41295 (contains!5217 lt!427688 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!949843 () Bool)

(assert (=> b!949843 (= e!534779 e!534788)))

(declare-fun c!99260 () Bool)

(assert (=> b!949843 (= c!99260 (not (= (bvand (extraKeys!5486 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!949844 () Bool)

(assert (=> b!949844 (= e!534783 call!41298)))

(declare-fun b!949845 () Bool)

(assert (=> b!949845 (= e!534780 (= (apply!882 lt!427688 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5590 thiss!1141)))))

(declare-fun b!949846 () Bool)

(assert (=> b!949846 (= e!534781 e!534785)))

(declare-fun res!636862 () Bool)

(assert (=> b!949846 (= res!636862 call!41295)))

(assert (=> b!949846 (=> (not res!636862) (not e!534785))))

(declare-fun bm!41295 () Bool)

(assert (=> bm!41295 (= call!41296 (+!2868 (ite c!99256 call!41293 (ite c!99255 call!41292 call!41294)) (ite (or c!99256 c!99255) (tuple2!13511 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5590 thiss!1141)) (tuple2!13511 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5590 thiss!1141)))))))

(assert (= (and d!115265 c!99256) b!949842))

(assert (= (and d!115265 (not c!99256)) b!949828))

(assert (= (and b!949828 c!99255) b!949831))

(assert (= (and b!949828 (not c!99255)) b!949839))

(assert (= (and b!949839 c!99259) b!949844))

(assert (= (and b!949839 (not c!99259)) b!949830))

(assert (= (or b!949844 b!949830) bm!41292))

(assert (= (or b!949831 bm!41292) bm!41293))

(assert (= (or b!949831 b!949844) bm!41289))

(assert (= (or b!949842 bm!41293) bm!41290))

(assert (= (or b!949842 bm!41289) bm!41295))

(assert (= (and d!115265 res!636857) b!949832))

(assert (= (and d!115265 c!99258) b!949837))

(assert (= (and d!115265 (not c!99258)) b!949834))

(assert (= (and d!115265 res!636860) b!949838))

(assert (= (and b!949838 res!636858) b!949827))

(assert (= (and b!949838 (not res!636855)) b!949826))

(assert (= (and b!949826 res!636856) b!949833))

(assert (= (and b!949838 res!636863) b!949829))

(assert (= (and b!949829 c!99257) b!949846))

(assert (= (and b!949829 (not c!99257)) b!949835))

(assert (= (and b!949846 res!636862) b!949841))

(assert (= (or b!949846 b!949835) bm!41294))

(assert (= (and b!949829 res!636861) b!949843))

(assert (= (and b!949843 c!99260) b!949840))

(assert (= (and b!949843 (not c!99260)) b!949836))

(assert (= (and b!949840 res!636859) b!949845))

(assert (= (or b!949840 b!949836) bm!41291))

(declare-fun b_lambda!14345 () Bool)

(assert (=> (not b_lambda!14345) (not b!949833)))

(declare-fun t!27632 () Bool)

(declare-fun tb!6173 () Bool)

(assert (=> (and b!949689 (= (defaultEntry!5754 thiss!1141) (defaultEntry!5754 thiss!1141)) t!27632) tb!6173))

(declare-fun result!12257 () Bool)

(assert (=> tb!6173 (= result!12257 tp_is_empty!20713)))

(assert (=> b!949833 t!27632))

(declare-fun b_and!29659 () Bool)

(assert (= b_and!29653 (and (=> t!27632 result!12257) b_and!29659)))

(declare-fun m!882901 () Bool)

(assert (=> b!949842 m!882901))

(declare-fun m!882903 () Bool)

(assert (=> b!949841 m!882903))

(declare-fun m!882905 () Bool)

(assert (=> b!949833 m!882905))

(declare-fun m!882907 () Bool)

(assert (=> b!949833 m!882907))

(declare-fun m!882909 () Bool)

(assert (=> b!949833 m!882909))

(assert (=> b!949833 m!882907))

(declare-fun m!882911 () Bool)

(assert (=> b!949833 m!882911))

(assert (=> b!949833 m!882905))

(assert (=> b!949833 m!882909))

(declare-fun m!882913 () Bool)

(assert (=> b!949833 m!882913))

(assert (=> b!949827 m!882907))

(assert (=> b!949827 m!882907))

(declare-fun m!882915 () Bool)

(assert (=> b!949827 m!882915))

(assert (=> b!949837 m!882907))

(declare-fun m!882917 () Bool)

(assert (=> b!949837 m!882917))

(declare-fun m!882919 () Bool)

(assert (=> b!949837 m!882919))

(declare-fun m!882921 () Bool)

(assert (=> b!949837 m!882921))

(declare-fun m!882923 () Bool)

(assert (=> b!949837 m!882923))

(declare-fun m!882925 () Bool)

(assert (=> b!949837 m!882925))

(declare-fun m!882927 () Bool)

(assert (=> b!949837 m!882927))

(declare-fun m!882929 () Bool)

(assert (=> b!949837 m!882929))

(declare-fun m!882931 () Bool)

(assert (=> b!949837 m!882931))

(declare-fun m!882933 () Bool)

(assert (=> b!949837 m!882933))

(assert (=> b!949837 m!882919))

(declare-fun m!882935 () Bool)

(assert (=> b!949837 m!882935))

(assert (=> b!949837 m!882923))

(declare-fun m!882937 () Bool)

(assert (=> b!949837 m!882937))

(declare-fun m!882939 () Bool)

(assert (=> b!949837 m!882939))

(declare-fun m!882941 () Bool)

(assert (=> b!949837 m!882941))

(declare-fun m!882943 () Bool)

(assert (=> b!949837 m!882943))

(assert (=> b!949837 m!882927))

(declare-fun m!882945 () Bool)

(assert (=> b!949837 m!882945))

(assert (=> b!949837 m!882939))

(declare-fun m!882947 () Bool)

(assert (=> b!949837 m!882947))

(declare-fun m!882949 () Bool)

(assert (=> b!949845 m!882949))

(assert (=> bm!41290 m!882931))

(declare-fun m!882951 () Bool)

(assert (=> bm!41291 m!882951))

(assert (=> d!115265 m!882827))

(declare-fun m!882953 () Bool)

(assert (=> bm!41295 m!882953))

(declare-fun m!882955 () Bool)

(assert (=> bm!41294 m!882955))

(assert (=> b!949826 m!882907))

(assert (=> b!949826 m!882907))

(declare-fun m!882957 () Bool)

(assert (=> b!949826 m!882957))

(assert (=> b!949832 m!882907))

(assert (=> b!949832 m!882907))

(assert (=> b!949832 m!882915))

(assert (=> b!949687 d!115265))

(declare-fun mapIsEmpty!32973 () Bool)

(declare-fun mapRes!32973 () Bool)

(assert (=> mapIsEmpty!32973 mapRes!32973))

(declare-fun b!949855 () Bool)

(declare-fun e!534796 () Bool)

(assert (=> b!949855 (= e!534796 tp_is_empty!20713)))

(declare-fun mapNonEmpty!32973 () Bool)

(declare-fun tp!63210 () Bool)

(assert (=> mapNonEmpty!32973 (= mapRes!32973 (and tp!63210 e!534796))))

(declare-fun mapRest!32973 () (Array (_ BitVec 32) ValueCell!9875))

(declare-fun mapKey!32973 () (_ BitVec 32))

(declare-fun mapValue!32973 () ValueCell!9875)

(assert (=> mapNonEmpty!32973 (= mapRest!32964 (store mapRest!32973 mapKey!32973 mapValue!32973))))

(declare-fun b!949856 () Bool)

(declare-fun e!534797 () Bool)

(assert (=> b!949856 (= e!534797 tp_is_empty!20713)))

(declare-fun condMapEmpty!32973 () Bool)

(declare-fun mapDefault!32973 () ValueCell!9875)

(assert (=> mapNonEmpty!32964 (= condMapEmpty!32973 (= mapRest!32964 ((as const (Array (_ BitVec 32) ValueCell!9875)) mapDefault!32973)))))

(assert (=> mapNonEmpty!32964 (= tp!63194 (and e!534797 mapRes!32973))))

(assert (= (and mapNonEmpty!32964 condMapEmpty!32973) mapIsEmpty!32973))

(assert (= (and mapNonEmpty!32964 (not condMapEmpty!32973)) mapNonEmpty!32973))

(assert (= (and mapNonEmpty!32973 ((_ is ValueCellFull!9875) mapValue!32973)) b!949855))

(assert (= (and mapNonEmpty!32964 ((_ is ValueCellFull!9875) mapDefault!32973)) b!949856))

(declare-fun m!882959 () Bool)

(assert (=> mapNonEmpty!32973 m!882959))

(declare-fun b_lambda!14347 () Bool)

(assert (= b_lambda!14345 (or (and b!949689 b_free!18205) b_lambda!14347)))

(check-sat (not d!115259) (not b!949760) (not d!115265) (not b!949841) (not b!949783) (not d!115261) (not b!949773) (not b_lambda!14347) (not d!115263) b_and!29659 (not b!949832) (not bm!41290) (not b!949774) (not bm!41291) (not bm!41295) (not b!949842) (not b!949837) (not b!949833) (not b!949845) (not b_next!18205) (not b!949826) tp_is_empty!20713 (not bm!41294) (not b!949781) (not mapNonEmpty!32973) (not b!949827) (not b!949772))
(check-sat b_and!29659 (not b_next!18205))
