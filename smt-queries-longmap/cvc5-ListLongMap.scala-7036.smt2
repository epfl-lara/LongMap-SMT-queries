; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89228 () Bool)

(assert start!89228)

(declare-fun b!1023089 () Bool)

(declare-fun b_free!20269 () Bool)

(declare-fun b_next!20269 () Bool)

(assert (=> b!1023089 (= b_free!20269 (not b_next!20269))))

(declare-fun tp!71841 () Bool)

(declare-fun b_and!32491 () Bool)

(assert (=> b!1023089 (= tp!71841 b_and!32491)))

(declare-fun mapIsEmpty!37401 () Bool)

(declare-fun mapRes!37401 () Bool)

(assert (=> mapIsEmpty!37401 mapRes!37401))

(declare-fun res!685237 () Bool)

(declare-fun e!576457 () Bool)

(assert (=> start!89228 (=> (not res!685237) (not e!576457))))

(declare-datatypes ((V!36859 0))(
  ( (V!36860 (val!12045 Int)) )
))
(declare-datatypes ((ValueCell!11291 0))(
  ( (ValueCellFull!11291 (v!14614 V!36859)) (EmptyCell!11291) )
))
(declare-datatypes ((array!64022 0))(
  ( (array!64023 (arr!30823 (Array (_ BitVec 32) (_ BitVec 64))) (size!31334 (_ BitVec 32))) )
))
(declare-datatypes ((array!64024 0))(
  ( (array!64025 (arr!30824 (Array (_ BitVec 32) ValueCell!11291)) (size!31335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5176 0))(
  ( (LongMapFixedSize!5177 (defaultEntry!5940 Int) (mask!29553 (_ BitVec 32)) (extraKeys!5672 (_ BitVec 32)) (zeroValue!5776 V!36859) (minValue!5776 V!36859) (_size!2643 (_ BitVec 32)) (_keys!11085 array!64022) (_values!5963 array!64024) (_vacant!2643 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5176)

(declare-fun valid!1972 (LongMapFixedSize!5176) Bool)

(assert (=> start!89228 (= res!685237 (valid!1972 thiss!1427))))

(assert (=> start!89228 e!576457))

(declare-fun e!576456 () Bool)

(assert (=> start!89228 e!576456))

(assert (=> start!89228 true))

(declare-fun b!1023086 () Bool)

(declare-fun res!685236 () Bool)

(assert (=> b!1023086 (=> (not res!685236) (not e!576457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64022 (_ BitVec 32)) Bool)

(assert (=> b!1023086 (= res!685236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11085 thiss!1427) (mask!29553 thiss!1427)))))

(declare-fun b!1023087 () Bool)

(declare-fun e!576459 () Bool)

(declare-fun e!576458 () Bool)

(assert (=> b!1023087 (= e!576459 (and e!576458 mapRes!37401))))

(declare-fun condMapEmpty!37401 () Bool)

(declare-fun mapDefault!37401 () ValueCell!11291)

