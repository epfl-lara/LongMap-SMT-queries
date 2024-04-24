; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40136 () Bool)

(assert start!40136)

(declare-fun b_free!10417 () Bool)

(declare-fun b_next!10417 () Bool)

(assert (=> start!40136 (= b_free!10417 (not b_next!10417))))

(declare-fun tp!36779 () Bool)

(declare-fun b_and!18399 () Bool)

(assert (=> start!40136 (= tp!36779 b_and!18399)))

(declare-fun b!439315 () Bool)

(declare-fun res!259622 () Bool)

(declare-fun e!258989 () Bool)

(assert (=> b!439315 (=> (not res!259622) (not e!258989))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26960 0))(
  ( (array!26961 (arr!12929 (Array (_ BitVec 32) (_ BitVec 64))) (size!13281 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26960)

(assert (=> b!439315 (= res!259622 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13281 _keys!709))))))

(declare-fun b!439316 () Bool)

(declare-fun res!259620 () Bool)

(assert (=> b!439316 (=> (not res!259620) (not e!258989))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26960 (_ BitVec 32)) Bool)

(assert (=> b!439316 (= res!259620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439317 () Bool)

(declare-fun e!258992 () Bool)

(declare-fun e!258994 () Bool)

(assert (=> b!439317 (= e!258992 e!258994)))

(declare-fun res!259623 () Bool)

(assert (=> b!439317 (=> (not res!259623) (not e!258994))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439317 (= res!259623 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16531 0))(
  ( (V!16532 (val!5829 Int)) )
))
(declare-datatypes ((tuple2!7648 0))(
  ( (tuple2!7649 (_1!3835 (_ BitVec 64)) (_2!3835 V!16531)) )
))
(declare-datatypes ((List!7634 0))(
  ( (Nil!7631) (Cons!7630 (h!8486 tuple2!7648) (t!13382 List!7634)) )
))
(declare-datatypes ((ListLongMap!6563 0))(
  ( (ListLongMap!6564 (toList!3297 List!7634)) )
))
(declare-fun lt!202267 () ListLongMap!6563)

(declare-fun minValue!515 () V!16531)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16531)

(declare-datatypes ((ValueCell!5441 0))(
  ( (ValueCellFull!5441 (v!8077 V!16531)) (EmptyCell!5441) )
))
(declare-datatypes ((array!26962 0))(
  ( (array!26963 (arr!12930 (Array (_ BitVec 32) ValueCell!5441)) (size!13282 (_ BitVec 32))) )
))
(declare-fun lt!202265 () array!26962)

(declare-fun lt!202266 () array!26960)

(declare-fun getCurrentListMapNoExtraKeys!1530 (array!26960 array!26962 (_ BitVec 32) (_ BitVec 32) V!16531 V!16531 (_ BitVec 32) Int) ListLongMap!6563)

(assert (=> b!439317 (= lt!202267 (getCurrentListMapNoExtraKeys!1530 lt!202266 lt!202265 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26962)

(declare-fun v!412 () V!16531)

(assert (=> b!439317 (= lt!202265 (array!26963 (store (arr!12930 _values!549) i!563 (ValueCellFull!5441 v!412)) (size!13282 _values!549)))))

(declare-fun lt!202269 () ListLongMap!6563)

(assert (=> b!439317 (= lt!202269 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439318 () Bool)

(declare-fun res!259630 () Bool)

(assert (=> b!439318 (=> (not res!259630) (not e!258989))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439318 (= res!259630 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!439319 () Bool)

(assert (=> b!439319 (= e!258989 e!258992)))

(declare-fun res!259629 () Bool)

(assert (=> b!439319 (=> (not res!259629) (not e!258992))))

(assert (=> b!439319 (= res!259629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202266 mask!1025))))

(assert (=> b!439319 (= lt!202266 (array!26961 (store (arr!12929 _keys!709) i!563 k0!794) (size!13281 _keys!709)))))

(declare-fun b!439320 () Bool)

(declare-fun res!259625 () Bool)

(assert (=> b!439320 (=> (not res!259625) (not e!258989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439320 (= res!259625 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18975 () Bool)

(declare-fun mapRes!18975 () Bool)

(declare-fun tp!36780 () Bool)

(declare-fun e!258993 () Bool)

(assert (=> mapNonEmpty!18975 (= mapRes!18975 (and tp!36780 e!258993))))

(declare-fun mapValue!18975 () ValueCell!5441)

(declare-fun mapKey!18975 () (_ BitVec 32))

(declare-fun mapRest!18975 () (Array (_ BitVec 32) ValueCell!5441))

(assert (=> mapNonEmpty!18975 (= (arr!12930 _values!549) (store mapRest!18975 mapKey!18975 mapValue!18975))))

(declare-fun b!439321 () Bool)

(declare-fun res!259627 () Bool)

(assert (=> b!439321 (=> (not res!259627) (not e!258992))))

(assert (=> b!439321 (= res!259627 (bvsle from!863 i!563))))

(declare-fun res!259621 () Bool)

(assert (=> start!40136 (=> (not res!259621) (not e!258989))))

(assert (=> start!40136 (= res!259621 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13281 _keys!709))))))

(assert (=> start!40136 e!258989))

(declare-fun tp_is_empty!11569 () Bool)

(assert (=> start!40136 tp_is_empty!11569))

(assert (=> start!40136 tp!36779))

(assert (=> start!40136 true))

(declare-fun e!258991 () Bool)

(declare-fun array_inv!9452 (array!26962) Bool)

(assert (=> start!40136 (and (array_inv!9452 _values!549) e!258991)))

(declare-fun array_inv!9453 (array!26960) Bool)

(assert (=> start!40136 (array_inv!9453 _keys!709)))

(declare-fun b!439322 () Bool)

(declare-fun res!259628 () Bool)

(assert (=> b!439322 (=> (not res!259628) (not e!258989))))

(assert (=> b!439322 (= res!259628 (or (= (select (arr!12929 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12929 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439323 () Bool)

(declare-fun e!258990 () Bool)

(assert (=> b!439323 (= e!258991 (and e!258990 mapRes!18975))))

(declare-fun condMapEmpty!18975 () Bool)

(declare-fun mapDefault!18975 () ValueCell!5441)

(assert (=> b!439323 (= condMapEmpty!18975 (= (arr!12930 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5441)) mapDefault!18975)))))

(declare-fun b!439324 () Bool)

(declare-fun res!259626 () Bool)

(assert (=> b!439324 (=> (not res!259626) (not e!258989))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439324 (= res!259626 (validKeyInArray!0 k0!794))))

(declare-fun b!439325 () Bool)

(assert (=> b!439325 (= e!258993 tp_is_empty!11569)))

(declare-fun mapIsEmpty!18975 () Bool)

(assert (=> mapIsEmpty!18975 mapRes!18975))

(declare-fun b!439326 () Bool)

(declare-fun res!259624 () Bool)

(assert (=> b!439326 (=> (not res!259624) (not e!258989))))

(assert (=> b!439326 (= res!259624 (and (= (size!13282 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13281 _keys!709) (size!13282 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!439327 () Bool)

(declare-fun res!259631 () Bool)

(assert (=> b!439327 (=> (not res!259631) (not e!258992))))

(declare-datatypes ((List!7635 0))(
  ( (Nil!7632) (Cons!7631 (h!8487 (_ BitVec 64)) (t!13383 List!7635)) )
))
(declare-fun arrayNoDuplicates!0 (array!26960 (_ BitVec 32) List!7635) Bool)

(assert (=> b!439327 (= res!259631 (arrayNoDuplicates!0 lt!202266 #b00000000000000000000000000000000 Nil!7632))))

(declare-fun b!439328 () Bool)

(assert (=> b!439328 (= e!258994 (not true))))

(declare-fun +!1492 (ListLongMap!6563 tuple2!7648) ListLongMap!6563)

(assert (=> b!439328 (= (getCurrentListMapNoExtraKeys!1530 lt!202266 lt!202265 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1492 (getCurrentListMapNoExtraKeys!1530 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7649 k0!794 v!412)))))

(declare-datatypes ((Unit!13059 0))(
  ( (Unit!13060) )
))
(declare-fun lt!202268 () Unit!13059)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 (array!26960 array!26962 (_ BitVec 32) (_ BitVec 32) V!16531 V!16531 (_ BitVec 32) (_ BitVec 64) V!16531 (_ BitVec 32) Int) Unit!13059)

(assert (=> b!439328 (= lt!202268 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!652 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439329 () Bool)

(declare-fun res!259632 () Bool)

(assert (=> b!439329 (=> (not res!259632) (not e!258989))))

(assert (=> b!439329 (= res!259632 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7632))))

(declare-fun b!439330 () Bool)

(assert (=> b!439330 (= e!258990 tp_is_empty!11569)))

(assert (= (and start!40136 res!259621) b!439320))

(assert (= (and b!439320 res!259625) b!439326))

(assert (= (and b!439326 res!259624) b!439316))

(assert (= (and b!439316 res!259620) b!439329))

(assert (= (and b!439329 res!259632) b!439315))

(assert (= (and b!439315 res!259622) b!439324))

(assert (= (and b!439324 res!259626) b!439322))

(assert (= (and b!439322 res!259628) b!439318))

(assert (= (and b!439318 res!259630) b!439319))

(assert (= (and b!439319 res!259629) b!439327))

(assert (= (and b!439327 res!259631) b!439321))

(assert (= (and b!439321 res!259627) b!439317))

(assert (= (and b!439317 res!259623) b!439328))

(assert (= (and b!439323 condMapEmpty!18975) mapIsEmpty!18975))

(assert (= (and b!439323 (not condMapEmpty!18975)) mapNonEmpty!18975))

(get-info :version)

(assert (= (and mapNonEmpty!18975 ((_ is ValueCellFull!5441) mapValue!18975)) b!439325))

(assert (= (and b!439323 ((_ is ValueCellFull!5441) mapDefault!18975)) b!439330))

(assert (= start!40136 b!439323))

(declare-fun m!426851 () Bool)

(assert (=> b!439317 m!426851))

(declare-fun m!426853 () Bool)

(assert (=> b!439317 m!426853))

(declare-fun m!426855 () Bool)

(assert (=> b!439317 m!426855))

(declare-fun m!426857 () Bool)

(assert (=> b!439328 m!426857))

(declare-fun m!426859 () Bool)

(assert (=> b!439328 m!426859))

(assert (=> b!439328 m!426859))

(declare-fun m!426861 () Bool)

(assert (=> b!439328 m!426861))

(declare-fun m!426863 () Bool)

(assert (=> b!439328 m!426863))

(declare-fun m!426865 () Bool)

(assert (=> b!439320 m!426865))

(declare-fun m!426867 () Bool)

(assert (=> b!439322 m!426867))

(declare-fun m!426869 () Bool)

(assert (=> mapNonEmpty!18975 m!426869))

(declare-fun m!426871 () Bool)

(assert (=> b!439324 m!426871))

(declare-fun m!426873 () Bool)

(assert (=> b!439319 m!426873))

(declare-fun m!426875 () Bool)

(assert (=> b!439319 m!426875))

(declare-fun m!426877 () Bool)

(assert (=> start!40136 m!426877))

(declare-fun m!426879 () Bool)

(assert (=> start!40136 m!426879))

(declare-fun m!426881 () Bool)

(assert (=> b!439316 m!426881))

(declare-fun m!426883 () Bool)

(assert (=> b!439327 m!426883))

(declare-fun m!426885 () Bool)

(assert (=> b!439329 m!426885))

(declare-fun m!426887 () Bool)

(assert (=> b!439318 m!426887))

(check-sat (not start!40136) (not mapNonEmpty!18975) (not b!439324) tp_is_empty!11569 (not b!439318) (not b!439317) (not b_next!10417) (not b!439319) (not b!439320) (not b!439316) b_and!18399 (not b!439327) (not b!439328) (not b!439329))
(check-sat b_and!18399 (not b_next!10417))
