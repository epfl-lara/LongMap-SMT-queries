; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111492 () Bool)

(assert start!111492)

(declare-fun b_free!30149 () Bool)

(declare-fun b_next!30149 () Bool)

(assert (=> start!111492 (= b_free!30149 (not b_next!30149))))

(declare-fun tp!105923 () Bool)

(declare-fun b_and!48457 () Bool)

(assert (=> start!111492 (= tp!105923 b_and!48457)))

(declare-fun b!1319825 () Bool)

(declare-fun e!752957 () Bool)

(declare-fun tp_is_empty!35969 () Bool)

(assert (=> b!1319825 (= e!752957 tp_is_empty!35969)))

(declare-fun b!1319826 () Bool)

(declare-fun res!875968 () Bool)

(declare-fun e!752958 () Bool)

(assert (=> b!1319826 (=> (not res!875968) (not e!752958))))

(declare-datatypes ((array!88874 0))(
  ( (array!88875 (arr!42911 (Array (_ BitVec 32) (_ BitVec 64))) (size!43461 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88874)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53061 0))(
  ( (V!53062 (val!18059 Int)) )
))
(declare-fun zeroValue!1279 () V!53061)

(declare-datatypes ((ValueCell!17086 0))(
  ( (ValueCellFull!17086 (v!20689 V!53061)) (EmptyCell!17086) )
))
(declare-datatypes ((array!88876 0))(
  ( (array!88877 (arr!42912 (Array (_ BitVec 32) ValueCell!17086)) (size!43462 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88876)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53061)

(declare-datatypes ((tuple2!23248 0))(
  ( (tuple2!23249 (_1!11635 (_ BitVec 64)) (_2!11635 V!53061)) )
))
(declare-datatypes ((List!30400 0))(
  ( (Nil!30397) (Cons!30396 (h!31605 tuple2!23248) (t!44098 List!30400)) )
))
(declare-datatypes ((ListLongMap!20905 0))(
  ( (ListLongMap!20906 (toList!10468 List!30400)) )
))
(declare-fun contains!8623 (ListLongMap!20905 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5476 (array!88874 array!88876 (_ BitVec 32) (_ BitVec 32) V!53061 V!53061 (_ BitVec 32) Int) ListLongMap!20905)

(assert (=> b!1319826 (= res!875968 (contains!8623 (getCurrentListMap!5476 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1319827 () Bool)

(declare-fun e!752955 () Bool)

(assert (=> b!1319827 (= e!752955 tp_is_empty!35969)))

(declare-fun mapNonEmpty!55601 () Bool)

(declare-fun mapRes!55601 () Bool)

(declare-fun tp!105922 () Bool)

(assert (=> mapNonEmpty!55601 (= mapRes!55601 (and tp!105922 e!752957))))

(declare-fun mapRest!55601 () (Array (_ BitVec 32) ValueCell!17086))

(declare-fun mapKey!55601 () (_ BitVec 32))

(declare-fun mapValue!55601 () ValueCell!17086)

(assert (=> mapNonEmpty!55601 (= (arr!42912 _values!1337) (store mapRest!55601 mapKey!55601 mapValue!55601))))

(declare-fun b!1319828 () Bool)

(declare-fun res!875969 () Bool)

(assert (=> b!1319828 (=> (not res!875969) (not e!752958))))

(assert (=> b!1319828 (= res!875969 (not (= (select (arr!42911 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1319829 () Bool)

(declare-fun res!875971 () Bool)

(assert (=> b!1319829 (=> (not res!875971) (not e!752958))))

(assert (=> b!1319829 (= res!875971 (and (= (size!43462 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43461 _keys!1609) (size!43462 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319830 () Bool)

(declare-fun res!875966 () Bool)

(assert (=> b!1319830 (=> (not res!875966) (not e!752958))))

(declare-datatypes ((List!30401 0))(
  ( (Nil!30398) (Cons!30397 (h!31606 (_ BitVec 64)) (t!44099 List!30401)) )
))
(declare-fun arrayNoDuplicates!0 (array!88874 (_ BitVec 32) List!30401) Bool)

(assert (=> b!1319830 (= res!875966 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30398))))

(declare-fun res!875970 () Bool)

(assert (=> start!111492 (=> (not res!875970) (not e!752958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111492 (= res!875970 (validMask!0 mask!2019))))

(assert (=> start!111492 e!752958))

(declare-fun array_inv!32399 (array!88874) Bool)

(assert (=> start!111492 (array_inv!32399 _keys!1609)))

(assert (=> start!111492 true))

(assert (=> start!111492 tp_is_empty!35969))

(declare-fun e!752956 () Bool)

(declare-fun array_inv!32400 (array!88876) Bool)

(assert (=> start!111492 (and (array_inv!32400 _values!1337) e!752956)))

(assert (=> start!111492 tp!105923))

(declare-fun b!1319831 () Bool)

(declare-fun res!875965 () Bool)

(assert (=> b!1319831 (=> (not res!875965) (not e!752958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319831 (= res!875965 (validKeyInArray!0 (select (arr!42911 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55601 () Bool)

(assert (=> mapIsEmpty!55601 mapRes!55601))

(declare-fun b!1319832 () Bool)

(declare-fun res!875967 () Bool)

(assert (=> b!1319832 (=> (not res!875967) (not e!752958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88874 (_ BitVec 32)) Bool)

(assert (=> b!1319832 (= res!875967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319833 () Bool)

(assert (=> b!1319833 (= e!752958 (not true))))

(declare-fun lt!586743 () ListLongMap!20905)

(assert (=> b!1319833 (contains!8623 lt!586743 k!1164)))

(declare-datatypes ((Unit!43474 0))(
  ( (Unit!43475) )
))
(declare-fun lt!586740 () Unit!43474)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!123 ((_ BitVec 64) (_ BitVec 64) V!53061 ListLongMap!20905) Unit!43474)

(assert (=> b!1319833 (= lt!586740 (lemmaInListMapAfterAddingDiffThenInBefore!123 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586743))))

(declare-fun lt!586742 () ListLongMap!20905)

(assert (=> b!1319833 (contains!8623 lt!586742 k!1164)))

(declare-fun lt!586741 () Unit!43474)

(assert (=> b!1319833 (= lt!586741 (lemmaInListMapAfterAddingDiffThenInBefore!123 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586742))))

(declare-fun +!4527 (ListLongMap!20905 tuple2!23248) ListLongMap!20905)

(assert (=> b!1319833 (= lt!586742 (+!4527 lt!586743 (tuple2!23249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6162 (array!88874 array!88876 (_ BitVec 32) (_ BitVec 32) V!53061 V!53061 (_ BitVec 32) Int) ListLongMap!20905)

(declare-fun get!21567 (ValueCell!17086 V!53061) V!53061)

(declare-fun dynLambda!3466 (Int (_ BitVec 64)) V!53061)

(assert (=> b!1319833 (= lt!586743 (+!4527 (getCurrentListMapNoExtraKeys!6162 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23249 (select (arr!42911 _keys!1609) from!2000) (get!21567 (select (arr!42912 _values!1337) from!2000) (dynLambda!3466 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319834 () Bool)

(declare-fun res!875972 () Bool)

(assert (=> b!1319834 (=> (not res!875972) (not e!752958))))

(assert (=> b!1319834 (= res!875972 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43461 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319835 () Bool)

(assert (=> b!1319835 (= e!752956 (and e!752955 mapRes!55601))))

(declare-fun condMapEmpty!55601 () Bool)

(declare-fun mapDefault!55601 () ValueCell!17086)

