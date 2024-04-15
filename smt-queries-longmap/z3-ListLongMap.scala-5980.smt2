; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77688 () Bool)

(assert start!77688)

(declare-fun b_free!16291 () Bool)

(declare-fun b_next!16291 () Bool)

(assert (=> start!77688 (= b_free!16291 (not b_next!16291))))

(declare-fun tp!57135 () Bool)

(declare-fun b_and!26709 () Bool)

(assert (=> start!77688 (= tp!57135 b_and!26709)))

(declare-fun b!906237 () Bool)

(declare-fun res!611648 () Bool)

(declare-fun e!507844 () Bool)

(assert (=> b!906237 (=> (not res!611648) (not e!507844))))

(declare-datatypes ((V!29911 0))(
  ( (V!29912 (val!9405 Int)) )
))
(declare-datatypes ((ValueCell!8873 0))(
  ( (ValueCellFull!8873 (v!11909 V!29911)) (EmptyCell!8873) )
))
(declare-datatypes ((array!53435 0))(
  ( (array!53436 (arr!25677 (Array (_ BitVec 32) ValueCell!8873)) (size!26138 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53435)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-datatypes ((array!53437 0))(
  ( (array!53438 (arr!25678 (Array (_ BitVec 32) (_ BitVec 64))) (size!26139 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53437)

(declare-fun mask!1756 () (_ BitVec 32))

(assert (=> b!906237 (= res!611648 (and (= (size!26138 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26139 _keys!1386) (size!26138 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906238 () Bool)

(declare-fun e!507843 () Bool)

(assert (=> b!906238 (= e!507844 e!507843)))

(declare-fun res!611646 () Bool)

(assert (=> b!906238 (=> (not res!611646) (not e!507843))))

(declare-datatypes ((tuple2!12262 0))(
  ( (tuple2!12263 (_1!6142 (_ BitVec 64)) (_2!6142 V!29911)) )
))
(declare-datatypes ((List!18051 0))(
  ( (Nil!18048) (Cons!18047 (h!19193 tuple2!12262) (t!25505 List!18051)) )
))
(declare-datatypes ((ListLongMap!10949 0))(
  ( (ListLongMap!10950 (toList!5490 List!18051)) )
))
(declare-fun lt!408697 () ListLongMap!10949)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4496 (ListLongMap!10949 (_ BitVec 64)) Bool)

(assert (=> b!906238 (= res!611646 (contains!4496 lt!408697 k0!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29911)

(declare-fun minValue!1094 () V!29911)

(declare-fun getCurrentListMap!2700 (array!53437 array!53435 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 32) Int) ListLongMap!10949)

(assert (=> b!906238 (= lt!408697 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun mapIsEmpty!29776 () Bool)

(declare-fun mapRes!29776 () Bool)

(assert (=> mapIsEmpty!29776 mapRes!29776))

(declare-fun b!906239 () Bool)

(declare-fun res!611644 () Bool)

(assert (=> b!906239 (=> (not res!611644) (not e!507844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53437 (_ BitVec 32)) Bool)

(assert (=> b!906239 (= res!611644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906240 () Bool)

(declare-fun e!507842 () Bool)

(declare-fun e!507838 () Bool)

(assert (=> b!906240 (= e!507842 e!507838)))

(declare-fun res!611645 () Bool)

(assert (=> b!906240 (=> res!611645 e!507838)))

(declare-fun lt!408700 () ListLongMap!10949)

(assert (=> b!906240 (= res!611645 (not (contains!4496 lt!408700 k0!1033)))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906240 (= lt!408700 (getCurrentListMap!2700 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!906241 () Bool)

(assert (=> b!906241 (= e!507843 (not e!507842))))

(declare-fun res!611647 () Bool)

(assert (=> b!906241 (=> res!611647 e!507842)))

(assert (=> b!906241 (= res!611647 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26139 _keys!1386))))))

(declare-fun lt!408698 () V!29911)

(declare-fun get!13503 (ValueCell!8873 V!29911) V!29911)

(declare-fun dynLambda!1340 (Int (_ BitVec 64)) V!29911)

(assert (=> b!906241 (= lt!408698 (get!13503 (select (arr!25677 _values!1152) i!717) (dynLambda!1340 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906241 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30680 0))(
  ( (Unit!30681) )
))
(declare-fun lt!408699 () Unit!30680)

(declare-fun lemmaKeyInListMapIsInArray!216 (array!53437 array!53435 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) Int) Unit!30680)

(assert (=> b!906241 (= lt!408699 (lemmaKeyInListMapIsInArray!216 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906242 () Bool)

(assert (=> b!906242 (= e!507838 true)))

(declare-fun apply!466 (ListLongMap!10949 (_ BitVec 64)) V!29911)

(assert (=> b!906242 (= (apply!466 lt!408697 k0!1033) lt!408698)))

(declare-fun lt!408696 () Unit!30680)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!27 (array!53437 array!53435 (_ BitVec 32) (_ BitVec 32) V!29911 V!29911 (_ BitVec 64) V!29911 (_ BitVec 32) Int) Unit!30680)

(assert (=> b!906242 (= lt!408696 (lemmaListMapApplyFromThenApplyFromZero!27 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408698 i!717 defaultEntry!1160))))

(declare-fun b!906243 () Bool)

(declare-fun e!507841 () Bool)

(declare-fun tp_is_empty!18709 () Bool)

(assert (=> b!906243 (= e!507841 tp_is_empty!18709)))

(declare-fun b!906244 () Bool)

(declare-fun e!507845 () Bool)

(assert (=> b!906244 (= e!507845 (and e!507841 mapRes!29776))))

(declare-fun condMapEmpty!29776 () Bool)

(declare-fun mapDefault!29776 () ValueCell!8873)

(assert (=> b!906244 (= condMapEmpty!29776 (= (arr!25677 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8873)) mapDefault!29776)))))

(declare-fun res!611643 () Bool)

(assert (=> start!77688 (=> (not res!611643) (not e!507844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77688 (= res!611643 (validMask!0 mask!1756))))

(assert (=> start!77688 e!507844))

(declare-fun array_inv!20154 (array!53435) Bool)

(assert (=> start!77688 (and (array_inv!20154 _values!1152) e!507845)))

(assert (=> start!77688 tp!57135))

(assert (=> start!77688 true))

(assert (=> start!77688 tp_is_empty!18709))

(declare-fun array_inv!20155 (array!53437) Bool)

(assert (=> start!77688 (array_inv!20155 _keys!1386)))

(declare-fun b!906245 () Bool)

(declare-fun res!611649 () Bool)

(assert (=> b!906245 (=> (not res!611649) (not e!507843))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906245 (= res!611649 (inRange!0 i!717 mask!1756))))

(declare-fun b!906246 () Bool)

(declare-fun e!507840 () Bool)

(assert (=> b!906246 (= e!507840 tp_is_empty!18709)))

(declare-fun b!906247 () Bool)

(declare-fun res!611642 () Bool)

(assert (=> b!906247 (=> res!611642 e!507838)))

(assert (=> b!906247 (= res!611642 (not (= (apply!466 lt!408700 k0!1033) lt!408698)))))

(declare-fun b!906248 () Bool)

(declare-fun res!611640 () Bool)

(assert (=> b!906248 (=> (not res!611640) (not e!507844))))

(declare-datatypes ((List!18052 0))(
  ( (Nil!18049) (Cons!18048 (h!19194 (_ BitVec 64)) (t!25506 List!18052)) )
))
(declare-fun arrayNoDuplicates!0 (array!53437 (_ BitVec 32) List!18052) Bool)

(assert (=> b!906248 (= res!611640 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18049))))

(declare-fun mapNonEmpty!29776 () Bool)

(declare-fun tp!57136 () Bool)

(assert (=> mapNonEmpty!29776 (= mapRes!29776 (and tp!57136 e!507840))))

(declare-fun mapValue!29776 () ValueCell!8873)

(declare-fun mapKey!29776 () (_ BitVec 32))

(declare-fun mapRest!29776 () (Array (_ BitVec 32) ValueCell!8873))

(assert (=> mapNonEmpty!29776 (= (arr!25677 _values!1152) (store mapRest!29776 mapKey!29776 mapValue!29776))))

(declare-fun b!906249 () Bool)

(declare-fun res!611641 () Bool)

(assert (=> b!906249 (=> (not res!611641) (not e!507843))))

(assert (=> b!906249 (= res!611641 (and (= (select (arr!25678 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!77688 res!611643) b!906237))

(assert (= (and b!906237 res!611648) b!906239))

(assert (= (and b!906239 res!611644) b!906248))

(assert (= (and b!906248 res!611640) b!906238))

(assert (= (and b!906238 res!611646) b!906245))

(assert (= (and b!906245 res!611649) b!906249))

(assert (= (and b!906249 res!611641) b!906241))

(assert (= (and b!906241 (not res!611647)) b!906240))

(assert (= (and b!906240 (not res!611645)) b!906247))

(assert (= (and b!906247 (not res!611642)) b!906242))

(assert (= (and b!906244 condMapEmpty!29776) mapIsEmpty!29776))

(assert (= (and b!906244 (not condMapEmpty!29776)) mapNonEmpty!29776))

(get-info :version)

(assert (= (and mapNonEmpty!29776 ((_ is ValueCellFull!8873) mapValue!29776)) b!906246))

(assert (= (and b!906244 ((_ is ValueCellFull!8873) mapDefault!29776)) b!906243))

(assert (= start!77688 b!906244))

(declare-fun b_lambda!13147 () Bool)

(assert (=> (not b_lambda!13147) (not b!906241)))

(declare-fun t!25504 () Bool)

(declare-fun tb!5305 () Bool)

(assert (=> (and start!77688 (= defaultEntry!1160 defaultEntry!1160) t!25504) tb!5305))

(declare-fun result!10413 () Bool)

(assert (=> tb!5305 (= result!10413 tp_is_empty!18709)))

(assert (=> b!906241 t!25504))

(declare-fun b_and!26711 () Bool)

(assert (= b_and!26709 (and (=> t!25504 result!10413) b_and!26711)))

(declare-fun m!841097 () Bool)

(assert (=> b!906239 m!841097))

(declare-fun m!841099 () Bool)

(assert (=> b!906240 m!841099))

(declare-fun m!841101 () Bool)

(assert (=> b!906240 m!841101))

(declare-fun m!841103 () Bool)

(assert (=> b!906249 m!841103))

(declare-fun m!841105 () Bool)

(assert (=> b!906247 m!841105))

(declare-fun m!841107 () Bool)

(assert (=> b!906248 m!841107))

(declare-fun m!841109 () Bool)

(assert (=> mapNonEmpty!29776 m!841109))

(declare-fun m!841111 () Bool)

(assert (=> b!906241 m!841111))

(declare-fun m!841113 () Bool)

(assert (=> b!906241 m!841113))

(declare-fun m!841115 () Bool)

(assert (=> b!906241 m!841115))

(declare-fun m!841117 () Bool)

(assert (=> b!906241 m!841117))

(assert (=> b!906241 m!841111))

(assert (=> b!906241 m!841115))

(declare-fun m!841119 () Bool)

(assert (=> b!906241 m!841119))

(declare-fun m!841121 () Bool)

(assert (=> b!906245 m!841121))

(declare-fun m!841123 () Bool)

(assert (=> b!906242 m!841123))

(declare-fun m!841125 () Bool)

(assert (=> b!906242 m!841125))

(declare-fun m!841127 () Bool)

(assert (=> b!906238 m!841127))

(declare-fun m!841129 () Bool)

(assert (=> b!906238 m!841129))

(declare-fun m!841131 () Bool)

(assert (=> start!77688 m!841131))

(declare-fun m!841133 () Bool)

(assert (=> start!77688 m!841133))

(declare-fun m!841135 () Bool)

(assert (=> start!77688 m!841135))

(check-sat (not b!906245) (not b!906242) (not b!906238) (not b!906248) (not b!906247) (not b_next!16291) b_and!26711 (not mapNonEmpty!29776) (not b!906239) tp_is_empty!18709 (not b!906240) (not b!906241) (not start!77688) (not b_lambda!13147))
(check-sat b_and!26711 (not b_next!16291))
