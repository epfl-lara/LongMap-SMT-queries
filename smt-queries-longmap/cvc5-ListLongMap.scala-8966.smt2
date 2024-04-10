; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108522 () Bool)

(assert start!108522)

(declare-fun b_free!28069 () Bool)

(declare-fun b_next!28069 () Bool)

(assert (=> start!108522 (= b_free!28069 (not b_next!28069))))

(declare-fun tp!99317 () Bool)

(declare-fun b_and!46129 () Bool)

(assert (=> start!108522 (= tp!99317 b_and!46129)))

(declare-fun b!1280935 () Bool)

(declare-fun e!731883 () Bool)

(declare-fun e!731881 () Bool)

(declare-fun mapRes!52115 () Bool)

(assert (=> b!1280935 (= e!731883 (and e!731881 mapRes!52115))))

(declare-fun condMapEmpty!52115 () Bool)

(declare-datatypes ((V!50049 0))(
  ( (V!50050 (val!16929 Int)) )
))
(declare-datatypes ((ValueCell!15956 0))(
  ( (ValueCellFull!15956 (v!19529 V!50049)) (EmptyCell!15956) )
))
(declare-datatypes ((array!84494 0))(
  ( (array!84495 (arr!40751 (Array (_ BitVec 32) ValueCell!15956)) (size!41301 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84494)

(declare-fun mapDefault!52115 () ValueCell!15956)

