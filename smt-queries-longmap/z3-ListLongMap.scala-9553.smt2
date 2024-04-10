; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113182 () Bool)

(assert start!113182)

(declare-fun b_free!31233 () Bool)

(declare-fun b_next!31233 () Bool)

(assert (=> start!113182 (= b_free!31233 (not b_next!31233))))

(declare-fun tp!109503 () Bool)

(declare-fun b_and!50373 () Bool)

(assert (=> start!113182 (= tp!109503 b_and!50373)))

(declare-fun res!890544 () Bool)

(declare-fun e!764225 () Bool)

(assert (=> start!113182 (=> (not res!890544) (not e!764225))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113182 (= res!890544 (validMask!0 mask!1977))))

(assert (=> start!113182 e!764225))

(declare-fun tp_is_empty!37233 () Bool)

(assert (=> start!113182 tp_is_empty!37233))

(assert (=> start!113182 true))

(declare-datatypes ((array!91316 0))(
  ( (array!91317 (arr!44114 (Array (_ BitVec 32) (_ BitVec 64))) (size!44664 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91316)

(declare-fun array_inv!33251 (array!91316) Bool)

(assert (=> start!113182 (array_inv!33251 _keys!1571)))

(declare-datatypes ((V!54747 0))(
  ( (V!54748 (val!18691 Int)) )
))
(declare-datatypes ((ValueCell!17718 0))(
  ( (ValueCellFull!17718 (v!21339 V!54747)) (EmptyCell!17718) )
))
(declare-datatypes ((array!91318 0))(
  ( (array!91319 (arr!44115 (Array (_ BitVec 32) ValueCell!17718)) (size!44665 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91318)

(declare-fun e!764224 () Bool)

(declare-fun array_inv!33252 (array!91318) Bool)

(assert (=> start!113182 (and (array_inv!33252 _values!1303) e!764224)))

(assert (=> start!113182 tp!109503))

(declare-fun mapIsEmpty!57556 () Bool)

(declare-fun mapRes!57556 () Bool)

(assert (=> mapIsEmpty!57556 mapRes!57556))

(declare-fun b!1342321 () Bool)

(declare-fun e!764227 () Bool)

(assert (=> b!1342321 (= e!764227 tp_is_empty!37233)))

(declare-fun b!1342322 () Bool)

(declare-fun res!890549 () Bool)

(assert (=> b!1342322 (=> (not res!890549) (not e!764225))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342322 (= res!890549 (not (= (select (arr!44114 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342323 () Bool)

(declare-fun res!890545 () Bool)

(assert (=> b!1342323 (=> (not res!890545) (not e!764225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342323 (= res!890545 (validKeyInArray!0 (select (arr!44114 _keys!1571) from!1960)))))

(declare-fun b!1342324 () Bool)

(declare-fun res!890548 () Bool)

(assert (=> b!1342324 (=> (not res!890548) (not e!764225))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91316 (_ BitVec 32)) Bool)

(assert (=> b!1342324 (= res!890548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342325 () Bool)

(declare-fun e!764228 () Bool)

(assert (=> b!1342325 (= e!764228 tp_is_empty!37233)))

(declare-fun b!1342326 () Bool)

(assert (=> b!1342326 (= e!764225 (not true))))

(declare-datatypes ((tuple2!24074 0))(
  ( (tuple2!24075 (_1!12048 (_ BitVec 64)) (_2!12048 V!54747)) )
))
(declare-datatypes ((List!31230 0))(
  ( (Nil!31227) (Cons!31226 (h!32435 tuple2!24074) (t!45674 List!31230)) )
))
(declare-datatypes ((ListLongMap!21731 0))(
  ( (ListLongMap!21732 (toList!10881 List!31230)) )
))
(declare-fun lt!594435 () ListLongMap!21731)

(declare-fun contains!9057 (ListLongMap!21731 (_ BitVec 64)) Bool)

(assert (=> b!1342326 (contains!9057 lt!594435 k0!1142)))

(declare-fun lt!594434 () V!54747)

(declare-datatypes ((Unit!44061 0))(
  ( (Unit!44062) )
))
(declare-fun lt!594437 () Unit!44061)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!361 ((_ BitVec 64) (_ BitVec 64) V!54747 ListLongMap!21731) Unit!44061)

(assert (=> b!1342326 (= lt!594437 (lemmaInListMapAfterAddingDiffThenInBefore!361 k0!1142 (select (arr!44114 _keys!1571) from!1960) lt!594434 lt!594435))))

(declare-fun lt!594438 () ListLongMap!21731)

(assert (=> b!1342326 (contains!9057 lt!594438 k0!1142)))

(declare-fun zeroValue!1245 () V!54747)

(declare-fun lt!594436 () Unit!44061)

(assert (=> b!1342326 (= lt!594436 (lemmaInListMapAfterAddingDiffThenInBefore!361 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594438))))

(declare-fun +!4792 (ListLongMap!21731 tuple2!24074) ListLongMap!21731)

(assert (=> b!1342326 (= lt!594438 (+!4792 lt!594435 (tuple2!24075 (select (arr!44114 _keys!1571) from!1960) lt!594434)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22275 (ValueCell!17718 V!54747) V!54747)

(declare-fun dynLambda!3731 (Int (_ BitVec 64)) V!54747)

(assert (=> b!1342326 (= lt!594434 (get!22275 (select (arr!44115 _values!1303) from!1960) (dynLambda!3731 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54747)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6434 (array!91316 array!91318 (_ BitVec 32) (_ BitVec 32) V!54747 V!54747 (_ BitVec 32) Int) ListLongMap!21731)

(assert (=> b!1342326 (= lt!594435 (getCurrentListMapNoExtraKeys!6434 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342327 () Bool)

(declare-fun res!890550 () Bool)

(assert (=> b!1342327 (=> (not res!890550) (not e!764225))))

(assert (=> b!1342327 (= res!890550 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44664 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57556 () Bool)

(declare-fun tp!109504 () Bool)

(assert (=> mapNonEmpty!57556 (= mapRes!57556 (and tp!109504 e!764228))))

(declare-fun mapKey!57556 () (_ BitVec 32))

(declare-fun mapRest!57556 () (Array (_ BitVec 32) ValueCell!17718))

(declare-fun mapValue!57556 () ValueCell!17718)

(assert (=> mapNonEmpty!57556 (= (arr!44115 _values!1303) (store mapRest!57556 mapKey!57556 mapValue!57556))))

(declare-fun b!1342328 () Bool)

(declare-fun res!890542 () Bool)

(assert (=> b!1342328 (=> (not res!890542) (not e!764225))))

(declare-fun getCurrentListMap!5845 (array!91316 array!91318 (_ BitVec 32) (_ BitVec 32) V!54747 V!54747 (_ BitVec 32) Int) ListLongMap!21731)

(assert (=> b!1342328 (= res!890542 (contains!9057 (getCurrentListMap!5845 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1342329 () Bool)

(declare-fun res!890547 () Bool)

(assert (=> b!1342329 (=> (not res!890547) (not e!764225))))

(assert (=> b!1342329 (= res!890547 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342330 () Bool)

(declare-fun res!890543 () Bool)

(assert (=> b!1342330 (=> (not res!890543) (not e!764225))))

(declare-datatypes ((List!31231 0))(
  ( (Nil!31228) (Cons!31227 (h!32436 (_ BitVec 64)) (t!45675 List!31231)) )
))
(declare-fun arrayNoDuplicates!0 (array!91316 (_ BitVec 32) List!31231) Bool)

(assert (=> b!1342330 (= res!890543 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31228))))

(declare-fun b!1342331 () Bool)

(declare-fun res!890546 () Bool)

(assert (=> b!1342331 (=> (not res!890546) (not e!764225))))

(assert (=> b!1342331 (= res!890546 (and (= (size!44665 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44664 _keys!1571) (size!44665 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342332 () Bool)

(assert (=> b!1342332 (= e!764224 (and e!764227 mapRes!57556))))

(declare-fun condMapEmpty!57556 () Bool)

(declare-fun mapDefault!57556 () ValueCell!17718)

(assert (=> b!1342332 (= condMapEmpty!57556 (= (arr!44115 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17718)) mapDefault!57556)))))

(assert (= (and start!113182 res!890544) b!1342331))

(assert (= (and b!1342331 res!890546) b!1342324))

(assert (= (and b!1342324 res!890548) b!1342330))

(assert (= (and b!1342330 res!890543) b!1342327))

(assert (= (and b!1342327 res!890550) b!1342328))

(assert (= (and b!1342328 res!890542) b!1342322))

(assert (= (and b!1342322 res!890549) b!1342323))

(assert (= (and b!1342323 res!890545) b!1342329))

(assert (= (and b!1342329 res!890547) b!1342326))

(assert (= (and b!1342332 condMapEmpty!57556) mapIsEmpty!57556))

(assert (= (and b!1342332 (not condMapEmpty!57556)) mapNonEmpty!57556))

(get-info :version)

(assert (= (and mapNonEmpty!57556 ((_ is ValueCellFull!17718) mapValue!57556)) b!1342325))

(assert (= (and b!1342332 ((_ is ValueCellFull!17718) mapDefault!57556)) b!1342321))

(assert (= start!113182 b!1342332))

(declare-fun b_lambda!24409 () Bool)

(assert (=> (not b_lambda!24409) (not b!1342326)))

(declare-fun t!45673 () Bool)

(declare-fun tb!12247 () Bool)

(assert (=> (and start!113182 (= defaultEntry!1306 defaultEntry!1306) t!45673) tb!12247))

(declare-fun result!25585 () Bool)

(assert (=> tb!12247 (= result!25585 tp_is_empty!37233)))

(assert (=> b!1342326 t!45673))

(declare-fun b_and!50375 () Bool)

(assert (= b_and!50373 (and (=> t!45673 result!25585) b_and!50375)))

(declare-fun m!1229943 () Bool)

(assert (=> mapNonEmpty!57556 m!1229943))

(declare-fun m!1229945 () Bool)

(assert (=> b!1342330 m!1229945))

(declare-fun m!1229947 () Bool)

(assert (=> b!1342323 m!1229947))

(assert (=> b!1342323 m!1229947))

(declare-fun m!1229949 () Bool)

(assert (=> b!1342323 m!1229949))

(declare-fun m!1229951 () Bool)

(assert (=> b!1342324 m!1229951))

(declare-fun m!1229953 () Bool)

(assert (=> start!113182 m!1229953))

(declare-fun m!1229955 () Bool)

(assert (=> start!113182 m!1229955))

(declare-fun m!1229957 () Bool)

(assert (=> start!113182 m!1229957))

(declare-fun m!1229959 () Bool)

(assert (=> b!1342326 m!1229959))

(declare-fun m!1229961 () Bool)

(assert (=> b!1342326 m!1229961))

(declare-fun m!1229963 () Bool)

(assert (=> b!1342326 m!1229963))

(declare-fun m!1229965 () Bool)

(assert (=> b!1342326 m!1229965))

(declare-fun m!1229967 () Bool)

(assert (=> b!1342326 m!1229967))

(assert (=> b!1342326 m!1229947))

(declare-fun m!1229969 () Bool)

(assert (=> b!1342326 m!1229969))

(assert (=> b!1342326 m!1229947))

(declare-fun m!1229971 () Bool)

(assert (=> b!1342326 m!1229971))

(declare-fun m!1229973 () Bool)

(assert (=> b!1342326 m!1229973))

(assert (=> b!1342326 m!1229963))

(assert (=> b!1342326 m!1229967))

(declare-fun m!1229975 () Bool)

(assert (=> b!1342326 m!1229975))

(assert (=> b!1342322 m!1229947))

(declare-fun m!1229977 () Bool)

(assert (=> b!1342328 m!1229977))

(assert (=> b!1342328 m!1229977))

(declare-fun m!1229979 () Bool)

(assert (=> b!1342328 m!1229979))

(check-sat (not mapNonEmpty!57556) (not b_next!31233) (not b!1342323) (not start!113182) (not b!1342324) b_and!50375 (not b!1342326) (not b_lambda!24409) (not b!1342330) (not b!1342328) tp_is_empty!37233)
(check-sat b_and!50375 (not b_next!31233))
