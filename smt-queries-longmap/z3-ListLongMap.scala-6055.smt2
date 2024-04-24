; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78544 () Bool)

(assert start!78544)

(declare-fun b_free!16741 () Bool)

(declare-fun b_next!16741 () Bool)

(assert (=> start!78544 (= b_free!16741 (not b_next!16741))))

(declare-fun tp!58512 () Bool)

(declare-fun b_and!27359 () Bool)

(assert (=> start!78544 (= tp!58512 b_and!27359)))

(declare-fun b!915106 () Bool)

(declare-fun res!616885 () Bool)

(declare-fun e!513430 () Bool)

(assert (=> b!915106 (=> res!616885 e!513430)))

(declare-datatypes ((V!30511 0))(
  ( (V!30512 (val!9630 Int)) )
))
(declare-datatypes ((tuple2!12510 0))(
  ( (tuple2!12511 (_1!6266 (_ BitVec 64)) (_2!6266 V!30511)) )
))
(declare-datatypes ((List!18325 0))(
  ( (Nil!18322) (Cons!18321 (h!19473 tuple2!12510) (t!25918 List!18325)) )
))
(declare-datatypes ((ListLongMap!11209 0))(
  ( (ListLongMap!11210 (toList!5620 List!18325)) )
))
(declare-fun lt!411764 () ListLongMap!11209)

(declare-fun lt!411762 () V!30511)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun apply!531 (ListLongMap!11209 (_ BitVec 64)) V!30511)

(assert (=> b!915106 (= res!616885 (not (= (apply!531 lt!411764 k0!1033) lt!411762)))))

(declare-fun b!915107 () Bool)

(declare-fun e!513431 () Bool)

(declare-fun tp_is_empty!19159 () Bool)

(assert (=> b!915107 (= e!513431 tp_is_empty!19159)))

(declare-fun mapIsEmpty!30477 () Bool)

(declare-fun mapRes!30477 () Bool)

(assert (=> mapIsEmpty!30477 mapRes!30477))

(declare-fun b!915108 () Bool)

(declare-fun e!513425 () Bool)

(declare-fun e!513426 () Bool)

(assert (=> b!915108 (= e!513425 (not e!513426))))

(declare-fun res!616878 () Bool)

(assert (=> b!915108 (=> res!616878 e!513426)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!54371 0))(
  ( (array!54372 (arr!26132 (Array (_ BitVec 32) (_ BitVec 64))) (size!26592 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!54371)

(assert (=> b!915108 (= res!616878 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26592 _keys!1386))))))

(declare-datatypes ((ValueCell!9098 0))(
  ( (ValueCellFull!9098 (v!12143 V!30511)) (EmptyCell!9098) )
))
(declare-datatypes ((array!54373 0))(
  ( (array!54374 (arr!26133 (Array (_ BitVec 32) ValueCell!9098)) (size!26593 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!54373)

(declare-fun defaultEntry!1160 () Int)

(declare-fun get!13733 (ValueCell!9098 V!30511) V!30511)

(declare-fun dynLambda!1412 (Int (_ BitVec 64)) V!30511)

(assert (=> b!915108 (= lt!411762 (get!13733 (select (arr!26133 _values!1152) i!717) (dynLambda!1412 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!54371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!915108 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30930 0))(
  ( (Unit!30931) )
))
(declare-fun lt!411765 () Unit!30930)

(declare-fun zeroValue!1094 () V!30511)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30511)

(declare-fun lemmaKeyInListMapIsInArray!283 (array!54371 array!54373 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 64) Int) Unit!30930)

(assert (=> b!915108 (= lt!411765 (lemmaKeyInListMapIsInArray!283 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!915109 () Bool)

(declare-fun e!513429 () Bool)

(assert (=> b!915109 (= e!513429 (and e!513431 mapRes!30477))))

(declare-fun condMapEmpty!30477 () Bool)

(declare-fun mapDefault!30477 () ValueCell!9098)

(assert (=> b!915109 (= condMapEmpty!30477 (= (arr!26133 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!9098)) mapDefault!30477)))))

(declare-fun b!915110 () Bool)

(declare-fun e!513424 () Bool)

(assert (=> b!915110 (= e!513424 e!513425)))

(declare-fun res!616884 () Bool)

(assert (=> b!915110 (=> (not res!616884) (not e!513425))))

(declare-fun lt!411763 () ListLongMap!11209)

(declare-fun contains!4680 (ListLongMap!11209 (_ BitVec 64)) Bool)

(assert (=> b!915110 (= res!616884 (contains!4680 lt!411763 k0!1033))))

(declare-fun getCurrentListMap!2881 (array!54371 array!54373 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 32) Int) ListLongMap!11209)

(assert (=> b!915110 (= lt!411763 (getCurrentListMap!2881 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!915111 () Bool)

(declare-fun res!616879 () Bool)

(assert (=> b!915111 (=> (not res!616879) (not e!513424))))

(assert (=> b!915111 (= res!616879 (and (= (size!26593 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26592 _keys!1386) (size!26593 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!915112 () Bool)

(declare-fun res!616882 () Bool)

(assert (=> b!915112 (=> (not res!616882) (not e!513425))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!915112 (= res!616882 (inRange!0 i!717 mask!1756))))

(declare-fun b!915113 () Bool)

(declare-fun res!616880 () Bool)

(assert (=> b!915113 (=> (not res!616880) (not e!513424))))

(declare-datatypes ((List!18326 0))(
  ( (Nil!18323) (Cons!18322 (h!19474 (_ BitVec 64)) (t!25919 List!18326)) )
))
(declare-fun arrayNoDuplicates!0 (array!54371 (_ BitVec 32) List!18326) Bool)

(assert (=> b!915113 (= res!616880 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18323))))

(declare-fun b!915114 () Bool)

(declare-fun e!513428 () Bool)

(assert (=> b!915114 (= e!513428 tp_is_empty!19159)))

(declare-fun mapNonEmpty!30477 () Bool)

(declare-fun tp!58511 () Bool)

(assert (=> mapNonEmpty!30477 (= mapRes!30477 (and tp!58511 e!513428))))

(declare-fun mapValue!30477 () ValueCell!9098)

(declare-fun mapKey!30477 () (_ BitVec 32))

(declare-fun mapRest!30477 () (Array (_ BitVec 32) ValueCell!9098))

(assert (=> mapNonEmpty!30477 (= (arr!26133 _values!1152) (store mapRest!30477 mapKey!30477 mapValue!30477))))

(declare-fun b!915115 () Bool)

(assert (=> b!915115 (= e!513430 (bvslt i!717 (size!26593 _values!1152)))))

(assert (=> b!915115 (= (apply!531 lt!411763 k0!1033) lt!411762)))

(declare-fun lt!411766 () Unit!30930)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!63 (array!54371 array!54373 (_ BitVec 32) (_ BitVec 32) V!30511 V!30511 (_ BitVec 64) V!30511 (_ BitVec 32) Int) Unit!30930)

(assert (=> b!915115 (= lt!411766 (lemmaListMapApplyFromThenApplyFromZero!63 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!411762 i!717 defaultEntry!1160))))

(declare-fun res!616876 () Bool)

(assert (=> start!78544 (=> (not res!616876) (not e!513424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78544 (= res!616876 (validMask!0 mask!1756))))

(assert (=> start!78544 e!513424))

(declare-fun array_inv!20500 (array!54373) Bool)

(assert (=> start!78544 (and (array_inv!20500 _values!1152) e!513429)))

(assert (=> start!78544 tp!58512))

(assert (=> start!78544 true))

(assert (=> start!78544 tp_is_empty!19159))

(declare-fun array_inv!20501 (array!54371) Bool)

(assert (=> start!78544 (array_inv!20501 _keys!1386)))

(declare-fun b!915116 () Bool)

(declare-fun res!616877 () Bool)

(assert (=> b!915116 (=> (not res!616877) (not e!513425))))

(assert (=> b!915116 (= res!616877 (and (= (select (arr!26132 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!915117 () Bool)

(assert (=> b!915117 (= e!513426 e!513430)))

(declare-fun res!616883 () Bool)

(assert (=> b!915117 (=> res!616883 e!513430)))

(assert (=> b!915117 (= res!616883 (not (contains!4680 lt!411764 k0!1033)))))

(assert (=> b!915117 (= lt!411764 (getCurrentListMap!2881 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!915118 () Bool)

(declare-fun res!616881 () Bool)

(assert (=> b!915118 (=> (not res!616881) (not e!513424))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54371 (_ BitVec 32)) Bool)

(assert (=> b!915118 (= res!616881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(assert (= (and start!78544 res!616876) b!915111))

(assert (= (and b!915111 res!616879) b!915118))

(assert (= (and b!915118 res!616881) b!915113))

(assert (= (and b!915113 res!616880) b!915110))

(assert (= (and b!915110 res!616884) b!915112))

(assert (= (and b!915112 res!616882) b!915116))

(assert (= (and b!915116 res!616877) b!915108))

(assert (= (and b!915108 (not res!616878)) b!915117))

(assert (= (and b!915117 (not res!616883)) b!915106))

(assert (= (and b!915106 (not res!616885)) b!915115))

(assert (= (and b!915109 condMapEmpty!30477) mapIsEmpty!30477))

(assert (= (and b!915109 (not condMapEmpty!30477)) mapNonEmpty!30477))

(get-info :version)

(assert (= (and mapNonEmpty!30477 ((_ is ValueCellFull!9098) mapValue!30477)) b!915114))

(assert (= (and b!915109 ((_ is ValueCellFull!9098) mapDefault!30477)) b!915107))

(assert (= start!78544 b!915109))

(declare-fun b_lambda!13385 () Bool)

(assert (=> (not b_lambda!13385) (not b!915108)))

(declare-fun t!25917 () Bool)

(declare-fun tb!5443 () Bool)

(assert (=> (and start!78544 (= defaultEntry!1160 defaultEntry!1160) t!25917) tb!5443))

(declare-fun result!10705 () Bool)

(assert (=> tb!5443 (= result!10705 tp_is_empty!19159)))

(assert (=> b!915108 t!25917))

(declare-fun b_and!27361 () Bool)

(assert (= b_and!27359 (and (=> t!25917 result!10705) b_and!27361)))

(declare-fun m!850229 () Bool)

(assert (=> b!915116 m!850229))

(declare-fun m!850231 () Bool)

(assert (=> b!915115 m!850231))

(declare-fun m!850233 () Bool)

(assert (=> b!915115 m!850233))

(declare-fun m!850235 () Bool)

(assert (=> b!915106 m!850235))

(declare-fun m!850237 () Bool)

(assert (=> b!915112 m!850237))

(declare-fun m!850239 () Bool)

(assert (=> b!915108 m!850239))

(declare-fun m!850241 () Bool)

(assert (=> b!915108 m!850241))

(declare-fun m!850243 () Bool)

(assert (=> b!915108 m!850243))

(declare-fun m!850245 () Bool)

(assert (=> b!915108 m!850245))

(assert (=> b!915108 m!850239))

(assert (=> b!915108 m!850243))

(declare-fun m!850247 () Bool)

(assert (=> b!915108 m!850247))

(declare-fun m!850249 () Bool)

(assert (=> b!915110 m!850249))

(declare-fun m!850251 () Bool)

(assert (=> b!915110 m!850251))

(declare-fun m!850253 () Bool)

(assert (=> b!915117 m!850253))

(declare-fun m!850255 () Bool)

(assert (=> b!915117 m!850255))

(declare-fun m!850257 () Bool)

(assert (=> b!915113 m!850257))

(declare-fun m!850259 () Bool)

(assert (=> b!915118 m!850259))

(declare-fun m!850261 () Bool)

(assert (=> start!78544 m!850261))

(declare-fun m!850263 () Bool)

(assert (=> start!78544 m!850263))

(declare-fun m!850265 () Bool)

(assert (=> start!78544 m!850265))

(declare-fun m!850267 () Bool)

(assert (=> mapNonEmpty!30477 m!850267))

(check-sat (not b!915110) b_and!27361 (not b!915112) (not b!915115) (not b!915108) (not b!915106) (not b!915118) (not start!78544) (not b_lambda!13385) (not b!915117) (not mapNonEmpty!30477) tp_is_empty!19159 (not b_next!16741) (not b!915113))
(check-sat b_and!27361 (not b_next!16741))
