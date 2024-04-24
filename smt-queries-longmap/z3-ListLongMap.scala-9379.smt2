; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111934 () Bool)

(assert start!111934)

(declare-fun b_free!30367 () Bool)

(declare-fun b_next!30367 () Bool)

(assert (=> start!111934 (= b_free!30367 (not b_next!30367))))

(declare-fun tp!106576 () Bool)

(declare-fun b_and!48895 () Bool)

(assert (=> start!111934 (= tp!106576 b_and!48895)))

(declare-fun b!1324939 () Bool)

(declare-fun res!879101 () Bool)

(declare-fun e!755433 () Bool)

(assert (=> b!1324939 (=> (not res!879101) (not e!755433))))

(declare-datatypes ((array!89379 0))(
  ( (array!89380 (arr!43159 (Array (_ BitVec 32) (_ BitVec 64))) (size!43710 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89379)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324939 (= res!879101 (validKeyInArray!0 (select (arr!43159 _keys!1609) from!2000)))))

(declare-fun b!1324940 () Bool)

(declare-fun res!879104 () Bool)

(assert (=> b!1324940 (=> (not res!879104) (not e!755433))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53353 0))(
  ( (V!53354 (val!18168 Int)) )
))
(declare-fun zeroValue!1279 () V!53353)

(declare-datatypes ((ValueCell!17195 0))(
  ( (ValueCellFull!17195 (v!20793 V!53353)) (EmptyCell!17195) )
))
(declare-datatypes ((array!89381 0))(
  ( (array!89382 (arr!43160 (Array (_ BitVec 32) ValueCell!17195)) (size!43711 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89381)

(declare-fun minValue!1279 () V!53353)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23466 0))(
  ( (tuple2!23467 (_1!11744 (_ BitVec 64)) (_2!11744 V!53353)) )
))
(declare-datatypes ((List!30615 0))(
  ( (Nil!30612) (Cons!30611 (h!31829 tuple2!23466) (t!44523 List!30615)) )
))
(declare-datatypes ((ListLongMap!21131 0))(
  ( (ListLongMap!21132 (toList!10581 List!30615)) )
))
(declare-fun contains!8748 (ListLongMap!21131 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5565 (array!89379 array!89381 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21131)

(assert (=> b!1324940 (= res!879104 (contains!8748 (getCurrentListMap!5565 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324941 () Bool)

(declare-fun res!879103 () Bool)

(assert (=> b!1324941 (=> (not res!879103) (not e!755433))))

(declare-datatypes ((List!30616 0))(
  ( (Nil!30613) (Cons!30612 (h!31830 (_ BitVec 64)) (t!44524 List!30616)) )
))
(declare-fun arrayNoDuplicates!0 (array!89379 (_ BitVec 32) List!30616) Bool)

(assert (=> b!1324941 (= res!879103 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30613))))

(declare-fun b!1324942 () Bool)

(declare-fun res!879106 () Bool)

(assert (=> b!1324942 (=> (not res!879106) (not e!755433))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89379 (_ BitVec 32)) Bool)

(assert (=> b!1324942 (= res!879106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324943 () Bool)

(declare-fun res!879099 () Bool)

(assert (=> b!1324943 (=> (not res!879099) (not e!755433))))

(assert (=> b!1324943 (= res!879099 (and (= (size!43711 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43710 _keys!1609) (size!43711 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!55928 () Bool)

(declare-fun mapRes!55928 () Bool)

(assert (=> mapIsEmpty!55928 mapRes!55928))

(declare-fun res!879105 () Bool)

(assert (=> start!111934 (=> (not res!879105) (not e!755433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111934 (= res!879105 (validMask!0 mask!2019))))

(assert (=> start!111934 e!755433))

(declare-fun array_inv!32857 (array!89379) Bool)

(assert (=> start!111934 (array_inv!32857 _keys!1609)))

(assert (=> start!111934 true))

(declare-fun tp_is_empty!36187 () Bool)

(assert (=> start!111934 tp_is_empty!36187))

(declare-fun e!755437 () Bool)

(declare-fun array_inv!32858 (array!89381) Bool)

(assert (=> start!111934 (and (array_inv!32858 _values!1337) e!755437)))

(assert (=> start!111934 tp!106576))

(declare-fun b!1324944 () Bool)

(declare-fun e!755434 () Bool)

(assert (=> b!1324944 (= e!755434 tp_is_empty!36187)))

(declare-fun b!1324945 () Bool)

(declare-fun res!879102 () Bool)

(assert (=> b!1324945 (=> (not res!879102) (not e!755433))))

(assert (=> b!1324945 (= res!879102 (not (= (select (arr!43159 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324946 () Bool)

(assert (=> b!1324946 (= e!755433 (not true))))

(declare-fun lt!589706 () ListLongMap!21131)

(declare-fun +!4652 (ListLongMap!21131 tuple2!23466) ListLongMap!21131)

(assert (=> b!1324946 (contains!8748 (+!4652 lt!589706 (tuple2!23467 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43591 0))(
  ( (Unit!43592) )
))
(declare-fun lt!589699 () Unit!43591)

(declare-fun addStillContains!1164 (ListLongMap!21131 (_ BitVec 64) V!53353 (_ BitVec 64)) Unit!43591)

(assert (=> b!1324946 (= lt!589699 (addStillContains!1164 lt!589706 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324946 (contains!8748 lt!589706 k0!1164)))

(declare-fun lt!589701 () ListLongMap!21131)

(declare-fun lt!589702 () tuple2!23466)

(assert (=> b!1324946 (= lt!589706 (+!4652 lt!589701 lt!589702))))

(declare-fun lt!589708 () Unit!43591)

(assert (=> b!1324946 (= lt!589708 (addStillContains!1164 lt!589701 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324946 (contains!8748 lt!589701 k0!1164)))

(declare-fun lt!589705 () V!53353)

(declare-fun lt!589707 () Unit!43591)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!207 ((_ BitVec 64) (_ BitVec 64) V!53353 ListLongMap!21131) Unit!43591)

(assert (=> b!1324946 (= lt!589707 (lemmaInListMapAfterAddingDiffThenInBefore!207 k0!1164 (select (arr!43159 _keys!1609) from!2000) lt!589705 lt!589701))))

(declare-fun lt!589704 () ListLongMap!21131)

(assert (=> b!1324946 (contains!8748 lt!589704 k0!1164)))

(declare-fun lt!589703 () Unit!43591)

(assert (=> b!1324946 (= lt!589703 (lemmaInListMapAfterAddingDiffThenInBefore!207 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589704))))

(declare-fun lt!589700 () ListLongMap!21131)

(assert (=> b!1324946 (contains!8748 lt!589700 k0!1164)))

(declare-fun lt!589709 () Unit!43591)

(assert (=> b!1324946 (= lt!589709 (lemmaInListMapAfterAddingDiffThenInBefore!207 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589700))))

(assert (=> b!1324946 (= lt!589700 (+!4652 lt!589704 lt!589702))))

(assert (=> b!1324946 (= lt!589702 (tuple2!23467 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324946 (= lt!589704 (+!4652 lt!589701 (tuple2!23467 (select (arr!43159 _keys!1609) from!2000) lt!589705)))))

(declare-fun get!21769 (ValueCell!17195 V!53353) V!53353)

(declare-fun dynLambda!3606 (Int (_ BitVec 64)) V!53353)

(assert (=> b!1324946 (= lt!589705 (get!21769 (select (arr!43160 _values!1337) from!2000) (dynLambda!3606 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6291 (array!89379 array!89381 (_ BitVec 32) (_ BitVec 32) V!53353 V!53353 (_ BitVec 32) Int) ListLongMap!21131)

(assert (=> b!1324946 (= lt!589701 (getCurrentListMapNoExtraKeys!6291 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55928 () Bool)

(declare-fun tp!106577 () Bool)

(declare-fun e!755436 () Bool)

(assert (=> mapNonEmpty!55928 (= mapRes!55928 (and tp!106577 e!755436))))

(declare-fun mapKey!55928 () (_ BitVec 32))

(declare-fun mapRest!55928 () (Array (_ BitVec 32) ValueCell!17195))

(declare-fun mapValue!55928 () ValueCell!17195)

(assert (=> mapNonEmpty!55928 (= (arr!43160 _values!1337) (store mapRest!55928 mapKey!55928 mapValue!55928))))

(declare-fun b!1324947 () Bool)

(declare-fun res!879100 () Bool)

(assert (=> b!1324947 (=> (not res!879100) (not e!755433))))

(assert (=> b!1324947 (= res!879100 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43710 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324948 () Bool)

(assert (=> b!1324948 (= e!755437 (and e!755434 mapRes!55928))))

(declare-fun condMapEmpty!55928 () Bool)

(declare-fun mapDefault!55928 () ValueCell!17195)

(assert (=> b!1324948 (= condMapEmpty!55928 (= (arr!43160 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17195)) mapDefault!55928)))))

(declare-fun b!1324949 () Bool)

(assert (=> b!1324949 (= e!755436 tp_is_empty!36187)))

(assert (= (and start!111934 res!879105) b!1324943))

(assert (= (and b!1324943 res!879099) b!1324942))

(assert (= (and b!1324942 res!879106) b!1324941))

(assert (= (and b!1324941 res!879103) b!1324947))

(assert (= (and b!1324947 res!879100) b!1324940))

(assert (= (and b!1324940 res!879104) b!1324945))

(assert (= (and b!1324945 res!879102) b!1324939))

(assert (= (and b!1324939 res!879101) b!1324946))

(assert (= (and b!1324948 condMapEmpty!55928) mapIsEmpty!55928))

(assert (= (and b!1324948 (not condMapEmpty!55928)) mapNonEmpty!55928))

(get-info :version)

(assert (= (and mapNonEmpty!55928 ((_ is ValueCellFull!17195) mapValue!55928)) b!1324949))

(assert (= (and b!1324948 ((_ is ValueCellFull!17195) mapDefault!55928)) b!1324944))

(assert (= start!111934 b!1324948))

(declare-fun b_lambda!23687 () Bool)

(assert (=> (not b_lambda!23687) (not b!1324946)))

(declare-fun t!44522 () Bool)

(declare-fun tb!11711 () Bool)

(assert (=> (and start!111934 (= defaultEntry!1340 defaultEntry!1340) t!44522) tb!11711))

(declare-fun result!24485 () Bool)

(assert (=> tb!11711 (= result!24485 tp_is_empty!36187)))

(assert (=> b!1324946 t!44522))

(declare-fun b_and!48897 () Bool)

(assert (= b_and!48895 (and (=> t!44522 result!24485) b_and!48897)))

(declare-fun m!1214165 () Bool)

(assert (=> start!111934 m!1214165))

(declare-fun m!1214167 () Bool)

(assert (=> start!111934 m!1214167))

(declare-fun m!1214169 () Bool)

(assert (=> start!111934 m!1214169))

(declare-fun m!1214171 () Bool)

(assert (=> b!1324946 m!1214171))

(declare-fun m!1214173 () Bool)

(assert (=> b!1324946 m!1214173))

(declare-fun m!1214175 () Bool)

(assert (=> b!1324946 m!1214175))

(declare-fun m!1214177 () Bool)

(assert (=> b!1324946 m!1214177))

(declare-fun m!1214179 () Bool)

(assert (=> b!1324946 m!1214179))

(declare-fun m!1214181 () Bool)

(assert (=> b!1324946 m!1214181))

(declare-fun m!1214183 () Bool)

(assert (=> b!1324946 m!1214183))

(declare-fun m!1214185 () Bool)

(assert (=> b!1324946 m!1214185))

(declare-fun m!1214187 () Bool)

(assert (=> b!1324946 m!1214187))

(declare-fun m!1214189 () Bool)

(assert (=> b!1324946 m!1214189))

(declare-fun m!1214191 () Bool)

(assert (=> b!1324946 m!1214191))

(declare-fun m!1214193 () Bool)

(assert (=> b!1324946 m!1214193))

(declare-fun m!1214195 () Bool)

(assert (=> b!1324946 m!1214195))

(declare-fun m!1214197 () Bool)

(assert (=> b!1324946 m!1214197))

(declare-fun m!1214199 () Bool)

(assert (=> b!1324946 m!1214199))

(declare-fun m!1214201 () Bool)

(assert (=> b!1324946 m!1214201))

(assert (=> b!1324946 m!1214187))

(declare-fun m!1214203 () Bool)

(assert (=> b!1324946 m!1214203))

(assert (=> b!1324946 m!1214191))

(declare-fun m!1214205 () Bool)

(assert (=> b!1324946 m!1214205))

(assert (=> b!1324946 m!1214185))

(assert (=> b!1324946 m!1214199))

(declare-fun m!1214207 () Bool)

(assert (=> b!1324946 m!1214207))

(declare-fun m!1214209 () Bool)

(assert (=> mapNonEmpty!55928 m!1214209))

(assert (=> b!1324939 m!1214191))

(assert (=> b!1324939 m!1214191))

(declare-fun m!1214211 () Bool)

(assert (=> b!1324939 m!1214211))

(declare-fun m!1214213 () Bool)

(assert (=> b!1324940 m!1214213))

(assert (=> b!1324940 m!1214213))

(declare-fun m!1214215 () Bool)

(assert (=> b!1324940 m!1214215))

(declare-fun m!1214217 () Bool)

(assert (=> b!1324942 m!1214217))

(assert (=> b!1324945 m!1214191))

(declare-fun m!1214219 () Bool)

(assert (=> b!1324941 m!1214219))

(check-sat (not b!1324940) (not b_lambda!23687) (not mapNonEmpty!55928) (not b!1324946) (not b!1324939) tp_is_empty!36187 (not b!1324942) (not b!1324941) b_and!48897 (not start!111934) (not b_next!30367))
(check-sat b_and!48897 (not b_next!30367))
