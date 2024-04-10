; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132118 () Bool)

(assert start!132118)

(declare-fun b_free!31831 () Bool)

(declare-fun b_next!31831 () Bool)

(assert (=> start!132118 (= b_free!31831 (not b_next!31831))))

(declare-fun tp!111744 () Bool)

(declare-fun b_and!51241 () Bool)

(assert (=> start!132118 (= tp!111744 b_and!51241)))

(declare-fun bm!70457 () Bool)

(declare-datatypes ((array!103410 0))(
  ( (array!103411 (arr!49907 (Array (_ BitVec 32) (_ BitVec 64))) (size!50457 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103410)

(declare-datatypes ((V!59253 0))(
  ( (V!59254 (val!19131 Int)) )
))
(declare-fun zeroValue!436 () V!59253)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-datatypes ((tuple2!24640 0))(
  ( (tuple2!24641 (_1!12331 (_ BitVec 64)) (_2!12331 V!59253)) )
))
(declare-datatypes ((List!36126 0))(
  ( (Nil!36123) (Cons!36122 (h!37567 tuple2!24640) (t!50820 List!36126)) )
))
(declare-datatypes ((ListLongMap!22249 0))(
  ( (ListLongMap!22250 (toList!11140 List!36126)) )
))
(declare-fun call!70462 () ListLongMap!22249)

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18143 0))(
  ( (ValueCellFull!18143 (v!21932 V!59253)) (EmptyCell!18143) )
))
(declare-datatypes ((array!103412 0))(
  ( (array!103413 (arr!49908 (Array (_ BitVec 32) ValueCell!18143)) (size!50458 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103412)

(declare-fun minValue!436 () V!59253)

(declare-fun getCurrentListMapNoExtraKeys!6592 (array!103410 array!103412 (_ BitVec 32) (_ BitVec 32) V!59253 V!59253 (_ BitVec 32) Int) ListLongMap!22249)

(assert (=> bm!70457 (= call!70462 (getCurrentListMapNoExtraKeys!6592 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun mapIsEmpty!58864 () Bool)

(declare-fun mapRes!58864 () Bool)

(assert (=> mapIsEmpty!58864 mapRes!58864))

(declare-fun mapNonEmpty!58864 () Bool)

(declare-fun tp!111745 () Bool)

(declare-fun e!862443 () Bool)

(assert (=> mapNonEmpty!58864 (= mapRes!58864 (and tp!111745 e!862443))))

(declare-fun mapKey!58864 () (_ BitVec 32))

(declare-fun mapValue!58864 () ValueCell!18143)

(declare-fun mapRest!58864 () (Array (_ BitVec 32) ValueCell!18143))

(assert (=> mapNonEmpty!58864 (= (arr!49908 _values!470) (store mapRest!58864 mapKey!58864 mapValue!58864))))

(declare-fun b!1549385 () Bool)

(declare-fun res!1061534 () Bool)

(declare-fun e!862447 () Bool)

(assert (=> b!1549385 (=> (not res!1061534) (not e!862447))))

(assert (=> b!1549385 (= res!1061534 (and (= (size!50458 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50457 _keys!618) (size!50458 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1549386 () Bool)

(declare-fun e!862446 () Bool)

(declare-fun e!862448 () Bool)

(assert (=> b!1549386 (= e!862446 (and e!862448 mapRes!58864))))

(declare-fun condMapEmpty!58864 () Bool)

(declare-fun mapDefault!58864 () ValueCell!18143)

