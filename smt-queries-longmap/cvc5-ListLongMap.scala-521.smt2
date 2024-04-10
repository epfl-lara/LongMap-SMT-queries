; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13116 () Bool)

(assert start!13116)

(declare-fun b!114784 () Bool)

(declare-fun b_free!2641 () Bool)

(declare-fun b_next!2641 () Bool)

(assert (=> b!114784 (= b_free!2641 (not b_next!2641))))

(declare-fun tp!10285 () Bool)

(declare-fun b_and!7087 () Bool)

(assert (=> b!114784 (= tp!10285 b_and!7087)))

(declare-fun b!114781 () Bool)

(declare-fun b_free!2643 () Bool)

(declare-fun b_next!2643 () Bool)

(assert (=> b!114781 (= b_free!2643 (not b_next!2643))))

(declare-fun tp!10288 () Bool)

(declare-fun b_and!7089 () Bool)

(assert (=> b!114781 (= tp!10288 b_and!7089)))

(declare-datatypes ((V!3297 0))(
  ( (V!3298 (val!1413 Int)) )
))
(declare-datatypes ((array!4477 0))(
  ( (array!4478 (arr!2121 (Array (_ BitVec 32) (_ BitVec 64))) (size!2381 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1025 0))(
  ( (ValueCellFull!1025 (v!2995 V!3297)) (EmptyCell!1025) )
))
(declare-datatypes ((array!4479 0))(
  ( (array!4480 (arr!2122 (Array (_ BitVec 32) ValueCell!1025)) (size!2382 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!958 0))(
  ( (LongMapFixedSize!959 (defaultEntry!2688 Int) (mask!6886 (_ BitVec 32)) (extraKeys!2477 (_ BitVec 32)) (zeroValue!2555 V!3297) (minValue!2555 V!3297) (_size!528 (_ BitVec 32)) (_keys!4410 array!4477) (_values!2671 array!4479) (_vacant!528 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!958)

(declare-fun tp_is_empty!2737 () Bool)

(declare-fun e!74708 () Bool)

(declare-fun e!74707 () Bool)

(declare-fun array_inv!1335 (array!4477) Bool)

(declare-fun array_inv!1336 (array!4479) Bool)

(assert (=> b!114781 (= e!74708 (and tp!10288 tp_is_empty!2737 (array_inv!1335 (_keys!4410 newMap!16)) (array_inv!1336 (_values!2671 newMap!16)) e!74707))))

(declare-fun b!114782 () Bool)

(declare-fun res!56458 () Bool)

(declare-fun e!74706 () Bool)

(assert (=> b!114782 (=> (not res!56458) (not e!74706))))

(declare-fun valid!451 (LongMapFixedSize!958) Bool)

(assert (=> b!114782 (= res!56458 (valid!451 newMap!16))))

(declare-fun b!114783 () Bool)

(declare-fun e!74698 () Bool)

(assert (=> b!114783 (= e!74698 tp_is_empty!2737)))

(declare-datatypes ((Cell!758 0))(
  ( (Cell!759 (v!2996 LongMapFixedSize!958)) )
))
(declare-datatypes ((LongMap!758 0))(
  ( (LongMap!759 (underlying!390 Cell!758)) )
))
(declare-fun thiss!992 () LongMap!758)

(declare-fun e!74701 () Bool)

(declare-fun e!74710 () Bool)

(assert (=> b!114784 (= e!74701 (and tp!10285 tp_is_empty!2737 (array_inv!1335 (_keys!4410 (v!2996 (underlying!390 thiss!992)))) (array_inv!1336 (_values!2671 (v!2996 (underlying!390 thiss!992)))) e!74710))))

(declare-fun b!114785 () Bool)

(declare-fun e!74712 () Bool)

(declare-fun e!74703 () Bool)

(assert (=> b!114785 (= e!74712 e!74703)))

(declare-fun b!114786 () Bool)

(declare-fun e!74704 () Bool)

(assert (=> b!114786 (= e!74704 tp_is_empty!2737)))

(declare-fun b!114787 () Bool)

(declare-fun res!56457 () Bool)

(assert (=> b!114787 (=> (not res!56457) (not e!74706))))

(assert (=> b!114787 (= res!56457 (bvsge (bvadd #b00000000000000000000000000000001 (mask!6886 newMap!16)) (_size!528 (v!2996 (underlying!390 thiss!992)))))))

(declare-fun b!114788 () Bool)

(declare-datatypes ((Unit!3583 0))(
  ( (Unit!3584) )
))
(declare-fun e!74705 () Unit!3583)

(declare-fun Unit!3585 () Unit!3583)

(assert (=> b!114788 (= e!74705 Unit!3585)))

(declare-fun b!114789 () Bool)

(declare-fun e!74700 () Bool)

(declare-fun mapRes!4143 () Bool)

(assert (=> b!114789 (= e!74710 (and e!74700 mapRes!4143))))

(declare-fun condMapEmpty!4143 () Bool)

(declare-fun mapDefault!4144 () ValueCell!1025)

