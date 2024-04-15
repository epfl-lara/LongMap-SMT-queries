; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17230 () Bool)

(assert start!17230)

(declare-fun b!172643 () Bool)

(declare-fun b_free!4273 () Bool)

(declare-fun b_next!4273 () Bool)

(assert (=> b!172643 (= b_free!4273 (not b_next!4273))))

(declare-fun tp!15476 () Bool)

(declare-fun b_and!10687 () Bool)

(assert (=> b!172643 (= tp!15476 b_and!10687)))

(declare-fun mapIsEmpty!6888 () Bool)

(declare-fun mapRes!6888 () Bool)

(assert (=> mapIsEmpty!6888 mapRes!6888))

(declare-fun res!81948 () Bool)

(declare-fun e!113976 () Bool)

(assert (=> start!17230 (=> (not res!81948) (not e!113976))))

(declare-datatypes ((V!5041 0))(
  ( (V!5042 (val!2067 Int)) )
))
(declare-datatypes ((ValueCell!1679 0))(
  ( (ValueCellFull!1679 (v!3929 V!5041)) (EmptyCell!1679) )
))
(declare-datatypes ((array!7197 0))(
  ( (array!7198 (arr!3418 (Array (_ BitVec 32) (_ BitVec 64))) (size!3718 (_ BitVec 32))) )
))
(declare-datatypes ((array!7199 0))(
  ( (array!7200 (arr!3419 (Array (_ BitVec 32) ValueCell!1679)) (size!3719 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2266 0))(
  ( (LongMapFixedSize!2267 (defaultEntry!3579 Int) (mask!8434 (_ BitVec 32)) (extraKeys!3318 (_ BitVec 32)) (zeroValue!3420 V!5041) (minValue!3422 V!5041) (_size!1182 (_ BitVec 32)) (_keys!5417 array!7197) (_values!3562 array!7199) (_vacant!1182 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2266)

(declare-fun valid!980 (LongMapFixedSize!2266) Bool)

(assert (=> start!17230 (= res!81948 (valid!980 thiss!1248))))

(assert (=> start!17230 e!113976))

(declare-fun e!113977 () Bool)

(assert (=> start!17230 e!113977))

(assert (=> start!17230 true))

(declare-fun b!172638 () Bool)

(declare-fun res!81949 () Bool)

(assert (=> b!172638 (=> (not res!81949) (not e!113976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172638 (= res!81949 (validMask!0 (mask!8434 thiss!1248)))))

(declare-fun b!172639 () Bool)

(declare-fun e!113978 () Bool)

(declare-fun e!113975 () Bool)

(assert (=> b!172639 (= e!113978 (and e!113975 mapRes!6888))))

(declare-fun condMapEmpty!6888 () Bool)

(declare-fun mapDefault!6888 () ValueCell!1679)

(assert (=> b!172639 (= condMapEmpty!6888 (= (arr!3419 (_values!3562 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1679)) mapDefault!6888)))))

(declare-fun b!172640 () Bool)

(declare-fun tp_is_empty!4045 () Bool)

(assert (=> b!172640 (= e!113975 tp_is_empty!4045)))

(declare-fun b!172641 () Bool)

(declare-fun res!81947 () Bool)

(assert (=> b!172641 (=> (not res!81947) (not e!113976))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172641 (= res!81947 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172642 () Bool)

(assert (=> b!172642 (= e!113976 (and (= (size!3719 (_values!3562 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8434 thiss!1248))) (= (size!3718 (_keys!5417 thiss!1248)) (size!3719 (_values!3562 thiss!1248))) (bvsge (mask!8434 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3318 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3318 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3318 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6888 () Bool)

(declare-fun tp!15477 () Bool)

(declare-fun e!113974 () Bool)

(assert (=> mapNonEmpty!6888 (= mapRes!6888 (and tp!15477 e!113974))))

(declare-fun mapRest!6888 () (Array (_ BitVec 32) ValueCell!1679))

(declare-fun mapKey!6888 () (_ BitVec 32))

(declare-fun mapValue!6888 () ValueCell!1679)

(assert (=> mapNonEmpty!6888 (= (arr!3419 (_values!3562 thiss!1248)) (store mapRest!6888 mapKey!6888 mapValue!6888))))

(declare-fun array_inv!2203 (array!7197) Bool)

(declare-fun array_inv!2204 (array!7199) Bool)

(assert (=> b!172643 (= e!113977 (and tp!15476 tp_is_empty!4045 (array_inv!2203 (_keys!5417 thiss!1248)) (array_inv!2204 (_values!3562 thiss!1248)) e!113978))))

(declare-fun b!172644 () Bool)

(assert (=> b!172644 (= e!113974 tp_is_empty!4045)))

(assert (= (and start!17230 res!81948) b!172641))

(assert (= (and b!172641 res!81947) b!172638))

(assert (= (and b!172638 res!81949) b!172642))

(assert (= (and b!172639 condMapEmpty!6888) mapIsEmpty!6888))

(assert (= (and b!172639 (not condMapEmpty!6888)) mapNonEmpty!6888))

(get-info :version)

(assert (= (and mapNonEmpty!6888 ((_ is ValueCellFull!1679) mapValue!6888)) b!172644))

(assert (= (and b!172639 ((_ is ValueCellFull!1679) mapDefault!6888)) b!172640))

(assert (= b!172643 b!172639))

(assert (= start!17230 b!172643))

(declare-fun m!200773 () Bool)

(assert (=> start!17230 m!200773))

(declare-fun m!200775 () Bool)

(assert (=> b!172638 m!200775))

(declare-fun m!200777 () Bool)

(assert (=> mapNonEmpty!6888 m!200777))

(declare-fun m!200779 () Bool)

(assert (=> b!172643 m!200779))

(declare-fun m!200781 () Bool)

(assert (=> b!172643 m!200781))

(check-sat (not b!172638) (not start!17230) b_and!10687 (not b!172643) tp_is_empty!4045 (not mapNonEmpty!6888) (not b_next!4273))
(check-sat b_and!10687 (not b_next!4273))
