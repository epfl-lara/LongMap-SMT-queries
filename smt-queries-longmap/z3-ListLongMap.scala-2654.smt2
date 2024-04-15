; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39728 () Bool)

(assert start!39728)

(declare-fun b_free!10009 () Bool)

(declare-fun b_next!10009 () Bool)

(assert (=> start!39728 (= b_free!10009 (not b_next!10009))))

(declare-fun tp!35555 () Bool)

(declare-fun b_and!17651 () Bool)

(assert (=> start!39728 (= tp!35555 b_and!17651)))

(declare-fun b!427401 () Bool)

(declare-fun e!253380 () Bool)

(declare-fun e!253381 () Bool)

(assert (=> b!427401 (= e!253380 e!253381)))

(declare-fun res!250767 () Bool)

(assert (=> b!427401 (=> (not res!250767) (not e!253381))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427401 (= res!250767 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15987 0))(
  ( (V!15988 (val!5625 Int)) )
))
(declare-fun minValue!515 () V!15987)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5237 0))(
  ( (ValueCellFull!5237 (v!7866 V!15987)) (EmptyCell!5237) )
))
(declare-datatypes ((array!26151 0))(
  ( (array!26152 (arr!12525 (Array (_ BitVec 32) ValueCell!5237)) (size!12878 (_ BitVec 32))) )
))
(declare-fun lt!195165 () array!26151)

(declare-datatypes ((array!26153 0))(
  ( (array!26154 (arr!12526 (Array (_ BitVec 32) (_ BitVec 64))) (size!12879 (_ BitVec 32))) )
))
(declare-fun lt!195164 () array!26153)

(declare-fun zeroValue!515 () V!15987)

(declare-datatypes ((tuple2!7394 0))(
  ( (tuple2!7395 (_1!3708 (_ BitVec 64)) (_2!3708 V!15987)) )
))
(declare-datatypes ((List!7397 0))(
  ( (Nil!7394) (Cons!7393 (h!8249 tuple2!7394) (t!12846 List!7397)) )
))
(declare-datatypes ((ListLongMap!6297 0))(
  ( (ListLongMap!6298 (toList!3164 List!7397)) )
))
(declare-fun lt!195167 () ListLongMap!6297)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1372 (array!26153 array!26151 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) Int) ListLongMap!6297)

(assert (=> b!427401 (= lt!195167 (getCurrentListMapNoExtraKeys!1372 lt!195164 lt!195165 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26151)

(declare-fun v!412 () V!15987)

(assert (=> b!427401 (= lt!195165 (array!26152 (store (arr!12525 _values!549) i!563 (ValueCellFull!5237 v!412)) (size!12878 _values!549)))))

(declare-fun lt!195166 () ListLongMap!6297)

(declare-fun _keys!709 () array!26153)

(assert (=> b!427401 (= lt!195166 (getCurrentListMapNoExtraKeys!1372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427402 () Bool)

(declare-fun e!253382 () Bool)

(assert (=> b!427402 (= e!253382 e!253380)))

(declare-fun res!250778 () Bool)

(assert (=> b!427402 (=> (not res!250778) (not e!253380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26153 (_ BitVec 32)) Bool)

(assert (=> b!427402 (= res!250778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195164 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!427402 (= lt!195164 (array!26154 (store (arr!12526 _keys!709) i!563 k0!794) (size!12879 _keys!709)))))

(declare-fun b!427403 () Bool)

(declare-fun e!253377 () Bool)

(declare-fun e!253376 () Bool)

(declare-fun mapRes!18363 () Bool)

(assert (=> b!427403 (= e!253377 (and e!253376 mapRes!18363))))

(declare-fun condMapEmpty!18363 () Bool)

(declare-fun mapDefault!18363 () ValueCell!5237)

(assert (=> b!427403 (= condMapEmpty!18363 (= (arr!12525 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5237)) mapDefault!18363)))))

(declare-fun b!427404 () Bool)

(declare-fun e!253378 () Bool)

(declare-fun tp_is_empty!11161 () Bool)

(assert (=> b!427404 (= e!253378 tp_is_empty!11161)))

(declare-fun b!427405 () Bool)

(declare-fun res!250770 () Bool)

(assert (=> b!427405 (=> (not res!250770) (not e!253382))))

(assert (=> b!427405 (= res!250770 (and (= (size!12878 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12879 _keys!709) (size!12878 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427406 () Bool)

(declare-fun res!250768 () Bool)

(assert (=> b!427406 (=> (not res!250768) (not e!253382))))

(assert (=> b!427406 (= res!250768 (or (= (select (arr!12526 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12526 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427407 () Bool)

(declare-fun res!250774 () Bool)

(assert (=> b!427407 (=> (not res!250774) (not e!253382))))

(assert (=> b!427407 (= res!250774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!250771 () Bool)

(assert (=> start!39728 (=> (not res!250771) (not e!253382))))

(assert (=> start!39728 (= res!250771 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12879 _keys!709))))))

(assert (=> start!39728 e!253382))

(assert (=> start!39728 tp_is_empty!11161))

(assert (=> start!39728 tp!35555))

(assert (=> start!39728 true))

(declare-fun array_inv!9154 (array!26151) Bool)

(assert (=> start!39728 (and (array_inv!9154 _values!549) e!253377)))

(declare-fun array_inv!9155 (array!26153) Bool)

(assert (=> start!39728 (array_inv!9155 _keys!709)))

(declare-fun b!427408 () Bool)

(assert (=> b!427408 (= e!253376 tp_is_empty!11161)))

(declare-fun mapIsEmpty!18363 () Bool)

(assert (=> mapIsEmpty!18363 mapRes!18363))

(declare-fun b!427409 () Bool)

(declare-fun res!250775 () Bool)

(assert (=> b!427409 (=> (not res!250775) (not e!253380))))

(assert (=> b!427409 (= res!250775 (bvsle from!863 i!563))))

(declare-fun b!427410 () Bool)

(declare-fun res!250776 () Bool)

(assert (=> b!427410 (=> (not res!250776) (not e!253382))))

(assert (=> b!427410 (= res!250776 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12879 _keys!709))))))

(declare-fun b!427411 () Bool)

(declare-fun res!250777 () Bool)

(assert (=> b!427411 (=> (not res!250777) (not e!253382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427411 (= res!250777 (validMask!0 mask!1025))))

(declare-fun b!427412 () Bool)

(declare-fun res!250769 () Bool)

(assert (=> b!427412 (=> (not res!250769) (not e!253382))))

(declare-fun arrayContainsKey!0 (array!26153 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427412 (= res!250769 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427413 () Bool)

(declare-fun e!253383 () Bool)

(assert (=> b!427413 (= e!253383 true)))

(declare-fun lt!195163 () ListLongMap!6297)

(declare-fun +!1343 (ListLongMap!6297 tuple2!7394) ListLongMap!6297)

(declare-fun get!6196 (ValueCell!5237 V!15987) V!15987)

(declare-fun dynLambda!742 (Int (_ BitVec 64)) V!15987)

(assert (=> b!427413 (= lt!195167 (+!1343 lt!195163 (tuple2!7395 (select (arr!12526 _keys!709) from!863) (get!6196 (select (arr!12525 _values!549) from!863) (dynLambda!742 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427414 () Bool)

(declare-fun res!250779 () Bool)

(assert (=> b!427414 (=> (not res!250779) (not e!253382))))

(declare-datatypes ((List!7398 0))(
  ( (Nil!7395) (Cons!7394 (h!8250 (_ BitVec 64)) (t!12847 List!7398)) )
))
(declare-fun arrayNoDuplicates!0 (array!26153 (_ BitVec 32) List!7398) Bool)

(assert (=> b!427414 (= res!250779 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7395))))

(declare-fun b!427415 () Bool)

(declare-fun res!250772 () Bool)

(assert (=> b!427415 (=> (not res!250772) (not e!253382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427415 (= res!250772 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18363 () Bool)

(declare-fun tp!35556 () Bool)

(assert (=> mapNonEmpty!18363 (= mapRes!18363 (and tp!35556 e!253378))))

(declare-fun mapValue!18363 () ValueCell!5237)

(declare-fun mapKey!18363 () (_ BitVec 32))

(declare-fun mapRest!18363 () (Array (_ BitVec 32) ValueCell!5237))

(assert (=> mapNonEmpty!18363 (= (arr!12525 _values!549) (store mapRest!18363 mapKey!18363 mapValue!18363))))

(declare-fun b!427416 () Bool)

(declare-fun res!250773 () Bool)

(assert (=> b!427416 (=> (not res!250773) (not e!253380))))

(assert (=> b!427416 (= res!250773 (arrayNoDuplicates!0 lt!195164 #b00000000000000000000000000000000 Nil!7395))))

(declare-fun b!427417 () Bool)

(assert (=> b!427417 (= e!253381 (not e!253383))))

(declare-fun res!250766 () Bool)

(assert (=> b!427417 (=> res!250766 e!253383)))

(assert (=> b!427417 (= res!250766 (not (validKeyInArray!0 (select (arr!12526 _keys!709) from!863))))))

(declare-fun lt!195162 () ListLongMap!6297)

(assert (=> b!427417 (= lt!195162 lt!195163)))

(declare-fun lt!195161 () ListLongMap!6297)

(assert (=> b!427417 (= lt!195163 (+!1343 lt!195161 (tuple2!7395 k0!794 v!412)))))

(assert (=> b!427417 (= lt!195162 (getCurrentListMapNoExtraKeys!1372 lt!195164 lt!195165 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427417 (= lt!195161 (getCurrentListMapNoExtraKeys!1372 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12530 0))(
  ( (Unit!12531) )
))
(declare-fun lt!195160 () Unit!12530)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 (array!26153 array!26151 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) (_ BitVec 64) V!15987 (_ BitVec 32) Int) Unit!12530)

(assert (=> b!427417 (= lt!195160 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!513 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!39728 res!250771) b!427411))

(assert (= (and b!427411 res!250777) b!427405))

(assert (= (and b!427405 res!250770) b!427407))

(assert (= (and b!427407 res!250774) b!427414))

(assert (= (and b!427414 res!250779) b!427410))

(assert (= (and b!427410 res!250776) b!427415))

(assert (= (and b!427415 res!250772) b!427406))

(assert (= (and b!427406 res!250768) b!427412))

(assert (= (and b!427412 res!250769) b!427402))

(assert (= (and b!427402 res!250778) b!427416))

(assert (= (and b!427416 res!250773) b!427409))

(assert (= (and b!427409 res!250775) b!427401))

(assert (= (and b!427401 res!250767) b!427417))

(assert (= (and b!427417 (not res!250766)) b!427413))

(assert (= (and b!427403 condMapEmpty!18363) mapIsEmpty!18363))

(assert (= (and b!427403 (not condMapEmpty!18363)) mapNonEmpty!18363))

(get-info :version)

(assert (= (and mapNonEmpty!18363 ((_ is ValueCellFull!5237) mapValue!18363)) b!427404))

(assert (= (and b!427403 ((_ is ValueCellFull!5237) mapDefault!18363)) b!427408))

(assert (= start!39728 b!427403))

(declare-fun b_lambda!9079 () Bool)

(assert (=> (not b_lambda!9079) (not b!427413)))

(declare-fun t!12845 () Bool)

(declare-fun tb!3407 () Bool)

(assert (=> (and start!39728 (= defaultEntry!557 defaultEntry!557) t!12845) tb!3407))

(declare-fun result!6349 () Bool)

(assert (=> tb!3407 (= result!6349 tp_is_empty!11161)))

(assert (=> b!427413 t!12845))

(declare-fun b_and!17653 () Bool)

(assert (= b_and!17651 (and (=> t!12845 result!6349) b_and!17653)))

(declare-fun m!415425 () Bool)

(assert (=> b!427401 m!415425))

(declare-fun m!415427 () Bool)

(assert (=> b!427401 m!415427))

(declare-fun m!415429 () Bool)

(assert (=> b!427401 m!415429))

(declare-fun m!415431 () Bool)

(assert (=> b!427412 m!415431))

(declare-fun m!415433 () Bool)

(assert (=> mapNonEmpty!18363 m!415433))

(declare-fun m!415435 () Bool)

(assert (=> b!427411 m!415435))

(declare-fun m!415437 () Bool)

(assert (=> b!427417 m!415437))

(declare-fun m!415439 () Bool)

(assert (=> b!427417 m!415439))

(declare-fun m!415441 () Bool)

(assert (=> b!427417 m!415441))

(assert (=> b!427417 m!415437))

(declare-fun m!415443 () Bool)

(assert (=> b!427417 m!415443))

(declare-fun m!415445 () Bool)

(assert (=> b!427417 m!415445))

(declare-fun m!415447 () Bool)

(assert (=> b!427417 m!415447))

(declare-fun m!415449 () Bool)

(assert (=> b!427402 m!415449))

(declare-fun m!415451 () Bool)

(assert (=> b!427402 m!415451))

(declare-fun m!415453 () Bool)

(assert (=> b!427416 m!415453))

(declare-fun m!415455 () Bool)

(assert (=> b!427407 m!415455))

(declare-fun m!415457 () Bool)

(assert (=> start!39728 m!415457))

(declare-fun m!415459 () Bool)

(assert (=> start!39728 m!415459))

(declare-fun m!415461 () Bool)

(assert (=> b!427406 m!415461))

(declare-fun m!415463 () Bool)

(assert (=> b!427415 m!415463))

(assert (=> b!427413 m!415437))

(declare-fun m!415465 () Bool)

(assert (=> b!427413 m!415465))

(declare-fun m!415467 () Bool)

(assert (=> b!427413 m!415467))

(declare-fun m!415469 () Bool)

(assert (=> b!427413 m!415469))

(assert (=> b!427413 m!415467))

(assert (=> b!427413 m!415465))

(declare-fun m!415471 () Bool)

(assert (=> b!427413 m!415471))

(declare-fun m!415473 () Bool)

(assert (=> b!427414 m!415473))

(check-sat (not mapNonEmpty!18363) (not b!427402) (not b!427416) b_and!17653 (not b_lambda!9079) (not b!427417) (not start!39728) (not b_next!10009) (not b!427412) (not b!427401) (not b!427411) (not b!427415) (not b!427407) (not b!427414) tp_is_empty!11161 (not b!427413))
(check-sat b_and!17653 (not b_next!10009))
