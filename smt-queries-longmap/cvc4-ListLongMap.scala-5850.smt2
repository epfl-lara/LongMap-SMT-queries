; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75608 () Bool)

(assert start!75608)

(declare-fun b!889103 () Bool)

(declare-fun b_free!15605 () Bool)

(declare-fun b_next!15605 () Bool)

(assert (=> b!889103 (= b_free!15605 (not b_next!15605))))

(declare-fun tp!54777 () Bool)

(declare-fun b_and!25845 () Bool)

(assert (=> b!889103 (= tp!54777 b_and!25845)))

(declare-fun b!889098 () Bool)

(declare-fun res!602603 () Bool)

(declare-fun e!495541 () Bool)

(assert (=> b!889098 (=> (not res!602603) (not e!495541))))

(declare-datatypes ((array!51842 0))(
  ( (array!51843 (arr!24929 (Array (_ BitVec 32) (_ BitVec 64))) (size!25372 (_ BitVec 32))) )
))
(declare-datatypes ((V!28875 0))(
  ( (V!28876 (val!9017 Int)) )
))
(declare-datatypes ((ValueCell!8485 0))(
  ( (ValueCellFull!8485 (v!11495 V!28875)) (EmptyCell!8485) )
))
(declare-datatypes ((array!51844 0))(
  ( (array!51845 (arr!24930 (Array (_ BitVec 32) ValueCell!8485)) (size!25373 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3986 0))(
  ( (LongMapFixedSize!3987 (defaultEntry!5190 Int) (mask!25628 (_ BitVec 32)) (extraKeys!4884 (_ BitVec 32)) (zeroValue!4988 V!28875) (minValue!4988 V!28875) (_size!2048 (_ BitVec 32)) (_keys!9872 array!51842) (_values!5175 array!51844) (_vacant!2048 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3986)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889098 (= res!602603 (validMask!0 (mask!25628 thiss!1181)))))

(declare-fun b!889099 () Bool)

(declare-fun e!495540 () Bool)

(declare-fun e!495543 () Bool)

(declare-fun mapRes!28447 () Bool)

(assert (=> b!889099 (= e!495540 (and e!495543 mapRes!28447))))

(declare-fun condMapEmpty!28447 () Bool)

(declare-fun mapDefault!28447 () ValueCell!8485)

