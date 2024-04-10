; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20744 () Bool)

(assert start!20744)

(declare-fun b_free!5403 () Bool)

(declare-fun b_next!5403 () Bool)

(assert (=> start!20744 (= b_free!5403 (not b_next!5403))))

(declare-fun tp!19241 () Bool)

(declare-fun b_and!12149 () Bool)

(assert (=> start!20744 (= tp!19241 b_and!12149)))

(declare-fun b!207656 () Bool)

(declare-fun res!100863 () Bool)

(declare-fun e!135536 () Bool)

(assert (=> b!207656 (=> (not res!100863) (not e!135536))))

(declare-datatypes ((array!9725 0))(
  ( (array!9726 (arr!4613 (Array (_ BitVec 32) (_ BitVec 64))) (size!4938 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9725)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9725 (_ BitVec 32)) Bool)

(assert (=> b!207656 (= res!100863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207657 () Bool)

(assert (=> b!207657 (= e!135536 (not true))))

(declare-datatypes ((V!6659 0))(
  ( (V!6660 (val!2674 Int)) )
))
(declare-datatypes ((ValueCell!2286 0))(
  ( (ValueCellFull!2286 (v!4644 V!6659)) (EmptyCell!2286) )
))
(declare-datatypes ((array!9727 0))(
  ( (array!9728 (arr!4614 (Array (_ BitVec 32) ValueCell!2286)) (size!4939 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9727)

(declare-fun zeroValue!615 () V!6659)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!4058 0))(
  ( (tuple2!4059 (_1!2040 (_ BitVec 64)) (_2!2040 V!6659)) )
))
(declare-datatypes ((List!2950 0))(
  ( (Nil!2947) (Cons!2946 (h!3588 tuple2!4058) (t!7881 List!2950)) )
))
(declare-datatypes ((ListLongMap!2971 0))(
  ( (ListLongMap!2972 (toList!1501 List!2950)) )
))
(declare-fun lt!106437 () ListLongMap!2971)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6659)

(declare-fun getCurrentListMap!1068 (array!9725 array!9727 (_ BitVec 32) (_ BitVec 32) V!6659 V!6659 (_ BitVec 32) Int) ListLongMap!2971)

(assert (=> b!207657 (= lt!106437 (getCurrentListMap!1068 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106436 () ListLongMap!2971)

(declare-fun lt!106433 () array!9727)

(assert (=> b!207657 (= lt!106436 (getCurrentListMap!1068 _keys!825 lt!106433 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106431 () ListLongMap!2971)

(declare-fun lt!106435 () ListLongMap!2971)

(assert (=> b!207657 (and (= lt!106431 lt!106435) (= lt!106435 lt!106431))))

(declare-fun v!520 () V!6659)

(declare-fun lt!106432 () ListLongMap!2971)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!528 (ListLongMap!2971 tuple2!4058) ListLongMap!2971)

(assert (=> b!207657 (= lt!106435 (+!528 lt!106432 (tuple2!4059 k0!843 v!520)))))

(declare-datatypes ((Unit!6344 0))(
  ( (Unit!6345) )
))
(declare-fun lt!106434 () Unit!6344)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!181 (array!9725 array!9727 (_ BitVec 32) (_ BitVec 32) V!6659 V!6659 (_ BitVec 32) (_ BitVec 64) V!6659 (_ BitVec 32) Int) Unit!6344)

(assert (=> b!207657 (= lt!106434 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!181 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!442 (array!9725 array!9727 (_ BitVec 32) (_ BitVec 32) V!6659 V!6659 (_ BitVec 32) Int) ListLongMap!2971)

(assert (=> b!207657 (= lt!106431 (getCurrentListMapNoExtraKeys!442 _keys!825 lt!106433 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207657 (= lt!106433 (array!9728 (store (arr!4614 _values!649) i!601 (ValueCellFull!2286 v!520)) (size!4939 _values!649)))))

(assert (=> b!207657 (= lt!106432 (getCurrentListMapNoExtraKeys!442 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207659 () Bool)

(declare-fun e!135537 () Bool)

(declare-fun e!135538 () Bool)

(declare-fun mapRes!8957 () Bool)

(assert (=> b!207659 (= e!135537 (and e!135538 mapRes!8957))))

(declare-fun condMapEmpty!8957 () Bool)

(declare-fun mapDefault!8957 () ValueCell!2286)

(assert (=> b!207659 (= condMapEmpty!8957 (= (arr!4614 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2286)) mapDefault!8957)))))

(declare-fun b!207660 () Bool)

(declare-fun res!100858 () Bool)

(assert (=> b!207660 (=> (not res!100858) (not e!135536))))

(assert (=> b!207660 (= res!100858 (and (= (size!4939 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4938 _keys!825) (size!4939 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8957 () Bool)

(assert (=> mapIsEmpty!8957 mapRes!8957))

(declare-fun b!207661 () Bool)

(declare-fun res!100864 () Bool)

(assert (=> b!207661 (=> (not res!100864) (not e!135536))))

(assert (=> b!207661 (= res!100864 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4938 _keys!825))))))

(declare-fun b!207662 () Bool)

(declare-fun tp_is_empty!5259 () Bool)

(assert (=> b!207662 (= e!135538 tp_is_empty!5259)))

(declare-fun b!207663 () Bool)

(declare-fun res!100862 () Bool)

(assert (=> b!207663 (=> (not res!100862) (not e!135536))))

(declare-datatypes ((List!2951 0))(
  ( (Nil!2948) (Cons!2947 (h!3589 (_ BitVec 64)) (t!7882 List!2951)) )
))
(declare-fun arrayNoDuplicates!0 (array!9725 (_ BitVec 32) List!2951) Bool)

(assert (=> b!207663 (= res!100862 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2948))))

(declare-fun mapNonEmpty!8957 () Bool)

(declare-fun tp!19240 () Bool)

(declare-fun e!135535 () Bool)

(assert (=> mapNonEmpty!8957 (= mapRes!8957 (and tp!19240 e!135535))))

(declare-fun mapKey!8957 () (_ BitVec 32))

(declare-fun mapValue!8957 () ValueCell!2286)

(declare-fun mapRest!8957 () (Array (_ BitVec 32) ValueCell!2286))

(assert (=> mapNonEmpty!8957 (= (arr!4614 _values!649) (store mapRest!8957 mapKey!8957 mapValue!8957))))

(declare-fun b!207664 () Bool)

(declare-fun res!100859 () Bool)

(assert (=> b!207664 (=> (not res!100859) (not e!135536))))

(assert (=> b!207664 (= res!100859 (= (select (arr!4613 _keys!825) i!601) k0!843))))

(declare-fun b!207665 () Bool)

(declare-fun res!100861 () Bool)

(assert (=> b!207665 (=> (not res!100861) (not e!135536))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207665 (= res!100861 (validKeyInArray!0 k0!843))))

(declare-fun b!207658 () Bool)

(assert (=> b!207658 (= e!135535 tp_is_empty!5259)))

(declare-fun res!100860 () Bool)

(assert (=> start!20744 (=> (not res!100860) (not e!135536))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20744 (= res!100860 (validMask!0 mask!1149))))

(assert (=> start!20744 e!135536))

(declare-fun array_inv!3057 (array!9727) Bool)

(assert (=> start!20744 (and (array_inv!3057 _values!649) e!135537)))

(assert (=> start!20744 true))

(assert (=> start!20744 tp_is_empty!5259))

(declare-fun array_inv!3058 (array!9725) Bool)

(assert (=> start!20744 (array_inv!3058 _keys!825)))

(assert (=> start!20744 tp!19241))

(assert (= (and start!20744 res!100860) b!207660))

(assert (= (and b!207660 res!100858) b!207656))

(assert (= (and b!207656 res!100863) b!207663))

(assert (= (and b!207663 res!100862) b!207661))

(assert (= (and b!207661 res!100864) b!207665))

(assert (= (and b!207665 res!100861) b!207664))

(assert (= (and b!207664 res!100859) b!207657))

(assert (= (and b!207659 condMapEmpty!8957) mapIsEmpty!8957))

(assert (= (and b!207659 (not condMapEmpty!8957)) mapNonEmpty!8957))

(get-info :version)

(assert (= (and mapNonEmpty!8957 ((_ is ValueCellFull!2286) mapValue!8957)) b!207658))

(assert (= (and b!207659 ((_ is ValueCellFull!2286) mapDefault!8957)) b!207662))

(assert (= start!20744 b!207659))

(declare-fun m!235399 () Bool)

(assert (=> start!20744 m!235399))

(declare-fun m!235401 () Bool)

(assert (=> start!20744 m!235401))

(declare-fun m!235403 () Bool)

(assert (=> start!20744 m!235403))

(declare-fun m!235405 () Bool)

(assert (=> b!207664 m!235405))

(declare-fun m!235407 () Bool)

(assert (=> b!207663 m!235407))

(declare-fun m!235409 () Bool)

(assert (=> b!207656 m!235409))

(declare-fun m!235411 () Bool)

(assert (=> b!207657 m!235411))

(declare-fun m!235413 () Bool)

(assert (=> b!207657 m!235413))

(declare-fun m!235415 () Bool)

(assert (=> b!207657 m!235415))

(declare-fun m!235417 () Bool)

(assert (=> b!207657 m!235417))

(declare-fun m!235419 () Bool)

(assert (=> b!207657 m!235419))

(declare-fun m!235421 () Bool)

(assert (=> b!207657 m!235421))

(declare-fun m!235423 () Bool)

(assert (=> b!207657 m!235423))

(declare-fun m!235425 () Bool)

(assert (=> mapNonEmpty!8957 m!235425))

(declare-fun m!235427 () Bool)

(assert (=> b!207665 m!235427))

(check-sat (not b!207656) (not b!207665) (not mapNonEmpty!8957) (not b!207657) tp_is_empty!5259 (not b_next!5403) (not start!20744) (not b!207663) b_and!12149)
(check-sat b_and!12149 (not b_next!5403))
