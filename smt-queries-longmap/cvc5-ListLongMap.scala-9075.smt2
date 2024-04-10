; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109234 () Bool)

(assert start!109234)

(declare-fun b_free!28723 () Bool)

(declare-fun b_next!28723 () Bool)

(assert (=> start!109234 (= b_free!28723 (not b_next!28723))))

(declare-fun tp!101287 () Bool)

(declare-fun b_and!46813 () Bool)

(assert (=> start!109234 (= tp!101287 b_and!46813)))

(declare-fun b!1292250 () Bool)

(declare-fun e!737600 () Bool)

(declare-fun e!737598 () Bool)

(declare-fun mapRes!53105 () Bool)

(assert (=> b!1292250 (= e!737600 (and e!737598 mapRes!53105))))

(declare-fun condMapEmpty!53105 () Bool)

(declare-datatypes ((V!50921 0))(
  ( (V!50922 (val!17256 Int)) )
))
(declare-datatypes ((ValueCell!16283 0))(
  ( (ValueCellFull!16283 (v!19859 V!50921)) (EmptyCell!16283) )
))
(declare-datatypes ((array!85760 0))(
  ( (array!85761 (arr!41381 (Array (_ BitVec 32) ValueCell!16283)) (size!41931 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85760)

(declare-fun mapDefault!53105 () ValueCell!16283)

