; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111764 () Bool)

(assert start!111764)

(declare-fun b_free!30421 () Bool)

(declare-fun b_next!30421 () Bool)

(assert (=> start!111764 (= b_free!30421 (not b_next!30421))))

(declare-fun tp!106739 () Bool)

(declare-fun b_and!48959 () Bool)

(assert (=> start!111764 (= tp!106739 b_and!48959)))

(declare-fun mapIsEmpty!56009 () Bool)

(declare-fun mapRes!56009 () Bool)

(assert (=> mapIsEmpty!56009 mapRes!56009))

(declare-fun b!1324349 () Bool)

(declare-fun e!754996 () Bool)

(declare-fun tp_is_empty!36241 () Bool)

(assert (=> b!1324349 (= e!754996 tp_is_empty!36241)))

(declare-fun b!1324350 () Bool)

(declare-fun res!879034 () Bool)

(declare-fun e!754999 () Bool)

(assert (=> b!1324350 (=> (not res!879034) (not e!754999))))

(declare-datatypes ((array!89398 0))(
  ( (array!89399 (arr!43173 (Array (_ BitVec 32) (_ BitVec 64))) (size!43723 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89398)

(declare-datatypes ((List!30604 0))(
  ( (Nil!30601) (Cons!30600 (h!31809 (_ BitVec 64)) (t!44530 List!30604)) )
))
(declare-fun arrayNoDuplicates!0 (array!89398 (_ BitVec 32) List!30604) Bool)

(assert (=> b!1324350 (= res!879034 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30601))))

(declare-fun mapNonEmpty!56009 () Bool)

(declare-fun tp!106738 () Bool)

(declare-fun e!754998 () Bool)

(assert (=> mapNonEmpty!56009 (= mapRes!56009 (and tp!106738 e!754998))))

(declare-datatypes ((V!53425 0))(
  ( (V!53426 (val!18195 Int)) )
))
(declare-datatypes ((ValueCell!17222 0))(
  ( (ValueCellFull!17222 (v!20825 V!53425)) (EmptyCell!17222) )
))
(declare-fun mapRest!56009 () (Array (_ BitVec 32) ValueCell!17222))

(declare-fun mapKey!56009 () (_ BitVec 32))

(declare-datatypes ((array!89400 0))(
  ( (array!89401 (arr!43174 (Array (_ BitVec 32) ValueCell!17222)) (size!43724 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89400)

(declare-fun mapValue!56009 () ValueCell!17222)

(assert (=> mapNonEmpty!56009 (= (arr!43174 _values!1337) (store mapRest!56009 mapKey!56009 mapValue!56009))))

(declare-fun b!1324351 () Bool)

(declare-fun res!879035 () Bool)

(assert (=> b!1324351 (=> (not res!879035) (not e!754999))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89398 (_ BitVec 32)) Bool)

(assert (=> b!1324351 (= res!879035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324348 () Bool)

(declare-fun res!879038 () Bool)

(assert (=> b!1324348 (=> (not res!879038) (not e!754999))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1324348 (= res!879038 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43723 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!879036 () Bool)

(assert (=> start!111764 (=> (not res!879036) (not e!754999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111764 (= res!879036 (validMask!0 mask!2019))))

(assert (=> start!111764 e!754999))

(declare-fun array_inv!32591 (array!89398) Bool)

(assert (=> start!111764 (array_inv!32591 _keys!1609)))

(assert (=> start!111764 true))

(assert (=> start!111764 tp_is_empty!36241))

(declare-fun e!754995 () Bool)

(declare-fun array_inv!32592 (array!89400) Bool)

(assert (=> start!111764 (and (array_inv!32592 _values!1337) e!754995)))

(assert (=> start!111764 tp!106739))

(declare-fun b!1324352 () Bool)

(declare-fun res!879037 () Bool)

(assert (=> b!1324352 (=> (not res!879037) (not e!754999))))

(assert (=> b!1324352 (= res!879037 (and (= (size!43724 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43723 _keys!1609) (size!43724 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324353 () Bool)

(assert (=> b!1324353 (= e!754995 (and e!754996 mapRes!56009))))

(declare-fun condMapEmpty!56009 () Bool)

(declare-fun mapDefault!56009 () ValueCell!17222)

