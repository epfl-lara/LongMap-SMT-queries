; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113292 () Bool)

(assert start!113292)

(declare-fun b_free!31343 () Bool)

(declare-fun b_next!31343 () Bool)

(assert (=> start!113292 (= b_free!31343 (not b_next!31343))))

(declare-fun tp!109833 () Bool)

(declare-fun b_and!50565 () Bool)

(assert (=> start!113292 (= tp!109833 b_and!50565)))

(declare-fun b!1344207 () Bool)

(declare-fun e!765050 () Bool)

(declare-fun tp_is_empty!37343 () Bool)

(assert (=> b!1344207 (= e!765050 tp_is_empty!37343)))

(declare-fun b!1344208 () Bool)

(declare-fun e!765053 () Bool)

(declare-fun mapRes!57721 () Bool)

(assert (=> b!1344208 (= e!765053 (and e!765050 mapRes!57721))))

(declare-fun condMapEmpty!57721 () Bool)

(declare-datatypes ((V!54893 0))(
  ( (V!54894 (val!18746 Int)) )
))
(declare-datatypes ((ValueCell!17773 0))(
  ( (ValueCellFull!17773 (v!21394 V!54893)) (EmptyCell!17773) )
))
(declare-datatypes ((array!91530 0))(
  ( (array!91531 (arr!44221 (Array (_ BitVec 32) ValueCell!17773)) (size!44771 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91530)

(declare-fun mapDefault!57721 () ValueCell!17773)

