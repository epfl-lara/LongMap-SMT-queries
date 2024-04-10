; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89514 () Bool)

(assert start!89514)

(declare-fun b!1026647 () Bool)

(declare-fun b_free!20513 () Bool)

(declare-fun b_next!20513 () Bool)

(assert (=> b!1026647 (= b_free!20513 (not b_next!20513))))

(declare-fun tp!72585 () Bool)

(declare-fun b_and!32759 () Bool)

(assert (=> b!1026647 (= tp!72585 b_and!32759)))

(declare-fun b!1026641 () Bool)

(declare-fun e!579210 () Bool)

(declare-fun e!579212 () Bool)

(declare-fun mapRes!37778 () Bool)

(assert (=> b!1026641 (= e!579210 (and e!579212 mapRes!37778))))

(declare-fun condMapEmpty!37778 () Bool)

(declare-datatypes ((V!37183 0))(
  ( (V!37184 (val!12167 Int)) )
))
(declare-datatypes ((ValueCell!11413 0))(
  ( (ValueCellFull!11413 (v!14736 V!37183)) (EmptyCell!11413) )
))
(declare-datatypes ((array!64516 0))(
  ( (array!64517 (arr!31067 (Array (_ BitVec 32) (_ BitVec 64))) (size!31580 (_ BitVec 32))) )
))
(declare-datatypes ((array!64518 0))(
  ( (array!64519 (arr!31068 (Array (_ BitVec 32) ValueCell!11413)) (size!31581 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5420 0))(
  ( (LongMapFixedSize!5421 (defaultEntry!6062 Int) (mask!29760 (_ BitVec 32)) (extraKeys!5794 (_ BitVec 32)) (zeroValue!5898 V!37183) (minValue!5898 V!37183) (_size!2765 (_ BitVec 32)) (_keys!11209 array!64516) (_values!6085 array!64518) (_vacant!2765 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5420)

(declare-fun mapDefault!37778 () ValueCell!11413)

