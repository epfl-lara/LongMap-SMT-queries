; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82296 () Bool)

(assert start!82296)

(declare-fun b_free!18569 () Bool)

(declare-fun b_next!18569 () Bool)

(assert (=> start!82296 (= b_free!18569 (not b_next!18569))))

(declare-fun tp!64667 () Bool)

(declare-fun b_and!30057 () Bool)

(assert (=> start!82296 (= tp!64667 b_and!30057)))

(declare-fun b!959422 () Bool)

(declare-fun e!540839 () Bool)

(declare-fun e!540838 () Bool)

(declare-fun mapRes!33892 () Bool)

(assert (=> b!959422 (= e!540839 (and e!540838 mapRes!33892))))

(declare-fun condMapEmpty!33892 () Bool)

(declare-datatypes ((V!33349 0))(
  ( (V!33350 (val!10688 Int)) )
))
(declare-datatypes ((ValueCell!10156 0))(
  ( (ValueCellFull!10156 (v!13245 V!33349)) (EmptyCell!10156) )
))
(declare-datatypes ((array!58645 0))(
  ( (array!58646 (arr!28196 (Array (_ BitVec 32) ValueCell!10156)) (size!28675 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58645)

(declare-fun mapDefault!33892 () ValueCell!10156)

