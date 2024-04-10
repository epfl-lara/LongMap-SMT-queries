; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16136 () Bool)

(assert start!16136)

(declare-fun b!160656 () Bool)

(declare-fun b_free!3597 () Bool)

(declare-fun b_next!3597 () Bool)

(assert (=> b!160656 (= b_free!3597 (not b_next!3597))))

(declare-fun tp!13361 () Bool)

(declare-fun b_and!10011 () Bool)

(assert (=> b!160656 (= tp!13361 b_and!10011)))

(declare-fun b!160650 () Bool)

(declare-fun e!105020 () Bool)

(assert (=> b!160650 (= e!105020 false)))

(declare-fun lt!82108 () Bool)

(declare-datatypes ((V!4179 0))(
  ( (V!4180 (val!1744 Int)) )
))
(declare-datatypes ((ValueCell!1356 0))(
  ( (ValueCellFull!1356 (v!3609 V!4179)) (EmptyCell!1356) )
))
(declare-datatypes ((array!5877 0))(
  ( (array!5878 (arr!2783 (Array (_ BitVec 32) (_ BitVec 64))) (size!3067 (_ BitVec 32))) )
))
(declare-datatypes ((array!5879 0))(
  ( (array!5880 (arr!2784 (Array (_ BitVec 32) ValueCell!1356)) (size!3068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1620 0))(
  ( (LongMapFixedSize!1621 (defaultEntry!3252 Int) (mask!7826 (_ BitVec 32)) (extraKeys!2993 (_ BitVec 32)) (zeroValue!3095 V!4179) (minValue!3095 V!4179) (_size!859 (_ BitVec 32)) (_keys!5053 array!5877) (_values!3235 array!5879) (_vacant!859 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1620)

(declare-datatypes ((List!1951 0))(
  ( (Nil!1948) (Cons!1947 (h!2560 (_ BitVec 64)) (t!6753 List!1951)) )
))
(declare-fun arrayNoDuplicates!0 (array!5877 (_ BitVec 32) List!1951) Bool)

(assert (=> b!160650 (= lt!82108 (arrayNoDuplicates!0 (_keys!5053 thiss!1248) #b00000000000000000000000000000000 Nil!1948))))

(declare-fun res!76103 () Bool)

(assert (=> start!16136 (=> (not res!76103) (not e!105020))))

(declare-fun valid!750 (LongMapFixedSize!1620) Bool)

(assert (=> start!16136 (= res!76103 (valid!750 thiss!1248))))

(assert (=> start!16136 e!105020))

(declare-fun e!105024 () Bool)

(assert (=> start!16136 e!105024))

(assert (=> start!16136 true))

(declare-fun b!160651 () Bool)

(declare-fun res!76105 () Bool)

(assert (=> b!160651 (=> (not res!76105) (not e!105020))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!2928 0))(
  ( (tuple2!2929 (_1!1475 (_ BitVec 64)) (_2!1475 V!4179)) )
))
(declare-datatypes ((List!1952 0))(
  ( (Nil!1949) (Cons!1948 (h!2561 tuple2!2928) (t!6754 List!1952)) )
))
(declare-datatypes ((ListLongMap!1915 0))(
  ( (ListLongMap!1916 (toList!973 List!1952)) )
))
(declare-fun contains!1009 (ListLongMap!1915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!637 (array!5877 array!5879 (_ BitVec 32) (_ BitVec 32) V!4179 V!4179 (_ BitVec 32) Int) ListLongMap!1915)

(assert (=> b!160651 (= res!76105 (not (contains!1009 (getCurrentListMap!637 (_keys!5053 thiss!1248) (_values!3235 thiss!1248) (mask!7826 thiss!1248) (extraKeys!2993 thiss!1248) (zeroValue!3095 thiss!1248) (minValue!3095 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3252 thiss!1248)) key!828)))))

(declare-fun mapNonEmpty!5786 () Bool)

(declare-fun mapRes!5786 () Bool)

(declare-fun tp!13360 () Bool)

(declare-fun e!105023 () Bool)

(assert (=> mapNonEmpty!5786 (= mapRes!5786 (and tp!13360 e!105023))))

(declare-fun mapValue!5786 () ValueCell!1356)

(declare-fun mapKey!5786 () (_ BitVec 32))

(declare-fun mapRest!5786 () (Array (_ BitVec 32) ValueCell!1356))

(assert (=> mapNonEmpty!5786 (= (arr!2784 (_values!3235 thiss!1248)) (store mapRest!5786 mapKey!5786 mapValue!5786))))

(declare-fun b!160652 () Bool)

(declare-fun e!105022 () Bool)

(declare-fun tp_is_empty!3399 () Bool)

(assert (=> b!160652 (= e!105022 tp_is_empty!3399)))

(declare-fun b!160653 () Bool)

(declare-fun res!76102 () Bool)

(assert (=> b!160653 (=> (not res!76102) (not e!105020))))

(assert (=> b!160653 (= res!76102 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160654 () Bool)

(declare-fun e!105021 () Bool)

(assert (=> b!160654 (= e!105021 (and e!105022 mapRes!5786))))

(declare-fun condMapEmpty!5786 () Bool)

(declare-fun mapDefault!5786 () ValueCell!1356)

(assert (=> b!160654 (= condMapEmpty!5786 (= (arr!2784 (_values!3235 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1356)) mapDefault!5786)))))

(declare-fun b!160655 () Bool)

(declare-fun res!76104 () Bool)

(assert (=> b!160655 (=> (not res!76104) (not e!105020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160655 (= res!76104 (validMask!0 (mask!7826 thiss!1248)))))

(declare-fun array_inv!1777 (array!5877) Bool)

(declare-fun array_inv!1778 (array!5879) Bool)

(assert (=> b!160656 (= e!105024 (and tp!13361 tp_is_empty!3399 (array_inv!1777 (_keys!5053 thiss!1248)) (array_inv!1778 (_values!3235 thiss!1248)) e!105021))))

(declare-fun b!160657 () Bool)

(declare-fun res!76106 () Bool)

(assert (=> b!160657 (=> (not res!76106) (not e!105020))))

(assert (=> b!160657 (= res!76106 (and (= (size!3068 (_values!3235 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7826 thiss!1248))) (= (size!3067 (_keys!5053 thiss!1248)) (size!3068 (_values!3235 thiss!1248))) (bvsge (mask!7826 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2993 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2993 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160658 () Bool)

(declare-fun res!76100 () Bool)

(assert (=> b!160658 (=> (not res!76100) (not e!105020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5877 (_ BitVec 32)) Bool)

(assert (=> b!160658 (= res!76100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5053 thiss!1248) (mask!7826 thiss!1248)))))

(declare-fun b!160659 () Bool)

(assert (=> b!160659 (= e!105023 tp_is_empty!3399)))

(declare-fun mapIsEmpty!5786 () Bool)

(assert (=> mapIsEmpty!5786 mapRes!5786))

(declare-fun b!160660 () Bool)

(declare-fun res!76101 () Bool)

(assert (=> b!160660 (=> (not res!76101) (not e!105020))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!337 0))(
  ( (MissingZero!337 (index!3516 (_ BitVec 32))) (Found!337 (index!3517 (_ BitVec 32))) (Intermediate!337 (undefined!1149 Bool) (index!3518 (_ BitVec 32)) (x!17729 (_ BitVec 32))) (Undefined!337) (MissingVacant!337 (index!3519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5877 (_ BitVec 32)) SeekEntryResult!337)

(assert (=> b!160660 (= res!76101 ((_ is Undefined!337) (seekEntryOrOpen!0 key!828 (_keys!5053 thiss!1248) (mask!7826 thiss!1248))))))

(assert (= (and start!16136 res!76103) b!160653))

(assert (= (and b!160653 res!76102) b!160660))

(assert (= (and b!160660 res!76101) b!160651))

(assert (= (and b!160651 res!76105) b!160655))

(assert (= (and b!160655 res!76104) b!160657))

(assert (= (and b!160657 res!76106) b!160658))

(assert (= (and b!160658 res!76100) b!160650))

(assert (= (and b!160654 condMapEmpty!5786) mapIsEmpty!5786))

(assert (= (and b!160654 (not condMapEmpty!5786)) mapNonEmpty!5786))

(assert (= (and mapNonEmpty!5786 ((_ is ValueCellFull!1356) mapValue!5786)) b!160659))

(assert (= (and b!160654 ((_ is ValueCellFull!1356) mapDefault!5786)) b!160652))

(assert (= b!160656 b!160654))

(assert (= start!16136 b!160656))

(declare-fun m!192437 () Bool)

(assert (=> b!160660 m!192437))

(declare-fun m!192439 () Bool)

(assert (=> b!160655 m!192439))

(declare-fun m!192441 () Bool)

(assert (=> b!160656 m!192441))

(declare-fun m!192443 () Bool)

(assert (=> b!160656 m!192443))

(declare-fun m!192445 () Bool)

(assert (=> b!160650 m!192445))

(declare-fun m!192447 () Bool)

(assert (=> b!160658 m!192447))

(declare-fun m!192449 () Bool)

(assert (=> mapNonEmpty!5786 m!192449))

(declare-fun m!192451 () Bool)

(assert (=> b!160651 m!192451))

(assert (=> b!160651 m!192451))

(declare-fun m!192453 () Bool)

(assert (=> b!160651 m!192453))

(declare-fun m!192455 () Bool)

(assert (=> start!16136 m!192455))

(check-sat (not b_next!3597) (not b!160650) (not b!160651) (not b!160656) (not b!160658) (not b!160660) (not mapNonEmpty!5786) b_and!10011 (not start!16136) tp_is_empty!3399 (not b!160655))
(check-sat b_and!10011 (not b_next!3597))
