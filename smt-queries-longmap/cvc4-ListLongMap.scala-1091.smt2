; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22296 () Bool)

(assert start!22296)

(declare-fun b!233753 () Bool)

(declare-fun b_free!6299 () Bool)

(declare-fun b_next!6299 () Bool)

(assert (=> b!233753 (= b_free!6299 (not b_next!6299))))

(declare-fun tp!22045 () Bool)

(declare-fun b_and!13205 () Bool)

(assert (=> b!233753 (= tp!22045 b_and!13205)))

(declare-fun b!233750 () Bool)

(declare-fun res!114704 () Bool)

(declare-fun e!151849 () Bool)

(assert (=> b!233750 (=> (not res!114704) (not e!151849))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233750 (= res!114704 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233751 () Bool)

(declare-fun e!151848 () Bool)

(declare-fun tp_is_empty!6161 () Bool)

(assert (=> b!233751 (= e!151848 tp_is_empty!6161)))

(declare-fun b!233752 () Bool)

(declare-fun e!151845 () Bool)

(declare-datatypes ((V!7861 0))(
  ( (V!7862 (val!3125 Int)) )
))
(declare-datatypes ((ValueCell!2737 0))(
  ( (ValueCellFull!2737 (v!5147 V!7861)) (EmptyCell!2737) )
))
(declare-datatypes ((array!11569 0))(
  ( (array!11570 (arr!5502 (Array (_ BitVec 32) ValueCell!2737)) (size!5836 (_ BitVec 32))) )
))
(declare-datatypes ((array!11571 0))(
  ( (array!11572 (arr!5503 (Array (_ BitVec 32) (_ BitVec 64))) (size!5837 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3374 0))(
  ( (LongMapFixedSize!3375 (defaultEntry!4349 Int) (mask!10283 (_ BitVec 32)) (extraKeys!4086 (_ BitVec 32)) (zeroValue!4190 V!7861) (minValue!4190 V!7861) (_size!1736 (_ BitVec 32)) (_keys!6408 array!11571) (_values!4332 array!11569) (_vacant!1736 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3374)

(assert (=> b!233752 (= e!151845 (and (= (size!5836 (_values!4332 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10283 thiss!1504))) (not (= (size!5837 (_keys!6408 thiss!1504)) (size!5836 (_values!4332 thiss!1504))))))))

(declare-fun e!151844 () Bool)

(declare-fun e!151847 () Bool)

(declare-fun array_inv!3627 (array!11571) Bool)

(declare-fun array_inv!3628 (array!11569) Bool)

(assert (=> b!233753 (= e!151847 (and tp!22045 tp_is_empty!6161 (array_inv!3627 (_keys!6408 thiss!1504)) (array_inv!3628 (_values!4332 thiss!1504)) e!151844))))

(declare-fun b!233754 () Bool)

(declare-fun mapRes!10418 () Bool)

(assert (=> b!233754 (= e!151844 (and e!151848 mapRes!10418))))

(declare-fun condMapEmpty!10418 () Bool)

(declare-fun mapDefault!10418 () ValueCell!2737)

