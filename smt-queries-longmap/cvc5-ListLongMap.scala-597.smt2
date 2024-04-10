; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15724 () Bool)

(assert start!15724)

(declare-fun b!156887 () Bool)

(declare-fun b_free!3391 () Bool)

(declare-fun b_next!3391 () Bool)

(assert (=> b!156887 (= b_free!3391 (not b_next!3391))))

(declare-fun tp!12697 () Bool)

(declare-fun b_and!9805 () Bool)

(assert (=> b!156887 (= tp!12697 b_and!9805)))

(declare-fun b!156885 () Bool)

(declare-fun res!74164 () Bool)

(declare-fun e!102612 () Bool)

(assert (=> b!156885 (=> (not res!74164) (not e!102612))))

(declare-datatypes ((V!3905 0))(
  ( (V!3906 (val!1641 Int)) )
))
(declare-datatypes ((ValueCell!1253 0))(
  ( (ValueCellFull!1253 (v!3506 V!3905)) (EmptyCell!1253) )
))
(declare-datatypes ((array!5439 0))(
  ( (array!5440 (arr!2577 (Array (_ BitVec 32) (_ BitVec 64))) (size!2855 (_ BitVec 32))) )
))
(declare-datatypes ((array!5441 0))(
  ( (array!5442 (arr!2578 (Array (_ BitVec 32) ValueCell!1253)) (size!2856 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1414 0))(
  ( (LongMapFixedSize!1415 (defaultEntry!3149 Int) (mask!7612 (_ BitVec 32)) (extraKeys!2890 (_ BitVec 32)) (zeroValue!2992 V!3905) (minValue!2992 V!3905) (_size!756 (_ BitVec 32)) (_keys!4924 array!5439) (_values!3132 array!5441) (_vacant!756 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1414)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5439 (_ BitVec 32)) Bool)

(assert (=> b!156885 (= res!74164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!4924 thiss!1248) (mask!7612 thiss!1248)))))

(declare-fun b!156886 () Bool)

(declare-fun e!102610 () Bool)

(declare-fun e!102611 () Bool)

(declare-fun mapRes!5432 () Bool)

(assert (=> b!156886 (= e!102610 (and e!102611 mapRes!5432))))

(declare-fun condMapEmpty!5432 () Bool)

(declare-fun mapDefault!5432 () ValueCell!1253)

