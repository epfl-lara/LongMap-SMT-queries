; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108226 () Bool)

(assert start!108226)

(declare-fun b_free!27907 () Bool)

(declare-fun b_next!27907 () Bool)

(assert (=> start!108226 (= b_free!27907 (not b_next!27907))))

(declare-fun tp!98680 () Bool)

(declare-fun b_and!45967 () Bool)

(assert (=> start!108226 (= tp!98680 b_and!45967)))

(declare-fun b!1277941 () Bool)

(declare-fun e!729889 () Bool)

(declare-fun e!729888 () Bool)

(declare-fun mapRes!51722 () Bool)

(assert (=> b!1277941 (= e!729889 (and e!729888 mapRes!51722))))

(declare-fun condMapEmpty!51722 () Bool)

(declare-datatypes ((V!49713 0))(
  ( (V!49714 (val!16803 Int)) )
))
(declare-datatypes ((ValueCell!15830 0))(
  ( (ValueCellFull!15830 (v!19402 V!49713)) (EmptyCell!15830) )
))
(declare-datatypes ((array!84006 0))(
  ( (array!84007 (arr!40512 (Array (_ BitVec 32) ValueCell!15830)) (size!41062 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!84006)

(declare-fun mapDefault!51722 () ValueCell!15830)

