; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108430 () Bool)

(assert start!108430)

(declare-fun b_free!27977 () Bool)

(declare-fun b_next!27977 () Bool)

(assert (=> start!108430 (= b_free!27977 (not b_next!27977))))

(declare-fun tp!99041 () Bool)

(declare-fun b_and!46037 () Bool)

(assert (=> start!108430 (= tp!99041 b_and!46037)))

(declare-fun b!1279737 () Bool)

(declare-fun res!850098 () Bool)

(declare-fun e!731191 () Bool)

(assert (=> b!1279737 (=> (not res!850098) (not e!731191))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84316 0))(
  ( (array!84317 (arr!40662 (Array (_ BitVec 32) (_ BitVec 64))) (size!41212 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84316)

(assert (=> b!1279737 (= res!850098 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41212 _keys!1741))))))

(declare-fun b!1279738 () Bool)

(declare-fun e!731192 () Bool)

(declare-fun e!731194 () Bool)

(declare-fun mapRes!51977 () Bool)

(assert (=> b!1279738 (= e!731192 (and e!731194 mapRes!51977))))

(declare-fun condMapEmpty!51977 () Bool)

(declare-datatypes ((V!49925 0))(
  ( (V!49926 (val!16883 Int)) )
))
(declare-datatypes ((ValueCell!15910 0))(
  ( (ValueCellFull!15910 (v!19483 V!49925)) (EmptyCell!15910) )
))
(declare-datatypes ((array!84318 0))(
  ( (array!84319 (arr!40663 (Array (_ BitVec 32) ValueCell!15910)) (size!41213 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84318)

(declare-fun mapDefault!51977 () ValueCell!15910)

