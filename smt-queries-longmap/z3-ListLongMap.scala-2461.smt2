; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38570 () Bool)

(assert start!38570)

(declare-fun b_free!9121 () Bool)

(declare-fun b_next!9121 () Bool)

(assert (=> start!38570 (= b_free!9121 (not b_next!9121))))

(declare-fun tp!32487 () Bool)

(declare-fun b_and!16481 () Bool)

(assert (=> start!38570 (= tp!32487 b_and!16481)))

(declare-fun b!399273 () Bool)

(declare-fun e!241099 () Bool)

(declare-fun e!241101 () Bool)

(declare-fun mapRes!16626 () Bool)

(assert (=> b!399273 (= e!241099 (and e!241101 mapRes!16626))))

(declare-fun condMapEmpty!16626 () Bool)

(declare-datatypes ((V!14443 0))(
  ( (V!14444 (val!5046 Int)) )
))
(declare-datatypes ((ValueCell!4658 0))(
  ( (ValueCellFull!4658 (v!7287 V!14443)) (EmptyCell!4658) )
))
(declare-datatypes ((array!23895 0))(
  ( (array!23896 (arr!11397 (Array (_ BitVec 32) ValueCell!4658)) (size!11750 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23895)

(declare-fun mapDefault!16626 () ValueCell!4658)

(assert (=> b!399273 (= condMapEmpty!16626 (= (arr!11397 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4658)) mapDefault!16626)))))

(declare-fun res!229629 () Bool)

(declare-fun e!241102 () Bool)

(assert (=> start!38570 (=> (not res!229629) (not e!241102))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23897 0))(
  ( (array!23898 (arr!11398 (Array (_ BitVec 32) (_ BitVec 64))) (size!11751 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23897)

(assert (=> start!38570 (= res!229629 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11751 _keys!709))))))

(assert (=> start!38570 e!241102))

(declare-fun tp_is_empty!10003 () Bool)

(assert (=> start!38570 tp_is_empty!10003))

(assert (=> start!38570 tp!32487))

(assert (=> start!38570 true))

(declare-fun array_inv!8366 (array!23895) Bool)

(assert (=> start!38570 (and (array_inv!8366 _values!549) e!241099)))

(declare-fun array_inv!8367 (array!23897) Bool)

(assert (=> start!38570 (array_inv!8367 _keys!709)))

(declare-fun b!399274 () Bool)

(declare-fun e!241098 () Bool)

(assert (=> b!399274 (= e!241102 e!241098)))

(declare-fun res!229623 () Bool)

(assert (=> b!399274 (=> (not res!229623) (not e!241098))))

(declare-fun lt!187355 () array!23897)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23897 (_ BitVec 32)) Bool)

(assert (=> b!399274 (= res!229623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187355 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399274 (= lt!187355 (array!23898 (store (arr!11398 _keys!709) i!563 k0!794) (size!11751 _keys!709)))))

(declare-fun b!399275 () Bool)

(assert (=> b!399275 (= e!241098 (not true))))

(declare-fun e!241100 () Bool)

(assert (=> b!399275 e!241100))

(declare-fun c!54567 () Bool)

(assert (=> b!399275 (= c!54567 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14443)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12082 0))(
  ( (Unit!12083) )
))
(declare-fun lt!187354 () Unit!12082)

(declare-fun zeroValue!515 () V!14443)

(declare-fun v!412 () V!14443)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!304 (array!23897 array!23895 (_ BitVec 32) (_ BitVec 32) V!14443 V!14443 (_ BitVec 32) (_ BitVec 64) V!14443 (_ BitVec 32) Int) Unit!12082)

(assert (=> b!399275 (= lt!187354 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!304 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399276 () Bool)

(declare-fun res!229626 () Bool)

(assert (=> b!399276 (=> (not res!229626) (not e!241102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399276 (= res!229626 (validKeyInArray!0 k0!794))))

(declare-fun b!399277 () Bool)

(declare-fun res!229632 () Bool)

(assert (=> b!399277 (=> (not res!229632) (not e!241102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399277 (= res!229632 (validMask!0 mask!1025))))

(declare-fun b!399278 () Bool)

(declare-fun res!229630 () Bool)

(assert (=> b!399278 (=> (not res!229630) (not e!241102))))

(assert (=> b!399278 (= res!229630 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11751 _keys!709))))))

(declare-fun b!399279 () Bool)

(declare-fun res!229628 () Bool)

(assert (=> b!399279 (=> (not res!229628) (not e!241098))))

(declare-datatypes ((List!6564 0))(
  ( (Nil!6561) (Cons!6560 (h!7416 (_ BitVec 64)) (t!11729 List!6564)) )
))
(declare-fun arrayNoDuplicates!0 (array!23897 (_ BitVec 32) List!6564) Bool)

(assert (=> b!399279 (= res!229628 (arrayNoDuplicates!0 lt!187355 #b00000000000000000000000000000000 Nil!6561))))

(declare-fun b!399280 () Bool)

(declare-fun res!229621 () Bool)

(assert (=> b!399280 (=> (not res!229621) (not e!241102))))

(declare-fun arrayContainsKey!0 (array!23897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399280 (= res!229621 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399281 () Bool)

(assert (=> b!399281 (= e!241101 tp_is_empty!10003)))

(declare-fun b!399282 () Bool)

(declare-fun res!229624 () Bool)

(assert (=> b!399282 (=> (not res!229624) (not e!241102))))

(assert (=> b!399282 (= res!229624 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6561))))

(declare-fun mapIsEmpty!16626 () Bool)

(assert (=> mapIsEmpty!16626 mapRes!16626))

(declare-fun b!399283 () Bool)

(declare-fun e!241104 () Bool)

(assert (=> b!399283 (= e!241104 tp_is_empty!10003)))

(declare-fun b!399284 () Bool)

(declare-fun res!229627 () Bool)

(assert (=> b!399284 (=> (not res!229627) (not e!241102))))

(assert (=> b!399284 (= res!229627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399285 () Bool)

(declare-fun res!229631 () Bool)

(assert (=> b!399285 (=> (not res!229631) (not e!241102))))

(assert (=> b!399285 (= res!229631 (or (= (select (arr!11398 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11398 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6654 0))(
  ( (tuple2!6655 (_1!3338 (_ BitVec 64)) (_2!3338 V!14443)) )
))
(declare-datatypes ((List!6565 0))(
  ( (Nil!6562) (Cons!6561 (h!7417 tuple2!6654) (t!11730 List!6565)) )
))
(declare-datatypes ((ListLongMap!5557 0))(
  ( (ListLongMap!5558 (toList!2794 List!6565)) )
))
(declare-fun call!28002 () ListLongMap!5557)

(declare-fun bm!27999 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1014 (array!23897 array!23895 (_ BitVec 32) (_ BitVec 32) V!14443 V!14443 (_ BitVec 32) Int) ListLongMap!5557)

(assert (=> bm!27999 (= call!28002 (getCurrentListMapNoExtraKeys!1014 (ite c!54567 lt!187355 _keys!709) (ite c!54567 (array!23896 (store (arr!11397 _values!549) i!563 (ValueCellFull!4658 v!412)) (size!11750 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28003 () ListLongMap!5557)

(declare-fun b!399286 () Bool)

(declare-fun +!1110 (ListLongMap!5557 tuple2!6654) ListLongMap!5557)

(assert (=> b!399286 (= e!241100 (= call!28002 (+!1110 call!28003 (tuple2!6655 k0!794 v!412))))))

(declare-fun bm!28000 () Bool)

(assert (=> bm!28000 (= call!28003 (getCurrentListMapNoExtraKeys!1014 (ite c!54567 _keys!709 lt!187355) (ite c!54567 _values!549 (array!23896 (store (arr!11397 _values!549) i!563 (ValueCellFull!4658 v!412)) (size!11750 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399287 () Bool)

(declare-fun res!229622 () Bool)

(assert (=> b!399287 (=> (not res!229622) (not e!241102))))

(assert (=> b!399287 (= res!229622 (and (= (size!11750 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11751 _keys!709) (size!11750 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16626 () Bool)

(declare-fun tp!32486 () Bool)

(assert (=> mapNonEmpty!16626 (= mapRes!16626 (and tp!32486 e!241104))))

(declare-fun mapRest!16626 () (Array (_ BitVec 32) ValueCell!4658))

(declare-fun mapKey!16626 () (_ BitVec 32))

(declare-fun mapValue!16626 () ValueCell!4658)

(assert (=> mapNonEmpty!16626 (= (arr!11397 _values!549) (store mapRest!16626 mapKey!16626 mapValue!16626))))

(declare-fun b!399288 () Bool)

(assert (=> b!399288 (= e!241100 (= call!28003 call!28002))))

(declare-fun b!399289 () Bool)

(declare-fun res!229625 () Bool)

(assert (=> b!399289 (=> (not res!229625) (not e!241098))))

(assert (=> b!399289 (= res!229625 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11751 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(assert (= (and start!38570 res!229629) b!399277))

(assert (= (and b!399277 res!229632) b!399287))

(assert (= (and b!399287 res!229622) b!399284))

(assert (= (and b!399284 res!229627) b!399282))

(assert (= (and b!399282 res!229624) b!399278))

(assert (= (and b!399278 res!229630) b!399276))

(assert (= (and b!399276 res!229626) b!399285))

(assert (= (and b!399285 res!229631) b!399280))

(assert (= (and b!399280 res!229621) b!399274))

(assert (= (and b!399274 res!229623) b!399279))

(assert (= (and b!399279 res!229628) b!399289))

(assert (= (and b!399289 res!229625) b!399275))

(assert (= (and b!399275 c!54567) b!399286))

(assert (= (and b!399275 (not c!54567)) b!399288))

(assert (= (or b!399286 b!399288) bm!27999))

(assert (= (or b!399286 b!399288) bm!28000))

(assert (= (and b!399273 condMapEmpty!16626) mapIsEmpty!16626))

(assert (= (and b!399273 (not condMapEmpty!16626)) mapNonEmpty!16626))

(get-info :version)

(assert (= (and mapNonEmpty!16626 ((_ is ValueCellFull!4658) mapValue!16626)) b!399283))

(assert (= (and b!399273 ((_ is ValueCellFull!4658) mapDefault!16626)) b!399281))

(assert (= start!38570 b!399273))

(declare-fun m!393309 () Bool)

(assert (=> b!399284 m!393309))

(declare-fun m!393311 () Bool)

(assert (=> b!399276 m!393311))

(declare-fun m!393313 () Bool)

(assert (=> b!399279 m!393313))

(declare-fun m!393315 () Bool)

(assert (=> bm!27999 m!393315))

(declare-fun m!393317 () Bool)

(assert (=> bm!27999 m!393317))

(declare-fun m!393319 () Bool)

(assert (=> b!399285 m!393319))

(declare-fun m!393321 () Bool)

(assert (=> b!399275 m!393321))

(declare-fun m!393323 () Bool)

(assert (=> start!38570 m!393323))

(declare-fun m!393325 () Bool)

(assert (=> start!38570 m!393325))

(assert (=> bm!28000 m!393315))

(declare-fun m!393327 () Bool)

(assert (=> bm!28000 m!393327))

(declare-fun m!393329 () Bool)

(assert (=> mapNonEmpty!16626 m!393329))

(declare-fun m!393331 () Bool)

(assert (=> b!399282 m!393331))

(declare-fun m!393333 () Bool)

(assert (=> b!399277 m!393333))

(declare-fun m!393335 () Bool)

(assert (=> b!399286 m!393335))

(declare-fun m!393337 () Bool)

(assert (=> b!399274 m!393337))

(declare-fun m!393339 () Bool)

(assert (=> b!399274 m!393339))

(declare-fun m!393341 () Bool)

(assert (=> b!399280 m!393341))

(check-sat (not b!399276) (not b_next!9121) (not b!399279) (not bm!27999) (not b!399275) (not b!399282) tp_is_empty!10003 b_and!16481 (not b!399274) (not b!399277) (not mapNonEmpty!16626) (not b!399286) (not b!399284) (not b!399280) (not start!38570) (not bm!28000))
(check-sat b_and!16481 (not b_next!9121))
