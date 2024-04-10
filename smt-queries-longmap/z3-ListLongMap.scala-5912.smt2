; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76580 () Bool)

(assert start!76580)

(declare-fun b!897131 () Bool)

(declare-fun b_free!15975 () Bool)

(declare-fun b_next!15975 () Bool)

(assert (=> b!897131 (= b_free!15975 (not b_next!15975))))

(declare-fun tp!55970 () Bool)

(declare-fun b_and!26267 () Bool)

(assert (=> b!897131 (= tp!55970 b_and!26267)))

(declare-fun b!897127 () Bool)

(declare-fun e!501605 () Bool)

(declare-fun tp_is_empty!18303 () Bool)

(assert (=> b!897127 (= e!501605 tp_is_empty!18303)))

(declare-fun b!897128 () Bool)

(declare-fun e!501608 () Bool)

(assert (=> b!897128 (= e!501608 tp_is_empty!18303)))

(declare-fun mapNonEmpty!29086 () Bool)

(declare-fun mapRes!29086 () Bool)

(declare-fun tp!55971 () Bool)

(assert (=> mapNonEmpty!29086 (= mapRes!29086 (and tp!55971 e!501608))))

(declare-datatypes ((V!29369 0))(
  ( (V!29370 (val!9202 Int)) )
))
(declare-datatypes ((ValueCell!8670 0))(
  ( (ValueCellFull!8670 (v!11692 V!29369)) (EmptyCell!8670) )
))
(declare-fun mapValue!29086 () ValueCell!8670)

(declare-datatypes ((array!52630 0))(
  ( (array!52631 (arr!25299 (Array (_ BitVec 32) (_ BitVec 64))) (size!25752 (_ BitVec 32))) )
))
(declare-datatypes ((array!52632 0))(
  ( (array!52633 (arr!25300 (Array (_ BitVec 32) ValueCell!8670)) (size!25753 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4356 0))(
  ( (LongMapFixedSize!4357 (defaultEntry!5390 Int) (mask!26064 (_ BitVec 32)) (extraKeys!5097 (_ BitVec 32)) (zeroValue!5201 V!29369) (minValue!5201 V!29369) (_size!2233 (_ BitVec 32)) (_keys!10139 array!52630) (_values!5388 array!52632) (_vacant!2233 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4356)

(declare-fun mapKey!29086 () (_ BitVec 32))

(declare-fun mapRest!29086 () (Array (_ BitVec 32) ValueCell!8670))

(assert (=> mapNonEmpty!29086 (= (arr!25300 (_values!5388 thiss!1181)) (store mapRest!29086 mapKey!29086 mapValue!29086))))

(declare-fun b!897129 () Bool)

(declare-fun res!606477 () Bool)

(declare-fun e!501604 () Bool)

(assert (=> b!897129 (=> (not res!606477) (not e!501604))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!897129 (= res!606477 (not (= key!785 (bvneg key!785))))))

(declare-fun b!897130 () Bool)

(declare-fun e!501606 () Bool)

(declare-datatypes ((SeekEntryResult!8906 0))(
  ( (MissingZero!8906 (index!37995 (_ BitVec 32))) (Found!8906 (index!37996 (_ BitVec 32))) (Intermediate!8906 (undefined!9718 Bool) (index!37997 (_ BitVec 32)) (x!76421 (_ BitVec 32))) (Undefined!8906) (MissingVacant!8906 (index!37998 (_ BitVec 32))) )
))
(declare-fun lt!405072 () SeekEntryResult!8906)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!897130 (= e!501606 (inRange!0 (index!37996 lt!405072) (mask!26064 thiss!1181)))))

(declare-fun res!606475 () Bool)

(assert (=> start!76580 (=> (not res!606475) (not e!501604))))

(declare-fun valid!1678 (LongMapFixedSize!4356) Bool)

(assert (=> start!76580 (= res!606475 (valid!1678 thiss!1181))))

(assert (=> start!76580 e!501604))

(declare-fun e!501609 () Bool)

(assert (=> start!76580 e!501609))

(assert (=> start!76580 true))

(declare-fun e!501612 () Bool)

(declare-fun array_inv!19856 (array!52630) Bool)

(declare-fun array_inv!19857 (array!52632) Bool)

(assert (=> b!897131 (= e!501609 (and tp!55970 tp_is_empty!18303 (array_inv!19856 (_keys!10139 thiss!1181)) (array_inv!19857 (_values!5388 thiss!1181)) e!501612))))

(declare-fun b!897132 () Bool)

(assert (=> b!897132 (= e!501612 (and e!501605 mapRes!29086))))

(declare-fun condMapEmpty!29086 () Bool)

(declare-fun mapDefault!29086 () ValueCell!8670)

(assert (=> b!897132 (= condMapEmpty!29086 (= (arr!25300 (_values!5388 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8670)) mapDefault!29086)))))

(declare-fun b!897133 () Bool)

(declare-fun e!501611 () Bool)

(declare-fun e!501610 () Bool)

(assert (=> b!897133 (= e!501611 e!501610)))

(declare-fun res!606473 () Bool)

(assert (=> b!897133 (=> res!606473 e!501610)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897133 (= res!606473 (not (validMask!0 (mask!26064 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897133 (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30502 0))(
  ( (Unit!30503) )
))
(declare-fun lt!405073 () Unit!30502)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52630 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> b!897133 (= lt!405073 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10139 thiss!1181) key!785 (index!37996 lt!405072)))))

(declare-fun mapIsEmpty!29086 () Bool)

(assert (=> mapIsEmpty!29086 mapRes!29086))

(declare-fun b!897134 () Bool)

(assert (=> b!897134 (= e!501604 (not e!501611))))

(declare-fun res!606474 () Bool)

(assert (=> b!897134 (=> res!606474 e!501611)))

(get-info :version)

(assert (=> b!897134 (= res!606474 (not ((_ is Found!8906) lt!405072)))))

(assert (=> b!897134 e!501606))

(declare-fun res!606476 () Bool)

(assert (=> b!897134 (=> res!606476 e!501606)))

(assert (=> b!897134 (= res!606476 (not ((_ is Found!8906) lt!405072)))))

(declare-fun lt!405071 () Unit!30502)

(declare-fun lemmaSeekEntryGivesInRangeIndex!77 (array!52630 array!52632 (_ BitVec 32) (_ BitVec 32) V!29369 V!29369 (_ BitVec 64)) Unit!30502)

(assert (=> b!897134 (= lt!405071 (lemmaSeekEntryGivesInRangeIndex!77 (_keys!10139 thiss!1181) (_values!5388 thiss!1181) (mask!26064 thiss!1181) (extraKeys!5097 thiss!1181) (zeroValue!5201 thiss!1181) (minValue!5201 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52630 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!897134 (= lt!405072 (seekEntry!0 key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun b!897135 () Bool)

(assert (=> b!897135 (= e!501610 (or (not (= (size!25753 (_values!5388 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26064 thiss!1181)))) (not (= (size!25752 (_keys!10139 thiss!1181)) (size!25753 (_values!5388 thiss!1181)))) (bvslt (mask!26064 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!5097 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and start!76580 res!606475) b!897129))

(assert (= (and b!897129 res!606477) b!897134))

(assert (= (and b!897134 (not res!606476)) b!897130))

(assert (= (and b!897134 (not res!606474)) b!897133))

(assert (= (and b!897133 (not res!606473)) b!897135))

(assert (= (and b!897132 condMapEmpty!29086) mapIsEmpty!29086))

(assert (= (and b!897132 (not condMapEmpty!29086)) mapNonEmpty!29086))

(assert (= (and mapNonEmpty!29086 ((_ is ValueCellFull!8670) mapValue!29086)) b!897128))

(assert (= (and b!897132 ((_ is ValueCellFull!8670) mapDefault!29086)) b!897127))

(assert (= b!897131 b!897132))

(assert (= start!76580 b!897131))

(declare-fun m!834053 () Bool)

(assert (=> b!897134 m!834053))

(declare-fun m!834055 () Bool)

(assert (=> b!897134 m!834055))

(declare-fun m!834057 () Bool)

(assert (=> b!897131 m!834057))

(declare-fun m!834059 () Bool)

(assert (=> b!897131 m!834059))

(declare-fun m!834061 () Bool)

(assert (=> b!897130 m!834061))

(declare-fun m!834063 () Bool)

(assert (=> start!76580 m!834063))

(declare-fun m!834065 () Bool)

(assert (=> mapNonEmpty!29086 m!834065))

(declare-fun m!834067 () Bool)

(assert (=> b!897133 m!834067))

(declare-fun m!834069 () Bool)

(assert (=> b!897133 m!834069))

(declare-fun m!834071 () Bool)

(assert (=> b!897133 m!834071))

(check-sat (not b!897130) (not b!897134) (not mapNonEmpty!29086) (not b!897131) (not b_next!15975) b_and!26267 tp_is_empty!18303 (not start!76580) (not b!897133))
(check-sat b_and!26267 (not b_next!15975))
(get-model)

(declare-fun d!111033 () Bool)

(assert (=> d!111033 (= (inRange!0 (index!37996 lt!405072) (mask!26064 thiss!1181)) (and (bvsge (index!37996 lt!405072) #b00000000000000000000000000000000) (bvslt (index!37996 lt!405072) (bvadd (mask!26064 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897130 d!111033))

(declare-fun d!111035 () Bool)

(assert (=> d!111035 (= (array_inv!19856 (_keys!10139 thiss!1181)) (bvsge (size!25752 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897131 d!111035))

(declare-fun d!111037 () Bool)

(assert (=> d!111037 (= (array_inv!19857 (_values!5388 thiss!1181)) (bvsge (size!25753 (_values!5388 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!897131 d!111037))

(declare-fun d!111039 () Bool)

(assert (=> d!111039 (= (validMask!0 (mask!26064 thiss!1181)) (and (or (= (mask!26064 thiss!1181) #b00000000000000000000000000000111) (= (mask!26064 thiss!1181) #b00000000000000000000000000001111) (= (mask!26064 thiss!1181) #b00000000000000000000000000011111) (= (mask!26064 thiss!1181) #b00000000000000000000000000111111) (= (mask!26064 thiss!1181) #b00000000000000000000000001111111) (= (mask!26064 thiss!1181) #b00000000000000000000000011111111) (= (mask!26064 thiss!1181) #b00000000000000000000000111111111) (= (mask!26064 thiss!1181) #b00000000000000000000001111111111) (= (mask!26064 thiss!1181) #b00000000000000000000011111111111) (= (mask!26064 thiss!1181) #b00000000000000000000111111111111) (= (mask!26064 thiss!1181) #b00000000000000000001111111111111) (= (mask!26064 thiss!1181) #b00000000000000000011111111111111) (= (mask!26064 thiss!1181) #b00000000000000000111111111111111) (= (mask!26064 thiss!1181) #b00000000000000001111111111111111) (= (mask!26064 thiss!1181) #b00000000000000011111111111111111) (= (mask!26064 thiss!1181) #b00000000000000111111111111111111) (= (mask!26064 thiss!1181) #b00000000000001111111111111111111) (= (mask!26064 thiss!1181) #b00000000000011111111111111111111) (= (mask!26064 thiss!1181) #b00000000000111111111111111111111) (= (mask!26064 thiss!1181) #b00000000001111111111111111111111) (= (mask!26064 thiss!1181) #b00000000011111111111111111111111) (= (mask!26064 thiss!1181) #b00000000111111111111111111111111) (= (mask!26064 thiss!1181) #b00000001111111111111111111111111) (= (mask!26064 thiss!1181) #b00000011111111111111111111111111) (= (mask!26064 thiss!1181) #b00000111111111111111111111111111) (= (mask!26064 thiss!1181) #b00001111111111111111111111111111) (= (mask!26064 thiss!1181) #b00011111111111111111111111111111) (= (mask!26064 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26064 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!897133 d!111039))

(declare-fun d!111041 () Bool)

(declare-fun res!606497 () Bool)

(declare-fun e!501644 () Bool)

(assert (=> d!111041 (=> res!606497 e!501644)))

(assert (=> d!111041 (= res!606497 (= (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111041 (= (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 #b00000000000000000000000000000000) e!501644)))

(declare-fun b!897167 () Bool)

(declare-fun e!501645 () Bool)

(assert (=> b!897167 (= e!501644 e!501645)))

(declare-fun res!606498 () Bool)

(assert (=> b!897167 (=> (not res!606498) (not e!501645))))

(assert (=> b!897167 (= res!606498 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25752 (_keys!10139 thiss!1181))))))

(declare-fun b!897168 () Bool)

(assert (=> b!897168 (= e!501645 (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111041 (not res!606497)) b!897167))

(assert (= (and b!897167 res!606498) b!897168))

(declare-fun m!834093 () Bool)

(assert (=> d!111041 m!834093))

(declare-fun m!834095 () Bool)

(assert (=> b!897168 m!834095))

(assert (=> b!897133 d!111041))

(declare-fun d!111043 () Bool)

(assert (=> d!111043 (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405085 () Unit!30502)

(declare-fun choose!13 (array!52630 (_ BitVec 64) (_ BitVec 32)) Unit!30502)

(assert (=> d!111043 (= lt!405085 (choose!13 (_keys!10139 thiss!1181) key!785 (index!37996 lt!405072)))))

(assert (=> d!111043 (bvsge (index!37996 lt!405072) #b00000000000000000000000000000000)))

(assert (=> d!111043 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10139 thiss!1181) key!785 (index!37996 lt!405072)) lt!405085)))

(declare-fun bs!25184 () Bool)

(assert (= bs!25184 d!111043))

(assert (=> bs!25184 m!834069))

(declare-fun m!834097 () Bool)

(assert (=> bs!25184 m!834097))

(assert (=> b!897133 d!111043))

(declare-fun d!111045 () Bool)

(declare-fun res!606505 () Bool)

(declare-fun e!501648 () Bool)

(assert (=> d!111045 (=> (not res!606505) (not e!501648))))

(declare-fun simpleValid!317 (LongMapFixedSize!4356) Bool)

(assert (=> d!111045 (= res!606505 (simpleValid!317 thiss!1181))))

(assert (=> d!111045 (= (valid!1678 thiss!1181) e!501648)))

(declare-fun b!897175 () Bool)

(declare-fun res!606506 () Bool)

(assert (=> b!897175 (=> (not res!606506) (not e!501648))))

(declare-fun arrayCountValidKeys!0 (array!52630 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897175 (= res!606506 (= (arrayCountValidKeys!0 (_keys!10139 thiss!1181) #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))) (_size!2233 thiss!1181)))))

(declare-fun b!897176 () Bool)

(declare-fun res!606507 () Bool)

(assert (=> b!897176 (=> (not res!606507) (not e!501648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52630 (_ BitVec 32)) Bool)

(assert (=> b!897176 (= res!606507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun b!897177 () Bool)

(declare-datatypes ((List!17827 0))(
  ( (Nil!17824) (Cons!17823 (h!18963 (_ BitVec 64)) (t!25166 List!17827)) )
))
(declare-fun arrayNoDuplicates!0 (array!52630 (_ BitVec 32) List!17827) Bool)

(assert (=> b!897177 (= e!501648 (arrayNoDuplicates!0 (_keys!10139 thiss!1181) #b00000000000000000000000000000000 Nil!17824))))

(assert (= (and d!111045 res!606505) b!897175))

(assert (= (and b!897175 res!606506) b!897176))

(assert (= (and b!897176 res!606507) b!897177))

(declare-fun m!834099 () Bool)

(assert (=> d!111045 m!834099))

(declare-fun m!834101 () Bool)

(assert (=> b!897175 m!834101))

(declare-fun m!834103 () Bool)

(assert (=> b!897176 m!834103))

(declare-fun m!834105 () Bool)

(assert (=> b!897177 m!834105))

(assert (=> start!76580 d!111045))

(declare-fun d!111047 () Bool)

(declare-fun e!501651 () Bool)

(assert (=> d!111047 e!501651))

(declare-fun res!606510 () Bool)

(assert (=> d!111047 (=> res!606510 e!501651)))

(declare-fun lt!405091 () SeekEntryResult!8906)

(assert (=> d!111047 (= res!606510 (not ((_ is Found!8906) lt!405091)))))

(assert (=> d!111047 (= lt!405091 (seekEntry!0 key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun lt!405090 () Unit!30502)

(declare-fun choose!1482 (array!52630 array!52632 (_ BitVec 32) (_ BitVec 32) V!29369 V!29369 (_ BitVec 64)) Unit!30502)

(assert (=> d!111047 (= lt!405090 (choose!1482 (_keys!10139 thiss!1181) (_values!5388 thiss!1181) (mask!26064 thiss!1181) (extraKeys!5097 thiss!1181) (zeroValue!5201 thiss!1181) (minValue!5201 thiss!1181) key!785))))

(assert (=> d!111047 (validMask!0 (mask!26064 thiss!1181))))

(assert (=> d!111047 (= (lemmaSeekEntryGivesInRangeIndex!77 (_keys!10139 thiss!1181) (_values!5388 thiss!1181) (mask!26064 thiss!1181) (extraKeys!5097 thiss!1181) (zeroValue!5201 thiss!1181) (minValue!5201 thiss!1181) key!785) lt!405090)))

(declare-fun b!897180 () Bool)

(assert (=> b!897180 (= e!501651 (inRange!0 (index!37996 lt!405091) (mask!26064 thiss!1181)))))

(assert (= (and d!111047 (not res!606510)) b!897180))

(assert (=> d!111047 m!834055))

(declare-fun m!834107 () Bool)

(assert (=> d!111047 m!834107))

(assert (=> d!111047 m!834067))

(declare-fun m!834109 () Bool)

(assert (=> b!897180 m!834109))

(assert (=> b!897134 d!111047))

(declare-fun b!897193 () Bool)

(declare-fun e!501659 () SeekEntryResult!8906)

(declare-fun lt!405100 () SeekEntryResult!8906)

(assert (=> b!897193 (= e!501659 (MissingZero!8906 (index!37997 lt!405100)))))

(declare-fun b!897194 () Bool)

(declare-fun e!501660 () SeekEntryResult!8906)

(assert (=> b!897194 (= e!501660 (Found!8906 (index!37997 lt!405100)))))

(declare-fun b!897195 () Bool)

(declare-fun e!501658 () SeekEntryResult!8906)

(assert (=> b!897195 (= e!501658 e!501660)))

(declare-fun lt!405101 () (_ BitVec 64))

(assert (=> b!897195 (= lt!405101 (select (arr!25299 (_keys!10139 thiss!1181)) (index!37997 lt!405100)))))

(declare-fun c!94785 () Bool)

(assert (=> b!897195 (= c!94785 (= lt!405101 key!785))))

(declare-fun b!897196 () Bool)

(assert (=> b!897196 (= e!501658 Undefined!8906)))

(declare-fun b!897197 () Bool)

(declare-fun c!94787 () Bool)

(assert (=> b!897197 (= c!94787 (= lt!405101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897197 (= e!501660 e!501659)))

(declare-fun d!111049 () Bool)

(declare-fun lt!405102 () SeekEntryResult!8906)

(assert (=> d!111049 (and (or ((_ is MissingVacant!8906) lt!405102) (not ((_ is Found!8906) lt!405102)) (and (bvsge (index!37996 lt!405102) #b00000000000000000000000000000000) (bvslt (index!37996 lt!405102) (size!25752 (_keys!10139 thiss!1181))))) (not ((_ is MissingVacant!8906) lt!405102)) (or (not ((_ is Found!8906) lt!405102)) (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37996 lt!405102)) key!785)))))

(assert (=> d!111049 (= lt!405102 e!501658)))

(declare-fun c!94786 () Bool)

(assert (=> d!111049 (= c!94786 (and ((_ is Intermediate!8906) lt!405100) (undefined!9718 lt!405100)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52630 (_ BitVec 32)) SeekEntryResult!8906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111049 (= lt!405100 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26064 thiss!1181)) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(assert (=> d!111049 (validMask!0 (mask!26064 thiss!1181))))

(assert (=> d!111049 (= (seekEntry!0 key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)) lt!405102)))

(declare-fun b!897198 () Bool)

(declare-fun lt!405103 () SeekEntryResult!8906)

(assert (=> b!897198 (= e!501659 (ite ((_ is MissingVacant!8906) lt!405103) (MissingZero!8906 (index!37998 lt!405103)) lt!405103))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52630 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!897198 (= lt!405103 (seekKeyOrZeroReturnVacant!0 (x!76421 lt!405100) (index!37997 lt!405100) (index!37997 lt!405100) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(assert (= (and d!111049 c!94786) b!897196))

(assert (= (and d!111049 (not c!94786)) b!897195))

(assert (= (and b!897195 c!94785) b!897194))

(assert (= (and b!897195 (not c!94785)) b!897197))

(assert (= (and b!897197 c!94787) b!897193))

(assert (= (and b!897197 (not c!94787)) b!897198))

(declare-fun m!834111 () Bool)

(assert (=> b!897195 m!834111))

(declare-fun m!834113 () Bool)

(assert (=> d!111049 m!834113))

(declare-fun m!834115 () Bool)

(assert (=> d!111049 m!834115))

(assert (=> d!111049 m!834115))

(declare-fun m!834117 () Bool)

(assert (=> d!111049 m!834117))

(assert (=> d!111049 m!834067))

(declare-fun m!834119 () Bool)

(assert (=> b!897198 m!834119))

(assert (=> b!897134 d!111049))

(declare-fun condMapEmpty!29092 () Bool)

(declare-fun mapDefault!29092 () ValueCell!8670)

(assert (=> mapNonEmpty!29086 (= condMapEmpty!29092 (= mapRest!29086 ((as const (Array (_ BitVec 32) ValueCell!8670)) mapDefault!29092)))))

(declare-fun e!501665 () Bool)

(declare-fun mapRes!29092 () Bool)

(assert (=> mapNonEmpty!29086 (= tp!55971 (and e!501665 mapRes!29092))))

(declare-fun mapNonEmpty!29092 () Bool)

(declare-fun tp!55980 () Bool)

(declare-fun e!501666 () Bool)

(assert (=> mapNonEmpty!29092 (= mapRes!29092 (and tp!55980 e!501666))))

(declare-fun mapRest!29092 () (Array (_ BitVec 32) ValueCell!8670))

(declare-fun mapValue!29092 () ValueCell!8670)

(declare-fun mapKey!29092 () (_ BitVec 32))

(assert (=> mapNonEmpty!29092 (= mapRest!29086 (store mapRest!29092 mapKey!29092 mapValue!29092))))

(declare-fun b!897206 () Bool)

(assert (=> b!897206 (= e!501665 tp_is_empty!18303)))

(declare-fun mapIsEmpty!29092 () Bool)

(assert (=> mapIsEmpty!29092 mapRes!29092))

(declare-fun b!897205 () Bool)

(assert (=> b!897205 (= e!501666 tp_is_empty!18303)))

(assert (= (and mapNonEmpty!29086 condMapEmpty!29092) mapIsEmpty!29092))

(assert (= (and mapNonEmpty!29086 (not condMapEmpty!29092)) mapNonEmpty!29092))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8670) mapValue!29092)) b!897205))

(assert (= (and mapNonEmpty!29086 ((_ is ValueCellFull!8670) mapDefault!29092)) b!897206))

(declare-fun m!834121 () Bool)

(assert (=> mapNonEmpty!29092 m!834121))

(check-sat (not d!111045) (not b!897198) (not b!897168) (not d!111049) (not b!897175) (not mapNonEmpty!29092) (not d!111047) (not b_next!15975) tp_is_empty!18303 (not d!111043) (not b!897177) (not b!897180) (not b!897176) b_and!26267)
(check-sat b_and!26267 (not b_next!15975))
(get-model)

(declare-fun b!897219 () Bool)

(declare-fun e!501673 () SeekEntryResult!8906)

(assert (=> b!897219 (= e!501673 Undefined!8906)))

(declare-fun b!897220 () Bool)

(declare-fun e!501675 () SeekEntryResult!8906)

(assert (=> b!897220 (= e!501675 (MissingVacant!8906 (index!37997 lt!405100)))))

(declare-fun b!897221 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!897221 (= e!501675 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76421 lt!405100) #b00000000000000000000000000000001) (nextIndex!0 (index!37997 lt!405100) (x!76421 lt!405100) (mask!26064 thiss!1181)) (index!37997 lt!405100) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun d!111051 () Bool)

(declare-fun lt!405108 () SeekEntryResult!8906)

(assert (=> d!111051 (and (or ((_ is Undefined!8906) lt!405108) (not ((_ is Found!8906) lt!405108)) (and (bvsge (index!37996 lt!405108) #b00000000000000000000000000000000) (bvslt (index!37996 lt!405108) (size!25752 (_keys!10139 thiss!1181))))) (or ((_ is Undefined!8906) lt!405108) ((_ is Found!8906) lt!405108) (not ((_ is MissingVacant!8906) lt!405108)) (not (= (index!37998 lt!405108) (index!37997 lt!405100))) (and (bvsge (index!37998 lt!405108) #b00000000000000000000000000000000) (bvslt (index!37998 lt!405108) (size!25752 (_keys!10139 thiss!1181))))) (or ((_ is Undefined!8906) lt!405108) (ite ((_ is Found!8906) lt!405108) (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37996 lt!405108)) key!785) (and ((_ is MissingVacant!8906) lt!405108) (= (index!37998 lt!405108) (index!37997 lt!405100)) (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37998 lt!405108)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111051 (= lt!405108 e!501673)))

(declare-fun c!94795 () Bool)

(assert (=> d!111051 (= c!94795 (bvsge (x!76421 lt!405100) #b01111111111111111111111111111110))))

(declare-fun lt!405109 () (_ BitVec 64))

(assert (=> d!111051 (= lt!405109 (select (arr!25299 (_keys!10139 thiss!1181)) (index!37997 lt!405100)))))

(assert (=> d!111051 (validMask!0 (mask!26064 thiss!1181))))

(assert (=> d!111051 (= (seekKeyOrZeroReturnVacant!0 (x!76421 lt!405100) (index!37997 lt!405100) (index!37997 lt!405100) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)) lt!405108)))

(declare-fun b!897222 () Bool)

(declare-fun c!94794 () Bool)

(assert (=> b!897222 (= c!94794 (= lt!405109 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!501674 () SeekEntryResult!8906)

(assert (=> b!897222 (= e!501674 e!501675)))

(declare-fun b!897223 () Bool)

(assert (=> b!897223 (= e!501674 (Found!8906 (index!37997 lt!405100)))))

(declare-fun b!897224 () Bool)

(assert (=> b!897224 (= e!501673 e!501674)))

(declare-fun c!94796 () Bool)

(assert (=> b!897224 (= c!94796 (= lt!405109 key!785))))

(assert (= (and d!111051 c!94795) b!897219))

(assert (= (and d!111051 (not c!94795)) b!897224))

(assert (= (and b!897224 c!94796) b!897223))

(assert (= (and b!897224 (not c!94796)) b!897222))

(assert (= (and b!897222 c!94794) b!897220))

(assert (= (and b!897222 (not c!94794)) b!897221))

(declare-fun m!834123 () Bool)

(assert (=> b!897221 m!834123))

(assert (=> b!897221 m!834123))

(declare-fun m!834125 () Bool)

(assert (=> b!897221 m!834125))

(declare-fun m!834127 () Bool)

(assert (=> d!111051 m!834127))

(declare-fun m!834129 () Bool)

(assert (=> d!111051 m!834129))

(assert (=> d!111051 m!834111))

(assert (=> d!111051 m!834067))

(assert (=> b!897198 d!111051))

(declare-fun b!897233 () Bool)

(declare-fun e!501680 () (_ BitVec 32))

(assert (=> b!897233 (= e!501680 #b00000000000000000000000000000000)))

(declare-fun b!897234 () Bool)

(declare-fun e!501681 () (_ BitVec 32))

(declare-fun call!39799 () (_ BitVec 32))

(assert (=> b!897234 (= e!501681 (bvadd #b00000000000000000000000000000001 call!39799))))

(declare-fun b!897235 () Bool)

(assert (=> b!897235 (= e!501681 call!39799)))

(declare-fun d!111053 () Bool)

(declare-fun lt!405112 () (_ BitVec 32))

(assert (=> d!111053 (and (bvsge lt!405112 #b00000000000000000000000000000000) (bvsle lt!405112 (bvsub (size!25752 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111053 (= lt!405112 e!501680)))

(declare-fun c!94802 () Bool)

(assert (=> d!111053 (= c!94802 (bvsge #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))))))

(assert (=> d!111053 (and (bvsle #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25752 (_keys!10139 thiss!1181)) (size!25752 (_keys!10139 thiss!1181))))))

(assert (=> d!111053 (= (arrayCountValidKeys!0 (_keys!10139 thiss!1181) #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))) lt!405112)))

(declare-fun bm!39796 () Bool)

(assert (=> bm!39796 (= call!39799 (arrayCountValidKeys!0 (_keys!10139 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25752 (_keys!10139 thiss!1181))))))

(declare-fun b!897236 () Bool)

(assert (=> b!897236 (= e!501680 e!501681)))

(declare-fun c!94801 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!897236 (= c!94801 (validKeyInArray!0 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111053 c!94802) b!897233))

(assert (= (and d!111053 (not c!94802)) b!897236))

(assert (= (and b!897236 c!94801) b!897234))

(assert (= (and b!897236 (not c!94801)) b!897235))

(assert (= (or b!897234 b!897235) bm!39796))

(declare-fun m!834131 () Bool)

(assert (=> bm!39796 m!834131))

(assert (=> b!897236 m!834093))

(assert (=> b!897236 m!834093))

(declare-fun m!834133 () Bool)

(assert (=> b!897236 m!834133))

(assert (=> b!897175 d!111053))

(declare-fun bm!39799 () Bool)

(declare-fun call!39802 () Bool)

(assert (=> bm!39799 (= call!39802 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun d!111055 () Bool)

(declare-fun res!606515 () Bool)

(declare-fun e!501690 () Bool)

(assert (=> d!111055 (=> res!606515 e!501690)))

(assert (=> d!111055 (= res!606515 (bvsge #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))))))

(assert (=> d!111055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)) e!501690)))

(declare-fun b!897245 () Bool)

(declare-fun e!501689 () Bool)

(assert (=> b!897245 (= e!501689 call!39802)))

(declare-fun b!897246 () Bool)

(declare-fun e!501688 () Bool)

(assert (=> b!897246 (= e!501688 e!501689)))

(declare-fun lt!405121 () (_ BitVec 64))

(assert (=> b!897246 (= lt!405121 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405119 () Unit!30502)

(assert (=> b!897246 (= lt!405119 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10139 thiss!1181) lt!405121 #b00000000000000000000000000000000))))

(assert (=> b!897246 (arrayContainsKey!0 (_keys!10139 thiss!1181) lt!405121 #b00000000000000000000000000000000)))

(declare-fun lt!405120 () Unit!30502)

(assert (=> b!897246 (= lt!405120 lt!405119)))

(declare-fun res!606516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52630 (_ BitVec 32)) SeekEntryResult!8906)

(assert (=> b!897246 (= res!606516 (= (seekEntryOrOpen!0 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000) (_keys!10139 thiss!1181) (mask!26064 thiss!1181)) (Found!8906 #b00000000000000000000000000000000)))))

(assert (=> b!897246 (=> (not res!606516) (not e!501689))))

(declare-fun b!897247 () Bool)

(assert (=> b!897247 (= e!501688 call!39802)))

(declare-fun b!897248 () Bool)

(assert (=> b!897248 (= e!501690 e!501688)))

(declare-fun c!94805 () Bool)

(assert (=> b!897248 (= c!94805 (validKeyInArray!0 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111055 (not res!606515)) b!897248))

(assert (= (and b!897248 c!94805) b!897246))

(assert (= (and b!897248 (not c!94805)) b!897247))

(assert (= (and b!897246 res!606516) b!897245))

(assert (= (or b!897245 b!897247) bm!39799))

(declare-fun m!834135 () Bool)

(assert (=> bm!39799 m!834135))

(assert (=> b!897246 m!834093))

(declare-fun m!834137 () Bool)

(assert (=> b!897246 m!834137))

(declare-fun m!834139 () Bool)

(assert (=> b!897246 m!834139))

(assert (=> b!897246 m!834093))

(declare-fun m!834141 () Bool)

(assert (=> b!897246 m!834141))

(assert (=> b!897248 m!834093))

(assert (=> b!897248 m!834093))

(assert (=> b!897248 m!834133))

(assert (=> b!897176 d!111055))

(declare-fun d!111057 () Bool)

(declare-fun res!606517 () Bool)

(declare-fun e!501691 () Bool)

(assert (=> d!111057 (=> res!606517 e!501691)))

(assert (=> d!111057 (= res!606517 (= (select (arr!25299 (_keys!10139 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111057 (= (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!501691)))

(declare-fun b!897249 () Bool)

(declare-fun e!501692 () Bool)

(assert (=> b!897249 (= e!501691 e!501692)))

(declare-fun res!606518 () Bool)

(assert (=> b!897249 (=> (not res!606518) (not e!501692))))

(assert (=> b!897249 (= res!606518 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25752 (_keys!10139 thiss!1181))))))

(declare-fun b!897250 () Bool)

(assert (=> b!897250 (= e!501692 (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111057 (not res!606517)) b!897249))

(assert (= (and b!897249 res!606518) b!897250))

(declare-fun m!834143 () Bool)

(assert (=> d!111057 m!834143))

(declare-fun m!834145 () Bool)

(assert (=> b!897250 m!834145))

(assert (=> b!897168 d!111057))

(assert (=> d!111047 d!111049))

(declare-fun d!111059 () Bool)

(declare-fun e!501695 () Bool)

(assert (=> d!111059 e!501695))

(declare-fun res!606521 () Bool)

(assert (=> d!111059 (=> res!606521 e!501695)))

(declare-fun lt!405124 () SeekEntryResult!8906)

(assert (=> d!111059 (= res!606521 (not ((_ is Found!8906) lt!405124)))))

(assert (=> d!111059 (= lt!405124 (seekEntry!0 key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(assert (=> d!111059 true))

(declare-fun _$36!360 () Unit!30502)

(assert (=> d!111059 (= (choose!1482 (_keys!10139 thiss!1181) (_values!5388 thiss!1181) (mask!26064 thiss!1181) (extraKeys!5097 thiss!1181) (zeroValue!5201 thiss!1181) (minValue!5201 thiss!1181) key!785) _$36!360)))

(declare-fun b!897253 () Bool)

(assert (=> b!897253 (= e!501695 (inRange!0 (index!37996 lt!405124) (mask!26064 thiss!1181)))))

(assert (= (and d!111059 (not res!606521)) b!897253))

(assert (=> d!111059 m!834055))

(declare-fun m!834147 () Bool)

(assert (=> b!897253 m!834147))

(assert (=> d!111047 d!111059))

(assert (=> d!111047 d!111039))

(assert (=> d!111043 d!111041))

(declare-fun d!111061 () Bool)

(assert (=> d!111061 (arrayContainsKey!0 (_keys!10139 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111061 true))

(declare-fun _$60!412 () Unit!30502)

(assert (=> d!111061 (= (choose!13 (_keys!10139 thiss!1181) key!785 (index!37996 lt!405072)) _$60!412)))

(declare-fun bs!25185 () Bool)

(assert (= bs!25185 d!111061))

(assert (=> bs!25185 m!834069))

(assert (=> d!111043 d!111061))

(declare-fun b!897264 () Bool)

(declare-fun e!501707 () Bool)

(declare-fun call!39805 () Bool)

(assert (=> b!897264 (= e!501707 call!39805)))

(declare-fun b!897265 () Bool)

(declare-fun e!501706 () Bool)

(assert (=> b!897265 (= e!501706 e!501707)))

(declare-fun c!94808 () Bool)

(assert (=> b!897265 (= c!94808 (validKeyInArray!0 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!111063 () Bool)

(declare-fun res!606528 () Bool)

(declare-fun e!501705 () Bool)

(assert (=> d!111063 (=> res!606528 e!501705)))

(assert (=> d!111063 (= res!606528 (bvsge #b00000000000000000000000000000000 (size!25752 (_keys!10139 thiss!1181))))))

(assert (=> d!111063 (= (arrayNoDuplicates!0 (_keys!10139 thiss!1181) #b00000000000000000000000000000000 Nil!17824) e!501705)))

(declare-fun b!897266 () Bool)

(declare-fun e!501704 () Bool)

(declare-fun contains!4403 (List!17827 (_ BitVec 64)) Bool)

(assert (=> b!897266 (= e!501704 (contains!4403 Nil!17824 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!897267 () Bool)

(assert (=> b!897267 (= e!501707 call!39805)))

(declare-fun b!897268 () Bool)

(assert (=> b!897268 (= e!501705 e!501706)))

(declare-fun res!606529 () Bool)

(assert (=> b!897268 (=> (not res!606529) (not e!501706))))

(assert (=> b!897268 (= res!606529 (not e!501704))))

(declare-fun res!606530 () Bool)

(assert (=> b!897268 (=> (not res!606530) (not e!501704))))

(assert (=> b!897268 (= res!606530 (validKeyInArray!0 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39802 () Bool)

(assert (=> bm!39802 (= call!39805 (arrayNoDuplicates!0 (_keys!10139 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94808 (Cons!17823 (select (arr!25299 (_keys!10139 thiss!1181)) #b00000000000000000000000000000000) Nil!17824) Nil!17824)))))

(assert (= (and d!111063 (not res!606528)) b!897268))

(assert (= (and b!897268 res!606530) b!897266))

(assert (= (and b!897268 res!606529) b!897265))

(assert (= (and b!897265 c!94808) b!897264))

(assert (= (and b!897265 (not c!94808)) b!897267))

(assert (= (or b!897264 b!897267) bm!39802))

(assert (=> b!897265 m!834093))

(assert (=> b!897265 m!834093))

(assert (=> b!897265 m!834133))

(assert (=> b!897266 m!834093))

(assert (=> b!897266 m!834093))

(declare-fun m!834149 () Bool)

(assert (=> b!897266 m!834149))

(assert (=> b!897268 m!834093))

(assert (=> b!897268 m!834093))

(assert (=> b!897268 m!834133))

(assert (=> bm!39802 m!834093))

(declare-fun m!834151 () Bool)

(assert (=> bm!39802 m!834151))

(assert (=> b!897177 d!111063))

(declare-fun d!111065 () Bool)

(assert (=> d!111065 (= (inRange!0 (index!37996 lt!405091) (mask!26064 thiss!1181)) (and (bvsge (index!37996 lt!405091) #b00000000000000000000000000000000) (bvslt (index!37996 lt!405091) (bvadd (mask!26064 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!897180 d!111065))

(declare-fun b!897287 () Bool)

(declare-fun lt!405129 () SeekEntryResult!8906)

(assert (=> b!897287 (and (bvsge (index!37997 lt!405129) #b00000000000000000000000000000000) (bvslt (index!37997 lt!405129) (size!25752 (_keys!10139 thiss!1181))))))

(declare-fun res!606539 () Bool)

(assert (=> b!897287 (= res!606539 (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37997 lt!405129)) key!785))))

(declare-fun e!501722 () Bool)

(assert (=> b!897287 (=> res!606539 e!501722)))

(declare-fun e!501721 () Bool)

(assert (=> b!897287 (= e!501721 e!501722)))

(declare-fun b!897288 () Bool)

(assert (=> b!897288 (and (bvsge (index!37997 lt!405129) #b00000000000000000000000000000000) (bvslt (index!37997 lt!405129) (size!25752 (_keys!10139 thiss!1181))))))

(assert (=> b!897288 (= e!501722 (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37997 lt!405129)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!897289 () Bool)

(declare-fun e!501720 () SeekEntryResult!8906)

(assert (=> b!897289 (= e!501720 (Intermediate!8906 true (toIndex!0 key!785 (mask!26064 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897290 () Bool)

(declare-fun e!501719 () SeekEntryResult!8906)

(assert (=> b!897290 (= e!501719 (Intermediate!8906 false (toIndex!0 key!785 (mask!26064 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!897291 () Bool)

(assert (=> b!897291 (= e!501719 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26064 thiss!1181)) #b00000000000000000000000000000000 (mask!26064 thiss!1181)) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)))))

(declare-fun b!897292 () Bool)

(assert (=> b!897292 (= e!501720 e!501719)))

(declare-fun c!94816 () Bool)

(declare-fun lt!405130 () (_ BitVec 64))

(assert (=> b!897292 (= c!94816 (or (= lt!405130 key!785) (= (bvadd lt!405130 lt!405130) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!897293 () Bool)

(declare-fun e!501718 () Bool)

(assert (=> b!897293 (= e!501718 e!501721)))

(declare-fun res!606537 () Bool)

(assert (=> b!897293 (= res!606537 (and ((_ is Intermediate!8906) lt!405129) (not (undefined!9718 lt!405129)) (bvslt (x!76421 lt!405129) #b01111111111111111111111111111110) (bvsge (x!76421 lt!405129) #b00000000000000000000000000000000) (bvsge (x!76421 lt!405129) #b00000000000000000000000000000000)))))

(assert (=> b!897293 (=> (not res!606537) (not e!501721))))

(declare-fun d!111067 () Bool)

(assert (=> d!111067 e!501718))

(declare-fun c!94815 () Bool)

(assert (=> d!111067 (= c!94815 (and ((_ is Intermediate!8906) lt!405129) (undefined!9718 lt!405129)))))

(assert (=> d!111067 (= lt!405129 e!501720)))

(declare-fun c!94817 () Bool)

(assert (=> d!111067 (= c!94817 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111067 (= lt!405130 (select (arr!25299 (_keys!10139 thiss!1181)) (toIndex!0 key!785 (mask!26064 thiss!1181))))))

(assert (=> d!111067 (validMask!0 (mask!26064 thiss!1181))))

(assert (=> d!111067 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26064 thiss!1181)) key!785 (_keys!10139 thiss!1181) (mask!26064 thiss!1181)) lt!405129)))

(declare-fun b!897294 () Bool)

(assert (=> b!897294 (= e!501718 (bvsge (x!76421 lt!405129) #b01111111111111111111111111111110))))

(declare-fun b!897295 () Bool)

(assert (=> b!897295 (and (bvsge (index!37997 lt!405129) #b00000000000000000000000000000000) (bvslt (index!37997 lt!405129) (size!25752 (_keys!10139 thiss!1181))))))

(declare-fun res!606538 () Bool)

(assert (=> b!897295 (= res!606538 (= (select (arr!25299 (_keys!10139 thiss!1181)) (index!37997 lt!405129)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!897295 (=> res!606538 e!501722)))

(assert (= (and d!111067 c!94817) b!897289))

(assert (= (and d!111067 (not c!94817)) b!897292))

(assert (= (and b!897292 c!94816) b!897290))

(assert (= (and b!897292 (not c!94816)) b!897291))

(assert (= (and d!111067 c!94815) b!897294))

(assert (= (and d!111067 (not c!94815)) b!897293))

(assert (= (and b!897293 res!606537) b!897287))

(assert (= (and b!897287 (not res!606539)) b!897295))

(assert (= (and b!897295 (not res!606538)) b!897288))

(assert (=> d!111067 m!834115))

(declare-fun m!834153 () Bool)

(assert (=> d!111067 m!834153))

(assert (=> d!111067 m!834067))

(declare-fun m!834155 () Bool)

(assert (=> b!897295 m!834155))

(assert (=> b!897291 m!834115))

(declare-fun m!834157 () Bool)

(assert (=> b!897291 m!834157))

(assert (=> b!897291 m!834157))

(declare-fun m!834159 () Bool)

(assert (=> b!897291 m!834159))

(assert (=> b!897287 m!834155))

(assert (=> b!897288 m!834155))

(assert (=> d!111049 d!111067))

(declare-fun d!111069 () Bool)

(declare-fun lt!405136 () (_ BitVec 32))

(declare-fun lt!405135 () (_ BitVec 32))

(assert (=> d!111069 (= lt!405136 (bvmul (bvxor lt!405135 (bvlshr lt!405135 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111069 (= lt!405135 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111069 (and (bvsge (mask!26064 thiss!1181) #b00000000000000000000000000000000) (let ((res!606540 (let ((h!18964 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76438 (bvmul (bvxor h!18964 (bvlshr h!18964 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76438 (bvlshr x!76438 #b00000000000000000000000000001101)) (mask!26064 thiss!1181)))))) (and (bvslt res!606540 (bvadd (mask!26064 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606540 #b00000000000000000000000000000000))))))

(assert (=> d!111069 (= (toIndex!0 key!785 (mask!26064 thiss!1181)) (bvand (bvxor lt!405136 (bvlshr lt!405136 #b00000000000000000000000000001101)) (mask!26064 thiss!1181)))))

(assert (=> d!111049 d!111069))

(assert (=> d!111049 d!111039))

(declare-fun b!897307 () Bool)

(declare-fun e!501725 () Bool)

(assert (=> b!897307 (= e!501725 (and (bvsge (extraKeys!5097 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5097 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2233 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!111071 () Bool)

(declare-fun res!606551 () Bool)

(assert (=> d!111071 (=> (not res!606551) (not e!501725))))

(assert (=> d!111071 (= res!606551 (validMask!0 (mask!26064 thiss!1181)))))

(assert (=> d!111071 (= (simpleValid!317 thiss!1181) e!501725)))

(declare-fun b!897304 () Bool)

(declare-fun res!606549 () Bool)

(assert (=> b!897304 (=> (not res!606549) (not e!501725))))

(assert (=> b!897304 (= res!606549 (and (= (size!25753 (_values!5388 thiss!1181)) (bvadd (mask!26064 thiss!1181) #b00000000000000000000000000000001)) (= (size!25752 (_keys!10139 thiss!1181)) (size!25753 (_values!5388 thiss!1181))) (bvsge (_size!2233 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2233 thiss!1181) (bvadd (mask!26064 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!897306 () Bool)

(declare-fun res!606552 () Bool)

(assert (=> b!897306 (=> (not res!606552) (not e!501725))))

(declare-fun size!25756 (LongMapFixedSize!4356) (_ BitVec 32))

(assert (=> b!897306 (= res!606552 (= (size!25756 thiss!1181) (bvadd (_size!2233 thiss!1181) (bvsdiv (bvadd (extraKeys!5097 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!897305 () Bool)

(declare-fun res!606550 () Bool)

(assert (=> b!897305 (=> (not res!606550) (not e!501725))))

(assert (=> b!897305 (= res!606550 (bvsge (size!25756 thiss!1181) (_size!2233 thiss!1181)))))

(assert (= (and d!111071 res!606551) b!897304))

(assert (= (and b!897304 res!606549) b!897305))

(assert (= (and b!897305 res!606550) b!897306))

(assert (= (and b!897306 res!606552) b!897307))

(assert (=> d!111071 m!834067))

(declare-fun m!834161 () Bool)

(assert (=> b!897306 m!834161))

(assert (=> b!897305 m!834161))

(assert (=> d!111045 d!111071))

(declare-fun condMapEmpty!29093 () Bool)

(declare-fun mapDefault!29093 () ValueCell!8670)

(assert (=> mapNonEmpty!29092 (= condMapEmpty!29093 (= mapRest!29092 ((as const (Array (_ BitVec 32) ValueCell!8670)) mapDefault!29093)))))

(declare-fun e!501726 () Bool)

(declare-fun mapRes!29093 () Bool)

(assert (=> mapNonEmpty!29092 (= tp!55980 (and e!501726 mapRes!29093))))

(declare-fun mapNonEmpty!29093 () Bool)

(declare-fun tp!55981 () Bool)

(declare-fun e!501727 () Bool)

(assert (=> mapNonEmpty!29093 (= mapRes!29093 (and tp!55981 e!501727))))

(declare-fun mapKey!29093 () (_ BitVec 32))

(declare-fun mapValue!29093 () ValueCell!8670)

(declare-fun mapRest!29093 () (Array (_ BitVec 32) ValueCell!8670))

(assert (=> mapNonEmpty!29093 (= mapRest!29092 (store mapRest!29093 mapKey!29093 mapValue!29093))))

(declare-fun b!897309 () Bool)

(assert (=> b!897309 (= e!501726 tp_is_empty!18303)))

(declare-fun mapIsEmpty!29093 () Bool)

(assert (=> mapIsEmpty!29093 mapRes!29093))

(declare-fun b!897308 () Bool)

(assert (=> b!897308 (= e!501727 tp_is_empty!18303)))

(assert (= (and mapNonEmpty!29092 condMapEmpty!29093) mapIsEmpty!29093))

(assert (= (and mapNonEmpty!29092 (not condMapEmpty!29093)) mapNonEmpty!29093))

(assert (= (and mapNonEmpty!29093 ((_ is ValueCellFull!8670) mapValue!29093)) b!897308))

(assert (= (and mapNonEmpty!29092 ((_ is ValueCellFull!8670) mapDefault!29093)) b!897309))

(declare-fun m!834163 () Bool)

(assert (=> mapNonEmpty!29093 m!834163))

(check-sat (not bm!39796) (not b!897266) (not b!897268) (not b!897221) (not bm!39799) (not bm!39802) (not b!897246) (not b!897236) (not b!897253) (not d!111051) (not b!897248) (not b_next!15975) (not b!897306) (not mapNonEmpty!29093) (not d!111059) (not d!111061) (not b!897291) (not b!897265) (not d!111071) (not d!111067) (not b!897250) b_and!26267 (not b!897305) tp_is_empty!18303)
(check-sat b_and!26267 (not b_next!15975))
