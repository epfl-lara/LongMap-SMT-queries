; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20422 () Bool)

(assert start!20422)

(declare-fun b_free!5077 () Bool)

(declare-fun b_next!5077 () Bool)

(assert (=> start!20422 (= b_free!5077 (not b_next!5077))))

(declare-fun tp!18262 () Bool)

(declare-fun b_and!11837 () Bool)

(assert (=> start!20422 (= tp!18262 b_and!11837)))

(declare-fun b!202062 () Bool)

(declare-fun e!132381 () Bool)

(declare-fun e!132386 () Bool)

(assert (=> b!202062 (= e!132381 (not e!132386))))

(declare-fun res!96704 () Bool)

(assert (=> b!202062 (=> res!96704 e!132386)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202062 (= res!96704 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6225 0))(
  ( (V!6226 (val!2511 Int)) )
))
(declare-datatypes ((tuple2!3742 0))(
  ( (tuple2!3743 (_1!1882 (_ BitVec 64)) (_2!1882 V!6225)) )
))
(declare-datatypes ((List!2651 0))(
  ( (Nil!2648) (Cons!2647 (h!3289 tuple2!3742) (t!7574 List!2651)) )
))
(declare-datatypes ((ListLongMap!2657 0))(
  ( (ListLongMap!2658 (toList!1344 List!2651)) )
))
(declare-fun lt!101203 () ListLongMap!2657)

(declare-datatypes ((ValueCell!2123 0))(
  ( (ValueCellFull!2123 (v!4482 V!6225)) (EmptyCell!2123) )
))
(declare-datatypes ((array!9087 0))(
  ( (array!9088 (arr!4294 (Array (_ BitVec 32) ValueCell!2123)) (size!4619 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9087)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6225)

(declare-datatypes ((array!9089 0))(
  ( (array!9090 (arr!4295 (Array (_ BitVec 32) (_ BitVec 64))) (size!4620 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9089)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6225)

(declare-fun getCurrentListMap!930 (array!9089 array!9087 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!202062 (= lt!101203 (getCurrentListMap!930 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101196 () ListLongMap!2657)

(declare-fun lt!101202 () array!9087)

(assert (=> b!202062 (= lt!101196 (getCurrentListMap!930 _keys!825 lt!101202 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101198 () ListLongMap!2657)

(declare-fun lt!101197 () ListLongMap!2657)

(assert (=> b!202062 (and (= lt!101198 lt!101197) (= lt!101197 lt!101198))))

(declare-fun lt!101199 () ListLongMap!2657)

(declare-fun lt!101195 () tuple2!3742)

(declare-fun +!398 (ListLongMap!2657 tuple2!3742) ListLongMap!2657)

(assert (=> b!202062 (= lt!101197 (+!398 lt!101199 lt!101195))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6225)

(assert (=> b!202062 (= lt!101195 (tuple2!3743 k0!843 v!520))))

(declare-datatypes ((Unit!6080 0))(
  ( (Unit!6081) )
))
(declare-fun lt!101210 () Unit!6080)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 (array!9089 array!9087 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) (_ BitVec 64) V!6225 (_ BitVec 32) Int) Unit!6080)

(assert (=> b!202062 (= lt!101210 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!66 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!323 (array!9089 array!9087 (_ BitVec 32) (_ BitVec 32) V!6225 V!6225 (_ BitVec 32) Int) ListLongMap!2657)

(assert (=> b!202062 (= lt!101198 (getCurrentListMapNoExtraKeys!323 _keys!825 lt!101202 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202062 (= lt!101202 (array!9088 (store (arr!4294 _values!649) i!601 (ValueCellFull!2123 v!520)) (size!4619 _values!649)))))

(assert (=> b!202062 (= lt!101199 (getCurrentListMapNoExtraKeys!323 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202063 () Bool)

(declare-fun e!132384 () Bool)

(declare-fun tp_is_empty!4933 () Bool)

(assert (=> b!202063 (= e!132384 tp_is_empty!4933)))

(declare-fun b!202064 () Bool)

(declare-fun res!96708 () Bool)

(assert (=> b!202064 (=> (not res!96708) (not e!132381))))

(declare-datatypes ((List!2652 0))(
  ( (Nil!2649) (Cons!2648 (h!3290 (_ BitVec 64)) (t!7575 List!2652)) )
))
(declare-fun arrayNoDuplicates!0 (array!9089 (_ BitVec 32) List!2652) Bool)

(assert (=> b!202064 (= res!96708 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2649))))

(declare-fun b!202065 () Bool)

(declare-fun e!132385 () Bool)

(assert (=> b!202065 (= e!132386 e!132385)))

(declare-fun res!96712 () Bool)

(assert (=> b!202065 (=> res!96712 e!132385)))

(assert (=> b!202065 (= res!96712 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101206 () ListLongMap!2657)

(declare-fun lt!101208 () ListLongMap!2657)

(assert (=> b!202065 (= lt!101206 lt!101208)))

(declare-fun lt!101200 () ListLongMap!2657)

(assert (=> b!202065 (= lt!101208 (+!398 lt!101200 lt!101195))))

(declare-fun lt!101209 () Unit!6080)

(declare-fun addCommutativeForDiffKeys!121 (ListLongMap!2657 (_ BitVec 64) V!6225 (_ BitVec 64) V!6225) Unit!6080)

(assert (=> b!202065 (= lt!101209 (addCommutativeForDiffKeys!121 lt!101199 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101204 () tuple2!3742)

(assert (=> b!202065 (= lt!101196 (+!398 lt!101206 lt!101204))))

(declare-fun lt!101207 () tuple2!3742)

(assert (=> b!202065 (= lt!101206 (+!398 lt!101197 lt!101207))))

(declare-fun lt!101201 () ListLongMap!2657)

(assert (=> b!202065 (= lt!101203 lt!101201)))

(assert (=> b!202065 (= lt!101201 (+!398 lt!101200 lt!101204))))

(assert (=> b!202065 (= lt!101200 (+!398 lt!101199 lt!101207))))

(assert (=> b!202065 (= lt!101196 (+!398 (+!398 lt!101198 lt!101207) lt!101204))))

(assert (=> b!202065 (= lt!101204 (tuple2!3743 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!202065 (= lt!101207 (tuple2!3743 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202066 () Bool)

(declare-fun res!96706 () Bool)

(assert (=> b!202066 (=> (not res!96706) (not e!132381))))

(assert (=> b!202066 (= res!96706 (and (= (size!4619 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4620 _keys!825) (size!4619 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202067 () Bool)

(declare-fun e!132383 () Bool)

(assert (=> b!202067 (= e!132383 tp_is_empty!4933)))

(declare-fun b!202068 () Bool)

(assert (=> b!202068 (= e!132385 true)))

(assert (=> b!202068 (= (+!398 lt!101208 lt!101204) (+!398 lt!101201 lt!101195))))

(declare-fun lt!101205 () Unit!6080)

(assert (=> b!202068 (= lt!101205 (addCommutativeForDiffKeys!121 lt!101200 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8468 () Bool)

(declare-fun mapRes!8468 () Bool)

(assert (=> mapIsEmpty!8468 mapRes!8468))

(declare-fun b!202069 () Bool)

(declare-fun res!96710 () Bool)

(assert (=> b!202069 (=> (not res!96710) (not e!132381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202069 (= res!96710 (validKeyInArray!0 k0!843))))

(declare-fun b!202070 () Bool)

(declare-fun res!96709 () Bool)

(assert (=> b!202070 (=> (not res!96709) (not e!132381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9089 (_ BitVec 32)) Bool)

(assert (=> b!202070 (= res!96709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202071 () Bool)

(declare-fun e!132382 () Bool)

(assert (=> b!202071 (= e!132382 (and e!132384 mapRes!8468))))

(declare-fun condMapEmpty!8468 () Bool)

(declare-fun mapDefault!8468 () ValueCell!2123)

(assert (=> b!202071 (= condMapEmpty!8468 (= (arr!4294 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2123)) mapDefault!8468)))))

(declare-fun b!202061 () Bool)

(declare-fun res!96707 () Bool)

(assert (=> b!202061 (=> (not res!96707) (not e!132381))))

(assert (=> b!202061 (= res!96707 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4620 _keys!825))))))

(declare-fun res!96705 () Bool)

(assert (=> start!20422 (=> (not res!96705) (not e!132381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20422 (= res!96705 (validMask!0 mask!1149))))

(assert (=> start!20422 e!132381))

(declare-fun array_inv!2801 (array!9087) Bool)

(assert (=> start!20422 (and (array_inv!2801 _values!649) e!132382)))

(assert (=> start!20422 true))

(assert (=> start!20422 tp_is_empty!4933))

(declare-fun array_inv!2802 (array!9089) Bool)

(assert (=> start!20422 (array_inv!2802 _keys!825)))

(assert (=> start!20422 tp!18262))

(declare-fun b!202072 () Bool)

(declare-fun res!96711 () Bool)

(assert (=> b!202072 (=> (not res!96711) (not e!132381))))

(assert (=> b!202072 (= res!96711 (= (select (arr!4295 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8468 () Bool)

(declare-fun tp!18263 () Bool)

(assert (=> mapNonEmpty!8468 (= mapRes!8468 (and tp!18263 e!132383))))

(declare-fun mapKey!8468 () (_ BitVec 32))

(declare-fun mapValue!8468 () ValueCell!2123)

(declare-fun mapRest!8468 () (Array (_ BitVec 32) ValueCell!2123))

(assert (=> mapNonEmpty!8468 (= (arr!4294 _values!649) (store mapRest!8468 mapKey!8468 mapValue!8468))))

(assert (= (and start!20422 res!96705) b!202066))

(assert (= (and b!202066 res!96706) b!202070))

(assert (= (and b!202070 res!96709) b!202064))

(assert (= (and b!202064 res!96708) b!202061))

(assert (= (and b!202061 res!96707) b!202069))

(assert (= (and b!202069 res!96710) b!202072))

(assert (= (and b!202072 res!96711) b!202062))

(assert (= (and b!202062 (not res!96704)) b!202065))

(assert (= (and b!202065 (not res!96712)) b!202068))

(assert (= (and b!202071 condMapEmpty!8468) mapIsEmpty!8468))

(assert (= (and b!202071 (not condMapEmpty!8468)) mapNonEmpty!8468))

(get-info :version)

(assert (= (and mapNonEmpty!8468 ((_ is ValueCellFull!2123) mapValue!8468)) b!202067))

(assert (= (and b!202071 ((_ is ValueCellFull!2123) mapDefault!8468)) b!202063))

(assert (= start!20422 b!202071))

(declare-fun m!229377 () Bool)

(assert (=> mapNonEmpty!8468 m!229377))

(declare-fun m!229379 () Bool)

(assert (=> b!202062 m!229379))

(declare-fun m!229381 () Bool)

(assert (=> b!202062 m!229381))

(declare-fun m!229383 () Bool)

(assert (=> b!202062 m!229383))

(declare-fun m!229385 () Bool)

(assert (=> b!202062 m!229385))

(declare-fun m!229387 () Bool)

(assert (=> b!202062 m!229387))

(declare-fun m!229389 () Bool)

(assert (=> b!202062 m!229389))

(declare-fun m!229391 () Bool)

(assert (=> b!202062 m!229391))

(declare-fun m!229393 () Bool)

(assert (=> b!202068 m!229393))

(declare-fun m!229395 () Bool)

(assert (=> b!202068 m!229395))

(declare-fun m!229397 () Bool)

(assert (=> b!202068 m!229397))

(declare-fun m!229399 () Bool)

(assert (=> b!202072 m!229399))

(declare-fun m!229401 () Bool)

(assert (=> start!20422 m!229401))

(declare-fun m!229403 () Bool)

(assert (=> start!20422 m!229403))

(declare-fun m!229405 () Bool)

(assert (=> start!20422 m!229405))

(declare-fun m!229407 () Bool)

(assert (=> b!202065 m!229407))

(declare-fun m!229409 () Bool)

(assert (=> b!202065 m!229409))

(declare-fun m!229411 () Bool)

(assert (=> b!202065 m!229411))

(declare-fun m!229413 () Bool)

(assert (=> b!202065 m!229413))

(assert (=> b!202065 m!229411))

(declare-fun m!229415 () Bool)

(assert (=> b!202065 m!229415))

(declare-fun m!229417 () Bool)

(assert (=> b!202065 m!229417))

(declare-fun m!229419 () Bool)

(assert (=> b!202065 m!229419))

(declare-fun m!229421 () Bool)

(assert (=> b!202065 m!229421))

(declare-fun m!229423 () Bool)

(assert (=> b!202064 m!229423))

(declare-fun m!229425 () Bool)

(assert (=> b!202069 m!229425))

(declare-fun m!229427 () Bool)

(assert (=> b!202070 m!229427))

(check-sat (not b_next!5077) tp_is_empty!4933 (not b!202068) (not b!202070) (not mapNonEmpty!8468) (not b!202062) (not b!202065) (not b!202069) (not b!202064) b_and!11837 (not start!20422))
(check-sat b_and!11837 (not b_next!5077))
