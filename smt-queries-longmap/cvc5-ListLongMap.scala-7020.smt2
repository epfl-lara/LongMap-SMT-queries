; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89132 () Bool)

(assert start!89132)

(declare-fun b!1021875 () Bool)

(declare-fun b_free!20173 () Bool)

(declare-fun b_next!20173 () Bool)

(assert (=> b!1021875 (= b_free!20173 (not b_next!20173))))

(declare-fun tp!71554 () Bool)

(declare-fun b_and!32371 () Bool)

(assert (=> b!1021875 (= tp!71554 b_and!32371)))

(declare-fun b!1021874 () Bool)

(declare-fun e!575594 () Bool)

(declare-fun tp_is_empty!23893 () Bool)

(assert (=> b!1021874 (= e!575594 tp_is_empty!23893)))

(declare-fun e!575593 () Bool)

(declare-datatypes ((V!36731 0))(
  ( (V!36732 (val!11997 Int)) )
))
(declare-datatypes ((ValueCell!11243 0))(
  ( (ValueCellFull!11243 (v!14566 V!36731)) (EmptyCell!11243) )
))
(declare-datatypes ((array!63830 0))(
  ( (array!63831 (arr!30727 (Array (_ BitVec 32) (_ BitVec 64))) (size!31238 (_ BitVec 32))) )
))
(declare-datatypes ((array!63832 0))(
  ( (array!63833 (arr!30728 (Array (_ BitVec 32) ValueCell!11243)) (size!31239 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5080 0))(
  ( (LongMapFixedSize!5081 (defaultEntry!5892 Int) (mask!29473 (_ BitVec 32)) (extraKeys!5624 (_ BitVec 32)) (zeroValue!5728 V!36731) (minValue!5728 V!36731) (_size!2595 (_ BitVec 32)) (_keys!11037 array!63830) (_values!5915 array!63832) (_vacant!2595 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5080)

(declare-fun e!575590 () Bool)

(declare-fun array_inv!23823 (array!63830) Bool)

(declare-fun array_inv!23824 (array!63832) Bool)

(assert (=> b!1021875 (= e!575593 (and tp!71554 tp_is_empty!23893 (array_inv!23823 (_keys!11037 thiss!1427)) (array_inv!23824 (_values!5915 thiss!1427)) e!575590))))

(declare-fun b!1021876 () Bool)

(declare-fun e!575591 () Bool)

(assert (=> b!1021876 (= e!575591 false)))

(declare-fun lt!450153 () Bool)

(declare-datatypes ((List!21665 0))(
  ( (Nil!21662) (Cons!21661 (h!22859 (_ BitVec 64)) (t!30679 List!21665)) )
))
(declare-fun arrayNoDuplicates!0 (array!63830 (_ BitVec 32) List!21665) Bool)

(assert (=> b!1021876 (= lt!450153 (arrayNoDuplicates!0 (_keys!11037 thiss!1427) #b00000000000000000000000000000000 Nil!21662))))

(declare-fun b!1021877 () Bool)

(declare-fun e!575595 () Bool)

(declare-fun mapRes!37257 () Bool)

(assert (=> b!1021877 (= e!575590 (and e!575595 mapRes!37257))))

(declare-fun condMapEmpty!37257 () Bool)

(declare-fun mapDefault!37257 () ValueCell!11243)

