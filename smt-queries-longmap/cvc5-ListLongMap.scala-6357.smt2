; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81878 () Bool)

(assert start!81878)

(declare-fun b_free!18373 () Bool)

(declare-fun b_next!18373 () Bool)

(assert (=> start!81878 (= b_free!18373 (not b_next!18373))))

(declare-fun tp!63819 () Bool)

(declare-fun b_and!29859 () Bool)

(assert (=> start!81878 (= tp!63819 b_and!29859)))

(declare-fun mapIsEmpty!33337 () Bool)

(declare-fun mapRes!33337 () Bool)

(assert (=> mapIsEmpty!33337 mapRes!33337))

(declare-fun b!954913 () Bool)

(declare-fun e!537987 () Bool)

(declare-fun e!537986 () Bool)

(assert (=> b!954913 (= e!537987 (and e!537986 mapRes!33337))))

(declare-fun condMapEmpty!33337 () Bool)

(declare-datatypes ((V!32873 0))(
  ( (V!32874 (val!10509 Int)) )
))
(declare-datatypes ((ValueCell!9977 0))(
  ( (ValueCellFull!9977 (v!13064 V!32873)) (EmptyCell!9977) )
))
(declare-datatypes ((array!57943 0))(
  ( (array!57944 (arr!27851 (Array (_ BitVec 32) ValueCell!9977)) (size!28330 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57943)

(declare-fun mapDefault!33337 () ValueCell!9977)

