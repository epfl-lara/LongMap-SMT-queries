; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112980 () Bool)

(assert start!112980)

(declare-fun b!1339193 () Bool)

(declare-fun e!762710 () Bool)

(declare-fun e!762709 () Bool)

(declare-fun mapRes!57253 () Bool)

(assert (=> b!1339193 (= e!762710 (and e!762709 mapRes!57253))))

(declare-fun condMapEmpty!57253 () Bool)

(declare-datatypes ((V!54477 0))(
  ( (V!54478 (val!18590 Int)) )
))
(declare-datatypes ((ValueCell!17617 0))(
  ( (ValueCellFull!17617 (v!21238 V!54477)) (EmptyCell!17617) )
))
(declare-datatypes ((array!90924 0))(
  ( (array!90925 (arr!43918 (Array (_ BitVec 32) ValueCell!17617)) (size!44468 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90924)

(declare-fun mapDefault!57253 () ValueCell!17617)

