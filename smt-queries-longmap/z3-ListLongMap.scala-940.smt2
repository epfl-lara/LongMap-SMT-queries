; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20738 () Bool)

(assert start!20738)

(declare-fun b_free!5397 () Bool)

(declare-fun b_next!5397 () Bool)

(assert (=> start!20738 (= b_free!5397 (not b_next!5397))))

(declare-fun tp!19222 () Bool)

(declare-fun b_and!12143 () Bool)

(assert (=> start!20738 (= tp!19222 b_and!12143)))

(declare-fun b!207566 () Bool)

(declare-fun e!135491 () Bool)

(declare-fun tp_is_empty!5253 () Bool)

(assert (=> b!207566 (= e!135491 tp_is_empty!5253)))

(declare-fun b!207567 () Bool)

(declare-fun res!100796 () Bool)

(declare-fun e!135490 () Bool)

(assert (=> b!207567 (=> (not res!100796) (not e!135490))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207567 (= res!100796 (validKeyInArray!0 k0!843))))

(declare-fun b!207568 () Bool)

(declare-fun res!100797 () Bool)

(assert (=> b!207568 (=> (not res!100797) (not e!135490))))

(declare-datatypes ((array!9713 0))(
  ( (array!9714 (arr!4607 (Array (_ BitVec 32) (_ BitVec 64))) (size!4932 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9713)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9713 (_ BitVec 32)) Bool)

(assert (=> b!207568 (= res!100797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207569 () Bool)

(declare-fun res!100801 () Bool)

(assert (=> b!207569 (=> (not res!100801) (not e!135490))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207569 (= res!100801 (= (select (arr!4607 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8948 () Bool)

(declare-fun mapRes!8948 () Bool)

(assert (=> mapIsEmpty!8948 mapRes!8948))

(declare-fun b!207570 () Bool)

(declare-fun res!100798 () Bool)

(assert (=> b!207570 (=> (not res!100798) (not e!135490))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6651 0))(
  ( (V!6652 (val!2671 Int)) )
))
(declare-datatypes ((ValueCell!2283 0))(
  ( (ValueCellFull!2283 (v!4641 V!6651)) (EmptyCell!2283) )
))
(declare-datatypes ((array!9715 0))(
  ( (array!9716 (arr!4608 (Array (_ BitVec 32) ValueCell!2283)) (size!4933 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9715)

(assert (=> b!207570 (= res!100798 (and (= (size!4933 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4932 _keys!825) (size!4933 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!100795 () Bool)

(assert (=> start!20738 (=> (not res!100795) (not e!135490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20738 (= res!100795 (validMask!0 mask!1149))))

(assert (=> start!20738 e!135490))

(declare-fun e!135493 () Bool)

(declare-fun array_inv!3053 (array!9715) Bool)

(assert (=> start!20738 (and (array_inv!3053 _values!649) e!135493)))

(assert (=> start!20738 true))

(assert (=> start!20738 tp_is_empty!5253))

(declare-fun array_inv!3054 (array!9713) Bool)

(assert (=> start!20738 (array_inv!3054 _keys!825)))

(assert (=> start!20738 tp!19222))

(declare-fun b!207571 () Bool)

(declare-fun e!135494 () Bool)

(assert (=> b!207571 (= e!135494 tp_is_empty!5253)))

(declare-fun b!207572 () Bool)

(declare-fun res!100800 () Bool)

(assert (=> b!207572 (=> (not res!100800) (not e!135490))))

(declare-datatypes ((List!2946 0))(
  ( (Nil!2943) (Cons!2942 (h!3584 (_ BitVec 64)) (t!7877 List!2946)) )
))
(declare-fun arrayNoDuplicates!0 (array!9713 (_ BitVec 32) List!2946) Bool)

(assert (=> b!207572 (= res!100800 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2943))))

(declare-fun mapNonEmpty!8948 () Bool)

(declare-fun tp!19223 () Bool)

(assert (=> mapNonEmpty!8948 (= mapRes!8948 (and tp!19223 e!135494))))

(declare-fun mapKey!8948 () (_ BitVec 32))

(declare-fun mapRest!8948 () (Array (_ BitVec 32) ValueCell!2283))

(declare-fun mapValue!8948 () ValueCell!2283)

(assert (=> mapNonEmpty!8948 (= (arr!4608 _values!649) (store mapRest!8948 mapKey!8948 mapValue!8948))))

(declare-fun b!207573 () Bool)

(declare-fun res!100799 () Bool)

(assert (=> b!207573 (=> (not res!100799) (not e!135490))))

(assert (=> b!207573 (= res!100799 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4932 _keys!825))))))

(declare-fun b!207574 () Bool)

(assert (=> b!207574 (= e!135490 (not true))))

(declare-datatypes ((tuple2!4054 0))(
  ( (tuple2!4055 (_1!2038 (_ BitVec 64)) (_2!2038 V!6651)) )
))
(declare-datatypes ((List!2947 0))(
  ( (Nil!2944) (Cons!2943 (h!3585 tuple2!4054) (t!7878 List!2947)) )
))
(declare-datatypes ((ListLongMap!2967 0))(
  ( (ListLongMap!2968 (toList!1499 List!2947)) )
))
(declare-fun lt!106368 () ListLongMap!2967)

(declare-fun zeroValue!615 () V!6651)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6651)

(declare-fun getCurrentListMap!1066 (array!9713 array!9715 (_ BitVec 32) (_ BitVec 32) V!6651 V!6651 (_ BitVec 32) Int) ListLongMap!2967)

(assert (=> b!207574 (= lt!106368 (getCurrentListMap!1066 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106373 () array!9715)

(declare-fun lt!106370 () ListLongMap!2967)

(assert (=> b!207574 (= lt!106370 (getCurrentListMap!1066 _keys!825 lt!106373 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106369 () ListLongMap!2967)

(declare-fun lt!106374 () ListLongMap!2967)

(assert (=> b!207574 (and (= lt!106369 lt!106374) (= lt!106374 lt!106369))))

(declare-fun lt!106371 () ListLongMap!2967)

(declare-fun v!520 () V!6651)

(declare-fun +!526 (ListLongMap!2967 tuple2!4054) ListLongMap!2967)

(assert (=> b!207574 (= lt!106374 (+!526 lt!106371 (tuple2!4055 k0!843 v!520)))))

(declare-datatypes ((Unit!6340 0))(
  ( (Unit!6341) )
))
(declare-fun lt!106372 () Unit!6340)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!179 (array!9713 array!9715 (_ BitVec 32) (_ BitVec 32) V!6651 V!6651 (_ BitVec 32) (_ BitVec 64) V!6651 (_ BitVec 32) Int) Unit!6340)

(assert (=> b!207574 (= lt!106372 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!179 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!440 (array!9713 array!9715 (_ BitVec 32) (_ BitVec 32) V!6651 V!6651 (_ BitVec 32) Int) ListLongMap!2967)

(assert (=> b!207574 (= lt!106369 (getCurrentListMapNoExtraKeys!440 _keys!825 lt!106373 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207574 (= lt!106373 (array!9716 (store (arr!4608 _values!649) i!601 (ValueCellFull!2283 v!520)) (size!4933 _values!649)))))

(assert (=> b!207574 (= lt!106371 (getCurrentListMapNoExtraKeys!440 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207575 () Bool)

(assert (=> b!207575 (= e!135493 (and e!135491 mapRes!8948))))

(declare-fun condMapEmpty!8948 () Bool)

(declare-fun mapDefault!8948 () ValueCell!2283)

(assert (=> b!207575 (= condMapEmpty!8948 (= (arr!4608 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2283)) mapDefault!8948)))))

(assert (= (and start!20738 res!100795) b!207570))

(assert (= (and b!207570 res!100798) b!207568))

(assert (= (and b!207568 res!100797) b!207572))

(assert (= (and b!207572 res!100800) b!207573))

(assert (= (and b!207573 res!100799) b!207567))

(assert (= (and b!207567 res!100796) b!207569))

(assert (= (and b!207569 res!100801) b!207574))

(assert (= (and b!207575 condMapEmpty!8948) mapIsEmpty!8948))

(assert (= (and b!207575 (not condMapEmpty!8948)) mapNonEmpty!8948))

(get-info :version)

(assert (= (and mapNonEmpty!8948 ((_ is ValueCellFull!2283) mapValue!8948)) b!207571))

(assert (= (and b!207575 ((_ is ValueCellFull!2283) mapDefault!8948)) b!207566))

(assert (= start!20738 b!207575))

(declare-fun m!235309 () Bool)

(assert (=> b!207567 m!235309))

(declare-fun m!235311 () Bool)

(assert (=> b!207568 m!235311))

(declare-fun m!235313 () Bool)

(assert (=> b!207574 m!235313))

(declare-fun m!235315 () Bool)

(assert (=> b!207574 m!235315))

(declare-fun m!235317 () Bool)

(assert (=> b!207574 m!235317))

(declare-fun m!235319 () Bool)

(assert (=> b!207574 m!235319))

(declare-fun m!235321 () Bool)

(assert (=> b!207574 m!235321))

(declare-fun m!235323 () Bool)

(assert (=> b!207574 m!235323))

(declare-fun m!235325 () Bool)

(assert (=> b!207574 m!235325))

(declare-fun m!235327 () Bool)

(assert (=> b!207569 m!235327))

(declare-fun m!235329 () Bool)

(assert (=> b!207572 m!235329))

(declare-fun m!235331 () Bool)

(assert (=> mapNonEmpty!8948 m!235331))

(declare-fun m!235333 () Bool)

(assert (=> start!20738 m!235333))

(declare-fun m!235335 () Bool)

(assert (=> start!20738 m!235335))

(declare-fun m!235337 () Bool)

(assert (=> start!20738 m!235337))

(check-sat tp_is_empty!5253 (not b!207574) (not start!20738) (not b!207567) (not b!207572) b_and!12143 (not b_next!5397) (not mapNonEmpty!8948) (not b!207568))
(check-sat b_and!12143 (not b_next!5397))
