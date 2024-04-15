; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40190 () Bool)

(assert start!40190)

(declare-fun b_free!10471 () Bool)

(declare-fun b_next!10471 () Bool)

(assert (=> start!40190 (= b_free!10471 (not b_next!10471))))

(declare-fun tp!36941 () Bool)

(declare-fun b_and!18413 () Bool)

(assert (=> start!40190 (= tp!36941 b_and!18413)))

(declare-fun b!440389 () Bool)

(declare-fun res!260547 () Bool)

(declare-fun e!259414 () Bool)

(assert (=> b!440389 (=> (not res!260547) (not e!259414))))

(declare-datatypes ((array!27063 0))(
  ( (array!27064 (arr!12981 (Array (_ BitVec 32) (_ BitVec 64))) (size!13334 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27063)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440389 (= res!260547 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440390 () Bool)

(declare-fun e!259419 () Bool)

(declare-fun e!259418 () Bool)

(assert (=> b!440390 (= e!259419 e!259418)))

(declare-fun res!260559 () Bool)

(assert (=> b!440390 (=> (not res!260559) (not e!259418))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440390 (= res!260559 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16603 0))(
  ( (V!16604 (val!5856 Int)) )
))
(declare-fun minValue!515 () V!16603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5468 0))(
  ( (ValueCellFull!5468 (v!8097 V!16603)) (EmptyCell!5468) )
))
(declare-datatypes ((array!27065 0))(
  ( (array!27066 (arr!12982 (Array (_ BitVec 32) ValueCell!5468)) (size!13335 (_ BitVec 32))) )
))
(declare-fun lt!202418 () array!27065)

(declare-datatypes ((tuple2!7802 0))(
  ( (tuple2!7803 (_1!3912 (_ BitVec 64)) (_2!3912 V!16603)) )
))
(declare-datatypes ((List!7788 0))(
  ( (Nil!7785) (Cons!7784 (h!8640 tuple2!7802) (t!13535 List!7788)) )
))
(declare-datatypes ((ListLongMap!6705 0))(
  ( (ListLongMap!6706 (toList!3368 List!7788)) )
))
(declare-fun lt!202417 () ListLongMap!6705)

(declare-fun zeroValue!515 () V!16603)

(declare-fun lt!202421 () array!27063)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1567 (array!27063 array!27065 (_ BitVec 32) (_ BitVec 32) V!16603 V!16603 (_ BitVec 32) Int) ListLongMap!6705)

(assert (=> b!440390 (= lt!202417 (getCurrentListMapNoExtraKeys!1567 lt!202421 lt!202418 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27065)

(declare-fun v!412 () V!16603)

(assert (=> b!440390 (= lt!202418 (array!27066 (store (arr!12982 _values!549) i!563 (ValueCellFull!5468 v!412)) (size!13335 _values!549)))))

(declare-fun lt!202419 () ListLongMap!6705)

(assert (=> b!440390 (= lt!202419 (getCurrentListMapNoExtraKeys!1567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440391 () Bool)

(assert (=> b!440391 (= e!259418 (not true))))

(declare-fun +!1529 (ListLongMap!6705 tuple2!7802) ListLongMap!6705)

(assert (=> b!440391 (= (getCurrentListMapNoExtraKeys!1567 lt!202421 lt!202418 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1529 (getCurrentListMapNoExtraKeys!1567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7803 k0!794 v!412)))))

(declare-datatypes ((Unit!13075 0))(
  ( (Unit!13076) )
))
(declare-fun lt!202420 () Unit!13075)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 (array!27063 array!27065 (_ BitVec 32) (_ BitVec 32) V!16603 V!16603 (_ BitVec 32) (_ BitVec 64) V!16603 (_ BitVec 32) Int) Unit!13075)

(assert (=> b!440391 (= lt!202420 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!667 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440392 () Bool)

(declare-fun res!260553 () Bool)

(assert (=> b!440392 (=> (not res!260553) (not e!259414))))

(assert (=> b!440392 (= res!260553 (or (= (select (arr!12981 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12981 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440393 () Bool)

(declare-fun e!259413 () Bool)

(declare-fun tp_is_empty!11623 () Bool)

(assert (=> b!440393 (= e!259413 tp_is_empty!11623)))

(declare-fun b!440394 () Bool)

(declare-fun res!260551 () Bool)

(assert (=> b!440394 (=> (not res!260551) (not e!259414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440394 (= res!260551 (validMask!0 mask!1025))))

(declare-fun b!440395 () Bool)

(declare-fun res!260550 () Bool)

(assert (=> b!440395 (=> (not res!260550) (not e!259414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27063 (_ BitVec 32)) Bool)

(assert (=> b!440395 (= res!260550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!260556 () Bool)

(assert (=> start!40190 (=> (not res!260556) (not e!259414))))

(assert (=> start!40190 (= res!260556 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13334 _keys!709))))))

(assert (=> start!40190 e!259414))

(assert (=> start!40190 tp_is_empty!11623))

(assert (=> start!40190 tp!36941))

(assert (=> start!40190 true))

(declare-fun e!259415 () Bool)

(declare-fun array_inv!9468 (array!27065) Bool)

(assert (=> start!40190 (and (array_inv!9468 _values!549) e!259415)))

(declare-fun array_inv!9469 (array!27063) Bool)

(assert (=> start!40190 (array_inv!9469 _keys!709)))

(declare-fun mapIsEmpty!19056 () Bool)

(declare-fun mapRes!19056 () Bool)

(assert (=> mapIsEmpty!19056 mapRes!19056))

(declare-fun b!440396 () Bool)

(declare-fun res!260552 () Bool)

(assert (=> b!440396 (=> (not res!260552) (not e!259414))))

(assert (=> b!440396 (= res!260552 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13334 _keys!709))))))

(declare-fun b!440397 () Bool)

(declare-fun res!260555 () Bool)

(assert (=> b!440397 (=> (not res!260555) (not e!259414))))

(assert (=> b!440397 (= res!260555 (and (= (size!13335 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13334 _keys!709) (size!13335 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19056 () Bool)

(declare-fun tp!36942 () Bool)

(declare-fun e!259416 () Bool)

(assert (=> mapNonEmpty!19056 (= mapRes!19056 (and tp!36942 e!259416))))

(declare-fun mapRest!19056 () (Array (_ BitVec 32) ValueCell!5468))

(declare-fun mapValue!19056 () ValueCell!5468)

(declare-fun mapKey!19056 () (_ BitVec 32))

(assert (=> mapNonEmpty!19056 (= (arr!12982 _values!549) (store mapRest!19056 mapKey!19056 mapValue!19056))))

(declare-fun b!440398 () Bool)

(declare-fun res!260554 () Bool)

(assert (=> b!440398 (=> (not res!260554) (not e!259419))))

(declare-datatypes ((List!7789 0))(
  ( (Nil!7786) (Cons!7785 (h!8641 (_ BitVec 64)) (t!13536 List!7789)) )
))
(declare-fun arrayNoDuplicates!0 (array!27063 (_ BitVec 32) List!7789) Bool)

(assert (=> b!440398 (= res!260554 (arrayNoDuplicates!0 lt!202421 #b00000000000000000000000000000000 Nil!7786))))

(declare-fun b!440399 () Bool)

(assert (=> b!440399 (= e!259415 (and e!259413 mapRes!19056))))

(declare-fun condMapEmpty!19056 () Bool)

(declare-fun mapDefault!19056 () ValueCell!5468)

(assert (=> b!440399 (= condMapEmpty!19056 (= (arr!12982 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5468)) mapDefault!19056)))))

(declare-fun b!440400 () Bool)

(declare-fun res!260558 () Bool)

(assert (=> b!440400 (=> (not res!260558) (not e!259419))))

(assert (=> b!440400 (= res!260558 (bvsle from!863 i!563))))

(declare-fun b!440401 () Bool)

(declare-fun res!260549 () Bool)

(assert (=> b!440401 (=> (not res!260549) (not e!259414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440401 (= res!260549 (validKeyInArray!0 k0!794))))

(declare-fun b!440402 () Bool)

(assert (=> b!440402 (= e!259416 tp_is_empty!11623)))

(declare-fun b!440403 () Bool)

(declare-fun res!260548 () Bool)

(assert (=> b!440403 (=> (not res!260548) (not e!259414))))

(assert (=> b!440403 (= res!260548 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7786))))

(declare-fun b!440404 () Bool)

(assert (=> b!440404 (= e!259414 e!259419)))

(declare-fun res!260557 () Bool)

(assert (=> b!440404 (=> (not res!260557) (not e!259419))))

(assert (=> b!440404 (= res!260557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202421 mask!1025))))

(assert (=> b!440404 (= lt!202421 (array!27064 (store (arr!12981 _keys!709) i!563 k0!794) (size!13334 _keys!709)))))

(assert (= (and start!40190 res!260556) b!440394))

(assert (= (and b!440394 res!260551) b!440397))

(assert (= (and b!440397 res!260555) b!440395))

(assert (= (and b!440395 res!260550) b!440403))

(assert (= (and b!440403 res!260548) b!440396))

(assert (= (and b!440396 res!260552) b!440401))

(assert (= (and b!440401 res!260549) b!440392))

(assert (= (and b!440392 res!260553) b!440389))

(assert (= (and b!440389 res!260547) b!440404))

(assert (= (and b!440404 res!260557) b!440398))

(assert (= (and b!440398 res!260554) b!440400))

(assert (= (and b!440400 res!260558) b!440390))

(assert (= (and b!440390 res!260559) b!440391))

(assert (= (and b!440399 condMapEmpty!19056) mapIsEmpty!19056))

(assert (= (and b!440399 (not condMapEmpty!19056)) mapNonEmpty!19056))

(get-info :version)

(assert (= (and mapNonEmpty!19056 ((_ is ValueCellFull!5468) mapValue!19056)) b!440402))

(assert (= (and b!440399 ((_ is ValueCellFull!5468) mapDefault!19056)) b!440393))

(assert (= start!40190 b!440399))

(declare-fun m!426927 () Bool)

(assert (=> b!440403 m!426927))

(declare-fun m!426929 () Bool)

(assert (=> b!440394 m!426929))

(declare-fun m!426931 () Bool)

(assert (=> b!440392 m!426931))

(declare-fun m!426933 () Bool)

(assert (=> b!440391 m!426933))

(declare-fun m!426935 () Bool)

(assert (=> b!440391 m!426935))

(assert (=> b!440391 m!426935))

(declare-fun m!426937 () Bool)

(assert (=> b!440391 m!426937))

(declare-fun m!426939 () Bool)

(assert (=> b!440391 m!426939))

(declare-fun m!426941 () Bool)

(assert (=> b!440404 m!426941))

(declare-fun m!426943 () Bool)

(assert (=> b!440404 m!426943))

(declare-fun m!426945 () Bool)

(assert (=> b!440401 m!426945))

(declare-fun m!426947 () Bool)

(assert (=> b!440389 m!426947))

(declare-fun m!426949 () Bool)

(assert (=> start!40190 m!426949))

(declare-fun m!426951 () Bool)

(assert (=> start!40190 m!426951))

(declare-fun m!426953 () Bool)

(assert (=> b!440395 m!426953))

(declare-fun m!426955 () Bool)

(assert (=> b!440390 m!426955))

(declare-fun m!426957 () Bool)

(assert (=> b!440390 m!426957))

(declare-fun m!426959 () Bool)

(assert (=> b!440390 m!426959))

(declare-fun m!426961 () Bool)

(assert (=> b!440398 m!426961))

(declare-fun m!426963 () Bool)

(assert (=> mapNonEmpty!19056 m!426963))

(check-sat b_and!18413 (not b!440394) (not b_next!10471) (not b!440404) tp_is_empty!11623 (not b!440389) (not b!440403) (not b!440398) (not start!40190) (not b!440390) (not b!440391) (not b!440395) (not b!440401) (not mapNonEmpty!19056))
(check-sat b_and!18413 (not b_next!10471))
