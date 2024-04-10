; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77744 () Bool)

(assert start!77744)

(declare-fun b_free!16329 () Bool)

(declare-fun b_next!16329 () Bool)

(assert (=> start!77744 (= b_free!16329 (not b_next!16329))))

(declare-fun tp!57249 () Bool)

(declare-fun b_and!26811 () Bool)

(assert (=> start!77744 (= tp!57249 b_and!26811)))

(declare-fun b!907255 () Bool)

(declare-fun e!508443 () Bool)

(declare-fun e!508448 () Bool)

(assert (=> b!907255 (= e!508443 (not e!508448))))

(declare-fun res!612322 () Bool)

(assert (=> b!907255 (=> res!612322 e!508448)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53530 0))(
  ( (array!53531 (arr!25724 (Array (_ BitVec 32) (_ BitVec 64))) (size!26183 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53530)

(assert (=> b!907255 (= res!612322 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26183 _keys!1386))))))

(declare-datatypes ((V!29961 0))(
  ( (V!29962 (val!9424 Int)) )
))
(declare-datatypes ((ValueCell!8892 0))(
  ( (ValueCellFull!8892 (v!11929 V!29961)) (EmptyCell!8892) )
))
(declare-datatypes ((array!53532 0))(
  ( (array!53533 (arr!25725 (Array (_ BitVec 32) ValueCell!8892)) (size!26184 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53532)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409220 () V!29961)

(declare-fun get!13531 (ValueCell!8892 V!29961) V!29961)

(declare-fun dynLambda!1361 (Int (_ BitVec 64)) V!29961)

(assert (=> b!907255 (= lt!409220 (get!13531 (select (arr!25725 _values!1152) i!717) (dynLambda!1361 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53530 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907255 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30790 0))(
  ( (Unit!30791) )
))
(declare-fun lt!409218 () Unit!30790)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29961)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29961)

(declare-fun lemmaKeyInListMapIsInArray!233 (array!53530 array!53532 (_ BitVec 32) (_ BitVec 32) V!29961 V!29961 (_ BitVec 64) Int) Unit!30790)

(assert (=> b!907255 (= lt!409218 (lemmaKeyInListMapIsInArray!233 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907256 () Bool)

(declare-fun res!612323 () Bool)

(assert (=> b!907256 (=> (not res!612323) (not e!508443))))

(assert (=> b!907256 (= res!612323 (and (= (select (arr!25724 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29833 () Bool)

(declare-fun mapRes!29833 () Bool)

(declare-fun tp!57248 () Bool)

(declare-fun e!508449 () Bool)

(assert (=> mapNonEmpty!29833 (= mapRes!29833 (and tp!57248 e!508449))))

(declare-fun mapRest!29833 () (Array (_ BitVec 32) ValueCell!8892))

(declare-fun mapKey!29833 () (_ BitVec 32))

(declare-fun mapValue!29833 () ValueCell!8892)

(assert (=> mapNonEmpty!29833 (= (arr!25725 _values!1152) (store mapRest!29833 mapKey!29833 mapValue!29833))))

(declare-fun b!907257 () Bool)

(declare-fun res!612326 () Bool)

(declare-fun e!508442 () Bool)

(assert (=> b!907257 (=> (not res!612326) (not e!508442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53530 (_ BitVec 32)) Bool)

(assert (=> b!907257 (= res!612326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!907258 () Bool)

(declare-fun e!508445 () Bool)

(declare-fun e!508446 () Bool)

(assert (=> b!907258 (= e!508445 (and e!508446 mapRes!29833))))

(declare-fun condMapEmpty!29833 () Bool)

(declare-fun mapDefault!29833 () ValueCell!8892)

(assert (=> b!907258 (= condMapEmpty!29833 (= (arr!25725 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8892)) mapDefault!29833)))))

(declare-fun res!612321 () Bool)

(assert (=> start!77744 (=> (not res!612321) (not e!508442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77744 (= res!612321 (validMask!0 mask!1756))))

(assert (=> start!77744 e!508442))

(declare-fun array_inv!20146 (array!53532) Bool)

(assert (=> start!77744 (and (array_inv!20146 _values!1152) e!508445)))

(assert (=> start!77744 tp!57249))

(assert (=> start!77744 true))

(declare-fun tp_is_empty!18747 () Bool)

(assert (=> start!77744 tp_is_empty!18747))

(declare-fun array_inv!20147 (array!53530) Bool)

(assert (=> start!77744 (array_inv!20147 _keys!1386)))

(declare-fun b!907259 () Bool)

(declare-fun res!612328 () Bool)

(assert (=> b!907259 (=> (not res!612328) (not e!508443))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907259 (= res!612328 (inRange!0 i!717 mask!1756))))

(declare-fun b!907260 () Bool)

(assert (=> b!907260 (= e!508449 tp_is_empty!18747)))

(declare-fun b!907261 () Bool)

(declare-fun res!612320 () Bool)

(assert (=> b!907261 (=> (not res!612320) (not e!508442))))

(declare-datatypes ((List!18074 0))(
  ( (Nil!18071) (Cons!18070 (h!19216 (_ BitVec 64)) (t!25575 List!18074)) )
))
(declare-fun arrayNoDuplicates!0 (array!53530 (_ BitVec 32) List!18074) Bool)

(assert (=> b!907261 (= res!612320 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18071))))

(declare-fun b!907262 () Bool)

(declare-fun e!508444 () Bool)

(assert (=> b!907262 (= e!508448 e!508444)))

(declare-fun res!612327 () Bool)

(assert (=> b!907262 (=> res!612327 e!508444)))

(declare-datatypes ((tuple2!12274 0))(
  ( (tuple2!12275 (_1!6148 (_ BitVec 64)) (_2!6148 V!29961)) )
))
(declare-datatypes ((List!18075 0))(
  ( (Nil!18072) (Cons!18071 (h!19217 tuple2!12274) (t!25576 List!18075)) )
))
(declare-datatypes ((ListLongMap!10971 0))(
  ( (ListLongMap!10972 (toList!5501 List!18075)) )
))
(declare-fun lt!409219 () ListLongMap!10971)

(declare-fun contains!4545 (ListLongMap!10971 (_ BitVec 64)) Bool)

(assert (=> b!907262 (= res!612327 (not (contains!4545 lt!409219 k0!1033)))))

(declare-fun getCurrentListMap!2766 (array!53530 array!53532 (_ BitVec 32) (_ BitVec 32) V!29961 V!29961 (_ BitVec 32) Int) ListLongMap!10971)

(assert (=> b!907262 (= lt!409219 (getCurrentListMap!2766 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907263 () Bool)

(declare-fun res!612324 () Bool)

(assert (=> b!907263 (=> res!612324 e!508444)))

(declare-fun apply!485 (ListLongMap!10971 (_ BitVec 64)) V!29961)

(assert (=> b!907263 (= res!612324 (not (= (apply!485 lt!409219 k0!1033) lt!409220)))))

(declare-fun b!907264 () Bool)

(assert (=> b!907264 (= e!508444 true)))

(declare-fun lt!409221 () ListLongMap!10971)

(assert (=> b!907264 (= (apply!485 lt!409221 k0!1033) lt!409220)))

(declare-fun lt!409217 () Unit!30790)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!38 (array!53530 array!53532 (_ BitVec 32) (_ BitVec 32) V!29961 V!29961 (_ BitVec 64) V!29961 (_ BitVec 32) Int) Unit!30790)

(assert (=> b!907264 (= lt!409217 (lemmaListMapApplyFromThenApplyFromZero!38 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409220 i!717 defaultEntry!1160))))

(declare-fun b!907265 () Bool)

(assert (=> b!907265 (= e!508446 tp_is_empty!18747)))

(declare-fun mapIsEmpty!29833 () Bool)

(assert (=> mapIsEmpty!29833 mapRes!29833))

(declare-fun b!907266 () Bool)

(assert (=> b!907266 (= e!508442 e!508443)))

(declare-fun res!612329 () Bool)

(assert (=> b!907266 (=> (not res!612329) (not e!508443))))

(assert (=> b!907266 (= res!612329 (contains!4545 lt!409221 k0!1033))))

(assert (=> b!907266 (= lt!409221 (getCurrentListMap!2766 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907267 () Bool)

(declare-fun res!612325 () Bool)

(assert (=> b!907267 (=> (not res!612325) (not e!508442))))

(assert (=> b!907267 (= res!612325 (and (= (size!26184 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26183 _keys!1386) (size!26184 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(assert (= (and start!77744 res!612321) b!907267))

(assert (= (and b!907267 res!612325) b!907257))

(assert (= (and b!907257 res!612326) b!907261))

(assert (= (and b!907261 res!612320) b!907266))

(assert (= (and b!907266 res!612329) b!907259))

(assert (= (and b!907259 res!612328) b!907256))

(assert (= (and b!907256 res!612323) b!907255))

(assert (= (and b!907255 (not res!612322)) b!907262))

(assert (= (and b!907262 (not res!612327)) b!907263))

(assert (= (and b!907263 (not res!612324)) b!907264))

(assert (= (and b!907258 condMapEmpty!29833) mapIsEmpty!29833))

(assert (= (and b!907258 (not condMapEmpty!29833)) mapNonEmpty!29833))

(get-info :version)

(assert (= (and mapNonEmpty!29833 ((_ is ValueCellFull!8892) mapValue!29833)) b!907260))

(assert (= (and b!907258 ((_ is ValueCellFull!8892) mapDefault!29833)) b!907265))

(assert (= start!77744 b!907258))

(declare-fun b_lambda!13203 () Bool)

(assert (=> (not b_lambda!13203) (not b!907255)))

(declare-fun t!25574 () Bool)

(declare-fun tb!5351 () Bool)

(assert (=> (and start!77744 (= defaultEntry!1160 defaultEntry!1160) t!25574) tb!5351))

(declare-fun result!10497 () Bool)

(assert (=> tb!5351 (= result!10497 tp_is_empty!18747)))

(assert (=> b!907255 t!25574))

(declare-fun b_and!26813 () Bool)

(assert (= b_and!26811 (and (=> t!25574 result!10497) b_and!26813)))

(declare-fun m!842615 () Bool)

(assert (=> b!907264 m!842615))

(declare-fun m!842617 () Bool)

(assert (=> b!907264 m!842617))

(declare-fun m!842619 () Bool)

(assert (=> mapNonEmpty!29833 m!842619))

(declare-fun m!842621 () Bool)

(assert (=> b!907257 m!842621))

(declare-fun m!842623 () Bool)

(assert (=> b!907262 m!842623))

(declare-fun m!842625 () Bool)

(assert (=> b!907262 m!842625))

(declare-fun m!842627 () Bool)

(assert (=> start!77744 m!842627))

(declare-fun m!842629 () Bool)

(assert (=> start!77744 m!842629))

(declare-fun m!842631 () Bool)

(assert (=> start!77744 m!842631))

(declare-fun m!842633 () Bool)

(assert (=> b!907261 m!842633))

(declare-fun m!842635 () Bool)

(assert (=> b!907263 m!842635))

(declare-fun m!842637 () Bool)

(assert (=> b!907266 m!842637))

(declare-fun m!842639 () Bool)

(assert (=> b!907266 m!842639))

(declare-fun m!842641 () Bool)

(assert (=> b!907256 m!842641))

(declare-fun m!842643 () Bool)

(assert (=> b!907255 m!842643))

(declare-fun m!842645 () Bool)

(assert (=> b!907255 m!842645))

(declare-fun m!842647 () Bool)

(assert (=> b!907255 m!842647))

(declare-fun m!842649 () Bool)

(assert (=> b!907255 m!842649))

(assert (=> b!907255 m!842643))

(assert (=> b!907255 m!842647))

(declare-fun m!842651 () Bool)

(assert (=> b!907255 m!842651))

(declare-fun m!842653 () Bool)

(assert (=> b!907259 m!842653))

(check-sat (not b!907255) (not start!77744) (not b!907266) (not b!907264) tp_is_empty!18747 (not mapNonEmpty!29833) (not b!907261) (not b!907259) (not b!907262) b_and!26813 (not b_next!16329) (not b!907257) (not b!907263) (not b_lambda!13203))
(check-sat b_and!26813 (not b_next!16329))
