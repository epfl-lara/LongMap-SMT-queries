; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3010 () Bool)

(assert start!3010)

(declare-fun b!17695 () Bool)

(declare-fun b_free!617 () Bool)

(declare-fun b_next!617 () Bool)

(assert (=> b!17695 (= b_free!617 (not b_next!617))))

(declare-fun tp!3041 () Bool)

(declare-fun b_and!1265 () Bool)

(assert (=> b!17695 (= tp!3041 b_and!1265)))

(declare-fun b!17688 () Bool)

(declare-fun e!11171 () Bool)

(declare-fun e!11176 () Bool)

(assert (=> b!17688 (= e!11171 e!11176)))

(declare-fun res!12645 () Bool)

(assert (=> b!17688 (=> (not res!12645) (not e!11176))))

(declare-datatypes ((V!999 0))(
  ( (V!1000 (val!467 Int)) )
))
(declare-datatypes ((ValueCell!241 0))(
  ( (ValueCellFull!241 (v!1438 V!999)) (EmptyCell!241) )
))
(declare-datatypes ((array!967 0))(
  ( (array!968 (arr!465 (Array (_ BitVec 32) ValueCell!241)) (size!555 (_ BitVec 32))) )
))
(declare-datatypes ((array!969 0))(
  ( (array!970 (arr!466 (Array (_ BitVec 32) (_ BitVec 64))) (size!556 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!68 0))(
  ( (LongMapFixedSize!69 (defaultEntry!1645 Int) (mask!4566 (_ BitVec 32)) (extraKeys!1558 (_ BitVec 32)) (zeroValue!1581 V!999) (minValue!1581 V!999) (_size!66 (_ BitVec 32)) (_keys!3070 array!969) (_values!1642 array!967) (_vacant!66 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!68 0))(
  ( (Cell!69 (v!1439 LongMapFixedSize!68)) )
))
(declare-datatypes ((LongMap!68 0))(
  ( (LongMap!69 (underlying!45 Cell!68)) )
))
(declare-datatypes ((tuple2!760 0))(
  ( (tuple2!761 (_1!381 Bool) (_2!381 LongMap!68)) )
))
(declare-fun lt!4593 () tuple2!760)

(assert (=> b!17688 (= res!12645 (_1!381 lt!4593))))

(declare-fun e!11175 () tuple2!760)

(assert (=> b!17688 (= lt!4593 e!11175)))

(declare-fun c!1774 () Bool)

(declare-fun thiss!848 () LongMap!68)

(declare-fun imbalanced!17 (LongMap!68) Bool)

(assert (=> b!17688 (= c!1774 (imbalanced!17 thiss!848))))

(declare-fun b!17689 () Bool)

(declare-fun e!11174 () Bool)

(declare-fun e!11168 () Bool)

(assert (=> b!17689 (= e!11174 e!11168)))

(declare-fun b!17690 () Bool)

(declare-fun e!11167 () Bool)

(declare-fun tp_is_empty!881 () Bool)

(assert (=> b!17690 (= e!11167 tp_is_empty!881)))

(declare-fun b!17691 () Bool)

(assert (=> b!17691 (= e!11175 (tuple2!761 true thiss!848))))

(declare-fun b!17692 () Bool)

(declare-fun e!11173 () Bool)

(declare-fun mapRes!756 () Bool)

(assert (=> b!17692 (= e!11173 (and e!11167 mapRes!756))))

(declare-fun condMapEmpty!756 () Bool)

(declare-fun mapDefault!756 () ValueCell!241)

