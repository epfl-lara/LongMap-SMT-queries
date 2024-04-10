; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89564 () Bool)

(assert start!89564)

(declare-fun b!1027400 () Bool)

(declare-fun b_free!20563 () Bool)

(declare-fun b_next!20563 () Bool)

(assert (=> b!1027400 (= b_free!20563 (not b_next!20563))))

(declare-fun tp!72734 () Bool)

(declare-fun b_and!32809 () Bool)

(assert (=> b!1027400 (= tp!72734 b_and!32809)))

(declare-fun mapIsEmpty!37853 () Bool)

(declare-fun mapRes!37853 () Bool)

(assert (=> mapIsEmpty!37853 mapRes!37853))

(declare-fun b!1027391 () Bool)

(declare-fun e!579811 () Bool)

(declare-fun tp_is_empty!24283 () Bool)

(assert (=> b!1027391 (= e!579811 tp_is_empty!24283)))

(declare-fun b!1027392 () Bool)

(declare-fun res!687677 () Bool)

(declare-fun e!579809 () Bool)

(assert (=> b!1027392 (=> res!687677 e!579809)))

(declare-datatypes ((V!37251 0))(
  ( (V!37252 (val!12192 Int)) )
))
(declare-datatypes ((ValueCell!11438 0))(
  ( (ValueCellFull!11438 (v!14761 V!37251)) (EmptyCell!11438) )
))
(declare-datatypes ((array!64616 0))(
  ( (array!64617 (arr!31117 (Array (_ BitVec 32) (_ BitVec 64))) (size!31630 (_ BitVec 32))) )
))
(declare-datatypes ((array!64618 0))(
  ( (array!64619 (arr!31118 (Array (_ BitVec 32) ValueCell!11438)) (size!31631 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5470 0))(
  ( (LongMapFixedSize!5471 (defaultEntry!6087 Int) (mask!29803 (_ BitVec 32)) (extraKeys!5819 (_ BitVec 32)) (zeroValue!5923 V!37251) (minValue!5923 V!37251) (_size!2790 (_ BitVec 32)) (_keys!11234 array!64616) (_values!6110 array!64618) (_vacant!2790 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5470)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64616 (_ BitVec 32)) Bool)

(assert (=> b!1027392 (= res!687677 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11234 thiss!1427) (mask!29803 thiss!1427))))))

(declare-fun b!1027393 () Bool)

(declare-fun e!579808 () Bool)

(assert (=> b!1027393 (= e!579808 (and e!579811 mapRes!37853))))

(declare-fun condMapEmpty!37853 () Bool)

(declare-fun mapDefault!37853 () ValueCell!11438)

