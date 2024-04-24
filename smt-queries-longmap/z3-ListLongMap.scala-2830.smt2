; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40930 () Bool)

(assert start!40930)

(declare-fun b_free!10879 () Bool)

(declare-fun b_next!10879 () Bool)

(assert (=> start!40930 (= b_free!10879 (not b_next!10879))))

(declare-fun tp!38463 () Bool)

(declare-fun b_and!19031 () Bool)

(assert (=> start!40930 (= tp!38463 b_and!19031)))

(declare-fun b!455341 () Bool)

(declare-fun res!271535 () Bool)

(declare-fun e!266225 () Bool)

(assert (=> b!455341 (=> (not res!271535) (not e!266225))))

(declare-datatypes ((array!28228 0))(
  ( (array!28229 (arr!13557 (Array (_ BitVec 32) (_ BitVec 64))) (size!13909 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28228)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455341 (= res!271535 (or (= (select (arr!13557 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13557 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455342 () Bool)

(declare-fun res!271537 () Bool)

(assert (=> b!455342 (=> (not res!271537) (not e!266225))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28228 (_ BitVec 32)) Bool)

(assert (=> b!455342 (= res!271537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455343 () Bool)

(declare-fun res!271538 () Bool)

(declare-fun e!266228 () Bool)

(assert (=> b!455343 (=> (not res!271538) (not e!266228))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!455343 (= res!271538 (bvsle from!863 i!563))))

(declare-fun b!455344 () Bool)

(declare-fun res!271532 () Bool)

(assert (=> b!455344 (=> (not res!271532) (not e!266225))))

(declare-datatypes ((List!8084 0))(
  ( (Nil!8081) (Cons!8080 (h!8936 (_ BitVec 64)) (t!13904 List!8084)) )
))
(declare-fun arrayNoDuplicates!0 (array!28228 (_ BitVec 32) List!8084) Bool)

(assert (=> b!455344 (= res!271532 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8081))))

(declare-fun mapIsEmpty!19966 () Bool)

(declare-fun mapRes!19966 () Bool)

(assert (=> mapIsEmpty!19966 mapRes!19966))

(declare-fun b!455345 () Bool)

(assert (=> b!455345 (= e!266228 false)))

(declare-datatypes ((V!17395 0))(
  ( (V!17396 (val!6153 Int)) )
))
(declare-fun minValue!515 () V!17395)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5765 0))(
  ( (ValueCellFull!5765 (v!8420 V!17395)) (EmptyCell!5765) )
))
(declare-datatypes ((array!28230 0))(
  ( (array!28231 (arr!13558 (Array (_ BitVec 32) ValueCell!5765)) (size!13910 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28230)

(declare-fun zeroValue!515 () V!17395)

(declare-fun v!412 () V!17395)

(declare-fun lt!206340 () array!28228)

(declare-datatypes ((tuple2!8014 0))(
  ( (tuple2!8015 (_1!4018 (_ BitVec 64)) (_2!4018 V!17395)) )
))
(declare-datatypes ((List!8085 0))(
  ( (Nil!8082) (Cons!8081 (h!8937 tuple2!8014) (t!13905 List!8085)) )
))
(declare-datatypes ((ListLongMap!6929 0))(
  ( (ListLongMap!6930 (toList!3480 List!8085)) )
))
(declare-fun lt!206342 () ListLongMap!6929)

(declare-fun getCurrentListMapNoExtraKeys!1709 (array!28228 array!28230 (_ BitVec 32) (_ BitVec 32) V!17395 V!17395 (_ BitVec 32) Int) ListLongMap!6929)

(assert (=> b!455345 (= lt!206342 (getCurrentListMapNoExtraKeys!1709 lt!206340 (array!28231 (store (arr!13558 _values!549) i!563 (ValueCellFull!5765 v!412)) (size!13910 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206341 () ListLongMap!6929)

(assert (=> b!455345 (= lt!206341 (getCurrentListMapNoExtraKeys!1709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455346 () Bool)

(declare-fun res!271533 () Bool)

(assert (=> b!455346 (=> (not res!271533) (not e!266225))))

(assert (=> b!455346 (= res!271533 (and (= (size!13910 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13909 _keys!709) (size!13910 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455347 () Bool)

(assert (=> b!455347 (= e!266225 e!266228)))

(declare-fun res!271539 () Bool)

(assert (=> b!455347 (=> (not res!271539) (not e!266228))))

(assert (=> b!455347 (= res!271539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206340 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!455347 (= lt!206340 (array!28229 (store (arr!13557 _keys!709) i!563 k0!794) (size!13909 _keys!709)))))

(declare-fun b!455348 () Bool)

(declare-fun res!271530 () Bool)

(assert (=> b!455348 (=> (not res!271530) (not e!266225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455348 (= res!271530 (validMask!0 mask!1025))))

(declare-fun b!455349 () Bool)

(declare-fun res!271534 () Bool)

(assert (=> b!455349 (=> (not res!271534) (not e!266225))))

(assert (=> b!455349 (= res!271534 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13909 _keys!709))))))

(declare-fun b!455350 () Bool)

(declare-fun res!271531 () Bool)

(assert (=> b!455350 (=> (not res!271531) (not e!266225))))

(declare-fun arrayContainsKey!0 (array!28228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455350 (= res!271531 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455351 () Bool)

(declare-fun res!271540 () Bool)

(assert (=> b!455351 (=> (not res!271540) (not e!266228))))

(assert (=> b!455351 (= res!271540 (arrayNoDuplicates!0 lt!206340 #b00000000000000000000000000000000 Nil!8081))))

(declare-fun b!455352 () Bool)

(declare-fun e!266229 () Bool)

(declare-fun tp_is_empty!12217 () Bool)

(assert (=> b!455352 (= e!266229 tp_is_empty!12217)))

(declare-fun res!271536 () Bool)

(assert (=> start!40930 (=> (not res!271536) (not e!266225))))

(assert (=> start!40930 (= res!271536 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13909 _keys!709))))))

(assert (=> start!40930 e!266225))

(assert (=> start!40930 tp_is_empty!12217))

(assert (=> start!40930 tp!38463))

(assert (=> start!40930 true))

(declare-fun e!266227 () Bool)

(declare-fun array_inv!9894 (array!28230) Bool)

(assert (=> start!40930 (and (array_inv!9894 _values!549) e!266227)))

(declare-fun array_inv!9895 (array!28228) Bool)

(assert (=> start!40930 (array_inv!9895 _keys!709)))

(declare-fun b!455353 () Bool)

(declare-fun e!266230 () Bool)

(assert (=> b!455353 (= e!266230 tp_is_empty!12217)))

(declare-fun b!455354 () Bool)

(declare-fun res!271529 () Bool)

(assert (=> b!455354 (=> (not res!271529) (not e!266225))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455354 (= res!271529 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19966 () Bool)

(declare-fun tp!38464 () Bool)

(assert (=> mapNonEmpty!19966 (= mapRes!19966 (and tp!38464 e!266230))))

(declare-fun mapRest!19966 () (Array (_ BitVec 32) ValueCell!5765))

(declare-fun mapKey!19966 () (_ BitVec 32))

(declare-fun mapValue!19966 () ValueCell!5765)

(assert (=> mapNonEmpty!19966 (= (arr!13558 _values!549) (store mapRest!19966 mapKey!19966 mapValue!19966))))

(declare-fun b!455355 () Bool)

(assert (=> b!455355 (= e!266227 (and e!266229 mapRes!19966))))

(declare-fun condMapEmpty!19966 () Bool)

(declare-fun mapDefault!19966 () ValueCell!5765)

(assert (=> b!455355 (= condMapEmpty!19966 (= (arr!13558 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5765)) mapDefault!19966)))))

(assert (= (and start!40930 res!271536) b!455348))

(assert (= (and b!455348 res!271530) b!455346))

(assert (= (and b!455346 res!271533) b!455342))

(assert (= (and b!455342 res!271537) b!455344))

(assert (= (and b!455344 res!271532) b!455349))

(assert (= (and b!455349 res!271534) b!455354))

(assert (= (and b!455354 res!271529) b!455341))

(assert (= (and b!455341 res!271535) b!455350))

(assert (= (and b!455350 res!271531) b!455347))

(assert (= (and b!455347 res!271539) b!455351))

(assert (= (and b!455351 res!271540) b!455343))

(assert (= (and b!455343 res!271538) b!455345))

(assert (= (and b!455355 condMapEmpty!19966) mapIsEmpty!19966))

(assert (= (and b!455355 (not condMapEmpty!19966)) mapNonEmpty!19966))

(get-info :version)

(assert (= (and mapNonEmpty!19966 ((_ is ValueCellFull!5765) mapValue!19966)) b!455353))

(assert (= (and b!455355 ((_ is ValueCellFull!5765) mapDefault!19966)) b!455352))

(assert (= start!40930 b!455355))

(declare-fun m!439383 () Bool)

(assert (=> b!455347 m!439383))

(declare-fun m!439385 () Bool)

(assert (=> b!455347 m!439385))

(declare-fun m!439387 () Bool)

(assert (=> b!455342 m!439387))

(declare-fun m!439389 () Bool)

(assert (=> mapNonEmpty!19966 m!439389))

(declare-fun m!439391 () Bool)

(assert (=> b!455341 m!439391))

(declare-fun m!439393 () Bool)

(assert (=> b!455351 m!439393))

(declare-fun m!439395 () Bool)

(assert (=> b!455345 m!439395))

(declare-fun m!439397 () Bool)

(assert (=> b!455345 m!439397))

(declare-fun m!439399 () Bool)

(assert (=> b!455345 m!439399))

(declare-fun m!439401 () Bool)

(assert (=> b!455348 m!439401))

(declare-fun m!439403 () Bool)

(assert (=> b!455350 m!439403))

(declare-fun m!439405 () Bool)

(assert (=> start!40930 m!439405))

(declare-fun m!439407 () Bool)

(assert (=> start!40930 m!439407))

(declare-fun m!439409 () Bool)

(assert (=> b!455344 m!439409))

(declare-fun m!439411 () Bool)

(assert (=> b!455354 m!439411))

(check-sat (not b!455350) (not b!455354) (not b!455344) (not b!455342) (not b!455351) b_and!19031 (not b_next!10879) (not b!455348) (not b!455345) (not mapNonEmpty!19966) (not b!455347) tp_is_empty!12217 (not start!40930))
(check-sat b_and!19031 (not b_next!10879))
