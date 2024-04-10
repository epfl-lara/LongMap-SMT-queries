; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112894 () Bool)

(assert start!112894)

(declare-fun b!1338673 () Bool)

(declare-fun e!762302 () Bool)

(declare-fun tp_is_empty!36989 () Bool)

(assert (=> b!1338673 (= e!762302 tp_is_empty!36989)))

(declare-fun b!1338674 () Bool)

(declare-fun e!762299 () Bool)

(declare-fun mapRes!57175 () Bool)

(assert (=> b!1338674 (= e!762299 (and e!762302 mapRes!57175))))

(declare-fun condMapEmpty!57175 () Bool)

(declare-datatypes ((V!54421 0))(
  ( (V!54422 (val!18569 Int)) )
))
(declare-datatypes ((ValueCell!17596 0))(
  ( (ValueCellFull!17596 (v!21216 V!54421)) (EmptyCell!17596) )
))
(declare-datatypes ((array!90836 0))(
  ( (array!90837 (arr!43879 (Array (_ BitVec 32) ValueCell!17596)) (size!44429 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90836)

(declare-fun mapDefault!57175 () ValueCell!17596)

