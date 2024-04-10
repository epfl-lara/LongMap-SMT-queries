; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75426 () Bool)

(assert start!75426)

(declare-fun b!887936 () Bool)

(declare-fun b_free!15541 () Bool)

(declare-fun b_next!15541 () Bool)

(assert (=> b!887936 (= b_free!15541 (not b_next!15541))))

(declare-fun tp!54570 () Bool)

(declare-fun b_and!25777 () Bool)

(assert (=> b!887936 (= tp!54570 b_and!25777)))

(declare-fun mapIsEmpty!28336 () Bool)

(declare-fun mapRes!28336 () Bool)

(assert (=> mapIsEmpty!28336 mapRes!28336))

(declare-datatypes ((array!51706 0))(
  ( (array!51707 (arr!24865 (Array (_ BitVec 32) (_ BitVec 64))) (size!25305 (_ BitVec 32))) )
))
(declare-datatypes ((V!28791 0))(
  ( (V!28792 (val!8985 Int)) )
))
(declare-datatypes ((ValueCell!8453 0))(
  ( (ValueCellFull!8453 (v!11457 V!28791)) (EmptyCell!8453) )
))
(declare-datatypes ((array!51708 0))(
  ( (array!51709 (arr!24866 (Array (_ BitVec 32) ValueCell!8453)) (size!25306 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3922 0))(
  ( (LongMapFixedSize!3923 (defaultEntry!5152 Int) (mask!25560 (_ BitVec 32)) (extraKeys!4846 (_ BitVec 32)) (zeroValue!4950 V!28791) (minValue!4950 V!28791) (_size!2016 (_ BitVec 32)) (_keys!9829 array!51706) (_values!5137 array!51708) (_vacant!2016 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3922)

(declare-fun e!494643 () Bool)

(declare-fun e!494642 () Bool)

(declare-fun tp_is_empty!17869 () Bool)

(declare-fun array_inv!19570 (array!51706) Bool)

(declare-fun array_inv!19571 (array!51708) Bool)

(assert (=> b!887936 (= e!494642 (and tp!54570 tp_is_empty!17869 (array_inv!19570 (_keys!9829 thiss!1181)) (array_inv!19571 (_values!5137 thiss!1181)) e!494643))))

(declare-fun b!887937 () Bool)

(declare-fun e!494645 () Bool)

(assert (=> b!887937 (= e!494645 tp_is_empty!17869)))

(declare-fun b!887938 () Bool)

(declare-fun e!494644 () Bool)

(assert (=> b!887938 (= e!494644 tp_is_empty!17869)))

(declare-fun b!887939 () Bool)

(assert (=> b!887939 (= e!494643 (and e!494644 mapRes!28336))))

(declare-fun condMapEmpty!28336 () Bool)

(declare-fun mapDefault!28336 () ValueCell!8453)

