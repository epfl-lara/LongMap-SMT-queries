; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89118 () Bool)

(assert start!89118)

(declare-fun b!1021564 () Bool)

(declare-fun b_free!20161 () Bool)

(declare-fun b_next!20161 () Bool)

(assert (=> b!1021564 (= b_free!20161 (not b_next!20161))))

(declare-fun tp!71517 () Bool)

(declare-fun b_and!32333 () Bool)

(assert (=> b!1021564 (= tp!71517 b_and!32333)))

(declare-fun b!1021561 () Bool)

(declare-fun res!684468 () Bool)

(declare-fun e!575395 () Bool)

(assert (=> b!1021561 (=> (not res!684468) (not e!575395))))

(declare-datatypes ((V!36715 0))(
  ( (V!36716 (val!11991 Int)) )
))
(declare-datatypes ((ValueCell!11237 0))(
  ( (ValueCellFull!11237 (v!14559 V!36715)) (EmptyCell!11237) )
))
(declare-datatypes ((array!63745 0))(
  ( (array!63746 (arr!30684 (Array (_ BitVec 32) (_ BitVec 64))) (size!31197 (_ BitVec 32))) )
))
(declare-datatypes ((array!63747 0))(
  ( (array!63748 (arr!30685 (Array (_ BitVec 32) ValueCell!11237)) (size!31198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5068 0))(
  ( (LongMapFixedSize!5069 (defaultEntry!5886 Int) (mask!29458 (_ BitVec 32)) (extraKeys!5618 (_ BitVec 32)) (zeroValue!5722 V!36715) (minValue!5722 V!36715) (_size!2589 (_ BitVec 32)) (_keys!11027 array!63745) (_values!5909 array!63747) (_vacant!2589 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5068)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63745 (_ BitVec 32)) Bool)

(assert (=> b!1021561 (= res!684468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11027 thiss!1427) (mask!29458 thiss!1427)))))

(declare-fun res!684469 () Bool)

(assert (=> start!89118 (=> (not res!684469) (not e!575395))))

(declare-fun valid!1934 (LongMapFixedSize!5068) Bool)

(assert (=> start!89118 (= res!684469 (valid!1934 thiss!1427))))

(assert (=> start!89118 e!575395))

(declare-fun e!575394 () Bool)

(assert (=> start!89118 e!575394))

(assert (=> start!89118 true))

(declare-fun b!1021562 () Bool)

(declare-fun res!684466 () Bool)

(assert (=> b!1021562 (=> (not res!684466) (not e!575395))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021562 (= res!684466 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021563 () Bool)

(declare-fun e!575393 () Bool)

(declare-fun e!575391 () Bool)

(declare-fun mapRes!37239 () Bool)

(assert (=> b!1021563 (= e!575393 (and e!575391 mapRes!37239))))

(declare-fun condMapEmpty!37239 () Bool)

(declare-fun mapDefault!37239 () ValueCell!11237)

(assert (=> b!1021563 (= condMapEmpty!37239 (= (arr!30685 (_values!5909 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11237)) mapDefault!37239)))))

(declare-fun tp_is_empty!23881 () Bool)

(declare-fun array_inv!23807 (array!63745) Bool)

(declare-fun array_inv!23808 (array!63747) Bool)

(assert (=> b!1021564 (= e!575394 (and tp!71517 tp_is_empty!23881 (array_inv!23807 (_keys!11027 thiss!1427)) (array_inv!23808 (_values!5909 thiss!1427)) e!575393))))

(declare-fun b!1021565 () Bool)

(declare-fun res!684465 () Bool)

(assert (=> b!1021565 (=> (not res!684465) (not e!575395))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021565 (= res!684465 (validMask!0 (mask!29458 thiss!1427)))))

(declare-fun b!1021566 () Bool)

(declare-fun e!575392 () Bool)

(assert (=> b!1021566 (= e!575392 tp_is_empty!23881)))

(declare-fun mapIsEmpty!37239 () Bool)

(assert (=> mapIsEmpty!37239 mapRes!37239))

(declare-fun mapNonEmpty!37239 () Bool)

(declare-fun tp!71518 () Bool)

(assert (=> mapNonEmpty!37239 (= mapRes!37239 (and tp!71518 e!575392))))

(declare-fun mapKey!37239 () (_ BitVec 32))

(declare-fun mapRest!37239 () (Array (_ BitVec 32) ValueCell!11237))

(declare-fun mapValue!37239 () ValueCell!11237)

(assert (=> mapNonEmpty!37239 (= (arr!30685 (_values!5909 thiss!1427)) (store mapRest!37239 mapKey!37239 mapValue!37239))))

(declare-fun b!1021567 () Bool)

(declare-fun res!684467 () Bool)

(assert (=> b!1021567 (=> (not res!684467) (not e!575395))))

(assert (=> b!1021567 (= res!684467 (and (= (size!31198 (_values!5909 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29458 thiss!1427))) (= (size!31197 (_keys!11027 thiss!1427)) (size!31198 (_values!5909 thiss!1427))) (bvsge (mask!29458 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5618 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5618 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021568 () Bool)

(assert (=> b!1021568 (= e!575391 tp_is_empty!23881)))

(declare-fun b!1021569 () Bool)

(assert (=> b!1021569 (= e!575395 false)))

(declare-fun lt!449935 () Bool)

(declare-datatypes ((List!21695 0))(
  ( (Nil!21692) (Cons!21691 (h!22889 (_ BitVec 64)) (t!30700 List!21695)) )
))
(declare-fun arrayNoDuplicates!0 (array!63745 (_ BitVec 32) List!21695) Bool)

(assert (=> b!1021569 (= lt!449935 (arrayNoDuplicates!0 (_keys!11027 thiss!1427) #b00000000000000000000000000000000 Nil!21692))))

(assert (= (and start!89118 res!684469) b!1021562))

(assert (= (and b!1021562 res!684466) b!1021565))

(assert (= (and b!1021565 res!684465) b!1021567))

(assert (= (and b!1021567 res!684467) b!1021561))

(assert (= (and b!1021561 res!684468) b!1021569))

(assert (= (and b!1021563 condMapEmpty!37239) mapIsEmpty!37239))

(assert (= (and b!1021563 (not condMapEmpty!37239)) mapNonEmpty!37239))

(get-info :version)

(assert (= (and mapNonEmpty!37239 ((_ is ValueCellFull!11237) mapValue!37239)) b!1021566))

(assert (= (and b!1021563 ((_ is ValueCellFull!11237) mapDefault!37239)) b!1021568))

(assert (= b!1021564 b!1021563))

(assert (= start!89118 b!1021564))

(declare-fun m!940491 () Bool)

(assert (=> b!1021564 m!940491))

(declare-fun m!940493 () Bool)

(assert (=> b!1021564 m!940493))

(declare-fun m!940495 () Bool)

(assert (=> mapNonEmpty!37239 m!940495))

(declare-fun m!940497 () Bool)

(assert (=> b!1021561 m!940497))

(declare-fun m!940499 () Bool)

(assert (=> b!1021565 m!940499))

(declare-fun m!940501 () Bool)

(assert (=> start!89118 m!940501))

(declare-fun m!940503 () Bool)

(assert (=> b!1021569 m!940503))

(check-sat b_and!32333 (not mapNonEmpty!37239) (not b!1021569) (not b!1021564) (not b!1021565) (not b!1021561) tp_is_empty!23881 (not start!89118) (not b_next!20161))
(check-sat b_and!32333 (not b_next!20161))
