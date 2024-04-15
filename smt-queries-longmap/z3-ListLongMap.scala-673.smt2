; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16546 () Bool)

(assert start!16546)

(declare-fun b!164471 () Bool)

(declare-fun b_free!3847 () Bool)

(declare-fun b_next!3847 () Bool)

(assert (=> b!164471 (= b_free!3847 (not b_next!3847))))

(declare-fun tp!14141 () Bool)

(declare-fun b_and!10235 () Bool)

(assert (=> b!164471 (= tp!14141 b_and!10235)))

(declare-fun b!164465 () Bool)

(declare-fun e!107898 () Bool)

(assert (=> b!164465 (= e!107898 false)))

(declare-fun lt!82739 () Bool)

(declare-datatypes ((V!4513 0))(
  ( (V!4514 (val!1869 Int)) )
))
(declare-datatypes ((ValueCell!1481 0))(
  ( (ValueCellFull!1481 (v!3728 V!4513)) (EmptyCell!1481) )
))
(declare-datatypes ((array!6375 0))(
  ( (array!6376 (arr!3022 (Array (_ BitVec 32) (_ BitVec 64))) (size!3311 (_ BitVec 32))) )
))
(declare-datatypes ((array!6377 0))(
  ( (array!6378 (arr!3023 (Array (_ BitVec 32) ValueCell!1481)) (size!3312 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1870 0))(
  ( (LongMapFixedSize!1871 (defaultEntry!3377 Int) (mask!8071 (_ BitVec 32)) (extraKeys!3118 (_ BitVec 32)) (zeroValue!3220 V!4513) (minValue!3220 V!4513) (_size!984 (_ BitVec 32)) (_keys!5201 array!6375) (_values!3360 array!6377) (_vacant!984 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1870)

(declare-datatypes ((List!2024 0))(
  ( (Nil!2021) (Cons!2020 (h!2637 (_ BitVec 64)) (t!6817 List!2024)) )
))
(declare-fun arrayNoDuplicates!0 (array!6375 (_ BitVec 32) List!2024) Bool)

(assert (=> b!164465 (= lt!82739 (arrayNoDuplicates!0 (_keys!5201 thiss!1248) #b00000000000000000000000000000000 Nil!2021))))

(declare-fun mapIsEmpty!6192 () Bool)

(declare-fun mapRes!6192 () Bool)

(assert (=> mapIsEmpty!6192 mapRes!6192))

(declare-fun b!164466 () Bool)

(declare-fun res!77870 () Bool)

(assert (=> b!164466 (=> (not res!77870) (not e!107898))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3024 0))(
  ( (tuple2!3025 (_1!1523 (_ BitVec 64)) (_2!1523 V!4513)) )
))
(declare-datatypes ((List!2025 0))(
  ( (Nil!2022) (Cons!2021 (h!2638 tuple2!3024) (t!6818 List!2025)) )
))
(declare-datatypes ((ListLongMap!1967 0))(
  ( (ListLongMap!1968 (toList!999 List!2025)) )
))
(declare-fun contains!1044 (ListLongMap!1967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!641 (array!6375 array!6377 (_ BitVec 32) (_ BitVec 32) V!4513 V!4513 (_ BitVec 32) Int) ListLongMap!1967)

(assert (=> b!164466 (= res!77870 (contains!1044 (getCurrentListMap!641 (_keys!5201 thiss!1248) (_values!3360 thiss!1248) (mask!8071 thiss!1248) (extraKeys!3118 thiss!1248) (zeroValue!3220 thiss!1248) (minValue!3220 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3377 thiss!1248)) key!828))))

(declare-fun mapNonEmpty!6192 () Bool)

(declare-fun tp!14142 () Bool)

(declare-fun e!107901 () Bool)

(assert (=> mapNonEmpty!6192 (= mapRes!6192 (and tp!14142 e!107901))))

(declare-fun mapRest!6192 () (Array (_ BitVec 32) ValueCell!1481))

(declare-fun mapKey!6192 () (_ BitVec 32))

(declare-fun mapValue!6192 () ValueCell!1481)

(assert (=> mapNonEmpty!6192 (= (arr!3023 (_values!3360 thiss!1248)) (store mapRest!6192 mapKey!6192 mapValue!6192))))

(declare-fun b!164467 () Bool)

(declare-fun e!107900 () Bool)

(declare-fun tp_is_empty!3649 () Bool)

(assert (=> b!164467 (= e!107900 tp_is_empty!3649)))

(declare-fun b!164468 () Bool)

(declare-fun res!77872 () Bool)

(declare-fun e!107899 () Bool)

(assert (=> b!164468 (=> (not res!77872) (not e!107899))))

(assert (=> b!164468 (= res!77872 (not (= key!828 (bvneg key!828))))))

(declare-fun res!77875 () Bool)

(assert (=> start!16546 (=> (not res!77875) (not e!107899))))

(declare-fun valid!837 (LongMapFixedSize!1870) Bool)

(assert (=> start!16546 (= res!77875 (valid!837 thiss!1248))))

(assert (=> start!16546 e!107899))

(declare-fun e!107897 () Bool)

(assert (=> start!16546 e!107897))

(assert (=> start!16546 true))

(declare-fun b!164469 () Bool)

(declare-fun res!77869 () Bool)

(assert (=> b!164469 (=> (not res!77869) (not e!107898))))

(assert (=> b!164469 (= res!77869 (and (= (size!3312 (_values!3360 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8071 thiss!1248))) (= (size!3311 (_keys!5201 thiss!1248)) (size!3312 (_values!3360 thiss!1248))) (bvsge (mask!8071 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3118 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3118 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164470 () Bool)

(declare-fun res!77874 () Bool)

(assert (=> b!164470 (=> (not res!77874) (not e!107898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164470 (= res!77874 (validMask!0 (mask!8071 thiss!1248)))))

(declare-fun e!107896 () Bool)

(declare-fun array_inv!1947 (array!6375) Bool)

(declare-fun array_inv!1948 (array!6377) Bool)

(assert (=> b!164471 (= e!107897 (and tp!14141 tp_is_empty!3649 (array_inv!1947 (_keys!5201 thiss!1248)) (array_inv!1948 (_values!3360 thiss!1248)) e!107896))))

(declare-fun b!164472 () Bool)

(assert (=> b!164472 (= e!107896 (and e!107900 mapRes!6192))))

(declare-fun condMapEmpty!6192 () Bool)

(declare-fun mapDefault!6192 () ValueCell!1481)

(assert (=> b!164472 (= condMapEmpty!6192 (= (arr!3023 (_values!3360 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1481)) mapDefault!6192)))))

(declare-fun b!164473 () Bool)

(assert (=> b!164473 (= e!107901 tp_is_empty!3649)))

(declare-fun b!164474 () Bool)

(declare-fun res!77873 () Bool)

(assert (=> b!164474 (=> (not res!77873) (not e!107898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6375 (_ BitVec 32)) Bool)

(assert (=> b!164474 (= res!77873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5201 thiss!1248) (mask!8071 thiss!1248)))))

(declare-fun b!164475 () Bool)

(assert (=> b!164475 (= e!107899 e!107898)))

(declare-fun res!77871 () Bool)

(assert (=> b!164475 (=> (not res!77871) (not e!107898))))

(declare-datatypes ((SeekEntryResult!429 0))(
  ( (MissingZero!429 (index!3884 (_ BitVec 32))) (Found!429 (index!3885 (_ BitVec 32))) (Intermediate!429 (undefined!1241 Bool) (index!3886 (_ BitVec 32)) (x!18264 (_ BitVec 32))) (Undefined!429) (MissingVacant!429 (index!3887 (_ BitVec 32))) )
))
(declare-fun lt!82740 () SeekEntryResult!429)

(get-info :version)

(assert (=> b!164475 (= res!77871 (and (not ((_ is Undefined!429) lt!82740)) (not ((_ is MissingVacant!429) lt!82740)) (not ((_ is MissingZero!429) lt!82740)) ((_ is Found!429) lt!82740)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6375 (_ BitVec 32)) SeekEntryResult!429)

(assert (=> b!164475 (= lt!82740 (seekEntryOrOpen!0 key!828 (_keys!5201 thiss!1248) (mask!8071 thiss!1248)))))

(assert (= (and start!16546 res!77875) b!164468))

(assert (= (and b!164468 res!77872) b!164475))

(assert (= (and b!164475 res!77871) b!164466))

(assert (= (and b!164466 res!77870) b!164470))

(assert (= (and b!164470 res!77874) b!164469))

(assert (= (and b!164469 res!77869) b!164474))

(assert (= (and b!164474 res!77873) b!164465))

(assert (= (and b!164472 condMapEmpty!6192) mapIsEmpty!6192))

(assert (= (and b!164472 (not condMapEmpty!6192)) mapNonEmpty!6192))

(assert (= (and mapNonEmpty!6192 ((_ is ValueCellFull!1481) mapValue!6192)) b!164473))

(assert (= (and b!164472 ((_ is ValueCellFull!1481) mapDefault!6192)) b!164467))

(assert (= b!164471 b!164472))

(assert (= start!16546 b!164471))

(declare-fun m!194131 () Bool)

(assert (=> b!164465 m!194131))

(declare-fun m!194133 () Bool)

(assert (=> b!164471 m!194133))

(declare-fun m!194135 () Bool)

(assert (=> b!164471 m!194135))

(declare-fun m!194137 () Bool)

(assert (=> mapNonEmpty!6192 m!194137))

(declare-fun m!194139 () Bool)

(assert (=> b!164474 m!194139))

(declare-fun m!194141 () Bool)

(assert (=> b!164466 m!194141))

(assert (=> b!164466 m!194141))

(declare-fun m!194143 () Bool)

(assert (=> b!164466 m!194143))

(declare-fun m!194145 () Bool)

(assert (=> b!164470 m!194145))

(declare-fun m!194147 () Bool)

(assert (=> start!16546 m!194147))

(declare-fun m!194149 () Bool)

(assert (=> b!164475 m!194149))

(check-sat b_and!10235 (not mapNonEmpty!6192) (not b!164466) (not b!164475) (not b!164474) (not start!16546) (not b_next!3847) tp_is_empty!3649 (not b!164470) (not b!164471) (not b!164465))
(check-sat b_and!10235 (not b_next!3847))
