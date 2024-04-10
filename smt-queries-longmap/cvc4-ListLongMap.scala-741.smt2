; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17242 () Bool)

(assert start!17242)

(declare-fun b!172959 () Bool)

(declare-fun b_free!4289 () Bool)

(declare-fun b_next!4289 () Bool)

(assert (=> b!172959 (= b_free!4289 (not b_next!4289))))

(declare-fun tp!15524 () Bool)

(declare-fun b_and!10729 () Bool)

(assert (=> b!172959 (= tp!15524 b_and!10729)))

(declare-fun b!172953 () Bool)

(declare-fun e!114222 () Bool)

(declare-fun tp_is_empty!4061 () Bool)

(assert (=> b!172953 (= e!114222 tp_is_empty!4061)))

(declare-fun mapNonEmpty!6912 () Bool)

(declare-fun mapRes!6912 () Bool)

(declare-fun tp!15525 () Bool)

(assert (=> mapNonEmpty!6912 (= mapRes!6912 (and tp!15525 e!114222))))

(declare-datatypes ((V!5061 0))(
  ( (V!5062 (val!2075 Int)) )
))
(declare-datatypes ((ValueCell!1687 0))(
  ( (ValueCellFull!1687 (v!3943 V!5061)) (EmptyCell!1687) )
))
(declare-fun mapValue!6912 () ValueCell!1687)

(declare-datatypes ((array!7249 0))(
  ( (array!7250 (arr!3445 (Array (_ BitVec 32) (_ BitVec 64))) (size!3744 (_ BitVec 32))) )
))
(declare-datatypes ((array!7251 0))(
  ( (array!7252 (arr!3446 (Array (_ BitVec 32) ValueCell!1687)) (size!3745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2282 0))(
  ( (LongMapFixedSize!2283 (defaultEntry!3587 Int) (mask!8447 (_ BitVec 32)) (extraKeys!3326 (_ BitVec 32)) (zeroValue!3428 V!5061) (minValue!3430 V!5061) (_size!1190 (_ BitVec 32)) (_keys!5426 array!7249) (_values!3570 array!7251) (_vacant!1190 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2282)

(declare-fun mapKey!6912 () (_ BitVec 32))

(declare-fun mapRest!6912 () (Array (_ BitVec 32) ValueCell!1687))

(assert (=> mapNonEmpty!6912 (= (arr!3446 (_values!3570 thiss!1248)) (store mapRest!6912 mapKey!6912 mapValue!6912))))

(declare-fun b!172955 () Bool)

(declare-fun res!82115 () Bool)

(declare-fun e!114220 () Bool)

(assert (=> b!172955 (=> (not res!82115) (not e!114220))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172955 (= res!82115 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172956 () Bool)

(declare-fun res!82116 () Bool)

(assert (=> b!172956 (=> (not res!82116) (not e!114220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172956 (= res!82116 (validMask!0 (mask!8447 thiss!1248)))))

(declare-fun b!172957 () Bool)

(assert (=> b!172957 (= e!114220 (and (= (size!3745 (_values!3570 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8447 thiss!1248))) (= (size!3744 (_keys!5426 thiss!1248)) (size!3745 (_values!3570 thiss!1248))) (bvsge (mask!8447 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3326 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3326 thiss!1248) #b00000000000000000000000000000011) (bvsge (bvor (extraKeys!3326 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvor (extraKeys!3326 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (not (= (bvand (extraKeys!3326 thiss!1248) #b00000000000000000000000000000001) (bvand (bvor (extraKeys!3326 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001)))))))

(declare-fun b!172958 () Bool)

(declare-fun e!114221 () Bool)

(assert (=> b!172958 (= e!114221 tp_is_empty!4061)))

(declare-fun res!82114 () Bool)

(assert (=> start!17242 (=> (not res!82114) (not e!114220))))

(declare-fun valid!967 (LongMapFixedSize!2282) Bool)

(assert (=> start!17242 (= res!82114 (valid!967 thiss!1248))))

(assert (=> start!17242 e!114220))

(declare-fun e!114224 () Bool)

(assert (=> start!17242 e!114224))

(assert (=> start!17242 true))

(declare-fun b!172954 () Bool)

(declare-fun e!114219 () Bool)

(assert (=> b!172954 (= e!114219 (and e!114221 mapRes!6912))))

(declare-fun condMapEmpty!6912 () Bool)

(declare-fun mapDefault!6912 () ValueCell!1687)

