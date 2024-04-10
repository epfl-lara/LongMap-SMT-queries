; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90220 () Bool)

(assert start!90220)

(declare-fun b!1032959 () Bool)

(declare-fun b_free!20755 () Bool)

(declare-fun b_next!20755 () Bool)

(assert (=> b!1032959 (= b_free!20755 (not b_next!20755))))

(declare-fun tp!73354 () Bool)

(declare-fun b_and!33223 () Bool)

(assert (=> b!1032959 (= tp!73354 b_and!33223)))

(declare-fun e!583750 () Bool)

(declare-fun e!583754 () Bool)

(declare-datatypes ((V!37507 0))(
  ( (V!37508 (val!12288 Int)) )
))
(declare-datatypes ((ValueCell!11534 0))(
  ( (ValueCellFull!11534 (v!14865 V!37507)) (EmptyCell!11534) )
))
(declare-datatypes ((array!65024 0))(
  ( (array!65025 (arr!31309 (Array (_ BitVec 32) (_ BitVec 64))) (size!31830 (_ BitVec 32))) )
))
(declare-datatypes ((array!65026 0))(
  ( (array!65027 (arr!31310 (Array (_ BitVec 32) ValueCell!11534)) (size!31831 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5662 0))(
  ( (LongMapFixedSize!5663 (defaultEntry!6205 Int) (mask!30042 (_ BitVec 32)) (extraKeys!5937 (_ BitVec 32)) (zeroValue!6041 V!37507) (minValue!6041 V!37507) (_size!2886 (_ BitVec 32)) (_keys!11382 array!65024) (_values!6228 array!65026) (_vacant!2886 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5662)

(declare-fun tp_is_empty!24475 () Bool)

(declare-fun array_inv!24229 (array!65024) Bool)

(declare-fun array_inv!24230 (array!65026) Bool)

(assert (=> b!1032959 (= e!583750 (and tp!73354 tp_is_empty!24475 (array_inv!24229 (_keys!11382 thiss!1427)) (array_inv!24230 (_values!6228 thiss!1427)) e!583754))))

(declare-fun b!1032960 () Bool)

(declare-fun e!583753 () Bool)

(assert (=> b!1032960 (= e!583753 tp_is_empty!24475)))

(declare-fun b!1032961 () Bool)

(declare-fun e!583749 () Bool)

(assert (=> b!1032961 (= e!583749 tp_is_empty!24475)))

(declare-fun b!1032962 () Bool)

(declare-fun e!583751 () Bool)

(assert (=> b!1032962 (= e!583751 (and (= (size!31831 (_values!6228 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30042 thiss!1427))) (= (size!31830 (_keys!11382 thiss!1427)) (size!31831 (_values!6228 thiss!1427))) (bvsge (mask!30042 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5937 thiss!1427) #b00000000000000000000000000000000) (bvsgt (extraKeys!5937 thiss!1427) #b00000000000000000000000000000011)))))

(declare-fun b!1032963 () Bool)

(declare-fun mapRes!38185 () Bool)

(assert (=> b!1032963 (= e!583754 (and e!583749 mapRes!38185))))

(declare-fun condMapEmpty!38185 () Bool)

(declare-fun mapDefault!38185 () ValueCell!11534)

