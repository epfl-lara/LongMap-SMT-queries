; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76372 () Bool)

(assert start!76372)

(declare-fun b!895844 () Bool)

(declare-fun b_free!15937 () Bool)

(declare-fun b_next!15937 () Bool)

(assert (=> b!895844 (= b_free!15937 (not b_next!15937))))

(declare-fun tp!55837 () Bool)

(declare-fun b_and!26203 () Bool)

(assert (=> b!895844 (= tp!55837 b_and!26203)))

(declare-fun b!895842 () Bool)

(declare-fun e!500641 () Bool)

(declare-datatypes ((SeekEntryResult!8896 0))(
  ( (MissingZero!8896 (index!37955 (_ BitVec 32))) (Found!8896 (index!37956 (_ BitVec 32))) (Intermediate!8896 (undefined!9708 Bool) (index!37957 (_ BitVec 32)) (x!76283 (_ BitVec 32))) (Undefined!8896) (MissingVacant!8896 (index!37958 (_ BitVec 32))) )
))
(declare-fun lt!404462 () SeekEntryResult!8896)

(declare-datatypes ((array!52525 0))(
  ( (array!52526 (arr!25253 (Array (_ BitVec 32) (_ BitVec 64))) (size!25705 (_ BitVec 32))) )
))
(declare-datatypes ((V!29319 0))(
  ( (V!29320 (val!9183 Int)) )
))
(declare-datatypes ((ValueCell!8651 0))(
  ( (ValueCellFull!8651 (v!11670 V!29319)) (EmptyCell!8651) )
))
(declare-datatypes ((array!52527 0))(
  ( (array!52528 (arr!25254 (Array (_ BitVec 32) ValueCell!8651)) (size!25706 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4318 0))(
  ( (LongMapFixedSize!4319 (defaultEntry!5371 Int) (mask!25988 (_ BitVec 32)) (extraKeys!5069 (_ BitVec 32)) (zeroValue!5173 V!29319) (minValue!5173 V!29319) (_size!2214 (_ BitVec 32)) (_keys!10091 array!52525) (_values!5360 array!52527) (_vacant!2214 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4318)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895842 (= e!500641 (inRange!0 (index!37956 lt!404462) (mask!25988 thiss!1181)))))

(declare-fun b!895843 () Bool)

(declare-fun res!605885 () Bool)

(declare-fun e!500642 () Bool)

(assert (=> b!895843 (=> (not res!605885) (not e!500642))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895843 (= res!605885 (not (= key!785 (bvneg key!785))))))

(declare-fun e!500640 () Bool)

(declare-fun tp_is_empty!18265 () Bool)

(declare-fun e!500643 () Bool)

(declare-fun array_inv!19878 (array!52525) Bool)

(declare-fun array_inv!19879 (array!52527) Bool)

(assert (=> b!895844 (= e!500640 (and tp!55837 tp_is_empty!18265 (array_inv!19878 (_keys!10091 thiss!1181)) (array_inv!19879 (_values!5360 thiss!1181)) e!500643))))

(declare-fun mapNonEmpty!29008 () Bool)

(declare-fun mapRes!29008 () Bool)

(declare-fun tp!55836 () Bool)

(declare-fun e!500639 () Bool)

(assert (=> mapNonEmpty!29008 (= mapRes!29008 (and tp!55836 e!500639))))

(declare-fun mapRest!29008 () (Array (_ BitVec 32) ValueCell!8651))

(declare-fun mapKey!29008 () (_ BitVec 32))

(declare-fun mapValue!29008 () ValueCell!8651)

(assert (=> mapNonEmpty!29008 (= (arr!25254 (_values!5360 thiss!1181)) (store mapRest!29008 mapKey!29008 mapValue!29008))))

(declare-fun b!895845 () Bool)

(declare-fun e!500638 () Bool)

(assert (=> b!895845 (= e!500643 (and e!500638 mapRes!29008))))

(declare-fun condMapEmpty!29008 () Bool)

(declare-fun mapDefault!29008 () ValueCell!8651)

(assert (=> b!895845 (= condMapEmpty!29008 (= (arr!25254 (_values!5360 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29008)))))

(declare-fun res!605884 () Bool)

(assert (=> start!76372 (=> (not res!605884) (not e!500642))))

(declare-fun valid!1671 (LongMapFixedSize!4318) Bool)

(assert (=> start!76372 (= res!605884 (valid!1671 thiss!1181))))

(assert (=> start!76372 e!500642))

(assert (=> start!76372 e!500640))

(assert (=> start!76372 true))

(declare-fun mapIsEmpty!29008 () Bool)

(assert (=> mapIsEmpty!29008 mapRes!29008))

(declare-fun b!895846 () Bool)

(get-info :version)

(assert (=> b!895846 (= e!500642 (not (or (not ((_ is Found!8896) lt!404462)) (bvslt (index!37956 lt!404462) #b00000000000000000000000000000000) (bvsge (index!37956 lt!404462) (size!25705 (_keys!10091 thiss!1181))) (bvslt (size!25705 (_keys!10091 thiss!1181)) #b01111111111111111111111111111111))))))

(assert (=> b!895846 e!500641))

(declare-fun res!605886 () Bool)

(assert (=> b!895846 (=> res!605886 e!500641)))

(assert (=> b!895846 (= res!605886 (not ((_ is Found!8896) lt!404462)))))

(declare-datatypes ((Unit!30420 0))(
  ( (Unit!30421) )
))
(declare-fun lt!404461 () Unit!30420)

(declare-fun lemmaSeekEntryGivesInRangeIndex!69 (array!52525 array!52527 (_ BitVec 32) (_ BitVec 32) V!29319 V!29319 (_ BitVec 64)) Unit!30420)

(assert (=> b!895846 (= lt!404461 (lemmaSeekEntryGivesInRangeIndex!69 (_keys!10091 thiss!1181) (_values!5360 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!895846 (= lt!404462 (seekEntry!0 key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!895847 () Bool)

(assert (=> b!895847 (= e!500638 tp_is_empty!18265)))

(declare-fun b!895848 () Bool)

(assert (=> b!895848 (= e!500639 tp_is_empty!18265)))

(assert (= (and start!76372 res!605884) b!895843))

(assert (= (and b!895843 res!605885) b!895846))

(assert (= (and b!895846 (not res!605886)) b!895842))

(assert (= (and b!895845 condMapEmpty!29008) mapIsEmpty!29008))

(assert (= (and b!895845 (not condMapEmpty!29008)) mapNonEmpty!29008))

(assert (= (and mapNonEmpty!29008 ((_ is ValueCellFull!8651) mapValue!29008)) b!895848))

(assert (= (and b!895845 ((_ is ValueCellFull!8651) mapDefault!29008)) b!895847))

(assert (= b!895844 b!895845))

(assert (= start!76372 b!895844))

(declare-fun m!832645 () Bool)

(assert (=> b!895844 m!832645))

(declare-fun m!832647 () Bool)

(assert (=> b!895844 m!832647))

(declare-fun m!832649 () Bool)

(assert (=> b!895842 m!832649))

(declare-fun m!832651 () Bool)

(assert (=> mapNonEmpty!29008 m!832651))

(declare-fun m!832653 () Bool)

(assert (=> b!895846 m!832653))

(declare-fun m!832655 () Bool)

(assert (=> b!895846 m!832655))

(declare-fun m!832657 () Bool)

(assert (=> start!76372 m!832657))

(check-sat (not start!76372) (not b!895846) (not mapNonEmpty!29008) (not b!895842) (not b_next!15937) tp_is_empty!18265 b_and!26203 (not b!895844))
(check-sat b_and!26203 (not b_next!15937))
(get-model)

(declare-fun d!110661 () Bool)

(declare-fun res!605911 () Bool)

(declare-fun e!500689 () Bool)

(assert (=> d!110661 (=> (not res!605911) (not e!500689))))

(declare-fun simpleValid!311 (LongMapFixedSize!4318) Bool)

(assert (=> d!110661 (= res!605911 (simpleValid!311 thiss!1181))))

(assert (=> d!110661 (= (valid!1671 thiss!1181) e!500689)))

(declare-fun b!895897 () Bool)

(declare-fun res!605912 () Bool)

(assert (=> b!895897 (=> (not res!605912) (not e!500689))))

(declare-fun arrayCountValidKeys!0 (array!52525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895897 (= res!605912 (= (arrayCountValidKeys!0 (_keys!10091 thiss!1181) #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))) (_size!2214 thiss!1181)))))

(declare-fun b!895898 () Bool)

(declare-fun res!605913 () Bool)

(assert (=> b!895898 (=> (not res!605913) (not e!500689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52525 (_ BitVec 32)) Bool)

(assert (=> b!895898 (= res!605913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!895899 () Bool)

(declare-datatypes ((List!17829 0))(
  ( (Nil!17826) (Cons!17825 (h!18962 (_ BitVec 64)) (t!25159 List!17829)) )
))
(declare-fun arrayNoDuplicates!0 (array!52525 (_ BitVec 32) List!17829) Bool)

(assert (=> b!895899 (= e!500689 (arrayNoDuplicates!0 (_keys!10091 thiss!1181) #b00000000000000000000000000000000 Nil!17826))))

(assert (= (and d!110661 res!605911) b!895897))

(assert (= (and b!895897 res!605912) b!895898))

(assert (= (and b!895898 res!605913) b!895899))

(declare-fun m!832687 () Bool)

(assert (=> d!110661 m!832687))

(declare-fun m!832689 () Bool)

(assert (=> b!895897 m!832689))

(declare-fun m!832691 () Bool)

(assert (=> b!895898 m!832691))

(declare-fun m!832693 () Bool)

(assert (=> b!895899 m!832693))

(assert (=> start!76372 d!110661))

(declare-fun d!110663 () Bool)

(declare-fun e!500692 () Bool)

(assert (=> d!110663 e!500692))

(declare-fun res!605916 () Bool)

(assert (=> d!110663 (=> res!605916 e!500692)))

(declare-fun lt!404480 () SeekEntryResult!8896)

(assert (=> d!110663 (= res!605916 (not ((_ is Found!8896) lt!404480)))))

(assert (=> d!110663 (= lt!404480 (seekEntry!0 key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun lt!404479 () Unit!30420)

(declare-fun choose!1485 (array!52525 array!52527 (_ BitVec 32) (_ BitVec 32) V!29319 V!29319 (_ BitVec 64)) Unit!30420)

(assert (=> d!110663 (= lt!404479 (choose!1485 (_keys!10091 thiss!1181) (_values!5360 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110663 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110663 (= (lemmaSeekEntryGivesInRangeIndex!69 (_keys!10091 thiss!1181) (_values!5360 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785) lt!404479)))

(declare-fun b!895902 () Bool)

(assert (=> b!895902 (= e!500692 (inRange!0 (index!37956 lt!404480) (mask!25988 thiss!1181)))))

(assert (= (and d!110663 (not res!605916)) b!895902))

(assert (=> d!110663 m!832655))

(declare-fun m!832695 () Bool)

(assert (=> d!110663 m!832695))

(declare-fun m!832697 () Bool)

(assert (=> d!110663 m!832697))

(declare-fun m!832699 () Bool)

(assert (=> b!895902 m!832699))

(assert (=> b!895846 d!110663))

(declare-fun b!895915 () Bool)

(declare-fun e!500700 () SeekEntryResult!8896)

(declare-fun lt!404490 () SeekEntryResult!8896)

(assert (=> b!895915 (= e!500700 (Found!8896 (index!37957 lt!404490)))))

(declare-fun b!895916 () Bool)

(declare-fun c!94578 () Bool)

(declare-fun lt!404489 () (_ BitVec 64))

(assert (=> b!895916 (= c!94578 (= lt!404489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500699 () SeekEntryResult!8896)

(assert (=> b!895916 (= e!500700 e!500699)))

(declare-fun b!895917 () Bool)

(declare-fun lt!404492 () SeekEntryResult!8896)

(assert (=> b!895917 (= e!500699 (ite ((_ is MissingVacant!8896) lt!404492) (MissingZero!8896 (index!37958 lt!404492)) lt!404492))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!895917 (= lt!404492 (seekKeyOrZeroReturnVacant!0 (x!76283 lt!404490) (index!37957 lt!404490) (index!37957 lt!404490) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun d!110665 () Bool)

(declare-fun lt!404491 () SeekEntryResult!8896)

(assert (=> d!110665 (and (or ((_ is MissingVacant!8896) lt!404491) (not ((_ is Found!8896) lt!404491)) (and (bvsge (index!37956 lt!404491) #b00000000000000000000000000000000) (bvslt (index!37956 lt!404491) (size!25705 (_keys!10091 thiss!1181))))) (not ((_ is MissingVacant!8896) lt!404491)) (or (not ((_ is Found!8896) lt!404491)) (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37956 lt!404491)) key!785)))))

(declare-fun e!500701 () SeekEntryResult!8896)

(assert (=> d!110665 (= lt!404491 e!500701)))

(declare-fun c!94577 () Bool)

(assert (=> d!110665 (= c!94577 (and ((_ is Intermediate!8896) lt!404490) (undefined!9708 lt!404490)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110665 (= lt!404490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25988 thiss!1181)) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(assert (=> d!110665 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110665 (= (seekEntry!0 key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)) lt!404491)))

(declare-fun b!895918 () Bool)

(assert (=> b!895918 (= e!500701 e!500700)))

(assert (=> b!895918 (= lt!404489 (select (arr!25253 (_keys!10091 thiss!1181)) (index!37957 lt!404490)))))

(declare-fun c!94576 () Bool)

(assert (=> b!895918 (= c!94576 (= lt!404489 key!785))))

(declare-fun b!895919 () Bool)

(assert (=> b!895919 (= e!500701 Undefined!8896)))

(declare-fun b!895920 () Bool)

(assert (=> b!895920 (= e!500699 (MissingZero!8896 (index!37957 lt!404490)))))

(assert (= (and d!110665 c!94577) b!895919))

(assert (= (and d!110665 (not c!94577)) b!895918))

(assert (= (and b!895918 c!94576) b!895915))

(assert (= (and b!895918 (not c!94576)) b!895916))

(assert (= (and b!895916 c!94578) b!895920))

(assert (= (and b!895916 (not c!94578)) b!895917))

(declare-fun m!832701 () Bool)

(assert (=> b!895917 m!832701))

(declare-fun m!832703 () Bool)

(assert (=> d!110665 m!832703))

(declare-fun m!832705 () Bool)

(assert (=> d!110665 m!832705))

(assert (=> d!110665 m!832705))

(declare-fun m!832707 () Bool)

(assert (=> d!110665 m!832707))

(assert (=> d!110665 m!832697))

(declare-fun m!832709 () Bool)

(assert (=> b!895918 m!832709))

(assert (=> b!895846 d!110665))

(declare-fun d!110667 () Bool)

(assert (=> d!110667 (= (inRange!0 (index!37956 lt!404462) (mask!25988 thiss!1181)) (and (bvsge (index!37956 lt!404462) #b00000000000000000000000000000000) (bvslt (index!37956 lt!404462) (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!895842 d!110667))

(declare-fun d!110669 () Bool)

(assert (=> d!110669 (= (array_inv!19878 (_keys!10091 thiss!1181)) (bvsge (size!25705 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895844 d!110669))

(declare-fun d!110671 () Bool)

(assert (=> d!110671 (= (array_inv!19879 (_values!5360 thiss!1181)) (bvsge (size!25706 (_values!5360 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895844 d!110671))

(declare-fun mapIsEmpty!29017 () Bool)

(declare-fun mapRes!29017 () Bool)

(assert (=> mapIsEmpty!29017 mapRes!29017))

(declare-fun condMapEmpty!29017 () Bool)

(declare-fun mapDefault!29017 () ValueCell!8651)

(assert (=> mapNonEmpty!29008 (= condMapEmpty!29017 (= mapRest!29008 ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29017)))))

(declare-fun e!500707 () Bool)

(assert (=> mapNonEmpty!29008 (= tp!55836 (and e!500707 mapRes!29017))))

(declare-fun b!895927 () Bool)

(declare-fun e!500706 () Bool)

(assert (=> b!895927 (= e!500706 tp_is_empty!18265)))

(declare-fun b!895928 () Bool)

(assert (=> b!895928 (= e!500707 tp_is_empty!18265)))

(declare-fun mapNonEmpty!29017 () Bool)

(declare-fun tp!55852 () Bool)

(assert (=> mapNonEmpty!29017 (= mapRes!29017 (and tp!55852 e!500706))))

(declare-fun mapValue!29017 () ValueCell!8651)

(declare-fun mapKey!29017 () (_ BitVec 32))

(declare-fun mapRest!29017 () (Array (_ BitVec 32) ValueCell!8651))

(assert (=> mapNonEmpty!29017 (= mapRest!29008 (store mapRest!29017 mapKey!29017 mapValue!29017))))

(assert (= (and mapNonEmpty!29008 condMapEmpty!29017) mapIsEmpty!29017))

(assert (= (and mapNonEmpty!29008 (not condMapEmpty!29017)) mapNonEmpty!29017))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8651) mapValue!29017)) b!895927))

(assert (= (and mapNonEmpty!29008 ((_ is ValueCellFull!8651) mapDefault!29017)) b!895928))

(declare-fun m!832711 () Bool)

(assert (=> mapNonEmpty!29017 m!832711))

(check-sat (not b!895897) (not d!110665) (not d!110663) b_and!26203 (not b!895902) (not b!895899) (not mapNonEmpty!29017) (not b!895898) (not b!895917) (not d!110661) (not b_next!15937) tp_is_empty!18265)
(check-sat b_and!26203 (not b_next!15937))
(get-model)

(declare-fun b!895937 () Bool)

(declare-fun e!500712 () (_ BitVec 32))

(declare-fun call!39746 () (_ BitVec 32))

(assert (=> b!895937 (= e!500712 call!39746)))

(declare-fun b!895938 () Bool)

(declare-fun e!500713 () (_ BitVec 32))

(assert (=> b!895938 (= e!500713 e!500712)))

(declare-fun c!94583 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895938 (= c!94583 (validKeyInArray!0 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110673 () Bool)

(declare-fun lt!404495 () (_ BitVec 32))

(assert (=> d!110673 (and (bvsge lt!404495 #b00000000000000000000000000000000) (bvsle lt!404495 (bvsub (size!25705 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110673 (= lt!404495 e!500713)))

(declare-fun c!94584 () Bool)

(assert (=> d!110673 (= c!94584 (bvsge #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))))))

(assert (=> d!110673 (and (bvsle #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25705 (_keys!10091 thiss!1181)) (size!25705 (_keys!10091 thiss!1181))))))

(assert (=> d!110673 (= (arrayCountValidKeys!0 (_keys!10091 thiss!1181) #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))) lt!404495)))

(declare-fun b!895939 () Bool)

(assert (=> b!895939 (= e!500712 (bvadd #b00000000000000000000000000000001 call!39746))))

(declare-fun b!895940 () Bool)

(assert (=> b!895940 (= e!500713 #b00000000000000000000000000000000)))

(declare-fun bm!39743 () Bool)

(assert (=> bm!39743 (= call!39746 (arrayCountValidKeys!0 (_keys!10091 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25705 (_keys!10091 thiss!1181))))))

(assert (= (and d!110673 c!94584) b!895940))

(assert (= (and d!110673 (not c!94584)) b!895938))

(assert (= (and b!895938 c!94583) b!895939))

(assert (= (and b!895938 (not c!94583)) b!895937))

(assert (= (or b!895939 b!895937) bm!39743))

(declare-fun m!832713 () Bool)

(assert (=> b!895938 m!832713))

(assert (=> b!895938 m!832713))

(declare-fun m!832715 () Bool)

(assert (=> b!895938 m!832715))

(declare-fun m!832717 () Bool)

(assert (=> bm!39743 m!832717))

(assert (=> b!895897 d!110673))

(declare-fun b!895959 () Bool)

(declare-fun lt!404500 () SeekEntryResult!8896)

(assert (=> b!895959 (and (bvsge (index!37957 lt!404500) #b00000000000000000000000000000000) (bvslt (index!37957 lt!404500) (size!25705 (_keys!10091 thiss!1181))))))

(declare-fun e!500724 () Bool)

(assert (=> b!895959 (= e!500724 (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37957 lt!404500)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895960 () Bool)

(declare-fun e!500725 () SeekEntryResult!8896)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895960 (= e!500725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25988 thiss!1181)) #b00000000000000000000000000000000 (mask!25988 thiss!1181)) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!895961 () Bool)

(declare-fun e!500726 () Bool)

(assert (=> b!895961 (= e!500726 (bvsge (x!76283 lt!404500) #b01111111111111111111111111111110))))

(declare-fun b!895962 () Bool)

(declare-fun e!500727 () SeekEntryResult!8896)

(assert (=> b!895962 (= e!500727 (Intermediate!8896 true (toIndex!0 key!785 (mask!25988 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895963 () Bool)

(assert (=> b!895963 (and (bvsge (index!37957 lt!404500) #b00000000000000000000000000000000) (bvslt (index!37957 lt!404500) (size!25705 (_keys!10091 thiss!1181))))))

(declare-fun res!605925 () Bool)

(assert (=> b!895963 (= res!605925 (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37957 lt!404500)) key!785))))

(assert (=> b!895963 (=> res!605925 e!500724)))

(declare-fun e!500728 () Bool)

(assert (=> b!895963 (= e!500728 e!500724)))

(declare-fun b!895964 () Bool)

(assert (=> b!895964 (= e!500726 e!500728)))

(declare-fun res!605923 () Bool)

(assert (=> b!895964 (= res!605923 (and ((_ is Intermediate!8896) lt!404500) (not (undefined!9708 lt!404500)) (bvslt (x!76283 lt!404500) #b01111111111111111111111111111110) (bvsge (x!76283 lt!404500) #b00000000000000000000000000000000) (bvsge (x!76283 lt!404500) #b00000000000000000000000000000000)))))

(assert (=> b!895964 (=> (not res!605923) (not e!500728))))

(declare-fun d!110675 () Bool)

(assert (=> d!110675 e!500726))

(declare-fun c!94591 () Bool)

(assert (=> d!110675 (= c!94591 (and ((_ is Intermediate!8896) lt!404500) (undefined!9708 lt!404500)))))

(assert (=> d!110675 (= lt!404500 e!500727)))

(declare-fun c!94593 () Bool)

(assert (=> d!110675 (= c!94593 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!404501 () (_ BitVec 64))

(assert (=> d!110675 (= lt!404501 (select (arr!25253 (_keys!10091 thiss!1181)) (toIndex!0 key!785 (mask!25988 thiss!1181))))))

(assert (=> d!110675 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110675 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25988 thiss!1181)) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)) lt!404500)))

(declare-fun b!895965 () Bool)

(assert (=> b!895965 (= e!500725 (Intermediate!8896 false (toIndex!0 key!785 (mask!25988 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895966 () Bool)

(assert (=> b!895966 (= e!500727 e!500725)))

(declare-fun c!94592 () Bool)

(assert (=> b!895966 (= c!94592 (or (= lt!404501 key!785) (= (bvadd lt!404501 lt!404501) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895967 () Bool)

(assert (=> b!895967 (and (bvsge (index!37957 lt!404500) #b00000000000000000000000000000000) (bvslt (index!37957 lt!404500) (size!25705 (_keys!10091 thiss!1181))))))

(declare-fun res!605924 () Bool)

(assert (=> b!895967 (= res!605924 (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37957 lt!404500)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895967 (=> res!605924 e!500724)))

(assert (= (and d!110675 c!94593) b!895962))

(assert (= (and d!110675 (not c!94593)) b!895966))

(assert (= (and b!895966 c!94592) b!895965))

(assert (= (and b!895966 (not c!94592)) b!895960))

(assert (= (and d!110675 c!94591) b!895961))

(assert (= (and d!110675 (not c!94591)) b!895964))

(assert (= (and b!895964 res!605923) b!895963))

(assert (= (and b!895963 (not res!605925)) b!895967))

(assert (= (and b!895967 (not res!605924)) b!895959))

(declare-fun m!832719 () Bool)

(assert (=> b!895959 m!832719))

(assert (=> d!110675 m!832705))

(declare-fun m!832721 () Bool)

(assert (=> d!110675 m!832721))

(assert (=> d!110675 m!832697))

(assert (=> b!895960 m!832705))

(declare-fun m!832723 () Bool)

(assert (=> b!895960 m!832723))

(assert (=> b!895960 m!832723))

(declare-fun m!832725 () Bool)

(assert (=> b!895960 m!832725))

(assert (=> b!895967 m!832719))

(assert (=> b!895963 m!832719))

(assert (=> d!110665 d!110675))

(declare-fun d!110677 () Bool)

(declare-fun lt!404507 () (_ BitVec 32))

(declare-fun lt!404506 () (_ BitVec 32))

(assert (=> d!110677 (= lt!404507 (bvmul (bvxor lt!404506 (bvlshr lt!404506 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110677 (= lt!404506 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110677 (and (bvsge (mask!25988 thiss!1181) #b00000000000000000000000000000000) (let ((res!605926 (let ((h!18963 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76300 (bvmul (bvxor h!18963 (bvlshr h!18963 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76300 (bvlshr x!76300 #b00000000000000000000000000001101)) (mask!25988 thiss!1181)))))) (and (bvslt res!605926 (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605926 #b00000000000000000000000000000000))))))

(assert (=> d!110677 (= (toIndex!0 key!785 (mask!25988 thiss!1181)) (bvand (bvxor lt!404507 (bvlshr lt!404507 #b00000000000000000000000000001101)) (mask!25988 thiss!1181)))))

(assert (=> d!110665 d!110677))

(declare-fun d!110679 () Bool)

(assert (=> d!110679 (= (validMask!0 (mask!25988 thiss!1181)) (and (or (= (mask!25988 thiss!1181) #b00000000000000000000000000000111) (= (mask!25988 thiss!1181) #b00000000000000000000000000001111) (= (mask!25988 thiss!1181) #b00000000000000000000000000011111) (= (mask!25988 thiss!1181) #b00000000000000000000000000111111) (= (mask!25988 thiss!1181) #b00000000000000000000000001111111) (= (mask!25988 thiss!1181) #b00000000000000000000000011111111) (= (mask!25988 thiss!1181) #b00000000000000000000000111111111) (= (mask!25988 thiss!1181) #b00000000000000000000001111111111) (= (mask!25988 thiss!1181) #b00000000000000000000011111111111) (= (mask!25988 thiss!1181) #b00000000000000000000111111111111) (= (mask!25988 thiss!1181) #b00000000000000000001111111111111) (= (mask!25988 thiss!1181) #b00000000000000000011111111111111) (= (mask!25988 thiss!1181) #b00000000000000000111111111111111) (= (mask!25988 thiss!1181) #b00000000000000001111111111111111) (= (mask!25988 thiss!1181) #b00000000000000011111111111111111) (= (mask!25988 thiss!1181) #b00000000000000111111111111111111) (= (mask!25988 thiss!1181) #b00000000000001111111111111111111) (= (mask!25988 thiss!1181) #b00000000000011111111111111111111) (= (mask!25988 thiss!1181) #b00000000000111111111111111111111) (= (mask!25988 thiss!1181) #b00000000001111111111111111111111) (= (mask!25988 thiss!1181) #b00000000011111111111111111111111) (= (mask!25988 thiss!1181) #b00000000111111111111111111111111) (= (mask!25988 thiss!1181) #b00000001111111111111111111111111) (= (mask!25988 thiss!1181) #b00000011111111111111111111111111) (= (mask!25988 thiss!1181) #b00000111111111111111111111111111) (= (mask!25988 thiss!1181) #b00001111111111111111111111111111) (= (mask!25988 thiss!1181) #b00011111111111111111111111111111) (= (mask!25988 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25988 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110665 d!110679))

(assert (=> d!110663 d!110665))

(declare-fun d!110681 () Bool)

(declare-fun e!500731 () Bool)

(assert (=> d!110681 e!500731))

(declare-fun res!605929 () Bool)

(assert (=> d!110681 (=> res!605929 e!500731)))

(declare-fun lt!404510 () SeekEntryResult!8896)

(assert (=> d!110681 (= res!605929 (not ((_ is Found!8896) lt!404510)))))

(assert (=> d!110681 (= lt!404510 (seekEntry!0 key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(assert (=> d!110681 true))

(declare-fun _$36!351 () Unit!30420)

(assert (=> d!110681 (= (choose!1485 (_keys!10091 thiss!1181) (_values!5360 thiss!1181) (mask!25988 thiss!1181) (extraKeys!5069 thiss!1181) (zeroValue!5173 thiss!1181) (minValue!5173 thiss!1181) key!785) _$36!351)))

(declare-fun b!895970 () Bool)

(assert (=> b!895970 (= e!500731 (inRange!0 (index!37956 lt!404510) (mask!25988 thiss!1181)))))

(assert (= (and d!110681 (not res!605929)) b!895970))

(assert (=> d!110681 m!832655))

(declare-fun m!832727 () Bool)

(assert (=> b!895970 m!832727))

(assert (=> d!110663 d!110681))

(assert (=> d!110663 d!110679))

(declare-fun bm!39746 () Bool)

(declare-fun call!39749 () Bool)

(assert (=> bm!39746 (= call!39749 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!895979 () Bool)

(declare-fun e!500739 () Bool)

(declare-fun e!500738 () Bool)

(assert (=> b!895979 (= e!500739 e!500738)))

(declare-fun c!94596 () Bool)

(assert (=> b!895979 (= c!94596 (validKeyInArray!0 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895980 () Bool)

(declare-fun e!500740 () Bool)

(assert (=> b!895980 (= e!500740 call!39749)))

(declare-fun d!110683 () Bool)

(declare-fun res!605935 () Bool)

(assert (=> d!110683 (=> res!605935 e!500739)))

(assert (=> d!110683 (= res!605935 (bvsge #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))))))

(assert (=> d!110683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)) e!500739)))

(declare-fun b!895981 () Bool)

(assert (=> b!895981 (= e!500738 call!39749)))

(declare-fun b!895982 () Bool)

(assert (=> b!895982 (= e!500738 e!500740)))

(declare-fun lt!404519 () (_ BitVec 64))

(assert (=> b!895982 (= lt!404519 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!404518 () Unit!30420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52525 (_ BitVec 64) (_ BitVec 32)) Unit!30420)

(assert (=> b!895982 (= lt!404518 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10091 thiss!1181) lt!404519 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895982 (arrayContainsKey!0 (_keys!10091 thiss!1181) lt!404519 #b00000000000000000000000000000000)))

(declare-fun lt!404517 () Unit!30420)

(assert (=> b!895982 (= lt!404517 lt!404518)))

(declare-fun res!605934 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52525 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!895982 (= res!605934 (= (seekEntryOrOpen!0 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000) (_keys!10091 thiss!1181) (mask!25988 thiss!1181)) (Found!8896 #b00000000000000000000000000000000)))))

(assert (=> b!895982 (=> (not res!605934) (not e!500740))))

(assert (= (and d!110683 (not res!605935)) b!895979))

(assert (= (and b!895979 c!94596) b!895982))

(assert (= (and b!895979 (not c!94596)) b!895981))

(assert (= (and b!895982 res!605934) b!895980))

(assert (= (or b!895980 b!895981) bm!39746))

(declare-fun m!832729 () Bool)

(assert (=> bm!39746 m!832729))

(assert (=> b!895979 m!832713))

(assert (=> b!895979 m!832713))

(assert (=> b!895979 m!832715))

(assert (=> b!895982 m!832713))

(declare-fun m!832731 () Bool)

(assert (=> b!895982 m!832731))

(declare-fun m!832733 () Bool)

(assert (=> b!895982 m!832733))

(assert (=> b!895982 m!832713))

(declare-fun m!832735 () Bool)

(assert (=> b!895982 m!832735))

(assert (=> b!895898 d!110683))

(declare-fun b!895993 () Bool)

(declare-fun e!500751 () Bool)

(declare-fun contains!4370 (List!17829 (_ BitVec 64)) Bool)

(assert (=> b!895993 (= e!500751 (contains!4370 Nil!17826 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895995 () Bool)

(declare-fun e!500749 () Bool)

(declare-fun e!500750 () Bool)

(assert (=> b!895995 (= e!500749 e!500750)))

(declare-fun res!605943 () Bool)

(assert (=> b!895995 (=> (not res!605943) (not e!500750))))

(assert (=> b!895995 (= res!605943 (not e!500751))))

(declare-fun res!605942 () Bool)

(assert (=> b!895995 (=> (not res!605942) (not e!500751))))

(assert (=> b!895995 (= res!605942 (validKeyInArray!0 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895996 () Bool)

(declare-fun e!500752 () Bool)

(declare-fun call!39752 () Bool)

(assert (=> b!895996 (= e!500752 call!39752)))

(declare-fun bm!39749 () Bool)

(declare-fun c!94599 () Bool)

(assert (=> bm!39749 (= call!39752 (arrayNoDuplicates!0 (_keys!10091 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94599 (Cons!17825 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000) Nil!17826) Nil!17826)))))

(declare-fun b!895997 () Bool)

(assert (=> b!895997 (= e!500752 call!39752)))

(declare-fun d!110685 () Bool)

(declare-fun res!605944 () Bool)

(assert (=> d!110685 (=> res!605944 e!500749)))

(assert (=> d!110685 (= res!605944 (bvsge #b00000000000000000000000000000000 (size!25705 (_keys!10091 thiss!1181))))))

(assert (=> d!110685 (= (arrayNoDuplicates!0 (_keys!10091 thiss!1181) #b00000000000000000000000000000000 Nil!17826) e!500749)))

(declare-fun b!895994 () Bool)

(assert (=> b!895994 (= e!500750 e!500752)))

(assert (=> b!895994 (= c!94599 (validKeyInArray!0 (select (arr!25253 (_keys!10091 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110685 (not res!605944)) b!895995))

(assert (= (and b!895995 res!605942) b!895993))

(assert (= (and b!895995 res!605943) b!895994))

(assert (= (and b!895994 c!94599) b!895996))

(assert (= (and b!895994 (not c!94599)) b!895997))

(assert (= (or b!895996 b!895997) bm!39749))

(assert (=> b!895993 m!832713))

(assert (=> b!895993 m!832713))

(declare-fun m!832737 () Bool)

(assert (=> b!895993 m!832737))

(assert (=> b!895995 m!832713))

(assert (=> b!895995 m!832713))

(assert (=> b!895995 m!832715))

(assert (=> bm!39749 m!832713))

(declare-fun m!832739 () Bool)

(assert (=> bm!39749 m!832739))

(assert (=> b!895994 m!832713))

(assert (=> b!895994 m!832713))

(assert (=> b!895994 m!832715))

(assert (=> b!895899 d!110685))

(declare-fun d!110687 () Bool)

(assert (=> d!110687 (= (inRange!0 (index!37956 lt!404480) (mask!25988 thiss!1181)) (and (bvsge (index!37956 lt!404480) #b00000000000000000000000000000000) (bvslt (index!37956 lt!404480) (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!895902 d!110687))

(declare-fun b!896007 () Bool)

(declare-fun res!605956 () Bool)

(declare-fun e!500755 () Bool)

(assert (=> b!896007 (=> (not res!605956) (not e!500755))))

(declare-fun size!25711 (LongMapFixedSize!4318) (_ BitVec 32))

(assert (=> b!896007 (= res!605956 (bvsge (size!25711 thiss!1181) (_size!2214 thiss!1181)))))

(declare-fun b!896008 () Bool)

(declare-fun res!605954 () Bool)

(assert (=> b!896008 (=> (not res!605954) (not e!500755))))

(assert (=> b!896008 (= res!605954 (= (size!25711 thiss!1181) (bvadd (_size!2214 thiss!1181) (bvsdiv (bvadd (extraKeys!5069 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110689 () Bool)

(declare-fun res!605955 () Bool)

(assert (=> d!110689 (=> (not res!605955) (not e!500755))))

(assert (=> d!110689 (= res!605955 (validMask!0 (mask!25988 thiss!1181)))))

(assert (=> d!110689 (= (simpleValid!311 thiss!1181) e!500755)))

(declare-fun b!896006 () Bool)

(declare-fun res!605953 () Bool)

(assert (=> b!896006 (=> (not res!605953) (not e!500755))))

(assert (=> b!896006 (= res!605953 (and (= (size!25706 (_values!5360 thiss!1181)) (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001)) (= (size!25705 (_keys!10091 thiss!1181)) (size!25706 (_values!5360 thiss!1181))) (bvsge (_size!2214 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2214 thiss!1181) (bvadd (mask!25988 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!896009 () Bool)

(assert (=> b!896009 (= e!500755 (and (bvsge (extraKeys!5069 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5069 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2214 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!110689 res!605955) b!896006))

(assert (= (and b!896006 res!605953) b!896007))

(assert (= (and b!896007 res!605956) b!896008))

(assert (= (and b!896008 res!605954) b!896009))

(declare-fun m!832741 () Bool)

(assert (=> b!896007 m!832741))

(assert (=> b!896008 m!832741))

(assert (=> d!110689 m!832697))

(assert (=> d!110661 d!110689))

(declare-fun e!500763 () SeekEntryResult!8896)

(declare-fun b!896022 () Bool)

(assert (=> b!896022 (= e!500763 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76283 lt!404490) #b00000000000000000000000000000001) (nextIndex!0 (index!37957 lt!404490) (x!76283 lt!404490) (mask!25988 thiss!1181)) (index!37957 lt!404490) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)))))

(declare-fun b!896023 () Bool)

(declare-fun e!500762 () SeekEntryResult!8896)

(assert (=> b!896023 (= e!500762 Undefined!8896)))

(declare-fun b!896024 () Bool)

(assert (=> b!896024 (= e!500763 (MissingVacant!8896 (index!37957 lt!404490)))))

(declare-fun b!896025 () Bool)

(declare-fun e!500764 () SeekEntryResult!8896)

(assert (=> b!896025 (= e!500764 (Found!8896 (index!37957 lt!404490)))))

(declare-fun b!896026 () Bool)

(declare-fun c!94608 () Bool)

(declare-fun lt!404525 () (_ BitVec 64))

(assert (=> b!896026 (= c!94608 (= lt!404525 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896026 (= e!500764 e!500763)))

(declare-fun b!896027 () Bool)

(assert (=> b!896027 (= e!500762 e!500764)))

(declare-fun c!94607 () Bool)

(assert (=> b!896027 (= c!94607 (= lt!404525 key!785))))

(declare-fun d!110691 () Bool)

(declare-fun lt!404524 () SeekEntryResult!8896)

(assert (=> d!110691 (and (or ((_ is Undefined!8896) lt!404524) (not ((_ is Found!8896) lt!404524)) (and (bvsge (index!37956 lt!404524) #b00000000000000000000000000000000) (bvslt (index!37956 lt!404524) (size!25705 (_keys!10091 thiss!1181))))) (or ((_ is Undefined!8896) lt!404524) ((_ is Found!8896) lt!404524) (not ((_ is MissingVacant!8896) lt!404524)) (not (= (index!37958 lt!404524) (index!37957 lt!404490))) (and (bvsge (index!37958 lt!404524) #b00000000000000000000000000000000) (bvslt (index!37958 lt!404524) (size!25705 (_keys!10091 thiss!1181))))) (or ((_ is Undefined!8896) lt!404524) (ite ((_ is Found!8896) lt!404524) (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37956 lt!404524)) key!785) (and ((_ is MissingVacant!8896) lt!404524) (= (index!37958 lt!404524) (index!37957 lt!404490)) (= (select (arr!25253 (_keys!10091 thiss!1181)) (index!37958 lt!404524)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110691 (= lt!404524 e!500762)))

(declare-fun c!94606 () Bool)

(assert (=> d!110691 (= c!94606 (bvsge (x!76283 lt!404490) #b01111111111111111111111111111110))))

(assert (=> d!110691 (= lt!404525 (select (arr!25253 (_keys!10091 thiss!1181)) (index!37957 lt!404490)))))

(assert (=> d!110691 (validMask!0 (mask!25988 thiss!1181))))

(assert (=> d!110691 (= (seekKeyOrZeroReturnVacant!0 (x!76283 lt!404490) (index!37957 lt!404490) (index!37957 lt!404490) key!785 (_keys!10091 thiss!1181) (mask!25988 thiss!1181)) lt!404524)))

(assert (= (and d!110691 c!94606) b!896023))

(assert (= (and d!110691 (not c!94606)) b!896027))

(assert (= (and b!896027 c!94607) b!896025))

(assert (= (and b!896027 (not c!94607)) b!896026))

(assert (= (and b!896026 c!94608) b!896024))

(assert (= (and b!896026 (not c!94608)) b!896022))

(declare-fun m!832743 () Bool)

(assert (=> b!896022 m!832743))

(assert (=> b!896022 m!832743))

(declare-fun m!832745 () Bool)

(assert (=> b!896022 m!832745))

(declare-fun m!832747 () Bool)

(assert (=> d!110691 m!832747))

(declare-fun m!832749 () Bool)

(assert (=> d!110691 m!832749))

(assert (=> d!110691 m!832709))

(assert (=> d!110691 m!832697))

(assert (=> b!895917 d!110691))

(declare-fun mapIsEmpty!29018 () Bool)

(declare-fun mapRes!29018 () Bool)

(assert (=> mapIsEmpty!29018 mapRes!29018))

(declare-fun condMapEmpty!29018 () Bool)

(declare-fun mapDefault!29018 () ValueCell!8651)

(assert (=> mapNonEmpty!29017 (= condMapEmpty!29018 (= mapRest!29017 ((as const (Array (_ BitVec 32) ValueCell!8651)) mapDefault!29018)))))

(declare-fun e!500766 () Bool)

(assert (=> mapNonEmpty!29017 (= tp!55852 (and e!500766 mapRes!29018))))

(declare-fun b!896028 () Bool)

(declare-fun e!500765 () Bool)

(assert (=> b!896028 (= e!500765 tp_is_empty!18265)))

(declare-fun b!896029 () Bool)

(assert (=> b!896029 (= e!500766 tp_is_empty!18265)))

(declare-fun mapNonEmpty!29018 () Bool)

(declare-fun tp!55853 () Bool)

(assert (=> mapNonEmpty!29018 (= mapRes!29018 (and tp!55853 e!500765))))

(declare-fun mapRest!29018 () (Array (_ BitVec 32) ValueCell!8651))

(declare-fun mapValue!29018 () ValueCell!8651)

(declare-fun mapKey!29018 () (_ BitVec 32))

(assert (=> mapNonEmpty!29018 (= mapRest!29017 (store mapRest!29018 mapKey!29018 mapValue!29018))))

(assert (= (and mapNonEmpty!29017 condMapEmpty!29018) mapIsEmpty!29018))

(assert (= (and mapNonEmpty!29017 (not condMapEmpty!29018)) mapNonEmpty!29018))

(assert (= (and mapNonEmpty!29018 ((_ is ValueCellFull!8651) mapValue!29018)) b!896028))

(assert (= (and mapNonEmpty!29017 ((_ is ValueCellFull!8651) mapDefault!29018)) b!896029))

(declare-fun m!832751 () Bool)

(assert (=> mapNonEmpty!29018 m!832751))

(check-sat (not b!896022) (not b!895994) (not d!110681) (not b!896008) (not mapNonEmpty!29018) (not b!895960) (not b!895938) (not b!895993) (not bm!39746) (not b!895970) (not b!895995) (not bm!39749) (not bm!39743) (not b!896007) (not b!895982) (not b!895979) (not d!110675) (not b_next!15937) tp_is_empty!18265 b_and!26203 (not d!110689) (not d!110691))
(check-sat b_and!26203 (not b_next!15937))
