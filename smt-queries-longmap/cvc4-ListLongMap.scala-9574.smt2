; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113310 () Bool)

(assert start!113310)

(declare-fun b_free!31361 () Bool)

(declare-fun b_next!31361 () Bool)

(assert (=> start!113310 (= b_free!31361 (not b_next!31361))))

(declare-fun tp!109887 () Bool)

(declare-fun b_and!50583 () Bool)

(assert (=> start!113310 (= tp!109887 b_and!50583)))

(declare-fun b!1344423 () Bool)

(declare-fun e!765185 () Bool)

(declare-fun e!765187 () Bool)

(declare-fun mapRes!57748 () Bool)

(assert (=> b!1344423 (= e!765185 (and e!765187 mapRes!57748))))

(declare-fun condMapEmpty!57748 () Bool)

(declare-datatypes ((V!54917 0))(
  ( (V!54918 (val!18755 Int)) )
))
(declare-datatypes ((ValueCell!17782 0))(
  ( (ValueCellFull!17782 (v!21403 V!54917)) (EmptyCell!17782) )
))
(declare-datatypes ((array!91564 0))(
  ( (array!91565 (arr!44238 (Array (_ BitVec 32) ValueCell!17782)) (size!44788 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91564)

(declare-fun mapDefault!57748 () ValueCell!17782)

