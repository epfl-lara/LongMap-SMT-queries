; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89388 () Bool)

(assert start!89388)

(declare-fun b!1024763 () Bool)

(declare-fun b_free!20387 () Bool)

(declare-fun b_next!20387 () Bool)

(assert (=> b!1024763 (= b_free!20387 (not b_next!20387))))

(declare-fun tp!72207 () Bool)

(declare-fun b_and!32633 () Bool)

(assert (=> b!1024763 (= tp!72207 b_and!32633)))

(declare-fun b!1024759 () Bool)

(declare-fun e!577699 () Bool)

(declare-fun e!577696 () Bool)

(declare-fun mapRes!37589 () Bool)

(assert (=> b!1024759 (= e!577699 (and e!577696 mapRes!37589))))

(declare-fun condMapEmpty!37589 () Bool)

(declare-datatypes ((V!37015 0))(
  ( (V!37016 (val!12104 Int)) )
))
(declare-datatypes ((ValueCell!11350 0))(
  ( (ValueCellFull!11350 (v!14673 V!37015)) (EmptyCell!11350) )
))
(declare-datatypes ((array!64264 0))(
  ( (array!64265 (arr!30941 (Array (_ BitVec 32) (_ BitVec 64))) (size!31454 (_ BitVec 32))) )
))
(declare-datatypes ((array!64266 0))(
  ( (array!64267 (arr!30942 (Array (_ BitVec 32) ValueCell!11350)) (size!31455 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5294 0))(
  ( (LongMapFixedSize!5295 (defaultEntry!5999 Int) (mask!29655 (_ BitVec 32)) (extraKeys!5731 (_ BitVec 32)) (zeroValue!5835 V!37015) (minValue!5835 V!37015) (_size!2702 (_ BitVec 32)) (_keys!11146 array!64264) (_values!6022 array!64266) (_vacant!2702 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5294)

(declare-fun mapDefault!37589 () ValueCell!11350)

