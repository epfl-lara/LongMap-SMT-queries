; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111922 () Bool)

(assert start!111922)

(declare-fun b_free!30521 () Bool)

(declare-fun b_next!30521 () Bool)

(assert (=> start!111922 (= b_free!30521 (not b_next!30521))))

(declare-fun tp!107042 () Bool)

(declare-fun b_and!49137 () Bool)

(assert (=> start!111922 (= tp!107042 b_and!49137)))

(declare-fun b!1326398 () Bool)

(declare-fun res!880336 () Bool)

(declare-fun e!756006 () Bool)

(assert (=> b!1326398 (=> (not res!880336) (not e!756006))))

(declare-datatypes ((array!89588 0))(
  ( (array!89589 (arr!43267 (Array (_ BitVec 32) (_ BitVec 64))) (size!43817 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89588)

(declare-datatypes ((List!30677 0))(
  ( (Nil!30674) (Cons!30673 (h!31882 (_ BitVec 64)) (t!44669 List!30677)) )
))
(declare-fun arrayNoDuplicates!0 (array!89588 (_ BitVec 32) List!30677) Bool)

(assert (=> b!1326398 (= res!880336 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30674))))

(declare-fun b!1326399 () Bool)

(declare-fun e!756005 () Bool)

(declare-fun tp_is_empty!36341 () Bool)

(assert (=> b!1326399 (= e!756005 tp_is_empty!36341)))

(declare-fun b!1326401 () Bool)

(declare-fun res!880332 () Bool)

(assert (=> b!1326401 (=> (not res!880332) (not e!756006))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326401 (= res!880332 (validKeyInArray!0 (select (arr!43267 _keys!1609) from!2000)))))

(declare-fun b!1326402 () Bool)

(declare-fun e!756004 () Bool)

(assert (=> b!1326402 (= e!756004 tp_is_empty!36341)))

(declare-fun b!1326403 () Bool)

(declare-fun res!880331 () Bool)

(assert (=> b!1326403 (=> (not res!880331) (not e!756006))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53557 0))(
  ( (V!53558 (val!18245 Int)) )
))
(declare-datatypes ((ValueCell!17272 0))(
  ( (ValueCellFull!17272 (v!20878 V!53557)) (EmptyCell!17272) )
))
(declare-datatypes ((array!89590 0))(
  ( (array!89591 (arr!43268 (Array (_ BitVec 32) ValueCell!17272)) (size!43818 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89590)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326403 (= res!880331 (and (= (size!43818 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43817 _keys!1609) (size!43818 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56163 () Bool)

(declare-fun mapRes!56163 () Bool)

(assert (=> mapIsEmpty!56163 mapRes!56163))

(declare-fun b!1326404 () Bool)

(declare-fun res!880330 () Bool)

(assert (=> b!1326404 (=> (not res!880330) (not e!756006))))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1326404 (= res!880330 (not (= (select (arr!43267 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326400 () Bool)

(declare-fun res!880334 () Bool)

(assert (=> b!1326400 (=> (not res!880334) (not e!756006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89588 (_ BitVec 32)) Bool)

(assert (=> b!1326400 (= res!880334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!880333 () Bool)

(assert (=> start!111922 (=> (not res!880333) (not e!756006))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111922 (= res!880333 (validMask!0 mask!2019))))

(assert (=> start!111922 e!756006))

(declare-fun array_inv!32661 (array!89588) Bool)

(assert (=> start!111922 (array_inv!32661 _keys!1609)))

(assert (=> start!111922 true))

(assert (=> start!111922 tp_is_empty!36341))

(declare-fun e!756007 () Bool)

(declare-fun array_inv!32662 (array!89590) Bool)

(assert (=> start!111922 (and (array_inv!32662 _values!1337) e!756007)))

(assert (=> start!111922 tp!107042))

(declare-fun b!1326405 () Bool)

(assert (=> b!1326405 (= e!756006 (not true))))

(declare-datatypes ((tuple2!23542 0))(
  ( (tuple2!23543 (_1!11782 (_ BitVec 64)) (_2!11782 V!53557)) )
))
(declare-datatypes ((List!30678 0))(
  ( (Nil!30675) (Cons!30674 (h!31883 tuple2!23542) (t!44670 List!30678)) )
))
(declare-datatypes ((ListLongMap!21199 0))(
  ( (ListLongMap!21200 (toList!10615 List!30678)) )
))
(declare-fun lt!590063 () ListLongMap!21199)

(declare-fun contains!8772 (ListLongMap!21199 (_ BitVec 64)) Bool)

(assert (=> b!1326405 (contains!8772 lt!590063 k!1164)))

(declare-fun lt!590061 () V!53557)

(declare-datatypes ((Unit!43700 0))(
  ( (Unit!43701) )
))
(declare-fun lt!590059 () Unit!43700)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!228 ((_ BitVec 64) (_ BitVec 64) V!53557 ListLongMap!21199) Unit!43700)

(assert (=> b!1326405 (= lt!590059 (lemmaInListMapAfterAddingDiffThenInBefore!228 k!1164 (select (arr!43267 _keys!1609) from!2000) lt!590061 lt!590063))))

(declare-fun lt!590064 () ListLongMap!21199)

(assert (=> b!1326405 (contains!8772 lt!590064 k!1164)))

(declare-fun lt!590062 () Unit!43700)

(declare-fun zeroValue!1279 () V!53557)

(assert (=> b!1326405 (= lt!590062 (lemmaInListMapAfterAddingDiffThenInBefore!228 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590064))))

(declare-fun lt!590058 () ListLongMap!21199)

(assert (=> b!1326405 (contains!8772 lt!590058 k!1164)))

(declare-fun minValue!1279 () V!53557)

(declare-fun lt!590060 () Unit!43700)

(assert (=> b!1326405 (= lt!590060 (lemmaInListMapAfterAddingDiffThenInBefore!228 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590058))))

(declare-fun +!4636 (ListLongMap!21199 tuple2!23542) ListLongMap!21199)

(assert (=> b!1326405 (= lt!590058 (+!4636 lt!590064 (tuple2!23543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1326405 (= lt!590064 (+!4636 lt!590063 (tuple2!23543 (select (arr!43267 _keys!1609) from!2000) lt!590061)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21803 (ValueCell!17272 V!53557) V!53557)

(declare-fun dynLambda!3575 (Int (_ BitVec 64)) V!53557)

(assert (=> b!1326405 (= lt!590061 (get!21803 (select (arr!43268 _values!1337) from!2000) (dynLambda!3575 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6274 (array!89588 array!89590 (_ BitVec 32) (_ BitVec 32) V!53557 V!53557 (_ BitVec 32) Int) ListLongMap!21199)

(assert (=> b!1326405 (= lt!590063 (getCurrentListMapNoExtraKeys!6274 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1326406 () Bool)

(declare-fun res!880335 () Bool)

(assert (=> b!1326406 (=> (not res!880335) (not e!756006))))

(assert (=> b!1326406 (= res!880335 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43817 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56163 () Bool)

(declare-fun tp!107043 () Bool)

(assert (=> mapNonEmpty!56163 (= mapRes!56163 (and tp!107043 e!756005))))

(declare-fun mapKey!56163 () (_ BitVec 32))

(declare-fun mapRest!56163 () (Array (_ BitVec 32) ValueCell!17272))

(declare-fun mapValue!56163 () ValueCell!17272)

(assert (=> mapNonEmpty!56163 (= (arr!43268 _values!1337) (store mapRest!56163 mapKey!56163 mapValue!56163))))

(declare-fun b!1326407 () Bool)

(declare-fun res!880329 () Bool)

(assert (=> b!1326407 (=> (not res!880329) (not e!756006))))

(declare-fun getCurrentListMap!5606 (array!89588 array!89590 (_ BitVec 32) (_ BitVec 32) V!53557 V!53557 (_ BitVec 32) Int) ListLongMap!21199)

(assert (=> b!1326407 (= res!880329 (contains!8772 (getCurrentListMap!5606 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326408 () Bool)

(assert (=> b!1326408 (= e!756007 (and e!756004 mapRes!56163))))

(declare-fun condMapEmpty!56163 () Bool)

(declare-fun mapDefault!56163 () ValueCell!17272)

