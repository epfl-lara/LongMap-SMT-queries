; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131782 () Bool)

(assert start!131782)

(declare-fun b!1542993 () Bool)

(declare-fun e!858593 () Bool)

(assert (=> b!1542993 (= e!858593 false)))

(declare-fun lt!665909 () Bool)

(declare-datatypes ((array!102768 0))(
  ( (array!102769 (arr!49586 (Array (_ BitVec 32) (_ BitVec 64))) (size!50136 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102768)

(declare-datatypes ((List!35900 0))(
  ( (Nil!35897) (Cons!35896 (h!37341 (_ BitVec 64)) (t!50594 List!35900)) )
))
(declare-fun arrayNoDuplicates!0 (array!102768 (_ BitVec 32) List!35900) Bool)

(assert (=> b!1542993 (= lt!665909 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35897))))

(declare-fun b!1542994 () Bool)

(declare-fun e!858594 () Bool)

(declare-fun tp_is_empty!37771 () Bool)

(assert (=> b!1542994 (= e!858594 tp_is_empty!37771)))

(declare-fun b!1542995 () Bool)

(declare-fun e!858592 () Bool)

(declare-fun mapRes!58360 () Bool)

(assert (=> b!1542995 (= e!858592 (and e!858594 mapRes!58360))))

(declare-fun condMapEmpty!58360 () Bool)

(declare-datatypes ((V!58805 0))(
  ( (V!58806 (val!18963 Int)) )
))
(declare-datatypes ((ValueCell!17975 0))(
  ( (ValueCellFull!17975 (v!21764 V!58805)) (EmptyCell!17975) )
))
(declare-datatypes ((array!102770 0))(
  ( (array!102771 (arr!49587 (Array (_ BitVec 32) ValueCell!17975)) (size!50137 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102770)

(declare-fun mapDefault!58360 () ValueCell!17975)

