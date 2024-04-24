; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20728 () Bool)

(assert start!20728)

(declare-fun b_free!5383 () Bool)

(declare-fun b_next!5383 () Bool)

(assert (=> start!20728 (= b_free!5383 (not b_next!5383))))

(declare-fun tp!19180 () Bool)

(declare-fun b_and!12143 () Bool)

(assert (=> start!20728 (= tp!19180 b_and!12143)))

(declare-fun b!207403 () Bool)

(declare-fun res!100670 () Bool)

(declare-fun e!135413 () Bool)

(assert (=> b!207403 (=> (not res!100670) (not e!135413))))

(declare-datatypes ((array!9681 0))(
  ( (array!9682 (arr!4591 (Array (_ BitVec 32) (_ BitVec 64))) (size!4916 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9681)

(declare-datatypes ((List!2878 0))(
  ( (Nil!2875) (Cons!2874 (h!3516 (_ BitVec 64)) (t!7801 List!2878)) )
))
(declare-fun arrayNoDuplicates!0 (array!9681 (_ BitVec 32) List!2878) Bool)

(assert (=> b!207403 (= res!100670 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2875))))

(declare-fun b!207404 () Bool)

(declare-fun e!135412 () Bool)

(declare-fun e!135410 () Bool)

(declare-fun mapRes!8927 () Bool)

(assert (=> b!207404 (= e!135412 (and e!135410 mapRes!8927))))

(declare-fun condMapEmpty!8927 () Bool)

(declare-datatypes ((V!6633 0))(
  ( (V!6634 (val!2664 Int)) )
))
(declare-datatypes ((ValueCell!2276 0))(
  ( (ValueCellFull!2276 (v!4635 V!6633)) (EmptyCell!2276) )
))
(declare-datatypes ((array!9683 0))(
  ( (array!9684 (arr!4592 (Array (_ BitVec 32) ValueCell!2276)) (size!4917 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9683)

(declare-fun mapDefault!8927 () ValueCell!2276)

(assert (=> b!207404 (= condMapEmpty!8927 (= (arr!4592 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2276)) mapDefault!8927)))))

(declare-fun b!207405 () Bool)

(declare-fun tp_is_empty!5239 () Bool)

(assert (=> b!207405 (= e!135410 tp_is_empty!5239)))

(declare-fun b!207406 () Bool)

(assert (=> b!207406 (= e!135413 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6633)

(declare-datatypes ((tuple2!3990 0))(
  ( (tuple2!3991 (_1!2006 (_ BitVec 64)) (_2!2006 V!6633)) )
))
(declare-datatypes ((List!2879 0))(
  ( (Nil!2876) (Cons!2875 (h!3517 tuple2!3990) (t!7802 List!2879)) )
))
(declare-datatypes ((ListLongMap!2905 0))(
  ( (ListLongMap!2906 (toList!1468 List!2879)) )
))
(declare-fun lt!106283 () ListLongMap!2905)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6633)

(declare-fun getCurrentListMap!1038 (array!9681 array!9683 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) Int) ListLongMap!2905)

(assert (=> b!207406 (= lt!106283 (getCurrentListMap!1038 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106285 () array!9683)

(declare-fun lt!106282 () ListLongMap!2905)

(assert (=> b!207406 (= lt!106282 (getCurrentListMap!1038 _keys!825 lt!106285 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106284 () ListLongMap!2905)

(declare-fun lt!106281 () ListLongMap!2905)

(assert (=> b!207406 (and (= lt!106284 lt!106281) (= lt!106281 lt!106284))))

(declare-fun v!520 () V!6633)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!106280 () ListLongMap!2905)

(declare-fun +!522 (ListLongMap!2905 tuple2!3990) ListLongMap!2905)

(assert (=> b!207406 (= lt!106281 (+!522 lt!106280 (tuple2!3991 k0!843 v!520)))))

(declare-datatypes ((Unit!6320 0))(
  ( (Unit!6321) )
))
(declare-fun lt!106286 () Unit!6320)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 (array!9681 array!9683 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) (_ BitVec 64) V!6633 (_ BitVec 32) Int) Unit!6320)

(assert (=> b!207406 (= lt!106286 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!174 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!431 (array!9681 array!9683 (_ BitVec 32) (_ BitVec 32) V!6633 V!6633 (_ BitVec 32) Int) ListLongMap!2905)

(assert (=> b!207406 (= lt!106284 (getCurrentListMapNoExtraKeys!431 _keys!825 lt!106285 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207406 (= lt!106285 (array!9684 (store (arr!4592 _values!649) i!601 (ValueCellFull!2276 v!520)) (size!4917 _values!649)))))

(assert (=> b!207406 (= lt!106280 (getCurrentListMapNoExtraKeys!431 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8927 () Bool)

(assert (=> mapIsEmpty!8927 mapRes!8927))

(declare-fun b!207407 () Bool)

(declare-fun res!100675 () Bool)

(assert (=> b!207407 (=> (not res!100675) (not e!135413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207407 (= res!100675 (validKeyInArray!0 k0!843))))

(declare-fun b!207408 () Bool)

(declare-fun res!100673 () Bool)

(assert (=> b!207408 (=> (not res!100673) (not e!135413))))

(assert (=> b!207408 (= res!100673 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4916 _keys!825))))))

(declare-fun b!207409 () Bool)

(declare-fun res!100672 () Bool)

(assert (=> b!207409 (=> (not res!100672) (not e!135413))))

(assert (=> b!207409 (= res!100672 (= (select (arr!4591 _keys!825) i!601) k0!843))))

(declare-fun res!100674 () Bool)

(assert (=> start!20728 (=> (not res!100674) (not e!135413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20728 (= res!100674 (validMask!0 mask!1149))))

(assert (=> start!20728 e!135413))

(declare-fun array_inv!3007 (array!9683) Bool)

(assert (=> start!20728 (and (array_inv!3007 _values!649) e!135412)))

(assert (=> start!20728 true))

(assert (=> start!20728 tp_is_empty!5239))

(declare-fun array_inv!3008 (array!9681) Bool)

(assert (=> start!20728 (array_inv!3008 _keys!825)))

(assert (=> start!20728 tp!19180))

(declare-fun b!207410 () Bool)

(declare-fun res!100669 () Bool)

(assert (=> b!207410 (=> (not res!100669) (not e!135413))))

(assert (=> b!207410 (= res!100669 (and (= (size!4917 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4916 _keys!825) (size!4917 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8927 () Bool)

(declare-fun tp!19181 () Bool)

(declare-fun e!135411 () Bool)

(assert (=> mapNonEmpty!8927 (= mapRes!8927 (and tp!19181 e!135411))))

(declare-fun mapRest!8927 () (Array (_ BitVec 32) ValueCell!2276))

(declare-fun mapValue!8927 () ValueCell!2276)

(declare-fun mapKey!8927 () (_ BitVec 32))

(assert (=> mapNonEmpty!8927 (= (arr!4592 _values!649) (store mapRest!8927 mapKey!8927 mapValue!8927))))

(declare-fun b!207411 () Bool)

(assert (=> b!207411 (= e!135411 tp_is_empty!5239)))

(declare-fun b!207412 () Bool)

(declare-fun res!100671 () Bool)

(assert (=> b!207412 (=> (not res!100671) (not e!135413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9681 (_ BitVec 32)) Bool)

(assert (=> b!207412 (= res!100671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20728 res!100674) b!207410))

(assert (= (and b!207410 res!100669) b!207412))

(assert (= (and b!207412 res!100671) b!207403))

(assert (= (and b!207403 res!100670) b!207408))

(assert (= (and b!207408 res!100673) b!207407))

(assert (= (and b!207407 res!100675) b!207409))

(assert (= (and b!207409 res!100672) b!207406))

(assert (= (and b!207404 condMapEmpty!8927) mapIsEmpty!8927))

(assert (= (and b!207404 (not condMapEmpty!8927)) mapNonEmpty!8927))

(get-info :version)

(assert (= (and mapNonEmpty!8927 ((_ is ValueCellFull!2276) mapValue!8927)) b!207411))

(assert (= (and b!207404 ((_ is ValueCellFull!2276) mapDefault!8927)) b!207405))

(assert (= start!20728 b!207404))

(declare-fun m!235281 () Bool)

(assert (=> b!207407 m!235281))

(declare-fun m!235283 () Bool)

(assert (=> b!207403 m!235283))

(declare-fun m!235285 () Bool)

(assert (=> b!207409 m!235285))

(declare-fun m!235287 () Bool)

(assert (=> b!207406 m!235287))

(declare-fun m!235289 () Bool)

(assert (=> b!207406 m!235289))

(declare-fun m!235291 () Bool)

(assert (=> b!207406 m!235291))

(declare-fun m!235293 () Bool)

(assert (=> b!207406 m!235293))

(declare-fun m!235295 () Bool)

(assert (=> b!207406 m!235295))

(declare-fun m!235297 () Bool)

(assert (=> b!207406 m!235297))

(declare-fun m!235299 () Bool)

(assert (=> b!207406 m!235299))

(declare-fun m!235301 () Bool)

(assert (=> b!207412 m!235301))

(declare-fun m!235303 () Bool)

(assert (=> mapNonEmpty!8927 m!235303))

(declare-fun m!235305 () Bool)

(assert (=> start!20728 m!235305))

(declare-fun m!235307 () Bool)

(assert (=> start!20728 m!235307))

(declare-fun m!235309 () Bool)

(assert (=> start!20728 m!235309))

(check-sat tp_is_empty!5239 (not mapNonEmpty!8927) (not b!207406) (not b_next!5383) (not start!20728) (not b!207403) (not b!207412) b_and!12143 (not b!207407))
(check-sat b_and!12143 (not b_next!5383))
