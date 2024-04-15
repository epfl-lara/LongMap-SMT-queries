; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20728 () Bool)

(assert start!20728)

(declare-fun b_free!5383 () Bool)

(declare-fun b_next!5383 () Bool)

(assert (=> start!20728 (= b_free!5383 (not b_next!5383))))

(declare-fun tp!19180 () Bool)

(declare-fun b_and!12103 () Bool)

(assert (=> start!20728 (= tp!19180 b_and!12103)))

(declare-fun b!207209 () Bool)

(declare-fun e!135286 () Bool)

(assert (=> b!207209 (= e!135286 (not true))))

(declare-datatypes ((V!6633 0))(
  ( (V!6634 (val!2664 Int)) )
))
(declare-datatypes ((tuple2!4020 0))(
  ( (tuple2!4021 (_1!2021 (_ BitVec 64)) (_2!2021 V!6633)) )
))
(declare-datatypes ((List!2924 0))(
  ( (Nil!2921) (Cons!2920 (h!3562 tuple2!4020) (t!7846 List!2924)) )
))
(declare-datatypes ((ListLongMap!2923 0))(
  ( (ListLongMap!2924 (toList!1477 List!2924)) )
))
(declare-fun lt!106043 () ListLongMap!2923)

(declare-datatypes ((ValueCell!2276 0))(
  ( (ValueCellFull!2276 (v!4628 V!6633)) (EmptyCell!2276) )
))
(declare-datatypes ((array!9673 0))(
  ( (array!9674 (arr!4586 (Array (_ BitVec 32) ValueCell!2276)) (size!4912 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9673)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6633)

(declare-datatypes ((array!9675 0))(
  ( (array!9676 (arr!4587 (Array (_ BitVec 32) (_ BitVec 64))) (size!4913 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9675)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6633)

(declare-fun getCurrentListMap!1018 (array!9675 array!9673 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!207209 (= lt!106043 (getCurrentListMap!1018 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106040 () ListLongMap!2923)

(declare-fun lt!106044 () array!9673)

(assert (=> b!207209 (= lt!106040 (getCurrentListMap!1018 _keys!825 lt!106044 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106041 () ListLongMap!2923)

(declare-fun lt!106046 () ListLongMap!2923)

(assert (=> b!207209 (and (= lt!106041 lt!106046) (= lt!106046 lt!106041))))

(declare-fun v!520 () V!6633)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!106042 () ListLongMap!2923)

(declare-fun +!526 (ListLongMap!2923 tuple2!4020) ListLongMap!2923)

(assert (=> b!207209 (= lt!106046 (+!526 lt!106042 (tuple2!4021 k0!843 v!520)))))

(declare-datatypes ((Unit!6292 0))(
  ( (Unit!6293) )
))
(declare-fun lt!106045 () Unit!6292)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 (array!9675 array!9673 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) (_ BitVec 64) V!6633 (_ BitVec 32) Int) Unit!6292)

(assert (=> b!207209 (= lt!106045 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!177 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!428 (array!9675 array!9673 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!207209 (= lt!106041 (getCurrentListMapNoExtraKeys!428 _keys!825 lt!106044 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207209 (= lt!106044 (array!9674 (store (arr!4586 _values!649) i!601 (ValueCellFull!2276 v!520)) (size!4912 _values!649)))))

(assert (=> b!207209 (= lt!106042 (getCurrentListMapNoExtraKeys!428 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207210 () Bool)

(declare-fun res!100554 () Bool)

(assert (=> b!207210 (=> (not res!100554) (not e!135286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9675 (_ BitVec 32)) Bool)

(assert (=> b!207210 (= res!100554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8927 () Bool)

(declare-fun mapRes!8927 () Bool)

(declare-fun tp!19181 () Bool)

(declare-fun e!135287 () Bool)

(assert (=> mapNonEmpty!8927 (= mapRes!8927 (and tp!19181 e!135287))))

(declare-fun mapKey!8927 () (_ BitVec 32))

(declare-fun mapValue!8927 () ValueCell!2276)

(declare-fun mapRest!8927 () (Array (_ BitVec 32) ValueCell!2276))

(assert (=> mapNonEmpty!8927 (= (arr!4586 _values!649) (store mapRest!8927 mapKey!8927 mapValue!8927))))

(declare-fun b!207211 () Bool)

(declare-fun res!100556 () Bool)

(assert (=> b!207211 (=> (not res!100556) (not e!135286))))

(assert (=> b!207211 (= res!100556 (= (select (arr!4587 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8927 () Bool)

(assert (=> mapIsEmpty!8927 mapRes!8927))

(declare-fun b!207212 () Bool)

(declare-fun res!100558 () Bool)

(assert (=> b!207212 (=> (not res!100558) (not e!135286))))

(assert (=> b!207212 (= res!100558 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4913 _keys!825))))))

(declare-fun b!207213 () Bool)

(declare-fun e!135284 () Bool)

(declare-fun tp_is_empty!5239 () Bool)

(assert (=> b!207213 (= e!135284 tp_is_empty!5239)))

(declare-fun b!207214 () Bool)

(declare-fun e!135285 () Bool)

(assert (=> b!207214 (= e!135285 (and e!135284 mapRes!8927))))

(declare-fun condMapEmpty!8927 () Bool)

(declare-fun mapDefault!8927 () ValueCell!2276)

(assert (=> b!207214 (= condMapEmpty!8927 (= (arr!4586 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2276)) mapDefault!8927)))))

(declare-fun b!207216 () Bool)

(assert (=> b!207216 (= e!135287 tp_is_empty!5239)))

(declare-fun b!207217 () Bool)

(declare-fun res!100553 () Bool)

(assert (=> b!207217 (=> (not res!100553) (not e!135286))))

(assert (=> b!207217 (= res!100553 (and (= (size!4912 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4913 _keys!825) (size!4912 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207218 () Bool)

(declare-fun res!100555 () Bool)

(assert (=> b!207218 (=> (not res!100555) (not e!135286))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207218 (= res!100555 (validKeyInArray!0 k0!843))))

(declare-fun b!207215 () Bool)

(declare-fun res!100559 () Bool)

(assert (=> b!207215 (=> (not res!100559) (not e!135286))))

(declare-datatypes ((List!2925 0))(
  ( (Nil!2922) (Cons!2921 (h!3563 (_ BitVec 64)) (t!7847 List!2925)) )
))
(declare-fun arrayNoDuplicates!0 (array!9675 (_ BitVec 32) List!2925) Bool)

(assert (=> b!207215 (= res!100559 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2922))))

(declare-fun res!100557 () Bool)

(assert (=> start!20728 (=> (not res!100557) (not e!135286))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20728 (= res!100557 (validMask!0 mask!1149))))

(assert (=> start!20728 e!135286))

(declare-fun array_inv!3013 (array!9673) Bool)

(assert (=> start!20728 (and (array_inv!3013 _values!649) e!135285)))

(assert (=> start!20728 true))

(assert (=> start!20728 tp_is_empty!5239))

(declare-fun array_inv!3014 (array!9675) Bool)

(assert (=> start!20728 (array_inv!3014 _keys!825)))

(assert (=> start!20728 tp!19180))

(assert (= (and start!20728 res!100557) b!207217))

(assert (= (and b!207217 res!100553) b!207210))

(assert (= (and b!207210 res!100554) b!207215))

(assert (= (and b!207215 res!100559) b!207212))

(assert (= (and b!207212 res!100558) b!207218))

(assert (= (and b!207218 res!100555) b!207211))

(assert (= (and b!207211 res!100556) b!207209))

(assert (= (and b!207214 condMapEmpty!8927) mapIsEmpty!8927))

(assert (= (and b!207214 (not condMapEmpty!8927)) mapNonEmpty!8927))

(get-info :version)

(assert (= (and mapNonEmpty!8927 ((_ is ValueCellFull!2276) mapValue!8927)) b!207216))

(assert (= (and b!207214 ((_ is ValueCellFull!2276) mapDefault!8927)) b!207213))

(assert (= start!20728 b!207214))

(declare-fun m!234483 () Bool)

(assert (=> b!207211 m!234483))

(declare-fun m!234485 () Bool)

(assert (=> b!207210 m!234485))

(declare-fun m!234487 () Bool)

(assert (=> start!20728 m!234487))

(declare-fun m!234489 () Bool)

(assert (=> start!20728 m!234489))

(declare-fun m!234491 () Bool)

(assert (=> start!20728 m!234491))

(declare-fun m!234493 () Bool)

(assert (=> b!207218 m!234493))

(declare-fun m!234495 () Bool)

(assert (=> b!207215 m!234495))

(declare-fun m!234497 () Bool)

(assert (=> mapNonEmpty!8927 m!234497))

(declare-fun m!234499 () Bool)

(assert (=> b!207209 m!234499))

(declare-fun m!234501 () Bool)

(assert (=> b!207209 m!234501))

(declare-fun m!234503 () Bool)

(assert (=> b!207209 m!234503))

(declare-fun m!234505 () Bool)

(assert (=> b!207209 m!234505))

(declare-fun m!234507 () Bool)

(assert (=> b!207209 m!234507))

(declare-fun m!234509 () Bool)

(assert (=> b!207209 m!234509))

(declare-fun m!234511 () Bool)

(assert (=> b!207209 m!234511))

(check-sat (not b_next!5383) b_and!12103 (not mapNonEmpty!8927) (not b!207215) (not b!207218) (not b!207210) (not b!207209) tp_is_empty!5239 (not start!20728))
(check-sat b_and!12103 (not b_next!5383))
