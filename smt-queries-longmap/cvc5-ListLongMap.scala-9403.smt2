; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111912 () Bool)

(assert start!111912)

(declare-fun b_free!30511 () Bool)

(declare-fun b_next!30511 () Bool)

(assert (=> start!111912 (= b_free!30511 (not b_next!30511))))

(declare-fun tp!107013 () Bool)

(declare-fun b_and!49117 () Bool)

(assert (=> start!111912 (= tp!107013 b_and!49117)))

(declare-fun mapNonEmpty!56148 () Bool)

(declare-fun mapRes!56148 () Bool)

(declare-fun tp!107012 () Bool)

(declare-fun e!755932 () Bool)

(assert (=> mapNonEmpty!56148 (= mapRes!56148 (and tp!107012 e!755932))))

(declare-fun mapKey!56148 () (_ BitVec 32))

(declare-datatypes ((V!53545 0))(
  ( (V!53546 (val!18240 Int)) )
))
(declare-datatypes ((ValueCell!17267 0))(
  ( (ValueCellFull!17267 (v!20873 V!53545)) (EmptyCell!17267) )
))
(declare-datatypes ((array!89568 0))(
  ( (array!89569 (arr!43257 (Array (_ BitVec 32) ValueCell!17267)) (size!43807 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89568)

(declare-fun mapValue!56148 () ValueCell!17267)

(declare-fun mapRest!56148 () (Array (_ BitVec 32) ValueCell!17267))

(assert (=> mapNonEmpty!56148 (= (arr!43257 _values!1337) (store mapRest!56148 mapKey!56148 mapValue!56148))))

(declare-fun b!1326223 () Bool)

(declare-fun res!880214 () Bool)

(declare-fun e!755928 () Bool)

(assert (=> b!1326223 (=> (not res!880214) (not e!755928))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(declare-datatypes ((array!89570 0))(
  ( (array!89571 (arr!43258 (Array (_ BitVec 32) (_ BitVec 64))) (size!43808 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89570)

(assert (=> b!1326223 (= res!880214 (not (= (select (arr!43258 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!56148 () Bool)

(assert (=> mapIsEmpty!56148 mapRes!56148))

(declare-fun b!1326224 () Bool)

(declare-fun tp_is_empty!36331 () Bool)

(assert (=> b!1326224 (= e!755932 tp_is_empty!36331)))

(declare-fun b!1326225 () Bool)

(declare-fun e!755931 () Bool)

(assert (=> b!1326225 (= e!755931 tp_is_empty!36331)))

(declare-fun b!1326226 () Bool)

(declare-fun res!880212 () Bool)

(assert (=> b!1326226 (=> (not res!880212) (not e!755928))))

(declare-datatypes ((List!30668 0))(
  ( (Nil!30665) (Cons!30664 (h!31873 (_ BitVec 64)) (t!44650 List!30668)) )
))
(declare-fun arrayNoDuplicates!0 (array!89570 (_ BitVec 32) List!30668) Bool)

(assert (=> b!1326226 (= res!880212 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30665))))

(declare-fun b!1326227 () Bool)

(declare-fun res!880210 () Bool)

(assert (=> b!1326227 (=> (not res!880210) (not e!755928))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326227 (= res!880210 (validKeyInArray!0 (select (arr!43258 _keys!1609) from!2000)))))

(declare-fun b!1326228 () Bool)

(declare-fun res!880213 () Bool)

(assert (=> b!1326228 (=> (not res!880213) (not e!755928))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1326228 (= res!880213 (and (= (size!43807 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43808 _keys!1609) (size!43807 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326229 () Bool)

(declare-fun res!880216 () Bool)

(assert (=> b!1326229 (=> (not res!880216) (not e!755928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89570 (_ BitVec 32)) Bool)

(assert (=> b!1326229 (= res!880216 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326230 () Bool)

(declare-fun res!880209 () Bool)

(assert (=> b!1326230 (=> (not res!880209) (not e!755928))))

(declare-fun zeroValue!1279 () V!53545)

(declare-fun minValue!1279 () V!53545)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23532 0))(
  ( (tuple2!23533 (_1!11777 (_ BitVec 64)) (_2!11777 V!53545)) )
))
(declare-datatypes ((List!30669 0))(
  ( (Nil!30666) (Cons!30665 (h!31874 tuple2!23532) (t!44651 List!30669)) )
))
(declare-datatypes ((ListLongMap!21189 0))(
  ( (ListLongMap!21190 (toList!10610 List!30669)) )
))
(declare-fun contains!8767 (ListLongMap!21189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5601 (array!89570 array!89568 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21189)

(assert (=> b!1326230 (= res!880209 (contains!8767 (getCurrentListMap!5601 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!880215 () Bool)

(assert (=> start!111912 (=> (not res!880215) (not e!755928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111912 (= res!880215 (validMask!0 mask!2019))))

(assert (=> start!111912 e!755928))

(declare-fun array_inv!32653 (array!89570) Bool)

(assert (=> start!111912 (array_inv!32653 _keys!1609)))

(assert (=> start!111912 true))

(assert (=> start!111912 tp_is_empty!36331))

(declare-fun e!755930 () Bool)

(declare-fun array_inv!32654 (array!89568) Bool)

(assert (=> start!111912 (and (array_inv!32654 _values!1337) e!755930)))

(assert (=> start!111912 tp!107013))

(declare-fun b!1326231 () Bool)

(declare-fun res!880211 () Bool)

(assert (=> b!1326231 (=> (not res!880211) (not e!755928))))

(assert (=> b!1326231 (= res!880211 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43808 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326232 () Bool)

(assert (=> b!1326232 (= e!755928 (not (not (= k!1164 (select (arr!43258 _keys!1609) from!2000)))))))

(declare-fun lt!589974 () ListLongMap!21189)

(assert (=> b!1326232 (contains!8767 lt!589974 k!1164)))

(declare-datatypes ((Unit!43692 0))(
  ( (Unit!43693) )
))
(declare-fun lt!589975 () Unit!43692)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!224 ((_ BitVec 64) (_ BitVec 64) V!53545 ListLongMap!21189) Unit!43692)

(assert (=> b!1326232 (= lt!589975 (lemmaInListMapAfterAddingDiffThenInBefore!224 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589974))))

(declare-fun lt!589976 () ListLongMap!21189)

(assert (=> b!1326232 (contains!8767 lt!589976 k!1164)))

(declare-fun lt!589977 () Unit!43692)

(assert (=> b!1326232 (= lt!589977 (lemmaInListMapAfterAddingDiffThenInBefore!224 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589976))))

(declare-fun +!4632 (ListLongMap!21189 tuple2!23532) ListLongMap!21189)

(assert (=> b!1326232 (= lt!589976 (+!4632 lt!589974 (tuple2!23533 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6270 (array!89570 array!89568 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21189)

(declare-fun get!21797 (ValueCell!17267 V!53545) V!53545)

(declare-fun dynLambda!3571 (Int (_ BitVec 64)) V!53545)

(assert (=> b!1326232 (= lt!589974 (+!4632 (getCurrentListMapNoExtraKeys!6270 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23533 (select (arr!43258 _keys!1609) from!2000) (get!21797 (select (arr!43257 _values!1337) from!2000) (dynLambda!3571 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326233 () Bool)

(assert (=> b!1326233 (= e!755930 (and e!755931 mapRes!56148))))

(declare-fun condMapEmpty!56148 () Bool)

(declare-fun mapDefault!56148 () ValueCell!17267)

