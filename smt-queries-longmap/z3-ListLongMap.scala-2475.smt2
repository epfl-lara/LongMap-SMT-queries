; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38670 () Bool)

(assert start!38670)

(declare-fun b_free!9207 () Bool)

(declare-fun b_next!9207 () Bool)

(assert (=> start!38670 (= b_free!9207 (not b_next!9207))))

(declare-fun tp!32745 () Bool)

(declare-fun b_and!16593 () Bool)

(assert (=> start!38670 (= tp!32745 b_and!16593)))

(declare-fun b!401737 () Bool)

(declare-fun e!242176 () Bool)

(declare-fun tp_is_empty!10089 () Bool)

(assert (=> b!401737 (= e!242176 tp_is_empty!10089)))

(declare-fun b!401738 () Bool)

(declare-fun res!231308 () Bool)

(declare-fun e!242175 () Bool)

(assert (=> b!401738 (=> (not res!231308) (not e!242175))))

(declare-datatypes ((array!24085 0))(
  ( (array!24086 (arr!11492 (Array (_ BitVec 32) (_ BitVec 64))) (size!11844 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24085)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401738 (= res!231308 (or (= (select (arr!11492 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11492 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401739 () Bool)

(declare-fun res!231298 () Bool)

(declare-fun e!242179 () Bool)

(assert (=> b!401739 (=> (not res!231298) (not e!242179))))

(declare-fun lt!187846 () array!24085)

(declare-datatypes ((List!6679 0))(
  ( (Nil!6676) (Cons!6675 (h!7531 (_ BitVec 64)) (t!11853 List!6679)) )
))
(declare-fun arrayNoDuplicates!0 (array!24085 (_ BitVec 32) List!6679) Bool)

(assert (=> b!401739 (= res!231298 (arrayNoDuplicates!0 lt!187846 #b00000000000000000000000000000000 Nil!6676))))

(declare-datatypes ((V!14557 0))(
  ( (V!14558 (val!5089 Int)) )
))
(declare-fun minValue!515 () V!14557)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6756 0))(
  ( (tuple2!6757 (_1!3389 (_ BitVec 64)) (_2!3389 V!14557)) )
))
(declare-datatypes ((List!6680 0))(
  ( (Nil!6677) (Cons!6676 (h!7532 tuple2!6756) (t!11854 List!6680)) )
))
(declare-datatypes ((ListLongMap!5669 0))(
  ( (ListLongMap!5670 (toList!2850 List!6680)) )
))
(declare-fun call!28286 () ListLongMap!5669)

(declare-fun c!54767 () Bool)

(declare-datatypes ((ValueCell!4701 0))(
  ( (ValueCellFull!4701 (v!7336 V!14557)) (EmptyCell!4701) )
))
(declare-datatypes ((array!24087 0))(
  ( (array!24088 (arr!11493 (Array (_ BitVec 32) ValueCell!4701)) (size!11845 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24087)

(declare-fun zeroValue!515 () V!14557)

(declare-fun bm!28282 () Bool)

(declare-fun v!412 () V!14557)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1062 (array!24085 array!24087 (_ BitVec 32) (_ BitVec 32) V!14557 V!14557 (_ BitVec 32) Int) ListLongMap!5669)

(assert (=> bm!28282 (= call!28286 (getCurrentListMapNoExtraKeys!1062 (ite c!54767 _keys!709 lt!187846) (ite c!54767 _values!549 (array!24088 (store (arr!11493 _values!549) i!563 (ValueCellFull!4701 v!412)) (size!11845 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401740 () Bool)

(declare-fun res!231301 () Bool)

(assert (=> b!401740 (=> (not res!231301) (not e!242175))))

(assert (=> b!401740 (= res!231301 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6676))))

(declare-fun b!401741 () Bool)

(declare-fun res!231307 () Bool)

(assert (=> b!401741 (=> (not res!231307) (not e!242179))))

(assert (=> b!401741 (= res!231307 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11844 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401742 () Bool)

(declare-fun res!231304 () Bool)

(assert (=> b!401742 (=> (not res!231304) (not e!242175))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401742 (= res!231304 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401743 () Bool)

(assert (=> b!401743 (= e!242175 e!242179)))

(declare-fun res!231309 () Bool)

(assert (=> b!401743 (=> (not res!231309) (not e!242179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24085 (_ BitVec 32)) Bool)

(assert (=> b!401743 (= res!231309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187846 mask!1025))))

(assert (=> b!401743 (= lt!187846 (array!24086 (store (arr!11492 _keys!709) i!563 k0!794) (size!11844 _keys!709)))))

(declare-fun b!401744 () Bool)

(declare-fun res!231302 () Bool)

(assert (=> b!401744 (=> (not res!231302) (not e!242175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401744 (= res!231302 (validKeyInArray!0 k0!794))))

(declare-fun b!401745 () Bool)

(declare-fun e!242180 () Bool)

(assert (=> b!401745 (= e!242180 tp_is_empty!10089)))

(declare-fun res!231299 () Bool)

(assert (=> start!38670 (=> (not res!231299) (not e!242175))))

(assert (=> start!38670 (= res!231299 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11844 _keys!709))))))

(assert (=> start!38670 e!242175))

(assert (=> start!38670 tp_is_empty!10089))

(assert (=> start!38670 tp!32745))

(assert (=> start!38670 true))

(declare-fun e!242177 () Bool)

(declare-fun array_inv!8414 (array!24087) Bool)

(assert (=> start!38670 (and (array_inv!8414 _values!549) e!242177)))

(declare-fun array_inv!8415 (array!24085) Bool)

(assert (=> start!38670 (array_inv!8415 _keys!709)))

(declare-fun b!401746 () Bool)

(declare-fun res!231305 () Bool)

(assert (=> b!401746 (=> (not res!231305) (not e!242175))))

(assert (=> b!401746 (= res!231305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401747 () Bool)

(declare-fun mapRes!16755 () Bool)

(assert (=> b!401747 (= e!242177 (and e!242176 mapRes!16755))))

(declare-fun condMapEmpty!16755 () Bool)

(declare-fun mapDefault!16755 () ValueCell!4701)

(assert (=> b!401747 (= condMapEmpty!16755 (= (arr!11493 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4701)) mapDefault!16755)))))

(declare-fun b!401748 () Bool)

(assert (=> b!401748 (= e!242179 (not true))))

(declare-fun e!242181 () Bool)

(assert (=> b!401748 e!242181))

(assert (=> b!401748 (= c!54767 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12168 0))(
  ( (Unit!12169) )
))
(declare-fun lt!187847 () Unit!12168)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!342 (array!24085 array!24087 (_ BitVec 32) (_ BitVec 32) V!14557 V!14557 (_ BitVec 32) (_ BitVec 64) V!14557 (_ BitVec 32) Int) Unit!12168)

(assert (=> b!401748 (= lt!187847 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16755 () Bool)

(assert (=> mapIsEmpty!16755 mapRes!16755))

(declare-fun b!401749 () Bool)

(declare-fun res!231303 () Bool)

(assert (=> b!401749 (=> (not res!231303) (not e!242175))))

(assert (=> b!401749 (= res!231303 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11844 _keys!709))))))

(declare-fun mapNonEmpty!16755 () Bool)

(declare-fun tp!32744 () Bool)

(assert (=> mapNonEmpty!16755 (= mapRes!16755 (and tp!32744 e!242180))))

(declare-fun mapKey!16755 () (_ BitVec 32))

(declare-fun mapRest!16755 () (Array (_ BitVec 32) ValueCell!4701))

(declare-fun mapValue!16755 () ValueCell!4701)

(assert (=> mapNonEmpty!16755 (= (arr!11493 _values!549) (store mapRest!16755 mapKey!16755 mapValue!16755))))

(declare-fun b!401750 () Bool)

(declare-fun call!28285 () ListLongMap!5669)

(assert (=> b!401750 (= e!242181 (= call!28286 call!28285))))

(declare-fun b!401751 () Bool)

(declare-fun res!231300 () Bool)

(assert (=> b!401751 (=> (not res!231300) (not e!242175))))

(assert (=> b!401751 (= res!231300 (and (= (size!11845 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11844 _keys!709) (size!11845 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28283 () Bool)

(assert (=> bm!28283 (= call!28285 (getCurrentListMapNoExtraKeys!1062 (ite c!54767 lt!187846 _keys!709) (ite c!54767 (array!24088 (store (arr!11493 _values!549) i!563 (ValueCellFull!4701 v!412)) (size!11845 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401752 () Bool)

(declare-fun +!1132 (ListLongMap!5669 tuple2!6756) ListLongMap!5669)

(assert (=> b!401752 (= e!242181 (= call!28285 (+!1132 call!28286 (tuple2!6757 k0!794 v!412))))))

(declare-fun b!401753 () Bool)

(declare-fun res!231306 () Bool)

(assert (=> b!401753 (=> (not res!231306) (not e!242175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401753 (= res!231306 (validMask!0 mask!1025))))

(assert (= (and start!38670 res!231299) b!401753))

(assert (= (and b!401753 res!231306) b!401751))

(assert (= (and b!401751 res!231300) b!401746))

(assert (= (and b!401746 res!231305) b!401740))

(assert (= (and b!401740 res!231301) b!401749))

(assert (= (and b!401749 res!231303) b!401744))

(assert (= (and b!401744 res!231302) b!401738))

(assert (= (and b!401738 res!231308) b!401742))

(assert (= (and b!401742 res!231304) b!401743))

(assert (= (and b!401743 res!231309) b!401739))

(assert (= (and b!401739 res!231298) b!401741))

(assert (= (and b!401741 res!231307) b!401748))

(assert (= (and b!401748 c!54767) b!401752))

(assert (= (and b!401748 (not c!54767)) b!401750))

(assert (= (or b!401752 b!401750) bm!28283))

(assert (= (or b!401752 b!401750) bm!28282))

(assert (= (and b!401747 condMapEmpty!16755) mapIsEmpty!16755))

(assert (= (and b!401747 (not condMapEmpty!16755)) mapNonEmpty!16755))

(get-info :version)

(assert (= (and mapNonEmpty!16755 ((_ is ValueCellFull!4701) mapValue!16755)) b!401745))

(assert (= (and b!401747 ((_ is ValueCellFull!4701) mapDefault!16755)) b!401737))

(assert (= start!38670 b!401747))

(declare-fun m!395495 () Bool)

(assert (=> b!401738 m!395495))

(declare-fun m!395497 () Bool)

(assert (=> b!401743 m!395497))

(declare-fun m!395499 () Bool)

(assert (=> b!401743 m!395499))

(declare-fun m!395501 () Bool)

(assert (=> b!401739 m!395501))

(declare-fun m!395503 () Bool)

(assert (=> b!401746 m!395503))

(declare-fun m!395505 () Bool)

(assert (=> b!401752 m!395505))

(declare-fun m!395507 () Bool)

(assert (=> b!401748 m!395507))

(declare-fun m!395509 () Bool)

(assert (=> bm!28283 m!395509))

(declare-fun m!395511 () Bool)

(assert (=> bm!28283 m!395511))

(declare-fun m!395513 () Bool)

(assert (=> b!401753 m!395513))

(declare-fun m!395515 () Bool)

(assert (=> b!401742 m!395515))

(declare-fun m!395517 () Bool)

(assert (=> b!401744 m!395517))

(assert (=> bm!28282 m!395509))

(declare-fun m!395519 () Bool)

(assert (=> bm!28282 m!395519))

(declare-fun m!395521 () Bool)

(assert (=> b!401740 m!395521))

(declare-fun m!395523 () Bool)

(assert (=> start!38670 m!395523))

(declare-fun m!395525 () Bool)

(assert (=> start!38670 m!395525))

(declare-fun m!395527 () Bool)

(assert (=> mapNonEmpty!16755 m!395527))

(check-sat (not bm!28282) (not b!401742) b_and!16593 (not b!401752) (not bm!28283) (not b!401740) (not b_next!9207) (not b!401743) (not b!401744) (not mapNonEmpty!16755) tp_is_empty!10089 (not b!401753) (not b!401748) (not b!401746) (not start!38670) (not b!401739))
(check-sat b_and!16593 (not b_next!9207))
