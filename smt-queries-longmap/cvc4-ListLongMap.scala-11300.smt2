; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131708 () Bool)

(assert start!131708)

(declare-fun b!1542327 () Bool)

(declare-fun e!858035 () Bool)

(declare-fun tp_is_empty!37697 () Bool)

(assert (=> b!1542327 (= e!858035 tp_is_empty!37697)))

(declare-fun b!1542328 () Bool)

(declare-fun res!1058437 () Bool)

(declare-fun e!858038 () Bool)

(assert (=> b!1542328 (=> (not res!1058437) (not e!858038))))

(declare-datatypes ((array!102624 0))(
  ( (array!102625 (arr!49514 (Array (_ BitVec 32) (_ BitVec 64))) (size!50064 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102624)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102624 (_ BitVec 32)) Bool)

(assert (=> b!1542328 (= res!1058437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542329 () Bool)

(declare-fun e!858036 () Bool)

(assert (=> b!1542329 (= e!858036 tp_is_empty!37697)))

(declare-fun b!1542330 () Bool)

(declare-fun e!858039 () Bool)

(declare-fun mapRes!58249 () Bool)

(assert (=> b!1542330 (= e!858039 (and e!858035 mapRes!58249))))

(declare-fun condMapEmpty!58249 () Bool)

(declare-datatypes ((V!58705 0))(
  ( (V!58706 (val!18926 Int)) )
))
(declare-datatypes ((ValueCell!17938 0))(
  ( (ValueCellFull!17938 (v!21727 V!58705)) (EmptyCell!17938) )
))
(declare-datatypes ((array!102626 0))(
  ( (array!102627 (arr!49515 (Array (_ BitVec 32) ValueCell!17938)) (size!50065 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102626)

(declare-fun mapDefault!58249 () ValueCell!17938)

