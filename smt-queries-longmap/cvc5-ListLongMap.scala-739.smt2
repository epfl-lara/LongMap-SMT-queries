; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17226 () Bool)

(assert start!17226)

(declare-fun b!172786 () Bool)

(declare-fun b_free!4273 () Bool)

(declare-fun b_next!4273 () Bool)

(assert (=> b!172786 (= b_free!4273 (not b_next!4273))))

(declare-fun tp!15476 () Bool)

(declare-fun b_and!10713 () Bool)

(assert (=> b!172786 (= tp!15476 b_and!10713)))

(declare-fun b!172785 () Bool)

(declare-fun res!82043 () Bool)

(declare-fun e!114078 () Bool)

(assert (=> b!172785 (=> (not res!82043) (not e!114078))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172785 (= res!82043 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!82042 () Bool)

(assert (=> start!17226 (=> (not res!82042) (not e!114078))))

(declare-datatypes ((V!5041 0))(
  ( (V!5042 (val!2067 Int)) )
))
(declare-datatypes ((ValueCell!1679 0))(
  ( (ValueCellFull!1679 (v!3935 V!5041)) (EmptyCell!1679) )
))
(declare-datatypes ((array!7217 0))(
  ( (array!7218 (arr!3429 (Array (_ BitVec 32) (_ BitVec 64))) (size!3728 (_ BitVec 32))) )
))
(declare-datatypes ((array!7219 0))(
  ( (array!7220 (arr!3430 (Array (_ BitVec 32) ValueCell!1679)) (size!3729 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2266 0))(
  ( (LongMapFixedSize!2267 (defaultEntry!3579 Int) (mask!8435 (_ BitVec 32)) (extraKeys!3318 (_ BitVec 32)) (zeroValue!3420 V!5041) (minValue!3422 V!5041) (_size!1182 (_ BitVec 32)) (_keys!5418 array!7217) (_values!3562 array!7219) (_vacant!1182 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2266)

(declare-fun valid!960 (LongMapFixedSize!2266) Bool)

(assert (=> start!17226 (= res!82042 (valid!960 thiss!1248))))

(assert (=> start!17226 e!114078))

(declare-fun e!114077 () Bool)

(assert (=> start!17226 e!114077))

(assert (=> start!17226 true))

(declare-fun tp_is_empty!4045 () Bool)

(declare-fun e!114076 () Bool)

(declare-fun array_inv!2197 (array!7217) Bool)

(declare-fun array_inv!2198 (array!7219) Bool)

(assert (=> b!172786 (= e!114077 (and tp!15476 tp_is_empty!4045 (array_inv!2197 (_keys!5418 thiss!1248)) (array_inv!2198 (_values!3562 thiss!1248)) e!114076))))

(declare-fun mapNonEmpty!6888 () Bool)

(declare-fun mapRes!6888 () Bool)

(declare-fun tp!15477 () Bool)

(declare-fun e!114079 () Bool)

(assert (=> mapNonEmpty!6888 (= mapRes!6888 (and tp!15477 e!114079))))

(declare-fun mapValue!6888 () ValueCell!1679)

(declare-fun mapRest!6888 () (Array (_ BitVec 32) ValueCell!1679))

(declare-fun mapKey!6888 () (_ BitVec 32))

(assert (=> mapNonEmpty!6888 (= (arr!3430 (_values!3562 thiss!1248)) (store mapRest!6888 mapKey!6888 mapValue!6888))))

(declare-fun b!172787 () Bool)

(assert (=> b!172787 (= e!114078 (and (= (size!3729 (_values!3562 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8435 thiss!1248))) (= (size!3728 (_keys!5418 thiss!1248)) (size!3729 (_values!3562 thiss!1248))) (bvsge (mask!8435 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3318 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3318 thiss!1248) #b00000000000000000000000000000011) (bvslt (bvor (extraKeys!3318 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!172788 () Bool)

(declare-fun e!114075 () Bool)

(assert (=> b!172788 (= e!114075 tp_is_empty!4045)))

(declare-fun b!172789 () Bool)

(assert (=> b!172789 (= e!114076 (and e!114075 mapRes!6888))))

(declare-fun condMapEmpty!6888 () Bool)

(declare-fun mapDefault!6888 () ValueCell!1679)

