; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111904 () Bool)

(assert start!111904)

(declare-fun b_free!30503 () Bool)

(declare-fun b_next!30503 () Bool)

(assert (=> start!111904 (= b_free!30503 (not b_next!30503))))

(declare-fun tp!106988 () Bool)

(declare-fun b_and!49101 () Bool)

(assert (=> start!111904 (= tp!106988 b_and!49101)))

(declare-fun mapNonEmpty!56136 () Bool)

(declare-fun mapRes!56136 () Bool)

(declare-fun tp!106989 () Bool)

(declare-fun e!755872 () Bool)

(assert (=> mapNonEmpty!56136 (= mapRes!56136 (and tp!106989 e!755872))))

(declare-datatypes ((V!53533 0))(
  ( (V!53534 (val!18236 Int)) )
))
(declare-datatypes ((ValueCell!17263 0))(
  ( (ValueCellFull!17263 (v!20869 V!53533)) (EmptyCell!17263) )
))
(declare-datatypes ((array!89552 0))(
  ( (array!89553 (arr!43249 (Array (_ BitVec 32) ValueCell!17263)) (size!43799 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89552)

(declare-fun mapValue!56136 () ValueCell!17263)

(declare-fun mapKey!56136 () (_ BitVec 32))

(declare-fun mapRest!56136 () (Array (_ BitVec 32) ValueCell!17263))

(assert (=> mapNonEmpty!56136 (= (arr!43249 _values!1337) (store mapRest!56136 mapKey!56136 mapValue!56136))))

(declare-fun b!1326083 () Bool)

(declare-fun res!880115 () Bool)

(declare-fun e!755871 () Bool)

(assert (=> b!1326083 (=> (not res!880115) (not e!755871))))

(declare-datatypes ((array!89554 0))(
  ( (array!89555 (arr!43250 (Array (_ BitVec 32) (_ BitVec 64))) (size!43800 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89554)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326083 (= res!880115 (and (= (size!43799 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43800 _keys!1609) (size!43799 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!880118 () Bool)

(assert (=> start!111904 (=> (not res!880118) (not e!755871))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111904 (= res!880118 (validMask!0 mask!2019))))

(assert (=> start!111904 e!755871))

(declare-fun array_inv!32647 (array!89554) Bool)

(assert (=> start!111904 (array_inv!32647 _keys!1609)))

(assert (=> start!111904 true))

(declare-fun tp_is_empty!36323 () Bool)

(assert (=> start!111904 tp_is_empty!36323))

(declare-fun e!755870 () Bool)

(declare-fun array_inv!32648 (array!89552) Bool)

(assert (=> start!111904 (and (array_inv!32648 _values!1337) e!755870)))

(assert (=> start!111904 tp!106988))

(declare-fun b!1326084 () Bool)

(declare-fun res!880116 () Bool)

(assert (=> b!1326084 (=> (not res!880116) (not e!755871))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326084 (= res!880116 (not (= (select (arr!43250 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326085 () Bool)

(assert (=> b!1326085 (= e!755872 tp_is_empty!36323)))

(declare-fun b!1326086 () Bool)

(declare-fun res!880113 () Bool)

(assert (=> b!1326086 (=> (not res!880113) (not e!755871))))

(assert (=> b!1326086 (= res!880113 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43800 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326087 () Bool)

(declare-fun e!755869 () Bool)

(assert (=> b!1326087 (= e!755870 (and e!755869 mapRes!56136))))

(declare-fun condMapEmpty!56136 () Bool)

(declare-fun mapDefault!56136 () ValueCell!17263)

