; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113234 () Bool)

(assert start!113234)

(declare-fun b_free!31285 () Bool)

(declare-fun b_next!31285 () Bool)

(assert (=> start!113234 (= b_free!31285 (not b_next!31285))))

(declare-fun tp!109661 () Bool)

(declare-fun b_and!50459 () Bool)

(assert (=> start!113234 (= tp!109661 b_and!50459)))

(declare-fun mapIsEmpty!57634 () Bool)

(declare-fun mapRes!57634 () Bool)

(assert (=> mapIsEmpty!57634 mapRes!57634))

(declare-fun b!1343240 () Bool)

(declare-fun e!764581 () Bool)

(assert (=> b!1343240 (= e!764581 (not true))))

(declare-datatypes ((V!54817 0))(
  ( (V!54818 (val!18717 Int)) )
))
(declare-datatypes ((tuple2!24176 0))(
  ( (tuple2!24177 (_1!12099 (_ BitVec 64)) (_2!12099 V!54817)) )
))
(declare-datatypes ((List!31319 0))(
  ( (Nil!31316) (Cons!31315 (h!32524 tuple2!24176) (t!45807 List!31319)) )
))
(declare-datatypes ((ListLongMap!21833 0))(
  ( (ListLongMap!21834 (toList!10932 List!31319)) )
))
(declare-fun lt!594681 () ListLongMap!21833)

(declare-fun zeroValue!1245 () V!54817)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9037 (ListLongMap!21833 (_ BitVec 64)) Bool)

(declare-fun +!4833 (ListLongMap!21833 tuple2!24176) ListLongMap!21833)

(assert (=> b!1343240 (contains!9037 (+!4833 lt!594681 (tuple2!24177 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!43908 0))(
  ( (Unit!43909) )
))
(declare-fun lt!594677 () Unit!43908)

(declare-fun addStillContains!1197 (ListLongMap!21833 (_ BitVec 64) V!54817 (_ BitVec 64)) Unit!43908)

(assert (=> b!1343240 (= lt!594677 (addStillContains!1197 lt!594681 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343240 (contains!9037 lt!594681 k0!1142)))

(declare-fun lt!594679 () Unit!43908)

(declare-datatypes ((array!91359 0))(
  ( (array!91360 (arr!44136 (Array (_ BitVec 32) (_ BitVec 64))) (size!44688 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91359)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!594676 () V!54817)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!372 ((_ BitVec 64) (_ BitVec 64) V!54817 ListLongMap!21833) Unit!43908)

(assert (=> b!1343240 (= lt!594679 (lemmaInListMapAfterAddingDiffThenInBefore!372 k0!1142 (select (arr!44136 _keys!1571) from!1960) lt!594676 lt!594681))))

(declare-fun lt!594678 () ListLongMap!21833)

(assert (=> b!1343240 (contains!9037 lt!594678 k0!1142)))

(declare-fun lt!594680 () Unit!43908)

(assert (=> b!1343240 (= lt!594680 (lemmaInListMapAfterAddingDiffThenInBefore!372 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594678))))

(assert (=> b!1343240 (= lt!594678 (+!4833 lt!594681 (tuple2!24177 (select (arr!44136 _keys!1571) from!1960) lt!594676)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17744 0))(
  ( (ValueCellFull!17744 (v!21364 V!54817)) (EmptyCell!17744) )
))
(declare-datatypes ((array!91361 0))(
  ( (array!91362 (arr!44137 (Array (_ BitVec 32) ValueCell!17744)) (size!44689 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91361)

(declare-fun get!22301 (ValueCell!17744 V!54817) V!54817)

(declare-fun dynLambda!3763 (Int (_ BitVec 64)) V!54817)

(assert (=> b!1343240 (= lt!594676 (get!22301 (select (arr!44137 _values!1303) from!1960) (dynLambda!3763 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54817)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6476 (array!91359 array!91361 (_ BitVec 32) (_ BitVec 32) V!54817 V!54817 (_ BitVec 32) Int) ListLongMap!21833)

(assert (=> b!1343240 (= lt!594681 (getCurrentListMapNoExtraKeys!6476 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343241 () Bool)

(declare-fun res!891220 () Bool)

(assert (=> b!1343241 (=> (not res!891220) (not e!764581))))

(declare-fun getCurrentListMap!5780 (array!91359 array!91361 (_ BitVec 32) (_ BitVec 32) V!54817 V!54817 (_ BitVec 32) Int) ListLongMap!21833)

(assert (=> b!1343241 (= res!891220 (contains!9037 (getCurrentListMap!5780 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343242 () Bool)

(declare-fun res!891215 () Bool)

(assert (=> b!1343242 (=> (not res!891215) (not e!764581))))

(declare-datatypes ((List!31320 0))(
  ( (Nil!31317) (Cons!31316 (h!32525 (_ BitVec 64)) (t!45808 List!31320)) )
))
(declare-fun arrayNoDuplicates!0 (array!91359 (_ BitVec 32) List!31320) Bool)

(assert (=> b!1343242 (= res!891215 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31317))))

(declare-fun b!1343243 () Bool)

(declare-fun res!891216 () Bool)

(assert (=> b!1343243 (=> (not res!891216) (not e!764581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343243 (= res!891216 (validKeyInArray!0 (select (arr!44136 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57634 () Bool)

(declare-fun tp!109660 () Bool)

(declare-fun e!764584 () Bool)

(assert (=> mapNonEmpty!57634 (= mapRes!57634 (and tp!109660 e!764584))))

(declare-fun mapValue!57634 () ValueCell!17744)

(declare-fun mapRest!57634 () (Array (_ BitVec 32) ValueCell!17744))

(declare-fun mapKey!57634 () (_ BitVec 32))

(assert (=> mapNonEmpty!57634 (= (arr!44137 _values!1303) (store mapRest!57634 mapKey!57634 mapValue!57634))))

(declare-fun b!1343244 () Bool)

(declare-fun tp_is_empty!37285 () Bool)

(assert (=> b!1343244 (= e!764584 tp_is_empty!37285)))

(declare-fun b!1343245 () Bool)

(declare-fun res!891222 () Bool)

(assert (=> b!1343245 (=> (not res!891222) (not e!764581))))

(assert (=> b!1343245 (= res!891222 (and (= (size!44689 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44688 _keys!1571) (size!44689 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343246 () Bool)

(declare-fun e!764585 () Bool)

(assert (=> b!1343246 (= e!764585 tp_is_empty!37285)))

(declare-fun b!1343239 () Bool)

(declare-fun e!764582 () Bool)

(assert (=> b!1343239 (= e!764582 (and e!764585 mapRes!57634))))

(declare-fun condMapEmpty!57634 () Bool)

(declare-fun mapDefault!57634 () ValueCell!17744)

(assert (=> b!1343239 (= condMapEmpty!57634 (= (arr!44137 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17744)) mapDefault!57634)))))

(declare-fun res!891223 () Bool)

(assert (=> start!113234 (=> (not res!891223) (not e!764581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113234 (= res!891223 (validMask!0 mask!1977))))

(assert (=> start!113234 e!764581))

(assert (=> start!113234 tp_is_empty!37285))

(assert (=> start!113234 true))

(declare-fun array_inv!33457 (array!91359) Bool)

(assert (=> start!113234 (array_inv!33457 _keys!1571)))

(declare-fun array_inv!33458 (array!91361) Bool)

(assert (=> start!113234 (and (array_inv!33458 _values!1303) e!764582)))

(assert (=> start!113234 tp!109661))

(declare-fun b!1343247 () Bool)

(declare-fun res!891219 () Bool)

(assert (=> b!1343247 (=> (not res!891219) (not e!764581))))

(assert (=> b!1343247 (= res!891219 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44688 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343248 () Bool)

(declare-fun res!891217 () Bool)

(assert (=> b!1343248 (=> (not res!891217) (not e!764581))))

(assert (=> b!1343248 (= res!891217 (not (= (select (arr!44136 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343249 () Bool)

(declare-fun res!891218 () Bool)

(assert (=> b!1343249 (=> (not res!891218) (not e!764581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91359 (_ BitVec 32)) Bool)

(assert (=> b!1343249 (= res!891218 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343250 () Bool)

(declare-fun res!891221 () Bool)

(assert (=> b!1343250 (=> (not res!891221) (not e!764581))))

(assert (=> b!1343250 (= res!891221 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113234 res!891223) b!1343245))

(assert (= (and b!1343245 res!891222) b!1343249))

(assert (= (and b!1343249 res!891218) b!1343242))

(assert (= (and b!1343242 res!891215) b!1343247))

(assert (= (and b!1343247 res!891219) b!1343241))

(assert (= (and b!1343241 res!891220) b!1343248))

(assert (= (and b!1343248 res!891217) b!1343243))

(assert (= (and b!1343243 res!891216) b!1343250))

(assert (= (and b!1343250 res!891221) b!1343240))

(assert (= (and b!1343239 condMapEmpty!57634) mapIsEmpty!57634))

(assert (= (and b!1343239 (not condMapEmpty!57634)) mapNonEmpty!57634))

(get-info :version)

(assert (= (and mapNonEmpty!57634 ((_ is ValueCellFull!17744) mapValue!57634)) b!1343244))

(assert (= (and b!1343239 ((_ is ValueCellFull!17744) mapDefault!57634)) b!1343246))

(assert (= start!113234 b!1343239))

(declare-fun b_lambda!24451 () Bool)

(assert (=> (not b_lambda!24451) (not b!1343240)))

(declare-fun t!45806 () Bool)

(declare-fun tb!12291 () Bool)

(assert (=> (and start!113234 (= defaultEntry!1306 defaultEntry!1306) t!45806) tb!12291))

(declare-fun result!25681 () Bool)

(assert (=> tb!12291 (= result!25681 tp_is_empty!37285)))

(assert (=> b!1343240 t!45806))

(declare-fun b_and!50461 () Bool)

(assert (= b_and!50459 (and (=> t!45806 result!25681) b_and!50461)))

(declare-fun m!1230487 () Bool)

(assert (=> b!1343242 m!1230487))

(declare-fun m!1230489 () Bool)

(assert (=> b!1343248 m!1230489))

(declare-fun m!1230491 () Bool)

(assert (=> mapNonEmpty!57634 m!1230491))

(declare-fun m!1230493 () Bool)

(assert (=> b!1343240 m!1230493))

(declare-fun m!1230495 () Bool)

(assert (=> b!1343240 m!1230495))

(declare-fun m!1230497 () Bool)

(assert (=> b!1343240 m!1230497))

(declare-fun m!1230499 () Bool)

(assert (=> b!1343240 m!1230499))

(declare-fun m!1230501 () Bool)

(assert (=> b!1343240 m!1230501))

(assert (=> b!1343240 m!1230497))

(declare-fun m!1230503 () Bool)

(assert (=> b!1343240 m!1230503))

(assert (=> b!1343240 m!1230499))

(assert (=> b!1343240 m!1230489))

(declare-fun m!1230505 () Bool)

(assert (=> b!1343240 m!1230505))

(assert (=> b!1343240 m!1230489))

(declare-fun m!1230507 () Bool)

(assert (=> b!1343240 m!1230507))

(declare-fun m!1230509 () Bool)

(assert (=> b!1343240 m!1230509))

(declare-fun m!1230511 () Bool)

(assert (=> b!1343240 m!1230511))

(assert (=> b!1343240 m!1230511))

(declare-fun m!1230513 () Bool)

(assert (=> b!1343240 m!1230513))

(declare-fun m!1230515 () Bool)

(assert (=> b!1343240 m!1230515))

(declare-fun m!1230517 () Bool)

(assert (=> b!1343241 m!1230517))

(assert (=> b!1343241 m!1230517))

(declare-fun m!1230519 () Bool)

(assert (=> b!1343241 m!1230519))

(declare-fun m!1230521 () Bool)

(assert (=> start!113234 m!1230521))

(declare-fun m!1230523 () Bool)

(assert (=> start!113234 m!1230523))

(declare-fun m!1230525 () Bool)

(assert (=> start!113234 m!1230525))

(declare-fun m!1230527 () Bool)

(assert (=> b!1343249 m!1230527))

(assert (=> b!1343243 m!1230489))

(assert (=> b!1343243 m!1230489))

(declare-fun m!1230529 () Bool)

(assert (=> b!1343243 m!1230529))

(check-sat (not b!1343249) (not b!1343240) (not b!1343243) b_and!50461 (not b_lambda!24451) tp_is_empty!37285 (not b!1343242) (not b_next!31285) (not mapNonEmpty!57634) (not start!113234) (not b!1343241))
(check-sat b_and!50461 (not b_next!31285))
