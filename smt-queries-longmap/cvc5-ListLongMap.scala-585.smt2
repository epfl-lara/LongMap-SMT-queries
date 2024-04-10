; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15652 () Bool)

(assert start!15652)

(declare-fun b!155964 () Bool)

(declare-fun b_free!3319 () Bool)

(declare-fun b_next!3319 () Bool)

(assert (=> b!155964 (= b_free!3319 (not b_next!3319))))

(declare-fun tp!12481 () Bool)

(declare-fun b_and!9733 () Bool)

(assert (=> b!155964 (= tp!12481 b_and!9733)))

(declare-fun res!73672 () Bool)

(declare-fun e!101962 () Bool)

(assert (=> start!15652 (=> (not res!73672) (not e!101962))))

(declare-datatypes ((V!3809 0))(
  ( (V!3810 (val!1605 Int)) )
))
(declare-datatypes ((ValueCell!1217 0))(
  ( (ValueCellFull!1217 (v!3470 V!3809)) (EmptyCell!1217) )
))
(declare-datatypes ((array!5295 0))(
  ( (array!5296 (arr!2505 (Array (_ BitVec 32) (_ BitVec 64))) (size!2783 (_ BitVec 32))) )
))
(declare-datatypes ((array!5297 0))(
  ( (array!5298 (arr!2506 (Array (_ BitVec 32) ValueCell!1217)) (size!2784 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1342 0))(
  ( (LongMapFixedSize!1343 (defaultEntry!3113 Int) (mask!7552 (_ BitVec 32)) (extraKeys!2854 (_ BitVec 32)) (zeroValue!2956 V!3809) (minValue!2956 V!3809) (_size!720 (_ BitVec 32)) (_keys!4888 array!5295) (_values!3096 array!5297) (_vacant!720 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1342)

(declare-fun valid!653 (LongMapFixedSize!1342) Bool)

(assert (=> start!15652 (= res!73672 (valid!653 thiss!1248))))

(assert (=> start!15652 e!101962))

(declare-fun e!101963 () Bool)

(assert (=> start!15652 e!101963))

(assert (=> start!15652 true))

(declare-fun tp_is_empty!3121 () Bool)

(assert (=> start!15652 tp_is_empty!3121))

(declare-fun b!155961 () Bool)

(declare-fun e!101967 () Bool)

(assert (=> b!155961 (= e!101967 tp_is_empty!3121)))

(declare-fun b!155962 () Bool)

(assert (=> b!155962 (= e!101962 (not true))))

(declare-fun lt!81478 () Bool)

(declare-fun v!309 () V!3809)

(assert (=> b!155962 (= lt!81478 (valid!653 (LongMapFixedSize!1343 (defaultEntry!3113 thiss!1248) (mask!7552 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) (_size!720 thiss!1248) (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (_vacant!720 thiss!1248))))))

(declare-datatypes ((tuple2!2844 0))(
  ( (tuple2!2845 (_1!1433 (_ BitVec 64)) (_2!1433 V!3809)) )
))
(declare-datatypes ((List!1840 0))(
  ( (Nil!1837) (Cons!1836 (h!2445 tuple2!2844) (t!6642 List!1840)) )
))
(declare-datatypes ((ListLongMap!1831 0))(
  ( (ListLongMap!1832 (toList!931 List!1840)) )
))
(declare-fun +!199 (ListLongMap!1831 tuple2!2844) ListLongMap!1831)

(declare-fun getCurrentListMap!595 (array!5295 array!5297 (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 (_ BitVec 32) Int) ListLongMap!1831)

(assert (=> b!155962 (= (+!199 (getCurrentListMap!595 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (extraKeys!2854 thiss!1248) (zeroValue!2956 thiss!1248) (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)) (tuple2!2845 #b0000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!595 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) v!309 (minValue!2956 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3113 thiss!1248)))))

(declare-datatypes ((Unit!4942 0))(
  ( (Unit!4943) )
))
(declare-fun lt!81477 () Unit!4942)

(declare-fun lemmaChangeZeroKeyThenAddPairToListMap!78 (array!5295 array!5297 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!3809 V!3809 V!3809 Int) Unit!4942)

(assert (=> b!155962 (= lt!81477 (lemmaChangeZeroKeyThenAddPairToListMap!78 (_keys!4888 thiss!1248) (_values!3096 thiss!1248) (mask!7552 thiss!1248) (extraKeys!2854 thiss!1248) (bvor (extraKeys!2854 thiss!1248) #b00000000000000000000000000000001) (zeroValue!2956 thiss!1248) v!309 (minValue!2956 thiss!1248) (defaultEntry!3113 thiss!1248)))))

(declare-fun b!155963 () Bool)

(declare-fun e!101965 () Bool)

(declare-fun mapRes!5324 () Bool)

(assert (=> b!155963 (= e!101965 (and e!101967 mapRes!5324))))

(declare-fun condMapEmpty!5324 () Bool)

(declare-fun mapDefault!5324 () ValueCell!1217)

