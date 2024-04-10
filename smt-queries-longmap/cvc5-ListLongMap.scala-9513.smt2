; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112902 () Bool)

(assert start!112902)

(declare-fun b!1338697 () Bool)

(declare-fun res!888174 () Bool)

(declare-fun e!762322 () Bool)

(assert (=> b!1338697 (=> (not res!888174) (not e!762322))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90840 0))(
  ( (array!90841 (arr!43880 (Array (_ BitVec 32) (_ BitVec 64))) (size!44430 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90840)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54425 0))(
  ( (V!54426 (val!18570 Int)) )
))
(declare-datatypes ((ValueCell!17597 0))(
  ( (ValueCellFull!17597 (v!21217 V!54425)) (EmptyCell!17597) )
))
(declare-datatypes ((array!90842 0))(
  ( (array!90843 (arr!43881 (Array (_ BitVec 32) ValueCell!17597)) (size!44431 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90842)

(assert (=> b!1338697 (= res!888174 (and (= (size!44431 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44430 _keys!1571) (size!44431 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1338698 () Bool)

(declare-fun e!762323 () Bool)

(declare-fun tp_is_empty!36991 () Bool)

(assert (=> b!1338698 (= e!762323 tp_is_empty!36991)))

(declare-fun b!1338699 () Bool)

(declare-fun res!888175 () Bool)

(assert (=> b!1338699 (=> (not res!888175) (not e!762322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90840 (_ BitVec 32)) Bool)

(assert (=> b!1338699 (= res!888175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1338700 () Bool)

(declare-fun e!762320 () Bool)

(assert (=> b!1338700 (= e!762320 tp_is_empty!36991)))

(declare-fun mapIsEmpty!57181 () Bool)

(declare-fun mapRes!57181 () Bool)

(assert (=> mapIsEmpty!57181 mapRes!57181))

(declare-fun mapNonEmpty!57181 () Bool)

(declare-fun tp!108880 () Bool)

(assert (=> mapNonEmpty!57181 (= mapRes!57181 (and tp!108880 e!762320))))

(declare-fun mapRest!57181 () (Array (_ BitVec 32) ValueCell!17597))

(declare-fun mapValue!57181 () ValueCell!17597)

(declare-fun mapKey!57181 () (_ BitVec 32))

(assert (=> mapNonEmpty!57181 (= (arr!43881 _values!1303) (store mapRest!57181 mapKey!57181 mapValue!57181))))

(declare-fun b!1338701 () Bool)

(declare-fun e!762324 () Bool)

(assert (=> b!1338701 (= e!762324 (and e!762323 mapRes!57181))))

(declare-fun condMapEmpty!57181 () Bool)

(declare-fun mapDefault!57181 () ValueCell!17597)

