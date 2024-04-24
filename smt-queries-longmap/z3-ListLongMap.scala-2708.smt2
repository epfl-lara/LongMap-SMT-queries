; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40052 () Bool)

(assert start!40052)

(declare-fun b_free!10333 () Bool)

(declare-fun b_next!10333 () Bool)

(assert (=> start!40052 (= b_free!10333 (not b_next!10333))))

(declare-fun tp!36527 () Bool)

(declare-fun b_and!18315 () Bool)

(assert (=> start!40052 (= tp!36527 b_and!18315)))

(declare-fun b!437299 () Bool)

(declare-fun res!257989 () Bool)

(declare-fun e!258109 () Bool)

(assert (=> b!437299 (=> (not res!257989) (not e!258109))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437299 (= res!257989 (bvsle from!863 i!563))))

(declare-fun b!437300 () Bool)

(declare-fun res!257986 () Bool)

(declare-fun e!258112 () Bool)

(assert (=> b!437300 (=> (not res!257986) (not e!258112))))

(declare-datatypes ((array!26796 0))(
  ( (array!26797 (arr!12847 (Array (_ BitVec 32) (_ BitVec 64))) (size!13199 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26796)

(declare-datatypes ((List!7564 0))(
  ( (Nil!7561) (Cons!7560 (h!8416 (_ BitVec 64)) (t!13312 List!7564)) )
))
(declare-fun arrayNoDuplicates!0 (array!26796 (_ BitVec 32) List!7564) Bool)

(assert (=> b!437300 (= res!257986 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7561))))

(declare-fun mapNonEmpty!18849 () Bool)

(declare-fun mapRes!18849 () Bool)

(declare-fun tp!36528 () Bool)

(declare-fun e!258110 () Bool)

(assert (=> mapNonEmpty!18849 (= mapRes!18849 (and tp!36528 e!258110))))

(declare-datatypes ((V!16419 0))(
  ( (V!16420 (val!5787 Int)) )
))
(declare-datatypes ((ValueCell!5399 0))(
  ( (ValueCellFull!5399 (v!8035 V!16419)) (EmptyCell!5399) )
))
(declare-fun mapRest!18849 () (Array (_ BitVec 32) ValueCell!5399))

(declare-fun mapKey!18849 () (_ BitVec 32))

(declare-datatypes ((array!26798 0))(
  ( (array!26799 (arr!12848 (Array (_ BitVec 32) ValueCell!5399)) (size!13200 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26798)

(declare-fun mapValue!18849 () ValueCell!5399)

(assert (=> mapNonEmpty!18849 (= (arr!12848 _values!549) (store mapRest!18849 mapKey!18849 mapValue!18849))))

(declare-fun b!437301 () Bool)

(declare-fun res!257991 () Bool)

(assert (=> b!437301 (=> (not res!257991) (not e!258112))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437301 (= res!257991 (validKeyInArray!0 k0!794))))

(declare-fun b!437302 () Bool)

(declare-fun res!257992 () Bool)

(assert (=> b!437302 (=> (not res!257992) (not e!258109))))

(declare-fun lt!201638 () array!26796)

(assert (=> b!437302 (= res!257992 (arrayNoDuplicates!0 lt!201638 #b00000000000000000000000000000000 Nil!7561))))

(declare-fun res!257993 () Bool)

(assert (=> start!40052 (=> (not res!257993) (not e!258112))))

(assert (=> start!40052 (= res!257993 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13199 _keys!709))))))

(assert (=> start!40052 e!258112))

(declare-fun tp_is_empty!11485 () Bool)

(assert (=> start!40052 tp_is_empty!11485))

(assert (=> start!40052 tp!36527))

(assert (=> start!40052 true))

(declare-fun e!258106 () Bool)

(declare-fun array_inv!9398 (array!26798) Bool)

(assert (=> start!40052 (and (array_inv!9398 _values!549) e!258106)))

(declare-fun array_inv!9399 (array!26796) Bool)

(assert (=> start!40052 (array_inv!9399 _keys!709)))

(declare-fun b!437303 () Bool)

(declare-fun res!257994 () Bool)

(assert (=> b!437303 (=> (not res!257994) (not e!258112))))

(declare-fun arrayContainsKey!0 (array!26796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437303 (= res!257994 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437304 () Bool)

(declare-fun res!257984 () Bool)

(assert (=> b!437304 (=> (not res!257984) (not e!258112))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437304 (= res!257984 (validMask!0 mask!1025))))

(declare-fun b!437305 () Bool)

(assert (=> b!437305 (= e!258110 tp_is_empty!11485)))

(declare-fun b!437306 () Bool)

(declare-fun e!258108 () Bool)

(assert (=> b!437306 (= e!258108 tp_is_empty!11485)))

(declare-fun b!437307 () Bool)

(declare-fun e!258111 () Bool)

(assert (=> b!437307 (= e!258109 e!258111)))

(declare-fun res!257982 () Bool)

(assert (=> b!437307 (=> (not res!257982) (not e!258111))))

(assert (=> b!437307 (= res!257982 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201635 () array!26798)

(declare-fun zeroValue!515 () V!16419)

(declare-datatypes ((tuple2!7576 0))(
  ( (tuple2!7577 (_1!3799 (_ BitVec 64)) (_2!3799 V!16419)) )
))
(declare-datatypes ((List!7565 0))(
  ( (Nil!7562) (Cons!7561 (h!8417 tuple2!7576) (t!13313 List!7565)) )
))
(declare-datatypes ((ListLongMap!6491 0))(
  ( (ListLongMap!6492 (toList!3261 List!7565)) )
))
(declare-fun lt!201639 () ListLongMap!6491)

(declare-fun getCurrentListMapNoExtraKeys!1494 (array!26796 array!26798 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) Int) ListLongMap!6491)

(assert (=> b!437307 (= lt!201639 (getCurrentListMapNoExtraKeys!1494 lt!201638 lt!201635 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16419)

(assert (=> b!437307 (= lt!201635 (array!26799 (store (arr!12848 _values!549) i!563 (ValueCellFull!5399 v!412)) (size!13200 _values!549)))))

(declare-fun lt!201636 () ListLongMap!6491)

(assert (=> b!437307 (= lt!201636 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!437308 () Bool)

(declare-fun res!257988 () Bool)

(assert (=> b!437308 (=> (not res!257988) (not e!258112))))

(assert (=> b!437308 (= res!257988 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13199 _keys!709))))))

(declare-fun b!437309 () Bool)

(declare-fun res!257987 () Bool)

(assert (=> b!437309 (=> (not res!257987) (not e!258112))))

(assert (=> b!437309 (= res!257987 (and (= (size!13200 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13199 _keys!709) (size!13200 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18849 () Bool)

(assert (=> mapIsEmpty!18849 mapRes!18849))

(declare-fun b!437310 () Bool)

(declare-fun res!257983 () Bool)

(assert (=> b!437310 (=> (not res!257983) (not e!258112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26796 (_ BitVec 32)) Bool)

(assert (=> b!437310 (= res!257983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437311 () Bool)

(assert (=> b!437311 (= e!258112 e!258109)))

(declare-fun res!257990 () Bool)

(assert (=> b!437311 (=> (not res!257990) (not e!258109))))

(assert (=> b!437311 (= res!257990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201638 mask!1025))))

(assert (=> b!437311 (= lt!201638 (array!26797 (store (arr!12847 _keys!709) i!563 k0!794) (size!13199 _keys!709)))))

(declare-fun b!437312 () Bool)

(assert (=> b!437312 (= e!258111 (not true))))

(declare-fun +!1461 (ListLongMap!6491 tuple2!7576) ListLongMap!6491)

(assert (=> b!437312 (= (getCurrentListMapNoExtraKeys!1494 lt!201638 lt!201635 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1461 (getCurrentListMapNoExtraKeys!1494 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7577 k0!794 v!412)))))

(declare-datatypes ((Unit!12997 0))(
  ( (Unit!12998) )
))
(declare-fun lt!201637 () Unit!12997)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 (array!26796 array!26798 (_ BitVec 32) (_ BitVec 32) V!16419 V!16419 (_ BitVec 32) (_ BitVec 64) V!16419 (_ BitVec 32) Int) Unit!12997)

(assert (=> b!437312 (= lt!201637 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!621 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437313 () Bool)

(assert (=> b!437313 (= e!258106 (and e!258108 mapRes!18849))))

(declare-fun condMapEmpty!18849 () Bool)

(declare-fun mapDefault!18849 () ValueCell!5399)

(assert (=> b!437313 (= condMapEmpty!18849 (= (arr!12848 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5399)) mapDefault!18849)))))

(declare-fun b!437314 () Bool)

(declare-fun res!257985 () Bool)

(assert (=> b!437314 (=> (not res!257985) (not e!258112))))

(assert (=> b!437314 (= res!257985 (or (= (select (arr!12847 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12847 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40052 res!257993) b!437304))

(assert (= (and b!437304 res!257984) b!437309))

(assert (= (and b!437309 res!257987) b!437310))

(assert (= (and b!437310 res!257983) b!437300))

(assert (= (and b!437300 res!257986) b!437308))

(assert (= (and b!437308 res!257988) b!437301))

(assert (= (and b!437301 res!257991) b!437314))

(assert (= (and b!437314 res!257985) b!437303))

(assert (= (and b!437303 res!257994) b!437311))

(assert (= (and b!437311 res!257990) b!437302))

(assert (= (and b!437302 res!257992) b!437299))

(assert (= (and b!437299 res!257989) b!437307))

(assert (= (and b!437307 res!257982) b!437312))

(assert (= (and b!437313 condMapEmpty!18849) mapIsEmpty!18849))

(assert (= (and b!437313 (not condMapEmpty!18849)) mapNonEmpty!18849))

(get-info :version)

(assert (= (and mapNonEmpty!18849 ((_ is ValueCellFull!5399) mapValue!18849)) b!437305))

(assert (= (and b!437313 ((_ is ValueCellFull!5399) mapDefault!18849)) b!437306))

(assert (= start!40052 b!437313))

(declare-fun m!425255 () Bool)

(assert (=> b!437300 m!425255))

(declare-fun m!425257 () Bool)

(assert (=> b!437311 m!425257))

(declare-fun m!425259 () Bool)

(assert (=> b!437311 m!425259))

(declare-fun m!425261 () Bool)

(assert (=> b!437312 m!425261))

(declare-fun m!425263 () Bool)

(assert (=> b!437312 m!425263))

(assert (=> b!437312 m!425263))

(declare-fun m!425265 () Bool)

(assert (=> b!437312 m!425265))

(declare-fun m!425267 () Bool)

(assert (=> b!437312 m!425267))

(declare-fun m!425269 () Bool)

(assert (=> b!437314 m!425269))

(declare-fun m!425271 () Bool)

(assert (=> start!40052 m!425271))

(declare-fun m!425273 () Bool)

(assert (=> start!40052 m!425273))

(declare-fun m!425275 () Bool)

(assert (=> b!437304 m!425275))

(declare-fun m!425277 () Bool)

(assert (=> b!437307 m!425277))

(declare-fun m!425279 () Bool)

(assert (=> b!437307 m!425279))

(declare-fun m!425281 () Bool)

(assert (=> b!437307 m!425281))

(declare-fun m!425283 () Bool)

(assert (=> b!437301 m!425283))

(declare-fun m!425285 () Bool)

(assert (=> b!437302 m!425285))

(declare-fun m!425287 () Bool)

(assert (=> mapNonEmpty!18849 m!425287))

(declare-fun m!425289 () Bool)

(assert (=> b!437303 m!425289))

(declare-fun m!425291 () Bool)

(assert (=> b!437310 m!425291))

(check-sat (not b!437307) (not start!40052) (not b!437310) (not b!437303) (not b!437302) (not b!437304) b_and!18315 (not b!437301) (not b!437312) (not b!437311) (not b!437300) (not mapNonEmpty!18849) tp_is_empty!11485 (not b_next!10333))
(check-sat b_and!18315 (not b_next!10333))
