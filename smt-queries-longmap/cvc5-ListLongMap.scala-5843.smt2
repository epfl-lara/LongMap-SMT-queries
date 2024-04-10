; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75488 () Bool)

(assert start!75488)

(declare-fun b!888328 () Bool)

(declare-fun b_free!15559 () Bool)

(declare-fun b_next!15559 () Bool)

(assert (=> b!888328 (= b_free!15559 (not b_next!15559))))

(declare-fun tp!54627 () Bool)

(declare-fun b_and!25797 () Bool)

(assert (=> b!888328 (= tp!54627 b_and!25797)))

(declare-fun lt!401715 () Bool)

(declare-datatypes ((array!51744 0))(
  ( (array!51745 (arr!24883 (Array (_ BitVec 32) (_ BitVec 64))) (size!25324 (_ BitVec 32))) )
))
(declare-datatypes ((V!28815 0))(
  ( (V!28816 (val!8994 Int)) )
))
(declare-datatypes ((ValueCell!8462 0))(
  ( (ValueCellFull!8462 (v!11467 V!28815)) (EmptyCell!8462) )
))
(declare-datatypes ((array!51746 0))(
  ( (array!51747 (arr!24884 (Array (_ BitVec 32) ValueCell!8462)) (size!25325 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3940 0))(
  ( (LongMapFixedSize!3941 (defaultEntry!5164 Int) (mask!25582 (_ BitVec 32)) (extraKeys!4858 (_ BitVec 32)) (zeroValue!4962 V!28815) (minValue!4962 V!28815) (_size!2025 (_ BitVec 32)) (_keys!9843 array!51744) (_values!5149 array!51746) (_vacant!2025 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3940)

(declare-fun valid!1537 (LongMapFixedSize!3940) Bool)

(assert (=> start!75488 (= lt!401715 (valid!1537 thiss!1181))))

(assert (=> start!75488 false))

(declare-fun e!494936 () Bool)

(assert (=> start!75488 e!494936))

(declare-fun b!888325 () Bool)

(declare-fun e!494935 () Bool)

(declare-fun tp_is_empty!17887 () Bool)

(assert (=> b!888325 (= e!494935 tp_is_empty!17887)))

(declare-fun b!888326 () Bool)

(declare-fun e!494934 () Bool)

(assert (=> b!888326 (= e!494934 tp_is_empty!17887)))

(declare-fun b!888327 () Bool)

(declare-fun e!494932 () Bool)

(declare-fun mapRes!28367 () Bool)

(assert (=> b!888327 (= e!494932 (and e!494935 mapRes!28367))))

(declare-fun condMapEmpty!28367 () Bool)

(declare-fun mapDefault!28367 () ValueCell!8462)

