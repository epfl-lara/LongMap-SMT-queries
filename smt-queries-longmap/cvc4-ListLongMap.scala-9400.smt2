; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111898 () Bool)

(assert start!111898)

(declare-fun b_free!30497 () Bool)

(declare-fun b_next!30497 () Bool)

(assert (=> start!111898 (= b_free!30497 (not b_next!30497))))

(declare-fun tp!106970 () Bool)

(declare-fun b_and!49089 () Bool)

(assert (=> start!111898 (= tp!106970 b_and!49089)))

(declare-fun b!1325978 () Bool)

(declare-fun e!755827 () Bool)

(assert (=> b!1325978 (= e!755827 (not true))))

(declare-datatypes ((V!53525 0))(
  ( (V!53526 (val!18233 Int)) )
))
(declare-datatypes ((tuple2!23520 0))(
  ( (tuple2!23521 (_1!11771 (_ BitVec 64)) (_2!11771 V!53525)) )
))
(declare-datatypes ((List!30659 0))(
  ( (Nil!30656) (Cons!30655 (h!31864 tuple2!23520) (t!44627 List!30659)) )
))
(declare-datatypes ((ListLongMap!21177 0))(
  ( (ListLongMap!21178 (toList!10604 List!30659)) )
))
(declare-fun lt!589890 () ListLongMap!21177)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun contains!8761 (ListLongMap!21177 (_ BitVec 64)) Bool)

(assert (=> b!1325978 (contains!8761 lt!589890 k!1164)))

(declare-fun zeroValue!1279 () V!53525)

(declare-datatypes ((Unit!43682 0))(
  ( (Unit!43683) )
))
(declare-fun lt!589893 () Unit!43682)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!219 ((_ BitVec 64) (_ BitVec 64) V!53525 ListLongMap!21177) Unit!43682)

(assert (=> b!1325978 (= lt!589893 (lemmaInListMapAfterAddingDiffThenInBefore!219 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589890))))

(declare-fun lt!589891 () ListLongMap!21177)

(assert (=> b!1325978 (contains!8761 lt!589891 k!1164)))

(declare-fun lt!589892 () Unit!43682)

(declare-fun minValue!1279 () V!53525)

(assert (=> b!1325978 (= lt!589892 (lemmaInListMapAfterAddingDiffThenInBefore!219 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589891))))

(declare-fun +!4627 (ListLongMap!21177 tuple2!23520) ListLongMap!21177)

(assert (=> b!1325978 (= lt!589891 (+!4627 lt!589890 (tuple2!23521 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-datatypes ((array!89540 0))(
  ( (array!89541 (arr!43243 (Array (_ BitVec 32) (_ BitVec 64))) (size!43793 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89540)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17260 0))(
  ( (ValueCellFull!17260 (v!20866 V!53525)) (EmptyCell!17260) )
))
(declare-datatypes ((array!89542 0))(
  ( (array!89543 (arr!43244 (Array (_ BitVec 32) ValueCell!17260)) (size!43794 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89542)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6265 (array!89540 array!89542 (_ BitVec 32) (_ BitVec 32) V!53525 V!53525 (_ BitVec 32) Int) ListLongMap!21177)

(declare-fun get!21786 (ValueCell!17260 V!53525) V!53525)

(declare-fun dynLambda!3566 (Int (_ BitVec 64)) V!53525)

(assert (=> b!1325978 (= lt!589890 (+!4627 (getCurrentListMapNoExtraKeys!6265 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23521 (select (arr!43243 _keys!1609) from!2000) (get!21786 (select (arr!43244 _values!1337) from!2000) (dynLambda!3566 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325979 () Bool)

(declare-fun res!880046 () Bool)

(assert (=> b!1325979 (=> (not res!880046) (not e!755827))))

(declare-fun getCurrentListMap!5596 (array!89540 array!89542 (_ BitVec 32) (_ BitVec 32) V!53525 V!53525 (_ BitVec 32) Int) ListLongMap!21177)

(assert (=> b!1325979 (= res!880046 (contains!8761 (getCurrentListMap!5596 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!880045 () Bool)

(assert (=> start!111898 (=> (not res!880045) (not e!755827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111898 (= res!880045 (validMask!0 mask!2019))))

(assert (=> start!111898 e!755827))

(declare-fun array_inv!32641 (array!89540) Bool)

(assert (=> start!111898 (array_inv!32641 _keys!1609)))

(assert (=> start!111898 true))

(declare-fun tp_is_empty!36317 () Bool)

(assert (=> start!111898 tp_is_empty!36317))

(declare-fun e!755825 () Bool)

(declare-fun array_inv!32642 (array!89542) Bool)

(assert (=> start!111898 (and (array_inv!32642 _values!1337) e!755825)))

(assert (=> start!111898 tp!106970))

(declare-fun b!1325980 () Bool)

(declare-fun res!880043 () Bool)

(assert (=> b!1325980 (=> (not res!880043) (not e!755827))))

(assert (=> b!1325980 (= res!880043 (not (= (select (arr!43243 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325981 () Bool)

(declare-fun e!755823 () Bool)

(assert (=> b!1325981 (= e!755823 tp_is_empty!36317)))

(declare-fun b!1325982 () Bool)

(declare-fun res!880044 () Bool)

(assert (=> b!1325982 (=> (not res!880044) (not e!755827))))

(declare-datatypes ((List!30660 0))(
  ( (Nil!30657) (Cons!30656 (h!31865 (_ BitVec 64)) (t!44628 List!30660)) )
))
(declare-fun arrayNoDuplicates!0 (array!89540 (_ BitVec 32) List!30660) Bool)

(assert (=> b!1325982 (= res!880044 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30657))))

(declare-fun mapIsEmpty!56127 () Bool)

(declare-fun mapRes!56127 () Bool)

(assert (=> mapIsEmpty!56127 mapRes!56127))

(declare-fun b!1325983 () Bool)

(declare-fun e!755824 () Bool)

(assert (=> b!1325983 (= e!755824 tp_is_empty!36317)))

(declare-fun b!1325984 () Bool)

(declare-fun res!880041 () Bool)

(assert (=> b!1325984 (=> (not res!880041) (not e!755827))))

(assert (=> b!1325984 (= res!880041 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43793 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325985 () Bool)

(declare-fun res!880042 () Bool)

(assert (=> b!1325985 (=> (not res!880042) (not e!755827))))

(assert (=> b!1325985 (= res!880042 (and (= (size!43794 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43793 _keys!1609) (size!43794 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325986 () Bool)

(declare-fun res!880048 () Bool)

(assert (=> b!1325986 (=> (not res!880048) (not e!755827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325986 (= res!880048 (validKeyInArray!0 (select (arr!43243 _keys!1609) from!2000)))))

(declare-fun b!1325987 () Bool)

(assert (=> b!1325987 (= e!755825 (and e!755823 mapRes!56127))))

(declare-fun condMapEmpty!56127 () Bool)

(declare-fun mapDefault!56127 () ValueCell!17260)

