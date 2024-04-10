; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111658 () Bool)

(assert start!111658)

(declare-fun b_free!30315 () Bool)

(declare-fun b_next!30315 () Bool)

(assert (=> start!111658 (= b_free!30315 (not b_next!30315))))

(declare-fun tp!106421 () Bool)

(declare-fun b_and!48789 () Bool)

(assert (=> start!111658 (= tp!106421 b_and!48789)))

(declare-fun mapNonEmpty!55850 () Bool)

(declare-fun mapRes!55850 () Bool)

(declare-fun tp!106420 () Bool)

(declare-fun e!754200 () Bool)

(assert (=> mapNonEmpty!55850 (= mapRes!55850 (and tp!106420 e!754200))))

(declare-datatypes ((V!53283 0))(
  ( (V!53284 (val!18142 Int)) )
))
(declare-datatypes ((ValueCell!17169 0))(
  ( (ValueCellFull!17169 (v!20772 V!53283)) (EmptyCell!17169) )
))
(declare-datatypes ((array!89190 0))(
  ( (array!89191 (arr!43069 (Array (_ BitVec 32) ValueCell!17169)) (size!43619 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89190)

(declare-fun mapValue!55850 () ValueCell!17169)

(declare-fun mapRest!55850 () (Array (_ BitVec 32) ValueCell!17169))

(declare-fun mapKey!55850 () (_ BitVec 32))

(assert (=> mapNonEmpty!55850 (= (arr!43069 _values!1337) (store mapRest!55850 mapKey!55850 mapValue!55850))))

(declare-fun b!1322730 () Bool)

(declare-fun res!877963 () Bool)

(declare-fun e!754201 () Bool)

(assert (=> b!1322730 (=> (not res!877963) (not e!754201))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53283)

(declare-fun minValue!1279 () V!53283)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((array!89192 0))(
  ( (array!89193 (arr!43070 (Array (_ BitVec 32) (_ BitVec 64))) (size!43620 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89192)

(declare-datatypes ((tuple2!23378 0))(
  ( (tuple2!23379 (_1!11700 (_ BitVec 64)) (_2!11700 V!53283)) )
))
(declare-datatypes ((List!30523 0))(
  ( (Nil!30520) (Cons!30519 (h!31728 tuple2!23378) (t!44387 List!30523)) )
))
(declare-datatypes ((ListLongMap!21035 0))(
  ( (ListLongMap!21036 (toList!10533 List!30523)) )
))
(declare-fun contains!8688 (ListLongMap!21035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5533 (array!89192 array!89190 (_ BitVec 32) (_ BitVec 32) V!53283 V!53283 (_ BitVec 32) Int) ListLongMap!21035)

(assert (=> b!1322730 (= res!877963 (contains!8688 (getCurrentListMap!5533 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322731 () Bool)

(declare-fun res!877959 () Bool)

(assert (=> b!1322731 (=> (not res!877959) (not e!754201))))

(assert (=> b!1322731 (= res!877959 (and (= (size!43619 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43620 _keys!1609) (size!43619 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322732 () Bool)

(declare-fun e!754202 () Bool)

(declare-fun e!754203 () Bool)

(assert (=> b!1322732 (= e!754202 (and e!754203 mapRes!55850))))

(declare-fun condMapEmpty!55850 () Bool)

(declare-fun mapDefault!55850 () ValueCell!17169)

(assert (=> b!1322732 (= condMapEmpty!55850 (= (arr!43069 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17169)) mapDefault!55850)))))

(declare-fun b!1322733 () Bool)

(assert (=> b!1322733 (= e!754201 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-fun lt!588394 () ListLongMap!21035)

(declare-fun lt!588398 () tuple2!23378)

(declare-fun +!4585 (ListLongMap!21035 tuple2!23378) ListLongMap!21035)

(assert (=> b!1322733 (contains!8688 (+!4585 lt!588394 lt!588398) k0!1164)))

(declare-datatypes ((Unit!43590 0))(
  ( (Unit!43591) )
))
(declare-fun lt!588399 () Unit!43590)

(declare-fun addStillContains!1134 (ListLongMap!21035 (_ BitVec 64) V!53283 (_ BitVec 64)) Unit!43590)

(assert (=> b!1322733 (= lt!588399 (addStillContains!1134 lt!588394 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322733 (contains!8688 lt!588394 k0!1164)))

(declare-fun lt!588395 () V!53283)

(declare-fun lt!588396 () Unit!43590)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!181 ((_ BitVec 64) (_ BitVec 64) V!53283 ListLongMap!21035) Unit!43590)

(assert (=> b!1322733 (= lt!588396 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 (select (arr!43070 _keys!1609) from!2000) lt!588395 lt!588394))))

(declare-fun lt!588397 () ListLongMap!21035)

(assert (=> b!1322733 (contains!8688 lt!588397 k0!1164)))

(declare-fun lt!588392 () Unit!43590)

(assert (=> b!1322733 (= lt!588392 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588397))))

(declare-fun lt!588391 () ListLongMap!21035)

(assert (=> b!1322733 (contains!8688 lt!588391 k0!1164)))

(declare-fun lt!588393 () Unit!43590)

(assert (=> b!1322733 (= lt!588393 (lemmaInListMapAfterAddingDiffThenInBefore!181 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588391))))

(assert (=> b!1322733 (= lt!588391 (+!4585 lt!588397 lt!588398))))

(assert (=> b!1322733 (= lt!588398 (tuple2!23379 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322733 (= lt!588397 (+!4585 lt!588394 (tuple2!23379 (select (arr!43070 _keys!1609) from!2000) lt!588395)))))

(declare-fun get!21681 (ValueCell!17169 V!53283) V!53283)

(declare-fun dynLambda!3524 (Int (_ BitVec 64)) V!53283)

(assert (=> b!1322733 (= lt!588395 (get!21681 (select (arr!43069 _values!1337) from!2000) (dynLambda!3524 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6220 (array!89192 array!89190 (_ BitVec 32) (_ BitVec 32) V!53283 V!53283 (_ BitVec 32) Int) ListLongMap!21035)

(assert (=> b!1322733 (= lt!588394 (getCurrentListMapNoExtraKeys!6220 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322734 () Bool)

(declare-fun res!877964 () Bool)

(assert (=> b!1322734 (=> (not res!877964) (not e!754201))))

(assert (=> b!1322734 (= res!877964 (not (= (select (arr!43070 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!877957 () Bool)

(assert (=> start!111658 (=> (not res!877957) (not e!754201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111658 (= res!877957 (validMask!0 mask!2019))))

(assert (=> start!111658 e!754201))

(declare-fun array_inv!32519 (array!89192) Bool)

(assert (=> start!111658 (array_inv!32519 _keys!1609)))

(assert (=> start!111658 true))

(declare-fun tp_is_empty!36135 () Bool)

(assert (=> start!111658 tp_is_empty!36135))

(declare-fun array_inv!32520 (array!89190) Bool)

(assert (=> start!111658 (and (array_inv!32520 _values!1337) e!754202)))

(assert (=> start!111658 tp!106421))

(declare-fun b!1322735 () Bool)

(declare-fun res!877961 () Bool)

(assert (=> b!1322735 (=> (not res!877961) (not e!754201))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322735 (= res!877961 (validKeyInArray!0 (select (arr!43070 _keys!1609) from!2000)))))

(declare-fun b!1322736 () Bool)

(declare-fun res!877960 () Bool)

(assert (=> b!1322736 (=> (not res!877960) (not e!754201))))

(declare-datatypes ((List!30524 0))(
  ( (Nil!30521) (Cons!30520 (h!31729 (_ BitVec 64)) (t!44388 List!30524)) )
))
(declare-fun arrayNoDuplicates!0 (array!89192 (_ BitVec 32) List!30524) Bool)

(assert (=> b!1322736 (= res!877960 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30521))))

(declare-fun b!1322737 () Bool)

(declare-fun res!877958 () Bool)

(assert (=> b!1322737 (=> (not res!877958) (not e!754201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89192 (_ BitVec 32)) Bool)

(assert (=> b!1322737 (= res!877958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1322738 () Bool)

(declare-fun res!877962 () Bool)

(assert (=> b!1322738 (=> (not res!877962) (not e!754201))))

(assert (=> b!1322738 (= res!877962 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43620 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55850 () Bool)

(assert (=> mapIsEmpty!55850 mapRes!55850))

(declare-fun b!1322739 () Bool)

(assert (=> b!1322739 (= e!754200 tp_is_empty!36135)))

(declare-fun b!1322740 () Bool)

(assert (=> b!1322740 (= e!754203 tp_is_empty!36135)))

(assert (= (and start!111658 res!877957) b!1322731))

(assert (= (and b!1322731 res!877959) b!1322737))

(assert (= (and b!1322737 res!877958) b!1322736))

(assert (= (and b!1322736 res!877960) b!1322738))

(assert (= (and b!1322738 res!877962) b!1322730))

(assert (= (and b!1322730 res!877963) b!1322734))

(assert (= (and b!1322734 res!877964) b!1322735))

(assert (= (and b!1322735 res!877961) b!1322733))

(assert (= (and b!1322732 condMapEmpty!55850) mapIsEmpty!55850))

(assert (= (and b!1322732 (not condMapEmpty!55850)) mapNonEmpty!55850))

(get-info :version)

(assert (= (and mapNonEmpty!55850 ((_ is ValueCellFull!17169) mapValue!55850)) b!1322739))

(assert (= (and b!1322732 ((_ is ValueCellFull!17169) mapDefault!55850)) b!1322740))

(assert (= start!111658 b!1322732))

(declare-fun b_lambda!23641 () Bool)

(assert (=> (not b_lambda!23641) (not b!1322733)))

(declare-fun t!44386 () Bool)

(declare-fun tb!11667 () Bool)

(assert (=> (and start!111658 (= defaultEntry!1340 defaultEntry!1340) t!44386) tb!11667))

(declare-fun result!24389 () Bool)

(assert (=> tb!11667 (= result!24389 tp_is_empty!36135)))

(assert (=> b!1322733 t!44386))

(declare-fun b_and!48791 () Bool)

(assert (= b_and!48789 (and (=> t!44386 result!24389) b_and!48791)))

(declare-fun m!1211141 () Bool)

(assert (=> b!1322735 m!1211141))

(assert (=> b!1322735 m!1211141))

(declare-fun m!1211143 () Bool)

(assert (=> b!1322735 m!1211143))

(declare-fun m!1211145 () Bool)

(assert (=> b!1322730 m!1211145))

(assert (=> b!1322730 m!1211145))

(declare-fun m!1211147 () Bool)

(assert (=> b!1322730 m!1211147))

(declare-fun m!1211149 () Bool)

(assert (=> b!1322737 m!1211149))

(declare-fun m!1211151 () Bool)

(assert (=> b!1322736 m!1211151))

(declare-fun m!1211153 () Bool)

(assert (=> mapNonEmpty!55850 m!1211153))

(declare-fun m!1211155 () Bool)

(assert (=> b!1322733 m!1211155))

(declare-fun m!1211157 () Bool)

(assert (=> b!1322733 m!1211157))

(declare-fun m!1211159 () Bool)

(assert (=> b!1322733 m!1211159))

(declare-fun m!1211161 () Bool)

(assert (=> b!1322733 m!1211161))

(declare-fun m!1211163 () Bool)

(assert (=> b!1322733 m!1211163))

(assert (=> b!1322733 m!1211161))

(declare-fun m!1211165 () Bool)

(assert (=> b!1322733 m!1211165))

(declare-fun m!1211167 () Bool)

(assert (=> b!1322733 m!1211167))

(declare-fun m!1211169 () Bool)

(assert (=> b!1322733 m!1211169))

(declare-fun m!1211171 () Bool)

(assert (=> b!1322733 m!1211171))

(declare-fun m!1211173 () Bool)

(assert (=> b!1322733 m!1211173))

(assert (=> b!1322733 m!1211141))

(assert (=> b!1322733 m!1211171))

(declare-fun m!1211175 () Bool)

(assert (=> b!1322733 m!1211175))

(declare-fun m!1211177 () Bool)

(assert (=> b!1322733 m!1211177))

(assert (=> b!1322733 m!1211141))

(declare-fun m!1211179 () Bool)

(assert (=> b!1322733 m!1211179))

(declare-fun m!1211181 () Bool)

(assert (=> b!1322733 m!1211181))

(assert (=> b!1322733 m!1211169))

(declare-fun m!1211183 () Bool)

(assert (=> b!1322733 m!1211183))

(assert (=> b!1322734 m!1211141))

(declare-fun m!1211185 () Bool)

(assert (=> start!111658 m!1211185))

(declare-fun m!1211187 () Bool)

(assert (=> start!111658 m!1211187))

(declare-fun m!1211189 () Bool)

(assert (=> start!111658 m!1211189))

(check-sat (not mapNonEmpty!55850) (not b!1322730) tp_is_empty!36135 (not b_next!30315) b_and!48791 (not start!111658) (not b!1322735) (not b_lambda!23641) (not b!1322733) (not b!1322736) (not b!1322737))
(check-sat b_and!48791 (not b_next!30315))
