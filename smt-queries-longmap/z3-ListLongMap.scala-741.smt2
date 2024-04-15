; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17242 () Bool)

(assert start!17242)

(declare-fun b!172768 () Bool)

(declare-fun b_free!4285 () Bool)

(declare-fun b_next!4285 () Bool)

(assert (=> b!172768 (= b_free!4285 (not b_next!4285))))

(declare-fun tp!15513 () Bool)

(declare-fun b_and!10699 () Bool)

(assert (=> b!172768 (= tp!15513 b_and!10699)))

(declare-fun b!172764 () Bool)

(declare-fun res!82003 () Bool)

(declare-fun e!114083 () Bool)

(assert (=> b!172764 (=> (not res!82003) (not e!114083))))

(declare-datatypes ((V!5057 0))(
  ( (V!5058 (val!2073 Int)) )
))
(declare-datatypes ((ValueCell!1685 0))(
  ( (ValueCellFull!1685 (v!3935 V!5057)) (EmptyCell!1685) )
))
(declare-datatypes ((array!7221 0))(
  ( (array!7222 (arr!3430 (Array (_ BitVec 32) (_ BitVec 64))) (size!3730 (_ BitVec 32))) )
))
(declare-datatypes ((array!7223 0))(
  ( (array!7224 (arr!3431 (Array (_ BitVec 32) ValueCell!1685)) (size!3731 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2278 0))(
  ( (LongMapFixedSize!2279 (defaultEntry!3585 Int) (mask!8444 (_ BitVec 32)) (extraKeys!3324 (_ BitVec 32)) (zeroValue!3426 V!5057) (minValue!3428 V!5057) (_size!1188 (_ BitVec 32)) (_keys!5423 array!7221) (_values!3568 array!7223) (_vacant!1188 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2278)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172764 (= res!82003 (validMask!0 (mask!8444 thiss!1248)))))

(declare-fun b!172765 () Bool)

(declare-fun e!114082 () Bool)

(declare-fun tp_is_empty!4057 () Bool)

(assert (=> b!172765 (= e!114082 tp_is_empty!4057)))

(declare-fun mapIsEmpty!6906 () Bool)

(declare-fun mapRes!6906 () Bool)

(assert (=> mapIsEmpty!6906 mapRes!6906))

(declare-fun res!82002 () Bool)

(assert (=> start!17242 (=> (not res!82002) (not e!114083))))

(declare-fun valid!984 (LongMapFixedSize!2278) Bool)

(assert (=> start!17242 (= res!82002 (valid!984 thiss!1248))))

(assert (=> start!17242 e!114083))

(declare-fun e!114086 () Bool)

(assert (=> start!17242 e!114086))

(assert (=> start!17242 true))

(declare-fun b!172766 () Bool)

(declare-fun e!114085 () Bool)

(assert (=> b!172766 (= e!114085 tp_is_empty!4057)))

(declare-fun mapNonEmpty!6906 () Bool)

(declare-fun tp!15512 () Bool)

(assert (=> mapNonEmpty!6906 (= mapRes!6906 (and tp!15512 e!114085))))

(declare-fun mapKey!6906 () (_ BitVec 32))

(declare-fun mapRest!6906 () (Array (_ BitVec 32) ValueCell!1685))

(declare-fun mapValue!6906 () ValueCell!1685)

(assert (=> mapNonEmpty!6906 (= (arr!3431 (_values!3568 thiss!1248)) (store mapRest!6906 mapKey!6906 mapValue!6906))))

(declare-fun b!172767 () Bool)

(assert (=> b!172767 (= e!114083 (and (= (size!3731 (_values!3568 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8444 thiss!1248))) (= (size!3730 (_keys!5423 thiss!1248)) (size!3731 (_values!3568 thiss!1248))) (bvsge (mask!8444 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3324 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3324 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3324 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3324 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)))))))

(declare-fun e!114084 () Bool)

(declare-fun array_inv!2211 (array!7221) Bool)

(declare-fun array_inv!2212 (array!7223) Bool)

(assert (=> b!172768 (= e!114086 (and tp!15513 tp_is_empty!4057 (array_inv!2211 (_keys!5423 thiss!1248)) (array_inv!2212 (_values!3568 thiss!1248)) e!114084))))

(declare-fun b!172769 () Bool)

(declare-fun res!82001 () Bool)

(assert (=> b!172769 (=> (not res!82001) (not e!114083))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172769 (= res!82001 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172770 () Bool)

(assert (=> b!172770 (= e!114084 (and e!114082 mapRes!6906))))

(declare-fun condMapEmpty!6906 () Bool)

(declare-fun mapDefault!6906 () ValueCell!1685)

(assert (=> b!172770 (= condMapEmpty!6906 (= (arr!3431 (_values!3568 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1685)) mapDefault!6906)))))

(assert (= (and start!17242 res!82002) b!172769))

(assert (= (and b!172769 res!82001) b!172764))

(assert (= (and b!172764 res!82003) b!172767))

(assert (= (and b!172770 condMapEmpty!6906) mapIsEmpty!6906))

(assert (= (and b!172770 (not condMapEmpty!6906)) mapNonEmpty!6906))

(get-info :version)

(assert (= (and mapNonEmpty!6906 ((_ is ValueCellFull!1685) mapValue!6906)) b!172766))

(assert (= (and b!172770 ((_ is ValueCellFull!1685) mapDefault!6906)) b!172765))

(assert (= b!172768 b!172770))

(assert (= start!17242 b!172768))

(declare-fun m!200833 () Bool)

(assert (=> b!172764 m!200833))

(declare-fun m!200835 () Bool)

(assert (=> start!17242 m!200835))

(declare-fun m!200837 () Bool)

(assert (=> mapNonEmpty!6906 m!200837))

(declare-fun m!200839 () Bool)

(assert (=> b!172768 m!200839))

(declare-fun m!200841 () Bool)

(assert (=> b!172768 m!200841))

(check-sat (not b!172768) (not mapNonEmpty!6906) (not start!17242) (not b!172764) tp_is_empty!4057 (not b_next!4285) b_and!10699)
(check-sat b_and!10699 (not b_next!4285))
