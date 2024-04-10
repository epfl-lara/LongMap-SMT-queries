; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101184 () Bool)

(assert start!101184)

(declare-fun b_free!26107 () Bool)

(declare-fun b_next!26107 () Bool)

(assert (=> start!101184 (= b_free!26107 (not b_next!26107))))

(declare-fun tp!91343 () Bool)

(declare-fun b_and!43331 () Bool)

(assert (=> start!101184 (= tp!91343 b_and!43331)))

(declare-fun b!1214628 () Bool)

(declare-fun res!806400 () Bool)

(declare-fun e!689760 () Bool)

(assert (=> b!1214628 (=> (not res!806400) (not e!689760))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1214628 (= res!806400 (validMask!0 mask!1564))))

(declare-fun b!1214629 () Bool)

(declare-fun e!689757 () Bool)

(declare-fun e!689758 () Bool)

(declare-fun mapRes!48091 () Bool)

(assert (=> b!1214629 (= e!689757 (and e!689758 mapRes!48091))))

(declare-fun condMapEmpty!48091 () Bool)

(declare-datatypes ((V!46209 0))(
  ( (V!46210 (val!15462 Int)) )
))
(declare-datatypes ((ValueCell!14696 0))(
  ( (ValueCellFull!14696 (v!18115 V!46209)) (EmptyCell!14696) )
))
(declare-datatypes ((array!78403 0))(
  ( (array!78404 (arr!37836 (Array (_ BitVec 32) ValueCell!14696)) (size!38372 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78403)

(declare-fun mapDefault!48091 () ValueCell!14696)

