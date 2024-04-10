; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81866 () Bool)

(assert start!81866)

(declare-fun b_free!18361 () Bool)

(declare-fun b_next!18361 () Bool)

(assert (=> start!81866 (= b_free!18361 (not b_next!18361))))

(declare-fun tp!63782 () Bool)

(declare-fun b_and!29847 () Bool)

(assert (=> start!81866 (= tp!63782 b_and!29847)))

(declare-fun b!954751 () Bool)

(declare-fun e!537898 () Bool)

(declare-fun e!537896 () Bool)

(declare-fun mapRes!33319 () Bool)

(assert (=> b!954751 (= e!537898 (and e!537896 mapRes!33319))))

(declare-fun condMapEmpty!33319 () Bool)

(declare-datatypes ((V!32857 0))(
  ( (V!32858 (val!10503 Int)) )
))
(declare-datatypes ((ValueCell!9971 0))(
  ( (ValueCellFull!9971 (v!13058 V!32857)) (EmptyCell!9971) )
))
(declare-datatypes ((array!57921 0))(
  ( (array!57922 (arr!27840 (Array (_ BitVec 32) ValueCell!9971)) (size!28319 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57921)

(declare-fun mapDefault!33319 () ValueCell!9971)

