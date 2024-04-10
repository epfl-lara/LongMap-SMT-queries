; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76354 () Bool)

(assert start!76354)

(declare-fun b!895885 () Bool)

(declare-fun b_free!15925 () Bool)

(declare-fun b_next!15925 () Bool)

(assert (=> b!895885 (= b_free!15925 (not b_next!15925))))

(declare-fun tp!55794 () Bool)

(declare-fun b_and!26217 () Bool)

(assert (=> b!895885 (= tp!55794 b_and!26217)))

(declare-fun b!895879 () Bool)

(declare-fun e!500621 () Bool)

(declare-fun tp_is_empty!18253 () Bool)

(assert (=> b!895879 (= e!500621 tp_is_empty!18253)))

(declare-fun b!895880 () Bool)

(declare-fun e!500623 () Bool)

(assert (=> b!895880 (= e!500623 tp_is_empty!18253)))

(declare-fun b!895881 () Bool)

(declare-fun res!605918 () Bool)

(declare-fun e!500622 () Bool)

(assert (=> b!895881 (=> (not res!605918) (not e!500622))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!895881 (= res!605918 (not (= key!785 (bvneg key!785))))))

(declare-fun b!895882 () Bool)

(declare-fun e!500620 () Bool)

(declare-fun mapRes!28984 () Bool)

(assert (=> b!895882 (= e!500620 (and e!500621 mapRes!28984))))

(declare-fun condMapEmpty!28984 () Bool)

(declare-datatypes ((array!52514 0))(
  ( (array!52515 (arr!25249 (Array (_ BitVec 32) (_ BitVec 64))) (size!25699 (_ BitVec 32))) )
))
(declare-datatypes ((V!29303 0))(
  ( (V!29304 (val!9177 Int)) )
))
(declare-datatypes ((ValueCell!8645 0))(
  ( (ValueCellFull!8645 (v!11667 V!29303)) (EmptyCell!8645) )
))
(declare-datatypes ((array!52516 0))(
  ( (array!52517 (arr!25250 (Array (_ BitVec 32) ValueCell!8645)) (size!25700 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4306 0))(
  ( (LongMapFixedSize!4307 (defaultEntry!5365 Int) (mask!25979 (_ BitVec 32)) (extraKeys!5061 (_ BitVec 32)) (zeroValue!5165 V!29303) (minValue!5165 V!29303) (_size!2208 (_ BitVec 32)) (_keys!10086 array!52514) (_values!5352 array!52516) (_vacant!2208 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4306)

(declare-fun mapDefault!28984 () ValueCell!8645)

