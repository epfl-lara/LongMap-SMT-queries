; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21706 () Bool)

(assert start!21706)

(declare-fun b!218119 () Bool)

(declare-fun b_free!5855 () Bool)

(declare-fun b_next!5855 () Bool)

(assert (=> b!218119 (= b_free!5855 (not b_next!5855))))

(declare-fun tp!20699 () Bool)

(declare-fun b_and!12745 () Bool)

(assert (=> b!218119 (= tp!20699 b_and!12745)))

(declare-datatypes ((V!7269 0))(
  ( (V!7270 (val!2903 Int)) )
))
(declare-datatypes ((ValueCell!2515 0))(
  ( (ValueCellFull!2515 (v!4921 V!7269)) (EmptyCell!2515) )
))
(declare-datatypes ((array!10673 0))(
  ( (array!10674 (arr!5058 (Array (_ BitVec 32) ValueCell!2515)) (size!5390 (_ BitVec 32))) )
))
(declare-datatypes ((array!10675 0))(
  ( (array!10676 (arr!5059 (Array (_ BitVec 32) (_ BitVec 64))) (size!5391 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2930 0))(
  ( (LongMapFixedSize!2931 (defaultEntry!4115 Int) (mask!9884 (_ BitVec 32)) (extraKeys!3852 (_ BitVec 32)) (zeroValue!3956 V!7269) (minValue!3956 V!7269) (_size!1514 (_ BitVec 32)) (_keys!6164 array!10675) (_values!4098 array!10673) (_vacant!1514 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2930)

(declare-fun e!141890 () Bool)

(declare-fun e!141888 () Bool)

(declare-fun tp_is_empty!5717 () Bool)

(declare-fun array_inv!3351 (array!10675) Bool)

(declare-fun array_inv!3352 (array!10673) Bool)

(assert (=> b!218119 (= e!141888 (and tp!20699 tp_is_empty!5717 (array_inv!3351 (_keys!6164 thiss!1504)) (array_inv!3352 (_values!4098 thiss!1504)) e!141890))))

(declare-fun b!218120 () Bool)

(declare-fun res!106908 () Bool)

(declare-fun e!141892 () Bool)

(assert (=> b!218120 (=> (not res!106908) (not e!141892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10675 (_ BitVec 32)) Bool)

(assert (=> b!218120 (= res!106908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6164 thiss!1504) (mask!9884 thiss!1504)))))

(declare-fun b!218121 () Bool)

(declare-fun e!141887 () Bool)

(declare-fun mapRes!9738 () Bool)

(assert (=> b!218121 (= e!141890 (and e!141887 mapRes!9738))))

(declare-fun condMapEmpty!9738 () Bool)

(declare-fun mapDefault!9738 () ValueCell!2515)

