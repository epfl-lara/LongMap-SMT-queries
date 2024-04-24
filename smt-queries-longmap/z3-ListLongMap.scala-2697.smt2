; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39986 () Bool)

(assert start!39986)

(declare-fun b_free!10267 () Bool)

(declare-fun b_next!10267 () Bool)

(assert (=> start!39986 (= b_free!10267 (not b_next!10267))))

(declare-fun tp!36330 () Bool)

(declare-fun b_and!18207 () Bool)

(assert (=> start!39986 (= tp!36330 b_and!18207)))

(declare-fun res!256579 () Bool)

(declare-fun e!257233 () Bool)

(assert (=> start!39986 (=> (not res!256579) (not e!257233))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26670 0))(
  ( (array!26671 (arr!12784 (Array (_ BitVec 32) (_ BitVec 64))) (size!13136 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26670)

(assert (=> start!39986 (= res!256579 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13136 _keys!709))))))

(assert (=> start!39986 e!257233))

(declare-fun tp_is_empty!11419 () Bool)

(assert (=> start!39986 tp_is_empty!11419))

(assert (=> start!39986 tp!36330))

(assert (=> start!39986 true))

(declare-datatypes ((V!16331 0))(
  ( (V!16332 (val!5754 Int)) )
))
(declare-datatypes ((ValueCell!5366 0))(
  ( (ValueCellFull!5366 (v!8002 V!16331)) (EmptyCell!5366) )
))
(declare-datatypes ((array!26672 0))(
  ( (array!26673 (arr!12785 (Array (_ BitVec 32) ValueCell!5366)) (size!13137 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26672)

(declare-fun e!257232 () Bool)

(declare-fun array_inv!9354 (array!26672) Bool)

(assert (=> start!39986 (and (array_inv!9354 _values!549) e!257232)))

(declare-fun array_inv!9355 (array!26670) Bool)

(assert (=> start!39986 (array_inv!9355 _keys!709)))

(declare-fun b!435429 () Bool)

(declare-fun e!257239 () Bool)

(declare-fun e!257234 () Bool)

(assert (=> b!435429 (= e!257239 (not e!257234))))

(declare-fun res!256578 () Bool)

(assert (=> b!435429 (=> res!256578 e!257234)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!435429 (= res!256578 (not (validKeyInArray!0 (select (arr!12784 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7522 0))(
  ( (tuple2!7523 (_1!3772 (_ BitVec 64)) (_2!3772 V!16331)) )
))
(declare-datatypes ((List!7512 0))(
  ( (Nil!7509) (Cons!7508 (h!8364 tuple2!7522) (t!13220 List!7512)) )
))
(declare-datatypes ((ListLongMap!6437 0))(
  ( (ListLongMap!6438 (toList!3234 List!7512)) )
))
(declare-fun lt!200539 () ListLongMap!6437)

(declare-fun lt!200534 () ListLongMap!6437)

(assert (=> b!435429 (= lt!200539 lt!200534)))

(declare-fun lt!200537 () ListLongMap!6437)

(declare-fun lt!200541 () tuple2!7522)

(declare-fun +!1438 (ListLongMap!6437 tuple2!7522) ListLongMap!6437)

(assert (=> b!435429 (= lt!200534 (+!1438 lt!200537 lt!200541))))

(declare-fun minValue!515 () V!16331)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200535 () array!26670)

(declare-fun zeroValue!515 () V!16331)

(declare-fun lt!200544 () array!26672)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1468 (array!26670 array!26672 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) Int) ListLongMap!6437)

(assert (=> b!435429 (= lt!200539 (getCurrentListMapNoExtraKeys!1468 lt!200535 lt!200544 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16331)

(assert (=> b!435429 (= lt!200541 (tuple2!7523 k0!794 v!412))))

(assert (=> b!435429 (= lt!200537 (getCurrentListMapNoExtraKeys!1468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12926 0))(
  ( (Unit!12927) )
))
(declare-fun lt!200536 () Unit!12926)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 (array!26670 array!26672 (_ BitVec 32) (_ BitVec 32) V!16331 V!16331 (_ BitVec 32) (_ BitVec 64) V!16331 (_ BitVec 32) Int) Unit!12926)

(assert (=> b!435429 (= lt!200536 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!600 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!435430 () Bool)

(declare-fun res!256574 () Bool)

(assert (=> b!435430 (=> (not res!256574) (not e!257233))))

(declare-fun arrayContainsKey!0 (array!26670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!435430 (= res!256574 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!435431 () Bool)

(declare-fun e!257238 () Bool)

(assert (=> b!435431 (= e!257238 tp_is_empty!11419)))

(declare-fun b!435432 () Bool)

(declare-fun e!257230 () Bool)

(declare-fun mapRes!18750 () Bool)

(assert (=> b!435432 (= e!257232 (and e!257230 mapRes!18750))))

(declare-fun condMapEmpty!18750 () Bool)

(declare-fun mapDefault!18750 () ValueCell!5366)

(assert (=> b!435432 (= condMapEmpty!18750 (= (arr!12785 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5366)) mapDefault!18750)))))

(declare-fun b!435433 () Bool)

(declare-fun e!257236 () Unit!12926)

(declare-fun Unit!12928 () Unit!12926)

(assert (=> b!435433 (= e!257236 Unit!12928)))

(declare-fun lt!200540 () Unit!12926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26670 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12926)

(assert (=> b!435433 (= lt!200540 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!435433 false))

(declare-fun b!435434 () Bool)

(declare-fun res!256576 () Bool)

(assert (=> b!435434 (=> (not res!256576) (not e!257233))))

(assert (=> b!435434 (= res!256576 (or (= (select (arr!12784 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12784 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435435 () Bool)

(declare-fun res!256581 () Bool)

(assert (=> b!435435 (=> (not res!256581) (not e!257233))))

(assert (=> b!435435 (= res!256581 (validKeyInArray!0 k0!794))))

(declare-fun b!435436 () Bool)

(declare-fun e!257237 () Bool)

(assert (=> b!435436 (= e!257237 true)))

(declare-fun lt!200530 () ListLongMap!6437)

(declare-fun lt!200533 () tuple2!7522)

(assert (=> b!435436 (= lt!200530 (+!1438 (+!1438 lt!200537 lt!200533) lt!200541))))

(declare-fun lt!200543 () Unit!12926)

(declare-fun lt!200532 () V!16331)

(declare-fun addCommutativeForDiffKeys!407 (ListLongMap!6437 (_ BitVec 64) V!16331 (_ BitVec 64) V!16331) Unit!12926)

(assert (=> b!435436 (= lt!200543 (addCommutativeForDiffKeys!407 lt!200537 k0!794 v!412 (select (arr!12784 _keys!709) from!863) lt!200532))))

(declare-fun b!435437 () Bool)

(declare-fun e!257235 () Bool)

(assert (=> b!435437 (= e!257235 e!257239)))

(declare-fun res!256585 () Bool)

(assert (=> b!435437 (=> (not res!256585) (not e!257239))))

(assert (=> b!435437 (= res!256585 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200542 () ListLongMap!6437)

(assert (=> b!435437 (= lt!200542 (getCurrentListMapNoExtraKeys!1468 lt!200535 lt!200544 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!435437 (= lt!200544 (array!26673 (store (arr!12785 _values!549) i!563 (ValueCellFull!5366 v!412)) (size!13137 _values!549)))))

(declare-fun lt!200538 () ListLongMap!6437)

(assert (=> b!435437 (= lt!200538 (getCurrentListMapNoExtraKeys!1468 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!435438 () Bool)

(assert (=> b!435438 (= e!257234 e!257237)))

(declare-fun res!256573 () Bool)

(assert (=> b!435438 (=> res!256573 e!257237)))

(assert (=> b!435438 (= res!256573 (= k0!794 (select (arr!12784 _keys!709) from!863)))))

(assert (=> b!435438 (not (= (select (arr!12784 _keys!709) from!863) k0!794))))

(declare-fun lt!200531 () Unit!12926)

(assert (=> b!435438 (= lt!200531 e!257236)))

(declare-fun c!55713 () Bool)

(assert (=> b!435438 (= c!55713 (= (select (arr!12784 _keys!709) from!863) k0!794))))

(assert (=> b!435438 (= lt!200542 lt!200530)))

(assert (=> b!435438 (= lt!200530 (+!1438 lt!200534 lt!200533))))

(assert (=> b!435438 (= lt!200533 (tuple2!7523 (select (arr!12784 _keys!709) from!863) lt!200532))))

(declare-fun get!6382 (ValueCell!5366 V!16331) V!16331)

(declare-fun dynLambda!839 (Int (_ BitVec 64)) V!16331)

(assert (=> b!435438 (= lt!200532 (get!6382 (select (arr!12785 _values!549) from!863) (dynLambda!839 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!435439 () Bool)

(declare-fun Unit!12929 () Unit!12926)

(assert (=> b!435439 (= e!257236 Unit!12929)))

(declare-fun b!435440 () Bool)

(assert (=> b!435440 (= e!257230 tp_is_empty!11419)))

(declare-fun b!435441 () Bool)

(assert (=> b!435441 (= e!257233 e!257235)))

(declare-fun res!256577 () Bool)

(assert (=> b!435441 (=> (not res!256577) (not e!257235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26670 (_ BitVec 32)) Bool)

(assert (=> b!435441 (= res!256577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200535 mask!1025))))

(assert (=> b!435441 (= lt!200535 (array!26671 (store (arr!12784 _keys!709) i!563 k0!794) (size!13136 _keys!709)))))

(declare-fun b!435442 () Bool)

(declare-fun res!256586 () Bool)

(assert (=> b!435442 (=> (not res!256586) (not e!257233))))

(assert (=> b!435442 (= res!256586 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13136 _keys!709))))))

(declare-fun b!435443 () Bool)

(declare-fun res!256587 () Bool)

(assert (=> b!435443 (=> (not res!256587) (not e!257233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!435443 (= res!256587 (validMask!0 mask!1025))))

(declare-fun b!435444 () Bool)

(declare-fun res!256575 () Bool)

(assert (=> b!435444 (=> (not res!256575) (not e!257233))))

(assert (=> b!435444 (= res!256575 (and (= (size!13137 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13136 _keys!709) (size!13137 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!435445 () Bool)

(declare-fun res!256583 () Bool)

(assert (=> b!435445 (=> (not res!256583) (not e!257235))))

(assert (=> b!435445 (= res!256583 (bvsle from!863 i!563))))

(declare-fun b!435446 () Bool)

(declare-fun res!256580 () Bool)

(assert (=> b!435446 (=> (not res!256580) (not e!257235))))

(declare-datatypes ((List!7513 0))(
  ( (Nil!7510) (Cons!7509 (h!8365 (_ BitVec 64)) (t!13221 List!7513)) )
))
(declare-fun arrayNoDuplicates!0 (array!26670 (_ BitVec 32) List!7513) Bool)

(assert (=> b!435446 (= res!256580 (arrayNoDuplicates!0 lt!200535 #b00000000000000000000000000000000 Nil!7510))))

(declare-fun mapNonEmpty!18750 () Bool)

(declare-fun tp!36329 () Bool)

(assert (=> mapNonEmpty!18750 (= mapRes!18750 (and tp!36329 e!257238))))

(declare-fun mapRest!18750 () (Array (_ BitVec 32) ValueCell!5366))

(declare-fun mapValue!18750 () ValueCell!5366)

(declare-fun mapKey!18750 () (_ BitVec 32))

(assert (=> mapNonEmpty!18750 (= (arr!12785 _values!549) (store mapRest!18750 mapKey!18750 mapValue!18750))))

(declare-fun mapIsEmpty!18750 () Bool)

(assert (=> mapIsEmpty!18750 mapRes!18750))

(declare-fun b!435447 () Bool)

(declare-fun res!256584 () Bool)

(assert (=> b!435447 (=> (not res!256584) (not e!257233))))

(assert (=> b!435447 (= res!256584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!435448 () Bool)

(declare-fun res!256582 () Bool)

(assert (=> b!435448 (=> (not res!256582) (not e!257233))))

(assert (=> b!435448 (= res!256582 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7510))))

(assert (= (and start!39986 res!256579) b!435443))

(assert (= (and b!435443 res!256587) b!435444))

(assert (= (and b!435444 res!256575) b!435447))

(assert (= (and b!435447 res!256584) b!435448))

(assert (= (and b!435448 res!256582) b!435442))

(assert (= (and b!435442 res!256586) b!435435))

(assert (= (and b!435435 res!256581) b!435434))

(assert (= (and b!435434 res!256576) b!435430))

(assert (= (and b!435430 res!256574) b!435441))

(assert (= (and b!435441 res!256577) b!435446))

(assert (= (and b!435446 res!256580) b!435445))

(assert (= (and b!435445 res!256583) b!435437))

(assert (= (and b!435437 res!256585) b!435429))

(assert (= (and b!435429 (not res!256578)) b!435438))

(assert (= (and b!435438 c!55713) b!435433))

(assert (= (and b!435438 (not c!55713)) b!435439))

(assert (= (and b!435438 (not res!256573)) b!435436))

(assert (= (and b!435432 condMapEmpty!18750) mapIsEmpty!18750))

(assert (= (and b!435432 (not condMapEmpty!18750)) mapNonEmpty!18750))

(get-info :version)

(assert (= (and mapNonEmpty!18750 ((_ is ValueCellFull!5366) mapValue!18750)) b!435431))

(assert (= (and b!435432 ((_ is ValueCellFull!5366) mapDefault!18750)) b!435440))

(assert (= start!39986 b!435432))

(declare-fun b_lambda!9377 () Bool)

(assert (=> (not b_lambda!9377) (not b!435438)))

(declare-fun t!13219 () Bool)

(declare-fun tb!3665 () Bool)

(assert (=> (and start!39986 (= defaultEntry!557 defaultEntry!557) t!13219) tb!3665))

(declare-fun result!6865 () Bool)

(assert (=> tb!3665 (= result!6865 tp_is_empty!11419)))

(assert (=> b!435438 t!13219))

(declare-fun b_and!18209 () Bool)

(assert (= b_and!18207 (and (=> t!13219 result!6865) b_and!18209)))

(declare-fun m!423581 () Bool)

(assert (=> b!435436 m!423581))

(assert (=> b!435436 m!423581))

(declare-fun m!423583 () Bool)

(assert (=> b!435436 m!423583))

(declare-fun m!423585 () Bool)

(assert (=> b!435436 m!423585))

(assert (=> b!435436 m!423585))

(declare-fun m!423587 () Bool)

(assert (=> b!435436 m!423587))

(declare-fun m!423589 () Bool)

(assert (=> b!435447 m!423589))

(declare-fun m!423591 () Bool)

(assert (=> b!435434 m!423591))

(declare-fun m!423593 () Bool)

(assert (=> b!435446 m!423593))

(declare-fun m!423595 () Bool)

(assert (=> start!39986 m!423595))

(declare-fun m!423597 () Bool)

(assert (=> start!39986 m!423597))

(declare-fun m!423599 () Bool)

(assert (=> b!435437 m!423599))

(declare-fun m!423601 () Bool)

(assert (=> b!435437 m!423601))

(declare-fun m!423603 () Bool)

(assert (=> b!435437 m!423603))

(declare-fun m!423605 () Bool)

(assert (=> b!435433 m!423605))

(assert (=> b!435429 m!423585))

(declare-fun m!423607 () Bool)

(assert (=> b!435429 m!423607))

(declare-fun m!423609 () Bool)

(assert (=> b!435429 m!423609))

(declare-fun m!423611 () Bool)

(assert (=> b!435429 m!423611))

(assert (=> b!435429 m!423585))

(declare-fun m!423613 () Bool)

(assert (=> b!435429 m!423613))

(declare-fun m!423615 () Bool)

(assert (=> b!435429 m!423615))

(declare-fun m!423617 () Bool)

(assert (=> mapNonEmpty!18750 m!423617))

(declare-fun m!423619 () Bool)

(assert (=> b!435441 m!423619))

(declare-fun m!423621 () Bool)

(assert (=> b!435441 m!423621))

(declare-fun m!423623 () Bool)

(assert (=> b!435430 m!423623))

(declare-fun m!423625 () Bool)

(assert (=> b!435435 m!423625))

(assert (=> b!435438 m!423585))

(declare-fun m!423627 () Bool)

(assert (=> b!435438 m!423627))

(declare-fun m!423629 () Bool)

(assert (=> b!435438 m!423629))

(declare-fun m!423631 () Bool)

(assert (=> b!435438 m!423631))

(assert (=> b!435438 m!423631))

(assert (=> b!435438 m!423627))

(declare-fun m!423633 () Bool)

(assert (=> b!435438 m!423633))

(declare-fun m!423635 () Bool)

(assert (=> b!435448 m!423635))

(declare-fun m!423637 () Bool)

(assert (=> b!435443 m!423637))

(check-sat (not b!435446) (not b_lambda!9377) b_and!18209 (not b!435435) (not b!435447) (not b!435430) tp_is_empty!11419 (not b!435441) (not b!435433) (not b!435448) (not b!435436) (not b!435438) (not start!39986) (not b_next!10267) (not mapNonEmpty!18750) (not b!435437) (not b!435443) (not b!435429))
(check-sat b_and!18209 (not b_next!10267))
