; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108492 () Bool)

(assert start!108492)

(declare-fun b_free!28039 () Bool)

(declare-fun b_next!28039 () Bool)

(assert (=> start!108492 (= b_free!28039 (not b_next!28039))))

(declare-fun tp!99226 () Bool)

(declare-fun b_and!46099 () Bool)

(assert (=> start!108492 (= tp!99226 b_and!46099)))

(declare-fun b!1280485 () Bool)

(declare-fun e!731660 () Bool)

(declare-fun e!731656 () Bool)

(declare-fun mapRes!52070 () Bool)

(assert (=> b!1280485 (= e!731660 (and e!731656 mapRes!52070))))

(declare-fun condMapEmpty!52070 () Bool)

(declare-datatypes ((V!50009 0))(
  ( (V!50010 (val!16914 Int)) )
))
(declare-datatypes ((ValueCell!15941 0))(
  ( (ValueCellFull!15941 (v!19514 V!50009)) (EmptyCell!15941) )
))
(declare-datatypes ((array!84436 0))(
  ( (array!84437 (arr!40722 (Array (_ BitVec 32) ValueCell!15941)) (size!41272 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84436)

(declare-fun mapDefault!52070 () ValueCell!15941)

