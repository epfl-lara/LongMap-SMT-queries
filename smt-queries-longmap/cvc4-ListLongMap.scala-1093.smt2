; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22372 () Bool)

(assert start!22372)

(declare-fun b!234331 () Bool)

(declare-fun b_free!6311 () Bool)

(declare-fun b_next!6311 () Bool)

(assert (=> b!234331 (= b_free!6311 (not b_next!6311))))

(declare-fun tp!22088 () Bool)

(declare-fun b_and!13225 () Bool)

(assert (=> b!234331 (= tp!22088 b_and!13225)))

(declare-fun b!234326 () Bool)

(declare-fun res!114952 () Bool)

(declare-fun e!152212 () Bool)

(assert (=> b!234326 (=> (not res!114952) (not e!152212))))

(declare-datatypes ((V!7877 0))(
  ( (V!7878 (val!3131 Int)) )
))
(declare-datatypes ((ValueCell!2743 0))(
  ( (ValueCellFull!2743 (v!5155 V!7877)) (EmptyCell!2743) )
))
(declare-datatypes ((array!11597 0))(
  ( (array!11598 (arr!5514 (Array (_ BitVec 32) ValueCell!2743)) (size!5849 (_ BitVec 32))) )
))
(declare-datatypes ((array!11599 0))(
  ( (array!11600 (arr!5515 (Array (_ BitVec 32) (_ BitVec 64))) (size!5850 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3386 0))(
  ( (LongMapFixedSize!3387 (defaultEntry!4358 Int) (mask!10304 (_ BitVec 32)) (extraKeys!4095 (_ BitVec 32)) (zeroValue!4199 V!7877) (minValue!4199 V!7877) (_size!1742 (_ BitVec 32)) (_keys!6422 array!11599) (_values!4341 array!11597) (_vacant!1742 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3386)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234326 (= res!114952 (validMask!0 (mask!10304 thiss!1504)))))

(declare-fun b!234327 () Bool)

(declare-fun e!152216 () Bool)

(declare-fun e!152213 () Bool)

(declare-fun mapRes!10443 () Bool)

(assert (=> b!234327 (= e!152216 (and e!152213 mapRes!10443))))

(declare-fun condMapEmpty!10443 () Bool)

(declare-fun mapDefault!10443 () ValueCell!2743)

