; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39764 () Bool)

(assert start!39764)

(declare-fun b_free!10045 () Bool)

(declare-fun b_next!10045 () Bool)

(assert (=> start!39764 (= b_free!10045 (not b_next!10045))))

(declare-fun tp!35664 () Bool)

(declare-fun b_and!17723 () Bool)

(assert (=> start!39764 (= tp!35664 b_and!17723)))

(declare-fun b!428395 () Bool)

(declare-fun e!253833 () Bool)

(declare-fun tp_is_empty!11197 () Bool)

(assert (=> b!428395 (= e!253833 tp_is_empty!11197)))

(declare-fun res!251530 () Bool)

(declare-fun e!253828 () Bool)

(assert (=> start!39764 (=> (not res!251530) (not e!253828))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26223 0))(
  ( (array!26224 (arr!12561 (Array (_ BitVec 32) (_ BitVec 64))) (size!12914 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26223)

(assert (=> start!39764 (= res!251530 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12914 _keys!709))))))

(assert (=> start!39764 e!253828))

(assert (=> start!39764 tp_is_empty!11197))

(assert (=> start!39764 tp!35664))

(assert (=> start!39764 true))

(declare-datatypes ((V!16035 0))(
  ( (V!16036 (val!5643 Int)) )
))
(declare-datatypes ((ValueCell!5255 0))(
  ( (ValueCellFull!5255 (v!7884 V!16035)) (EmptyCell!5255) )
))
(declare-datatypes ((array!26225 0))(
  ( (array!26226 (arr!12562 (Array (_ BitVec 32) ValueCell!5255)) (size!12915 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26225)

(declare-fun e!253835 () Bool)

(declare-fun array_inv!9184 (array!26225) Bool)

(assert (=> start!39764 (and (array_inv!9184 _values!549) e!253835)))

(declare-fun array_inv!9185 (array!26223) Bool)

(assert (=> start!39764 (array_inv!9185 _keys!709)))

(declare-fun b!428396 () Bool)

(declare-fun res!251524 () Bool)

(assert (=> b!428396 (=> (not res!251524) (not e!253828))))

(declare-datatypes ((List!7429 0))(
  ( (Nil!7426) (Cons!7425 (h!8281 (_ BitVec 64)) (t!12914 List!7429)) )
))
(declare-fun arrayNoDuplicates!0 (array!26223 (_ BitVec 32) List!7429) Bool)

(assert (=> b!428396 (= res!251524 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7426))))

(declare-fun b!428397 () Bool)

(declare-fun e!253831 () Bool)

(assert (=> b!428397 (= e!253831 tp_is_empty!11197)))

(declare-fun b!428398 () Bool)

(declare-fun res!251523 () Bool)

(assert (=> b!428398 (=> (not res!251523) (not e!253828))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428398 (= res!251523 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12914 _keys!709))))))

(declare-fun b!428399 () Bool)

(declare-datatypes ((Unit!12566 0))(
  ( (Unit!12567) )
))
(declare-fun e!253829 () Unit!12566)

(declare-fun Unit!12568 () Unit!12566)

(assert (=> b!428399 (= e!253829 Unit!12568)))

(declare-fun mapNonEmpty!18417 () Bool)

(declare-fun mapRes!18417 () Bool)

(declare-fun tp!35663 () Bool)

(assert (=> mapNonEmpty!18417 (= mapRes!18417 (and tp!35663 e!253833))))

(declare-fun mapKey!18417 () (_ BitVec 32))

(declare-fun mapValue!18417 () ValueCell!5255)

(declare-fun mapRest!18417 () (Array (_ BitVec 32) ValueCell!5255))

(assert (=> mapNonEmpty!18417 (= (arr!12562 _values!549) (store mapRest!18417 mapKey!18417 mapValue!18417))))

(declare-fun b!428400 () Bool)

(declare-fun Unit!12569 () Unit!12566)

(assert (=> b!428400 (= e!253829 Unit!12569)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!195633 () Unit!12566)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12566)

(assert (=> b!428400 (= lt!195633 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428400 false))

(declare-fun b!428401 () Bool)

(declare-fun res!251522 () Bool)

(assert (=> b!428401 (=> (not res!251522) (not e!253828))))

(declare-fun arrayContainsKey!0 (array!26223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428401 (= res!251522 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428402 () Bool)

(declare-fun res!251532 () Bool)

(declare-fun e!253834 () Bool)

(assert (=> b!428402 (=> (not res!251532) (not e!253834))))

(assert (=> b!428402 (= res!251532 (bvsle from!863 i!563))))

(declare-fun b!428403 () Bool)

(declare-fun res!251525 () Bool)

(assert (=> b!428403 (=> (not res!251525) (not e!253828))))

(assert (=> b!428403 (= res!251525 (or (= (select (arr!12561 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12561 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428404 () Bool)

(assert (=> b!428404 (= e!253828 e!253834)))

(declare-fun res!251535 () Bool)

(assert (=> b!428404 (=> (not res!251535) (not e!253834))))

(declare-fun lt!195632 () array!26223)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26223 (_ BitVec 32)) Bool)

(assert (=> b!428404 (= res!251535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195632 mask!1025))))

(assert (=> b!428404 (= lt!195632 (array!26224 (store (arr!12561 _keys!709) i!563 k0!794) (size!12914 _keys!709)))))

(declare-fun b!428405 () Bool)

(declare-fun res!251529 () Bool)

(assert (=> b!428405 (=> (not res!251529) (not e!253834))))

(assert (=> b!428405 (= res!251529 (arrayNoDuplicates!0 lt!195632 #b00000000000000000000000000000000 Nil!7426))))

(declare-fun b!428406 () Bool)

(declare-fun res!251527 () Bool)

(assert (=> b!428406 (=> (not res!251527) (not e!253828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428406 (= res!251527 (validMask!0 mask!1025))))

(declare-fun b!428407 () Bool)

(declare-fun e!253832 () Bool)

(declare-fun e!253830 () Bool)

(assert (=> b!428407 (= e!253832 (not e!253830))))

(declare-fun res!251533 () Bool)

(assert (=> b!428407 (=> res!251533 e!253830)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428407 (= res!251533 (not (validKeyInArray!0 (select (arr!12561 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7430 0))(
  ( (tuple2!7431 (_1!3726 (_ BitVec 64)) (_2!3726 V!16035)) )
))
(declare-datatypes ((List!7430 0))(
  ( (Nil!7427) (Cons!7426 (h!8282 tuple2!7430) (t!12915 List!7430)) )
))
(declare-datatypes ((ListLongMap!6333 0))(
  ( (ListLongMap!6334 (toList!3182 List!7430)) )
))
(declare-fun lt!195636 () ListLongMap!6333)

(declare-fun lt!195640 () ListLongMap!6333)

(assert (=> b!428407 (= lt!195636 lt!195640)))

(declare-fun lt!195634 () ListLongMap!6333)

(declare-fun v!412 () V!16035)

(declare-fun +!1360 (ListLongMap!6333 tuple2!7430) ListLongMap!6333)

(assert (=> b!428407 (= lt!195640 (+!1360 lt!195634 (tuple2!7431 k0!794 v!412)))))

(declare-fun minValue!515 () V!16035)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16035)

(declare-fun lt!195639 () array!26225)

(declare-fun getCurrentListMapNoExtraKeys!1389 (array!26223 array!26225 (_ BitVec 32) (_ BitVec 32) V!16035 V!16035 (_ BitVec 32) Int) ListLongMap!6333)

(assert (=> b!428407 (= lt!195636 (getCurrentListMapNoExtraKeys!1389 lt!195632 lt!195639 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428407 (= lt!195634 (getCurrentListMapNoExtraKeys!1389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195638 () Unit!12566)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 (array!26223 array!26225 (_ BitVec 32) (_ BitVec 32) V!16035 V!16035 (_ BitVec 32) (_ BitVec 64) V!16035 (_ BitVec 32) Int) Unit!12566)

(assert (=> b!428407 (= lt!195638 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!526 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428408 () Bool)

(declare-fun res!251528 () Bool)

(assert (=> b!428408 (=> (not res!251528) (not e!253828))))

(assert (=> b!428408 (= res!251528 (validKeyInArray!0 k0!794))))

(declare-fun b!428409 () Bool)

(declare-fun res!251531 () Bool)

(assert (=> b!428409 (=> (not res!251531) (not e!253828))))

(assert (=> b!428409 (= res!251531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428410 () Bool)

(declare-fun res!251534 () Bool)

(assert (=> b!428410 (=> (not res!251534) (not e!253828))))

(assert (=> b!428410 (= res!251534 (and (= (size!12915 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12914 _keys!709) (size!12915 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428411 () Bool)

(assert (=> b!428411 (= e!253834 e!253832)))

(declare-fun res!251526 () Bool)

(assert (=> b!428411 (=> (not res!251526) (not e!253832))))

(assert (=> b!428411 (= res!251526 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195637 () ListLongMap!6333)

(assert (=> b!428411 (= lt!195637 (getCurrentListMapNoExtraKeys!1389 lt!195632 lt!195639 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428411 (= lt!195639 (array!26226 (store (arr!12562 _values!549) i!563 (ValueCellFull!5255 v!412)) (size!12915 _values!549)))))

(declare-fun lt!195635 () ListLongMap!6333)

(assert (=> b!428411 (= lt!195635 (getCurrentListMapNoExtraKeys!1389 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428412 () Bool)

(assert (=> b!428412 (= e!253830 true)))

(assert (=> b!428412 (not (= (select (arr!12561 _keys!709) from!863) k0!794))))

(declare-fun lt!195641 () Unit!12566)

(assert (=> b!428412 (= lt!195641 e!253829)))

(declare-fun c!55332 () Bool)

(assert (=> b!428412 (= c!55332 (= (select (arr!12561 _keys!709) from!863) k0!794))))

(declare-fun get!6225 (ValueCell!5255 V!16035) V!16035)

(declare-fun dynLambda!759 (Int (_ BitVec 64)) V!16035)

(assert (=> b!428412 (= lt!195637 (+!1360 lt!195640 (tuple2!7431 (select (arr!12561 _keys!709) from!863) (get!6225 (select (arr!12562 _values!549) from!863) (dynLambda!759 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!18417 () Bool)

(assert (=> mapIsEmpty!18417 mapRes!18417))

(declare-fun b!428413 () Bool)

(assert (=> b!428413 (= e!253835 (and e!253831 mapRes!18417))))

(declare-fun condMapEmpty!18417 () Bool)

(declare-fun mapDefault!18417 () ValueCell!5255)

(assert (=> b!428413 (= condMapEmpty!18417 (= (arr!12562 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5255)) mapDefault!18417)))))

(assert (= (and start!39764 res!251530) b!428406))

(assert (= (and b!428406 res!251527) b!428410))

(assert (= (and b!428410 res!251534) b!428409))

(assert (= (and b!428409 res!251531) b!428396))

(assert (= (and b!428396 res!251524) b!428398))

(assert (= (and b!428398 res!251523) b!428408))

(assert (= (and b!428408 res!251528) b!428403))

(assert (= (and b!428403 res!251525) b!428401))

(assert (= (and b!428401 res!251522) b!428404))

(assert (= (and b!428404 res!251535) b!428405))

(assert (= (and b!428405 res!251529) b!428402))

(assert (= (and b!428402 res!251532) b!428411))

(assert (= (and b!428411 res!251526) b!428407))

(assert (= (and b!428407 (not res!251533)) b!428412))

(assert (= (and b!428412 c!55332) b!428400))

(assert (= (and b!428412 (not c!55332)) b!428399))

(assert (= (and b!428413 condMapEmpty!18417) mapIsEmpty!18417))

(assert (= (and b!428413 (not condMapEmpty!18417)) mapNonEmpty!18417))

(get-info :version)

(assert (= (and mapNonEmpty!18417 ((_ is ValueCellFull!5255) mapValue!18417)) b!428395))

(assert (= (and b!428413 ((_ is ValueCellFull!5255) mapDefault!18417)) b!428397))

(assert (= start!39764 b!428413))

(declare-fun b_lambda!9115 () Bool)

(assert (=> (not b_lambda!9115) (not b!428412)))

(declare-fun t!12913 () Bool)

(declare-fun tb!3443 () Bool)

(assert (=> (and start!39764 (= defaultEntry!557 defaultEntry!557) t!12913) tb!3443))

(declare-fun result!6421 () Bool)

(assert (=> tb!3443 (= result!6421 tp_is_empty!11197)))

(assert (=> b!428412 t!12913))

(declare-fun b_and!17725 () Bool)

(assert (= b_and!17723 (and (=> t!12913 result!6421) b_and!17725)))

(declare-fun m!416337 () Bool)

(assert (=> b!428408 m!416337))

(declare-fun m!416339 () Bool)

(assert (=> b!428405 m!416339))

(declare-fun m!416341 () Bool)

(assert (=> b!428406 m!416341))

(declare-fun m!416343 () Bool)

(assert (=> mapNonEmpty!18417 m!416343))

(declare-fun m!416345 () Bool)

(assert (=> b!428404 m!416345))

(declare-fun m!416347 () Bool)

(assert (=> b!428404 m!416347))

(declare-fun m!416349 () Bool)

(assert (=> b!428400 m!416349))

(declare-fun m!416351 () Bool)

(assert (=> b!428401 m!416351))

(declare-fun m!416353 () Bool)

(assert (=> b!428409 m!416353))

(declare-fun m!416355 () Bool)

(assert (=> b!428396 m!416355))

(declare-fun m!416357 () Bool)

(assert (=> b!428407 m!416357))

(declare-fun m!416359 () Bool)

(assert (=> b!428407 m!416359))

(declare-fun m!416361 () Bool)

(assert (=> b!428407 m!416361))

(declare-fun m!416363 () Bool)

(assert (=> b!428407 m!416363))

(assert (=> b!428407 m!416357))

(declare-fun m!416365 () Bool)

(assert (=> b!428407 m!416365))

(declare-fun m!416367 () Bool)

(assert (=> b!428407 m!416367))

(declare-fun m!416369 () Bool)

(assert (=> b!428411 m!416369))

(declare-fun m!416371 () Bool)

(assert (=> b!428411 m!416371))

(declare-fun m!416373 () Bool)

(assert (=> b!428411 m!416373))

(assert (=> b!428412 m!416357))

(declare-fun m!416375 () Bool)

(assert (=> b!428412 m!416375))

(declare-fun m!416377 () Bool)

(assert (=> b!428412 m!416377))

(declare-fun m!416379 () Bool)

(assert (=> b!428412 m!416379))

(assert (=> b!428412 m!416379))

(assert (=> b!428412 m!416375))

(declare-fun m!416381 () Bool)

(assert (=> b!428412 m!416381))

(declare-fun m!416383 () Bool)

(assert (=> start!39764 m!416383))

(declare-fun m!416385 () Bool)

(assert (=> start!39764 m!416385))

(declare-fun m!416387 () Bool)

(assert (=> b!428403 m!416387))

(check-sat (not b!428400) (not b!428401) b_and!17725 (not b!428406) tp_is_empty!11197 (not b!428411) (not b!428404) (not b!428408) (not start!39764) (not mapNonEmpty!18417) (not b_lambda!9115) (not b_next!10045) (not b!428409) (not b!428405) (not b!428396) (not b!428412) (not b!428407))
(check-sat b_and!17725 (not b_next!10045))
