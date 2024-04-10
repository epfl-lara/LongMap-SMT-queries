; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111900 () Bool)

(assert start!111900)

(declare-fun b_free!30499 () Bool)

(declare-fun b_next!30499 () Bool)

(assert (=> start!111900 (= b_free!30499 (not b_next!30499))))

(declare-fun tp!106977 () Bool)

(declare-fun b_and!49093 () Bool)

(assert (=> start!111900 (= tp!106977 b_and!49093)))

(declare-fun b!1326014 () Bool)

(declare-fun e!755841 () Bool)

(declare-fun tp_is_empty!36319 () Bool)

(assert (=> b!1326014 (= e!755841 tp_is_empty!36319)))

(declare-fun b!1326015 () Bool)

(declare-fun res!880072 () Bool)

(declare-fun e!755840 () Bool)

(assert (=> b!1326015 (=> (not res!880072) (not e!755840))))

(declare-datatypes ((array!89544 0))(
  ( (array!89545 (arr!43245 (Array (_ BitVec 32) (_ BitVec 64))) (size!43795 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89544)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53529 0))(
  ( (V!53530 (val!18234 Int)) )
))
(declare-fun zeroValue!1279 () V!53529)

(declare-datatypes ((ValueCell!17261 0))(
  ( (ValueCellFull!17261 (v!20867 V!53529)) (EmptyCell!17261) )
))
(declare-datatypes ((array!89546 0))(
  ( (array!89547 (arr!43246 (Array (_ BitVec 32) ValueCell!17261)) (size!43796 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89546)

(declare-fun minValue!1279 () V!53529)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23522 0))(
  ( (tuple2!23523 (_1!11772 (_ BitVec 64)) (_2!11772 V!53529)) )
))
(declare-datatypes ((List!30661 0))(
  ( (Nil!30658) (Cons!30657 (h!31866 tuple2!23522) (t!44631 List!30661)) )
))
(declare-datatypes ((ListLongMap!21179 0))(
  ( (ListLongMap!21180 (toList!10605 List!30661)) )
))
(declare-fun contains!8762 (ListLongMap!21179 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5597 (array!89544 array!89546 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21179)

(assert (=> b!1326015 (= res!880072 (contains!8762 (getCurrentListMap!5597 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1326016 () Bool)

(declare-fun e!755838 () Bool)

(assert (=> b!1326016 (= e!755838 tp_is_empty!36319)))

(declare-fun mapNonEmpty!56130 () Bool)

(declare-fun mapRes!56130 () Bool)

(declare-fun tp!106976 () Bool)

(assert (=> mapNonEmpty!56130 (= mapRes!56130 (and tp!106976 e!755841))))

(declare-fun mapRest!56130 () (Array (_ BitVec 32) ValueCell!17261))

(declare-fun mapKey!56130 () (_ BitVec 32))

(declare-fun mapValue!56130 () ValueCell!17261)

(assert (=> mapNonEmpty!56130 (= (arr!43246 _values!1337) (store mapRest!56130 mapKey!56130 mapValue!56130))))

(declare-fun b!1326017 () Bool)

(declare-fun res!880069 () Bool)

(assert (=> b!1326017 (=> (not res!880069) (not e!755840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326017 (= res!880069 (validKeyInArray!0 (select (arr!43245 _keys!1609) from!2000)))))

(declare-fun b!1326018 () Bool)

(assert (=> b!1326018 (= e!755840 (not (bvslt from!2000 (size!43796 _values!1337))))))

(declare-fun lt!589902 () ListLongMap!21179)

(assert (=> b!1326018 (contains!8762 lt!589902 k!1164)))

(declare-datatypes ((Unit!43684 0))(
  ( (Unit!43685) )
))
(declare-fun lt!589903 () Unit!43684)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!220 ((_ BitVec 64) (_ BitVec 64) V!53529 ListLongMap!21179) Unit!43684)

(assert (=> b!1326018 (= lt!589903 (lemmaInListMapAfterAddingDiffThenInBefore!220 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589902))))

(declare-fun lt!589905 () ListLongMap!21179)

(assert (=> b!1326018 (contains!8762 lt!589905 k!1164)))

(declare-fun lt!589904 () Unit!43684)

(assert (=> b!1326018 (= lt!589904 (lemmaInListMapAfterAddingDiffThenInBefore!220 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589905))))

(declare-fun +!4628 (ListLongMap!21179 tuple2!23522) ListLongMap!21179)

(assert (=> b!1326018 (= lt!589905 (+!4628 lt!589902 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6266 (array!89544 array!89546 (_ BitVec 32) (_ BitVec 32) V!53529 V!53529 (_ BitVec 32) Int) ListLongMap!21179)

(declare-fun get!21789 (ValueCell!17261 V!53529) V!53529)

(declare-fun dynLambda!3567 (Int (_ BitVec 64)) V!53529)

(assert (=> b!1326018 (= lt!589902 (+!4628 (getCurrentListMapNoExtraKeys!6266 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43245 _keys!1609) from!2000) (get!21789 (select (arr!43246 _values!1337) from!2000) (dynLambda!3567 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!880070 () Bool)

(assert (=> start!111900 (=> (not res!880070) (not e!755840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111900 (= res!880070 (validMask!0 mask!2019))))

(assert (=> start!111900 e!755840))

(declare-fun array_inv!32643 (array!89544) Bool)

(assert (=> start!111900 (array_inv!32643 _keys!1609)))

(assert (=> start!111900 true))

(assert (=> start!111900 tp_is_empty!36319))

(declare-fun e!755842 () Bool)

(declare-fun array_inv!32644 (array!89546) Bool)

(assert (=> start!111900 (and (array_inv!32644 _values!1337) e!755842)))

(assert (=> start!111900 tp!106977))

(declare-fun b!1326013 () Bool)

(declare-fun res!880068 () Bool)

(assert (=> b!1326013 (=> (not res!880068) (not e!755840))))

(assert (=> b!1326013 (= res!880068 (not (= (select (arr!43245 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1326019 () Bool)

(declare-fun res!880067 () Bool)

(assert (=> b!1326019 (=> (not res!880067) (not e!755840))))

(assert (=> b!1326019 (= res!880067 (and (= (size!43796 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43795 _keys!1609) (size!43796 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56130 () Bool)

(assert (=> mapIsEmpty!56130 mapRes!56130))

(declare-fun b!1326020 () Bool)

(declare-fun res!880066 () Bool)

(assert (=> b!1326020 (=> (not res!880066) (not e!755840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89544 (_ BitVec 32)) Bool)

(assert (=> b!1326020 (= res!880066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326021 () Bool)

(declare-fun res!880071 () Bool)

(assert (=> b!1326021 (=> (not res!880071) (not e!755840))))

(assert (=> b!1326021 (= res!880071 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43795 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326022 () Bool)

(assert (=> b!1326022 (= e!755842 (and e!755838 mapRes!56130))))

(declare-fun condMapEmpty!56130 () Bool)

(declare-fun mapDefault!56130 () ValueCell!17261)

