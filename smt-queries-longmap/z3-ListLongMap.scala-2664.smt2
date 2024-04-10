; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39804 () Bool)

(assert start!39804)

(declare-fun b_free!10071 () Bool)

(declare-fun b_next!10071 () Bool)

(assert (=> start!39804 (= b_free!10071 (not b_next!10071))))

(declare-fun tp!35741 () Bool)

(declare-fun b_and!17801 () Bool)

(assert (=> start!39804 (= tp!35741 b_and!17801)))

(declare-fun b!429433 () Bool)

(declare-fun res!252206 () Bool)

(declare-fun e!254359 () Bool)

(assert (=> b!429433 (=> (not res!252206) (not e!254359))))

(declare-datatypes ((array!26281 0))(
  ( (array!26282 (arr!12590 (Array (_ BitVec 32) (_ BitVec 64))) (size!12942 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26281)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429433 (= res!252206 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429434 () Bool)

(declare-fun res!252205 () Bool)

(assert (=> b!429434 (=> (not res!252205) (not e!254359))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429434 (= res!252205 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12942 _keys!709))))))

(declare-fun b!429435 () Bool)

(declare-fun e!254355 () Bool)

(declare-fun e!254360 () Bool)

(assert (=> b!429435 (= e!254355 (not e!254360))))

(declare-fun res!252210 () Bool)

(assert (=> b!429435 (=> res!252210 e!254360)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429435 (= res!252210 (not (validKeyInArray!0 (select (arr!12590 _keys!709) from!863))))))

(declare-datatypes ((V!16069 0))(
  ( (V!16070 (val!5656 Int)) )
))
(declare-datatypes ((tuple2!7448 0))(
  ( (tuple2!7449 (_1!3735 (_ BitVec 64)) (_2!3735 V!16069)) )
))
(declare-datatypes ((List!7463 0))(
  ( (Nil!7460) (Cons!7459 (h!8315 tuple2!7448) (t!12983 List!7463)) )
))
(declare-datatypes ((ListLongMap!6361 0))(
  ( (ListLongMap!6362 (toList!3196 List!7463)) )
))
(declare-fun lt!196261 () ListLongMap!6361)

(declare-fun lt!196263 () ListLongMap!6361)

(assert (=> b!429435 (= lt!196261 lt!196263)))

(declare-fun v!412 () V!16069)

(declare-fun lt!196258 () ListLongMap!6361)

(declare-fun +!1345 (ListLongMap!6361 tuple2!7448) ListLongMap!6361)

(assert (=> b!429435 (= lt!196263 (+!1345 lt!196258 (tuple2!7449 k0!794 v!412)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5268 0))(
  ( (ValueCellFull!5268 (v!7903 V!16069)) (EmptyCell!5268) )
))
(declare-datatypes ((array!26283 0))(
  ( (array!26284 (arr!12591 (Array (_ BitVec 32) ValueCell!5268)) (size!12943 (_ BitVec 32))) )
))
(declare-fun lt!196260 () array!26283)

(declare-fun zeroValue!515 () V!16069)

(declare-fun lt!196265 () array!26281)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!16069)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1398 (array!26281 array!26283 (_ BitVec 32) (_ BitVec 32) V!16069 V!16069 (_ BitVec 32) Int) ListLongMap!6361)

(assert (=> b!429435 (= lt!196261 (getCurrentListMapNoExtraKeys!1398 lt!196265 lt!196260 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26283)

(assert (=> b!429435 (= lt!196258 (getCurrentListMapNoExtraKeys!1398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12616 0))(
  ( (Unit!12617) )
))
(declare-fun lt!196264 () Unit!12616)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!534 (array!26281 array!26283 (_ BitVec 32) (_ BitVec 32) V!16069 V!16069 (_ BitVec 32) (_ BitVec 64) V!16069 (_ BitVec 32) Int) Unit!12616)

(assert (=> b!429435 (= lt!196264 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!534 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429436 () Bool)

(declare-fun res!252202 () Bool)

(assert (=> b!429436 (=> (not res!252202) (not e!254359))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26281 (_ BitVec 32)) Bool)

(assert (=> b!429436 (= res!252202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429437 () Bool)

(declare-fun res!252198 () Bool)

(assert (=> b!429437 (=> (not res!252198) (not e!254359))))

(declare-datatypes ((List!7464 0))(
  ( (Nil!7461) (Cons!7460 (h!8316 (_ BitVec 64)) (t!12984 List!7464)) )
))
(declare-fun arrayNoDuplicates!0 (array!26281 (_ BitVec 32) List!7464) Bool)

(assert (=> b!429437 (= res!252198 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7461))))

(declare-fun b!429438 () Bool)

(declare-fun e!254361 () Bool)

(declare-fun tp_is_empty!11223 () Bool)

(assert (=> b!429438 (= e!254361 tp_is_empty!11223)))

(declare-fun b!429439 () Bool)

(declare-fun res!252199 () Bool)

(assert (=> b!429439 (=> (not res!252199) (not e!254359))))

(assert (=> b!429439 (= res!252199 (validKeyInArray!0 k0!794))))

(declare-fun b!429440 () Bool)

(declare-fun e!254356 () Bool)

(declare-fun e!254357 () Bool)

(declare-fun mapRes!18456 () Bool)

(assert (=> b!429440 (= e!254356 (and e!254357 mapRes!18456))))

(declare-fun condMapEmpty!18456 () Bool)

(declare-fun mapDefault!18456 () ValueCell!5268)

(assert (=> b!429440 (= condMapEmpty!18456 (= (arr!12591 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5268)) mapDefault!18456)))))

(declare-fun b!429441 () Bool)

(declare-fun e!254358 () Unit!12616)

(declare-fun Unit!12618 () Unit!12616)

(assert (=> b!429441 (= e!254358 Unit!12618)))

(declare-fun b!429442 () Bool)

(declare-fun Unit!12619 () Unit!12616)

(assert (=> b!429442 (= e!254358 Unit!12619)))

(declare-fun lt!196262 () Unit!12616)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26281 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12616)

(assert (=> b!429442 (= lt!196262 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429442 false))

(declare-fun b!429443 () Bool)

(assert (=> b!429443 (= e!254360 true)))

(assert (=> b!429443 (not (= (select (arr!12590 _keys!709) from!863) k0!794))))

(declare-fun lt!196257 () Unit!12616)

(assert (=> b!429443 (= lt!196257 e!254358)))

(declare-fun c!55442 () Bool)

(assert (=> b!429443 (= c!55442 (= (select (arr!12590 _keys!709) from!863) k0!794))))

(declare-fun lt!196256 () ListLongMap!6361)

(declare-fun get!6243 (ValueCell!5268 V!16069) V!16069)

(declare-fun dynLambda!772 (Int (_ BitVec 64)) V!16069)

(assert (=> b!429443 (= lt!196256 (+!1345 lt!196263 (tuple2!7449 (select (arr!12590 _keys!709) from!863) (get!6243 (select (arr!12591 _values!549) from!863) (dynLambda!772 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429444 () Bool)

(declare-fun res!252197 () Bool)

(assert (=> b!429444 (=> (not res!252197) (not e!254359))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429444 (= res!252197 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18456 () Bool)

(declare-fun tp!35742 () Bool)

(assert (=> mapNonEmpty!18456 (= mapRes!18456 (and tp!35742 e!254361))))

(declare-fun mapValue!18456 () ValueCell!5268)

(declare-fun mapKey!18456 () (_ BitVec 32))

(declare-fun mapRest!18456 () (Array (_ BitVec 32) ValueCell!5268))

(assert (=> mapNonEmpty!18456 (= (arr!12591 _values!549) (store mapRest!18456 mapKey!18456 mapValue!18456))))

(declare-fun b!429445 () Bool)

(declare-fun e!254353 () Bool)

(assert (=> b!429445 (= e!254359 e!254353)))

(declare-fun res!252208 () Bool)

(assert (=> b!429445 (=> (not res!252208) (not e!254353))))

(assert (=> b!429445 (= res!252208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196265 mask!1025))))

(assert (=> b!429445 (= lt!196265 (array!26282 (store (arr!12590 _keys!709) i!563 k0!794) (size!12942 _keys!709)))))

(declare-fun res!252200 () Bool)

(assert (=> start!39804 (=> (not res!252200) (not e!254359))))

(assert (=> start!39804 (= res!252200 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12942 _keys!709))))))

(assert (=> start!39804 e!254359))

(assert (=> start!39804 tp_is_empty!11223))

(assert (=> start!39804 tp!35741))

(assert (=> start!39804 true))

(declare-fun array_inv!9172 (array!26283) Bool)

(assert (=> start!39804 (and (array_inv!9172 _values!549) e!254356)))

(declare-fun array_inv!9173 (array!26281) Bool)

(assert (=> start!39804 (array_inv!9173 _keys!709)))

(declare-fun b!429446 () Bool)

(declare-fun res!252207 () Bool)

(assert (=> b!429446 (=> (not res!252207) (not e!254359))))

(assert (=> b!429446 (= res!252207 (or (= (select (arr!12590 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12590 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429447 () Bool)

(declare-fun res!252203 () Bool)

(assert (=> b!429447 (=> (not res!252203) (not e!254359))))

(assert (=> b!429447 (= res!252203 (and (= (size!12943 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12942 _keys!709) (size!12943 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429448 () Bool)

(assert (=> b!429448 (= e!254353 e!254355)))

(declare-fun res!252209 () Bool)

(assert (=> b!429448 (=> (not res!252209) (not e!254355))))

(assert (=> b!429448 (= res!252209 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429448 (= lt!196256 (getCurrentListMapNoExtraKeys!1398 lt!196265 lt!196260 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429448 (= lt!196260 (array!26284 (store (arr!12591 _values!549) i!563 (ValueCellFull!5268 v!412)) (size!12943 _values!549)))))

(declare-fun lt!196259 () ListLongMap!6361)

(assert (=> b!429448 (= lt!196259 (getCurrentListMapNoExtraKeys!1398 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429449 () Bool)

(declare-fun res!252204 () Bool)

(assert (=> b!429449 (=> (not res!252204) (not e!254353))))

(assert (=> b!429449 (= res!252204 (bvsle from!863 i!563))))

(declare-fun b!429450 () Bool)

(declare-fun res!252201 () Bool)

(assert (=> b!429450 (=> (not res!252201) (not e!254353))))

(assert (=> b!429450 (= res!252201 (arrayNoDuplicates!0 lt!196265 #b00000000000000000000000000000000 Nil!7461))))

(declare-fun mapIsEmpty!18456 () Bool)

(assert (=> mapIsEmpty!18456 mapRes!18456))

(declare-fun b!429451 () Bool)

(assert (=> b!429451 (= e!254357 tp_is_empty!11223)))

(assert (= (and start!39804 res!252200) b!429444))

(assert (= (and b!429444 res!252197) b!429447))

(assert (= (and b!429447 res!252203) b!429436))

(assert (= (and b!429436 res!252202) b!429437))

(assert (= (and b!429437 res!252198) b!429434))

(assert (= (and b!429434 res!252205) b!429439))

(assert (= (and b!429439 res!252199) b!429446))

(assert (= (and b!429446 res!252207) b!429433))

(assert (= (and b!429433 res!252206) b!429445))

(assert (= (and b!429445 res!252208) b!429450))

(assert (= (and b!429450 res!252201) b!429449))

(assert (= (and b!429449 res!252204) b!429448))

(assert (= (and b!429448 res!252209) b!429435))

(assert (= (and b!429435 (not res!252210)) b!429443))

(assert (= (and b!429443 c!55442) b!429442))

(assert (= (and b!429443 (not c!55442)) b!429441))

(assert (= (and b!429440 condMapEmpty!18456) mapIsEmpty!18456))

(assert (= (and b!429440 (not condMapEmpty!18456)) mapNonEmpty!18456))

(get-info :version)

(assert (= (and mapNonEmpty!18456 ((_ is ValueCellFull!5268) mapValue!18456)) b!429438))

(assert (= (and b!429440 ((_ is ValueCellFull!5268) mapDefault!18456)) b!429451))

(assert (= start!39804 b!429440))

(declare-fun b_lambda!9159 () Bool)

(assert (=> (not b_lambda!9159) (not b!429443)))

(declare-fun t!12982 () Bool)

(declare-fun tb!3477 () Bool)

(assert (=> (and start!39804 (= defaultEntry!557 defaultEntry!557) t!12982) tb!3477))

(declare-fun result!6481 () Bool)

(assert (=> tb!3477 (= result!6481 tp_is_empty!11223)))

(assert (=> b!429443 t!12982))

(declare-fun b_and!17803 () Bool)

(assert (= b_and!17801 (and (=> t!12982 result!6481) b_and!17803)))

(declare-fun m!417745 () Bool)

(assert (=> b!429448 m!417745))

(declare-fun m!417747 () Bool)

(assert (=> b!429448 m!417747))

(declare-fun m!417749 () Bool)

(assert (=> b!429448 m!417749))

(declare-fun m!417751 () Bool)

(assert (=> b!429444 m!417751))

(declare-fun m!417753 () Bool)

(assert (=> start!39804 m!417753))

(declare-fun m!417755 () Bool)

(assert (=> start!39804 m!417755))

(declare-fun m!417757 () Bool)

(assert (=> b!429439 m!417757))

(declare-fun m!417759 () Bool)

(assert (=> b!429437 m!417759))

(declare-fun m!417761 () Bool)

(assert (=> b!429442 m!417761))

(declare-fun m!417763 () Bool)

(assert (=> mapNonEmpty!18456 m!417763))

(declare-fun m!417765 () Bool)

(assert (=> b!429436 m!417765))

(declare-fun m!417767 () Bool)

(assert (=> b!429433 m!417767))

(declare-fun m!417769 () Bool)

(assert (=> b!429446 m!417769))

(declare-fun m!417771 () Bool)

(assert (=> b!429443 m!417771))

(declare-fun m!417773 () Bool)

(assert (=> b!429443 m!417773))

(declare-fun m!417775 () Bool)

(assert (=> b!429443 m!417775))

(declare-fun m!417777 () Bool)

(assert (=> b!429443 m!417777))

(assert (=> b!429443 m!417775))

(assert (=> b!429443 m!417773))

(declare-fun m!417779 () Bool)

(assert (=> b!429443 m!417779))

(assert (=> b!429435 m!417771))

(declare-fun m!417781 () Bool)

(assert (=> b!429435 m!417781))

(declare-fun m!417783 () Bool)

(assert (=> b!429435 m!417783))

(declare-fun m!417785 () Bool)

(assert (=> b!429435 m!417785))

(assert (=> b!429435 m!417771))

(declare-fun m!417787 () Bool)

(assert (=> b!429435 m!417787))

(declare-fun m!417789 () Bool)

(assert (=> b!429435 m!417789))

(declare-fun m!417791 () Bool)

(assert (=> b!429450 m!417791))

(declare-fun m!417793 () Bool)

(assert (=> b!429445 m!417793))

(declare-fun m!417795 () Bool)

(assert (=> b!429445 m!417795))

(check-sat (not b_lambda!9159) (not b!429445) (not b!429443) (not b_next!10071) (not b!429439) (not b!429433) (not b!429450) (not start!39804) (not mapNonEmpty!18456) (not b!429444) (not b!429448) (not b!429436) (not b!429435) b_and!17803 (not b!429442) (not b!429437) tp_is_empty!11223)
(check-sat b_and!17803 (not b_next!10071))
