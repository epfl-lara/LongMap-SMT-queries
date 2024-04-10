; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111482 () Bool)

(assert start!111482)

(declare-fun b_free!30139 () Bool)

(declare-fun b_next!30139 () Bool)

(assert (=> start!111482 (= b_free!30139 (not b_next!30139))))

(declare-fun tp!105892 () Bool)

(declare-fun b_and!48437 () Bool)

(assert (=> start!111482 (= tp!105892 b_and!48437)))

(declare-fun b!1319650 () Bool)

(declare-fun res!875847 () Bool)

(declare-fun e!752881 () Bool)

(assert (=> b!1319650 (=> (not res!875847) (not e!752881))))

(declare-datatypes ((array!88856 0))(
  ( (array!88857 (arr!42902 (Array (_ BitVec 32) (_ BitVec 64))) (size!43452 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88856)

(declare-datatypes ((List!30392 0))(
  ( (Nil!30389) (Cons!30388 (h!31597 (_ BitVec 64)) (t!44080 List!30392)) )
))
(declare-fun arrayNoDuplicates!0 (array!88856 (_ BitVec 32) List!30392) Bool)

(assert (=> b!1319650 (= res!875847 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30389))))

(declare-fun b!1319651 () Bool)

(declare-fun res!875851 () Bool)

(assert (=> b!1319651 (=> (not res!875851) (not e!752881))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319651 (= res!875851 (validKeyInArray!0 (select (arr!42902 _keys!1609) from!2000)))))

(declare-fun res!875845 () Bool)

(assert (=> start!111482 (=> (not res!875845) (not e!752881))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111482 (= res!875845 (validMask!0 mask!2019))))

(assert (=> start!111482 e!752881))

(declare-fun array_inv!32391 (array!88856) Bool)

(assert (=> start!111482 (array_inv!32391 _keys!1609)))

(assert (=> start!111482 true))

(declare-fun tp_is_empty!35959 () Bool)

(assert (=> start!111482 tp_is_empty!35959))

(declare-datatypes ((V!53049 0))(
  ( (V!53050 (val!18054 Int)) )
))
(declare-datatypes ((ValueCell!17081 0))(
  ( (ValueCellFull!17081 (v!20684 V!53049)) (EmptyCell!17081) )
))
(declare-datatypes ((array!88858 0))(
  ( (array!88859 (arr!42903 (Array (_ BitVec 32) ValueCell!17081)) (size!43453 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88858)

(declare-fun e!752880 () Bool)

(declare-fun array_inv!32392 (array!88858) Bool)

(assert (=> start!111482 (and (array_inv!32392 _values!1337) e!752880)))

(assert (=> start!111482 tp!105892))

(declare-fun b!1319652 () Bool)

(declare-fun res!875846 () Bool)

(assert (=> b!1319652 (=> (not res!875846) (not e!752881))))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1319652 (= res!875846 (not (= (select (arr!42902 _keys!1609) from!2000) k!1164)))))

(declare-fun mapIsEmpty!55586 () Bool)

(declare-fun mapRes!55586 () Bool)

(assert (=> mapIsEmpty!55586 mapRes!55586))

(declare-fun b!1319653 () Bool)

(declare-fun res!875850 () Bool)

(assert (=> b!1319653 (=> (not res!875850) (not e!752881))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1319653 (= res!875850 (and (= (size!43453 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43452 _keys!1609) (size!43453 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319654 () Bool)

(declare-fun res!875852 () Bool)

(assert (=> b!1319654 (=> (not res!875852) (not e!752881))))

(assert (=> b!1319654 (= res!875852 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43452 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319655 () Bool)

(declare-fun e!752882 () Bool)

(assert (=> b!1319655 (= e!752882 tp_is_empty!35959)))

(declare-fun b!1319656 () Bool)

(assert (=> b!1319656 (= e!752881 (not true))))

(declare-datatypes ((tuple2!23240 0))(
  ( (tuple2!23241 (_1!11631 (_ BitVec 64)) (_2!11631 V!53049)) )
))
(declare-datatypes ((List!30393 0))(
  ( (Nil!30390) (Cons!30389 (h!31598 tuple2!23240) (t!44081 List!30393)) )
))
(declare-datatypes ((ListLongMap!20897 0))(
  ( (ListLongMap!20898 (toList!10464 List!30393)) )
))
(declare-fun lt!586683 () ListLongMap!20897)

(declare-fun contains!8619 (ListLongMap!20897 (_ BitVec 64)) Bool)

(assert (=> b!1319656 (contains!8619 lt!586683 k!1164)))

(declare-fun zeroValue!1279 () V!53049)

(declare-datatypes ((Unit!43466 0))(
  ( (Unit!43467) )
))
(declare-fun lt!586681 () Unit!43466)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!119 ((_ BitVec 64) (_ BitVec 64) V!53049 ListLongMap!20897) Unit!43466)

(assert (=> b!1319656 (= lt!586681 (lemmaInListMapAfterAddingDiffThenInBefore!119 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586683))))

(declare-fun lt!586680 () ListLongMap!20897)

(assert (=> b!1319656 (contains!8619 lt!586680 k!1164)))

(declare-fun minValue!1279 () V!53049)

(declare-fun lt!586682 () Unit!43466)

(assert (=> b!1319656 (= lt!586682 (lemmaInListMapAfterAddingDiffThenInBefore!119 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586680))))

(declare-fun +!4523 (ListLongMap!20897 tuple2!23240) ListLongMap!20897)

(assert (=> b!1319656 (= lt!586680 (+!4523 lt!586683 (tuple2!23241 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6158 (array!88856 array!88858 (_ BitVec 32) (_ BitVec 32) V!53049 V!53049 (_ BitVec 32) Int) ListLongMap!20897)

(declare-fun get!21561 (ValueCell!17081 V!53049) V!53049)

(declare-fun dynLambda!3462 (Int (_ BitVec 64)) V!53049)

(assert (=> b!1319656 (= lt!586683 (+!4523 (getCurrentListMapNoExtraKeys!6158 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23241 (select (arr!42902 _keys!1609) from!2000) (get!21561 (select (arr!42903 _values!1337) from!2000) (dynLambda!3462 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!55586 () Bool)

(declare-fun tp!105893 () Bool)

(assert (=> mapNonEmpty!55586 (= mapRes!55586 (and tp!105893 e!752882))))

(declare-fun mapRest!55586 () (Array (_ BitVec 32) ValueCell!17081))

(declare-fun mapKey!55586 () (_ BitVec 32))

(declare-fun mapValue!55586 () ValueCell!17081)

(assert (=> mapNonEmpty!55586 (= (arr!42903 _values!1337) (store mapRest!55586 mapKey!55586 mapValue!55586))))

(declare-fun b!1319657 () Bool)

(declare-fun res!875849 () Bool)

(assert (=> b!1319657 (=> (not res!875849) (not e!752881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88856 (_ BitVec 32)) Bool)

(assert (=> b!1319657 (= res!875849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319658 () Bool)

(declare-fun e!752884 () Bool)

(assert (=> b!1319658 (= e!752880 (and e!752884 mapRes!55586))))

(declare-fun condMapEmpty!55586 () Bool)

(declare-fun mapDefault!55586 () ValueCell!17081)

