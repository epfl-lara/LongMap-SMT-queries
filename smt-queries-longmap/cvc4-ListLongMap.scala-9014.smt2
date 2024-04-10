; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108848 () Bool)

(assert start!108848)

(declare-fun b_free!28361 () Bool)

(declare-fun b_next!28361 () Bool)

(assert (=> start!108848 (= b_free!28361 (not b_next!28361))))

(declare-fun tp!100198 () Bool)

(declare-fun b_and!46427 () Bool)

(assert (=> start!108848 (= tp!100198 b_and!46427)))

(declare-fun b!1285463 () Bool)

(declare-fun res!853948 () Bool)

(declare-fun e!734270 () Bool)

(assert (=> b!1285463 (=> (not res!853948) (not e!734270))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85058 0))(
  ( (array!85059 (arr!41031 (Array (_ BitVec 32) (_ BitVec 64))) (size!41581 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85058)

(assert (=> b!1285463 (= res!853948 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41581 _keys!1741))))))

(declare-fun b!1285464 () Bool)

(declare-fun e!734268 () Bool)

(declare-fun e!734269 () Bool)

(declare-fun mapRes!52559 () Bool)

(assert (=> b!1285464 (= e!734268 (and e!734269 mapRes!52559))))

(declare-fun condMapEmpty!52559 () Bool)

(declare-datatypes ((V!50437 0))(
  ( (V!50438 (val!17075 Int)) )
))
(declare-datatypes ((ValueCell!16102 0))(
  ( (ValueCellFull!16102 (v!19677 V!50437)) (EmptyCell!16102) )
))
(declare-datatypes ((array!85060 0))(
  ( (array!85061 (arr!41032 (Array (_ BitVec 32) ValueCell!16102)) (size!41582 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85060)

(declare-fun mapDefault!52559 () ValueCell!16102)

