; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111546 () Bool)

(assert start!111546)

(declare-fun b_free!30203 () Bool)

(declare-fun b_next!30203 () Bool)

(assert (=> start!111546 (= b_free!30203 (not b_next!30203))))

(declare-fun tp!106084 () Bool)

(declare-fun b_and!48565 () Bool)

(assert (=> start!111546 (= tp!106084 b_and!48565)))

(declare-fun b!1320770 () Bool)

(declare-fun res!876619 () Bool)

(declare-fun e!753364 () Bool)

(assert (=> b!1320770 (=> (not res!876619) (not e!753364))))

(declare-datatypes ((array!88976 0))(
  ( (array!88977 (arr!42962 (Array (_ BitVec 32) (_ BitVec 64))) (size!43512 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88976)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88976 (_ BitVec 32)) Bool)

(assert (=> b!1320770 (= res!876619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320771 () Bool)

(declare-fun res!876616 () Bool)

(assert (=> b!1320771 (=> (not res!876616) (not e!753364))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53133 0))(
  ( (V!53134 (val!18086 Int)) )
))
(declare-datatypes ((ValueCell!17113 0))(
  ( (ValueCellFull!17113 (v!20716 V!53133)) (EmptyCell!17113) )
))
(declare-datatypes ((array!88978 0))(
  ( (array!88979 (arr!42963 (Array (_ BitVec 32) ValueCell!17113)) (size!43513 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88978)

(assert (=> b!1320771 (= res!876616 (and (= (size!43513 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43512 _keys!1609) (size!43513 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320772 () Bool)

(declare-fun res!876613 () Bool)

(assert (=> b!1320772 (=> (not res!876613) (not e!753364))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53133)

(declare-fun minValue!1279 () V!53133)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23292 0))(
  ( (tuple2!23293 (_1!11657 (_ BitVec 64)) (_2!11657 V!53133)) )
))
(declare-datatypes ((List!30441 0))(
  ( (Nil!30438) (Cons!30437 (h!31646 tuple2!23292) (t!44193 List!30441)) )
))
(declare-datatypes ((ListLongMap!20949 0))(
  ( (ListLongMap!20950 (toList!10490 List!30441)) )
))
(declare-fun contains!8645 (ListLongMap!20949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5493 (array!88976 array!88978 (_ BitVec 32) (_ BitVec 32) V!53133 V!53133 (_ BitVec 32) Int) ListLongMap!20949)

(assert (=> b!1320772 (= res!876613 (contains!8645 (getCurrentListMap!5493 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1320773 () Bool)

(declare-fun e!753363 () Bool)

(declare-fun tp_is_empty!36023 () Bool)

(assert (=> b!1320773 (= e!753363 tp_is_empty!36023)))

(declare-fun res!876614 () Bool)

(assert (=> start!111546 (=> (not res!876614) (not e!753364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111546 (= res!876614 (validMask!0 mask!2019))))

(assert (=> start!111546 e!753364))

(declare-fun array_inv!32435 (array!88976) Bool)

(assert (=> start!111546 (array_inv!32435 _keys!1609)))

(assert (=> start!111546 true))

(assert (=> start!111546 tp_is_empty!36023))

(declare-fun e!753360 () Bool)

(declare-fun array_inv!32436 (array!88978) Bool)

(assert (=> start!111546 (and (array_inv!32436 _values!1337) e!753360)))

(assert (=> start!111546 tp!106084))

(declare-fun b!1320774 () Bool)

(declare-fun e!753361 () Bool)

(assert (=> b!1320774 (= e!753361 tp_is_empty!36023)))

(declare-fun b!1320775 () Bool)

(assert (=> b!1320775 (= e!753364 (not true))))

(declare-fun lt!587067 () ListLongMap!20949)

(assert (=> b!1320775 (contains!8645 lt!587067 k!1164)))

(declare-datatypes ((Unit!43518 0))(
  ( (Unit!43519) )
))
(declare-fun lt!587066 () Unit!43518)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!145 ((_ BitVec 64) (_ BitVec 64) V!53133 ListLongMap!20949) Unit!43518)

(assert (=> b!1320775 (= lt!587066 (lemmaInListMapAfterAddingDiffThenInBefore!145 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587067))))

(declare-fun lt!587065 () ListLongMap!20949)

(assert (=> b!1320775 (contains!8645 lt!587065 k!1164)))

(declare-fun lt!587064 () Unit!43518)

(assert (=> b!1320775 (= lt!587064 (lemmaInListMapAfterAddingDiffThenInBefore!145 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587065))))

(declare-fun +!4549 (ListLongMap!20949 tuple2!23292) ListLongMap!20949)

(assert (=> b!1320775 (= lt!587065 (+!4549 lt!587067 (tuple2!23293 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6184 (array!88976 array!88978 (_ BitVec 32) (_ BitVec 32) V!53133 V!53133 (_ BitVec 32) Int) ListLongMap!20949)

(declare-fun get!21607 (ValueCell!17113 V!53133) V!53133)

(declare-fun dynLambda!3488 (Int (_ BitVec 64)) V!53133)

(assert (=> b!1320775 (= lt!587067 (+!4549 (getCurrentListMapNoExtraKeys!6184 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23293 (select (arr!42962 _keys!1609) from!2000) (get!21607 (select (arr!42963 _values!1337) from!2000) (dynLambda!3488 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!55682 () Bool)

(declare-fun mapRes!55682 () Bool)

(assert (=> mapIsEmpty!55682 mapRes!55682))

(declare-fun b!1320776 () Bool)

(declare-fun res!876620 () Bool)

(assert (=> b!1320776 (=> (not res!876620) (not e!753364))))

(assert (=> b!1320776 (= res!876620 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43512 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320777 () Bool)

(assert (=> b!1320777 (= e!753360 (and e!753361 mapRes!55682))))

(declare-fun condMapEmpty!55682 () Bool)

(declare-fun mapDefault!55682 () ValueCell!17113)

