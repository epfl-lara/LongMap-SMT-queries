; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40946 () Bool)

(assert start!40946)

(declare-fun b_free!10881 () Bool)

(declare-fun b_next!10881 () Bool)

(assert (=> start!40946 (= b_free!10881 (not b_next!10881))))

(declare-fun tp!38469 () Bool)

(declare-fun b_and!19023 () Bool)

(assert (=> start!40946 (= tp!38469 b_and!19023)))

(declare-fun b!455447 () Bool)

(declare-fun res!271574 () Bool)

(declare-fun e!266287 () Bool)

(assert (=> b!455447 (=> (not res!271574) (not e!266287))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455447 (= res!271574 (validMask!0 mask!1025))))

(declare-fun b!455448 () Bool)

(declare-fun e!266285 () Bool)

(assert (=> b!455448 (= e!266287 e!266285)))

(declare-fun res!271573 () Bool)

(assert (=> b!455448 (=> (not res!271573) (not e!266285))))

(declare-datatypes ((array!28241 0))(
  ( (array!28242 (arr!13564 (Array (_ BitVec 32) (_ BitVec 64))) (size!13916 (_ BitVec 32))) )
))
(declare-fun lt!206337 () array!28241)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28241 (_ BitVec 32)) Bool)

(assert (=> b!455448 (= res!271573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206337 mask!1025))))

(declare-fun _keys!709 () array!28241)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455448 (= lt!206337 (array!28242 (store (arr!13564 _keys!709) i!563 k0!794) (size!13916 _keys!709)))))

(declare-fun b!455449 () Bool)

(declare-fun e!266286 () Bool)

(declare-fun tp_is_empty!12219 () Bool)

(assert (=> b!455449 (= e!266286 tp_is_empty!12219)))

(declare-fun b!455450 () Bool)

(declare-fun res!271579 () Bool)

(assert (=> b!455450 (=> (not res!271579) (not e!266287))))

(assert (=> b!455450 (= res!271579 (or (= (select (arr!13564 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13564 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455451 () Bool)

(declare-fun res!271578 () Bool)

(assert (=> b!455451 (=> (not res!271578) (not e!266285))))

(declare-datatypes ((List!8175 0))(
  ( (Nil!8172) (Cons!8171 (h!9027 (_ BitVec 64)) (t!14003 List!8175)) )
))
(declare-fun arrayNoDuplicates!0 (array!28241 (_ BitVec 32) List!8175) Bool)

(assert (=> b!455451 (= res!271578 (arrayNoDuplicates!0 lt!206337 #b00000000000000000000000000000000 Nil!8172))))

(declare-fun b!455452 () Bool)

(declare-fun e!266283 () Bool)

(declare-fun mapRes!19969 () Bool)

(assert (=> b!455452 (= e!266283 (and e!266286 mapRes!19969))))

(declare-fun condMapEmpty!19969 () Bool)

(declare-datatypes ((V!17397 0))(
  ( (V!17398 (val!6154 Int)) )
))
(declare-datatypes ((ValueCell!5766 0))(
  ( (ValueCellFull!5766 (v!8420 V!17397)) (EmptyCell!5766) )
))
(declare-datatypes ((array!28243 0))(
  ( (array!28244 (arr!13565 (Array (_ BitVec 32) ValueCell!5766)) (size!13917 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28243)

(declare-fun mapDefault!19969 () ValueCell!5766)

(assert (=> b!455452 (= condMapEmpty!19969 (= (arr!13565 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5766)) mapDefault!19969)))))

(declare-fun b!455453 () Bool)

(declare-fun res!271577 () Bool)

(assert (=> b!455453 (=> (not res!271577) (not e!266287))))

(assert (=> b!455453 (= res!271577 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8172))))

(declare-fun b!455454 () Bool)

(declare-fun res!271576 () Bool)

(assert (=> b!455454 (=> (not res!271576) (not e!266287))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455454 (= res!271576 (and (= (size!13917 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13916 _keys!709) (size!13917 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455455 () Bool)

(assert (=> b!455455 (= e!266285 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!17397)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17397)

(declare-datatypes ((tuple2!8110 0))(
  ( (tuple2!8111 (_1!4066 (_ BitVec 64)) (_2!4066 V!17397)) )
))
(declare-datatypes ((List!8176 0))(
  ( (Nil!8173) (Cons!8172 (h!9028 tuple2!8110) (t!14004 List!8176)) )
))
(declare-datatypes ((ListLongMap!7023 0))(
  ( (ListLongMap!7024 (toList!3527 List!8176)) )
))
(declare-fun lt!206339 () ListLongMap!7023)

(declare-fun v!412 () V!17397)

(declare-fun getCurrentListMapNoExtraKeys!1710 (array!28241 array!28243 (_ BitVec 32) (_ BitVec 32) V!17397 V!17397 (_ BitVec 32) Int) ListLongMap!7023)

(assert (=> b!455455 (= lt!206339 (getCurrentListMapNoExtraKeys!1710 lt!206337 (array!28244 (store (arr!13565 _values!549) i!563 (ValueCellFull!5766 v!412)) (size!13917 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206338 () ListLongMap!7023)

(assert (=> b!455455 (= lt!206338 (getCurrentListMapNoExtraKeys!1710 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!271575 () Bool)

(assert (=> start!40946 (=> (not res!271575) (not e!266287))))

(assert (=> start!40946 (= res!271575 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13916 _keys!709))))))

(assert (=> start!40946 e!266287))

(assert (=> start!40946 tp_is_empty!12219))

(assert (=> start!40946 tp!38469))

(assert (=> start!40946 true))

(declare-fun array_inv!9826 (array!28243) Bool)

(assert (=> start!40946 (and (array_inv!9826 _values!549) e!266283)))

(declare-fun array_inv!9827 (array!28241) Bool)

(assert (=> start!40946 (array_inv!9827 _keys!709)))

(declare-fun b!455456 () Bool)

(declare-fun res!271572 () Bool)

(assert (=> b!455456 (=> (not res!271572) (not e!266287))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455456 (= res!271572 (validKeyInArray!0 k0!794))))

(declare-fun b!455457 () Bool)

(declare-fun res!271582 () Bool)

(assert (=> b!455457 (=> (not res!271582) (not e!266287))))

(assert (=> b!455457 (= res!271582 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13916 _keys!709))))))

(declare-fun b!455458 () Bool)

(declare-fun res!271580 () Bool)

(assert (=> b!455458 (=> (not res!271580) (not e!266285))))

(assert (=> b!455458 (= res!271580 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19969 () Bool)

(declare-fun tp!38470 () Bool)

(declare-fun e!266284 () Bool)

(assert (=> mapNonEmpty!19969 (= mapRes!19969 (and tp!38470 e!266284))))

(declare-fun mapValue!19969 () ValueCell!5766)

(declare-fun mapRest!19969 () (Array (_ BitVec 32) ValueCell!5766))

(declare-fun mapKey!19969 () (_ BitVec 32))

(assert (=> mapNonEmpty!19969 (= (arr!13565 _values!549) (store mapRest!19969 mapKey!19969 mapValue!19969))))

(declare-fun b!455459 () Bool)

(assert (=> b!455459 (= e!266284 tp_is_empty!12219)))

(declare-fun b!455460 () Bool)

(declare-fun res!271583 () Bool)

(assert (=> b!455460 (=> (not res!271583) (not e!266287))))

(declare-fun arrayContainsKey!0 (array!28241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455460 (= res!271583 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455461 () Bool)

(declare-fun res!271581 () Bool)

(assert (=> b!455461 (=> (not res!271581) (not e!266287))))

(assert (=> b!455461 (= res!271581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19969 () Bool)

(assert (=> mapIsEmpty!19969 mapRes!19969))

(assert (= (and start!40946 res!271575) b!455447))

(assert (= (and b!455447 res!271574) b!455454))

(assert (= (and b!455454 res!271576) b!455461))

(assert (= (and b!455461 res!271581) b!455453))

(assert (= (and b!455453 res!271577) b!455457))

(assert (= (and b!455457 res!271582) b!455456))

(assert (= (and b!455456 res!271572) b!455450))

(assert (= (and b!455450 res!271579) b!455460))

(assert (= (and b!455460 res!271583) b!455448))

(assert (= (and b!455448 res!271573) b!455451))

(assert (= (and b!455451 res!271578) b!455458))

(assert (= (and b!455458 res!271580) b!455455))

(assert (= (and b!455452 condMapEmpty!19969) mapIsEmpty!19969))

(assert (= (and b!455452 (not condMapEmpty!19969)) mapNonEmpty!19969))

(get-info :version)

(assert (= (and mapNonEmpty!19969 ((_ is ValueCellFull!5766) mapValue!19969)) b!455459))

(assert (= (and b!455452 ((_ is ValueCellFull!5766) mapDefault!19969)) b!455449))

(assert (= start!40946 b!455452))

(declare-fun m!439231 () Bool)

(assert (=> b!455451 m!439231))

(declare-fun m!439233 () Bool)

(assert (=> mapNonEmpty!19969 m!439233))

(declare-fun m!439235 () Bool)

(assert (=> b!455461 m!439235))

(declare-fun m!439237 () Bool)

(assert (=> b!455448 m!439237))

(declare-fun m!439239 () Bool)

(assert (=> b!455448 m!439239))

(declare-fun m!439241 () Bool)

(assert (=> b!455456 m!439241))

(declare-fun m!439243 () Bool)

(assert (=> b!455455 m!439243))

(declare-fun m!439245 () Bool)

(assert (=> b!455455 m!439245))

(declare-fun m!439247 () Bool)

(assert (=> b!455455 m!439247))

(declare-fun m!439249 () Bool)

(assert (=> b!455447 m!439249))

(declare-fun m!439251 () Bool)

(assert (=> start!40946 m!439251))

(declare-fun m!439253 () Bool)

(assert (=> start!40946 m!439253))

(declare-fun m!439255 () Bool)

(assert (=> b!455453 m!439255))

(declare-fun m!439257 () Bool)

(assert (=> b!455460 m!439257))

(declare-fun m!439259 () Bool)

(assert (=> b!455450 m!439259))

(check-sat (not b!455461) (not b!455453) (not b!455451) (not b_next!10881) tp_is_empty!12219 (not b!455460) (not start!40946) (not b!455455) (not b!455447) (not b!455448) b_and!19023 (not mapNonEmpty!19969) (not b!455456))
(check-sat b_and!19023 (not b_next!10881))
