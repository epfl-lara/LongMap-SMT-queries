; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38152 () Bool)

(assert start!38152)

(declare-fun b_free!9033 () Bool)

(declare-fun b_next!9033 () Bool)

(assert (=> start!38152 (= b_free!9033 (not b_next!9033))))

(declare-fun tp!31880 () Bool)

(declare-fun b_and!16395 () Bool)

(assert (=> start!38152 (= tp!31880 b_and!16395)))

(declare-fun mapNonEmpty!16152 () Bool)

(declare-fun mapRes!16152 () Bool)

(declare-fun tp!31881 () Bool)

(declare-fun e!238117 () Bool)

(assert (=> mapNonEmpty!16152 (= mapRes!16152 (and tp!31881 e!238117))))

(declare-datatypes ((V!14045 0))(
  ( (V!14046 (val!4897 Int)) )
))
(declare-datatypes ((ValueCell!4509 0))(
  ( (ValueCellFull!4509 (v!7134 V!14045)) (EmptyCell!4509) )
))
(declare-fun mapRest!16152 () (Array (_ BitVec 32) ValueCell!4509))

(declare-datatypes ((array!23317 0))(
  ( (array!23318 (arr!11117 (Array (_ BitVec 32) ValueCell!4509)) (size!11469 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23317)

(declare-fun mapKey!16152 () (_ BitVec 32))

(declare-fun mapValue!16152 () ValueCell!4509)

(assert (=> mapNonEmpty!16152 (= (arr!11117 _values!506) (store mapRest!16152 mapKey!16152 mapValue!16152))))

(declare-fun b!393254 () Bool)

(declare-fun e!238111 () Bool)

(declare-fun e!238115 () Bool)

(assert (=> b!393254 (= e!238111 (not e!238115))))

(declare-fun res!225294 () Bool)

(assert (=> b!393254 (=> res!225294 e!238115)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393254 (= res!225294 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6608 0))(
  ( (tuple2!6609 (_1!3315 (_ BitVec 64)) (_2!3315 V!14045)) )
))
(declare-datatypes ((List!6461 0))(
  ( (Nil!6458) (Cons!6457 (h!7313 tuple2!6608) (t!11631 List!6461)) )
))
(declare-datatypes ((ListLongMap!5521 0))(
  ( (ListLongMap!5522 (toList!2776 List!6461)) )
))
(declare-fun lt!186076 () ListLongMap!5521)

(declare-fun zeroValue!472 () V!14045)

(declare-datatypes ((array!23319 0))(
  ( (array!23320 (arr!11118 (Array (_ BitVec 32) (_ BitVec 64))) (size!11470 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23319)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14045)

(declare-fun getCurrentListMap!2117 (array!23319 array!23317 (_ BitVec 32) (_ BitVec 32) V!14045 V!14045 (_ BitVec 32) Int) ListLongMap!5521)

(assert (=> b!393254 (= lt!186076 (getCurrentListMap!2117 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186068 () ListLongMap!5521)

(declare-fun lt!186075 () array!23317)

(declare-fun lt!186070 () array!23319)

(assert (=> b!393254 (= lt!186068 (getCurrentListMap!2117 lt!186070 lt!186075 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186072 () ListLongMap!5521)

(declare-fun lt!186071 () ListLongMap!5521)

(assert (=> b!393254 (and (= lt!186072 lt!186071) (= lt!186071 lt!186072))))

(declare-fun lt!186074 () ListLongMap!5521)

(declare-fun lt!186073 () tuple2!6608)

(declare-fun +!1071 (ListLongMap!5521 tuple2!6608) ListLongMap!5521)

(assert (=> b!393254 (= lt!186071 (+!1071 lt!186074 lt!186073))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!14045)

(assert (=> b!393254 (= lt!186073 (tuple2!6609 k0!778 v!373))))

(declare-datatypes ((Unit!12028 0))(
  ( (Unit!12029) )
))
(declare-fun lt!186066 () Unit!12028)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!281 (array!23319 array!23317 (_ BitVec 32) (_ BitVec 32) V!14045 V!14045 (_ BitVec 32) (_ BitVec 64) V!14045 (_ BitVec 32) Int) Unit!12028)

(assert (=> b!393254 (= lt!186066 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!281 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!997 (array!23319 array!23317 (_ BitVec 32) (_ BitVec 32) V!14045 V!14045 (_ BitVec 32) Int) ListLongMap!5521)

(assert (=> b!393254 (= lt!186072 (getCurrentListMapNoExtraKeys!997 lt!186070 lt!186075 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393254 (= lt!186075 (array!23318 (store (arr!11117 _values!506) i!548 (ValueCellFull!4509 v!373)) (size!11469 _values!506)))))

(assert (=> b!393254 (= lt!186074 (getCurrentListMapNoExtraKeys!997 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393255 () Bool)

(declare-fun e!238113 () Bool)

(assert (=> b!393255 (= e!238113 (= (+!1071 lt!186076 lt!186073) lt!186068))))

(declare-fun lt!186065 () ListLongMap!5521)

(declare-fun lt!186069 () ListLongMap!5521)

(assert (=> b!393255 (= lt!186065 (+!1071 lt!186069 lt!186073))))

(declare-fun lt!186064 () Unit!12028)

(declare-fun addCommutativeForDiffKeys!348 (ListLongMap!5521 (_ BitVec 64) V!14045 (_ BitVec 64) V!14045) Unit!12028)

(assert (=> b!393255 (= lt!186064 (addCommutativeForDiffKeys!348 lt!186074 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393256 () Bool)

(declare-fun res!225283 () Bool)

(assert (=> b!393256 (=> (not res!225283) (not e!238111))))

(declare-datatypes ((List!6462 0))(
  ( (Nil!6459) (Cons!6458 (h!7314 (_ BitVec 64)) (t!11632 List!6462)) )
))
(declare-fun arrayNoDuplicates!0 (array!23319 (_ BitVec 32) List!6462) Bool)

(assert (=> b!393256 (= res!225283 (arrayNoDuplicates!0 lt!186070 #b00000000000000000000000000000000 Nil!6459))))

(declare-fun b!393257 () Bool)

(declare-fun res!225286 () Bool)

(declare-fun e!238114 () Bool)

(assert (=> b!393257 (=> (not res!225286) (not e!238114))))

(assert (=> b!393257 (= res!225286 (or (= (select (arr!11118 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11118 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!393258 () Bool)

(declare-fun res!225287 () Bool)

(assert (=> b!393258 (=> (not res!225287) (not e!238114))))

(assert (=> b!393258 (= res!225287 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6459))))

(declare-fun b!393259 () Bool)

(declare-fun res!225293 () Bool)

(assert (=> b!393259 (=> (not res!225293) (not e!238114))))

(assert (=> b!393259 (= res!225293 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11470 _keys!658))))))

(declare-fun b!393260 () Bool)

(declare-fun res!225292 () Bool)

(assert (=> b!393260 (=> (not res!225292) (not e!238114))))

(assert (=> b!393260 (= res!225292 (and (= (size!11469 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11470 _keys!658) (size!11469 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!225289 () Bool)

(assert (=> start!38152 (=> (not res!225289) (not e!238114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38152 (= res!225289 (validMask!0 mask!970))))

(assert (=> start!38152 e!238114))

(declare-fun e!238116 () Bool)

(declare-fun array_inv!8164 (array!23317) Bool)

(assert (=> start!38152 (and (array_inv!8164 _values!506) e!238116)))

(assert (=> start!38152 tp!31880))

(assert (=> start!38152 true))

(declare-fun tp_is_empty!9705 () Bool)

(assert (=> start!38152 tp_is_empty!9705))

(declare-fun array_inv!8165 (array!23319) Bool)

(assert (=> start!38152 (array_inv!8165 _keys!658)))

(declare-fun b!393261 () Bool)

(declare-fun res!225290 () Bool)

(assert (=> b!393261 (=> (not res!225290) (not e!238114))))

(declare-fun arrayContainsKey!0 (array!23319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393261 (= res!225290 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393262 () Bool)

(declare-fun e!238110 () Bool)

(assert (=> b!393262 (= e!238110 tp_is_empty!9705)))

(declare-fun b!393263 () Bool)

(assert (=> b!393263 (= e!238117 tp_is_empty!9705)))

(declare-fun b!393264 () Bool)

(assert (=> b!393264 (= e!238115 e!238113)))

(declare-fun res!225288 () Bool)

(assert (=> b!393264 (=> res!225288 e!238113)))

(assert (=> b!393264 (= res!225288 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!393264 (= lt!186076 lt!186069)))

(declare-fun lt!186067 () tuple2!6608)

(assert (=> b!393264 (= lt!186069 (+!1071 lt!186074 lt!186067))))

(assert (=> b!393264 (= lt!186068 lt!186065)))

(assert (=> b!393264 (= lt!186065 (+!1071 lt!186071 lt!186067))))

(assert (=> b!393264 (= lt!186068 (+!1071 lt!186072 lt!186067))))

(assert (=> b!393264 (= lt!186067 (tuple2!6609 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!393265 () Bool)

(declare-fun res!225291 () Bool)

(assert (=> b!393265 (=> (not res!225291) (not e!238114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393265 (= res!225291 (validKeyInArray!0 k0!778))))

(declare-fun b!393266 () Bool)

(declare-fun res!225285 () Bool)

(assert (=> b!393266 (=> (not res!225285) (not e!238114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23319 (_ BitVec 32)) Bool)

(assert (=> b!393266 (= res!225285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393267 () Bool)

(assert (=> b!393267 (= e!238116 (and e!238110 mapRes!16152))))

(declare-fun condMapEmpty!16152 () Bool)

(declare-fun mapDefault!16152 () ValueCell!4509)

(assert (=> b!393267 (= condMapEmpty!16152 (= (arr!11117 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4509)) mapDefault!16152)))))

(declare-fun b!393268 () Bool)

(assert (=> b!393268 (= e!238114 e!238111)))

(declare-fun res!225284 () Bool)

(assert (=> b!393268 (=> (not res!225284) (not e!238111))))

(assert (=> b!393268 (= res!225284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186070 mask!970))))

(assert (=> b!393268 (= lt!186070 (array!23320 (store (arr!11118 _keys!658) i!548 k0!778) (size!11470 _keys!658)))))

(declare-fun mapIsEmpty!16152 () Bool)

(assert (=> mapIsEmpty!16152 mapRes!16152))

(assert (= (and start!38152 res!225289) b!393260))

(assert (= (and b!393260 res!225292) b!393266))

(assert (= (and b!393266 res!225285) b!393258))

(assert (= (and b!393258 res!225287) b!393259))

(assert (= (and b!393259 res!225293) b!393265))

(assert (= (and b!393265 res!225291) b!393257))

(assert (= (and b!393257 res!225286) b!393261))

(assert (= (and b!393261 res!225290) b!393268))

(assert (= (and b!393268 res!225284) b!393256))

(assert (= (and b!393256 res!225283) b!393254))

(assert (= (and b!393254 (not res!225294)) b!393264))

(assert (= (and b!393264 (not res!225288)) b!393255))

(assert (= (and b!393267 condMapEmpty!16152) mapIsEmpty!16152))

(assert (= (and b!393267 (not condMapEmpty!16152)) mapNonEmpty!16152))

(get-info :version)

(assert (= (and mapNonEmpty!16152 ((_ is ValueCellFull!4509) mapValue!16152)) b!393263))

(assert (= (and b!393267 ((_ is ValueCellFull!4509) mapDefault!16152)) b!393262))

(assert (= start!38152 b!393267))

(declare-fun m!389713 () Bool)

(assert (=> b!393265 m!389713))

(declare-fun m!389715 () Bool)

(assert (=> mapNonEmpty!16152 m!389715))

(declare-fun m!389717 () Bool)

(assert (=> start!38152 m!389717))

(declare-fun m!389719 () Bool)

(assert (=> start!38152 m!389719))

(declare-fun m!389721 () Bool)

(assert (=> start!38152 m!389721))

(declare-fun m!389723 () Bool)

(assert (=> b!393266 m!389723))

(declare-fun m!389725 () Bool)

(assert (=> b!393261 m!389725))

(declare-fun m!389727 () Bool)

(assert (=> b!393264 m!389727))

(declare-fun m!389729 () Bool)

(assert (=> b!393264 m!389729))

(declare-fun m!389731 () Bool)

(assert (=> b!393264 m!389731))

(declare-fun m!389733 () Bool)

(assert (=> b!393257 m!389733))

(declare-fun m!389735 () Bool)

(assert (=> b!393254 m!389735))

(declare-fun m!389737 () Bool)

(assert (=> b!393254 m!389737))

(declare-fun m!389739 () Bool)

(assert (=> b!393254 m!389739))

(declare-fun m!389741 () Bool)

(assert (=> b!393254 m!389741))

(declare-fun m!389743 () Bool)

(assert (=> b!393254 m!389743))

(declare-fun m!389745 () Bool)

(assert (=> b!393254 m!389745))

(declare-fun m!389747 () Bool)

(assert (=> b!393254 m!389747))

(declare-fun m!389749 () Bool)

(assert (=> b!393256 m!389749))

(declare-fun m!389751 () Bool)

(assert (=> b!393255 m!389751))

(declare-fun m!389753 () Bool)

(assert (=> b!393255 m!389753))

(declare-fun m!389755 () Bool)

(assert (=> b!393255 m!389755))

(declare-fun m!389757 () Bool)

(assert (=> b!393268 m!389757))

(declare-fun m!389759 () Bool)

(assert (=> b!393268 m!389759))

(declare-fun m!389761 () Bool)

(assert (=> b!393258 m!389761))

(check-sat (not b!393261) (not mapNonEmpty!16152) (not b!393268) (not b!393256) (not b!393255) (not b!393258) (not start!38152) (not b!393254) b_and!16395 (not b!393265) tp_is_empty!9705 (not b_next!9033) (not b!393266) (not b!393264))
(check-sat b_and!16395 (not b_next!9033))
