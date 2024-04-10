; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113128 () Bool)

(assert start!113128)

(declare-fun b_free!31179 () Bool)

(declare-fun b_next!31179 () Bool)

(assert (=> start!113128 (= b_free!31179 (not b_next!31179))))

(declare-fun tp!109342 () Bool)

(declare-fun b_and!50265 () Bool)

(assert (=> start!113128 (= tp!109342 b_and!50265)))

(declare-fun b!1341295 () Bool)

(declare-fun res!889821 () Bool)

(declare-fun e!763823 () Bool)

(assert (=> b!1341295 (=> (not res!889821) (not e!763823))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341295 (= res!889821 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341296 () Bool)

(declare-fun res!889820 () Bool)

(assert (=> b!1341296 (=> (not res!889820) (not e!763823))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91210 0))(
  ( (array!91211 (arr!44061 (Array (_ BitVec 32) (_ BitVec 64))) (size!44611 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91210)

(declare-datatypes ((V!54675 0))(
  ( (V!54676 (val!18664 Int)) )
))
(declare-datatypes ((ValueCell!17691 0))(
  ( (ValueCellFull!17691 (v!21312 V!54675)) (EmptyCell!17691) )
))
(declare-datatypes ((array!91212 0))(
  ( (array!91213 (arr!44062 (Array (_ BitVec 32) ValueCell!17691)) (size!44612 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91212)

(assert (=> b!1341296 (= res!889820 (and (= (size!44612 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44611 _keys!1571) (size!44612 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341297 () Bool)

(declare-fun res!889818 () Bool)

(assert (=> b!1341297 (=> (not res!889818) (not e!763823))))

(declare-fun minValue!1245 () V!54675)

(declare-fun zeroValue!1245 () V!54675)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24030 0))(
  ( (tuple2!24031 (_1!12026 (_ BitVec 64)) (_2!12026 V!54675)) )
))
(declare-datatypes ((List!31190 0))(
  ( (Nil!31187) (Cons!31186 (h!32395 tuple2!24030) (t!45580 List!31190)) )
))
(declare-datatypes ((ListLongMap!21687 0))(
  ( (ListLongMap!21688 (toList!10859 List!31190)) )
))
(declare-fun contains!9035 (ListLongMap!21687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5824 (array!91210 array!91212 (_ BitVec 32) (_ BitVec 32) V!54675 V!54675 (_ BitVec 32) Int) ListLongMap!21687)

(assert (=> b!1341297 (= res!889818 (contains!9035 (getCurrentListMap!5824 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!889815 () Bool)

(assert (=> start!113128 (=> (not res!889815) (not e!763823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113128 (= res!889815 (validMask!0 mask!1977))))

(assert (=> start!113128 e!763823))

(declare-fun tp_is_empty!37179 () Bool)

(assert (=> start!113128 tp_is_empty!37179))

(assert (=> start!113128 true))

(declare-fun array_inv!33215 (array!91210) Bool)

(assert (=> start!113128 (array_inv!33215 _keys!1571)))

(declare-fun e!763819 () Bool)

(declare-fun array_inv!33216 (array!91212) Bool)

(assert (=> start!113128 (and (array_inv!33216 _values!1303) e!763819)))

(assert (=> start!113128 tp!109342))

(declare-fun b!1341298 () Bool)

(declare-fun e!763822 () Bool)

(declare-fun mapRes!57475 () Bool)

(assert (=> b!1341298 (= e!763819 (and e!763822 mapRes!57475))))

(declare-fun condMapEmpty!57475 () Bool)

(declare-fun mapDefault!57475 () ValueCell!17691)

(assert (=> b!1341298 (= condMapEmpty!57475 (= (arr!44062 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17691)) mapDefault!57475)))))

(declare-fun b!1341299 () Bool)

(declare-fun res!889814 () Bool)

(assert (=> b!1341299 (=> (not res!889814) (not e!763823))))

(assert (=> b!1341299 (= res!889814 (not (= (select (arr!44061 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341300 () Bool)

(assert (=> b!1341300 (= e!763822 tp_is_empty!37179)))

(declare-fun b!1341301 () Bool)

(declare-fun e!763821 () Bool)

(assert (=> b!1341301 (= e!763821 tp_is_empty!37179)))

(declare-fun b!1341302 () Bool)

(declare-fun res!889816 () Bool)

(assert (=> b!1341302 (=> (not res!889816) (not e!763823))))

(assert (=> b!1341302 (= res!889816 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44611 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341303 () Bool)

(declare-fun res!889813 () Bool)

(assert (=> b!1341303 (=> (not res!889813) (not e!763823))))

(declare-datatypes ((List!31191 0))(
  ( (Nil!31188) (Cons!31187 (h!32396 (_ BitVec 64)) (t!45581 List!31191)) )
))
(declare-fun arrayNoDuplicates!0 (array!91210 (_ BitVec 32) List!31191) Bool)

(assert (=> b!1341303 (= res!889813 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31188))))

(declare-fun b!1341304 () Bool)

(declare-fun res!889817 () Bool)

(assert (=> b!1341304 (=> (not res!889817) (not e!763823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341304 (= res!889817 (validKeyInArray!0 (select (arr!44061 _keys!1571) from!1960)))))

(declare-fun b!1341305 () Bool)

(assert (=> b!1341305 (= e!763823 (not true))))

(declare-fun lt!594123 () ListLongMap!21687)

(assert (=> b!1341305 (contains!9035 lt!594123 k0!1142)))

(declare-datatypes ((Unit!44023 0))(
  ( (Unit!44024) )
))
(declare-fun lt!594122 () Unit!44023)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!342 ((_ BitVec 64) (_ BitVec 64) V!54675 ListLongMap!21687) Unit!44023)

(assert (=> b!1341305 (= lt!594122 (lemmaInListMapAfterAddingDiffThenInBefore!342 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594123))))

(declare-fun +!4773 (ListLongMap!21687 tuple2!24030) ListLongMap!21687)

(declare-fun getCurrentListMapNoExtraKeys!6415 (array!91210 array!91212 (_ BitVec 32) (_ BitVec 32) V!54675 V!54675 (_ BitVec 32) Int) ListLongMap!21687)

(declare-fun get!22238 (ValueCell!17691 V!54675) V!54675)

(declare-fun dynLambda!3712 (Int (_ BitVec 64)) V!54675)

(assert (=> b!1341305 (= lt!594123 (+!4773 (getCurrentListMapNoExtraKeys!6415 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24031 (select (arr!44061 _keys!1571) from!1960) (get!22238 (select (arr!44062 _values!1303) from!1960) (dynLambda!3712 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!57475 () Bool)

(declare-fun tp!109341 () Bool)

(assert (=> mapNonEmpty!57475 (= mapRes!57475 (and tp!109341 e!763821))))

(declare-fun mapKey!57475 () (_ BitVec 32))

(declare-fun mapValue!57475 () ValueCell!17691)

(declare-fun mapRest!57475 () (Array (_ BitVec 32) ValueCell!17691))

(assert (=> mapNonEmpty!57475 (= (arr!44062 _values!1303) (store mapRest!57475 mapKey!57475 mapValue!57475))))

(declare-fun mapIsEmpty!57475 () Bool)

(assert (=> mapIsEmpty!57475 mapRes!57475))

(declare-fun b!1341306 () Bool)

(declare-fun res!889819 () Bool)

(assert (=> b!1341306 (=> (not res!889819) (not e!763823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91210 (_ BitVec 32)) Bool)

(assert (=> b!1341306 (= res!889819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113128 res!889815) b!1341296))

(assert (= (and b!1341296 res!889820) b!1341306))

(assert (= (and b!1341306 res!889819) b!1341303))

(assert (= (and b!1341303 res!889813) b!1341302))

(assert (= (and b!1341302 res!889816) b!1341297))

(assert (= (and b!1341297 res!889818) b!1341299))

(assert (= (and b!1341299 res!889814) b!1341304))

(assert (= (and b!1341304 res!889817) b!1341295))

(assert (= (and b!1341295 res!889821) b!1341305))

(assert (= (and b!1341298 condMapEmpty!57475) mapIsEmpty!57475))

(assert (= (and b!1341298 (not condMapEmpty!57475)) mapNonEmpty!57475))

(get-info :version)

(assert (= (and mapNonEmpty!57475 ((_ is ValueCellFull!17691) mapValue!57475)) b!1341301))

(assert (= (and b!1341298 ((_ is ValueCellFull!17691) mapDefault!57475)) b!1341300))

(assert (= start!113128 b!1341298))

(declare-fun b_lambda!24355 () Bool)

(assert (=> (not b_lambda!24355) (not b!1341305)))

(declare-fun t!45579 () Bool)

(declare-fun tb!12193 () Bool)

(assert (=> (and start!113128 (= defaultEntry!1306 defaultEntry!1306) t!45579) tb!12193))

(declare-fun result!25477 () Bool)

(assert (=> tb!12193 (= result!25477 tp_is_empty!37179)))

(assert (=> b!1341305 t!45579))

(declare-fun b_and!50267 () Bool)

(assert (= b_and!50265 (and (=> t!45579 result!25477) b_and!50267)))

(declare-fun m!1228961 () Bool)

(assert (=> b!1341305 m!1228961))

(declare-fun m!1228963 () Bool)

(assert (=> b!1341305 m!1228963))

(declare-fun m!1228965 () Bool)

(assert (=> b!1341305 m!1228965))

(declare-fun m!1228967 () Bool)

(assert (=> b!1341305 m!1228967))

(assert (=> b!1341305 m!1228961))

(declare-fun m!1228969 () Bool)

(assert (=> b!1341305 m!1228969))

(assert (=> b!1341305 m!1228963))

(declare-fun m!1228971 () Bool)

(assert (=> b!1341305 m!1228971))

(declare-fun m!1228973 () Bool)

(assert (=> b!1341305 m!1228973))

(declare-fun m!1228975 () Bool)

(assert (=> b!1341305 m!1228975))

(assert (=> b!1341305 m!1228965))

(assert (=> b!1341304 m!1228973))

(assert (=> b!1341304 m!1228973))

(declare-fun m!1228977 () Bool)

(assert (=> b!1341304 m!1228977))

(declare-fun m!1228979 () Bool)

(assert (=> b!1341303 m!1228979))

(declare-fun m!1228981 () Bool)

(assert (=> b!1341306 m!1228981))

(declare-fun m!1228983 () Bool)

(assert (=> b!1341297 m!1228983))

(assert (=> b!1341297 m!1228983))

(declare-fun m!1228985 () Bool)

(assert (=> b!1341297 m!1228985))

(assert (=> b!1341299 m!1228973))

(declare-fun m!1228987 () Bool)

(assert (=> mapNonEmpty!57475 m!1228987))

(declare-fun m!1228989 () Bool)

(assert (=> start!113128 m!1228989))

(declare-fun m!1228991 () Bool)

(assert (=> start!113128 m!1228991))

(declare-fun m!1228993 () Bool)

(assert (=> start!113128 m!1228993))

(check-sat (not b!1341303) (not b!1341306) b_and!50267 (not b!1341305) (not b_lambda!24355) (not mapNonEmpty!57475) tp_is_empty!37179 (not b_next!31179) (not b!1341297) (not b!1341304) (not start!113128))
(check-sat b_and!50267 (not b_next!31179))
