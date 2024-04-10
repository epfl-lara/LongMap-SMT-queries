; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131804 () Bool)

(assert start!131804)

(declare-fun b!1543191 () Bool)

(declare-fun e!858755 () Bool)

(assert (=> b!1543191 (= e!858755 false)))

(declare-fun lt!665942 () Bool)

(declare-datatypes ((array!102812 0))(
  ( (array!102813 (arr!49608 (Array (_ BitVec 32) (_ BitVec 64))) (size!50158 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102812)

(declare-datatypes ((List!35910 0))(
  ( (Nil!35907) (Cons!35906 (h!37351 (_ BitVec 64)) (t!50604 List!35910)) )
))
(declare-fun arrayNoDuplicates!0 (array!102812 (_ BitVec 32) List!35910) Bool)

(assert (=> b!1543191 (= lt!665942 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35907))))

(declare-fun b!1543192 () Bool)

(declare-fun e!858756 () Bool)

(declare-fun e!858758 () Bool)

(declare-fun mapRes!58393 () Bool)

(assert (=> b!1543192 (= e!858756 (and e!858758 mapRes!58393))))

(declare-fun condMapEmpty!58393 () Bool)

(declare-datatypes ((V!58833 0))(
  ( (V!58834 (val!18974 Int)) )
))
(declare-datatypes ((ValueCell!17986 0))(
  ( (ValueCellFull!17986 (v!21775 V!58833)) (EmptyCell!17986) )
))
(declare-datatypes ((array!102814 0))(
  ( (array!102815 (arr!49609 (Array (_ BitVec 32) ValueCell!17986)) (size!50159 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102814)

(declare-fun mapDefault!58393 () ValueCell!17986)

