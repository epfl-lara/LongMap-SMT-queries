; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108450 () Bool)

(assert start!108450)

(declare-fun b_free!27997 () Bool)

(declare-fun b_next!27997 () Bool)

(assert (=> start!108450 (= b_free!27997 (not b_next!27997))))

(declare-fun tp!99101 () Bool)

(declare-fun b_and!46057 () Bool)

(assert (=> start!108450 (= tp!99101 b_and!46057)))

(declare-fun b!1279977 () Bool)

(declare-fun e!731343 () Bool)

(declare-fun e!731341 () Bool)

(declare-fun mapRes!52007 () Bool)

(assert (=> b!1279977 (= e!731343 (and e!731341 mapRes!52007))))

(declare-fun condMapEmpty!52007 () Bool)

(declare-datatypes ((V!49953 0))(
  ( (V!49954 (val!16893 Int)) )
))
(declare-datatypes ((ValueCell!15920 0))(
  ( (ValueCellFull!15920 (v!19493 V!49953)) (EmptyCell!15920) )
))
(declare-datatypes ((array!84356 0))(
  ( (array!84357 (arr!40682 (Array (_ BitVec 32) ValueCell!15920)) (size!41232 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84356)

(declare-fun mapDefault!52007 () ValueCell!15920)

