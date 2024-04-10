; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16086 () Bool)

(assert start!16086)

(declare-fun b!159829 () Bool)

(declare-fun b_free!3547 () Bool)

(declare-fun b_next!3547 () Bool)

(assert (=> b!159829 (= b_free!3547 (not b_next!3547))))

(declare-fun tp!13211 () Bool)

(declare-fun b_and!9961 () Bool)

(assert (=> b!159829 (= tp!13211 b_and!9961)))

(declare-fun res!75575 () Bool)

(declare-fun e!104569 () Bool)

(assert (=> start!16086 (=> (not res!75575) (not e!104569))))

(declare-datatypes ((V!4113 0))(
  ( (V!4114 (val!1719 Int)) )
))
(declare-datatypes ((ValueCell!1331 0))(
  ( (ValueCellFull!1331 (v!3584 V!4113)) (EmptyCell!1331) )
))
(declare-datatypes ((array!5777 0))(
  ( (array!5778 (arr!2733 (Array (_ BitVec 32) (_ BitVec 64))) (size!3017 (_ BitVec 32))) )
))
(declare-datatypes ((array!5779 0))(
  ( (array!5780 (arr!2734 (Array (_ BitVec 32) ValueCell!1331)) (size!3018 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1570 0))(
  ( (LongMapFixedSize!1571 (defaultEntry!3227 Int) (mask!7785 (_ BitVec 32)) (extraKeys!2968 (_ BitVec 32)) (zeroValue!3070 V!4113) (minValue!3070 V!4113) (_size!834 (_ BitVec 32)) (_keys!5028 array!5777) (_values!3210 array!5779) (_vacant!834 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1570)

(declare-fun valid!732 (LongMapFixedSize!1570) Bool)

(assert (=> start!16086 (= res!75575 (valid!732 thiss!1248))))

(assert (=> start!16086 e!104569))

(declare-fun e!104571 () Bool)

(assert (=> start!16086 e!104571))

(assert (=> start!16086 true))

(declare-fun b!159825 () Bool)

(declare-fun res!75577 () Bool)

(assert (=> b!159825 (=> (not res!75577) (not e!104569))))

(assert (=> b!159825 (= res!75577 (and (= (size!3018 (_values!3210 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7785 thiss!1248))) (= (size!3017 (_keys!5028 thiss!1248)) (size!3018 (_values!3210 thiss!1248))) (bvsge (mask!7785 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2968 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2968 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!159826 () Bool)

(declare-fun e!104572 () Bool)

(declare-fun e!104574 () Bool)

(declare-fun mapRes!5711 () Bool)

(assert (=> b!159826 (= e!104572 (and e!104574 mapRes!5711))))

(declare-fun condMapEmpty!5711 () Bool)

(declare-fun mapDefault!5711 () ValueCell!1331)

