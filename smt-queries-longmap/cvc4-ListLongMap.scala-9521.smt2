; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112992 () Bool)

(assert start!112992)

(declare-fun b!1339301 () Bool)

(declare-fun e!762803 () Bool)

(declare-fun e!762802 () Bool)

(declare-fun mapRes!57271 () Bool)

(assert (=> b!1339301 (= e!762803 (and e!762802 mapRes!57271))))

(declare-fun condMapEmpty!57271 () Bool)

(declare-datatypes ((V!54493 0))(
  ( (V!54494 (val!18596 Int)) )
))
(declare-datatypes ((ValueCell!17623 0))(
  ( (ValueCellFull!17623 (v!21244 V!54493)) (EmptyCell!17623) )
))
(declare-datatypes ((array!90946 0))(
  ( (array!90947 (arr!43929 (Array (_ BitVec 32) ValueCell!17623)) (size!44479 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90946)

(declare-fun mapDefault!57271 () ValueCell!17623)

