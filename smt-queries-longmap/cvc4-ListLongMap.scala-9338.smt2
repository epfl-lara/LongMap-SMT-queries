; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111468 () Bool)

(assert start!111468)

(declare-fun b_free!30125 () Bool)

(declare-fun b_next!30125 () Bool)

(assert (=> start!111468 (= b_free!30125 (not b_next!30125))))

(declare-fun tp!105850 () Bool)

(declare-fun b_and!48409 () Bool)

(assert (=> start!111468 (= tp!105850 b_and!48409)))

(declare-fun b!1319405 () Bool)

(declare-fun e!752777 () Bool)

(declare-fun tp_is_empty!35945 () Bool)

(assert (=> b!1319405 (= e!752777 tp_is_empty!35945)))

(declare-fun b!1319406 () Bool)

(declare-fun e!752779 () Bool)

(assert (=> b!1319406 (= e!752779 tp_is_empty!35945)))

(declare-fun b!1319407 () Bool)

(declare-fun res!875681 () Bool)

(declare-fun e!752776 () Bool)

(assert (=> b!1319407 (=> (not res!875681) (not e!752776))))

(declare-datatypes ((array!88828 0))(
  ( (array!88829 (arr!42888 (Array (_ BitVec 32) (_ BitVec 64))) (size!43438 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88828)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1319407 (= res!875681 (not (= (select (arr!42888 _keys!1609) from!2000) k!1164)))))

(declare-fun res!875678 () Bool)

(assert (=> start!111468 (=> (not res!875678) (not e!752776))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111468 (= res!875678 (validMask!0 mask!2019))))

(assert (=> start!111468 e!752776))

(declare-fun array_inv!32381 (array!88828) Bool)

(assert (=> start!111468 (array_inv!32381 _keys!1609)))

(assert (=> start!111468 true))

(assert (=> start!111468 tp_is_empty!35945))

(declare-datatypes ((V!53029 0))(
  ( (V!53030 (val!18047 Int)) )
))
(declare-datatypes ((ValueCell!17074 0))(
  ( (ValueCellFull!17074 (v!20677 V!53029)) (EmptyCell!17074) )
))
(declare-datatypes ((array!88830 0))(
  ( (array!88831 (arr!42889 (Array (_ BitVec 32) ValueCell!17074)) (size!43439 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88830)

(declare-fun e!752775 () Bool)

(declare-fun array_inv!32382 (array!88830) Bool)

(assert (=> start!111468 (and (array_inv!32382 _values!1337) e!752775)))

(assert (=> start!111468 tp!105850))

(declare-fun b!1319408 () Bool)

(declare-fun res!875682 () Bool)

(assert (=> b!1319408 (=> (not res!875682) (not e!752776))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319408 (= res!875682 (and (= (size!43439 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43438 _keys!1609) (size!43439 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319409 () Bool)

(declare-fun res!875683 () Bool)

(assert (=> b!1319409 (=> (not res!875683) (not e!752776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88828 (_ BitVec 32)) Bool)

(assert (=> b!1319409 (= res!875683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319410 () Bool)

(declare-fun res!875677 () Bool)

(assert (=> b!1319410 (=> (not res!875677) (not e!752776))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319410 (= res!875677 (validKeyInArray!0 (select (arr!42888 _keys!1609) from!2000)))))

(declare-fun b!1319411 () Bool)

(declare-fun res!875684 () Bool)

(assert (=> b!1319411 (=> (not res!875684) (not e!752776))))

(declare-fun zeroValue!1279 () V!53029)

(declare-fun minValue!1279 () V!53029)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23226 0))(
  ( (tuple2!23227 (_1!11624 (_ BitVec 64)) (_2!11624 V!53029)) )
))
(declare-datatypes ((List!30380 0))(
  ( (Nil!30377) (Cons!30376 (h!31585 tuple2!23226) (t!44054 List!30380)) )
))
(declare-datatypes ((ListLongMap!20883 0))(
  ( (ListLongMap!20884 (toList!10457 List!30380)) )
))
(declare-fun contains!8612 (ListLongMap!20883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5467 (array!88828 array!88830 (_ BitVec 32) (_ BitVec 32) V!53029 V!53029 (_ BitVec 32) Int) ListLongMap!20883)

(assert (=> b!1319411 (= res!875684 (contains!8612 (getCurrentListMap!5467 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319412 () Bool)

(declare-fun res!875679 () Bool)

(assert (=> b!1319412 (=> (not res!875679) (not e!752776))))

(declare-datatypes ((List!30381 0))(
  ( (Nil!30378) (Cons!30377 (h!31586 (_ BitVec 64)) (t!44055 List!30381)) )
))
(declare-fun arrayNoDuplicates!0 (array!88828 (_ BitVec 32) List!30381) Bool)

(assert (=> b!1319412 (= res!875679 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30378))))

(declare-fun mapIsEmpty!55565 () Bool)

(declare-fun mapRes!55565 () Bool)

(assert (=> mapIsEmpty!55565 mapRes!55565))

(declare-fun b!1319413 () Bool)

(declare-fun res!875680 () Bool)

(assert (=> b!1319413 (=> (not res!875680) (not e!752776))))

(assert (=> b!1319413 (= res!875680 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43438 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319414 () Bool)

(assert (=> b!1319414 (= e!752775 (and e!752777 mapRes!55565))))

(declare-fun condMapEmpty!55565 () Bool)

(declare-fun mapDefault!55565 () ValueCell!17074)

