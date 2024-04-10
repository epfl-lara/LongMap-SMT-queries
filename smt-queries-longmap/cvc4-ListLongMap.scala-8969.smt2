; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108544 () Bool)

(assert start!108544)

(declare-fun b_free!28091 () Bool)

(declare-fun b_next!28091 () Bool)

(assert (=> start!108544 (= b_free!28091 (not b_next!28091))))

(declare-fun tp!99383 () Bool)

(declare-fun b_and!46151 () Bool)

(assert (=> start!108544 (= tp!99383 b_and!46151)))

(declare-fun b!1281265 () Bool)

(declare-fun res!851113 () Bool)

(declare-fun e!732048 () Bool)

(assert (=> b!1281265 (=> (not res!851113) (not e!732048))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84532 0))(
  ( (array!84533 (arr!40770 (Array (_ BitVec 32) (_ BitVec 64))) (size!41320 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84532)

(assert (=> b!1281265 (= res!851113 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41320 _keys!1741))))))

(declare-fun b!1281266 () Bool)

(declare-fun e!732047 () Bool)

(declare-fun e!732050 () Bool)

(declare-fun mapRes!52148 () Bool)

(assert (=> b!1281266 (= e!732047 (and e!732050 mapRes!52148))))

(declare-fun condMapEmpty!52148 () Bool)

(declare-datatypes ((V!50077 0))(
  ( (V!50078 (val!16940 Int)) )
))
(declare-datatypes ((ValueCell!15967 0))(
  ( (ValueCellFull!15967 (v!19540 V!50077)) (EmptyCell!15967) )
))
(declare-datatypes ((array!84534 0))(
  ( (array!84535 (arr!40771 (Array (_ BitVec 32) ValueCell!15967)) (size!41321 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84534)

(declare-fun mapDefault!52148 () ValueCell!15967)

