; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17238 () Bool)

(assert start!17238)

(declare-fun b!172917 () Bool)

(declare-fun b_free!4285 () Bool)

(declare-fun b_next!4285 () Bool)

(assert (=> b!172917 (= b_free!4285 (not b_next!4285))))

(declare-fun tp!15513 () Bool)

(declare-fun b_and!10725 () Bool)

(assert (=> b!172917 (= tp!15513 b_and!10725)))

(declare-fun res!82098 () Bool)

(declare-fun e!114188 () Bool)

(assert (=> start!17238 (=> (not res!82098) (not e!114188))))

(declare-datatypes ((V!5057 0))(
  ( (V!5058 (val!2073 Int)) )
))
(declare-datatypes ((ValueCell!1685 0))(
  ( (ValueCellFull!1685 (v!3941 V!5057)) (EmptyCell!1685) )
))
(declare-datatypes ((array!7241 0))(
  ( (array!7242 (arr!3441 (Array (_ BitVec 32) (_ BitVec 64))) (size!3740 (_ BitVec 32))) )
))
(declare-datatypes ((array!7243 0))(
  ( (array!7244 (arr!3442 (Array (_ BitVec 32) ValueCell!1685)) (size!3741 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2278 0))(
  ( (LongMapFixedSize!2279 (defaultEntry!3585 Int) (mask!8445 (_ BitVec 32)) (extraKeys!3324 (_ BitVec 32)) (zeroValue!3426 V!5057) (minValue!3428 V!5057) (_size!1188 (_ BitVec 32)) (_keys!5424 array!7241) (_values!3568 array!7243) (_vacant!1188 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2278)

(declare-fun valid!965 (LongMapFixedSize!2278) Bool)

(assert (=> start!17238 (= res!82098 (valid!965 thiss!1248))))

(assert (=> start!17238 e!114188))

(declare-fun e!114184 () Bool)

(assert (=> start!17238 e!114184))

(assert (=> start!17238 true))

(declare-fun b!172911 () Bool)

(declare-fun res!82096 () Bool)

(assert (=> b!172911 (=> (not res!82096) (not e!114188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!172911 (= res!82096 (validMask!0 (mask!8445 thiss!1248)))))

(declare-fun b!172912 () Bool)

(declare-fun res!82097 () Bool)

(assert (=> b!172912 (=> (not res!82097) (not e!114188))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!172912 (= res!82097 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!172913 () Bool)

(declare-fun e!114183 () Bool)

(declare-fun tp_is_empty!4057 () Bool)

(assert (=> b!172913 (= e!114183 tp_is_empty!4057)))

(declare-fun mapIsEmpty!6906 () Bool)

(declare-fun mapRes!6906 () Bool)

(assert (=> mapIsEmpty!6906 mapRes!6906))

(declare-fun b!172914 () Bool)

(declare-fun e!114187 () Bool)

(assert (=> b!172914 (= e!114187 tp_is_empty!4057)))

(declare-fun mapNonEmpty!6906 () Bool)

(declare-fun tp!15512 () Bool)

(assert (=> mapNonEmpty!6906 (= mapRes!6906 (and tp!15512 e!114183))))

(declare-fun mapValue!6906 () ValueCell!1685)

(declare-fun mapRest!6906 () (Array (_ BitVec 32) ValueCell!1685))

(declare-fun mapKey!6906 () (_ BitVec 32))

(assert (=> mapNonEmpty!6906 (= (arr!3442 (_values!3568 thiss!1248)) (store mapRest!6906 mapKey!6906 mapValue!6906))))

(declare-fun b!172915 () Bool)

(declare-fun e!114186 () Bool)

(assert (=> b!172915 (= e!114186 (and e!114187 mapRes!6906))))

(declare-fun condMapEmpty!6906 () Bool)

(declare-fun mapDefault!6906 () ValueCell!1685)

