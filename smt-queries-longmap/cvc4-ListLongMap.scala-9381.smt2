; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111726 () Bool)

(assert start!111726)

(declare-fun b_free!30383 () Bool)

(declare-fun b_next!30383 () Bool)

(assert (=> start!111726 (= b_free!30383 (not b_next!30383))))

(declare-fun tp!106624 () Bool)

(declare-fun b_and!48921 () Bool)

(assert (=> start!111726 (= tp!106624 b_and!48921)))

(declare-fun b!1323892 () Bool)

(declare-fun e!754710 () Bool)

(declare-fun tp_is_empty!36203 () Bool)

(assert (=> b!1323892 (= e!754710 tp_is_empty!36203)))

(declare-fun b!1323893 () Bool)

(declare-fun e!754713 () Bool)

(assert (=> b!1323893 (= e!754713 tp_is_empty!36203)))

(declare-fun b!1323894 () Bool)

(declare-fun res!878753 () Bool)

(declare-fun e!754714 () Bool)

(assert (=> b!1323894 (=> (not res!878753) (not e!754714))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53373 0))(
  ( (V!53374 (val!18176 Int)) )
))
(declare-datatypes ((ValueCell!17203 0))(
  ( (ValueCellFull!17203 (v!20806 V!53373)) (EmptyCell!17203) )
))
(declare-datatypes ((array!89322 0))(
  ( (array!89323 (arr!43135 (Array (_ BitVec 32) ValueCell!17203)) (size!43685 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89322)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89324 0))(
  ( (array!89325 (arr!43136 (Array (_ BitVec 32) (_ BitVec 64))) (size!43686 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89324)

(assert (=> b!1323894 (= res!878753 (and (= (size!43685 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43686 _keys!1609) (size!43685 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323895 () Bool)

(declare-fun res!878749 () Bool)

(assert (=> b!1323895 (=> (not res!878749) (not e!754714))))

(declare-datatypes ((List!30576 0))(
  ( (Nil!30573) (Cons!30572 (h!31781 (_ BitVec 64)) (t!44502 List!30576)) )
))
(declare-fun arrayNoDuplicates!0 (array!89324 (_ BitVec 32) List!30576) Bool)

(assert (=> b!1323895 (= res!878749 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30573))))

(declare-fun b!1323896 () Bool)

(declare-fun res!878752 () Bool)

(assert (=> b!1323896 (=> (not res!878752) (not e!754714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89324 (_ BitVec 32)) Bool)

(assert (=> b!1323896 (= res!878752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55952 () Bool)

(declare-fun mapRes!55952 () Bool)

(declare-fun tp!106625 () Bool)

(assert (=> mapNonEmpty!55952 (= mapRes!55952 (and tp!106625 e!754710))))

(declare-fun mapRest!55952 () (Array (_ BitVec 32) ValueCell!17203))

(declare-fun mapValue!55952 () ValueCell!17203)

(declare-fun mapKey!55952 () (_ BitVec 32))

(assert (=> mapNonEmpty!55952 (= (arr!43135 _values!1337) (store mapRest!55952 mapKey!55952 mapValue!55952))))

(declare-fun b!1323897 () Bool)

(assert (=> b!1323897 (= e!754714 false)))

(declare-fun lt!589407 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53373)

(declare-fun minValue!1279 () V!53373)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23436 0))(
  ( (tuple2!23437 (_1!11729 (_ BitVec 64)) (_2!11729 V!53373)) )
))
(declare-datatypes ((List!30577 0))(
  ( (Nil!30574) (Cons!30573 (h!31782 tuple2!23436) (t!44503 List!30577)) )
))
(declare-datatypes ((ListLongMap!21093 0))(
  ( (ListLongMap!21094 (toList!10562 List!30577)) )
))
(declare-fun contains!8717 (ListLongMap!21093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5558 (array!89324 array!89322 (_ BitVec 32) (_ BitVec 32) V!53373 V!53373 (_ BitVec 32) Int) ListLongMap!21093)

(assert (=> b!1323897 (= lt!589407 (contains!8717 (getCurrentListMap!5558 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun mapIsEmpty!55952 () Bool)

(assert (=> mapIsEmpty!55952 mapRes!55952))

(declare-fun b!1323898 () Bool)

(declare-fun res!878750 () Bool)

(assert (=> b!1323898 (=> (not res!878750) (not e!754714))))

(assert (=> b!1323898 (= res!878750 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43686 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878751 () Bool)

(assert (=> start!111726 (=> (not res!878751) (not e!754714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111726 (= res!878751 (validMask!0 mask!2019))))

(assert (=> start!111726 e!754714))

(declare-fun array_inv!32563 (array!89324) Bool)

(assert (=> start!111726 (array_inv!32563 _keys!1609)))

(assert (=> start!111726 true))

(assert (=> start!111726 tp_is_empty!36203))

(declare-fun e!754711 () Bool)

(declare-fun array_inv!32564 (array!89322) Bool)

(assert (=> start!111726 (and (array_inv!32564 _values!1337) e!754711)))

(assert (=> start!111726 tp!106624))

(declare-fun b!1323899 () Bool)

(assert (=> b!1323899 (= e!754711 (and e!754713 mapRes!55952))))

(declare-fun condMapEmpty!55952 () Bool)

(declare-fun mapDefault!55952 () ValueCell!17203)

