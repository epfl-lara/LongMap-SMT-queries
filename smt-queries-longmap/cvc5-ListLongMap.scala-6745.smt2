; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84548 () Bool)

(assert start!84548)

(declare-fun b_free!20029 () Bool)

(declare-fun b_next!20029 () Bool)

(assert (=> start!84548 (= b_free!20029 (not b_next!20029))))

(declare-fun tp!69874 () Bool)

(declare-fun b_and!32127 () Bool)

(assert (=> start!84548 (= tp!69874 b_and!32127)))

(declare-fun b!988837 () Bool)

(declare-fun res!661358 () Bool)

(declare-fun e!557587 () Bool)

(assert (=> b!988837 (=> (not res!661358) (not e!557587))))

(declare-datatypes ((array!62451 0))(
  ( (array!62452 (arr!30079 (Array (_ BitVec 32) (_ BitVec 64))) (size!30558 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62451)

(declare-datatypes ((List!20805 0))(
  ( (Nil!20802) (Cons!20801 (h!21963 (_ BitVec 64)) (t!29746 List!20805)) )
))
(declare-fun arrayNoDuplicates!0 (array!62451 (_ BitVec 32) List!20805) Bool)

(assert (=> b!988837 (= res!661358 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20802))))

(declare-fun b!988838 () Bool)

(declare-fun e!557590 () Bool)

(declare-fun e!557589 () Bool)

(declare-fun mapRes!36909 () Bool)

(assert (=> b!988838 (= e!557590 (and e!557589 mapRes!36909))))

(declare-fun condMapEmpty!36909 () Bool)

(declare-datatypes ((V!35977 0))(
  ( (V!35978 (val!11673 Int)) )
))
(declare-datatypes ((ValueCell!11141 0))(
  ( (ValueCellFull!11141 (v!14240 V!35977)) (EmptyCell!11141) )
))
(declare-datatypes ((array!62453 0))(
  ( (array!62454 (arr!30080 (Array (_ BitVec 32) ValueCell!11141)) (size!30559 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62453)

(declare-fun mapDefault!36909 () ValueCell!11141)

