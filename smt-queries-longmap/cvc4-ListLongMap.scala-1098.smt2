; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22536 () Bool)

(assert start!22536)

(declare-fun b!235668 () Bool)

(declare-fun b_free!6341 () Bool)

(declare-fun b_next!6341 () Bool)

(assert (=> b!235668 (= b_free!6341 (not b_next!6341))))

(declare-fun tp!22192 () Bool)

(declare-fun b_and!13271 () Bool)

(assert (=> b!235668 (= tp!22192 b_and!13271)))

(declare-fun b!235667 () Bool)

(declare-fun res!115592 () Bool)

(declare-fun e!153045 () Bool)

(assert (=> b!235667 (=> (not res!115592) (not e!153045))))

(declare-datatypes ((V!7917 0))(
  ( (V!7918 (val!3146 Int)) )
))
(declare-datatypes ((ValueCell!2758 0))(
  ( (ValueCellFull!2758 (v!5174 V!7917)) (EmptyCell!2758) )
))
(declare-datatypes ((array!11665 0))(
  ( (array!11666 (arr!5544 (Array (_ BitVec 32) ValueCell!2758)) (size!5881 (_ BitVec 32))) )
))
(declare-datatypes ((array!11667 0))(
  ( (array!11668 (arr!5545 (Array (_ BitVec 32) (_ BitVec 64))) (size!5882 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3416 0))(
  ( (LongMapFixedSize!3417 (defaultEntry!4379 Int) (mask!10353 (_ BitVec 32)) (extraKeys!4116 (_ BitVec 32)) (zeroValue!4220 V!7917) (minValue!4220 V!7917) (_size!1757 (_ BitVec 32)) (_keys!6455 array!11667) (_values!4362 array!11665) (_vacant!1757 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3416)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11667 (_ BitVec 32)) Bool)

(assert (=> b!235667 (= res!115592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6455 thiss!1504) (mask!10353 thiss!1504)))))

(declare-fun res!115593 () Bool)

(declare-fun e!153043 () Bool)

(assert (=> start!22536 (=> (not res!115593) (not e!153043))))

(declare-fun valid!1350 (LongMapFixedSize!3416) Bool)

(assert (=> start!22536 (= res!115593 (valid!1350 thiss!1504))))

(assert (=> start!22536 e!153043))

(declare-fun e!153046 () Bool)

(assert (=> start!22536 e!153046))

(assert (=> start!22536 true))

(declare-fun tp_is_empty!6203 () Bool)

(declare-fun e!153044 () Bool)

(declare-fun array_inv!3659 (array!11667) Bool)

(declare-fun array_inv!3660 (array!11665) Bool)

(assert (=> b!235668 (= e!153046 (and tp!22192 tp_is_empty!6203 (array_inv!3659 (_keys!6455 thiss!1504)) (array_inv!3660 (_values!4362 thiss!1504)) e!153044))))

(declare-fun b!235669 () Bool)

(declare-fun e!153040 () Bool)

(assert (=> b!235669 (= e!153040 tp_is_empty!6203)))

(declare-fun b!235670 () Bool)

(declare-fun mapRes!10502 () Bool)

(assert (=> b!235670 (= e!153044 (and e!153040 mapRes!10502))))

(declare-fun condMapEmpty!10502 () Bool)

(declare-fun mapDefault!10502 () ValueCell!2758)

