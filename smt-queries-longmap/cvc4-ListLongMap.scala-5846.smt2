; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75554 () Bool)

(assert start!75554)

(declare-fun b!888741 () Bool)

(declare-fun b_free!15581 () Bool)

(declare-fun b_next!15581 () Bool)

(assert (=> b!888741 (= b_free!15581 (not b_next!15581))))

(declare-fun tp!54697 () Bool)

(declare-fun b_and!25821 () Bool)

(assert (=> b!888741 (= tp!54697 b_and!25821)))

(declare-fun mapIsEmpty!28404 () Bool)

(declare-fun mapRes!28404 () Bool)

(assert (=> mapIsEmpty!28404 mapRes!28404))

(declare-fun b!888738 () Bool)

(declare-fun e!495254 () Bool)

(declare-fun tp_is_empty!17909 () Bool)

(assert (=> b!888738 (= e!495254 tp_is_empty!17909)))

(declare-fun lt!401914 () Bool)

(declare-datatypes ((array!51790 0))(
  ( (array!51791 (arr!24905 (Array (_ BitVec 32) (_ BitVec 64))) (size!25347 (_ BitVec 32))) )
))
(declare-datatypes ((V!28843 0))(
  ( (V!28844 (val!9005 Int)) )
))
(declare-datatypes ((ValueCell!8473 0))(
  ( (ValueCellFull!8473 (v!11481 V!28843)) (EmptyCell!8473) )
))
(declare-datatypes ((array!51792 0))(
  ( (array!51793 (arr!24906 (Array (_ BitVec 32) ValueCell!8473)) (size!25348 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3962 0))(
  ( (LongMapFixedSize!3963 (defaultEntry!5178 Int) (mask!25606 (_ BitVec 32)) (extraKeys!4872 (_ BitVec 32)) (zeroValue!4976 V!28843) (minValue!4976 V!28843) (_size!2036 (_ BitVec 32)) (_keys!9859 array!51790) (_values!5163 array!51792) (_vacant!2036 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3962)

(declare-fun valid!1545 (LongMapFixedSize!3962) Bool)

(assert (=> start!75554 (= lt!401914 (valid!1545 thiss!1181))))

(assert (=> start!75554 false))

(declare-fun e!495256 () Bool)

(assert (=> start!75554 e!495256))

(declare-fun mapNonEmpty!28404 () Bool)

(declare-fun tp!54698 () Bool)

(assert (=> mapNonEmpty!28404 (= mapRes!28404 (and tp!54698 e!495254))))

(declare-fun mapRest!28404 () (Array (_ BitVec 32) ValueCell!8473))

(declare-fun mapKey!28404 () (_ BitVec 32))

(declare-fun mapValue!28404 () ValueCell!8473)

(assert (=> mapNonEmpty!28404 (= (arr!24906 (_values!5163 thiss!1181)) (store mapRest!28404 mapKey!28404 mapValue!28404))))

(declare-fun b!888739 () Bool)

(declare-fun e!495255 () Bool)

(assert (=> b!888739 (= e!495255 tp_is_empty!17909)))

(declare-fun b!888740 () Bool)

(declare-fun e!495253 () Bool)

(assert (=> b!888740 (= e!495253 (and e!495255 mapRes!28404))))

(declare-fun condMapEmpty!28404 () Bool)

(declare-fun mapDefault!28404 () ValueCell!8473)

