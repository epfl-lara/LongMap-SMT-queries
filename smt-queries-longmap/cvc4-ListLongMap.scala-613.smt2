; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15966 () Bool)

(assert start!15966)

(declare-fun b!158631 () Bool)

(declare-fun b_free!3491 () Bool)

(declare-fun b_next!3491 () Bool)

(assert (=> b!158631 (= b_free!3491 (not b_next!3491))))

(declare-fun tp!13030 () Bool)

(declare-fun b_and!9905 () Bool)

(assert (=> b!158631 (= tp!13030 b_and!9905)))

(declare-fun res!74910 () Bool)

(declare-fun e!103891 () Bool)

(assert (=> start!15966 (=> (not res!74910) (not e!103891))))

(declare-datatypes ((V!4037 0))(
  ( (V!4038 (val!1691 Int)) )
))
(declare-datatypes ((ValueCell!1303 0))(
  ( (ValueCellFull!1303 (v!3556 V!4037)) (EmptyCell!1303) )
))
(declare-datatypes ((array!5657 0))(
  ( (array!5658 (arr!2677 (Array (_ BitVec 32) (_ BitVec 64))) (size!2960 (_ BitVec 32))) )
))
(declare-datatypes ((array!5659 0))(
  ( (array!5660 (arr!2678 (Array (_ BitVec 32) ValueCell!1303)) (size!2961 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1514 0))(
  ( (LongMapFixedSize!1515 (defaultEntry!3199 Int) (mask!7722 (_ BitVec 32)) (extraKeys!2940 (_ BitVec 32)) (zeroValue!3042 V!4037) (minValue!3042 V!4037) (_size!806 (_ BitVec 32)) (_keys!4990 array!5657) (_values!3182 array!5659) (_vacant!806 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1514)

(declare-fun valid!713 (LongMapFixedSize!1514) Bool)

(assert (=> start!15966 (= res!74910 (valid!713 thiss!1248))))

(assert (=> start!15966 e!103891))

(declare-fun e!103886 () Bool)

(assert (=> start!15966 e!103886))

(assert (=> start!15966 true))

(declare-fun mapIsEmpty!5614 () Bool)

(declare-fun mapRes!5614 () Bool)

(assert (=> mapIsEmpty!5614 mapRes!5614))

(declare-fun b!158627 () Bool)

(declare-fun res!74908 () Bool)

(assert (=> b!158627 (=> (not res!74908) (not e!103891))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!299 0))(
  ( (MissingZero!299 (index!3364 (_ BitVec 32))) (Found!299 (index!3365 (_ BitVec 32))) (Intermediate!299 (undefined!1111 Bool) (index!3366 (_ BitVec 32)) (x!17506 (_ BitVec 32))) (Undefined!299) (MissingVacant!299 (index!3367 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5657 (_ BitVec 32)) SeekEntryResult!299)

(assert (=> b!158627 (= res!74908 (is-Undefined!299 (seekEntryOrOpen!0 key!828 (_keys!4990 thiss!1248) (mask!7722 thiss!1248))))))

(declare-fun b!158628 () Bool)

(declare-fun e!103890 () Bool)

(declare-fun e!103889 () Bool)

(assert (=> b!158628 (= e!103890 (and e!103889 mapRes!5614))))

(declare-fun condMapEmpty!5614 () Bool)

(declare-fun mapDefault!5614 () ValueCell!1303)

