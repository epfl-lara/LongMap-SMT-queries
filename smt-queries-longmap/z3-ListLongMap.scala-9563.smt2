; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113242 () Bool)

(assert start!113242)

(declare-fun b_free!31293 () Bool)

(declare-fun b_next!31293 () Bool)

(assert (=> start!113242 (= b_free!31293 (not b_next!31293))))

(declare-fun tp!109683 () Bool)

(declare-fun b_and!50493 () Bool)

(assert (=> start!113242 (= tp!109683 b_and!50493)))

(declare-fun mapNonEmpty!57646 () Bool)

(declare-fun mapRes!57646 () Bool)

(declare-fun tp!109684 () Bool)

(declare-fun e!764678 () Bool)

(assert (=> mapNonEmpty!57646 (= mapRes!57646 (and tp!109684 e!764678))))

(declare-fun mapKey!57646 () (_ BitVec 32))

(declare-datatypes ((V!54827 0))(
  ( (V!54828 (val!18721 Int)) )
))
(declare-datatypes ((ValueCell!17748 0))(
  ( (ValueCellFull!17748 (v!21369 V!54827)) (EmptyCell!17748) )
))
(declare-datatypes ((array!91432 0))(
  ( (array!91433 (arr!44172 (Array (_ BitVec 32) ValueCell!17748)) (size!44722 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91432)

(declare-fun mapRest!57646 () (Array (_ BitVec 32) ValueCell!17748))

(declare-fun mapValue!57646 () ValueCell!17748)

(assert (=> mapNonEmpty!57646 (= (arr!44172 _values!1303) (store mapRest!57646 mapKey!57646 mapValue!57646))))

(declare-fun res!891359 () Bool)

(declare-fun e!764676 () Bool)

(assert (=> start!113242 (=> (not res!891359) (not e!764676))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113242 (= res!891359 (validMask!0 mask!1977))))

(assert (=> start!113242 e!764676))

(declare-fun tp_is_empty!37293 () Bool)

(assert (=> start!113242 tp_is_empty!37293))

(assert (=> start!113242 true))

(declare-datatypes ((array!91434 0))(
  ( (array!91435 (arr!44173 (Array (_ BitVec 32) (_ BitVec 64))) (size!44723 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91434)

(declare-fun array_inv!33295 (array!91434) Bool)

(assert (=> start!113242 (array_inv!33295 _keys!1571)))

(declare-fun e!764677 () Bool)

(declare-fun array_inv!33296 (array!91432) Bool)

(assert (=> start!113242 (and (array_inv!33296 _values!1303) e!764677)))

(assert (=> start!113242 tp!109683))

(declare-fun b!1343461 () Bool)

(declare-fun e!764674 () Bool)

(assert (=> b!1343461 (= e!764677 (and e!764674 mapRes!57646))))

(declare-fun condMapEmpty!57646 () Bool)

(declare-fun mapDefault!57646 () ValueCell!17748)

(assert (=> b!1343461 (= condMapEmpty!57646 (= (arr!44172 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17748)) mapDefault!57646)))))

(declare-fun b!1343462 () Bool)

(assert (=> b!1343462 (= e!764674 tp_is_empty!37293)))

(declare-fun b!1343463 () Bool)

(declare-fun res!891354 () Bool)

(assert (=> b!1343463 (=> (not res!891354) (not e!764676))))

(declare-datatypes ((List!31275 0))(
  ( (Nil!31272) (Cons!31271 (h!32480 (_ BitVec 64)) (t!45779 List!31275)) )
))
(declare-fun arrayNoDuplicates!0 (array!91434 (_ BitVec 32) List!31275) Bool)

(assert (=> b!1343463 (= res!891354 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31272))))

(declare-fun b!1343464 () Bool)

(declare-fun res!891353 () Bool)

(assert (=> b!1343464 (=> (not res!891353) (not e!764676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91434 (_ BitVec 32)) Bool)

(assert (=> b!1343464 (= res!891353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343465 () Bool)

(declare-fun res!891352 () Bool)

(assert (=> b!1343465 (=> (not res!891352) (not e!764676))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343465 (= res!891352 (not (= (select (arr!44173 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343466 () Bool)

(declare-fun res!891356 () Bool)

(assert (=> b!1343466 (=> (not res!891356) (not e!764676))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1343466 (= res!891356 (and (= (size!44722 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44723 _keys!1571) (size!44722 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343467 () Bool)

(assert (=> b!1343467 (= e!764676 (not true))))

(declare-datatypes ((tuple2!24118 0))(
  ( (tuple2!24119 (_1!12070 (_ BitVec 64)) (_2!12070 V!54827)) )
))
(declare-datatypes ((List!31276 0))(
  ( (Nil!31273) (Cons!31272 (h!32481 tuple2!24118) (t!45780 List!31276)) )
))
(declare-datatypes ((ListLongMap!21775 0))(
  ( (ListLongMap!21776 (toList!10903 List!31276)) )
))
(declare-fun lt!594939 () ListLongMap!21775)

(declare-fun zeroValue!1245 () V!54827)

(declare-fun contains!9079 (ListLongMap!21775 (_ BitVec 64)) Bool)

(declare-fun +!4811 (ListLongMap!21775 tuple2!24118) ListLongMap!21775)

(assert (=> b!1343467 (contains!9079 (+!4811 lt!594939 (tuple2!24119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44099 0))(
  ( (Unit!44100) )
))
(declare-fun lt!594937 () Unit!44099)

(declare-fun addStillContains!1204 (ListLongMap!21775 (_ BitVec 64) V!54827 (_ BitVec 64)) Unit!44099)

(assert (=> b!1343467 (= lt!594937 (addStillContains!1204 lt!594939 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343467 (contains!9079 lt!594939 k0!1142)))

(declare-fun lt!594935 () V!54827)

(declare-fun lt!594936 () Unit!44099)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!380 ((_ BitVec 64) (_ BitVec 64) V!54827 ListLongMap!21775) Unit!44099)

(assert (=> b!1343467 (= lt!594936 (lemmaInListMapAfterAddingDiffThenInBefore!380 k0!1142 (select (arr!44173 _keys!1571) from!1960) lt!594935 lt!594939))))

(declare-fun lt!594938 () ListLongMap!21775)

(assert (=> b!1343467 (contains!9079 lt!594938 k0!1142)))

(declare-fun lt!594934 () Unit!44099)

(assert (=> b!1343467 (= lt!594934 (lemmaInListMapAfterAddingDiffThenInBefore!380 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594938))))

(assert (=> b!1343467 (= lt!594938 (+!4811 lt!594939 (tuple2!24119 (select (arr!44173 _keys!1571) from!1960) lt!594935)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22314 (ValueCell!17748 V!54827) V!54827)

(declare-fun dynLambda!3750 (Int (_ BitVec 64)) V!54827)

(assert (=> b!1343467 (= lt!594935 (get!22314 (select (arr!44172 _values!1303) from!1960) (dynLambda!3750 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54827)

(declare-fun getCurrentListMapNoExtraKeys!6453 (array!91434 array!91432 (_ BitVec 32) (_ BitVec 32) V!54827 V!54827 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1343467 (= lt!594939 (getCurrentListMapNoExtraKeys!6453 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343468 () Bool)

(declare-fun res!891355 () Bool)

(assert (=> b!1343468 (=> (not res!891355) (not e!764676))))

(declare-fun getCurrentListMap!5862 (array!91434 array!91432 (_ BitVec 32) (_ BitVec 32) V!54827 V!54827 (_ BitVec 32) Int) ListLongMap!21775)

(assert (=> b!1343468 (= res!891355 (contains!9079 (getCurrentListMap!5862 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57646 () Bool)

(assert (=> mapIsEmpty!57646 mapRes!57646))

(declare-fun b!1343469 () Bool)

(declare-fun res!891357 () Bool)

(assert (=> b!1343469 (=> (not res!891357) (not e!764676))))

(assert (=> b!1343469 (= res!891357 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44723 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343470 () Bool)

(declare-fun res!891360 () Bool)

(assert (=> b!1343470 (=> (not res!891360) (not e!764676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343470 (= res!891360 (validKeyInArray!0 (select (arr!44173 _keys!1571) from!1960)))))

(declare-fun b!1343471 () Bool)

(assert (=> b!1343471 (= e!764678 tp_is_empty!37293)))

(declare-fun b!1343472 () Bool)

(declare-fun res!891358 () Bool)

(assert (=> b!1343472 (=> (not res!891358) (not e!764676))))

(assert (=> b!1343472 (= res!891358 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!113242 res!891359) b!1343466))

(assert (= (and b!1343466 res!891356) b!1343464))

(assert (= (and b!1343464 res!891353) b!1343463))

(assert (= (and b!1343463 res!891354) b!1343469))

(assert (= (and b!1343469 res!891357) b!1343468))

(assert (= (and b!1343468 res!891355) b!1343465))

(assert (= (and b!1343465 res!891352) b!1343470))

(assert (= (and b!1343470 res!891360) b!1343472))

(assert (= (and b!1343472 res!891358) b!1343467))

(assert (= (and b!1343461 condMapEmpty!57646) mapIsEmpty!57646))

(assert (= (and b!1343461 (not condMapEmpty!57646)) mapNonEmpty!57646))

(get-info :version)

(assert (= (and mapNonEmpty!57646 ((_ is ValueCellFull!17748) mapValue!57646)) b!1343471))

(assert (= (and b!1343461 ((_ is ValueCellFull!17748) mapDefault!57646)) b!1343462))

(assert (= start!113242 b!1343461))

(declare-fun b_lambda!24469 () Bool)

(assert (=> (not b_lambda!24469) (not b!1343467)))

(declare-fun t!45778 () Bool)

(declare-fun tb!12307 () Bool)

(assert (=> (and start!113242 (= defaultEntry!1306 defaultEntry!1306) t!45778) tb!12307))

(declare-fun result!25705 () Bool)

(assert (=> tb!12307 (= result!25705 tp_is_empty!37293)))

(assert (=> b!1343467 t!45778))

(declare-fun b_and!50495 () Bool)

(assert (= b_and!50493 (and (=> t!45778 result!25705) b_and!50495)))

(declare-fun m!1231179 () Bool)

(assert (=> mapNonEmpty!57646 m!1231179))

(declare-fun m!1231181 () Bool)

(assert (=> b!1343463 m!1231181))

(declare-fun m!1231183 () Bool)

(assert (=> start!113242 m!1231183))

(declare-fun m!1231185 () Bool)

(assert (=> start!113242 m!1231185))

(declare-fun m!1231187 () Bool)

(assert (=> start!113242 m!1231187))

(declare-fun m!1231189 () Bool)

(assert (=> b!1343468 m!1231189))

(assert (=> b!1343468 m!1231189))

(declare-fun m!1231191 () Bool)

(assert (=> b!1343468 m!1231191))

(declare-fun m!1231193 () Bool)

(assert (=> b!1343470 m!1231193))

(assert (=> b!1343470 m!1231193))

(declare-fun m!1231195 () Bool)

(assert (=> b!1343470 m!1231195))

(assert (=> b!1343465 m!1231193))

(declare-fun m!1231197 () Bool)

(assert (=> b!1343467 m!1231197))

(declare-fun m!1231199 () Bool)

(assert (=> b!1343467 m!1231199))

(assert (=> b!1343467 m!1231197))

(declare-fun m!1231201 () Bool)

(assert (=> b!1343467 m!1231201))

(assert (=> b!1343467 m!1231193))

(declare-fun m!1231203 () Bool)

(assert (=> b!1343467 m!1231203))

(declare-fun m!1231205 () Bool)

(assert (=> b!1343467 m!1231205))

(declare-fun m!1231207 () Bool)

(assert (=> b!1343467 m!1231207))

(declare-fun m!1231209 () Bool)

(assert (=> b!1343467 m!1231209))

(assert (=> b!1343467 m!1231205))

(assert (=> b!1343467 m!1231207))

(declare-fun m!1231211 () Bool)

(assert (=> b!1343467 m!1231211))

(declare-fun m!1231213 () Bool)

(assert (=> b!1343467 m!1231213))

(declare-fun m!1231215 () Bool)

(assert (=> b!1343467 m!1231215))

(declare-fun m!1231217 () Bool)

(assert (=> b!1343467 m!1231217))

(assert (=> b!1343467 m!1231193))

(declare-fun m!1231219 () Bool)

(assert (=> b!1343467 m!1231219))

(declare-fun m!1231221 () Bool)

(assert (=> b!1343464 m!1231221))

(check-sat (not b!1343464) (not b_lambda!24469) (not b!1343470) (not b!1343468) (not b!1343467) (not start!113242) b_and!50495 (not mapNonEmpty!57646) (not b!1343463) (not b_next!31293) tp_is_empty!37293)
(check-sat b_and!50495 (not b_next!31293))
