; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111962 () Bool)

(assert start!111962)

(declare-fun b_free!30535 () Bool)

(declare-fun b_next!30535 () Bool)

(assert (=> start!111962 (= b_free!30535 (not b_next!30535))))

(declare-fun tp!107087 () Bool)

(declare-fun b_and!49173 () Bool)

(assert (=> start!111962 (= tp!107087 b_and!49173)))

(declare-datatypes ((array!89618 0))(
  ( (array!89619 (arr!43281 (Array (_ BitVec 32) (_ BitVec 64))) (size!43831 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89618)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53577 0))(
  ( (V!53578 (val!18252 Int)) )
))
(declare-fun zeroValue!1279 () V!53577)

(declare-datatypes ((ValueCell!17279 0))(
  ( (ValueCellFull!17279 (v!20886 V!53577)) (EmptyCell!17279) )
))
(declare-datatypes ((array!89620 0))(
  ( (array!89621 (arr!43282 (Array (_ BitVec 32) ValueCell!17279)) (size!43832 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89620)

(declare-fun minValue!1279 () V!53577)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun b!1326844 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-fun e!756238 () Bool)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23550 0))(
  ( (tuple2!23551 (_1!11786 (_ BitVec 64)) (_2!11786 V!53577)) )
))
(declare-datatypes ((List!30686 0))(
  ( (Nil!30683) (Cons!30682 (h!31891 tuple2!23550) (t!44690 List!30686)) )
))
(declare-datatypes ((ListLongMap!21207 0))(
  ( (ListLongMap!21208 (toList!10619 List!30686)) )
))
(declare-fun contains!8778 (ListLongMap!21207 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5610 (array!89618 array!89620 (_ BitVec 32) (_ BitVec 32) V!53577 V!53577 (_ BitVec 32) Int) ListLongMap!21207)

(assert (=> b!1326844 (= e!756238 (not (contains!8778 (getCurrentListMap!5610 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k!1164)))))

(declare-fun b!1326845 () Bool)

(declare-fun res!880588 () Bool)

(assert (=> b!1326845 (=> (not res!880588) (not e!756238))))

(declare-datatypes ((List!30687 0))(
  ( (Nil!30684) (Cons!30683 (h!31892 (_ BitVec 64)) (t!44691 List!30687)) )
))
(declare-fun arrayNoDuplicates!0 (array!89618 (_ BitVec 32) List!30687) Bool)

(assert (=> b!1326845 (= res!880588 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30684))))

(declare-fun b!1326846 () Bool)

(declare-fun res!880585 () Bool)

(assert (=> b!1326846 (=> (not res!880585) (not e!756238))))

(assert (=> b!1326846 (= res!880585 (and (= (size!43832 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43831 _keys!1609) (size!43832 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56187 () Bool)

(declare-fun mapRes!56187 () Bool)

(declare-fun tp!107088 () Bool)

(declare-fun e!756237 () Bool)

(assert (=> mapNonEmpty!56187 (= mapRes!56187 (and tp!107088 e!756237))))

(declare-fun mapRest!56187 () (Array (_ BitVec 32) ValueCell!17279))

(declare-fun mapValue!56187 () ValueCell!17279)

(declare-fun mapKey!56187 () (_ BitVec 32))

(assert (=> mapNonEmpty!56187 (= (arr!43282 _values!1337) (store mapRest!56187 mapKey!56187 mapValue!56187))))

(declare-fun b!1326847 () Bool)

(declare-fun res!880587 () Bool)

(assert (=> b!1326847 (=> (not res!880587) (not e!756238))))

(assert (=> b!1326847 (= res!880587 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43831 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326848 () Bool)

(declare-fun res!880584 () Bool)

(assert (=> b!1326848 (=> (not res!880584) (not e!756238))))

(assert (=> b!1326848 (= res!880584 (contains!8778 (getCurrentListMap!5610 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326849 () Bool)

(declare-fun tp_is_empty!36355 () Bool)

(assert (=> b!1326849 (= e!756237 tp_is_empty!36355)))

(declare-fun mapIsEmpty!56187 () Bool)

(assert (=> mapIsEmpty!56187 mapRes!56187))

(declare-fun b!1326850 () Bool)

(declare-fun res!880583 () Bool)

(assert (=> b!1326850 (=> (not res!880583) (not e!756238))))

(assert (=> b!1326850 (= res!880583 (not (= (select (arr!43281 _keys!1609) from!2000) k!1164)))))

(declare-fun res!880582 () Bool)

(assert (=> start!111962 (=> (not res!880582) (not e!756238))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111962 (= res!880582 (validMask!0 mask!2019))))

(assert (=> start!111962 e!756238))

(declare-fun array_inv!32669 (array!89618) Bool)

(assert (=> start!111962 (array_inv!32669 _keys!1609)))

(assert (=> start!111962 true))

(assert (=> start!111962 tp_is_empty!36355))

(declare-fun e!756239 () Bool)

(declare-fun array_inv!32670 (array!89620) Bool)

(assert (=> start!111962 (and (array_inv!32670 _values!1337) e!756239)))

(assert (=> start!111962 tp!107087))

(declare-fun b!1326851 () Bool)

(declare-fun res!880586 () Bool)

(assert (=> b!1326851 (=> (not res!880586) (not e!756238))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326851 (= res!880586 (not (validKeyInArray!0 (select (arr!43281 _keys!1609) from!2000))))))

(declare-fun b!1326852 () Bool)

(declare-fun res!880581 () Bool)

(assert (=> b!1326852 (=> (not res!880581) (not e!756238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89618 (_ BitVec 32)) Bool)

(assert (=> b!1326852 (= res!880581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326853 () Bool)

(declare-fun e!756235 () Bool)

(assert (=> b!1326853 (= e!756235 tp_is_empty!36355)))

(declare-fun b!1326854 () Bool)

(assert (=> b!1326854 (= e!756239 (and e!756235 mapRes!56187))))

(declare-fun condMapEmpty!56187 () Bool)

(declare-fun mapDefault!56187 () ValueCell!17279)

