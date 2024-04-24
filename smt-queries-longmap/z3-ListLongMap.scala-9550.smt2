; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113386 () Bool)

(assert start!113386)

(declare-fun b_free!31213 () Bool)

(declare-fun b_next!31213 () Bool)

(assert (=> start!113386 (= b_free!31213 (not b_next!31213))))

(declare-fun tp!109443 () Bool)

(declare-fun b_and!50335 () Bool)

(assert (=> start!113386 (= tp!109443 b_and!50335)))

(declare-fun res!890798 () Bool)

(declare-fun e!764921 () Bool)

(assert (=> start!113386 (=> (not res!890798) (not e!764921))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113386 (= res!890798 (validMask!0 mask!1977))))

(assert (=> start!113386 e!764921))

(declare-fun tp_is_empty!37213 () Bool)

(assert (=> start!113386 tp_is_empty!37213))

(assert (=> start!113386 true))

(declare-datatypes ((array!91395 0))(
  ( (array!91396 (arr!44149 (Array (_ BitVec 32) (_ BitVec 64))) (size!44700 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91395)

(declare-fun array_inv!33551 (array!91395) Bool)

(assert (=> start!113386 (array_inv!33551 _keys!1571)))

(declare-datatypes ((V!54721 0))(
  ( (V!54722 (val!18681 Int)) )
))
(declare-datatypes ((ValueCell!17708 0))(
  ( (ValueCellFull!17708 (v!21324 V!54721)) (EmptyCell!17708) )
))
(declare-datatypes ((array!91397 0))(
  ( (array!91398 (arr!44150 (Array (_ BitVec 32) ValueCell!17708)) (size!44701 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91397)

(declare-fun e!764917 () Bool)

(declare-fun array_inv!33552 (array!91397) Bool)

(assert (=> start!113386 (and (array_inv!33552 _values!1303) e!764917)))

(assert (=> start!113386 tp!109443))

(declare-fun b!1343240 () Bool)

(declare-fun e!764919 () Bool)

(declare-fun mapRes!57526 () Bool)

(assert (=> b!1343240 (= e!764917 (and e!764919 mapRes!57526))))

(declare-fun condMapEmpty!57526 () Bool)

(declare-fun mapDefault!57526 () ValueCell!17708)

(assert (=> b!1343240 (= condMapEmpty!57526 (= (arr!44150 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17708)) mapDefault!57526)))))

(declare-fun mapNonEmpty!57526 () Bool)

(declare-fun tp!109444 () Bool)

(declare-fun e!764920 () Bool)

(assert (=> mapNonEmpty!57526 (= mapRes!57526 (and tp!109444 e!764920))))

(declare-fun mapKey!57526 () (_ BitVec 32))

(declare-fun mapRest!57526 () (Array (_ BitVec 32) ValueCell!17708))

(declare-fun mapValue!57526 () ValueCell!17708)

(assert (=> mapNonEmpty!57526 (= (arr!44150 _values!1303) (store mapRest!57526 mapKey!57526 mapValue!57526))))

(declare-fun b!1343241 () Bool)

(assert (=> b!1343241 (= e!764919 tp_is_empty!37213)))

(declare-fun b!1343242 () Bool)

(declare-fun res!890791 () Bool)

(assert (=> b!1343242 (=> (not res!890791) (not e!764921))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343242 (= res!890791 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57526 () Bool)

(assert (=> mapIsEmpty!57526 mapRes!57526))

(declare-fun b!1343243 () Bool)

(declare-fun res!890790 () Bool)

(assert (=> b!1343243 (=> (not res!890790) (not e!764921))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343243 (= res!890790 (validKeyInArray!0 (select (arr!44149 _keys!1571) from!1960)))))

(declare-fun b!1343244 () Bool)

(declare-fun res!890793 () Bool)

(assert (=> b!1343244 (=> (not res!890793) (not e!764921))))

(declare-fun minValue!1245 () V!54721)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun zeroValue!1245 () V!54721)

(declare-datatypes ((tuple2!24110 0))(
  ( (tuple2!24111 (_1!12066 (_ BitVec 64)) (_2!12066 V!54721)) )
))
(declare-datatypes ((List!31261 0))(
  ( (Nil!31258) (Cons!31257 (h!32475 tuple2!24110) (t!45677 List!31261)) )
))
(declare-datatypes ((ListLongMap!21775 0))(
  ( (ListLongMap!21776 (toList!10903 List!31261)) )
))
(declare-fun contains!9091 (ListLongMap!21775 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5851 (array!91395 array!91397 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1343244 (= res!890793 (contains!9091 (getCurrentListMap!5851 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343245 () Bool)

(declare-fun res!890795 () Bool)

(assert (=> b!1343245 (=> (not res!890795) (not e!764921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91395 (_ BitVec 32)) Bool)

(assert (=> b!1343245 (= res!890795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343246 () Bool)

(declare-fun res!890792 () Bool)

(assert (=> b!1343246 (=> (not res!890792) (not e!764921))))

(declare-datatypes ((List!31262 0))(
  ( (Nil!31259) (Cons!31258 (h!32476 (_ BitVec 64)) (t!45678 List!31262)) )
))
(declare-fun arrayNoDuplicates!0 (array!91395 (_ BitVec 32) List!31262) Bool)

(assert (=> b!1343246 (= res!890792 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31259))))

(declare-fun b!1343247 () Bool)

(declare-fun res!890797 () Bool)

(assert (=> b!1343247 (=> (not res!890797) (not e!764921))))

(assert (=> b!1343247 (= res!890797 (and (= (size!44701 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44700 _keys!1571) (size!44701 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343248 () Bool)

(assert (=> b!1343248 (= e!764921 (not true))))

(declare-fun lt!594762 () ListLongMap!21775)

(assert (=> b!1343248 (contains!9091 lt!594762 k0!1142)))

(declare-datatypes ((Unit!43980 0))(
  ( (Unit!43981) )
))
(declare-fun lt!594760 () Unit!43980)

(declare-fun lt!594761 () V!54721)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!346 ((_ BitVec 64) (_ BitVec 64) V!54721 ListLongMap!21775) Unit!43980)

(assert (=> b!1343248 (= lt!594760 (lemmaInListMapAfterAddingDiffThenInBefore!346 k0!1142 (select (arr!44149 _keys!1571) from!1960) lt!594761 lt!594762))))

(declare-fun lt!594764 () ListLongMap!21775)

(assert (=> b!1343248 (contains!9091 lt!594764 k0!1142)))

(declare-fun lt!594763 () Unit!43980)

(assert (=> b!1343248 (= lt!594763 (lemmaInListMapAfterAddingDiffThenInBefore!346 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594764))))

(declare-fun +!4820 (ListLongMap!21775 tuple2!24110) ListLongMap!21775)

(assert (=> b!1343248 (= lt!594764 (+!4820 lt!594762 (tuple2!24111 (select (arr!44149 _keys!1571) from!1960) lt!594761)))))

(declare-fun get!22300 (ValueCell!17708 V!54721) V!54721)

(declare-fun dynLambda!3774 (Int (_ BitVec 64)) V!54721)

(assert (=> b!1343248 (= lt!594761 (get!22300 (select (arr!44150 _values!1303) from!1960) (dynLambda!3774 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6469 (array!91395 array!91397 (_ BitVec 32) (_ BitVec 32) V!54721 V!54721 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1343248 (= lt!594762 (getCurrentListMapNoExtraKeys!6469 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343249 () Bool)

(declare-fun res!890796 () Bool)

(assert (=> b!1343249 (=> (not res!890796) (not e!764921))))

(assert (=> b!1343249 (= res!890796 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44700 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343250 () Bool)

(declare-fun res!890794 () Bool)

(assert (=> b!1343250 (=> (not res!890794) (not e!764921))))

(assert (=> b!1343250 (= res!890794 (not (= (select (arr!44149 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343251 () Bool)

(assert (=> b!1343251 (= e!764920 tp_is_empty!37213)))

(assert (= (and start!113386 res!890798) b!1343247))

(assert (= (and b!1343247 res!890797) b!1343245))

(assert (= (and b!1343245 res!890795) b!1343246))

(assert (= (and b!1343246 res!890792) b!1343249))

(assert (= (and b!1343249 res!890796) b!1343244))

(assert (= (and b!1343244 res!890793) b!1343250))

(assert (= (and b!1343250 res!890794) b!1343243))

(assert (= (and b!1343243 res!890790) b!1343242))

(assert (= (and b!1343242 res!890791) b!1343248))

(assert (= (and b!1343240 condMapEmpty!57526) mapIsEmpty!57526))

(assert (= (and b!1343240 (not condMapEmpty!57526)) mapNonEmpty!57526))

(get-info :version)

(assert (= (and mapNonEmpty!57526 ((_ is ValueCellFull!17708) mapValue!57526)) b!1343251))

(assert (= (and b!1343240 ((_ is ValueCellFull!17708) mapDefault!57526)) b!1343241))

(assert (= start!113386 b!1343240))

(declare-fun b_lambda!24383 () Bool)

(assert (=> (not b_lambda!24383) (not b!1343248)))

(declare-fun t!45676 () Bool)

(declare-fun tb!12219 () Bool)

(assert (=> (and start!113386 (= defaultEntry!1306 defaultEntry!1306) t!45676) tb!12219))

(declare-fun result!25537 () Bool)

(assert (=> tb!12219 (= result!25537 tp_is_empty!37213)))

(assert (=> b!1343248 t!45676))

(declare-fun b_and!50337 () Bool)

(assert (= b_and!50335 (and (=> t!45676 result!25537) b_and!50337)))

(declare-fun m!1231161 () Bool)

(assert (=> start!113386 m!1231161))

(declare-fun m!1231163 () Bool)

(assert (=> start!113386 m!1231163))

(declare-fun m!1231165 () Bool)

(assert (=> start!113386 m!1231165))

(declare-fun m!1231167 () Bool)

(assert (=> b!1343248 m!1231167))

(declare-fun m!1231169 () Bool)

(assert (=> b!1343248 m!1231169))

(declare-fun m!1231171 () Bool)

(assert (=> b!1343248 m!1231171))

(declare-fun m!1231173 () Bool)

(assert (=> b!1343248 m!1231173))

(declare-fun m!1231175 () Bool)

(assert (=> b!1343248 m!1231175))

(declare-fun m!1231177 () Bool)

(assert (=> b!1343248 m!1231177))

(assert (=> b!1343248 m!1231173))

(declare-fun m!1231179 () Bool)

(assert (=> b!1343248 m!1231179))

(declare-fun m!1231181 () Bool)

(assert (=> b!1343248 m!1231181))

(declare-fun m!1231183 () Bool)

(assert (=> b!1343248 m!1231183))

(assert (=> b!1343248 m!1231175))

(assert (=> b!1343248 m!1231167))

(declare-fun m!1231185 () Bool)

(assert (=> b!1343248 m!1231185))

(assert (=> b!1343243 m!1231167))

(assert (=> b!1343243 m!1231167))

(declare-fun m!1231187 () Bool)

(assert (=> b!1343243 m!1231187))

(assert (=> b!1343250 m!1231167))

(declare-fun m!1231189 () Bool)

(assert (=> b!1343246 m!1231189))

(declare-fun m!1231191 () Bool)

(assert (=> mapNonEmpty!57526 m!1231191))

(declare-fun m!1231193 () Bool)

(assert (=> b!1343244 m!1231193))

(assert (=> b!1343244 m!1231193))

(declare-fun m!1231195 () Bool)

(assert (=> b!1343244 m!1231195))

(declare-fun m!1231197 () Bool)

(assert (=> b!1343245 m!1231197))

(check-sat b_and!50337 (not b_lambda!24383) (not mapNonEmpty!57526) (not b!1343244) (not b_next!31213) tp_is_empty!37213 (not b!1343246) (not b!1343248) (not start!113386) (not b!1343245) (not b!1343243))
(check-sat b_and!50337 (not b_next!31213))
