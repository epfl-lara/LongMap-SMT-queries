; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!15726 () Bool)

(assert start!15726)

(declare-fun b!156917 () Bool)

(declare-fun b_free!3393 () Bool)

(declare-fun b_next!3393 () Bool)

(assert (=> b!156917 (= b_free!3393 (not b_next!3393))))

(declare-fun tp!12704 () Bool)

(declare-fun b_and!9807 () Bool)

(assert (=> b!156917 (= tp!12704 b_and!9807)))

(declare-fun b!156912 () Bool)

(declare-fun e!102629 () Bool)

(declare-fun tp_is_empty!3195 () Bool)

(assert (=> b!156912 (= e!102629 tp_is_empty!3195)))

(declare-fun b!156913 () Bool)

(declare-fun e!102631 () Bool)

(assert (=> b!156913 (= e!102631 false)))

(declare-fun lt!81604 () Bool)

(declare-datatypes ((V!3907 0))(
  ( (V!3908 (val!1642 Int)) )
))
(declare-datatypes ((ValueCell!1254 0))(
  ( (ValueCellFull!1254 (v!3507 V!3907)) (EmptyCell!1254) )
))
(declare-datatypes ((array!5443 0))(
  ( (array!5444 (arr!2579 (Array (_ BitVec 32) (_ BitVec 64))) (size!2857 (_ BitVec 32))) )
))
(declare-datatypes ((array!5445 0))(
  ( (array!5446 (arr!2580 (Array (_ BitVec 32) ValueCell!1254)) (size!2858 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1416 0))(
  ( (LongMapFixedSize!1417 (defaultEntry!3150 Int) (mask!7613 (_ BitVec 32)) (extraKeys!2891 (_ BitVec 32)) (zeroValue!2993 V!3907) (minValue!2993 V!3907) (_size!757 (_ BitVec 32)) (_keys!4925 array!5443) (_values!3133 array!5445) (_vacant!757 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1416)

(declare-datatypes ((List!1864 0))(
  ( (Nil!1861) (Cons!1860 (h!2469 (_ BitVec 64)) (t!6666 List!1864)) )
))
(declare-fun arrayNoDuplicates!0 (array!5443 (_ BitVec 32) List!1864) Bool)

(assert (=> b!156913 (= lt!81604 (arrayNoDuplicates!0 (_keys!4925 thiss!1248) #b00000000000000000000000000000000 Nil!1861))))

(declare-fun res!74182 () Bool)

(assert (=> start!15726 (=> (not res!74182) (not e!102631))))

(declare-fun valid!675 (LongMapFixedSize!1416) Bool)

(assert (=> start!15726 (= res!74182 (valid!675 thiss!1248))))

(assert (=> start!15726 e!102631))

(declare-fun e!102630 () Bool)

(assert (=> start!15726 e!102630))

(assert (=> start!15726 true))

(declare-fun b!156914 () Bool)

(declare-fun res!74181 () Bool)

(assert (=> b!156914 (=> (not res!74181) (not e!102631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5443 (_ BitVec 32)) Bool)

(assert (=> b!156914 (= res!74181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4925 thiss!1248) (mask!7613 thiss!1248)))))

(declare-fun b!156915 () Bool)

(declare-fun res!74179 () Bool)

(assert (=> b!156915 (=> (not res!74179) (not e!102631))))

(assert (=> b!156915 (= res!74179 (and (= (size!2858 (_values!3133 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7613 thiss!1248))) (= (size!2857 (_keys!4925 thiss!1248)) (size!2858 (_values!3133 thiss!1248))) (bvsge (mask!7613 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2891 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2891 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!2891 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!2891 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!2891 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!2891 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)) (not (= (bvand (bvor (extraKeys!2891 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!5435 () Bool)

(declare-fun mapRes!5435 () Bool)

(assert (=> mapIsEmpty!5435 mapRes!5435))

(declare-fun b!156916 () Bool)

(declare-fun e!102633 () Bool)

(assert (=> b!156916 (= e!102633 tp_is_empty!3195)))

(declare-fun e!102628 () Bool)

(declare-fun array_inv!1627 (array!5443) Bool)

(declare-fun array_inv!1628 (array!5445) Bool)

(assert (=> b!156917 (= e!102630 (and tp!12704 tp_is_empty!3195 (array_inv!1627 (_keys!4925 thiss!1248)) (array_inv!1628 (_values!3133 thiss!1248)) e!102628))))

(declare-fun b!156918 () Bool)

(assert (=> b!156918 (= e!102628 (and e!102629 mapRes!5435))))

(declare-fun condMapEmpty!5435 () Bool)

(declare-fun mapDefault!5435 () ValueCell!1254)

(assert (=> b!156918 (= condMapEmpty!5435 (= (arr!2580 (_values!3133 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1254)) mapDefault!5435)))))

(declare-fun b!156919 () Bool)

(declare-fun res!74180 () Bool)

(assert (=> b!156919 (=> (not res!74180) (not e!102631))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156919 (= res!74180 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156920 () Bool)

(declare-fun res!74178 () Bool)

(assert (=> b!156920 (=> (not res!74178) (not e!102631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156920 (= res!74178 (validMask!0 (mask!7613 thiss!1248)))))

(declare-fun mapNonEmpty!5435 () Bool)

(declare-fun tp!12703 () Bool)

(assert (=> mapNonEmpty!5435 (= mapRes!5435 (and tp!12703 e!102633))))

(declare-fun mapValue!5435 () ValueCell!1254)

(declare-fun mapKey!5435 () (_ BitVec 32))

(declare-fun mapRest!5435 () (Array (_ BitVec 32) ValueCell!1254))

(assert (=> mapNonEmpty!5435 (= (arr!2580 (_values!3133 thiss!1248)) (store mapRest!5435 mapKey!5435 mapValue!5435))))

(assert (= (and start!15726 res!74182) b!156919))

(assert (= (and b!156919 res!74180) b!156920))

(assert (= (and b!156920 res!74178) b!156915))

(assert (= (and b!156915 res!74179) b!156914))

(assert (= (and b!156914 res!74181) b!156913))

(assert (= (and b!156918 condMapEmpty!5435) mapIsEmpty!5435))

(assert (= (and b!156918 (not condMapEmpty!5435)) mapNonEmpty!5435))

(get-info :version)

(assert (= (and mapNonEmpty!5435 ((_ is ValueCellFull!1254) mapValue!5435)) b!156916))

(assert (= (and b!156918 ((_ is ValueCellFull!1254) mapDefault!5435)) b!156912))

(assert (= b!156917 b!156918))

(assert (= start!15726 b!156917))

(declare-fun m!190247 () Bool)

(assert (=> b!156917 m!190247))

(declare-fun m!190249 () Bool)

(assert (=> b!156917 m!190249))

(declare-fun m!190251 () Bool)

(assert (=> b!156913 m!190251))

(declare-fun m!190253 () Bool)

(assert (=> start!15726 m!190253))

(declare-fun m!190255 () Bool)

(assert (=> b!156914 m!190255))

(declare-fun m!190257 () Bool)

(assert (=> mapNonEmpty!5435 m!190257))

(declare-fun m!190259 () Bool)

(assert (=> b!156920 m!190259))

(check-sat (not b_next!3393) (not mapNonEmpty!5435) (not start!15726) (not b!156914) b_and!9807 (not b!156920) tp_is_empty!3195 (not b!156913) (not b!156917))
(check-sat b_and!9807 (not b_next!3393))
