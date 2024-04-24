; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15620 () Bool)

(assert start!15620)

(declare-fun b!155592 () Bool)

(declare-fun b_free!3283 () Bool)

(declare-fun b_next!3283 () Bool)

(assert (=> b!155592 (= b_free!3283 (not b_next!3283))))

(declare-fun tp!12373 () Bool)

(declare-fun b_and!9711 () Bool)

(assert (=> b!155592 (= tp!12373 b_and!9711)))

(declare-fun b!155591 () Bool)

(declare-fun e!101648 () Bool)

(declare-fun tp_is_empty!3085 () Bool)

(assert (=> b!155591 (= e!101648 tp_is_empty!3085)))

(declare-fun res!73495 () Bool)

(declare-fun e!101645 () Bool)

(assert (=> start!15620 (=> (not res!73495) (not e!101645))))

(declare-datatypes ((V!3761 0))(
  ( (V!3762 (val!1587 Int)) )
))
(declare-datatypes ((ValueCell!1199 0))(
  ( (ValueCellFull!1199 (v!3453 V!3761)) (EmptyCell!1199) )
))
(declare-datatypes ((array!5209 0))(
  ( (array!5210 (arr!2462 (Array (_ BitVec 32) (_ BitVec 64))) (size!2740 (_ BitVec 32))) )
))
(declare-datatypes ((array!5211 0))(
  ( (array!5212 (arr!2463 (Array (_ BitVec 32) ValueCell!1199)) (size!2741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1306 0))(
  ( (LongMapFixedSize!1307 (defaultEntry!3095 Int) (mask!7522 (_ BitVec 32)) (extraKeys!2836 (_ BitVec 32)) (zeroValue!2938 V!3761) (minValue!2938 V!3761) (_size!702 (_ BitVec 32)) (_keys!4870 array!5209) (_values!3078 array!5211) (_vacant!702 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1306)

(declare-fun valid!654 (LongMapFixedSize!1306) Bool)

(assert (=> start!15620 (= res!73495 (valid!654 thiss!1248))))

(assert (=> start!15620 e!101645))

(declare-fun e!101644 () Bool)

(assert (=> start!15620 e!101644))

(assert (=> start!15620 true))

(declare-fun e!101649 () Bool)

(declare-fun array_inv!1557 (array!5209) Bool)

(declare-fun array_inv!1558 (array!5211) Bool)

(assert (=> b!155592 (= e!101644 (and tp!12373 tp_is_empty!3085 (array_inv!1557 (_keys!4870 thiss!1248)) (array_inv!1558 (_values!3078 thiss!1248)) e!101649))))

(declare-fun b!155593 () Bool)

(declare-fun res!73492 () Bool)

(assert (=> b!155593 (=> (not res!73492) (not e!101645))))

(assert (=> b!155593 (= res!73492 (and (= (size!2741 (_values!3078 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7522 thiss!1248))) (= (size!2740 (_keys!4870 thiss!1248)) (size!2741 (_values!3078 thiss!1248))) (bvsge (mask!7522 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2836 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2836 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!2836 thiss!1248) #b00000000000000000000000000000010) (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)) (not (= (bvand (bvor (extraKeys!2836 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!155594 () Bool)

(declare-fun e!101646 () Bool)

(declare-fun mapRes!5270 () Bool)

(assert (=> b!155594 (= e!101649 (and e!101646 mapRes!5270))))

(declare-fun condMapEmpty!5270 () Bool)

(declare-fun mapDefault!5270 () ValueCell!1199)

(assert (=> b!155594 (= condMapEmpty!5270 (= (arr!2463 (_values!3078 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1199)) mapDefault!5270)))))

(declare-fun b!155595 () Bool)

(declare-fun res!73494 () Bool)

(assert (=> b!155595 (=> (not res!73494) (not e!101645))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!155595 (= res!73494 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!155596 () Bool)

(declare-fun res!73491 () Bool)

(assert (=> b!155596 (=> (not res!73491) (not e!101645))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5209 (_ BitVec 32)) Bool)

(assert (=> b!155596 (= res!73491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4870 thiss!1248) (mask!7522 thiss!1248)))))

(declare-fun b!155597 () Bool)

(assert (=> b!155597 (= e!101646 tp_is_empty!3085)))

(declare-fun mapIsEmpty!5270 () Bool)

(assert (=> mapIsEmpty!5270 mapRes!5270))

(declare-fun b!155598 () Bool)

(assert (=> b!155598 (= e!101645 false)))

(declare-fun lt!81435 () Bool)

(declare-datatypes ((List!1811 0))(
  ( (Nil!1808) (Cons!1807 (h!2416 (_ BitVec 64)) (t!6605 List!1811)) )
))
(declare-fun arrayNoDuplicates!0 (array!5209 (_ BitVec 32) List!1811) Bool)

(assert (=> b!155598 (= lt!81435 (arrayNoDuplicates!0 (_keys!4870 thiss!1248) #b00000000000000000000000000000000 Nil!1808))))

(declare-fun mapNonEmpty!5270 () Bool)

(declare-fun tp!12374 () Bool)

(assert (=> mapNonEmpty!5270 (= mapRes!5270 (and tp!12374 e!101648))))

(declare-fun mapRest!5270 () (Array (_ BitVec 32) ValueCell!1199))

(declare-fun mapValue!5270 () ValueCell!1199)

(declare-fun mapKey!5270 () (_ BitVec 32))

(assert (=> mapNonEmpty!5270 (= (arr!2463 (_values!3078 thiss!1248)) (store mapRest!5270 mapKey!5270 mapValue!5270))))

(declare-fun b!155599 () Bool)

(declare-fun res!73493 () Bool)

(assert (=> b!155599 (=> (not res!73493) (not e!101645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!155599 (= res!73493 (validMask!0 (mask!7522 thiss!1248)))))

(assert (= (and start!15620 res!73495) b!155595))

(assert (= (and b!155595 res!73494) b!155599))

(assert (= (and b!155599 res!73493) b!155593))

(assert (= (and b!155593 res!73492) b!155596))

(assert (= (and b!155596 res!73491) b!155598))

(assert (= (and b!155594 condMapEmpty!5270) mapIsEmpty!5270))

(assert (= (and b!155594 (not condMapEmpty!5270)) mapNonEmpty!5270))

(get-info :version)

(assert (= (and mapNonEmpty!5270 ((_ is ValueCellFull!1199) mapValue!5270)) b!155591))

(assert (= (and b!155594 ((_ is ValueCellFull!1199) mapDefault!5270)) b!155597))

(assert (= b!155592 b!155594))

(assert (= start!15620 b!155592))

(declare-fun m!189575 () Bool)

(assert (=> b!155592 m!189575))

(declare-fun m!189577 () Bool)

(assert (=> b!155592 m!189577))

(declare-fun m!189579 () Bool)

(assert (=> b!155599 m!189579))

(declare-fun m!189581 () Bool)

(assert (=> start!15620 m!189581))

(declare-fun m!189583 () Bool)

(assert (=> b!155596 m!189583))

(declare-fun m!189585 () Bool)

(assert (=> b!155598 m!189585))

(declare-fun m!189587 () Bool)

(assert (=> mapNonEmpty!5270 m!189587))

(check-sat (not b!155599) (not b!155598) b_and!9711 (not b!155592) (not mapNonEmpty!5270) tp_is_empty!3085 (not start!15620) (not b!155596) (not b_next!3283))
(check-sat b_and!9711 (not b_next!3283))
