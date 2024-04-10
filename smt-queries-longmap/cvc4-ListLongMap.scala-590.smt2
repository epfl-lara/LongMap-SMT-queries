; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15686 () Bool)

(assert start!15686)

(declare-fun b!156372 () Bool)

(declare-fun b_free!3353 () Bool)

(declare-fun b_next!3353 () Bool)

(assert (=> b!156372 (= b_free!3353 (not b_next!3353))))

(declare-fun tp!12583 () Bool)

(declare-fun b_and!9767 () Bool)

(assert (=> b!156372 (= tp!12583 b_and!9767)))

(declare-fun tp_is_empty!3155 () Bool)

(declare-fun e!102269 () Bool)

(declare-datatypes ((V!3853 0))(
  ( (V!3854 (val!1622 Int)) )
))
(declare-datatypes ((ValueCell!1234 0))(
  ( (ValueCellFull!1234 (v!3487 V!3853)) (EmptyCell!1234) )
))
(declare-datatypes ((array!5363 0))(
  ( (array!5364 (arr!2539 (Array (_ BitVec 32) (_ BitVec 64))) (size!2817 (_ BitVec 32))) )
))
(declare-datatypes ((array!5365 0))(
  ( (array!5366 (arr!2540 (Array (_ BitVec 32) ValueCell!1234)) (size!2818 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1376 0))(
  ( (LongMapFixedSize!1377 (defaultEntry!3130 Int) (mask!7579 (_ BitVec 32)) (extraKeys!2871 (_ BitVec 32)) (zeroValue!2973 V!3853) (minValue!2973 V!3853) (_size!737 (_ BitVec 32)) (_keys!4905 array!5363) (_values!3113 array!5365) (_vacant!737 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1376)

(declare-fun e!102270 () Bool)

(declare-fun array_inv!1605 (array!5363) Bool)

(declare-fun array_inv!1606 (array!5365) Bool)

(assert (=> b!156372 (= e!102269 (and tp!12583 tp_is_empty!3155 (array_inv!1605 (_keys!4905 thiss!1248)) (array_inv!1606 (_values!3113 thiss!1248)) e!102270))))

(declare-fun b!156373 () Bool)

(declare-fun e!102273 () Bool)

(assert (=> b!156373 (= e!102273 false)))

(declare-fun lt!81544 () Bool)

(declare-datatypes ((List!1854 0))(
  ( (Nil!1851) (Cons!1850 (h!2459 (_ BitVec 64)) (t!6656 List!1854)) )
))
(declare-fun arrayNoDuplicates!0 (array!5363 (_ BitVec 32) List!1854) Bool)

(assert (=> b!156373 (= lt!81544 (arrayNoDuplicates!0 (_keys!4905 thiss!1248) #b00000000000000000000000000000000 Nil!1851))))

(declare-fun b!156374 () Bool)

(declare-fun res!73882 () Bool)

(assert (=> b!156374 (=> (not res!73882) (not e!102273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!156374 (= res!73882 (validMask!0 (mask!7579 thiss!1248)))))

(declare-fun mapNonEmpty!5375 () Bool)

(declare-fun mapRes!5375 () Bool)

(declare-fun tp!12584 () Bool)

(declare-fun e!102268 () Bool)

(assert (=> mapNonEmpty!5375 (= mapRes!5375 (and tp!12584 e!102268))))

(declare-fun mapRest!5375 () (Array (_ BitVec 32) ValueCell!1234))

(declare-fun mapValue!5375 () ValueCell!1234)

(declare-fun mapKey!5375 () (_ BitVec 32))

(assert (=> mapNonEmpty!5375 (= (arr!2540 (_values!3113 thiss!1248)) (store mapRest!5375 mapKey!5375 mapValue!5375))))

(declare-fun b!156375 () Bool)

(declare-fun res!73878 () Bool)

(assert (=> b!156375 (=> (not res!73878) (not e!102273))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!156375 (= res!73878 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!156376 () Bool)

(declare-fun e!102272 () Bool)

(assert (=> b!156376 (= e!102270 (and e!102272 mapRes!5375))))

(declare-fun condMapEmpty!5375 () Bool)

(declare-fun mapDefault!5375 () ValueCell!1234)

