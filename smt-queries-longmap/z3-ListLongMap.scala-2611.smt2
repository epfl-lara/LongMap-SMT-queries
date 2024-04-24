; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39470 () Bool)

(assert start!39470)

(declare-fun b_free!9751 () Bool)

(declare-fun b_next!9751 () Bool)

(assert (=> start!39470 (= b_free!9751 (not b_next!9751))))

(declare-fun tp!34782 () Bool)

(declare-fun b_and!17391 () Bool)

(assert (=> start!39470 (= tp!34782 b_and!17391)))

(declare-fun b!421393 () Bool)

(declare-fun res!245956 () Bool)

(declare-fun e!250860 () Bool)

(assert (=> b!421393 (=> (not res!245956) (not e!250860))))

(declare-datatypes ((array!25660 0))(
  ( (array!25661 (arr!12279 (Array (_ BitVec 32) (_ BitVec 64))) (size!12631 (_ BitVec 32))) )
))
(declare-fun lt!193484 () array!25660)

(declare-datatypes ((List!7094 0))(
  ( (Nil!7091) (Cons!7090 (h!7946 (_ BitVec 64)) (t!12502 List!7094)) )
))
(declare-fun arrayNoDuplicates!0 (array!25660 (_ BitVec 32) List!7094) Bool)

(assert (=> b!421393 (= res!245956 (arrayNoDuplicates!0 lt!193484 #b00000000000000000000000000000000 Nil!7091))))

(declare-fun b!421394 () Bool)

(declare-fun e!250862 () Bool)

(declare-fun e!250864 () Bool)

(declare-fun mapRes!17976 () Bool)

(assert (=> b!421394 (= e!250862 (and e!250864 mapRes!17976))))

(declare-fun condMapEmpty!17976 () Bool)

(declare-datatypes ((V!15643 0))(
  ( (V!15644 (val!5496 Int)) )
))
(declare-datatypes ((ValueCell!5108 0))(
  ( (ValueCellFull!5108 (v!7744 V!15643)) (EmptyCell!5108) )
))
(declare-datatypes ((array!25662 0))(
  ( (array!25663 (arr!12280 (Array (_ BitVec 32) ValueCell!5108)) (size!12632 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25662)

(declare-fun mapDefault!17976 () ValueCell!5108)

(assert (=> b!421394 (= condMapEmpty!17976 (= (arr!12280 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5108)) mapDefault!17976)))))

(declare-fun b!421395 () Bool)

(declare-fun e!250857 () Bool)

(assert (=> b!421395 (= e!250860 e!250857)))

(declare-fun res!245963 () Bool)

(assert (=> b!421395 (=> (not res!245963) (not e!250857))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421395 (= res!245963 (= from!863 i!563))))

(declare-fun minValue!515 () V!15643)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!193490 () array!25662)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7092 0))(
  ( (tuple2!7093 (_1!3557 (_ BitVec 64)) (_2!3557 V!15643)) )
))
(declare-datatypes ((List!7095 0))(
  ( (Nil!7092) (Cons!7091 (h!7947 tuple2!7092) (t!12503 List!7095)) )
))
(declare-datatypes ((ListLongMap!6007 0))(
  ( (ListLongMap!6008 (toList!3019 List!7095)) )
))
(declare-fun lt!193488 () ListLongMap!6007)

(declare-fun zeroValue!515 () V!15643)

(declare-fun getCurrentListMapNoExtraKeys!1265 (array!25660 array!25662 (_ BitVec 32) (_ BitVec 32) V!15643 V!15643 (_ BitVec 32) Int) ListLongMap!6007)

(assert (=> b!421395 (= lt!193488 (getCurrentListMapNoExtraKeys!1265 lt!193484 lt!193490 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15643)

(assert (=> b!421395 (= lt!193490 (array!25663 (store (arr!12280 _values!549) i!563 (ValueCellFull!5108 v!412)) (size!12632 _values!549)))))

(declare-fun lt!193487 () ListLongMap!6007)

(declare-fun _keys!709 () array!25660)

(assert (=> b!421395 (= lt!193487 (getCurrentListMapNoExtraKeys!1265 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421396 () Bool)

(declare-fun res!245958 () Bool)

(assert (=> b!421396 (=> (not res!245958) (not e!250860))))

(assert (=> b!421396 (= res!245958 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!17976 () Bool)

(declare-fun tp!34781 () Bool)

(declare-fun e!250863 () Bool)

(assert (=> mapNonEmpty!17976 (= mapRes!17976 (and tp!34781 e!250863))))

(declare-fun mapValue!17976 () ValueCell!5108)

(declare-fun mapKey!17976 () (_ BitVec 32))

(declare-fun mapRest!17976 () (Array (_ BitVec 32) ValueCell!5108))

(assert (=> mapNonEmpty!17976 (= (arr!12280 _values!549) (store mapRest!17976 mapKey!17976 mapValue!17976))))

(declare-fun b!421398 () Bool)

(declare-fun res!245951 () Bool)

(declare-fun e!250861 () Bool)

(assert (=> b!421398 (=> (not res!245951) (not e!250861))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421398 (= res!245951 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421399 () Bool)

(declare-fun res!245957 () Bool)

(assert (=> b!421399 (=> (not res!245957) (not e!250861))))

(assert (=> b!421399 (= res!245957 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7091))))

(declare-fun bm!29415 () Bool)

(declare-fun c!55317 () Bool)

(declare-fun call!29418 () ListLongMap!6007)

(assert (=> bm!29415 (= call!29418 (getCurrentListMapNoExtraKeys!1265 (ite c!55317 lt!193484 _keys!709) (ite c!55317 lt!193490 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421400 () Bool)

(declare-fun e!250859 () Bool)

(declare-fun call!29419 () ListLongMap!6007)

(declare-fun +!1280 (ListLongMap!6007 tuple2!7092) ListLongMap!6007)

(assert (=> b!421400 (= e!250859 (= call!29418 (+!1280 call!29419 (tuple2!7093 k0!794 v!412))))))

(declare-fun b!421401 () Bool)

(assert (=> b!421401 (= e!250859 (= call!29419 call!29418))))

(declare-fun b!421402 () Bool)

(declare-fun res!245959 () Bool)

(assert (=> b!421402 (=> (not res!245959) (not e!250861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421402 (= res!245959 (validKeyInArray!0 k0!794))))

(declare-fun b!421403 () Bool)

(declare-fun e!250856 () Bool)

(assert (=> b!421403 (= e!250857 (not e!250856))))

(declare-fun res!245955 () Bool)

(assert (=> b!421403 (=> res!245955 e!250856)))

(assert (=> b!421403 (= res!245955 (validKeyInArray!0 (select (arr!12279 _keys!709) from!863)))))

(assert (=> b!421403 e!250859))

(assert (=> b!421403 (= c!55317 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12435 0))(
  ( (Unit!12436) )
))
(declare-fun lt!193492 () Unit!12435)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!466 (array!25660 array!25662 (_ BitVec 32) (_ BitVec 32) V!15643 V!15643 (_ BitVec 32) (_ BitVec 64) V!15643 (_ BitVec 32) Int) Unit!12435)

(assert (=> b!421403 (= lt!193492 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!466 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421404 () Bool)

(declare-fun res!245954 () Bool)

(assert (=> b!421404 (=> (not res!245954) (not e!250861))))

(assert (=> b!421404 (= res!245954 (and (= (size!12632 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12631 _keys!709) (size!12632 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421405 () Bool)

(assert (=> b!421405 (= e!250861 e!250860)))

(declare-fun res!245961 () Bool)

(assert (=> b!421405 (=> (not res!245961) (not e!250860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25660 (_ BitVec 32)) Bool)

(assert (=> b!421405 (= res!245961 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193484 mask!1025))))

(assert (=> b!421405 (= lt!193484 (array!25661 (store (arr!12279 _keys!709) i!563 k0!794) (size!12631 _keys!709)))))

(declare-fun b!421406 () Bool)

(declare-fun res!245962 () Bool)

(assert (=> b!421406 (=> (not res!245962) (not e!250861))))

(assert (=> b!421406 (= res!245962 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12631 _keys!709))))))

(declare-fun b!421407 () Bool)

(declare-fun res!245953 () Bool)

(assert (=> b!421407 (=> (not res!245953) (not e!250861))))

(assert (=> b!421407 (= res!245953 (or (= (select (arr!12279 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12279 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!421397 () Bool)

(declare-fun tp_is_empty!10903 () Bool)

(assert (=> b!421397 (= e!250863 tp_is_empty!10903)))

(declare-fun res!245960 () Bool)

(assert (=> start!39470 (=> (not res!245960) (not e!250861))))

(assert (=> start!39470 (= res!245960 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12631 _keys!709))))))

(assert (=> start!39470 e!250861))

(assert (=> start!39470 tp_is_empty!10903))

(assert (=> start!39470 tp!34782))

(assert (=> start!39470 true))

(declare-fun array_inv!9024 (array!25662) Bool)

(assert (=> start!39470 (and (array_inv!9024 _values!549) e!250862)))

(declare-fun array_inv!9025 (array!25660) Bool)

(assert (=> start!39470 (array_inv!9025 _keys!709)))

(declare-fun mapIsEmpty!17976 () Bool)

(assert (=> mapIsEmpty!17976 mapRes!17976))

(declare-fun bm!29416 () Bool)

(assert (=> bm!29416 (= call!29419 (getCurrentListMapNoExtraKeys!1265 (ite c!55317 _keys!709 lt!193484) (ite c!55317 _values!549 lt!193490) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421408 () Bool)

(declare-fun res!245952 () Bool)

(assert (=> b!421408 (=> (not res!245952) (not e!250861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421408 (= res!245952 (validMask!0 mask!1025))))

(declare-fun b!421409 () Bool)

(assert (=> b!421409 (= e!250856 true)))

(declare-fun lt!193486 () ListLongMap!6007)

(declare-fun lt!193493 () V!15643)

(declare-fun lt!193491 () tuple2!7092)

(assert (=> b!421409 (= (+!1280 lt!193486 lt!193491) (+!1280 (+!1280 lt!193486 (tuple2!7093 k0!794 lt!193493)) lt!193491))))

(declare-fun lt!193489 () V!15643)

(assert (=> b!421409 (= lt!193491 (tuple2!7093 k0!794 lt!193489))))

(declare-fun lt!193485 () Unit!12435)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!70 (ListLongMap!6007 (_ BitVec 64) V!15643 V!15643) Unit!12435)

(assert (=> b!421409 (= lt!193485 (addSameAsAddTwiceSameKeyDiffValues!70 lt!193486 k0!794 lt!193493 lt!193489))))

(declare-fun lt!193494 () V!15643)

(declare-fun get!6108 (ValueCell!5108 V!15643) V!15643)

(assert (=> b!421409 (= lt!193493 (get!6108 (select (arr!12280 _values!549) from!863) lt!193494))))

(assert (=> b!421409 (= lt!193488 (+!1280 lt!193486 (tuple2!7093 (select (arr!12279 lt!193484) from!863) lt!193489)))))

(assert (=> b!421409 (= lt!193489 (get!6108 (select (store (arr!12280 _values!549) i!563 (ValueCellFull!5108 v!412)) from!863) lt!193494))))

(declare-fun dynLambda!737 (Int (_ BitVec 64)) V!15643)

(assert (=> b!421409 (= lt!193494 (dynLambda!737 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421409 (= lt!193486 (getCurrentListMapNoExtraKeys!1265 lt!193484 lt!193490 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421410 () Bool)

(declare-fun res!245964 () Bool)

(assert (=> b!421410 (=> (not res!245964) (not e!250861))))

(assert (=> b!421410 (= res!245964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421411 () Bool)

(assert (=> b!421411 (= e!250864 tp_is_empty!10903)))

(assert (= (and start!39470 res!245960) b!421408))

(assert (= (and b!421408 res!245952) b!421404))

(assert (= (and b!421404 res!245954) b!421410))

(assert (= (and b!421410 res!245964) b!421399))

(assert (= (and b!421399 res!245957) b!421406))

(assert (= (and b!421406 res!245962) b!421402))

(assert (= (and b!421402 res!245959) b!421407))

(assert (= (and b!421407 res!245953) b!421398))

(assert (= (and b!421398 res!245951) b!421405))

(assert (= (and b!421405 res!245961) b!421393))

(assert (= (and b!421393 res!245956) b!421396))

(assert (= (and b!421396 res!245958) b!421395))

(assert (= (and b!421395 res!245963) b!421403))

(assert (= (and b!421403 c!55317) b!421400))

(assert (= (and b!421403 (not c!55317)) b!421401))

(assert (= (or b!421400 b!421401) bm!29415))

(assert (= (or b!421400 b!421401) bm!29416))

(assert (= (and b!421403 (not res!245955)) b!421409))

(assert (= (and b!421394 condMapEmpty!17976) mapIsEmpty!17976))

(assert (= (and b!421394 (not condMapEmpty!17976)) mapNonEmpty!17976))

(get-info :version)

(assert (= (and mapNonEmpty!17976 ((_ is ValueCellFull!5108) mapValue!17976)) b!421397))

(assert (= (and b!421394 ((_ is ValueCellFull!5108) mapDefault!17976)) b!421411))

(assert (= start!39470 b!421394))

(declare-fun b_lambda!9077 () Bool)

(assert (=> (not b_lambda!9077) (not b!421409)))

(declare-fun t!12501 () Bool)

(declare-fun tb!3365 () Bool)

(assert (=> (and start!39470 (= defaultEntry!557 defaultEntry!557) t!12501) tb!3365))

(declare-fun result!6265 () Bool)

(assert (=> tb!3365 (= result!6265 tp_is_empty!10903)))

(assert (=> b!421409 t!12501))

(declare-fun b_and!17393 () Bool)

(assert (= b_and!17391 (and (=> t!12501 result!6265) b_and!17393)))

(declare-fun m!411401 () Bool)

(assert (=> b!421409 m!411401))

(declare-fun m!411403 () Bool)

(assert (=> b!421409 m!411403))

(declare-fun m!411405 () Bool)

(assert (=> b!421409 m!411405))

(declare-fun m!411407 () Bool)

(assert (=> b!421409 m!411407))

(declare-fun m!411409 () Bool)

(assert (=> b!421409 m!411409))

(declare-fun m!411411 () Bool)

(assert (=> b!421409 m!411411))

(assert (=> b!421409 m!411407))

(declare-fun m!411413 () Bool)

(assert (=> b!421409 m!411413))

(declare-fun m!411415 () Bool)

(assert (=> b!421409 m!411415))

(declare-fun m!411417 () Bool)

(assert (=> b!421409 m!411417))

(declare-fun m!411419 () Bool)

(assert (=> b!421409 m!411419))

(assert (=> b!421409 m!411409))

(declare-fun m!411421 () Bool)

(assert (=> b!421409 m!411421))

(declare-fun m!411423 () Bool)

(assert (=> b!421409 m!411423))

(assert (=> b!421409 m!411423))

(declare-fun m!411425 () Bool)

(assert (=> b!421409 m!411425))

(declare-fun m!411427 () Bool)

(assert (=> bm!29415 m!411427))

(declare-fun m!411429 () Bool)

(assert (=> b!421402 m!411429))

(declare-fun m!411431 () Bool)

(assert (=> bm!29416 m!411431))

(declare-fun m!411433 () Bool)

(assert (=> b!421407 m!411433))

(declare-fun m!411435 () Bool)

(assert (=> b!421405 m!411435))

(declare-fun m!411437 () Bool)

(assert (=> b!421405 m!411437))

(declare-fun m!411439 () Bool)

(assert (=> mapNonEmpty!17976 m!411439))

(declare-fun m!411441 () Bool)

(assert (=> b!421410 m!411441))

(declare-fun m!411443 () Bool)

(assert (=> b!421408 m!411443))

(declare-fun m!411445 () Bool)

(assert (=> start!39470 m!411445))

(declare-fun m!411447 () Bool)

(assert (=> start!39470 m!411447))

(declare-fun m!411449 () Bool)

(assert (=> b!421395 m!411449))

(assert (=> b!421395 m!411421))

(declare-fun m!411451 () Bool)

(assert (=> b!421395 m!411451))

(declare-fun m!411453 () Bool)

(assert (=> b!421403 m!411453))

(assert (=> b!421403 m!411453))

(declare-fun m!411455 () Bool)

(assert (=> b!421403 m!411455))

(declare-fun m!411457 () Bool)

(assert (=> b!421403 m!411457))

(declare-fun m!411459 () Bool)

(assert (=> b!421400 m!411459))

(declare-fun m!411461 () Bool)

(assert (=> b!421399 m!411461))

(declare-fun m!411463 () Bool)

(assert (=> b!421393 m!411463))

(declare-fun m!411465 () Bool)

(assert (=> b!421398 m!411465))

(check-sat (not bm!29416) (not b!421409) (not b!421405) (not b!421400) (not b_next!9751) (not start!39470) (not b!421393) (not b!421399) (not b!421408) tp_is_empty!10903 (not b!421402) b_and!17393 (not b_lambda!9077) (not b!421403) (not b!421410) (not b!421395) (not mapNonEmpty!17976) (not b!421398) (not bm!29415))
(check-sat b_and!17393 (not b_next!9751))
