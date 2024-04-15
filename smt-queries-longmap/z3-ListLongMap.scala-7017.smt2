; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89112 () Bool)

(assert start!89112)

(declare-fun b!1021485 () Bool)

(declare-fun b_free!20155 () Bool)

(declare-fun b_next!20155 () Bool)

(assert (=> b!1021485 (= b_free!20155 (not b_next!20155))))

(declare-fun tp!71500 () Bool)

(declare-fun b_and!32327 () Bool)

(assert (=> b!1021485 (= tp!71500 b_and!32327)))

(declare-fun b!1021480 () Bool)

(declare-fun e!575339 () Bool)

(declare-fun tp_is_empty!23875 () Bool)

(assert (=> b!1021480 (= e!575339 tp_is_empty!23875)))

(declare-fun b!1021481 () Bool)

(declare-fun e!575342 () Bool)

(declare-fun mapRes!37230 () Bool)

(assert (=> b!1021481 (= e!575342 (and e!575339 mapRes!37230))))

(declare-fun condMapEmpty!37230 () Bool)

(declare-datatypes ((V!36707 0))(
  ( (V!36708 (val!11988 Int)) )
))
(declare-datatypes ((ValueCell!11234 0))(
  ( (ValueCellFull!11234 (v!14556 V!36707)) (EmptyCell!11234) )
))
(declare-datatypes ((array!63733 0))(
  ( (array!63734 (arr!30678 (Array (_ BitVec 32) (_ BitVec 64))) (size!31191 (_ BitVec 32))) )
))
(declare-datatypes ((array!63735 0))(
  ( (array!63736 (arr!30679 (Array (_ BitVec 32) ValueCell!11234)) (size!31192 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5062 0))(
  ( (LongMapFixedSize!5063 (defaultEntry!5883 Int) (mask!29453 (_ BitVec 32)) (extraKeys!5615 (_ BitVec 32)) (zeroValue!5719 V!36707) (minValue!5719 V!36707) (_size!2586 (_ BitVec 32)) (_keys!11024 array!63733) (_values!5906 array!63735) (_vacant!2586 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5062)

(declare-fun mapDefault!37230 () ValueCell!11234)

(assert (=> b!1021481 (= condMapEmpty!37230 (= (arr!30679 (_values!5906 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11234)) mapDefault!37230)))))

(declare-fun b!1021482 () Bool)

(declare-fun res!684423 () Bool)

(declare-fun e!575340 () Bool)

(assert (=> b!1021482 (=> (not res!684423) (not e!575340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63733 (_ BitVec 32)) Bool)

(assert (=> b!1021482 (= res!684423 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11024 thiss!1427) (mask!29453 thiss!1427)))))

(declare-fun b!1021483 () Bool)

(assert (=> b!1021483 (= e!575340 false)))

(declare-fun lt!449926 () Bool)

(declare-datatypes ((List!21694 0))(
  ( (Nil!21691) (Cons!21690 (h!22888 (_ BitVec 64)) (t!30699 List!21694)) )
))
(declare-fun arrayNoDuplicates!0 (array!63733 (_ BitVec 32) List!21694) Bool)

(assert (=> b!1021483 (= lt!449926 (arrayNoDuplicates!0 (_keys!11024 thiss!1427) #b00000000000000000000000000000000 Nil!21691))))

(declare-fun res!684424 () Bool)

(assert (=> start!89112 (=> (not res!684424) (not e!575340))))

(declare-fun valid!1933 (LongMapFixedSize!5062) Bool)

(assert (=> start!89112 (= res!684424 (valid!1933 thiss!1427))))

(assert (=> start!89112 e!575340))

(declare-fun e!575337 () Bool)

(assert (=> start!89112 e!575337))

(assert (=> start!89112 true))

(declare-fun b!1021484 () Bool)

(declare-fun res!684422 () Bool)

(assert (=> b!1021484 (=> (not res!684422) (not e!575340))))

(assert (=> b!1021484 (= res!684422 (and (= (size!31192 (_values!5906 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29453 thiss!1427))) (= (size!31191 (_keys!11024 thiss!1427)) (size!31192 (_values!5906 thiss!1427))) (bvsge (mask!29453 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5615 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5615 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5615 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37230 () Bool)

(assert (=> mapIsEmpty!37230 mapRes!37230))

(declare-fun mapNonEmpty!37230 () Bool)

(declare-fun tp!71499 () Bool)

(declare-fun e!575338 () Bool)

(assert (=> mapNonEmpty!37230 (= mapRes!37230 (and tp!71499 e!575338))))

(declare-fun mapKey!37230 () (_ BitVec 32))

(declare-fun mapValue!37230 () ValueCell!11234)

(declare-fun mapRest!37230 () (Array (_ BitVec 32) ValueCell!11234))

(assert (=> mapNonEmpty!37230 (= (arr!30679 (_values!5906 thiss!1427)) (store mapRest!37230 mapKey!37230 mapValue!37230))))

(declare-fun array_inv!23803 (array!63733) Bool)

(declare-fun array_inv!23804 (array!63735) Bool)

(assert (=> b!1021485 (= e!575337 (and tp!71500 tp_is_empty!23875 (array_inv!23803 (_keys!11024 thiss!1427)) (array_inv!23804 (_values!5906 thiss!1427)) e!575342))))

(declare-fun b!1021486 () Bool)

(declare-fun res!684420 () Bool)

(assert (=> b!1021486 (=> (not res!684420) (not e!575340))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021486 (= res!684420 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021487 () Bool)

(declare-fun res!684421 () Bool)

(assert (=> b!1021487 (=> (not res!684421) (not e!575340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021487 (= res!684421 (validMask!0 (mask!29453 thiss!1427)))))

(declare-fun b!1021488 () Bool)

(assert (=> b!1021488 (= e!575338 tp_is_empty!23875)))

(assert (= (and start!89112 res!684424) b!1021486))

(assert (= (and b!1021486 res!684420) b!1021487))

(assert (= (and b!1021487 res!684421) b!1021484))

(assert (= (and b!1021484 res!684422) b!1021482))

(assert (= (and b!1021482 res!684423) b!1021483))

(assert (= (and b!1021481 condMapEmpty!37230) mapIsEmpty!37230))

(assert (= (and b!1021481 (not condMapEmpty!37230)) mapNonEmpty!37230))

(get-info :version)

(assert (= (and mapNonEmpty!37230 ((_ is ValueCellFull!11234) mapValue!37230)) b!1021488))

(assert (= (and b!1021481 ((_ is ValueCellFull!11234) mapDefault!37230)) b!1021480))

(assert (= b!1021485 b!1021481))

(assert (= start!89112 b!1021485))

(declare-fun m!940449 () Bool)

(assert (=> start!89112 m!940449))

(declare-fun m!940451 () Bool)

(assert (=> b!1021482 m!940451))

(declare-fun m!940453 () Bool)

(assert (=> b!1021487 m!940453))

(declare-fun m!940455 () Bool)

(assert (=> mapNonEmpty!37230 m!940455))

(declare-fun m!940457 () Bool)

(assert (=> b!1021483 m!940457))

(declare-fun m!940459 () Bool)

(assert (=> b!1021485 m!940459))

(declare-fun m!940461 () Bool)

(assert (=> b!1021485 m!940461))

(check-sat (not b!1021485) (not b!1021487) (not start!89112) (not mapNonEmpty!37230) b_and!32327 (not b!1021482) tp_is_empty!23875 (not b_next!20155) (not b!1021483))
(check-sat b_and!32327 (not b_next!20155))
