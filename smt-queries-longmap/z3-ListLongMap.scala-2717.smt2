; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40106 () Bool)

(assert start!40106)

(declare-fun b_free!10387 () Bool)

(declare-fun b_next!10387 () Bool)

(assert (=> start!40106 (= b_free!10387 (not b_next!10387))))

(declare-fun tp!36690 () Bool)

(declare-fun b_and!18329 () Bool)

(assert (=> start!40106 (= tp!36690 b_and!18329)))

(declare-fun b!438373 () Bool)

(declare-fun e!258537 () Bool)

(declare-fun tp_is_empty!11539 () Bool)

(assert (=> b!438373 (= e!258537 tp_is_empty!11539)))

(declare-fun b!438374 () Bool)

(declare-fun e!258533 () Bool)

(assert (=> b!438374 (= e!258533 tp_is_empty!11539)))

(declare-fun b!438375 () Bool)

(declare-fun res!258913 () Bool)

(declare-fun e!258534 () Bool)

(assert (=> b!438375 (=> (not res!258913) (not e!258534))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438375 (= res!258913 (validKeyInArray!0 k0!794))))

(declare-fun b!438376 () Bool)

(declare-fun res!258920 () Bool)

(assert (=> b!438376 (=> (not res!258920) (not e!258534))))

(declare-datatypes ((array!26897 0))(
  ( (array!26898 (arr!12898 (Array (_ BitVec 32) (_ BitVec 64))) (size!13251 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26897)

(declare-datatypes ((List!7721 0))(
  ( (Nil!7718) (Cons!7717 (h!8573 (_ BitVec 64)) (t!13468 List!7721)) )
))
(declare-fun arrayNoDuplicates!0 (array!26897 (_ BitVec 32) List!7721) Bool)

(assert (=> b!438376 (= res!258920 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7718))))

(declare-fun res!258918 () Bool)

(assert (=> start!40106 (=> (not res!258918) (not e!258534))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40106 (= res!258918 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13251 _keys!709))))))

(assert (=> start!40106 e!258534))

(assert (=> start!40106 tp_is_empty!11539))

(assert (=> start!40106 tp!36690))

(assert (=> start!40106 true))

(declare-datatypes ((V!16491 0))(
  ( (V!16492 (val!5814 Int)) )
))
(declare-datatypes ((ValueCell!5426 0))(
  ( (ValueCellFull!5426 (v!8055 V!16491)) (EmptyCell!5426) )
))
(declare-datatypes ((array!26899 0))(
  ( (array!26900 (arr!12899 (Array (_ BitVec 32) ValueCell!5426)) (size!13252 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26899)

(declare-fun e!258531 () Bool)

(declare-fun array_inv!9416 (array!26899) Bool)

(assert (=> start!40106 (and (array_inv!9416 _values!549) e!258531)))

(declare-fun array_inv!9417 (array!26897) Bool)

(assert (=> start!40106 (array_inv!9417 _keys!709)))

(declare-fun b!438377 () Bool)

(declare-fun res!258917 () Bool)

(assert (=> b!438377 (=> (not res!258917) (not e!258534))))

(declare-fun arrayContainsKey!0 (array!26897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438377 (= res!258917 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438378 () Bool)

(declare-fun res!258915 () Bool)

(assert (=> b!438378 (=> (not res!258915) (not e!258534))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!438378 (= res!258915 (and (= (size!13252 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13251 _keys!709) (size!13252 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!18930 () Bool)

(declare-fun mapRes!18930 () Bool)

(declare-fun tp!36689 () Bool)

(assert (=> mapNonEmpty!18930 (= mapRes!18930 (and tp!36689 e!258537))))

(declare-fun mapValue!18930 () ValueCell!5426)

(declare-fun mapRest!18930 () (Array (_ BitVec 32) ValueCell!5426))

(declare-fun mapKey!18930 () (_ BitVec 32))

(assert (=> mapNonEmpty!18930 (= (arr!12899 _values!549) (store mapRest!18930 mapKey!18930 mapValue!18930))))

(declare-fun b!438379 () Bool)

(declare-fun e!258532 () Bool)

(assert (=> b!438379 (= e!258532 (not true))))

(declare-fun minValue!515 () V!16491)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16491)

(declare-fun lt!201787 () array!26897)

(declare-fun v!412 () V!16491)

(declare-fun lt!201789 () array!26899)

(declare-datatypes ((tuple2!7734 0))(
  ( (tuple2!7735 (_1!3878 (_ BitVec 64)) (_2!3878 V!16491)) )
))
(declare-datatypes ((List!7722 0))(
  ( (Nil!7719) (Cons!7718 (h!8574 tuple2!7734) (t!13469 List!7722)) )
))
(declare-datatypes ((ListLongMap!6637 0))(
  ( (ListLongMap!6638 (toList!3334 List!7722)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1533 (array!26897 array!26899 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) Int) ListLongMap!6637)

(declare-fun +!1502 (ListLongMap!6637 tuple2!7734) ListLongMap!6637)

(assert (=> b!438379 (= (getCurrentListMapNoExtraKeys!1533 lt!201787 lt!201789 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1502 (getCurrentListMapNoExtraKeys!1533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7735 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13021 0))(
  ( (Unit!13022) )
))
(declare-fun lt!201790 () Unit!13021)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 (array!26897 array!26899 (_ BitVec 32) (_ BitVec 32) V!16491 V!16491 (_ BitVec 32) (_ BitVec 64) V!16491 (_ BitVec 32) Int) Unit!13021)

(assert (=> b!438379 (= lt!201790 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!640 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438380 () Bool)

(declare-fun res!258921 () Bool)

(assert (=> b!438380 (=> (not res!258921) (not e!258534))))

(assert (=> b!438380 (= res!258921 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13251 _keys!709))))))

(declare-fun b!438381 () Bool)

(declare-fun e!258536 () Bool)

(assert (=> b!438381 (= e!258534 e!258536)))

(declare-fun res!258912 () Bool)

(assert (=> b!438381 (=> (not res!258912) (not e!258536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26897 (_ BitVec 32)) Bool)

(assert (=> b!438381 (= res!258912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201787 mask!1025))))

(assert (=> b!438381 (= lt!201787 (array!26898 (store (arr!12898 _keys!709) i!563 k0!794) (size!13251 _keys!709)))))

(declare-fun b!438382 () Bool)

(assert (=> b!438382 (= e!258531 (and e!258533 mapRes!18930))))

(declare-fun condMapEmpty!18930 () Bool)

(declare-fun mapDefault!18930 () ValueCell!5426)

(assert (=> b!438382 (= condMapEmpty!18930 (= (arr!12899 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5426)) mapDefault!18930)))))

(declare-fun b!438383 () Bool)

(declare-fun res!258919 () Bool)

(assert (=> b!438383 (=> (not res!258919) (not e!258536))))

(assert (=> b!438383 (= res!258919 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18930 () Bool)

(assert (=> mapIsEmpty!18930 mapRes!18930))

(declare-fun b!438384 () Bool)

(declare-fun res!258911 () Bool)

(assert (=> b!438384 (=> (not res!258911) (not e!258534))))

(assert (=> b!438384 (= res!258911 (or (= (select (arr!12898 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12898 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438385 () Bool)

(declare-fun res!258910 () Bool)

(assert (=> b!438385 (=> (not res!258910) (not e!258536))))

(assert (=> b!438385 (= res!258910 (arrayNoDuplicates!0 lt!201787 #b00000000000000000000000000000000 Nil!7718))))

(declare-fun b!438386 () Bool)

(declare-fun res!258914 () Bool)

(assert (=> b!438386 (=> (not res!258914) (not e!258534))))

(assert (=> b!438386 (= res!258914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438387 () Bool)

(assert (=> b!438387 (= e!258536 e!258532)))

(declare-fun res!258909 () Bool)

(assert (=> b!438387 (=> (not res!258909) (not e!258532))))

(assert (=> b!438387 (= res!258909 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201788 () ListLongMap!6637)

(assert (=> b!438387 (= lt!201788 (getCurrentListMapNoExtraKeys!1533 lt!201787 lt!201789 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438387 (= lt!201789 (array!26900 (store (arr!12899 _values!549) i!563 (ValueCellFull!5426 v!412)) (size!13252 _values!549)))))

(declare-fun lt!201791 () ListLongMap!6637)

(assert (=> b!438387 (= lt!201791 (getCurrentListMapNoExtraKeys!1533 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438388 () Bool)

(declare-fun res!258916 () Bool)

(assert (=> b!438388 (=> (not res!258916) (not e!258534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438388 (= res!258916 (validMask!0 mask!1025))))

(assert (= (and start!40106 res!258918) b!438388))

(assert (= (and b!438388 res!258916) b!438378))

(assert (= (and b!438378 res!258915) b!438386))

(assert (= (and b!438386 res!258914) b!438376))

(assert (= (and b!438376 res!258920) b!438380))

(assert (= (and b!438380 res!258921) b!438375))

(assert (= (and b!438375 res!258913) b!438384))

(assert (= (and b!438384 res!258911) b!438377))

(assert (= (and b!438377 res!258917) b!438381))

(assert (= (and b!438381 res!258912) b!438385))

(assert (= (and b!438385 res!258910) b!438383))

(assert (= (and b!438383 res!258919) b!438387))

(assert (= (and b!438387 res!258909) b!438379))

(assert (= (and b!438382 condMapEmpty!18930) mapIsEmpty!18930))

(assert (= (and b!438382 (not condMapEmpty!18930)) mapNonEmpty!18930))

(get-info :version)

(assert (= (and mapNonEmpty!18930 ((_ is ValueCellFull!5426) mapValue!18930)) b!438373))

(assert (= (and b!438382 ((_ is ValueCellFull!5426) mapDefault!18930)) b!438374))

(assert (= start!40106 b!438382))

(declare-fun m!425331 () Bool)

(assert (=> mapNonEmpty!18930 m!425331))

(declare-fun m!425333 () Bool)

(assert (=> b!438384 m!425333))

(declare-fun m!425335 () Bool)

(assert (=> b!438386 m!425335))

(declare-fun m!425337 () Bool)

(assert (=> b!438381 m!425337))

(declare-fun m!425339 () Bool)

(assert (=> b!438381 m!425339))

(declare-fun m!425341 () Bool)

(assert (=> b!438375 m!425341))

(declare-fun m!425343 () Bool)

(assert (=> start!40106 m!425343))

(declare-fun m!425345 () Bool)

(assert (=> start!40106 m!425345))

(declare-fun m!425347 () Bool)

(assert (=> b!438376 m!425347))

(declare-fun m!425349 () Bool)

(assert (=> b!438379 m!425349))

(declare-fun m!425351 () Bool)

(assert (=> b!438379 m!425351))

(assert (=> b!438379 m!425351))

(declare-fun m!425353 () Bool)

(assert (=> b!438379 m!425353))

(declare-fun m!425355 () Bool)

(assert (=> b!438379 m!425355))

(declare-fun m!425357 () Bool)

(assert (=> b!438385 m!425357))

(declare-fun m!425359 () Bool)

(assert (=> b!438377 m!425359))

(declare-fun m!425361 () Bool)

(assert (=> b!438387 m!425361))

(declare-fun m!425363 () Bool)

(assert (=> b!438387 m!425363))

(declare-fun m!425365 () Bool)

(assert (=> b!438387 m!425365))

(declare-fun m!425367 () Bool)

(assert (=> b!438388 m!425367))

(check-sat (not b!438379) tp_is_empty!11539 b_and!18329 (not b_next!10387) (not mapNonEmpty!18930) (not start!40106) (not b!438386) (not b!438385) (not b!438375) (not b!438376) (not b!438387) (not b!438377) (not b!438381) (not b!438388))
(check-sat b_and!18329 (not b_next!10387))
