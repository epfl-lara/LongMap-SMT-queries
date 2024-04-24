; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75724 () Bool)

(assert start!75724)

(declare-fun b!889658 () Bool)

(declare-fun b_free!15583 () Bool)

(declare-fun b_next!15583 () Bool)

(assert (=> b!889658 (= b_free!15583 (not b_next!15583))))

(declare-fun tp!54705 () Bool)

(declare-fun b_and!25833 () Bool)

(assert (=> b!889658 (= tp!54705 b_and!25833)))

(declare-fun b!889657 () Bool)

(declare-fun e!495853 () Bool)

(declare-fun e!495857 () Bool)

(declare-fun mapRes!28407 () Bool)

(assert (=> b!889657 (= e!495853 (and e!495857 mapRes!28407))))

(declare-fun condMapEmpty!28407 () Bool)

(declare-datatypes ((array!51833 0))(
  ( (array!51834 (arr!24922 (Array (_ BitVec 32) (_ BitVec 64))) (size!25365 (_ BitVec 32))) )
))
(declare-datatypes ((V!28847 0))(
  ( (V!28848 (val!9006 Int)) )
))
(declare-datatypes ((ValueCell!8474 0))(
  ( (ValueCellFull!8474 (v!11478 V!28847)) (EmptyCell!8474) )
))
(declare-datatypes ((array!51835 0))(
  ( (array!51836 (arr!24923 (Array (_ BitVec 32) ValueCell!8474)) (size!25366 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3964 0))(
  ( (LongMapFixedSize!3965 (defaultEntry!5179 Int) (mask!25652 (_ BitVec 32)) (extraKeys!4873 (_ BitVec 32)) (zeroValue!4977 V!28847) (minValue!4977 V!28847) (_size!2037 (_ BitVec 32)) (_keys!9888 array!51833) (_values!5164 array!51835) (_vacant!2037 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3964)

(declare-fun mapDefault!28407 () ValueCell!8474)

(assert (=> b!889657 (= condMapEmpty!28407 (= (arr!24923 (_values!5164 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8474)) mapDefault!28407)))))

(declare-fun res!602817 () Bool)

(declare-fun e!495856 () Bool)

(assert (=> start!75724 (=> (not res!602817) (not e!495856))))

(declare-fun valid!1556 (LongMapFixedSize!3964) Bool)

(assert (=> start!75724 (= res!602817 (valid!1556 thiss!1181))))

(assert (=> start!75724 e!495856))

(declare-fun e!495854 () Bool)

(assert (=> start!75724 e!495854))

(assert (=> start!75724 true))

(declare-fun tp_is_empty!17911 () Bool)

(declare-fun array_inv!19652 (array!51833) Bool)

(declare-fun array_inv!19653 (array!51835) Bool)

(assert (=> b!889658 (= e!495854 (and tp!54705 tp_is_empty!17911 (array_inv!19652 (_keys!9888 thiss!1181)) (array_inv!19653 (_values!5164 thiss!1181)) e!495853))))

(declare-fun b!889659 () Bool)

(declare-fun res!602818 () Bool)

(assert (=> b!889659 (=> (not res!602818) (not e!495856))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!889659 (= res!602818 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4873 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (or (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4873 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!889660 () Bool)

(assert (=> b!889660 (= e!495856 false)))

(declare-fun lt!402278 () Bool)

(declare-fun contains!4305 (LongMapFixedSize!3964 (_ BitVec 64)) Bool)

(assert (=> b!889660 (= lt!402278 (contains!4305 thiss!1181 key!785))))

(declare-fun mapIsEmpty!28407 () Bool)

(assert (=> mapIsEmpty!28407 mapRes!28407))

(declare-fun b!889661 () Bool)

(assert (=> b!889661 (= e!495857 tp_is_empty!17911)))

(declare-fun mapNonEmpty!28407 () Bool)

(declare-fun tp!54704 () Bool)

(declare-fun e!495855 () Bool)

(assert (=> mapNonEmpty!28407 (= mapRes!28407 (and tp!54704 e!495855))))

(declare-fun mapRest!28407 () (Array (_ BitVec 32) ValueCell!8474))

(declare-fun mapKey!28407 () (_ BitVec 32))

(declare-fun mapValue!28407 () ValueCell!8474)

(assert (=> mapNonEmpty!28407 (= (arr!24923 (_values!5164 thiss!1181)) (store mapRest!28407 mapKey!28407 mapValue!28407))))

(declare-fun b!889662 () Bool)

(assert (=> b!889662 (= e!495855 tp_is_empty!17911)))

(assert (= (and start!75724 res!602817) b!889659))

(assert (= (and b!889659 res!602818) b!889660))

(assert (= (and b!889657 condMapEmpty!28407) mapIsEmpty!28407))

(assert (= (and b!889657 (not condMapEmpty!28407)) mapNonEmpty!28407))

(get-info :version)

(assert (= (and mapNonEmpty!28407 ((_ is ValueCellFull!8474) mapValue!28407)) b!889662))

(assert (= (and b!889657 ((_ is ValueCellFull!8474) mapDefault!28407)) b!889661))

(assert (= b!889658 b!889657))

(assert (= start!75724 b!889658))

(declare-fun m!829267 () Bool)

(assert (=> start!75724 m!829267))

(declare-fun m!829269 () Bool)

(assert (=> b!889658 m!829269))

(declare-fun m!829271 () Bool)

(assert (=> b!889658 m!829271))

(declare-fun m!829273 () Bool)

(assert (=> b!889660 m!829273))

(declare-fun m!829275 () Bool)

(assert (=> mapNonEmpty!28407 m!829275))

(check-sat (not b!889660) (not b!889658) tp_is_empty!17911 (not mapNonEmpty!28407) (not b_next!15583) b_and!25833 (not start!75724))
(check-sat b_and!25833 (not b_next!15583))
