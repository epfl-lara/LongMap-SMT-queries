; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!91432 () Bool)

(assert start!91432)

(declare-fun b!1041982 () Bool)

(declare-fun b_free!21053 () Bool)

(declare-fun b_next!21053 () Bool)

(assert (=> b!1041982 (= b_free!21053 (not b_next!21053))))

(declare-fun tp!74378 () Bool)

(declare-fun b_and!33585 () Bool)

(assert (=> b!1041982 (= tp!74378 b_and!33585)))

(declare-fun e!590187 () Bool)

(declare-fun tp_is_empty!24773 () Bool)

(declare-fun e!590186 () Bool)

(declare-datatypes ((V!37903 0))(
  ( (V!37904 (val!12437 Int)) )
))
(declare-datatypes ((ValueCell!11683 0))(
  ( (ValueCellFull!11683 (v!15027 V!37903)) (EmptyCell!11683) )
))
(declare-datatypes ((array!65696 0))(
  ( (array!65697 (arr!31607 (Array (_ BitVec 32) (_ BitVec 64))) (size!32141 (_ BitVec 32))) )
))
(declare-datatypes ((array!65698 0))(
  ( (array!65699 (arr!31608 (Array (_ BitVec 32) ValueCell!11683)) (size!32142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5960 0))(
  ( (LongMapFixedSize!5961 (defaultEntry!6362 Int) (mask!30408 (_ BitVec 32)) (extraKeys!6090 (_ BitVec 32)) (zeroValue!6196 V!37903) (minValue!6196 V!37903) (_size!3035 (_ BitVec 32)) (_keys!11605 array!65696) (_values!6385 array!65698) (_vacant!3035 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5960)

(declare-fun array_inv!24421 (array!65696) Bool)

(declare-fun array_inv!24422 (array!65698) Bool)

(assert (=> b!1041982 (= e!590186 (and tp!74378 tp_is_empty!24773 (array_inv!24421 (_keys!11605 thiss!1427)) (array_inv!24422 (_values!6385 thiss!1427)) e!590187))))

(declare-fun res!694375 () Bool)

(declare-fun e!590188 () Bool)

(assert (=> start!91432 (=> (not res!694375) (not e!590188))))

(declare-fun valid!2239 (LongMapFixedSize!5960) Bool)

(assert (=> start!91432 (= res!694375 (valid!2239 thiss!1427))))

(assert (=> start!91432 e!590188))

(assert (=> start!91432 e!590186))

(assert (=> start!91432 true))

(declare-fun b!1041983 () Bool)

(declare-fun e!590191 () Bool)

(assert (=> b!1041983 (= e!590191 tp_is_empty!24773)))

(declare-fun b!1041984 () Bool)

(declare-fun e!590192 () Bool)

(assert (=> b!1041984 (= e!590192 tp_is_empty!24773)))

(declare-fun mapIsEmpty!38761 () Bool)

(declare-fun mapRes!38761 () Bool)

(assert (=> mapIsEmpty!38761 mapRes!38761))

(declare-fun b!1041985 () Bool)

(assert (=> b!1041985 (= e!590187 (and e!590192 mapRes!38761))))

(declare-fun condMapEmpty!38761 () Bool)

(declare-fun mapDefault!38761 () ValueCell!11683)

