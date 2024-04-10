; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16108 () Bool)

(assert start!16108)

(declare-fun b!160192 () Bool)

(declare-fun b_free!3569 () Bool)

(declare-fun b_next!3569 () Bool)

(assert (=> b!160192 (= b_free!3569 (not b_next!3569))))

(declare-fun tp!13277 () Bool)

(declare-fun b_and!9983 () Bool)

(assert (=> b!160192 (= tp!13277 b_and!9983)))

(declare-fun mapIsEmpty!5744 () Bool)

(declare-fun mapRes!5744 () Bool)

(assert (=> mapIsEmpty!5744 mapRes!5744))

(declare-fun b!160188 () Bool)

(declare-fun res!75808 () Bool)

(declare-fun e!104770 () Bool)

(assert (=> b!160188 (=> (not res!75808) (not e!104770))))

(declare-datatypes ((V!4141 0))(
  ( (V!4142 (val!1730 Int)) )
))
(declare-datatypes ((ValueCell!1342 0))(
  ( (ValueCellFull!1342 (v!3595 V!4141)) (EmptyCell!1342) )
))
(declare-datatypes ((array!5821 0))(
  ( (array!5822 (arr!2755 (Array (_ BitVec 32) (_ BitVec 64))) (size!3039 (_ BitVec 32))) )
))
(declare-datatypes ((array!5823 0))(
  ( (array!5824 (arr!2756 (Array (_ BitVec 32) ValueCell!1342)) (size!3040 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1592 0))(
  ( (LongMapFixedSize!1593 (defaultEntry!3238 Int) (mask!7802 (_ BitVec 32)) (extraKeys!2979 (_ BitVec 32)) (zeroValue!3081 V!4141) (minValue!3081 V!4141) (_size!845 (_ BitVec 32)) (_keys!5039 array!5821) (_values!3221 array!5823) (_vacant!845 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1592)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5821 (_ BitVec 32)) Bool)

(assert (=> b!160188 (= res!75808 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5039 thiss!1248) (mask!7802 thiss!1248)))))

(declare-fun mapNonEmpty!5744 () Bool)

(declare-fun tp!13276 () Bool)

(declare-fun e!104769 () Bool)

(assert (=> mapNonEmpty!5744 (= mapRes!5744 (and tp!13276 e!104769))))

(declare-fun mapRest!5744 () (Array (_ BitVec 32) ValueCell!1342))

(declare-fun mapValue!5744 () ValueCell!1342)

(declare-fun mapKey!5744 () (_ BitVec 32))

(assert (=> mapNonEmpty!5744 (= (arr!2756 (_values!3221 thiss!1248)) (store mapRest!5744 mapKey!5744 mapValue!5744))))

(declare-fun b!160189 () Bool)

(declare-fun res!75807 () Bool)

(assert (=> b!160189 (=> (not res!75807) (not e!104770))))

(assert (=> b!160189 (= res!75807 (and (= (size!3040 (_values!3221 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7802 thiss!1248))) (= (size!3039 (_keys!5039 thiss!1248)) (size!3040 (_values!3221 thiss!1248))) (bvsge (mask!7802 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2979 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2979 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160190 () Bool)

(declare-fun res!75811 () Bool)

(assert (=> b!160190 (=> (not res!75811) (not e!104770))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160190 (= res!75811 (validMask!0 (mask!7802 thiss!1248)))))

(declare-fun b!160191 () Bool)

(assert (=> b!160191 (= e!104770 false)))

(declare-fun lt!82066 () Bool)

(declare-datatypes ((List!1933 0))(
  ( (Nil!1930) (Cons!1929 (h!2542 (_ BitVec 64)) (t!6735 List!1933)) )
))
(declare-fun arrayNoDuplicates!0 (array!5821 (_ BitVec 32) List!1933) Bool)

(assert (=> b!160191 (= lt!82066 (arrayNoDuplicates!0 (_keys!5039 thiss!1248) #b00000000000000000000000000000000 Nil!1930))))

(declare-fun tp_is_empty!3371 () Bool)

(declare-fun e!104771 () Bool)

(declare-fun e!104772 () Bool)

(declare-fun array_inv!1755 (array!5821) Bool)

(declare-fun array_inv!1756 (array!5823) Bool)

(assert (=> b!160192 (= e!104771 (and tp!13277 tp_is_empty!3371 (array_inv!1755 (_keys!5039 thiss!1248)) (array_inv!1756 (_values!3221 thiss!1248)) e!104772))))

(declare-fun b!160193 () Bool)

(assert (=> b!160193 (= e!104769 tp_is_empty!3371)))

(declare-fun b!160195 () Bool)

(declare-fun res!75810 () Bool)

(assert (=> b!160195 (=> (not res!75810) (not e!104770))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!160195 (= res!75810 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160196 () Bool)

(declare-fun e!104768 () Bool)

(assert (=> b!160196 (= e!104772 (and e!104768 mapRes!5744))))

(declare-fun condMapEmpty!5744 () Bool)

(declare-fun mapDefault!5744 () ValueCell!1342)

