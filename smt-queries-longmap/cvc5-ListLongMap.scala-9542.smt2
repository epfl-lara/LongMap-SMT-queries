; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113114 () Bool)

(assert start!113114)

(declare-fun b_free!31165 () Bool)

(declare-fun b_next!31165 () Bool)

(assert (=> start!113114 (= b_free!31165 (not b_next!31165))))

(declare-fun tp!109300 () Bool)

(declare-fun b_and!50237 () Bool)

(assert (=> start!113114 (= tp!109300 b_and!50237)))

(declare-fun mapNonEmpty!57454 () Bool)

(declare-fun mapRes!57454 () Bool)

(declare-fun tp!109299 () Bool)

(declare-fun e!763717 () Bool)

(assert (=> mapNonEmpty!57454 (= mapRes!57454 (and tp!109299 e!763717))))

(declare-fun mapKey!57454 () (_ BitVec 32))

(declare-datatypes ((V!54657 0))(
  ( (V!54658 (val!18657 Int)) )
))
(declare-datatypes ((ValueCell!17684 0))(
  ( (ValueCellFull!17684 (v!21305 V!54657)) (EmptyCell!17684) )
))
(declare-fun mapValue!57454 () ValueCell!17684)

(declare-datatypes ((array!91182 0))(
  ( (array!91183 (arr!44047 (Array (_ BitVec 32) ValueCell!17684)) (size!44597 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91182)

(declare-fun mapRest!57454 () (Array (_ BitVec 32) ValueCell!17684))

(assert (=> mapNonEmpty!57454 (= (arr!44047 _values!1303) (store mapRest!57454 mapKey!57454 mapValue!57454))))

(declare-fun b!1341030 () Bool)

(declare-fun res!889626 () Bool)

(declare-fun e!763714 () Bool)

(assert (=> b!1341030 (=> (not res!889626) (not e!763714))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91184 0))(
  ( (array!91185 (arr!44048 (Array (_ BitVec 32) (_ BitVec 64))) (size!44598 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91184)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341030 (= res!889626 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44598 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341031 () Bool)

(declare-fun e!763718 () Bool)

(declare-fun tp_is_empty!37165 () Bool)

(assert (=> b!1341031 (= e!763718 tp_is_empty!37165)))

(declare-fun b!1341032 () Bool)

(declare-fun res!889630 () Bool)

(assert (=> b!1341032 (=> (not res!889630) (not e!763714))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1341032 (= res!889630 (and (= (size!44597 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44598 _keys!1571) (size!44597 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341033 () Bool)

(declare-fun e!763716 () Bool)

(assert (=> b!1341033 (= e!763716 (and e!763718 mapRes!57454))))

(declare-fun condMapEmpty!57454 () Bool)

(declare-fun mapDefault!57454 () ValueCell!17684)

