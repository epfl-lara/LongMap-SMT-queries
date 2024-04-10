; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17592 () Bool)

(assert start!17592)

(declare-fun b!176046 () Bool)

(declare-fun b_free!4349 () Bool)

(declare-fun b_next!4349 () Bool)

(assert (=> b!176046 (= b_free!4349 (not b_next!4349))))

(declare-fun tp!15733 () Bool)

(declare-fun b_and!10837 () Bool)

(assert (=> b!176046 (= tp!15733 b_and!10837)))

(declare-fun b!176041 () Bool)

(declare-fun e!116175 () Bool)

(declare-fun tp_is_empty!4121 () Bool)

(assert (=> b!176041 (= e!116175 tp_is_empty!4121)))

(declare-fun mapIsEmpty!7031 () Bool)

(declare-fun mapRes!7031 () Bool)

(assert (=> mapIsEmpty!7031 mapRes!7031))

(declare-fun b!176042 () Bool)

(declare-fun res!83442 () Bool)

(declare-fun e!116172 () Bool)

(assert (=> b!176042 (=> (not res!83442) (not e!116172))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!176042 (= res!83442 (not (= key!828 (bvneg key!828))))))

(declare-fun res!83441 () Bool)

(assert (=> start!17592 (=> (not res!83441) (not e!116172))))

(declare-datatypes ((V!5141 0))(
  ( (V!5142 (val!2105 Int)) )
))
(declare-datatypes ((ValueCell!1717 0))(
  ( (ValueCellFull!1717 (v!3981 V!5141)) (EmptyCell!1717) )
))
(declare-datatypes ((array!7385 0))(
  ( (array!7386 (arr!3505 (Array (_ BitVec 32) (_ BitVec 64))) (size!3808 (_ BitVec 32))) )
))
(declare-datatypes ((array!7387 0))(
  ( (array!7388 (arr!3506 (Array (_ BitVec 32) ValueCell!1717)) (size!3809 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2342 0))(
  ( (LongMapFixedSize!2343 (defaultEntry!3629 Int) (mask!8538 (_ BitVec 32)) (extraKeys!3366 (_ BitVec 32)) (zeroValue!3470 V!5141) (minValue!3470 V!5141) (_size!1220 (_ BitVec 32)) (_keys!5486 array!7385) (_values!3612 array!7387) (_vacant!1220 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2342)

(declare-fun valid!986 (LongMapFixedSize!2342) Bool)

(assert (=> start!17592 (= res!83441 (valid!986 thiss!1248))))

(assert (=> start!17592 e!116172))

(declare-fun e!116174 () Bool)

(assert (=> start!17592 e!116174))

(assert (=> start!17592 true))

(declare-fun b!176043 () Bool)

(declare-fun res!83439 () Bool)

(assert (=> b!176043 (=> (not res!83439) (not e!116172))))

(declare-datatypes ((tuple2!3274 0))(
  ( (tuple2!3275 (_1!1648 (_ BitVec 64)) (_2!1648 V!5141)) )
))
(declare-datatypes ((List!2229 0))(
  ( (Nil!2226) (Cons!2225 (h!2845 tuple2!3274) (t!7051 List!2229)) )
))
(declare-datatypes ((ListLongMap!2201 0))(
  ( (ListLongMap!2202 (toList!1116 List!2229)) )
))
(declare-fun contains!1178 (ListLongMap!2201 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!768 (array!7385 array!7387 (_ BitVec 32) (_ BitVec 32) V!5141 V!5141 (_ BitVec 32) Int) ListLongMap!2201)

(assert (=> b!176043 (= res!83439 (contains!1178 (getCurrentListMap!768 (_keys!5486 thiss!1248) (_values!3612 thiss!1248) (mask!8538 thiss!1248) (extraKeys!3366 thiss!1248) (zeroValue!3470 thiss!1248) (minValue!3470 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3629 thiss!1248)) key!828))))

(declare-fun b!176044 () Bool)

(declare-fun e!116171 () Bool)

(assert (=> b!176044 (= e!116171 (and e!116175 mapRes!7031))))

(declare-fun condMapEmpty!7031 () Bool)

(declare-fun mapDefault!7031 () ValueCell!1717)

