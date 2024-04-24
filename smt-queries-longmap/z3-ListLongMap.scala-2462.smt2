; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38576 () Bool)

(assert start!38576)

(declare-fun b_free!9127 () Bool)

(declare-fun b_next!9127 () Bool)

(assert (=> start!38576 (= b_free!9127 (not b_next!9127))))

(declare-fun tp!32505 () Bool)

(declare-fun b_and!16527 () Bool)

(assert (=> start!38576 (= tp!32505 b_and!16527)))

(declare-fun b!399648 () Bool)

(declare-fun res!229857 () Bool)

(declare-fun e!241303 () Bool)

(assert (=> b!399648 (=> (not res!229857) (not e!241303))))

(declare-datatypes ((array!23908 0))(
  ( (array!23909 (arr!11403 (Array (_ BitVec 32) (_ BitVec 64))) (size!11755 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23908)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399648 (= res!229857 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399649 () Bool)

(declare-fun res!229858 () Bool)

(assert (=> b!399649 (=> (not res!229858) (not e!241303))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399649 (= res!229858 (validMask!0 mask!1025))))

(declare-fun b!399650 () Bool)

(declare-fun e!241309 () Bool)

(declare-fun tp_is_empty!10009 () Bool)

(assert (=> b!399650 (= e!241309 tp_is_empty!10009)))

(declare-fun b!399651 () Bool)

(declare-fun res!229865 () Bool)

(assert (=> b!399651 (=> (not res!229865) (not e!241303))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14451 0))(
  ( (V!14452 (val!5049 Int)) )
))
(declare-datatypes ((ValueCell!4661 0))(
  ( (ValueCellFull!4661 (v!7297 V!14451)) (EmptyCell!4661) )
))
(declare-datatypes ((array!23910 0))(
  ( (array!23911 (arr!11404 (Array (_ BitVec 32) ValueCell!4661)) (size!11756 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23910)

(assert (=> b!399651 (= res!229865 (and (= (size!11756 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11755 _keys!709) (size!11756 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399652 () Bool)

(declare-fun res!229862 () Bool)

(declare-fun e!241305 () Bool)

(assert (=> b!399652 (=> (not res!229862) (not e!241305))))

(declare-fun lt!187625 () array!23908)

(declare-datatypes ((List!6472 0))(
  ( (Nil!6469) (Cons!6468 (h!7324 (_ BitVec 64)) (t!11638 List!6472)) )
))
(declare-fun arrayNoDuplicates!0 (array!23908 (_ BitVec 32) List!6472) Bool)

(assert (=> b!399652 (= res!229862 (arrayNoDuplicates!0 lt!187625 #b00000000000000000000000000000000 Nil!6469))))

(declare-fun b!399653 () Bool)

(declare-fun res!229856 () Bool)

(assert (=> b!399653 (=> (not res!229856) (not e!241303))))

(assert (=> b!399653 (= res!229856 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6469))))

(declare-fun b!399654 () Bool)

(declare-fun res!229855 () Bool)

(assert (=> b!399654 (=> (not res!229855) (not e!241303))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399654 (= res!229855 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11755 _keys!709))))))

(declare-fun mapIsEmpty!16635 () Bool)

(declare-fun mapRes!16635 () Bool)

(assert (=> mapIsEmpty!16635 mapRes!16635))

(declare-fun b!399655 () Bool)

(declare-fun res!229859 () Bool)

(assert (=> b!399655 (=> (not res!229859) (not e!241303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23908 (_ BitVec 32)) Bool)

(assert (=> b!399655 (= res!229859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399656 () Bool)

(declare-fun res!229861 () Bool)

(assert (=> b!399656 (=> (not res!229861) (not e!241303))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399656 (= res!229861 (validKeyInArray!0 k0!794))))

(declare-fun minValue!515 () V!14451)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14451)

(declare-datatypes ((tuple2!6552 0))(
  ( (tuple2!6553 (_1!3287 (_ BitVec 64)) (_2!3287 V!14451)) )
))
(declare-datatypes ((List!6473 0))(
  ( (Nil!6470) (Cons!6469 (h!7325 tuple2!6552) (t!11639 List!6473)) )
))
(declare-datatypes ((ListLongMap!5467 0))(
  ( (ListLongMap!5468 (toList!2749 List!6473)) )
))
(declare-fun call!28032 () ListLongMap!5467)

(declare-fun bm!28029 () Bool)

(declare-fun v!412 () V!14451)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54624 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1007 (array!23908 array!23910 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) Int) ListLongMap!5467)

(assert (=> bm!28029 (= call!28032 (getCurrentListMapNoExtraKeys!1007 (ite c!54624 _keys!709 lt!187625) (ite c!54624 _values!549 (array!23911 (store (arr!11404 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11756 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399657 () Bool)

(declare-fun res!229860 () Bool)

(assert (=> b!399657 (=> (not res!229860) (not e!241303))))

(assert (=> b!399657 (= res!229860 (or (= (select (arr!11403 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11403 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399658 () Bool)

(declare-fun e!241306 () Bool)

(assert (=> b!399658 (= e!241306 tp_is_empty!10009)))

(declare-fun mapNonEmpty!16635 () Bool)

(declare-fun tp!32504 () Bool)

(assert (=> mapNonEmpty!16635 (= mapRes!16635 (and tp!32504 e!241309))))

(declare-fun mapRest!16635 () (Array (_ BitVec 32) ValueCell!4661))

(declare-fun mapValue!16635 () ValueCell!4661)

(declare-fun mapKey!16635 () (_ BitVec 32))

(assert (=> mapNonEmpty!16635 (= (arr!11404 _values!549) (store mapRest!16635 mapKey!16635 mapValue!16635))))

(declare-fun e!241308 () Bool)

(declare-fun call!28033 () ListLongMap!5467)

(declare-fun b!399659 () Bool)

(declare-fun +!1097 (ListLongMap!5467 tuple2!6552) ListLongMap!5467)

(assert (=> b!399659 (= e!241308 (= call!28033 (+!1097 call!28032 (tuple2!6553 k0!794 v!412))))))

(declare-fun res!229863 () Bool)

(assert (=> start!38576 (=> (not res!229863) (not e!241303))))

(assert (=> start!38576 (= res!229863 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11755 _keys!709))))))

(assert (=> start!38576 e!241303))

(assert (=> start!38576 tp_is_empty!10009))

(assert (=> start!38576 tp!32505))

(assert (=> start!38576 true))

(declare-fun e!241304 () Bool)

(declare-fun array_inv!8424 (array!23910) Bool)

(assert (=> start!38576 (and (array_inv!8424 _values!549) e!241304)))

(declare-fun array_inv!8425 (array!23908) Bool)

(assert (=> start!38576 (array_inv!8425 _keys!709)))

(declare-fun b!399660 () Bool)

(assert (=> b!399660 (= e!241303 e!241305)))

(declare-fun res!229866 () Bool)

(assert (=> b!399660 (=> (not res!229866) (not e!241305))))

(assert (=> b!399660 (= res!229866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187625 mask!1025))))

(assert (=> b!399660 (= lt!187625 (array!23909 (store (arr!11403 _keys!709) i!563 k0!794) (size!11755 _keys!709)))))

(declare-fun b!399661 () Bool)

(assert (=> b!399661 (= e!241308 (= call!28032 call!28033))))

(declare-fun b!399662 () Bool)

(declare-fun res!229864 () Bool)

(assert (=> b!399662 (=> (not res!229864) (not e!241305))))

(assert (=> b!399662 (= res!229864 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11755 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399663 () Bool)

(assert (=> b!399663 (= e!241304 (and e!241306 mapRes!16635))))

(declare-fun condMapEmpty!16635 () Bool)

(declare-fun mapDefault!16635 () ValueCell!4661)

(assert (=> b!399663 (= condMapEmpty!16635 (= (arr!11404 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4661)) mapDefault!16635)))))

(declare-fun bm!28030 () Bool)

(assert (=> bm!28030 (= call!28033 (getCurrentListMapNoExtraKeys!1007 (ite c!54624 lt!187625 _keys!709) (ite c!54624 (array!23911 (store (arr!11404 _values!549) i!563 (ValueCellFull!4661 v!412)) (size!11756 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399664 () Bool)

(assert (=> b!399664 (= e!241305 (not true))))

(assert (=> b!399664 e!241308))

(assert (=> b!399664 (= c!54624 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12083 0))(
  ( (Unit!12084) )
))
(declare-fun lt!187626 () Unit!12083)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!309 (array!23908 array!23910 (_ BitVec 32) (_ BitVec 32) V!14451 V!14451 (_ BitVec 32) (_ BitVec 64) V!14451 (_ BitVec 32) Int) Unit!12083)

(assert (=> b!399664 (= lt!187626 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!309 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38576 res!229863) b!399649))

(assert (= (and b!399649 res!229858) b!399651))

(assert (= (and b!399651 res!229865) b!399655))

(assert (= (and b!399655 res!229859) b!399653))

(assert (= (and b!399653 res!229856) b!399654))

(assert (= (and b!399654 res!229855) b!399656))

(assert (= (and b!399656 res!229861) b!399657))

(assert (= (and b!399657 res!229860) b!399648))

(assert (= (and b!399648 res!229857) b!399660))

(assert (= (and b!399660 res!229866) b!399652))

(assert (= (and b!399652 res!229862) b!399662))

(assert (= (and b!399662 res!229864) b!399664))

(assert (= (and b!399664 c!54624) b!399659))

(assert (= (and b!399664 (not c!54624)) b!399661))

(assert (= (or b!399659 b!399661) bm!28030))

(assert (= (or b!399659 b!399661) bm!28029))

(assert (= (and b!399663 condMapEmpty!16635) mapIsEmpty!16635))

(assert (= (and b!399663 (not condMapEmpty!16635)) mapNonEmpty!16635))

(get-info :version)

(assert (= (and mapNonEmpty!16635 ((_ is ValueCellFull!4661) mapValue!16635)) b!399650))

(assert (= (and b!399663 ((_ is ValueCellFull!4661) mapDefault!16635)) b!399658))

(assert (= start!38576 b!399663))

(declare-fun m!394365 () Bool)

(assert (=> b!399653 m!394365))

(declare-fun m!394367 () Bool)

(assert (=> b!399656 m!394367))

(declare-fun m!394369 () Bool)

(assert (=> start!38576 m!394369))

(declare-fun m!394371 () Bool)

(assert (=> start!38576 m!394371))

(declare-fun m!394373 () Bool)

(assert (=> b!399660 m!394373))

(declare-fun m!394375 () Bool)

(assert (=> b!399660 m!394375))

(declare-fun m!394377 () Bool)

(assert (=> b!399664 m!394377))

(declare-fun m!394379 () Bool)

(assert (=> b!399648 m!394379))

(declare-fun m!394381 () Bool)

(assert (=> b!399659 m!394381))

(declare-fun m!394383 () Bool)

(assert (=> b!399655 m!394383))

(declare-fun m!394385 () Bool)

(assert (=> b!399649 m!394385))

(declare-fun m!394387 () Bool)

(assert (=> bm!28029 m!394387))

(declare-fun m!394389 () Bool)

(assert (=> bm!28029 m!394389))

(assert (=> bm!28030 m!394387))

(declare-fun m!394391 () Bool)

(assert (=> bm!28030 m!394391))

(declare-fun m!394393 () Bool)

(assert (=> b!399652 m!394393))

(declare-fun m!394395 () Bool)

(assert (=> mapNonEmpty!16635 m!394395))

(declare-fun m!394397 () Bool)

(assert (=> b!399657 m!394397))

(check-sat (not b!399648) tp_is_empty!10009 (not b!399649) (not b_next!9127) (not b!399655) (not bm!28030) (not mapNonEmpty!16635) (not b!399653) (not start!38576) (not b!399660) (not b!399656) (not b!399652) (not b!399664) (not b!399659) (not bm!28029) b_and!16527)
(check-sat b_and!16527 (not b_next!9127))
