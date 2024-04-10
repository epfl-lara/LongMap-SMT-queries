; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112982 () Bool)

(assert start!112982)

(declare-fun res!888444 () Bool)

(declare-fun e!762726 () Bool)

(assert (=> start!112982 (=> (not res!888444) (not e!762726))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112982 (= res!888444 (validMask!0 mask!1977))))

(assert (=> start!112982 e!762726))

(assert (=> start!112982 true))

(declare-datatypes ((V!54481 0))(
  ( (V!54482 (val!18591 Int)) )
))
(declare-datatypes ((ValueCell!17618 0))(
  ( (ValueCellFull!17618 (v!21239 V!54481)) (EmptyCell!17618) )
))
(declare-datatypes ((array!90926 0))(
  ( (array!90927 (arr!43919 (Array (_ BitVec 32) ValueCell!17618)) (size!44469 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90926)

(declare-fun e!762727 () Bool)

(declare-fun array_inv!33117 (array!90926) Bool)

(assert (=> start!112982 (and (array_inv!33117 _values!1303) e!762727)))

(declare-datatypes ((array!90928 0))(
  ( (array!90929 (arr!43920 (Array (_ BitVec 32) (_ BitVec 64))) (size!44470 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90928)

(declare-fun array_inv!33118 (array!90928) Bool)

(assert (=> start!112982 (array_inv!33118 _keys!1571)))

(declare-fun mapIsEmpty!57256 () Bool)

(declare-fun mapRes!57256 () Bool)

(assert (=> mapIsEmpty!57256 mapRes!57256))

(declare-fun b!1339211 () Bool)

(assert (=> b!1339211 (= e!762726 false)))

(declare-fun lt!593853 () Bool)

(declare-datatypes ((List!31101 0))(
  ( (Nil!31098) (Cons!31097 (h!32306 (_ BitVec 64)) (t!45433 List!31101)) )
))
(declare-fun arrayNoDuplicates!0 (array!90928 (_ BitVec 32) List!31101) Bool)

(assert (=> b!1339211 (= lt!593853 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31098))))

(declare-fun mapNonEmpty!57256 () Bool)

(declare-fun tp!108955 () Bool)

(declare-fun e!762724 () Bool)

(assert (=> mapNonEmpty!57256 (= mapRes!57256 (and tp!108955 e!762724))))

(declare-fun mapRest!57256 () (Array (_ BitVec 32) ValueCell!17618))

(declare-fun mapValue!57256 () ValueCell!17618)

(declare-fun mapKey!57256 () (_ BitVec 32))

(assert (=> mapNonEmpty!57256 (= (arr!43919 _values!1303) (store mapRest!57256 mapKey!57256 mapValue!57256))))

(declare-fun b!1339212 () Bool)

(declare-fun res!888442 () Bool)

(assert (=> b!1339212 (=> (not res!888442) (not e!762726))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1339212 (= res!888442 (and (= (size!44469 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44470 _keys!1571) (size!44469 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339213 () Bool)

(declare-fun tp_is_empty!37033 () Bool)

(assert (=> b!1339213 (= e!762724 tp_is_empty!37033)))

(declare-fun b!1339214 () Bool)

(declare-fun e!762728 () Bool)

(assert (=> b!1339214 (= e!762727 (and e!762728 mapRes!57256))))

(declare-fun condMapEmpty!57256 () Bool)

(declare-fun mapDefault!57256 () ValueCell!17618)

