; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107204 () Bool)

(assert start!107204)

(declare-fun b!1270859 () Bool)

(declare-fun e!724529 () Bool)

(declare-fun e!724533 () Bool)

(declare-fun mapRes!50920 () Bool)

(assert (=> b!1270859 (= e!724529 (and e!724533 mapRes!50920))))

(declare-fun condMapEmpty!50920 () Bool)

(declare-datatypes ((V!49051 0))(
  ( (V!49052 (val!16521 Int)) )
))
(declare-datatypes ((ValueCell!15593 0))(
  ( (ValueCellFull!15593 (v!19158 V!49051)) (EmptyCell!15593) )
))
(declare-datatypes ((array!83044 0))(
  ( (array!83045 (arr!40059 (Array (_ BitVec 32) ValueCell!15593)) (size!40595 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83044)

(declare-fun mapDefault!50920 () ValueCell!15593)

