; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16762 () Bool)

(assert start!16762)

(declare-fun b!168405 () Bool)

(declare-fun b_free!4063 () Bool)

(declare-fun b_next!4063 () Bool)

(assert (=> b!168405 (= b_free!4063 (not b_next!4063))))

(declare-fun tp!14789 () Bool)

(declare-fun b_and!10451 () Bool)

(assert (=> b!168405 (= tp!14789 b_and!10451)))

(declare-fun b!168393 () Bool)

(declare-fun e!110715 () Bool)

(declare-fun e!110709 () Bool)

(assert (=> b!168393 (= e!110715 (not e!110709))))

(declare-fun res!80143 () Bool)

(assert (=> b!168393 (=> res!80143 e!110709)))

(declare-datatypes ((V!4801 0))(
  ( (V!4802 (val!1977 Int)) )
))
(declare-datatypes ((ValueCell!1589 0))(
  ( (ValueCellFull!1589 (v!3836 V!4801)) (EmptyCell!1589) )
))
(declare-datatypes ((array!6807 0))(
  ( (array!6808 (arr!3238 (Array (_ BitVec 32) (_ BitVec 64))) (size!3527 (_ BitVec 32))) )
))
(declare-datatypes ((array!6809 0))(
  ( (array!6810 (arr!3239 (Array (_ BitVec 32) ValueCell!1589)) (size!3528 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2086 0))(
  ( (LongMapFixedSize!2087 (defaultEntry!3485 Int) (mask!8251 (_ BitVec 32)) (extraKeys!3226 (_ BitVec 32)) (zeroValue!3328 V!4801) (minValue!3328 V!4801) (_size!1092 (_ BitVec 32)) (_keys!5309 array!6807) (_values!3468 array!6809) (_vacant!1092 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2086)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168393 (= res!80143 (not (validMask!0 (mask!8251 thiss!1248))))))

(declare-datatypes ((SeekEntryResult!515 0))(
  ( (MissingZero!515 (index!4228 (_ BitVec 32))) (Found!515 (index!4229 (_ BitVec 32))) (Intermediate!515 (undefined!1327 Bool) (index!4230 (_ BitVec 32)) (x!18638 (_ BitVec 32))) (Undefined!515) (MissingVacant!515 (index!4231 (_ BitVec 32))) )
))
(declare-fun lt!84102 () SeekEntryResult!515)

(declare-datatypes ((tuple2!3174 0))(
  ( (tuple2!3175 (_1!1598 (_ BitVec 64)) (_2!1598 V!4801)) )
))
(declare-datatypes ((List!2175 0))(
  ( (Nil!2172) (Cons!2171 (h!2788 tuple2!3174) (t!6968 List!2175)) )
))
(declare-datatypes ((ListLongMap!2117 0))(
  ( (ListLongMap!2118 (toList!1074 List!2175)) )
))
(declare-fun lt!84104 () ListLongMap!2117)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun v!309 () V!4801)

(declare-fun +!225 (ListLongMap!2117 tuple2!3174) ListLongMap!2117)

(declare-fun getCurrentListMap!716 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) Int) ListLongMap!2117)

(assert (=> b!168393 (= (+!225 lt!84104 (tuple2!3175 key!828 v!309)) (getCurrentListMap!716 (_keys!5309 thiss!1248) (array!6810 (store (arr!3239 (_values!3468 thiss!1248)) (index!4229 lt!84102) (ValueCellFull!1589 v!309)) (size!3528 (_values!3468 thiss!1248))) (mask!8251 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-datatypes ((Unit!5168 0))(
  ( (Unit!5169) )
))
(declare-fun lt!84105 () Unit!5168)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!97 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 32) (_ BitVec 64) V!4801 Int) Unit!5168)

(assert (=> b!168393 (= lt!84105 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!97 (_keys!5309 thiss!1248) (_values!3468 thiss!1248) (mask!8251 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) (index!4229 lt!84102) key!828 v!309 (defaultEntry!3485 thiss!1248)))))

(declare-fun lt!84103 () Unit!5168)

(declare-fun e!110714 () Unit!5168)

(assert (=> b!168393 (= lt!84103 e!110714)))

(declare-fun c!30350 () Bool)

(declare-fun contains!1119 (ListLongMap!2117 (_ BitVec 64)) Bool)

(assert (=> b!168393 (= c!30350 (contains!1119 lt!84104 key!828))))

(assert (=> b!168393 (= lt!84104 (getCurrentListMap!716 (_keys!5309 thiss!1248) (_values!3468 thiss!1248) (mask!8251 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3485 thiss!1248)))))

(declare-fun res!80138 () Bool)

(declare-fun e!110716 () Bool)

(assert (=> start!16762 (=> (not res!80138) (not e!110716))))

(declare-fun valid!918 (LongMapFixedSize!2086) Bool)

(assert (=> start!16762 (= res!80138 (valid!918 thiss!1248))))

(assert (=> start!16762 e!110716))

(declare-fun e!110712 () Bool)

(assert (=> start!16762 e!110712))

(assert (=> start!16762 true))

(declare-fun tp_is_empty!3865 () Bool)

(assert (=> start!16762 tp_is_empty!3865))

(declare-fun b!168394 () Bool)

(declare-fun Unit!5170 () Unit!5168)

(assert (=> b!168394 (= e!110714 Unit!5170)))

(declare-fun lt!84101 () Unit!5168)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!122 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 64) Int) Unit!5168)

(assert (=> b!168394 (= lt!84101 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!122 (_keys!5309 thiss!1248) (_values!3468 thiss!1248) (mask!8251 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) key!828 (defaultEntry!3485 thiss!1248)))))

(assert (=> b!168394 false))

(declare-fun b!168395 () Bool)

(declare-fun e!110713 () Bool)

(assert (=> b!168395 (= e!110713 tp_is_empty!3865)))

(declare-fun b!168396 () Bool)

(declare-fun res!80141 () Bool)

(assert (=> b!168396 (=> (not res!80141) (not e!110716))))

(assert (=> b!168396 (= res!80141 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168397 () Bool)

(declare-fun e!110710 () Bool)

(declare-fun mapRes!6516 () Bool)

(assert (=> b!168397 (= e!110710 (and e!110713 mapRes!6516))))

(declare-fun condMapEmpty!6516 () Bool)

(declare-fun mapDefault!6516 () ValueCell!1589)

(assert (=> b!168397 (= condMapEmpty!6516 (= (arr!3239 (_values!3468 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1589)) mapDefault!6516)))))

(declare-fun mapIsEmpty!6516 () Bool)

(assert (=> mapIsEmpty!6516 mapRes!6516))

(declare-fun b!168398 () Bool)

(declare-fun lt!84099 () Unit!5168)

(assert (=> b!168398 (= e!110714 lt!84099)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (array!6807 array!6809 (_ BitVec 32) (_ BitVec 32) V!4801 V!4801 (_ BitVec 64) Int) Unit!5168)

(assert (=> b!168398 (= lt!84099 (lemmaInListMapThenSeekEntryOrOpenFindsIt!125 (_keys!5309 thiss!1248) (_values!3468 thiss!1248) (mask!8251 thiss!1248) (extraKeys!3226 thiss!1248) (zeroValue!3328 thiss!1248) (minValue!3328 thiss!1248) key!828 (defaultEntry!3485 thiss!1248)))))

(declare-fun res!80137 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168398 (= res!80137 (inRange!0 (index!4229 lt!84102) (mask!8251 thiss!1248)))))

(declare-fun e!110717 () Bool)

(assert (=> b!168398 (=> (not res!80137) (not e!110717))))

(assert (=> b!168398 e!110717))

(declare-fun b!168399 () Bool)

(declare-fun res!80142 () Bool)

(assert (=> b!168399 (=> res!80142 e!110709)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6807 (_ BitVec 32)) Bool)

(assert (=> b!168399 (= res!80142 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5309 thiss!1248) (mask!8251 thiss!1248))))))

(declare-fun mapNonEmpty!6516 () Bool)

(declare-fun tp!14790 () Bool)

(declare-fun e!110711 () Bool)

(assert (=> mapNonEmpty!6516 (= mapRes!6516 (and tp!14790 e!110711))))

(declare-fun mapValue!6516 () ValueCell!1589)

(declare-fun mapRest!6516 () (Array (_ BitVec 32) ValueCell!1589))

(declare-fun mapKey!6516 () (_ BitVec 32))

(assert (=> mapNonEmpty!6516 (= (arr!3239 (_values!3468 thiss!1248)) (store mapRest!6516 mapKey!6516 mapValue!6516))))

(declare-fun b!168400 () Bool)

(assert (=> b!168400 (= e!110717 (= (select (arr!3238 (_keys!5309 thiss!1248)) (index!4229 lt!84102)) key!828))))

(declare-fun b!168401 () Bool)

(assert (=> b!168401 (= e!110709 true)))

(declare-fun lt!84100 () Bool)

(declare-datatypes ((List!2176 0))(
  ( (Nil!2173) (Cons!2172 (h!2789 (_ BitVec 64)) (t!6969 List!2176)) )
))
(declare-fun arrayNoDuplicates!0 (array!6807 (_ BitVec 32) List!2176) Bool)

(assert (=> b!168401 (= lt!84100 (arrayNoDuplicates!0 (_keys!5309 thiss!1248) #b00000000000000000000000000000000 Nil!2173))))

(declare-fun b!168402 () Bool)

(assert (=> b!168402 (= e!110716 e!110715)))

(declare-fun res!80140 () Bool)

(assert (=> b!168402 (=> (not res!80140) (not e!110715))))

(get-info :version)

(assert (=> b!168402 (= res!80140 (and (not ((_ is Undefined!515) lt!84102)) (not ((_ is MissingVacant!515) lt!84102)) (not ((_ is MissingZero!515) lt!84102)) ((_ is Found!515) lt!84102)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6807 (_ BitVec 32)) SeekEntryResult!515)

(assert (=> b!168402 (= lt!84102 (seekEntryOrOpen!0 key!828 (_keys!5309 thiss!1248) (mask!8251 thiss!1248)))))

(declare-fun b!168403 () Bool)

(declare-fun res!80139 () Bool)

(assert (=> b!168403 (=> res!80139 e!110709)))

(assert (=> b!168403 (= res!80139 (or (not (= (size!3528 (_values!3468 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8251 thiss!1248)))) (not (= (size!3527 (_keys!5309 thiss!1248)) (size!3528 (_values!3468 thiss!1248)))) (bvslt (mask!8251 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3226 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3226 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!168404 () Bool)

(assert (=> b!168404 (= e!110711 tp_is_empty!3865)))

(declare-fun array_inv!2083 (array!6807) Bool)

(declare-fun array_inv!2084 (array!6809) Bool)

(assert (=> b!168405 (= e!110712 (and tp!14789 tp_is_empty!3865 (array_inv!2083 (_keys!5309 thiss!1248)) (array_inv!2084 (_values!3468 thiss!1248)) e!110710))))

(assert (= (and start!16762 res!80138) b!168396))

(assert (= (and b!168396 res!80141) b!168402))

(assert (= (and b!168402 res!80140) b!168393))

(assert (= (and b!168393 c!30350) b!168398))

(assert (= (and b!168393 (not c!30350)) b!168394))

(assert (= (and b!168398 res!80137) b!168400))

(assert (= (and b!168393 (not res!80143)) b!168403))

(assert (= (and b!168403 (not res!80139)) b!168399))

(assert (= (and b!168399 (not res!80142)) b!168401))

(assert (= (and b!168397 condMapEmpty!6516) mapIsEmpty!6516))

(assert (= (and b!168397 (not condMapEmpty!6516)) mapNonEmpty!6516))

(assert (= (and mapNonEmpty!6516 ((_ is ValueCellFull!1589) mapValue!6516)) b!168404))

(assert (= (and b!168397 ((_ is ValueCellFull!1589) mapDefault!6516)) b!168395))

(assert (= b!168405 b!168397))

(assert (= start!16762 b!168405))

(declare-fun m!196987 () Bool)

(assert (=> b!168405 m!196987))

(declare-fun m!196989 () Bool)

(assert (=> b!168405 m!196989))

(declare-fun m!196991 () Bool)

(assert (=> b!168394 m!196991))

(declare-fun m!196993 () Bool)

(assert (=> b!168400 m!196993))

(declare-fun m!196995 () Bool)

(assert (=> b!168398 m!196995))

(declare-fun m!196997 () Bool)

(assert (=> b!168398 m!196997))

(declare-fun m!196999 () Bool)

(assert (=> start!16762 m!196999))

(declare-fun m!197001 () Bool)

(assert (=> b!168402 m!197001))

(declare-fun m!197003 () Bool)

(assert (=> b!168393 m!197003))

(declare-fun m!197005 () Bool)

(assert (=> b!168393 m!197005))

(declare-fun m!197007 () Bool)

(assert (=> b!168393 m!197007))

(declare-fun m!197009 () Bool)

(assert (=> b!168393 m!197009))

(declare-fun m!197011 () Bool)

(assert (=> b!168393 m!197011))

(declare-fun m!197013 () Bool)

(assert (=> b!168393 m!197013))

(declare-fun m!197015 () Bool)

(assert (=> b!168393 m!197015))

(declare-fun m!197017 () Bool)

(assert (=> b!168401 m!197017))

(declare-fun m!197019 () Bool)

(assert (=> b!168399 m!197019))

(declare-fun m!197021 () Bool)

(assert (=> mapNonEmpty!6516 m!197021))

(check-sat (not b!168393) (not b_next!4063) (not b!168399) b_and!10451 (not b!168398) (not b!168394) (not b!168402) tp_is_empty!3865 (not start!16762) (not mapNonEmpty!6516) (not b!168405) (not b!168401))
(check-sat b_and!10451 (not b_next!4063))
