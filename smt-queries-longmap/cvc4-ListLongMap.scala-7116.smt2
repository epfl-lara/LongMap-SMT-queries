; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90202 () Bool)

(assert start!90202)

(declare-fun b!1032871 () Bool)

(declare-fun b_free!20753 () Bool)

(declare-fun b_next!20753 () Bool)

(assert (=> b!1032871 (= b_free!20753 (not b_next!20753))))

(declare-fun tp!73345 () Bool)

(declare-fun b_and!33221 () Bool)

(assert (=> b!1032871 (= tp!73345 b_and!33221)))

(declare-fun b!1032868 () Bool)

(declare-fun res!690240 () Bool)

(declare-fun e!583690 () Bool)

(assert (=> b!1032868 (=> (not res!690240) (not e!583690))))

(declare-datatypes ((V!37503 0))(
  ( (V!37504 (val!12287 Int)) )
))
(declare-datatypes ((ValueCell!11533 0))(
  ( (ValueCellFull!11533 (v!14864 V!37503)) (EmptyCell!11533) )
))
(declare-datatypes ((array!65018 0))(
  ( (array!65019 (arr!31307 (Array (_ BitVec 32) (_ BitVec 64))) (size!31827 (_ BitVec 32))) )
))
(declare-datatypes ((array!65020 0))(
  ( (array!65021 (arr!31308 (Array (_ BitVec 32) ValueCell!11533)) (size!31828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5660 0))(
  ( (LongMapFixedSize!5661 (defaultEntry!6204 Int) (mask!30037 (_ BitVec 32)) (extraKeys!5936 (_ BitVec 32)) (zeroValue!6040 V!37503) (minValue!6040 V!37503) (_size!2885 (_ BitVec 32)) (_keys!11380 array!65018) (_values!6227 array!65020) (_vacant!2885 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5660)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1032868 (= res!690240 (validMask!0 (mask!30037 thiss!1427)))))

(declare-fun b!1032869 () Bool)

(assert (=> b!1032869 (= e!583690 (and (= (size!31828 (_values!6227 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30037 thiss!1427))) (= (size!31827 (_keys!11380 thiss!1427)) (size!31828 (_values!6227 thiss!1427))) (bvsge (mask!30037 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5936 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun res!690242 () Bool)

(assert (=> start!90202 (=> (not res!690242) (not e!583690))))

(declare-fun valid!2141 (LongMapFixedSize!5660) Bool)

(assert (=> start!90202 (= res!690242 (valid!2141 thiss!1427))))

(assert (=> start!90202 e!583690))

(declare-fun e!583694 () Bool)

(assert (=> start!90202 e!583694))

(assert (=> start!90202 true))

(declare-fun b!1032870 () Bool)

(declare-fun e!583692 () Bool)

(declare-fun e!583693 () Bool)

(declare-fun mapRes!38178 () Bool)

(assert (=> b!1032870 (= e!583692 (and e!583693 mapRes!38178))))

(declare-fun condMapEmpty!38178 () Bool)

(declare-fun mapDefault!38178 () ValueCell!11533)

