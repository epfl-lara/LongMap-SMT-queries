; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111700 () Bool)

(assert start!111700)

(declare-fun b_free!30133 () Bool)

(declare-fun b_next!30133 () Bool)

(assert (=> start!111700 (= b_free!30133 (not b_next!30133))))

(declare-fun tp!105875 () Bool)

(declare-fun b_and!48427 () Bool)

(assert (=> start!111700 (= tp!105875 b_and!48427)))

(declare-fun mapIsEmpty!55577 () Bool)

(declare-fun mapRes!55577 () Bool)

(assert (=> mapIsEmpty!55577 mapRes!55577))

(declare-fun b!1320844 () Bool)

(declare-fun res!876294 () Bool)

(declare-fun e!753682 () Bool)

(assert (=> b!1320844 (=> (not res!876294) (not e!753682))))

(declare-datatypes ((array!88917 0))(
  ( (array!88918 (arr!42928 (Array (_ BitVec 32) (_ BitVec 64))) (size!43479 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88917)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53041 0))(
  ( (V!53042 (val!18051 Int)) )
))
(declare-fun zeroValue!1279 () V!53041)

(declare-datatypes ((ValueCell!17078 0))(
  ( (ValueCellFull!17078 (v!20676 V!53041)) (EmptyCell!17078) )
))
(declare-datatypes ((array!88919 0))(
  ( (array!88920 (arr!42929 (Array (_ BitVec 32) ValueCell!17078)) (size!43480 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88919)

(declare-fun minValue!1279 () V!53041)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23272 0))(
  ( (tuple2!23273 (_1!11647 (_ BitVec 64)) (_2!11647 V!53041)) )
))
(declare-datatypes ((List!30429 0))(
  ( (Nil!30426) (Cons!30425 (h!31643 tuple2!23272) (t!44103 List!30429)) )
))
(declare-datatypes ((ListLongMap!20937 0))(
  ( (ListLongMap!20938 (toList!10484 List!30429)) )
))
(declare-fun contains!8651 (ListLongMap!20937 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5481 (array!88917 array!88919 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20937)

(assert (=> b!1320844 (= res!876294 (contains!8651 (getCurrentListMap!5481 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320845 () Bool)

(declare-fun res!876291 () Bool)

(assert (=> b!1320845 (=> (not res!876291) (not e!753682))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320845 (= res!876291 (validKeyInArray!0 (select (arr!42928 _keys!1609) from!2000)))))

(declare-fun b!1320846 () Bool)

(declare-fun res!876297 () Bool)

(assert (=> b!1320846 (=> (not res!876297) (not e!753682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88917 (_ BitVec 32)) Bool)

(assert (=> b!1320846 (= res!876297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1320847 () Bool)

(declare-fun res!876296 () Bool)

(assert (=> b!1320847 (=> (not res!876296) (not e!753682))))

(assert (=> b!1320847 (= res!876296 (and (= (size!43480 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43479 _keys!1609) (size!43480 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320848 () Bool)

(declare-fun res!876293 () Bool)

(assert (=> b!1320848 (=> (not res!876293) (not e!753682))))

(declare-datatypes ((List!30430 0))(
  ( (Nil!30427) (Cons!30426 (h!31644 (_ BitVec 64)) (t!44104 List!30430)) )
))
(declare-fun arrayNoDuplicates!0 (array!88917 (_ BitVec 32) List!30430) Bool)

(assert (=> b!1320848 (= res!876293 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30427))))

(declare-fun b!1320849 () Bool)

(declare-fun e!753680 () Bool)

(declare-fun e!753679 () Bool)

(assert (=> b!1320849 (= e!753680 (and e!753679 mapRes!55577))))

(declare-fun condMapEmpty!55577 () Bool)

(declare-fun mapDefault!55577 () ValueCell!17078)

(assert (=> b!1320849 (= condMapEmpty!55577 (= (arr!42929 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17078)) mapDefault!55577)))))

(declare-fun b!1320850 () Bool)

(declare-fun e!753681 () Bool)

(declare-fun tp_is_empty!35953 () Bool)

(assert (=> b!1320850 (= e!753681 tp_is_empty!35953)))

(declare-fun b!1320852 () Bool)

(assert (=> b!1320852 (= e!753682 (not true))))

(declare-fun lt!587135 () ListLongMap!20937)

(assert (=> b!1320852 (contains!8651 lt!587135 k0!1164)))

(declare-datatypes ((Unit!43431 0))(
  ( (Unit!43432) )
))
(declare-fun lt!587134 () Unit!43431)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!127 ((_ BitVec 64) (_ BitVec 64) V!53041 ListLongMap!20937) Unit!43431)

(assert (=> b!1320852 (= lt!587134 (lemmaInListMapAfterAddingDiffThenInBefore!127 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587135))))

(declare-fun +!4572 (ListLongMap!20937 tuple2!23272) ListLongMap!20937)

(declare-fun getCurrentListMapNoExtraKeys!6211 (array!88917 array!88919 (_ BitVec 32) (_ BitVec 32) V!53041 V!53041 (_ BitVec 32) Int) ListLongMap!20937)

(declare-fun get!21611 (ValueCell!17078 V!53041) V!53041)

(declare-fun dynLambda!3526 (Int (_ BitVec 64)) V!53041)

(assert (=> b!1320852 (= lt!587135 (+!4572 (+!4572 (getCurrentListMapNoExtraKeys!6211 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23273 (select (arr!42928 _keys!1609) from!2000) (get!21611 (select (arr!42929 _values!1337) from!2000) (dynLambda!3526 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23273 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55577 () Bool)

(declare-fun tp!105874 () Bool)

(assert (=> mapNonEmpty!55577 (= mapRes!55577 (and tp!105874 e!753681))))

(declare-fun mapKey!55577 () (_ BitVec 32))

(declare-fun mapRest!55577 () (Array (_ BitVec 32) ValueCell!17078))

(declare-fun mapValue!55577 () ValueCell!17078)

(assert (=> mapNonEmpty!55577 (= (arr!42929 _values!1337) (store mapRest!55577 mapKey!55577 mapValue!55577))))

(declare-fun res!876292 () Bool)

(assert (=> start!111700 (=> (not res!876292) (not e!753682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111700 (= res!876292 (validMask!0 mask!2019))))

(assert (=> start!111700 e!753682))

(declare-fun array_inv!32685 (array!88917) Bool)

(assert (=> start!111700 (array_inv!32685 _keys!1609)))

(assert (=> start!111700 true))

(assert (=> start!111700 tp_is_empty!35953))

(declare-fun array_inv!32686 (array!88919) Bool)

(assert (=> start!111700 (and (array_inv!32686 _values!1337) e!753680)))

(assert (=> start!111700 tp!105875))

(declare-fun b!1320851 () Bool)

(declare-fun res!876298 () Bool)

(assert (=> b!1320851 (=> (not res!876298) (not e!753682))))

(assert (=> b!1320851 (= res!876298 (not (= (select (arr!42928 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320853 () Bool)

(declare-fun res!876295 () Bool)

(assert (=> b!1320853 (=> (not res!876295) (not e!753682))))

(assert (=> b!1320853 (= res!876295 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43479 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1320854 () Bool)

(assert (=> b!1320854 (= e!753679 tp_is_empty!35953)))

(assert (= (and start!111700 res!876292) b!1320847))

(assert (= (and b!1320847 res!876296) b!1320846))

(assert (= (and b!1320846 res!876297) b!1320848))

(assert (= (and b!1320848 res!876293) b!1320853))

(assert (= (and b!1320853 res!876295) b!1320844))

(assert (= (and b!1320844 res!876294) b!1320851))

(assert (= (and b!1320851 res!876298) b!1320845))

(assert (= (and b!1320845 res!876291) b!1320852))

(assert (= (and b!1320849 condMapEmpty!55577) mapIsEmpty!55577))

(assert (= (and b!1320849 (not condMapEmpty!55577)) mapNonEmpty!55577))

(get-info :version)

(assert (= (and mapNonEmpty!55577 ((_ is ValueCellFull!17078) mapValue!55577)) b!1320850))

(assert (= (and b!1320849 ((_ is ValueCellFull!17078) mapDefault!55577)) b!1320854))

(assert (= start!111700 b!1320849))

(declare-fun b_lambda!23453 () Bool)

(assert (=> (not b_lambda!23453) (not b!1320852)))

(declare-fun t!44102 () Bool)

(declare-fun tb!11477 () Bool)

(assert (=> (and start!111700 (= defaultEntry!1340 defaultEntry!1340) t!44102) tb!11477))

(declare-fun result!24017 () Bool)

(assert (=> tb!11477 (= result!24017 tp_is_empty!35953)))

(assert (=> b!1320852 t!44102))

(declare-fun b_and!48429 () Bool)

(assert (= b_and!48427 (and (=> t!44102 result!24017) b_and!48429)))

(declare-fun m!1208741 () Bool)

(assert (=> b!1320851 m!1208741))

(declare-fun m!1208743 () Bool)

(assert (=> mapNonEmpty!55577 m!1208743))

(declare-fun m!1208745 () Bool)

(assert (=> b!1320852 m!1208745))

(declare-fun m!1208747 () Bool)

(assert (=> b!1320852 m!1208747))

(assert (=> b!1320852 m!1208745))

(declare-fun m!1208749 () Bool)

(assert (=> b!1320852 m!1208749))

(declare-fun m!1208751 () Bool)

(assert (=> b!1320852 m!1208751))

(assert (=> b!1320852 m!1208749))

(declare-fun m!1208753 () Bool)

(assert (=> b!1320852 m!1208753))

(assert (=> b!1320852 m!1208751))

(assert (=> b!1320852 m!1208747))

(declare-fun m!1208755 () Bool)

(assert (=> b!1320852 m!1208755))

(declare-fun m!1208757 () Bool)

(assert (=> b!1320852 m!1208757))

(declare-fun m!1208759 () Bool)

(assert (=> b!1320852 m!1208759))

(assert (=> b!1320852 m!1208741))

(declare-fun m!1208761 () Bool)

(assert (=> start!111700 m!1208761))

(declare-fun m!1208763 () Bool)

(assert (=> start!111700 m!1208763))

(declare-fun m!1208765 () Bool)

(assert (=> start!111700 m!1208765))

(assert (=> b!1320845 m!1208741))

(assert (=> b!1320845 m!1208741))

(declare-fun m!1208767 () Bool)

(assert (=> b!1320845 m!1208767))

(declare-fun m!1208769 () Bool)

(assert (=> b!1320846 m!1208769))

(declare-fun m!1208771 () Bool)

(assert (=> b!1320844 m!1208771))

(assert (=> b!1320844 m!1208771))

(declare-fun m!1208773 () Bool)

(assert (=> b!1320844 m!1208773))

(declare-fun m!1208775 () Bool)

(assert (=> b!1320848 m!1208775))

(check-sat (not b!1320848) (not mapNonEmpty!55577) (not b!1320846) (not start!111700) tp_is_empty!35953 (not b_lambda!23453) (not b!1320845) (not b_next!30133) (not b!1320852) b_and!48429 (not b!1320844))
(check-sat b_and!48429 (not b_next!30133))
