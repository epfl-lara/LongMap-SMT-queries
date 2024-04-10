; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77648 () Bool)

(assert start!77648)

(declare-fun b_free!16233 () Bool)

(declare-fun b_next!16233 () Bool)

(assert (=> start!77648 (= b_free!16233 (not b_next!16233))))

(declare-fun tp!56961 () Bool)

(declare-fun b_and!26619 () Bool)

(assert (=> start!77648 (= tp!56961 b_and!26619)))

(declare-fun res!610885 () Bool)

(declare-fun e!507292 () Bool)

(assert (=> start!77648 (=> (not res!610885) (not e!507292))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77648 (= res!610885 (validMask!0 mask!1756))))

(assert (=> start!77648 e!507292))

(declare-datatypes ((V!29833 0))(
  ( (V!29834 (val!9376 Int)) )
))
(declare-datatypes ((ValueCell!8844 0))(
  ( (ValueCellFull!8844 (v!11881 V!29833)) (EmptyCell!8844) )
))
(declare-datatypes ((array!53346 0))(
  ( (array!53347 (arr!25632 (Array (_ BitVec 32) ValueCell!8844)) (size!26091 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53346)

(declare-fun e!507296 () Bool)

(declare-fun array_inv!20082 (array!53346) Bool)

(assert (=> start!77648 (and (array_inv!20082 _values!1152) e!507296)))

(assert (=> start!77648 tp!56961))

(assert (=> start!77648 true))

(declare-fun tp_is_empty!18651 () Bool)

(assert (=> start!77648 tp_is_empty!18651))

(declare-datatypes ((array!53348 0))(
  ( (array!53349 (arr!25633 (Array (_ BitVec 32) (_ BitVec 64))) (size!26092 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53348)

(declare-fun array_inv!20083 (array!53348) Bool)

(assert (=> start!77648 (array_inv!20083 _keys!1386)))

(declare-fun b!905287 () Bool)

(declare-fun res!610882 () Bool)

(declare-fun e!507290 () Bool)

(assert (=> b!905287 (=> (not res!610882) (not e!507290))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905287 (= res!610882 (inRange!0 i!717 mask!1756))))

(declare-fun b!905288 () Bool)

(declare-fun e!507293 () Bool)

(declare-fun mapRes!29689 () Bool)

(assert (=> b!905288 (= e!507296 (and e!507293 mapRes!29689))))

(declare-fun condMapEmpty!29689 () Bool)

(declare-fun mapDefault!29689 () ValueCell!8844)

(assert (=> b!905288 (= condMapEmpty!29689 (= (arr!25632 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8844)) mapDefault!29689)))))

(declare-fun b!905289 () Bool)

(assert (=> b!905289 (= e!507293 tp_is_empty!18651)))

(declare-fun b!905290 () Bool)

(declare-fun res!610880 () Bool)

(assert (=> b!905290 (=> (not res!610880) (not e!507290))))

(declare-fun k0!1033 () (_ BitVec 64))

(assert (=> b!905290 (= res!610880 (and (= (select (arr!25633 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905291 () Bool)

(declare-fun res!610886 () Bool)

(assert (=> b!905291 (=> (not res!610886) (not e!507292))))

(declare-datatypes ((List!18005 0))(
  ( (Nil!18002) (Cons!18001 (h!19147 (_ BitVec 64)) (t!25410 List!18005)) )
))
(declare-fun arrayNoDuplicates!0 (array!53348 (_ BitVec 32) List!18005) Bool)

(assert (=> b!905291 (= res!610886 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18002))))

(declare-fun b!905292 () Bool)

(declare-fun e!507295 () Bool)

(declare-fun e!507297 () Bool)

(assert (=> b!905292 (= e!507295 e!507297)))

(declare-fun res!610881 () Bool)

(assert (=> b!905292 (=> res!610881 e!507297)))

(declare-datatypes ((tuple2!12194 0))(
  ( (tuple2!12195 (_1!6108 (_ BitVec 64)) (_2!6108 V!29833)) )
))
(declare-datatypes ((List!18006 0))(
  ( (Nil!18003) (Cons!18002 (h!19148 tuple2!12194) (t!25411 List!18006)) )
))
(declare-datatypes ((ListLongMap!10891 0))(
  ( (ListLongMap!10892 (toList!5461 List!18006)) )
))
(declare-fun lt!408498 () ListLongMap!10891)

(declare-fun contains!4507 (ListLongMap!10891 (_ BitVec 64)) Bool)

(assert (=> b!905292 (= res!610881 (not (contains!4507 lt!408498 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29833)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29833)

(declare-fun getCurrentListMap!2728 (array!53348 array!53346 (_ BitVec 32) (_ BitVec 32) V!29833 V!29833 (_ BitVec 32) Int) ListLongMap!10891)

(assert (=> b!905292 (= lt!408498 (getCurrentListMap!2728 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905293 () Bool)

(declare-fun res!610884 () Bool)

(assert (=> b!905293 (=> res!610884 e!507297)))

(declare-fun lt!408499 () V!29833)

(declare-fun apply!450 (ListLongMap!10891 (_ BitVec 64)) V!29833)

(assert (=> b!905293 (= res!610884 (not (= (apply!450 lt!408498 k0!1033) lt!408499)))))

(declare-fun b!905294 () Bool)

(declare-fun res!610889 () Bool)

(assert (=> b!905294 (=> (not res!610889) (not e!507292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53348 (_ BitVec 32)) Bool)

(assert (=> b!905294 (= res!610889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905295 () Bool)

(assert (=> b!905295 (= e!507297 true)))

(declare-fun lt!408501 () ListLongMap!10891)

(assert (=> b!905295 (= (apply!450 lt!408501 k0!1033) lt!408499)))

(declare-datatypes ((Unit!30714 0))(
  ( (Unit!30715) )
))
(declare-fun lt!408500 () Unit!30714)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!6 (array!53348 array!53346 (_ BitVec 32) (_ BitVec 32) V!29833 V!29833 (_ BitVec 64) V!29833 (_ BitVec 32) Int) Unit!30714)

(assert (=> b!905295 (= lt!408500 (lemmaListMapApplyFromThenApplyFromZero!6 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408499 i!717 defaultEntry!1160))))

(declare-fun b!905296 () Bool)

(declare-fun e!507294 () Bool)

(assert (=> b!905296 (= e!507294 tp_is_empty!18651)))

(declare-fun mapNonEmpty!29689 () Bool)

(declare-fun tp!56960 () Bool)

(assert (=> mapNonEmpty!29689 (= mapRes!29689 (and tp!56960 e!507294))))

(declare-fun mapKey!29689 () (_ BitVec 32))

(declare-fun mapRest!29689 () (Array (_ BitVec 32) ValueCell!8844))

(declare-fun mapValue!29689 () ValueCell!8844)

(assert (=> mapNonEmpty!29689 (= (arr!25632 _values!1152) (store mapRest!29689 mapKey!29689 mapValue!29689))))

(declare-fun b!905297 () Bool)

(declare-fun res!610883 () Bool)

(assert (=> b!905297 (=> (not res!610883) (not e!507292))))

(assert (=> b!905297 (= res!610883 (and (= (size!26091 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26092 _keys!1386) (size!26091 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905298 () Bool)

(assert (=> b!905298 (= e!507292 e!507290)))

(declare-fun res!610888 () Bool)

(assert (=> b!905298 (=> (not res!610888) (not e!507290))))

(assert (=> b!905298 (= res!610888 (contains!4507 lt!408501 k0!1033))))

(assert (=> b!905298 (= lt!408501 (getCurrentListMap!2728 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905299 () Bool)

(assert (=> b!905299 (= e!507290 (not e!507295))))

(declare-fun res!610887 () Bool)

(assert (=> b!905299 (=> res!610887 e!507295)))

(assert (=> b!905299 (= res!610887 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26092 _keys!1386))))))

(declare-fun get!13466 (ValueCell!8844 V!29833) V!29833)

(declare-fun dynLambda!1328 (Int (_ BitVec 64)) V!29833)

(assert (=> b!905299 (= lt!408499 (get!13466 (select (arr!25632 _values!1152) i!717) (dynLambda!1328 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905299 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408497 () Unit!30714)

(declare-fun lemmaKeyInListMapIsInArray!200 (array!53348 array!53346 (_ BitVec 32) (_ BitVec 32) V!29833 V!29833 (_ BitVec 64) Int) Unit!30714)

(assert (=> b!905299 (= lt!408497 (lemmaKeyInListMapIsInArray!200 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun mapIsEmpty!29689 () Bool)

(assert (=> mapIsEmpty!29689 mapRes!29689))

(assert (= (and start!77648 res!610885) b!905297))

(assert (= (and b!905297 res!610883) b!905294))

(assert (= (and b!905294 res!610889) b!905291))

(assert (= (and b!905291 res!610886) b!905298))

(assert (= (and b!905298 res!610888) b!905287))

(assert (= (and b!905287 res!610882) b!905290))

(assert (= (and b!905290 res!610880) b!905299))

(assert (= (and b!905299 (not res!610887)) b!905292))

(assert (= (and b!905292 (not res!610881)) b!905293))

(assert (= (and b!905293 (not res!610884)) b!905295))

(assert (= (and b!905288 condMapEmpty!29689) mapIsEmpty!29689))

(assert (= (and b!905288 (not condMapEmpty!29689)) mapNonEmpty!29689))

(get-info :version)

(assert (= (and mapNonEmpty!29689 ((_ is ValueCellFull!8844) mapValue!29689)) b!905296))

(assert (= (and b!905288 ((_ is ValueCellFull!8844) mapDefault!29689)) b!905289))

(assert (= start!77648 b!905288))

(declare-fun b_lambda!13107 () Bool)

(assert (=> (not b_lambda!13107) (not b!905299)))

(declare-fun t!25409 () Bool)

(declare-fun tb!5255 () Bool)

(assert (=> (and start!77648 (= defaultEntry!1160 defaultEntry!1160) t!25409) tb!5255))

(declare-fun result!10305 () Bool)

(assert (=> tb!5255 (= result!10305 tp_is_empty!18651)))

(assert (=> b!905299 t!25409))

(declare-fun b_and!26621 () Bool)

(assert (= b_and!26619 (and (=> t!25409 result!10305) b_and!26621)))

(declare-fun m!840695 () Bool)

(assert (=> b!905294 m!840695))

(declare-fun m!840697 () Bool)

(assert (=> b!905298 m!840697))

(declare-fun m!840699 () Bool)

(assert (=> b!905298 m!840699))

(declare-fun m!840701 () Bool)

(assert (=> b!905295 m!840701))

(declare-fun m!840703 () Bool)

(assert (=> b!905295 m!840703))

(declare-fun m!840705 () Bool)

(assert (=> b!905293 m!840705))

(declare-fun m!840707 () Bool)

(assert (=> mapNonEmpty!29689 m!840707))

(declare-fun m!840709 () Bool)

(assert (=> b!905292 m!840709))

(declare-fun m!840711 () Bool)

(assert (=> b!905292 m!840711))

(declare-fun m!840713 () Bool)

(assert (=> b!905287 m!840713))

(declare-fun m!840715 () Bool)

(assert (=> b!905290 m!840715))

(declare-fun m!840717 () Bool)

(assert (=> b!905291 m!840717))

(declare-fun m!840719 () Bool)

(assert (=> b!905299 m!840719))

(declare-fun m!840721 () Bool)

(assert (=> b!905299 m!840721))

(declare-fun m!840723 () Bool)

(assert (=> b!905299 m!840723))

(declare-fun m!840725 () Bool)

(assert (=> b!905299 m!840725))

(assert (=> b!905299 m!840719))

(assert (=> b!905299 m!840723))

(declare-fun m!840727 () Bool)

(assert (=> b!905299 m!840727))

(declare-fun m!840729 () Bool)

(assert (=> start!77648 m!840729))

(declare-fun m!840731 () Bool)

(assert (=> start!77648 m!840731))

(declare-fun m!840733 () Bool)

(assert (=> start!77648 m!840733))

(check-sat (not start!77648) tp_is_empty!18651 (not b!905293) b_and!26621 (not mapNonEmpty!29689) (not b!905299) (not b!905291) (not b!905298) (not b!905292) (not b!905295) (not b_lambda!13107) (not b!905294) (not b_next!16233) (not b!905287))
(check-sat b_and!26621 (not b_next!16233))
