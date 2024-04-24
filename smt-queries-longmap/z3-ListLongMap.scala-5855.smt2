; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75828 () Bool)

(assert start!75828)

(declare-fun b!890436 () Bool)

(declare-fun b_free!15631 () Bool)

(declare-fun b_next!15631 () Bool)

(assert (=> b!890436 (= b_free!15631 (not b_next!15631))))

(declare-fun tp!54862 () Bool)

(declare-fun b_and!25881 () Bool)

(assert (=> b!890436 (= tp!54862 b_and!25881)))

(declare-fun b!890428 () Bool)

(declare-fun e!496439 () Bool)

(assert (=> b!890428 (= e!496439 false)))

(declare-fun lt!402413 () Bool)

(declare-datatypes ((array!51937 0))(
  ( (array!51938 (arr!24970 (Array (_ BitVec 32) (_ BitVec 64))) (size!25415 (_ BitVec 32))) )
))
(declare-datatypes ((V!28911 0))(
  ( (V!28912 (val!9030 Int)) )
))
(declare-datatypes ((ValueCell!8498 0))(
  ( (ValueCellFull!8498 (v!11505 V!28911)) (EmptyCell!8498) )
))
(declare-datatypes ((array!51939 0))(
  ( (array!51940 (arr!24971 (Array (_ BitVec 32) ValueCell!8498)) (size!25416 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4012 0))(
  ( (LongMapFixedSize!4013 (defaultEntry!5203 Int) (mask!25697 (_ BitVec 32)) (extraKeys!4897 (_ BitVec 32)) (zeroValue!5001 V!28911) (minValue!5001 V!28911) (_size!2061 (_ BitVec 32)) (_keys!9914 array!51937) (_values!5188 array!51939) (_vacant!2061 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4012)

(declare-datatypes ((List!17658 0))(
  ( (Nil!17655) (Cons!17654 (h!18791 (_ BitVec 64)) (t!24949 List!17658)) )
))
(declare-fun arrayNoDuplicates!0 (array!51937 (_ BitVec 32) List!17658) Bool)

(assert (=> b!890428 (= lt!402413 (arrayNoDuplicates!0 (_keys!9914 thiss!1181) #b00000000000000000000000000000000 Nil!17655))))

(declare-fun mapIsEmpty!28493 () Bool)

(declare-fun mapRes!28493 () Bool)

(assert (=> mapIsEmpty!28493 mapRes!28493))

(declare-fun res!603177 () Bool)

(declare-fun e!496435 () Bool)

(assert (=> start!75828 (=> (not res!603177) (not e!496435))))

(declare-fun valid!1574 (LongMapFixedSize!4012) Bool)

(assert (=> start!75828 (= res!603177 (valid!1574 thiss!1181))))

(assert (=> start!75828 e!496435))

(declare-fun e!496436 () Bool)

(assert (=> start!75828 e!496436))

(assert (=> start!75828 true))

(declare-fun b!890429 () Bool)

(declare-fun res!603178 () Bool)

(assert (=> b!890429 (=> (not res!603178) (not e!496439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51937 (_ BitVec 32)) Bool)

(assert (=> b!890429 (= res!603178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9914 thiss!1181) (mask!25697 thiss!1181)))))

(declare-fun b!890430 () Bool)

(declare-fun e!496434 () Bool)

(declare-fun tp_is_empty!17959 () Bool)

(assert (=> b!890430 (= e!496434 tp_is_empty!17959)))

(declare-fun b!890431 () Bool)

(declare-fun res!603174 () Bool)

(assert (=> b!890431 (=> (not res!603174) (not e!496435))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890431 (= res!603174 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890432 () Bool)

(declare-fun e!496440 () Bool)

(assert (=> b!890432 (= e!496440 tp_is_empty!17959)))

(declare-fun mapNonEmpty!28493 () Bool)

(declare-fun tp!54863 () Bool)

(assert (=> mapNonEmpty!28493 (= mapRes!28493 (and tp!54863 e!496434))))

(declare-fun mapKey!28493 () (_ BitVec 32))

(declare-fun mapRest!28493 () (Array (_ BitVec 32) ValueCell!8498))

(declare-fun mapValue!28493 () ValueCell!8498)

(assert (=> mapNonEmpty!28493 (= (arr!24971 (_values!5188 thiss!1181)) (store mapRest!28493 mapKey!28493 mapValue!28493))))

(declare-fun b!890433 () Bool)

(assert (=> b!890433 (= e!496435 e!496439)))

(declare-fun res!603175 () Bool)

(assert (=> b!890433 (=> (not res!603175) (not e!496439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890433 (= res!603175 (validMask!0 (mask!25697 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8729 0))(
  ( (MissingZero!8729 (index!37287 (_ BitVec 32))) (Found!8729 (index!37288 (_ BitVec 32))) (Intermediate!8729 (undefined!9541 Bool) (index!37289 (_ BitVec 32)) (x!75495 (_ BitVec 32))) (Undefined!8729) (MissingVacant!8729 (index!37290 (_ BitVec 32))) )
))
(declare-fun lt!402412 () SeekEntryResult!8729)

(declare-fun seekEntry!0 ((_ BitVec 64) array!51937 (_ BitVec 32)) SeekEntryResult!8729)

(assert (=> b!890433 (= lt!402412 (seekEntry!0 key!785 (_keys!9914 thiss!1181) (mask!25697 thiss!1181)))))

(declare-fun b!890434 () Bool)

(declare-fun e!496438 () Bool)

(assert (=> b!890434 (= e!496438 (and e!496440 mapRes!28493))))

(declare-fun condMapEmpty!28493 () Bool)

(declare-fun mapDefault!28493 () ValueCell!8498)

(assert (=> b!890434 (= condMapEmpty!28493 (= (arr!24971 (_values!5188 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8498)) mapDefault!28493)))))

(declare-fun b!890435 () Bool)

(declare-fun res!603176 () Bool)

(assert (=> b!890435 (=> (not res!603176) (not e!496439))))

(assert (=> b!890435 (= res!603176 (and (= (size!25416 (_values!5188 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25697 thiss!1181))) (= (size!25415 (_keys!9914 thiss!1181)) (size!25416 (_values!5188 thiss!1181))) (bvsge (mask!25697 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4897 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4897 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun array_inv!19682 (array!51937) Bool)

(declare-fun array_inv!19683 (array!51939) Bool)

(assert (=> b!890436 (= e!496436 (and tp!54862 tp_is_empty!17959 (array_inv!19682 (_keys!9914 thiss!1181)) (array_inv!19683 (_values!5188 thiss!1181)) e!496438))))

(assert (= (and start!75828 res!603177) b!890431))

(assert (= (and b!890431 res!603174) b!890433))

(assert (= (and b!890433 res!603175) b!890435))

(assert (= (and b!890435 res!603176) b!890429))

(assert (= (and b!890429 res!603178) b!890428))

(assert (= (and b!890434 condMapEmpty!28493) mapIsEmpty!28493))

(assert (= (and b!890434 (not condMapEmpty!28493)) mapNonEmpty!28493))

(get-info :version)

(assert (= (and mapNonEmpty!28493 ((_ is ValueCellFull!8498) mapValue!28493)) b!890430))

(assert (= (and b!890434 ((_ is ValueCellFull!8498) mapDefault!28493)) b!890432))

(assert (= b!890436 b!890434))

(assert (= start!75828 b!890436))

(declare-fun m!829699 () Bool)

(assert (=> b!890436 m!829699))

(declare-fun m!829701 () Bool)

(assert (=> b!890436 m!829701))

(declare-fun m!829703 () Bool)

(assert (=> b!890433 m!829703))

(declare-fun m!829705 () Bool)

(assert (=> b!890433 m!829705))

(declare-fun m!829707 () Bool)

(assert (=> b!890428 m!829707))

(declare-fun m!829709 () Bool)

(assert (=> mapNonEmpty!28493 m!829709))

(declare-fun m!829711 () Bool)

(assert (=> b!890429 m!829711))

(declare-fun m!829713 () Bool)

(assert (=> start!75828 m!829713))

(check-sat (not b_next!15631) (not b!890428) tp_is_empty!17959 b_and!25881 (not b!890436) (not b!890433) (not mapNonEmpty!28493) (not start!75828) (not b!890429))
(check-sat b_and!25881 (not b_next!15631))
