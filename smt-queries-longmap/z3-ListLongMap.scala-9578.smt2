; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113554 () Bool)

(assert start!113554)

(declare-fun b_free!31381 () Bool)

(declare-fun b_next!31381 () Bool)

(assert (=> start!113554 (= b_free!31381 (not b_next!31381))))

(declare-fun tp!109947 () Bool)

(declare-fun b_and!50617 () Bool)

(assert (=> start!113554 (= tp!109947 b_and!50617)))

(declare-fun b!1346085 () Bool)

(declare-fun e!766181 () Bool)

(assert (=> b!1346085 (= e!766181 (not true))))

(declare-datatypes ((V!54945 0))(
  ( (V!54946 (val!18765 Int)) )
))
(declare-datatypes ((tuple2!24224 0))(
  ( (tuple2!24225 (_1!12123 (_ BitVec 64)) (_2!12123 V!54945)) )
))
(declare-datatypes ((List!31369 0))(
  ( (Nil!31366) (Cons!31365 (h!32583 tuple2!24224) (t!45899 List!31369)) )
))
(declare-datatypes ((ListLongMap!21889 0))(
  ( (ListLongMap!21890 (toList!10960 List!31369)) )
))
(declare-fun lt!595693 () ListLongMap!21889)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9148 (ListLongMap!21889 (_ BitVec 64)) Bool)

(assert (=> b!1346085 (contains!9148 lt!595693 k0!1142)))

(declare-datatypes ((array!91709 0))(
  ( (array!91710 (arr!44306 (Array (_ BitVec 32) (_ BitVec 64))) (size!44857 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91709)

(declare-datatypes ((Unit!44042 0))(
  ( (Unit!44043) )
))
(declare-fun lt!595694 () Unit!44042)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595692 () V!54945)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!377 ((_ BitVec 64) (_ BitVec 64) V!54945 ListLongMap!21889) Unit!44042)

(assert (=> b!1346085 (= lt!595694 (lemmaInListMapAfterAddingDiffThenInBefore!377 k0!1142 (select (arr!44306 _keys!1571) from!1960) lt!595692 lt!595693))))

(declare-fun b!1346086 () Bool)

(declare-fun res!892767 () Bool)

(declare-fun e!766182 () Bool)

(assert (=> b!1346086 (=> (not res!892767) (not e!766182))))

(declare-fun minValue!1245 () V!54945)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54945)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17792 0))(
  ( (ValueCellFull!17792 (v!21408 V!54945)) (EmptyCell!17792) )
))
(declare-datatypes ((array!91711 0))(
  ( (array!91712 (arr!44307 (Array (_ BitVec 32) ValueCell!17792)) (size!44858 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91711)

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMap!5903 (array!91709 array!91711 (_ BitVec 32) (_ BitVec 32) V!54945 V!54945 (_ BitVec 32) Int) ListLongMap!21889)

(assert (=> b!1346086 (= res!892767 (contains!9148 (getCurrentListMap!5903 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346087 () Bool)

(declare-fun e!766184 () Bool)

(declare-fun tp_is_empty!37381 () Bool)

(assert (=> b!1346087 (= e!766184 tp_is_empty!37381)))

(declare-fun b!1346088 () Bool)

(declare-fun e!766180 () Bool)

(declare-fun e!766183 () Bool)

(declare-fun mapRes!57778 () Bool)

(assert (=> b!1346088 (= e!766180 (and e!766183 mapRes!57778))))

(declare-fun condMapEmpty!57778 () Bool)

(declare-fun mapDefault!57778 () ValueCell!17792)

(assert (=> b!1346088 (= condMapEmpty!57778 (= (arr!44307 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17792)) mapDefault!57778)))))

(declare-fun b!1346089 () Bool)

(declare-fun res!892770 () Bool)

(assert (=> b!1346089 (=> (not res!892770) (not e!766182))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346089 (= res!892770 (validKeyInArray!0 (select (arr!44306 _keys!1571) from!1960)))))

(declare-fun b!1346090 () Bool)

(declare-fun res!892768 () Bool)

(assert (=> b!1346090 (=> (not res!892768) (not e!766182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91709 (_ BitVec 32)) Bool)

(assert (=> b!1346090 (= res!892768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346091 () Bool)

(declare-fun res!892775 () Bool)

(assert (=> b!1346091 (=> (not res!892775) (not e!766182))))

(declare-datatypes ((List!31370 0))(
  ( (Nil!31367) (Cons!31366 (h!32584 (_ BitVec 64)) (t!45900 List!31370)) )
))
(declare-fun arrayNoDuplicates!0 (array!91709 (_ BitVec 32) List!31370) Bool)

(assert (=> b!1346091 (= res!892775 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31367))))

(declare-fun b!1346092 () Bool)

(declare-fun res!892772 () Bool)

(assert (=> b!1346092 (=> (not res!892772) (not e!766181))))

(assert (=> b!1346092 (= res!892772 (not (= k0!1142 (select (arr!44306 _keys!1571) from!1960))))))

(declare-fun mapNonEmpty!57778 () Bool)

(declare-fun tp!109948 () Bool)

(assert (=> mapNonEmpty!57778 (= mapRes!57778 (and tp!109948 e!766184))))

(declare-fun mapValue!57778 () ValueCell!17792)

(declare-fun mapKey!57778 () (_ BitVec 32))

(declare-fun mapRest!57778 () (Array (_ BitVec 32) ValueCell!17792))

(assert (=> mapNonEmpty!57778 (= (arr!44307 _values!1303) (store mapRest!57778 mapKey!57778 mapValue!57778))))

(declare-fun b!1346093 () Bool)

(declare-fun res!892771 () Bool)

(assert (=> b!1346093 (=> (not res!892771) (not e!766182))))

(assert (=> b!1346093 (= res!892771 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44857 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57778 () Bool)

(assert (=> mapIsEmpty!57778 mapRes!57778))

(declare-fun res!892765 () Bool)

(assert (=> start!113554 (=> (not res!892765) (not e!766182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113554 (= res!892765 (validMask!0 mask!1977))))

(assert (=> start!113554 e!766182))

(assert (=> start!113554 tp_is_empty!37381))

(assert (=> start!113554 true))

(declare-fun array_inv!33655 (array!91709) Bool)

(assert (=> start!113554 (array_inv!33655 _keys!1571)))

(declare-fun array_inv!33656 (array!91711) Bool)

(assert (=> start!113554 (and (array_inv!33656 _values!1303) e!766180)))

(assert (=> start!113554 tp!109947))

(declare-fun b!1346094 () Bool)

(declare-fun res!892773 () Bool)

(assert (=> b!1346094 (=> (not res!892773) (not e!766182))))

(assert (=> b!1346094 (= res!892773 (and (= (size!44858 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44857 _keys!1571) (size!44858 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346095 () Bool)

(assert (=> b!1346095 (= e!766182 e!766181)))

(declare-fun res!892769 () Bool)

(assert (=> b!1346095 (=> (not res!892769) (not e!766181))))

(declare-fun +!4855 (ListLongMap!21889 tuple2!24224) ListLongMap!21889)

(assert (=> b!1346095 (= res!892769 (contains!9148 (+!4855 lt!595693 (tuple2!24225 (select (arr!44306 _keys!1571) from!1960) lt!595692)) k0!1142))))

(declare-fun getCurrentListMapNoExtraKeys!6504 (array!91709 array!91711 (_ BitVec 32) (_ BitVec 32) V!54945 V!54945 (_ BitVec 32) Int) ListLongMap!21889)

(assert (=> b!1346095 (= lt!595693 (getCurrentListMapNoExtraKeys!6504 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22391 (ValueCell!17792 V!54945) V!54945)

(declare-fun dynLambda!3809 (Int (_ BitVec 64)) V!54945)

(assert (=> b!1346095 (= lt!595692 (get!22391 (select (arr!44307 _values!1303) from!1960) (dynLambda!3809 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1346096 () Bool)

(declare-fun res!892766 () Bool)

(assert (=> b!1346096 (=> (not res!892766) (not e!766182))))

(assert (=> b!1346096 (= res!892766 (not (= (select (arr!44306 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346097 () Bool)

(assert (=> b!1346097 (= e!766183 tp_is_empty!37381)))

(declare-fun b!1346098 () Bool)

(declare-fun res!892774 () Bool)

(assert (=> b!1346098 (=> (not res!892774) (not e!766182))))

(assert (=> b!1346098 (= res!892774 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113554 res!892765) b!1346094))

(assert (= (and b!1346094 res!892773) b!1346090))

(assert (= (and b!1346090 res!892768) b!1346091))

(assert (= (and b!1346091 res!892775) b!1346093))

(assert (= (and b!1346093 res!892771) b!1346086))

(assert (= (and b!1346086 res!892767) b!1346096))

(assert (= (and b!1346096 res!892766) b!1346089))

(assert (= (and b!1346089 res!892770) b!1346098))

(assert (= (and b!1346098 res!892774) b!1346095))

(assert (= (and b!1346095 res!892769) b!1346092))

(assert (= (and b!1346092 res!892772) b!1346085))

(assert (= (and b!1346088 condMapEmpty!57778) mapIsEmpty!57778))

(assert (= (and b!1346088 (not condMapEmpty!57778)) mapNonEmpty!57778))

(get-info :version)

(assert (= (and mapNonEmpty!57778 ((_ is ValueCellFull!17792) mapValue!57778)) b!1346087))

(assert (= (and b!1346088 ((_ is ValueCellFull!17792) mapDefault!57778)) b!1346097))

(assert (= start!113554 b!1346088))

(declare-fun b_lambda!24497 () Bool)

(assert (=> (not b_lambda!24497) (not b!1346095)))

(declare-fun t!45898 () Bool)

(declare-fun tb!12333 () Bool)

(assert (=> (and start!113554 (= defaultEntry!1306 defaultEntry!1306) t!45898) tb!12333))

(declare-fun result!25765 () Bool)

(assert (=> tb!12333 (= result!25765 tp_is_empty!37381)))

(assert (=> b!1346095 t!45898))

(declare-fun b_and!50619 () Bool)

(assert (= b_and!50617 (and (=> t!45898 result!25765) b_and!50619)))

(declare-fun m!1233897 () Bool)

(assert (=> b!1346095 m!1233897))

(declare-fun m!1233899 () Bool)

(assert (=> b!1346095 m!1233899))

(declare-fun m!1233901 () Bool)

(assert (=> b!1346095 m!1233901))

(declare-fun m!1233903 () Bool)

(assert (=> b!1346095 m!1233903))

(declare-fun m!1233905 () Bool)

(assert (=> b!1346095 m!1233905))

(assert (=> b!1346095 m!1233901))

(assert (=> b!1346095 m!1233903))

(assert (=> b!1346095 m!1233897))

(declare-fun m!1233907 () Bool)

(assert (=> b!1346095 m!1233907))

(declare-fun m!1233909 () Bool)

(assert (=> b!1346095 m!1233909))

(assert (=> b!1346096 m!1233909))

(assert (=> b!1346092 m!1233909))

(declare-fun m!1233911 () Bool)

(assert (=> b!1346090 m!1233911))

(declare-fun m!1233913 () Bool)

(assert (=> b!1346091 m!1233913))

(declare-fun m!1233915 () Bool)

(assert (=> b!1346086 m!1233915))

(assert (=> b!1346086 m!1233915))

(declare-fun m!1233917 () Bool)

(assert (=> b!1346086 m!1233917))

(declare-fun m!1233919 () Bool)

(assert (=> start!113554 m!1233919))

(declare-fun m!1233921 () Bool)

(assert (=> start!113554 m!1233921))

(declare-fun m!1233923 () Bool)

(assert (=> start!113554 m!1233923))

(declare-fun m!1233925 () Bool)

(assert (=> b!1346085 m!1233925))

(assert (=> b!1346085 m!1233909))

(assert (=> b!1346085 m!1233909))

(declare-fun m!1233927 () Bool)

(assert (=> b!1346085 m!1233927))

(assert (=> b!1346089 m!1233909))

(assert (=> b!1346089 m!1233909))

(declare-fun m!1233929 () Bool)

(assert (=> b!1346089 m!1233929))

(declare-fun m!1233931 () Bool)

(assert (=> mapNonEmpty!57778 m!1233931))

(check-sat (not b!1346095) (not b!1346091) (not b!1346089) tp_is_empty!37381 (not b!1346090) (not b!1346086) (not b!1346085) (not b_lambda!24497) (not b_next!31381) b_and!50619 (not start!113554) (not mapNonEmpty!57778))
(check-sat b_and!50619 (not b_next!31381))
