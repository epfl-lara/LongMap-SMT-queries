; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39680 () Bool)

(assert start!39680)

(declare-fun b_free!9961 () Bool)

(declare-fun b_next!9961 () Bool)

(assert (=> start!39680 (= b_free!9961 (not b_next!9961))))

(declare-fun tp!35411 () Bool)

(declare-fun b_and!17591 () Bool)

(assert (=> start!39680 (= tp!35411 b_and!17591)))

(declare-fun mapIsEmpty!18291 () Bool)

(declare-fun mapRes!18291 () Bool)

(assert (=> mapIsEmpty!18291 mapRes!18291))

(declare-fun b!426208 () Bool)

(declare-fun res!249810 () Bool)

(declare-fun e!252843 () Bool)

(assert (=> b!426208 (=> (not res!249810) (not e!252843))))

(declare-datatypes ((array!26055 0))(
  ( (array!26056 (arr!12477 (Array (_ BitVec 32) (_ BitVec 64))) (size!12830 (_ BitVec 32))) )
))
(declare-fun lt!194740 () array!26055)

(declare-datatypes ((List!7357 0))(
  ( (Nil!7354) (Cons!7353 (h!8209 (_ BitVec 64)) (t!12792 List!7357)) )
))
(declare-fun arrayNoDuplicates!0 (array!26055 (_ BitVec 32) List!7357) Bool)

(assert (=> b!426208 (= res!249810 (arrayNoDuplicates!0 lt!194740 #b00000000000000000000000000000000 Nil!7354))))

(declare-fun b!426209 () Bool)

(declare-fun res!249813 () Bool)

(declare-fun e!252849 () Bool)

(assert (=> b!426209 (=> (not res!249813) (not e!252849))))

(declare-fun _keys!709 () array!26055)

(assert (=> b!426209 (= res!249813 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7354))))

(declare-fun b!426210 () Bool)

(declare-fun res!249807 () Bool)

(assert (=> b!426210 (=> (not res!249807) (not e!252849))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426210 (= res!249807 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426211 () Bool)

(declare-fun e!252846 () Bool)

(assert (=> b!426211 (= e!252846 (not true))))

(declare-datatypes ((V!15923 0))(
  ( (V!15924 (val!5601 Int)) )
))
(declare-fun minValue!515 () V!15923)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5213 0))(
  ( (ValueCellFull!5213 (v!7842 V!15923)) (EmptyCell!5213) )
))
(declare-datatypes ((array!26057 0))(
  ( (array!26058 (arr!12478 (Array (_ BitVec 32) ValueCell!5213)) (size!12831 (_ BitVec 32))) )
))
(declare-fun lt!194744 () array!26057)

(declare-fun _values!549 () array!26057)

(declare-fun zeroValue!515 () V!15923)

(declare-fun v!412 () V!15923)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7354 0))(
  ( (tuple2!7355 (_1!3688 (_ BitVec 64)) (_2!3688 V!15923)) )
))
(declare-datatypes ((List!7358 0))(
  ( (Nil!7355) (Cons!7354 (h!8210 tuple2!7354) (t!12793 List!7358)) )
))
(declare-datatypes ((ListLongMap!6257 0))(
  ( (ListLongMap!6258 (toList!3144 List!7358)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1352 (array!26055 array!26057 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) Int) ListLongMap!6257)

(declare-fun +!1324 (ListLongMap!6257 tuple2!7354) ListLongMap!6257)

(assert (=> b!426211 (= (getCurrentListMapNoExtraKeys!1352 lt!194740 lt!194744 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1324 (getCurrentListMapNoExtraKeys!1352 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7355 k0!794 v!412)))))

(declare-datatypes ((Unit!12494 0))(
  ( (Unit!12495) )
))
(declare-fun lt!194743 () Unit!12494)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!495 (array!26055 array!26057 (_ BitVec 32) (_ BitVec 32) V!15923 V!15923 (_ BitVec 32) (_ BitVec 64) V!15923 (_ BitVec 32) Int) Unit!12494)

(assert (=> b!426211 (= lt!194743 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!495 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426212 () Bool)

(declare-fun res!249809 () Bool)

(assert (=> b!426212 (=> (not res!249809) (not e!252849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426212 (= res!249809 (validMask!0 mask!1025))))

(declare-fun b!426213 () Bool)

(declare-fun e!252844 () Bool)

(declare-fun tp_is_empty!11113 () Bool)

(assert (=> b!426213 (= e!252844 tp_is_empty!11113)))

(declare-fun b!426214 () Bool)

(assert (=> b!426214 (= e!252843 e!252846)))

(declare-fun res!249805 () Bool)

(assert (=> b!426214 (=> (not res!249805) (not e!252846))))

(assert (=> b!426214 (= res!249805 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194742 () ListLongMap!6257)

(assert (=> b!426214 (= lt!194742 (getCurrentListMapNoExtraKeys!1352 lt!194740 lt!194744 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426214 (= lt!194744 (array!26058 (store (arr!12478 _values!549) i!563 (ValueCellFull!5213 v!412)) (size!12831 _values!549)))))

(declare-fun lt!194741 () ListLongMap!6257)

(assert (=> b!426214 (= lt!194741 (getCurrentListMapNoExtraKeys!1352 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18291 () Bool)

(declare-fun tp!35412 () Bool)

(declare-fun e!252847 () Bool)

(assert (=> mapNonEmpty!18291 (= mapRes!18291 (and tp!35412 e!252847))))

(declare-fun mapValue!18291 () ValueCell!5213)

(declare-fun mapRest!18291 () (Array (_ BitVec 32) ValueCell!5213))

(declare-fun mapKey!18291 () (_ BitVec 32))

(assert (=> mapNonEmpty!18291 (= (arr!12478 _values!549) (store mapRest!18291 mapKey!18291 mapValue!18291))))

(declare-fun res!249801 () Bool)

(assert (=> start!39680 (=> (not res!249801) (not e!252849))))

(assert (=> start!39680 (= res!249801 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12830 _keys!709))))))

(assert (=> start!39680 e!252849))

(assert (=> start!39680 tp_is_empty!11113))

(assert (=> start!39680 tp!35411))

(assert (=> start!39680 true))

(declare-fun e!252848 () Bool)

(declare-fun array_inv!9122 (array!26057) Bool)

(assert (=> start!39680 (and (array_inv!9122 _values!549) e!252848)))

(declare-fun array_inv!9123 (array!26055) Bool)

(assert (=> start!39680 (array_inv!9123 _keys!709)))

(declare-fun b!426215 () Bool)

(declare-fun res!249808 () Bool)

(assert (=> b!426215 (=> (not res!249808) (not e!252849))))

(assert (=> b!426215 (= res!249808 (and (= (size!12831 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12830 _keys!709) (size!12831 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426216 () Bool)

(declare-fun res!249802 () Bool)

(assert (=> b!426216 (=> (not res!249802) (not e!252843))))

(assert (=> b!426216 (= res!249802 (bvsle from!863 i!563))))

(declare-fun b!426217 () Bool)

(assert (=> b!426217 (= e!252849 e!252843)))

(declare-fun res!249806 () Bool)

(assert (=> b!426217 (=> (not res!249806) (not e!252843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26055 (_ BitVec 32)) Bool)

(assert (=> b!426217 (= res!249806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194740 mask!1025))))

(assert (=> b!426217 (= lt!194740 (array!26056 (store (arr!12477 _keys!709) i!563 k0!794) (size!12830 _keys!709)))))

(declare-fun b!426218 () Bool)

(declare-fun res!249803 () Bool)

(assert (=> b!426218 (=> (not res!249803) (not e!252849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426218 (= res!249803 (validKeyInArray!0 k0!794))))

(declare-fun b!426219 () Bool)

(assert (=> b!426219 (= e!252847 tp_is_empty!11113)))

(declare-fun b!426220 () Bool)

(declare-fun res!249812 () Bool)

(assert (=> b!426220 (=> (not res!249812) (not e!252849))))

(assert (=> b!426220 (= res!249812 (or (= (select (arr!12477 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12477 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426221 () Bool)

(declare-fun res!249811 () Bool)

(assert (=> b!426221 (=> (not res!249811) (not e!252849))))

(assert (=> b!426221 (= res!249811 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12830 _keys!709))))))

(declare-fun b!426222 () Bool)

(declare-fun res!249804 () Bool)

(assert (=> b!426222 (=> (not res!249804) (not e!252849))))

(assert (=> b!426222 (= res!249804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426223 () Bool)

(assert (=> b!426223 (= e!252848 (and e!252844 mapRes!18291))))

(declare-fun condMapEmpty!18291 () Bool)

(declare-fun mapDefault!18291 () ValueCell!5213)

(assert (=> b!426223 (= condMapEmpty!18291 (= (arr!12478 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5213)) mapDefault!18291)))))

(assert (= (and start!39680 res!249801) b!426212))

(assert (= (and b!426212 res!249809) b!426215))

(assert (= (and b!426215 res!249808) b!426222))

(assert (= (and b!426222 res!249804) b!426209))

(assert (= (and b!426209 res!249813) b!426221))

(assert (= (and b!426221 res!249811) b!426218))

(assert (= (and b!426218 res!249803) b!426220))

(assert (= (and b!426220 res!249812) b!426210))

(assert (= (and b!426210 res!249807) b!426217))

(assert (= (and b!426217 res!249806) b!426208))

(assert (= (and b!426208 res!249810) b!426216))

(assert (= (and b!426216 res!249802) b!426214))

(assert (= (and b!426214 res!249805) b!426211))

(assert (= (and b!426223 condMapEmpty!18291) mapIsEmpty!18291))

(assert (= (and b!426223 (not condMapEmpty!18291)) mapNonEmpty!18291))

(get-info :version)

(assert (= (and mapNonEmpty!18291 ((_ is ValueCellFull!5213) mapValue!18291)) b!426219))

(assert (= (and b!426223 ((_ is ValueCellFull!5213) mapDefault!18291)) b!426213))

(assert (= start!39680 b!426223))

(declare-fun m!414429 () Bool)

(assert (=> b!426222 m!414429))

(declare-fun m!414431 () Bool)

(assert (=> mapNonEmpty!18291 m!414431))

(declare-fun m!414433 () Bool)

(assert (=> b!426210 m!414433))

(declare-fun m!414435 () Bool)

(assert (=> b!426211 m!414435))

(declare-fun m!414437 () Bool)

(assert (=> b!426211 m!414437))

(assert (=> b!426211 m!414437))

(declare-fun m!414439 () Bool)

(assert (=> b!426211 m!414439))

(declare-fun m!414441 () Bool)

(assert (=> b!426211 m!414441))

(declare-fun m!414443 () Bool)

(assert (=> b!426209 m!414443))

(declare-fun m!414445 () Bool)

(assert (=> b!426220 m!414445))

(declare-fun m!414447 () Bool)

(assert (=> b!426212 m!414447))

(declare-fun m!414449 () Bool)

(assert (=> start!39680 m!414449))

(declare-fun m!414451 () Bool)

(assert (=> start!39680 m!414451))

(declare-fun m!414453 () Bool)

(assert (=> b!426218 m!414453))

(declare-fun m!414455 () Bool)

(assert (=> b!426208 m!414455))

(declare-fun m!414457 () Bool)

(assert (=> b!426214 m!414457))

(declare-fun m!414459 () Bool)

(assert (=> b!426214 m!414459))

(declare-fun m!414461 () Bool)

(assert (=> b!426214 m!414461))

(declare-fun m!414463 () Bool)

(assert (=> b!426217 m!414463))

(declare-fun m!414465 () Bool)

(assert (=> b!426217 m!414465))

(check-sat (not b!426212) tp_is_empty!11113 (not b!426211) (not b!426210) (not b!426208) (not b!426217) (not start!39680) (not b!426214) b_and!17591 (not b!426218) (not b!426222) (not mapNonEmpty!18291) (not b_next!9961) (not b!426209))
(check-sat b_and!17591 (not b_next!9961))
