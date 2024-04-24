; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38570 () Bool)

(assert start!38570)

(declare-fun b_free!9121 () Bool)

(declare-fun b_next!9121 () Bool)

(assert (=> start!38570 (= b_free!9121 (not b_next!9121))))

(declare-fun tp!32486 () Bool)

(declare-fun b_and!16521 () Bool)

(assert (=> start!38570 (= tp!32486 b_and!16521)))

(declare-fun b!399495 () Bool)

(declare-fun res!229758 () Bool)

(declare-fun e!241244 () Bool)

(assert (=> b!399495 (=> (not res!229758) (not e!241244))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23896 0))(
  ( (array!23897 (arr!11397 (Array (_ BitVec 32) (_ BitVec 64))) (size!11749 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23896)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!399495 (= res!229758 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11749 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399496 () Bool)

(declare-fun res!229756 () Bool)

(declare-fun e!241246 () Bool)

(assert (=> b!399496 (=> (not res!229756) (not e!241246))))

(declare-datatypes ((List!6468 0))(
  ( (Nil!6465) (Cons!6464 (h!7320 (_ BitVec 64)) (t!11634 List!6468)) )
))
(declare-fun arrayNoDuplicates!0 (array!23896 (_ BitVec 32) List!6468) Bool)

(assert (=> b!399496 (= res!229756 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6465))))

(declare-fun mapNonEmpty!16626 () Bool)

(declare-fun mapRes!16626 () Bool)

(declare-fun tp!32487 () Bool)

(declare-fun e!241245 () Bool)

(assert (=> mapNonEmpty!16626 (= mapRes!16626 (and tp!32487 e!241245))))

(declare-fun mapKey!16626 () (_ BitVec 32))

(declare-datatypes ((V!14443 0))(
  ( (V!14444 (val!5046 Int)) )
))
(declare-datatypes ((ValueCell!4658 0))(
  ( (ValueCellFull!4658 (v!7294 V!14443)) (EmptyCell!4658) )
))
(declare-fun mapRest!16626 () (Array (_ BitVec 32) ValueCell!4658))

(declare-datatypes ((array!23898 0))(
  ( (array!23899 (arr!11398 (Array (_ BitVec 32) ValueCell!4658)) (size!11750 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23898)

(declare-fun mapValue!16626 () ValueCell!4658)

(assert (=> mapNonEmpty!16626 (= (arr!11398 _values!549) (store mapRest!16626 mapKey!16626 mapValue!16626))))

(declare-fun b!399497 () Bool)

(declare-fun res!229750 () Bool)

(assert (=> b!399497 (=> (not res!229750) (not e!241246))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!399497 (= res!229750 (and (= (size!11750 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11749 _keys!709) (size!11750 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!14443)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6548 0))(
  ( (tuple2!6549 (_1!3285 (_ BitVec 64)) (_2!3285 V!14443)) )
))
(declare-datatypes ((List!6469 0))(
  ( (Nil!6466) (Cons!6465 (h!7321 tuple2!6548) (t!11635 List!6469)) )
))
(declare-datatypes ((ListLongMap!5463 0))(
  ( (ListLongMap!5464 (toList!2747 List!6469)) )
))
(declare-fun call!28015 () ListLongMap!5463)

(declare-fun lt!187607 () array!23896)

(declare-fun zeroValue!515 () V!14443)

(declare-fun c!54615 () Bool)

(declare-fun bm!28012 () Bool)

(declare-fun v!412 () V!14443)

(declare-fun getCurrentListMapNoExtraKeys!1005 (array!23896 array!23898 (_ BitVec 32) (_ BitVec 32) V!14443 V!14443 (_ BitVec 32) Int) ListLongMap!5463)

(assert (=> bm!28012 (= call!28015 (getCurrentListMapNoExtraKeys!1005 (ite c!54615 _keys!709 lt!187607) (ite c!54615 _values!549 (array!23899 (store (arr!11398 _values!549) i!563 (ValueCellFull!4658 v!412)) (size!11750 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399498 () Bool)

(declare-fun e!241242 () Bool)

(declare-fun tp_is_empty!10003 () Bool)

(assert (=> b!399498 (= e!241242 tp_is_empty!10003)))

(declare-fun b!399499 () Bool)

(declare-fun res!229754 () Bool)

(assert (=> b!399499 (=> (not res!229754) (not e!241246))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399499 (= res!229754 (validKeyInArray!0 k0!794))))

(declare-fun b!399500 () Bool)

(assert (=> b!399500 (= e!241245 tp_is_empty!10003)))

(declare-fun b!399501 () Bool)

(declare-fun res!229747 () Bool)

(assert (=> b!399501 (=> (not res!229747) (not e!241246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23896 (_ BitVec 32)) Bool)

(assert (=> b!399501 (= res!229747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399502 () Bool)

(assert (=> b!399502 (= e!241244 (not true))))

(declare-fun e!241243 () Bool)

(assert (=> b!399502 e!241243))

(assert (=> b!399502 (= c!54615 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12079 0))(
  ( (Unit!12080) )
))
(declare-fun lt!187608 () Unit!12079)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 (array!23896 array!23898 (_ BitVec 32) (_ BitVec 32) V!14443 V!14443 (_ BitVec 32) (_ BitVec 64) V!14443 (_ BitVec 32) Int) Unit!12079)

(assert (=> b!399502 (= lt!187608 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!307 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28011 () Bool)

(declare-fun call!28014 () ListLongMap!5463)

(assert (=> bm!28011 (= call!28014 (getCurrentListMapNoExtraKeys!1005 (ite c!54615 lt!187607 _keys!709) (ite c!54615 (array!23899 (store (arr!11398 _values!549) i!563 (ValueCellFull!4658 v!412)) (size!11750 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!229748 () Bool)

(assert (=> start!38570 (=> (not res!229748) (not e!241246))))

(assert (=> start!38570 (= res!229748 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11749 _keys!709))))))

(assert (=> start!38570 e!241246))

(assert (=> start!38570 tp_is_empty!10003))

(assert (=> start!38570 tp!32486))

(assert (=> start!38570 true))

(declare-fun e!241240 () Bool)

(declare-fun array_inv!8418 (array!23898) Bool)

(assert (=> start!38570 (and (array_inv!8418 _values!549) e!241240)))

(declare-fun array_inv!8419 (array!23896) Bool)

(assert (=> start!38570 (array_inv!8419 _keys!709)))

(declare-fun b!399503 () Bool)

(declare-fun res!229752 () Bool)

(assert (=> b!399503 (=> (not res!229752) (not e!241246))))

(assert (=> b!399503 (= res!229752 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11749 _keys!709))))))

(declare-fun mapIsEmpty!16626 () Bool)

(assert (=> mapIsEmpty!16626 mapRes!16626))

(declare-fun b!399504 () Bool)

(declare-fun res!229751 () Bool)

(assert (=> b!399504 (=> (not res!229751) (not e!241246))))

(assert (=> b!399504 (= res!229751 (or (= (select (arr!11397 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11397 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399505 () Bool)

(declare-fun res!229749 () Bool)

(assert (=> b!399505 (=> (not res!229749) (not e!241246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399505 (= res!229749 (validMask!0 mask!1025))))

(declare-fun b!399506 () Bool)

(assert (=> b!399506 (= e!241243 (= call!28015 call!28014))))

(declare-fun b!399507 () Bool)

(declare-fun res!229753 () Bool)

(assert (=> b!399507 (=> (not res!229753) (not e!241244))))

(assert (=> b!399507 (= res!229753 (arrayNoDuplicates!0 lt!187607 #b00000000000000000000000000000000 Nil!6465))))

(declare-fun b!399508 () Bool)

(assert (=> b!399508 (= e!241246 e!241244)))

(declare-fun res!229757 () Bool)

(assert (=> b!399508 (=> (not res!229757) (not e!241244))))

(assert (=> b!399508 (= res!229757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187607 mask!1025))))

(assert (=> b!399508 (= lt!187607 (array!23897 (store (arr!11397 _keys!709) i!563 k0!794) (size!11749 _keys!709)))))

(declare-fun b!399509 () Bool)

(declare-fun res!229755 () Bool)

(assert (=> b!399509 (=> (not res!229755) (not e!241246))))

(declare-fun arrayContainsKey!0 (array!23896 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399509 (= res!229755 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399510 () Bool)

(assert (=> b!399510 (= e!241240 (and e!241242 mapRes!16626))))

(declare-fun condMapEmpty!16626 () Bool)

(declare-fun mapDefault!16626 () ValueCell!4658)

(assert (=> b!399510 (= condMapEmpty!16626 (= (arr!11398 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4658)) mapDefault!16626)))))

(declare-fun b!399511 () Bool)

(declare-fun +!1095 (ListLongMap!5463 tuple2!6548) ListLongMap!5463)

(assert (=> b!399511 (= e!241243 (= call!28014 (+!1095 call!28015 (tuple2!6549 k0!794 v!412))))))

(assert (= (and start!38570 res!229748) b!399505))

(assert (= (and b!399505 res!229749) b!399497))

(assert (= (and b!399497 res!229750) b!399501))

(assert (= (and b!399501 res!229747) b!399496))

(assert (= (and b!399496 res!229756) b!399503))

(assert (= (and b!399503 res!229752) b!399499))

(assert (= (and b!399499 res!229754) b!399504))

(assert (= (and b!399504 res!229751) b!399509))

(assert (= (and b!399509 res!229755) b!399508))

(assert (= (and b!399508 res!229757) b!399507))

(assert (= (and b!399507 res!229753) b!399495))

(assert (= (and b!399495 res!229758) b!399502))

(assert (= (and b!399502 c!54615) b!399511))

(assert (= (and b!399502 (not c!54615)) b!399506))

(assert (= (or b!399511 b!399506) bm!28011))

(assert (= (or b!399511 b!399506) bm!28012))

(assert (= (and b!399510 condMapEmpty!16626) mapIsEmpty!16626))

(assert (= (and b!399510 (not condMapEmpty!16626)) mapNonEmpty!16626))

(get-info :version)

(assert (= (and mapNonEmpty!16626 ((_ is ValueCellFull!4658) mapValue!16626)) b!399500))

(assert (= (and b!399510 ((_ is ValueCellFull!4658) mapDefault!16626)) b!399498))

(assert (= start!38570 b!399510))

(declare-fun m!394263 () Bool)

(assert (=> b!399502 m!394263))

(declare-fun m!394265 () Bool)

(assert (=> b!399507 m!394265))

(declare-fun m!394267 () Bool)

(assert (=> b!399501 m!394267))

(declare-fun m!394269 () Bool)

(assert (=> b!399499 m!394269))

(declare-fun m!394271 () Bool)

(assert (=> b!399505 m!394271))

(declare-fun m!394273 () Bool)

(assert (=> b!399509 m!394273))

(declare-fun m!394275 () Bool)

(assert (=> bm!28011 m!394275))

(declare-fun m!394277 () Bool)

(assert (=> bm!28011 m!394277))

(declare-fun m!394279 () Bool)

(assert (=> b!399508 m!394279))

(declare-fun m!394281 () Bool)

(assert (=> b!399508 m!394281))

(declare-fun m!394283 () Bool)

(assert (=> b!399496 m!394283))

(declare-fun m!394285 () Bool)

(assert (=> b!399504 m!394285))

(declare-fun m!394287 () Bool)

(assert (=> b!399511 m!394287))

(assert (=> bm!28012 m!394275))

(declare-fun m!394289 () Bool)

(assert (=> bm!28012 m!394289))

(declare-fun m!394291 () Bool)

(assert (=> mapNonEmpty!16626 m!394291))

(declare-fun m!394293 () Bool)

(assert (=> start!38570 m!394293))

(declare-fun m!394295 () Bool)

(assert (=> start!38570 m!394295))

(check-sat (not start!38570) (not b!399505) b_and!16521 (not bm!28011) (not bm!28012) (not b!399507) (not b!399496) (not b!399499) (not b!399508) (not b!399511) (not b_next!9121) tp_is_empty!10003 (not b!399509) (not mapNonEmpty!16626) (not b!399501) (not b!399502))
(check-sat b_and!16521 (not b_next!9121))
