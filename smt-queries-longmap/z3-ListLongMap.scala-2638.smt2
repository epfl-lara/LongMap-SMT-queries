; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39632 () Bool)

(assert start!39632)

(declare-fun b_free!9913 () Bool)

(declare-fun b_next!9913 () Bool)

(assert (=> start!39632 (= b_free!9913 (not b_next!9913))))

(declare-fun tp!35267 () Bool)

(declare-fun b_and!17583 () Bool)

(assert (=> start!39632 (= tp!35267 b_and!17583)))

(declare-fun b!425278 () Bool)

(declare-fun e!252483 () Bool)

(declare-fun e!252484 () Bool)

(assert (=> b!425278 (= e!252483 e!252484)))

(declare-fun res!248997 () Bool)

(assert (=> b!425278 (=> (not res!248997) (not e!252484))))

(declare-datatypes ((array!25976 0))(
  ( (array!25977 (arr!12437 (Array (_ BitVec 32) (_ BitVec 64))) (size!12789 (_ BitVec 32))) )
))
(declare-fun lt!194635 () array!25976)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25976 (_ BitVec 32)) Bool)

(assert (=> b!425278 (= res!248997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194635 mask!1025))))

(declare-fun _keys!709 () array!25976)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425278 (= lt!194635 (array!25977 (store (arr!12437 _keys!709) i!563 k0!794) (size!12789 _keys!709)))))

(declare-fun b!425279 () Bool)

(declare-fun res!248992 () Bool)

(assert (=> b!425279 (=> (not res!248992) (not e!252483))))

(declare-fun arrayContainsKey!0 (array!25976 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425279 (= res!248992 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!249002 () Bool)

(assert (=> start!39632 (=> (not res!249002) (not e!252483))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39632 (= res!249002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12789 _keys!709))))))

(assert (=> start!39632 e!252483))

(declare-fun tp_is_empty!11065 () Bool)

(assert (=> start!39632 tp_is_empty!11065))

(assert (=> start!39632 tp!35267))

(assert (=> start!39632 true))

(declare-datatypes ((V!15859 0))(
  ( (V!15860 (val!5577 Int)) )
))
(declare-datatypes ((ValueCell!5189 0))(
  ( (ValueCellFull!5189 (v!7825 V!15859)) (EmptyCell!5189) )
))
(declare-datatypes ((array!25978 0))(
  ( (array!25979 (arr!12438 (Array (_ BitVec 32) ValueCell!5189)) (size!12790 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25978)

(declare-fun e!252487 () Bool)

(declare-fun array_inv!9138 (array!25978) Bool)

(assert (=> start!39632 (and (array_inv!9138 _values!549) e!252487)))

(declare-fun array_inv!9139 (array!25976) Bool)

(assert (=> start!39632 (array_inv!9139 _keys!709)))

(declare-fun b!425280 () Bool)

(declare-fun res!248991 () Bool)

(assert (=> b!425280 (=> (not res!248991) (not e!252483))))

(assert (=> b!425280 (= res!248991 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12789 _keys!709))))))

(declare-fun mapIsEmpty!18219 () Bool)

(declare-fun mapRes!18219 () Bool)

(assert (=> mapIsEmpty!18219 mapRes!18219))

(declare-fun b!425281 () Bool)

(declare-fun res!248999 () Bool)

(assert (=> b!425281 (=> (not res!248999) (not e!252484))))

(assert (=> b!425281 (= res!248999 (bvsle from!863 i!563))))

(declare-fun b!425282 () Bool)

(declare-fun res!249001 () Bool)

(assert (=> b!425282 (=> (not res!249001) (not e!252484))))

(declare-datatypes ((List!7225 0))(
  ( (Nil!7222) (Cons!7221 (h!8077 (_ BitVec 64)) (t!12661 List!7225)) )
))
(declare-fun arrayNoDuplicates!0 (array!25976 (_ BitVec 32) List!7225) Bool)

(assert (=> b!425282 (= res!249001 (arrayNoDuplicates!0 lt!194635 #b00000000000000000000000000000000 Nil!7222))))

(declare-fun b!425283 () Bool)

(declare-fun e!252481 () Bool)

(assert (=> b!425283 (= e!252487 (and e!252481 mapRes!18219))))

(declare-fun condMapEmpty!18219 () Bool)

(declare-fun mapDefault!18219 () ValueCell!5189)

(assert (=> b!425283 (= condMapEmpty!18219 (= (arr!12438 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5189)) mapDefault!18219)))))

(declare-fun b!425284 () Bool)

(declare-fun res!249003 () Bool)

(assert (=> b!425284 (=> (not res!249003) (not e!252483))))

(assert (=> b!425284 (= res!249003 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7222))))

(declare-fun b!425285 () Bool)

(declare-fun res!248993 () Bool)

(assert (=> b!425285 (=> (not res!248993) (not e!252483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425285 (= res!248993 (validKeyInArray!0 k0!794))))

(declare-fun b!425286 () Bool)

(declare-fun res!248998 () Bool)

(assert (=> b!425286 (=> (not res!248998) (not e!252483))))

(assert (=> b!425286 (= res!248998 (or (= (select (arr!12437 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12437 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425287 () Bool)

(declare-fun e!252486 () Bool)

(assert (=> b!425287 (= e!252486 tp_is_empty!11065)))

(declare-fun mapNonEmpty!18219 () Bool)

(declare-fun tp!35268 () Bool)

(assert (=> mapNonEmpty!18219 (= mapRes!18219 (and tp!35268 e!252486))))

(declare-fun mapRest!18219 () (Array (_ BitVec 32) ValueCell!5189))

(declare-fun mapKey!18219 () (_ BitVec 32))

(declare-fun mapValue!18219 () ValueCell!5189)

(assert (=> mapNonEmpty!18219 (= (arr!12438 _values!549) (store mapRest!18219 mapKey!18219 mapValue!18219))))

(declare-fun b!425288 () Bool)

(declare-fun res!248996 () Bool)

(assert (=> b!425288 (=> (not res!248996) (not e!252483))))

(assert (=> b!425288 (= res!248996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425289 () Bool)

(declare-fun res!249000 () Bool)

(assert (=> b!425289 (=> (not res!249000) (not e!252483))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!425289 (= res!249000 (and (= (size!12790 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12789 _keys!709) (size!12790 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425290 () Bool)

(declare-fun res!248995 () Bool)

(assert (=> b!425290 (=> (not res!248995) (not e!252483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425290 (= res!248995 (validMask!0 mask!1025))))

(declare-fun b!425291 () Bool)

(declare-fun e!252485 () Bool)

(assert (=> b!425291 (= e!252484 e!252485)))

(declare-fun res!248994 () Bool)

(assert (=> b!425291 (=> (not res!248994) (not e!252485))))

(assert (=> b!425291 (= res!248994 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((tuple2!7218 0))(
  ( (tuple2!7219 (_1!3620 (_ BitVec 64)) (_2!3620 V!15859)) )
))
(declare-datatypes ((List!7226 0))(
  ( (Nil!7223) (Cons!7222 (h!8078 tuple2!7218) (t!12662 List!7226)) )
))
(declare-datatypes ((ListLongMap!6133 0))(
  ( (ListLongMap!6134 (toList!3082 List!7226)) )
))
(declare-fun lt!194636 () ListLongMap!6133)

(declare-fun minValue!515 () V!15859)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15859)

(declare-fun lt!194637 () array!25978)

(declare-fun getCurrentListMapNoExtraKeys!1328 (array!25976 array!25978 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) Int) ListLongMap!6133)

(assert (=> b!425291 (= lt!194636 (getCurrentListMapNoExtraKeys!1328 lt!194635 lt!194637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15859)

(assert (=> b!425291 (= lt!194637 (array!25979 (store (arr!12438 _values!549) i!563 (ValueCellFull!5189 v!412)) (size!12790 _values!549)))))

(declare-fun lt!194634 () ListLongMap!6133)

(assert (=> b!425291 (= lt!194634 (getCurrentListMapNoExtraKeys!1328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425292 () Bool)

(assert (=> b!425292 (= e!252485 (not true))))

(declare-fun +!1301 (ListLongMap!6133 tuple2!7218) ListLongMap!6133)

(assert (=> b!425292 (= (getCurrentListMapNoExtraKeys!1328 lt!194635 lt!194637 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1301 (getCurrentListMapNoExtraKeys!1328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7219 k0!794 v!412)))))

(declare-datatypes ((Unit!12477 0))(
  ( (Unit!12478) )
))
(declare-fun lt!194633 () Unit!12477)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!485 (array!25976 array!25978 (_ BitVec 32) (_ BitVec 32) V!15859 V!15859 (_ BitVec 32) (_ BitVec 64) V!15859 (_ BitVec 32) Int) Unit!12477)

(assert (=> b!425292 (= lt!194633 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!485 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425293 () Bool)

(assert (=> b!425293 (= e!252481 tp_is_empty!11065)))

(assert (= (and start!39632 res!249002) b!425290))

(assert (= (and b!425290 res!248995) b!425289))

(assert (= (and b!425289 res!249000) b!425288))

(assert (= (and b!425288 res!248996) b!425284))

(assert (= (and b!425284 res!249003) b!425280))

(assert (= (and b!425280 res!248991) b!425285))

(assert (= (and b!425285 res!248993) b!425286))

(assert (= (and b!425286 res!248998) b!425279))

(assert (= (and b!425279 res!248992) b!425278))

(assert (= (and b!425278 res!248997) b!425282))

(assert (= (and b!425282 res!249001) b!425281))

(assert (= (and b!425281 res!248999) b!425291))

(assert (= (and b!425291 res!248994) b!425292))

(assert (= (and b!425283 condMapEmpty!18219) mapIsEmpty!18219))

(assert (= (and b!425283 (not condMapEmpty!18219)) mapNonEmpty!18219))

(get-info :version)

(assert (= (and mapNonEmpty!18219 ((_ is ValueCellFull!5189) mapValue!18219)) b!425287))

(assert (= (and b!425283 ((_ is ValueCellFull!5189) mapDefault!18219)) b!425293))

(assert (= start!39632 b!425283))

(declare-fun m!414467 () Bool)

(assert (=> b!425291 m!414467))

(declare-fun m!414469 () Bool)

(assert (=> b!425291 m!414469))

(declare-fun m!414471 () Bool)

(assert (=> b!425291 m!414471))

(declare-fun m!414473 () Bool)

(assert (=> b!425279 m!414473))

(declare-fun m!414475 () Bool)

(assert (=> b!425282 m!414475))

(declare-fun m!414477 () Bool)

(assert (=> b!425290 m!414477))

(declare-fun m!414479 () Bool)

(assert (=> start!39632 m!414479))

(declare-fun m!414481 () Bool)

(assert (=> start!39632 m!414481))

(declare-fun m!414483 () Bool)

(assert (=> b!425288 m!414483))

(declare-fun m!414485 () Bool)

(assert (=> b!425286 m!414485))

(declare-fun m!414487 () Bool)

(assert (=> b!425278 m!414487))

(declare-fun m!414489 () Bool)

(assert (=> b!425278 m!414489))

(declare-fun m!414491 () Bool)

(assert (=> mapNonEmpty!18219 m!414491))

(declare-fun m!414493 () Bool)

(assert (=> b!425284 m!414493))

(declare-fun m!414495 () Bool)

(assert (=> b!425285 m!414495))

(declare-fun m!414497 () Bool)

(assert (=> b!425292 m!414497))

(declare-fun m!414499 () Bool)

(assert (=> b!425292 m!414499))

(assert (=> b!425292 m!414499))

(declare-fun m!414501 () Bool)

(assert (=> b!425292 m!414501))

(declare-fun m!414503 () Bool)

(assert (=> b!425292 m!414503))

(check-sat (not b!425278) tp_is_empty!11065 (not b!425282) (not b!425285) (not b_next!9913) (not b!425292) (not b!425288) b_and!17583 (not start!39632) (not mapNonEmpty!18219) (not b!425284) (not b!425291) (not b!425279) (not b!425290))
(check-sat b_and!17583 (not b_next!9913))
