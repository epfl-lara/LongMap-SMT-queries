; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109156 () Bool)

(assert start!109156)

(declare-fun b_free!28645 () Bool)

(declare-fun b_next!28645 () Bool)

(assert (=> start!109156 (= b_free!28645 (not b_next!28645))))

(declare-fun tp!101054 () Bool)

(declare-fun b_and!46735 () Bool)

(assert (=> start!109156 (= tp!101054 b_and!46735)))

(declare-fun mapIsEmpty!52988 () Bool)

(declare-fun mapRes!52988 () Bool)

(assert (=> mapIsEmpty!52988 mapRes!52988))

(declare-fun b!1290893 () Bool)

(declare-fun e!736943 () Bool)

(declare-fun e!736941 () Bool)

(assert (=> b!1290893 (= e!736943 (and e!736941 mapRes!52988))))

(declare-fun condMapEmpty!52988 () Bool)

(declare-datatypes ((V!50817 0))(
  ( (V!50818 (val!17217 Int)) )
))
(declare-datatypes ((ValueCell!16244 0))(
  ( (ValueCellFull!16244 (v!19820 V!50817)) (EmptyCell!16244) )
))
(declare-datatypes ((array!85608 0))(
  ( (array!85609 (arr!41305 (Array (_ BitVec 32) ValueCell!16244)) (size!41855 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85608)

(declare-fun mapDefault!52988 () ValueCell!16244)

