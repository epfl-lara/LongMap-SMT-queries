; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77654 () Bool)

(assert start!77654)

(declare-fun b_free!16239 () Bool)

(declare-fun b_next!16239 () Bool)

(assert (=> start!77654 (= b_free!16239 (not b_next!16239))))

(declare-fun tp!56979 () Bool)

(declare-fun b_and!26631 () Bool)

(assert (=> start!77654 (= tp!56979 b_and!26631)))

(declare-fun mapNonEmpty!29698 () Bool)

(declare-fun mapRes!29698 () Bool)

(declare-fun tp!56978 () Bool)

(declare-fun e!507362 () Bool)

(assert (=> mapNonEmpty!29698 (= mapRes!29698 (and tp!56978 e!507362))))

(declare-datatypes ((V!29841 0))(
  ( (V!29842 (val!9379 Int)) )
))
(declare-datatypes ((ValueCell!8847 0))(
  ( (ValueCellFull!8847 (v!11884 V!29841)) (EmptyCell!8847) )
))
(declare-fun mapRest!29698 () (Array (_ BitVec 32) ValueCell!8847))

(declare-fun mapKey!29698 () (_ BitVec 32))

(declare-fun mapValue!29698 () ValueCell!8847)

(declare-datatypes ((array!53358 0))(
  ( (array!53359 (arr!25638 (Array (_ BitVec 32) ValueCell!8847)) (size!26097 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53358)

(assert (=> mapNonEmpty!29698 (= (arr!25638 _values!1152) (store mapRest!29698 mapKey!29698 mapValue!29698))))

(declare-fun b!905410 () Bool)

(declare-fun e!507368 () Bool)

(declare-fun tp_is_empty!18657 () Bool)

(assert (=> b!905410 (= e!507368 tp_is_empty!18657)))

(declare-fun mapIsEmpty!29698 () Bool)

(assert (=> mapIsEmpty!29698 mapRes!29698))

(declare-fun b!905411 () Bool)

(declare-fun e!507367 () Bool)

(assert (=> b!905411 (= e!507367 true)))

(declare-datatypes ((tuple2!12200 0))(
  ( (tuple2!12201 (_1!6111 (_ BitVec 64)) (_2!6111 V!29841)) )
))
(declare-datatypes ((List!18011 0))(
  ( (Nil!18008) (Cons!18007 (h!19153 tuple2!12200) (t!25422 List!18011)) )
))
(declare-datatypes ((ListLongMap!10897 0))(
  ( (ListLongMap!10898 (toList!5464 List!18011)) )
))
(declare-fun lt!408542 () ListLongMap!10897)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!408544 () V!29841)

(declare-fun apply!453 (ListLongMap!10897 (_ BitVec 64)) V!29841)

(assert (=> b!905411 (= (apply!453 lt!408542 k0!1033) lt!408544)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((Unit!30720 0))(
  ( (Unit!30721) )
))
(declare-fun lt!408543 () Unit!30720)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29841)

(declare-datatypes ((array!53360 0))(
  ( (array!53361 (arr!25639 (Array (_ BitVec 32) (_ BitVec 64))) (size!26098 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53360)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29841)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!8 (array!53360 array!53358 (_ BitVec 32) (_ BitVec 32) V!29841 V!29841 (_ BitVec 64) V!29841 (_ BitVec 32) Int) Unit!30720)

(assert (=> b!905411 (= lt!408543 (lemmaListMapApplyFromThenApplyFromZero!8 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408544 i!717 defaultEntry!1160))))

(declare-fun b!905412 () Bool)

(declare-fun res!610973 () Bool)

(declare-fun e!507369 () Bool)

(assert (=> b!905412 (=> (not res!610973) (not e!507369))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905412 (= res!610973 (inRange!0 i!717 mask!1756))))

(declare-fun b!905413 () Bool)

(declare-fun e!507363 () Bool)

(assert (=> b!905413 (= e!507363 e!507369)))

(declare-fun res!610977 () Bool)

(assert (=> b!905413 (=> (not res!610977) (not e!507369))))

(declare-fun contains!4510 (ListLongMap!10897 (_ BitVec 64)) Bool)

(assert (=> b!905413 (= res!610977 (contains!4510 lt!408542 k0!1033))))

(declare-fun getCurrentListMap!2731 (array!53360 array!53358 (_ BitVec 32) (_ BitVec 32) V!29841 V!29841 (_ BitVec 32) Int) ListLongMap!10897)

(assert (=> b!905413 (= lt!408542 (getCurrentListMap!2731 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905414 () Bool)

(declare-fun res!610979 () Bool)

(assert (=> b!905414 (=> (not res!610979) (not e!507363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53360 (_ BitVec 32)) Bool)

(assert (=> b!905414 (= res!610979 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905415 () Bool)

(declare-fun res!610978 () Bool)

(assert (=> b!905415 (=> (not res!610978) (not e!507369))))

(assert (=> b!905415 (= res!610978 (and (= (select (arr!25639 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!905416 () Bool)

(declare-fun e!507366 () Bool)

(assert (=> b!905416 (= e!507369 (not e!507366))))

(declare-fun res!610971 () Bool)

(assert (=> b!905416 (=> res!610971 e!507366)))

(assert (=> b!905416 (= res!610971 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26098 _keys!1386))))))

(declare-fun get!13470 (ValueCell!8847 V!29841) V!29841)

(declare-fun dynLambda!1330 (Int (_ BitVec 64)) V!29841)

(assert (=> b!905416 (= lt!408544 (get!13470 (select (arr!25638 _values!1152) i!717) (dynLambda!1330 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905416 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!408545 () Unit!30720)

(declare-fun lemmaKeyInListMapIsInArray!202 (array!53360 array!53358 (_ BitVec 32) (_ BitVec 32) V!29841 V!29841 (_ BitVec 64) Int) Unit!30720)

(assert (=> b!905416 (= lt!408545 (lemmaKeyInListMapIsInArray!202 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun res!610972 () Bool)

(assert (=> start!77654 (=> (not res!610972) (not e!507363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77654 (= res!610972 (validMask!0 mask!1756))))

(assert (=> start!77654 e!507363))

(declare-fun e!507364 () Bool)

(declare-fun array_inv!20088 (array!53358) Bool)

(assert (=> start!77654 (and (array_inv!20088 _values!1152) e!507364)))

(assert (=> start!77654 tp!56979))

(assert (=> start!77654 true))

(assert (=> start!77654 tp_is_empty!18657))

(declare-fun array_inv!20089 (array!53360) Bool)

(assert (=> start!77654 (array_inv!20089 _keys!1386)))

(declare-fun b!905417 () Bool)

(declare-fun res!610976 () Bool)

(assert (=> b!905417 (=> (not res!610976) (not e!507363))))

(declare-datatypes ((List!18012 0))(
  ( (Nil!18009) (Cons!18008 (h!19154 (_ BitVec 64)) (t!25423 List!18012)) )
))
(declare-fun arrayNoDuplicates!0 (array!53360 (_ BitVec 32) List!18012) Bool)

(assert (=> b!905417 (= res!610976 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18009))))

(declare-fun b!905418 () Bool)

(declare-fun res!610974 () Bool)

(assert (=> b!905418 (=> (not res!610974) (not e!507363))))

(assert (=> b!905418 (= res!610974 (and (= (size!26097 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26098 _keys!1386) (size!26097 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905419 () Bool)

(declare-fun res!610970 () Bool)

(assert (=> b!905419 (=> res!610970 e!507367)))

(declare-fun lt!408546 () ListLongMap!10897)

(assert (=> b!905419 (= res!610970 (not (= (apply!453 lt!408546 k0!1033) lt!408544)))))

(declare-fun b!905420 () Bool)

(assert (=> b!905420 (= e!507366 e!507367)))

(declare-fun res!610975 () Bool)

(assert (=> b!905420 (=> res!610975 e!507367)))

(assert (=> b!905420 (= res!610975 (not (contains!4510 lt!408546 k0!1033)))))

(assert (=> b!905420 (= lt!408546 (getCurrentListMap!2731 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905421 () Bool)

(assert (=> b!905421 (= e!507364 (and e!507368 mapRes!29698))))

(declare-fun condMapEmpty!29698 () Bool)

(declare-fun mapDefault!29698 () ValueCell!8847)

(assert (=> b!905421 (= condMapEmpty!29698 (= (arr!25638 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8847)) mapDefault!29698)))))

(declare-fun b!905422 () Bool)

(assert (=> b!905422 (= e!507362 tp_is_empty!18657)))

(assert (= (and start!77654 res!610972) b!905418))

(assert (= (and b!905418 res!610974) b!905414))

(assert (= (and b!905414 res!610979) b!905417))

(assert (= (and b!905417 res!610976) b!905413))

(assert (= (and b!905413 res!610977) b!905412))

(assert (= (and b!905412 res!610973) b!905415))

(assert (= (and b!905415 res!610978) b!905416))

(assert (= (and b!905416 (not res!610971)) b!905420))

(assert (= (and b!905420 (not res!610975)) b!905419))

(assert (= (and b!905419 (not res!610970)) b!905411))

(assert (= (and b!905421 condMapEmpty!29698) mapIsEmpty!29698))

(assert (= (and b!905421 (not condMapEmpty!29698)) mapNonEmpty!29698))

(get-info :version)

(assert (= (and mapNonEmpty!29698 ((_ is ValueCellFull!8847) mapValue!29698)) b!905422))

(assert (= (and b!905421 ((_ is ValueCellFull!8847) mapDefault!29698)) b!905410))

(assert (= start!77654 b!905421))

(declare-fun b_lambda!13113 () Bool)

(assert (=> (not b_lambda!13113) (not b!905416)))

(declare-fun t!25421 () Bool)

(declare-fun tb!5261 () Bool)

(assert (=> (and start!77654 (= defaultEntry!1160 defaultEntry!1160) t!25421) tb!5261))

(declare-fun result!10317 () Bool)

(assert (=> tb!5261 (= result!10317 tp_is_empty!18657)))

(assert (=> b!905416 t!25421))

(declare-fun b_and!26633 () Bool)

(assert (= b_and!26631 (and (=> t!25421 result!10317) b_and!26633)))

(declare-fun m!840815 () Bool)

(assert (=> b!905417 m!840815))

(declare-fun m!840817 () Bool)

(assert (=> b!905420 m!840817))

(declare-fun m!840819 () Bool)

(assert (=> b!905420 m!840819))

(declare-fun m!840821 () Bool)

(assert (=> b!905415 m!840821))

(declare-fun m!840823 () Bool)

(assert (=> b!905416 m!840823))

(declare-fun m!840825 () Bool)

(assert (=> b!905416 m!840825))

(declare-fun m!840827 () Bool)

(assert (=> b!905416 m!840827))

(declare-fun m!840829 () Bool)

(assert (=> b!905416 m!840829))

(assert (=> b!905416 m!840823))

(assert (=> b!905416 m!840827))

(declare-fun m!840831 () Bool)

(assert (=> b!905416 m!840831))

(declare-fun m!840833 () Bool)

(assert (=> mapNonEmpty!29698 m!840833))

(declare-fun m!840835 () Bool)

(assert (=> b!905419 m!840835))

(declare-fun m!840837 () Bool)

(assert (=> b!905414 m!840837))

(declare-fun m!840839 () Bool)

(assert (=> b!905412 m!840839))

(declare-fun m!840841 () Bool)

(assert (=> start!77654 m!840841))

(declare-fun m!840843 () Bool)

(assert (=> start!77654 m!840843))

(declare-fun m!840845 () Bool)

(assert (=> start!77654 m!840845))

(declare-fun m!840847 () Bool)

(assert (=> b!905411 m!840847))

(declare-fun m!840849 () Bool)

(assert (=> b!905411 m!840849))

(declare-fun m!840851 () Bool)

(assert (=> b!905413 m!840851))

(declare-fun m!840853 () Bool)

(assert (=> b!905413 m!840853))

(check-sat (not b!905411) (not b!905417) (not b_next!16239) (not start!77654) (not b!905420) b_and!26633 (not b_lambda!13113) (not mapNonEmpty!29698) (not b!905416) (not b!905412) (not b!905413) tp_is_empty!18657 (not b!905414) (not b!905419))
(check-sat b_and!26633 (not b_next!16239))
