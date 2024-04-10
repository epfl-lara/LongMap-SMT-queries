; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16230 () Bool)

(assert start!16230)

(declare-fun b!161898 () Bool)

(declare-fun b_free!3691 () Bool)

(declare-fun b_next!3691 () Bool)

(assert (=> b!161898 (= b_free!3691 (not b_next!3691))))

(declare-fun tp!13642 () Bool)

(declare-fun b_and!10105 () Bool)

(assert (=> b!161898 (= tp!13642 b_and!10105)))

(declare-fun res!76689 () Bool)

(declare-fun e!105923 () Bool)

(assert (=> start!16230 (=> (not res!76689) (not e!105923))))

(declare-datatypes ((V!4305 0))(
  ( (V!4306 (val!1791 Int)) )
))
(declare-datatypes ((ValueCell!1403 0))(
  ( (ValueCellFull!1403 (v!3656 V!4305)) (EmptyCell!1403) )
))
(declare-datatypes ((array!6065 0))(
  ( (array!6066 (arr!2877 (Array (_ BitVec 32) (_ BitVec 64))) (size!3161 (_ BitVec 32))) )
))
(declare-datatypes ((array!6067 0))(
  ( (array!6068 (arr!2878 (Array (_ BitVec 32) ValueCell!1403)) (size!3162 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1714 0))(
  ( (LongMapFixedSize!1715 (defaultEntry!3299 Int) (mask!7905 (_ BitVec 32)) (extraKeys!3040 (_ BitVec 32)) (zeroValue!3142 V!4305) (minValue!3142 V!4305) (_size!906 (_ BitVec 32)) (_keys!5100 array!6065) (_values!3282 array!6067) (_vacant!906 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1714)

(declare-fun valid!779 (LongMapFixedSize!1714) Bool)

(assert (=> start!16230 (= res!76689 (valid!779 thiss!1248))))

(assert (=> start!16230 e!105923))

(declare-fun e!105930 () Bool)

(assert (=> start!16230 e!105930))

(assert (=> start!16230 true))

(declare-fun tp_is_empty!3493 () Bool)

(assert (=> start!16230 tp_is_empty!3493))

(declare-fun b!161891 () Bool)

(declare-fun e!105925 () Bool)

(declare-fun e!105924 () Bool)

(declare-fun mapRes!5927 () Bool)

(assert (=> b!161891 (= e!105925 (and e!105924 mapRes!5927))))

(declare-fun condMapEmpty!5927 () Bool)

(declare-fun mapDefault!5927 () ValueCell!1403)

