; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16684 () Bool)

(assert start!16684)

(declare-fun b!167068 () Bool)

(declare-fun b_free!3985 () Bool)

(declare-fun b_next!3985 () Bool)

(assert (=> b!167068 (= b_free!3985 (not b_next!3985))))

(declare-fun tp!14555 () Bool)

(declare-fun b_and!10413 () Bool)

(assert (=> b!167068 (= tp!14555 b_and!10413)))

(declare-fun b!167066 () Bool)

(declare-fun res!79440 () Bool)

(declare-fun e!109672 () Bool)

(assert (=> b!167066 (=> (not res!79440) (not e!109672))))

(declare-datatypes ((V!4697 0))(
  ( (V!4698 (val!1938 Int)) )
))
(declare-datatypes ((ValueCell!1550 0))(
  ( (ValueCellFull!1550 (v!3804 V!4697)) (EmptyCell!1550) )
))
(declare-datatypes ((array!6657 0))(
  ( (array!6658 (arr!3164 (Array (_ BitVec 32) (_ BitVec 64))) (size!3452 (_ BitVec 32))) )
))
(declare-datatypes ((array!6659 0))(
  ( (array!6660 (arr!3165 (Array (_ BitVec 32) ValueCell!1550)) (size!3453 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2008 0))(
  ( (LongMapFixedSize!2009 (defaultEntry!3446 Int) (mask!8187 (_ BitVec 32)) (extraKeys!3187 (_ BitVec 32)) (zeroValue!3289 V!4697) (minValue!3289 V!4697) (_size!1053 (_ BitVec 32)) (_keys!5271 array!6657) (_values!3429 array!6659) (_vacant!1053 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2008)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6657 (_ BitVec 32)) Bool)

(assert (=> b!167066 (= res!79440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5271 thiss!1248) (mask!8187 thiss!1248)))))

(declare-fun b!167067 () Bool)

(declare-fun e!109667 () Bool)

(declare-fun e!109664 () Bool)

(declare-fun mapRes!6399 () Bool)

(assert (=> b!167067 (= e!109667 (and e!109664 mapRes!6399))))

(declare-fun condMapEmpty!6399 () Bool)

(declare-fun mapDefault!6399 () ValueCell!1550)

(assert (=> b!167067 (= condMapEmpty!6399 (= (arr!3165 (_values!3429 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1550)) mapDefault!6399)))))

(declare-fun tp_is_empty!3787 () Bool)

(declare-fun e!109673 () Bool)

(declare-fun array_inv!2023 (array!6657) Bool)

(declare-fun array_inv!2024 (array!6659) Bool)

(assert (=> b!167068 (= e!109673 (and tp!14555 tp_is_empty!3787 (array_inv!2023 (_keys!5271 thiss!1248)) (array_inv!2024 (_values!3429 thiss!1248)) e!109667))))

(declare-datatypes ((SeekEntryResult!464 0))(
  ( (MissingZero!464 (index!4024 (_ BitVec 32))) (Found!464 (index!4025 (_ BitVec 32))) (Intermediate!464 (undefined!1276 Bool) (index!4026 (_ BitVec 32)) (x!18484 (_ BitVec 32))) (Undefined!464) (MissingVacant!464 (index!4027 (_ BitVec 32))) )
))
(declare-fun lt!83591 () SeekEntryResult!464)

(declare-fun b!167069 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!109669 () Bool)

(assert (=> b!167069 (= e!109669 (= (select (arr!3164 (_keys!5271 thiss!1248)) (index!4025 lt!83591)) key!828))))

(declare-fun b!167070 () Bool)

(declare-fun e!109668 () Bool)

(assert (=> b!167070 (= e!109668 e!109672)))

(declare-fun res!79435 () Bool)

(assert (=> b!167070 (=> (not res!79435) (not e!109672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167070 (= res!79435 (validMask!0 (mask!8187 thiss!1248)))))

(declare-datatypes ((Unit!5113 0))(
  ( (Unit!5114) )
))
(declare-fun lt!83590 () Unit!5113)

(declare-fun e!109665 () Unit!5113)

(assert (=> b!167070 (= lt!83590 e!109665)))

(declare-fun c!30272 () Bool)

(declare-datatypes ((tuple2!3082 0))(
  ( (tuple2!3083 (_1!1552 (_ BitVec 64)) (_2!1552 V!4697)) )
))
(declare-datatypes ((List!2098 0))(
  ( (Nil!2095) (Cons!2094 (h!2711 tuple2!3082) (t!6892 List!2098)) )
))
(declare-datatypes ((ListLongMap!2043 0))(
  ( (ListLongMap!2044 (toList!1037 List!2098)) )
))
(declare-fun contains!1089 (ListLongMap!2043 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!699 (array!6657 array!6659 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 32) Int) ListLongMap!2043)

(assert (=> b!167070 (= c!30272 (contains!1089 (getCurrentListMap!699 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3446 thiss!1248)) key!828))))

(declare-fun b!167071 () Bool)

(declare-fun res!79434 () Bool)

(assert (=> b!167071 (=> (not res!79434) (not e!109672))))

(assert (=> b!167071 (= res!79434 (and (= (size!3453 (_values!3429 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8187 thiss!1248))) (= (size!3452 (_keys!5271 thiss!1248)) (size!3453 (_values!3429 thiss!1248))) (bvsge (mask!8187 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3187 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3187 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!167072 () Bool)

(declare-fun res!79437 () Bool)

(declare-fun e!109671 () Bool)

(assert (=> b!167072 (=> (not res!79437) (not e!109671))))

(assert (=> b!167072 (= res!79437 (not (= key!828 (bvneg key!828))))))

(declare-fun b!167073 () Bool)

(assert (=> b!167073 (= e!109664 tp_is_empty!3787)))

(declare-fun mapNonEmpty!6399 () Bool)

(declare-fun tp!14556 () Bool)

(declare-fun e!109666 () Bool)

(assert (=> mapNonEmpty!6399 (= mapRes!6399 (and tp!14556 e!109666))))

(declare-fun mapValue!6399 () ValueCell!1550)

(declare-fun mapKey!6399 () (_ BitVec 32))

(declare-fun mapRest!6399 () (Array (_ BitVec 32) ValueCell!1550))

(assert (=> mapNonEmpty!6399 (= (arr!3165 (_values!3429 thiss!1248)) (store mapRest!6399 mapKey!6399 mapValue!6399))))

(declare-fun mapIsEmpty!6399 () Bool)

(assert (=> mapIsEmpty!6399 mapRes!6399))

(declare-fun b!167074 () Bool)

(declare-fun lt!83588 () Unit!5113)

(assert (=> b!167074 (= e!109665 lt!83588)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!101 (array!6657 array!6659 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5113)

(assert (=> b!167074 (= lt!83588 (lemmaInListMapThenSeekEntryOrOpenFindsIt!101 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(declare-fun res!79438 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167074 (= res!79438 (inRange!0 (index!4025 lt!83591) (mask!8187 thiss!1248)))))

(assert (=> b!167074 (=> (not res!79438) (not e!109669))))

(assert (=> b!167074 e!109669))

(declare-fun b!167075 () Bool)

(declare-fun Unit!5115 () Unit!5113)

(assert (=> b!167075 (= e!109665 Unit!5115)))

(declare-fun lt!83592 () Unit!5113)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (array!6657 array!6659 (_ BitVec 32) (_ BitVec 32) V!4697 V!4697 (_ BitVec 64) Int) Unit!5113)

(assert (=> b!167075 (= lt!83592 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!97 (_keys!5271 thiss!1248) (_values!3429 thiss!1248) (mask!8187 thiss!1248) (extraKeys!3187 thiss!1248) (zeroValue!3289 thiss!1248) (minValue!3289 thiss!1248) key!828 (defaultEntry!3446 thiss!1248)))))

(assert (=> b!167075 false))

(declare-fun b!167076 () Bool)

(assert (=> b!167076 (= e!109672 false)))

(declare-fun lt!83589 () Bool)

(declare-datatypes ((List!2099 0))(
  ( (Nil!2096) (Cons!2095 (h!2712 (_ BitVec 64)) (t!6893 List!2099)) )
))
(declare-fun arrayNoDuplicates!0 (array!6657 (_ BitVec 32) List!2099) Bool)

(assert (=> b!167076 (= lt!83589 (arrayNoDuplicates!0 (_keys!5271 thiss!1248) #b00000000000000000000000000000000 Nil!2096))))

(declare-fun res!79436 () Bool)

(assert (=> start!16684 (=> (not res!79436) (not e!109671))))

(declare-fun valid!890 (LongMapFixedSize!2008) Bool)

(assert (=> start!16684 (= res!79436 (valid!890 thiss!1248))))

(assert (=> start!16684 e!109671))

(assert (=> start!16684 e!109673))

(assert (=> start!16684 true))

(declare-fun b!167077 () Bool)

(assert (=> b!167077 (= e!109671 e!109668)))

(declare-fun res!79439 () Bool)

(assert (=> b!167077 (=> (not res!79439) (not e!109668))))

(get-info :version)

(assert (=> b!167077 (= res!79439 (and (not ((_ is Undefined!464) lt!83591)) (not ((_ is MissingVacant!464) lt!83591)) (not ((_ is MissingZero!464) lt!83591)) ((_ is Found!464) lt!83591)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6657 (_ BitVec 32)) SeekEntryResult!464)

(assert (=> b!167077 (= lt!83591 (seekEntryOrOpen!0 key!828 (_keys!5271 thiss!1248) (mask!8187 thiss!1248)))))

(declare-fun b!167078 () Bool)

(assert (=> b!167078 (= e!109666 tp_is_empty!3787)))

(assert (= (and start!16684 res!79436) b!167072))

(assert (= (and b!167072 res!79437) b!167077))

(assert (= (and b!167077 res!79439) b!167070))

(assert (= (and b!167070 c!30272) b!167074))

(assert (= (and b!167070 (not c!30272)) b!167075))

(assert (= (and b!167074 res!79438) b!167069))

(assert (= (and b!167070 res!79435) b!167071))

(assert (= (and b!167071 res!79434) b!167066))

(assert (= (and b!167066 res!79440) b!167076))

(assert (= (and b!167067 condMapEmpty!6399) mapIsEmpty!6399))

(assert (= (and b!167067 (not condMapEmpty!6399)) mapNonEmpty!6399))

(assert (= (and mapNonEmpty!6399 ((_ is ValueCellFull!1550) mapValue!6399)) b!167078))

(assert (= (and b!167067 ((_ is ValueCellFull!1550) mapDefault!6399)) b!167073))

(assert (= b!167068 b!167067))

(assert (= start!16684 b!167068))

(declare-fun m!196481 () Bool)

(assert (=> b!167076 m!196481))

(declare-fun m!196483 () Bool)

(assert (=> b!167068 m!196483))

(declare-fun m!196485 () Bool)

(assert (=> b!167068 m!196485))

(declare-fun m!196487 () Bool)

(assert (=> b!167070 m!196487))

(declare-fun m!196489 () Bool)

(assert (=> b!167070 m!196489))

(assert (=> b!167070 m!196489))

(declare-fun m!196491 () Bool)

(assert (=> b!167070 m!196491))

(declare-fun m!196493 () Bool)

(assert (=> mapNonEmpty!6399 m!196493))

(declare-fun m!196495 () Bool)

(assert (=> b!167066 m!196495))

(declare-fun m!196497 () Bool)

(assert (=> b!167075 m!196497))

(declare-fun m!196499 () Bool)

(assert (=> b!167077 m!196499))

(declare-fun m!196501 () Bool)

(assert (=> b!167069 m!196501))

(declare-fun m!196503 () Bool)

(assert (=> b!167074 m!196503))

(declare-fun m!196505 () Bool)

(assert (=> b!167074 m!196505))

(declare-fun m!196507 () Bool)

(assert (=> start!16684 m!196507))

(check-sat (not b!167075) b_and!10413 (not b!167077) (not b!167074) tp_is_empty!3787 (not b!167066) (not b!167070) (not b!167068) (not b_next!3985) (not b!167076) (not start!16684) (not mapNonEmpty!6399))
(check-sat b_and!10413 (not b_next!3985))
