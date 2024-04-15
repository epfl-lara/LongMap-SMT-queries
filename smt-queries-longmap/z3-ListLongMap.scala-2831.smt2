; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40936 () Bool)

(assert start!40936)

(declare-fun b_free!10885 () Bool)

(declare-fun b_next!10885 () Bool)

(assert (=> start!40936 (= b_free!10885 (not b_next!10885))))

(declare-fun tp!38481 () Bool)

(declare-fun b_and!19001 () Bool)

(assert (=> start!40936 (= tp!38481 b_and!19001)))

(declare-fun mapIsEmpty!19975 () Bool)

(declare-fun mapRes!19975 () Bool)

(assert (=> mapIsEmpty!19975 mapRes!19975))

(declare-fun b!455266 () Bool)

(declare-fun e!266146 () Bool)

(assert (=> b!455266 (= e!266146 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17403 0))(
  ( (V!17404 (val!6156 Int)) )
))
(declare-fun minValue!515 () V!17403)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!28241 0))(
  ( (array!28242 (arr!13564 (Array (_ BitVec 32) (_ BitVec 64))) (size!13917 (_ BitVec 32))) )
))
(declare-fun lt!206122 () array!28241)

(declare-datatypes ((tuple2!8126 0))(
  ( (tuple2!8127 (_1!4074 (_ BitVec 64)) (_2!4074 V!17403)) )
))
(declare-datatypes ((List!8185 0))(
  ( (Nil!8182) (Cons!8181 (h!9037 tuple2!8126) (t!14004 List!8185)) )
))
(declare-datatypes ((ListLongMap!7029 0))(
  ( (ListLongMap!7030 (toList!3530 List!8185)) )
))
(declare-fun lt!206121 () ListLongMap!7029)

(declare-datatypes ((ValueCell!5768 0))(
  ( (ValueCellFull!5768 (v!8416 V!17403)) (EmptyCell!5768) )
))
(declare-datatypes ((array!28243 0))(
  ( (array!28244 (arr!13565 (Array (_ BitVec 32) ValueCell!5768)) (size!13918 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28243)

(declare-fun zeroValue!515 () V!17403)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17403)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1725 (array!28241 array!28243 (_ BitVec 32) (_ BitVec 32) V!17403 V!17403 (_ BitVec 32) Int) ListLongMap!7029)

(assert (=> b!455266 (= lt!206121 (getCurrentListMapNoExtraKeys!1725 lt!206122 (array!28244 (store (arr!13565 _values!549) i!563 (ValueCellFull!5768 v!412)) (size!13918 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206123 () ListLongMap!7029)

(declare-fun _keys!709 () array!28241)

(assert (=> b!455266 (= lt!206123 (getCurrentListMapNoExtraKeys!1725 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455267 () Bool)

(declare-fun e!266149 () Bool)

(assert (=> b!455267 (= e!266149 e!266146)))

(declare-fun res!271518 () Bool)

(assert (=> b!455267 (=> (not res!271518) (not e!266146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28241 (_ BitVec 32)) Bool)

(assert (=> b!455267 (= res!271518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206122 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455267 (= lt!206122 (array!28242 (store (arr!13564 _keys!709) i!563 k0!794) (size!13917 _keys!709)))))

(declare-fun b!455268 () Bool)

(declare-fun res!271520 () Bool)

(assert (=> b!455268 (=> (not res!271520) (not e!266149))))

(assert (=> b!455268 (= res!271520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455269 () Bool)

(declare-fun res!271516 () Bool)

(assert (=> b!455269 (=> (not res!271516) (not e!266146))))

(declare-datatypes ((List!8186 0))(
  ( (Nil!8183) (Cons!8182 (h!9038 (_ BitVec 64)) (t!14005 List!8186)) )
))
(declare-fun arrayNoDuplicates!0 (array!28241 (_ BitVec 32) List!8186) Bool)

(assert (=> b!455269 (= res!271516 (arrayNoDuplicates!0 lt!206122 #b00000000000000000000000000000000 Nil!8183))))

(declare-fun b!455270 () Bool)

(declare-fun res!271522 () Bool)

(assert (=> b!455270 (=> (not res!271522) (not e!266146))))

(assert (=> b!455270 (= res!271522 (bvsle from!863 i!563))))

(declare-fun b!455271 () Bool)

(declare-fun e!266145 () Bool)

(declare-fun tp_is_empty!12223 () Bool)

(assert (=> b!455271 (= e!266145 tp_is_empty!12223)))

(declare-fun b!455272 () Bool)

(declare-fun res!271525 () Bool)

(assert (=> b!455272 (=> (not res!271525) (not e!266149))))

(declare-fun arrayContainsKey!0 (array!28241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455272 (= res!271525 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455273 () Bool)

(declare-fun res!271515 () Bool)

(assert (=> b!455273 (=> (not res!271515) (not e!266149))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455273 (= res!271515 (validKeyInArray!0 k0!794))))

(declare-fun b!455274 () Bool)

(declare-fun e!266148 () Bool)

(declare-fun e!266147 () Bool)

(assert (=> b!455274 (= e!266148 (and e!266147 mapRes!19975))))

(declare-fun condMapEmpty!19975 () Bool)

(declare-fun mapDefault!19975 () ValueCell!5768)

(assert (=> b!455274 (= condMapEmpty!19975 (= (arr!13565 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5768)) mapDefault!19975)))))

(declare-fun mapNonEmpty!19975 () Bool)

(declare-fun tp!38482 () Bool)

(assert (=> mapNonEmpty!19975 (= mapRes!19975 (and tp!38482 e!266145))))

(declare-fun mapRest!19975 () (Array (_ BitVec 32) ValueCell!5768))

(declare-fun mapKey!19975 () (_ BitVec 32))

(declare-fun mapValue!19975 () ValueCell!5768)

(assert (=> mapNonEmpty!19975 (= (arr!13565 _values!549) (store mapRest!19975 mapKey!19975 mapValue!19975))))

(declare-fun b!455275 () Bool)

(declare-fun res!271517 () Bool)

(assert (=> b!455275 (=> (not res!271517) (not e!266149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455275 (= res!271517 (validMask!0 mask!1025))))

(declare-fun b!455276 () Bool)

(assert (=> b!455276 (= e!266147 tp_is_empty!12223)))

(declare-fun res!271526 () Bool)

(assert (=> start!40936 (=> (not res!271526) (not e!266149))))

(assert (=> start!40936 (= res!271526 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13917 _keys!709))))))

(assert (=> start!40936 e!266149))

(assert (=> start!40936 tp_is_empty!12223))

(assert (=> start!40936 tp!38481))

(assert (=> start!40936 true))

(declare-fun array_inv!9884 (array!28243) Bool)

(assert (=> start!40936 (and (array_inv!9884 _values!549) e!266148)))

(declare-fun array_inv!9885 (array!28241) Bool)

(assert (=> start!40936 (array_inv!9885 _keys!709)))

(declare-fun b!455277 () Bool)

(declare-fun res!271521 () Bool)

(assert (=> b!455277 (=> (not res!271521) (not e!266149))))

(assert (=> b!455277 (= res!271521 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13917 _keys!709))))))

(declare-fun b!455278 () Bool)

(declare-fun res!271523 () Bool)

(assert (=> b!455278 (=> (not res!271523) (not e!266149))))

(assert (=> b!455278 (= res!271523 (or (= (select (arr!13564 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13564 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455279 () Bool)

(declare-fun res!271519 () Bool)

(assert (=> b!455279 (=> (not res!271519) (not e!266149))))

(assert (=> b!455279 (= res!271519 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8183))))

(declare-fun b!455280 () Bool)

(declare-fun res!271524 () Bool)

(assert (=> b!455280 (=> (not res!271524) (not e!266149))))

(assert (=> b!455280 (= res!271524 (and (= (size!13918 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13917 _keys!709) (size!13918 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40936 res!271526) b!455275))

(assert (= (and b!455275 res!271517) b!455280))

(assert (= (and b!455280 res!271524) b!455268))

(assert (= (and b!455268 res!271520) b!455279))

(assert (= (and b!455279 res!271519) b!455277))

(assert (= (and b!455277 res!271521) b!455273))

(assert (= (and b!455273 res!271515) b!455278))

(assert (= (and b!455278 res!271523) b!455272))

(assert (= (and b!455272 res!271525) b!455267))

(assert (= (and b!455267 res!271518) b!455269))

(assert (= (and b!455269 res!271516) b!455270))

(assert (= (and b!455270 res!271522) b!455266))

(assert (= (and b!455274 condMapEmpty!19975) mapIsEmpty!19975))

(assert (= (and b!455274 (not condMapEmpty!19975)) mapNonEmpty!19975))

(get-info :version)

(assert (= (and mapNonEmpty!19975 ((_ is ValueCellFull!5768) mapValue!19975)) b!455271))

(assert (= (and b!455274 ((_ is ValueCellFull!5768) mapDefault!19975)) b!455276))

(assert (= start!40936 b!455274))

(declare-fun m!438557 () Bool)

(assert (=> start!40936 m!438557))

(declare-fun m!438559 () Bool)

(assert (=> start!40936 m!438559))

(declare-fun m!438561 () Bool)

(assert (=> b!455275 m!438561))

(declare-fun m!438563 () Bool)

(assert (=> mapNonEmpty!19975 m!438563))

(declare-fun m!438565 () Bool)

(assert (=> b!455272 m!438565))

(declare-fun m!438567 () Bool)

(assert (=> b!455269 m!438567))

(declare-fun m!438569 () Bool)

(assert (=> b!455279 m!438569))

(declare-fun m!438571 () Bool)

(assert (=> b!455267 m!438571))

(declare-fun m!438573 () Bool)

(assert (=> b!455267 m!438573))

(declare-fun m!438575 () Bool)

(assert (=> b!455268 m!438575))

(declare-fun m!438577 () Bool)

(assert (=> b!455273 m!438577))

(declare-fun m!438579 () Bool)

(assert (=> b!455266 m!438579))

(declare-fun m!438581 () Bool)

(assert (=> b!455266 m!438581))

(declare-fun m!438583 () Bool)

(assert (=> b!455266 m!438583))

(declare-fun m!438585 () Bool)

(assert (=> b!455278 m!438585))

(check-sat tp_is_empty!12223 (not b!455279) (not b!455269) (not start!40936) (not b!455268) (not mapNonEmpty!19975) (not b!455275) (not b!455272) (not b!455273) (not b!455267) (not b_next!10885) b_and!19001 (not b!455266))
(check-sat b_and!19001 (not b_next!10885))
