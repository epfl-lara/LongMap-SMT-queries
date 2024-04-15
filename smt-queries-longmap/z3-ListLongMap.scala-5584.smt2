; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73270 () Bool)

(assert start!73270)

(declare-fun b_free!14203 () Bool)

(declare-fun b_next!14203 () Bool)

(assert (=> start!73270 (= b_free!14203 (not b_next!14203))))

(declare-fun tp!50114 () Bool)

(declare-fun b_and!23533 () Bool)

(assert (=> start!73270 (= tp!50114 b_and!23533)))

(declare-fun b!854636 () Bool)

(declare-fun e!476519 () Bool)

(declare-fun tp_is_empty!16339 () Bool)

(assert (=> b!854636 (= e!476519 tp_is_empty!16339)))

(declare-fun b!854637 () Bool)

(declare-fun e!476518 () Bool)

(assert (=> b!854637 (= e!476518 tp_is_empty!16339)))

(declare-fun b!854638 () Bool)

(declare-fun res!580436 () Bool)

(declare-fun e!476520 () Bool)

(assert (=> b!854638 (=> (not res!580436) (not e!476520))))

(declare-datatypes ((array!48861 0))(
  ( (array!48862 (arr!23462 (Array (_ BitVec 32) (_ BitVec 64))) (size!23904 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48861)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48861 (_ BitVec 32)) Bool)

(assert (=> b!854638 (= res!580436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854639 () Bool)

(declare-fun res!580443 () Bool)

(assert (=> b!854639 (=> (not res!580443) (not e!476520))))

(declare-datatypes ((List!16645 0))(
  ( (Nil!16642) (Cons!16641 (h!17772 (_ BitVec 64)) (t!23277 List!16645)) )
))
(declare-fun arrayNoDuplicates!0 (array!48861 (_ BitVec 32) List!16645) Bool)

(assert (=> b!854639 (= res!580443 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16642))))

(declare-fun b!854640 () Bool)

(declare-fun res!580438 () Bool)

(assert (=> b!854640 (=> (not res!580438) (not e!476520))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854640 (= res!580438 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!26108 () Bool)

(declare-fun mapRes!26108 () Bool)

(assert (=> mapIsEmpty!26108 mapRes!26108))

(declare-fun b!854641 () Bool)

(declare-fun res!580439 () Bool)

(assert (=> b!854641 (=> (not res!580439) (not e!476520))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854641 (= res!580439 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23904 _keys!868))))))

(declare-fun b!854642 () Bool)

(assert (=> b!854642 (= e!476520 false)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26833 0))(
  ( (V!26834 (val!8217 Int)) )
))
(declare-datatypes ((ValueCell!7730 0))(
  ( (ValueCellFull!7730 (v!10636 V!26833)) (EmptyCell!7730) )
))
(declare-datatypes ((array!48863 0))(
  ( (array!48864 (arr!23463 (Array (_ BitVec 32) ValueCell!7730)) (size!23905 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48863)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26833)

(declare-fun zeroValue!654 () V!26833)

(declare-datatypes ((tuple2!10834 0))(
  ( (tuple2!10835 (_1!5428 (_ BitVec 64)) (_2!5428 V!26833)) )
))
(declare-datatypes ((List!16646 0))(
  ( (Nil!16643) (Cons!16642 (h!17773 tuple2!10834) (t!23278 List!16646)) )
))
(declare-datatypes ((ListLongMap!9593 0))(
  ( (ListLongMap!9594 (toList!4812 List!16646)) )
))
(declare-fun lt!385360 () ListLongMap!9593)

(declare-fun v!557 () V!26833)

(declare-fun getCurrentListMapNoExtraKeys!2819 (array!48861 array!48863 (_ BitVec 32) (_ BitVec 32) V!26833 V!26833 (_ BitVec 32) Int) ListLongMap!9593)

(assert (=> b!854642 (= lt!385360 (getCurrentListMapNoExtraKeys!2819 _keys!868 (array!48864 (store (arr!23463 _values!688) i!612 (ValueCellFull!7730 v!557)) (size!23905 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385361 () ListLongMap!9593)

(assert (=> b!854642 (= lt!385361 (getCurrentListMapNoExtraKeys!2819 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!580437 () Bool)

(assert (=> start!73270 (=> (not res!580437) (not e!476520))))

(assert (=> start!73270 (= res!580437 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23904 _keys!868))))))

(assert (=> start!73270 e!476520))

(assert (=> start!73270 tp_is_empty!16339))

(assert (=> start!73270 true))

(assert (=> start!73270 tp!50114))

(declare-fun array_inv!18668 (array!48861) Bool)

(assert (=> start!73270 (array_inv!18668 _keys!868)))

(declare-fun e!476516 () Bool)

(declare-fun array_inv!18669 (array!48863) Bool)

(assert (=> start!73270 (and (array_inv!18669 _values!688) e!476516)))

(declare-fun b!854643 () Bool)

(declare-fun res!580442 () Bool)

(assert (=> b!854643 (=> (not res!580442) (not e!476520))))

(assert (=> b!854643 (= res!580442 (and (= (select (arr!23462 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854644 () Bool)

(declare-fun res!580441 () Bool)

(assert (=> b!854644 (=> (not res!580441) (not e!476520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854644 (= res!580441 (validMask!0 mask!1196))))

(declare-fun b!854645 () Bool)

(assert (=> b!854645 (= e!476516 (and e!476518 mapRes!26108))))

(declare-fun condMapEmpty!26108 () Bool)

(declare-fun mapDefault!26108 () ValueCell!7730)

(assert (=> b!854645 (= condMapEmpty!26108 (= (arr!23463 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7730)) mapDefault!26108)))))

(declare-fun mapNonEmpty!26108 () Bool)

(declare-fun tp!50113 () Bool)

(assert (=> mapNonEmpty!26108 (= mapRes!26108 (and tp!50113 e!476519))))

(declare-fun mapRest!26108 () (Array (_ BitVec 32) ValueCell!7730))

(declare-fun mapValue!26108 () ValueCell!7730)

(declare-fun mapKey!26108 () (_ BitVec 32))

(assert (=> mapNonEmpty!26108 (= (arr!23463 _values!688) (store mapRest!26108 mapKey!26108 mapValue!26108))))

(declare-fun b!854646 () Bool)

(declare-fun res!580440 () Bool)

(assert (=> b!854646 (=> (not res!580440) (not e!476520))))

(assert (=> b!854646 (= res!580440 (and (= (size!23905 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23904 _keys!868) (size!23905 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73270 res!580437) b!854644))

(assert (= (and b!854644 res!580441) b!854646))

(assert (= (and b!854646 res!580440) b!854638))

(assert (= (and b!854638 res!580436) b!854639))

(assert (= (and b!854639 res!580443) b!854641))

(assert (= (and b!854641 res!580439) b!854640))

(assert (= (and b!854640 res!580438) b!854643))

(assert (= (and b!854643 res!580442) b!854642))

(assert (= (and b!854645 condMapEmpty!26108) mapIsEmpty!26108))

(assert (= (and b!854645 (not condMapEmpty!26108)) mapNonEmpty!26108))

(get-info :version)

(assert (= (and mapNonEmpty!26108 ((_ is ValueCellFull!7730) mapValue!26108)) b!854636))

(assert (= (and b!854645 ((_ is ValueCellFull!7730) mapDefault!26108)) b!854637))

(assert (= start!73270 b!854645))

(declare-fun m!795507 () Bool)

(assert (=> b!854638 m!795507))

(declare-fun m!795509 () Bool)

(assert (=> start!73270 m!795509))

(declare-fun m!795511 () Bool)

(assert (=> start!73270 m!795511))

(declare-fun m!795513 () Bool)

(assert (=> b!854639 m!795513))

(declare-fun m!795515 () Bool)

(assert (=> b!854642 m!795515))

(declare-fun m!795517 () Bool)

(assert (=> b!854642 m!795517))

(declare-fun m!795519 () Bool)

(assert (=> b!854642 m!795519))

(declare-fun m!795521 () Bool)

(assert (=> mapNonEmpty!26108 m!795521))

(declare-fun m!795523 () Bool)

(assert (=> b!854640 m!795523))

(declare-fun m!795525 () Bool)

(assert (=> b!854643 m!795525))

(declare-fun m!795527 () Bool)

(assert (=> b!854644 m!795527))

(check-sat (not b!854639) (not mapNonEmpty!26108) tp_is_empty!16339 (not b!854642) (not b!854644) (not start!73270) (not b_next!14203) b_and!23533 (not b!854640) (not b!854638))
(check-sat b_and!23533 (not b_next!14203))
