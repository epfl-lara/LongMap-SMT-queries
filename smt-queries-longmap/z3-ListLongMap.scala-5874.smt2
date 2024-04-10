; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75776 () Bool)

(assert start!75776)

(declare-fun b!891199 () Bool)

(declare-fun b_free!15747 () Bool)

(declare-fun b_next!15747 () Bool)

(assert (=> b!891199 (= b_free!15747 (not b_next!15747))))

(declare-fun tp!55210 () Bool)

(declare-fun b_and!25987 () Bool)

(assert (=> b!891199 (= tp!55210 b_and!25987)))

(declare-fun b!891191 () Bool)

(declare-fun e!497249 () Bool)

(declare-fun e!497248 () Bool)

(assert (=> b!891191 (= e!497249 e!497248)))

(declare-fun res!603804 () Bool)

(assert (=> b!891191 (=> res!603804 e!497248)))

(declare-datatypes ((array!52130 0))(
  ( (array!52131 (arr!25071 (Array (_ BitVec 32) (_ BitVec 64))) (size!25515 (_ BitVec 32))) )
))
(declare-datatypes ((V!29065 0))(
  ( (V!29066 (val!9088 Int)) )
))
(declare-datatypes ((ValueCell!8556 0))(
  ( (ValueCellFull!8556 (v!11566 V!29065)) (EmptyCell!8556) )
))
(declare-datatypes ((array!52132 0))(
  ( (array!52133 (arr!25072 (Array (_ BitVec 32) ValueCell!8556)) (size!25516 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4128 0))(
  ( (LongMapFixedSize!4129 (defaultEntry!5261 Int) (mask!25750 (_ BitVec 32)) (extraKeys!4955 (_ BitVec 32)) (zeroValue!5059 V!29065) (minValue!5059 V!29065) (_size!2119 (_ BitVec 32)) (_keys!9944 array!52130) (_values!5246 array!52132) (_vacant!2119 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4128)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891191 (= res!603804 (not (validMask!0 (mask!25750 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52130 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891191 (arrayContainsKey!0 (_keys!9944 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30332 0))(
  ( (Unit!30333) )
))
(declare-fun lt!402572 () Unit!30332)

(declare-datatypes ((SeekEntryResult!8818 0))(
  ( (MissingZero!8818 (index!37643 (_ BitVec 32))) (Found!8818 (index!37644 (_ BitVec 32))) (Intermediate!8818 (undefined!9630 Bool) (index!37645 (_ BitVec 32)) (x!75722 (_ BitVec 32))) (Undefined!8818) (MissingVacant!8818 (index!37646 (_ BitVec 32))) )
))
(declare-fun lt!402574 () SeekEntryResult!8818)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52130 (_ BitVec 64) (_ BitVec 32)) Unit!30332)

(assert (=> b!891191 (= lt!402572 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9944 thiss!1181) key!785 (index!37644 lt!402574)))))

(declare-fun b!891192 () Bool)

(declare-fun e!497242 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891192 (= e!497242 (inRange!0 (index!37644 lt!402574) (mask!25750 thiss!1181)))))

(declare-fun b!891193 () Bool)

(declare-fun res!603803 () Bool)

(assert (=> b!891193 (=> res!603803 e!497248)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52130 (_ BitVec 32)) Bool)

(assert (=> b!891193 (= res!603803 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9944 thiss!1181) (mask!25750 thiss!1181))))))

(declare-fun b!891194 () Bool)

(declare-fun e!497247 () Bool)

(declare-fun tp_is_empty!18075 () Bool)

(assert (=> b!891194 (= e!497247 tp_is_empty!18075)))

(declare-fun mapIsEmpty!28667 () Bool)

(declare-fun mapRes!28667 () Bool)

(assert (=> mapIsEmpty!28667 mapRes!28667))

(declare-fun b!891195 () Bool)

(declare-fun e!497244 () Bool)

(declare-fun e!497245 () Bool)

(assert (=> b!891195 (= e!497244 (and e!497245 mapRes!28667))))

(declare-fun condMapEmpty!28667 () Bool)

(declare-fun mapDefault!28667 () ValueCell!8556)

(assert (=> b!891195 (= condMapEmpty!28667 (= (arr!25072 (_values!5246 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8556)) mapDefault!28667)))))

(declare-fun mapNonEmpty!28667 () Bool)

(declare-fun tp!55209 () Bool)

(assert (=> mapNonEmpty!28667 (= mapRes!28667 (and tp!55209 e!497247))))

(declare-fun mapRest!28667 () (Array (_ BitVec 32) ValueCell!8556))

(declare-fun mapKey!28667 () (_ BitVec 32))

(declare-fun mapValue!28667 () ValueCell!8556)

(assert (=> mapNonEmpty!28667 (= (arr!25072 (_values!5246 thiss!1181)) (store mapRest!28667 mapKey!28667 mapValue!28667))))

(declare-fun res!603801 () Bool)

(declare-fun e!497243 () Bool)

(assert (=> start!75776 (=> (not res!603801) (not e!497243))))

(declare-fun valid!1602 (LongMapFixedSize!4128) Bool)

(assert (=> start!75776 (= res!603801 (valid!1602 thiss!1181))))

(assert (=> start!75776 e!497243))

(declare-fun e!497246 () Bool)

(assert (=> start!75776 e!497246))

(assert (=> start!75776 true))

(declare-fun b!891196 () Bool)

(assert (=> b!891196 (= e!497245 tp_is_empty!18075)))

(declare-fun b!891197 () Bool)

(declare-fun res!603802 () Bool)

(assert (=> b!891197 (=> (not res!603802) (not e!497243))))

(assert (=> b!891197 (= res!603802 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891198 () Bool)

(declare-fun res!603805 () Bool)

(assert (=> b!891198 (=> res!603805 e!497248)))

(assert (=> b!891198 (= res!603805 (or (not (= (size!25516 (_values!5246 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25750 thiss!1181)))) (not (= (size!25515 (_keys!9944 thiss!1181)) (size!25516 (_values!5246 thiss!1181)))) (bvslt (mask!25750 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4955 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4955 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19702 (array!52130) Bool)

(declare-fun array_inv!19703 (array!52132) Bool)

(assert (=> b!891199 (= e!497246 (and tp!55210 tp_is_empty!18075 (array_inv!19702 (_keys!9944 thiss!1181)) (array_inv!19703 (_values!5246 thiss!1181)) e!497244))))

(declare-fun b!891200 () Bool)

(assert (=> b!891200 (= e!497243 (not e!497249))))

(declare-fun res!603800 () Bool)

(assert (=> b!891200 (=> res!603800 e!497249)))

(get-info :version)

(assert (=> b!891200 (= res!603800 (not ((_ is Found!8818) lt!402574)))))

(assert (=> b!891200 e!497242))

(declare-fun res!603806 () Bool)

(assert (=> b!891200 (=> res!603806 e!497242)))

(assert (=> b!891200 (= res!603806 (not ((_ is Found!8818) lt!402574)))))

(declare-fun lt!402571 () Unit!30332)

(declare-fun lemmaSeekEntryGivesInRangeIndex!23 (array!52130 array!52132 (_ BitVec 32) (_ BitVec 32) V!29065 V!29065 (_ BitVec 64)) Unit!30332)

(assert (=> b!891200 (= lt!402571 (lemmaSeekEntryGivesInRangeIndex!23 (_keys!9944 thiss!1181) (_values!5246 thiss!1181) (mask!25750 thiss!1181) (extraKeys!4955 thiss!1181) (zeroValue!5059 thiss!1181) (minValue!5059 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52130 (_ BitVec 32)) SeekEntryResult!8818)

(assert (=> b!891200 (= lt!402574 (seekEntry!0 key!785 (_keys!9944 thiss!1181) (mask!25750 thiss!1181)))))

(declare-fun b!891201 () Bool)

(assert (=> b!891201 (= e!497248 true)))

(declare-fun lt!402573 () Bool)

(declare-datatypes ((List!17735 0))(
  ( (Nil!17732) (Cons!17731 (h!18862 (_ BitVec 64)) (t!25034 List!17735)) )
))
(declare-fun arrayNoDuplicates!0 (array!52130 (_ BitVec 32) List!17735) Bool)

(assert (=> b!891201 (= lt!402573 (arrayNoDuplicates!0 (_keys!9944 thiss!1181) #b00000000000000000000000000000000 Nil!17732))))

(assert (= (and start!75776 res!603801) b!891197))

(assert (= (and b!891197 res!603802) b!891200))

(assert (= (and b!891200 (not res!603806)) b!891192))

(assert (= (and b!891200 (not res!603800)) b!891191))

(assert (= (and b!891191 (not res!603804)) b!891198))

(assert (= (and b!891198 (not res!603805)) b!891193))

(assert (= (and b!891193 (not res!603803)) b!891201))

(assert (= (and b!891195 condMapEmpty!28667) mapIsEmpty!28667))

(assert (= (and b!891195 (not condMapEmpty!28667)) mapNonEmpty!28667))

(assert (= (and mapNonEmpty!28667 ((_ is ValueCellFull!8556) mapValue!28667)) b!891194))

(assert (= (and b!891195 ((_ is ValueCellFull!8556) mapDefault!28667)) b!891196))

(assert (= b!891199 b!891195))

(assert (= start!75776 b!891199))

(declare-fun m!829533 () Bool)

(assert (=> b!891201 m!829533))

(declare-fun m!829535 () Bool)

(assert (=> b!891191 m!829535))

(declare-fun m!829537 () Bool)

(assert (=> b!891191 m!829537))

(declare-fun m!829539 () Bool)

(assert (=> b!891191 m!829539))

(declare-fun m!829541 () Bool)

(assert (=> start!75776 m!829541))

(declare-fun m!829543 () Bool)

(assert (=> mapNonEmpty!28667 m!829543))

(declare-fun m!829545 () Bool)

(assert (=> b!891192 m!829545))

(declare-fun m!829547 () Bool)

(assert (=> b!891199 m!829547))

(declare-fun m!829549 () Bool)

(assert (=> b!891199 m!829549))

(declare-fun m!829551 () Bool)

(assert (=> b!891200 m!829551))

(declare-fun m!829553 () Bool)

(assert (=> b!891200 m!829553))

(declare-fun m!829555 () Bool)

(assert (=> b!891193 m!829555))

(check-sat (not b!891191) (not b_next!15747) (not b!891199) tp_is_empty!18075 (not mapNonEmpty!28667) b_and!25987 (not b!891201) (not b!891193) (not start!75776) (not b!891192) (not b!891200))
(check-sat b_and!25987 (not b_next!15747))
