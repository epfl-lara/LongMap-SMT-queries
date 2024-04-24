; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113482 () Bool)

(assert start!113482)

(declare-fun b_free!31309 () Bool)

(declare-fun b_next!31309 () Bool)

(assert (=> start!113482 (= b_free!31309 (not b_next!31309))))

(declare-fun tp!109731 () Bool)

(declare-fun b_and!50527 () Bool)

(assert (=> start!113482 (= tp!109731 b_and!50527)))

(declare-fun b!1345064 () Bool)

(declare-fun res!892093 () Bool)

(declare-fun e!765641 () Bool)

(assert (=> b!1345064 (=> (not res!892093) (not e!765641))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91573 0))(
  ( (array!91574 (arr!44238 (Array (_ BitVec 32) (_ BitVec 64))) (size!44789 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91573)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54849 0))(
  ( (V!54850 (val!18729 Int)) )
))
(declare-datatypes ((ValueCell!17756 0))(
  ( (ValueCellFull!17756 (v!21372 V!54849)) (EmptyCell!17756) )
))
(declare-datatypes ((array!91575 0))(
  ( (array!91576 (arr!44239 (Array (_ BitVec 32) ValueCell!17756)) (size!44790 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91575)

(assert (=> b!1345064 (= res!892093 (and (= (size!44790 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44789 _keys!1571) (size!44790 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345065 () Bool)

(declare-fun res!892091 () Bool)

(assert (=> b!1345065 (=> (not res!892091) (not e!765641))))

(assert (=> b!1345065 (= res!892091 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1345066 () Bool)

(declare-fun res!892088 () Bool)

(assert (=> b!1345066 (=> (not res!892088) (not e!765641))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345066 (= res!892088 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44789 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345067 () Bool)

(declare-fun e!765640 () Bool)

(declare-fun tp_is_empty!37309 () Bool)

(assert (=> b!1345067 (= e!765640 tp_is_empty!37309)))

(declare-fun mapIsEmpty!57670 () Bool)

(declare-fun mapRes!57670 () Bool)

(assert (=> mapIsEmpty!57670 mapRes!57670))

(declare-fun res!892089 () Bool)

(assert (=> start!113482 (=> (not res!892089) (not e!765641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113482 (= res!892089 (validMask!0 mask!1977))))

(assert (=> start!113482 e!765641))

(assert (=> start!113482 tp_is_empty!37309))

(assert (=> start!113482 true))

(declare-fun array_inv!33615 (array!91573) Bool)

(assert (=> start!113482 (array_inv!33615 _keys!1571)))

(declare-fun e!765638 () Bool)

(declare-fun array_inv!33616 (array!91575) Bool)

(assert (=> start!113482 (and (array_inv!33616 _values!1303) e!765638)))

(assert (=> start!113482 tp!109731))

(declare-fun b!1345068 () Bool)

(declare-fun res!892092 () Bool)

(assert (=> b!1345068 (=> (not res!892092) (not e!765641))))

(assert (=> b!1345068 (= res!892092 (not (= (select (arr!44238 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345069 () Bool)

(assert (=> b!1345069 (= e!765641 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!24176 0))(
  ( (tuple2!24177 (_1!12099 (_ BitVec 64)) (_2!12099 V!54849)) )
))
(declare-datatypes ((List!31321 0))(
  ( (Nil!31318) (Cons!31317 (h!32535 tuple2!24176) (t!45833 List!31321)) )
))
(declare-datatypes ((ListLongMap!21841 0))(
  ( (ListLongMap!21842 (toList!10936 List!31321)) )
))
(declare-fun lt!595559 () ListLongMap!21841)

(declare-fun zeroValue!1245 () V!54849)

(declare-fun contains!9124 (ListLongMap!21841 (_ BitVec 64)) Bool)

(declare-fun +!4849 (ListLongMap!21841 tuple2!24176) ListLongMap!21841)

(assert (=> b!1345069 (contains!9124 (+!4849 lt!595559 (tuple2!24177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44038 0))(
  ( (Unit!44039) )
))
(declare-fun lt!595556 () Unit!44038)

(declare-fun addStillContains!1211 (ListLongMap!21841 (_ BitVec 64) V!54849 (_ BitVec 64)) Unit!44038)

(assert (=> b!1345069 (= lt!595556 (addStillContains!1211 lt!595559 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1345069 (contains!9124 lt!595559 k0!1142)))

(declare-fun lt!595557 () V!54849)

(declare-fun lt!595558 () Unit!44038)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!375 ((_ BitVec 64) (_ BitVec 64) V!54849 ListLongMap!21841) Unit!44038)

(assert (=> b!1345069 (= lt!595558 (lemmaInListMapAfterAddingDiffThenInBefore!375 k0!1142 (select (arr!44238 _keys!1571) from!1960) lt!595557 lt!595559))))

(declare-fun lt!595554 () ListLongMap!21841)

(assert (=> b!1345069 (contains!9124 lt!595554 k0!1142)))

(declare-fun lt!595555 () Unit!44038)

(assert (=> b!1345069 (= lt!595555 (lemmaInListMapAfterAddingDiffThenInBefore!375 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595554))))

(assert (=> b!1345069 (= lt!595554 (+!4849 lt!595559 (tuple2!24177 (select (arr!44238 _keys!1571) from!1960) lt!595557)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22361 (ValueCell!17756 V!54849) V!54849)

(declare-fun dynLambda!3803 (Int (_ BitVec 64)) V!54849)

(assert (=> b!1345069 (= lt!595557 (get!22361 (select (arr!44239 _values!1303) from!1960) (dynLambda!3803 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54849)

(declare-fun getCurrentListMapNoExtraKeys!6498 (array!91573 array!91575 (_ BitVec 32) (_ BitVec 32) V!54849 V!54849 (_ BitVec 32) Int) ListLongMap!21841)

(assert (=> b!1345069 (= lt!595559 (getCurrentListMapNoExtraKeys!6498 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57670 () Bool)

(declare-fun tp!109732 () Bool)

(declare-fun e!765639 () Bool)

(assert (=> mapNonEmpty!57670 (= mapRes!57670 (and tp!109732 e!765639))))

(declare-fun mapRest!57670 () (Array (_ BitVec 32) ValueCell!17756))

(declare-fun mapKey!57670 () (_ BitVec 32))

(declare-fun mapValue!57670 () ValueCell!17756)

(assert (=> mapNonEmpty!57670 (= (arr!44239 _values!1303) (store mapRest!57670 mapKey!57670 mapValue!57670))))

(declare-fun b!1345070 () Bool)

(declare-fun res!892087 () Bool)

(assert (=> b!1345070 (=> (not res!892087) (not e!765641))))

(declare-datatypes ((List!31322 0))(
  ( (Nil!31319) (Cons!31318 (h!32536 (_ BitVec 64)) (t!45834 List!31322)) )
))
(declare-fun arrayNoDuplicates!0 (array!91573 (_ BitVec 32) List!31322) Bool)

(assert (=> b!1345070 (= res!892087 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31319))))

(declare-fun b!1345071 () Bool)

(declare-fun res!892090 () Bool)

(assert (=> b!1345071 (=> (not res!892090) (not e!765641))))

(declare-fun getCurrentListMap!5880 (array!91573 array!91575 (_ BitVec 32) (_ BitVec 32) V!54849 V!54849 (_ BitVec 32) Int) ListLongMap!21841)

(assert (=> b!1345071 (= res!892090 (contains!9124 (getCurrentListMap!5880 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345072 () Bool)

(assert (=> b!1345072 (= e!765638 (and e!765640 mapRes!57670))))

(declare-fun condMapEmpty!57670 () Bool)

(declare-fun mapDefault!57670 () ValueCell!17756)

(assert (=> b!1345072 (= condMapEmpty!57670 (= (arr!44239 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17756)) mapDefault!57670)))))

(declare-fun b!1345073 () Bool)

(declare-fun res!892086 () Bool)

(assert (=> b!1345073 (=> (not res!892086) (not e!765641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345073 (= res!892086 (validKeyInArray!0 (select (arr!44238 _keys!1571) from!1960)))))

(declare-fun b!1345074 () Bool)

(assert (=> b!1345074 (= e!765639 tp_is_empty!37309)))

(declare-fun b!1345075 () Bool)

(declare-fun res!892094 () Bool)

(assert (=> b!1345075 (=> (not res!892094) (not e!765641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91573 (_ BitVec 32)) Bool)

(assert (=> b!1345075 (= res!892094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113482 res!892089) b!1345064))

(assert (= (and b!1345064 res!892093) b!1345075))

(assert (= (and b!1345075 res!892094) b!1345070))

(assert (= (and b!1345070 res!892087) b!1345066))

(assert (= (and b!1345066 res!892088) b!1345071))

(assert (= (and b!1345071 res!892090) b!1345068))

(assert (= (and b!1345068 res!892092) b!1345073))

(assert (= (and b!1345073 res!892086) b!1345065))

(assert (= (and b!1345065 res!892091) b!1345069))

(assert (= (and b!1345072 condMapEmpty!57670) mapIsEmpty!57670))

(assert (= (and b!1345072 (not condMapEmpty!57670)) mapNonEmpty!57670))

(get-info :version)

(assert (= (and mapNonEmpty!57670 ((_ is ValueCellFull!17756) mapValue!57670)) b!1345074))

(assert (= (and b!1345072 ((_ is ValueCellFull!17756) mapDefault!57670)) b!1345067))

(assert (= start!113482 b!1345072))

(declare-fun b_lambda!24479 () Bool)

(assert (=> (not b_lambda!24479) (not b!1345069)))

(declare-fun t!45832 () Bool)

(declare-fun tb!12315 () Bool)

(assert (=> (and start!113482 (= defaultEntry!1306 defaultEntry!1306) t!45832) tb!12315))

(declare-fun result!25729 () Bool)

(assert (=> tb!12315 (= result!25729 tp_is_empty!37309)))

(assert (=> b!1345069 t!45832))

(declare-fun b_and!50529 () Bool)

(assert (= b_and!50527 (and (=> t!45832 result!25729) b_and!50529)))

(declare-fun m!1233129 () Bool)

(assert (=> b!1345071 m!1233129))

(assert (=> b!1345071 m!1233129))

(declare-fun m!1233131 () Bool)

(assert (=> b!1345071 m!1233131))

(declare-fun m!1233133 () Bool)

(assert (=> b!1345070 m!1233133))

(declare-fun m!1233135 () Bool)

(assert (=> b!1345069 m!1233135))

(declare-fun m!1233137 () Bool)

(assert (=> b!1345069 m!1233137))

(declare-fun m!1233139 () Bool)

(assert (=> b!1345069 m!1233139))

(declare-fun m!1233141 () Bool)

(assert (=> b!1345069 m!1233141))

(declare-fun m!1233143 () Bool)

(assert (=> b!1345069 m!1233143))

(assert (=> b!1345069 m!1233139))

(assert (=> b!1345069 m!1233135))

(declare-fun m!1233145 () Bool)

(assert (=> b!1345069 m!1233145))

(declare-fun m!1233147 () Bool)

(assert (=> b!1345069 m!1233147))

(declare-fun m!1233149 () Bool)

(assert (=> b!1345069 m!1233149))

(declare-fun m!1233151 () Bool)

(assert (=> b!1345069 m!1233151))

(declare-fun m!1233153 () Bool)

(assert (=> b!1345069 m!1233153))

(declare-fun m!1233155 () Bool)

(assert (=> b!1345069 m!1233155))

(declare-fun m!1233157 () Bool)

(assert (=> b!1345069 m!1233157))

(assert (=> b!1345069 m!1233141))

(assert (=> b!1345069 m!1233153))

(declare-fun m!1233159 () Bool)

(assert (=> b!1345069 m!1233159))

(assert (=> b!1345073 m!1233153))

(assert (=> b!1345073 m!1233153))

(declare-fun m!1233161 () Bool)

(assert (=> b!1345073 m!1233161))

(assert (=> b!1345068 m!1233153))

(declare-fun m!1233163 () Bool)

(assert (=> mapNonEmpty!57670 m!1233163))

(declare-fun m!1233165 () Bool)

(assert (=> b!1345075 m!1233165))

(declare-fun m!1233167 () Bool)

(assert (=> start!113482 m!1233167))

(declare-fun m!1233169 () Bool)

(assert (=> start!113482 m!1233169))

(declare-fun m!1233171 () Bool)

(assert (=> start!113482 m!1233171))

(check-sat (not b_next!31309) (not b!1345069) (not b_lambda!24479) (not b!1345070) (not start!113482) b_and!50529 tp_is_empty!37309 (not b!1345071) (not b!1345073) (not mapNonEmpty!57670) (not b!1345075))
(check-sat b_and!50529 (not b_next!31309))
