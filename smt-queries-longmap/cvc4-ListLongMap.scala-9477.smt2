; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112474 () Bool)

(assert start!112474)

(declare-fun b_free!30869 () Bool)

(declare-fun b_next!30869 () Bool)

(assert (=> start!112474 (= b_free!30869 (not b_next!30869))))

(declare-fun tp!108243 () Bool)

(declare-fun b_and!49739 () Bool)

(assert (=> start!112474 (= tp!108243 b_and!49739)))

(declare-fun b!1333774 () Bool)

(declare-fun e!759746 () Bool)

(declare-fun e!759744 () Bool)

(declare-fun mapRes!56842 () Bool)

(assert (=> b!1333774 (= e!759746 (and e!759744 mapRes!56842))))

(declare-fun condMapEmpty!56842 () Bool)

(declare-datatypes ((V!54141 0))(
  ( (V!54142 (val!18464 Int)) )
))
(declare-datatypes ((ValueCell!17491 0))(
  ( (ValueCellFull!17491 (v!21101 V!54141)) (EmptyCell!17491) )
))
(declare-datatypes ((array!90428 0))(
  ( (array!90429 (arr!43680 (Array (_ BitVec 32) ValueCell!17491)) (size!44230 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90428)

(declare-fun mapDefault!56842 () ValueCell!17491)

