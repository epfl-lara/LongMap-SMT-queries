; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112970 () Bool)

(assert start!112970)

(declare-fun b!1339103 () Bool)

(declare-fun e!762638 () Bool)

(declare-fun tp_is_empty!37021 () Bool)

(assert (=> b!1339103 (= e!762638 tp_is_empty!37021)))

(declare-fun b!1339104 () Bool)

(declare-fun e!762634 () Bool)

(declare-fun e!762635 () Bool)

(declare-fun mapRes!57238 () Bool)

(assert (=> b!1339104 (= e!762634 (and e!762635 mapRes!57238))))

(declare-fun condMapEmpty!57238 () Bool)

(declare-datatypes ((V!54465 0))(
  ( (V!54466 (val!18585 Int)) )
))
(declare-datatypes ((ValueCell!17612 0))(
  ( (ValueCellFull!17612 (v!21233 V!54465)) (EmptyCell!17612) )
))
(declare-datatypes ((array!90908 0))(
  ( (array!90909 (arr!43910 (Array (_ BitVec 32) ValueCell!17612)) (size!44460 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90908)

(declare-fun mapDefault!57238 () ValueCell!17612)

