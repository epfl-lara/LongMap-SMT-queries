; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108724 () Bool)

(assert start!108724)

(declare-fun b_free!28237 () Bool)

(declare-fun b_next!28237 () Bool)

(assert (=> start!108724 (= b_free!28237 (not b_next!28237))))

(declare-fun tp!99826 () Bool)

(declare-fun b_and!46303 () Bool)

(assert (=> start!108724 (= tp!99826 b_and!46303)))

(declare-fun b!1283704 () Bool)

(declare-fun res!852748 () Bool)

(declare-fun e!733339 () Bool)

(assert (=> b!1283704 (=> (not res!852748) (not e!733339))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!84816 0))(
  ( (array!84817 (arr!40910 (Array (_ BitVec 32) (_ BitVec 64))) (size!41460 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84816)

(assert (=> b!1283704 (= res!852748 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41460 _keys!1741))))))

(declare-fun mapNonEmpty!52373 () Bool)

(declare-fun mapRes!52373 () Bool)

(declare-fun tp!99827 () Bool)

(declare-fun e!733338 () Bool)

(assert (=> mapNonEmpty!52373 (= mapRes!52373 (and tp!99827 e!733338))))

(declare-fun mapKey!52373 () (_ BitVec 32))

(declare-datatypes ((V!50273 0))(
  ( (V!50274 (val!17013 Int)) )
))
(declare-datatypes ((ValueCell!16040 0))(
  ( (ValueCellFull!16040 (v!19615 V!50273)) (EmptyCell!16040) )
))
(declare-fun mapRest!52373 () (Array (_ BitVec 32) ValueCell!16040))

(declare-datatypes ((array!84818 0))(
  ( (array!84819 (arr!40911 (Array (_ BitVec 32) ValueCell!16040)) (size!41461 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84818)

(declare-fun mapValue!52373 () ValueCell!16040)

(assert (=> mapNonEmpty!52373 (= (arr!40911 _values!1445) (store mapRest!52373 mapKey!52373 mapValue!52373))))

(declare-fun b!1283705 () Bool)

(declare-fun e!733336 () Bool)

(declare-fun e!733340 () Bool)

(assert (=> b!1283705 (= e!733336 (and e!733340 mapRes!52373))))

(declare-fun condMapEmpty!52373 () Bool)

(declare-fun mapDefault!52373 () ValueCell!16040)

