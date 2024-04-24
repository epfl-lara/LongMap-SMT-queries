; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40220 () Bool)

(assert start!40220)

(declare-fun b_free!10501 () Bool)

(declare-fun b_next!10501 () Bool)

(assert (=> start!40220 (= b_free!10501 (not b_next!10501))))

(declare-fun tp!37032 () Bool)

(declare-fun b_and!18483 () Bool)

(assert (=> start!40220 (= tp!37032 b_and!18483)))

(declare-fun b!441331 () Bool)

(declare-fun res!261268 () Bool)

(declare-fun e!259876 () Bool)

(assert (=> b!441331 (=> (not res!261268) (not e!259876))))

(declare-datatypes ((array!27126 0))(
  ( (array!27127 (arr!13012 (Array (_ BitVec 32) (_ BitVec 64))) (size!13364 (_ BitVec 32))) )
))
(declare-fun lt!202895 () array!27126)

(declare-datatypes ((List!7705 0))(
  ( (Nil!7702) (Cons!7701 (h!8557 (_ BitVec 64)) (t!13453 List!7705)) )
))
(declare-fun arrayNoDuplicates!0 (array!27126 (_ BitVec 32) List!7705) Bool)

(assert (=> b!441331 (= res!261268 (arrayNoDuplicates!0 lt!202895 #b00000000000000000000000000000000 Nil!7702))))

(declare-fun b!441332 () Bool)

(declare-fun res!261265 () Bool)

(declare-fun e!259875 () Bool)

(assert (=> b!441332 (=> (not res!261265) (not e!259875))))

(declare-fun _keys!709 () array!27126)

(assert (=> b!441332 (= res!261265 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7702))))

(declare-fun b!441333 () Bool)

(declare-fun res!261258 () Bool)

(assert (=> b!441333 (=> (not res!261258) (not e!259875))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441333 (= res!261258 (or (= (select (arr!13012 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13012 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441334 () Bool)

(declare-fun e!259872 () Bool)

(declare-fun tp_is_empty!11653 () Bool)

(assert (=> b!441334 (= e!259872 tp_is_empty!11653)))

(declare-fun b!441335 () Bool)

(declare-fun res!261269 () Bool)

(assert (=> b!441335 (=> (not res!261269) (not e!259875))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441335 (= res!261269 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441336 () Bool)

(declare-fun e!259874 () Bool)

(assert (=> b!441336 (= e!259874 (not true))))

(declare-datatypes ((V!16643 0))(
  ( (V!16644 (val!5871 Int)) )
))
(declare-fun minValue!515 () V!16643)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5483 0))(
  ( (ValueCellFull!5483 (v!8119 V!16643)) (EmptyCell!5483) )
))
(declare-datatypes ((array!27128 0))(
  ( (array!27129 (arr!13013 (Array (_ BitVec 32) ValueCell!5483)) (size!13365 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27128)

(declare-fun zeroValue!515 () V!16643)

(declare-fun lt!202897 () array!27128)

(declare-fun v!412 () V!16643)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7714 0))(
  ( (tuple2!7715 (_1!3868 (_ BitVec 64)) (_2!3868 V!16643)) )
))
(declare-datatypes ((List!7706 0))(
  ( (Nil!7703) (Cons!7702 (h!8558 tuple2!7714) (t!13454 List!7706)) )
))
(declare-datatypes ((ListLongMap!6629 0))(
  ( (ListLongMap!6630 (toList!3330 List!7706)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1563 (array!27126 array!27128 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) Int) ListLongMap!6629)

(declare-fun +!1519 (ListLongMap!6629 tuple2!7714) ListLongMap!6629)

(assert (=> b!441336 (= (getCurrentListMapNoExtraKeys!1563 lt!202895 lt!202897 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1519 (getCurrentListMapNoExtraKeys!1563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7715 k0!794 v!412)))))

(declare-datatypes ((Unit!13113 0))(
  ( (Unit!13114) )
))
(declare-fun lt!202898 () Unit!13113)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 (array!27126 array!27128 (_ BitVec 32) (_ BitVec 32) V!16643 V!16643 (_ BitVec 32) (_ BitVec 64) V!16643 (_ BitVec 32) Int) Unit!13113)

(assert (=> b!441336 (= lt!202898 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!679 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441338 () Bool)

(declare-fun e!259871 () Bool)

(assert (=> b!441338 (= e!259871 tp_is_empty!11653)))

(declare-fun b!441339 () Bool)

(declare-fun res!261267 () Bool)

(assert (=> b!441339 (=> (not res!261267) (not e!259875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441339 (= res!261267 (validMask!0 mask!1025))))

(declare-fun b!441340 () Bool)

(declare-fun res!261262 () Bool)

(assert (=> b!441340 (=> (not res!261262) (not e!259875))))

(assert (=> b!441340 (= res!261262 (and (= (size!13365 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13364 _keys!709) (size!13365 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441341 () Bool)

(declare-fun res!261270 () Bool)

(assert (=> b!441341 (=> (not res!261270) (not e!259875))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27126 (_ BitVec 32)) Bool)

(assert (=> b!441341 (= res!261270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441342 () Bool)

(declare-fun res!261260 () Bool)

(assert (=> b!441342 (=> (not res!261260) (not e!259876))))

(assert (=> b!441342 (= res!261260 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19101 () Bool)

(declare-fun mapRes!19101 () Bool)

(assert (=> mapIsEmpty!19101 mapRes!19101))

(declare-fun b!441343 () Bool)

(declare-fun e!259873 () Bool)

(assert (=> b!441343 (= e!259873 (and e!259871 mapRes!19101))))

(declare-fun condMapEmpty!19101 () Bool)

(declare-fun mapDefault!19101 () ValueCell!5483)

(assert (=> b!441343 (= condMapEmpty!19101 (= (arr!13013 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5483)) mapDefault!19101)))))

(declare-fun b!441337 () Bool)

(declare-fun res!261266 () Bool)

(assert (=> b!441337 (=> (not res!261266) (not e!259875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441337 (= res!261266 (validKeyInArray!0 k0!794))))

(declare-fun res!261264 () Bool)

(assert (=> start!40220 (=> (not res!261264) (not e!259875))))

(assert (=> start!40220 (= res!261264 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13364 _keys!709))))))

(assert (=> start!40220 e!259875))

(assert (=> start!40220 tp_is_empty!11653))

(assert (=> start!40220 tp!37032))

(assert (=> start!40220 true))

(declare-fun array_inv!9508 (array!27128) Bool)

(assert (=> start!40220 (and (array_inv!9508 _values!549) e!259873)))

(declare-fun array_inv!9509 (array!27126) Bool)

(assert (=> start!40220 (array_inv!9509 _keys!709)))

(declare-fun mapNonEmpty!19101 () Bool)

(declare-fun tp!37031 () Bool)

(assert (=> mapNonEmpty!19101 (= mapRes!19101 (and tp!37031 e!259872))))

(declare-fun mapRest!19101 () (Array (_ BitVec 32) ValueCell!5483))

(declare-fun mapKey!19101 () (_ BitVec 32))

(declare-fun mapValue!19101 () ValueCell!5483)

(assert (=> mapNonEmpty!19101 (= (arr!13013 _values!549) (store mapRest!19101 mapKey!19101 mapValue!19101))))

(declare-fun b!441344 () Bool)

(assert (=> b!441344 (= e!259875 e!259876)))

(declare-fun res!261261 () Bool)

(assert (=> b!441344 (=> (not res!261261) (not e!259876))))

(assert (=> b!441344 (= res!261261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202895 mask!1025))))

(assert (=> b!441344 (= lt!202895 (array!27127 (store (arr!13012 _keys!709) i!563 k0!794) (size!13364 _keys!709)))))

(declare-fun b!441345 () Bool)

(declare-fun res!261263 () Bool)

(assert (=> b!441345 (=> (not res!261263) (not e!259875))))

(assert (=> b!441345 (= res!261263 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13364 _keys!709))))))

(declare-fun b!441346 () Bool)

(assert (=> b!441346 (= e!259876 e!259874)))

(declare-fun res!261259 () Bool)

(assert (=> b!441346 (=> (not res!261259) (not e!259874))))

(assert (=> b!441346 (= res!261259 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202896 () ListLongMap!6629)

(assert (=> b!441346 (= lt!202896 (getCurrentListMapNoExtraKeys!1563 lt!202895 lt!202897 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441346 (= lt!202897 (array!27129 (store (arr!13013 _values!549) i!563 (ValueCellFull!5483 v!412)) (size!13365 _values!549)))))

(declare-fun lt!202899 () ListLongMap!6629)

(assert (=> b!441346 (= lt!202899 (getCurrentListMapNoExtraKeys!1563 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!40220 res!261264) b!441339))

(assert (= (and b!441339 res!261267) b!441340))

(assert (= (and b!441340 res!261262) b!441341))

(assert (= (and b!441341 res!261270) b!441332))

(assert (= (and b!441332 res!261265) b!441345))

(assert (= (and b!441345 res!261263) b!441337))

(assert (= (and b!441337 res!261266) b!441333))

(assert (= (and b!441333 res!261258) b!441335))

(assert (= (and b!441335 res!261269) b!441344))

(assert (= (and b!441344 res!261261) b!441331))

(assert (= (and b!441331 res!261268) b!441342))

(assert (= (and b!441342 res!261260) b!441346))

(assert (= (and b!441346 res!261259) b!441336))

(assert (= (and b!441343 condMapEmpty!19101) mapIsEmpty!19101))

(assert (= (and b!441343 (not condMapEmpty!19101)) mapNonEmpty!19101))

(get-info :version)

(assert (= (and mapNonEmpty!19101 ((_ is ValueCellFull!5483) mapValue!19101)) b!441334))

(assert (= (and b!441343 ((_ is ValueCellFull!5483) mapDefault!19101)) b!441338))

(assert (= start!40220 b!441343))

(declare-fun m!428447 () Bool)

(assert (=> b!441341 m!428447))

(declare-fun m!428449 () Bool)

(assert (=> b!441333 m!428449))

(declare-fun m!428451 () Bool)

(assert (=> b!441332 m!428451))

(declare-fun m!428453 () Bool)

(assert (=> b!441331 m!428453))

(declare-fun m!428455 () Bool)

(assert (=> start!40220 m!428455))

(declare-fun m!428457 () Bool)

(assert (=> start!40220 m!428457))

(declare-fun m!428459 () Bool)

(assert (=> b!441339 m!428459))

(declare-fun m!428461 () Bool)

(assert (=> b!441346 m!428461))

(declare-fun m!428463 () Bool)

(assert (=> b!441346 m!428463))

(declare-fun m!428465 () Bool)

(assert (=> b!441346 m!428465))

(declare-fun m!428467 () Bool)

(assert (=> b!441336 m!428467))

(declare-fun m!428469 () Bool)

(assert (=> b!441336 m!428469))

(assert (=> b!441336 m!428469))

(declare-fun m!428471 () Bool)

(assert (=> b!441336 m!428471))

(declare-fun m!428473 () Bool)

(assert (=> b!441336 m!428473))

(declare-fun m!428475 () Bool)

(assert (=> b!441335 m!428475))

(declare-fun m!428477 () Bool)

(assert (=> mapNonEmpty!19101 m!428477))

(declare-fun m!428479 () Bool)

(assert (=> b!441337 m!428479))

(declare-fun m!428481 () Bool)

(assert (=> b!441344 m!428481))

(declare-fun m!428483 () Bool)

(assert (=> b!441344 m!428483))

(check-sat (not b!441332) (not b!441341) (not b!441336) tp_is_empty!11653 (not b!441337) (not b!441339) (not b_next!10501) (not b!441335) (not mapNonEmpty!19101) (not b!441344) (not b!441331) (not start!40220) (not b!441346) b_and!18483)
(check-sat b_and!18483 (not b_next!10501))
