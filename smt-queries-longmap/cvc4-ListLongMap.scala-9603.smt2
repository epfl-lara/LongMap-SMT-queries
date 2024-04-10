; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113542 () Bool)

(assert start!113542)

(declare-fun b_free!31535 () Bool)

(declare-fun b_next!31535 () Bool)

(assert (=> start!113542 (= b_free!31535 (not b_next!31535))))

(declare-fun tp!110414 () Bool)

(declare-fun b_and!50859 () Bool)

(assert (=> start!113542 (= tp!110414 b_and!50859)))

(declare-fun b!1347807 () Bool)

(declare-fun e!766815 () Bool)

(declare-fun tp_is_empty!37535 () Bool)

(assert (=> b!1347807 (= e!766815 tp_is_empty!37535)))

(declare-fun b!1347808 () Bool)

(declare-fun res!894277 () Bool)

(declare-fun e!766816 () Bool)

(assert (=> b!1347808 (=> (not res!894277) (not e!766816))))

(declare-datatypes ((array!91902 0))(
  ( (array!91903 (arr!44406 (Array (_ BitVec 32) (_ BitVec 64))) (size!44956 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91902)

(declare-datatypes ((List!31446 0))(
  ( (Nil!31443) (Cons!31442 (h!32651 (_ BitVec 64)) (t!46060 List!31446)) )
))
(declare-fun arrayNoDuplicates!0 (array!91902 (_ BitVec 32) List!31446) Bool)

(assert (=> b!1347808 (= res!894277 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31443))))

(declare-fun b!1347809 () Bool)

(declare-fun e!766814 () Bool)

(declare-fun e!766813 () Bool)

(declare-fun mapRes!58013 () Bool)

(assert (=> b!1347809 (= e!766814 (and e!766813 mapRes!58013))))

(declare-fun condMapEmpty!58013 () Bool)

(declare-datatypes ((V!55149 0))(
  ( (V!55150 (val!18842 Int)) )
))
(declare-datatypes ((ValueCell!17869 0))(
  ( (ValueCellFull!17869 (v!21493 V!55149)) (EmptyCell!17869) )
))
(declare-datatypes ((array!91904 0))(
  ( (array!91905 (arr!44407 (Array (_ BitVec 32) ValueCell!17869)) (size!44957 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91904)

(declare-fun mapDefault!58013 () ValueCell!17869)

